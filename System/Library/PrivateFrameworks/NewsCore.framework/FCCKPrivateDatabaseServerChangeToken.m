@implementation FCCKPrivateDatabaseServerChangeToken

- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestinationKey:(id)a3
{
  id v4;
  FCCKPrivateDatabaseServerChangeToken *v5;
  uint64_t v6;
  NSDictionary *changeTokensByDestinationKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCKPrivateDatabaseServerChangeToken;
  v5 = -[FCCKPrivateDatabaseServerChangeToken init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    changeTokensByDestinationKey = v5->_changeTokensByDestinationKey;
    v5->_changeTokensByDestinationKey = (NSDictionary *)v6;

  }
  return v5;
}

- (FCCKPrivateDatabaseServerChangeToken)initWithChangeTokensByDestination:(id)a3
{
  FCCKPrivateDatabaseServerChangeToken *v4;
  void *v5;
  FCCKPrivateDatabaseServerChangeToken *v6;
  _QWORD v8[4];
  FCCKPrivateDatabaseServerChangeToken *v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__FCCKPrivateDatabaseServerChangeToken_initWithChangeTokensByDestination___block_invoke;
  v8[3] = &unk_1E4644958;
  v4 = self;
  v9 = v4;
  objc_msgSend(a3, "fc_dictionaryByTransformingKeysWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCCKPrivateDatabaseServerChangeToken initWithChangeTokensByDestinationKey:](v4, "initWithChangeTokensByDestinationKey:", v5);

  return v6;
}

uint64_t __74__FCCKPrivateDatabaseServerChangeToken_initWithChangeTokensByDestination___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  v3 = (void *)objc_opt_class();
  v4 = objc_msgSend(v2, "integerValue");

  return objc_msgSend(v3, "_keyForDestination:", v4);
}

- (FCCKPrivateDatabaseServerChangeToken)init
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
    v5 = 136315906;
    v6 = "-[FCCKPrivateDatabaseServerChangeToken init]";
    v7 = 2080;
    v8 = "FCCKPrivateDatabaseServerChangeToken.m";
    v9 = 1024;
    v10 = 43;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0DE7910];
  -[FCCKPrivateDatabaseServerChangeToken changeTokensByDestinationKey](self, "changeTokensByDestinationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeTokensByDestinationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9);

  return (char)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[FCCKPrivateDatabaseServerChangeToken changeTokensByDestinationKey](self, "changeTokensByDestinationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithChangeTokensByDestinationKey:", v5);

  return v6;
}

- (FCCKPrivateDatabaseServerChangeToken)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCCKPrivateDatabaseServerChangeToken *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("changeTokensByDestinationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FCCKPrivateDatabaseServerChangeToken initWithChangeTokensByDestinationKey:](self, "initWithChangeTokensByDestinationKey:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCCKPrivateDatabaseServerChangeToken changeTokensByDestinationKey](self, "changeTokensByDestinationKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("changeTokensByDestinationKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenByAddingCKToken:(id)a3 forDestination:(int64_t)a4 toToken:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_keyForDestination:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v7, "changeTokensByDestinationKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fc_dictionaryByAddingEntriesFromDictionary:toDictionary:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChangeTokensByDestinationKey:", v13);
  return v14;
}

- (id)changeTokenForDestination:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[FCCKPrivateDatabaseServerChangeToken changeTokensByDestinationKey](self, "changeTokensByDestinationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_keyForDestination:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_keyForDestination:(int64_t)a3
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) < 2)
    return CFSTR("Database");
  if (a3)
  {
    if (a3 == 3)
      return CFSTR("SecureDatabase");
    else
      return &stru_1E464BC40;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
      v5 = 136315906;
      v6 = "+[FCCKPrivateDatabaseServerChangeToken _keyForDestination:]";
      v7 = 2080;
      v8 = "FCCKPrivateDatabaseServerChangeToken.m";
      v9 = 1024;
      v10 = 123;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

    }
    return &stru_1E464BC40;
  }
}

- (NSDictionary)changeTokensByDestinationKey
{
  return self->_changeTokensByDestinationKey;
}

- (void)setChangeTokensByDestinationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeTokensByDestinationKey, 0);
}

@end
