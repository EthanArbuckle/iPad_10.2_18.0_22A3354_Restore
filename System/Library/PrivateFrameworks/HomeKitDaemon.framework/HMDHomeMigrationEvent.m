@implementation HMDHomeMigrationEvent

- (HMDHomeMigrationEvent)initWithModel:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  HMDHomeMigrationEvent *v11;
  HMDHomeMigrationEvent *v12;
  HMDHomeMigrationEvent *v14;
  SEL v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v14 = (HMDHomeMigrationEvent *)_HMFPreconditionFailure();
    return (HMDHomeMigrationEvent *)-[HMDHomeMigrationEvent coreAnalyticsEventName](v14, v15);
  }
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HMDHomeMigrationEvent;
  v11 = -[HMMLogEvent init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, v10);
    objc_storeStrong((id *)&v12->_reason, a4);
  }

  return v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HMDHomeMigrationEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("modelClass");
  -[HMDHomeMigrationEvent model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("reason");
  v8[0] = v3;
  -[HMDHomeMigrationEvent reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeMigrationEvent model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("model"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDHomeMigrationEvent reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("reason"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
