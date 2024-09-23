@implementation _LSApplicationProxyForIdentifierQuery

+ (id)queryWithIdentifier:(id)a3
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

+ (NSSet)alwaysAllowedBundleIdentifiers
{
  if (+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once != -1)
    dispatch_once(&+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::once, &__block_literal_global_16);
  return (NSSet *)(id)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  _LSDServiceDomain *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _LSDServiceDomain *v15;
  uint64_t v16;
  id v17;
  id v18;
  void **v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v22 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v9, 0);

    if (v10)
    {
      -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      +[LSApplicationProxy applicationProxyForIdentifier:withContext:](LSApplicationProxy, "applicationProxyForIdentifier:withContext:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v12, 0);

    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v15, 0);

      if (v16)
        v11 = 0;
      else
        v11 = v22;
      ((void (**)(id, void *, id))v7)[2](v7, 0, v11);
    }

    if (v19 && v21)
      _LSContextDestroy(v19);
    v17 = v20;
    v19 = 0;
    v20 = 0;

    v21 = 0;
    v18 = v22;
    v22 = 0;

  }
  else
  {
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSApplicationProxyForIdentifierQuery _enumerateWithXPCConnection:block:]", 582, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v14);

  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "alwaysAllowedBundleIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  if (-[_LSQuery isEqual:](&v12, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  v5 = -[_LSQuery hash](&v7, sel_hash) ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  -[_LSQuery encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[_LSApplicationProxyForIdentifierQuery identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (_LSApplicationProxyForIdentifierQuery)initWithCoder:(id)a3
{
  id v4;
  _LSApplicationProxyForIdentifierQuery *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationProxyForIdentifierQuery;
  v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
