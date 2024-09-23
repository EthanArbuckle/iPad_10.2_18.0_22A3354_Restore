@implementation HMDHomeSharedUserCloudShareManager

- (HMDHomeSharedUserCloudShareManager)initWithCloudShareService:(id)a3
{
  id v5;
  HMDHomeSharedUserCloudShareManager *v6;
  HMDHomeSharedUserCloudShareManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHomeSharedUserCloudShareManager;
  v6 = -[HMDHomeSharedUserCloudShareManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shareService, a3);

  return v7;
}

- (HMDHomeSharedUserCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCoreDataCloudShareService *v14;
  HMDHomeSharedUserCloudShareManager *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HMDCoreDataCloudShareService initWithContainer:sharedStore:privateStore:moc:]([HMDCoreDataCloudShareService alloc], "initWithContainer:sharedStore:privateStore:moc:", v13, v12, v11, v10);

  v15 = -[HMDHomeSharedUserCloudShareManager initWithCloudShareService:](self, "initWithCloudShareService:", v14);
  return v15;
}

- (id)grantAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3F180];
  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID___block_invoke;
  v14[3] = &unk_24E796FD8;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "inContext:perform:", v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)revokeAccessForOwner:(id)a3 sharedUserDataWithHomeModelID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3F180];
  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__HMDHomeSharedUserCloudShareManager_revokeAccessForOwner_sharedUserDataWithHomeModelID___block_invoke;
  v13[3] = &unk_24E796FD8;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  v12 = (id)objc_msgSend(v8, "inContext:perform:", v9, v13);

}

- (void)removeShareForSharedUserDataWithHomeModelID:(id)a3
{
  id v4;
  HMDCoreDataCloudShareService *v5;
  void *v6;
  void *v7;
  HMDCoreDataCloudShareService *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  HMDCoreDataCloudShareService *v13;

  v4 = a3;
  v5 = self->_shareService;
  v6 = (void *)MEMORY[0x24BE3F180];
  -[HMDCoreDataCloudShareService managedObjectContext](v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke;
  v11[3] = &unk_24E796FD8;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v8 = v5;
  v9 = v4;
  v10 = (id)objc_msgSend(v6, "inContext:perform:", v7, v11);

}

- (void)_removeSharedUserDataRootsForHomeWithModelID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDHomeSharedUserCloudShareManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMDHomeSharedUserCloudShareManager *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  HMDHomeSharedUserCloudShareManager *v39;
  HMDHomeSharedUserCloudShareManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  HMDHomeSharedUserCloudShareManager *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint32_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id obj;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];
  _QWORD v80[3];

  v80[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKFCKSharedUserPrivateRoot fetchRequest](MKFCKSharedUserPrivateRoot, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAffectedStores:", v8);

  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v5, &v72);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v72;

  if (!v10 || !objc_msgSend(v10, "count"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMDSanitizeCoreDataError(v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v16;
      v75 = 2112;
      v76 = v17;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCKSharedUserPrivateRoot with error: %@", buf, 0x16u);

      v10 = v15;
    }

    objc_autoreleasePoolPop(v12);
  }
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v64);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPredicate:", v19);

  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v20, "executeFetchRequest:error:", v18, &v71);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v71;

  v62 = v10;
  v63 = v11;
  if (!v21 || !objc_msgSend(v21, "count"))
  {
    v23 = v21;
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      HMDSanitizeCoreDataError(v22);
      v28 = v22;
      v29 = v18;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v27;
      v75 = 2112;
      v76 = v30;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFCKSharedUserDataRoot with error: %@", buf, 0x16u);

      v18 = v29;
      v22 = v28;

      v10 = v62;
    }

    objc_autoreleasePoolPop(v24);
    v21 = v23;
    v11 = v63;
  }
  objc_msgSend(MEMORY[0x24BDBD1A8], "arrayByAddingObjectsFromArray:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v21);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v32, "count"))
  {
    v58 = v21;
    v59 = v22;
    v60 = v18;
    v61 = v5;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v57 = v32;
    obj = v32;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v68 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v38 = (void *)MEMORY[0x227676638]();
          v39 = self;
          v40 = self;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v74 = v42;
            v75 = 2112;
            v76 = v37;
            v77 = 2112;
            v78 = v64;
            _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Removing shared user data root %@ for home with model ID %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v38);
          self = v39;
          -[HMDCoreDataCloudShareService managedObjectContext](v39->_shareService, "managedObjectContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "deleteObject:", v37);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v34);
    }

    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v45 = objc_msgSend(v44, "hmd_saveWithTransactionAuthor:error:", 9, &v66);
    v46 = v66;

    v47 = (void *)MEMORY[0x227676638]();
    v48 = self;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v45)
    {
      v5 = v61;
      v10 = v62;
      v22 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v51;
        v75 = 2112;
        v76 = v64;
        v52 = "%{public}@Successfully removed shared user data roots for home with model ID %@";
        v53 = v50;
        v54 = OS_LOG_TYPE_INFO;
        v55 = 22;
LABEL_26:
        _os_log_impl(&dword_2218F0000, v53, v54, v52, buf, v55);

      }
    }
    else
    {
      v5 = v61;
      v10 = v62;
      v22 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v74 = v51;
        v75 = 2112;
        v76 = v64;
        v77 = 2112;
        v78 = v46;
        v52 = "%{public}@Failed to remove shared user data roots for home with modelmID %@ with error: %@";
        v53 = v50;
        v54 = OS_LOG_TYPE_ERROR;
        v55 = 32;
        goto LABEL_26;
      }
    }

    objc_autoreleasePoolPop(v47);
    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "reset");

    v11 = v63;
    v18 = v60;
    v32 = v57;
    v21 = v58;
  }

}

- (id)acceptShareInvitation:(id)a3
{
  void *v3;
  void *v4;

  -[HMDCoreDataCloudShareService acceptShareInvitation:](self->_shareService, "acceptShareInvitation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ignoreResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)leaveShareWithSharedHomeModelID:(id)a3
{
  id v4;
  HMDCoreDataCloudShareService *v5;
  void *v6;
  HMDCoreDataCloudShareService *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMDCoreDataCloudShareService *v11;
  HMDHomeSharedUserCloudShareManager *v12;

  v4 = a3;
  v5 = self->_shareService;
  -[HMDCoreDataCloudShareService managedObjectContext](v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke;
  v9[3] = &unk_24E79BBD0;
  v10 = v4;
  v11 = v5;
  v12 = self;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "performBlock:", v9);

}

- (id)_shareForSharedUserDataWithHomeModelID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  HMDHomeSharedUserCloudShareManager *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0;
  -[HMDHomeSharedUserCloudShareManager _existingShareForSharedUserDataWithHomeModelID:error:](self, "_existingShareForSharedUserDataWithHomeModelID:error:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found existing reverse share for home %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@No reverse share for home found, creating a new reverse share with owner for home %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDHomeSharedUserCloudShareManager _createShareForSharedUserDataWithHomeModelID:](v9, "_createShareForSharedUserDataWithHomeModelID:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v14 = (void *)v7;

  return v14;
}

- (id)_existingSharedUserDataRootWithHomeModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAffectedStores:", v10);

  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_existingSharedUserDataRootWithoutShareWithHomeModelID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  -[HMDHomeSharedUserCloudShareManager _existingSharedUserDataRootWithHomeModelID:error:](self, "_existingSharedUserDataRootWithHomeModelID:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*a4 || !objc_msgSend(v6, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_136_229790);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService container](self->_shareService, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchSharesMatchingObjectIDs:error:", v9, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a4)
    {
      v8 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke_2;
      v13[3] = &unk_24E797260;
      v14 = v11;
      objc_msgSend(v7, "na_filter:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)_existingSharesForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HMDHomeSharedUserCloudShareManager *v34;
  HMDHomeSharedUserCloudShareManager *v35;
  NSObject *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[4];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = objc_claimAutoreleasedReturnValue();
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAffectedStores:", v10);

  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4 || !objc_msgSend(v12, "count"))
  {
    v13 = 0;
    v14 = (void *)v42;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v41 = v12;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v51 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "objectID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v18);
    }

    -[HMDCoreDataCloudShareService container](self->_shareService, "container");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v22, "fetchSharesMatchingObjectIDs:error:", v23, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v42;
    if (*a4)
    {
      v13 = 0;
    }
    else
    {
      v39 = v7;
      v40 = v6;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = v15;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v47;
        v43 = v15;
        do
        {
          v28 = 0;
          v44 = v26;
          do
          {
            if (*(_QWORD *)v47 != v27)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v28);
            objc_msgSend(v24, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v14, "addObject:", v30);
            }
            else
            {
              v31 = v27;
              v32 = v24;
              v33 = (void *)MEMORY[0x227676638]();
              v34 = self;
              v35 = self;
              HMFGetOSLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v55 = v37;
                v56 = 2112;
                v57 = v29;
                _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@No CKShare for objectID %@ in map", buf, 0x16u);

                v14 = (void *)v42;
              }

              objc_autoreleasePoolPop(v33);
              self = v34;
              v24 = v32;
              v27 = v31;
              v15 = v43;
              v26 = v44;
            }

            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v26);
      }

      v13 = (void *)objc_msgSend(v14, "copy");
      v7 = v39;
      v6 = v40;
    }
    v12 = v41;

  }
  return v13;
}

- (id)_existingShareForSharedUserDataWithHomeModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDHomeSharedUserCloudShareManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeSharedUserCloudShareManager _existingSharesForSharedUserDataWithHomeModelID:error:](self, "_existingSharesForSharedUserDataWithHomeModelID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@More than one shared data root with home modelID %@ is found, using the first one", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(v7, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_existingSharedUserPrivateRootWithHomeModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[MKFCKSharedUserPrivateRoot fetchRequest](MKFCKSharedUserPrivateRoot, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAffectedStores:", v10);

  objc_msgSend(v7, "setFetchLimit:", 1);
  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_createShareForSharedUserDataWithHomeModelID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDHomeSharedUserCloudShareManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDHomeSharedUserCloudShareManager *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDHomeSharedUserCloudShareManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDHomeSharedUserCloudShareManager *v36;
  NSObject *v37;
  void *v38;
  HMDHomeSharedUserCloudShareManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *context;
  void *contexta;
  void *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  _BYTE buf[12];
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  -[HMDHomeSharedUserCloudShareManager _existingSharedUserDataRootWithoutShareWithHomeModelID:error:](self, "_existingSharedUserDataRootWithoutShareWithHomeModelID:error:", v4, &v54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v54;
  if (v8)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      v57 = 2114;
      v58 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing shared data root failed with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x24BE3F180];
    HMDSanitizeCoreDataError(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_msgSend(v7, "count");
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v22;
        v57 = 2112;
        v58 = v4;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Will attempt to re-share existing MKFCKSharedUserDataRoot for home %@ that doesn't have an associated share", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v7, "firstObject");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        v57 = 2112;
        v58 = v4;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedUserDataRoot for home %@ since none was found", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      +[MKFCKSharedUserDataRoot createWithHomeModelID:persistentStore:context:](MKFCKSharedUserDataRoot, "createWithHomeModelID:persistentStore:context:", v4, v6, v5);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v23;
    v53 = 0;
    -[HMDHomeSharedUserCloudShareManager _existingSharedUserPrivateRootWithHomeModelID:error:](v19, "_existingSharedUserPrivateRootWithHomeModelID:error:", v4, &v53);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v53;
    v9 = v26;
    if (v26)
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v19;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = v7;
        v30 = v6;
        v31 = v5;
        v32 = v25;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v33;
        v57 = 2114;
        v58 = v9;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing private settings root failed with error: %{public}@", buf, 0x16u);

        v25 = v32;
        v5 = v31;
        v6 = v30;
        v7 = v48;
      }

      objc_autoreleasePoolPop(v27);
      v34 = (void *)MEMORY[0x24BE3F180];
      HMDSanitizeCoreDataError(v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "futureWithError:", v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v49 = v25;
      if (!v25)
      {
        context = (void *)MEMORY[0x227676638]();
        v36 = v19;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v45;
          v57 = 2112;
          v58 = v4;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedUserPrivateRoot for home %@ since none was found", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        v26 = +[MKFCKSharedUserPrivateRoot createWithHomeModelID:persistentStore:context:](MKFCKSharedUserPrivateRoot, "createWithHomeModelID:persistentStore:context:", v4, v6, v5);
      }
      v38 = (void *)MEMORY[0x227676638](v26);
      v39 = v19;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        contexta = v38;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v41;
        v57 = 2112;
        v58 = v4;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Creating reverse share for shared user data for home %@", buf, 0x16u);

        v38 = contexta;
      }

      objc_autoreleasePoolPop(v38);
      *(_QWORD *)buf = 0;
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudShareService container](self->_shareService, "container");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __83__HMDHomeSharedUserCloudShareManager__createShareForSharedUserDataWithHomeModelID___block_invoke;
      v50[3] = &unk_24E797128;
      v50[4] = v39;
      v51 = v4;
      v52 = *(id *)buf;
      objc_msgSend(v42, "shareManagedObjects:toShare:completion:", v43, 0, v50);

      v25 = v49;
    }

  }
  return v16;
}

- (void)removeSharesWithNoParticipantForHomeWithModelID:(id)a3
{
  id v4;
  void *v5;
  HMDHomeSharedUserCloudShareManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Looking for dangling shares to remove for home %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (void *)MEMORY[0x24BE3F180];
  -[HMDCoreDataCloudShareService managedObjectContext](v6->_shareService, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke;
  v13[3] = &unk_24E79B238;
  v13[4] = v6;
  v14 = v4;
  v11 = v4;
  v12 = (id)objc_msgSend(v9, "inContext:perform:", v10, v13);

}

- (void)_deleteDanglingShare:(id)a3 homeModelID:(id)a4
{
  id v6;
  HMDCoreDataCloudShareService *shareService;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  shareService = self->_shareService;
  v8 = a3;
  -[HMDCoreDataCloudShareService container](shareService, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__HMDHomeSharedUserCloudShareManager__deleteDanglingShare_homeModelID___block_invoke;
  v14[3] = &unk_24E7971B8;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v9, "purgeObjectsAndRecordsInZoneWithID:inPersistentStore:completion:", v11, v12, v14);

}

- (BOOL)_onlyShareOwnerInShare:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "type") != 1)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareService, 0);
}

void __71__HMDHomeSharedUserCloudShareManager__deleteDanglingShare_homeModelID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      v13 = "%{public}@Removing dangling share for user data for home %@ failed with %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@Removed dangling share for user data for home %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  void *v24;
  id obj;
  _QWORD v26[6];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v32 = 0;
  objc_msgSend(v2, "_existingSharesForSharedUserDataWithHomeModelID:error:", v3, &v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v32;
  if (v4 && (unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v23 = v5;
    v24 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      v14 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
          objc_msgSend(v16, "recordID", v23, v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fetchShareWithRecordID:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v14;
          v26[1] = 3221225472;
          v26[2] = __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke_138;
          v26[3] = &unk_24E797288;
          v20 = *(void **)(a1 + 40);
          v26[4] = *(_QWORD *)(a1 + 32);
          v26[5] = v16;
          v27 = v20;
          v21 = (id)objc_msgSend(v19, "then:", v26);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    v5 = v23;
    v4 = v24;
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      v36 = 2112;
      v37 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@One or fewer reverse shares for home %@, nothing to prune.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

  return 1;
}

uint64_t __86__HMDHomeSharedUserCloudShareManager_removeSharesWithNoParticipantForHomeWithModelID___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed fetch for share %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    if (objc_msgSend(*(id *)(a1 + 32), "_onlyShareOwnerInShare:", v3))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 48);
        v17 = 138543874;
        v18 = v12;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing dangling share %@ for home %@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "_deleteDanglingShare:homeModelID:", v3, *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Performed a fetch for share %@ but found none", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

  return 1;
}

void __83__HMDHomeSharedUserCloudShareManager__createShareForSharedUserDataWithHomeModelID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create share for home %@ due to %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 48), "rejectWithError:", v12);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Created reverse share successful for home %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 48), "fulfillWithValue:", v10);
  }

}

BOOL __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

uint64_t __99__HMDHomeSharedUserCloudShareManager__existingSharedUserDataRootWithoutShareWithHomeModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x24BDAC8D0];
  +[MKFCKSharedHome fetchRequest](MKFCKSharedHome, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("modelID"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(a1[5], "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAffectedStores:", v5);

  objc_msgSend(a1[5], "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v47;

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1[6];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[4];
      *(_DWORD *)buf = 138543874;
      v50 = v12;
      v51 = 2112;
      v52 = v13;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Leaving shared home %@ failed due to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else if (objc_msgSend(v7, "hmf_isEmpty"))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1[6];
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = a1[4];
      *(_DWORD *)buf = 138543618;
      v50 = v17;
      v51 = 2112;
      v52 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to leave non-existence shared home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_133_229797);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "container");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v20, "fetchSharesMatchingObjectIDs:error:", v19, &v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v46;

    if (v8)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = a1[6];
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v25;
        v51 = 2112;
        v52 = v7;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get share mapping for shared homes %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    else
    {
      v36 = v19;
      v37 = v7;
      v38 = v2;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v35 = v21;
      objc_msgSend(v21, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v43 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(a1[5], "container");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "recordID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "zoneID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[5], "sharedStore");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_134;
            v40[3] = &unk_24E7971B8;
            v40[4] = a1[6];
            v41 = a1[4];
            objc_msgSend(v31, "purgeObjectsAndRecordsInZoneWithID:inPersistentStore:completion:", v33, v34, v40);

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        }
        while (v27);
      }

      v7 = v37;
      v2 = v38;
      v19 = v36;
      v8 = 0;
      v21 = v35;
    }

  }
}

void __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      v13 = "%{public}@Leaving share for shared home %@ failed with %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@Left share for shared home %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __70__HMDHomeSharedUserCloudShareManager_leaveShareWithSharedHomeModelID___block_invoke_131(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

uint64_t __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_removeSharedUserDataRootsForHomeWithModelID:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v2, "_existingShareForSharedUserDataWithHomeModelID:error:", v3, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v5;
      v11 = "%{public}@Fetching existing share for user data for home %@ failed with %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_4:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, buf, v14);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "container");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "zoneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "privateStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke_127;
      v22[3] = &unk_24E7971B8;
      v19 = *(void **)(a1 + 40);
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v19;
      objc_msgSend(v15, "purgeObjectsAndRecordsInZoneWithID:inPersistentStore:completion:", v17, v18, v22);

      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2112;
      v28 = v21;
      v11 = "%{public}@No share for user data for home %@ to remove";
      v12 = v8;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
      goto LABEL_4;
    }
  }

  objc_autoreleasePoolPop(v6);
LABEL_8:

  return 1;
}

void __82__HMDHomeSharedUserCloudShareManager_removeShareForSharedUserDataWithHomeModelID___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v18 = 138543874;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v6;
      v13 = "%{public}@Removing share for user data for home %@ failed with %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v17;
    v13 = "%{public}@Removed share for user data for home %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __89__HMDHomeSharedUserCloudShareManager_revokeAccessForOwner_sharedUserDataWithHomeModelID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v20 = 0;
  objc_msgSend(v2, "_existingShareForSharedUserDataWithHomeModelID:error:", v3, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v5;
      v11 = "%{public}@Fetching existing share for user data for home %@ failed with %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_4:
      _os_log_impl(&dword_2218F0000, v12, v13, v11, buf, v14);

    }
  }
  else
  {
    if (v4)
    {
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(a1 + 48), "accountHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v15, "revokeAccessForUserWithAccountHandle:share:", v16, v4);

      goto LABEL_8;
    }
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2112;
      v24 = v19;
      v11 = "%{public}@Nothing to do, no existing share for user data home %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 22;
      goto LABEL_4;
    }
  }

  objc_autoreleasePoolPop(v6);
LABEL_8:

  return 1;
}

uint64_t __88__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_shareForSharedUserDataWithHomeModelID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID___block_invoke_2;
  v8[3] = &unk_24E796FB0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "then:", v8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;

    return 3;
  }
  else
  {
    v6 = _HMFPreconditionFailure();
    return __88__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID___block_invoke_2(v6, v7);
  }
}

uint64_t __88__HMDHomeSharedUserCloudShareManager_grantAccessForOwner_sharedUserDataWithHomeModelID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  SEL v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "accountHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "grantAccessForUserWithAccountHandle:share:", v5, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

    return 3;
  }
  else
  {
    v9 = (void *)_HMFPreconditionFailure();
    return (uint64_t)+[HMDHomeSharedUserCloudShareManager logCategory](v9, v10);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22_229814 != -1)
    dispatch_once(&logCategory__hmf_once_t22_229814, &__block_literal_global_123_229815);
  return (id)logCategory__hmf_once_v23_229816;
}

void __49__HMDHomeSharedUserCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23_229816;
  logCategory__hmf_once_v23_229816 = v0;

}

@end
