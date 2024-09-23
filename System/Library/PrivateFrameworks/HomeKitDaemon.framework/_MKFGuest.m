@implementation _MKFGuest

- (BOOL)isOwner
{
  return 0;
}

- (BOOL)isOwnerOrAdmin
{
  return 0;
}

- (BOOL)isResidentSyncParticipant
{
  void *v2;
  BOOL v3;

  -[_MKFGuest privilege](self, "privilege");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_MKFUser isResidentSyncParticipantWithPrivilege:](_MKFUser, "isResidentSyncParticipantWithPrivilege:", objc_msgSend(v2, "unsignedIntegerValue"));

  return v3;
}

- (BOOL)isRestrictedGuest
{
  void *v2;
  char v3;

  -[_MKFGuest privilege](self, "privilege");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_24E96BC48);

  return v3;
}

- (id)castIfMemberIsUser
{
  return 0;
}

- (id)castIfMemberIsGuest
{
  _MKFGuest *v2;
  _MKFGuest *v3;
  _MKFGuest *v4;

  v2 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)allowedAccessoryUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[_MKFGuest allowedAccessories](self, "allowedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_MKFGuest allowedAccessories](self, "allowedAccessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x227676638]();
        objc_msgSend(v11, "modelID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)restrictedGuestSchedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MKFGuest weekDayScheduleRules](self, "weekDayScheduleRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_138883);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFGuest yearDayScheduleRules](self, "yearDayScheduleRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_17_138884);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7938]), "initWithWeekDayRules:yearDayRules:", v4, v6);
  return v7;
}

- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  -[_MKFGuest dematerializeWeekDayRuleRelationship](self, "dematerializeWeekDayRuleRelationship");
  -[_MKFGuest dematerializeYearDayRuleRelationship](self, "dematerializeYearDayRuleRelationship");
  v5 = 1;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    objc_msgSend(v4, "weekDayRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61___MKFGuest_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke;
    v11[3] = &unk_24E78AA18;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

    objc_msgSend(v4, "yearDayRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __61___MKFGuest_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_21;
    v10[3] = &unk_24E78AA40;
    v10[4] = self;
    v10[5] = &v12;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

    v5 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }

  return v5;
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
  _MKFGuest *v22;
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
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K.%K == %@) AND (%K.%K.%K == %@) AND (%K.%K.%K.modelID == %@)"), CFSTR("guest"), self, CFSTR("deviceIdsIdentifier"), v15, CFSTR("characteristic"), CFSTR("instanceID"), v14, CFSTR("characteristic"), CFSTR("service"), CFSTR("instanceID"), v13, CFSTR("characteristic"), CFSTR("service"), CFSTR("accessory"), v12);
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

- (void)dematerializeAllowedAccessoriesRelationship
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKFGuest setValue:forKey:](self, "setValue:forKey:", v3, CFSTR("allowedAccessories_"));

}

- (void)dematerializeWeekDayRuleRelationship
{
  id v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("weekDayScheduleRules_"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKFModel deleteObjects:](self, "deleteObjects:", v3);

}

- (void)dematerializeYearDayRuleRelationship
{
  id v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("yearDayScheduleRules_"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKFModel deleteObjects:](self, "deleteObjects:", v3);

}

- (MKFGuestDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFGuestDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)allowedAccessories
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("allowedAccessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("allowedAccessories_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("allowedAccessories_"), CFSTR("MKFAirPlayAccessory"), a3, a4);
}

- (id)createAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFAirPlayAccessory"), a3);
}

- (id)findAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFAirPlayAccessory"), a3);
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("allowedAccessories_"), CFSTR("MKFAppleMediaAccessory"), a3, a4);
}

- (id)createAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFAppleMediaAccessory"), a3);
}

- (id)findAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFAppleMediaAccessory"), a3);
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("allowedAccessories_"), CFSTR("MKFHAPAccessory"), a3, a4);
}

- (id)createAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFHAPAccessory"), a3);
}

- (id)findAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedAccessories_"), CFSTR("MKFHAPAccessory"), a3);
}

- (void)addAllowedAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("allowedAccessories_"), a3);
}

- (void)removeAllowedAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("allowedAccessories_"), a3);
}

- (NSArray)bulletinConditions
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("bulletinConditions_"));
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

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("bulletinRegistrations_"));
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

- (NSArray)notificationRegistrations
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("notificationRegistrations_"));
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

- (NSArray)presenceEvents
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("presenceEvents_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)userActivityStatuses
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("userActivityStatuses_"));
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

- (NSArray)weekDayScheduleRules
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("weekDayScheduleRules_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("weekDayScheduleRules_"), CFSTR("MKFWeekDayScheduleRule"), a3, a4);
}

- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("weekDayScheduleRules_"), CFSTR("MKFWeekDayScheduleRule"), a3);
}

- (void)addWeekDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("weekDayScheduleRules_"), a3);
}

- (void)removeWeekDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("weekDayScheduleRules_"), a3);
}

- (NSArray)yearDayScheduleRules
{
  void *v2;
  void *v3;

  -[_MKFGuest valueForKey:](self, "valueForKey:", CFSTR("yearDayScheduleRules_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("yearDayScheduleRules_"), CFSTR("MKFYearDayScheduleRule"), a3, a4);
}

- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("yearDayScheduleRules_"), CFSTR("MKFYearDayScheduleRule"), a3);
}

- (void)addYearDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("yearDayScheduleRules_"), a3);
}

- (void)removeYearDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("yearDayScheduleRules_"), a3);
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

+ (id)findGuestUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
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
  +[_MKFGuest fetchRequest](_MKFGuest, "fetchRequest");
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

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t6 != -1)
    dispatch_once(&homeRelation__hmf_once_t6, &__block_literal_global_47_138902);
  return (NSPredicate *)(id)homeRelation__hmf_once_v7;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558459A0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_138898 != -1)
    dispatch_once(&logCategory__hmf_once_t8_138898, &__block_literal_global_571);
  return (id)logCategory__hmf_once_v9_138899;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  _MKFGuest *v6;
  id v7;
  _MKFGuest *v8;
  _MKFGuest *v9;
  _MKFGuest *v10;
  id v11;

  v11 = a3;
  v6 = self;
  v7 = a4;
  if (-[_MKFGuest conformsToProtocol:](v6, "conformsToProtocol:", &unk_2557E4E40))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v7, "targetUser");
  v10 = (_MKFGuest *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
    objc_msgSend(v11, "addCondition:", CFSTR("userIsTargetUser"));

}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFGuest"));
}

@end
