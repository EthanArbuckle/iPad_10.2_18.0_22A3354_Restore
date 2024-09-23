@implementation INSecurityScopedURL

- (INSecurityScopedURL)initWithURL:(id)a3
{
  id v5;
  INSecurityScopedURL *v6;
  INSecurityScopedURL *v7;
  INSecurityScopedURL *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INSecurityScopedURL;
  v6 = -[INSecurityScopedURL init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = v7;
  }

  return v7;
}

- (BOOL)startAccessingSecurityScopedResource
{
  os_unfair_lock_s *p_lock;
  int64_t accessCount;
  void *v5;
  int v6;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accessCount = self->_accessCount;
  if (!accessCount)
  {
    -[INSecurityScopedURL url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "startAccessingSecurityScopedResource");

    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
    accessCount = self->_accessCount;
  }
  self->_accessCount = accessCount + 1;
  v7 = 1;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)stopAccessingSecurityScopedResource
{
  os_unfair_lock_s *p_lock;
  int64_t v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_accessCount - 1;
  self->_accessCount = v4;
  if (!v4)
  {
    -[INSecurityScopedURL url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");

  }
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
