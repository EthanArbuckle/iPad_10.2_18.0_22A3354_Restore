@implementation HMCoreAnalyticsFieldData

- (HMCoreAnalyticsFieldData)initWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMCoreAnalyticsFieldData *v7;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCoreAnalyticsFieldData initWithName:value:](self, "initWithName:value:", v5, v6);

  return v7;
}

- (HMCoreAnalyticsFieldData)initWithName:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMCoreAnalyticsFieldData *v10;
  HMCoreAnalyticsFieldData *v11;
  HMCoreAnalyticsFieldData *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMCoreAnalyticsFieldData *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsFieldData *)-[HMCoreAnalyticsFieldData name](v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMCoreAnalyticsFieldData;
  v10 = -[HMCoreAnalyticsFieldData init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    objc_storeStrong((id *)&v11->_value, a4);
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSObject)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
