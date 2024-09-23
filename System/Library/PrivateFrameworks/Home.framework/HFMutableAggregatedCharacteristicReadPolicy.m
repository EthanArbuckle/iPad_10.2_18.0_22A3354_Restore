@implementation HFMutableAggregatedCharacteristicReadPolicy

- (id)popPolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeLastObject");
  v7 = (void *)objc_msgSend(v6, "copy");
  -[HFMutableAggregatedCharacteristicReadPolicy setPolicies:](self, "setPolicies:", v7);

  return v4;
}

- (void)pushPolicy:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMutableAggregatedCharacteristicReadPolicy setPolicies:](self, "setPolicies:", v5);
}

- (void)setPolicies:(id)a3
{
  objc_storeStrong((id *)&self->super._policies, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFAggregatedCharacteristicReadPolicy *v4;
  void *v5;
  HFAggregatedCharacteristicReadPolicy *v6;

  v4 = [HFAggregatedCharacteristicReadPolicy alloc];
  -[HFAggregatedCharacteristicReadPolicy policies](self, "policies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFAggregatedCharacteristicReadPolicy initWithPolicies:](v4, "initWithPolicies:", v5);

  return v6;
}

@end
