@implementation AMSUISystemImageFetchOperation

- (AMSUISystemImageFetchOperation)initWithSystemImageName:(id)a3 variableValue:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUISystemImageFetchOperation *v11;
  uint64_t v12;
  NSString *imageName;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUISystemImageFetchOperation;
  v11 = -[AMSUISystemImageFetchOperation init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_traitCollection, a5);
    objc_storeStrong((id *)&v11->_variableValue, a4);
  }

  return v11;
}

- (BOOL)isLowLatency
{
  return 1;
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x24BEBD650]);
  -[AMSUISystemImageFetchOperation traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithTraitCollection:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[AMSUISystemImageFetchOperation variableValue](self, "variableValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD640];
  -[AMSUISystemImageFetchOperation imageName](self, "imageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AMSUISystemImageFetchOperation variableValue](self, "variableValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v6, "_systemImageNamed:variableValue:withConfiguration:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "_systemImageNamed:withConfiguration:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
  {
    -[AMSUIAssetFetchOperation _finishWithImage:error:](self, "_finishWithImage:error:", v9, 0);
  }
  else
  {
    AMSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAssetFetchOperation _finishWithImage:error:](self, "_finishWithImage:error:", 0, v10);

  }
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (NSNumber)variableValue
{
  return self->_variableValue;
}

- (void)setVariableValue:(id)a3
{
  objc_storeStrong((id *)&self->_variableValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableValue, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
