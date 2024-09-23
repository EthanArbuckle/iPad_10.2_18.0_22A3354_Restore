@implementation MKFCKAccessory

- (void)_importOwnerSettingsIntoLocalModel:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Cannot import owner settings since owner user cloud model is not available yet", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      goto LABEL_22;
    }
    objc_msgSend(v8, "fetchLocalModelWithContext:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(a1, "ownerListeningHistoryEnabled"))
        objc_msgSend(v5, "addUsersWithListeningHistoryEnabled_Object:", v9);
      else
        objc_msgSend(v5, "removeUsersWithListeningHistoryEnabledObject:", v9);
      if (objc_msgSend(a1, "ownerMediaContentProfileEnabled"))
        objc_msgSend(v5, "addUsersWithMediaContentProfileEnabled_Object:", v9);
      else
        objc_msgSend(v5, "removeUsersWithMediaContentProfileEnabled_Object:", v9);
      if (objc_msgSend(a1, "ownerPersonalRequestsEnabled"))
        v18 = objc_msgSend(v5, "addUsersWithPersonalRequestsEnabled_Object:", v9);
      else
        v18 = objc_msgSend(v5, "removeUsersWithPersonalRequestsEnabled_Object:", v9);
      v14 = (void *)MEMORY[0x227676638](v18);
      v19 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Imported owner settings for accessory: %@", (uint8_t *)&v21, 0x16u);

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        objc_autoreleasePoolPop(v14);
LABEL_22:

        goto LABEL_23;
      }
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot import owner settings since owner user local model is not imported yet", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_23:

}

- (void)_exportOwnerSettingsFromLocalModel:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Exporting owner settings for accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v5, "usersWithListeningHistoryEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke;
    v29[3] = &unk_24E77EC18;
    v17 = v9;
    v30 = v17;
    v18 = objc_msgSend(v15, "na_any:", v29);

    if ((_DWORD)v18 != objc_msgSend(v11, "ownerListeningHistoryEnabled"))
      objc_msgSend(v11, "setOwnerListeningHistoryEnabled:", v18);
    objc_msgSend(v5, "usersWithMediaContentProfileEnabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_2;
    v27[3] = &unk_24E77EC18;
    v20 = v17;
    v28 = v20;
    v21 = objc_msgSend(v19, "na_any:", v27);

    if ((_DWORD)v21 != objc_msgSend(v11, "ownerMediaContentProfileEnabled"))
      objc_msgSend(v11, "setOwnerMediaContentProfileEnabled:", v21);
    objc_msgSend(v5, "usersWithPersonalRequestsEnabled");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_3;
    v25[3] = &unk_24E77EC18;
    v26 = v20;
    v23 = v20;
    v24 = objc_msgSend(v22, "na_any:", v25);

    if ((_DWORD)v24 != objc_msgSend(v11, "ownerPersonalRequestsEnabled"))
      objc_msgSend(v11, "setOwnerPersonalRequestsEnabled:", v24);

  }
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __71__MKFCKAccessory_Settings___exportOwnerSettingsFromLocalModel_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  MKFCKAccessory *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[MKFCKAccessory isHosted](self, "isHosted"))
  {
    -[MKFCKAccessory _localModelForHostAccessoryWithContext:](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill host accessory relationship yet", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  MKFCKAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MKFCKAccessory *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  MKFCKAccessory *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *context;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[6];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  char v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v8, v10))
  {
    -[MKFCKAccessory _importOwnerSettingsIntoLocalModel:context:](self, v8, v10);
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    if (v9)
    {
      if (!objc_msgSend(v9, "hmf_isEmpty"))
      {
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __65__MKFCKAccessory_importIntoLocalModel_updatedProperties_context___block_invoke;
        v62[3] = &unk_24E798868;
        v62[4] = self;
        v62[5] = &v63;
        objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v62);
        if (!*((_BYTE *)v64 + 24))
        {
          if (!self)
            goto LABEL_37;
          goto LABEL_29;
        }
LABEL_9:
        v60 = v8;
        v61 = v10;
        if (!self)
        {

          goto LABEL_24;
        }
        -[MKFCKAccessory room](self, "room");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[MKFCKAccessory home](self, "home");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "defaultRoom");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v14 = (void *)MEMORY[0x227676638]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v17;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill room relationship yet", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v14);
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v15;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
          if (!v59)
          {
            if (v21)
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v69 = v29;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Default room also not available", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v18);
            v12 = 0;
            v67 = 1;
LABEL_23:

            v28 = v67;
            if ((v28 & 1) == 0)
            {
LABEL_24:
              LOBYTE(self) = 0;
LABEL_37:
              _Block_object_dispose(&v63, 8);
              goto LABEL_38;
            }
LABEL_29:
            v30 = v8;
            -[MKFCKAccessory _localModelForHostAccessoryWithContext:](self, v10);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKAccessory isHosted](self, "isHosted");
            objc_msgSend(v30, "setHostAccessory:", v31);

            -[MKFCKAccessory applicationData](self, "applicationData");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", v32, v30);

            -[MKFCKAccessory initialCategory](self, "initialCategory");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "initialCategoryIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = HMFEqualObjects();

            if ((v35 & 1) == 0)
              objc_msgSend(v30, "setInitialCategoryIdentifier:", v33);
            -[MKFCKAccessory initialManufacturer](self, "initialManufacturer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "initialManufacturer");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = HMFEqualObjects();

            if ((v38 & 1) == 0)
              objc_msgSend(v30, "setInitialManufacturer:", v36);
            -[MKFCKAccessory initialModel](self, "initialModel");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "initialModel");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = HMFEqualObjects();

            if ((v41 & 1) == 0)
              objc_msgSend(v30, "setInitialModel:", v39);
            if (!objc_msgSend(v9, "count"))
            {
              -[MKFCKAccessory initialManufacturer](self, "initialManufacturer");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                objc_msgSend(v30, "manufacturer");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44 == 0;

                if (v45)
                {
                  -[MKFCKAccessory initialManufacturer](self, "initialManufacturer");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = (void *)objc_msgSend(v46, "copy");
                  objc_msgSend(v30, "setManufacturer:", v47);

                }
              }
              -[MKFCKAccessory initialModel](self, "initialModel");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                objc_msgSend(v30, "model");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v49 == 0;

                if (v50)
                {
                  -[MKFCKAccessory initialModel](self, "initialModel");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = (void *)objc_msgSend(v51, "copy");
                  objc_msgSend(v30, "setModel:", v52);

                }
              }
              -[MKFCKAccessory initialCategory](self, "initialCategory");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (v53)
              {
                objc_msgSend(v30, "accessoryCategory");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v54 == 0;

                if (v55)
                {
                  -[MKFCKAccessory initialCategory](self, "initialCategory");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = (void *)objc_msgSend(v56, "copy");
                  objc_msgSend(v30, "setAccessoryCategory:", v57);

                }
              }
            }

            LOBYTE(self) = 1;
            goto LABEL_37;
          }
          if (v21)
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v69 = v22;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Substituting nil room with default room", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          v12 = v59;
        }
        objc_msgSend(v12, "fetchLocalModelWithContext:", v61);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v60, "setRoom:", v23);
        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v24 = self;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v69 = v26;
            v70 = 2112;
            v71 = v27;
            v72 = 2112;
            v73 = v12;
            _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.room = %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
        }
        v67 = 1;

        goto LABEL_23;
      }
      v11 = (char *)(v64 + 3);
    }
    else
    {
      v11 = &v66;
    }
    *v11 = 1;
    goto LABEL_9;
  }
  LOBYTE(self) = 0;
LABEL_38:

  return (char)self;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  MKFCKAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  MKFCKAccessory *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  int v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v52;
  void *v53;
  void *v54;
  BOOL v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (!-[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v7, v8))
    goto LABEL_34;
  -[MKFCKAccessory _exportOwnerSettingsFromLocalModel:context:](self, v7, v8);
  v9 = v7;
  v10 = v8;
  v11 = self != 0;
  if (!self)
    goto LABEL_37;
  objc_msgSend(v9, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:](HMDCoreDataCloudTransform, "exportTransformableClassFromEntity:", v13);

  -[objc_class fetchWithLocalModel:context:](v14, "fetchWithLocalModel:context:", v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[MKFCKAccessory room](self, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if ((v17 & 1) == 0)
      -[MKFCKAccessory setRoom:](self, "setRoom:", v15);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v52 = v7;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectID");
      v53 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v21;
      v58 = 2112;
      v59 = v22;
      v60 = 2112;
      v61 = v12;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.room = %@", buf, 0x20u);

      v18 = v53;
      v7 = v52;
    }

    objc_autoreleasePoolPop(v18);
    v11 = self != 0;
  }

  v23 = v9;
  v24 = v10;
  objc_msgSend(v23, "hostAccessory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v25 != 0) != -[MKFCKAccessory isHosted](self, "isHosted"))
    -[MKFCKAccessory setIsHosted:](self, "setIsHosted:", v25 != 0);
  if (v25)
  {
    +[MKFCKModel fetchWithLocalModel:context:](MKFCKAccessory, "fetchWithLocalModel:context:", v25, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = v11;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectID");
        v54 = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v30;
        v58 = 2112;
        v59 = v31;
        v60 = 2112;
        v61 = v25;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.hostAccessory = %@", buf, 0x20u);

        v27 = v54;
        v11 = v55;
      }

      objc_autoreleasePoolPop(v27);
      v26 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v26 = 0;
  }
  -[MKFCKAccessory hostAccessory](self, "hostAccessory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = HMFEqualObjects();

  if ((v33 & 1) == 0)
    -[MKFCKAccessory setHostAccessory:](self, "setHostAccessory:", v26);
LABEL_19:
  buf[0] = 1;

  v34 = buf[0];
  if (v34 == 1)
  {
    v35 = v23;
    v36 = v24;
    objc_msgSend(v35, "hostedAccessories");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v35, "entity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "relationshipsByName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("hostedAccessories_"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKFCKModel relationshipForLocalName:localModel:](self, "relationshipForLocalName:localModel:", CFSTR("hostedAccessories_"), v35);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](self, v35, v40, v41, v36);

    }
    +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", v35);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MKFCKAccessory applicationData](self, "applicationData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = HMFEqualObjects();

    if ((v43 & 1) == 0)
      -[MKFCKAccessory setApplicationData:](self, "setApplicationData:", v9);
    -[MKFCKAccessory initialCategory](self, "initialCategory");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "unsignedIntegerValue"))
    {
      objc_msgSend(v35, "initialCategoryIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "unsignedIntegerValue");

      if (!v46)
        goto LABEL_28;
      objc_msgSend(v35, "initialCategoryIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKAccessory setInitialCategory:](self, "setInitialCategory:", v44);
    }

LABEL_28:
    -[MKFCKAccessory initialManufacturer](self, "initialManufacturer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      objc_msgSend(v35, "initialManufacturer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
        goto LABEL_32;
      objc_msgSend(v35, "initialManufacturer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKAccessory setInitialManufacturer:](self, "setInitialManufacturer:", v47);
    }

LABEL_32:
    -[MKFCKAccessory initialModel](self, "initialModel");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v10 = (id)v49;
    }
    else
    {
      objc_msgSend(v35, "initialModel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
      {
LABEL_38:

        goto LABEL_39;
      }
      objc_msgSend(v35, "initialModel");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[MKFCKAccessory setInitialModel:](self, "setInitialModel:", v10);
    }
LABEL_37:

    goto LABEL_38;
  }
LABEL_34:
  v11 = 0;
LABEL_39:

  return v11;
}

void __65__MKFCKAccessory_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("room"));

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Room property is dirty", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (id)_localModelForHostAccessoryWithContext:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "hostAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "fetchLocalModelWithContext:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKAccessory"));
}

@end
