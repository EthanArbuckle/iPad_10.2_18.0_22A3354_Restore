@implementation _MKFHAPAccessory

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHAPAccessory"));
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

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t7 != -1)
    dispatch_once(&homeRelation__hmf_once_t7, &__block_literal_global_39_154980);
  return (NSPredicate *)(id)homeRelation__hmf_once_v8;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_255852958;
}

- (BOOL)hasRGCapableService
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = (void *)MEMORY[0x227676638](self, a2);
  -[_MKFHAPAccessory services](self, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hmf_isEmpty");

  v8 = 0;
  if ((v5 & 1) == 0)
  {
    -[_MKFHAPAccessory services](self, "services");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "na_map:", &__block_literal_global_155239);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = objc_msgSend(MEMORY[0x24BDD7940], "doesAccessoryHaveRestrictedGuestCapableServiceTypes:", v7);
    if ((v6 & 1) != 0)
      v8 = 1;
  }
  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)serviceWithID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _MKFHAPAccessory *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFService fetchRequest](_MKFService, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("accessory"), self, CFSTR("instanceID"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v18 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
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
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch services with instanceID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)characteristicFromInstanceID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _MKFHAPAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFCharacteristic fetchRequest](_MKFCharacteristic, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K.%K == %@) AND (%K == %@)"), CFSTR("service"), CFSTR("accessory"), self, CFSTR("instanceID"), v6);
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
      -[_MKFHAPAccessory modelID](v14, "modelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristics with accessory UUID %@ & instanceID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)bulletinRegistrationFromFetchRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _MKFHAPAccessory *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _MKFHAPAccessory *v20;
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

- (id)cameraReachabilityBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
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
  +[_MKFCameraReachabilityBulletinRegistration fetchRequest](_MKFCameraReachabilityBulletinRegistration, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHAPAccessory predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:](self, "predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  -[_MKFHAPAccessory bulletinRegistrationFromFetchRequest:context:](self, "bulletinRegistrationFromFetchRequest:context:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)cameraAccessModeBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
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
  +[_MKFCameraAccessModeBulletinRegistration fetchRequest](_MKFCameraAccessModeBulletinRegistration, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHAPAccessory predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:](self, "predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  -[_MKFHAPAccessory bulletinRegistrationFromFetchRequest:context:](self, "bulletinRegistrationFromFetchRequest:context:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)cameraSignificantEventBulletinRegistrationWithDeviceIdsIdentifier:(id)a3 user:(id)a4 context:(id)a5
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
  +[_MKFCameraSignificantEventBulletinRegistration fetchRequest](_MKFCameraSignificantEventBulletinRegistration, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHAPAccessory predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:](self, "predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:user:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  -[_MKFHAPAccessory bulletinRegistrationFromFetchRequest:context:](self, "bulletinRegistrationFromFetchRequest:context:", v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)predicateToFetchBulletinRegistrationOnDeviceIdsIdentifier:(id)a3 user:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@)"), CFSTR("accessory"), self, CFSTR("deviceIdsIdentifier"), a3, CFSTR("user"), a4);
}

- (void)maybeFixUpCharacteristicWriteActionsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _MKFHAPAccessory *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  __CFString *v15;
  _MKFHAPAccessory *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmd_assertIsExecuting");
  +[_MKFCharacteristicWriteAction fetchRequest](_MKFCharacteristicWriteAction, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("accessory"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v23[0] = CFSTR("characteristicID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v7);

  v18 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __66___MKFHAPAccessory_maybeFixUpCharacteristicWriteActionsInContext___block_invoke;
    v14[3] = &unk_24E78A300;
    v15 = CFSTR("service");
    v16 = self;
    v17 = v4;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch actions: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)weekDayScheduleCapacity
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[_MKFHAPAccessory supportsMatterWeekDaySchedule](self, "supportsMatterWeekDaySchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[_MKFHAPAccessory matterWeekDayScheduleCapacity](self, "matterWeekDayScheduleCapacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "integerValue") < 1)
    {
      v6 = &unk_24E96BE88;
    }
    else
    {
      -[_MKFHAPAccessory matterWeekDayScheduleCapacity](self, "matterWeekDayScheduleCapacity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = &unk_24E96BEA0;
  }
  return v6;
}

- (id)yearDayScheduleCapacity
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[_MKFHAPAccessory supportsMatterYearDaySchedule](self, "supportsMatterYearDaySchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[_MKFHAPAccessory matterYearDayScheduleCapacity](self, "matterYearDayScheduleCapacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "integerValue") < 1)
    {
      v6 = &unk_24E96BE88;
    }
    else
    {
      -[_MKFHAPAccessory matterYearDayScheduleCapacity](self, "matterYearDayScheduleCapacity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = &unk_24E96BEA0;
  }
  return v6;
}

- (MKFHAPAccessoryDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHAPAccessoryDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)actionCharacteristicWrites
{
  void *v2;
  void *v3;

  -[_MKFHAPAccessory valueForKey:](self, "valueForKey:", CFSTR("actionCharacteristicWrites_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)naturalLightingActions
{
  void *v2;
  void *v3;

  -[_MKFHAPAccessory valueForKey:](self, "valueForKey:", CFSTR("naturalLightingActions_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateNaturalLightingActionsRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("naturalLightingActions_"), CFSTR("MKFNaturalLightingAction"), 0, a3);
}

- (NSArray)pairedUsers
{
  void *v2;
  void *v3;

  -[_MKFHAPAccessory valueForKey:](self, "valueForKey:", CFSTR("pairedUsers_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addPairedUsersObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("pairedUsers_"), a3);
}

- (void)removePairedUsersObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("pairedUsers_"), a3);
}

- (NSArray)services
{
  void *v2;
  void *v3;

  -[_MKFHAPAccessory valueForKey:](self, "valueForKey:", CFSTR("services_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateServicesRelationWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("services_"), CFSTR("MKFService"), a3, a4);
}

- (id)findServicesRelationWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("services_"), CFSTR("MKFService"), a3);
}

- (void)synchronizeServicesRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("services_"), a3, 1);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
