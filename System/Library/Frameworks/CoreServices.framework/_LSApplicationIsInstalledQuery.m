@implementation _LSApplicationIsInstalledQuery

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (id)queryWithBundleIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[2];
    v5[2] = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  _LSDServiceDomain *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _LSDServiceDomain *v15;
  uint64_t v16;
  id v17;
  _LSQueryResultWithPropertyList *v18;
  void *v19;
  _LSQueryResultWithPropertyList *v20;
  id v21;
  id v22;
  uint64_t v23;
  int v24;
  void **v25;
  id v26;
  char v27;
  id v28;
  _OWORD v29[2];
  _OWORD v30[2];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSApplicationIsInstalledQuery _enumerateWithXPCConnection:block:]", 60, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);

    goto LABEL_17;
  }
  v28 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v9, 0);

  if (v10)
  {
    v24 = 0;
    v23 = 0;
    -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v30, 0, sizeof(v30));
    if (_LSBundleFindWithInfo(v10, 0, v11, 0, v30, 2, 0, &v24, &v23))
    {
      -[_LSApplicationIsInstalledQuery bundleIdentifier](self, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v29, 0, sizeof(v29));
      v13 = _LSBundleFindWithInfo(v10, 0, v12, 0, v29, 2, 1024, &v24, &v23) == 0;

      if (!v13)
        goto LABEL_13;
    }
    else
    {

    }
    v18 = [_LSQueryResultWithPropertyList alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_LSQueryResultWithPropertyList initWithPropertyList:](v18, "initWithPropertyList:", v19);

    ((void (**)(id, _LSQueryResultWithPropertyList *, void *))v7)[2](v7, v20, 0);
  }
  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v15, 0);

    if (v16)
      v17 = 0;
    else
      v17 = v28;
    v7[2](v7, 0, v17);

  }
LABEL_13:
  if (v25 && v27)
    _LSContextDestroy(v25);
  v21 = v26;
  v25 = 0;
  v26 = 0;

  v27 = 0;
  v22 = v28;
  v28 = 0;

LABEL_17:
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSApplicationIsInstalledQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));

}

- (_LSApplicationIsInstalledQuery)initWithCoder:(id)a3
{
  id v4;
  _LSApplicationIsInstalledQuery *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationIsInstalledQuery;
  v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

@end
