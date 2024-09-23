@implementation HDSimpleGraphDatabaseMigrationStep

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %ld>"), objc_opt_class(), self->_toVersion);
}

+ (id)migrationToVersion:(int64_t)a3 function:(void *)a4
{
  HDSimpleGraphDatabaseMigrationStep *v6;
  objc_super v8;

  v6 = [HDSimpleGraphDatabaseMigrationStep alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)HDSimpleGraphDatabaseMigrationStep;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_toVersion = a3;
      v6->_function = a4;
    }
  }
  return v6;
}

- (int64_t)toVersion
{
  return self->_toVersion;
}

- (void)function
{
  return self->_function;
}

@end
