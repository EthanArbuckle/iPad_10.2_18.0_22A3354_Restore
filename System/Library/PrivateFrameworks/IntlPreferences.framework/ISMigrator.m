@implementation ISMigrator

+ (unint64_t)currentPlatform
{
  return 2;
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "migratorFromVersion:toVersion:platform:", v7, v6, objc_msgSend((id)objc_opt_class(), "currentPlatform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)migratorForNewUserAccountWithVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "migratorFromVersion:toVersion:platform:newUserAccount:", &stru_1E70697F8, v4, objc_msgSend((id)objc_opt_class(), "currentPlatform"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "migratorFromVersion:toVersion:platform:newUserAccount:", a3, a4, a5, 0);
}

+ (id)migratorFromVersion:(id)a3 toVersion:(id)a4 platform:(unint64_t)a5 newUserAccount:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setPlatform:", a5);
  objc_msgSend(v11, "setPreviousVersion:", v10);

  objc_msgSend(v11, "setCurrentVersion:", v9);
  objc_msgSend(v11, "setNewUserAccount:", v6);
  return v11;
}

+ (id)migratorFromSchemaVersion:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPlatform:", objc_msgSend((id)objc_opt_class(), "currentPlatform"));
  objc_msgSend(v4, "setPreviousSchemaVersion:", a3);
  return v4;
}

- (id)performMigrationForPreferences:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)performMigrationForUserPreferences:(id)a3 systemPreferences:(id)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)previousVersionIsOlderThanMacOS:(id)a3 iOS:(id)a4 watchOS:(id)a5 tvOS:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[ISMigrator platform](self, "platform");
  v15 = v10;
  switch(v14)
  {
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      v15 = v11;
      goto LABEL_6;
    case 3uLL:
      v15 = v12;
      goto LABEL_6;
    case 4uLL:
      v15 = v13;
LABEL_6:
      v16 = v15;
      break;
    default:
      v16 = 0;
      break;
  }
  -[ISMigrator previousVersion](self, "previousVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "compare:options:", v16, 64) == -1;

  return v18;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)previousVersion
{
  return self->_previousVersion;
}

- (void)setPreviousVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)previousSchemaVersion
{
  return self->_previousSchemaVersion;
}

- (void)setPreviousSchemaVersion:(unint64_t)a3
{
  self->_previousSchemaVersion = a3;
}

- (BOOL)newUserAccount
{
  return self->_newUserAccount;
}

- (void)setNewUserAccount:(BOOL)a3
{
  self->_newUserAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_previousVersion, 0);
}

@end
