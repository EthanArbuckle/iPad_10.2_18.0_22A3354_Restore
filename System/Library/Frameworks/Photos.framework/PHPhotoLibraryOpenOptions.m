@implementation PHPhotoLibraryOpenOptions

- (id)debugDescription
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  if (-[PHPhotoLibraryOpenOptions internalUpgradeOptions](self, "internalUpgradeOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("upgradeOpts[%d] "), -[PHPhotoLibraryOpenOptions internalUpgradeOptions](self, "internalUpgradeOptions"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E35DFFF8;
  }
  if (-[PHPhotoLibraryOpenOptions internalCreateOptions](self, "internalCreateOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("createOpts[%d] "), -[PHPhotoLibraryOpenOptions internalCreateOptions](self, "internalCreateOptions"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E35DFFF8;
  }
  v10.receiver = self;
  v10.super_class = (Class)PHPhotoLibraryOpenOptions;
  -[PHPhotoLibraryOpenOptions description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHPhotoLibraryOpenOptions allowsUpgrade](self, "allowsUpgrade");
  v7 = CFSTR("N");
  if (v6)
    v7 = CFSTR("Y");
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(": upgrade:[%@] %@%@"), v7, v4, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)allowsUpgrade
{
  return self->_allowsUpgrade;
}

- (void)setAllowsUpgrade:(BOOL)a3
{
  self->_allowsUpgrade = a3;
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLibraryURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unint64_t)internalUpgradeOptions
{
  return self->_internalUpgradeOptions;
}

- (void)setInternalUpgradeOptions:(unint64_t)a3
{
  self->_internalUpgradeOptions = a3;
}

- (unint64_t)internalCreateOptions
{
  return self->_internalCreateOptions;
}

- (void)setInternalCreateOptions:(unint64_t)a3
{
  self->_internalCreateOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

@end
