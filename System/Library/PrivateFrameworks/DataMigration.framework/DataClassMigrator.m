@implementation DataClassMigrator

- (BOOL)didUpgrade
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("SyntheticDidUpgrade"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)didRestoreFromBackup
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("DidRestoreFromBackup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)didMigrateBackupFromDifferentDevice
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("DidMigrateBackupFromDifferentDevice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)didRestoreFromCloudBackup
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("DidRestoreFromCloudBackup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)shouldPreserveSettingsAfterRestore
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("ShouldPreserveSettingsAfterRestore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)wasPasscodeSetInBackup
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_context, "objectForKey:", CFSTR("WasPasscodeSetInBackup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)performMigration
{
  return 0;
}

+ (id)dataClassMigratorForBundleAtPath:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v14;

  v4 = a3;
  _DMLogFunc(v3, 7, CFSTR("Will create migrator bundle at %@"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _DMLogFunc(v3, 3, CFSTR("%@ Failed to create migration plugin bundle at %@"));
LABEL_8:
    v12 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  _DMLogFunc(v3, 7, CFSTR("Will load migrator bundle"));
  v14 = 0;
  v6 = objc_msgSend(v5, "loadAndReturnError:", &v14);
  v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    _DMLogFunc(v3, 3, CFSTR("Cannot load migrator bundle at %@ with error %@"));

    goto LABEL_8;
  }

  _DMLogFunc(v3, 7, CFSTR("Will get migrator bundle identifier"));
  objc_msgSend(v5, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _DMLogFunc(v3, 7, CFSTR("Will check migrator principal class"));
  v10 = (objc_class *)objc_msgSend(v5, "principalClass");
  if ((-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    _DMLogFunc(v3, 7, CFSTR("Will instantiate migrator principal class"));
    v11 = objc_alloc_init(v10);
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "setDmBundleIdentifier:", v9);
    else
      _DMLogFunc(v3, 3, CFSTR("Cannot instantiate migrator at %@"));
  }
  else
  {
    _DMLogFunc(v3, 3, CFSTR("Wrong principal class (%@) for migration plugin bundle at %@"));
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (unsigned)userDataDisposition
{
  return self->_userDataDisposition;
}

- (void)setUserDataDisposition:(unsigned int)a3
{
  self->_userDataDisposition = a3;
}

- (NSString)restoredBackupBuildVersion
{
  return self->_restoredBackupBuildVersion;
}

- (void)setRestoredBackupBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_restoredBackupBuildVersion, a3);
}

- (NSString)restoredBackupProductType
{
  return self->_restoredBackupProductType;
}

- (void)setRestoredBackupProductType:(id)a3
{
  objc_storeStrong((id *)&self->_restoredBackupProductType, a3);
}

- (NSString)restoredBackupDeviceName
{
  return self->_restoredBackupDeviceName;
}

- (void)setRestoredBackupDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_restoredBackupDeviceName, a3);
}

- (void)setDidUpgrade:(BOOL)a3
{
  self->_didUpgrade = a3;
}

- (NSString)dmBundleIdentifier
{
  return self->_dmBundleIdentifier;
}

- (void)setDmBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_restoredBackupDeviceName, 0);
  objc_storeStrong((id *)&self->_restoredBackupProductType, 0);
  objc_storeStrong((id *)&self->_restoredBackupBuildVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
