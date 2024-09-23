@implementation HMDNotificationRegistryRequest

- (HMDNotificationRegistryRequest)initWithEnable:(BOOL)a3 userID:(id)a4
{
  id v6;
  HMDNotificationRegistryRequest *v7;
  HMDNotificationRegistryRequest *v8;
  uint64_t v9;
  NSString *userID;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNotificationRegistryRequest;
  v7 = -[HMDNotificationRegistryRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_enable = a3;
    v9 = objc_msgSend(v6, "copy");
    userID = v8->_userID;
    v8->_userID = (NSString *)v9;

  }
  return v8;
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
  id v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryRequest enable](self, "enable");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Enable"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNotificationRegistryRequest userID](self, "userID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("User ID"), v8);
  objc_msgSend(v3, "addObject:", v9);

  if (-[HMDNotificationRegistryRequest retryCount](self, "retryCount") >= 1)
  {
    v10 = objc_alloc(MEMORY[0x1E0D28548]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDNotificationRegistryRequest retryCount](self, "retryCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Retry Count"), v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (BOOL)enable
{
  return self->_enable;
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
