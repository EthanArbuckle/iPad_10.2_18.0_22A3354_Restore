@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo)initWithActivity:(id)a3 options:(id)a4 databaseChangeToken:(id)a5 promise:(id)a6 xpcActivity:(id)a7 database:(id)a8 useAnonymousRequests:(BOOL)a9 recordIDs:(id)a10 lastSynchronizedRecordIDs:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  uint64_t v47;
  NSSet *requestedRecordIDs;
  uint64_t v49;
  NSDictionary *zoneInfoMap;
  uint64_t v51;
  NSMutableSet *modifiedRecordIDs;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v53;
  id v55;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  id v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  obj = a5;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  objc_msgSend(a8, "container");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72.receiver = self;
  v72.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
  v63 = v20;
  v25 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper initWithActivity:options:container:useAnonymousRequests:promise:](&v72, sel_initWithActivity_options_container_useAnonymousRequests_promise_, v17, v18, v24, a9, v20);

  if (v25)
  {
    v62 = v23;
    v58 = v19;
    v59 = v18;
    v60 = v17;
    if (v21)
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper operationGroup](v25, "operationGroup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setXpcActivity:", v21);

    }
    v56 = v25;
    v57 = v21;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v55 = v22;
    v29 = v22;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v69 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v34, "zoneID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v35);
          v36 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo *)objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            v36 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo initWithZoneID:]([HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo alloc], "initWithZoneID:", v35);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, v35);
          }
          -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorZoneInfo recordIDs](v36, "recordIDs");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v31);
    }

    v38 = (void *)objc_msgSend(v29, "mutableCopy");
    objc_msgSend(v38, "minusSet:", v23);
    v39 = objc_msgSend(v38, "count");
    if (v39)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v40 = v38;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v42; ++j)
          {
            if (*(_QWORD *)v65 != v43)
              objc_enumerationMutation(v40);
            objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "zoneID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "forceRefresh");

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        }
        while (v42);
      }

      v23 = v62;
    }
    v47 = objc_msgSend(v29, "copy");
    v25 = v56;
    requestedRecordIDs = v56->_requestedRecordIDs;
    v56->_requestedRecordIDs = (NSSet *)v47;

    v49 = objc_msgSend(v28, "copy");
    zoneInfoMap = v56->_zoneInfoMap;
    v56->_zoneInfoMap = (NSDictionary *)v49;

    objc_storeStrong((id *)&v56->_databaseChangeToken, obj);
    objc_storeStrong((id *)&v56->_originalDatabaseChangeToken, obj);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v51 = objc_claimAutoreleasedReturnValue();
    modifiedRecordIDs = v56->_modifiedRecordIDs;
    v56->_modifiedRecordIDs = (NSMutableSet *)v51;

    v56->_zonesHaveChanged = v39 != 0;
    v53 = v56;

    v18 = v59;
    v17 = v60;
    v21 = v57;
    v19 = v58;
    v22 = v55;
  }

  return v25;
}

- (void)markZonesChanged
{
  self->_zonesHaveChanged = 1;
}

- (void)markZonesDeleted
{
  self->_zonesWereDeleted = 1;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo zoneInfoMap](self, "zoneInfoMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "mirroredLocalZone");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "mirroredLocalZone");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v17);

          objc_msgSend(v15, "setMirroredLocalZone:", 0);
        }
        else
        {
          objc_msgSend(v15, "cloudZone");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            continue;
          objc_msgSend(v15, "cloudZone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);

        }
        objc_msgSend(v15, "setCloudZone:", 0);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v20 = (void *)objc_msgSend(v7, "copy");
    v21 = (void *)objc_msgSend(v8, "copy");
    v22 = v23;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo __cleanupMirroredZones:cloudZones:result:error:](self, "__cleanupMirroredZones:cloudZones:result:error:", v20, v21, v23, v6);

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
    v22 = v23;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper finishWithResult:error:](&v24, sel_finishWithResult_error_, v23, v6);
  }

}

- (void)__cleanupMirroredZones:(id)a3 cloudZones:(id)a4 result:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v20;
  NSObject *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v34;
  NSObject *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id obj;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v47 = a5;
  v46 = a6;
  v48 = v11;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v11, "count") + objc_msgSend(v10, "count"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v61;
    v15 = CFSTR("Shutting down mirrored zone %@");
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](self, "activity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "markWithFormat:", v15, v17);

        v19 = (void *)MEMORY[0x227676638]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = v13;
          v23 = v15;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v66 = v24;
          v67 = 2112;
          v68 = v17;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Shutting down mirrored zone %@", buf, 0x16u);

          v15 = v23;
          v13 = v22;
        }

        objc_autoreleasePoolPop(v19);
        objc_msgSend(v17, "shutdown");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v25);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v13);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v49 = v48;
  v26 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v57;
    v29 = CFSTR("Shutting down cloud zone %@");
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v57 != v28)
          objc_enumerationMutation(v49);
        v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](self, "activity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "markWithFormat:", v29, v31);

        v33 = (void *)MEMORY[0x227676638]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = v29;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v66 = v37;
          v67 = 2112;
          v68 = v31;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Shutting down cloud zone %@", buf, 0x16u);

          v29 = v36;
        }

        objc_autoreleasePoolPop(v33);
        objc_msgSend(v31, "shutdown");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v38);

      }
      v27 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v27);
  }

  v39 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "combineAllFutures:ignoringErrors:scheduler:", v51, 1, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke;
  v52[3] = &unk_24E79AC80;
  v52[4] = self;
  v53 = v49;
  v54 = v47;
  v55 = v46;
  v42 = v46;
  v43 = v47;
  v44 = v49;
  v45 = (id)objc_msgSend(v41, "addSuccessBlock:", v52);

}

- (NSSet)requestedRecordIDs
{
  return self->_requestedRecordIDs;
}

- (NSDictionary)zoneInfoMap
{
  return self->_zoneInfoMap;
}

- (CKServerChangeToken)databaseChangeToken
{
  return self->_databaseChangeToken;
}

- (void)setDatabaseChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_databaseChangeToken, a3);
}

- (CKServerChangeToken)originalDatabaseChangeToken
{
  return self->_originalDatabaseChangeToken;
}

- (void)setOriginalDatabaseChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_originalDatabaseChangeToken, a3);
}

- (NSMutableSet)modifiedRecordIDs
{
  return self->_modifiedRecordIDs;
}

- (BOOL)zonesHaveChanged
{
  return self->_zonesHaveChanged;
}

- (BOOL)zonesWereDeleted
{
  return self->_zonesWereDeleted;
}

- (NSArray)signatureVerificationPublicKeys
{
  return self->_signatureVerificationPublicKeys;
}

- (void)setSignatureVerificationPublicKeys:(id)a3
{
  objc_storeStrong((id *)&self->_signatureVerificationPublicKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureVerificationPublicKeys, 0);
  objc_storeStrong((id *)&self->_modifiedRecordIDs, 0);
  objc_storeStrong((id *)&self->_originalDatabaseChangeToken, 0);
  objc_storeStrong((id *)&self->_databaseChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneInfoMap, 0);
  objc_storeStrong((id *)&self->_requestedRecordIDs, 0);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[5];
  id v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke_2;
  v8[3] = &unk_24E7958D8;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo;
  objc_msgSendSuper2(&v7, sel_finishWithResult_error_, v5, v6);

}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo___cleanupMirroredZones_cloudZones_result_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markWithFormat:", CFSTR("Failed to shut down zone %@: %@"), v9, v7);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down zone %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

@end
