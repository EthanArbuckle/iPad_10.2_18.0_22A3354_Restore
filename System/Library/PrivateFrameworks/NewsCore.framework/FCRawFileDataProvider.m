@implementation FCRawFileDataProvider

- (FCRawFileDataProvider)initWithFilePath:(id)a3 holdToken:(id)a4
{
  id v6;
  id v7;
  FCRawFileDataProvider *v8;
  uint64_t v9;
  NSString *filePath;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCRawFileDataProvider;
  v8 = -[FCRawFileDataProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    filePath = v8->_filePath;
    v8->_filePath = (NSString *)v9;

    v8->_isRawFileConsumable = 1;
    objc_storeStrong((id *)&v8->_holdToken, a4);
  }

  return v8;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (BOOL)isRawFileConsumable
{
  return self->_isRawFileConsumable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (NSData)data
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  -[FCRawFileDataProvider filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (FCRawFileDataProvider)initWithFilePath:(id)a3
{
  return -[FCRawFileDataProvider initWithFilePath:holdToken:](self, "initWithFilePath:holdToken:", a3, 0);
}

- (FCRawFileDataProvider)init
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
    v8 = "-[FCRawFileDataProvider init]";
    v9 = 2080;
    v10 = "FCRawFileDataProvider.m";
    v11 = 1024;
    v12 = 44;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCRawFileDataProvider init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCInterestToken)holdToken
{
  return self->_holdToken;
}

@end
