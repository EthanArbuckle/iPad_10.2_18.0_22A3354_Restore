@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo)initWithActivity:(id)a3 options:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 zoneID:(id)a8 recordID:(id)a9 desiredKeys:(id)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo *v22;
  uint64_t v23;
  NSMutableSet *records;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo *v25;
  id v27;
  id v28;
  objc_super v29;

  v11 = a7;
  v28 = a8;
  v27 = a9;
  v17 = a10;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(a6, "container");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo;
  v22 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper initWithActivity:options:container:useAnonymousRequests:promise:](&v29, sel_initWithActivity_options_container_useAnonymousRequests_promise_, v20, v19, v21, v11, v18);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_zoneID, a8);
    objc_storeStrong((id *)&v22->_recordID, a9);
    objc_storeStrong((id *)&v22->_desiredKeys, a10);
    objc_msgSend(MEMORY[0x1E0C99E20], "set", v27, v28);
    v23 = objc_claimAutoreleasedReturnValue();
    records = v22->_records;
    v22->_records = (NSMutableSet *)v23;

    v25 = v22;
  }

  return v22;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (NSMutableSet)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
