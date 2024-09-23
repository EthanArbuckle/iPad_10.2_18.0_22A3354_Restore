@implementation HMDPresenceEventModel

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("users")))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "users");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStore cdlsModelIDStringsForManagedObjects:](HMDBackingStore, "cdlsModelIDStringsForManagedObjects:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", v13);
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isRestrictedGuestEnabled");

    if (v15)
    {
      objc_msgSend(v8, "guests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStore cdlsModelIDStringsForManagedObjects:](HMDBackingStore, "cdlsModelIDStringsForManagedObjects:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObjectsFromArray:", v17);
    }

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDPresenceEventModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v19, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("users_")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("users")))
      goto LABEL_7;
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isRestrictedGuestEnabled");

  if (!v12 || !objc_msgSend(v9, "isEqualToString:", CFSTR("guests_")))
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDPresenceEventModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v16, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("users")))
    goto LABEL_9;
LABEL_7:
  -[HMDPresenceEventModel users](self, "users");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStore cdlsFetchManagedObjectsWithUUIDStrings:ofManagedObjectType:](HMDBackingStore, "cdlsFetchManagedObjectsWithUUIDStrings:ofManagedObjectType:", v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v14;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("trigger");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDPresenceEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_41858 != -1)
    dispatch_once(&properties_onceToken_41858, block);
  return (id)properties__properties_41859;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[HMDEventModel eventModelWithDictionary:home:eventTriggerUUID:className:message:](HMDEventModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:", v10, v11, v12, objc_opt_class(), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmf_stringForKey:", CFSTR("kPresenceEventPresence"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPresenceType:", v15);

  objc_msgSend(v14, "presenceType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD6A10]);

  if ((v17 & 1) != 0)
  {
    v18 = (_QWORD *)MEMORY[0x24BDD6A28];
  }
  else
  {
    objc_msgSend(v14, "presenceType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDD6A18]);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(v10, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUsers:", v31);

      goto LABEL_14;
    }
    v18 = (_QWORD *)MEMORY[0x24BDD6A30];
  }
  objc_msgSend(v14, "setPresenceType:", *v18);
  v35 = v12;
  if (v13)
    objc_msgSend(v13, "userForHome:", v11);
  else
    objc_msgSend(v11, "currentUser");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUsers:", v25);

  }
  v26 = (void *)MEMORY[0x227676638]();
  v27 = a1;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "users");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Populated tracked users %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);

  v12 = v35;
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD78E8], "activationGranularityWithDict:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "number");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActivation:", v33);

  return v14;
}

void __35__HMDPresenceEventModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDPresenceEventModel;
  objc_msgSendSuper2(&v10, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_41859;
  properties__properties_41859 = v3;

  v5 = (void *)properties__properties_41859;
  v11[0] = CFSTR("presenceType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("activation");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("users");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

}

@end
