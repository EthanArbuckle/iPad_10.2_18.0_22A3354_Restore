@implementation HMDBackingStoreCacheGroup

- (HMDBackingStoreCacheGroup)initWithGroupID:(int64_t)a3 zone:(id)a4 rootRecord:(id)a5 serverChangeToken:(id)a6 subscriptionName:(id)a7 owner:(id)a8 subscription:(id)a9
{
  id v15;
  id v16;
  id v17;
  HMDBackingStoreCacheGroup *v18;
  HMDBackingStoreCacheGroup *v19;
  HMDBackingStoreCacheGroup *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v15 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HMDBackingStoreCacheGroup;
  v18 = -[HMDBackingStoreCacheGroup init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_groupID = a3;
    objc_storeWeak((id *)&v18->_zone, v15);
    objc_storeStrong((id *)&v19->_rootRecordName, a5);
    objc_storeStrong((id *)&v19->_serverChangeToken, a6);
    objc_storeStrong((id *)&v19->_subscriptionName, a7);
    objc_storeStrong((id *)&v19->_owner, a8);
    objc_storeStrong((id *)&v19->_subscription, a9);
    v20 = v19;
  }

  return v19;
}

- (id)dumpDebug
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("zone_group: %lu (%p)\n"), -[HMDBackingStoreCacheGroup groupID](self, "groupID"), self);
  -[HMDBackingStoreCacheGroup zone](self, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  zone: %p\n"), v4);

  -[HMDBackingStoreCacheGroup rootRecordName](self, "rootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  root: %@\n"), v5);

  -[HMDBackingStoreCacheGroup owner](self, "owner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  owner: %@\n"), v6);

  -[HMDBackingStoreCacheGroup subscriptionName](self, "subscriptionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  subs: %@\n"), v7);

  -[HMDBackingStoreCacheGroup serverChangeToken](self, "serverChangeToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  token: %@\n"), v8);

  -[HMDBackingStoreCacheGroup subscription](self, "subscription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  subscription: %@\n"), v9);

  return v3;
}

- (int64_t)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int64_t)a3
{
  self->_groupID = a3;
}

- (HMDBackingStoreCacheZone)zone
{
  return (HMDBackingStoreCacheZone *)objc_loadWeakRetained((id *)&self->_zone);
}

- (NSString)rootRecordName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CKServerChangeToken)serverChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerChangeToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)subscriptionName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (CKRecordZoneSubscription)subscription
{
  return (CKRecordZoneSubscription *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubscription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_rootRecordName, 0);
  objc_destroyWeak((id *)&self->_zone);
}

@end
