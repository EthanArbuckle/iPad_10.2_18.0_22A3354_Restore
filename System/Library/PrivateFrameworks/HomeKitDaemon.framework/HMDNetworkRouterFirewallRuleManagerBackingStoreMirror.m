@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirror

- (BOOL)__shouldFailCloudRecordFetchError:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v28;
  NSObject *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v34;
  _BYTE *v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "hmbIsCKZoneDeletedError"))
  {
    objc_msgSend(v6, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markWithFormat:", CFSTR("Zone '%@' does not exist"), v10);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "zoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmbDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Zone '%@' does not exist", buf, 0x16u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v11);
    v23 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "hmbIsCloudKitError"))
  {
    if (objc_msgSend(v7, "code") == 11)
    {
      objc_msgSend(v6, "activity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hmbDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "markWithFormat:", CFSTR("Record '%@' does not exist"), v19);

      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hmbDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Record '%@' does not exist", buf, 0x16u);

      }
      goto LABEL_9;
    }
    if (objc_msgSend(v7, "code") == 2)
    {
      objc_msgSend(v7, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EE8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 0;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __116__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____shouldFailCloudRecordFetchError_error___block_invoke;
      v32[3] = &unk_24E773300;
      v33 = v6;
      v34 = self;
      v35 = buf;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v32);
      v23 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

      _Block_object_dispose(buf, 8);
      goto LABEL_15;
    }
  }
  objc_msgSend(v6, "activity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "markWithFormat:", CFSTR("Failed to fetch records: %@"), v7);

  v27 = (void *)MEMORY[0x227676638]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  v23 = 1;
LABEL_15:

  return v23;
}

- (void)__fetchCloudRecordsWithFetchInfo:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v6, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __fetchRecordByID:](self, "__fetchRecordByID:", v6);
  else
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __fetchRecordsByQuery:](self, "__fetchRecordsByQuery:", v6);

}

- (void)__fetchRecordByID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmbDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markWithFormat:", CFSTR("Fetching record: %@"), v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmbDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching record: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x24BDB90E8]);
  objc_msgSend(v4, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithRecordIDs:", v17);

  objc_msgSend(v18, "setCallbackQueue:", v5);
  objc_msgSend(v4, "operationGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setGroup:", v19);

  objc_msgSend(v4, "desiredKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "activity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "desiredKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markWithFormat:", CFSTR("Only fetching specific fields: %@"), v22);

    v23 = (void *)MEMORY[0x227676638]();
    v24 = v10;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "desiredKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Only fetching specific fields: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v4, "desiredKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDesiredKeys:", v28);

  }
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke;
  v33[3] = &unk_24E77E578;
  v34 = v4;
  v35 = v5;
  v36 = v10;
  v29 = v5;
  v30 = v4;
  objc_msgSend(v18, "setFetchRecordsCompletionBlock:", v33);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v10, "cloudDatabase");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "publicDatabase");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addOperation:", v18);

}

- (void)__fetchRecordsByQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v4, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markWithFormat:", CFSTR("Fetching records from zone %@"), v10);

    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmbDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records from zone %@", buf, 0x16u);

  }
  else
  {
    objc_msgSend(v7, "markWithFormat:", CFSTR("Fetching all records"));

    v11 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all records", buf, 0xCu);
  }

LABEL_7:
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v4, "desiredKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "activity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "desiredKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "markWithFormat:", CFSTR("Only fetching specific fields: %@"), v20);

    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "desiredKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Only fetching specific fields: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91B8]), "initWithRecordType:predicate:", CFSTR("CD_CloudAccessory"), v26);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91C8]), "initWithQuery:", v27);
  objc_msgSend(v4, "zoneID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "zoneID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setZoneID:", v30);

  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __startQueryOperation:operation:](self, "__startQueryOperation:operation:", v4, v28);

}

- (void)__startQueryOperation:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;

  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);
  objc_msgSend(v7, "setCallbackQueue:", v8);
  objc_msgSend(v6, "operationGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGroup:", v9);

  objc_msgSend(v6, "desiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "desiredKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDesiredKeys:", v11);

  }
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke;
  v23[3] = &unk_24E773328;
  v13 = v6;
  v24 = v13;
  v14 = v8;
  v25 = v14;
  objc_msgSend(v7, "setRecordFetchedBlock:", v23);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_3;
  v19[3] = &unk_24E773350;
  v20 = v13;
  v21 = v14;
  v22 = self;
  v15 = v14;
  v16 = v13;
  objc_msgSend(v7, "setQueryCompletionBlock:", v19);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "publicDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v7);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_2;
  v6[3] = &unk_24E79BBD0;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_4;
  v10[3] = &unk_24E79AD20;
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v10);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40)
    && objc_msgSend(*(id *)(a1 + 48), "__shouldFailCloudRecordFetchError:error:", *(_QWORD *)(a1 + 56)))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(void **)(a1 + 56);
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 56), "activity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "markWithFormat:", CFSTR("Previous fetch completed successfully, now fetching more records from cursor"));

      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Previous fetch completed successfully, now fetching more records from cursor", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91C8]), "initWithCursor:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 48), "__startQueryOperation:operation:", *(_QWORD *)(a1 + 56), v13);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "records");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v7, "finishWithResult:", v14);

    }
  }
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____startQueryOperation_operation___block_invoke_2(uint64_t a1)
{
  id v2;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "records");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));

}

void __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke_2;
  v10[3] = &unk_24E79AD20;
  v11 = *(id *)(a1 + 40);
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v10);

}

void __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____fetchRecordByID___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40)
    && objc_msgSend(*(id *)(a1 + 48), "__shouldFailCloudRecordFetchError:error:", *(_QWORD *)(a1 + 56)))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch records: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(void **)(a1 + 64);
    v8 = (void *)MEMORY[0x24BDBCF20];
    if (v7)
    {
      objc_msgSend(v7, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v10);

  }
}

void __116__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchCloudRecords____shouldFailCloudRecordFetchError_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "hmbIsCloudKitError") && objc_msgSend(v6, "code") == 11)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markWithFormat:", CFSTR("Record '%@' does not exist"), v8);

    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmbDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Record '%@' does not exist", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markWithFormat:", CFSTR("Failed to fetch record %@: %@"), v15, v6);

    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmbDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch record %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)__loadOrCreateInternalStateModelWithLocalZone:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v23;
  NSObject *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel modelID](HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v6, "fetchModelWithModelID:ofType:error:", v9, objc_opt_class(), &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "markWithFormat:", CFSTR("Loaded existing internal state model")));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Loaded existing internal state model", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastSynchronizedRecordIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Last synchronized recordIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "markWithFormat:", CFSTR("Creating new internal state model because existing one was not found: %@"), v11));
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Creating new internal state model because existing one was not found: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v10 = (void *)objc_opt_new();
  }

  return v10;
}

- (void)__startupWithLocalZone:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror isShuttingDown](self, "isShuttingDown"))
  {
    v9 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "markWithFormat:", CFSTR("Already shutting down")));
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Already shutting down", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror startupPromise](v10, "startupPromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v14);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "markWithFormat:", CFSTR("Starting up")));
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Starting up", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror setLocalZone:](v16, "setLocalZone:", v6);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __loadOrCreateInternalStateModelWithLocalZone:activity:](v16, "__loadOrCreateInternalStateModelWithLocalZone:activity:", v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror setInternalState:](v16, "setInternalState:", v19);

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror startupPromise](v16, "startupPromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithNoResult");
  }

  objc_msgSend(v7, "invalidate");
}

- (void)__shutdownWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror isShuttingDown](self, "isShuttingDown"))
  {
    v6 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "markWithFormat:", CFSTR("Already shutting down")));
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Already shutting down", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror shutdownFuture](v7, "shutdownFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke;
    v35[3] = &unk_24E798920;
    v36 = v4;
    v11 = v4;
    v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v35);

    v13 = v36;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "markWithFormat:", CFSTR("Shutting down")));
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Shutting down", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror setShuttingDown:](v15, "setShuttingDown:", 1);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror setLocalZone:](v15, "setLocalZone:", 0);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror startupPromise](v15, "startupPromise");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "finishWithError:", v19);

    if (v20)
    {
      v21 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "markWithFormat:", CFSTR("Shut down before startup completed")));
      v22 = v15;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Shut down before startup completed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror shutdownPromise](v15, "shutdownPromise");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v15, "cloudDatabase");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "shutdown");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_13;
    v30[3] = &unk_24E787968;
    v31 = v4;
    v32 = v5;
    v33 = v15;
    v34 = v25;
    v13 = v25;
    v28 = v4;
    v29 = (id)objc_msgSend(v27, "addCompletionBlock:", v30);

  }
}

uint64_t __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_2;
  v8[3] = &unk_24E79AD20;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v4;
  v6 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v7 = v4;
  objc_msgSend(v5, "performBlock:", v8);

}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_3;
  v6[3] = &unk_24E79A910;
  v2 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  dispatch_async(v2, v6);

}

void __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_4;
  v6[3] = &unk_24E79A910;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  objc_msgSend(v2, "performBlock:", v6);

}

uint64_t __91__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Lifecycle____shutdownWithActivity___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("Failed to shut down cloud database: %@"), v2));
    v4 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down cloud database: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
  v8 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("Shutdown completed")));
  v9 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Shutdown completed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)fetchVerificationCertificatesRecordWithOperationGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);
  objc_msgSend((id)objc_opt_class(), "__certificatesRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDB90E8]);
  v21[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithRecordIDs:", v11);

  objc_msgSend(v12, "setCallbackQueue:", v8);
  if (v6)
    objc_msgSend(v12, "setGroup:", v6);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __153__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates__fetchVerificationCertificatesRecordWithOperationGroup_completion___block_invoke;
  v17[3] = &unk_24E7801B0;
  v18 = v8;
  v19 = self;
  v20 = v7;
  v13 = v7;
  v14 = v8;
  objc_msgSend(v12, "setFetchRecordsCompletionBlock:", v17);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "publicDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v12);

}

- (void)__fetchVerificationCertificatesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  id v16;
  id location;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  objc_msgSend(v4, "operationGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke;
  v13 = &unk_24E780200;
  v7 = v4;
  v14 = v7;
  v15 = self;
  objc_copyWeak(&v16, &location);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror fetchVerificationCertificatesRecordWithOperationGroup:completion:](self, "fetchVerificationCertificatesRecordWithOperationGroup:completion:", v6, &v10);

  objc_msgSend(v7, "operationStartTime", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOperationStartTime:", v9);

  }
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)__fetchVerificationCertificatesCompleted:(id)a3 record:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "publicKeysFromCertificateRecord:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v8, "setSignatureVerificationPublicKeys:", v12);
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __fetchZoneChangesWithFetchInfo:](self, "__fetchZoneChangesWithFetchInfo:", v8);
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hmbDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v16;
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get any usable public keys from record: %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithError:", v19);

    }
LABEL_14:

    goto LABEL_15;
  }
  if (v10
    && !-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __canRecoverFromVerificationCertificatesError:fetchInfo:](self, "__canRecoverFromVerificationCertificatesError:fetchInfo:", v10, v8))
  {
    objc_msgSend(v8, "finishWithError:", v10);
    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "shouldRetry"))
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "recordID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hmbDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v23;
      v28 = 2112;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Fetch returned no verification certificates record: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v12);
    goto LABEL_14;
  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __retryFetchVerificationCertificatesWithFetchInfo:](self, "__retryFetchVerificationCertificatesWithFetchInfo:", v8);
LABEL_15:

}

- (BOOL)__canRecoverFromVerificationCertificatesError:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "hmd_isCKError")
    && (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) == 0
    && (objc_msgSend(v6, "hmbCloudKitRetryDelay"),
        objc_msgSend(v7, "setRetryIntervalSeconds:"),
        objc_msgSend(v7, "shouldRetry")))
  {
    objc_msgSend(v7, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markWithFormat:", CFSTR("Ignoring non-fatal error: %@"), v6);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)__retryFetchVerificationCertificatesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  void *v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retryIntervalSeconds");
  objc_msgSend(v6, "markWithFormat:", CFSTR("Will retry the fetch in %lu seconds"), (unint64_t)v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retryIntervalSeconds");
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2048;
    v23 = (unint64_t)v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Will retry the fetch in %lu seconds", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "retryIntervalSeconds");
  v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  objc_msgSend(v4, "setShouldRetry:", 0);
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v9);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](v9, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke;
  block[3] = &unk_24E7972B0;
  v18 = v4;
  v16 = v4;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_after(v14, v15, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke_2;
  v3[3] = &unk_24E7972B0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v5);
}

void __138__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____retryFetchVerificationCertificatesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markWithFormat:", CFSTR("Retrying fetch for verification certificates"));

    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying fetch for verification certificates", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v5, "__fetchVerificationCertificatesWithFetchInfo:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);

  }
}

void __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke_2;
  v12[3] = &unk_24E7801D8;
  v8 = v6;
  v13 = v8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v15 = v10;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v11 = v5;
  v16 = v11;
  objc_msgSend(v7, "performBlock:", v12);

  objc_destroyWeak(&v17);
}

void __133__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____fetchVerificationCertificatesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "markWithFormat:", CFSTR("Fetch records operation completed unsuccessfully: %@"), *(_QWORD *)(a1 + 32));

    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v10 = "%{public}@Fetch records operation completed unsuccessfully: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
  }
  else
  {
    objc_msgSend(v3, "markWithFormat:", CFSTR("Fetch records operation completed successfully"));

    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    v10 = "%{public}@Fetch records operation completed successfully";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
  }
  _os_log_impl(&dword_2218F0000, v11, v12, v10, buf, v13);

LABEL_7:
  objc_autoreleasePoolPop(v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "__fetchVerificationCertificatesCompleted:record:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "activity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "markWithFormat:", CFSTR("Mirror has been deallocated"));

    v17 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Mirror has been deallocated", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = *(id *)(a1 + 32);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v21);

  }
}

void __153__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates__fetchVerificationCertificatesRecordWithOperationGroup_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_assert_queue_V2(v5);
  objc_msgSend((id)objc_opt_class(), "__certificatesRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v10 = (uint64_t)v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    v11 = (id)v10;
  }
  v9();

}

+ (unint64_t)__maxSizeForCKRecordSignatureVerificationCertificateChain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!isInternalBuild())
    return 0x200000;
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorSignatureVerificationCertificateChainMaxSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

  }
  else
  {
    v6 = 0x200000;
  }

  return v6;
}

+ (id)__createSignatureVerificationPolicy
{
  return (id)SecPolicyCreateApplePinned();
}

+ (id)__certificatesRecordID
{
  if (__certificatesRecordID_onceToken != -1)
    dispatch_once(&__certificatesRecordID_onceToken, &__block_literal_global_74885);
  return (id)__certificatesRecordID_certificatesRecordID;
}

+ (id)__recordKeyCertificatePrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (__recordKeyCertificatePrefix__onceToken != -1)
    dispatch_once(&__recordKeyCertificatePrefix__onceToken, &__block_literal_global_16);
  objc_msgSend((id)__recordKeyCertificatePrefix__prefixRegex, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "numberOfRanges") >= 2)
  {
    v7 = objc_msgSend(v5, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)__publicKeyFromCertificateRecord:(id)a3 dataKey:(id)a4 assetKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFData *v25;
  const __CFData *v26;
  SecCertificateRef v27;
  SecCertificateRef v28;
  void *v29;
  OSStatus v30;
  OSStatus v31;
  __SecTrust *v32;
  _BOOL4 v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *context;
  void *contexta;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  _BYTE v91[128];
  _BYTE trust[12];
  __int16 v93;
  _BYTE v94[18];
  _QWORD v95[5];

  v95[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v10;
  v95[0] = v9;
  v95[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordSignatureVerificationCertificateChain");
  v90 = 0;
  stringFromCKRecord(v11, v9, v12, v14, &v90);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v90;
  v17 = v16;
  if (v15)
  {
    v85 = v15;
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v81 = v17;
      v83 = v11;
      v84 = v13;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v18, "count"));
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
      v82 = v9;
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v87;
        v80 = v18;
LABEL_5:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v87 != v23)
            objc_enumerationMutation(v20);
          v25 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v24), 0);
          if (!v25)
            break;
          v26 = v25;
          v27 = SecCertificateCreateWithData(0, v25);
          if (!v27)
          {
            v79 = (void *)MEMORY[0x227676638]();
            v58 = a1;
            HMFGetOSLogHandle();
            v56 = objc_claimAutoreleasedReturnValue();
            v17 = v81;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)trust = 138543618;
              *(_QWORD *)&trust[4] = v59;
              v93 = 2112;
              *(_QWORD *)v94 = v84;
              _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to create certificate from data using keys: %@", trust, 0x16u);

            }
LABEL_31:
            v42 = v82;
            v11 = v83;
            goto LABEL_33;
          }
          v28 = v27;
          objc_msgSend(v19, "addObject:", v27);

          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
            v18 = v80;
            if (v22)
              goto LABEL_5;
            goto LABEL_12;
          }
        }
        v79 = (void *)MEMORY[0x227676638]();
        v55 = a1;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)trust = 138543874;
          *(_QWORD *)&trust[4] = v57;
          v93 = 2112;
          *(_QWORD *)v94 = v84;
          *(_WORD *)&v94[8] = 2112;
          v17 = v81;
          *(_QWORD *)&v94[10] = v81;
          _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Invalid certificate data in record using keys: %@: %@", trust, 0x20u);

          v26 = 0;
          goto LABEL_31;
        }
        v26 = 0;
        v42 = v82;
        v11 = v83;
        v17 = v81;
LABEL_33:
        v18 = v80;

        objc_autoreleasePoolPop(v79);
        v40 = 0;
        goto LABEL_49;
      }
LABEL_12:

      objc_msgSend(a1, "__createSignatureVerificationPolicy");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v20 = v29;
        *(_QWORD *)trust = 0;
        v30 = SecTrustCreateWithCertificates(v19, v29, (SecTrustRef *)trust);
        v31 = v30;
        v32 = *(__SecTrust **)trust;
        v78 = *(void **)trust;
        if (!*(_QWORD *)trust || v30)
        {
          v64 = (void *)MEMORY[0x227676638]();
          v65 = a1;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          v17 = v81;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)trust = 138543874;
            *(_QWORD *)&trust[4] = v67;
            v93 = 1024;
            *(_DWORD *)v94 = v31;
            *(_WORD *)&v94[4] = 2112;
            *(_QWORD *)&v94[6] = v84;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to create trust (result %i) from certificate using keys: %@", trust, 0x1Cu);

          }
          objc_autoreleasePoolPop(v64);
          v40 = 0;
          v42 = v82;
          v11 = v83;
        }
        else
        {
          *(_QWORD *)trust = 0;
          v33 = SecTrustEvaluateWithError(v32, (CFErrorRef *)trust);
          v34 = *(void **)trust;
          context = (void *)MEMORY[0x227676638]();
          v35 = a1;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          v77 = v34;
          if (!v33 || v34)
          {
            v11 = v83;
            v17 = v81;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)trust = 138543874;
              *(_QWORD *)&trust[4] = v68;
              v93 = 2112;
              *(_QWORD *)v94 = v84;
              *(_WORD *)&v94[8] = 2112;
              *(_QWORD *)&v94[10] = v77;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Certificate did not pass trust evaluation with keys: %@, error: %@", trust, 0x20u);

              v11 = v83;
            }

            objc_autoreleasePoolPop(context);
            v40 = 0;
          }
          else
          {
            v11 = v83;
            v17 = v81;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)trust = 138543618;
              *(_QWORD *)&trust[4] = v38;
              v93 = 2112;
              *(_QWORD *)v94 = v84;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Trusted certificate found in record using keys: %@", trust, 0x16u);

              v11 = v83;
            }

            objc_autoreleasePoolPop(context);
            v39 = (void *)MEMORY[0x227675AE0](v32);
            v40 = v39;
            if (v39)
            {
              v41 = v39;
            }
            else
            {
              v69 = (void *)MEMORY[0x227676638]();
              v70 = v35;
              HMFGetOSLogHandle();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                contexta = v69;
                v72 = v11;
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)trust = 138543618;
                *(_QWORD *)&trust[4] = v73;
                v93 = 2112;
                *(_QWORD *)v94 = v84;
                _os_log_impl(&dword_2218F0000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to get public key from trust in record using keys: %@", trust, 0x16u);

                v11 = v72;
                v69 = contexta;
              }

              objc_autoreleasePoolPop(v69);
            }

          }
          v42 = v82;

        }
      }
      else
      {
        v60 = (void *)MEMORY[0x227676638]();
        v61 = a1;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)trust = 138543362;
          *(_QWORD *)&trust[4] = v63;
          _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to create security policy to verify certificates", trust, 0xCu);

        }
        objc_autoreleasePoolPop(v60);
        v20 = 0;
        v40 = 0;
        v42 = v82;
        v11 = v83;
        v17 = v81;
      }
LABEL_49:

      v13 = v84;
    }
    else
    {
      v42 = v9;
      v50 = (void *)MEMORY[0x227676638]();
      v51 = a1;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = v11;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)trust = 138543874;
        *(_QWORD *)&trust[4] = v54;
        v93 = 2112;
        *(_QWORD *)v94 = v13;
        *(_WORD *)&v94[8] = 2112;
        *(_QWORD *)&v94[10] = v17;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@No certificates found on record using keys: %@: %@", trust, 0x20u);

        v11 = v53;
      }

      objc_autoreleasePoolPop(v50);
      v40 = 0;
    }

    v15 = v85;
  }
  else
  {
    v42 = v9;
    v43 = v12;
    v44 = v16;
    v45 = (void *)MEMORY[0x227676638]();
    v46 = a1;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = v11;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)trust = 138543874;
      *(_QWORD *)&trust[4] = v49;
      v93 = 2112;
      *(_QWORD *)v94 = v13;
      *(_WORD *)&v94[8] = 2112;
      *(_QWORD *)&v94[10] = v44;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to read data from certificate record using keys: %@: %@", trust, 0x20u);

      v11 = v48;
    }

    objc_autoreleasePoolPop(v45);
    v40 = 0;
    v17 = v44;
    v12 = v43;
  }

  return v40;
}

+ (id)publicKeysFromCertificateRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "__recordKeyCertificatePrefix:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "stringByAppendingString:", CFSTR("_ckAsset"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "__publicKeyFromCertificateRecord:dataKey:assetKey:", v4, v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v16, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v16, "count"))
    v14 = (void *)objc_msgSend(v16, "copy");
  else
    v14 = 0;

  return v14;
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____recordKeyCertificatePrefix___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(CD_certificate(?:\\d+|))(?:$|_ckAsset$)"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__recordKeyCertificatePrefix__prefixRegex;
  __recordKeyCertificatePrefix__prefixRegex = v0;

}

void __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchVerificationCertificates____certificatesRecordID__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDB91F8]);
  v3 = (id)objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("certificates"), *MEMORY[0x24BDB8E88]);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", CFSTR("certificates"), v3);
  v2 = (void *)__certificatesRecordID_certificatesRecordID;
  __certificatesRecordID_certificatesRecordID = v1;

}

- (id)__createCloudZoneIDForZoneID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x24BE4EC70];
  v5 = a3;
  v6 = [v4 alloc];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publicDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithContainerID:scope:zoneID:", v8, objc_msgSend(v10, "scope"), v5);

  return v11;
}

- (id)__openLocalZoneForCloudZoneID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localDatabase](self, "localDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE4EC88]);
  objc_msgSend(v8, "openZoneWithZoneID:configuration:error:", v6, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startUp");
  return v10;
}

- (void)__shutdownLocalZones:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "shutdown");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v16 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "combineAllFutures:ignoringErrors:scheduler:", v9, 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "blockAndWaitForCompletionWithError:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____shutdownLocalZones_activity___block_invoke;
    v20[3] = &unk_24E787150;
    v21 = v7;
    v22 = v10;
    v23 = self;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  }
}

- (id)__localZonesForRecordIDs:(id)a3 activity:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id *v46;
  void *v47;
  uint64_t v48;
  id v49;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v50 = self;
  v51 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (!v12)
  {

LABEL_26:
    v44 = (void *)objc_msgSend(v10, "copy");
    v14 = 0;
    goto LABEL_27;
  }
  v13 = v12;
  v46 = a5;
  v14 = 0;
  v15 = *(_QWORD *)v54;
  v47 = v10;
  v48 = *(_QWORD *)v54;
  v16 = v50;
  v49 = v11;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v54 != v15)
        objc_enumerationMutation(v11);
      objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "zoneID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __createCloudZoneIDForZoneID:](v16, "__createCloudZoneIDForZoneID:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v14;
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __openLocalZoneForCloudZoneID:error:](v16, "__openLocalZoneForCloudZoneID:error:", v20, &v52);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v52;

        if (v21)
        {
          objc_msgSend(v18, "hmbDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "markWithFormat:", CFSTR("Opened local zone for %@"), v23);

          v24 = (void *)MEMORY[0x227676638]();
          v25 = v16;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hmbDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v27;
            v59 = 2112;
            v60 = v28;
            _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Opened local zone for %@", buf, 0x16u);

            v15 = v48;
            v10 = v47;
          }

          objc_autoreleasePoolPop(v24);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v18);
        }
        else
        {
          v29 = v16;
          v30 = objc_msgSend((id)objc_opt_class(), "__errorIsNotFound:", v22);
          objc_msgSend(v18, "hmbDescription");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (!v30)
          {
            objc_msgSend(v51, "markWithFormat:", CFSTR("Failed to open local zone for %@: %@"), v31, v22);

            v38 = (void *)MEMORY[0x227676638]();
            v39 = v29;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "hmbDescription");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v58 = v41;
              v59 = 2112;
              v60 = v42;
              v61 = 2112;
              v62 = v22;
              _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone for %@: %@", buf, 0x20u);

              v10 = v47;
            }

            objc_autoreleasePoolPop(v38);
            v14 = v22;
            v11 = v49;
            v16 = v50;
            goto LABEL_22;
          }
          objc_msgSend(v51, "markWithFormat:", CFSTR("No local zone for %@, skipping"), v31);

          v33 = (void *)MEMORY[0x227676638]();
          v34 = v29;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hmbDescription");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v58 = v36;
            v59 = 2112;
            v60 = v37;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_DEBUG, "%{public}@No local zone for %@, skipping", buf, 0x16u);

            v10 = v47;
          }

          objc_autoreleasePoolPop(v33);
          v22 = 0;
          v15 = v48;
        }

        v14 = v22;
        v11 = v49;
        v16 = v50;
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v13)
      continue;
    break;
  }
LABEL_22:

  if (!v14)
    goto LABEL_26;
  objc_msgSend(v10, "allValues");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __shutdownLocalZones:activity:](v16, "__shutdownLocalZones:activity:", v43, v51);

  if (v46)
  {
    v14 = objc_retainAutorelease(v14);
    v44 = 0;
    *v46 = v14;
  }
  else
  {
    v44 = 0;
  }
LABEL_27:

  return v44;
}

- (id)__fetchAllDataForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v50;
  NSObject *v51;
  void *v52;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v62;
  uint64_t v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __localZonesForRecordIDs:activity:error:](self, "__localZonesForRecordIDs:activity:error:", v10, v12, a6);
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v54 = v11;
    v60 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v55 = v10;
    obj = v10;
    v14 = (void *)v56;
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v63)
    {
      v61 = *(_QWORD *)v67;
      v62 = self;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v67 != v61)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:](HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel, "modelIDForRecordID:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zoneID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v65 = 0;
            objc_msgSend(v19, "fetchModelWithModelID:ofType:error:", v17, v60, &v65);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v65;
            objc_msgSend(v16, "hmbDescription");
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            v64 = v21;
            if (v20)
            {
              objc_msgSend(v12, "markWithFormat:", CFSTR("Model %@ found for record %@"), v17, v22);

              v24 = (void *)MEMORY[0x227676638]();
              v25 = self;
              HMFGetOSLogHandle();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "hmbDescription");
                v57 = v24;
                v28 = v12;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v71 = v27;
                v72 = 2112;
                v73 = v17;
                v74 = 2112;
                v75 = v29;
                _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Model %@ found for record %@", buf, 0x20u);

                v12 = v28;
                v24 = v57;

                v14 = (void *)v56;
              }

              objc_autoreleasePoolPop(v24);
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "networkDeclarationsData");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                objc_msgSend(v20, "networkDeclarationsData");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("networkDeclarations"));

              }
              objc_msgSend(v20, "pairedMetadataData");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              self = v62;
              if (v33)
              {
                objc_msgSend(v20, "pairedMetadataData");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, CFSTR("pairedMetadata"));

              }
              objc_msgSend(v58, "setObject:forKeyedSubscript:", v30, v16);

            }
            else
            {
              objc_msgSend(v12, "markWithFormat:", CFSTR("No model %@ for record %@ found: %@"), v17, v22, v21);

              v41 = (void *)MEMORY[0x227676638]();
              v42 = self;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "hmbDescription");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v71 = v44;
                v72 = 2112;
                v73 = v17;
                v74 = 2112;
                v75 = v45;
                v76 = 2112;
                v77 = v64;
                _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_DEBUG, "%{public}@No model %@ for record %@ found: %@", buf, 0x2Au);

                v14 = (void *)v56;
              }

              objc_autoreleasePoolPop(v41);
              self = v62;
            }

          }
          else
          {
            objc_msgSend(v16, "hmbDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "markWithFormat:", CFSTR("No local zone for model %@ for record %@ found"), v17, v35);

            v36 = (void *)MEMORY[0x227676638]();
            v37 = self;
            HMFGetOSLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "hmbDescription");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v71 = v39;
              v72 = 2112;
              v73 = v17;
              v74 = 2112;
              v75 = v40;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No local zone for model %@ for record %@ found", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v36);
            self = v62;
          }

        }
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v63);
    }

    objc_msgSend(v14, "allValues");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __shutdownLocalZones:activity:](self, "__shutdownLocalZones:activity:", v46, v12);

    v47 = (void *)objc_msgSend(v58, "copy");
    v48 = v14;
    v11 = v54;
    v10 = v55;
  }
  else
  {
    v49 = (void *)MEMORY[0x227676638]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v52;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@localZones is nil, can't fetch paired metadata", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v49);
    v47 = 0;
    v48 = 0;
  }

  return v47;
}

- (id)__fetchAllDataForZoneID:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  NSObject *v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  NSObject *v30;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v67;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v68;
  NSObject *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v114;
  id obj;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  id v131;
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  id v137;
  __int16 v138;
  id v139;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(v9, "hmbDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v11;
  objc_msgSend(v11, "markWithFormat:", CFSTR("Fetching all models for zone %@"), v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v133 = v18;
    v134 = 2112;
    v135 = v19;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all models for zone %@", buf, 0x16u);

    v15 = v17;
  }

  objc_autoreleasePoolPop(v14);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __createCloudZoneIDForZoneID:](v15, "__createCloudZoneIDForZoneID:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __openLocalZoneForCloudZoneID:error:](v15, "__openLocalZoneForCloudZoneID:error:", v20, &v131);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v131;
  if (v21)
  {
    v112 = v20;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v22;
    objc_msgSend(v21, "fetchModelsOfType:error:", objc_opt_class(), &v130);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v130;

    objc_msgSend(v9, "hmbDescription");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v111 = (void *)v23;
    if (v23)
    {
      v110 = v10;
      v121 = v24;
      v27 = (void *)v23;
      objc_msgSend(v120, "markWithFormat:", CFSTR("Found models in local zone for %@: %@"), v25, v23);

      v28 = (void *)MEMORY[0x227676638]();
      v29 = v15;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = v15;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmbDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v133 = v32;
        v134 = 2112;
        v135 = v33;
        v136 = 2112;
        v137 = v27;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Found models in local zone for %@: %@", buf, 0x20u);

        v15 = v31;
      }

      v114 = v29;
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      obj = v27;
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
      if (v118)
      {
        v116 = *(_QWORD *)v127;
        v35 = v121;
        v108 = v15;
        v109 = v9;
        v117 = v21;
        while (2)
        {
          v36 = 0;
          v37 = v114;
          do
          {
            if (*(_QWORD *)v127 != v116)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v36);
            objc_msgSend(v38, "hmbModelID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v35;
            objc_msgSend(v21, "externalIDForModelID:error:", v39, &v125);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v125;

            if (!v40)
            {
              objc_msgSend(v38, "hmbModelID");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v109;
              objc_msgSend(v109, "hmbDescription");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "markWithFormat:", CFSTR("Failed to fetch external id for model %@ in %@: %@"), v79, v80, v41);

              v81 = (void *)MEMORY[0x227676638]();
              v82 = v37;
              HMFGetOSLogHandle();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "hmbModelID");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "hmbDescription");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v133 = v84;
                v134 = 2112;
                v135 = v85;
                v136 = 2112;
                v137 = v86;
                v138 = 2112;
                v139 = v41;
                _os_log_impl(&dword_2218F0000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch external id for model %@ in %@: %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v81);
              v35 = v41;
              v10 = v110;
              v21 = v117;
              v15 = v108;
              goto LABEL_41;
            }
            v124 = v41;
            objc_msgSend(MEMORY[0x24BDB91E8], "recordIDFromExternalID:error:", v40, &v124);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v124;

            if (!v42)
            {
              objc_msgSend(v38, "hmbModelID");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v109;
              objc_msgSend(v109, "hmbDescription");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v35;
              objc_msgSend(v120, "markWithFormat:", CFSTR("Failed to convert external id for model %@ in %@: %@"), v87, v88, v35);

              v90 = (void *)MEMORY[0x227676638]();
              v91 = v37;
              HMFGetOSLogHandle();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v93 = v40;
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "hmbModelID");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "hmbDescription");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v133 = v94;
                v134 = 2112;
                v135 = v95;
                v136 = 2112;
                v137 = v96;
                v138 = 2112;
                v139 = v89;
                _os_log_impl(&dword_2218F0000, v92, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert external id for model %@ in %@: %@", buf, 0x2Au);

                v9 = v109;
                v40 = v93;
              }

              objc_autoreleasePoolPop(v90);
              v10 = v110;
              v21 = v117;
              v15 = v108;
              v35 = v89;
              goto LABEL_41;
            }
            v122 = v40;
            objc_msgSend(v42, "hmbDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "markWithFormat:", CFSTR("Fetched model for %@"), v43);

            v44 = (void *)MEMORY[0x227676638]();
            v45 = v37;
            HMFGetOSLogHandle();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v47 = v34;
              v48 = v35;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "hmbDescription");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v133 = v49;
              v134 = 2112;
              v135 = v50;
              _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Fetched model for %@", buf, 0x16u);

              v35 = v48;
              v34 = v47;
              v37 = v114;
            }

            objc_autoreleasePoolPop(v44);
            objc_msgSend(v38, "networkDeclarationsData");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
            {
              objc_msgSend(v38, "networkDeclarationsData");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v52, CFSTR("networkDeclarations"));

            }
            objc_msgSend(v38, "pairedMetadataData");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v117;
            if (v53)
            {
              objc_msgSend(v38, "pairedMetadataData");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v54, CFSTR("pairedMetadata"));

            }
            objc_msgSend(v119, "setObject:forKeyedSubscript:", v34, v42);

            ++v36;
          }
          while (v118 != v36);
          v9 = v109;
          v10 = v110;
          v15 = v108;
          v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v140, 16);
          if (v118)
            continue;
          break;
        }
      }
      else
      {
        v35 = v121;
        v10 = v110;
      }
LABEL_41:

    }
    else
    {
      objc_msgSend(v120, "markWithFormat:", CFSTR("Failed to fetch models from local zone for %@: %@"), v25, v24);

      v66 = (void *)MEMORY[0x227676638]();
      v67 = v15;
      v68 = v15;
      HMFGetOSLogHandle();
      v69 = objc_claimAutoreleasedReturnValue();
      v35 = v24;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v70 = v24;
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmbDescription");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v133 = v71;
        v134 = 2112;
        v135 = v72;
        v136 = 2112;
        v137 = v70;
        _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch models from local zone for %@: %@", buf, 0x20u);

        v35 = v70;
      }

      objc_autoreleasePoolPop(v66);
      v15 = v67;
    }
    objc_msgSend(v21, "shutdown");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    v98 = (id)objc_msgSend(v97, "blockAndWaitForCompletionWithError:", &v123);
    v99 = v123;

    if (v99)
    {
      v100 = v35;
      objc_msgSend(v9, "hmbDescription");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "markWithFormat:", CFSTR("Failed to shut down local zone for %@: %@"), v101, v99);

      v102 = (void *)MEMORY[0x227676638]();
      v103 = v15;
      HMFGetOSLogHandle();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmbDescription");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v133 = v105;
        v134 = 2112;
        v135 = v106;
        v136 = 2112;
        v137 = v99;
        _os_log_impl(&dword_2218F0000, v104, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v102);
      v35 = v100;
      if (!v100)
        v35 = v99;
    }
    else if (!v35)
    {
      v65 = (void *)objc_msgSend(v119, "copy");
LABEL_52:

      v22 = v35;
      v20 = v112;
      goto LABEL_53;
    }
    if (a6)
    {
      v35 = objc_retainAutorelease(v35);
      v65 = 0;
      *a6 = v35;
    }
    else
    {
      v65 = 0;
    }
    goto LABEL_52;
  }
  v55 = v15;
  v56 = objc_msgSend((id)objc_opt_class(), "__errorIsNotFound:", v22);
  objc_msgSend(v9, "hmbDescription");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v57;
  if (v56)
  {
    objc_msgSend(v120, "markWithFormat:", CFSTR("Local zone does not exist for %@"), v57);

    v59 = (void *)MEMORY[0x227676638]();
    v60 = v55;
    HMFGetOSLogHandle();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v62 = v20;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbDescription");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v133 = v63;
      v134 = 2112;
      v135 = v64;
      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_DEBUG, "%{public}@Local zone does not exist for %@", buf, 0x16u);

      v20 = v62;
    }

    objc_autoreleasePoolPop(v59);
    v65 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    objc_msgSend(v120, "markWithFormat:", CFSTR("Failed to open local zone for %@: %@"), v57, v22);

    v73 = (void *)MEMORY[0x227676638]();
    v74 = v55;
    HMFGetOSLogHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v76 = v20;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbDescription");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v133 = v77;
      v134 = 2112;
      v135 = v78;
      v136 = 2112;
      v137 = v22;
      _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone for %@: %@", buf, 0x20u);

      v20 = v76;
    }

    objc_autoreleasePoolPop(v73);
    if (a6)
    {
      v22 = objc_retainAutorelease(v22);
      v65 = 0;
      *a6 = v22;
    }
    else
    {
      v65 = 0;
    }
  }
LABEL_53:

  return v65;
}

- (id)__fetchAllDataForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  os_unfair_lock_s *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v43;
  NSObject *v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  id v49;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v49 = a4;
  v51 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v46)
  {
    v10 = objc_alloc(MEMORY[0x24BDB91F8]);
    v11 = (void *)objc_msgSend(v10, "initWithZoneName:ownerName:", v46, *MEMORY[0x24BDB8E88]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    v25 = (void *)MEMORY[0x227676638](objc_msgSend(v51, "markWithFormat:", CFSTR("Fetching models from zones: %@"), v12));
    v50 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v62 = v27;
      v63 = 2112;
      v64 = v12;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching models from zones: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v12;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v54 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v52 = 0;
          -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __fetchAllDataForZoneID:options:activity:error:](v50, "__fetchAllDataForZoneID:options:activity:error:", v31, v49, v51, &v52);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v52;
          if (v32)
          {
            objc_msgSend(v48, "addEntriesFromDictionary:", v32);
          }
          else
          {
            objc_msgSend(v31, "hmbDescription");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "markWithFormat:", CFSTR("Failed to fetch models for zone %@: %@"), v34, v33);

            v35 = (void *)MEMORY[0x227676638]();
            v36 = v50;
            HMFGetOSLogHandle();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "hmbDescription");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v62 = v38;
              v63 = 2112;
              v64 = v39;
              v65 = 2112;
              v66 = v33;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch models for zone %@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v35);
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      }
      while (v28);
    }

    v40 = (void *)objc_msgSend(v48, "copy");
    goto LABEL_27;
  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  v14 = (os_unfair_lock_s *)&v13[*MEMORY[0x24BE4ED40]];
  os_unfair_lock_lock_with_options();

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneStateByZoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(v14);
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v58 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "zoneID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "zoneID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v20);
    }

    v12 = (void *)objc_msgSend(v18, "copy");
    goto LABEL_12;
  }
  obj = v17;
  v42 = (void *)MEMORY[0x227676638](objc_msgSend(v51, "markWithFormat:", CFSTR("No local zones exist")));
  v43 = self;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v62 = v45;
    _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_DEBUG, "%{public}@No local zones exist", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v42);
  v40 = (void *)MEMORY[0x24BDBD1B8];
LABEL_27:

  return v40;
}

- (BOOL)__removeAllLocalRulesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publicZoneIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)MEMORY[0x227676638](objc_msgSend(v8, "markWithFormat:", CFSTR("Removing cloud zones: %@"), v11));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing cloud zones: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v13, "cloudDatabase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleRemovedZoneIDs:userInitiated:", v17, 1);

  }
  v18 = (void *)MEMORY[0x227676638](objc_msgSend(v8, "markWithFormat:", CFSTR("Resetting database change token")));
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v21;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting database change token", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v19, "cloudDatabase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v19, "cloudDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "publicDatabase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updateServerChangeToken:forDatabaseWithScope:", 0, objc_msgSend(v24, "scope"));

  return 1;
}

- (id)__fetchOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v35 = a4;
  v41 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v40 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v9;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v42)
  {
    v39 = *(_QWORD *)v46;
    v36 = self;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:](HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel, "modelIDForRecordID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](self, "localZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        objc_msgSend(v15, "fetchModelWithModelID:ofType:error:", v14, v40, &v44);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v44;

        objc_msgSend(v12, "hmbDescription");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v16)
        {
          v43 = v17;
          objc_msgSend(v41, "markWithFormat:", CFSTR("Model %@ (%@) found in override zone"), v14, v18);

          v20 = (void *)MEMORY[0x227676638]();
          v21 = self;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "hmbDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v50 = v23;
            v51 = 2112;
            v52 = v14;
            v53 = 2112;
            v54 = v24;
            _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Model %@ (%@) found in override zone", buf, 0x20u);

            self = v36;
          }

          objc_autoreleasePoolPop(v20);
          objc_msgSend(v16, "networkDeclarationsData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("networkDeclarations"));

          objc_msgSend(v16, "pairedMetadataData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("pairedMetadata"));

          v27 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v27, v12);

          v17 = v43;
        }
        else
        {
          objc_msgSend(v41, "markWithFormat:", CFSTR("No model %@ (%@) found in override zone: %@"), v14, v18, v17, v35);

          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "hmbDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v50 = v31;
            v51 = 2112;
            v52 = v14;
            v53 = 2112;
            v54 = v32;
            v55 = 2112;
            v56 = v17;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@No model %@ (%@) found in override zone: %@", buf, 0x2Au);

            self = v36;
          }

          objc_autoreleasePoolPop(v28);
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v42);
  }

  v33 = (void *)objc_msgSend(v38, "copy");
  return v33;
}

- (id)__fetchOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v54;
  NSObject *v55;
  void *v56;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id obj;
  void *v63;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v64 = self;
  if (v10)
  {
    v14 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Fetching overrides for zone '%@'"), v10));
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v17;
    v76 = 2112;
    v77 = v10;
    v18 = "%{public}@Fetching overrides for zone '%@'";
    v19 = v16;
    v20 = 22;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Fetching all overrides")));
    v21 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v75 = v17;
    v18 = "%{public}@Fetching all overrides";
    v19 = v16;
    v20 = 12;
  }
  _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

LABEL_7:
  objc_autoreleasePoolPop(v14);
  v22 = objc_opt_class();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](self, "localZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(v23, "fetchModelsOfType:error:", v22, &v73);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v73;

  if (v24)
  {
    if (objc_msgSend(v24, "count"))
    {
      v58 = v25;
      v63 = v12;
      v60 = v11;
      v65 = v10;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v59 = v24;
      obj = v24;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      v27 = self;
      if (v26)
      {
        v28 = v26;
        v66 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v70 != v66)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v30, "hmbModelID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v27, "localZone");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = 0;
            objc_msgSend(v32, "externalIDForModelID:error:", v31, &v68);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v68;

            if (v33)
            {
              v67 = v34;
              objc_msgSend(MEMORY[0x24BDB91E8], "recordIDFromExternalID:error:", v33, &v67);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v67;

              if (v35)
              {
                if (!v65
                  || (objc_msgSend(v35, "zoneID"),
                      v37 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v37, "zoneName"),
                      v38 = (void *)objc_claimAutoreleasedReturnValue(),
                      v39 = objc_msgSend(v38, "isEqualToString:", v65),
                      v38,
                      v37,
                      v39))
                {
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "networkDeclarationsData");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, CFSTR("networkDeclarations"));

                  objc_msgSend(v30, "pairedMetadataData");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("pairedMetadata"));

                  v43 = (void *)objc_msgSend(v40, "copy");
                  objc_msgSend(v61, "setObject:forKeyedSubscript:", v43, v35);

                }
              }
              else
              {
                v48 = (void *)MEMORY[0x227676638](objc_msgSend(v63, "markWithFormat:", CFSTR("Failed to convert externalID (%@) to CKRecordID for modelID %@: %@"), v33, v31, v36));
                v49 = v27;
                HMFGetOSLogHandle();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v75 = v51;
                  v76 = 2112;
                  v77 = v33;
                  v78 = 2112;
                  v79 = v31;
                  v80 = 2112;
                  v81 = v36;
                  _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", buf, 0x2Au);

                }
                objc_autoreleasePoolPop(v48);
              }

              v27 = v64;
            }
            else
            {
              v44 = (void *)MEMORY[0x227676638](objc_msgSend(v63, "markWithFormat:", CFSTR("Failed to fetch externalID for modelID %@: %@"), v31, v34));
              v45 = v27;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v75 = v47;
                v76 = 2112;
                v77 = v31;
                v78 = 2112;
                v79 = v34;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch externalID for modelID %@: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v44);
              v36 = v34;
            }

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        }
        while (v28);
      }

      v52 = (void *)objc_msgSend(v61, "copy");
      v10 = v65;
      v24 = v59;
      v11 = v60;
      v12 = v63;
      v25 = v58;
    }
    else
    {
      v52 = (void *)MEMORY[0x24BDBD1B8];
    }
  }
  else
  {
    v53 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to fetch override models: %@"), v25));
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v56;
      v76 = 2112;
      v77 = v25;
      _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch override models: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v53);
    v52 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v25);
  }

  return v52;
}

- (BOOL)__addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 activity:(id)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v30;
  NSObject *v31;
  void *v32;
  void *context;
  void *contexta;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v40;
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v10 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v12 = a5;
  v13 = a6;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (v10)
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __removeAllOverridesWithOptions:activity:error:](self, "__removeAllOverridesWithOptions:activity:error:", v12, v13, 0);
  objc_msgSend((id)objc_opt_class(), "__overrideParentModelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](self, "localZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createMirrorInputWithError:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__130656;
    v48 = __Block_byref_object_dispose__130657;
    v49 = 0;
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____addOverrides_replace_options_activity_error___block_invoke;
    v38[3] = &unk_24E787178;
    v18 = v13;
    v39 = v18;
    v40 = self;
    v43 = &v44;
    v41 = v15;
    v19 = v17;
    v42 = v19;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v38);
    if (v45[5])
    {
      objc_msgSend(v19, "abort");
      v20 = 0;
      if (a7)
        *a7 = objc_retainAutorelease((id)v45[5]);
    }
    else
    {
      context = (void *)MEMORY[0x227676638](objc_msgSend(v18, "markWithFormat:", CFSTR("Committing overrides")));
      v21 = self;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Committing overrides", buf, 0xCu);

      }
      objc_autoreleasePoolPop(context);
      v37 = 0;
      v20 = objc_msgSend(v19, "frmSyncCommitWithOptions:error:", v12, &v37);
      v24 = v37;
      contexta = v24;
      if ((v20 & 1) != 0)
      {
        v25 = (void *)MEMORY[0x227676638](objc_msgSend(v18, "markWithFormat:", CFSTR("Committed overrides successfully")));
        v26 = v21;
        HMFGetOSLogHandle();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v51 = v28;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Committed overrides successfully", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638](objc_msgSend(v18, "markWithFormat:", CFSTR("Failed to commit: %@"), v24));
        v30 = v21;
        HMFGetOSLogHandle();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v32;
          v52 = 2112;
          v53 = contexta;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        if (a7)
          *a7 = objc_retainAutorelease(contexta);
      }

    }
    _Block_object_dispose(&v44, 8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)__removeAllOverridesWithOptions:(id)a3 activity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v26;
  NSObject *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "markWithFormat:", CFSTR("Removing all overrides")));
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all overrides", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v12, "localZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllModelsOfTypes:options:", v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v18 = (id)objc_msgSend(v17, "blockAndWaitForCompletionWithError:", &v30);
  v19 = v30;
  v20 = v19;
  if (v19)
  {
    v21 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "markWithFormat:", CFSTR("Failed to remove all previous overrides: %@"), v19));
    v22 = v12;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all previous overrides: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    if (a5)
      *a5 = objc_retainAutorelease(v20);
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "markWithFormat:", CFSTR("Successfully removed all previous overrides")));
    v26 = v12;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all previous overrides", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

  return v20 == 0;
}

- (BOOL)__removeOverridesForRecordIDs:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v50;
  NSObject *v51;
  id v52;
  void *v53;
  id v55;
  id *v56;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Removing overrides for recordIDs: %@"), v10));
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v17;
    v69 = 2112;
    v70 = v10;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Removing overrides for recordIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v15, "localZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createMirrorInputWithError:", a6);
  v19 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v19;
  if (v19)
  {
    v56 = a6;
    v59 = v11;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v21)
    {
      v22 = v21;
      v57 = v15;
      v58 = v12;
      v55 = v10;
      v23 = 0;
      v24 = *(_QWORD *)v64;
      while (2)
      {
        v25 = 0;
        v26 = v23;
        do
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v25);
          +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:](HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel, "modelIDForRecordID:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v26;
          v29 = objc_msgSend(v60, "stageRemovalForModelWithID:error:", v28, &v62);
          v23 = v62;

          if ((v29 & 1) == 0)
          {
            objc_msgSend(v27, "hmbDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "markWithFormat:", CFSTR("Failed to remove model %@: %@"), v30, v23);

            v31 = (void *)MEMORY[0x227676638]();
            v15 = v57;
            v32 = v57;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "hmbDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v68 = v34;
              v69 = 2112;
              v70 = v35;
              v71 = 2112;
              v72 = v23;
              _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model %@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v31);

            goto LABEL_16;
          }

          ++v25;
          v26 = v23;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        v15 = v57;
        if (v22)
          continue;
        break;
      }
LABEL_16:

      v10 = v55;
      v12 = v58;
      if (v23)
      {
        objc_msgSend(v60, "abort");
        v11 = v59;
        if (v56)
        {
          v23 = objc_retainAutorelease(v23);
          v36 = 0;
          *v56 = v23;
        }
        else
        {
          v36 = 0;
        }
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {

    }
    v37 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Committing removal of overrides")));
    v38 = v15;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    v11 = v59;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v40 = v12;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v41;
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Committing removal of overrides", buf, 0xCu);

      v12 = v40;
    }

    objc_autoreleasePoolPop(v37);
    v61 = 0;
    v36 = objc_msgSend(v60, "frmSyncCommitWithOptions:error:", v59, &v61);
    v42 = v61;
    v43 = v42;
    if ((v36 & 1) != 0)
    {
      v44 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Committed removal of overrides successfully")));
      v45 = v38;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = v12;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v48;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Committed removal of overrides successfully", buf, 0xCu);

        v12 = v47;
      }

      objc_autoreleasePoolPop(v44);
    }
    else
    {
      v49 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to commit: %@"), v42));
      v50 = v38;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = v12;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v68 = v53;
        v69 = 2112;
        v70 = v43;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

        v12 = v52;
      }

      objc_autoreleasePoolPop(v49);
      if (v56)
        *v56 = objc_retainAutorelease(v43);
    }

    v23 = 0;
    goto LABEL_32;
  }
  v36 = 0;
LABEL_33:

  return v36;
}

- (BOOL)__removeOverridesForZoneName:(id)a3 options:(id)a4 activity:(id)a5 error:(id *)a6
{
  char *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  uint64_t v23;
  id v24;
  char *v25;
  uint64_t i;
  char *v27;
  void *v28;
  char *v29;
  char *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v38;
  NSObject *v39;
  void *v40;
  char *v41;
  char v42;
  void *v43;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v44;
  NSObject *v45;
  void *v46;
  char v47;
  void *v48;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v53;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v58;
  void *v59;
  char *v60;
  void *v61;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v62;
  NSObject *v63;
  id v64;
  void *v65;
  char *v66;
  char *v67;
  void *v68;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v74;
  NSObject *v75;
  id v76;
  void *v77;
  void *v78;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v79;
  NSObject *v80;
  id v81;
  void *v82;
  void *v84;
  id *v85;
  id v86;
  char *v87;
  char *v88;
  void *v89;
  id obj;
  void *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v96;
  id v97;
  id v98;
  char *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  char *v109;
  __int16 v110;
  char *v111;
  __int16 v112;
  id v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Removing overrides for zone '%@'"), v10));
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v17;
    v108 = 2112;
    v109 = v10;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Removing overrides for zone '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v18 = objc_opt_class();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v15, "localZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  objc_msgSend(v19, "fetchModelsOfType:error:", v18, &v105);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (char *)v105;

  if (!v20)
  {
    v43 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to fetch override models: %@"), v21));
    v44 = v15;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v46;
      v108 = 2112;
      v109 = v21;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch override models: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    v47 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    goto LABEL_62;
  }
  if (!objc_msgSend(v20, "count"))
  {
    v47 = 1;
    goto LABEL_62;
  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v15, "localZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createMirrorInputWithError:", a6);
  v23 = objc_claimAutoreleasedReturnValue();

  v91 = (void *)v23;
  if (!v23)
  {
    v47 = 0;
    goto LABEL_61;
  }
  v96 = v15;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v24 = v20;
  v88 = v10;
  v87 = v21;
  v93 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
  if (!v93)
  {

    v25 = 0;
    v47 = 1;
    goto LABEL_50;
  }
  obj = v24;
  v84 = v20;
  v85 = a6;
  v86 = v11;
  v92 = 0;
  v25 = 0;
  v94 = *(_QWORD *)v102;
  v89 = v12;
  while (2)
  {
    for (i = 0; i != v93; ++i)
    {
      if (*(_QWORD *)v102 != v94)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "hmbModelID");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v96, "localZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v25;
      objc_msgSend(v28, "externalIDForModelID:error:", v27, &v100);
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      v30 = (char *)v100;

      if (!v29)
      {
        v48 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to fetch externalID for modelID %@: %@"), v27, v30));
        v49 = v96;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v107 = v51;
          v108 = 2112;
          v109 = v27;
          v110 = 2112;
          v111 = v30;
          _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch externalID for modelID %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v48);
        v21 = v87;
        goto LABEL_40;
      }
      v99 = v30;
      objc_msgSend(MEMORY[0x24BDB91E8], "recordIDFromExternalID:error:", v29, &v99);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v99;

      if (!v31)
      {
        v52 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to convert externalID (%@) to CKRecordID for modelID %@: %@"), v29, v27, v32));
        v53 = v96;
        v54 = v96;
        HMFGetOSLogHandle();
        v55 = objc_claimAutoreleasedReturnValue();
        v21 = v87;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v107 = v56;
          v108 = 2112;
          v109 = v29;
          v110 = 2112;
          v111 = v27;
          v112 = 2112;
          v113 = v32;
          _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert externalID (%@) to CKRecordID for modelID %@: %@", buf, 0x2Au);

        }
        v31 = 0;
LABEL_39:

        objc_autoreleasePoolPop(v52);
        v30 = (char *)v32;
        v10 = v88;
LABEL_40:

        v25 = v30;
        goto LABEL_41;
      }
      objc_msgSend(v31, "zoneID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "zoneName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", v10);

      if (v35)
      {
        objc_msgSend(v31, "hmbDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "markWithFormat:", CFSTR("Removing override for %@"), v36);

        v37 = (void *)MEMORY[0x227676638]();
        v38 = v96;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "hmbDescription");
          v41 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v107 = v40;
          v108 = 2112;
          v109 = v41;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Removing override for %@", buf, 0x16u);

          v10 = v88;
        }

        objc_autoreleasePoolPop(v37);
        v98 = v32;
        v42 = objc_msgSend(v91, "stageRemovalForModelWithID:error:", v27, &v98);
        v25 = v98;

        if ((v42 & 1) == 0)
        {
          objc_msgSend(v31, "hmbDescription");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "markWithFormat:", CFSTR("Failed to remove model %@: %@"), v57, v25);

          v95 = MEMORY[0x227676638]();
          v58 = v38;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "hmbDescription");
            v60 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v107 = v59;
            v108 = 2112;
            v109 = v60;
            v110 = 2112;
            v111 = (char *)v25;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model %@: %@", buf, 0x20u);

          }
          v32 = v25;
          v12 = v89;
          v21 = v87;
          v52 = (void *)v95;
          v53 = v96;
          goto LABEL_39;
        }
        ++v92;
        v12 = v89;
      }
      else
      {
        v25 = v32;
      }

    }
    v21 = v87;
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    if (v93)
      continue;
    break;
  }
LABEL_41:

  v47 = v25 == 0;
  if (!v25 && v92)
  {
    v61 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Committing removal of %lu overrides"), v92));
    v62 = v96;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    v11 = v86;
    v20 = v84;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v64 = v12;
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v107 = v65;
      v108 = 2048;
      v109 = v92;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@Committing removal of %lu overrides", buf, 0x16u);

      v12 = v64;
    }

    objc_autoreleasePoolPop(v61);
    v97 = 0;
    v47 = objc_msgSend(v91, "frmSyncCommitWithOptions:error:", v86, &v97);
    v66 = (char *)v97;
    v67 = v66;
    if ((v47 & 1) != 0)
    {
      v68 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Committed removal of overrides successfully")));
      v69 = v62;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v71 = v12;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v107 = v72;
        _os_log_impl(&dword_2218F0000, v70, OS_LOG_TYPE_INFO, "%{public}@Committed removal of overrides successfully", buf, 0xCu);

        v12 = v71;
        v21 = v87;
      }

      objc_autoreleasePoolPop(v68);
    }
    else
    {
      v78 = (void *)MEMORY[0x227676638](objc_msgSend(v12, "markWithFormat:", CFSTR("Failed to commit: %@"), v66));
      v79 = v62;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v81 = v12;
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v107 = v82;
        v108 = 2112;
        v109 = v67;
        _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

        v12 = v81;
        v21 = v87;
      }

      objc_autoreleasePoolPop(v78);
      if (v85)
        *v85 = objc_retainAutorelease(v67);
    }

    v25 = 0;
    v10 = v88;
    goto LABEL_60;
  }
  a6 = v85;
  v11 = v86;
  v20 = v84;
  if (!v92)
  {
LABEL_50:
    objc_msgSend(v12, "markWithFormat:", CFSTR("No matching models found, aborting"));
    v73 = (void *)MEMORY[0x227676638]();
    v74 = v96;
    HMFGetOSLogHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v76 = v12;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v107 = v77;
      _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_INFO, "%{public}@No matching models found, aborting", buf, 0xCu);

      v12 = v76;
      v21 = v87;
    }

    objc_autoreleasePoolPop(v73);
    v10 = v88;
  }
  objc_msgSend(v91, "abort");
  if (a6)
  {
    v25 = objc_retainAutorelease(v25);
    *a6 = v25;
  }
LABEL_60:

LABEL_61:
LABEL_62:

  return v47;
}

- (BOOL)__removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 activity:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  if (v12 && v13)
  {
    v17 = objc_alloc(MEMORY[0x24BDB91F8]);
    v18 = (void *)objc_msgSend(v17, "initWithZoneName:ownerName:", v12, *MEMORY[0x24BDB8E88]);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v13, v18);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __removeOverridesForRecordIDs:options:activity:error:](self, "__removeOverridesForRecordIDs:options:activity:error:", v20, v14, v15, a7);

  }
  else
  {
    if (v12)
      v22 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __removeOverridesForZoneName:options:activity:error:](self, "__removeOverridesForZoneName:options:activity:error:", v12, v14, v15, a7);
    else
      v22 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __removeAllOverridesWithOptions:activity:error:](self, "__removeAllOverridesWithOptions:activity:error:", v14, v15, a7);
    v21 = v22;
  }

  return v21;
}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____addOverrides_replace_options_activity_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  void *v34;
  void *v35;
  _BYTE *v36;
  _BYTE *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v39 = 0;
  objc_msgSend(v7, "externalID:", &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  v11 = v39;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 | v14)
    {
      v36 = a4;
      +[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel modelIDForRecordID:](HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel, "modelIDForRecordID:", v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:]([HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel alloc], "initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:", v35, *(_QWORD *)(a1 + 48), v13, v14);
      v16 = *(void **)(a1 + 56);
      v38 = v11;
      v34 = v12;
      v17 = objc_msgSend(v16, "stageAdditionForModel:externalID:externalData:error:", v15, v9, v12, &v38);
      obj = v38;
      v18 = v38;

      if ((v17 & 1) == 0)
      {
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v7, "hmbDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v18;
        objc_msgSend(v19, "markWithFormat:", CFSTR("Failed to update model for %@: %@"), v20, v18);

        v21 = (void *)MEMORY[0x227676638]();
        v22 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v21;
          objc_msgSend(v7, "hmbDescription");
          v24 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v30;
          v42 = 2112;
          v43 = v24;
          v25 = (void *)v24;
          v44 = 2112;
          v45 = v32;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model for %@: %@", buf, 0x20u);

          v21 = v31;
        }

        objc_autoreleasePoolPop(v21);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), obj);
        *v36 = 1;
        v18 = v32;
      }

      v11 = v18;
      v12 = v34;
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Failed to determine externalID: %@"), v11));
    v27 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = a4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v29;
      v42 = 2112;
      v43 = (uint64_t)v11;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);

      a4 = v37;
    }

    objc_autoreleasePoolPop(v26);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v10);
    *a4 = 1;
  }

}

void __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____shutdownLocalZones_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markWithFormat:", CFSTR("Failed to shut down local zone %@"), v11);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "zoneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

+ (id)__overrideParentModelID
{
  if (__overrideParentModelID_onceToken != -1)
    dispatch_once(&__overrideParentModelID_onceToken, &__block_literal_global_130750);
  return (id)__overrideParentModelID_overrideParentModelID;
}

+ (BOOL)__errorIsNotFound:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isHMFError") && objc_msgSend(v3, "code") == 2)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isHMError"))
  {
    v4 = objc_msgSend(v3, "code") == 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_Records____overrideParentModelID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("56e3068a-cb39-4cef-b4a3-78d7cc58e7d5"));
  v1 = (void *)__overrideParentModelID_overrideParentModelID;
  __overrideParentModelID_overrideParentModelID = v0;

}

- (void)__updateChangeTokenWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  os_unfair_lock_s *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v40;
  NSObject *v41;
  void *v42;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v51;
  NSObject *v52;
  void *v53;
  HMDAssertionLogEvent *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "originalDatabaseChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseChangeToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if (v8)
  {
    objc_msgSend(v4, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "databaseChangeToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmbDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markWithFormat:", CFSTR("Database change token has not been updated: %@"), v11);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "databaseChangeToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hmbDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v15;
      v59 = 2112;
      v60 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Database change token has not been updated: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_msgSend(v4, "databaseChangeToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v50 = (void *)MEMORY[0x227676638]();
      v51 = self;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v53;
        _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Should never have a nil change token here", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v50);
      v54 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Should never have a nil change token here"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "submitLogEvent:", v54);

    }
    objc_msgSend(v4, "activity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "databaseChangeToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmbDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "markWithFormat:", CFSTR("Updating database change token: %@"), v21);

    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "databaseChangeToken");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hmbDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v25;
      v59 = 2112;
      v60 = v27;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updating database change token: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v23, "cloudDatabase");
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    v29 = (os_unfair_lock_s *)&v28[*MEMORY[0x24BE4ED40]];
    os_unfair_lock_lock_with_options();

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v23, "cloudDatabase");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "databaseStateForDatabaseScope:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "databaseChangeToken");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setServerChangeToken:", v32);

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v23, "cloudDatabase");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stateZone");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "update:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v29);
    objc_msgSend(v4, "activity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v36)
    {
      objc_msgSend(v37, "markWithFormat:", CFSTR("Failed to update database state model: %@"), v36);

      v39 = (void *)MEMORY[0x227676638]();
      v40 = v23;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v42;
        v59 = 2112;
        v60 = v36;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state model: %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v37, "markWithFormat:", CFSTR("Updated database change token successfully"));

      v39 = (void *)MEMORY[0x227676638]();
      v43 = v23;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v44;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Updated database change token successfully", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v39);
  }
  objc_msgSend(v4, "requestedRecordIDs");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](self, "internalState");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setLastSynchronizedRecordIDs:", v45);

  objc_msgSend(v4, "activity");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __saveInternalStateWithActivity:](self, "__saveInternalStateWithActivity:", v47);

  objc_msgSend(v4, "modifiedRecordIDs");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "copy");
  objc_msgSend(v4, "finishWithResult:", v49);

}

- (void)__removeDeletedZonesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneInfoMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __111__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_RemoveDeletedZones____removeDeletedZonesWithFetchInfo___block_invoke;
  v11[3] = &unk_24E78B4B8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](self, "cloudDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v8, "handleRemovedZoneIDs:userInitiated:", v9, 0);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __updateChangeTokenWithFetchInfo:](self, "__updateChangeTokenWithFetchInfo:", v4);
}

void __111__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_RemoveDeletedZones____removeDeletedZonesWithFetchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "zoneWasDeleted"))
  {
    v5 = objc_alloc(MEMORY[0x24BE4EC70]);
    objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cloudDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publicDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithContainerID:scope:zoneID:", v7, objc_msgSend(v9, "scope"), v11);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 useAnonymousRequests:(BOOL)a5 ownerQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  uint64_t v16;
  NAScheduler *workQueueScheduler;
  HMBLocalZone *localZone;
  uint64_t v19;
  HMBLocalZoneID *zoneID;
  uint64_t v21;
  NAFuture *lastAsyncFuture;
  uint64_t v23;
  NAPromise *startupPromise;
  uint64_t v25;
  NAPromise *shutdownPromise;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirror;
  v14 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror init](&v29, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_cloudDatabase, a4);
    objc_storeStrong((id *)&v15->_localDatabase, a3);
    v15->_useAnonymousRequests = a5;
    objc_storeStrong((id *)&v15->_workQueue, a6);
    objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    workQueueScheduler = v15->_workQueueScheduler;
    v15->_workQueueScheduler = (NAScheduler *)v16;

    localZone = v15->_localZone;
    v15->_localZone = 0;

    +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID sharedInstance](HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID, "sharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    zoneID = v15->_zoneID;
    v15->_zoneID = (HMBLocalZoneID *)v19;

    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v21 = objc_claimAutoreleasedReturnValue();
    lastAsyncFuture = v15->_lastAsyncFuture;
    v15->_lastAsyncFuture = (NAFuture *)v21;

    v23 = objc_opt_new();
    startupPromise = v15->_startupPromise;
    v15->_startupPromise = (NAPromise *)v23;

    v25 = objc_opt_new();
    shutdownPromise = v15->_shutdownPromise;
    v15->_shutdownPromise = (NAPromise *)v25;

    v27 = v15;
  }

  return v15;
}

- (BOOL)isRunning
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v2, "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)isShuttingDown
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_shuttingDown;
}

- (NAFuture)lastAsyncFuture
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_lastAsyncFuture;
}

- (void)setLastAsyncFuture:(id)a3
{
  NAFuture *v4;
  NSObject *v5;
  NAFuture *lastAsyncFuture;

  v4 = (NAFuture *)a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  lastAsyncFuture = self->_lastAsyncFuture;
  self->_lastAsyncFuture = v4;

}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)internalState
{
  NSObject *v3;
  void *v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v6;
  NSObject *v7;
  void *v8;
  HMDAssertionLogEvent *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror isRunning](self, "isRunning"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Should only get internal state while running", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Should only get internal state while running"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submitLogEvent:", v9);

  }
  return self->_internalState;
}

- (id)__asyncFutureWithActivity:(id)a3 ignoreErrors:(BOOL)a4 block:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__180514;
  v28 = __Block_byref_object_dispose__180515;
  v29 = 0;
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke;
  v20[3] = &unk_24E797938;
  v23 = &v24;
  v20[4] = self;
  v11 = v8;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  objc_msgSend(v11, "performBlock:", v20);
  if (v6)
  {
    v13 = (void *)v25[5];
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_141;
    v18[3] = &unk_24E7927B0;
    v19 = v11;
    objc_msgSend(v13, "recover:", v18);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v25[5];
    v25[5] = v14;

  }
  v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)startUpWithLocalZone:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Startup"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke;
  v8[3] = &unk_24E79BBD0;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (id)destroy
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 58, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)flush
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__180514;
  v15 = __Block_byref_object_dispose__180515;
  v16 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Flush"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke;
  v7[3] = &unk_24E79C0A8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  objc_msgSend(v4, "performBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (id)shutdown
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__180514;
  v15 = __Block_byref_object_dispose__180515;
  v16 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Shutdown"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke;
  v7[3] = &unk_24E79C0A8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  objc_msgSend(v4, "performBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (NAFuture)startupFuture
{
  void *v2;
  void *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror startupPromise](self, "startupPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

- (NAFuture)shutdownFuture
{
  void *v2;
  void *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror shutdownPromise](self, "shutdownPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

- (id)cloudFetchNeededForRecordIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror isRunning](self, "isRunning"))
  {
    if (v6)
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](self, "internalState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastSynchronizedRecordIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isSubsetOfSet:", v9) ^ 1;

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)fetchCloudChangesForRecordIDs:(id)a3 options:(id)a4 ignoreLastSynchronizedRecords:(BOOL)a5 xpcActivity:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v17 = (void *)objc_msgSend(v15, "copy");
  v18 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v12, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:", v19);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke;
  v26[3] = &unk_24E796508;
  v27 = v20;
  v28 = self;
  v33 = a5;
  v29 = v17;
  v30 = v12;
  v31 = v13;
  v32 = v14;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v17;
  v25 = v20;
  objc_msgSend(v25, "performBlock:", v26);

}

- (void)_fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 desiredKeys:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v18 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v14, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:", v19);

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke;
  v27[3] = &unk_24E798170;
  v28 = v20;
  v29 = self;
  v30 = v14;
  v31 = v12;
  v32 = v13;
  v33 = v15;
  v34 = v16;
  v21 = v16;
  v22 = v15;
  v23 = v13;
  v24 = v12;
  v25 = v14;
  v26 = v20;
  objc_msgSend(v26, "performBlock:", v27);

}

- (void)fetchCloudRecordIDsForZoneID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __105__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudRecordIDsForZoneID_options_completion___block_invoke;
  v13[3] = &unk_24E78DAA8;
  v14 = v8;
  v12 = v8;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _fetchCloudRecordsForZoneID:recordID:options:desiredKeys:completion:](self, "_fetchCloudRecordsForZoneID:recordID:options:desiredKeys:completion:", v10, 0, v9, MEMORY[0x24BDBD1A8], v13);

}

- (id)desiredKeys
{
  _QWORD v3[13];

  v3[12] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("CD_productGroup");
  v3[1] = CFSTR("CD_productGroup_ckAsset");
  v3[2] = CFSTR("CD_productNumber");
  v3[3] = CFSTR("CD_productNumber_ckAsset");
  v3[4] = CFSTR("CD_networkDeclarations");
  v3[5] = CFSTR("CD_networkDeclarations_ckAsset");
  v3[6] = CFSTR("CD_networkDeclarationsSignature");
  v3[7] = CFSTR("CD_networkDeclarationsSignature_ckAsset");
  v3[8] = CFSTR("CD_pairedMetadata");
  v3[9] = CFSTR("CD_pairedMetadata_ckAsset");
  v3[10] = CFSTR("CD_pairedMetadataSignature");
  v3[11] = CFSTR("CD_pairedMetadataSignature_ckAsset");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fetchCloudRecordsForZoneID:(id)a3 recordID:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror desiredKeys](self, "desiredKeys");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _fetchCloudRecordsForZoneID:recordID:options:desiredKeys:completion:](self, "_fetchCloudRecordsForZoneID:recordID:options:desiredKeys:completion:", v13, v12, v11, v15, v10);

}

- (id)fetchAllDataForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__180514;
  v43 = __Block_byref_object_dispose__180515;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__180514;
  v37 = __Block_byref_object_dispose__180515;
  v38 = 0;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v9, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:", v12);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchAllDataForRecordIDs_options_error___block_invoke;
  v26[3] = &unk_24E78DAD0;
  v14 = v13;
  v27 = v14;
  v15 = v8;
  v28 = v15;
  v29 = self;
  v31 = &v39;
  v16 = v9;
  v30 = v16;
  v32 = &v33;
  v17 = (id)objc_msgSend(v14, "performBlock:", v26);
  v18 = (void *)v40[5];
  if (v18)
  {
    v19 = v18;
  }
  else
  {
    if (a5)
    {
      v17 = objc_retainAutorelease((id)v34[5]);
      *a5 = v17;
    }
    v20 = (void *)MEMORY[0x227676638](v17);
    v21 = self;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v34[5];
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch paired metadata dictionary with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

- (id)_fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__180514;
  v37 = __Block_byref_object_dispose__180515;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__180514;
  v31 = __Block_byref_object_dispose__180515;
  v32 = 0;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v9, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:", v12);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchAllDataForZoneName_options_error___block_invoke;
  v20[3] = &unk_24E78DAD0;
  v14 = v13;
  v21 = v14;
  v15 = v8;
  v22 = v15;
  v23 = self;
  v25 = &v33;
  v16 = v9;
  v24 = v16;
  v26 = &v27;
  objc_msgSend(v14, "performBlock:", v20);
  v17 = (void *)v34[5];
  if (v17)
  {
    v18 = v17;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease((id)v28[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)fetchAllDataWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _fetchAllDataForZoneName:options:error:](self, "_fetchAllDataForZoneName:options:error:", 0, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchAllDataForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _fetchAllDataForZoneName:options:error:](self, "_fetchAllDataForZoneName:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)removeAllLocalRulesWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__180514;
  v25 = __Block_byref_object_dispose__180515;
  v26 = 0;
  v8 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:", v9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeAllLocalRulesWithOptions_error___block_invoke;
  v15[3] = &unk_24E7989B8;
  v11 = v10;
  v16 = v11;
  v17 = self;
  v19 = &v27;
  v12 = v6;
  v18 = v12;
  v20 = &v21;
  objc_msgSend(v11, "performBlock:", v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v13 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)fetchOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__180514;
  v43 = __Block_byref_object_dispose__180515;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__180514;
  v37 = __Block_byref_object_dispose__180515;
  v38 = 0;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v9, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:", v12);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchOverridesForRecordIDs_options_error___block_invoke;
  v26[3] = &unk_24E78DAD0;
  v14 = v13;
  v27 = v14;
  v15 = v8;
  v28 = v15;
  v29 = self;
  v31 = &v39;
  v16 = v9;
  v30 = v16;
  v32 = &v33;
  v17 = (id)objc_msgSend(v14, "performBlock:", v26);
  v18 = (void *)v40[5];
  if (v18)
  {
    v19 = v18;
  }
  else
  {
    if (a5)
    {
      v17 = objc_retainAutorelease((id)v34[5]);
      *a5 = v17;
    }
    v20 = (void *)MEMORY[0x227676638](v17);
    v21 = self;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v34[5];
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@No overrides fetched with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

- (id)fetchAllOverridesWithOptions:(id)a3 error:(id *)a4
{
  return -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _fetchOverridesForZoneName:options:error:](self, "_fetchOverridesForZoneName:options:error:", 0, a3, a4);
}

- (id)_fetchOverridesForZoneName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__180514;
  v36 = __Block_byref_object_dispose__180515;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__180514;
  v30 = __Block_byref_object_dispose__180515;
  v31 = 0;
  v11 = objc_alloc(MEMORY[0x24BE3F138]);
  objc_msgSend(v9, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:", v12);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchOverridesForZoneName_options_error___block_invoke;
  v20[3] = &unk_24E78DAD0;
  v20[4] = self;
  v24 = &v32;
  v14 = v8;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v25 = &v26;
  objc_msgSend(v16, "performBlock:", v20);
  v17 = (void *)v33[5];
  if (v17)
  {
    v18 = v17;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease((id)v27[5]);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  int v17;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__180514;
  v31 = __Block_byref_object_dispose__180515;
  v32 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("AddOverrides"));
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __92__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_addOverrides_replace_options_error___block_invoke;
  v19[3] = &unk_24E78DAF8;
  v14 = v13;
  v20 = v14;
  v15 = v10;
  v21 = v15;
  v22 = self;
  v24 = &v33;
  v26 = a4;
  v16 = v11;
  v23 = v16;
  v25 = &v27;
  objc_msgSend(v14, "performBlock:", v19);
  v17 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((_BYTE *)v34 + 24))
    *a6 = objc_retainAutorelease((id)v28[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17 != 0;
}

- (BOOL)removeOverridesForRecordIDs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__180514;
  v27 = __Block_byref_object_dispose__180515;
  v28 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("RemoveOverridesForRecordIDs"));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __99__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeOverridesForRecordIDs_options_error___block_invoke;
  v17[3] = &unk_24E78DAD0;
  v17[4] = self;
  v21 = &v29;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v11;
  v20 = v14;
  v22 = &v23;
  objc_msgSend(v14, "performBlock:", v17);
  v15 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((_BYTE *)v30 + 24))
    *a5 = objc_retainAutorelease((id)v24[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15 != 0;
}

- (BOOL)removeAllOverridesWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;

  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  LOBYTE(a4) = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _removeOverridesForZoneName:recordName:options:error:](self, "_removeOverridesForZoneName:recordName:options:error:", 0, 0, v6, a4);
  return (char)a4;
}

- (BOOL)removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  LOBYTE(a6) = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror _removeOverridesForZoneName:recordName:options:error:](self, "_removeOverridesForZoneName:recordName:options:error:", v12, v11, v10, a6);
  return (char)a6;
}

- (BOOL)_removeOverridesForZoneName:(id)a3 recordName:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__180514;
  v32 = __Block_byref_object_dispose__180515;
  v33 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("RemoveOverrides"));
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__removeOverridesForZoneName_recordName_options_error___block_invoke;
  v21[3] = &unk_24E794828;
  v21[4] = self;
  v26 = &v34;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v14;
  v25 = v18;
  v27 = &v28;
  objc_msgSend(v18, "performBlock:", v21);
  v19 = *((unsigned __int8 *)v35 + 24);
  if (a6 && !*((_BYTE *)v35 + 24))
    *a6 = objc_retainAutorelease((id)v29[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19 != 0;
}

- (void)__saveInternalStateWithActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v24;
  NSObject *v25;
  void *v26;
  HMDAssertionLogEvent *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](self, "internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have internal state", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must have internal state"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "submitLogEvent:", v27);

  }
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(v4, "markWithFormat:", CFSTR("Saving internal state model")));
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Saving internal state model", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror localZone](v8, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](v8, "internalState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "update:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](v8, "internalState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmbModelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markWithFormat:", CFSTR("Failed to save internal state model %@: %@"), v16, v14);

    v17 = (void *)MEMORY[0x227676638]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror internalState](v18, "internalState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hmbModelID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to save internal state model %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (HMBLocalZoneID)zoneID
{
  return self->_zoneID;
}

- (HMBLocalZone)localZone
{
  return self->_localZone;
}

- (void)setLocalZone:(id)a3
{
  objc_storeStrong((id *)&self->_localZone, a3);
}

- (void)setInternalState:(id)a3
{
  objc_storeStrong((id *)&self->_internalState, a3);
}

- (void)setShuttingDown:(BOOL)a3
{
  self->_shuttingDown = a3;
}

- (HMBCloudDatabase)cloudDatabase
{
  return self->_cloudDatabase;
}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)useAnonymousRequests
{
  return self->_useAnonymousRequests;
}

- (NAPromise)startupPromise
{
  return self->_startupPromise;
}

- (NAPromise)shutdownPromise
{
  return self->_shutdownPromise;
}

- (NAScheduler)workQueueScheduler
{
  return self->_workQueueScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueueScheduler, 0);
  objc_storeStrong((id *)&self->_shutdownPromise, 0);
  objc_storeStrong((id *)&self->_startupPromise, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_storeStrong((id *)&self->_cloudDatabase, 0);
  objc_storeStrong((id *)&self->_internalState, 0);
  objc_storeStrong((id *)&self->_lastAsyncFuture, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

uint64_t __110__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__removeOverridesForZoneName_recordName_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 64);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v2, "__removeOverridesForZoneName:recordName:options:activity:error:", v3, v4, v5, v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  return objc_msgSend(*(id *)(a1 + 64), "invalidate");
}

uint64_t __99__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeOverridesForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v6 + 40);
    v7 = objc_msgSend(v2, "__removeOverridesForRecordIDs:options:activity:error:", v3, v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return objc_msgSend(*(id *)(a1 + 56), "invalidate");
}

uint64_t __92__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_addOverrides_replace_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __descriptionsForRecordIDArray(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markWithFormat:", CFSTR("Applying overrides for recordIDs: %@"), v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __descriptionsForRecordIDArray(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Applying overrides for recordIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(*(id *)(a1 + 48), "isRunning"))
  {
    v11 = *(unsigned __int8 *)(a1 + 80);
    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v16 + 40);
    v17 = objc_msgSend(v12, "__addOverrides:replace:options:activity:error:", v14, v11, v13, v15, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchOverridesForZoneName_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v6 + 40);
    objc_msgSend(v2, "__fetchOverridesForZoneName:options:activity:error:", v3, v4, v5, &obj);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }

  return objc_msgSend(*(id *)(a1 + 56), "invalidate");
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchOverridesForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  __descriptionsForRecordIDSet(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markWithFormat:", CFSTR("Fetching overrides for recordIDs: %@"), v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __descriptionsForRecordIDSet(*(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching overrides for recordIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(*(id *)(a1 + 48), "isRunning"))
  {
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v9, "__fetchOverridesForRecordIDs:options:activity:error:", v11, v10, v12, &obj);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v13 + 40), obj);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@No local zone, can't fetch overrides", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __94__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_removeAllLocalRulesWithOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Removing all local rules")));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all local rules", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 40), "isRunning"))
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v6, "__removeAllLocalRulesWithOptions:activity:error:", v7, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "internalState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastSynchronizedRecordIDs:", v11);

    objc_msgSend(*(id *)(a1 + 40), "__saveInternalStateWithActivity:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchAllDataForZoneName_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Fetching records with zone name '%@'"), *(_QWORD *)(a1 + 40)));
  v3 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records with zone name '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 48), "isRunning"))
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v7, "__fetchAllDataForZoneName:options:activity:error:", v9, v8, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __96__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchAllDataForRecordIDs_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  __descriptionsForRecordIDSet(*(void **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markWithFormat:", CFSTR("Fetching records for recordIDs: %@"), v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __descriptionsForRecordIDSet(*(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching records for recordIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(*(id *)(a1 + 48), "isRunning"))
  {
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v9, "__fetchAllDataForRecordIDs:options:activity:error:", v11, v10, v12, &obj);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v13 + 40), obj);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch paired metadata dictionary due to nil local zone", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __105__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudRecordIDsForZoneID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "recordID", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = *(_QWORD *)(a1 + 32);
    v13 = (void *)objc_msgSend(v5, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(a1[4], "markWithFormat:", CFSTR("Scheduling cloud fetch")));
  v3 = a1[5];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling cloud fetch", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = a1[4];
  v7 = a1[5];
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_187;
  v17[3] = &unk_24E78DA80;
  v18 = v6;
  v19 = a1[6];
  v20 = a1[7];
  v21 = a1[8];
  v22 = a1[9];
  objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v18, 0, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_2;
  v13[3] = &unk_24E78EBF0;
  v10 = a1[4];
  v11 = a1[5];
  v14 = v10;
  v15 = v11;
  v16 = a1[10];
  v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v13);

}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_187(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo *v11;

  v5 = a3;
  v6 = a2;
  v7 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo alloc];
  v8 = a1[4];
  v9 = a1[5];
  objc_msgSend(v6, "cloudDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchRecordsInfo initWithActivity:options:promise:database:useAnonymousRequests:zoneID:recordID:desiredKeys:](v7, "initWithActivity:options:promise:database:useAnonymousRequests:zoneID:recordID:desiredKeys:", v8, v9, v5, v10, objc_msgSend(v6, "useAnonymousRequests"), a1[6], a1[7], a1[8]);

  objc_msgSend(v6, "__fetchCloudRecordsWithFetchInfo:", v11);
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_3;
  v12[3] = &unk_24E799A68;
  v11 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = v5;
  v8 = *(id *)(a1 + 48);
  v15 = v6;
  v16 = v8;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "performBlock:", v12);

}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_3(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_4;
  block[3] = &unk_24E799A68;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  v10 = a1[8];
  v9 = a1[7];
  dispatch_async(v2, block);

}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_5;
  v5[3] = &unk_24E799A68;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v10 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlock:", v5);

}

uint64_t __125__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror__fetchCloudRecordsForZoneID_recordID_options_desiredKeys_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "markWithFormat:", CFSTR("Cloud fetch completed successfully")));
    v5 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud fetch completed successfully", buf, 0xCu);

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638](objc_msgSend(v2, "markWithFormat:", CFSTR("Cloud fetch completed unsuccessfully: %@"), *(_QWORD *)(a1 + 56)));
    v5 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cloud fetch completed unsuccessfully: %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Scheduling cloud sync")));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling cloud sync", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_167;
  v17[3] = &unk_24E78DA58;
  v18 = v6;
  v19 = *(id *)(a1 + 48);
  v22 = *(_BYTE *)(a1 + 80);
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v18, 0, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_179;
  v13[3] = &unk_24E7908D8;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v14 = v10;
  v15 = v11;
  v16 = *(id *)(a1 + 72);
  v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v13);

}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  char *v27;
  os_unfair_lock_s *v28;
  void *v29;
  void *v30;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v47 = a3;
  v6 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Beginning cloud sync")));
  v7 = v5;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning cloud sync", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v10 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Ignoring last fetched accessories")));
      v11 = v7;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring last fetched accessories", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
LABEL_15:
      objc_msgSend(v7, "cloudDatabase");
      v27 = (char *)objc_claimAutoreleasedReturnValue();
      v28 = (os_unfair_lock_s *)&v27[*MEMORY[0x24BE4ED40]];
      os_unfair_lock_lock_with_options();

      objc_msgSend(v7, "cloudDatabase");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "databaseStateForDatabaseScope:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "serverChangeToken");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(v28);
      v31 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo alloc];
      v32 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 48);
      v33 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v7, "cloudDatabase");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v7, "useAnonymousRequests");
      v37 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "internalState");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastSynchronizedRecordIDs");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v45) = v36;
      v40 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorFetchChangesInfo initWithActivity:options:databaseChangeToken:promise:xpcActivity:database:useAnonymousRequests:recordIDs:lastSynchronizedRecordIDs:](v31, "initWithActivity:options:databaseChangeToken:promise:xpcActivity:database:useAnonymousRequests:recordIDs:lastSynchronizedRecordIDs:", v32, v34, v46, v47, v33, v35, v45, v37, v39);

      objc_msgSend(v7, "__fetchDatabaseChangesWithFetchInfo:", v40);
      goto LABEL_16;
    }
    v18 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v7, "internalState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastSynchronizedRecordIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minusSet:", v20);

    v21 = objc_msgSend(v18, "count");
    v22 = *(void **)(a1 + 32);
    if (v21)
    {
      v23 = (void *)MEMORY[0x227676638](objc_msgSend(v22, "markWithFormat:", CFSTR("Set of interested accessories has grown since last fetch: %@"), v18));
      v24 = v7;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v26;
        v50 = 2112;
        v51 = v18;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Set of interested accessories has grown since last fetch: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);

      goto LABEL_15;
    }
    v41 = (void *)MEMORY[0x227676638](objc_msgSend(v22, "markWithFormat:", CFSTR("Set of interested accessories has not grown, skipping fetch")));
    v42 = v7;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v44;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Set of interested accessories has not grown, skipping fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    objc_msgSend(v47, "finishWithNoResult");

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Not interested in any records, skipping fetch")));
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Not interested in any records, skipping fetch", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v47, "finishWithNoResult");
  }
LABEL_16:

}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_2;
  v11[3] = &unk_24E799A68;
  v10 = *(int8x16_t *)(a1 + 32);
  v7 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performBlock:", v11);

}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_3;
  block[3] = &unk_24E799A68;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  v9 = a1[7];
  v10 = a1[8];
  dispatch_async(v2, block);

}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_4;
  v6[3] = &unk_24E799A68;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performBlock:", v6);

}

void __148__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_fetchCloudChangesForRecordIDs_options_ignoreLastSynchronizedRecords_xpcActivity_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  NAEmptyResult();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
    v4 = 0;
  else
    v4 = *(void **)(a1 + 32);
  v5 = v4;

  v6 = *(void **)(a1 + 40);
  if (v2)
  {
    v7 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "markWithFormat:", CFSTR("Cloud sync completed successfully: %@"), v5));
    v8 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Cloud sync completed successfully: %@", buf, 0x16u);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "markWithFormat:", CFSTR("Cloud sync completed unsuccessfully: %@"), *(_QWORD *)(a1 + 56)));
    v8 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cloud sync completed unsuccessfully: %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

void __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Scheduling shutdown")));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling shutdown", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke_163;
  v11[3] = &unk_24E78DA30;
  v12 = v6;
  objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v12, 1, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __65__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_shutdown__block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v9 = a2;
  objc_msgSend(v9, "shutdownFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v7);
  objc_msgSend(v9, "__shutdownWithActivity:", *(_QWORD *)(a1 + 32));

}

void __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Scheduling flush")));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling flush", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke_155;
  v11[3] = &unk_24E78DA30;
  v12 = v6;
  objc_msgSend(v7, "__asyncFutureWithActivity:ignoreErrors:block:", v12, 1, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __62__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_flush__block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Flushed")));
  v8 = v5;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Flushed", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "finishWithNoResult");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "markWithFormat:", CFSTR("Scheduling startup")));
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Scheduling startup", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_150;
  block[3] = &unk_24E79BBD0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(v6, block);

}

void __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_150(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_2;
  v3[3] = &unk_24E79BBD0;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performBlock:", v3);

}

uint64_t __78__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_startUpWithLocalZone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__startupWithLocalZone:activity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "future");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2;
  block[3] = &unk_24E78DA08;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = v2;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v16 = v9;
  v17 = v10;
  v11 = v2;
  dispatch_async(v6, block);

}

id __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2_142;
  v8[3] = &unk_24E79C240;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v8);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2_142(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring error from promise: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;
  id v9;
  uint64_t v10;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_3;
  v6[3] = &unk_24E78DA08;
  v5 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v9 = v3;
  v10 = v4;
  objc_msgSend(v2, "performBlock:", v6);

}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "lastAsyncFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_4;
  v7[3] = &unk_24E78D9E0;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_copyWeak(&v12, &location);
  v9 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v10 = v4;
  v11 = v5;
  objc_msgSend(v2, "flatMap:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastAsyncFuture:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_5;
  v10 = &unk_24E798B60;
  v11 = *(id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 72));
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  dispatch_async(v4, &v7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "recoverIgnoringError", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  return v5;
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_5(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = a1[4];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_6;
  v3[3] = &unk_24E798B60;
  objc_copyWeak(&v7, a1 + 7);
  v4 = a1[5];
  v5 = a1[4];
  v6 = a1[6];
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v7);
}

void __102__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror___asyncFutureWithActivity_ignoreErrors_block___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "isShuttingDown"))
    {
      v4 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "markWithFormat:", CFSTR("Not running block because we're already shutting down")));
      v5 = v3;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v7;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Not running block because we're already shutting down", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v5;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Not running block because we're already shutting down", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v12 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishWithError:", v13);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_180616 != -1)
    dispatch_once(&logCategory__hmf_once_t4_180616, &__block_literal_global_180617);
  return (id)logCategory__hmf_once_v5_180618;
}

void __68__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_180618;
  logCategory__hmf_once_v5_180618 = v0;

}

- (void)__fetchDatabaseChangesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v41;
  _QWORD aBlock[4];
  id v43;
  NSObject *v44;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseChangeToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmbDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markWithFormat:", CFSTR("Checking for database changes with change token: %@"), v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "databaseChangeToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmbDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v12;
    v52 = 2112;
    v53 = v14;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Checking for database changes with change token: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x24BDB90A8]);
  objc_msgSend(v4, "databaseChangeToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithPreviousServerChangeToken:", v16);

  objc_msgSend(v17, "setCallbackQueue:", v5);
  objc_msgSend(v4, "operationGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setGroup:", v18);

  v19 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke;
  v46[3] = &unk_24E7909F8;
  v20 = v4;
  v47 = v20;
  v21 = v5;
  v48 = v21;
  v49 = v10;
  objc_msgSend(v17, "setRecordZoneWithIDChangedBlock:", v46);
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_11;
  aBlock[3] = &unk_24E7909F8;
  v22 = v20;
  v43 = v22;
  v23 = v21;
  v44 = v23;
  v45 = v10;
  v24 = _Block_copy(aBlock);
  objc_msgSend(v17, "setRecordZoneWithIDWasDeletedBlock:", v24);
  objc_msgSend(v17, "setRecordZoneWithIDWasPurgedBlock:", v24);
  v38[0] = v19;
  v38[1] = 3221225472;
  v38[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_17;
  v38[3] = &unk_24E790A20;
  v25 = v22;
  v39 = v25;
  v26 = v23;
  v40 = v26;
  v41 = v10;
  objc_msgSend(v17, "setChangeTokenUpdatedBlock:", v38);
  objc_initWeak((id *)buf, v10);
  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_22;
  v33[3] = &unk_24E790A70;
  v27 = v25;
  v34 = v27;
  v28 = v26;
  v35 = v28;
  v36 = v10;
  objc_copyWeak(&v37, (id *)buf);
  objc_msgSend(v17, "setFetchDatabaseChangesCompletionBlock:", v33);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v10, "cloudDatabase");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "publicDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addOperation:", v17);

  objc_msgSend(v27, "operationStartTime");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = v31 == 0;

  if ((_DWORD)v29)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setOperationStartTime:", v32);

  }
  objc_destroyWeak(&v37);

  objc_destroyWeak((id *)buf);
}

- (void)__fetchDatabaseChangesCompleted:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6
    && !-[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __canRecoverFromFetchDatabaseChangesError:fetchInfo:](self, "__canRecoverFromFetchDatabaseChangesError:fetchInfo:", v6, v8))
  {
    objc_msgSend(v8, "finishWithError:", v6);
  }
  else if (objc_msgSend(v8, "shouldRetry"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __retryFetchDatabaseChangesWithFetchInfo:](self, "__retryFetchDatabaseChangesWithFetchInfo:", v8);
  }
  else if (objc_msgSend(v8, "zonesHaveChanged"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __fetchVerificationCertificatesWithFetchInfo:](self, "__fetchVerificationCertificatesWithFetchInfo:", v8);
  }
  else if (objc_msgSend(v8, "zonesWereDeleted"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __removeDeletedZonesWithFetchInfo:](self, "__removeDeletedZonesWithFetchInfo:", v8);
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __updateChangeTokenWithFetchInfo:](self, "__updateChangeTokenWithFetchInfo:", v8);
  }

}

- (BOOL)__canRecoverFromFetchDatabaseChangesError:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!objc_msgSend(v6, "hmd_isCKError") || (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) != 0)
    goto LABEL_11;
  if (objc_msgSend(v6, "code") == 21)
  {
    objc_msgSend(v7, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markWithFormat:", CFSTR("Change token has expired: %@"), v6);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Change token has expired: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v7, "setDatabaseChangeToken:", 0);
    v14 = 1;
    objc_msgSend(v7, "setShouldRetry:", 1);
    goto LABEL_12;
  }
  objc_msgSend(v6, "hmbCloudKitRetryDelay");
  objc_msgSend(v7, "setRetryIntervalSeconds:");
  if (!objc_msgSend(v7, "shouldRetry"))
  {
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "markWithFormat:", CFSTR("Ignoring non-fatal error: %@"), v6);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v19;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v14 = 1;
LABEL_12:

  return v14;
}

- (void)__retryFetchDatabaseChangesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  dispatch_time_t v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "retryIntervalSeconds");
  v7 = v6;
  v8 = v6 > 0.0;
  objc_msgSend(v4, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v10 = "retry the fetch";
  else
    v10 = "fetch the next batch of changed zones";
  objc_msgSend(v4, "retryIntervalSeconds");
  objc_msgSend(v9, "markWithFormat:", CFSTR("Will %s in %lu seconds"), v10, (unint64_t)v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retryIntervalSeconds");
    *(_DWORD *)buf = 138543874;
    v26 = v15;
    v27 = 2080;
    v28 = v10;
    v29 = 2048;
    v30 = (unint64_t)v16;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Will %s in %lu seconds", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v4, "retryIntervalSeconds");
  v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  objc_msgSend(v4, "setShouldRetry:", 0);
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v13);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](v13, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke;
  block[3] = &unk_24E790A98;
  v22 = v4;
  v20 = v4;
  objc_copyWeak(&v23, (id *)buf);
  v24 = v7 > 0.0;
  dispatch_after(v18, v19, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke_2;
  v3[3] = &unk_24E790A98;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v5);
}

void __120__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____retryFetchDatabaseChangesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
      v4 = "Retrying";
    else
      v4 = "Fetching the next batch of changed zones";
    objc_msgSend(*(id *)(a1 + 32), "databaseChangeToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markWithFormat:", CFSTR("%s, token: %@"), v4, v6);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 48))
        v11 = "Retrying";
      else
        v11 = "Fetching the next batch of changed zones";
      objc_msgSend(*(id *)(a1 + 32), "databaseChangeToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmbDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2080;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@%s, token: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "__fetchDatabaseChangesWithFetchInfo:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v14);

  }
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2;
  v6[3] = &unk_24E79A910;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_12;
  v6[3] = &unk_24E79A910;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_18;
  v6[3] = &unk_24E79A910;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_22(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_23;
  v13[3] = &unk_24E790A48;
  v14 = *(id *)(a1 + 40);
  v10 = v8;
  v15 = v10;
  v16 = *(id *)(a1 + 32);
  v11 = v7;
  v20 = a3;
  v12 = *(_QWORD *)(a1 + 48);
  v17 = v11;
  v18 = v12;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  objc_msgSend(v9, "performBlock:", v13);

  objc_destroyWeak(&v19);
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_23(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  id WeakRetained;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "hmbDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markWithFormat:", CFSTR("Database changes operation completed unsuccessfully, token: %@, error: %@, moreComing: %@"), v4, v5, v6);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "hmbDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v14 = "%{public}@Database changes operation completed unsuccessfully, token: %@, error: %@, moreComing: %@";
    v15 = v9;
    v16 = OS_LOG_TYPE_ERROR;
    v17 = 42;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markWithFormat:", CFSTR("Database changes operation completed successfully, token: %@, moreComing: %@"), v4, v18);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 64);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "hmbDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v13;
    v14 = "%{public}@Database changes operation completed successfully, token: %@, moreComing: %@";
    v15 = v9;
    v16 = OS_LOG_TYPE_DEFAULT;
    v17 = 32;
  }
  _os_log_impl(&dword_2218F0000, v15, v16, v14, buf, v17);

LABEL_7:
  objc_autoreleasePoolPop(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v20 = *(_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(a1 + 40) || v20)
      objc_msgSend(*(id *)(a1 + 48), "setDatabaseChangeToken:", v20);
    if (*(_BYTE *)(a1 + 80))
      objc_msgSend(*(id *)(a1 + 48), "setShouldRetry:", 1);
    objc_msgSend(WeakRetained, "__fetchDatabaseChangesCompleted:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "activity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "markWithFormat:", CFSTR("Mirror has been deallocated"));

    v22 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Mirror has been deallocated", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v26 = *(id *)(a1 + 40);
    if (!v26)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v26);

  }
}

uint64_t __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markWithFormat:", CFSTR("Change token was updated: %@"), v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Change token was updated: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  return objc_msgSend(*(id *)(a1 + 40), "setDatabaseChangeToken:", *(_QWORD *)(a1 + 48));
}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "zoneInfoMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    objc_msgSend(v4, "markWithFormat:", CFSTR("Zone was deleted: %@"), v5);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Zone was deleted: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v3, "markDeleted");
    objc_msgSend(*(id *)(a1 + 40), "markZonesDeleted");
  }
  else
  {
    objc_msgSend(v4, "markWithFormat:", CFSTR("Ignoring deleted zone: %@"), v5);

    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring deleted zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "zoneInfoMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (objc_msgSend(*(id *)(a1 + 48), "zoneName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("certificates")),
        v4,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "markWithFormat:", CFSTR("Zone has changes: %@"), v7);

    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Zone has changes: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if (v3)
    {
      objc_msgSend(v3, "markChanged");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "activity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "markWithFormat:", CFSTR("Forcing all zones to drop change tokens and refresh"));

      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Forcing all zones to drop change tokens and refresh", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 40), "zoneInfoMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_199345);

    }
    objc_msgSend(*(id *)(a1 + 40), "markZonesChanged");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "activity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "markWithFormat:", CFSTR("Ignoring changes from zone: %@"), v20);

    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "hmbDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changes from zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }

}

uint64_t __115__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchDatabaseChanges____fetchDatabaseChangesWithFetchInfo___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "forceRefresh");
}

- (BOOL)__createCloudZonesForFetchInfo:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v12;
  NSObject *v13;
  void *v14;
  char *v15;
  os_unfair_lock_s *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  _QWORD v23[4];
  id v24;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v25;
  id v26;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "zoneInfoMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v6, "activity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markWithFormat:", CFSTR("Creating cloud zones"));

    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating cloud zones", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__237174;
    v31 = __Block_byref_object_dispose__237175;
    v32 = 0;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v12, "cloudDatabase");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = (os_unfair_lock_s *)&v15[*MEMORY[0x24BE4ED40]];
    os_unfair_lock_lock_with_options();

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror cloudDatabase](v12, "cloudDatabase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "databaseStateForDatabaseScope:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "zoneInfoMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____createCloudZonesForFetchInfo_error___block_invoke;
    v23[3] = &unk_24E7986D0;
    v24 = v6;
    v25 = v12;
    p_buf = &buf;
    v20 = v18;
    v26 = v20;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v23);

    os_unfair_lock_unlock(v16);
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (void)__startUpCloudZonesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markWithFormat:", CFSTR("Starting up cloud zones"));

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting up cloud zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "zoneInfoMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "zoneInfoMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke;
  v38[3] = &unk_24E798720;
  v38[4] = v8;
  v16 = v4;
  v39 = v16;
  v17 = v13;
  v40 = v17;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v38);

  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v16, "activity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "markWithFormat:", CFSTR("Waiting for %lu cloud zones to start up"), objc_msgSend(v17, "count"));

    v21 = (void *)MEMORY[0x227676638]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543618;
      v42 = v24;
      v43 = 2048;
      v44 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for %lu cloud zones to start up", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "combineAllFutures:ignoringErrors:scheduler:", v17, 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v19, "markWithFormat:", CFSTR("Not waiting for any cloud zones to start up"));

    v29 = (void *)MEMORY[0x227676638]();
    v30 = v8;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Not waiting for any cloud zones to start up", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_37;
  v35[3] = &unk_24E798770;
  v36 = v16;
  v37 = v8;
  v33 = v16;
  v34 = (id)objc_msgSend(v28, "addSuccessBlock:", v35);

}

- (void)__performCloudZonePullsWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markWithFormat:", CFSTR("Starting to pull from cloud zones"));

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting to pull from cloud zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v4, "zoneInfoMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "zoneInfoMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke;
  v38[3] = &unk_24E798720;
  v38[4] = v8;
  v16 = v4;
  v39 = v16;
  v17 = v13;
  v40 = v17;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v38);

  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v16, "activity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "markWithFormat:", CFSTR("Waiting for %lu cloud zones to pull"), objc_msgSend(v17, "count"));

    v21 = (void *)MEMORY[0x227676638]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543618;
      v42 = v24;
      v43 = 2048;
      v44 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for %lu cloud zones to pull", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BE6B628], "globalAsyncScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "combineAllFutures:ignoringErrors:scheduler:", v17, 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v19, "markWithFormat:", CFSTR("Not waiting for any cloud zones to pull"));

    v29 = (void *)MEMORY[0x227676638]();
    v30 = v8;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v32;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Not waiting for any cloud zones to pull", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_57;
  v35[3] = &unk_24E798770;
  v36 = v16;
  v37 = v8;
  v33 = v16;
  v34 = (id)objc_msgSend(v28, "addSuccessBlock:", v35);

}

- (void)__fetchZoneChangesWithFetchInfo:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  id v8;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8 = 0;
  v6 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __createCloudZonesForFetchInfo:error:](self, "__createCloudZonesForFetchInfo:error:", v4, &v8);
  v7 = v8;
  if (v6)
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror __startUpCloudZonesWithFetchInfo:](self, "__startUpCloudZonesWithFetchInfo:", v4);
  else
    objc_msgSend(v4, "finishWithError:", v7);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "mirroredLocalZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1[4], "cloudDatabase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudZoneID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serverChangeTokenForZoneWithID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v6, "ignoreChangeToken");
      objc_msgSend(a1[5], "activity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hmbDescription");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v12)
      {
        objc_msgSend(v13, "markWithFormat:", CFSTR("Fetching changes for zone %@ but ignoring change token"), v14);

        v16 = (void *)MEMORY[0x227676638]();
        v17 = a1[4];
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "hmbDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v19;
          v37 = 2112;
          v38 = v20;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching changes for zone %@ but ignoring change token", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);

        v11 = 0;
      }
      else
      {
        objc_msgSend(v13, "markWithFormat:", CFSTR("Fetching changes for zone %@"), v14);

        v21 = (void *)MEMORY[0x227676638]();
        v22 = a1[4];
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "hmbDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v24;
          v37 = 2112;
          v38 = v25;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Fetching changes for zone %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
      }
      objc_msgSend(a1[5], "options");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchChangesWithToken:options:", v11, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_47;
      v31[3] = &unk_24E798798;
      v32 = a1[5];
      v28 = v5;
      v29 = a1[4];
      v33 = v28;
      v34 = v29;
      v30 = (id)objc_msgSend(v27, "addCompletionBlock:", v31);
      objc_msgSend(a1[6], "addObject:", v27);

    }
  }

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_2;
  v8[3] = &unk_24E79BBD0;
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_3;
  block[3] = &unk_24E79BBD0;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  dispatch_async(v2, block);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_4;
  v5[3] = &unk_24E79BBD0;
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "performBlock:", v5);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "zoneInfoMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_5;
  v12[3] = &unk_24E7987C0;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v12);

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__237174;
  v10 = __Block_byref_object_dispose__237175;
  v11 = 0;
  v4 = *(void **)(a1 + 40);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_6;
  v5[3] = &unk_24E798748;
  v5[4] = &v6;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);
  if (v7[5])
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  else
    objc_msgSend(*(id *)(a1 + 48), "__removeDeletedZonesWithFetchInfo:", *(_QWORD *)(a1 + 32));
  _Block_object_dispose(&v6, 8);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "modifiedRecordIDsFromLastPull");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "modifiedRecordIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v6);

    }
    v4 = v8;
  }

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
    *a4 = 1;
  }

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____performCloudZonePullsWithFetchInfo___block_invoke_47(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "hmbDescription");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    objc_msgSend(v7, "markWithFormat:", CFSTR("Failed to fetch changes for zone %@: %@"), v8, v6);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1[6];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "hmbDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v6;
      v15 = "%{public}@Failed to fetch changes for zone %@: %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v16, v17, v15, buf, v18);

    }
  }
  else
  {
    objc_msgSend(v7, "markWithFormat:", CFSTR("Successfully fetched changes for zone %@"), v8);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1[6];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "hmbDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v15 = "%{public}@Successfully fetched changes for zone %@";
      v16 = v12;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 22;
      goto LABEL_6;
    }
  }

  objc_autoreleasePoolPop(v10);
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE4ED00]);
    objc_msgSend(v8, "setCreateIfNeeded:", 1);
    objc_msgSend(a1[4], "localDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v9, "openZoneWithMirror:configuration:error:", v7, v8, &v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v46;

    if (v10)
    {
      objc_msgSend(v10, "startUp");
      objc_msgSend(v7, "startUp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_24;
      v40[3] = &unk_24E7986F8;
      v41 = a1[5];
      v13 = v5;
      v14 = a1[4];
      v42 = v13;
      v43 = v14;
      v44 = v6;
      v45 = v10;
      objc_msgSend(v11, "flatMap:", v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = v12;
      v36[1] = 3221225472;
      v36[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_28;
      v36[3] = &unk_24E799FD0;
      v37 = a1[5];
      v16 = v13;
      v17 = a1[4];
      v38 = v16;
      v39 = v17;
      v18 = (id)objc_msgSend(v15, "addFailureBlock:", v36);
      objc_msgSend(a1[6], "addObject:", v15);

      v19 = v41;
      v20 = v35;
    }
    else
    {
      objc_msgSend(a1[5], "activity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudZoneID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "zoneID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hmbDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "markWithFormat:", CFSTR("Failed to create mirrored local zone for %@: %@"), v24, v35);

      v25 = (void *)MEMORY[0x227676638]();
      v26 = a1[4];
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cloudZoneID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "zoneID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "hmbDescription");
        v34 = v25;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v28;
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v35;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create mirrored local zone for %@: %@", buf, 0x20u);

        v25 = v34;
      }

      objc_autoreleasePoolPop(v25);
      objc_msgSend(v7, "startUp");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "cancel");

      v31 = a1[6];
      v20 = v35;
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v19);
    }

  }
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_2;
  v8[3] = &unk_24E79BBD0;
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_3;
  block[3] = &unk_24E79BBD0;
  v6 = a1[5];
  v3 = a1[6];
  v4 = a1[4];
  v7 = v3;
  v8 = v4;
  dispatch_async(v2, block);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_4;
  v5[3] = &unk_24E79BBD0;
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "performBlock:", v5);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__237174;
  v8 = __Block_byref_object_dispose__237175;
  v9 = 0;
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_5;
  v3[3] = &unk_24E798748;
  v3[4] = &v4;
  objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
  if (v5[5])
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:");
  else
    objc_msgSend(*(id *)(a1 + 48), "__performCloudZonePullsWithFetchInfo:", *(_QWORD *)(a1 + 40));
  _Block_object_dispose(&v4, 8);

}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
    *a4 = 1;
  }

}

id __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hmbDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markWithFormat:", CFSTR("Zone %@ started up"), v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Zone %@ started up", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 56), "setMirroredLocalZone:", *(_QWORD *)(a1 + 64));
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __108__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____startUpCloudZonesWithFetchInfo___block_invoke_28(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "hmbDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markWithFormat:", CFSTR("Zone %@ failed to start up: %@"), v5, v3);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1[6];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "hmbDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Zone %@ failed to start up: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreMirror_FetchZoneChanges____createCloudZonesForFetchInfo_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  _BYTE *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  HMDNetworkRouterFirewallRuleCloudZone *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  HMDNetworkRouterFirewallRuleCloudZone *v85;
  void *v86;
  _BYTE *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(v8, "zoneHasChanged") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "__createCloudZoneIDForZoneID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cloudDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneStateByZoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "activity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmbDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v12)
    {
      v89 = v7;
      objc_msgSend(v13, "markWithFormat:", CFSTR("Already have a model for zone %@"), v14);

      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = v12;
        v20 = v8;
        v21 = v9;
        v22 = a4;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "hmbDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v23;
        v94 = 2112;
        v95 = v24;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Already have a model for zone %@", buf, 0x16u);

        a4 = v22;
        v9 = v21;
        v8 = v20;
        v12 = v19;
      }

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v12, "cloudZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = v25;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v28 = v26;
        else
          v28 = 0;
        v88 = v28;

        objc_msgSend(*(id *)(a1 + 32), "activity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v89;
        objc_msgSend(v89, "hmbDescription");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v29, "markWithFormat:", CFSTR("Already have an open HMDNetworkRouterFirewallRuleCloudZone for zone %@"), v30);

          v32 = (void *)MEMORY[0x227676638]();
          v33 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "hmbDescription");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v35;
            v94 = 2112;
            v95 = v36;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Already have an open HMDNetworkRouterFirewallRuleCloudZone for zone %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
          objc_msgSend(v8, "setCloudZone:", v26);
        }
        else
        {
          v87 = a4;
          objc_msgSend(v29, "markWithFormat:", CFSTR("Another HMBCloudZone open for %@ that isn't one of ours: %@"), v30, v26);

          v70 = (void *)MEMORY[0x227676638]();
          v71 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v86 = v70;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "hmbDescription");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v93 = v73;
            v94 = 2112;
            v95 = v74;
            v96 = 2112;
            v97 = v26;
            _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_ERROR, "%{public}@Another HMBCloudZone open for %@ that isn't one of ours: %@", buf, 0x20u);

            v70 = v86;
          }

          objc_autoreleasePoolPop(v70);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v77 = *(void **)(v76 + 40);
          *(_QWORD *)(v76 + 40) = v75;

          *v87 = 1;
        }

        goto LABEL_29;
      }
      v7 = v89;
    }
    else
    {
      objc_msgSend(v13, "markWithFormat:", CFSTR("Saving new cloud zone model for zone %@"), v14);

      v44 = (void *)MEMORY[0x227676638]();
      v45 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmbDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v47;
        v94 = 2112;
        v95 = v48;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Saving new cloud zone model for zone %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v44);
      v49 = objc_alloc(MEMORY[0x24BE4EC78]);
      objc_msgSend(v9, "modelID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "hmbModelID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v49, "initWithModelID:parentModelID:", v50, v51);

      objc_msgSend(v12, "setZoneID:", v9);
      objc_msgSend(v12, "setNeedsZoneCreation:", MEMORY[0x24BDBD1C0]);
      objc_msgSend(*(id *)(a1 + 40), "cloudDatabase");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stateZone");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "update:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v57 = *(void **)(v56 + 40);
      *(_QWORD *)(v56 + 40) = v55;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "activity");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hmbDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "markWithFormat:", CFSTR("Failed to save new cloud zone model for zone %@: %@"), v59, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

        v60 = (void *)MEMORY[0x227676638]();
        v61 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "hmbDescription");
          v90 = v7;
          v64 = v12;
          v65 = v8;
          v66 = v9;
          v67 = a4;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138543874;
          v93 = v63;
          v94 = 2112;
          v95 = v68;
          v96 = 2112;
          v97 = v69;
          _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new cloud zone model for zone %@: %@", buf, 0x20u);

          a4 = v67;
          v9 = v66;
          v8 = v65;
          v12 = v64;
          v7 = v90;

        }
        objc_autoreleasePoolPop(v60);
        *a4 = 1;
        goto LABEL_29;
      }
      objc_msgSend(*(id *)(a1 + 40), "cloudDatabase");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "zoneStateByZoneID");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setObject:forKeyedSubscript:", v12, v9);

    }
    v80 = [HMDNetworkRouterFirewallRuleCloudZone alloc];
    objc_msgSend(*(id *)(a1 + 40), "cloudDatabase");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(*(id *)(a1 + 40), "useAnonymousRequests");
    objc_msgSend(v8, "recordIDs");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "signatureVerificationPublicKeys");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = -[HMDNetworkRouterFirewallRuleCloudZone initWithCloudDatabase:state:useAnonymousRequests:watchedRecordIDs:signatureVerificationPublicKeys:](v80, "initWithCloudDatabase:state:useAnonymousRequests:watchedRecordIDs:signatureVerificationPublicKeys:", v81, v12, v82, v83, v84);

    objc_msgSend(v12, "setCloudZone:", v85);
    objc_msgSend(v8, "setCloudZone:", v85);

LABEL_29:
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmbDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "markWithFormat:", CFSTR("Ignoring zone %@ that has no changes"), v38);

  v39 = (void *)MEMORY[0x227676638]();
  v40 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmbDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v93 = v42;
    v94 = 2112;
    v95 = v43;
    _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring zone %@ that has no changes", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v39);
LABEL_30:

}

@end
