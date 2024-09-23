@implementation _MKFAppleMediaAccessory

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  _MKFAppleMediaAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _MKFAppleMediaAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _MKFAppleMediaAccessory *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _MKFAppleMediaAccessory *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  _MKFAppleMediaAccessory *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint32_t v48;
  void *v49;
  _MKFAppleMediaAccessory *v50;
  NSObject *v51;
  void *v52;
  objc_super v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)_MKFAppleMediaAccessory;
  -[_MKFModel willSave](&v53, sel_willSave);
  if (-[_MKFAppleMediaAccessory isDeleted](self, "isDeleted"))
  {
    -[_MKFAppleMediaAccessory managedObjectContext](self, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find MOC when processing removal for AppleMediaAccessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      goto LABEL_44;
    }
    objc_msgSend(v3, "hmd_coreData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find local store when processing removal for AppleMediaAccessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      goto LABEL_43;
    }
    v7 = +[HMDDeviceCapabilities isAppleMediaAccessory](HMDDeviceCapabilities, "isAppleMediaAccessory");
    if ((isInternalBuild() & 1) != 0)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hmf_BOOLForKey:", CFSTR("test__MKFAppleMediaAccessoryMockIsAppleMediaAccessoryMetadataKey"));

      if (v9)
      {
        objc_msgSend(v4, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hmf_BOOLForKey:", CFSTR("test__MKFAppleMediaAccessoryMockIsAppleMediaAccessoryMetadataKey"));

        if ((v11 & 1) == 0)
          goto LABEL_43;
      }
      else if (!v7)
      {
LABEL_43:

LABEL_44:
        return;
      }
    }
    else if (!v7)
    {
      goto LABEL_43;
    }
    -[_MKFAppleMediaAccessory identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier when processing removal for AppleMediaAccessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      goto LABEL_42;
    }
    v21 = (id)_mediaRouteIdentifier;
    if (isInternalBuild())
    {
      objc_msgSend(v4, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmf_stringForKey:", CFSTR("test_MKFAppleMediaAccessoryMockMediaRouteMetadataKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hmf_stringForKey:", CFSTR("test_MKFAppleMediaAccessoryMockMediaRouteMetadataKey"));
        v25 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v25;
      }
    }
    if (v21)
    {
      if ((objc_msgSend(v21, "isEqualToString:", v20) & 1) != 0)
      {
        -[_MKFAppleMediaAccessory modelID](self, "modelID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v6, "metadata");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "hmf_UUIDForKey:", CFSTR("HMDLastRemovedCurrentAccessoryMetadataKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "hmf_isEqualToUUID:", v26);

          if ((v29 & 1) == 0)
          {
            objc_msgSend(v6, "metadata");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v30, "mutableCopy");

            objc_msgSend(v26, "UUIDString");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("HMDLastRemovedCurrentAccessoryMetadataKey"));

            v33 = (void *)MEMORY[0x227676638](objc_msgSend(v6, "setMetadata:", v31));
            v34 = self;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v36;
              v56 = 2112;
              v57 = v26;
              _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Storing removed current accessory uuid into local store metadata %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v33);

          }
        }
        else
        {
          v49 = (void *)MEMORY[0x227676638]();
          v50 = self;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v55 = v52;
            _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Nil accessory uuid/modelID when processing removal for AppleMediaAccessory", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v49);
        }

        goto LABEL_41;
      }
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v44;
        v56 = 2112;
        v57 = v20;
        v58 = 2112;
        v59 = v21;
        v45 = "%{public}@Removed accessory identifier (%@) does not match current accessory media routeID %@";
        v46 = v43;
        v47 = OS_LOG_TYPE_INFO;
        v48 = 32;
        goto LABEL_35;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v44;
        v45 = "%{public}@Nil current device media route id when processing removal for AppleMediaAccessory";
        v46 = v43;
        v47 = OS_LOG_TYPE_ERROR;
        v48 = 12;
LABEL_35:
        _os_log_impl(&dword_2218F0000, v46, v47, v45, buf, v48);

      }
    }

    objc_autoreleasePoolPop(v41);
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
}

- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _MKFAppleMediaAccessory *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _MKFAppleMediaAccessory *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v6, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch bulletin registrations on accessory %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)analysisBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_MKFAnalysisEventBulletinRegistration fetchRequest](_MKFAnalysisEventBulletinRegistration, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFAppleMediaAccessory _analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:](self, "_analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  -[_MKFAppleMediaAccessory bulletinRegistrationFromFetchRequest:context:](self, "bulletinRegistrationFromFetchRequest:context:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_analysisPredicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@)"), CFSTR("accessory"), self, CFSTR("deviceIdsIdentifier"), a3, CFSTR("user"), a4);
}

- (MKFAppleMediaAccessoryDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFAppleMediaAccessoryDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)actionsAppleMediaAccessoryPower
{
  void *v2;
  void *v3;

  -[_MKFAppleMediaAccessory valueForKey:](self, "valueForKey:", CFSTR("actionsAppleMediaAccessoryPower_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255810480;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFAppleMediaAccessory"));
}

@end
