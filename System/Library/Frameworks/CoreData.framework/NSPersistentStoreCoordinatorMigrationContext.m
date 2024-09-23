@implementation NSPersistentStoreCoordinatorMigrationContext

- (NSPersistentStoreCoordinatorMigrationContext)initWithStoreURL:(id)a3 type:(id)a4 options:(id)a5
{
  NSPersistentStoreCoordinatorMigrationContext *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSPersistentStoreCoordinatorMigrationContext;
  v8 = -[NSPersistentStoreCoordinatorMigrationContext init](&v10, sel_init);
  if (v8)
  {
    v8->_storeURL = (NSURL *)a3;
    v8->_storeType = (NSString *)a4;
    v8->_options = (NSDictionary *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_configurationName = 0;
  self->_destinationConfigurationForCloudKitValidation = 0;

  self->_metadata = 0;
  self->_migratedStore = 0;

  self->_stagedMigrationManager = 0;
  self->_ubiquitySetupAssistant = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreCoordinatorMigrationContext;
  -[NSPersistentStoreCoordinatorMigrationContext dealloc](&v3, sel_dealloc);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (NSString)storeType
{
  return self->_storeType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (void)setConfigurationName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)forceMigration
{
  return self->_forceMigration;
}

- (void)setForceMigration:(BOOL)a3
{
  self->_forceMigration = a3;
}

- (NSPersistentStore)migratedStore
{
  return self->_migratedStore;
}

- (void)setMigratedStore:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSStagedMigrationManager)stagedMigrationManager
{
  return self->_stagedMigrationManager;
}

- (void)setStagedMigrationManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (PFUbiquitySetupAssistant)ubiquitySetupAssistant
{
  return self->_ubiquitySetupAssistant;
}

- (void)setUbiquitySetupAssistant:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
