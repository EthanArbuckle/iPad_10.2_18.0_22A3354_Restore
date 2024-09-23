@implementation DTGPURawCounter

- (DTGPURawCounter)initWithName:(id)a3
{
  id v5;
  DTGPURawCounter *v6;
  DTGPURawCounter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTGPURawCounter;
  v6 = -[DTGPURawCounter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (unint64_t)hash
{
  return MEMORY[0x24BEDD108](self->_name, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    name = self->_name;
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](name, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
