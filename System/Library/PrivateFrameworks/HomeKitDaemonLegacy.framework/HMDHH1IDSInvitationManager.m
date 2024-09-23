@implementation HMDHH1IDSInvitationManager

- (HMDHH1IDSInvitationManager)initWithHomeManager:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDHH1IDSInvitationManager *v8;
  HMDHH1IDSInvitationManager *v9;
  uint64_t v10;
  IDSInvitationManager *idsInvitationManager;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDHH1IDSInvitationManager;
  v8 = -[HMDHH1IDSInvitationManager init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34320]), "initWithServiceIdentifier:", CFSTR("com.apple.private.alloy.home.invite"));
    idsInvitationManager = v9->_idsInvitationManager;
    v9->_idsInvitationManager = (IDSInvitationManager *)v10;

    -[IDSInvitationManager setDelegate:queue:](v9->_idsInvitationManager, "setDelegate:queue:", v9, v7);
  }

  return v9;
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v6;
  void *v7;
  HMDHH1IDSInvitationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccount *v20;
  void *v21;
  HMDAccount *v22;
  void *v23;
  void *v24;
  HMDHH1IDSInvitationManager *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HMDHH1IDSInvitationManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *context;
  id v39;
  _QWORD v40[5];
  HMDAccount *v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "senderMergeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    v45 = v10;
    v46 = 2112;
    v47 = (uint64_t)v6;
    v48 = 2160;
    v49 = 1752392040;
    v50 = 2112;
    v51 = v11;
    v52 = 2113;
    v53 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received incoming incompatible HH2 invitation %@ from user %{mask.hash}@ with mergeID %{private}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v6, "fromID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountHandle accountHandleForDestination:](HMDAccountHandle, "accountHandleForDestination:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "senderMergeID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:](HMDAccountIdentifier, "accountIdentifierForSenderCorrelationIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [HMDAccount alloc];
    v43 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDAccount initWithIdentifier:handles:devices:](v20, "initWithIdentifier:handles:devices:", v19, v21, MEMORY[0x1E0C9AA60]);

    objc_msgSend(v15, "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hmf_stringForKey:", CFSTR("kHomeName"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (!objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("HMDHomeSuppressInviteNotificationKey")))
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __57__HMDHH1IDSInvitationManager_manager_incomingInvitation___block_invoke;
        v40[3] = &unk_1E89A6B00;
        v40[4] = v8;
        v41 = v22;
        v42 = v24;
        -[HMDAccount isOfKnownPersonWithCompletion:](v41, "isOfKnownPersonWithCompletion:", v40);

        goto LABEL_18;
      }
      context = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v8;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccount name](v22, "name");
        v27 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v36;
        v46 = 2160;
        v47 = 1752392040;
        v48 = 2112;
        v49 = v27;
        v28 = (void *)v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping incompatible HH2 invitation from %{mask.hash}@ due to suppress notification flag", buf, 0x20u);

      }
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v8;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = v17;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccount name](v22, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v34;
        v46 = 2160;
        v47 = 1752392040;
        v48 = 2112;
        v49 = (uint64_t)v35;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Dropping incompatible HH2 invitation from %{mask.hash}@ due to missing home name", buf, 0x20u);

        v17 = v37;
      }
    }

    objc_autoreleasePoolPop(context);
LABEL_18:

    goto LABEL_19;
  }
  v29 = (void *)MEMORY[0x1D17BA0A0]();
  v30 = v8;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v45 = v32;
    v46 = 2112;
    v47 = (uint64_t)v33;
    v48 = 2113;
    v49 = (uint64_t)v6;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %{private}@. Dropping incompatible invitation", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v29);
LABEL_19:

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (IDSInvitationManager)idsInvitationManager
{
  return self->_idsInvitationManager;
}

- (void)setIdsInvitationManager:(id)a3
{
  objc_storeStrong((id *)&self->_idsInvitationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsInvitationManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __57__HMDHH1IDSInvitationManager_manager_incomingInvitation___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v7;
    v25 = 2160;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Posting bulletin for incompatible HH2 invitation from %{mask.hash}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "homeManager", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "isOwnerUser"))
        {
          objc_msgSend(v14, "contextSPIUniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = *(_QWORD *)(a1 + 48);
  else
    v17 = 0;
  objc_msgSend(v15, "insertBulletinForIncompatibleInvitationFromInviterName:homeName:ownedHomeIdentifier:", v16, v17, v11);

}

@end
