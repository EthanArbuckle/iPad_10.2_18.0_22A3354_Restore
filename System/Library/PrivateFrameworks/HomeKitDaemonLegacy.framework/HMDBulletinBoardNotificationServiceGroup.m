@implementation HMDBulletinBoardNotificationServiceGroup

- (HMDBulletinBoardNotificationServiceGroup)initWithBulletinBoardNotification:(id)a3
{
  id v4;
  HMDBulletinBoardNotificationServiceGroup *v5;
  HMDBulletinBoardNotificationServiceGroup *v6;
  uint64_t v7;
  NSSet *cameraProfileUUIDs;
  uint64_t v9;
  NSSet *associatedServiceUUIDs;
  uint64_t v11;
  NSHashTable *cameraProfilesTable;
  uint64_t v13;
  NSHashTable *associatedServicesTable;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDBulletinBoardNotificationServiceGroup;
  v5 = -[HMDBulletinBoardNotificationServiceGroup init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_bulletinBoardNotification, v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    cameraProfileUUIDs = v6->_cameraProfileUUIDs;
    v6->_cameraProfileUUIDs = (NSSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    associatedServiceUUIDs = v6->_associatedServiceUUIDs;
    v6->_associatedServiceUUIDs = (NSSet *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    cameraProfilesTable = v6->_cameraProfilesTable;
    v6->_cameraProfilesTable = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    associatedServicesTable = v6->_associatedServicesTable;
    v6->_associatedServicesTable = (NSHashTable *)v13;

  }
  return v6;
}

- (void)configureWithWorkQueue:(id)a3
{
  id v4;
  HMDBulletinBoardNotificationServiceGroup *v5;
  SEL v6;
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[HMDBulletinBoardNotificationServiceGroup setWorkQueue:](self, "setWorkQueue:", v4);

  }
  else
  {
    v5 = (HMDBulletinBoardNotificationServiceGroup *)_HMFPreconditionFailure();
    -[HMDBulletinBoardNotificationServiceGroup _handleBulletinBoardNotificationServiceGroupRequest:](v5, v6, v7);
  }
}

- (void)_handleBulletinBoardNotificationServiceGroupRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDBulletinBoardNotificationServiceGroup *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "responseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDBulletinBoardNotificationServiceGroup _prepareServiceGroupPayload](self, "_prepareServiceGroupPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to a request for notification service group with payload %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "responseHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v6);

  }
}

- (BOOL)_isSupportedAssociationService:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D161C0];
  v10[0] = *MEMORY[0x1E0D16200];
  v10[1] = v3;
  v4 = *MEMORY[0x1E0D16208];
  v10[2] = *MEMORY[0x1E0D161E0];
  v10[3] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "containsObject:", v8);
  return (char)v5;
}

- (BOOL)_isAlarmService:(id)a3
{
  void *v3;

  objc_msgSend(a3, "findCharacteristicWithType:", *MEMORY[0x1E0D15FE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (BOOL)_isNotificationGeneratingService:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D16260];
  v9[0] = *MEMORY[0x1E0D161C8];
  v9[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "containsObject:", v7);
  return (char)v4;
}

- (void)configureBulletinNotification
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDBulletinBoardNotificationServiceGroup *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDBulletinBoardNotificationServiceGroup workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDBulletinBoardNotificationServiceGroup workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    -[HMDBulletinBoardNotificationServiceGroup _configureServices](self, "_configureServices");
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@configureBulletinNotification called before configure", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (BOOL)_isDefaultRoom:(id)a3 ofHome:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  objc_msgSend(a3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "roomForEntireHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (id)_accessoriesInRoom:(id)a3 ofHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = v6;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "room");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (v16)
          objc_msgSend(v20, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v20, "copy");
  return v17;
}

- (id)_cameraNotificationGeneratingServicesForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  HMDBulletinBoardCameraNotificationAssociation *v9;
  uint64_t v10;
  HMDBulletinBoardCameraNotificationAssociation *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  id v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "cameraProfiles");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v29)
    {
      v25 = v6;
      v9 = 0;
      v27 = *(_QWORD *)v35;
      v28 = v5;
      do
      {
        v10 = 0;
        v11 = v9;
        do
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
          v9 = -[HMDBulletinBoardCameraNotificationAssociation initWithCameraProfile:]([HMDBulletinBoardCameraNotificationAssociation alloc], "initWithCameraProfile:", v12);

          objc_msgSend(v12, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v14);

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v15 = v8;
          objc_msgSend(v8, "services");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
                if (-[HMDBulletinBoardNotificationServiceGroup _isNotificationGeneratingService:](self, "_isNotificationGeneratingService:", v21))
                {
                  -[HMDBulletinBoardCameraNotificationAssociation notificationGeneratingServicesWithCamera](v9, "notificationGeneratingServicesWithCamera");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addObject:", v21);

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v18);
          }

          ++v10;
          v11 = v9;
          v5 = v28;
          v8 = v15;
        }
        while (v10 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v29);

      v6 = v25;
    }
    v23 = (id)objc_msgSend(v5, "copy");

  }
  else
  {
    v23 = v5;
  }

  return v23;
}

- (void)_configureServices
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDBulletinBoardNotificationServiceGroup *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDBulletinBoardNotificationServiceGroup *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDBulletinBoardNotificationServiceGroup *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t i;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  HMDBulletinBoardNotificationServiceGroup *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t k;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  HMDBulletinBoardNotificationServiceGroup *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  HMDBulletinBoardNotificationServiceGroup *v57;
  NSObject *v58;
  void *v59;
  HMDBulletinBoardNotificationServiceGroup *v60;
  void *v61;
  void *v62;
  void *v63;
  HMDBulletinBoardNotificationServiceGroup *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _QWORD v111[4];

  v111[1] = *MEMORY[0x1E0C80C00];
  -[HMDBulletinBoardNotificationServiceGroup bulletinBoardNotification](self, "bulletinBoardNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "home");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      objc_msgSend(v3, "accessory");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        objc_msgSend(v71, "accessories");
        v72 = (id)objc_claimAutoreleasedReturnValue();
        v68 = v5;
        v69 = v3;
        if (-[HMDBulletinBoardNotificationServiceGroup _isDefaultRoom:ofHome:](self, "_isDefaultRoom:ofHome:", v5, v71))
        {
          v6 = v70;
          v111[0] = v70;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[HMDBulletinBoardNotificationServiceGroup _accessoriesInRoom:ofHome:](self, "_accessoriesInRoom:ofHome:", v5, v71);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v70;
        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDBulletinBoardNotificationServiceGroup _cameraNotificationGeneratingServicesForAccessory:](self, "_cameraNotificationGeneratingServicesForAccessory:", v6);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        obj = v7;
        v83 = v23;
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
        if (v77)
        {
          v75 = *(_QWORD *)v98;
          do
          {
            for (i = 0; i != v77; ++i)
            {
              if (*(_QWORD *)v98 != v75)
                objc_enumerationMutation(obj);
              v25 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v26 = v25;
              else
                v26 = 0;
              v27 = v26;

              if (v27)
              {
                v79 = v27;
                v81 = i;
                v95 = 0u;
                v96 = 0u;
                v93 = 0u;
                v94 = 0u;
                objc_msgSend(v27, "services");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v94;
                  do
                  {
                    for (j = 0; j != v30; ++j)
                    {
                      if (*(_QWORD *)v94 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
                      if (-[HMDBulletinBoardNotificationServiceGroup _isSupportedAssociationService:](self, "_isSupportedAssociationService:", v33))
                      {
                        v34 = (void *)MEMORY[0x1D17BA0A0]();
                        v35 = self;
                        HMFGetOSLogHandle();
                        v36 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                        {
                          HMFGetLogIdentifier();
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "serviceType");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v104 = v37;
                          v105 = 2112;
                          v106 = v33;
                          v107 = 2112;
                          v108 = v38;
                          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Service %@ with type %@ is a supported service for association", buf, 0x20u);

                          v23 = v83;
                        }

                        objc_autoreleasePoolPop(v34);
                        objc_msgSend(v33, "serviceIdentifier");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, v39);

                      }
                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
                  }
                  while (v30);
                }

                v27 = v79;
                i = v81;
              }

            }
            v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
          }
          while (v77);
        }

        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v73 = v72;
        v78 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
        if (v78)
        {
          v76 = *(_QWORD *)v90;
          do
          {
            for (k = 0; k != v78; ++k)
            {
              if (*(_QWORD *)v90 != v76)
                objc_enumerationMutation(v73);
              v41 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v42 = v41;
              else
                v42 = 0;
              v43 = v42;

              if (v43)
              {
                v80 = v43;
                v82 = k;
                v87 = 0u;
                v88 = 0u;
                v85 = 0u;
                v86 = 0u;
                objc_msgSend(v43, "services");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
                if (v45)
                {
                  v46 = v45;
                  v47 = *(_QWORD *)v86;
                  do
                  {
                    for (m = 0; m != v46; ++m)
                    {
                      if (*(_QWORD *)v86 != v47)
                        objc_enumerationMutation(v44);
                      v49 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * m);
                      if (-[HMDBulletinBoardNotificationServiceGroup _isAlarmService:](self, "_isAlarmService:", v49))
                      {
                        v50 = (void *)MEMORY[0x1D17BA0A0]();
                        v51 = self;
                        HMFGetOSLogHandle();
                        v52 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                        {
                          HMFGetLogIdentifier();
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v49, "serviceType");
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543874;
                          v104 = v53;
                          v105 = 2112;
                          v106 = v49;
                          v107 = 2112;
                          v108 = v54;
                          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_DEBUG, "%{public}@Service %@ with type %@ contains an alarm system, adding it to association", buf, 0x20u);

                          v23 = v83;
                        }

                        objc_autoreleasePoolPop(v50);
                        objc_msgSend(v49, "serviceIdentifier");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "setObject:forKeyedSubscript:", v49, v55);

                      }
                    }
                    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
                  }
                  while (v46);
                }

                v43 = v80;
                k = v82;
              }

            }
            v78 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
          }
          while (v78);
        }

        v56 = (void *)MEMORY[0x1D17BA0A0]();
        v57 = self;
        HMFGetOSLogHandle();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v104 = v59;
          v105 = 2112;
          v106 = v67;
          _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Camera Notification Services %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v56);
        if (objc_msgSend(v67, "count"))
        {
          v60 = v57;
          v61 = v23;
          v62 = v67;
        }
        else
        {
          v63 = (void *)MEMORY[0x1D17BA0A0]();
          v64 = v57;
          HMFGetOSLogHandle();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v104 = v66;
            _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_INFO, "%{public}@There are no cameras, no association of services", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v63);
          v61 = (void *)MEMORY[0x1E0C9AA70];
          v60 = v64;
          v62 = (void *)MEMORY[0x1E0C9AA70];
        }
        -[HMDBulletinBoardNotificationServiceGroup _updateAssociatedServices:associatedCameras:](v60, "_updateAssociatedServices:associatedCameras:", v61, v62);

        v8 = v68;
        v9 = v69;
      }
      else
      {
        v8 = v5;
        v9 = v3;
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v104 = v22;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@No accessory, bailing out", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
      }
      v18 = v71;

    }
    else
    {
      v8 = v5;
      v9 = v3;
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v104 = v17;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@No home, bailing out", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      v18 = 0;
    }

  }
  else
  {
    v8 = 0;
    v9 = v3;
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v104 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@No room, bailing out", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_updateAssociatedServices:(id)a3 associatedCameras:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  HMDBulletinBoardNotificationServiceGroup *v18;
  void *v19;
  HMDBulletinBoardNotificationServiceGroup *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  HMDBulletinBoardNotificationServiceGroup *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDBulletinBoardNotificationServiceGroup *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v49 = v7;
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoardNotificationServiceGroup associatedServiceUUIDs](self, "associatedServiceUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  v47 = v6;
  if ((v15 & 1) != 0)
  {
    -[HMDBulletinBoardNotificationServiceGroup associatedServicesTable](self, "associatedServicesTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      goto LABEL_8;
    v18 = self;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0](-[HMDBulletinBoardNotificationServiceGroup setAssociatedServiceUUIDs:](self, "setAssociatedServiceUUIDs:", v13));
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v22;
      v57 = 2112;
      v58 = v13;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating associated services with %@", buf, 0x16u);

      v6 = v47;
    }

    objc_autoreleasePoolPop(v19);
    v18 = v20;
  }
  -[HMDBulletinBoardNotificationServiceGroup _updateAssociatedServicesTable:](v18, "_updateAssociatedServicesTable:", v6, v47);
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v47);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v49, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "cameraProfile");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v26);
  }

  -[HMDBulletinBoardNotificationServiceGroup bulletinBoardNotification](self, "bulletinBoardNotification");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBulletinBoardNotificationServiceGroup cameraProfileUUIDs](self, "cameraProfileUUIDs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = HMFEqualObjects();

  if ((v32 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v43;
      v57 = 2112;
      v58 = v10;
      _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating associated cameras with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    -[HMDBulletinBoardNotificationServiceGroup setCameraProfileUUIDs:](v41, "setCameraProfileUUIDs:", v10);
    -[HMDBulletinBoardNotificationServiceGroup setCameraProfilesTable:](v41, "setCameraProfilesTable:", v23);
    objc_msgSend(v30, "registerForCharacteristicNotifications");
    goto LABEL_25;
  }
  -[HMDBulletinBoardNotificationServiceGroup cameraProfilesTable](self, "cameraProfilesTable");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = HMFEqualObjects();

  if ((v34 & 1) == 0)
    v35 = -[HMDBulletinBoardNotificationServiceGroup setCameraProfilesTable:](self, "setCameraProfilesTable:", v23);
  if ((v15 & 1) == 0)
  {
LABEL_25:
    objc_msgSend(v30, "service");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "accessory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "home");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "saveWithReason:postSyncNotification:", CFSTR("HMDBulletinBoardNotificationServiceGroupUpdatedSaveReason"), 0);
    goto LABEL_26;
  }
  v36 = (void *)MEMORY[0x1D17BA0A0](v35);
  v37 = self;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v39;
    _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No change in service and camera associations", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v36);
LABEL_26:

}

- (void)_updateAssociatedServicesTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[HMDBulletinBoardNotificationServiceGroup setAssociatedServicesTable:](self, "setAssociatedServicesTable:", v5);
}

- (id)_prepareServiceGroupPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HMDBulletinBoardNotificationServiceGroup cameraProfileUUIDs](self, "cameraProfileUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDBulletinBoardNotificationServiceGroup associatedServiceUUIDs](self, "associatedServiceUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = CFSTR("HM.BulletinBoardNotificationCameraProfiles");
  v9[1] = CFSTR("HM.BulletinBoardNotificationServices");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)cameraProfileUUIDs
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraProfileUUIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCameraProfileUUIDs:(id)a3
{
  NSSet *v4;
  NSSet *cameraProfileUUIDs;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSSet *)objc_msgSend(v6, "copy");
  cameraProfileUUIDs = self->_cameraProfileUUIDs;
  self->_cameraProfileUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)associatedServiceUUIDs
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_associatedServiceUUIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssociatedServiceUUIDs:(id)a3
{
  NSSet *v4;
  NSSet *associatedServiceUUIDs;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSSet *)objc_msgSend(v6, "copy");
  associatedServiceUUIDs = self->_associatedServiceUUIDs;
  self->_associatedServiceUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSHashTable)cameraProfilesTable
{
  os_unfair_lock_s *p_lock;
  NSHashTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraProfilesTable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCameraProfilesTable:(id)a3
{
  NSHashTable *v4;
  NSHashTable *cameraProfilesTable;

  v4 = (NSHashTable *)a3;
  os_unfair_lock_lock_with_options();
  cameraProfilesTable = self->_cameraProfilesTable;
  self->_cameraProfilesTable = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSHashTable)associatedServicesTable
{
  os_unfair_lock_s *p_lock;
  NSHashTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_associatedServicesTable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssociatedServicesTable:(id)a3
{
  NSHashTable *v4;
  NSHashTable *associatedServicesTable;

  v4 = (NSHashTable *)a3;
  os_unfair_lock_lock_with_options();
  associatedServicesTable = self->_associatedServicesTable;
  self->_associatedServicesTable = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)associatedServices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](self->_associatedServicesTable, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)cameraProfiles
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](self->_cameraProfilesTable, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDBulletinBoardNotificationServiceGroup associatedServices](self, "associatedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D27E88]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDBulletinBoardNotificationServiceGroup cameraProfiles](self, "cameraProfiles", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D27E78]);
  return v3;
}

- (id)_cameraProfileWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  HMDBulletinBoardNotificationServiceGroup *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDBulletinBoardNotificationServiceGroup cameraProfiles](self, "cameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HMDBulletinBoardNotificationServiceGroup__cameraProfileWithID___block_invoke;
  v14[3] = &unk_1E89A3F30;
  v6 = v4;
  v15 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v14);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find the camera profile with unique id %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)actionContextForCameraProfileID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDBulletinBoardNotificationServiceGroup *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  __CFString *v63;
  BOOL v64;
  BOOL v65;
  unint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __CFString *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[4];
  _QWORD v103[4];
  _QWORD v104[3];
  _QWORD v105[3];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDBulletinBoardNotificationServiceGroup _cameraProfileWithID:](self, "_cameraProfileWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDBulletinBoardNotificationServiceGroup associatedServices](self, "associatedServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = 0x1E0C99000uLL;
    if (!objc_msgSend(v5, "isMicrophonePresent"))
      goto LABEL_4;
    -[HMDBulletinBoardNotificationServiceGroup bulletinBoardNotification](self, "bulletinBoardNotification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D16260]);

    if ((v12 & 1) == 0)
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_MICROPHONE_ACTION"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("microphone_toggleButton");
      v104[0] = CFSTR("itemType");
      v104[1] = CFSTR("identifier");
      v105[0] = CFSTR("MICROPHONE");
      v105[1] = CFSTR("microphone_toggleButton");
      v84 = CFSTR("microphone_toggleButton");
      v85 = (void *)v18;
      v104[2] = CFSTR("title");
      v105[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

    }
    else
    {
LABEL_4:
      v84 = 0;
      v85 = 0;
    }
    v21 = (void *)objc_opt_new();
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke;
    v96[3] = &unk_1E89A3F58;
    v22 = v21;
    v97 = v22;
    v86 = v6;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v96);
    v23 = *MEMORY[0x1E0D16200];
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D16200]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v4;
    v88 = v7;
    v79 = v5;
    v89 = v22;
    if (objc_msgSend(v24, "count"))
    {
      objc_msgSend(v5, "accessory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v29 = v27;
      v30 = v29;
      if (v28)
      {
        v31 = v29;
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v28, "homeLocationHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        +[HMDLocation sunriseTimeForLocation:](HMDLocation, "sunriseTimeForLocation:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDLocation sunsetTimeForLocation:](HMDLocation, "sunsetTimeForLocation:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSince1970");
        v37 = v36;
        objc_msgSend(v35, "timeIntervalSince1970");
        v39 = v38;
        objc_msgSend(v34, "timeIntervalSince1970");
        if (v39 <= v40)
          v41 = v37 >= v40 || v37 <= v39;
        else
          v41 = v37 < v39 && v37 > v40;

        v7 = v88;
        v22 = v89;
        if (v41)
        {
          v80 = 0;
          v81 = 0;
          v82 = 0;
          v83 = 0;
          v8 = 0x1E0C99000;
LABEL_26:
          v46 = objc_alloc_init(MEMORY[0x1E0CB3940]);
          v47 = *MEMORY[0x1E0D16220];
          objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D16220]);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count");

          v50 = *MEMORY[0x1E0D16208];
          objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D16208]);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "count");

          if (!v52 && !v49)
          {
            v53 = 0;
            v54 = 0;
            v5 = v79;
            v55 = v88;
            v56 = v8;
LABEL_45:
            HMDLocalizedStringForKey(CFSTR("BULLETIN_DISMISS_ACTION_TITLE"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEC700], "actionWithIdentifier:title:options:", CFSTR("DISMISS"), v71, 0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v98[0] = CFSTR("categoryID");
            v98[1] = CFSTR("bulletinActionButtonDescription");
            v99[0] = CFSTR("HomeAppBulletinCategory");
            v99[1] = v55;
            v98[2] = *MEMORY[0x1E0CB8368];
            objc_msgSend(v5, "contextSPIUniqueIdentifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "UUIDString");
            v74 = v55;
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v98[3] = CFSTR("dismissButton");
            v99[2] = v75;
            v99[3] = v72;
            objc_msgSend(*(id *)(v56 + 3456), "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v87;
            goto LABEL_46;
          }
          v77 = v46;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "objectForKeyedSubscript:", v47);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = MEMORY[0x1E0C809B0];
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_3;
          v92[3] = &unk_1E89A3F80;
          v60 = v57;
          v93 = v60;
          v78 = v58;
          objc_msgSend(v58, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v92);
          objc_msgSend(v89, "objectForKeyedSubscript:", v50);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v90[0] = v59;
          v90[1] = 3221225472;
          v90[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_4;
          v90[3] = &unk_1E89A3F80;
          v54 = v60;
          v91 = v54;
          objc_msgSend(v61, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v90);
          v53 = (id)*MEMORY[0x1E0D16188];
          if (v52 && v49)
          {
            v62 = objc_msgSend(v61, "count");
            v63 = CFSTR("BULLETIN_ALARM_AND_UNLOCK_ACTION_TITLE");
          }
          else
          {
            if (v52)
              v64 = v49 != 0;
            else
              v64 = 1;
            if (v64)
            {
              if (v49)
                v65 = v52 != 0;
              else
                v65 = 1;
              v5 = v79;
              v55 = v88;
              v66 = 0x1E0C99000;
              v46 = v77;
              if (v65)
                goto LABEL_44;
              HMDLocalizedStringForKey(CFSTR("BULLETIN_DISARM_SECURITY_ACTION_TITLE"));
              v67 = objc_claimAutoreleasedReturnValue();

              v68 = (id)*MEMORY[0x1E0D16190];
              v69 = v53;
              v53 = v68;
LABEL_43:

              v46 = (id)v67;
LABEL_44:
              v100[0] = CFSTR("itemType");
              v100[1] = CFSTR("identifier");
              v101[0] = CFSTR("SERVICE");
              v101[1] = v53;
              v100[2] = CFSTR("title");
              v100[3] = CFSTR("services.uuid");
              v101[2] = v46;
              v101[3] = v54;
              objc_msgSend(*(id *)(v66 + 3456), "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "addObject:", v70);

              v56 = v66;
              goto LABEL_45;
            }
            v62 = objc_msgSend(v61, "count");
            v63 = CFSTR("BULLETIN_UNLOCK_ACTION_TITLE");
          }
          HMDLocalizedStringForKeyWithCount(v63, v62);
          v67 = objc_claimAutoreleasedReturnValue();
          v5 = v79;
          v55 = v88;
          v66 = 0x1E0C99000uLL;
          v69 = v77;
          goto LABEL_43;
        }
      }
      else
      {

      }
      objc_msgSend(v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_2;
      v94[3] = &unk_1E89A3F80;
      v43 = v42;
      v95 = v43;
      objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v94);
      v44 = (id)*MEMORY[0x1E0D16180];
      HMDLocalizedStringForKeyWithCount(CFSTR("BULLETIN_LIGHTS_ACTION_TITLE"), objc_msgSend(v43, "count"));
      v45 = objc_claimAutoreleasedReturnValue();
      v102[0] = CFSTR("itemType");
      v102[1] = CFSTR("identifier");
      v103[0] = CFSTR("SERVICE");
      v103[1] = v44;
      v82 = v43;
      v83 = v44;
      v102[2] = CFSTR("title");
      v102[3] = CFSTR("services.uuid");
      v81 = (void *)v45;
      v103[2] = v45;
      v103[3] = v43;
      v8 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 4);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:");

    }
    else
    {
      v80 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
    }

    goto LABEL_26;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v107 = v16;
    v108 = 2112;
    v109 = v4;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find the camera profile with unique id %@, not providing any context", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v17 = 0;
LABEL_46:

  return v17;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBulletinBoardNotificationServiceGroup bulletinBoardNotification](self, "bulletinBoardNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDBulletinBoardNotificationServiceGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDBulletinBoardNotificationServiceGroup *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *cameraProfileUUIDs;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *associatedServiceUUIDs;
  HMDBulletinBoardNotificationServiceGroup *v19;
  HMDBulletinBoardNotificationServiceGroup *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.BulletinBoardNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMDBulletinBoardNotificationServiceGroup initWithBulletinBoardNotification:](self, "initWithBulletinBoardNotification:", v5);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HM.BulletinBoardNotificationCameraProfiles"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      cameraProfileUUIDs = v6->_cameraProfileUUIDs;
      v6->_cameraProfileUUIDs = (NSSet *)v11;

      v13 = (void *)MEMORY[0x1E0C99E60];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14, v25[0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("HM.BulletinBoardNotificationServices"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      associatedServiceUUIDs = v6->_associatedServiceUUIDs;
      v6->_associatedServiceUUIDs = (NSSet *)v17;

    }
    v19 = v6;
    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v23;
      v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded bulletinBoardNotification: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDBulletinBoardNotificationServiceGroup bulletinBoardNotification](self, "bulletinBoardNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v5, CFSTR("HM.BulletinBoardNotification"));

  -[HMDBulletinBoardNotificationServiceGroup cameraProfileUUIDs](self, "cameraProfileUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.BulletinBoardNotificationCameraProfiles"));

  -[HMDBulletinBoardNotificationServiceGroup associatedServiceUUIDs](self, "associatedServiceUUIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HM.BulletinBoardNotificationServices"));

}

- (HMDBulletinBoardNotification)bulletinBoardNotification
{
  return (HMDBulletinBoardNotification *)objc_loadWeakRetained((id *)&self->_bulletinBoardNotification);
}

- (void)setBulletinBoardNotification:(id)a3
{
  objc_storeWeak((id *)&self->_bulletinBoardNotification, a3);
}

- (void)setAssociatedServices:(id)a3
{
  objc_storeStrong((id *)&self->_associatedServices, a3);
}

- (void)setCameraProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfiles, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_associatedServices, 0);
  objc_destroyWeak((id *)&self->_bulletinBoardNotification);
  objc_storeStrong((id *)&self->_associatedServicesTable, 0);
  objc_storeStrong((id *)&self->_cameraProfilesTable, 0);
  objc_storeStrong((id *)&self->_associatedServiceUUIDs, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUIDs, 0);
}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "serviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contextSPIUniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contextSPIUniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "contextSPIUniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __65__HMDBulletinBoardNotificationServiceGroup__cameraProfileWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_9425 != -1)
    dispatch_once(&logCategory__hmf_once_t27_9425, &__block_literal_global_9426);
  return (id)logCategory__hmf_once_v28_9427;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __55__HMDBulletinBoardNotificationServiceGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v28_9427;
  logCategory__hmf_once_v28_9427 = v0;

}

@end
