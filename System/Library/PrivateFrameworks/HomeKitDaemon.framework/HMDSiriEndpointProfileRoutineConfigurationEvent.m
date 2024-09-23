@implementation HMDSiriEndpointProfileRoutineConfigurationEvent

- (HMDSiriEndpointProfileRoutineConfigurationEvent)initWithAccessoryCategoryType:(id)a3 profileFields:(id)a4 accessorySettingFields:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDSiriEndpointProfileRoutineConfigurationEvent *v13;
  HMDSiriEndpointProfileRoutineConfigurationEvent *v14;
  HMDSiriEndpointProfileRoutineConfigurationEvent *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMDSiriEndpointProfileRoutineConfigurationEvent *)_HMFPreconditionFailure();
    return (HMDSiriEndpointProfileRoutineConfigurationEvent *)-[HMDSiriEndpointProfileRoutineConfigurationEvent coreAnalyticsEventDictionary](v16, v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDSiriEndpointProfileRoutineConfigurationEvent;
  v13 = -[HMMLogEvent init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryCategoryType, a3);
    objc_storeStrong((id *)&v14->_profileFields, a4);
    objc_storeStrong((id *)&v14->_accessorySettingFields, a5);
  }

  return v14;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = CFSTR("accessoryCategoryType");
  -[HMDSiriEndpointProfileRoutineConfigurationEvent accessoryCategoryType](self, "accessoryCategoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  -[HMDSiriEndpointProfileRoutineConfigurationEvent profileFields](self, "profileFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializeFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  -[HMDSiriEndpointProfileRoutineConfigurationEvent accessorySettingFields](self, "accessorySettingFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serializeFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.HMDSiriEndpointProfileRoutineConfigurationEvent");
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
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSiriEndpointProfileRoutineConfigurationEvent accessoryCategoryType](self, "accessoryCategoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("accessoryCategoryType"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSiriEndpointProfileRoutineConfigurationEvent profileFields](self, "profileFields", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("profileFields"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSiriEndpointProfileRoutineConfigurationEvent accessorySettingFields](self, "accessorySettingFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("accessorySettingFields"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)accessoryCategoryType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMDSiriEndpointProfileFields)profileFields
{
  return (HMDSiriEndpointProfileFields *)objc_getProperty(self, a2, 48, 1);
}

- (HMDSiriEndpointProfileAccessorySettingFields)accessorySettingFields
{
  return (HMDSiriEndpointProfileAccessorySettingFields *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingFields, 0);
  objc_storeStrong((id *)&self->_profileFields, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
}

@end
