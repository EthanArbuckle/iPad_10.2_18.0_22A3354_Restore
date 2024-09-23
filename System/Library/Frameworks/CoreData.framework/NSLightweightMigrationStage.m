@implementation NSLightweightMigrationStage

- (NSLightweightMigrationStage)initWithVersionChecksums:(NSArray *)versionChecksums
{
  uint64_t v5;
  NSLightweightMigrationStage *v6;
  objc_super v8;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:"), "count");
  if (v5 != -[NSArray count](versionChecksums, "count"))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Duplicate version checksums detected."), 0));
  }
  v8.receiver = self;
  v8.super_class = (Class)NSLightweightMigrationStage;
  v6 = -[NSMigrationStage init](&v8, sel_init);
  if (v6)
    v6->_versionChecksums = versionChecksums;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_versionChecksums = 0;
  self->_subsequentStage = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSLightweightMigrationStage;
  -[NSMigrationStage dealloc](&v3, sel_dealloc);
}

- (NSArray)versionChecksums
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMigrationStage)subsequentStage
{
  return (NSMigrationStage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubsequentStage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
