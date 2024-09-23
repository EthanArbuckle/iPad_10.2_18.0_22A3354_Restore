@implementation GKNoiseSource

- (int)requiredInputModuleCount
{
  return 0;
}

- (double)valueAt:(GKNoiseSource *)self
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Derived class %@ must override %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, MEMORY[0x24BDBD1B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)inputModuleAtIndex:(int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected call on instance of class %@ to method %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v8, MEMORY[0x24BDBD1B8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (void)setInputModule:(id)a3 atIndex:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_opt_class();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected call on instance of class %@ to method %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, MEMORY[0x24BDBD1B8]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)cloneModule
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Derived class %@ must override %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, MEMORY[0x24BDBD1B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

@end
