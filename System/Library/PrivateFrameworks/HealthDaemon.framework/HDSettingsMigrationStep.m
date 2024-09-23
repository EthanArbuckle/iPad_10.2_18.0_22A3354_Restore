@implementation HDSettingsMigrationStep

- (HDSettingsMigrationStep)initWithIdentifier:(id)a3 migrationVersion:(int64_t)a4 block:(id)a5
{
  id v7;
  HDSettingsMigrationStep *v8;
  HDSettingsMigrationStep *v9;
  void *v10;
  id block;
  objc_super v13;

  v7 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDSettingsMigrationStep;
  v8 = -[HDSettingsMigrationStep init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_migrationVersion = a4;
    v10 = _Block_copy(v7);
    block = v9->_block;
    v9->_block = v10;

  }
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%ld>"), objc_opt_class(), self->_migrationVersion);
}

- (BOOL)performStepWithProfile:(id)a3 error:(id *)a4
{
  return (*((uint64_t (**)(void))self->_block + 2))();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)migrationVersion
{
  return self->_migrationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
