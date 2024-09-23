@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo)initWithZoneID:(id)a3
{
  id v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *v7;
  uint64_t v8;
  NSMutableSet *recordIDs;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo;
  v6 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_zoneID, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    recordIDs = v7->_recordIDs;
    v7->_recordIDs = (NSMutableSet *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)markChanged
{
  self->_zoneHasChanged = 1;
}

- (void)markDeleted
{
  self->_zoneWasDeleted = 1;
}

- (void)forceRefresh
{
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo markChanged](self, "markChanged");
  self->_ignoreChangeToken = 1;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (NSMutableSet)recordIDs
{
  return self->_recordIDs;
}

- (BOOL)zoneHasChanged
{
  return self->_zoneHasChanged;
}

- (BOOL)zoneWasDeleted
{
  return self->_zoneWasDeleted;
}

- (BOOL)ignoreChangeToken
{
  return self->_ignoreChangeToken;
}

- (HMDNetworkRouterFirewallRuleCloudZone)cloudZone
{
  return self->_cloudZone;
}

- (void)setCloudZone:(id)a3
{
  objc_storeStrong((id *)&self->_cloudZone, a3);
}

- (HMBLocalZone)mirroredLocalZone
{
  return self->_mirroredLocalZone;
}

- (void)setMirroredLocalZone:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
