@implementation ML3ClientImportResult

- (ML3ClientImportResult)initWithSuccess:(BOOL)a3 resultingDatabasePersistentIDs:(id)a4
{
  id v6;
  ML3ClientImportResult *v7;
  ML3ClientImportResult *v8;
  uint64_t v9;
  NSDictionary *resultingDatabasePersistentIDs;

  v6 = a4;
  v7 = -[ML3ClientImportResult init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_success = a3;
    v9 = objc_msgSend(v6, "copy");
    resultingDatabasePersistentIDs = v8->_resultingDatabasePersistentIDs;
    v8->_resultingDatabasePersistentIDs = (NSDictionary *)v9;

  }
  return v8;
}

- (ML3ClientImportResult)initWithCoder:(id)a3
{
  id v4;
  ML3ClientImportResult *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *resultingDatabasePersistentIDs;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ClientImportResult;
  v5 = -[ML3ClientImportResult init](&v13, sel_init);
  if (v5)
  {
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("persistentIDs"));
    v10 = objc_claimAutoreleasedReturnValue();
    resultingDatabasePersistentIDs = v5->_resultingDatabasePersistentIDs;
    v5->_resultingDatabasePersistentIDs = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 success;
  id v5;

  success = self->_success;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", success, CFSTR("success"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resultingDatabasePersistentIDs, CFSTR("persistentIDs"));

}

- (BOOL)success
{
  return self->_success;
}

- (NSDictionary)resultingDatabasePersistentIDs
{
  return self->_resultingDatabasePersistentIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingDatabasePersistentIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
