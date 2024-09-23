@implementation _MKFHomeAccessCode

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557EAF40;
}

- (MKFHomeAccessCodeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeAccessCodeDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomeAccessCode"));
}

- (BOOL)validateAccessCodeForInsertOrUpdate:(id *)a3
{
  void *v5;
  _MKFHomeAccessCode *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _MKFHomeAccessCode *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  _MKFHomeAccessCode *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _MKFHomeAccessCode *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  _MKFHomeAccessCode *v38;
  NSObject *v39;
  void *v41;
  void *context;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Validating access code for insert or update", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (!-[_MKFHomeAccessCode _validateParentsForInsertOrUpdate:](v6, "_validateParentsForInsertOrUpdate:", a3))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Validation failed in the super class", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    return 0;
  }
  if (a3)
    *a3 = 0;
  -[_MKFHomeAccessCode accessCode](v6, "accessCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v6;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Validation failed because the access code has zero length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("Access code must not be empty."));
      v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v18;
    }
    return 0;
  }
  -[_MKFHomeAccessCode entity](v6, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFRemovedUserAccessCode entity](_MKFRemovedUserAccessCode, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isKindOfEntity:", v12);

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Not enforcing value uniqueness on access code because it is a RemovedUserAccessCode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    return 1;
  }
  else
  {
    -[_MKFHomeAccessCode homeForHomeAccessCode:](v6, "homeForHomeAccessCode:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeAccessCode fetchOtherUserAccessCodesInHome:](v6, "fetchOtherUserAccessCodesInHome:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeAccessCode fetchOtherGuestAccessCodesInHome:](v6, "fetchOtherGuestAccessCodesInHome:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFHomeAccessCode fetchOtherGuestUserAccessCodesInHome:](v6, "fetchOtherGuestUserAccessCodesInHome:", v27);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v18 = 0;
    if (v28 && v29 && v30)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObjectsFromArray:", v28);
      objc_msgSend(v32, "addObjectsFromArray:", v29);
      objc_msgSend(v32, "addObjectsFromArray:", v31);
      objc_msgSend(v32, "asSet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "na_map:", &__block_literal_global_177501);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x24BDD72D8];
      -[_MKFHomeAccessCode accessCode](v6, "accessCode");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "doesAccessCode:conflictWithExistingAccessCodes:", v36, v34);

      if (v37)
      {
        context = (void *)MEMORY[0x227676638]();
        v38 = v6;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v41;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Validation failed because the access code conflicts with an existing access code", buf, 0xCu);

        }
        objc_autoreleasePoolPop(context);
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("Access code must be unique within home"));
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v18 = v37 ^ 1;

    }
  }
  return v18;
}

- (id)homeForHomeAccessCode:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _MKFHomeAccessCode *v7;
  _MKFHomeAccessCode *v8;
  _MKFHomeAccessCode *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  _MKFHomeAccessCode *v22;
  _MKFHomeAccessCode *v23;
  void *v25;

  -[_MKFHomeAccessCode entity](self, "entity", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isKindOfEntity:", v5);

  if (v6)
  {
    v7 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRestrictedGuestEnabled");

    -[_MKFHomeAccessCode user](v9, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        -[_MKFHomeAccessCode guest](v9, "guest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "home");
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = v15;
    }

  }
  else
  {
    -[_MKFHomeAccessCode entity](self, "entity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MKFGuestAccessCode entity](_MKFGuestAccessCode, "entity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isKindOfEntity:", v17);

    if (!v18)
    {
      -[_MKFHomeAccessCode entity](self, "entity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFRemovedUserAccessCode entity](_MKFRemovedUserAccessCode, "entity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isKindOfEntity:", v20);

      if (!v21)
        return 0;
    }
    v22 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v9 = v23;

    -[_MKFHomeAccessCode home](v9, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)fetchOtherUserAccessCodesInHome:(id)a3
{
  id v4;
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
  id v15;
  void *v16;
  _MKFHomeAccessCode *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[_MKFUserAccessCode fetchRequest](_MKFUserAccessCode, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K.%K == %@)"), CFSTR("user"), CFSTR("home"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  -[_MKFHomeAccessCode modelID](self, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(%K != %@)"), CFSTR("modelID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD14C0];
  v26[0] = v6;
  v26[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v12);

  -[_MKFHomeAccessCode managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v5, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the accessCodes for user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

  return v14;
}

- (id)fetchOtherGuestUserAccessCodesInHome:(id)a3
{
  id v4;
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
  id v17;
  void *v18;
  _MKFHomeAccessCode *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

  if (v6)
  {
    +[_MKFUserAccessCode fetchRequest](_MKFUserAccessCode, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K.%K == %@)"), CFSTR("guest"), CFSTR("home"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1758];
    -[_MKFHomeAccessCode modelID](self, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("(%K != %@)"), CFSTR("modelID"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD14C0];
    v28[0] = v8;
    v28[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v14);

    -[_MKFHomeAccessCode managedObjectContext](self, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "executeFetchRequest:error:", v7, &v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;

    if (v17)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v21;
        v26 = 2112;
        v27 = v17;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the accessCodes for guest: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v16;
}

- (id)fetchOtherGuestAccessCodesInHome:(id)a3
{
  id v4;
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
  id v15;
  void *v16;
  _MKFHomeAccessCode *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[_MKFGuestAccessCode fetchRequest](_MKFGuestAccessCode, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("home"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  -[_MKFHomeAccessCode modelID](self, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(%K != %@)"), CFSTR("modelID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD14C0];
  v26[0] = v6;
  v26[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v12);

  -[_MKFHomeAccessCode managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v5, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the guest accessCodes : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

  return v14;
}

- (BOOL)_validateParentsForInsertOrUpdate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v10;

  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRestrictedGuestEnabled") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[_MKFHomeAccessCode entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MKFUserAccessCode entity](_MKFUserAccessCode, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isKindOfEntity:", v7);

  if (!v8)
  {
LABEL_6:
    v10.receiver = self;
    v10.super_class = (Class)_MKFHomeAccessCode;
    return -[_MKFModel validateForInsertOrUpdate:](&v10, sel_validateForInsertOrUpdate_, a3);
  }
  return -[_MKFModel validateForInsertOrUpdateWithParentKey:error:](self, "validateForInsertOrUpdateWithParentKey:error:", CFSTR("user"), a3)|| -[_MKFModel validateForInsertOrUpdateWithParentKey:error:](self, "validateForInsertOrUpdateWithParentKey:error:", CFSTR("guest"), a3);
}

@end
