@implementation HMDNotificationRegistryRequest

- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v9;
  id v10;
  HMDNotificationRegistryRequest *v11;
  HMDNotificationRegistryRequest *v12;
  uint64_t v13;
  NSString *deviceIdsDestination;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNotificationRegistryRequest;
  v11 = -[HMDNotificationRegistryRequest init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_enable = a3;
    objc_storeStrong((id *)&v11->_user, a4);
    v13 = objc_msgSend(v10, "copy");
    deviceIdsDestination = v12->_deviceIdsDestination;
    v12->_deviceIdsDestination = (NSString *)v13;

  }
  return v12;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryRequest enable](self, "enable");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Enable"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryRequest user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("User"), v9);
  objc_msgSend(v3, "addObject:", v10);

  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNotificationRegistryRequest deviceIdsDestination](self, "deviceIdsDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Device IDS Destination"), v12);
  objc_msgSend(v3, "addObject:", v13);

  if (-[HMDNotificationRegistryRequest retryCount](self, "retryCount") >= 1)
  {
    v14 = objc_alloc(MEMORY[0x24BE3F140]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDNotificationRegistryRequest retryCount](self, "retryCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Retry Count"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (BOOL)enable
{
  return self->_enable;
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDUser)user
{
  return (HMDUser *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
}

@end
