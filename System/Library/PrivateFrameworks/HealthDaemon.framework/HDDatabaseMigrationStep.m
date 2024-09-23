@implementation HDDatabaseMigrationStep

+ (id)migrationStepFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5
{
  id v6;
  HDDatabaseMigrationStep *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v7 = [HDDatabaseMigrationStep alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__HDDatabaseMigrationStep_migrationStepFrom_to_handler___block_invoke;
  v11[3] = &unk_1E6CFBEF0;
  v12 = v6;
  v8 = v6;
  v9 = -[HDDatabaseMigrationStep initForSchema:toVersion:requiringVersion:foreignKeys:handler:](v7, "initForSchema:toVersion:requiringVersion:foreignKeys:handler:", 0, a4, -1, 0, v11);

  return v9;
}

uint64_t __56__HDDatabaseMigrationStep_migrationStepFrom_to_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)migrationStepWithForeignKeysDisabledFrom:(int64_t)a3 to:(int64_t)a4 handler:(id)a5
{
  id v6;
  HDDatabaseMigrationStep *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v7 = [HDDatabaseMigrationStep alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__HDDatabaseMigrationStep_migrationStepWithForeignKeysDisabledFrom_to_handler___block_invoke;
  v11[3] = &unk_1E6CFBEF0;
  v12 = v6;
  v8 = v6;
  v9 = -[HDDatabaseMigrationStep initForSchema:toVersion:requiringVersion:foreignKeys:handler:](v7, "initForSchema:toVersion:requiringVersion:foreignKeys:handler:", 0, a4, -1, 1, v11);

  return v9;
}

uint64_t __79__HDDatabaseMigrationStep_migrationStepWithForeignKeysDisabledFrom_to_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)initForSchema:(id)a3 toVersion:(int64_t)a4 requiringVersion:(int64_t)a5 foreignKeys:(int64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  HDDatabaseMigrationStep *v15;
  uint64_t v16;
  NSString *schemaName;
  uint64_t v18;
  id migrationHandler;
  void *v21;
  objc_super v22;

  v13 = a3;
  v14 = a7;
  if (!v13 && a5 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseMigrationStep.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(schemaName != nil) || (requiredPrimarySchemaVersion == HDSQLiteRequiredPrimarySchemaVersionAny)"));

  }
  v22.receiver = self;
  v22.super_class = (Class)HDDatabaseMigrationStep;
  v15 = -[HDDatabaseMigrationStep init](&v22, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    schemaName = v15->_schemaName;
    v15->_schemaName = (NSString *)v16;

    v15->_requiredPrimarySchemaVersion = a5;
    v15->_finalSchemaVersion = a4;
    v15->_foreignKeyStatus = a6;
    v18 = objc_msgSend(v14, "copy");
    migrationHandler = v15->_migrationHandler;
    v15->_migrationHandler = (id)v18;

  }
  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *schemaName;
  int64_t foreignKeyStatus;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)HDDatabaseMigrationStep;
  -[HDDatabaseMigrationStep description](&v12, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  schemaName = &stru_1E6D11BB8;
  if (self->_schemaName)
    schemaName = (const __CFString *)self->_schemaName;
  foreignKeyStatus = self->_foreignKeyStatus;
  v8 = CFSTR("<UNKNOWN>");
  if (foreignKeyStatus == 1)
    v8 = CFSTR("disabled");
  if (foreignKeyStatus)
    v9 = v8;
  else
    v9 = CFSTR("enabled");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@: -> %ld (requiring: %ld) foreign keys %@>"), v4, schemaName, self->_finalSchemaVersion, self->_requiredPrimarySchemaVersion, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)migrationHandler
{
  return self->_migrationHandler;
}

- (int64_t)finalSchemaVersion
{
  return self->_finalSchemaVersion;
}

- (int64_t)foreignKeyStatus
{
  return self->_foreignKeyStatus;
}

- (void)setForeignKeyStatus:(int64_t)a3
{
  self->_foreignKeyStatus = a3;
}

- (NSString)schemaName
{
  return self->_schemaName;
}

- (int64_t)requiredPrimarySchemaVersion
{
  return self->_requiredPrimarySchemaVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaName, 0);
  objc_storeStrong(&self->_migrationHandler, 0);
}

@end
