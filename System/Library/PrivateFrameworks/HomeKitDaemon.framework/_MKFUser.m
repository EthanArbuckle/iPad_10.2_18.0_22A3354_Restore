@implementation _MKFUser

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFUser"));
}

- (id)characteristicBulletinRegistrationForAccessory:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 deviceIdsIdentifier:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _MKFUser *v22;
  NSObject *v23;
  void *v25;
  void *context;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[_MKFCharacteristicBulletinRegistration fetchRequest](_MKFCharacteristicBulletinRegistration, "fetchRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K.%K == %@) AND (%K.%K.%K == %@) AND (%K.%K.%K.modelID == %@)"), CFSTR("user"), self, CFSTR("deviceIdsIdentifier"), v15, CFSTR("characteristic"), CFSTR("instanceID"), v14, CFSTR("characteristic"), CFSTR("service"), CFSTR("instanceID"), v13, CFSTR("characteristic"), CFSTR("service"), CFSTR("accessory"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v18);

  v27 = 0;
  objc_msgSend(v16, "executeFetchRequest:error:", v17, &v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v27;
  if (v19)
  {
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v25;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic bulletin registration with characteristic instanceID %@: on accessory %@, error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(context);
    v21 = 0;
  }

  return v21;
}

- (_MKFUser)userWithAccessCode:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _MKFUser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFUserAccessCode fetchRequest](_MKFUserAccessCode, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("accessCode"), v6, CFSTR("user"), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v19 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
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
      -[_MKFUser modelID](v14, "modelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v16;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch userAccessCodes with access code %@ and user UUID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return (_MKFUser *)v12;
}

- (id)notificationRegistrationForCharacteristic:(id)a3 deviceIdsDestination:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _MKFUser *v22;
  NSObject *v23;
  id v24;
  void *v25;
  _MKFUser *v26;
  NSObject *v27;
  void *v29;
  void *context;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_MKFNotificationRegistrationCharacteristic fetchRequest](_MKFNotificationRegistrationCharacteristic, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v14 && v16)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K.%K == %@) AND (%K.%K.%K == %@) AND (%K.%K.%K.modelID == %@)"), CFSTR("user"), self, CFSTR("deviceIdsDestination"), v9, CFSTR("characteristic"), CFSTR("instanceID"), v12, CFSTR("characteristic"), CFSTR("service"), CFSTR("instanceID"), v14, CFSTR("characteristic"), CFSTR("service"), CFSTR("accessory"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v17);

    v31 = v10;
    v33 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v11, &v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v33;
    if (v18)
    {
      objc_msgSend(v18, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v29;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v19;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for characteristic: %@, deviceIdsDestination: %@, error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
      v20 = 0;
    }

    v10 = v31;
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = v9;
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v25;
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Error before fetching registration for characteristic, characteristic value should not be nil: instanceID: %@, serviceInstanceID: %@, accessoryUUID: %@", buf, 0x2Au);

      v10 = v24;
      v9 = v32;
    }

    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (id)notificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _MKFUser *v22;
  NSObject *v23;
  void *v25;
  void *context;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[_MKFNotificationRegistrationMediaProperty fetchRequest](_MKFNotificationRegistrationMediaProperty, "fetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v10;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@) AND (%K == %@) AND (%K.modelID == %@)"), CFSTR("user"), self, CFSTR("deviceIdsDestination"), v12, CFSTR("mediaProperty"), v10, CFSTR("mediaProfileIdentifier"), v15, CFSTR("accessory"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v18);

  v28 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v14, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  if (v19)
  {
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v30 = v25;
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for mediaProperty: %@, mediaProfile: %@, deviceIdsDestination: %@, error: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(context);
    v21 = 0;
  }

  return v21;
}

- (id)sharedUserDataRoot
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[_MKFUser managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedUserDataRootForUser:context:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isOwner
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[_MKFUser privilege](self, "privilege");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isOwnerWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (BOOL)isOwnerOrAdmin
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[_MKFUser privilege](self, "privilege");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isOwnerOrAdminWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (BOOL)isResidentSyncParticipant
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[_MKFUser privilege](self, "privilege");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isResidentSyncParticipantWithPrivilege:", objc_msgSend(v4, "unsignedIntegerValue"));

  return (char)v3;
}

- (id)additionalModelsForSameUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _MKFUser *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _MKFUser *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  _MKFUser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _MKFUser *v35;
  __int16 v36;
  id v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  -[_MKFUser managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUser fetchRequest](_MKFUser, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1758];
  -[_MKFUser home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFUser modelID](self, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K != %@)"), CFSTR("home"), v6, CFSTR("modelID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v8);

  v38[0] = CFSTR("accountIdentifier");
  v38[1] = CFSTR("idsMergeIdentifier");
  v38[2] = CFSTR("modelID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v9);

  v31 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_MKFUser *)v31;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __39___MKFUser_additionalModelsForSameUser__block_invoke;
      v29[3] = &unk_24E77E198;
      v29[4] = self;
      v13 = v12;
      v30 = v13;
      objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
      v14 = objc_msgSend(v13, "count");
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v14)
      {
        if (v18)
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v33 = v19;
          v34 = 2112;
          v35 = v16;
          v36 = 2112;
          v37 = v13;
          v20 = "%{public}@%@ matched additional models: %@";
          v21 = v17;
          v22 = 32;
LABEL_12:
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, v20, buf, v22);

        }
      }
      else if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v19;
        v34 = 2112;
        v35 = v16;
        v20 = "%{public}@%@ did not match any other models";
        v21 = v17;
        v22 = 22;
        goto LABEL_12;
      }

      objc_autoreleasePoolPop(v15);
      v27 = (void *)objc_msgSend(v13, "copy");

      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to find user models: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v27 = 0;
  }
LABEL_14:

  return v27;
}

- (id)castIfMemberIsUser
{
  _MKFUser *v2;
  _MKFUser *v3;
  _MKFUser *v4;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isRestrictedGuest
{
  void *v2;
  char v3;

  -[_MKFUser privilege](self, "privilege");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_24E96ADF0);

  return v3;
}

- (NSArray)allowedAccessories
{
  return 0;
}

- (id)castIfMemberIsGuest
{
  return 0;
}

- (MKFUserDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFUserDatabaseID alloc], "initWithMKFObject:", self);
}

- (id)materializeOrCreateAccessCodeRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accessCode"), CFSTR("MKFUserAccessCode"), a3, a4);
}

- (id)findAccessCodeRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessCode"), CFSTR("MKFUserAccessCode"), a3);
}

- (NSArray)accessoriesWithListeningHistoryEnabled
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("accessoriesWithListeningHistoryEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addAccessoriesWithListeningHistoryEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("accessoriesWithListeningHistoryEnabled_"), a3);
}

- (void)removeAccessoriesWithListeningHistoryEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("accessoriesWithListeningHistoryEnabled_"), a3);
}

- (NSArray)accessoriesWithMediaContentProfileEnabled
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("accessoriesWithMediaContentProfileEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addAccessoriesWithMediaContentProfileEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("accessoriesWithMediaContentProfileEnabled_"), a3);
}

- (void)removeAccessoriesWithMediaContentProfileEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("accessoriesWithMediaContentProfileEnabled_"), a3);
}

- (NSArray)accessoriesWithPersonalRequestsEnabled
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("accessoriesWithPersonalRequestsEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addAccessoriesWithPersonalRequestsEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("accessoriesWithPersonalRequestsEnabled_"), a3);
}

- (void)removeAccessoriesWithPersonalRequestsEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("accessoriesWithPersonalRequestsEnabled_"), a3);
}

- (NSArray)bulletinConditions
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("bulletinConditions_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateBulletinConditionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinConditions_"), CFSTR("MKFPresenceBulletinCondition"), a3, a4);
}

- (id)findBulletinConditionsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinConditions_"), CFSTR("MKFPresenceBulletinCondition"), a3);
}

- (void)addBulletinConditionsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("bulletinConditions_"), a3);
}

- (void)removeBulletinConditionsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("bulletinConditions_"), a3);
}

- (NSArray)bulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("bulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createBulletinRegistrationsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFAnalysisEventBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFAnalysisEventBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeAnalysisEventBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFAnalysisEventBulletinRegistration"), a3);
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFBulletinRegistration"), a3);
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraAccessModeBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraAccessModeBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeCameraAccessModeBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraAccessModeBulletinRegistration"), a3);
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraReachabilityBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraReachabilityBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeCameraReachabilityBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraReachabilityBulletinRegistration"), a3);
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraSignificantEventBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraSignificantEventBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeCameraSignificantEventBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCameraSignificantEventBulletinRegistration"), a3);
}

- (id)materializeOrCreateBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCharacteristicBulletinRegistration"), a3, a4);
}

- (id)createBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCharacteristicBulletinRegistration"), a3);
}

- (id)findBulletinRegistrationsRelationOfTypeCharacteristicBulletinRegistrationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("bulletinRegistrations_"), CFSTR("MKFCharacteristicBulletinRegistration"), a3);
}

- (void)addBulletinRegistrationsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("bulletinRegistrations_"), a3);
}

- (void)removeBulletinRegistrationsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("bulletinRegistrations_"), a3);
}

- (NSArray)locationEvents
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("locationEvents_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)notificationRegistrations
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("notificationRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("notificationRegistrations_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createNotificationRegistrationsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationActionSet"), a3, a4);
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationActionSet"), a3);
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationActionSet"), a3);
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationCharacteristic"), a3, a4);
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationCharacteristic"), a3);
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationCharacteristic"), a3);
}

- (id)materializeOrCreateNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationMediaProperty"), a3, a4);
}

- (id)createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationMediaProperty"), a3);
}

- (id)findNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("notificationRegistrations_"), CFSTR("MKFNotificationRegistrationMediaProperty"), a3);
}

- (void)addNotificationRegistrationsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("notificationRegistrations_"), a3);
}

- (void)removeNotificationRegistrationsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("notificationRegistrations_"), a3);
}

- (NSArray)pairedAirPlayAccessories
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("pairedAirPlayAccessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addPairedAirPlayAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("pairedAirPlayAccessories_"), a3);
}

- (void)removePairedAirPlayAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("pairedAirPlayAccessories_"), a3);
}

- (NSArray)pairedHAPAccessories
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("pairedHAPAccessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addPairedHAPAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("pairedHAPAccessories_"), a3);
}

- (void)removePairedHAPAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("pairedHAPAccessories_"), a3);
}

- (NSArray)personsFromPhotos
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("personsFromPhotos_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreatePersonsFromPhotosRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("personsFromPhotos_"), CFSTR("MKFPhotosPerson"), a3, a4);
}

- (id)findPersonsFromPhotosRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("personsFromPhotos_"), CFSTR("MKFPhotosPerson"), a3);
}

- (void)addPersonsFromPhotosObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("personsFromPhotos_"), a3);
}

- (void)removePersonsFromPhotosObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("personsFromPhotos_"), a3);
}

- (NSArray)presenceEvents
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("presenceEvents_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)triggers
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("triggers_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)userActivityStatuses
{
  void *v2;
  void *v3;

  -[_MKFUser valueForKey:](self, "valueForKey:", CFSTR("userActivityStatuses_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateUserActivityStatusesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("userActivityStatuses_"), CFSTR("MKFUserActivityStatus"), a3, a4);
}

- (id)findUserActivityStatusesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("userActivityStatuses_"), CFSTR("MKFUserActivityStatus"), a3);
}

- (void)addUserActivityStatusesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("userActivityStatuses_"), a3);
}

- (void)removeUserActivityStatusesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("userActivityStatuses_"), a3);
}

+ (id)findUserUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_MKFUser fetchRequest](_MKFUser, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@ && %K.%K == %@"), CFSTR("reverseShareID"), v8, CFSTR("home"), CFSTR("modelID"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setFetchLimit:", 2);
  v23 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v11, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2114;
      v27 = (uint64_t)v14;
      v20 = "%{public}@Failed to fetch working store user resulted into error: %{public}@";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);

    }
LABEL_9:

    objc_autoreleasePoolPop(v16);
    v15 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v13, "count") != 1)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2048;
      v27 = v21;
      v20 = "%{public}@Failed to fetch working store user resulted into error: %zd matching users";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)sharedUserDataRootForUser:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hmd_coreData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "reverseShareID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isOwner"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v13;
      v60 = 2112;
      v61 = v14;
      v15 = "%{public}@Owner %@ does not have a reverse share for their own home";
LABEL_21:
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v15, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v10)
  {
    +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    v56 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v16, &v56);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v56;
    v49 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "count"))
      {
        v46 = v16;
        v47 = v19;
        v50 = v10;
        v42 = v9;
        v43 = v7;
        v44 = v6;
        v45 = v5;
        objc_msgSend(v7, "container");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v21 = v18;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v53;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v53 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              objc_msgSend(v26, "objectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "recordForManagedObjectID:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v28, "share");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "recordID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v50, "isEqual:", v30);

                if ((v31 & 1) != 0)
                {
                  v35 = v26;

                  goto LABEL_29;
                }
              }

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            if (v23)
              continue;
            break;
          }
        }

        v32 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v34;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to find associated shared data root for user", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v32);
        v35 = 0;
LABEL_29:
        v6 = v44;
        v5 = v45;
        v9 = v42;
        v7 = v43;
        v10 = v50;
        v19 = v47;

        v16 = v46;
        goto LABEL_30;
      }
      v36 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = v19;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v40;
        v60 = 2112;
        v61 = v9;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@No shared user data roots for home %@", buf, 0x16u);

        v19 = v48;
      }
    }
    else
    {
      v36 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v51 = v36;
        v38 = v19;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v39;
        v60 = 2112;
        v61 = v9;
        v62 = 2112;
        v63 = v38;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch shared user data roots for home %@: %@", buf, 0x20u);

        v19 = v38;
        v36 = v51;
      }
    }

    objc_autoreleasePoolPop(v36);
    v35 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v11 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v13;
    v60 = 2112;
    v61 = v14;
    v15 = "%{public}@Shared user %@ does not have a reverse share assigned";
    goto LABEL_21;
  }
LABEL_22:

  objc_autoreleasePoolPop(v11);
  v35 = 0;
LABEL_31:

  return v35;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (BOOL)isOwnerWithPrivilege:(unint64_t)a3
{
  return a3 == 3;
}

+ (BOOL)isOwnerOrAdminWithPrivilege:(unint64_t)a3
{
  return a3 - 3 < 2;
}

+ (BOOL)isResidentSyncParticipantWithPrivilege:(unint64_t)a3
{
  return (a3 < 6) & (0x39u >> a3);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t22 != -1)
    dispatch_once(&homeRelation__hmf_once_t22, &__block_literal_global_60749);
  return (NSPredicate *)(id)homeRelation__hmf_once_v23;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557E6C28;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_60745 != -1)
    dispatch_once(&logCategory__hmf_once_t24_60745, &__block_literal_global_718);
  return (id)logCategory__hmf_once_v25_60746;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  _MKFUser *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a4, "targetUser");
  v6 = (_MKFUser *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    objc_msgSend(v7, "addCondition:", CFSTR("userIsTargetUser"));
  if (-[_MKFUser isOwner](self, "isOwner"))
    objc_msgSend(v7, "addCondition:", CFSTR("userIsOwner"));

}

@end
