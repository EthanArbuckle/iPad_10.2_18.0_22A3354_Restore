@implementation MDLMaterialPropertyConnection

- (MDLMaterialPropertyConnection)initWithOutput:(MDLMaterialProperty *)output input:(MDLMaterialProperty *)input
{
  MDLMaterialProperty *v6;
  MDLMaterialProperty *v7;
  MDLMaterialPropertyConnection *v8;
  MDLMaterialPropertyConnection *v9;
  MDLMaterialPropertyConnection *v10;
  objc_super v12;

  v6 = output;
  v7 = input;
  v12.receiver = self;
  v12.super_class = (Class)MDLMaterialPropertyConnection;
  v8 = -[MDLMaterialPropertyConnection init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_input, v7);
    objc_storeWeak((id *)&v9->_output, v6);
    v10 = v9;
  }

  return v9;
}

- (MDLMaterialProperty)input
{
  return (MDLMaterialProperty *)objc_loadWeakRetained((id *)&self->_input);
}

- (MDLMaterialProperty)output
{
  return (MDLMaterialProperty *)objc_loadWeakRetained((id *)&self->_output);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_output);
  objc_destroyWeak((id *)&self->_input);
}

@end
