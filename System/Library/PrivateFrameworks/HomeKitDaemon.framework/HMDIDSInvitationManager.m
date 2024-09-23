@implementation HMDIDSInvitationManager

- (HMDIDSInvitationManager)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 remoteAccountManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDIDSInvitationManager *v14;
  id *p_isa;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDIDSInvitationManager *v44;
  NSObject *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)HMDIDSInvitationManager;
  v14 = -[HMDIDSInvitationManager init](&v61, sel_init);
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    v48 = v13;
    v51 = v10;
    objc_storeWeak((id *)&v14->_homeManager, v10);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 6, a6);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FC48]), "initWithServiceIdentifier:", CFSTR("com.apple.private.alloy.home.invite"));
    v17 = p_isa[1];
    p_isa[1] = (id)v16;

    v18 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Loading pending and sent invites:", buf, 0xCu);

    }
    v49 = v12;
    v50 = v11;

    objc_autoreleasePoolPop(v18);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v52 = p_isa;
    objc_msgSend(p_isa[1], "pendingInvitations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v58 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "uniqueID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v29;
            v65 = 2112;
            v66 = v31;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Sent invite: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v23);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(v52[1], "receivedInvitations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v54 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          v38 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "uniqueID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "UUIDString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v40;
            v65 = 2112;
            v66 = v42;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Received invite: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v38);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v34);
    }

    p_isa = v52;
    objc_msgSend(v52[1], "setDelegate:queue:", v52, v52[2]);
    v11 = v50;
    v10 = v51;
    v13 = v48;
    v12 = v49;
  }
  v43 = (void *)MEMORY[0x227676638]();
  v44 = p_isa;
  HMFGetOSLogHandle();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v64 = v46;
    _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Initialized HMDIDSInvitationManager since modern transport is enabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v43);

  return v44;
}

- (id)_sentInvitationWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDIDSInvitationManager *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[IDSInvitationManager pendingInvitations](self->_idsInvitationManager, "pendingInvitations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__HMDIDSInvitationManager__sentInvitationWithUniqueID___block_invoke;
    v12[3] = &unk_24E7820B0;
    v13 = v4;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite ID must be provided to find matching sent invitation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (id)_receivedInvitationWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDIDSInvitationManager *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[IDSInvitationManager receivedInvitations](self->_idsInvitationManager, "receivedInvitations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__HMDIDSInvitationManager__receivedInvitationWithUniqueID___block_invoke;
    v12[3] = &unk_24E7820D8;
    v13 = v4;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite ID must be provided to find matching received invitation", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (id)_sendOptions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDIDSInvitationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FA58]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE4FB20]);

  }
  -[HMDIDSInvitationManager homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appleAccountManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prefixedURI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE4FAC8]);
    v13 = v5;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDIDSInvitationManager homeManager](v15, "homeManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appleAccountManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "primaryHandle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v17;
      v25 = 2160;
      v26 = 1752392040;
      v27 = 2112;
      v28 = v21;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract fromID for current account's primary handle: %{mask.hash}@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)auditIDSSentInvitationsUsingCurrentInvitationUUIDs:(id)a3
{
  id v4;
  void *v5;
  HMDIDSInvitationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD block[6];
  _QWORD v14[4];
  id v15;
  HMDIDSInvitationManager *v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Auditing existing IDSSentInvitations using allow set: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v19 = __Block_byref_object_copy__89918;
  v20 = __Block_byref_object_dispose__89919;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSInvitationManager pendingInvitations](v6->_idsInvitationManager, "pendingInvitations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke;
  v14[3] = &unk_24E782100;
  v11 = v4;
  v15 = v11;
  v16 = v6;
  v17 = buf;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  -[HMDIDSInvitationManager workQueue](v6, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke_23;
  block[3] = &unk_24E79B698;
  block[4] = v6;
  block[5] = buf;
  dispatch_async(v12, block);

  _Block_object_dispose(buf, 8);
}

- (void)_cancelIDSSentInvitations:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  HMDIDSInvitationManager *v12;
  NSObject *v13;
  void *v14;
  IDSInvitationManager *idsInvitationManager;
  NSObject *v16;
  id v17;
  id obj;
  _QWORD block[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[6];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  char v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSInvitationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 1;
  v6 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v11 = (void *)MEMORY[0x227676638]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v14;
          v33 = 2112;
          v34 = v10;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for existing sent invite %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        idsInvitationManager = self->_idsInvitationManager;
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke;
        v22[3] = &unk_24E7995E8;
        v22[4] = v10;
        v22[5] = v12;
        v24 = v29;
        v23 = v6;
        -[IDSInvitationManager cancelInvitation:serverAcknowledgedBlock:](idsInvitationManager, "cancelInvitation:serverAcknowledgedBlock:", v10, v22);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v7);
  }

  -[HMDIDSInvitationManager workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke_26;
  block[3] = &unk_24E79C0A8;
  block[4] = self;
  v20 = obj;
  v21 = v29;
  v17 = obj;
  dispatch_group_notify(v6, v16, block);

  _Block_object_dispose(v29, 8);
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 dictionary:(id)a5 homeInvitationID:(id)a6 isRestrictedGuestInvitation:(BOOL)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  HMDIDSInvitationManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = a7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v42 = v22;
    v43 = 2112;
    v44 = v17;
    v45 = 2112;
    v46 = v14;
    v47 = 2112;
    v48 = v15;
    v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Request to sendInvitationToDestination (homeID:%@) for destination %@ expirationDate %@, payload: %@", buf, 0x34u);

    a7 = v31;
  }

  objc_autoreleasePoolPop(v19);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC10]), "initWithDictionary:schema:", v16, CFSTR("hk-invite-v1"));
  v24 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke;
  aBlock[3] = &unk_24E782128;
  aBlock[4] = v20;
  v39 = v17;
  v40 = v18;
  v25 = v18;
  v26 = v17;
  v32[0] = v24;
  v32[1] = 3221225472;
  v32[2] = __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke_29;
  v32[3] = &unk_24E782150;
  v32[4] = v20;
  v33 = v14;
  v34 = v15;
  v35 = v23;
  v37 = a7;
  v36 = _Block_copy(aBlock);
  v27 = v36;
  v28 = v23;
  v29 = v15;
  v30 = v14;
  -[HMDIDSInvitationManager _cancelPendingIDSSentInvitationForHomeInvitationID:completionBlock:](v20, "_cancelPendingIDSSentInvitationForHomeInvitationID:completionBlock:", v26, v32);

}

- (void)_cancelPendingIDSSentInvitationForHomeInvitationID:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSInvitationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  HMDIDSInvitationManager *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  IDSInvitationManager *idsInvitationManager;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _BYTE *v33;
  uint8_t v34[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking for an existing IDSSentInvitation to cancel for homeInvitationID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__89918;
  v42 = __Block_byref_object_dispose__89919;
  v43 = 0;
  -[IDSInvitationManager pendingInvitations](v9->_idsInvitationManager, "pendingInvitations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke;
  v31[3] = &unk_24E782100;
  v31[4] = v9;
  v14 = v6;
  v32 = v14;
  v33 = buf;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
  v16 = (void *)MEMORY[0x227676638]();
  v17 = v9;
  if (v15)
  {
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v34 = 138543362;
      v35 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@No existing IDSSentInvitation found to cancel", v34, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    if (v7)
      (*((void (**)(id, _QWORD, id, _QWORD))v7 + 2))(v7, 0, v14, 0);
  }
  else
  {
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v34 = 138543874;
      v35 = v19;
      v36 = 2112;
      v37 = v14;
      v38 = 2112;
      v39 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for pending invite (homeID:%@) %@", v34, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    idsInvitationManager = v9->_idsInvitationManager;
    v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke_31;
    v27[3] = &unk_24E79C0D0;
    v27[4] = v17;
    v28 = v14;
    v24 = v21;
    v29 = v24;
    v30 = v7;
    -[IDSInvitationManager cancelInvitation:serverAcknowledgedBlock:](idsInvitationManager, "cancelInvitation:serverAcknowledgedBlock:", v23, v27);

  }
  _Block_object_dispose(buf, 8);

}

- (void)declineInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDIDSInvitationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDIDSInvitationManager *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  IDSInvitationManager *idsInvitationManager;
  void *v22;
  HMDIDSInvitationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v14;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Request to declineInvitationWithIDSIdentifier (homeID:%@) idsID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v8)
  {
    -[HMDIDSInvitationManager _receivedInvitationWithUniqueID:](v12, "_receivedInvitationWithUniqueID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v12;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v20;
        v34 = 2112;
        v35 = v9;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending decline for invite (homeID:%@) %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      idsInvitationManager = v17->_idsInvitationManager;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __95__HMDIDSInvitationManager_declineInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke;
      v28[3] = &unk_24E79C0D0;
      v28[4] = v17;
      v29 = v9;
      v30 = v8;
      v31 = v10;
      -[IDSInvitationManager declineInvitation:serverAcknowledgedBlock:](idsInvitationManager, "declineInvitation:serverAcknowledgedBlock:", v15, v28);

    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find received invite with ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, id, void *))v10 + 2))(v10, v8, v9, v27);

      }
      v15 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v12;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot decline", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, _QWORD, id, void *))v10 + 2))(v10, 0, v9, v15);
  }

}

- (void)acceptInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 dictionary:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDIDSInvitationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDIDSInvitationManager *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  IDSInvitationManager *idsInvitationManager;
  void *v26;
  HMDIDSInvitationManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v17;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v12;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Request to acceptInvitationWithIDSIdentifier (homeID:%@) idsID %@ payload %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  if (v10)
  {
    -[HMDIDSInvitationManager _receivedInvitationWithUniqueID:](v15, "_receivedInvitationWithUniqueID:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC10]), "initWithDictionary:schema:", v12, CFSTR("hk-invite-v1"));
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v18)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v24;
        v38 = 2112;
        v39 = v11;
        v40 = 2112;
        v41 = v18;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending accept for invite (homeID:%@) %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      idsInvitationManager = v21->_idsInvitationManager;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __105__HMDIDSInvitationManager_acceptInvitationWithIDSIdentifier_homeInvitationID_dictionary_completionBlock___block_invoke;
      v32[3] = &unk_24E79C0D0;
      v32[4] = v21;
      v33 = v11;
      v34 = v10;
      v35 = v13;
      -[IDSInvitationManager acceptInvitation:withContext:serverAcknowledgedBlock:](idsInvitationManager, "acceptInvitation:withContext:serverAcknowledgedBlock:", v18, v19, v32);

    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v30;
        v38 = 2112;
        v39 = v10;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find received invite with ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, id, void *))v13 + 2))(v13, v10, v11, v31);

      }
    }

    goto LABEL_17;
  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = v15;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot accept", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 20, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id, void *))v13 + 2))(v13, 0, v11, v18);
LABEL_17:

  }
}

- (void)cancelInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDIDSInvitationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDIDSInvitationManager *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  IDSInvitationManager *idsInvitationManager;
  void *v22;
  HMDIDSInvitationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v14;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Request to cancelInvitationWithIdentifier (homeID:%@) idsID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  if (v8)
  {
    -[HMDIDSInvitationManager _sentInvitationWithUniqueID:](v12, "_sentInvitationWithUniqueID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v12;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v20;
        v34 = 2112;
        v35 = v9;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for invite (homeID:%@) %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      idsInvitationManager = v17->_idsInvitationManager;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __94__HMDIDSInvitationManager_cancelInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke;
      v28[3] = &unk_24E79C0D0;
      v28[4] = v17;
      v29 = v9;
      v30 = v8;
      v31 = v10;
      -[IDSInvitationManager cancelInvitation:serverAcknowledgedBlock:](idsInvitationManager, "cancelInvitation:serverAcknowledgedBlock:", v15, v28);

    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find pending invite with ID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 3, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, id, void *))v10 + 2))(v10, v8, v9, v27);

      }
      v15 = 0;
    }
    goto LABEL_17;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = v12;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v25;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot cancel", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 20, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id, void *))v10 + 2))(v10, 0, v9, v15);
LABEL_17:

  }
}

- (BOOL)_resolveAccountWithMergeID:(id)a3 fromAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDRemoteMessageSenderContext *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v13;
      v22 = 2160;
      v23 = 1752392040;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse sender address: %{mask.hash}@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v18 = 0;
  }
  else
  {
    +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:](HMDAccountIdentifier, "accountIdentifierForSenderCorrelationIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v8, v9, v14, 0, 0);
    -[HMDIDSInvitationManager remoteAccountManager](self, "remoteAccountManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountForSenderContext:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 != 0;

  }
  return v18;
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSInvitationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  HMDIDSInvitationManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD block[4];
  id v25;
  HMDIDSInvitationManager *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "senderMergeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v29 = v11;
    v30 = 2112;
    v31 = v7;
    v32 = 2160;
    v33 = 1752392040;
    v34 = 2112;
    v35 = v12;
    v36 = 2113;
    v37 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming invitation %@ from user %{mask.hash}@ with mergeID %{private}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSInvitationManager workQueue](v9, "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HMDIDSInvitationManager_manager_incomingInvitation___block_invoke;
    block[3] = &unk_24E79BBD0;
    v25 = v7;
    v26 = v9;
    v27 = v16;
    v18 = v16;
    dispatch_async(v17, block);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v9;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = (uint64_t)v7;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSInvitationManager *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Incoming request to cancel invitation %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDIDSInvitationManager workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__HMDIDSInvitationManager_manager_senderDidCancelInvitation___block_invoke;
  v14[3] = &unk_24E79C268;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  dispatch_async(v12, v14);

}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSInvitationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDIDSInvitationManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDIDSInvitationManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDIDSInvitationManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDIDSInvitationManager *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  HMDRemoteDeviceMessageDestination *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  HMDIDSInvitationManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMDIDSInvitationManager *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDIDSInvitationManager *v66;
  void *v67;
  void *v68;
  void *v69;
  void *context;
  id contexta;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD block[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[5];
  _QWORD v86[5];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "senderMergeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v88 = v11;
    v89 = 2112;
    v90 = v7;
    v91 = 2112;
    v92 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming request to accept invitation %@ with mergeID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDIDSInvitationManager homeManager](v9, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v13)
    {
      objc_msgSend(v7, "destination");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "destinationURIs");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "anyObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "senderMergeID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = -[HMDIDSInvitationManager _resolveAccountWithMergeID:fromAddress:](v9, "_resolveAccountWithMergeID:fromAddress:", v19, v18);

      if ((v17 & 1) == 0)
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = v9;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v88 = v38;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance due to remote account resolving error", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        goto LABEL_35;
      }
      objc_msgSend(v7, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x24BDD1880]);
      v76 = v21;
      objc_msgSend(v21, "hmf_stringForKey:", CFSTR("kHomeUUID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "initWithUUIDString:", v23);

      v77 = (void *)v24;
      objc_msgSend(v13, "_homeWithUUID:", v24);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "primaryResident");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        if (objc_msgSend(v25, "isCurrentDevice"))
        {
          -[HMDIDSInvitationManager workQueue](v9, "workQueue");
          v27 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __63__HMDIDSInvitationManager_manager_receiverDidAcceptInvitation___block_invoke;
          block[3] = &unk_24E79AD20;
          v80 = v13;
          v81 = v7;
          v28 = v77;
          v82 = v77;
          v29 = v76;
          v83 = v76;
          v84 = v18;
          dispatch_async(v27, block);

LABEL_34:
LABEL_35:

          goto LABEL_36;
        }
        objc_msgSend(v26, "device");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        context = (void *)MEMORY[0x227676638]();
        v44 = v9;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v43)
        {
          v73 = v20;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v88 = v47;
            v89 = 2112;
            v90 = v26;
            v91 = 2112;
            v92 = v77;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Forwarding invitation acceptance to %@ as the local device is no longer the primary for %@.", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          v48 = [HMDRemoteDeviceMessageDestination alloc];
          objc_msgSend(v13, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "device");
          v66 = v44;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v48, "initWithTarget:device:", v49, v50);

          v78 = 0;
          v29 = v76;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v76, 1, &v78);
          v52 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v51;
          contexta = v78;
          v68 = (void *)v52;
          if (contexta)
          {
            v53 = (void *)MEMORY[0x227676638]();
            v54 = v66;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v67 = v53;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v88 = v56;
              v89 = 2112;
              v90 = contexta;
              v91 = 2112;
              v92 = v76;
              _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Error %@ while encoding payload for forwarding invitation acceptance: %@", buf, 0x20u);

              v53 = v67;
            }

            objc_autoreleasePoolPop(v53);
            v28 = v77;
            v57 = v69;
          }
          else
          {
            v86[0] = v18;
            v85[0] = CFSTR("HMDInvitationForwardMessageOriginKey");
            v85[1] = CFSTR("HMDInvitationForwardMessageOriginMergeIDKey");
            objc_msgSend(v7, "senderMergeID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v86[1] = v65;
            v85[2] = CFSTR("HMDInvitationForwardMessageHomeUUIDKey");
            v28 = v77;
            objc_msgSend(v77, "UUIDString");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v86[2] = v59;
            v86[3] = v52;
            v85[3] = CFSTR("HMDInvitationForwardMessageOriginPayloadKey");
            v85[4] = CFSTR("HMDInvitationForwardMessageInvitationUUIDKey");
            objc_msgSend(v7, "uniqueID");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "UUIDString");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v86[4] = v61;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 5);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            v57 = v69;
            objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", CFSTR("HMDInvitationForwardMessage"), v69, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDIDSInvitationManager messageDispatcher](v66, "messageDispatcher");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "sendMessage:completionHandler:", v63, 0);

            v29 = v76;
          }

          v20 = v73;
          goto LABEL_34;
        }
        v58 = v44;
        v29 = v76;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v74;
          v89 = 2112;
          v90 = v77;
          _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance as the primary resident for home %@ has no device", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
      }
      else
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = v9;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = v20;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v88 = v42;
          v89 = 2112;
          v90 = v77;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance as there is no primary resident for home %@", buf, 0x16u);

          v20 = v72;
        }

        objc_autoreleasePoolPop(v39);
        v29 = v76;
      }
      v28 = v77;
      goto LABEL_34;
    }
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v9;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v88 = v33;
      v89 = 2112;
      v90 = v7;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Received shared user invitation acceptance for invitation %@ but there's no home manager.", buf, 0x16u);
      goto LABEL_13;
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v9;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v33;
      v89 = 2112;
      v90 = v34;
      v91 = 2112;
      v92 = v7;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);

LABEL_13:
    }
  }

  objc_autoreleasePoolPop(v30);
LABEL_36:

}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSInvitationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  HMDIDSInvitationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  HMDIDSInvitationManager *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "senderMergeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v11;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming request to decline invitation %@ with mergeID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSInvitationManager workQueue](v9, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__HMDIDSInvitationManager_manager_receiverDidDeclineInvitation___block_invoke;
    block[3] = &unk_24E79BBD0;
    v24 = v7;
    v25 = v15;
    v26 = v9;
    v17 = v15;
    dispatch_async(v16, block);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)handleForwardedAcceptance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  HMDIDSInvitationManager *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  HMDIDSInvitationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  void *contexta;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  _QWORD v53[8];

  v53[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v53[2] = objc_opt_class();
  v53[3] = objc_opt_class();
  v53[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringForKey:", CFSTR("HMDInvitationForwardMessageHomeUUIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("HMDInvitationForwardMessageInvitationUUIDKey"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("HMDInvitationForwardMessageOriginKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("HMDInvitationForwardMessageOriginMergeIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
  else
    v12 = 0;
  objc_msgSend(v4, "dataForKey:", CFSTR("HMDInvitationForwardMessageOriginPayloadKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v9)
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
  else
    v14 = 0;
  v30 = (void *)v13;
  v31 = (void *)v9;
  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v7, v13, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v40;
  v33 = (void *)v14;
  if (!v10 || !v11 || !v12 || !v15 || !v14)
  {
    v22 = MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      contexta = v8;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v42 = v25;
      v43 = 2112;
      v44 = v10;
      v45 = 2112;
      v46 = v11;
      v47 = 2112;
      v48 = v12;
      v49 = 2112;
      v50 = v15;
      v51 = 2112;
      v52 = v32;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing info on forwarded acceptance message (origin: %@ mergeID: %@ home: %@ payload: %@), error %@", buf, 0x3Eu);

      v8 = contexta;
    }

    v26 = (void *)v22;
    goto LABEL_22;
  }
  v16 = -[HMDIDSInvitationManager _resolveAccountWithMergeID:fromAddress:](self, "_resolveAccountWithMergeID:fromAddress:", v11, v10);
  context = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to process forwarded shared user invitation acceptance due to remote account resolving error", buf, 0xCu);

    }
    v26 = context;
LABEL_22:
    objc_autoreleasePoolPop(v26);
    goto LABEL_23;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v20;
    v43 = 2112;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Processing forwarded invitation acceptance from user %@/%@ for home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(context);
  -[HMDIDSInvitationManager workQueue](v17, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HMDIDSInvitationManager_handleForwardedAcceptance___block_invoke;
  block[3] = &unk_24E792F40;
  block[4] = v17;
  v35 = v33;
  v36 = v12;
  v37 = v15;
  v38 = v10;
  v39 = v11;
  dispatch_async(v21, block);

LABEL_23:
}

- (IDSInvitationManager)idsInvitationManager
{
  return self->_idsInvitationManager;
}

- (void)setIdsInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_idsInvitationManager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return self->_remoteAccountManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccountManager, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_idsInvitationManager, 0);
}

void __53__HMDIDSInvitationManager_handleForwardedAcceptance___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAcceptRequestForIDSInvitationWithIdentifier:homeUUID:payload:fromAddress:fromMergeID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void __64__HMDIDSInvitationManager_manager_receiverDidDeclineInvitation___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1[4], "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationURIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(a1[5], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("kHomeUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUUIDString:", v6);

  objc_msgSend(a1[6], "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleDeclineRequestForIDSInvitationWithIdentifier:fromAddress:homeUUID:", v9, v10, v7);

}

void __63__HMDIDSInvitationManager_manager_receiverDidAcceptInvitation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "senderMergeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAcceptRequestForIDSInvitationWithIdentifier:homeUUID:payload:fromAddress:fromMergeID:", v7, v5, v3, v4, v6);

}

void __61__HMDIDSInvitationManager_manager_senderDidCancelInvitation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCancelRequestForIDSInvitationWithIdentifier:", v2);

}

void __54__HMDIDSInvitationManager_manager_incomingInvitation___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  HMDAccount *v6;
  void *v7;
  HMDAccount *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  HMDAccount *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "fromID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "senderMergeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:](HMDAccountIdentifier, "accountIdentifierForSenderCorrelationIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HMDAccount alloc];
  v27[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDAccount initWithIdentifier:handles:devices:](v6, "initWithIdentifier:handles:devices:", v5, v7, MEMORY[0x24BDBD1A8]);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1[5];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = v3;
    v12 = v2;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Calling handleAccessHomeInviteFromAccount for invite %@ with account %@", buf, 0x20u);

    v2 = v12;
    v3 = v20;
  }

  objc_autoreleasePoolPop(v9);
  objc_msgSend(a1[5], "homeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "senderMergeID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleReceivedIDSInviteFromAccount:mergeID:idsInvitationIdentifier:payload:", v8, v17, v18, v19);

}

void __94__HMDIDSInvitationManager_cancelInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for cancelInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);

}

void __105__HMDIDSInvitationManager_acceptInvitationWithIDSIdentifier_homeInvitationID_dictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for acceptInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);

}

void __95__HMDIDSInvitationManager_declineInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for declineInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);

}

void __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@IDSSentInvitation: %@, payload: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("kInvitationIdentifierKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = 138544130;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for cancelInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);

}

void __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received server response for invitation (homeID:%@): IDSID %@ with error %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    objc_msgSend(v5, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, id))(v13 + 16))(v13, v14, *(_QWORD *)(a1 + 40), v6);

  }
}

void __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke_29(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "idsInvitationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_sendOptions:", *(unsigned __int8 *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendInvitationToDestination:expirationDate:context:options:serverAcknowledgedBlock:", v4, v2, v3, v5, *(_QWORD *)(a1 + 64));

}

void __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to cancel existing sent invite idsID %@, error %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully canceled existing sent invite idsID %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke_26(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Canceling [%lu] existing IDSSentInvitations finished, all succeeded: %@", (uint8_t *)&v8, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
}

void __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Should cancel %@, IDSSentInvitation: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);

}

void __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke_23(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  objc_msgSend(v1, "_cancelIDSSentInvitations:", v2);

}

uint64_t __59__HMDIDSInvitationManager__receivedInvitationWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __55__HMDIDSInvitationManager__sentInvitationWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_89954 != -1)
    dispatch_once(&logCategory__hmf_once_t53_89954, &__block_literal_global_89955);
  return (id)logCategory__hmf_once_v54_89956;
}

void __38__HMDIDSInvitationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v54_89956;
  logCategory__hmf_once_v54_89956 = v0;

}

@end
