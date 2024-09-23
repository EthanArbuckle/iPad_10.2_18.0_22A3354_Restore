@implementation FCPuzzleRank

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (FCPuzzleRank)initWithDictionary:(id)a3 index:(int64_t)a4
{
  id v6;
  FCPuzzleRank *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  BOOL v12;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCPuzzleRank;
  v7 = -[FCPuzzleRank init](&v16, sel_init);
  if (v7)
  {
    FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("name"), &stru_1E464BC40);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationStringValue(v6, (uint64_t)CFSTR("identifier"), &stru_1E464BC40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("defaultRank"), 0);
    v11 = FCAppConfigurationBoolValue(v6, (uint64_t)CFSTR("isProdigyLevel"), 0);
    if (v8)
    {
      if (v9)
      {
        v12 = v11;
        objc_storeStrong((id *)&v7->_name, v8);
        objc_storeStrong((id *)&v7->_identifier, v9);
        v7->_defaultRank = v10;
        v7->_isProdigyLevel = v12;
        v7->_index = a4;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "name");
        *(_DWORD *)buf = 136315906;
        v18 = "-[FCPuzzleRank initWithDictionary:index:]";
        v19 = 2080;
        v20 = "FCPuzzleRank.m";
        v21 = 1024;
        v22 = 25;
        v23 = 2114;
        v24 = v14;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      if (v9)
        goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "identifier");
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCPuzzleRank initWithDictionary:index:]";
      v19 = 2080;
      v20 = "FCPuzzleRank.m";
      v21 = 1024;
      v22 = 26;
      v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
LABEL_10:

    v7 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)index
{
  return self->_index;
}

- (BOOL)defaultRank
{
  return self->_defaultRank;
}

- (BOOL)isProdigyLevel
{
  return self->_isProdigyLevel;
}

@end
