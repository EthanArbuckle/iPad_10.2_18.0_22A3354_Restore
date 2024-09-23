@implementation FCLocalVersionedTag

- (FCLocalVersionedTag)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalVersionedTag init]";
    v9 = 2080;
    v10 = "FCLocalVersionedTag.m";
    v11 = 1024;
    v12 = 21;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCLocalVersionedTag init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCLocalVersionedTag)initWithDictionary:(id)a3
{
  id v4;
  FCLocalVersionedTag *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCLocalVersionedTag;
  v5 = -[FCLocalVersionedTag init](&v13, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("identifier"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("minNewsVersion"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v8 = +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v8);
    v5->_minVersion = v8;
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("maxNewsVersion"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v10);
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_maxVersion = v11;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(int64_t)a3
{
  self->_minVersion = a3;
}

- (int64_t)maxVersion
{
  return self->_maxVersion;
}

- (void)setMaxVersion:(int64_t)a3
{
  self->_maxVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
