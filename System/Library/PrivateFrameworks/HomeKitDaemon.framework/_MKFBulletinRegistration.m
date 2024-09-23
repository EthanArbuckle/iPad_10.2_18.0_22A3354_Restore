@implementation _MKFBulletinRegistration

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFBulletinRegistration"));
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
  if (homeRelation__hmf_once_t0_115379 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_115379, &__block_literal_global_115380);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_115381;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557FFEC8;
}

- (MKFBulletinRegistrationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFBulletinRegistrationDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFBulletinRegistration user](self, "user");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (NSArray)conditions
{
  void *v2;
  void *v3;

  -[_MKFBulletinRegistration valueForKey:](self, "valueForKey:", CFSTR("conditions_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateConditionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("conditions_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createConditionsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("conditions_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("conditions_"), CFSTR("MKFPresenceBulletinCondition"), a3, a4);
}

- (id)createConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("conditions_"), CFSTR("MKFPresenceBulletinCondition"), a3);
}

- (id)findConditionsRelationOfTypePresenceBulletinConditionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("conditions_"), CFSTR("MKFPresenceBulletinCondition"), a3);
}

- (id)materializeOrCreateConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("conditions_"), CFSTR("MKFTimePeriodBulletinCondition"), a3, a4);
}

- (id)createConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("conditions_"), CFSTR("MKFTimePeriodBulletinCondition"), a3);
}

- (id)findConditionsRelationOfTypeTimePeriodBulletinConditionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("conditions_"), CFSTR("MKFTimePeriodBulletinCondition"), a3);
}

- (void)addConditionsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("conditions_"), a3);
}

- (void)removeConditionsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("conditions_"), a3);
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4;
  _MKFBulletinRegistration *v5;
  _MKFBulletinRegistration *v6;
  _MKFBulletinRegistration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;

  v4 = a3;
  v5 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[_MKFBulletinRegistration characteristic](v7, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
      v13 = objc_msgSend(v12, "shouldIncludeForRestrictedGuestWithContext:", v4);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _MKFBulletinRegistration *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _MKFBulletinRegistration *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)v7[2];
  if (!v9)
  {
    objc_msgSend(v7, "targetDeviceAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[_MKFBulletinRegistration fetchRequest](_MKFBulletinRegistration, "fetchRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setResultType:", 1);
      objc_msgSend(v8, "targetUser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRestrictedGuest");

      v14 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v8, "targetUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "targetDeviceAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "idsIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("user");
      if (v13)
        v19 = CFSTR("guest");
      objc_msgSend(v14, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@)"), v19, v15, CFSTR("deviceIdsIdentifier"), v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPredicate:", v20);

      v40 = 0;
      objc_msgSend(v11, "execute:", &v40);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v40;
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v21)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v39 = v22;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "targetDeviceAddress");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v27;
          v43 = 2114;
          v44 = v21;
          v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Setting context->_relevantBulletinRegistrations to: %{public}@ for targetDeviceAddress: %@", buf, 0x20u);

          v22 = v39;
        }

        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v21);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v35;
          v43 = 2114;
          v44 = v22;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch relevant bulletin registrations: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v36 = (void *)v8[2];
      v8[2] = v29;

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_DEBUG, "%{public}@No targetDeviceAddress when trying to set context->_relevantBulletinRegistrations", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v34 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v8[2];
      v8[2] = v34;
    }

    v9 = (void *)v8[2];
  }
  -[_MKFBulletinRegistration objectID](self, "objectID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v9, "containsObject:", v37);

  if (v38)
    objc_msgSend(v6, "addCondition:", CFSTR("deviceIsTargetDevice"));

}

@end
