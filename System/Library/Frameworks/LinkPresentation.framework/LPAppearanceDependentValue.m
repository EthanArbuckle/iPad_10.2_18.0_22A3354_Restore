@implementation LPAppearanceDependentValue

- (LPAppearanceDependentValue)initWithProvider:(id)a3
{
  id v4;
  LPAppearanceDependentValue *v5;
  void *v6;
  id provider;
  LPAppearanceDependentValue *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAppearanceDependentValue;
  v5 = -[LPAppearanceDependentValue init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    provider = v5->_provider;
    v5->_provider = v6;

    v8 = v5;
  }

  return v5;
}

- (id)valueForAppearance:(id)a3
{
  (*((void (**)(void))self->_provider + 2))();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)dependentTraits
{
  return self->_dependentTraits;
}

- (void)setDependentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_dependentTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentTraits, 0);
  objc_storeStrong(&self->_provider, 0);
}

@end
