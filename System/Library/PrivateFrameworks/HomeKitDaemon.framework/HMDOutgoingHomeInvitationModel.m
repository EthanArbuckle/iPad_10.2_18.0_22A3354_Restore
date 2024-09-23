@implementation HMDOutgoingHomeInvitationModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMDOutgoingHomeInvitationModel pendingUserUUID](self, "pendingUserUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDOutgoingHomeInvitationModel pendingUserUUID](self, "pendingUserUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMDOutgoingHomeInvitationModel uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[HMDOutgoingHomeInvitationModel uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMDOutgoingHomeInvitationModel operations](self, "operations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKey:", CFSTR("HM.user"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HM.user"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HM.user"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            v20 = objc_opt_isKindOfClass();

            if ((v20 & 1) == 0)
              goto LABEL_18;
            v21 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("HM.user"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v21, "initWithUUIDString:", v22);

          }
          if (v19)
          {
            objc_msgSend(v3, "addObject:", v19);

          }
        }
LABEL_18:
        objc_msgSend(v15, "objectForKey:", CFSTR("accessory"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          continue;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("accessory"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v25 = objc_opt_isKindOfClass();

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("accessory"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v25 & 1) == 0)
        {
          objc_opt_class();
          v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) == 0)
            continue;
          v28 = objc_alloc(MEMORY[0x24BDD1880]);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("accessory"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

        }
        if (v26)
        {
          objc_msgSend(v3, "addObject:", v26);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  return v3;
}

+ (id)properties
{
  if (properties_onceToken_12459 != -1)
    dispatch_once(&properties_onceToken_12459, &__block_literal_global_12460);
  return (id)properties__properties_12461;
}

void __44__HMDOutgoingHomeInvitationModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[15];
  _QWORD v18[17];

  v18[15] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("user");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("invitationState");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = CFSTR("idsInvitationUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("dateSent");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v17[4] = CFSTR("accessCode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v12;
  v17[5] = CFSTR("announceAccessLevel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v11;
  v17[6] = CFSTR("shareToken");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v0;
  v17[7] = CFSTR("pendingUserUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v1;
  v17[8] = CFSTR("expiryDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v2;
  v17[9] = CFSTR("messageIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v3;
  v17[10] = CFSTR("responseReceived");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v4;
  v17[11] = CFSTR("inviteeDestinationAddress");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v5;
  v17[12] = CFSTR("operations");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[12] = v6;
  v17[13] = CFSTR("operationIdentifiers");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[13] = v7;
  v17[14] = CFSTR("uuidsOfAllowedAccessories");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[14] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 15);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_12461;
  properties__properties_12461 = v9;

}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  HMDOutgoingHomeInvitationModel *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("user")))
  {
    objc_msgSend(v8, "inviteeUserID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "privilege");
    v40 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v12, "unsignedIntegerValue");
    objc_msgSend(v8, "remoteAccessAllowed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v8, "cameraAccessLevel");
    v39 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");
    objc_msgSend(v8, "announceAccessLevel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    -[HMDOutgoingHomeInvitationModel rgSettingsFromOutgoingInvitation:](self, "rgSettingsFromOutgoingInvitation:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUser userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:restrictedGuestAccessSettings:](HMDUser, "userDictionaryWithUserID:privilege:remoteAccessAllowed:cameraAccessLevel:announceAccessAllowed:announceAccessLevel:audioAnalysisUserDropInAccessLevel:restrictedGuestAccessSettings:", v11, v38, v14, v16, 0, v18, 0, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v39;
    v9 = v40;

    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("idsInvitationUUID")))
  {
    objc_msgSend(v8, "idsIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = (void *)*MEMORY[0x24BDBD430];
    if (v21)
      v23 = (void *)v21;
    v20 = v23;
LABEL_7:

    goto LABEL_14;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("messageIdentifier")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("responseReceived")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("inviteeDestinationAddress")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("operations")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("operationIdentifiers")) & 1) != 0)
  {
    v20 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("shareToken")))
  {
    v25 = (void *)objc_opt_class();
    objc_msgSend(v8, "shareToken");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyedArchiveToken:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = (void *)*MEMORY[0x24BDBD430];
    if (v27)
      v29 = (void *)v27;
    v20 = v29;

  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("pendingUserUUID")))
    {
      objc_msgSend(v8, "pendingUser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "modelID");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = (void *)*MEMORY[0x24BDBD430];
      if (v30)
        v32 = (void *)v30;
      v20 = v32;

      goto LABEL_7;
    }
    v33 = self;
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isRestrictedGuestEnabled");

    if (v35 && objc_msgSend(v9, "isEqualToString:", CFSTR("uuidsOfAllowedAccessories")))
    {
      objc_msgSend(v8, "allowedAccessories");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        objc_msgSend(v8, "allowedAccessoryUUIDs");
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41.receiver = v33;
      v41.super_class = (Class)HMDOutgoingHomeInvitationModel;
      -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v41, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (id)v37;
  }
LABEL_14:

  return v20;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("privilege")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("announceAccessLevel")))
    {
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("user")))
      {
        -[HMDOutgoingHomeInvitationModel user](self, "user");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[HMDOutgoingHomeInvitationModel user](self, "user");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUser userWithDictionary:](HMDUser, "userWithDictionary:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = (void *)MEMORY[0x24BDD16E0];
          v15 = objc_msgSend(v13, "announceAccessLevel");
          goto LABEL_13;
        }
        goto LABEL_24;
      }
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("cameraAccessLevel")))
    {
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("user")))
      {
        -[HMDOutgoingHomeInvitationModel user](self, "user");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[HMDOutgoingHomeInvitationModel user](self, "user");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUser userWithDictionary:](HMDUser, "userWithDictionary:", v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = (void *)MEMORY[0x24BDD16E0];
          v15 = objc_msgSend(v13, "camerasAccessLevel");
          goto LABEL_13;
        }
        goto LABEL_24;
      }
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("inviteeUserID")))
    {
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("user")))
      {
        -[HMDOutgoingHomeInvitationModel user](self, "user");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[HMDOutgoingHomeInvitationModel user](self, "user");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUser userWithDictionary:](HMDUser, "userWithDictionary:", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "accountHandle");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUser userIDForAccountHandle:](HMDUser, "userIDForAccountHandle:", v24);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        goto LABEL_24;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("remoteAccessAllowed")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("idsIdentifier")))
        {
          if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("idsInvitationUUID")))
          {
            -[HMDOutgoingHomeInvitationModel idsInvitationUUID](self, "idsInvitationUUID");
            v28 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v28;
            v29 = (void *)*MEMORY[0x24BDBD430];
            if (v28)
              v29 = (void *)v28;
            v20 = v29;
            goto LABEL_14;
          }
          goto LABEL_44;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("shareToken")))
        {
          if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("shareToken")))
            goto LABEL_44;
          v30 = (void *)objc_opt_class();
          -[HMDOutgoingHomeInvitationModel shareToken](self, "shareToken");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "shareTokenFromKeyedArchiveData:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v32;
          v34 = (void *)*MEMORY[0x24BDBD430];
          if (v32)
            v34 = (void *)v32;
          v21 = v34;

        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("pendingUser")))
          {
            +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isRestrictedGuestEnabled");

            if (!v37 || !objc_msgSend(v9, "isEqualToString:", CFSTR("allowedAccessories_")))
            {
              v42.receiver = self;
              v42.super_class = (Class)HMDOutgoingHomeInvitationModel;
              -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v42, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
              v27 = objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
            if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("uuidsOfAllowedAccessories")))
            {
              v44 = 0;
              v45 = &v44;
              v46 = 0x3032000000;
              v47 = __Block_byref_object_copy__90213;
              v48 = __Block_byref_object_dispose__90214;
              v38 = (void *)MEMORY[0x24BDBCEF0];
              -[HMDOutgoingHomeInvitationModel uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setWithCapacity:", objc_msgSend(v39, "count"));
              v49 = (id)objc_claimAutoreleasedReturnValue();

              -[HMDOutgoingHomeInvitationModel uuidsOfAllowedAccessories](self, "uuidsOfAllowedAccessories");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v43[0] = MEMORY[0x24BDAC760];
              v43[1] = 3221225472;
              v43[2] = __99__HMDOutgoingHomeInvitationModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
              v43[3] = &unk_24E78B298;
              v43[4] = &v44;
              objc_msgSend(v40, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v43);

              v21 = (id)v45[5];
              _Block_object_dispose(&v44, 8);

              goto LABEL_45;
            }
            goto LABEL_44;
          }
          if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("pendingUserUUID")))
            goto LABEL_44;
          v35 = (void *)objc_opt_class();
          -[HMDOutgoingHomeInvitationModel pendingUserUUID](self, "pendingUserUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "cd_getMKFUserFromUUID:", v31);
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_45;
      }
      if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("user")))
      {
        -[HMDOutgoingHomeInvitationModel user](self, "user");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[HMDOutgoingHomeInvitationModel user](self, "user");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDUser userWithDictionary:](HMDUser, "userWithDictionary:", v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isRemoteAccessAllowed"));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        goto LABEL_24;
      }
    }
LABEL_44:
    v21 = 0;
    goto LABEL_45;
  }
  if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("user")))
    goto LABEL_44;
  -[HMDOutgoingHomeInvitationModel user](self, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v21 = (id)v27;
    goto LABEL_45;
  }
  -[HMDOutgoingHomeInvitationModel user](self, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUser userWithDictionary:](HMDUser, "userWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend(v13, "privilege");
LABEL_13:
  objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v21 = v20;
LABEL_15:

LABEL_45:
  return v21;
}

- (id)rgSettingsFromOutgoingInvitation:(id)a3
{
  id v3;
  void *v4;
  int v5;
  HMDRestrictedGuestHomeAccessSettings *v6;
  void *v7;
  void *v8;
  HMDRestrictedGuestHomeAccessSettings *v9;

  v3 = a3;
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRestrictedGuestEnabled");

  if (v5)
  {
    v6 = [HMDRestrictedGuestHomeAccessSettings alloc];
    objc_msgSend(v3, "allowedAccessoryUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restrictedGuestSchedule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRestrictedGuestHomeAccessSettings initWithAllowedAccessories:schedule:](v6, "initWithAllowedAccessories:schedule:", v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __99__HMDOutgoingHomeInvitationModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cd_getMKFAccessoryFromAccessory:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
