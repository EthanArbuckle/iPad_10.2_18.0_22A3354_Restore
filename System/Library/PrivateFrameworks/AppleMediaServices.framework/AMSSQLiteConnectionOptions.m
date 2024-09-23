@implementation AMSSQLiteConnectionOptions

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSString)protectionType
{
  return self->_protectionType;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)applyToDatabase:(sqlite3 *)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PRAGMA cache_size=%ld"), -[AMSSQLiteConnectionOptions cacheSize](self, "cacheSize")));
  v8 = sqlite3_exec(a3, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, 0);
  if ((_DWORD)v8)
  {
    AMSSQLiteCreateError(-7703, CFSTR("Error Setting Cache Size"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  else if (self->_checkpointingOnCloseDisabled)
  {
    v12 = sqlite3_db_config(a3, 1006, 1, 0);
    if (v12)
    {
      v13 = v12;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        v17 = v13;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "Failed to disable checkpointing on close: %{public}d", buf, 8u);
      }

    }
  }

  return (_DWORD)v8 == 0;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (AMSSQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4;
  AMSSQLiteConnectionOptions *v5;
  uint64_t v6;
  NSString *databasePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteConnectionOptions;
  v5 = -[AMSSQLiteConnectionOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    -[AMSSQLiteConnectionOptions setCacheSizeWithNumberOfKilobytes:](v5, "setCacheSizeWithNumberOfKilobytes:", 128);
  }

  return v5;
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
  -[AMSSQLiteConnectionOptions setCacheSize:](self, "setCacheSize:", -a3);
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 24) = self->_cacheSize;
    v7 = -[NSString copyWithZone:](self->_databasePath, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v7;

    v9 = -[NSString copyWithZone:](self->_protectionType, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v9;

    *(_BYTE *)(v6 + 8) = self->_readOnly;
  }
  return (id)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionType, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSSQLiteConnectionOptions)initWithCoder:(id)a3
{
  id v4;
  AMSSQLiteConnectionOptions *v5;
  void *v6;
  uint64_t v7;
  NSString *databasePath;
  void *v9;
  uint64_t v10;
  NSString *protectionType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSQLiteConnectionOptions;
  v5 = -[AMSSQLiteConnectionOptions init](&v13, sel_init);
  if (v5)
  {
    v5->_cacheSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("c"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("p"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    protectionType = v5->_protectionType;
    v5->_protectionType = (NSString *)v10;

    v5->_readOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ro"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t cacheSize;
  id v5;

  cacheSize = self->_cacheSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", cacheSize, CFSTR("c"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databasePath, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protectionType, CFSTR("pt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_readOnly, CFSTR("ro"));

}

- (void)setDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setProtectionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isCheckpointingOnCloseDisabled
{
  return self->_checkpointingOnCloseDisabled;
}

- (void)setCheckpointingOnCloseDisabled:(BOOL)a3
{
  self->_checkpointingOnCloseDisabled = a3;
}

@end
