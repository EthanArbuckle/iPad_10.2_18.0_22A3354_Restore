@implementation MKFCKSharedHome

+ (id)rootKeyPath
{
  return 0;
}

+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v8);
  objc_msgSend(v8, "assignObject:toPersistentStore:", v11, v9);

  objc_msgSend(v11, "setModelID:", v10);
  return v11;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _MKFRoom *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _MKFUser *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  BOOL v69;
  _QWORD v71[6];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE buf[24];
  void *v84;
  id v85;
  void *v86;
  uint64_t *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  objc_msgSend(v6, "objectWithID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v7)
  {
    v69 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v7, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", v9, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modelID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v84 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Found existing local home with modelID %{mask.hash}@, skipping insert", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v7, "createLocalModelWithContext:", v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v18);

    v19 = v16;
    v20 = v17;
    objc_msgSend(v7, "defaultRoomModelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFRoom, "modelWithModelID:context:", v21, v20);
    v22 = (_MKFRoom *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v7;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "modelID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        v84 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Found existing local room with modelID %{mask.hash}@, skipping insert", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
    }
    else
    {
      v22 = -[_MKFRoom initWithContext:]([_MKFRoom alloc], "initWithContext:", v20);
      objc_msgSend(v7, "defaultRoomModelID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFRoom setModelID:](v22, "setModelID:", v28);

      HMDDefaultRoomName();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFRoom setName:](v22, "setName:", v29);

      -[_MKFRoom setHome:](v22, "setHome:", v19);
      objc_msgSend(v7, "writerTimestamp");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFRoom setWriterTimestamp:](v22, "setWriterTimestamp:", v30);

    }
    objc_msgSend(v19, "defaultRoom");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      objc_msgSend(v19, "defaultRoom");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v19, "defaultRoom");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deleteObject:", v34);

      }
      objc_msgSend(v19, "setDefaultRoom:", v22);
    }

    v10 = v19;
    v35 = v20;
    objc_msgSend(v7, "ownerModelID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v36, v35);
    v37 = (_MKFUser *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      v37 = -[_MKFUser initWithContext:]([_MKFUser alloc], "initWithContext:", v35);
      objc_msgSend(v7, "ownerModelID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUser setModelID:](v37, "setModelID:", v38);

      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ownerAccountHandle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "accountHandleFromString:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUser setAccountHandle:](v37, "setAccountHandle:", v41);

      -[_MKFUser setAnnounceAccessLevel:](v37, "setAnnounceAccessLevel:", &unk_24E96B8D0);
      -[_MKFUser setCamerasAccessLevel:](v37, "setCamerasAccessLevel:", &unk_24E96B8D0);
      -[_MKFUser setRemoteAccessAllowed:](v37, "setRemoteAccessAllowed:", MEMORY[0x24BDBD1C8]);
      -[_MKFUser setPrivilege:](v37, "setPrivilege:", &unk_24E96B8E8);
      -[_MKFUser setHome:](v37, "setHome:", v10);
      objc_msgSend(v7, "writerTimestamp");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFUser setWriterTimestamp:](v37, "setWriterTimestamp:", v42);

    }
    objc_msgSend(v10, "owner");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = HMFEqualObjects();

    if ((v44 & 1) == 0)
      objc_msgSend(v10, "setOwner:", v37);

    v45 = v35;
    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__135192;
    v81 = __Block_byref_object_dispose__135193;
    v76 = 0;
    +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v45, &v76);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v76;
    v82 = v46;
    v48 = (void *)v78[5];
    if (v48)
    {
      v72 = 0;
      v73 = &v72;
      v74 = 0x2020000000;
      v75 = 1;
      objc_msgSend(v48, "homes");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = MEMORY[0x24BDAC760];
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke;
      v71[3] = &unk_24E787B80;
      v71[4] = v7;
      v71[5] = &v72;
      objc_msgSend(v49, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v71);

      if (*((_BYTE *)v73 + 24))
      {
        +[MKFCKHome _homeManagerContextFromContext:](MKFCKHome, "_homeManagerContextFromContext:", v45);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v50;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke_2;
        v84 = &unk_24E79C0A8;
        v87 = &v77;
        v52 = v51;
        v85 = v52;
        v86 = v7;
        objc_msgSend(v52, "performBlockAndWait:", buf);

      }
      _Block_object_dispose(&v72, 8);
    }
    else
    {
      v53 = (void *)MEMORY[0x227676638]();
      v54 = v7;
      HMFGetOSLogHandle();
      v55 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v47;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v53);
    }
    _Block_object_dispose(&v77, 8);

    if (!v48)
    {
      v69 = 0;
      goto LABEL_33;
    }
    v57 = (void *)MEMORY[0x227676638]();
    v58 = v7;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v57);
    v61 = (void *)MEMORY[0x227676638]();
    v62 = v58;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "debugDescription");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v64;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v65;
      _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v61);
    v11 = (void *)MEMORY[0x227676638]();
    v66 = v62;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "debugDescription");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v68;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v11);
  v69 = 1;
LABEL_33:

LABEL_34:
  return v69;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  objc_msgSend(v7, "objectWithID:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v8)
  {
    objc_msgSend(v8, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x227676638]();
    v13 = v8;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "modelID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138543874;
        v43 = v28;
        v44 = 2160;
        v45 = 1752392040;
        v46 = 2112;
        v47 = v29;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_FAULT, "%{public}@No existing local model for shared home with modelID %{mask.hash}@, skipping update", (uint8_t *)&v42, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      goto LABEL_20;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543874;
      v43 = v16;
      v44 = 2160;
      v45 = 1752392040;
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Found existing local model for shared home with modelID %{mask.hash}@", (uint8_t *)&v42, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ownerAccountHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountHandleFromString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v11, "owner");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v36 = (void *)MEMORY[0x227676638]();
        v37 = v13;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "modelID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543874;
          v43 = v39;
          v44 = 2160;
          v45 = 1752392040;
          v46 = 2112;
          v47 = v40;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_FAULT, "%{public}@Local home model with modelID %{mask.hash}@ does not have an owner user", (uint8_t *)&v42, 0x20u);

        }
        objc_autoreleasePoolPop(v36);
        goto LABEL_19;
      }
      objc_msgSend(v11, "owner");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accountHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v20);

      if ((v24 & 1) != 0)
      {
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      objc_msgSend(v11, "owner");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = v20;
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v13;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "ownerAccountHandle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "modelID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138544386;
        v43 = v33;
        v44 = 2160;
        v45 = 1752392040;
        v46 = 2112;
        v47 = v34;
        v48 = 2160;
        v49 = 1752392040;
        v50 = 2112;
        v51 = v35;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid account handle %{mask.hash}@ found on shared home with model ID %{mask.hash}@", (uint8_t *)&v42, 0x34u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v11, "owner");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = 0;
    }
    objc_msgSend(v25, "setAccountHandle:", v27);

    goto LABEL_19;
  }
LABEL_21:

  return v8 != 0;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return +[MKFCKHome importDeleteWithObjectID:modelID:additionalUpdates:context:](MKFCKHome, "importDeleteWithObjectID:modelID:additionalUpdates:context:", a3, a4, a5, a6);
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ is unavailable"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDBCE88];
  v15 = *MEMORY[0x24BDBCAB0];
  v16 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ is unavailable"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v18, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDBCE88];
  v15 = *MEMORY[0x24BDBCAB0];
  v16 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ is unavailable"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v18, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

void __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __49__MKFCKSharedHome__importHomeManagerWithContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v2, &v13);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "modelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKHome _homeManagerHomeWithModelID:homeManager:context:](MKFCKHome, "_homeManagerHomeWithModelID:homeManager:context:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Created new home manager home during import: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);

  }
}

- (id)createLocalModelWithContext:(id)a3
{
  id v4;
  _MKFHome *v5;
  _MKFHome *v6;
  _MKFHome *v7;
  _MKFHome *v8;
  void *v9;
  void *v10;
  _MKFHome *v11;
  _MKFHome *v12;
  _MKFHome *v13;

  v4 = a3;
  v5 = -[_MKFHome initWithContext:]([_MKFHome alloc], "initWithContext:", v4);

  -[_MKFHome setOwned:](v5, "setOwned:", MEMORY[0x24BDBD1C0]);
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[MKFCKSharedHome modelID](self, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHome setModelID:](v8, "setModelID:", v9);

  -[MKFCKSharedHome writerTimestamp](self, "writerTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHome setWriterTimestamp:](v8, "setWriterTimestamp:", v10);

  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedHome"));
}

@end
