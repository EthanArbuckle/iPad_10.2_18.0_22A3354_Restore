@implementation CalMigrationFailure

- (CalMigrationFailure)initWithDescription:(id)a3 stage:(unint64_t)a4 underlyingError:(id)a5 relatedPath:(id)a6 isFatal:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  CalMigrationFailure *v15;
  uint64_t v16;
  NSString *failureDescription;
  uint64_t v18;
  NSError *underlyingError;
  uint64_t v20;
  NSString *relatedPath;
  objc_super v23;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CalMigrationFailure;
  v15 = -[CalMigrationFailure init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    failureDescription = v15->_failureDescription;
    v15->_failureDescription = (NSString *)v16;

    v15->_stage = a4;
    v18 = objc_msgSend(v13, "copy");
    underlyingError = v15->_underlyingError;
    v15->_underlyingError = (NSError *)v18;

    v20 = objc_msgSend(v14, "copy");
    relatedPath = v15->_relatedPath;
    v15->_relatedPath = (NSString *)v20;

    v15->_isFatal = a7;
  }

  return v15;
}

- (CalMigrationFailure)initWithDatabaseIntegrityErrors:(id)a3
{
  id v4;
  CalMigrationFailure *v5;
  CalMigrationFailure *v6;
  NSString *failureDescription;
  uint64_t v8;
  NSArray *databaseIntegrityErrors;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalMigrationFailure;
  v5 = -[CalMigrationFailure init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    failureDescription = v5->_failureDescription;
    v5->_failureDescription = (NSString *)CFSTR("Database integrity error");

    v6->_stage = 5;
    v8 = objc_msgSend(v4, "copy");
    databaseIntegrityErrors = v6->_databaseIntegrityErrors;
    v6->_databaseIntegrityErrors = (NSArray *)v8;

    v6->_isFatal = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CalMigrationFailure failureDescription](self, "failureDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_labelForStage:", -[CalMigrationFailure stage](self, "stage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMigrationFailure underlyingError](self, "underlyingError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMigrationFailure relatedPath](self, "relatedPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalMigrationFailure databaseIntegrityErrors](self, "databaseIntegrityErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n{\n  description = \"%@\"\n  stage = %@\n  underlyingError = %@\n  relatedPath = %@\n  databaseIntegrityErrors = %@\n}"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_labelForStage:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("Unknown");
  else
    return off_24D3F49E8[a3 - 1];
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (NSString)relatedPath
{
  return self->_relatedPath;
}

- (BOOL)isFatal
{
  return self->_isFatal;
}

- (NSArray)databaseIntegrityErrors
{
  return self->_databaseIntegrityErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseIntegrityErrors, 0);
  objc_storeStrong((id *)&self->_relatedPath, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_failureDescription, 0);
}

@end
