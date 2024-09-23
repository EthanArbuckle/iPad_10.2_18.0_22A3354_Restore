@implementation FCPersistedContentArchive

- (id)description
{
  FCDescription *v3;
  void *v4;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("archivePath"), self->_archivePath);
  -[FCDescription descriptionString](v3, "descriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersistedContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCPersistedContentArchive *v5;
  uint64_t v6;
  NSString *archivePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersistedContentArchive;
  v5 = -[FCPersistedContentArchive init](&v9, sel_init);
  if (v5)
  {
    if (qword_1ED0F7D18 != -1)
      dispatch_once(&qword_1ED0F7D18, &__block_literal_global_185);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", qword_1ED0F7D10, CFSTR("archivePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivePath = v5->_archivePath;
    v5->_archivePath = (NSString *)v6;

  }
  return v5;
}

void __43__FCPersistedContentArchive_initWithCoder___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7D10;
  qword_1ED0F7D10 = v0;

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_archivePath, CFSTR("archivePath"));
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  FCContentUnarchiveResult *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A8580B64]();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", self->_archivePath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "unarchiveIntoContentContext:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [FCContentUnarchiveResult alloc];
    v9 = -[FCContentUnarchiveResult initWithInterestToken:storageSize:](v10, "initWithInterestToken:storageSize:", MEMORY[0x1E0C9AA60], 0);
  }
  v11 = (void *)v9;

  objc_autoreleasePoolPop(v5);
  return v11;
}

- (id)manifest
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("persisted content archive doesn't currently support providing its manifest"));
    v4 = 136315906;
    v5 = "-[FCPersistedContentArchive manifest]";
    v6 = 2080;
    v7 = "FCContentArchive.m";
    v8 = 1024;
    v9 = 871;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

  }
  return 0;
}

- (int64_t)storageSize
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fc_sizeOfItemAtPath:error:", self->_archivePath, 0);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivePath, 0);
}

@end
