@implementation GKNoiseModifier

- (GKNoiseModifier)init
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
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Unexpected call on instance of class %@ to method %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, MEMORY[0x24BDBD1B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (GKNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  GKNoiseModifier *v4;
  uint64_t v5;
  NSMutableArray *inputModules;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKNoiseModifier;
  v4 = -[GKNoiseModifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    inputModules = v4->_inputModules;
    v4->_inputModules = (NSMutableArray *)v5;

  }
  return v4;
}

- (int)requiredInputModuleCount
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

- (double)valueAt:(GKNoiseModifier *)self
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
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_inputModules, "objectAtIndexedSubscript:", a3);
}

- (void)setInputModule:(id)a3 atIndex:(int)a4
{
  -[NSMutableArray setObject:atIndexedSubscript:](self->_inputModules, "setObject:atIndexedSubscript:", a3, a4);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModules, 0);
}

@end
