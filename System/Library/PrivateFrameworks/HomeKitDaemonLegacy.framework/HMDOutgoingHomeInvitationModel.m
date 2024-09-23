@implementation HMDOutgoingHomeInvitationModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDOutgoingHomeInvitationModel operations](self, "operations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("HM.user"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.user"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.user"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            v15 = objc_opt_isKindOfClass();

            if ((v15 & 1) == 0)
              goto LABEL_14;
            v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HM.user"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);

          }
          if (v14)
          {
            objc_msgSend(v3, "addObject:", v14);

          }
        }
LABEL_14:
        objc_msgSend(v10, "objectForKey:", CFSTR("accessory"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          continue;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessory"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v20 = objc_opt_isKindOfClass();

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessory"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 & 1) == 0)
        {
          objc_opt_class();
          v22 = objc_opt_isKindOfClass();

          if ((v22 & 1) == 0)
            continue;
          v23 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("accessory"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v23, "initWithUUIDString:", v24);

        }
        if (v21)
        {
          objc_msgSend(v3, "addObject:", v21);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  return v3;
}

+ (id)properties
{
  if (properties_onceToken_8775 != -1)
    dispatch_once(&properties_onceToken_8775, &__block_literal_global_8776);
  return (id)properties__properties_8777;
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
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("user");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = CFSTR("invitationState");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = CFSTR("expiryDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = CFSTR("messageIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("responseReceived");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = CFSTR("inviteeDestinationAddress");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:logging:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:logging:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = CFSTR("operations");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = CFSTR("operationIdentifiers");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)properties__properties_8777;
  properties__properties_8777 = v8;

}

@end
