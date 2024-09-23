@implementation HMDCloudShareParticipantsManager

- (HMDCloudShareParticipantsManager)initWithQueue:(id)a3 cloudZone:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCloudShareParticipantsManager *v12;
  HMDCloudShareParticipantsManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudShareParticipantsManager;
  v12 = -[HMDCloudShareParticipantsManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_cloudZone, a4);
    objc_storeWeak((id *)&v13->_home, v11);
  }

  return v13;
}

- (NSSet)participatingUsers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDCloudShareParticipantsManager cloudZone](self, "cloudZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDCloudShareParticipantsManager_participatingUsers__block_invoke;
  v7[3] = &unk_24E788E30;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudShareParticipantsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDCloudShareParticipantsManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareParticipantsManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "homeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleHomeUserAddedNotification_, CFSTR("HMDHomeUserAddedNotification"), v5);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v5);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleHomeDataLoadedNotification_, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), v6);

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Not configuring participants manager because home manager reference is nil", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not configuring participants manager because home reference is nil", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)updateShareParticipants
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  HMDCloudShareParticipantsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  HMDCloudShareParticipantsManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  HMDCloudShareParticipantsManager *v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  HMDCloudShareParticipantsManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id obj;
  uint64_t v57;
  HMDCloudShareParticipantsManager *v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  HMDCloudShareParticipantsManager *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareParticipantsManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v44 = (void *)MEMORY[0x227676638]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v47;
      v48 = "%{public}@Not updating share participants because home reference is nil";
      v49 = v46;
      v50 = OS_LOG_TYPE_DEFAULT;
LABEL_38:
      _os_log_impl(&dword_2218F0000, v49, v50, v48, buf, 0xCu);

    }
LABEL_39:

    objc_autoreleasePoolPop(v44);
    goto LABEL_44;
  }
  objc_msgSend(v4, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasLoadedData");

  if ((v7 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x227676638]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v47;
      v48 = "%{public}@Not updating share participants because home manager has not finished loading data";
      v49 = v46;
      v50 = OS_LOG_TYPE_INFO;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  -[HMDCloudShareParticipantsManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8, "areShareModificationsEnabledForManager:", self) & 1) == 0)
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v54;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_DEBUG, "%{public}@Not updating share participants because share modifications are disabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating share participants", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCloudShareParticipantsManager cloudZone](v10, "cloudZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "participants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v74 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v20, "clientIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v21);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v17);
    }

    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    v69 = 0u;
    objc_msgSend(v5, "users");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v70 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          if ((objc_msgSend(v27, "isCurrentUser") & 1) == 0
            && objc_msgSend(v8, "manager:shouldShareWithUser:", v10, v27))
          {
            -[HMDCloudShareParticipantsManager _inviteUser:usingDevice:](v10, "_inviteUser:usingDevice:", v27, 0);
            objc_msgSend(v27, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v28);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (v24);
    }
    v58 = v10;
    v59 = v5;
    v55 = v8;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v29 = v15;
    v60 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v60)
    {
      v57 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v60; ++k)
        {
          if (*(_QWORD *)v66 != v57)
            objc_enumerationMutation(v29);
          v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
          objc_msgSend(v29, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x227676638]();
          v34 = v58;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v36;
            v79 = 2112;
            v80 = v32;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Revoking cloud share for existing cloud share participant: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          -[HMDCloudShareParticipantsManager cloudZone](v34, "cloudZone");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "revokeShareAccessForParticipant:", v32);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x24BE6B628];
          -[HMDCloudShareParticipantsManager workQueue](v34, "workQueue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "schedulerWithDispatchQueue:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "reschedule:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x24BDAC760];
          v61[1] = 3221225472;
          v61[2] = __59__HMDCloudShareParticipantsManager_updateShareParticipants__block_invoke;
          v61[3] = &unk_24E788E58;
          v62 = v59;
          v63 = v31;
          v64 = v34;
          v43 = (id)objc_msgSend(v42, "addSuccessBlock:", v61);

        }
        v60 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v60);
    }

    v5 = v59;
    v8 = v55;
  }

LABEL_44:
}

- (void)inviteUser:(id)a3 usingDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCloudShareParticipantsManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCloudShareParticipantsManager *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((objc_msgSend(v6, "isCurrentUser") & 1) != 0
    || (-[HMDCloudShareParticipantsManager dataSource](self, "dataSource"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "manager:shouldShareWithUser:", self, v6),
        v9,
        (v10 & 1) == 0))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v19;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Not inviting ineligible user %@ using device: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Inviting user %@ using device: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudShareParticipantsManager _inviteUser:usingDevice:](v12, "_inviteUser:usingDevice:", v6, v7);
  }

}

- (void)clearParticipants
{
  void *v3;
  HMDCloudShareParticipantsManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing share participants", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCloudShareParticipantsManager cloudZone](v4, "cloudZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        -[HMDCloudShareParticipantsManager cloudZone](v4, "cloudZone", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v15, "revokeShareAccessForParticipant:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (BOOL)isAcceptedParticipatingUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDCloudShareParticipantsManager cloudZone](self, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "participantWithClientIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "hasAccepted");
  return (char)v5;
}

- (void)_inviteUser:(id)a3 usingDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudShareParticipantsManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCloudShareParticipantsManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "manager:shouldGrantWriteAccessToUser:", self, v6);
  else
    v10 = 0;
  -[HMDCloudShareParticipantsManager cloudZone](self, "cloudZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "participantWithClientIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "hasAccepted") & 1) != 0)
  {
    if ((_DWORD)v10 != objc_msgSend(v13, "hasWriteAccess"))
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hasWriteAccess");
        HMFBooleanToString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v24 = v14;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v17;
        v30 = 2112;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        v34 = 2112;
        v35 = v6;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating write access from %@ to %@ for user %@", buf, 0x2Au);

        v14 = v24;
      }

      objc_autoreleasePoolPop(v14);
      -[HMDCloudShareParticipantsManager cloudZone](v15, "cloudZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v20, "setWriteAccessEnabled:forParticipant:", v10, v13);

    }
  }
  else
  {
    -[HMDCloudShareParticipantsManager fetchInvitationToUser:shouldGrantWriteAccess:](self, "fetchInvitationToUser:shouldGrantWriteAccess:", v6, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __60__HMDCloudShareParticipantsManager__inviteUser_usingDevice___block_invoke;
    v25[3] = &unk_24E788E80;
    v25[4] = self;
    v26 = v6;
    v27 = v7;
    v23 = (id)objc_msgSend(v22, "addCompletionBlock:", v25);

  }
}

- (id)fetchInvitationToUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMDCloudShareParticipantsManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation to user %@ with write access: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareParticipantsManager fetchInvitationContextForUser:shouldGrantWriteAccess:](v9, "fetchInvitationContextForUser:shouldGrantWriteAccess:", v6, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke;
  v19[3] = &unk_24E79BD80;
  v19[4] = v9;
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v19);
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke_16;
  v18[3] = &unk_24E788EA8;
  v18[4] = v9;
  objc_msgSend(v13, "flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fetchInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDCloudShareParticipantsManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCloudShareParticipantsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v29[5];
  id v30;
  BOOL v31;
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDCloudShareParticipantsManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v8, "canUseUntrustedAccountHandlesForParticipantManager:", self))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching share invitation context using untrusted account handle for user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCloudShareParticipantsManager _untrustedInvitationContextForUser:shouldGrantWriteAccess:](v10, "_untrustedInvitationContextForUser:shouldGrantWriteAccess:", v6, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cloudShareIDFuture");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v18;
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation context for user %@ with cloud share ID future: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v6, "cloudShareIDFuture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BE6B628];
    -[HMDCloudShareParticipantsManager workQueue](v16, "workQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schedulerWithDispatchQueue:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reschedule:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke;
    v32[3] = &unk_24E79BD80;
    v32[4] = v16;
    v27 = (id)objc_msgSend(v25, "addFailureBlock:", v32);
    v29[0] = v26;
    v29[1] = 3221225472;
    v29[2] = __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke_20;
    v29[3] = &unk_24E788ED0;
    v29[4] = v16;
    v30 = v6;
    v31 = v4;
    objc_msgSend(v25, "flatMap:", v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_untrustedInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDCloudShareParticipantsManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDCloudShareParticipantsManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "accountHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9)
  {
    if (v9 == 2)
    {
      v23 = objc_alloc(MEMORY[0x24BE4ED28]);
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v23, "initWithParticipantClientIdentifier:phoneNumber:", v11, v13);
    }
    else
    {
      if (v9 != 1)
      {
        v21 = 0;
        goto LABEL_11;
      }
      v10 = objc_alloc(MEMORY[0x24BE4ED28]);
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "initWithParticipantClientIdentifier:emailAddress:", v11, v13);
    }
    v21 = (void *)v14;

LABEL_11:
    objc_msgSend(v21, "setShouldGrantWriteAccess:", v4);
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@User's account handle was of unknown type: %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v20 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "futureWithError:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v24 = (void *)v22;

  return v24;
}

- (void)handleHomeUserAddedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCloudShareParticipantsManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home user added notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudShareParticipantsManager workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDCloudShareParticipantsManager_handleHomeUserAddedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCloudShareParticipantsManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home user removed notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudShareParticipantsManager workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDCloudShareParticipantsManager_handleHomeUserRemovedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (void)handleHomeDataLoadedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDCloudShareParticipantsManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home data loaded notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCloudShareParticipantsManager workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDCloudShareParticipantsManager_handleHomeDataLoadedNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCloudShareParticipantsManager cloudZone](self, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDCloudShareParticipantsManagerDataSource)dataSource
{
  return (HMDCloudShareParticipantsManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDCloudShareParticipantsManagerDelegate)delegate
{
  return (HMDCloudShareParticipantsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __69__HMDCloudShareParticipantsManager_handleHomeDataLoadedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateShareParticipants");
}

uint64_t __70__HMDCloudShareParticipantsManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateShareParticipants");
}

uint64_t __68__HMDCloudShareParticipantsManager_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateShareParticipants");
}

void __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch invitation context due to cloud share ID future error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

id __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating share invitation context for user %@ using trusted cloud share id: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = objc_alloc(MEMORY[0x24BE4ED28]);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithParticipantClientIdentifier:cloudShareID:", v10, v3);

  objc_msgSend(v11, "setShouldGrantWriteAccess:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch invitation context: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

id __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchInvitationWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reschedule:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __60__HMDCloudShareParticipantsManager__inviteUser_usingDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 48);
        v23 = 138543874;
        v24 = v14;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending invitation %@ to device: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v8, "manager:didRequestSendForInvitation:toDevice:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 40);
        v23 = 138543874;
        v24 = v21;
        v25 = 2112;
        v26 = v5;
        v27 = 2112;
        v28 = v22;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending invitation %@ to user: %@", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v8, "manager:didRequestSendForInvitation:toUser:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 40);
      v23 = 138543874;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not create invitation to send to user %@: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __59__HMDCloudShareParticipantsManager_updateShareParticipants__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "manager:didRevokeShareAccessForUser:", *(_QWORD *)(a1 + 48), v3);

  }
}

id __54__HMDCloudShareParticipantsManager_participatingUsers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_145558 != -1)
    dispatch_once(&logCategory__hmf_once_t24_145558, &__block_literal_global_145559);
  return (id)logCategory__hmf_once_v25_145560;
}

void __47__HMDCloudShareParticipantsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_145560;
  logCategory__hmf_once_v25_145560 = v0;

}

@end
