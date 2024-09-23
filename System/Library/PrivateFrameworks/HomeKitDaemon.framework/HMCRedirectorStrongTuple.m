@implementation HMCRedirectorStrongTuple

- (unint64_t)hash
{
  if (self)
    self = (HMCRedirectorStrongTuple *)self->_tuple;
  return -[HMCRedirectorStrongTuple hash](self, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  HMCRedirectorTuple *tuple;
  uint64_t v9;
  HMCRedirectorTuple *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    if (self)
      tuple = self->_tuple;
    else
      tuple = 0;
    v9 = v6[1];
    v10 = tuple;
    v11 = -[HMCRedirectorTuple isEqual:](v10, "isEqual:", v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  id target;
  id v5;
  void *v6;
  id v7;
  const char *selector;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  if (self)
    target = self->_target;
  else
    target = 0;
  v5 = target;
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Target"), v5);
  v13[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  if (self)
    selector = self->_selector;
  else
    selector = 0;
  NSStringFromSelector(selector);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Selector"), v9);
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const char *selector;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    selector = self->_selector;
  else
    selector = 0;
  NSStringFromSelector(selector);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<HMCRedirectorStrongTuple -[%@ %@]>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
}

@end
