@implementation LACUIAvailableMechanismsWrapper

- (LACUIAvailableMechanismsWrapper)initWithMechanismEvents:(id)a3
{
  id v4;
  LACUIAvailableMechanismsWrapper *v5;
  LACUIAvailableMechanismsWrapper *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIAvailableMechanismsWrapper;
  v5 = -[LACUIAvailableMechanismsWrapper init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v5->_mechanismEvents, v7);
  }

  return v6;
}

- (BOOL)isEmpty
{
  return -[LACUIAvailableMechanismsWrapper count](self, "count") == 0;
}

- (unint64_t)count
{
  return -[NSArray count](self->_mechanismEvents, "count");
}

- (BOOL)allowsPasscode
{
  NSArray *mechanismEvents;
  void *v3;

  mechanismEvents = self->_mechanismEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mechanismEvents) = -[NSArray containsObject:](mechanismEvents, "containsObject:", v3);

  return (char)mechanismEvents;
}

- (BOOL)allowsBiometry
{
  NSArray *mechanismEvents;
  void *v4;
  char v5;
  NSArray *v6;
  void *v7;
  NSArray *v8;
  void *v9;

  mechanismEvents = self->_mechanismEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray containsObject:](mechanismEvents, "containsObject:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = self->_mechanismEvents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray containsObject:](v6, "containsObject:", v7))
    {
      v5 = 1;
    }
    else
    {
      v8 = self->_mechanismEvents;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605D8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[NSArray containsObject:](v8, "containsObject:", v9);

    }
  }

  return v5;
}

- (BOOL)allowsWatch
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mechanismEvents, 0);
}

@end
