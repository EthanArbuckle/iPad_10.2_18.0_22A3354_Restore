@implementation NSCustomMigrationStage

- (NSCustomMigrationStage)initWithCurrentModelReference:(NSManagedObjectModelReference *)currentModel nextModelReference:(NSManagedObjectModelReference *)nextModel
{
  NSCustomMigrationStage *v7;
  void *v9;
  uint64_t v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](-[NSManagedObjectModelReference versionChecksum](currentModel, "versionChecksum"), "isEqualToString:", -[NSManagedObjectModelReference versionChecksum](nextModel, "versionChecksum")))
  {

    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v12[0] = CFSTR("currentModel versionChecksum");
    v12[1] = CFSTR("nextModel versionChecksum");
    v13[0] = -[NSManagedObjectModelReference versionChecksum](currentModel, "versionChecksum");
    v13[1] = -[NSManagedObjectModelReference versionChecksum](nextModel, "versionChecksum");
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, CFSTR("The current model reference and the next model reference cannot be equal."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2)));
  }
  v11.receiver = self;
  v11.super_class = (Class)NSCustomMigrationStage;
  v7 = -[NSMigrationStage init](&v11, sel_init);
  if (v7)
  {
    v7->_currentModel = currentModel;
    v7->_nextModel = nextModel;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_currentModel = 0;
  self->_nextModel = 0;

  self->_willMigrateHandler = 0;
  self->_didMigrateHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCustomMigrationStage;
  -[NSMigrationStage dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectModelReference)currentModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 16, 1);
}

- (NSManagedObjectModelReference)nextModel
{
  return (NSManagedObjectModelReference *)objc_getProperty(self, a2, 24, 1);
}

- (void)willMigrateHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setWillMigrateHandler:(void *)willMigrateHandler
{
  objc_setProperty_atomic_copy(self, a2, willMigrateHandler, 32);
}

- (void)didMigrateHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDidMigrateHandler:(void *)didMigrateHandler
{
  objc_setProperty_atomic_copy(self, a2, didMigrateHandler, 40);
}

@end
