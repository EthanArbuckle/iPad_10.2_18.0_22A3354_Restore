@implementation MKFCKSharedUserAccessorySettings

- (BOOL)importIntoLocalUserModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = (objc_msgSend(v6, "isOwner") & 1) != 0
    || -[MKFCKSharedUserAccessorySettings _importIntoLocalUserModel:context:](self, "_importIntoLocalUserModel:context:", v6, v7);

  return v8;
}

- (BOOL)_importWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  MKFCKSharedUserAccessorySettings *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKFCKSharedUserData workingStoreHomeMember](self, "workingStoreHomeMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Could not find associated local user model to import shared user accessory settings", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_7;
  }
  objc_msgSend(v5, "castIfMemberIsGuest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_7:
    LOBYTE(v9) = 1;
    goto LABEL_8;
  }
  objc_msgSend(v6, "castIfMemberIsUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MKFCKSharedUserAccessorySettings _importIntoLocalUserModel:context:](self, "_importIntoLocalUserModel:context:", v8, v4);

LABEL_8:
  return v9;
}

- (BOOL)_importIntoLocalUserModel:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  MKFCKSharedUserAccessorySettings *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MKFCKSharedUserAccessorySettings accessoryModelID](self, "accessoryModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFAccessory, "modelWithModelID:context:error:", v8, v7, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  if (v9)
  {
    if (-[MKFCKSharedUserAccessorySettings listeningHistoryEnabled](self, "listeningHistoryEnabled"))
      objc_msgSend(v6, "addAccessoriesWithListeningHistoryEnabled_Object:", v9);
    else
      objc_msgSend(v6, "removeAccessoriesWithListeningHistoryEnabled_Object:", v9);
    if (-[MKFCKSharedUserAccessorySettings mediaContentProfileEnabled](self, "mediaContentProfileEnabled"))objc_msgSend(v6, "addAccessoriesWithMediaContentProfileEnabled_Object:", v9);
    else
      objc_msgSend(v6, "removeAccessoriesWithMediaContentProfileEnabled_Object:", v9);
    if (-[MKFCKSharedUserAccessorySettings personalRequestsEnabled](self, "personalRequestsEnabled"))
      objc_msgSend(v6, "addAccessoriesWithPersonalRequestsEnabled_Object:", v9);
    else
      objc_msgSend(v6, "removeAccessoriesWithPersonalRequestsEnabled_Object:", v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKSharedUserAccessorySettings accessoryModelID](v12, "accessoryModelID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2160;
      v21 = 1752392040;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory with modelID %{mask.hash}@, this could be settings for a stale accessory", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

  return 1;
}

+ (id)createWithHomeModelID:(id)a3 accessoryModelID:(id)a4 persistentStore:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v10);
  objc_msgSend(v10, "assignObject:toPersistentStore:", v14, v11);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setModelID:", v15);

  objc_msgSend(v14, "setHomeModelID:", v13);
  objc_msgSend(v14, "setAccessoryModelID:", v12);

  return v14;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  char v8;
  uint64_t v10;

  v10 = 0;
  v6 = a5;
  +[MKFCKModel modelWithObjectID:context:error:](MKFCKSharedUserAccessorySettings, "modelWithObjectID:context:error:", a3, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_importWithContext:", v6);

  return v8;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v7;
  void *v8;
  char v9;
  uint64_t v11;

  v11 = 0;
  v7 = a6;
  +[MKFCKModel modelWithObjectID:context:error:](MKFCKSharedUserAccessorySettings, "modelWithObjectID:context:error:", a3, v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_importWithContext:", v7);

  return v9;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
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

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedUserAccessorySettings"));
}

@end
