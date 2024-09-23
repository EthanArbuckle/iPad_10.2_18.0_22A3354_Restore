@implementation HDSQLiteCheckConstraint

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDSQLiteCheckConstraint;
  return -[HDSQLiteCheckConstraint init](&v3, sel_init);
}

- (HDSQLiteCheckConstraint)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (NSString)SQLCheckConstraint
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
