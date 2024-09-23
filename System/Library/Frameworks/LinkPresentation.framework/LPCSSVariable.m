@implementation LPCSSVariable

- (LPCSSVariable)initWithName:(id)a3
{
  id v5;
  LPCSSVariable *v6;
  LPCSSVariable *v7;
  LPCSSVariable *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPCSSVariable;
  v6 = -[LPCSSVariable init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = v7;
  }

  return v7;
}

- (id)variableByResolvingWithThemePath:(id)a3
{
  void *v3;
  LPCSSVariable *v4;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_name, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<theme-path>"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LPCSSVariable initWithName:]([LPCSSVariable alloc], "initWithName:", v3);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
