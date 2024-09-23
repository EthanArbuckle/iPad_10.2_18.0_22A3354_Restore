@implementation NNMKSyncSessionController

- (NNMKSyncSessionController)init
{
  NNMKSyncSessionController *v2;
  NSMutableSet *v3;
  NSMutableSet *messageIdsToIgnoreStatusUpdates;
  NSMutableDictionary *v5;
  NSMutableDictionary *notificationPayloadAcks;
  NSMutableDictionary *v7;
  NSMutableDictionary *syncingAccountIdentityByUsername;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *standaloneStateByAccountId;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NNMKSyncSessionController;
  v2 = -[NNMKSyncSessionController init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    messageIdsToIgnoreStatusUpdates = v2->_messageIdsToIgnoreStatusUpdates;
    v2->_messageIdsToIgnoreStatusUpdates = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    notificationPayloadAcks = v2->_notificationPayloadAcks;
    v2->_notificationPayloadAcks = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    syncingAccountIdentityByUsername = v2->_syncingAccountIdentityByUsername;
    v2->_syncingAccountIdentityByUsername = v7;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("kSessionControllerStandaloneState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    standaloneStateByAccountId = v2->_standaloneStateByAccountId;
    v2->_standaloneStateByAccountId = (NSMutableDictionary *)v11;

    if (!v2->_standaloneStateByAccountId)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v14 = v2->_standaloneStateByAccountId;
      v2->_standaloneStateByAccountId = v13;

    }
  }
  return v2;
}

- (void)setAccountAuthRequestLastRequestTime:(double)a3
{
  self->_accountAuthRequestLastRequestTime = a3;
}

- (double)accountAuthRequestLastRequestTime
{
  return self->_accountAuthRequestLastRequestTime;
}

- (unint64_t)standaloneStateForAccountId:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_standaloneStateByAccountId, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)updateStandaloneState:(unint64_t)a3 forAccountId:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_standaloneStateByAccountId, "setObject:forKeyedSubscript:", v8, v7);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", self->_standaloneStateByAccountId, CFSTR("kSessionControllerStandaloneState"));

}

- (void)deleteStandaloneStateForAccountId:(id)a3
{
  id v4;

  if (a3)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_standaloneStateByAccountId, "removeObjectForKey:");
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", self->_standaloneStateByAccountId, CFSTR("kSessionControllerStandaloneState"));

  }
}

- (NSMutableSet)messageIdsToIgnoreStatusUpdates
{
  return self->_messageIdsToIgnoreStatusUpdates;
}

- (void)setMessageIdsToIgnoreStatusUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdsToIgnoreStatusUpdates, a3);
}

- (NSMutableDictionary)notificationPayloadAcks
{
  return self->_notificationPayloadAcks;
}

- (void)setNotificationPayloadAcks:(id)a3
{
  objc_storeStrong((id *)&self->_notificationPayloadAcks, a3);
}

- (NSMutableDictionary)syncingAccountIdentityByUsername
{
  return self->_syncingAccountIdentityByUsername;
}

- (void)setSyncingAccountIdentityByUsername:(id)a3
{
  objc_storeStrong((id *)&self->_syncingAccountIdentityByUsername, a3);
}

- (NSMutableDictionary)standaloneStateByAccountId
{
  return self->_standaloneStateByAccountId;
}

- (void)setStandaloneStateByAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_standaloneStateByAccountId, a3);
}

- (NSDate)lastSyncDueToMailboxesMismatchRequestTime
{
  return self->_lastSyncDueToMailboxesMismatchRequestTime;
}

- (void)setLastSyncDueToMailboxesMismatchRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSyncDueToMailboxesMismatchRequestTime, a3);
}

- (BOOL)deviceInStandalone
{
  return self->_deviceInStandalone;
}

- (void)setDeviceInStandalone:(BOOL)a3
{
  self->_deviceInStandalone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDueToMailboxesMismatchRequestTime, 0);
  objc_storeStrong((id *)&self->_standaloneStateByAccountId, 0);
  objc_storeStrong((id *)&self->_syncingAccountIdentityByUsername, 0);
  objc_storeStrong((id *)&self->_notificationPayloadAcks, 0);
  objc_storeStrong((id *)&self->_messageIdsToIgnoreStatusUpdates, 0);
}

@end
