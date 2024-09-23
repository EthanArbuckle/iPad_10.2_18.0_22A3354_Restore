@implementation SKAnalytics

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SKAnalytics_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher != -1)
    dispatch_once(&instance_dispatcher, block);
  return (id)instance_sharedInstance;
}

void __23__SKAnalytics_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance_sharedInstance;
  instance_sharedInstance = (uint64_t)v1;

}

- (id)getBundleID
{
  NSString *bundleID;
  void *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  bundleID = self->_bundleID;
  if (!bundleID)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_bundleID;
    self->_bundleID = v5;

    bundleID = self->_bundleID;
    if (!bundleID)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "processName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_bundleID;
      self->_bundleID = v8;

      bundleID = self->_bundleID;
    }
  }
  return bundleID;
}

- (void)sendAnalyticsDataWithKey:(id)a3
{
  AnalyticsSendEventLazy();
}

id __40__SKAnalytics_sendAnalyticsDataWithKey___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v6 = CFSTR("bundleID");
  objc_msgSend(*(id *)(a1 + 32), "getBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
