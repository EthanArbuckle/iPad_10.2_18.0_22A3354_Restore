@implementation Te_tjejjxf8q3Input

- (Te_tjejjxf8q3Input)initWithPlaceholder:(id)a3
{
  id v5;
  Te_tjejjxf8q3Input *v6;
  Te_tjejjxf8q3Input *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Te_tjejjxf8q3Input;
  v6 = -[Te_tjejjxf8q3Input init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Placeholder, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25075A3A8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Placeholder")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithMultiArray:", self->_Placeholder);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)Placeholder
{
  return self->_Placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_Placeholder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Placeholder, 0);
}

@end
