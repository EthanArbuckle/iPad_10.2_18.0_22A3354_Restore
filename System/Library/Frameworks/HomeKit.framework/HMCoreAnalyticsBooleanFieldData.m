@implementation HMCoreAnalyticsBooleanFieldData

- (HMCoreAnalyticsBooleanFieldData)initWithName:(id)a3 BOOLValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  HMCoreAnalyticsBooleanFieldData *v9;
  HMAccessCodeManager *v11;
  SEL v12;
  id v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)HMCoreAnalyticsBooleanFieldData;
    v9 = -[HMCoreAnalyticsFieldData initWithName:value:](&v14, sel_initWithName_value_, v7, v8);

    return v9;
  }
  else
  {
    v11 = (HMAccessCodeManager *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsBooleanFieldData *)-[HMAccessCodeManager initWithHome:](v11, v12, v13);
  }
}

@end
