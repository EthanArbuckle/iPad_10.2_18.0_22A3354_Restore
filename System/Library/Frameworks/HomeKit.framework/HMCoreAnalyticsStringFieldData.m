@implementation HMCoreAnalyticsStringFieldData

- (HMCoreAnalyticsStringFieldData)initWithName:(id)a3 stringValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCoreAnalyticsStringFieldData *v9;
  HMMissingWalletKeyValue *v11;
  SEL v12;
  id v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v15.receiver = self;
    v15.super_class = (Class)HMCoreAnalyticsStringFieldData;
    v9 = -[HMCoreAnalyticsFieldData initWithName:value:](&v15, sel_initWithName_value_, v6, v7);

    return v9;
  }
  else
  {
    v11 = (HMMissingWalletKeyValue *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsStringFieldData *)-[HMMissingWalletKeyValue initWithAccessoryUUID:userUUID:](v11, v12, v13, v14);
  }
}

@end
