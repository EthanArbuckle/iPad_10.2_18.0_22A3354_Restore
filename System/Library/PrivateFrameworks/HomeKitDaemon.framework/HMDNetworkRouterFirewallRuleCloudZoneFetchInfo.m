@implementation HMDNetworkRouterFirewallRuleCloudZoneFetchInfo

- (HMDNetworkRouterFirewallRuleCloudZoneFetchInfo)initWithOptions:(id)a3 changeToken:(id)a4 promise:(id)a5 database:(id)a6 useAnonymousRequests:(BOOL)a7 interestedRecordIDs:(id)a8 mirrorInput:(id)a9
{
  _BOOL8 v10;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *v24;
  HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v10 = a7;
  v29 = a4;
  v28 = a8;
  v27 = a9;
  v16 = (objc_class *)MEMORY[0x24BE3F138];
  v17 = a6;
  v18 = a5;
  v19 = a3;
  v20 = [v16 alloc];
  objc_msgSend(v19, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithName:", v21);

  objc_msgSend(v17, "container");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30.receiver = self;
  v30.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZoneFetchInfo;
  v24 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper initWithActivity:options:container:useAnonymousRequests:promise:](&v30, sel_initWithActivity_options_container_useAnonymousRequests_promise_, v22, v19, v23, v10, v18);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_changeToken, a4);
    objc_storeStrong((id *)&v24->_originalChangeToken, a4);
    objc_storeStrong((id *)&v24->_interestedRecordIDs, a8);
    objc_storeStrong((id *)&v24->_mirrorInput, a9);
    v25 = v24;
  }

  return v24;
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleCloudZoneFetchInfo mirrorInput](self, "mirrorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "abort");

  v6.receiver = self;
  v6.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZoneFetchInfo;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper finishWithError:](&v6, sel_finishWithError_, v4);

}

- (NSSet)interestedRecordIDs
{
  return self->_interestedRecordIDs;
}

- (CKServerChangeToken)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_changeToken, a3);
}

- (CKServerChangeToken)originalChangeToken
{
  return self->_originalChangeToken;
}

- (HMBLocalZoneMirrorInput)mirrorInput
{
  return self->_mirrorInput;
}

- (void)setMirrorInput:(id)a3
{
  objc_storeStrong((id *)&self->_mirrorInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorInput, 0);
  objc_storeStrong((id *)&self->_originalChangeToken, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_interestedRecordIDs, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_189569 != -1)
    dispatch_once(&logCategory__hmf_once_t0_189569, &__block_literal_global_189570);
  return (id)logCategory__hmf_once_v1_189571;
}

void __61__HMDNetworkRouterFirewallRuleCloudZoneFetchInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_189571;
  logCategory__hmf_once_v1_189571 = v0;

}

@end
