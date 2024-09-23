@implementation HMIFaceQualityFilterModelInput

- (HMIFaceQualityFilterModelInput)initWithInput:(id)a3 inputName:(id)a4
{
  id v7;
  id v8;
  HMIFaceQualityFilterModelInput *v9;
  HMIFaceQualityFilterModelInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIFaceQualityFilterModelInput;
  v9 = -[HMIFaceQualityFilterModelInput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_inputName, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  -[HMIFaceQualityFilterModelInput inputName](self, "inputName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMIFaceQualityFilterModelInput inputName](self, "inputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBFF98];
    -[HMIFaceQualityFilterModelInput input](self, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "featureValueWithMultiArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
