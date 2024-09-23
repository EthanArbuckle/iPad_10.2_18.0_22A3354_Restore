@implementation HMDNotificationRegistryCoreDataAdapter

- (HMDNotificationRegistryCoreDataAdapter)initWithHome:(id)a3
{
  id v4;
  HMDNotificationRegistryCoreDataAdapter *v5;
  HMDNotificationRegistryCoreDataAdapter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDNotificationRegistryCoreDataAdapter;
  v5 = -[HMDNotificationRegistryCoreDataAdapter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_home, v4);

  return v6;
}

- (id)_fetchHomeMemberWithUUID:(id)a3 context:(id)a4
{
  return +[_MKFHome findHomeMemberWithUUID:context:](_MKFHome, "findHomeMemberWithUUID:context:", a3, a4);
}

- (id)_fetchMKFHAPAccessoryWithUUID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v8 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFAccessory entity](_MKFAccessory, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithEntityName:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("modelID"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v21 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v11, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory for uuid %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (id)_fetchMKFActionSetWithUUID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v8 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFActionSet entity](_MKFActionSet, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithEntityName:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("modelID"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v21 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v11, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v13 && objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set for uuid %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (BOOL)_deleteAllRegistrationsWithEntityName:(id)a3 withHomeKeypath:(id)a4 hmcContext:(id)a5
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
  id v18;
  BOOL v19;
  void *v20;
  HMDNotificationRegistryCoreDataAdapter *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmd_assertIsExecuting");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", v8);
  v13 = (void *)MEMORY[0x24BDD1758];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("(%K == %@)"), v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v16);

  v28 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v12, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch and delete all registrations, error: %@", buf, 0x16u);

      v20 = v25;
    }

    objc_autoreleasePoolPop(v20);
    goto LABEL_7;
  }
  if (!objc_msgSend(v17, "count"))
  {
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __107__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsWithEntityName_withHomeKeypath_hmcContext___block_invoke;
  v26[3] = &unk_24E794660;
  v27 = v10;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);

  v19 = 1;
LABEL_8:

  return v19;
}

- (BOOL)_deleteAllCharacteristicRegistrationsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNotificationRegistryCoreDataAdapter _deleteAllRegistrationsWithEntityName:withHomeKeypath:hmcContext:](self, "_deleteAllRegistrationsWithEntityName:withHomeKeypath:hmcContext:", v6, CFSTR("user.home.modelID"), v4);

  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "isRestrictedGuestEnabled");

  if ((_DWORD)v6)
  {
    +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDNotificationRegistryCoreDataAdapter _deleteAllRegistrationsWithEntityName:withHomeKeypath:hmcContext:](self, "_deleteAllRegistrationsWithEntityName:withHomeKeypath:hmcContext:", v10, CFSTR("guest.home.modelID"), v4);

    v7 |= v11;
  }

  return v7;
}

- (BOOL)_deleteAllRegistrationsForCharacteristicIIDs:(id)a3 withAccessoryUUID:(id)a4 hmcContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  HMDNotificationRegistryCoreDataAdapter *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmd_assertIsExecuting");
  v12 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithEntityName:", v14);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K IN %@) AND (%K == %@)"), CFSTR("characteristic.instanceID"), v8, CFSTR("characteristic.service.accessory.modelID"), v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  v28 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v15, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v30 = v23;
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete registrations for characteristic IIDs %@ accessory UUID %@, error: %@", buf, 0x2Au);

      v20 = v25;
    }

    objc_autoreleasePoolPop(v20);
    goto LABEL_7;
  }
  if (!objc_msgSend(v17, "count"))
  {
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __116__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsForCharacteristicIIDs_withAccessoryUUID_hmcContext___block_invoke;
  v26[3] = &unk_24E794688;
  v27 = v10;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);

  v19 = 1;
LABEL_8:

  return v19;
}

- (id)_requestToFetchMKFRegistrationsWithMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "hmd_assertIsExecuting");
  v9 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithEntityName:", v11);

  if (v7)
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("mediaProfileIdentifier"), v8, CFSTR("mediaProperty"), v7);
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("mediaProfileIdentifier"), v8, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPredicate:", v13);
  return v12;
}

- (id)_fetchEnabledMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  HMDNotificationRegistryCoreDataAdapter *v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  v11 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithEntityName:", v13);

  if (v9)
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == YES)"), CFSTR("mediaProfileIdentifier"), v8, CFSTR("mediaProperty"), v9, CFSTR("enabled"));
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == YES)"), CFSTR("mediaProfileIdentifier"), v8, CFSTR("enabled"), v24, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);

  v26 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v14, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v22;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations for media profile uuid: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

  return v16;
}

- (BOOL)_deleteAllMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 hmcContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmd_assertIsExecuting");
  -[HMDNotificationRegistryCoreDataAdapter _requestToFetchMKFRegistrationsWithMediaProfileUUID:withMediaProperty:context:](self, "_requestToFetchMKFRegistrationsWithMediaProfileUUID:withMediaProperty:context:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v12, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v19;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete media profile registrations for media profile uuid: %@ error: %@", buf, 0x20u);

      v16 = v21;
    }

    objc_autoreleasePoolPop(v16);
    goto LABEL_7;
  }
  if (!objc_msgSend(v13, "count"))
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __117__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForMediaProfileUUID_withMediaProperty_hmcContext___block_invoke;
  v22[3] = &unk_24E7946B0;
  v23 = v10;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);

  v15 = 1;
LABEL_8:

  return v15;
}

- (id)_requestToFetchMKFRegistrationsWithActionSetUUID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "hmd_assertIsExecuting");
  v6 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntityName:", v8);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("actionSet.modelID"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  return v9;
}

- (id)_fetchEnabledMKFRegistrationsForActionSetUUID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  v8 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithEntityName:", v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == YES)"), CFSTR("actionSet.modelID"), v6, CFSTR("enabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v21 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v11, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations for action set uuid: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

  return v13;
}

- (BOOL)_deleteAllMKFRegistrationsForActionSetUUID:(id)a3 hmcContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  HMDNotificationRegistryCoreDataAdapter *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmd_assertIsExecuting");
  -[HMDNotificationRegistryCoreDataAdapter _requestToFetchMKFRegistrationsWithActionSetUUID:context:](self, "_requestToFetchMKFRegistrationsWithActionSetUUID:context:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (!v10)
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
      v22 = v16;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete action set registrations for action set uuid: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    goto LABEL_7;
  }
  if (!objc_msgSend(v10, "count"))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __96__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForActionSetUUID_hmcContext___block_invoke;
  v18[3] = &unk_24E7946D8;
  v19 = v7;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

  v12 = 1;
LABEL_8:

  return v12;
}

- (id)_fetchEnabledMKFRegistrationsForHMDCharacteristics:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  HMDNotificationRegistryCoreDataAdapter *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  HMDNotificationRegistryCoreDataAdapter *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *context;
  void *contexta;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BDBB678]);
    +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithEntityName:", v14);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__221039;
    v44 = __Block_byref_object_dispose__221040;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      v16 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "instanceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == YES)"), CFSTR("characteristic.instanceID"), v18, CFSTR("characteristic.service.accessory.modelID"), v11, CFSTR("enabled"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v19);

      v39 = 0;
      objc_msgSend(v7, "executeFetchRequest:error:", v15, &v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v39;
      if (!v20)
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          contexta = v29;
          HMFGetLogIdentifier();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "instanceID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v32;
          v48 = 2112;
          v49 = v34;
          v50 = 2112;
          v51 = v21;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFNotificationRegistrationCharacteristic for characteristic instance id: %@, error: %@", buf, 0x20u);

          v29 = contexta;
        }

        objc_autoreleasePoolPop(v29);
        v22 = 0;
        goto LABEL_14;
      }
      objc_msgSend((id)v41[5], "addObjectsFromArray:", v20);
      v22 = (id)v41[5];
    }
    else
    {
      objc_msgSend(v6, "na_map:", &__block_literal_global_221201);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K IN %@) AND (%K == %@) AND (%K == YES)"), CFSTR("characteristic.instanceID"), v23, CFSTR("characteristic.service.accessory.modelID"), v11, CFSTR("enabled"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v24);

      v38 = 0;
      objc_msgSend(v7, "executeFetchRequest:error:", v15, &v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v38;
      if (v20)
      {
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_179;
        v37[3] = &unk_24E794720;
        v37[4] = &v40;
        objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v37);
        v22 = (id)v41[5];
      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v27;
          v48 = 2112;
          v49 = v6;
          v50 = 2112;
          v51 = v21;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFNotificationRegistrationCharacteristic for characteristics %@, error: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        v22 = 0;
      }

    }
LABEL_14:

    _Block_object_dispose(&v40, 8);
    goto LABEL_15;
  }
  v22 = 0;
LABEL_15:

  return v22;
}

- (id)_fetchMKFCharacteristicsFromHMDCharacteristics:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  HMDNotificationRegistryCoreDataAdapter *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDNotificationRegistryCoreDataAdapter *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDNotificationRegistryCoreDataAdapter *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDBB678]);
    +[_MKFCharacteristic entity](_MKFCharacteristic, "entity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithEntityName:", v14);

    if (objc_msgSend(v6, "count") == 1)
    {
      v16 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "instanceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("instanceID"), v18, CFSTR("service.accessory.modelID"), v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v19);

      v61 = 0;
      objc_msgSend(v7, "executeFetchRequest:error:", v15, &v61);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v61;
      if (v20 && objc_msgSend(v20, "count"))
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:atIndexedSubscript:", v22, 0);

        v23 = v56;
      }
      else
      {
        v28 = v21;
        v29 = (void *)MEMORY[0x227676638]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = v29;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v55 = v9;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "instanceID");
          v51 = v11;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v63 = v32;
          v64 = 2112;
          v65 = (uint64_t)v34;
          v66 = 2112;
          v67 = (uint64_t)v28;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKF Characteristic for characteristic instance id: %@, error: %@", buf, 0x20u);

          v11 = v51;
          v9 = v55;

          v29 = v49;
        }

        objc_autoreleasePoolPop(v29);
        v23 = 0;
        v21 = v28;
      }
    }
    else
    {
      objc_msgSend(v6, "na_map:", &__block_literal_global_185_221189);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K IN %@) AND (%K == %@)"), CFSTR("instanceID"), v24, CFSTR("service.accessory.modelID"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v25);

      v60 = 0;
      objc_msgSend(v7, "executeFetchRequest:error:", v15, &v60);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v60;
      if (v20 && objc_msgSend(v20, "count"))
      {
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_186;
        v57[3] = &unk_24E794790;
        v58 = v20;
        v26 = v56;
        v59 = v26;
        objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v57);
        v27 = objc_msgSend(v26, "count");
        if (v27 == objc_msgSend(v6, "count"))
        {
          v23 = v26;
        }
        else
        {
          v41 = (void *)MEMORY[0x227676638]();
          v53 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v50 = v41;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v26, "count");
            v45 = v9;
            v46 = v44;
            v47 = objc_msgSend(v6, "count");
            *(_DWORD *)buf = 138543874;
            v63 = v43;
            v64 = 2048;
            v65 = v46;
            v9 = v45;
            v66 = 2048;
            v67 = v47;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch all MKFCharacteristics (%lu) for input characteristics (%lu)", buf, 0x20u);

            v41 = v50;
          }

          objc_autoreleasePoolPop(v41);
          v23 = 0;
        }

      }
      else
      {
        v35 = (void *)MEMORY[0x227676638]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v52 = v24;
          v38 = v11;
          v39 = v9;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = v40;
          v64 = 2112;
          v65 = (uint64_t)v54;
          _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKF Characteristics array for characteristics, error: %@", buf, 0x16u);

          v9 = v39;
          v11 = v38;
          v24 = v52;
        }

        objc_autoreleasePoolPop(v35);
        v23 = 0;
      }
      v21 = v54;

    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *context;
  HMDNotificationRegistryCoreDataAdapter *v34;
  HMDNotificationRegistryCoreDataAdapter *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v9 = a8;
  v49 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  if ((objc_msgSend(v16, "hmf_isEmpty") & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v34 = self;
    v22 = objc_alloc(MEMORY[0x24BDBB678]);
    +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithEntityName:", v24);

    v26 = CFSTR("user.modelID");
    if (v9)
      v26 = CFSTR("guest.modelID");
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K IN %@) AND (%K == %@) AND (%K == %@)"), v26, v15, CFSTR("characteristic.instanceID"), v16, CFSTR("characteristic.service.accessory.modelID"), v17, CFSTR("deviceIdsDestination"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPredicate:", v27);

    if (v19)
      objc_msgSend(v25, "setRelationshipKeyPathsForPrefetching:", v19);
    v36 = 0;
    objc_msgSend(v20, "executeFetchRequest:error:", v25, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36;
    if (v21)
    {
      v29 = v21;
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v35 = v34;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v38 = v32;
        v39 = 2112;
        v40 = v15;
        v41 = 2112;
        v42 = v16;
        v43 = 2112;
        v44 = v17;
        v45 = 2112;
        v46 = v18;
        v47 = 2112;
        v48 = v28;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for userOrGuest uuid %@ characteristic IIDs %@ accessory UUID %@ deviceIdsDestination %@, error: %@", buf, 0x3Eu);

      }
      objc_autoreleasePoolPop(context);
    }

  }
  return v21;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *context;
  HMDNotificationRegistryCoreDataAdapter *v34;
  HMDNotificationRegistryCoreDataAdapter *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v9 = a8;
  v49 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  if ((objc_msgSend(v16, "hmf_isEmpty") & 1) != 0)
  {
    v21 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v34 = self;
    v22 = objc_alloc(MEMORY[0x24BDBB678]);
    +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithEntityName:", v24);

    v26 = CFSTR("user.modelID");
    if (v9)
      v26 = CFSTR("guest.modelID");
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K IN %@) AND (%K IN %@) AND (%K == %@)"), v26, v15, CFSTR("characteristic.instanceID"), v16, CFSTR("characteristic.service.accessory.modelID"), v17, CFSTR("deviceIdsDestination"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPredicate:", v27);

    if (v19)
      objc_msgSend(v25, "setRelationshipKeyPathsForPrefetching:", v19);
    v36 = 0;
    objc_msgSend(v20, "executeFetchRequest:error:", v25, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36;
    if (v21)
    {
      v29 = v21;
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v35 = v34;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v38 = v32;
        v39 = 2112;
        v40 = v15;
        v41 = 2112;
        v42 = v16;
        v43 = 2112;
        v44 = v17;
        v45 = 2112;
        v46 = v18;
        v47 = 2112;
        v48 = v28;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for userOrGuest uuid %@ characteristic IIDs %@ accessory UUIDs %@ deviceIdsDestination %@, error: %@", buf, 0x3Eu);

      }
      objc_autoreleasePoolPop(context);
    }

  }
  return v21;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  HMDNotificationRegistryCoreDataAdapter *v25;
  NSObject *v26;
  void *v28;
  void *context;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v10 = a8;
  v40 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  objc_msgSend(v21, "hmd_assertIsExecuting");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", CFSTR("user"));
  -[HMDNotificationRegistryCoreDataAdapter _fetchMKFRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUID:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:context:](self, "_fetchMKFRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUID:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:context:", v16, v17, v18, v19, v22, v10, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[HMDNotificationRegistryCoreDataAdapter homeMemberForRegistrations:userUUID:isRestrictedGuest:context:](self, "homeMemberForRegistrations:userUUID:isRestrictedGuest:context:", v23, v16, v10, v21);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v31 = v28;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v18;
      v38 = 2112;
      v39 = v19;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for user uuid %@ characteristic iids %@ accessory uuid %@ deviceIdsDestination %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(context);
  }

  return v23;
}

- (id)homeMemberForRegistrations:(id)a3 userUUID:(id)a4 isRestrictedGuest:(BOOL)a5 context:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v7)
      objc_msgSend(v13, "guest");
    else
      objc_msgSend(v13, "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDNotificationRegistryCoreDataAdapter _fetchHomeMemberWithUUID:context:](self, "_fetchHomeMemberWithUUID:context:", v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v11;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the home member with UUID: %@", (uint8_t *)&v21, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v15 = 0;
    }
  }

  return v15;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  HMDNotificationRegistryCoreDataAdapter *v26;
  NSObject *v27;
  void *v29;
  void *context;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v10 = a8;
  v41 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  objc_msgSend(v21, "hmd_assertIsExecuting");
  if (v10)
    v22 = CFSTR("guest");
  else
    v22 = CFSTR("user");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v22);
  -[HMDNotificationRegistryCoreDataAdapter _fetchMKFRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:context:](self, "_fetchMKFRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:context:", v16, v17, v18, v19, v23, v10, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HMDNotificationRegistryCoreDataAdapter homeMemberForRegistrations:userUUID:isRestrictedGuest:context:](self, "homeMemberForRegistrations:userUUID:isRestrictedGuest:context:", v24, v16, v10, v21);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
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
      *(_DWORD *)buf = 138544386;
      v32 = v29;
      v33 = 2112;
      v34 = v16;
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v18;
      v39 = 2112;
      v40 = v19;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for user uuid %@ characteristic iids %@ accessory uuids %@ deviceIdsDestination %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(context);
  }

  return v24;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 context:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  HMDNotificationRegistryCoreDataAdapter *v31;
  NSObject *v32;
  void *context;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  v21 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithEntityName:", v23);

  v25 = v18;
  v38 = v19;
  objc_msgSend(v24, "setRelationshipKeyPathsForPrefetching:", v19);
  v26 = CFSTR("user.modelID");
  if (a9)
    v26 = CFSTR("guest.modelID");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K IN %@) AND (%K == %@) AND (%K == %@)"), v26, v37, CFSTR("mediaProfileIdentifier"), v15, CFSTR("mediaProperty"), v16, CFSTR("deviceIdsDestination"), v17, CFSTR("accessory.modelID"), v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPredicate:", v27);

  v39 = 0;
  objc_msgSend(v20, "executeFetchRequest:error:", v24, &v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v39;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v41 = v36;
      v42 = 2112;
      v43 = v37;
      v44 = 2112;
      v45 = v15;
      v46 = 2112;
      v47 = v16;
      v48 = 2112;
      v49 = v17;
      v50 = 2112;
      v51 = v18;
      v52 = 2112;
      v53 = v38;
      v54 = 2112;
      v55 = v29;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media property registrations for userUUID %@ mediaProfileUUID %@ mediaProperties %@ deviceIdsDestination %@ accessoryUUID %@ prefetchPaths %@, error: %@", buf, 0x52u);

    }
    objc_autoreleasePoolPop(context);
    v25 = v18;
  }

  return v28;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 outHomeMember:(id *)a10 context:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;

  v16 = a3;
  v17 = a11;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  objc_msgSend(v17, "hmd_assertIsExecuting");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "addObject:", CFSTR("user"));
  LOBYTE(v27) = a9;
  -[HMDNotificationRegistryCoreDataAdapter _fetchMKFRegistrationsWithUserUUID:withMediaProfileUUID:withMediaPropertyIn:withDeviceIdsDestination:withAccessoryUUID:withPrefetchPaths:isRestrictedGuest:context:](self, "_fetchMKFRegistrationsWithUserUUID:withMediaProfileUUID:withMediaPropertyIn:withDeviceIdsDestination:withAccessoryUUID:withPrefetchPaths:isRestrictedGuest:context:", v16, v22, v21, v20, v19, v23, v27, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[HMDNotificationRegistryCoreDataAdapter homeMemberForRegistrations:userUUID:isRestrictedGuest:context:](self, "homeMemberForRegistrations:userUUID:isRestrictedGuest:context:", v24, v16, a9, v17);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
  }

  return v24;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 context:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  HMDNotificationRegistryCoreDataAdapter *v28;
  NSObject *v29;
  void *v31;
  void *context;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v9 = a7;
  v46 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_msgSend(v18, "hmd_assertIsExecuting");
  v19 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithEntityName:", v21);

  objc_msgSend(v22, "setRelationshipKeyPathsForPrefetching:", v17);
  v23 = CFSTR("user.modelID");
  if (v9)
    v23 = CFSTR("guest.modelID");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@)"), v23, v14, CFSTR("actionSet.modelID"), v15, CFSTR("deviceIdsDestination"), v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPredicate:", v24);

  v33 = 0;
  objc_msgSend(v18, "executeFetchRequest:error:", v22, &v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v33;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    context = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v35 = v31;
      v36 = 2112;
      v37 = v14;
      v38 = 2112;
      v39 = v15;
      v40 = 2112;
      v41 = v16;
      v42 = 2112;
      v43 = v17;
      v44 = 2112;
      v45 = v26;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations for userUUID %@ actionSetUUID %@ deviceIdsDestination %@ prefetchPaths %@, error: %@", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(context);
  }

  return v25;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 outHomeMember:(id *)a8 context:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v10 = a7;
  v15 = a3;
  v16 = a9;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  objc_msgSend(v16, "hmd_assertIsExecuting");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addObject:", CFSTR("user"));
  -[HMDNotificationRegistryCoreDataAdapter _fetchMKFRegistrationsWithUserUUID:actionSetUUID:deviceIdsDestination:prefetchPaths:isRestrictedGuest:context:](self, "_fetchMKFRegistrationsWithUserUUID:actionSetUUID:deviceIdsDestination:prefetchPaths:isRestrictedGuest:context:", v15, v19, v18, v20, v10, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HMDNotificationRegistryCoreDataAdapter homeMemberForRegistrations:userUUID:isRestrictedGuest:context:](self, "homeMemberForRegistrations:userUUID:isRestrictedGuest:context:", v21, v15, v10, v16);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
  }

  return v21;
}

- (id)_fetchRequestForCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntityName:", v8);

  v10 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("user.home.modelID"), v11, CFSTR("deviceIdsDestination"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v12);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isRestrictedGuestEnabled");

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("guest.home.modelID"), v16, CFSTR("deviceIdsDestination"), v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD14C0];
    v22[0] = v12;
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v20);

  }
  return v9;
}

- (id)_fetchRequestForMediaProfileRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntityName:", v8);

  v10 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("user.home.modelID"), v11, CFSTR("deviceIdsDestination"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v12);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isRestrictedGuestEnabled");

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("guest.home.modelID"), v16, CFSTR("deviceIdsDestination"), v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD14C0];
    v22[0] = v12;
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v20);

  }
  return v9;
}

- (id)_fetchRequestForActionSetRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithEntityName:", v8);

  v10 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("user.home.modelID"), v11, CFSTR("deviceIdsDestination"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v12);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isRestrictedGuestEnabled");

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("(%K == %@) AND NOT (%K IN %@)"), CFSTR("guest.home.modelID"), v16, CFSTR("deviceIdsDestination"), v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD14C0];
    v22[0] = v12;
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v20);

  }
  return v9;
}

- (id)_fetchRequestForAllCharacteristicRegistrations
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationCharacteristic entity](_MKFNotificationRegistrationCharacteristic, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntityName:", v5);

  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v2, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("user.home.modelID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v9);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRestrictedGuestEnabled");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v2, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("guest.home.modelID"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD14C0];
    v19[0] = v9;
    v19[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "orPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v17);

  }
  return v6;
}

- (id)_fetchRequestForAllMediaProfileRegistrations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationMediaProperty entity](_MKFNotificationRegistrationMediaProperty, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntityName:", v5);

  v7 = (void *)MEMORY[0x24BDD1758];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("accessory.home.modelID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v10);

  return v6;
}

- (id)_fetchRequestForAllActionSetRegistrations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDBB678]);
  +[_MKFNotificationRegistrationActionSet entity](_MKFNotificationRegistrationActionSet, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntityName:", v5);

  v7 = (void *)MEMORY[0x24BDD1758];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("actionSet.home.modelID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v10);

  return v6;
}

- (BOOL)enableNotificationsForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;
  HMDNotificationRegistryCoreDataAdapter *v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      v27 = 1;
      objc_msgSend(v11, "backingStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke;
      v18[3] = &unk_24E794828;
      v15 = v14;
      v19 = v15;
      v20 = v8;
      v21 = self;
      v22 = v9;
      v23 = v10;
      v24 = v26;
      v25 = &v28;
      objc_msgSend(v15, "unsafeSynchronousBlock:", v18);
      v16 = *((_BYTE *)v29 + 24) != 0;

      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)disableNotificationForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  HMDNotificationRegistryCoreDataAdapter *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke;
    v19[3] = &unk_24E794C60;
    v15 = v14;
    v20 = v15;
    v21 = v8;
    v22 = self;
    v23 = v9;
    v24 = v10;
    v26 = &v27;
    v16 = v11;
    v25 = v16;
    objc_msgSend(v15, "unsafeSynchronousBlock:", v19);
    if (*((_BYTE *)v28 + 24))
      v17 = (void *)objc_msgSend(v16, "copy");
    else
      v17 = (void *)MEMORY[0x24BDBD1A8];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v17;
}

- (id)processCharacteristicsRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  HMDNotificationRegistryCoreDataAdapter *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke;
    v26[3] = &unk_24E7948C0;
    v8 = v6;
    v27 = v8;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);
    -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v7;
    v18 = 3221225472;
    v19 = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_2;
    v20 = &unk_24E79AD20;
    v21 = v8;
    v22 = self;
    v23 = v11;
    v24 = v5;
    v25 = v4;
    v12 = v5;
    v13 = v11;
    v14 = v8;
    objc_msgSend(v13, "unsafeSynchronousBlock:", &v17);
    v15 = (void *)objc_msgSend(v12, "copy", v17, v18, v19, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_processGroupedCharacteristicsRequests:(id)a3 user:(id)a4 destination:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  HMDNotificationRegistryCoreDataAdapter *v41;
  NSObject *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  HMDNotificationRegistryCoreDataAdapter *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  _QWORD v71[5];

  v71[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmd_assertIsExecuting");

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke;
  v65[3] = &unk_24E794978;
  v18 = v15;
  v66 = v18;
  v19 = v16;
  v67 = v19;
  v20 = v17;
  v21 = v11;
  v47 = v20;
  v48 = v10;
  v68 = v20;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v65);
  v46 = v13;
  objc_msgSend(v13, "managedObjectContext");
  v22 = objc_claimAutoreleasedReturnValue();
  v71[0] = CFSTR("characteristic.service.accessory.modelID");
  v71[1] = CFSTR("characteristic.instanceID");
  v71[2] = CFSTR("lastModified");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 3);
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v49 = (void *)v23;
  v50 = (void *)v22;
  v52 = v12;
  -[HMDNotificationRegistryCoreDataAdapter _fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:](self, "_fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v24, v25, v26, v12, v23, objc_msgSend(v21, "isRestrictedGuest"), &v64, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v64;

  v51 = v18;
  if (v27 && v28)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x24BDAC760];
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2_237;
    v61[3] = &unk_24E7949E0;
    v31 = v47;
    v62 = v47;
    v63 = v29;
    v45 = v21;
    v32 = v29;
    objc_msgSend(v27, "na_each:", v61);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v59[0] = v30;
    v59[1] = 3221225472;
    v59[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_3;
    v59[3] = &unk_24E794688;
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v60 = v33;
    objc_msgSend(v32, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v30;
    v53[1] = 3221225472;
    v53[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_4;
    v53[3] = &unk_24E794A08;
    v54 = v33;
    v55 = self;
    v56 = v28;
    v35 = v46;
    v57 = v46;
    v58 = v34;
    v36 = v34;
    v37 = v33;
    v38 = v48;
    objc_msgSend(v48, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v53);
    v39 = (void *)objc_msgSend(v36, "copy");

    v21 = v45;
  }
  else
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v70 = v43;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    v38 = v48;
    objc_msgSend(v48, "na_map:", &__block_literal_global_236_221116);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v46;
    v31 = v47;
  }

  return v39;
}

- (id)_processEnableCharacteristicsRequest:(id)a3 homeMember:(id)a4 registrationsForAccessory:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v21;
  int v22;
  int v23;
  void *v24;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v25;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  HMDNotificationRegistryCoreDataAdapter *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t *v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  v10 = a3;
  v28 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmd_assertIsExecuting");

  objc_msgSend(v10, "characteristicThresholds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 1;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__221039;
  v41[4] = __Block_byref_object_dispose__221040;
  v42 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke;
  v29[3] = &unk_24E794A98;
  v27 = v11;
  v30 = v27;
  v31 = self;
  v37 = &v51;
  v16 = v15;
  v32 = v16;
  v38 = &v47;
  v39 = v41;
  v17 = v14;
  v33 = v17;
  v18 = v12;
  v34 = v18;
  v40 = &v43;
  v19 = v10;
  v35 = v19;
  v20 = v28;
  v36 = v20;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
  v21 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  v22 = *((unsigned __int8 *)v44 + 24);
  v23 = *((unsigned __int8 *)v52 + 24);
  LODWORD(v11) = *((unsigned __int8 *)v48 + 24);
  v24 = (void *)objc_msgSend(v16, "copy");
  v25 = -[HMDNotificationRegistryCoreDataCharacteristicsRequestResult initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:](v21, "initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:", v19, v22 != 0, v23 != 0, (_DWORD)v11 != 0, v24);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v25;
}

- (id)_processDisableCharacteristicsRequest:(id)a3 registrationsForAccessory:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v16;
  int v17;
  void *v18;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v19;
  _QWORD v21[4];
  id v22;
  HMDNotificationRegistryCoreDataAdapter *v23;
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[3];
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmd_assertIsExecuting");

  objc_msgSend(v8, "characteristicThresholds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke;
  v21[3] = &unk_24E794898;
  v14 = v12;
  v22 = v14;
  v23 = self;
  v25 = v27;
  v26 = &v29;
  v15 = v13;
  v24 = v15;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
  v16 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  v17 = *((unsigned __int8 *)v30 + 24);
  v18 = (void *)objc_msgSend(v15, "copy");
  v19 = -[HMDNotificationRegistryCoreDataCharacteristicsRequestResult initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:](v16, "initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:", v8, 1, v17 != 0, 0, v18);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  HMDNotificationRegistryCoreDataAdapter *v12;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke;
    v9[3] = &unk_24E79BBD0;
    v10 = v6;
    v11 = v8;
    v12 = self;
    v7 = v6;
    objc_msgSend(v7, "unsafeSynchronousBlock:", v9);

  }
}

- (id)destinationsToNotifyForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HMDNotificationRegistryCoreDataAdapter *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__221039;
  v23 = __Block_byref_object_dispose__221040;
  v24 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke;
  v13[3] = &unk_24E79B670;
  v8 = v7;
  v14 = v8;
  v15 = self;
  v9 = v4;
  v16 = v9;
  v18 = &v19;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v13);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (id)_filterCharacteristicRegistrations:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__HMDNotificationRegistryCoreDataAdapter__filterCharacteristicRegistrations_home___block_invoke;
  v9[3] = &unk_24E794B30;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeAllCharacteristicRegistrations
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDNotificationRegistryCoreDataAdapter *v9;

  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HMDNotificationRegistryCoreDataAdapter_removeAllCharacteristicRegistrations__block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v5 = v4;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v7);

}

- (void)disableAllCharacteristicRegistrations
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v7);

}

- (id)removeCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke;
  v15[3] = &unk_24E79B670;
  v9 = v8;
  v16 = v9;
  v17 = self;
  v10 = v4;
  v18 = v10;
  v20 = &v21;
  v11 = v5;
  v19 = v11;
  objc_msgSend(v9, "unsafeSynchronousBlock:", v15);
  if (*((_BYTE *)v22 + 24))
  {
    v12 = objc_msgSend(v11, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (NSSet)enabledCharacteristicRegistrations
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x227676638](self, a2);
  -[HMDNotificationRegistryCoreDataAdapter characteristicRegistrations](self, "characteristicRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_254_221088);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSSet *)v5;
}

- (NSSet)characteristicRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke;
  v11[3] = &unk_24E79BBD0;
  v11[4] = self;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return (NSSet *)v9;
}

- (BOOL)enableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  HMDNotificationRegistryCoreDataAdapter *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backingStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke;
  v23[3] = &unk_24E794C60;
  v17 = v16;
  v24 = v17;
  v18 = v10;
  v25 = v18;
  v26 = self;
  v19 = v12;
  v27 = v19;
  v20 = v11;
  v28 = v20;
  v21 = v13;
  v29 = v21;
  v30 = &v31;
  objc_msgSend(v17, "unsafeSynchronousBlock:", v23);
  LOBYTE(v12) = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return (char)v12;
}

- (BOOL)disableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  HMDNotificationRegistryCoreDataAdapter *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backingStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke;
  v23[3] = &unk_24E794C60;
  v17 = v16;
  v24 = v17;
  v18 = v10;
  v25 = v18;
  v26 = self;
  v19 = v12;
  v27 = v19;
  v20 = v11;
  v28 = v20;
  v21 = v13;
  v29 = v21;
  v30 = &v31;
  objc_msgSend(v17, "unsafeSynchronousBlock:", v23);
  LOBYTE(v12) = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return (char)v12;
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HMDNotificationRegistryCoreDataAdapter *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForMediaProfile___block_invoke;
  v11[3] = &unk_24E79B5F8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  LOBYTE(v4) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

- (id)destinationsToNotifyForMediaPropertyResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  HMDNotificationRegistryCoreDataAdapter *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__221039;
  v24 = __Block_byref_object_dispose__221040;
  v25 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke;
  v15 = &unk_24E79B5F8;
  v8 = v7;
  v16 = v8;
  v9 = v4;
  v17 = v9;
  v18 = self;
  v19 = &v20;
  objc_msgSend(v8, "unsafeSynchronousBlock:", &v12);
  v10 = (void *)objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)mediaPropertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__221039;
  v24 = __Block_byref_object_dispose__221040;
  v25 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke;
  v15 = &unk_24E79B5F8;
  v8 = v7;
  v16 = v8;
  v17 = self;
  v9 = v4;
  v18 = v9;
  v19 = &v20;
  objc_msgSend(v8, "unsafeSynchronousBlock:", &v12);
  v10 = (void *)objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)removeAllMediaProfileRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  HMDNotificationRegistryCoreDataAdapter *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__221039;
  v27 = __Block_byref_object_dispose__221040;
  v28 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke;
  v14 = &unk_24E795A98;
  v6 = v5;
  v15 = v6;
  v16 = self;
  v17 = &v23;
  v18 = &v19;
  objc_msgSend(v6, "unsafeSynchronousBlock:", &v11);
  v7 = (void *)MEMORY[0x24BDBCF20];
  if (*((_BYTE *)v20 + 24))
  {
    v8 = (void *)objc_msgSend((id)v24[5], "copy", v11, v12, v13, v14);
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)disableAllMediaProfileRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  HMDNotificationRegistryCoreDataAdapter *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke;
  v16 = &unk_24E79B5F8;
  v7 = v6;
  v17 = v7;
  v18 = self;
  v8 = v3;
  v19 = v8;
  v20 = &v21;
  objc_msgSend(v7, "unsafeSynchronousBlock:", &v13);
  v9 = (void *)MEMORY[0x24BDBCF20];
  if (*((_BYTE *)v22 + 24))
  {
    v10 = (void *)objc_msgSend(v8, "copy", v13, v14, v15, v16, v17, v18);
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set", v13, v14, v15, v16, v17, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)removeMediaRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HMDNotificationRegistryCoreDataAdapter *v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__221039;
  v28 = __Block_byref_object_dispose__221040;
  v29 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke;
  v14[3] = &unk_24E7989B8;
  v8 = v7;
  v15 = v8;
  v16 = self;
  v9 = v4;
  v17 = v9;
  v18 = &v24;
  v19 = &v20;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v14);
  v10 = (void *)MEMORY[0x24BDBCF20];
  if (*((_BYTE *)v21 + 24))
  {
    v11 = (void *)objc_msgSend((id)v25[5], "copy");
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (NSSet)mediaRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke;
  v11[3] = &unk_24E79BBD0;
  v11[4] = self;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return (NSSet *)v9;
}

- (BOOL)enableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  HMDNotificationRegistryCoreDataAdapter *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __103__HMDNotificationRegistryCoreDataAdapter_enableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke;
  v19[3] = &unk_24E79B620;
  v14 = v13;
  v20 = v14;
  v21 = self;
  v15 = v9;
  v22 = v15;
  v16 = v8;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v14, "unsafeSynchronousBlock:", v19);
  LOBYTE(v9) = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v9;
}

- (BOOL)disableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  HMDNotificationRegistryCoreDataAdapter *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke;
  v19[3] = &unk_24E79B620;
  v14 = v13;
  v20 = v14;
  v21 = self;
  v15 = v9;
  v22 = v15;
  v16 = v8;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v14, "unsafeSynchronousBlock:", v19);
  LOBYTE(v9) = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v9;
}

- (BOOL)removeRegistrationsForActionSetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HMDNotificationRegistryCoreDataAdapter *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForActionSetUUID___block_invoke;
  v11[3] = &unk_24E79B5F8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  LOBYTE(v4) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

- (id)destinationsToNotifyForActionSetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  HMDNotificationRegistryCoreDataAdapter *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__221039;
  v24 = __Block_byref_object_dispose__221040;
  v25 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke;
  v15 = &unk_24E79B5F8;
  v8 = v7;
  v16 = v8;
  v17 = self;
  v9 = v4;
  v18 = v9;
  v19 = &v20;
  objc_msgSend(v8, "unsafeSynchronousBlock:", &v12);
  v10 = (void *)objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)removeAllActionSetRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  HMDNotificationRegistryCoreDataAdapter *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__221039;
  v21 = __Block_byref_object_dispose__221040;
  v22 = 0;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke;
  v12 = &unk_24E795A98;
  v6 = v5;
  v13 = v6;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  objc_msgSend(v6, "unsafeSynchronousBlock:", &v9);
  if (*((_BYTE *)v24 + 24))
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18[5], v9, v10, v11, v12);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

- (id)removeActionSetRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  HMDNotificationRegistryCoreDataAdapter *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__221039;
  v26 = __Block_byref_object_dispose__221040;
  v27 = (id)MEMORY[0x24BDBD1A8];
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke;
  v12[3] = &unk_24E7989B8;
  v8 = v7;
  v13 = v8;
  v14 = self;
  v9 = v4;
  v15 = v9;
  v16 = &v22;
  v17 = &v18;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v12);
  if (*((_BYTE *)v19 + 24))
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v23[5]);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)disableAllActionSetRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  HMDNotificationRegistryCoreDataAdapter *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__221039;
  v21 = __Block_byref_object_dispose__221040;
  v22 = 0;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke;
  v12 = &unk_24E795A98;
  v6 = v5;
  v13 = v6;
  v14 = self;
  v15 = &v17;
  v16 = &v23;
  objc_msgSend(v6, "unsafeSynchronousBlock:", &v9);
  if (*((_BYTE *)v24 + 24))
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18[5], v9, v10, v11, v12);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

- (BOOL)hasEnabledRegistrationForActionSetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HMDNotificationRegistryCoreDataAdapter *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HMDNotificationRegistryCoreDataAdapter_hasEnabledRegistrationForActionSetUUID___block_invoke;
  v11[3] = &unk_24E79B5F8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  LOBYTE(v4) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

- (NSSet)actionSetRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke;
  v11[3] = &unk_24E79BBD0;
  v11[4] = self;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v8, "unsafeSynchronousBlock:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return (NSSet *)v9;
}

- (BOOL)_enableRegistration:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "enabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "setEnabled:", MEMORY[0x24BDBD1C8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastModified:", v6);

  }
  return v5 ^ 1;
}

- (BOOL)_disableRegistration:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "enabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(v3, "setEnabled:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLastModified:", v6);

  }
  return v5;
}

- (BOOL)_updateThresholdRegistration:(id)a3 threshold:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "notificationThreshold");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects();

  if ((v8 & 1) == 0)
    objc_msgSend(v5, "setNotificationThreshold:", v6);

  return v8 ^ 1;
}

- (BOOL)_insertNotificationRegistrationForCharacteristic:(id)a3 notificationThreshold:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 mkfCharacteristic:(id)a7 context:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a8, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmd_assertIsExecuting");

  objc_msgSend(v14, "castIfMemberIsUser");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "castIfUser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "castIfMemberIsGuest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "castIfGuest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v20)
  {
    objc_msgSend(v20, "setCharacteristic:", v15);
    objc_msgSend(v20, "setNotificationThreshold:", v12);
    objc_msgSend(v20, "setDeviceIdsDestination:", v13);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLastModified:", v23);

    objc_msgSend(v20, "setEnabled:", MEMORY[0x24BDBD1C8]);
  }

  return v20 != 0;
}

- (BOOL)_insertNotificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 accessory:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDNotificationRegistryCoreDataAdapter *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  HMDNotificationRegistryCoreDataAdapter *v34;
  NSObject *v35;
  void *v36;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v38 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmd_assertIsExecuting");

  objc_msgSend(v16, "castIfMemberIsUser");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "castIfUser");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "castIfMemberIsGuest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "castIfGuest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    self = v25;
  }

  if (v23)
  {
    objc_msgSend(v23, "setMediaProperty:", v14);
    objc_msgSend(v15, "uniqueIdentifier");
    v27 = v15;
    v28 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMediaProfileIdentifier:", v29);

    objc_msgSend(v23, "setAccessory:", v17);
    v30 = v38;
    objc_msgSend(v23, "setDeviceIdsDestination:", v38);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLastModified:", v31);

    v32 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v27 = v15;
  v28 = v14;
  v33 = (void *)MEMORY[0x227676638]();
  v34 = self;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v40 = v36;
    v41 = 2112;
    v42 = v28;
    v43 = 2112;
    v44 = v27;
    v45 = 2112;
    v46 = v38;
    v47 = 2112;
    v48 = v16;
    v49 = 2112;
    v50 = v17;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create notification registration for media property %@ media profile %@ deviceIdsDestination %@ homeMember %@ mkfAccessory %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v33);
  v32 = 0;
  v23 = 0;
  v30 = v38;
LABEL_10:

  return v32;
}

- (BOOL)_insertNotificationRegistrationForMKFActionSet:(id)a3 deviceIdsDestination:(id)a4 homeMember:(id)a5 context:(id)a6
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
  void *v20;
  BOOL v21;
  void *v22;
  HMDNotificationRegistryCoreDataAdapter *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hmd_assertIsExecuting");

  objc_msgSend(v12, "castIfMemberIsUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "castIfMemberIsGuest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "castIfGuest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v17)
  {
    objc_msgSend(v17, "setActionSet:", v10);
    objc_msgSend(v17, "setDeviceIdsDestination:", v11);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLastModified:", v20);

    v21 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v25;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create notification registration for deviceIdsDestination %@ homeMember %@ mkfActionSet %@", (uint8_t *)&v27, 0x2Au);

  }
  objc_autoreleasePoolPop(v22);
  v21 = 0;
  v17 = 0;
LABEL_10:

  return v21;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNotificationRegistryCoreDataAdapter home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke;
  v14 = &unk_24E79C268;
  v15 = v4;
  v16 = v3;
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "unsafeSynchronousBlock:", &v11);
  objc_msgSend(v7, "shortDescription", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_2;
  v5[3] = &unk_24E794F18;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v5);

}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "notificationRegistrations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_3;
  v4[3] = &unk_24E794EF0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(v25, "castIfNotificationRegistrationCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "enabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(v4, "characteristic");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "modelID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "instanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v13);
      }
      objc_msgSend(v4, "deviceIdsDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastModified");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
LABEL_11:
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ - %@"), v15, v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v24);

      goto LABEL_12;
    }
  }
  objc_msgSend(v25, "castIfNotificationRegistrationMediaProperty");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v18)
  {
    objc_msgSend(v18, "enabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "mediaProfileIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaProperty");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@:%@"), v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v13);
      }
      objc_msgSend(v7, "deviceIdsDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastModified");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_11;
    }
  }
LABEL_12:

}

void __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_fetchRequestForAllActionSetRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all action set notification registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke_284;
  v13 = &unk_24E794EC8;
  v14 = a1[6];
  objc_msgSend(v4, "na_each:", &v10);
  objc_msgSend(a1[5], "reset", v10, v11, v12, v13);

}

void __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke_284(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  HMDActionSetNotificationRegistration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDActionSetNotificationRegistration *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

    if (v6)
    {
      objc_msgSend(v16, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v8 = *(void **)(a1 + 32);
  v9 = [HMDActionSetNotificationRegistration alloc];
  objc_msgSend(v16, "actionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceIdsDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastModified");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDActionSetNotificationRegistration initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:](v9, "initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:", v11, v12, v4, v13, objc_msgSend(v14, "BOOLValue"));
  objc_msgSend(v8, "addObject:", v15);

}

void __81__HMDNotificationRegistryCoreDataAdapter_hasEnabledRegistrationForActionSetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchEnabledMKFRegistrationsForActionSetUUID:context:", *(_QWORD *)(a1 + 48), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "count") != 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for action set uuid %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

void __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[6];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForAllActionSetRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_283);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *(_QWORD *)v27 = 0;
    *(_QWORD *)&v27[8] = v27;
    *(_QWORD *)&v27[16] = 0x2020000000;
    v28 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_2;
    v21[3] = &unk_24E794DC0;
    v21[4] = *(_QWORD *)(a1 + 40);
    v21[5] = v27;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
    if (*(_BYTE *)(*(_QWORD *)&v27[8] + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v9 = *(void **)(a1 + 32);
      v20 = v5;
      v10 = objc_msgSend(v9, "save:", &v20);
      v11 = v20;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v15;
          v25 = 2112;
          v26 = v11;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
      }
    }
    else
    {
      v11 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");
    _Block_object_dispose(v27, 8);
    v5 = v11;
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v5;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", v27, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

uint64_t __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

id __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_282(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForActionSetRegistrationsWithoutAllowedDestinations:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_281);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_2;
    v23[3] = &unk_24E794DC0;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 64);
    v24 = v9;
    v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v11 = *(void **)(a1 + 32);
      v22 = v5;
      v12 = objc_msgSend(v11, "save:", &v22);
      v13 = v22;

      if ((v12 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all action set registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    else
    {
      v13 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    v5 = v13;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

uint64_t __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

HMDActionSetNotificationRegistration *__97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_279(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMDActionSetNotificationRegistration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDActionSetNotificationRegistration *v14;

  v2 = a2;
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

    if (v6)
    {
      objc_msgSend(v2, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v8 = [HMDActionSetNotificationRegistration alloc];
  objc_msgSend(v2, "actionSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDActionSetNotificationRegistration initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:](v8, "initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:", v10, v11, v4, v12, objc_msgSend(v13, "BOOLValue"));

  return v14;
}

void __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForAllActionSetRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_278);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_2;
    v23[3] = &unk_24E794DC0;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v24 = v9;
    v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v11 = *(void **)(a1 + 32);
      v22 = v5;
      v12 = objc_msgSend(v11, "save:", &v22);
      v13 = v22;

      if ((v12 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all action set registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    else
    {
      v13 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    v5 = v13;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

uint64_t __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

id __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_276(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchEnabledMKFRegistrationsForActionSetUUID:context:", *(_QWORD *)(a1 + 48), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_275_221053);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for action set: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

uint64_t __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke_273(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceIdsDestination");
}

void __78__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForActionSetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_deleteAllMKFRegistrationsForActionSetUUID:hmcContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32)))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (objc_msgSend(v2, "hasChanges"))
  {
    v3 = *(void **)(a1 + 32);
    v10 = 0;
    v4 = objc_msgSend(v3, "save:", &v10);
    v5 = v10;
    if ((v4 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable action set notification registration changes requested, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

void __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[6];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = objc_msgSend(*(id *)(a1 + 48), "isRestrictedGuest");
  v25 = 0;
  objc_msgSend(v3, "_fetchMKFUserAndRegistrationsWithUserUUID:actionSetUUID:deviceIdsDestination:prefetchPaths:isRestrictedGuest:outHomeMember:context:", v4, v6, v5, 0, v7, &v25, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke_272;
    v24[3] = &unk_24E794DC0;
    v15 = *(_QWORD *)(a1 + 72);
    v24[4] = *(_QWORD *)(a1 + 40);
    v24[5] = v15;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
    if (objc_msgSend(v2, "hasChanges"))
    {
      v16 = *(void **)(a1 + 32);
      v23 = 0;
      v17 = objc_msgSend(v16, "save:", &v23);
      v18 = v23;
      if ((v17 & 1) == 0)
      {
        v19 = (void *)MEMORY[0x227676638]();
        v20 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v22;
          v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable action set notification registration changes requested, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

uint64_t __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke_272(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __103__HMDNotificationRegistryCoreDataAdapter_enableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = objc_msgSend(*(id *)(a1 + 48), "isRestrictedGuest");
  v39 = 0;
  objc_msgSend(v3, "_fetchMKFUserAndRegistrationsWithUserUUID:actionSetUUID:deviceIdsDestination:prefetchPaths:isRestrictedGuest:outHomeMember:context:", v4, v6, v5, 0, v7, &v39, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    goto LABEL_26;
  }
  v15 = objc_msgSend(v8, "count");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        if (objc_msgSend(*(id *)(a1 + 40), "_enableRegistration:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          goto LABEL_19;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_19:

  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "_fetchMKFActionSetWithUUID:context:", *(_QWORD *)(a1 + 56), v2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_insertNotificationRegistrationForMKFActionSet:deviceIdsDestination:homeMember:context:", v28, *(_QWORD *)(a1 + 64), v9, *(_QWORD *)(a1 + 32)))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

        goto LABEL_20;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x227676638]();
      v30 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v41 = v32;
        v42 = 2112;
        v43 = v33;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch MKFActionSet for UUID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    goto LABEL_27;
  }
LABEL_20:
  if (objc_msgSend(v2, "hasChanges"))
  {
    v21 = *(void **)(a1 + 32);
    v34 = 0;
    v22 = objc_msgSend(v21, "save:", &v34);
    v23 = v34;
    if ((v22 & 1) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v27;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable action set registration changes requested, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    }

  }
LABEL_26:
  objc_msgSend(*(id *)(a1 + 32), "reset");
LABEL_27:

}

void __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_fetchRequestForAllMediaProfileRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all media property notification registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke_270;
  v13 = &unk_24E794D98;
  v14 = a1[6];
  objc_msgSend(v4, "na_each:", &v10);
  objc_msgSend(a1[5], "reset", v10, v11, v12, v13);

}

void __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke_270(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMDMediaPropertyNotificationRegistration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaPropertyNotificationRegistration *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

    if (v6)
    {
      objc_msgSend(v15, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v8 = [HMDMediaPropertyNotificationRegistration alloc];
  objc_msgSend(v15, "mediaProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mediaProperty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceIdsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaPropertyNotificationRegistration initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:](v8, "initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:", v9, v10, v11, v4, v12, objc_msgSend(v13, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

void __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForMediaProfileRegistrationsWithoutAllowedDestinations:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_269_221064);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_2;
    v23[3] = &unk_24E794C88;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 64);
    v24 = v9;
    v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v11 = *(void **)(a1 + 32);
      v22 = v5;
      v12 = objc_msgSend(v11, "save:", &v22);
      v13 = v22;

      if ((v12 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    else
    {
      v13 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    v5 = v13;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

uint64_t __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

HMDMediaPropertyNotificationRegistration *__93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_267(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  HMDMediaPropertyNotificationRegistration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMediaPropertyNotificationRegistration *v14;

  v2 = a2;
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

    if (v6)
    {
      objc_msgSend(v2, "guest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v8 = [HMDMediaPropertyNotificationRegistration alloc];
  objc_msgSend(v2, "mediaProfileIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProperty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIdsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMediaPropertyNotificationRegistration initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:](v8, "initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:", v9, v10, v11, v4, v12, objc_msgSend(v13, "BOOLValue"));

  return v14;
}

void __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _BYTE *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForAllMediaProfileRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;
  if (v4)
  {
    *(_QWORD *)v27 = 0;
    *(_QWORD *)&v27[8] = v27;
    *(_QWORD *)&v27[16] = 0x2020000000;
    v28 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke_266;
    v19[3] = &unk_24E794D30;
    v6 = *(void **)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 40);
    v21 = v27;
    v20 = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
    if (*(_BYTE *)(*(_QWORD *)&v27[8] + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v7 = *(void **)(a1 + 32);
      v18 = v5;
      v8 = objc_msgSend(v7, "save:", &v18);
      v9 = v18;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v13;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
      }
    }
    else
    {
      v9 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    _Block_object_dispose(v27, 8);
    v5 = v9;
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v17;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v5;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", v27, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

void __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke_266(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v5, "mediaProfileIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForAllMediaProfileRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v26;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_265);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_2;
    v23[3] = &unk_24E794C88;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v24 = v9;
    v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && objc_msgSend(v2, "hasChanges"))
    {
      v11 = *(void **)(a1 + 32);
      v22 = v5;
      v12 = objc_msgSend(v11, "save:", &v22);
      v13 = v22;

      if ((v12 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v17;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    else
    {
      v13 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    v5 = v13;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_264(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfileIdentifier");
}

void __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchEnabledMKFRegistrationsForMediaProfileUUID:withMediaProperty:context:", *(_QWORD *)(a1 + 48), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_263_221075);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for media profile uuid %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

uint64_t __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke_262(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProperty");
}

void __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_fetchEnabledMKFRegistrationsForMediaProfileUUID:withMediaProperty:context:", v7, v4, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "na_map:", &__block_literal_global_261_221077);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for media property response: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

uint64_t __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke_259(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceIdsDestination");
}

void __77__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForMediaProfile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "_deleteAllMKFRegistrationsForMediaProfileUUID:withMediaProperty:hmcContext:", v4, 0, *(_QWORD *)(a1 + 32));

  if ((_DWORD)v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (objc_msgSend(v2, "hasChanges"))
  {
    v5 = *(void **)(a1 + 32);
    v12 = 0;
    v6 = objc_msgSend(v5, "save:", &v12);
    v7 = v12;
    if ((v6 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable media property notification registration changes requested, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

void __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[6];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v10 = objc_msgSend(*(id *)(a1 + 56), "isRestrictedGuest");
  v28 = 0;
  LOBYTE(v25) = v10;
  objc_msgSend(v5, "_fetchMKFUserAndRegistrationsWithUserUUID:withMediaProfileUUID:withMediaPropertyIn:withDeviceIdsDestination:withAccessoryUUID:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v6, v7, v9, v8, v4, 0, v25, &v28, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;

  if (v11 && v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_258;
    v27[3] = &unk_24E794C88;
    v13 = *(_QWORD *)(a1 + 80);
    v27[4] = *(_QWORD *)(a1 + 48);
    v27[5] = v13;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);
    if (objc_msgSend(v2, "hasChanges"))
    {
      v14 = *(void **)(a1 + 32);
      v26 = 0;
      v15 = objc_msgSend(v14, "save:", &v26);
      v16 = v26;
      if ((v15 & 1) == 0)
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v20;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable media property notification registration changes requested, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      }

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

uint64_t __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_258(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  int8x16_t v30;
  id v31;
  _QWORD v32[4];
  id v33;
  int8x16_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  __int128 *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int128 v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = objc_msgSend(*(id *)(a1 + 56), "isRestrictedGuest");
  v41 = 0;
  LOBYTE(v29) = v10;
  objc_msgSend(v5, "_fetchMKFUserAndRegistrationsWithUserUUID:withMediaProfileUUID:withMediaPropertyIn:withDeviceIdsDestination:withAccessoryUUID:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v6, v7, v8, v9, v4, 0, v29, &v41, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v41;

  if (v11 && v12)
  {
    *(_QWORD *)&v46 = 0;
    *((_QWORD *)&v46 + 1) = &v46;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__221039;
    v49 = __Block_byref_object_dispose__221040;
    v50 = 0;
    v13 = *(void **)(a1 + 64);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_256;
    v32[3] = &unk_24E794C38;
    v14 = v11;
    v15 = *(_QWORD *)(a1 + 80);
    v33 = v14;
    v39 = v15;
    v40 = &v46;
    v30 = *(int8x16_t *)(a1 + 40);
    v16 = (id)v30.i64[0];
    v34 = vextq_s8(v30, v30, 8uLL);
    v17 = v2;
    v35 = v17;
    v36 = *(id *)(a1 + 72);
    v37 = v12;
    v38 = *(id *)(a1 + 32);
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if (objc_msgSend(v17, "hasChanges"))
    {
      v18 = *(void **)(a1 + 32);
      v31 = 0;
      v19 = objc_msgSend(v18, "save:", &v31);
      v20 = v31;
      if ((v19 & 1) == 0)
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v24;
          v44 = 2112;
          v45 = v20;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable media property notification registration changes requested, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    _Block_object_dispose(&v46, 8);
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46) = 138543362;
      *(_QWORD *)((char *)&v46 + 4) = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", (uint8_t *)&v46, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_256(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v6 = *(void **)(a1 + 32);
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_2;
  v25 = &unk_24E794C10;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 40);
  v26 = v7;
  v27 = v8;
  v9 = *(_QWORD *)(a1 + 88);
  v28 = &v30;
  v29 = v9;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v22);
  if (*((_BYTE *)v31 + 24))
    goto LABEL_10;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  if (v10)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 48), "accessory", v22, v23, v24, v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v11, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_fetchMKFHAPAccessoryWithUUID:context:", v13, *(_QWORD *)(a1 + 56));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
LABEL_5:
    if (objc_msgSend(*(id *)(a1 + 40), "_insertNotificationRegistrationForMediaProperty:mediaProfile:deviceIdsDestination:homeMember:accessory:context:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v10, *(_QWORD *)(a1 + 80), v22, v23, v24, v25))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    goto LABEL_10;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v20;
    v36 = 2112;
    v37 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch MKFHAPAccessory for UUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  *a3 = 1;

LABEL_10:
  _Block_object_dispose(&v30, 8);

}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  objc_msgSend(v6, "mediaProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_enableRegistration:", v9))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "_fetchRequestForAllCharacteristicRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  if (!v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2112;
      v23 = v5;
      v10 = "%{public}@Unable to fetch all characteristic registrations, error: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, buf, v13);

    }
LABEL_9:

    objc_autoreleasePoolPop(v6);
    objc_msgSend(a1[5], "reset");
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v9;
      v10 = "%{public}@Found no characteristic registrations";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke_255;
  v17 = &unk_24E794BE8;
  v18 = a1[6];
  objc_msgSend(v4, "na_each:", &v14);
  objc_msgSend(a1[5], "reset", v14, v15, v16, v17);

LABEL_10:
}

void __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke_255(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDCharacteristicNotificationRegistration *v16;
  HMDCharacteristicNotificationRegistration *v17;
  void *v18;
  void *v19;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRestrictedGuestEnabled");

    if (v5)
    {
      objc_msgSend(v21, "guest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  v17 = [HMDCharacteristicNotificationRegistration alloc];
  objc_msgSend(v21, "characteristic");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "deviceIdsDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "enabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");
  objc_msgSend(v21, "notificationThreshold");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDCharacteristicNotificationRegistration initWithAccessoryUUID:characteristicInstanceID:deviceIdsDestination:userUUID:lastModified:enabled:notificationThreshold:](v17, "initWithAccessoryUUID:characteristicInstanceID:deviceIdsDestination:userUUID:lastModified:enabled:notificationThreshold:", v8, v10, v11, v3, v12, v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_enabledCharacteristicRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enabled");
}

void __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_fetchRequestForCharacteristicRegistrationsWithoutAllowedDestinations:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v36;

  if (!v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v10;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all characteristic registrations without allowed destinations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  if (objc_msgSend(v5, "count"))
  {
    v11 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_251;
    v34[3] = &unk_24E7949E0;
    v34[4] = *(_QWORD *)(a1 + 40);
    v35 = *(id *)(a1 + 56);
    objc_msgSend(v5, "na_each:", v34);
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_252;
    v31[3] = &unk_24E794B80;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 64);
    v32 = v12;
    v33 = v13;
    v14 = objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (objc_msgSend(v2, "hasChanges"))
      {
        v15 = *(void **)(a1 + 32);
        v30 = v6;
        v16 = objc_msgSend(v15, "save:", &v30);
        v17 = v30;

        if ((v16 & 1) == 0)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v21;
            v39 = 2112;
            v40 = v17;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after removing characteristic registrations without allowed destinations, error: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        }
        v6 = v17;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638](v14);
      v27 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Did not delete characteristic registrations without allowed destinations", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@No notifications without allowed destinations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(*(id *)(a1 + 32), "reset");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDCharacteristicNotificationRegistration *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCharacteristicNotificationRegistration *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  HMDCharacteristicNotificationRegistration *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRestrictedGuestEnabled");

    if (v7)
    {
      objc_msgSend(v3, "guest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modelID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  v22 = a1;
  v26 = [HMDCharacteristicNotificationRegistration alloc];
  objc_msgSend(v3, "characteristic");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "modelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdsDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModified");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(v3, "notificationThreshold");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDCharacteristicNotificationRegistration initWithAccessoryUUID:characteristicInstanceID:deviceIdsDestination:userUUID:lastModified:enabled:notificationThreshold:](v26, "initWithAccessoryUUID:characteristicInstanceID:deviceIdsDestination:userUUID:lastModified:enabled:notificationThreshold:", v9, v11, v12, v5, v13, v15, v16);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = *(id *)(v22 + 32);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v21;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing registration: %@ that is not in set of allowed destinations", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(*(id *)(v22 + 40), "addObject:", v17);

}

uint64_t __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_252(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[6];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForAllCharacteristicRegistrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;

  if (!v4)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543618;
      *(_QWORD *)&v27[4] = v18;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v5;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all characteristic registrations to disable, error: %@", v27, 0x16u);

    }
    goto LABEL_16;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v27 = 138543362;
      *(_QWORD *)&v27[4] = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Found no characteristic registrations to disable", v27, 0xCu);

    }
LABEL_16:

    objc_autoreleasePoolPop(v15);
    goto LABEL_17;
  }
  *(_QWORD *)v27 = 0;
  *(_QWORD *)&v27[8] = v27;
  *(_QWORD *)&v27[16] = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke_250;
  v21[3] = &unk_24E794B58;
  v21[4] = *(_QWORD *)(a1 + 32);
  v21[5] = v27;
  objc_msgSend(v4, "na_each:", v21);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)&v27[8] + 24) && objc_msgSend(v6, "hasChanges"))
  {
    v8 = *(void **)(a1 + 40);
    v20 = 0;
    v9 = objc_msgSend(v8, "save:", &v20);
    v10 = v20;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v10;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after disabling all characteristic registrations, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "reset");

  _Block_object_dispose(v27, 8);
LABEL_17:

}

uint64_t __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke_250(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __78__HMDNotificationRegistryCoreDataAdapter_removeAllCharacteristicRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_deleteAllCharacteristicRegistrationsWithContext:", *(_QWORD *)(a1 + 32))&& objc_msgSend(v2, "hasChanges"))
  {
    v3 = *(void **)(a1 + 32);
    v10 = 0;
    v4 = objc_msgSend(v3, "save:", &v10);
    v5 = v10;
    if ((v4 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after removing all characteristic registrations, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

id __82__HMDNotificationRegistryCoreDataAdapter__filterCharacteristicRegistrations_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "deviceIdsDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "guest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "guest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userWithUUID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "isAccessCurrentlyAllowedBySchedule"))
      {
        objc_msgSend(v3, "deviceIdsDestination");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {

        v5 = 0;
      }
    }
  }

  return v5;
}

void __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fetchEnabledMKFRegistrationsForHMDCharacteristics:context:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke_246;
    v15[3] = &unk_24E794B08;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v5, "na_filter:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_filterCharacteristicRegistrations:home:", v6, *(_QWORD *)(a1 + 56));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for characteristic %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(*(id *)(a1 + 32), "reset");

}

BOOL __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke_246(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _BOOL8 v19;

  v3 = a2;
  objc_msgSend(v3, "notificationThreshold");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "previousValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v3, "notificationThreshold");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    if (fabs(v11) >= 2.22044605e-16)
      v9 = round(v9 / v11) * v11;

    objc_msgSend(*(id *)(a1 + 32), "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v3, "notificationThreshold");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    if (fabs(v18) >= 2.22044605e-16)
      v16 = round(v16 / v18) * v18;

    v19 = vabdd_f64(v9, v16) >= 2.22044605e-16;
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "na_map:", &__block_literal_global_241_221104);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[6], "_deleteAllRegistrationsForCharacteristicIIDs:withAccessoryUUID:hmcContext:", v7, v6, a1[4])&& objc_msgSend(v2, "hasChanges"))
  {
    v8 = a1[4];
    v15 = 0;
    v9 = objc_msgSend(v8, "save:", &v15);
    v10 = v15;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = a1[6];
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v14;
        v18 = 2112;
        v19 = CFSTR("YES");
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the remove characteristic notification registration changes requested, deleteResult %@, error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  objc_msgSend(a1[4], "reset");

}

uint64_t __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "instanceID");
}

void __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  __int128 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke_2;
  v14[3] = &unk_24E794AC0;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v15 = v8;
  v16 = v9;
  v18 = *(_QWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v10 = (id)v12;
  v17 = v12;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  v11 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= v11)
    *a4 = 1;

}

void __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToNumber:", v9);

  if (v10)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_disableRegistration:", *(_QWORD *)(a1 + 32)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v13, "characteristic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
  }

}

void __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v7 = *(void **)(a1 + 32);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_2;
  v38[3] = &unk_24E794A30;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v39 = v8;
  v40 = v9;
  v11 = *(_QWORD *)(a1 + 88);
  v42 = &v45;
  v43 = v11;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 96);
  v41 = v12;
  v44 = v13;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);
  if (!*((_BYTE *)v46 + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
      goto LABEL_4;
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "na_map:", &__block_literal_global_240);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_fetchMKFCharacteristicsFromHMDCharacteristics:context:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
LABEL_4:
      v20 = *(void **)(a1 + 40);
      objc_msgSend(v8, "characteristic");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "threshold");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deviceIdsDestination");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 80);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "objectAtIndexedSubscript:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v20, "_insertNotificationRegistrationForCharacteristic:notificationThreshold:deviceIdsDestination:homeMember:mkfCharacteristic:context:", v21, v22, v24, v25, v26, *(_QWORD *)(a1 + 64));

      if ((v27 & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        v28 = *(void **)(a1 + 48);
        objc_msgSend(v8, "characteristic");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v29);

        goto LABEL_12;
      }
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "characteristic");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v33;
        v51 = 2112;
        v52 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to insert notification registration for characteristic: %@", buf, 0x16u);

      }
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v50 = v35;
        v51 = 2112;
        v52 = v36;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFCharacteristics for characteristics: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v30);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_12:

  _Block_object_dispose(&v45, 8);
}

void __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToNumber:", v9);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_enableRegistration:", v17))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v11 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "characteristic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "threshold");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v13, "_updateThresholdRegistration:threshold:", v17, v14);

    if ((_DWORD)v13 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v15 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "characteristic");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v16);

    }
  }

}

uint64_t __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke(id *a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a2, "characteristicThresholds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2;
  v4[3] = &unk_24E794950;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v4);

}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2_237(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v11, "characteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "characteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "containsObject:", v10);

  if ((_DWORD)v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v11, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(v11, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enable");

  v9 = *(void **)(a1 + 40);
  if (v8)
    objc_msgSend(v9, "_processEnableCharacteristicsRequest:homeMember:registrationsForAccessory:context:", v11, *(_QWORD *)(a1 + 48), v6, *(_QWORD *)(a1 + 56));
  else
    objc_msgSend(v9, "_processDisableCharacteristicsRequest:registrationsForAccessory:context:", v11, v6, *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v10);

}

HMDNotificationRegistryCoreDataCharacteristicsRequestResult *__106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_234(uint64_t a1, void *a2)
{
  id v2;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v3;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v4;

  v2 = a2;
  v3 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  v4 = -[HMDNotificationRegistryCoreDataCharacteristicsRequestResult initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:](v3, "initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:", v2, 0, 0, 0, MEMORY[0x24BDBD1A8]);

  return v4;
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)a1[4];
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)a1[5];
  objc_msgSend(v17, "characteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  v10 = (void *)a1[6];
  objc_msgSend(v4, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)a1[6];
    objc_msgSend(v4, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  objc_msgSend(v17, "characteristic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "instanceID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v16);

}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdsDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_3;
  v15[3] = &unk_24E7948E8;
  v3 = *(void **)(a1 + 32);
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);
  if (objc_msgSend(*(id *)(a1 + 56), "na_any:", &__block_literal_global_229))
  {
    v4 = *(void **)(a1 + 48);
    v14 = 0;
    v5 = objc_msgSend(v4, "save:", &v14);
    v6 = v14;
    if ((v5 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the characteristic notification registration changes requested, error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
      v12[0] = v2;
      v12[1] = 3221225472;
      v12[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_230;
      v12[3] = &unk_24E7948C0;
      v11 = *(void **)(a1 + 64);
      v13 = *(id *)(a1 + 56);
      objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "reset");

}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_processGroupedCharacteristicsRequests:user:destination:context:", v5, v8, v12, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

  }
}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_230(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v4;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  v5 = -[HMDNotificationRegistryCoreDataCharacteristicsRequestResult initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:](v4, "initWithCoreDataRequest:didSucceed:didModify:didModifyThresholdOnly:modifiedCharacteristics:", v3, 0, 0, 0, MEMORY[0x24BDBD1A8]);

  objc_msgSend(v2, "addObject:", v5);
}

uint64_t __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "didSucceed"))
  {
    if ((objc_msgSend(v2, "didModify") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "didModifyThresholdOnly");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *context;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  __int128 *p_buf;
  uint64_t v38;
  id v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int128 buf;
  uint64_t v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_220_221125);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("characteristic.instanceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 56), "isRestrictedGuest");
  v39 = 0;
  objc_msgSend(v8, "_fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUID:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v9, v7, v6, v10, v11, v12, &v39, v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v39;

  if (v13 && v14)
  {
    if (objc_msgSend(v13, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v45 = 0x2020000000;
      v46 = 0;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_221;
      v33[3] = &unk_24E794898;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v34 = v15;
      v35 = v16;
      v18 = *(void **)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 80);
      p_buf = &buf;
      v38 = v17;
      v36 = v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
      if (objc_msgSend(v2, "hasChanges")
        && ((v19 = *(void **)(a1 + 32),
             v32 = 0,
             v20 = objc_msgSend(v19, "save:", &v32),
             (v21 = v32) == 0)
          ? (v22 = v20)
          : (v22 = 0),
            (v22 & 1) == 0))
      {
        v27 = v21;
        context = (void *)MEMORY[0x227676638]();
        v28 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v29 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v40 = 138543618;
          v41 = v30;
          v42 = 2112;
          v43 = v27;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable characteristic notification registration changes requested, error: %@", v40, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "reset");
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "reset");
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_221(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  __int128 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2_222;
  v14[3] = &unk_24E794870;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v15 = v8;
  v16 = v9;
  v18 = *(_QWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 48);
  v10 = (id)v12;
  v17 = v12;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);
  v11 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= v11)
    *a4 = 1;

}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2_222(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToNumber:", v8);

  if (v9)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_disableRegistration:", *(_QWORD *)(a1 + 32)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    }
  }

}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "instanceID");
}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int8x16_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  int8x16_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  __int128 *v43;
  uint64_t v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int128 v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_216_221129);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 64);
  v10 = objc_msgSend(*(id *)(a1 + 56), "isRestrictedGuest");
  v45 = 0;
  objc_msgSend(v7, "_fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUID:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v8, v6, v33, v9, 0, v10, &v45, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v45;

  if (v11 && v12)
  {
    *(_QWORD *)&v50 = 0;
    *((_QWORD *)&v50 + 1) = &v50;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__221039;
    v53 = __Block_byref_object_dispose__221040;
    v54 = 0;
    v13 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_217;
    v35[3] = &unk_24E794800;
    v14 = v11;
    v15 = *(_QWORD *)(a1 + 80);
    v36 = v14;
    v42 = v15;
    v43 = &v50;
    v32 = *(int8x16_t *)(a1 + 40);
    v16 = (id)v32.i64[0];
    v37 = vextq_s8(v32, v32, 8uLL);
    v17 = v2;
    v19 = *(void **)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 72);
    v38 = v17;
    v44 = v18;
    v39 = v19;
    v40 = v12;
    v41 = *(id *)(a1 + 32);
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) && objc_msgSend(v17, "hasChanges"))
    {
      v20 = *(void **)(a1 + 32);
      v34 = 0;
      v21 = objc_msgSend(v20, "save:", &v34);
      v22 = v34;
      v23 = v22;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v21;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) || v22)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v27;
          v48 = 2112;
          v49 = v23;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable characteristic notification registration changes requested, error: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      }

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "reset");

    _Block_object_dispose(&v50, 8);
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v50) = 138543362;
      *(_QWORD *)((char *)&v50 + 4) = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", (uint8_t *)&v50, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "reset");
  }

}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_217(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t, _BYTE *);
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v8 = *(void **)(a1 + 32);
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2_218;
  v28 = &unk_24E7947D8;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 40);
  v29 = v9;
  v30 = v10;
  v11 = *(_QWORD *)(a1 + 88);
  v31 = &v33;
  v32 = v11;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v25);
  if (!*((_BYTE *)v34 + 24))
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (v12
      || (objc_msgSend(*(id *)(a1 + 40), "_fetchMKFCharacteristicsFromHMDCharacteristics:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v25, v26, v27, v28), v13 = objc_claimAutoreleasedReturnValue(), v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8), v15 = *(void **)(v14 + 40), *(_QWORD *)(v14 + 40) = v13, v15, (v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40)) != 0))
    {
      v16 = *(void **)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 64);
      v18 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v12, "objectAtIndexedSubscript:", a3, v25, v26, v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = objc_msgSend(v16, "_insertNotificationRegistrationForCharacteristic:notificationThreshold:deviceIdsDestination:homeMember:mkfCharacteristic:context:", v9, 0, v17, v18, v19, *(_QWORD *)(a1 + 80));

      if ((v17 & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_10;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        v39 = 2112;
        v40 = v24;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFCharacteristics for characteristics: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_10:

  _Block_object_dispose(&v33, 8);
}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2_218(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    if (objc_msgSend(*(id *)(a1 + 40), "_enableRegistration:", v10))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "instanceID");
}

void __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_2;
  v6[3] = &unk_24E794768;
  v5 = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = v10;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);

  _Block_object_dispose(v10, 8);
}

void __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

uint64_t __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "instanceID");
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_179(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "instanceID");
}

uint64_t __96__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForActionSetUUID_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

uint64_t __117__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForMediaProfileUUID_withMediaProperty_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

uint64_t __116__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsForCharacteristicIIDs_withAccessoryUUID_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

uint64_t __107__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsWithEntityName_withHomeKeypath_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t81_221227 != -1)
    dispatch_once(&logCategory__hmf_once_t81_221227, &__block_literal_global_296_221228);
  return (id)logCategory__hmf_once_v82_221229;
}

void __53__HMDNotificationRegistryCoreDataAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v82_221229;
  logCategory__hmf_once_v82_221229 = v0;

}

@end
