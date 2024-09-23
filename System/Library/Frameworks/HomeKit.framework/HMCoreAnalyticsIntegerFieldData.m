@implementation HMCoreAnalyticsIntegerFieldData

- (HMCoreAnalyticsIntegerFieldData)initWithName:(id)a3 integerValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HMCoreAnalyticsIntegerFieldData *v9;
  HMHome *v11;
  SEL v12;
  objc_super v13;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)HMCoreAnalyticsIntegerFieldData;
    v9 = -[HMCoreAnalyticsFieldData initWithName:value:](&v13, sel_initWithName_value_, v7, v8);

    return v9;
  }
  else
  {
    v11 = (HMHome *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsIntegerFieldData *)-[HMHome init](v11, v12);
  }
}

@end
