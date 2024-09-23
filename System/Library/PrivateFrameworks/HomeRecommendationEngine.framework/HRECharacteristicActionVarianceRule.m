@implementation HRECharacteristicActionVarianceRule

- (id)_initWithType:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "varianceKeyForCharacteristicType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HRECharacteristicActionVarianceRule;
  v7 = -[HREActionVariance _initWithKey:](&v9, sel__initWithKey_, v6);

  if (v7)
    objc_storeStrong(v7 + 2, a3);

  return v7;
}

+ (id)varianceKeyForCharacteristicType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("characteristic:%@"), a3);
}

+ (id)anyVarianceRuleForCharacteristicType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "varianceKeyForCharacteristicType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HREActionAnyVarianceRule anyVarianceRuleWithKey:](HREActionAnyVarianceRule, "anyVarianceRuleWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)passesForAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRECharacteristicActionVarianceRule characteristicType](self, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
