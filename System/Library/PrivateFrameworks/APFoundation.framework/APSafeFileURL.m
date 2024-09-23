@implementation APSafeFileURL

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeDescription, 0);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  NSString *safeDescription;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  safeDescription = self->_safeDescription;
  if (safeDescription)
  {
    v6 = safeDescription;
  }
  else
  {
    objc_msgSend_lastPathComponent(self, a2, v2, v3);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v7, v8, v9))
  {
    objc_msgSend_path(self, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  return v10;
}

- (id)URLByAppendingPathComponent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  APSafeFileURL *v12;
  const char *v13;
  uint64_t v14;
  void *inited;
  const char *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend_path(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [APSafeFileURL alloc];
  inited = (void *)objc_msgSend_initFileURLWithPath_(v12, v13, (uint64_t)v11, v14);
  v18 = inited;
  if (inited)
    objc_msgSend_setSafeDescription_(inited, v16, (uint64_t)v4, v17);

  return v18;
}

- (void)setSafeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)initFileURLWithPath:(id)a3 relativeToURL:(id)a4
{
  id v7;
  APSafeFileURL *v8;
  APSafeFileURL *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSafeFileURL;
  v8 = -[APSafeFileURL initWithString:relativeToURL:](&v11, sel_initWithString_relativeToURL_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_safeDescription, a3);

  return v9;
}

- (APSafeFileURL)initWithString:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APSafeFileURL;
  return -[APSafeFileURL initWithString:](&v4, sel_initWithString_, a3);
}

- (NSString)safeDescription
{
  return self->_safeDescription;
}

@end
