@implementation HDHeartDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D2FB48];
}

- (NSString)schemaName
{
  return (NSString *)CFSTR("heart");
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[HDHeartDaemonPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentSchemaVersion");

  return v4;
}

- (id)_databaseSchemaForProtectionClass:(int64_t)a3
{
  __objc2_class **v3;

  if (a3 == 1)
  {
    v3 = off_1E87EEAB0;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v3 = off_1E87EEAA8;
LABEL_5:
    self = (HDHeartDaemonPlugin *)objc_alloc_init(*v3);
  }
  return self;
}

- (HDHeartDaemonPlugin)init
{
  id v3;
  void *v4;
  HDHeartDaemonPlugin *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  v5 = -[HDHeartDaemonPlugin initWithHeartNotificationsUserDefaults:](self, "initWithHeartNotificationsUserDefaults:", v4);

  return v5;
}

- (HDHeartDaemonPlugin)initWithHeartNotificationsUserDefaults:(id)a3
{
  id v5;
  HDHeartDaemonPlugin *v6;
  HDHeartDaemonPlugin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHeartDaemonPlugin;
  v6 = -[HDHeartDaemonPlugin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heartNotificationsUserDefaults, a3);

  return v7;
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRealityDevice");

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  HDHeartProfileExtension *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[HDHeartProfileExtension initWithProfile:heartNotificationsUserDefaults:]([HDHeartProfileExtension alloc], "initWithProfile:heartNotificationsUserDefaults:", v4, self->_heartNotificationsUserDefaults);
  else
    v5 = 0;

  return v5;
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v4;
  HDHeartDaemonExtension *v5;

  v4 = a3;
  v5 = -[HDHeartDaemonExtension initWithHealthDaemon:heartNotificationsUserDefaults:]([HDHeartDaemonExtension alloc], "initWithHealthDaemon:heartNotificationsUserDefaults:", v4, self->_heartNotificationsUserDefaults);

  return v5;
}

- (void)handleDatabaseObliteration
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99EA0];
  v3 = *MEMORY[0x1E0CB76F8];
  v5[0] = *MEMORY[0x1E0CB7700];
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v4);

}

- (id)taskServerClasses
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HDHeartDaemonPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HDHeartDaemonPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHeartDaemonPlugin schemaName](self, "schemaName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerMigrationStepsForSchemaName:migrator:", v7, v6);

}

- (id)demoDataGeneratorClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateSyncEntityClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
}

@end
