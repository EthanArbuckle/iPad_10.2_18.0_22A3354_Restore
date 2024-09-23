@implementation LSBundleRegistrationStatePrecondition

- (id)initForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5
{
  id v8;
  id v9;
  id v10;
  LSBundleRegistrationStatePrecondition *v11;
  uint64_t v12;
  NSString *bundleID;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LSBundleRegistrationStatePrecondition;
  v11 = -[LSBundleRegistrationStatePrecondition init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_placeholderInstalled, a4);
    objc_storeStrong((id *)&v11->_fullAppInstalled, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeholderInstalled, CFSTR("placeholderInstalled"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fullAppInstalled, CFSTR("fullAppInstalled"));

}

- (LSBundleRegistrationStatePrecondition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LSBundleRegistrationStatePrecondition *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderInstalled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullAppInstalled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LSBundleRegistrationStatePrecondition initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:](self, "initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:", v5, v6, v7);

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<LSBundleRegistrationStatePrecondition: %@ placeholder: %@ fullApp: %@>"), self->_bundleID, self->_placeholderInstalled, self->_fullAppInstalled);
}

- (BOOL)isMet
{
  _LSDServiceDomain *v3;
  uint64_t v4;
  NSString *bundleID;
  int v6;
  NSString *v7;
  int v8;
  NSNumber *placeholderInstalled;
  NSNumber *fullAppInstalled;
  unsigned int v11;
  NSObject *v12;
  id v13;
  id v14;
  _LSDServiceDomain *v16;
  uint64_t v17;
  id v18;
  void **CurrentContext;
  id v20;
  char v21;
  id v22;
  uint8_t buf[4];
  id v24;
  _OWORD v25[2];
  _OWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  v20 = 0;
  v21 = 0;
  v22 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v3 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v4 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v3, 0);

  if (!v4)
  {
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v16, 0);

      if (v17)
        v18 = 0;
      else
        v18 = v22;
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_error_impl(&dword_182882000, v12, OS_LOG_TYPE_ERROR, "Cannot reach database! %@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  bundleID = self->_bundleID;
  memset(v26, 0, sizeof(v26));
  v6 = _LSBundleFindWithInfo(v4, 0, bundleID, 0, v26, 2, 1024, 0, 0);
  v7 = self->_bundleID;
  memset(v25, 0, sizeof(v25));
  v8 = _LSBundleFindWithInfo(v4, 0, v7, 0, v25, 2, 0, 0, 0);
  placeholderInstalled = self->_placeholderInstalled;
  if (placeholderInstalled && (v6 != 0) == -[NSNumber BOOLValue](placeholderInstalled, "BOOLValue"))
  {
LABEL_8:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }
  fullAppInstalled = self->_fullAppInstalled;
  if (fullAppInstalled)
    v11 = (v8 != 0) ^ -[NSNumber BOOLValue](fullAppInstalled, "BOOLValue");
  else
    LOBYTE(v11) = 1;
LABEL_10:
  if (CurrentContext && v21)
    _LSContextDestroy(CurrentContext);
  v13 = v20;
  CurrentContext = 0;
  v20 = 0;

  v21 = 0;
  v14 = v22;
  v22 = 0;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullAppInstalled, 0);
  objc_storeStrong((id *)&self->_placeholderInstalled, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
