@implementation HREActionVariance

- (id)_initWithKey:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionVariance;
  v6 = -[HRERule _init](&v9, sel__init);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (BOOL)passesForAction:(id)a3
{
  return 0;
}

+ (id)varianceKeyForAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "characteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "characteristicType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRECharacteristicActionVarianceRule varianceKeyForCharacteristicType:](HRECharacteristicActionVarianceRule, "varianceKeyForCharacteristicType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
