@implementation MDLPathAssetResolver

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(NSString *)path
{
  const char *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  v7 = path;
  if (objc_msgSend_hasSuffix_(v7, v4, (uint64_t)CFSTR("/")))
  {
    v5 = v7;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], (const char *)v7, (uint64_t)CFSTR("%@/"), v7);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = self->_path;
  self->_path = v5;

}

- (MDLPathAssetResolver)initWithPath:(NSString *)path
{
  NSString *v5;
  MDLPathAssetResolver *v6;
  MDLPathAssetResolver *v7;
  MDLPathAssetResolver *v8;
  objc_super v10;

  v5 = path;
  v10.receiver = self;
  v10.super_class = (Class)MDLPathAssetResolver;
  v6 = -[MDLPathAssetResolver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, path);
    v8 = v7;
  }

  return v7;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (v5 && self->_path)
  {
    objc_msgSend_resolveAssetNamed_(self, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;

  v4 = a3;
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v5, (uint64_t)self->_path, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v6, v7, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
