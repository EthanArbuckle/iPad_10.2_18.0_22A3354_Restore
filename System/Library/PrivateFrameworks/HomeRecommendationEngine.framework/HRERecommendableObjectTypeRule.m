@implementation HRERecommendableObjectTypeRule

- (HRERecommendableObjectTypeRule)initWithRequiredType:(id)a3
{
  id v4;
  HRERecommendableObjectTypeRule *v5;
  uint64_t v6;
  NSString *requiredType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendableObjectTypeRule;
  v5 = -[HRERule _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requiredType = v5->_requiredType;
    v5->_requiredType = (NSString *)v6;

  }
  return v5;
}

+ (id)ruleWithRequiredType:(id)a3
{
  id v3;
  HRERecommendableObjectTypeRule *v4;

  v3 = a3;
  v4 = -[HRERecommendableObjectTypeRule initWithRequiredType:]([HRERecommendableObjectTypeRule alloc], "initWithRequiredType:", v3);

  return v4;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x24BDBCF20];
  -[HRERecommendableObjectTypeRule requiredType](self, "requiredType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_types:notMatchedByObjects:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v10, "count") == 0;
  return (char)self;
}

- (BOOL)passesWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = (void *)MEMORY[0x24BDBCF20];
  -[HRERecommendableObjectTypeRule requiredType](self, "requiredType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF20];
  v15 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_types:notMatchedByObjects:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v13, "count") == 0;

  return (char)v4;
}

- (NSString)requiredType
{
  return self->_requiredType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredType, 0);
}

@end
