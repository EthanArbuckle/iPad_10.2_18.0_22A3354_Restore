@implementation HMAccessory

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HMApplicationData)applicationData
{
  os_unfair_lock_s *p_lock;
  HMApplicationData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)uniqueIdentifiersForBridgedAccessories
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_uniqueIdentifiersForBridgedAccessories;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)mediaProfile
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      v11 = v10;

      if (v11)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v9 = 0;
  }

  return v9;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_handleCharacteristicsUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  HMAccessory *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  HMAccessory *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  HMAccessory *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_dictionaryForKey:", CFSTR("kCharacteristicAndValueKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_56;
  objc_msgSend(v4, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_dateForKey:", CFSTR("HMXPCMessageSentDateKey"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory delegate](self, "delegate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v6;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  if (!v57)
    goto LABEL_54;
  v54 = v6;
  v55 = v4;
  v66 = 0;
  v56 = *(_QWORD *)v93;
  v69 = self;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v93 != v56)
        objc_enumerationMutation(obj);
      v59 = v8;
      v9 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v8);
      objc_msgSend(obj, "objectForKeyedSubscript:", v9, v54, v55);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v70 = v10;
      v11 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
      if (v11)
      {
        v12 = v11;
        v67 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v89 != v67)
              objc_enumerationMutation(v70);
            v14 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
            objc_msgSend(v70, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "hmf_dateForKey:", CFSTR("kCharacteristicNotificationEnableTime"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMAccessory _findCharacteristic:forService:](self, "_findCharacteristic:forService:", v14, v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v16, "isEqual:", v19);

              if (v20)
              {

                v16 = 0;
              }
              objc_msgSend(v18, "value");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((HMFEqualObjects() & 1) != 0)
              {
LABEL_21:

              }
              else
              {
                objc_msgSend(v18, "characteristicType");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v64, "shouldNotCacheCharacteristicOfType:", v22);

                if ((v23 & 1) == 0)
                {
                  objc_msgSend(v18, "service");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "accessory");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    -[HMAccessory context](v69, "context");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "delegateCaller");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v83[0] = MEMORY[0x1E0C809B0];
                    v83[1] = 3221225472;
                    v83[2] = __45__HMAccessory__handleCharacteristicsUpdated___block_invoke;
                    v83[3] = &unk_1E3AB59E8;
                    v84 = v63;
                    v85 = v24;
                    v86 = v21;
                    v87 = v18;
                    objc_msgSend(v25, "invokeBlock:", v83);

                  }
                  goto LABEL_21;
                }
              }
              objc_msgSend(v18, "_updateValue:valueUpdatedDate:", v16, v65);
              if (v17)
                objc_msgSend(v18, "setNotificationEnabledTime:", v17);
            }

            self = v69;
          }
          v12 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
        }
        while (v12);
      }

      objc_msgSend(v60, "hmf_arrayForKey:", CFSTR("kRemovedCharacteristicIDsForAccessoryKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v80;
        v31 = v66;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v80 != v30)
              objc_enumerationMutation(v27);
            -[HMAccessory _findCharacteristic:forService:](self, "_findCharacteristic:forService:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j), v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
            {
              -[HMAccessory _findService:](self, "_findService:", v9);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "_removeCharacteristic:", v33);

              v31 = 1;
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
        }
        while (v29);
      }
      else
      {
        v31 = v66;
      }
      v66 = v31;
      v62 = v27;

      objc_msgSend(v60, "hmf_dictionaryForKey:", CFSTR("kAddedCharacteristicsForAccessoryKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v36 = v35;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
      if (v37)
      {
        v38 = v37;
        v68 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v76 != v68)
              objc_enumerationMutation(v36);
            v40 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
            v41 = (void *)MEMORY[0x1E0CB3710];
            v42 = objc_opt_class();
            objc_msgSend(v36, "objectForKeyedSubscript:", v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = 0;
            objc_msgSend(v41, "unarchivedObjectOfClass:fromData:error:", v42, v43, &v74);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v74;

            if (v44)
            {
              -[HMAccessory _findService:](self, "_findService:", v9);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "_addCharacteristic:", v44);
              -[HMAccessory context](self, "context");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "__configureWithContext:service:", v47, v46);

              v66 = 1;
            }
            else
            {
              v48 = (void *)MEMORY[0x1A1AC1AAC]();
              v49 = self;
              HMFGetOSLogHandle();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v97 = v51;
                v98 = 2112;
                v99 = v45;
                _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive characteristic from added characteristics array: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v48);
              self = v69;
            }

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
        }
        while (v38);
      }

      v8 = v59 + 1;
    }
    while (v59 + 1 != v57);
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  }
  while (v57);

  v6 = v54;
  v4 = v55;
  if ((v66 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "delegateCaller");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __45__HMAccessory__handleCharacteristicsUpdated___block_invoke_1017;
    v71[3] = &unk_1E3AB5ED8;
    v72 = v63;
    v73 = self;
    objc_msgSend(v53, "invokeBlock:", v71);

    obj = v72;
LABEL_54:

  }
LABEL_56:

}

- (id)_findService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMAccessory services](self, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "instanceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_findCharacteristic:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMAccessory _findService:](self, "_findService:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "characteristics", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "instanceID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v6);

          if ((v15 & 1) != 0)
          {
            v10 = v13;
            goto LABEL_12;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)services
{
  void *v2;
  void *v3;

  -[HMAccessory currentServices](self, "currentServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)profiles
{
  void *v2;
  void *v3;

  -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (HMAccessoryCategory)category
{
  os_unfair_lock_s *p_lock;
  HMAccessoryCategory *v4;
  _BOOL4 supportsTargetController;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  char isKindOfClass;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_category;
  supportsTargetController = self->_supportsTargetController;
  os_unfair_lock_unlock(p_lock);
  -[HMAccessoryCategory categoryType](v4, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("0FBA259B-05AC-46F2-875F-204ABB6D9FE7"));

  if (v7)
  {
    +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (supportsTargetController)
    {
      objc_msgSend(v8, "categoryForCategoryUUIDString:", CFSTR("770ADB51-8848-491A-BFA3-C34EA096CC92"));
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (HMAccessoryCategory *)v10;
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[HMAccessory accessoryProfiles](self, "accessoryProfiles", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0 && v17)
            {
              objc_msgSend(v9, "categoryForCategoryUUIDString:", CFSTR("C9EE63DB-2FF7-4514-826A-2FC2F0D4C9F0"));
              v19 = objc_claimAutoreleasedReturnValue();

              v4 = (HMAccessoryCategory *)v19;
              goto LABEL_15;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  return v4;
}

- (HMMutableArray)accessoryProfiles
{
  return self->_accessoryProfiles;
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMMutableArray)currentServices
{
  return self->_currentServices;
}

- (NSArray)televisionProfiles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMAccessory profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(v3, "addObject:", v11, (_QWORD)v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)lightProfiles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HMAccessory profiles](self, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMAccessory profiles](self, "profiles", 0);
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
        v11 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

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

- (NSArray)cameraProfiles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMAccessory profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(v3, "addObject:", v11, (_QWORD)v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (BOOL)isAdditionalSetupRequired
{
  unint64_t v3;

  v3 = -[HMAccessory additionalSetupStatus](self, "additionalSetupStatus");
  if (v3)
    LOBYTE(v3) = -[HMAccessory additionalSetupStatus](self, "additionalSetupStatus") == 1;
  return v3;
}

- (unint64_t)additionalSetupStatus
{
  return self->_additionalSetupStatus;
}

- (unint64_t)suspendedState
{
  os_unfair_lock_s *p_lock;
  unint64_t suspendedState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  suspendedState = self->_suspendedState;
  os_unfair_lock_unlock(p_lock);
  return suspendedState;
}

- (BOOL)bridgedAccessory
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_bridgedAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isFirmwareUpdateAvailable
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firmwareUpdateAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)supportsAudioAnalysis
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAudioAnalysis;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)accessoryReprovisionState
{
  return self->_accessoryReprovisionState;
}

- (BOOL)supportsSoftwareUpdateV2
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsSoftwareUpdateV2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)supportsWalletKey
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsWalletKey;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)serialNumber
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_serialNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)model
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_model;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)manufacturer
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)firmwareVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_firmwareVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMAccessory *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  char **v39;
  const __CFString *v40;
  char **v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;
  __CFString *v52;
  __CFString *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  HMAccessory *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  id v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory audioDestination](self, "audioDestination");
  v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory deviceIRKData](self, "deviceIRKData");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory device](self, "device");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = objc_claimAutoreleasedReturnValue();
    if (v53)
      v13 = CFSTR(" audioDestination: ");
    else
      v13 = &stru_1E3AB7688;
    if (v53)
      v14 = v53;
    else
      v14 = &stru_1E3AB7688;
    v15 = CFSTR(" device: ");
    if (!v9)
      v15 = &stru_1E3AB7688;
    v46 = v15;
    v47 = v13;
    if (v9)
      v16 = v9;
    else
      v16 = &stru_1E3AB7688;
    v49 = v16;
    v50 = v14;
    v17 = CFSTR(" deviceIRKData: ");
    if (!v8)
      v17 = &stru_1E3AB7688;
    v45 = v17;
    if (v8)
      v18 = v8;
    else
      v18 = &stru_1E3AB7688;
    v48 = v18;
    -[HMAccessory remoteLoginHandler](v11, "remoteLoginHandler", v43);
    v52 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    if (v19)
      v21 = CFSTR(" remoteLogin");
    else
      v21 = &stru_1E3AB7688;
    -[HMAccessory remoteLoginHandler](v11, "remoteLoginHandler");
    v22 = objc_claimAutoreleasedReturnValue();
    v51 = v10;
    v23 = (void *)v22;
    *(_DWORD *)buf = 138546434;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = &stru_1E3AB7688;
    v60 = v44;
    v61 = 2112;
    v62 = v11;
    v63 = 2112;
    v64 = v6;
    v65 = 2112;
    v66 = v47;
    v67 = 2112;
    v68 = v50;
    v69 = 2112;
    v70 = v46;
    v71 = 2112;
    v72 = v49;
    v73 = 2112;
    v74 = v45;
    v75 = 2112;
    v76 = v48;
    v77 = 2112;
    v78 = v21;
    v7 = v20;
    v79 = 2112;
    v80 = v24;
    v81 = 2112;
    v82 = v20;
    v83 = 2048;
    v84 = v20;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory: %@ context: %@%@%@%@%@%@%@%@%@ home: %@, %p", buf, 0x84u);

    v10 = v51;
    v8 = v52;

  }
  objc_autoreleasePoolPop(v10);
  -[HMAccessory setContext:](v11, "setContext:", v6);
  -[HMAccessory setHome:](v11, "setHome:", v7);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[HMAccessory services](v11, "services");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v55 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "__configureWithContext:accessory:", v6, v11);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v27);
  }

  -[HMAccessory _configureProfilesWithContext:](v11, "_configureProfilesWithContext:", v6);
  -[HMAccessory settings](v11, "settings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_configureWithContext:", v6);

  -[HMAccessory softwareUpdateController](v11, "softwareUpdateController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "configureWithContext:accessory:", v6, v11);

  -[HMAccessory remoteLoginHandler](v11, "remoteLoginHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_configureWithContext:accessory:", v6, v11);

  if (-[HMAccessory hasSymptomsHandler](v11, "hasSymptomsHandler"))
    -[HMAccessory _createSymptomsHandler](v11, "_createSymptomsHandler");
  -[HMAccessory audioDestinationController](v11, "audioDestinationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "configureWithContext:dataSource:", v6, v11);

  v34 = v11;
  -[HMAccessory context](v34, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "messageDispatcher");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v36)
    {
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kAccessoryNameChangedNotificationKey"), v34, sel__handleRenamed_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMA.pairingStateChanged"), v34, sel__handlePairingStateChanged_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kCharacteristicValueUpdatedNotificationKey"), v34, sel__handleCharacteristicValueUpdated_);
      if ((_os_feature_enabled_impl() & 1) == 0)
        objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kCharacteristicsUpdatedNotificationKey"), v34, sel__handleCharacteristicsUpdated_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kAccessoryNotificationsUpdatedNotificationKey"), v34, sel__handleAccessoryNotificationsUpdated_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kAccessoryFlagsChangedNotificationKey"), v34, sel__handleAccessoryFlagsChanged_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kServiceRenamedNotificationKey"), v34, sel__handleServiceRenamed_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kServiceDefaultNameUpdatedNotificationKey"), v34, sel__handleServiceDefaultNameUpdate_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kServiceSubtypeUpdatedNotificationKey"), v34, sel__handleServiceSubtype_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("kServiceConfigurationStateUpdatedNotificationKey"), v34, sel__handleServiceConfigurationState_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HM.acu"), v34, sel__handleAccessoryControllableChanged_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HM.us"), v34, sel__handleRootSettingsUpdated_);
      -[HMAccessory remoteLoginHandler](v34, "remoteLoginHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "registerForMessages");

      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMCT.capabilities"), v34, sel__handleTargetControlSupportUpdatedMessage_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("supportsMultiUser"), v34, sel__handleMultiUserSupportUpdatedMessage_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMAccessorySupportsCompanionInitiatedRestartMessageKey"), v34, sel__handleSupportsCompanionInitiatedRestartUpdatedMessage_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMAccessorySupportsCompanionInitiatedObliterateMessageKey"), v34, sel__handleSupportsCompanionInitiatedObliterateUpdatedMessage_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMServiceMediaSourceIdentifierUpdatedNotification"), v34, sel__handleServiceMediaSourceIdentifierUpdated_);
      objc_msgSend(v36, "registerForMessage:receiver:selector:", CFSTR("HMAccessoryPairingIdentityUpdatedNotification"), v34, sel__handlePairingIdentityUpdate_);
      v38 = CFSTR("HMA.requiresThreadRouterUpdateMessage");
      v39 = &selRef__handleRequiresThreadRouterUpdateMessage_;
      if ((_os_feature_enabled_impl() & 1) == 0)
        goto LABEL_43;
      v40 = CFSTR("HMA.diagnosticsTransferUpdate");
      v41 = &selRef__handleSupportsDiagnosticsTransferUpdateMessage_;
LABEL_42:
      objc_msgSend(v36, "registerForMessage:receiver:selector:", v40, v34, *v41);
LABEL_43:
      objc_msgSend(v36, "registerForMessage:receiver:selector:", v38, v34, *v39);
    }
  }
  else if (v36)
  {
    v38 = CFSTR("kAccessoryNameChangedNotificationKey");
    v39 = &selRef__handleRenamed_;
    v40 = CFSTR("kAccessoryCategoryChangedNotificationKey");
    v41 = &selRef__handleAccessoryCategoryChanged_;
    goto LABEL_42;
  }

  -[HMAccessory audioAnalysisEventBulletinBoardNotification](v34, "audioAnalysisEventBulletinBoardNotification");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "__configureWithContext:", v6);

}

- (id)softwareUpdateController
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdateController *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_softwareUpdateController;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMRemoteLoginHandler)remoteLoginHandler
{
  os_unfair_lock_s *p_lock;
  HMRemoteLoginHandler *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_remoteLoginHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMAccessorySettings)settings
{
  os_unfair_lock_s *p_lock;
  HMAccessorySettings *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (HMAccessory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMAccessory *v6;
  void *v7;
  uint64_t v8;
  HMAccessoryCategory *category;
  void *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *configuredName;
  uint64_t v15;
  NSString *deviceIdentifier;
  uint64_t v17;
  NSString *pendingConfigurationIdentifier;
  uint64_t v19;
  NSString *manufacturer;
  uint64_t v21;
  NSString *model;
  int v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *firmwareVersion;
  uint64_t v27;
  NSString *serialNumber;
  uint64_t v29;
  NSString *bundleID;
  uint64_t v31;
  NSString *storeID;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  HMAccessory *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *controlTargetUUIDs;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSArray *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  NSArray *uniqueIdentifiersForBridgedAccessories;
  HMApplicationData *v61;
  HMApplicationData *applicationData;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  HMAccessorySettingGroup *v87;
  HMAccessorySettings *v88;
  HMAccessorySettings *settings;
  uint64_t v90;
  HMDevice *device;
  uint64_t v92;
  NSData *deviceIRKData;
  uint64_t v94;
  HMFSoftwareVersion *softwareVersion;
  uint64_t v96;
  NSUUID *accountIdentifier;
  HMSoftwareUpdateController *v98;
  HMSoftwareUpdateController *softwareUpdateController;
  void *v100;
  uint64_t v101;
  HMRemoteLoginHandler *remoteLoginHandler;
  uint64_t v103;
  NSData *rootPublicKey;
  uint64_t v105;
  NSNumber *nodeID;
  uint64_t v107;
  NSUUID *commissioningID;
  uint64_t v109;
  NSNumber *vendorID;
  uint64_t v111;
  NSNumber *productID;
  uint64_t v113;
  NSNumber *matterNodeID;
  uint64_t v115;
  HMFWiFiNetworkInfo *wifiNetworkInfo;
  void *v117;
  uint64_t v118;
  NSUUID *networkProtectionGroupUUID;
  void *v120;
  HMMediaDestinationController *v121;
  HMMediaDestinationController *audioDestinationController;
  uint64_t v123;
  HMMediaDestination *audioDestination;
  void *v125;
  void *v126;
  int v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  HMAudioAnalysisEventBulletinBoardNotification *v135;
  HMAudioAnalysisEventBulletinBoardNotification *audioAnalysisEventBulletinBoardNotification;
  uint64_t v137;
  NSData *readerGroupSubIdentifierACWG;
  uint64_t v139;
  NSData *readerIDACWG;
  uint64_t v141;
  NSNumber *weekDaySchedulesPerUserCapacity;
  uint64_t v143;
  NSNumber *yearDaySchedulesPerUserCapacity;
  int v145;
  uint64_t v146;
  NSUUID *preferredMediaUserUUID;
  void *v148;
  uint64_t v149;
  HMSupportedAccessoryDiagnostics *supportedDiagnostics;
  void *v151;
  void *v152;
  void *v153;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[2];
  _QWORD v165[2];
  _BYTE v166[128];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  uint8_t buf[4];
  void *v171;
  __int16 v172;
  uint64_t v173;
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", CFSTR("accessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMAccessory initWithUUID:](self, "initWithUUID:", v5);
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_home, v7);

      objc_msgSend(v4, "hm_decodeHMAccessoryCategoryAndCacheForKey:", CFSTR("HM.accessoryCategory"));
      v8 = objc_claimAutoreleasedReturnValue();
      category = v6->_category;
      v6->_category = (HMAccessoryCategory *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryRoom"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_room, v10);

      v6->_bridgedAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBridged"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryName"));
      v11 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v11;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryConfiguredName"));
      v13 = objc_claimAutoreleasedReturnValue();
      configuredName = v6->_configuredName;
      v6->_configuredName = (NSString *)v13;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("accessoryServerIdentifier"));
      v15 = objc_claimAutoreleasedReturnValue();
      deviceIdentifier = v6->_deviceIdentifier;
      v6->_deviceIdentifier = (NSString *)v15;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.pendingConfigurationIdentifier"));
      v17 = objc_claimAutoreleasedReturnValue();
      pendingConfigurationIdentifier = v6->_pendingConfigurationIdentifier;
      v6->_pendingConfigurationIdentifier = (NSString *)v17;

      v6->_paired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paired"));
      v6->_reachable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reachable"));
      v6->_reachableTransports = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.reachability"));
      v6->_transportTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.accessoryTransportTypes"));
      v6->_supportsIdentify = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.supportsIdentify"));
      v6->_currentAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.currentAccessory"));
      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("HM.manufacturer"));
      v19 = objc_claimAutoreleasedReturnValue();
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v19;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("HM.model"));
      v21 = objc_claimAutoreleasedReturnValue();
      model = v6->_model;
      v6->_model = (NSString *)v21;

      v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsCHIP"));
      v6->_supportsCHIP = v23;
      if (v23)
        v24 = CFSTR("HM.displayableFirmwareVersion");
      else
        v24 = CFSTR("HM.firmwareVersion");
      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      firmwareVersion = v6->_firmwareVersion;
      v6->_firmwareVersion = (NSString *)v25;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.serialNumber"));
      v27 = objc_claimAutoreleasedReturnValue();
      serialNumber = v6->_serialNumber;
      v6->_serialNumber = (NSString *)v27;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("HM.bundleID"));
      v29 = objc_claimAutoreleasedReturnValue();
      bundleID = v6->_bundleID;
      v6->_bundleID = (NSString *)v29;

      objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("HM.storeID"));
      v31 = objc_claimAutoreleasedReturnValue();
      storeID = v6->_storeID;
      v6->_storeID = (NSString *)v31;

      v6->_firmwareUpdateAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.firmwareUpdateAvailable"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.accessoryReprovisionState")))
        v6->_accessoryReprovisionState = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("HM.accessoryReprovisionState"));
      v33 = (void *)MEMORY[0x1E0C99E60];
      v169[0] = objc_opt_class();
      v169[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setWithArray:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("services"));
      v36 = objc_claimAutoreleasedReturnValue();

      v159 = (void *)v36;
      -[HMMutableArray setArray:](v6->_currentServices, "setArray:", v36);
      v37 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suspendCapable"));
      v6->_suspendCapable = v37;
      if (v37)
        v6->_reachable = 1;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.suspendedState")))
        v6->_suspendedState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.suspendedState"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.certificationStatus")))
        v38 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.certificationStatus"));
      else
        v38 = 0;
      v6->_certificationStatus = v38;
      v43 = (void *)MEMORY[0x1E0C99E60];
      v168[0] = objc_opt_class();
      v168[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setWithArray:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("controlTargets"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v157 = v46;
      objc_msgSend(v46, "na_map:", &__block_literal_global_31468);
      v47 = objc_claimAutoreleasedReturnValue();
      controlTargetUUIDs = v6->_controlTargetUUIDs;
      v6->_controlTargetUUIDs = (NSArray *)v47;

      v6->_associationOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.associationOptions"));
      v49 = (void *)MEMORY[0x1E0C99E60];
      v167[0] = objc_opt_class();
      v167[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setWithArray:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("identifiersForBridgedAccessories"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v158 = v52;
      if (objc_msgSend(v52, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v160 = 0u;
        v161 = 0u;
        v162 = 0u;
        v163 = 0u;
        v54 = v52;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v160, v166, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v161;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v161 != v57)
                objc_enumerationMutation(v54);
              objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * i));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray addObject:](v53, "addObject:", v59);

            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v160, v166, 16);
          }
          while (v56);
        }

        uniqueIdentifiersForBridgedAccessories = v6->_uniqueIdentifiersForBridgedAccessories;
        v6->_uniqueIdentifiersForBridgedAccessories = v53;

      }
      v61 = -[HMApplicationData initWithDictionaryFromCoder:key:]([HMApplicationData alloc], "initWithDictionaryFromCoder:key:", v4, CFSTR("HM.appData"));
      applicationData = v6->_applicationData;
      v6->_applicationData = v61;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryFlagsCodingKey"));
      v63 = objc_claimAutoreleasedReturnValue();
      v156 = (void *)v63;
      if (v63)
      {
        objc_storeStrong((id *)&v6->_accessoryFlags, (id)v63);
        if ((-[NSNumber integerValue](v6->_accessoryFlags, "integerValue") & 1) != 0)
          v64 = 1;
        else
          v64 = 2;
        v6->_additionalSetupStatus = v64;
        if ((-[NSNumber integerValue](v6->_accessoryFlags, "integerValue") & 2) != 0)
          v63 = 1;
        else
          v63 = 2;
      }
      else
      {
        v6->_additionalSetupStatus = 0;
      }
      v6->_calibrationStatus = v63;
      v65 = (void *)MEMORY[0x1E0C99E60];
      v165[0] = objc_opt_class();
      v165[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setWithArray:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("HM.accessoryProfiles"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _cameraProfilesForAccessoryProfiles:](HMAccessory, "_cameraProfilesForAccessoryProfiles:", v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObjectsFromArray:", v70);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _mediaProfilesForAccessoryProfiles:](HMAccessory, "_mediaProfilesForAccessoryProfiles:", v68);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addObjectsFromArray:", v72);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v68);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _lightProfilesForAccessoryProfiles:](HMAccessory, "_lightProfilesForAccessoryProfiles:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "allObjects");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addObjectsFromArray:", v76);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _siriEndpointProfilesForAccessoryProfiles:](HMAccessory, "_siriEndpointProfilesForAccessoryProfiles:", v68);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addObjectsFromArray:", v78);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1)
        dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_103);
      +[HMAccessory televisionProfilesForAccessoryServices:isSPIEntitled:](HMAccessory, "televisionProfilesForAccessoryServices:isSPIEntitled:", v159, HMIsCurrentProcessSPIEntitled_spiEntitled);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "addObjectsFromArray:", v80);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory uniqueIdentifier](v6, "uniqueIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _networkConfigurationProfilesForCoder:accessoryIdentifier:](HMAccessory, "_networkConfigurationProfilesForCoder:accessoryIdentifier:", v4, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "addObjectsFromArray:", v83);

      -[HMAccessory accessoryProfiles](v6, "accessoryProfiles");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMAccessory _doorbellProfilesForAccessoryProfiles:](HMAccessory, "_doorbellProfilesForAccessoryProfiles:", v68);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addObjectsFromArray:", v85);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.settings"));
      v86 = objc_claimAutoreleasedReturnValue();
      if (v86)
      {
        v87 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", v86);
        v88 = -[HMAccessorySettings initWithSettingsContainer:settingsControl:rootGroup:]([HMAccessorySettings alloc], "initWithSettingsContainer:settingsControl:rootGroup:", v6, v6, v87);
        settings = v6->_settings;
        v6->_settings = v88;

      }
      v155 = (void *)v86;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.device"));
      v90 = objc_claimAutoreleasedReturnValue();
      device = v6->_device;
      v6->_device = (HMDevice *)v90;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.deviceIRK"));
      v92 = objc_claimAutoreleasedReturnValue();
      deviceIRKData = v6->_deviceIRKData;
      v6->_deviceIRKData = (NSData *)v92;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.softwareVersion"));
      v94 = objc_claimAutoreleasedReturnValue();
      softwareVersion = v6->_softwareVersion;
      v6->_softwareVersion = (HMFSoftwareVersion *)v94;

      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.accountIdentifier")))
      {
        objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", CFSTR("HM.accountIdentifier"));
        v96 = objc_claimAutoreleasedReturnValue();
        accountIdentifier = v6->_accountIdentifier;
        v6->_accountIdentifier = (NSUUID *)v96;

      }
      v6->_controllable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.controllable"));
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.softwareUpdate")))
      {
        v98 = -[HMSoftwareUpdateController initWithAccessory:]([HMSoftwareUpdateController alloc], "initWithAccessory:", v6);
        softwareUpdateController = v6->_softwareUpdateController;
        v6->_softwareUpdateController = v98;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.softwareUpdate"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (v100)
          -[HMSoftwareUpdateController setAvailableUpdate:](v6->_softwareUpdateController, "setAvailableUpdate:", v100);

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.remoteLoginHandler"));
      v101 = objc_claimAutoreleasedReturnValue();
      remoteLoginHandler = v6->_remoteLoginHandler;
      v6->_remoteLoginHandler = (HMRemoteLoginHandler *)v101;

      v6->_hasSymptomsHandler = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.hasSymptomsHandler"));
      v6->_supportsMediaAccessControl = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsMediaAccessControl"));
      v6->_knownToSystemCommissioner = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.knownToSystemCommissioner"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.rootPublicKey"));
      v103 = objc_claimAutoreleasedReturnValue();
      rootPublicKey = v6->_rootPublicKey;
      v6->_rootPublicKey = (NSData *)v103;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.nodeID"));
      v105 = objc_claimAutoreleasedReturnValue();
      nodeID = v6->_nodeID;
      v6->_nodeID = (NSNumber *)v105;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.commissioningID"));
      v107 = objc_claimAutoreleasedReturnValue();
      commissioningID = v6->_commissioningID;
      v6->_commissioningID = (NSUUID *)v107;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.vendorID"));
      v109 = objc_claimAutoreleasedReturnValue();
      vendorID = v6->_vendorID;
      v6->_vendorID = (NSNumber *)v109;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.productID"));
      v111 = objc_claimAutoreleasedReturnValue();
      productID = v6->_productID;
      v6->_productID = (NSNumber *)v111;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.matterNodeID"));
      v113 = objc_claimAutoreleasedReturnValue();
      matterNodeID = v6->_matterNodeID;
      v6->_matterNodeID = (NSNumber *)v113;

      v6->_requiresThreadRouter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.requiresThreadRouter"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.wifiNetworkInfo"));
      v115 = objc_claimAutoreleasedReturnValue();
      wifiNetworkInfo = v6->_wifiNetworkInfo;
      v6->_wifiNetworkInfo = (HMFWiFiNetworkInfo *)v115;

      v6->_supportsTargetControl = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCT.supportsTargetControl"));
      v6->_supportsTargetController = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCT.supportsTargetController"));
      v6->_targetControllerHardwareSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCT.targetControllerHardwareSupport"));
      v6->_supportsMultiUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsMultiUser"));
      v6->_supportsHomeLevelLocationServiceSetting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.HomeLevelLocationServiceSetting"));
      v6->_supportsAudioReturnChannel = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsAudioReturnChannel"));
      v6->_supportsCompanionInitiatedRestart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsCompanionInitiatedRestart"));
      v6->_supportsCompanionInitiatedObliterate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsCompanionInitiatedObliterate"));
      v6->_supportsMusicAlarm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsMusicAlarm"));
      v6->_supportsMediaContentProfile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.ac.mediacontentprofile"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.protectionGroupUID"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      if (v117)
      {
        v118 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v117);
        networkProtectionGroupUUID = v6->_networkProtectionGroupUUID;
        v6->_networkProtectionGroupUUID = (NSUUID *)v118;

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAudioDestinationControllerDataCodingKey"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      if (v120)
      {
        v121 = -[HMMediaDestinationController initWithControllerData:]([HMMediaDestinationController alloc], "initWithControllerData:", v120);
        audioDestinationController = v6->_audioDestinationController;
        v6->_audioDestinationController = v121;
      }
      else
      {
        audioDestinationController = v6->_audioDestinationController;
        v6->_audioDestinationController = 0;
      }

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryAudioDestinationCodingKey"));
      v123 = objc_claimAutoreleasedReturnValue();
      audioDestination = v6->_audioDestination;
      v6->_audioDestination = (HMMediaDestination *)v123;

      -[HMAccessory category](v6, "category");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "categoryType");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v126, "isEqual:", CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"));

      if (v127)
      {
        v128 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.audioAnalysisEventBulletinBoardNotificationEnabled"));
        v129 = (void *)MEMORY[0x1E0C99E60];
        v164[0] = objc_opt_class();
        v164[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 2);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setWithArray:", v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v131, CFSTR("HMA.audioAnalysisEventBulletinBoardNotificationCondition"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMAccessory home](v6, "home");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        v135 = -[HMAudioAnalysisEventBulletinBoardNotification initWithEnabled:condition:accessoryIdentifier:]([HMAudioAnalysisEventBulletinBoardNotification alloc], "initWithEnabled:condition:accessoryIdentifier:", v128, v134, v5);
        audioAnalysisEventBulletinBoardNotification = v6->_audioAnalysisEventBulletinBoardNotification;
        v6->_audioAnalysisEventBulletinBoardNotification = v135;

      }
      v6->_supportsAudioAnalysis = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsAudioAnalysis"));
      v6->_supportsDropIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsDropIn"));
      v6->_supportsAnnounce = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsAnnounce"));
      v6->_supportsMediaActions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsMediaActions"));
      v6->_supportsAccessCodes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMAccessorySupportsAccessCodeCodingKey"));
      v6->_supportsWalletKey = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMAccessorySupportsWalletCodingKey"));
      v6->_supportsUWBUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMAccessorySupportsUWBUnlockCodingKey"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryReaderGroupSubIdentifierACWGCodingKey"));
      v137 = objc_claimAutoreleasedReturnValue();
      readerGroupSubIdentifierACWG = v6->_readerGroupSubIdentifierACWG;
      v6->_readerGroupSubIdentifierACWG = (NSData *)v137;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryReaderIDACWGCodingKey"));
      v139 = objc_claimAutoreleasedReturnValue();
      readerIDACWG = v6->_readerIDACWG;
      v6->_readerIDACWG = (NSData *)v139;

      v6->_mfiCertifiedACWG = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMAccessoryMFiCertifiedACWGCodingKey"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryWeekDayScheduleCapacityCodingKey"));
      v141 = objc_claimAutoreleasedReturnValue();
      weekDaySchedulesPerUserCapacity = v6->_weekDaySchedulesPerUserCapacity;
      v6->_weekDaySchedulesPerUserCapacity = (NSNumber *)v141;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAccessoryYearDayScheduleCapacityCodingKey"));
      v143 = objc_claimAutoreleasedReturnValue();
      yearDaySchedulesPerUserCapacity = v6->_yearDaySchedulesPerUserCapacity;
      v6->_yearDaySchedulesPerUserCapacity = (NSNumber *)v143;

      v6->_supportsDoorbellChime = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsDoorbellChime"));
      v6->_supportsCoordinationDoorbellChime = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsCoordinationDoorbellChime"));
      v145 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsUserMediaSetting"));
      if (v145)
        LOBYTE(v145) = _os_feature_enabled_impl();
      v6->_supportsUserMediaSettings = v145;
      v6->_supportsThirdPartyMusic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.supportsThirdPartyMusic"));
      v6->_supportsPreferredMediaUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.ac.supportsPreferredMediaUser"));
      v6->_supportsMessagedHomePodSettings = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.HMAccessorySupportsMessagedHomePodSettingsCodingKey"));
      v6->_supportsPrimaryUserInfoSubscription = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.HMAccessorySupportsPrimaryUserInfoSubscriptionCodingKey"));
      if (!v6->_supportsMessagedHomePodSettings)
      {
        objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", CFSTR("HM.ac.preferredMediaUser"));
        v146 = objc_claimAutoreleasedReturnValue();
        preferredMediaUserUUID = v6->_preferredMediaUserUUID;
        v6->_preferredMediaUserUUID = (NSUUID *)v146;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.ac.preferredUserSelection"));
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_preferredUserSelectionType = objc_msgSend(v148, "unsignedIntegerValue");

      }
      if (_os_feature_enabled_impl())
      {
        v6->_supportsDiagnosticsTransfer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.diagnosticsTransferSupportCodingKey"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.supportedDiagnosticsCodingKey"));
        v149 = objc_claimAutoreleasedReturnValue();
        supportedDiagnostics = v6->_supportedDiagnostics;
        v6->_supportedDiagnostics = (HMSupportedAccessoryDiagnostics *)v149;

      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.supportedStereoPairVersionsCodingKey")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.supportedStereoPairVersionsCodingKey"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_supportedStereoPairVersions = objc_msgSend(v151, "unsignedIntegerValue");

      }
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.homePodVariantCodingKey")))
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.homePodVariantCodingKey"));
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_homePodVariant = objc_msgSend(v152, "unsignedIntegerValue");

      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.hasOnboardedForNaturalLightingKey"));
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_hasOnboardedForNaturalLighting = objc_msgSend(v153, "BOOLValue");
      v6->_supportsManagedConfigurationProfile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.ManagedConfigurationProfileCodingKey"));
      v6->_productColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.productColor"));
      v6->_supportsSoftwareUpdateV2 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMA.SupportsSoftwareUpdateV2CodingKey"));
      v6->_supportsRMVonAppleTV = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.ac.supportsRMVonAppleTV"));
      v6->_supportsJustSiri = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.ac.supportsJustSiri"));

    }
    self = v6;
    v42 = self;
  }
  else
  {
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v171 = v41;
      v172 = 2112;
      v173 = 0;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v39);
    v42 = 0;
  }

  return v42;
}

- (void)_handleAccessoryNotificationsUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  HMAccessory *v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = self;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v4;
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("kModifiedNotificationsForAccessoryKey"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v8 = 0;
  if (v34)
  {
    v32 = *(_QWORD *)v53;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v53 != v32)
          objc_enumerationMutation(obj);
        v36 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v9);
        -[HMAccessory home](v33, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
        objc_msgSend(v11, "accessoryWithUUID:", v12);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(obj, "hmf_dictionaryForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v39 = v13;
        v38 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v38)
        {
          v37 = *(_QWORD *)v49;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v49 != v37)
                objc_enumerationMutation(v39);
              v40 = v14;
              v43 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v14);
              objc_msgSend(v39, "hmf_dictionaryForKey:");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v45;
                do
                {
                  for (i = 0; i != v17; ++i)
                  {
                    if (*(_QWORD *)v45 != v18)
                      objc_enumerationMutation(v15);
                    v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                    objc_msgSend(v42, "_findCharacteristic:forService:", v20, v43);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "hmf_dictionaryForKey:", v20);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = v23;
                    if (v23)
                    {
                      v25 = v8;
                      v8 = v23;
                    }
                    else
                    {
                      v26 = v8;
                      v27 = objc_msgSend(v22, "hmf_BOOLForKey:", CFSTR("kCharacteristicNotificationEnableKey"));
                      objc_msgSend(v22, "hmf_dateForKey:", CFSTR("kCharacteristicNotificationEnableTime"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "setNotificationEnabled:", v27);
                      if (v25)
                        objc_msgSend(v21, "setNotificationEnabledTime:", v25);
                      if (v41)
                        objc_msgSend(v21, "setNotificationEnabledByThisClient:", v27);
                      v8 = v26;
                    }

                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
                }
                while (v17);
              }

              v14 = v40 + 1;
            }
            while (v40 + 1 != v38);
            v38 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          }
          while (v38);
        }

        v9 = v36 + 1;
      }
      while (v36 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v34);
  }
  if (v41)
  {
    -[HMAccessory context](v33, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegateCaller");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "callCompletion:error:", v41, v8);

  }
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMAccessory context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 584, 1);
}

- (HMAccessory)initWithUUID:(id)a3
{
  id v5;
  HMAccessory *v6;
  HMAccessory *v7;
  uint64_t v8;
  HMMutableArray *currentServices;
  uint64_t v10;
  HMMutableArray *accessoryProfiles;
  NSArray *controlTargetUUIDs;
  HMApplicationData *v13;
  HMApplicationData *applicationData;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAccessory;
  v6 = -[HMAccessory init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    +[HMMutableArray array](HMMutableArray, "array");
    v8 = objc_claimAutoreleasedReturnValue();
    currentServices = v7->_currentServices;
    v7->_currentServices = (HMMutableArray *)v8;

    +[HMMutableArray array](HMMutableArray, "array");
    v10 = objc_claimAutoreleasedReturnValue();
    accessoryProfiles = v7->_accessoryProfiles;
    v7->_accessoryProfiles = (HMMutableArray *)v10;

    controlTargetUUIDs = v7->_controlTargetUUIDs;
    v7->_controlTargetUUIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    v13 = objc_alloc_init(HMApplicationData);
    applicationData = v7->_applicationData;
    v7->_applicationData = v13;

    v7->_additionalSetupStatus = 0;
    v7->_calibrationStatus = 0;
  }

  return v7;
}

- (BOOL)hasSymptomsHandler
{
  return self->_hasSymptomsHandler;
}

- (HMDevice)device
{
  os_unfair_lock_s *p_lock;
  HMDevice *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_device;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)deviceIRKData
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMMediaDestination)audioDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 600, 1);
}

- (HMMediaDestinationController)audioDestinationController
{
  return (HMMediaDestinationController *)objc_getProperty(self, a2, 592, 1);
}

- (HMAudioAnalysisEventBulletinBoardNotification)audioAnalysisEventBulletinBoardNotification
{
  os_unfair_lock_s *p_lock;
  HMAudioAnalysisEventBulletinBoardNotification *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_audioAnalysisEventBulletinBoardNotification;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_configureProfilesWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "accessoryProfile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "__configureWithContext:accessory:", v4, self);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (id)_siriEndpointProfilesForAccessoryProfiles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  HMSiriEndpointProfile *v12;
  HMSiriEndpointProfile *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  HMSiriEndpointProfile *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          v12 = [HMSiriEndpointProfile alloc];
          v13 = -[HMSiriEndpointProfile initWithSiriEndpointProfile:](v12, "initWithSiriEndpointProfile:", v11, (_QWORD)v15);
          v19 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_15:

  return v7;
}

+ (id)_networkConfigurationProfilesForCoder:(id)a3 accessoryIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMNetworkConfigurationProfile *v17;
  void *v18;
  uint64_t v20;
  HMNetworkConfigurationProfile *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "decodeBoolForKey:", CFSTR("HMA.supportsNetworkProtection")))
    goto LABEL_4;
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("HMA.targetNetworkProtectionMode"));
  v8 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("HMA.currentNetworkProtectionMode"));
  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("HMA.networkRestricted"));
  v10 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("HMA.supportsWiFiReconfiguration"));
  v11 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("HMA.wifiCredentialType"));
  v12 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("HMA.allowedHosts"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMA.networkAccessViolation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = v10;
  v17 = -[HMNetworkConfigurationProfile initWithAccessoryIdentifier:targetProtection:currentProtection:networkAccessRestricted:allowedHosts:accessViolation:supportsWiFiReconfiguration:credentialType:]([HMNetworkConfigurationProfile alloc], "initWithAccessoryIdentifier:targetProtection:currentProtection:networkAccessRestricted:allowedHosts:accessViolation:supportsWiFiReconfiguration:credentialType:", v6, v7, v8, v9, v15, v16, v20, v11);

  if (v17)
  {
    v21 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (id)_mediaProfilesForAccessoryProfiles:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  HMMediaProfile *v12;
  HMMediaProfile *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  HMMediaProfile *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
        {
          v12 = [HMMediaProfile alloc];
          v13 = -[HMMediaProfile initWithMediaProfile:](v12, "initWithMediaProfile:", v11, (_QWORD)v15);
          v19 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_15:

  return v7;
}

+ (id)_doorbellProfilesForAccessoryProfiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  HMDoorbellChimeProfile *v13;
  HMDoorbellChimeProfile *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {
          v13 = [HMDoorbellChimeProfile alloc];
          v14 = -[HMDoorbellChimeProfile initWithDoorbellChimeProfile:](v13, "initWithDoorbellChimeProfile:", v12, (_QWORD)v17);
          objc_msgSend(v4, "addObject:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (id)_cameraProfilesForAccessoryProfiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  HMCameraProfile *v13;
  HMCameraProfile *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {
          v13 = [HMCameraProfile alloc];
          v14 = -[HMCameraProfile initWithCameraProfile:](v13, "initWithCameraProfile:", v12, (_QWORD)v17);
          objc_msgSend(v4, "addObject:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMSymptomsHandler)symptomsHandler
{
  os_unfair_lock_s *p_lock;
  HMSymptomsHandler *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_symptomsHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsAccessCodes
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAccessCodes;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSNumber)matterNodeID
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_matterNodeID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)deviceIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deviceIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)configuredName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)pendingConfigurationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_pendingConfigurationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

uint64_t __58__HMAccessory_handleRuntimeStateUpdate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_handleConnectivityChanged:", *(_QWORD *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "profiles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "handleRuntimeStateUpdate:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[12];

  v42[10] = *MEMORY[0x1E0C80C00];
  -[HMAccessory room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory name](self, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Name"), v41);
  v42[0] = v40;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Identifier"), v39);
  v42[1] = v38;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory isReachable](self, "isReachable");
  HMFBooleanToString();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Reachable"), v36);
  v42[2] = v35;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v37 = v3;
  objc_msgSend(v3, "uuid");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v34, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("room"), v32);
  v42[3] = v31;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory isControllable](self, "isControllable");
  HMFBooleanToString();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Controllable"), v30);
  v42[4] = v29;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessory transportTypes](self, "transportTypes"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("TransportTypes"), v28);
  v42[5] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory supportsCHIP](self, "supportsCHIP");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Supports CHIP"), v13);
  v42[6] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory knownToSystemCommissioner](self, "knownToSystemCommissioner");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("KTSC"), v16);
  v42[7] = v17;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[HMAccessory rootPublicKey](self, "rootPublicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Root Public Key (HASH)"), v21);
  v42[8] = v22;
  v23 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessory nodeID](self, "nodeID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("NodeID"), v24);
  v42[9] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 10);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v27;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)transportTypes
{
  return self->_transportTypes;
}

- (void)_handleConnectivityChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  HMAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  HMAccessory *v34;
  _QWORD v35[4];
  id v36;
  HMAccessory *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kAccessoryIsReachableKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (v7 = objc_msgSend(v5, "BOOLValue"),
        v8 = -[HMAccessory suspendCapable](self, "suspendCapable") | v7,
        (_DWORD)v8 == -[HMAccessory isReachable](self, "isReachable")))
  {
    v15 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory isReachable](v10, "isReachable");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v12;
      v40 = 2112;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating isReachable from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMAccessory setReachable:](v10, "setReachable:", v8);
    v15 = 1;
  }
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HM.suspendedState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16
    && (v18 = objc_msgSend(v16, "unsignedIntegerValue"), v18 != -[HMAccessory suspendedState](self, "suspendedState")))
  {
    -[HMAccessory setSuspendedState:](self, "setSuspendedState:", v18);
  }
  else if (!v15)
  {
    goto LABEL_15;
  }
  -[HMAccessory delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegateCaller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __42__HMAccessory__handleConnectivityChanged___block_invoke;
    v35[3] = &unk_1E3AB5ED8;
    v36 = v19;
    v37 = self;
    objc_msgSend(v21, "invokeBlock:", v35);

  }
LABEL_15:
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("controllable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = objc_msgSend(v22, "BOOLValue");
    if ((_DWORD)v24 != -[HMAccessory isControllable](self, "isControllable"))
    {
      -[HMAccessory setControllable:](self, "setControllable:", v24);
      -[HMAccessory _notifyDelegatesOfUpdatedControllable](self, "_notifyDelegatesOfUpdatedControllable");
    }
  }
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HM.accessoryReachableTransports"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = -[HMAccessory reachableTransports](self, "reachableTransports");
    if (v26 != objc_msgSend(v25, "integerValue"))
    {
      -[HMAccessory setReachableTransports:](self, "setReachableTransports:", objc_msgSend(v25, "integerValue"));
      -[HMAccessory delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "conformsToProtocol:", &unk_1EE45A8F8))
        v28 = v27;
      else
        v28 = 0;
      v29 = v28;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMAccessory context](self, "context");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "delegateCaller");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __42__HMAccessory__handleConnectivityChanged___block_invoke_2;
        v32[3] = &unk_1E3AB5ED8;
        v33 = v29;
        v34 = self;
        objc_msgSend(v31, "invokeBlock:", v32);

      }
    }
  }

}

- (BOOL)isReachable
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)reachableTransports
{
  return self->_reachableTransports;
}

- (BOOL)suspendCapable
{
  return self->_suspendCapable;
}

- (BOOL)supportsCHIP
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCHIP;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSData)rootPublicKey
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rootPublicKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)nodeID
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_nodeID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)knownToSystemCommissioner
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_knownToSystemCommissioner;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isControllable
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_controllable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMRoom)room
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_room);
  os_unfair_lock_unlock(p_lock);
  return (HMRoom *)WeakRetained;
}

+ (id)_lightProfilesForAccessoryProfiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  HMLightProfile *v13;
  HMLightProfile *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {
          v13 = [HMLightProfile alloc];
          v14 = -[HMLightProfile initWithLightProfile:](v13, "initWithLightProfile:", v12, (_QWORD)v17);
          objc_msgSend(v4, "addObject:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)_handleMultipleCharacteristicsUpdated:(id)a3 message:(id)a4 informDelegate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMCharacteristicRequest *v22;
  HMCharacteristicResponse *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMAccessory *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMAccessory *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  HMAccessory *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  id v58;
  HMAccessory *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v5 = a5;
  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = a4;
  -[HMAccessory delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v9;
  v47 = v5 && v9 && (objc_opt_respondsToSelector() & 1) != 0;
  +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v53, "setNumberStyle:", 1);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v8;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v67;
    v49 = self;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v53, "numberFromString:", v11);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessory _findService:](self, "_findService:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v40 = i;
          objc_msgSend(obj, "hmf_dictionaryForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v56 = v12;
          v55 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (v55)
          {
            v52 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v55; ++j)
              {
                if (*(_QWORD *)v63 != v52)
                  objc_enumerationMutation(v56);
                v14 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v53, "numberFromString:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMAccessory _findCharacteristic:forService:](self, "_findCharacteristic:forService:", v15, v54);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  objc_msgSend(v56, "hmf_dictionaryForKey:", v14);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "isEqual:", v19);

                  if (v20)
                  {

                    v18 = 0;
                  }
                  objc_msgSend(v17, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = -[HMCharacteristicRequest initWithCharacteristic:]([HMCharacteristicRequest alloc], "initWithCharacteristic:", v16);
                  v23 = -[HMCharacteristicResponse initWithRequest:value:error:]([HMCharacteristicResponse alloc], "initWithRequest:value:error:", v22, v18, v21);
                  objc_msgSend(v51, "addObject:", v23);
                  if (!v21)
                  {
                    objc_msgSend(v16, "value");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "headers");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "hmf_dateForKey:", CFSTR("HMXPCMessageSentDateKey"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v16, "_updateValue:valueUpdatedDate:", v18, v25);
                    if (v47)
                    {
                      if (!HMFEqualObjects()
                        || (objc_msgSend(v16, "characteristicType"),
                            v26 = (void *)objc_claimAutoreleasedReturnValue(),
                            v45 = objc_msgSend(v41, "shouldNotCacheCharacteristicOfType:", v26),
                            v26,
                            v45))
                      {
                        -[HMAccessory context](v49, "context");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "delegateCaller");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        v57[0] = MEMORY[0x1E0C809B0];
                        v57[1] = 3221225472;
                        v57[2] = __76__HMAccessory__handleMultipleCharacteristicsUpdated_message_informDelegate___block_invoke;
                        v57[3] = &unk_1E3AB59E8;
                        v58 = v42;
                        v59 = v49;
                        v60 = v43;
                        v61 = v16;
                        objc_msgSend(v44, "invokeBlock:", v57);

                      }
                    }

                    self = v49;
                  }

                }
                else
                {
                  v27 = (void *)MEMORY[0x1A1AC1AAC]();
                  v28 = self;
                  HMFGetOSLogHandle();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    HMFGetLogIdentifier();
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v72 = v30;
                    v73 = 2112;
                    v74 = v15;
                    _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find characteristic for characteristic updated characteristic ID: %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v27);
                }

              }
              v55 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            }
            while (v55);
          }

          i = v40;
        }
        else
        {
          v31 = (void *)MEMORY[0x1A1AC1AAC]();
          v32 = self;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v72 = v34;
            v73 = 2112;
            v74 = v54;
            _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find service for characteristic updated service ID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v31);
        }

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v38);
  }

  v35 = (void *)objc_msgSend(v51, "copy");
  return v35;
}

- (BOOL)supportsIdentify
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsIdentify;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)certificationStatus
{
  os_unfair_lock_s *p_lock;
  int64_t certificationStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  certificationStatus = self->_certificationStatus;
  os_unfair_lock_unlock(p_lock);
  return certificationStatus;
}

- (id)siriEndpointProfile
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      v11 = v10;

      if (v11)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v9 = 0;
  }

  return v9;
}

- (BOOL)isCurrentAccessory
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t342 != -1)
    dispatch_once(&logCategory__hmf_once_t342, &__block_literal_global_1013);
  return (id)logCategory__hmf_once_v343;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleRuntimeStateUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMAccessory_handleRuntimeStateUpdate_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2080;
      v21 = "-[HMAccessory handleRuntimeStateUpdate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)postConfigure
{
  uint64_t v3;
  id v4;

  if (-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
  {
    -[HMAccessory configureSettingsAdapterIfNeeded](self, "configureSettingsAdapterIfNeeded");
    v3 = 5;
LABEL_5:
    -[HMAccessory configureInfoDataProviderIfNeededWithOption:](self, "configureInfoDataProviderIfNeededWithOption:", v3);
    goto LABEL_6;
  }
  if (-[HMAccessory supportsPrimaryUserInfoSubscription](self, "supportsPrimaryUserInfoSubscription"))
  {
    v3 = 4;
    goto LABEL_5;
  }
LABEL_6:
  -[HMAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postConfigure");

}

- (BOOL)supportsPrimaryUserInfoSubscription
{
  return self->_supportsPrimaryUserInfoSubscription;
}

- (BOOL)supportsMessagedHomePodSettings
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMessagedHomePodSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDelegate:(id)delegate
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

void __26__HMAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v343;
  logCategory__hmf_once_v343 = v0;

}

+ (id)televisionProfilesForAccessoryServices:(id)a3 isSPIEntitled:(BOOL)a4
{
  unint64_t v5;
  void *v6;

  sub_19B1EBBA0(0, &qword_1ED016490);
  v5 = sub_19B42907C();
  _sSo11HMAccessoryC7HomeKitE18televisionProfiles3for13isSPIEntitledSaySo0A7ProfileCGSaySo9HMServiceCG_SbtFZ_0(v5, a4);
  swift_bridgeObjectRelease();
  sub_19B1EBBA0(0, &qword_1ED016498);
  v6 = (void *)sub_19B429070();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)wakeSuspendedAccessoryWithWakeType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  char *v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HMAccessory *v38;
  NSObject *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  HMAccessory *v44;
  id v45;
  id v46;
  unint64_t v47;
  const __CFString *v48;
  void *v49;
  _BYTE buf[12];
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory(WoL) wakeSuspendedAccessoryWithWakeType:completion:]", CFSTR("completion"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1A1AC1AAC]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v40;
      v51 = 2112;
      v52 = (const char *)v36;
      _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v36, 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  v9 = (void *)v8;
  if (v8)
  {
    if (a3 < 2)
    {
      v48 = CFSTR("HMA.suspendedAccessoryWakeType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](self, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);

      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryWakeSuspendedAccessoryMessage"), v23, v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0D28540]);
      v26 = (void *)MEMORY[0x1E0CB3940];
      MEMORY[0x1A1AC1500](self, a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@, %s:%ld"), v27, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/PowerManagement/HMAccessory+WoL.m", 46);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v25, "initWithName:", v28);
      *(_QWORD *)buf = v29;

      v30 = v29;
      -[HMAccessory uuid](self, "uuid");

      -[HMAccessory category](self, "category");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "categoryType");

      v32 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessory suspendedState](self, "suspendedState"));
      -[HMAccessory isReachable](self, "isReachable");
      v33 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __66__HMAccessory_WoL__wakeSuspendedAccessoryWithWakeType_completion___block_invoke;
      v42[3] = &unk_1E3AAF580;
      v43 = *(id *)buf;
      v44 = self;
      v47 = a3;
      v34 = v9;
      v45 = v34;
      v46 = v7;
      objc_msgSend(v24, "setResponseHandler:", v42);
      objc_msgSend(v24, "setActivity:", *(_QWORD *)buf);
      objc_msgSend(v34, "messageDispatcher");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sendMessage:", v24);

      __HMFActivityScopeLeave();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        v51 = 2112;
        v52 = v15;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Waking suspended accessory with invalid type: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      v51 = 2080;
      v52 = "-[HMAccessory(WoL) wakeSuspendedAccessoryWithWakeType:completion:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

void __66__HMAccessory_WoL__wakeSuspendedAccessoryWithWakeType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v16 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");

  objc_msgSend(*(id *)(a1 + 40), "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryType");

  v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "suspendedState"));
  objc_msgSend(*(id *)(a1 + 40), "isReachable");
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "domain");

  objc_msgSend(v5, "code");
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive response to wake command with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

  __HMFActivityScopeLeave();
}

- (HMDoorbellChimeProfile)doorbellChimeProfile
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
        v12 = v11;

        if (v12)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return (HMDoorbellChimeProfile *)v10;
}

+ (unint64_t)networkRouterStatusFromRouterStatus:(int64_t)a3 wanStatusListData:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 1)
  {
    v7 = 0x20000000;
  }
  else
  {
    v33 = 0;
    +[HMNetworkRouterWANStatusList parsedFromData:error:](HMNetworkRouterWANStatusList, "parsedFromData:error:", v6, &v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    if (v8)
    {
      objc_msgSend(v8, "statuses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __84__HMAccessory_NetworkRouter__networkRouterStatusFromRouterStatus_wanStatusListData___block_invoke;
      v32[3] = &__block_descriptor_40_e41_B32__0__HMNetworkRouterWANStatus_8Q16_B24l;
      v32[4] = a1;
      objc_msgSend(v10, "hmf_objectPassingTest:", v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "status");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v7 = 0;
          if (objc_msgSend(v13, "unsignedIntegerValue"))
          {
            v14 = 1;
            do
            {
              if ((objc_msgSend(v13, "unsignedIntegerValue") & v14) != 0)
              {
                if (v14 > 31)
                {
                  v15 = v7 | 0x80;
                  v16 = v7 | 0x100;
                  if (v14 != 256)
                    v16 = v7;
                  if (v14 != 128)
                    v15 = v16;
                  v17 = v7 | 0x20;
                  v18 = v7 | 0x40;
                  if (v14 != 64)
                    v18 = v7;
                  if (v14 != 32)
                    v17 = v18;
                  if (v14 <= 127)
                    v7 = v17;
                  else
                    v7 = v15;
                }
                else
                {
                  switch(v14)
                  {
                    case 1:
                      v7 |= 1uLL;
                      break;
                    case 2:
                      v7 |= 2uLL;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 7:
                      break;
                    case 4:
                      v7 |= 4uLL;
                      break;
                    case 8:
                      v7 |= 8uLL;
                      break;
                    default:
                      if (v14 == 16)
                        v7 |= 0x10uLL;
                      break;
                  }
                }
              }
              v14 *= 2;
            }
            while (v14 - 1 < (unint64_t)objc_msgSend(v13, "unsignedIntegerValue"));
          }
        }
        else
        {
          v27 = (void *)MEMORY[0x1A1AC1AAC]();
          v28 = a1;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = v30;
            v36 = 2112;
            v37 = v11;
            _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine network router status because main WAN status TLV has a nil status value: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          v7 = 1;
        }

      }
      else
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = a1;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v26;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine network router status because main WAN status could not be found in WAN status list", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
        v7 = 1;
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        v36 = 2112;
        v37 = v6;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse WAN status list from data %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v7 = 1;
    }

  }
  return v7;
}

+ (unint64_t)networkRouterStatusFromWiFiSatelliteStatus:(int64_t)a3
{
  unint64_t v3;

  v3 = 0x40000000;
  if (a3 != 2)
    v3 = 1;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

BOOL __84__HMAccessory_NetworkRouter__networkRouterStatusFromRouterStatus_wanStatusListData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    v7 = v6 == HMNetworkRouterWANIdentifierMain;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = 0;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@WAN status TLV has a nil identifier value: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (HMAccessory)init
{
  void *v3;
  HMAccessory *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMAccessory initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (void)configureSettingsAdapterIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HMAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options");

  if ((v6 & 0x20) != 0)
  {
    -[HMAccessory settingsAdapter](self, "settingsAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543362;
        v37 = v11;
        v12 = "%{public}@Asked to create settings adaptor again";
        v13 = v10;
        v14 = OS_LOG_TYPE_INFO;
LABEL_16:
        _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v36, 0xCu);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
    -[HMAccessory context](self, "context");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_14;
    v16 = (void *)v15;
    -[HMAccessory context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "queue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_14:
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543362;
        v37 = v11;
        v12 = "%{public}@Context or context queue is nil";
        v13 = v10;
        v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_16;
      }
LABEL_17:

      objc_autoreleasePoolPop(v8);
      return;
    }
    -[HMAccessory settings](self, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v21 = (void *)MEMORY[0x1A1AC1AAC]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543362;
        v37 = v24;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all existing settings on update to support HPLS", (uint8_t *)&v36, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v20 = -[HMAccessory setSettings:](v22, "setSettings:", 0);
    }
    v25 = (void *)MEMORY[0x1A1AC1AAC](v20);
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543362;
      v37 = v28;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating adaptor on settings support", (uint8_t *)&v36, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    -[HMAccessory home](v26, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "homeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createAccessorySettingsDataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAccessorySettingsDataSource:](v26, "setAccessorySettingsDataSource:", v31);

    objc_msgSend(v30, "createAccessorySettingsController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAccessorySettingsController:](v26, "setAccessorySettingsController:", v32);

    -[HMAccessory accessorySettingsDataSource](v26, "accessorySettingsDataSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory accessorySettingsController](v26, "accessorySettingsController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory context](v26, "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory createSettingsAdapterWithDataSource:controller:context:](v26, "createSettingsAdapterWithDataSource:controller:context:", v33, v34, v35);

    -[HMAccessory configureSettingsAdapterWithCompletionHandler:](v26, "configureSettingsAdapterWithCompletionHandler:", 0);
  }
}

- (void)configureInfoDataProviderIfNeededWithOption:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessory home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory accessoryInfoDataProvider](self, "accessoryInfoDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v12;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to create info data provider again with option: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating info data provider with option: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "createAccessoryInfoDataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAccessoryInfoDataProvider:](v9, "setAccessoryInfoDataProvider:", v14);

  }
  -[HMAccessory accessoryInfoDataProvider](v9, "accessoryInfoDataProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory uniqueIdentifier](v9, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__HMAccessory_configureInfoDataProviderIfNeededWithOption___block_invoke;
  v18[3] = &unk_1E3AB5CA8;
  v18[4] = v9;
  objc_msgSend(v15, "configureWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:dataProviderDelegate:completionHandler:", v16, v17, a3, v9, v18);

}

- (void)unconfigureInfoDataProviderWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMAccessory accessoryInfoDataProvider](self, "accessoryInfoDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      v19 = 2048;
      v20 = a3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring info data provider with option: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMAccessory accessoryInfoDataProvider](v7, "accessoryInfoDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory home](v7, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory uniqueIdentifier](v7, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__HMAccessory_unconfigureInfoDataProviderWithOptions___block_invoke;
    v16[3] = &unk_1E3AB2C90;
    v16[4] = v7;
    v16[5] = a3;
    objc_msgSend(v11, "unsubscribeToAccessoryInfoWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:completionHandler:", v13, v14, a3, v16);

  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Ask to unconfigure nil info data provider", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[_HMContext messageDispatcher](self->_context, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (context)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring accessory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HMAccessory services](v5, "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13++), "_unconfigure");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }

    -[HMAccessory currentServices](v5, "currentServices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllObjects");

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[HMAccessory profiles](v5, "profiles", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "accessoryProfile");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_unconfigure");

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

    -[HMAccessory accessoryProfiles](v5, "accessoryProfiles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllObjects");

    -[HMAccessory settingsAdapter](v5, "settingsAdapter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unconfigure");

    -[HMAccessory unconfigureInfoDataProviderWithOptions:](v5, "unconfigureInfoDataProviderWithOptions:", 5);
    -[HMAccessory _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)updateShouldProcessTransactionRemovalWithValue:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMAccessory *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update should process tranaction removal value: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMAccessory context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](v8, "messageTargetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);

    v17 = objc_alloc(MEMORY[0x1E0D285F8]);
    v27 = CFSTR("HMAccessoryUpdateShouldProcessTransactionRemovalValuePayloadKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithName:destination:payload:", CFSTR("HMAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage"), v16, v19);

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __73__HMAccessory_updateShouldProcessTransactionRemovalWithValue_completion___block_invoke;
    v25[3] = &unk_1E3AB3A50;
    v26 = v6;
    objc_msgSend(v20, "setResponseHandler:", v25);
    objc_msgSend(v13, "sendMessage:", v20);

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v24;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update should process removal value due to no message dispatcher", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v16);
  }

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfiguredName:(id)a3
{
  NSString *v4;
  NSString *configuredName;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDeviceIdentifier:(id)a3
{
  NSString *v4;
  NSString *deviceIdentifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCurrentAccessory:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentAccessory = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setReachable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setBridgedAccessory:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_bridgedAccessory = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setUniqueIdentifiersForBridgedAccessories:(id)a3
{
  NSArray *v4;
  NSArray *uniqueIdentifiersForBridgedAccessories;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  uniqueIdentifiersForBridgedAccessories = self->_uniqueIdentifiersForBridgedAccessories;
  self->_uniqueIdentifiersForBridgedAccessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)bridgedAccessories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HMAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory uniqueIdentifiersForBridgedAccessories](self, "uniqueIdentifiersForBridgedAccessories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v3;
  objc_msgSend(v3, "accessories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = v21;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
              objc_msgSend(v8, "uniqueIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v14) = objc_msgSend(v14, "isEqual:", v15);

              if ((_DWORD)v14)
                objc_msgSend(v4, "addObject:", v8);
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v16;
}

- (void)setCategory:(id)a3
{
  HMAccessoryCategory *v4;
  HMAccessoryCategory *category;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:](HMFObjectCacheHMAccessoryCategory, "cachedInstanceForHMAccessoryCategory:", v6);
  v4 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRoom:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_room, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)accountIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accountIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccountIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *accountIdentifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFirmwareVersion:(id)a3
{
  NSString *v4;
  NSString *firmwareVersion;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSerialNumber:(id)a3
{
  NSString *v4;
  NSString *serialNumber;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  serialNumber = self->_serialNumber;
  self->_serialNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)supportsMediaAccessControl
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMediaAccessControl;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMediaAccessControl:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMediaAccessControl = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsCHIP:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCHIP = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setKnownToSystemCommissioner:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_knownToSystemCommissioner = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRootPublicKey:(id)a3
{
  NSData *v4;
  NSData *rootPublicKey;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSData *)objc_msgSend(v6, "copy");
  rootPublicKey = self->_rootPublicKey;
  self->_rootPublicKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNodeID:(id)a3
{
  NSNumber *v4;
  NSNumber *nodeID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  nodeID = self->_nodeID;
  self->_nodeID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)commissioningID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_commissioningID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCommissioningID:(id)a3
{
  NSUUID *v4;
  NSUUID *commissioningID;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  commissioningID = self->_commissioningID;
  self->_commissioningID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)vendorID
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_vendorID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setVendorID:(id)a3
{
  NSNumber *v4;
  NSNumber *vendorID;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  vendorID = self->_vendorID;
  self->_vendorID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)productID
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_productID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setProductID:(id)a3
{
  NSNumber *v4;
  NSNumber *productID;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  productID = self->_productID;
  self->_productID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)requiresThreadRouter
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_requiresThreadRouter;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRequiresThreadRouter:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_requiresThreadRouter = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleRequiresThreadRouterUpdateMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HMA.requiresThreadRouterUpdate"));
  if ((_DWORD)v5 != -[HMAccessory requiresThreadRouter](self, "requiresThreadRouter"))
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsDiagnosticsTransfer](v7, "supportsDiagnosticsTransfer");
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating requiresThreadRouter from %@ to %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMAccessory setRequiresThreadRouter:](v7, "setRequiresThreadRouter:", v5);
  }

}

- (HMFWiFiNetworkInfo)wifiNetworkInfo
{
  os_unfair_lock_s *p_lock;
  HMFWiFiNetworkInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_wifiNetworkInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsTargetControl
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsTargetControl;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsTargetControl:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsTargetControl = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsTargetController
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsTargetController;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsTargetController:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsTargetController = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)targetControllerHardwareSupport
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_targetControllerHardwareSupport;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setTargetControllerHardwareSupport:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_targetControllerHardwareSupport = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMultiUser
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMultiUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMultiUser:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMultiUser = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsAudioReturnChannel
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAudioReturnChannel;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsAudioReturnChannel:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAudioReturnChannel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsCompanionInitiatedRestart
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCompanionInitiatedRestart;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCompanionInitiatedRestart:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCompanionInitiatedRestart = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCompanionInitiatedObliterate;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCompanionInitiatedObliterate:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCompanionInitiatedObliterate = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMusicAlarm
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMusicAlarm;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMusicAlarm:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMusicAlarm = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsAnnounce
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAnnounce;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsAnnounce:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAnnounce = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMediaActions
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMediaActions;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMediaActions:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMediaActions = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsDoorbellChime
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDoorbellChime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsDoorbellChime:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDoorbellChime = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsUserMediaSettings
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsUserMediaSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsUserMediaSettings:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsUserMediaSettings = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsAccessCodes:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAccessCodes = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsWalletKey:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsWalletKey = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsUWBUnlock
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsUWBUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsUWBUnlock:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsUWBUnlock = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSData)readerGroupSubIdentifierACWG
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_readerGroupSubIdentifierACWG;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReaderGroupSubIdentifierACWG:(id)a3
{
  NSData *v4;
  NSData *readerGroupSubIdentifierACWG;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  readerGroupSubIdentifierACWG = self->_readerGroupSubIdentifierACWG;
  self->_readerGroupSubIdentifierACWG = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)readerIDACWG
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_readerIDACWG;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReaderIDACWG:(id)a3
{
  NSData *v4;
  NSData *readerIDACWG;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  readerIDACWG = self->_readerIDACWG;
  self->_readerIDACWG = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setWeekDaySchedulesPerUserCapacity:(id)a3
{
  NSNumber *v4;
  NSNumber *weekDaySchedulesPerUserCapacity;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  weekDaySchedulesPerUserCapacity = self->_weekDaySchedulesPerUserCapacity;
  self->_weekDaySchedulesPerUserCapacity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setYearDaySchedulesPerUserCapacity:(id)a3
{
  NSNumber *v4;
  NSNumber *yearDaySchedulesPerUserCapacity;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  yearDaySchedulesPerUserCapacity = self->_yearDaySchedulesPerUserCapacity;
  self->_yearDaySchedulesPerUserCapacity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)supportsCoordinationDoorbellChime
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCoordinationDoorbellChime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCoordinationDoorbellChime:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCoordinationDoorbellChime = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsThirdPartyMusic
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsThirdPartyMusic;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsThirdPartyMusic:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsThirdPartyMusic = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsPreferredMediaUser
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsPreferredMediaUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsPreferredMediaUser:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsPreferredMediaUser = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsManagedConfigurationProfile
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsManagedConfigurationProfile;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsManagedConfigurationProfile:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsManagedConfigurationProfile = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsAudioAnalysis:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAudioAnalysis = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsDropIn
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDropIn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsDropIn:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDropIn = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsMessagedHomePodSettings:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMessagedHomePodSettings = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsSoftwareUpdateV2:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsSoftwareUpdateV2 = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsRMVonAppleTV
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsRMVonAppleTV;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsRMVonAppleTV:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsRMVonAppleTV = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsJustSiri
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsJustSiri;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsJustSiri = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)controlTargetUUIDs
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_controlTargetUUIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setControlTargetUUIDs:(id)a3
{
  NSArray *v4;
  NSArray *controlTargetUUIDs;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  controlTargetUUIDs = self->_controlTargetUUIDs;
  self->_controlTargetUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)controlTargets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  void *v22;
  HMAccessory *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  -[HMAccessory controlTargetUUIDs](self, "controlTargetUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 138543618;
    v21 = v7;
    v22 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v3, "accessoryWithUUID:", v11, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          v13 = v9;
          v14 = (void *)MEMORY[0x1A1AC1AAC]();
          v15 = v23;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "UUIDString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v30 = v17;
            v31 = 2112;
            v32 = v18;
            _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unable to look up target accessory UUID for %@", buf, 0x16u);

            v5 = v22;
          }

          objc_autoreleasePoolPop(v14);
          v9 = v13;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

  v19 = (void *)objc_msgSend(v5, "copy");
  return v19;
}

- (id)targetControllers
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HMAccessory home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v26 = *(_QWORD *)v34;
    v27 = v4;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        -[HMAccessory uuid](self, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0
          && (objc_msgSend(v9, "supportsTargetControl") & 1) == 0
          && objc_msgSend(v9, "supportsTargetController"))
        {
          objc_msgSend(v9, "controlTargets");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v30 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "uuid");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMAccessory uuid](self, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v21)
                {
                  objc_msgSend(v25, "addObject:", v9);
                  goto LABEL_19;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_19:

          v7 = v26;
          v4 = v27;
          v6 = v28;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }

  v22 = (void *)objc_msgSend(v25, "copy");
  return v22;
}

- (void)setWifiNetworkInfo:(id)a3
{
  HMFWiFiNetworkInfo *v4;
  HMFWiFiNetworkInfo *wifiNetworkInfo;

  v4 = (HMFWiFiNetworkInfo *)a3;
  os_unfair_lock_lock_with_options();
  wifiNetworkInfo = self->_wifiNetworkInfo;
  self->_wifiNetworkInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportedStereoPairVersions = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)supportedStereoPairVersions
{
  os_unfair_lock_s *p_lock;
  unint64_t supportedStereoPairVersions;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  supportedStereoPairVersions = self->_supportedStereoPairVersions;
  os_unfair_lock_unlock(p_lock);
  return supportedStereoPairVersions;
}

- (void)setHomePodVariant:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_homePodVariant = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)homePodVariant
{
  os_unfair_lock_s *p_lock;
  unint64_t homePodVariant;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  homePodVariant = self->_homePodVariant;
  os_unfair_lock_unlock(p_lock);
  return homePodVariant;
}

- (void)_recomputeAssistantIdentifier
{
  NSString *v3;
  NSString *assistantIdentifier;

  hm_assistantIdentifierWithSalts(CFSTR("AC"), (uint64_t)self->_uuid, 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

}

- (NSString)assistantIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *assistantIdentifier;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    -[HMAccessory _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
    assistantIdentifier = self->_assistantIdentifier;
  }
  v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)recomputeAssistantIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMAccessory _recomputeAssistantIdentifier](self, "_recomputeAssistantIdentifier");
  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMAccessory services](self, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "recomputeAssistantIdentifier");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "recomputeAssistantIdentifier");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)setPendingConfigurationIdentifier:(id)a3
{
  NSString *v4;
  NSString *pendingConfigurationIdentifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  pendingConfigurationIdentifier = self->_pendingConfigurationIdentifier;
  self->_pendingConfigurationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSettings:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_settings, a3);
    objc_msgSend(v8, "setSettingsControl:", self);
    objc_msgSend(v8, "setSettingsContainerInternal:", self);
    -[HMAccessory context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HMAccessory context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_configureWithContext:", v7);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)preferredMediaUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;

  -[HMAccessory home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);

  if (v7)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(v3, "users");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmf_firstObjectWithUUID:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)preferredUserSelectionType
{
  os_unfair_lock_s *p_lock;
  unint64_t preferredUserSelectionType;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  preferredUserSelectionType = self->_preferredUserSelectionType;
  os_unfair_lock_unlock(p_lock);
  return preferredUserSelectionType;
}

- (void)setPreferredUserSelectionType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_preferredUserSelectionType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)productColor
{
  os_unfair_lock_s *p_lock;
  int64_t productColor;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  productColor = self->_productColor;
  os_unfair_lock_unlock(p_lock);
  return productColor;
}

- (void)setProductColor:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_productColor = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setPreferredMediaUserUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *preferredMediaUserUUID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  preferredMediaUserUUID = self->_preferredMediaUserUUID;
  self->_preferredMediaUserUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)preferredMediaUserUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_preferredMediaUserUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleRootSettingsUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessorySettingGroup *v7;
  HMAccessorySettingGroup *v8;
  HMAccessorySettings *v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  HMAccessorySettingGroup *v20;
  void *v21;
  HMAccessory *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  HMAccessorySettingGroup *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
  {
    objc_msgSend(v4, "respondWithPayload:", 0);
  }
  else
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("settings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v26);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (HMAccessorySettingGroup *)v26;
      if (v6)
      {
        v8 = -[HMAccessorySettingGroup initWithInternal:]([HMAccessorySettingGroup alloc], "initWithInternal:", v6);
        -[HMAccessory settings](self, "settings");
        v9 = (HMAccessorySettings *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1A1AC1AAC]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v9)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = v14;
            v29 = 2112;
            v30 = v8;
            _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging with new settings: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          -[HMAccessory settings](v11, "settings");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mergeFromNewObject:", v9);

        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = v25;
            v29 = 2112;
            v30 = v8;
            _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Adding new settings: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          v9 = -[HMAccessorySettings initWithSettingsContainer:settingsControl:rootGroup:]([HMAccessorySettings alloc], "initWithSettingsContainer:settingsControl:rootGroup:", v11, v11, v8);
          -[HMAccessory setSettings:](v11, "setSettings:", v9);
          -[HMAccessory _notifyDelegateOfUpdatedSettings:](v11, "_notifyDelegateOfUpdatedSettings:", v9);
        }
        objc_msgSend(v4, "respondWithPayload:", 0);

      }
      else
      {
        v21 = (void *)MEMORY[0x1A1AC1AAC]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v24;
          v29 = 2112;
          v30 = v7;
          _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting group from root group data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v8 = (HMAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v8);
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v20 = (HMAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v19;
        v29 = 2112;
        v30 = v20;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized root settings from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v7 = (HMAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v7);
    }

  }
}

- (void)_notifyDelegateOfUpdatedSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HMAccessory__notifyDelegateOfUpdatedSettings___block_invoke;
  v8[3] = &unk_1E3AB5ED8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "invokeBlock:", v8);

}

- (void)updatePreferredMediaUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = a4;
  if (!v12)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Must have valid user", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide valid parameters"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  -[HMAccessory updatePreferredMediaUserSelectionType:user:completionHandler:](self, "updatePreferredMediaUserSelectionType:user:completionHandler:", 1, v12, v6);

}

- (void)updatePreferredMediaUserSelectionType:(unint64_t)a3 user:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  HMAccessory *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42[2];
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HMAccessory context](self, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory updatePreferredMediaUserSelectionType:user:completionHandler:]", CFSTR("completionHandler"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v36;
      v49 = 2112;
      v50 = (const char *)v32;
      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v38)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v48 = v14;
      v49 = 2112;
      v50 = v16;
      v51 = 2112;
      v52 = v17;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updating preferredMediaUser: %@, type: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v45 = CFSTR("HM.ac.usersel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if (v8)
    {
      v43 = CFSTR("kUserUUIDKey");
      objc_msgSend(v8, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addEntriesFromDictionary:", v23);

    }
    v24 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](v11, "messageTargetUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithTarget:", v25);

    v27 = (void *)MEMORY[0x1E0D285F8];
    v28 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v27, "messageWithName:destination:payload:", CFSTR("HM.ac.updatePreferredMediaUser"), v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, v11);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __76__HMAccessory_updatePreferredMediaUserSelectionType_user_completionHandler___block_invoke;
    v39[3] = &unk_1E3AB2CE8;
    objc_copyWeak(v42, (id *)buf);
    v40 = v8;
    v42[1] = (id)a3;
    v41 = v9;
    objc_msgSend(v29, "setResponseHandler:", v39);
    objc_msgSend(v38, "messageDispatcher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sendMessage:", v29);

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v31;
      v49 = 2080;
      v50 = "-[HMAccessory updatePreferredMediaUserSelectionType:user:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v20);
  }

}

- (void)fetchManagedConfigurationProfilesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMAccessory *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE location[12];
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory fetchManagedConfigurationProfilesWithCompletionHandler:]", CFSTR("completionHandler"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v20;
      v26 = 2112;
      v27 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v6 = (void *)v5;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryFetchManagedConfigurationProfilesMessage"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__HMAccessory_fetchManagedConfigurationProfilesWithCompletionHandler___block_invoke;
    v22[3] = &unk_1E3AB4AE0;
    objc_copyWeak(&v24, (id *)location);
    v23 = v4;
    objc_msgSend(v10, "setResponseHandler:", v22);
    objc_msgSend(v6, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:completionHandler:", v10, 0);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v15;
      v26 = 2080;
      v27 = "-[HMAccessory fetchManagedConfigurationProfilesWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

- (void)removeManagedConfigurationProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMAccessory *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMAccessory *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  _BYTE location[12];
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMAccessory context](self, "context");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory removeManagedConfigurationProfileWithIdentifier:completionHandler:]", CFSTR("completionHandler"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v28;
        v36 = 2112;
        v37 = (const char *)v24;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v29);
    }
    v9 = (void *)v8;
    if (v8)
    {
      v10 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);

      v33 = CFSTR("HMAccessory.mc.identifier");
      v34 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryRemoveManagedConfigurationProfileMessage"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __81__HMAccessory_removeManagedConfigurationProfileWithIdentifier_completionHandler___block_invoke;
      v30[3] = &unk_1E3AB4AE0;
      objc_copyWeak(&v32, (id *)location);
      v31 = v7;
      objc_msgSend(v14, "setResponseHandler:", v30);
      objc_msgSend(v9, "messageDispatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendMessage:completionHandler:", v14, 0);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v23;
        v36 = 2080;
        v37 = "-[HMAccessory removeManagedConfigurationProfileWithIdentifier:completionHandler:]";
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier", location, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }

}

- (void)installManagedConfigurationProfileWithData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMAccessory *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  id v30;
  _BYTE location[12];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMAccessory context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

      v29 = CFSTR("HMAccessory.mc.data");
      v30 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryInstallManagedConfigurationProfileMessage"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, self);
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __76__HMAccessory_installManagedConfigurationProfileWithData_completionHandler___block_invoke;
      v26 = &unk_1E3AB4AE0;
      objc_copyWeak(&v28, (id *)location);
      v27 = v7;
      objc_msgSend(v13, "setResponseHandler:", &v23);
      objc_msgSend(v8, "messageDispatcher", v23, v24, v25, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendMessage:completionHandler:", v13, 0);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v22;
        v32 = 2080;
        v33 = "-[HMAccessory installManagedConfigurationProfileWithData:completionHandler:]";
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v8 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v18;
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil profileData", location, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
  }

}

- (HMFPairingIdentity)pairingIdentity
{
  return 0;
}

- (void)_handlePairingIdentityUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMAccessory *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegateCaller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __44__HMAccessory__handlePairingIdentityUpdate___block_invoke;
      v27[3] = &unk_1E3AB5ED8;
      v27[4] = self;
      v28 = v6;
      objc_msgSend(v8, "invokeBlock:", v27);

    }
    else
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2112;
        v32 = (const char *)v6;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not call delegate for pairing identity, unregistered delegate: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    v22 = (void *)MEMORY[0x1A1AC1AAC](v9, v10, v11, v12, v13);
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v25;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Posting notification for HMAccessoryPairingIdentityUpdatedNotification", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "postNotificationName:object:", CFSTR("HMAccessoryPairingIdentityUpdatedNotification"), v23);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2080;
      v32 = "-[HMAccessory _handlePairingIdentityUpdate:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)pairingIdentityWithPrivateKey:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMAccessory *v35;
  NSObject *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v4 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching pairing identity with private key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMAccessory context](v8, "context");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory pairingIdentityWithPrivateKey:completionHandler:]", CFSTR("completion"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1A1AC1AAC]();
    v35 = v8;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v37;
      v45 = 2112;
      v46 = (const char *)v33;
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v33, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v13 = (void *)v12;
  if (v12)
  {
    if (CFPreferencesGetAppBooleanValue(CFSTR("kHMDDemoModeStatusKey"), CFSTR("com.apple.homed"), 0))
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = v8;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v17;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@pairingIdentityWithPrivateKey completing with nil because demo mode is on.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
    else
    {
      v41[0] = CFSTR("kAccessoryUUID");
      -[HMAccessory uuid](v8, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = CFSTR("includePrivateKey");
      v42[0] = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc(MEMORY[0x1E0D285F8]);
      v28 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](v8, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithTarget:", v29);
      v31 = (void *)objc_msgSend(v27, "initWithName:destination:payload:", CFSTR("HMA.pairingIdentity"), v30, v26);

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke;
      v39[3] = &unk_1E3AB59B8;
      v39[4] = v8;
      v40 = v6;
      objc_msgSend(v31, "setResponseHandler:", v39);
      objc_msgSend(v13, "messageDispatcher");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sendMessage:", v31);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v21;
      v45 = 2080;
      v46 = "-[HMAccessory pairingIdentityWithPrivateKey:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v22);

  }
}

- (void)setDevice:(id)a3
{
  HMDevice *v4;
  HMDevice *device;

  v4 = (HMDevice *)a3;
  os_unfair_lock_lock_with_options();
  device = self->_device;
  self->_device = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDeviceIRKData:(id)a3
{
  NSData *v4;
  NSData *deviceIRKData;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  deviceIRKData = self->_deviceIRKData;
  self->_deviceIRKData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFSoftwareVersion)softwareVersion
{
  os_unfair_lock_s *p_lock;
  HMFSoftwareVersion *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_softwareVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSoftwareVersion:(id)a3
{
  HMFSoftwareVersion *v4;
  HMFSoftwareVersion *softwareVersion;

  v4 = (HMFSoftwareVersion *)a3;
  os_unfair_lock_lock_with_options();
  softwareVersion = self->_softwareVersion;
  self->_softwareVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSoftwareUpdateController:(id)a3
{
  HMSoftwareUpdateController *v4;
  HMSoftwareUpdateController *softwareUpdateController;

  v4 = (HMSoftwareUpdateController *)a3;
  os_unfair_lock_lock_with_options();
  softwareUpdateController = self->_softwareUpdateController;
  self->_softwareUpdateController = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isUserNotifiedOfSoftwareUpdate
{
  return 1;
}

- (id)_accessoryInformationService
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMAccessory services](self, "services", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "serviceType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

        if (v9)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_valueForCharacteristic:(id)a3 ofService:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char isKindOfClass;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a4, "characteristics", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "characteristicType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "value");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (NSString)storeID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_storeID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStoreID:(id)a3
{
  NSString *v4;
  NSString *storeID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  storeID = self->_storeID;
  self->_storeID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)bundleID
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_bundleID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBundleID:(id)a3
{
  NSString *v4;
  NSString *bundleID;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  self->_bundleID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFirmwareUpdateAvailable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firmwareUpdateAvailable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCalibrating
{
  unint64_t v3;

  v3 = -[HMAccessory calibrationStatus](self, "calibrationStatus");
  if (v3)
    LOBYTE(v3) = -[HMAccessory calibrationStatus](self, "calibrationStatus") == 1;
  return v3;
}

- (void)setControllable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_controllable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)queryAdvertisementInformationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21 = CFSTR("kAccessoryUUID");
    -[HMAccessory uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D285F8]);
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
    v13 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", CFSTR("kAccessoryAdvertisingParamsRequestKey"), v12, v8);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__HMAccessory_queryAdvertisementInformationWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E3AB3A50;
    v20 = v4;
    objc_msgSend(v13, "setResponseHandler:", v19);
    objc_msgSend(v5, "messageDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendMessage:", v13);

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2080;
      v26 = "-[HMAccessory queryAdvertisementInformationWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)validatePairingAuthMethodWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMA.validateAuthMethod"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__HMAccessory_validatePairingAuthMethodWithCompletion___block_invoke;
    v15[3] = &unk_1E3AB3A50;
    v16 = v4;
    objc_msgSend(v9, "setResponseHandler:", v15);
    objc_msgSend(v5, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory validatePairingAuthMethodWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)queryLastSeenStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMA.lastSeenStatusRequest"), v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__HMAccessory_queryLastSeenStatusWithCompletion___block_invoke;
      v15[3] = &unk_1E3AB3A50;
      v16 = v4;
      objc_msgSend(v9, "setResponseHandler:", v15);
      objc_msgSend(v5, "messageDispatcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendMessage:", v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Feature is disabled"), CFSTR("Feature flag is disabled"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory queryLastSeenStatusWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)queryLinkQualityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMA.linkQualityRequest"), v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__HMAccessory_queryLinkQualityWithCompletion___block_invoke;
      v15[3] = &unk_1E3AB3A50;
      v16 = v4;
      objc_msgSend(v9, "setResponseHandler:", v15);
      objc_msgSend(v5, "messageDispatcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendMessage:", v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Feature is disabled"), CFSTR("Feature flag is disabled"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory queryLinkQualityWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)getAccessoryDiagnosticCountersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMA.accessoryDiagnosticCounters"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__HMAccessory_getAccessoryDiagnosticCountersWithCompletion___block_invoke;
    v15[3] = &unk_1E3AB3A50;
    v16 = v4;
    objc_msgSend(v9, "setResponseHandler:", v15);
    objc_msgSend(v5, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory getAccessoryDiagnosticCountersWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)getAccessoryDiagnosticEventsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMA.accessoryDiagnosticEvents"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__HMAccessory_getAccessoryDiagnosticEventsWithCompletion___block_invoke;
    v15[3] = &unk_1E3AB3A50;
    v16 = v4;
    objc_msgSend(v9, "setResponseHandler:", v15);
    objc_msgSend(v5, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory getAccessoryDiagnosticEventsWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)dumpMatterUsersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("homeutil_getAllUsers"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__HMAccessory_dumpMatterUsersWithCompletion___block_invoke;
    v15[3] = &unk_1E3AB3A50;
    v16 = v4;
    objc_msgSend(v9, "setResponseHandler:", v15);
    objc_msgSend(v5, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2080;
      v20 = "-[HMAccessory dumpMatterUsersWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)clearMatterUserWithIndex:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

    v11 = (void *)MEMORY[0x1E0D285F8];
    v22 = CFSTR("index");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("homeutil_clearUser"), v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __51__HMAccessory_clearMatterUserWithIndex_completion___block_invoke;
    v20[3] = &unk_1E3AB3A50;
    v21 = v6;
    objc_msgSend(v14, "setResponseHandler:", v20);
    objc_msgSend(v7, "messageDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:", v14);

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2080;
      v27 = "-[HMAccessory clearMatterUserWithIndex:completion:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)clearMatterCredentialWithType:(int64_t)a3 forUserIndex:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessory *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

    v12 = (void *)MEMORY[0x1E0D285F8];
    v23 = CFSTR("index");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageWithName:destination:payload:", CFSTR("homeutil_clearUser"), v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__HMAccessory_clearMatterCredentialWithType_forUserIndex_completion___block_invoke;
    v21[3] = &unk_1E3AB3A50;
    v22 = v7;
    objc_msgSend(v15, "setResponseHandler:", v21);
    objc_msgSend(v8, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v15);

  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2080;
      v28 = "-[HMAccessory clearMatterCredentialWithType:forUserIndex:completion:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (BOOL)isBlocked
{
  return 0;
}

- (BOOL)isSuspendCapable
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_suspendCapable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuspendCapable:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_suspendCapable = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSuspendedState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_suspendedState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)associationOptions
{
  os_unfair_lock_s *p_lock;
  int64_t associationOptions;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  associationOptions = self->_associationOptions;
  os_unfair_lock_unlock(p_lock);
  return associationOptions;
}

- (void)setApplicationData:(id)a3
{
  HMApplicationData *v4;
  HMApplicationData *applicationData;

  v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCertificationStatus:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_certificationStatus = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMAccessory *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  NSString *v23;
  HMAccessory *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = name;
  v7 = completion;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory updateName:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__HMAccessory_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    v23 = v6;
    v24 = self;
    v25 = v7;
    dispatch_async(v10, block);

    v11 = v23;
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2080;
      v29 = "-[HMAccessory updateName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
  }

}

- (void)updateAccessoryName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory updateAccessoryName:completionHandler:]", CFSTR("completion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      v28 = 2112;
      v29 = (const char *)v17;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = (void *)v8;
  -[HMAccessory context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMAccessory_updateAccessoryName_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v24 = v6;
    v25 = v7;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2080;
      v29 = "-[HMAccessory updateAccessoryName:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  HMAccessory *v36;
  NSObject *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _updateName:completionHandler:]", CFSTR("completion"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v38;
      v50 = 2112;
      v51 = (const char *)v34;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v34, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v9 = (void *)v8;
  if (v8)
  {
    v10 = objc_msgSend(v6, "length");
    if (HMMaxLengthForNaming__hmf_once_t5 != -1)
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t5, &__block_literal_global_40);
    if (v10 > HMMaxLengthForNaming__hmf_once_v6)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v14;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v9, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v7, v16);

      goto LABEL_22;
    }
    v15 = (void *)objc_msgSend(v6, "copy");
    -[HMAccessory home](self, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[HMAccessory name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = HMFEqualObjects();

      if (!v23)
      {
        if (v6)
        {
          v46 = CFSTR("kAccessoryName");
          v47 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = CFSTR("kAccessoryNameResetKey");
          v45 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v28 = (void *)v27;
        v29 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithTarget:", v30);

        objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("kRenameAccessoryRequestKey"), v31, v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)buf, self);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __45__HMAccessory__updateName_completionHandler___block_invoke;
        v40[3] = &unk_1E3AB4B30;
        objc_copyWeak(&v43, (id *)buf);
        v41 = v15;
        v42 = v7;
        objc_msgSend(v32, "setResponseHandler:", v40);
        objc_msgSend(v9, "messageDispatcher");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sendMessage:completionHandler:", v32, 0);

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);

        goto LABEL_21;
      }
      -[HMAccessory context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "callCompletion:error:", v7, 0);
    }
    else
    {
      -[HMAccessory context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "callCompletion:error:", v7, v26);

    }
LABEL_21:

    goto LABEL_22;
  }
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v20;
    v50 = 2080;
    v51 = "-[HMAccessory _updateName:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v15);
LABEL_22:

}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  char *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  HMAccessory *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  HMAccessory *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  HMAccessory *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  HMAccessory *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const char *v70;
  void *aBlock;
  id v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  HMAccessory *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  void *v87;
  _QWORD v88[5];
  _QWORD v89[7];

  v89[5] = *MEMORY[0x1E0C80C00];
  v11 = (char *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HMAccessory context](self, "context");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _writeValue:forCharacteristic:service:completionHandler:]", CFSTR("completion"));
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1A1AC1AAC]();
    v58 = self;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v60;
      v84 = 2112;
      v85 = (const char *)v56;
      _os_log_impl(&dword_19B1B0000, v59, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v57);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v56, 0);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v61);
  }
  v16 = (void *)v15;
  if (v15)
  {
    -[HMAccessory home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v13;
    v73 = v16;
    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0D28540]);
      v19 = (void *)MEMORY[0x1E0CB3940];
      MEMORY[0x1A1AC1500](self, a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@, %s:%ld"), v20, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMAccessory.m", 3444);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)objc_msgSend(v18, "initWithName:", v21);

      objc_msgSend(v12, "instanceID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "characteristicType");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory uuid](self, "uuid");

      objc_msgSend(v17, "messageTargetUUID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v12;
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v67);
      aBlock = v14;
      v24 = (void *)MEMORY[0x1E0D285F8];
      v88[0] = CFSTR("kAccessoryUUID");
      objc_msgSend(v13, "accessoryUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v26;
      v89[1] = v11;
      v70 = v11;
      v88[1] = CFSTR("kCharacteristicValue");
      v88[2] = CFSTR("kServiceInstanceID");
      objc_msgSend(v13, "instanceID");
      v27 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v28;
      v88[3] = CFSTR("kCharacteristicInstanceID");
      v69 = v22;
      objc_msgSend(v22, "instanceID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v89[3] = v29;
      v88[4] = CFSTR("kHomeUUID");
      v68 = v27;
      objc_msgSend(v27, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v89[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)v23;
      objc_msgSend(v24, "messageWithName:destination:payload:", CFSTR("kCharacteristicWriteRequestKey"), v23, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setActivity:", v62);
      -[HMAccessory context](self, "context");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "pendingRequests");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = _Block_copy(aBlock);
      objc_msgSend(v35, "addCompletionBlock:forIdentifier:", v37, v36);

      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __71__HMAccessory__writeValue_forCharacteristic_service_completionHandler___block_invoke;
      v74[3] = &unk_1E3AB2D18;
      v38 = v62;
      v75 = v38;
      v76 = self;
      v39 = v63;
      v77 = v39;
      v40 = v64;
      v78 = v40;
      v65 = v35;
      v79 = v65;
      v41 = v36;
      v80 = v41;
      v42 = v73;
      v81 = v42;
      v43 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v33, "setResponseHandler:", v74));
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v46;
        v84 = 2112;
        v85 = v70;
        v86 = 2112;
        v87 = v69;
        _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_INFO, "%{public}@Sending message to write value %@ for characteristic: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(v42, "messageDispatcher");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sendMessage:", v33);

      objc_msgSend(v38, "end");
      v12 = v69;
      v11 = (char *)v70;
      v14 = aBlock;
      v17 = v68;
    }
    else
    {
      v52 = (void *)MEMORY[0x1A1AC1AAC]();
      v53 = self;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v83 = v55;
        v84 = 2112;
        v85 = (const char *)v12;
        _os_log_impl(&dword_19B1B0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic %@: home is nil", buf, 0x16u);

        v17 = 0;
      }

      objc_autoreleasePoolPop(v52);
      -[HMAccessory context](v53, "context");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegateCaller");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "callCompletion:error:", v14, v40);
    }

    v13 = v72;
    v16 = v73;
  }
  else
  {
    v48 = (void *)MEMORY[0x1A1AC1AAC]();
    v49 = self;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v83 = v51;
      v84 = 2080;
      v85 = "-[HMAccessory _writeValue:forCharacteristic:service:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v17);
  }

}

- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  HMAccessory *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  HMAccessory *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  HMAccessory *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  _QWORD v71[4];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  const char *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HMAccessory context](self, "context");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _readValueForCharacteristic:completionHandler:]", CFSTR("completion"));
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = v52;
      v74 = 2112;
      v75 = (const char *)v48;
      _os_log_impl(&dword_19B1B0000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v48, 0);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v53);
  }
  v10 = (void *)v9;
  if (v9)
  {
    if (v7)
    {
      objc_msgSend(v7, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[HMAccessory home](self, "home");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v7, "properties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", CFSTR("HMCharacteristicPropertyReadable"));

          if ((v14 & 1) != 0)
          {
            v15 = objc_alloc(MEMORY[0x1E0D28540]);
            v16 = (void *)MEMORY[0x1E0CB3940];
            MEMORY[0x1A1AC1500](self, a2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, %s:%ld"), v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMAccessory.m", 3514);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)objc_msgSend(v15, "initWithName:", v18);

            objc_msgSend(v7, "instanceID");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "characteristicType");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "accessoryUUID");

            v70[0] = CFSTR("kAccessoryUUID");
            objc_msgSend(v11, "accessoryUUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "UUIDString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v71[0] = v19;
            v70[1] = CFSTR("kServiceInstanceID");
            objc_msgSend(v11, "instanceID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v71[1] = v20;
            v70[2] = CFSTR("kCharacteristicInstanceID");
            objc_msgSend(v7, "instanceID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v71[2] = v21;
            v70[3] = CFSTR("kHomeUUID");
            objc_msgSend(v12, "uuid");
            v61 = v12;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "UUIDString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v71[3] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
            v60 = v11;
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = objc_alloc(MEMORY[0x1E0D285F8]);
            v25 = objc_alloc(MEMORY[0x1E0D285D8]);
            objc_msgSend(v61, "messageTargetUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v25, "initWithTarget:", v26);
            v28 = (void *)objc_msgSend(v24, "initWithName:destination:payload:", CFSTR("kCharacteristicReadRequestKey"), v27, v57);

            objc_msgSend(v28, "setActivity:", v56);
            -[HMAccessory context](self, "context");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "pendingRequests");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = _Block_copy(v8);
            objc_msgSend(v30, "addCompletionBlock:forIdentifier:", v32, v31);

            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __61__HMAccessory__readValueForCharacteristic_completionHandler___block_invoke;
            v62[3] = &unk_1E3AB2D18;
            v63 = v56;
            v64 = self;
            v65 = v59;
            v66 = v58;
            v67 = v30;
            v68 = v31;
            v33 = v10;
            v69 = v33;
            v55 = v31;
            v34 = v30;
            v35 = v58;
            v36 = v59;
            v37 = v56;
            objc_msgSend(v28, "setResponseHandler:", v62);
            objc_msgSend(v33, "messageDispatcher");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "sendMessage:", v28);

            objc_msgSend(v37, "end");
            v12 = v61;

            v11 = v60;
LABEL_18:

            goto LABEL_19;
          }
          -[HMAccessory context](self, "context");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "delegateCaller");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v46 = 6;
        }
        else
        {
          -[HMAccessory context](self, "context");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "delegateCaller");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v46 = 12;
        }
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), v46, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "callCompletion:error:", v8, v47);

      }
      else
      {
        -[HMAccessory context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "delegateCaller");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "callCompletion:error:", v8, v44);
      }

    }
    else
    {
      -[HMAccessory context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callCompletion:error:", v8, v43);
    }

    goto LABEL_18;
  }
  v39 = (void *)MEMORY[0x1A1AC1AAC]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v42;
    v74 = 2080;
    v75 = "-[HMAccessory _readValueForCharacteristic:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v39);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v8 + 2))(v8, v11);
LABEL_19:

}

- (void)_updateRoom:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMAccessory *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMAccessory *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  id v55;
  id v56;
  const __CFString *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _updateRoom:completionHandler:]", CFSTR("completion"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v43;
      v61 = 2112;
      v62 = (const char *)v39;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v39, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMAccessory home](self, "home");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory room](self, "room");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v47)
      {
        if (objc_msgSend(v11, "isEqual:", v6))
        {
          objc_msgSend(v10, "callCompletion:error:", v7, 0);
        }
        else
        {
          v23 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v23, "initWithTarget:", v24);

          v25 = (void *)MEMORY[0x1E0D285F8];
          v57 = CFSTR("kRoomUUID");
          objc_msgSend(v6, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "messageWithName:destination:payload:", CFSTR("kUpdateRoomForAccessoryRequestKey"), v45, v28);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __45__HMAccessory__updateRoom_completionHandler___block_invoke;
          aBlock[3] = &unk_1E3AB5510;
          objc_copyWeak(&v56, (id *)buf);
          v53 = v6;
          v54 = v10;
          v29 = v7;
          v55 = v29;
          v30 = _Block_copy(aBlock);
          -[HMAccessory context](self, "context");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "pendingRequests");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = _Block_copy(v29);
          objc_msgSend(v32, "addCompletionBlock:forIdentifier:", v34, v33);

          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __45__HMAccessory__updateRoom_completionHandler___block_invoke_2;
          v48[3] = &unk_1E3AB60C8;
          v35 = v32;
          v49 = v35;
          v36 = v33;
          v50 = v36;
          v37 = v30;
          v51 = v37;
          objc_msgSend(v46, "setResponseHandler:", v48);
          objc_msgSend(v9, "messageDispatcher");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "sendMessage:completionHandler:", v46, 0);

          objc_destroyWeak(&v56);
          objc_destroyWeak((id *)buf);

        }
      }
      else
      {
        if (!v11)
        {
          v18 = (void *)MEMORY[0x1A1AC1AAC]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v60 = v21;
            v61 = 2112;
            v62 = 0;
            v63 = 2112;
            v64 = 0;
            _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@No room for accessory!!!! home %@, room %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "callCompletion:error:", v7, v22);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callCompletion:error:", v7, v17);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v16;
      v61 = 2080;
      v62 = "-[HMAccessory _updateRoom:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }

}

- (void)setRemoteLoginHandler:(id)a3
{
  HMRemoteLoginHandler *v4;
  void *v5;
  HMAccessory *v6;
  NSObject *v7;
  void *v8;
  HMRemoteLoginHandler *remoteLoginHandler;
  int v10;
  void *v11;
  __int16 v12;
  HMRemoteLoginHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (HMRemoteLoginHandler *)a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting remote login handler: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  remoteLoginHandler = v6->_remoteLoginHandler;
  v6->_remoteLoginHandler = v4;

  os_unfair_lock_unlock(&v6->_lock);
}

- (id)_findServiceWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMAccessory services](self, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateAssociatedServiceType:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  char *v8;
  id v9;
  id v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  HMAccessory *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMAccessory *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[5];
  char *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[3];
  _QWORD v44[3];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v14;
    v47 = 2112;
    v48 = v8;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating service type: %@, for service: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMAccessory context](v12, "context");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _updateAssociatedServiceType:forService:completionHandler:]", CFSTR("completion"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = v12;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v35;
      v47 = 2112;
      v48 = (const char *)v31;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  v16 = (void *)v15;
  if (v15)
  {
    -[HMAccessory home](v12, "home");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[HMAccessory uuid](v12, "uuid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = CFSTR("kHomeUUID");
      objc_msgSend(v18, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v20;
      v43[1] = CFSTR("kServiceInstanceID");
      objc_msgSend(v9, "instanceID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = CFSTR("kServiceType");
      v44[1] = v21;
      v44[2] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
      v22 = v9;
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __73__HMAccessory__updateAssociatedServiceType_forService_completionHandler___block_invoke;
      v38[3] = &unk_1E3AB2FA8;
      v38[4] = v12;
      v39 = v23;
      v40 = v16;
      v42 = v10;
      v41 = v22;
      -[_HMContext sendMessage:target:payload:responseHandler:](v40, CFSTR("kSetAssociatedServiceTypeRequestKey"), v37, v24, v38);

      v8 = v23;
      v9 = v22;

    }
    else
    {
      objc_msgSend(v16, "delegateCaller");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 12, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "callCompletion:error:", v10, v30);

      v18 = 0;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = v12;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v28;
      v47 = 2080;
      v48 = "-[HMAccessory _updateAssociatedServiceType:forService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }

}

- (void)_updateAuthorizationData:(id)a3 forService:(id)a4 characteristic:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  HMAccessory *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  HMAccessory *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  _QWORD v56[4];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMAccessory context](self, "context");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _updateAuthorizationData:forService:characteristic:completionHandler:]", CFSTR("completion"));
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1A1AC1AAC]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v46;
      v59 = 2112;
      v60 = (const char *)v42;
      _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v42, 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v47);
  }
  v15 = (void *)v14;
  if (v14)
  {
    -[HMAccessory home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v48 = v15;
      v55[0] = CFSTR("kHomeUUID");
      objc_msgSend(v16, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v11;
      v21 = (void *)v19;
      v56[0] = v19;
      v55[1] = CFSTR("kServiceInstanceID");
      v50 = v20;
      objc_msgSend(v20, "instanceID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v22;
      v55[2] = CFSTR("kCharacteristicInstanceID");
      v49 = v12;
      objc_msgSend(v12, "instanceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v23;
      v55[3] = CFSTR("kAuthorizationDataKey");
      v24 = v10;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v56[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v10)

      v26 = objc_alloc(MEMORY[0x1E0D285F8]);
      v27 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](self, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithTarget:", v28);
      v30 = (void *)v25;
      v31 = (void *)objc_msgSend(v26, "initWithName:destination:payload:", CFSTR("HMAccessoryUpdateCharacteristicAuthorizationDataMessage"), v29, v25);

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __84__HMAccessory__updateAuthorizationData_forService_characteristic_completionHandler___block_invoke;
      v51[3] = &unk_1E3AB60C8;
      v32 = v49;
      v52 = v49;
      v15 = v48;
      v33 = v48;
      v53 = v33;
      v54 = v13;
      objc_msgSend(v31, "setResponseHandler:", v51);
      objc_msgSend(v33, "messageDispatcher");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendMessage:", v31);

      v11 = v50;
    }
    else
    {
      -[HMAccessory context](self, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "delegateCaller");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v32 = v12;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "callCompletion:error:", v13, v41);

    }
  }
  else
  {
    v32 = v12;
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v38;
      v59 = 2080;
      v60 = "-[HMAccessory _updateAuthorizationData:forService:characteristic:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v17);
  }

}

- (void)_updateName:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMAccessory *v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD aBlock[4];
  id v54;
  HMAccessory *v55;
  id v56;
  id v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMAccessory context](self, "context");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _updateName:forService:completionHandler:]", CFSTR("completion"));
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1A1AC1AAC]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v43;
      v62 = 2112;
      v63 = (const char *)v39;
      _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v40);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v39, 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v12 = (void *)v11;
  if (v11)
  {
    -[HMAccessory home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v8);

      if (v15)
      {
        -[HMAccessory context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "delegateCaller");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "callCompletion:error:", v10, 0);

      }
      else
      {
        objc_msgSend(v9, "accessoryUUID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v8, "copy");
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v47);
        v26 = (void *)MEMORY[0x1E0D285F8];
        v58[0] = CFSTR("kServiceInstanceID");
        objc_msgSend(v9, "instanceID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = CFSTR("kServiceName");
        v59[0] = v27;
        v59[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "messageWithName:destination:payload:", CFSTR("kRenameServiceRequestKey"), v46, v28);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, v9);
        v29 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __56__HMAccessory__updateName_forService_completionHandler___block_invoke;
        aBlock[3] = &unk_1E3AB5510;
        objc_copyWeak(&v57, (id *)buf);
        v45 = v25;
        v54 = v45;
        v55 = self;
        v56 = v10;
        v30 = _Block_copy(aBlock);
        -[HMAccessory context](self, "context");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "pendingRequests");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = _Block_copy(v30);
        objc_msgSend(v32, "addCompletionBlock:forIdentifier:", v34, v33);

        v49[0] = v29;
        v49[1] = 3221225472;
        v49[2] = __56__HMAccessory__updateName_forService_completionHandler___block_invoke_2;
        v49[3] = &unk_1E3AB60C8;
        v35 = v32;
        v50 = v35;
        v36 = v33;
        v51 = v36;
        v37 = v30;
        v52 = v37;
        objc_msgSend(v48, "setResponseHandler:", v49);
        objc_msgSend(v12, "messageDispatcher");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "sendMessage:completionHandler:", v48, 0);

        objc_destroyWeak(&v57);
        objc_destroyWeak((id *)buf);

      }
    }
    else
    {
      -[HMAccessory context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "delegateCaller");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "callCompletion:error:", v10, v24);

      v13 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v21;
      v62 = 2080;
      v63 = "-[HMAccessory _updateName:forService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }

}

- (BOOL)_mergeServices:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  HMObjectMergeCollection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];

  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMAccessory currentServices](self, "currentServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v4);

  -[HMObjectMergeCollection removedObjects](v8, "removedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __30__HMAccessory__mergeServices___block_invoke;
  v22[3] = &unk_1E3AB2D68;
  v22[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);

  -[HMObjectMergeCollection addedObjects](v8, "addedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __30__HMAccessory__mergeServices___block_invoke_807;
  v21[3] = &unk_1E3AB2D68;
  v21[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

  -[HMObjectMergeCollection mergeCommonObjects](v8, "mergeCommonObjects");
  v12 = -[HMObjectMergeCollection isModified](v8, "isModified");
  if (v12)
  {
    -[HMObjectMergeCollection finalObjects](v8, "finalObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory currentServices](self, "currentServices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setArray:", v13);

    -[HMAccessory delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queue");
      v17 = objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __30__HMAccessory__mergeServices___block_invoke_809;
      v19[3] = &unk_1E3AB5ED8;
      v19[4] = self;
      v20 = v15;
      dispatch_async(v17, v19);

    }
  }

  return v12;
}

- (BOOL)_mergeControlTargetUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  BOOL v36;
  BOOL v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[HMAccessory controlTargetUUIDs](self, "controlTargetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMAccessory controlTargetUUIDs](self, "controlTargetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "setWithArray:", MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v4)
    v9 = v4;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMAccessory supportsTargetController](self, "supportsTargetController"))
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v14;
      v60 = 2112;
      v61 = v8;
      v62 = 2112;
      v63 = v10;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging current control targets %@ with new control targets %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }
  v43 = v4;
  -[HMAccessory setControlTargetUUIDs:](self, "setControlTargetUUIDs:", v4);
  v39 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v39, "minusSet:", v10);
  v41 = v10;
  v15 = (void *)objc_msgSend(v10, "mutableCopy");
  v42 = v8;
  objc_msgSend(v15, "minusSet:", v8);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v38 = v17 != 0;
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        -[HMAccessory home](self, "home");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "accessoryWithUUID:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[HMAccessory context](self, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "queue");
          v25 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __40__HMAccessory__mergeControlTargetUUIDs___block_invoke;
          block[3] = &unk_1E3AB5ED8;
          block[4] = self;
          v51 = v23;
          dispatch_async(v25, block);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v18);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v26 = v39;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v27)
  {
    v28 = v27;
    v40 = v16;
    v29 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
        -[HMAccessory home](self, "home");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "accessoryWithUUID:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          -[HMAccessory context](self, "context");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "queue");
          v35 = objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __40__HMAccessory__mergeControlTargetUUIDs___block_invoke_2;
          v44[3] = &unk_1E3AB5ED8;
          v44[4] = self;
          v45 = v33;
          dispatch_async(v35, v44);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v28);
    v36 = 1;
    v16 = v40;
  }
  else
  {
    v36 = v38;
  }

  return v36;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  HMAccessory *v23;
  NSObject *v24;
  id v25;
  char *v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  HMAccessory *v31;
  NSObject *v32;
  id v33;
  char *v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  NSObject *v39;
  int v40;
  void *v41;
  NSObject *v42;
  int v43;
  void *v44;
  NSObject *v45;
  int v46;
  void *v47;
  void *v48;
  NSObject *v49;
  HMAccessory *v50;
  void *v51;
  HMAccessory *v52;
  NSObject *v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  HMAccessory *v60;
  NSObject *v61;
  id v62;
  int v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  HMAccessory *v68;
  NSObject *v69;
  id v70;
  int v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  HMAccessory *v76;
  NSObject *v77;
  id v78;
  int v79;
  void *v80;
  void *v81;
  NSObject *v82;
  int v83;
  void *v84;
  void *v85;
  NSObject *v86;
  int v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  HMAccessory *v95;
  NSObject *v96;
  id v97;
  char *v98;
  void *v99;
  char *v100;
  void *v101;
  HMAccessory *v102;
  NSObject *v103;
  id v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  char v109;
  void *v110;
  HMAccessory *v111;
  NSObject *v112;
  id v113;
  char *v114;
  void *v115;
  char *v116;
  void *v117;
  HMAccessory *v118;
  NSObject *v119;
  id v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  char v125;
  void *v126;
  HMAccessory *v127;
  NSObject *v128;
  id v129;
  void *v130;
  char *v131;
  void *v132;
  HMAccessory *v133;
  NSObject *v134;
  id v135;
  void *v136;
  NSObject *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  char *v144;
  void *v145;
  HMAccessory *v146;
  NSObject *v147;
  id v148;
  char *v149;
  void *v150;
  void *v151;
  HMAccessory *v152;
  NSObject *v153;
  id v154;
  void *v155;
  NSObject *v156;
  _BOOL4 v157;
  int v158;
  unint64_t v159;
  int v160;
  int v161;
  void *v162;
  NSObject *v163;
  int v164;
  void *v165;
  NSObject *v166;
  void *v167;
  void *v168;
  char v169;
  void *v170;
  HMAccessory *v171;
  NSObject *v172;
  id v173;
  char *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  char v179;
  void *v180;
  HMAccessory *v181;
  NSObject *v182;
  id v183;
  char *v184;
  void *v185;
  void *v186;
  int v187;
  int v188;
  void *v189;
  HMAccessory *v190;
  NSObject *v191;
  id v192;
  char *v193;
  id v194;
  void *v195;
  void *v196;
  NSObject *v197;
  int64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  void *v202;
  id v203;
  void *v204;
  NSObject *v205;
  int v206;
  void *v207;
  NSObject *v208;
  unint64_t v209;
  void *v210;
  void *v211;
  id v212;
  void *v213;
  NSObject *v214;
  void *v215;
  void *v216;
  char v217;
  void *v218;
  void *v219;
  void *v220;
  NSObject *v221;
  void *v222;
  void *v223;
  id v224;
  void *v225;
  void *v226;
  char v227;
  void *v228;
  void *v229;
  NSObject *v230;
  void *v231;
  void *v232;
  char v233;
  void *v234;
  void *v235;
  NSObject *v236;
  int v237;
  void *v238;
  NSObject *v239;
  void *v240;
  HMAccessory *v241;
  NSObject *v242;
  id v243;
  void *v244;
  NSObject *v245;
  int v246;
  void *v247;
  void *v248;
  void *v249;
  HMAccessory *v250;
  NSObject *v251;
  id v252;
  char *v253;
  void *v254;
  void *v255;
  NSObject *v256;
  int v257;
  void *v258;
  void *v259;
  char v260;
  void *v261;
  void *v262;
  void *v263;
  char v264;
  void *v265;
  void *v266;
  void *v267;
  char v268;
  void *v269;
  void *v270;
  void *v271;
  char v272;
  void *v273;
  int v274;
  void *v275;
  void *v276;
  char v277;
  void *v278;
  uint64_t v279;
  void *v280;
  NSObject *v281;
  void *v282;
  char v283;
  uint64_t v284;
  void *v285;
  HMAccessory *v286;
  NSObject *v287;
  id v288;
  uint64_t v289;
  const char *v290;
  const char *v291;
  void *v292;
  NSObject *v293;
  void *v294;
  int64_t v295;
  void *v296;
  void *v297;
  void *v298;
  char v299;
  void *v300;
  HMAccessory *v301;
  NSObject *v302;
  id v303;
  char *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  char v311;
  void *v312;
  void *v313;
  int v314;
  void *v315;
  HMAccessory *v316;
  NSObject *v317;
  id v318;
  char *v319;
  HMAccessory *v320;
  NSObject *v321;
  id v322;
  char *v323;
  void *v324;
  NSObject *v325;
  char *v326;
  void *v327;
  char v328;
  void *v329;
  int v330;
  void *v331;
  HMAccessory *v332;
  NSObject *v333;
  id v334;
  void *v335;
  NSObject *v336;
  void *v337;
  void *v338;
  char v339;
  void *v340;
  HMAccessory *v341;
  NSObject *v342;
  id v343;
  char *v344;
  void *v345;
  void *v346;
  void *v347;
  char v348;
  void *v349;
  NSObject *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  _BOOL4 v357;
  _BOOL4 v358;
  int v359;
  int v360;
  void *v361;
  NSObject *v362;
  id v363;
  char *v364;
  id v365;
  void *v366;
  NSObject *v367;
  int v368;
  void *v369;
  NSObject *v370;
  id v371;
  char *v372;
  id v373;
  int v374;
  void *v375;
  NSObject *v376;
  id v377;
  char *v378;
  id v379;
  void *v380;
  void *v381;
  char v382;
  void *v383;
  HMAccessory *v384;
  NSObject *v385;
  id v386;
  void *v387;
  void *v388;
  char *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  char v396;
  HMAccessory *v397;
  NSObject *v398;
  id v399;
  char *v400;
  void *v401;
  void *v402;
  void *v403;
  char v404;
  HMAccessory *v405;
  NSObject *v406;
  id v407;
  char *v408;
  void *v409;
  void *v410;
  void *v411;
  char v412;
  HMAccessory *v413;
  NSObject *v414;
  id v415;
  char *v416;
  void *v417;
  void *v418;
  void *v419;
  char v420;
  HMAccessory *v421;
  NSObject *v422;
  id v423;
  char *v424;
  void *v425;
  int v426;
  void *v427;
  NSObject *v428;
  id v429;
  char *v430;
  id v431;
  void *v432;
  void *v433;
  char v434;
  void *v435;
  void *v436;
  void *v437;
  char v438;
  void *v439;
  void *v440;
  void *v441;
  char v442;
  void *v443;
  NSObject *v444;
  id v445;
  char *v446;
  void *v447;
  void *v448;
  void *v449;
  NSObject *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  int v456;
  void *v457;
  HMAccessory *v458;
  NSObject *v459;
  id v460;
  char *v461;
  void *v462;
  NSObject *v463;
  NSObject *v464;
  _QWORD *v465;
  void *v466;
  HMAccessory *v467;
  NSObject *v468;
  id v469;
  char *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  HMAccessory *v475;
  NSObject *v476;
  id v477;
  char *v478;
  void *v479;
  void *v480;
  void *v481;
  void *v482;
  unint64_t v483;
  uint64_t v484;
  HMAccessory *v485;
  NSObject *v486;
  id v487;
  char *v488;
  void *v489;
  void *v490;
  char v491;
  BOOL v492;
  void *v493;
  HMAccessory *v494;
  NSObject *v495;
  id v496;
  char *v497;
  void *v498;
  NSObject *v499;
  int v500;
  int v501;
  void *v502;
  NSObject *v503;
  id v504;
  char *v505;
  void *v506;
  NSObject *v507;
  void *v508;
  void *v509;
  char v510;
  void *v511;
  HMAccessory *v512;
  NSObject *v513;
  id v514;
  char *v515;
  void *v516;
  void *v517;
  void *v518;
  NSObject *v519;
  int v520;
  void *v521;
  NSObject *v522;
  id v523;
  char *v524;
  id v525;
  int64_t v526;
  int v527;
  void *v528;
  HMAccessory *v529;
  NSObject *v530;
  id v531;
  char *v532;
  id v533;
  int v534;
  int v535;
  void *v536;
  NSObject *v537;
  id v538;
  char *v539;
  id v540;
  void *v541;
  NSObject *v542;
  int v543;
  HMAccessory *v544;
  NSObject *v545;
  id v546;
  char *v547;
  id v548;
  void *v549;
  NSObject *v550;
  void *v552;
  id v553;
  void *v554;
  id v555;
  void *v556;
  _QWORD v557[5];
  _QWORD v558[5];
  _QWORD v559[5];
  id v560;
  _QWORD v561[5];
  _QWORD v562[5];
  _QWORD v563[5];
  _QWORD v564[5];
  _QWORD v565[5];
  _QWORD v566[5];
  _QWORD v567[5];
  _QWORD v568[5];
  id v569;
  id v570;
  _QWORD v571[5];
  id v572;
  _QWORD v573[5];
  id v574;
  _QWORD v575[5];
  _QWORD v576[5];
  _QWORD v577[5];
  _QWORD v578[5];
  id v579;
  _QWORD v580[5];
  id v581;
  _QWORD v582[5];
  id v583;
  _QWORD v584[5];
  id v585;
  _QWORD v586[5];
  id v587;
  _QWORD v588[5];
  id v589;
  id v590;
  _QWORD v591[5];
  _QWORD v592[5];
  id v593;
  _QWORD v594[5];
  id v595;
  _QWORD v596[5];
  _QWORD v597[5];
  _QWORD v598[5];
  id v599;
  id v600;
  char *v601;
  _QWORD v602[5];
  char *v603;
  _QWORD v604[5];
  char *v605;
  _QWORD v606[5];
  char *v607;
  _QWORD v608[5];
  id v609;
  _QWORD v610[5];
  id v611;
  _QWORD v612[5];
  id v613;
  _QWORD v614[5];
  id v615;
  _QWORD v616[5];
  id v617;
  _QWORD v618[5];
  id v619;
  _QWORD v620[5];
  id v621;
  _QWORD v622[5];
  _QWORD v623[5];
  _QWORD v624[5];
  _QWORD v625[5];
  _QWORD v626[5];
  _QWORD v627[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v630;
  __int16 v631;
  const char *v632;
  __int16 v633;
  id v634;
  __int16 v635;
  void *v636;
  uint64_t v637;

  v637 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HMAccessory home](self, "home");
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    LOBYTE(v50) = 0;
    goto LABEL_368;
  }
  v553 = v4;
  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMAccessory _mergeServices:](self, "_mergeServices:", v7);

  objc_msgSend(v6, "controlTargetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMAccessory _mergeControlTargetUUIDs:](self, "_mergeControlTargetUUIDs:", v9);

  LODWORD(v9) = -[HMAccessory supportsTargetControl](self, "supportsTargetControl");
  v11 = objc_msgSend(v6, "supportsTargetControl");
  v12 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v9 == v11
    && (v13 = -[HMAccessory supportsTargetController](self, "supportsTargetController"),
        v13 == objc_msgSend(v6, "supportsTargetController"))
    && (v14 = -[HMAccessory targetControllerHardwareSupport](self, "targetControllerHardwareSupport"),
        v14 == objc_msgSend(v6, "targetControllerHardwareSupport")))
  {
    v17 = v10 || v8;
  }
  else
  {
    -[HMAccessory setSupportsTargetControl:](self, "setSupportsTargetControl:", objc_msgSend(v6, "supportsTargetControl"));
    -[HMAccessory setSupportsTargetController:](self, "setSupportsTargetController:", objc_msgSend(v6, "supportsTargetController"));
    -[HMAccessory setTargetControllerHardwareSupport:](self, "setTargetControllerHardwareSupport:", objc_msgSend(v6, "targetControllerHardwareSupport"));
    -[HMAccessory context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __34__HMAccessory_mergeFromNewObject___block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v16, block);

    v17 = 1;
  }
  v18 = -[HMAccessory supportsMultiUser](self, "supportsMultiUser");
  if (v18 != objc_msgSend(v6, "supportsMultiUser"))
  {
    -[HMAccessory setSupportsMultiUser:](self, "setSupportsMultiUser:", objc_msgSend(v6, "supportsMultiUser"));
    -[HMAccessory context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    v627[0] = v12;
    v627[1] = 3221225472;
    v627[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2;
    v627[3] = &unk_1E3AB5E18;
    v627[4] = self;
    dispatch_async(v20, v627);

  }
  v21 = -[HMAccessory supportsHomeLevelLocationServiceSetting](self, "supportsHomeLevelLocationServiceSetting");
  if (v21 != objc_msgSend(v6, "supportsHomeLevelLocationServiceSetting"))
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsHomeLevelLocationServiceSetting");
      HMFBooleanToString();
      v26 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v25;
      v631 = 2112;
      v632 = v26;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating supports home level location service setting: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMAccessory setSupportsHomeLevelLocationServiceSetting:](v23, "setSupportsHomeLevelLocationServiceSetting:", objc_msgSend(v6, "supportsHomeLevelLocationServiceSetting"));
    -[HMAccessory context](v23, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "queue");
    v28 = objc_claimAutoreleasedReturnValue();
    v626[0] = v12;
    v626[1] = 3221225472;
    v626[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_811;
    v626[3] = &unk_1E3AB5E18;
    v626[4] = v23;
    dispatch_async(v28, v626);

  }
  v29 = -[HMAccessory supportsAudioReturnChannel](self, "supportsAudioReturnChannel");
  if (v29 != objc_msgSend(v6, "supportsAudioReturnChannel"))
  {
    v30 = (void *)MEMORY[0x1A1AC1AAC]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsAudioReturnChannel");
      HMFBooleanToString();
      v34 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v33;
      v631 = 2112;
      v632 = v34;
      _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating supports audio return channel: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    -[HMAccessory setSupportsAudioReturnChannel:](v31, "setSupportsAudioReturnChannel:", objc_msgSend(v6, "supportsAudioReturnChannel"));
    -[HMAccessory context](v31, "context");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "queue");
    v36 = objc_claimAutoreleasedReturnValue();
    v625[0] = v12;
    v625[1] = 3221225472;
    v625[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_812;
    v625[3] = &unk_1E3AB5E18;
    v625[4] = v31;
    dispatch_async(v36, v625);

  }
  v37 = -[HMAccessory supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart");
  if (v37 != objc_msgSend(v6, "supportsCompanionInitiatedRestart"))
  {
    -[HMAccessory setSupportsCompanionInitiatedRestart:](self, "setSupportsCompanionInitiatedRestart:", objc_msgSend(v6, "supportsCompanionInitiatedRestart"));
    -[HMAccessory context](self, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "queue");
    v39 = objc_claimAutoreleasedReturnValue();
    v624[0] = v12;
    v624[1] = 3221225472;
    v624[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_813;
    v624[3] = &unk_1E3AB5E18;
    v624[4] = self;
    dispatch_async(v39, v624);

  }
  v40 = -[HMAccessory supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate");
  if (v40 != objc_msgSend(v6, "supportsCompanionInitiatedObliterate"))
  {
    -[HMAccessory setSupportsCompanionInitiatedObliterate:](self, "setSupportsCompanionInitiatedObliterate:", objc_msgSend(v6, "supportsCompanionInitiatedObliterate"));
    -[HMAccessory context](self, "context");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "queue");
    v42 = objc_claimAutoreleasedReturnValue();
    v623[0] = v12;
    v623[1] = 3221225472;
    v623[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3;
    v623[3] = &unk_1E3AB5E18;
    v623[4] = self;
    dispatch_async(v42, v623);

  }
  v43 = -[HMAccessory supportsMusicAlarm](self, "supportsMusicAlarm");
  if (v43 != objc_msgSend(v6, "supportsMusicAlarm"))
  {
    -[HMAccessory setSupportsMusicAlarm:](self, "setSupportsMusicAlarm:", objc_msgSend(v6, "supportsMusicAlarm"));
    -[HMAccessory context](self, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "queue");
    v45 = objc_claimAutoreleasedReturnValue();
    v622[0] = v12;
    v622[1] = 3221225472;
    v622[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4;
    v622[3] = &unk_1E3AB5E18;
    v622[4] = self;
    dispatch_async(v45, v622);

  }
  v46 = -[HMAccessory supportsAnnounce](self, "supportsAnnounce");
  if (v46 != objc_msgSend(v6, "supportsAnnounce"))
  {
    -[HMAccessory setSupportsAnnounce:](self, "setSupportsAnnounce:", objc_msgSend(v6, "supportsAnnounce"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "queue");
      v49 = objc_claimAutoreleasedReturnValue();
      v620[0] = v12;
      v620[1] = 3221225472;
      v620[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_5;
      v620[3] = &unk_1E3AB5ED8;
      v620[4] = self;
      v621 = v47;
      dispatch_async(v49, v620);

    }
    else
    {
      v51 = (void *)MEMORY[0x1A1AC1AAC]();
      v52 = self;
      HMFGetOSLogHandle();
      v53 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v54;
        v631 = 2112;
        v632 = (const char *)v47;
        _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports announce update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v51);
    }

  }
  v55 = -[HMAccessory supportsMediaActions](self, "supportsMediaActions");
  if (v55 != objc_msgSend(v6, "supportsMediaActions"))
  {
    -[HMAccessory setSupportsMediaActions:](self, "setSupportsMediaActions:", objc_msgSend(v6, "supportsMediaActions"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "queue");
      v58 = objc_claimAutoreleasedReturnValue();
      v618[0] = v12;
      v618[1] = 3221225472;
      v618[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_816;
      v618[3] = &unk_1E3AB5ED8;
      v618[4] = self;
      v619 = v56;
      dispatch_async(v58, v618);

    }
    else
    {
      v59 = (void *)MEMORY[0x1A1AC1AAC]();
      v60 = self;
      HMFGetOSLogHandle();
      v61 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v62 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v62;
        v631 = 2112;
        v632 = (const char *)v56;
        _os_log_impl(&dword_19B1B0000, v61, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports media actions update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v59);
    }

  }
  v63 = -[HMAccessory supportsDropIn](self, "supportsDropIn");
  if (v63 != objc_msgSend(v6, "supportsDropIn"))
  {
    -[HMAccessory setSupportsDropIn:](self, "setSupportsDropIn:", objc_msgSend(v6, "supportsDropIn"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "queue");
      v66 = objc_claimAutoreleasedReturnValue();
      v616[0] = v12;
      v616[1] = 3221225472;
      v616[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_819;
      v616[3] = &unk_1E3AB5ED8;
      v616[4] = self;
      v617 = v64;
      dispatch_async(v66, v616);

    }
    else
    {
      v67 = (void *)MEMORY[0x1A1AC1AAC]();
      v68 = self;
      HMFGetOSLogHandle();
      v69 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v70 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v70;
        v631 = 2112;
        v632 = (const char *)v64;
        _os_log_impl(&dword_19B1B0000, v69, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports drop in update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v67);
    }

  }
  v71 = -[HMAccessory supportsAudioAnalysis](self, "supportsAudioAnalysis");
  if (v71 != objc_msgSend(v6, "supportsAudioAnalysis"))
  {
    -[HMAccessory setSupportsAudioAnalysis:](self, "setSupportsAudioAnalysis:", objc_msgSend(v6, "supportsAudioAnalysis"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "queue");
      v74 = objc_claimAutoreleasedReturnValue();
      v614[0] = v12;
      v614[1] = 3221225472;
      v614[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_822;
      v614[3] = &unk_1E3AB5ED8;
      v614[4] = self;
      v615 = v72;
      dispatch_async(v74, v614);

    }
    else
    {
      v75 = (void *)MEMORY[0x1A1AC1AAC]();
      v76 = self;
      HMFGetOSLogHandle();
      v77 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v78 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v78;
        v631 = 2112;
        v632 = (const char *)v72;
        _os_log_impl(&dword_19B1B0000, v77, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports audio analysis update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v75);
    }

  }
  v79 = -[HMAccessory supportsThirdPartyMusic](self, "supportsThirdPartyMusic");
  if (v79 != objc_msgSend(v6, "supportsThirdPartyMusic"))
  {
    -[HMAccessory setSupportsThirdPartyMusic:](self, "setSupportsThirdPartyMusic:", objc_msgSend(v6, "supportsThirdPartyMusic"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "queue");
      v82 = objc_claimAutoreleasedReturnValue();
      v612[0] = v12;
      v612[1] = 3221225472;
      v612[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_825;
      v612[3] = &unk_1E3AB5ED8;
      v612[4] = self;
      v613 = v80;
      dispatch_async(v82, v612);

    }
  }
  v83 = -[HMAccessory supportsDoorbellChime](self, "supportsDoorbellChime");
  if (v83 != objc_msgSend(v6, "supportsDoorbellChime"))
  {
    -[HMAccessory setSupportsDoorbellChime:](self, "setSupportsDoorbellChime:", objc_msgSend(v6, "supportsDoorbellChime"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "queue");
      v86 = objc_claimAutoreleasedReturnValue();
      v610[0] = v12;
      v610[1] = 3221225472;
      v610[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_828;
      v610[3] = &unk_1E3AB5ED8;
      v610[4] = self;
      v611 = v84;
      dispatch_async(v86, v610);

    }
  }
  v87 = -[HMAccessory supportsUserMediaSettings](self, "supportsUserMediaSettings");
  if (v87 != objc_msgSend(v6, "supportsUserMediaSettings"))
  {
    -[HMAccessory setSupportsUserMediaSettings:](self, "setSupportsUserMediaSettings:", objc_msgSend(v6, "supportsUserMediaSettings"));
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "queue");
      v90 = objc_claimAutoreleasedReturnValue();
      v608[0] = v12;
      v608[1] = 3221225472;
      v608[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_831;
      v608[3] = &unk_1E3AB5ED8;
      v608[4] = self;
      v609 = v88;
      dispatch_async(v90, v608);

    }
  }
  -[HMAccessory name](self, "name");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = HMFEqualObjects();

  if ((v93 & 1) == 0)
  {
    v94 = (void *)MEMORY[0x1A1AC1AAC]();
    v95 = self;
    HMFGetOSLogHandle();
    v96 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v97 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v98 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v97;
      v631 = 2112;
      v632 = v98;
      _os_log_impl(&dword_19B1B0000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Updated name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v94);
    objc_msgSend(v6, "name");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setName:](v95, "setName:", v99);

    -[HMAccessory delegate](v95, "delegate");
    v100 = (char *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)MEMORY[0x1A1AC1AAC]();
    v102 = v95;
    HMFGetOSLogHandle();
    v103 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v104 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v104;
      v631 = 2112;
      v632 = v100;
      _os_log_impl(&dword_19B1B0000, v103, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update name with delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v101);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v102, "context");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "queue");
      v106 = objc_claimAutoreleasedReturnValue();
      v606[0] = v12;
      v606[1] = 3221225472;
      v606[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_834;
      v606[3] = &unk_1E3AB5ED8;
      v606[4] = v102;
      v607 = v100;
      dispatch_async(v106, v606);

    }
    v17 = 1;
  }
  -[HMAccessory configuredName](self, "configuredName");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuredName");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = HMFEqualObjects();

  if ((v109 & 1) == 0)
  {
    v110 = (void *)MEMORY[0x1A1AC1AAC]();
    v111 = self;
    HMFGetOSLogHandle();
    v112 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v113 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuredName");
      v114 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v113;
      v631 = 2112;
      v632 = v114;
      _os_log_impl(&dword_19B1B0000, v112, OS_LOG_TYPE_INFO, "%{public}@Updated configured name: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v110);
    objc_msgSend(v6, "configuredName");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setConfiguredName:](v111, "setConfiguredName:", v115);

    -[HMAccessory delegate](v111, "delegate");
    v116 = (char *)objc_claimAutoreleasedReturnValue();
    v117 = (void *)MEMORY[0x1A1AC1AAC]();
    v118 = v111;
    HMFGetOSLogHandle();
    v119 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v120 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v120;
      v631 = 2112;
      v632 = v116;
      _os_log_impl(&dword_19B1B0000, v119, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update configured name with delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v117);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v118, "context");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "queue");
      v122 = objc_claimAutoreleasedReturnValue();
      v604[0] = v12;
      v604[1] = 3221225472;
      v604[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_836;
      v604[3] = &unk_1E3AB5ED8;
      v604[4] = v118;
      v605 = v116;
      dispatch_async(v122, v604);

    }
  }
  -[HMAccessory applicationData](self, "applicationData");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationData");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = HMFEqualObjects();

  if ((v125 & 1) == 0)
  {
    v126 = (void *)MEMORY[0x1A1AC1AAC]();
    v127 = self;
    HMFGetOSLogHandle();
    v128 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v129 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v630 = v129;
      _os_log_impl(&dword_19B1B0000, v128, OS_LOG_TYPE_INFO, "%{public}@Updated application data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v126);
    objc_msgSend(v6, "applicationData");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setApplicationData:](v127, "setApplicationData:", v130);

    -[HMAccessory _privateDelegate](v127, "_privateDelegate");
    v131 = (char *)objc_claimAutoreleasedReturnValue();
    v132 = (void *)MEMORY[0x1A1AC1AAC]();
    v133 = v127;
    HMFGetOSLogHandle();
    v134 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v135 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v135;
      v631 = 2112;
      v632 = v131;
      _os_log_impl(&dword_19B1B0000, v134, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update application data with delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v132);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v133, "context");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "queue");
      v137 = objc_claimAutoreleasedReturnValue();
      v602[0] = v12;
      v602[1] = 3221225472;
      v602[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_839;
      v602[3] = &unk_1E3AB5ED8;
      v602[4] = v133;
      v603 = v131;
      dispatch_async(v137, v602);

    }
    v17 = 1;
  }
  objc_msgSend(v6, "room");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory room](self, "room");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "uuid");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v554 = v138;
  objc_msgSend(v138, "uuid");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v140, "isEqual:", v141);

  if ((v142 & 1) == 0)
  {
    objc_msgSend(v554, "uuid");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v556, "roomWithUUID:", v143);
    v144 = (char *)objc_claimAutoreleasedReturnValue();

    if (v144)
    {
      -[HMAccessory setRoom:](self, "setRoom:", v144);
    }
    else
    {
      v145 = (void *)MEMORY[0x1A1AC1AAC]();
      v146 = self;
      HMFGetOSLogHandle();
      v147 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v148 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v554, "uuid");
        v149 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v148;
        v631 = 2112;
        v632 = v149;
        _os_log_impl(&dword_19B1B0000, v147, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find HMRoom for updated room UUID via merge: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v145);
    }
    objc_msgSend(v556, "delegate");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = (void *)MEMORY[0x1A1AC1AAC]();
    v152 = self;
    HMFGetOSLogHandle();
    v153 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v154 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v630 = v154;
      v631 = 2112;
      v632 = v144;
      v633 = 2112;
      v634 = v152;
      v635 = 2112;
      v636 = v150;
      _os_log_impl(&dword_19B1B0000, v153, OS_LOG_TYPE_INFO, "%{public}@Notifying client did update room: %@ for accessory: %@ delegate: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v151);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v152, "context");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "queue");
      v156 = objc_claimAutoreleasedReturnValue();
      v598[0] = v12;
      v598[1] = 3221225472;
      v598[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_843;
      v598[3] = &unk_1E3AB59E8;
      v598[4] = v152;
      v599 = v150;
      v600 = v556;
      v601 = v144;
      dispatch_async(v156, v598);

    }
    v17 = 1;
  }
  v157 = -[HMAccessory paired](self, "paired");
  v158 = v157 ^ objc_msgSend(v6, "paired");
  if (v158 == 1)
  {
    -[HMAccessory setPaired:](self, "setPaired:", objc_msgSend(v6, "paired"));
    v17 = 1;
  }
  v159 = -[HMAccessory suspendedState](self, "suspendedState");
  if (v159 != objc_msgSend(v6, "suspendedState"))
  {
    -[HMAccessory setSuspendedState:](self, "setSuspendedState:", objc_msgSend(v6, "suspendedState"));
    v158 = 1;
    v17 = 1;
  }
  v160 = -[HMAccessory supportsAccessCodes](self, "supportsAccessCodes");
  if (v160 != objc_msgSend(v6, "supportsAccessCodes"))
  {
    -[HMAccessory setSupportsAccessCodes:](self, "setSupportsAccessCodes:", objc_msgSend(v6, "supportsAccessCodes"));
    v17 = 1;
  }
  v161 = -[HMAccessory supportsWalletKey](self, "supportsWalletKey");
  if (v161 != objc_msgSend(v6, "supportsWalletKey"))
  {
    -[HMAccessory setSupportsWalletKey:](self, "setSupportsWalletKey:", objc_msgSend(v6, "supportsWalletKey"));
    -[HMAccessory context](self, "context");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "queue");
    v163 = objc_claimAutoreleasedReturnValue();
    v597[0] = MEMORY[0x1E0C809B0];
    v597[1] = 3221225472;
    v597[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3_845;
    v597[3] = &unk_1E3AB5E18;
    v597[4] = self;
    dispatch_async(v163, v597);

    v17 = 1;
  }
  v164 = -[HMAccessory supportsUWBUnlock](self, "supportsUWBUnlock");
  if (v164 != objc_msgSend(v6, "supportsUWBUnlock"))
  {
    -[HMAccessory setSupportsUWBUnlock:](self, "setSupportsUWBUnlock:", objc_msgSend(v6, "supportsUWBUnlock"));
    -[HMAccessory context](self, "context");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "queue");
    v166 = objc_claimAutoreleasedReturnValue();
    v596[0] = MEMORY[0x1E0C809B0];
    v596[1] = 3221225472;
    v596[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4_846;
    v596[3] = &unk_1E3AB5E18;
    v596[4] = self;
    dispatch_async(v166, v596);

    v17 = 1;
  }
  -[HMAccessory readerGroupSubIdentifierACWG](self, "readerGroupSubIdentifierACWG");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readerGroupSubIdentifierACWG");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = HMFEqualObjects();

  if ((v169 & 1) == 0)
  {
    v170 = (void *)MEMORY[0x1A1AC1AAC]();
    v171 = self;
    HMFGetOSLogHandle();
    v172 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v173 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory readerGroupSubIdentifierACWG](v171, "readerGroupSubIdentifierACWG");
      v174 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readerGroupSubIdentifierACWG");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v173;
      v631 = 2112;
      v632 = v174;
      v633 = 2112;
      v634 = v175;
      _os_log_impl(&dword_19B1B0000, v172, OS_LOG_TYPE_INFO, "%{public}@Updating readerGroupSubIdentifierACWG from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v170);
    objc_msgSend(v6, "readerGroupSubIdentifierACWG");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setReaderGroupSubIdentifierACWG:](v171, "setReaderGroupSubIdentifierACWG:", v176);

    v17 = 1;
  }
  -[HMAccessory readerIDACWG](self, "readerIDACWG");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readerIDACWG");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = HMFEqualObjects();

  if ((v179 & 1) == 0)
  {
    v180 = (void *)MEMORY[0x1A1AC1AAC]();
    v181 = self;
    HMFGetOSLogHandle();
    v182 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v183 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory readerIDACWG](v181, "readerIDACWG");
      v184 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readerIDACWG");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v183;
      v631 = 2112;
      v632 = v184;
      v633 = 2112;
      v634 = v185;
      _os_log_impl(&dword_19B1B0000, v182, OS_LOG_TYPE_INFO, "%{public}@Updating readerIDACWG from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v180);
    objc_msgSend(v6, "readerIDACWG");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setReaderIDACWG:](v181, "setReaderIDACWG:", v186);

    v17 = 1;
  }
  v187 = -[HMAccessory suspendCapable](self, "suspendCapable");
  if (v187 != objc_msgSend(v6, "suspendCapable"))
  {
    if (-[HMAccessory suspendCapable](self, "suspendCapable"))
      -[HMAccessory setReachable:](self, "setReachable:", 1);
    -[HMAccessory setSuspendCapable:](self, "setSuspendCapable:", objc_msgSend(v6, "suspendCapable"));
    v17 = 1;
  }
  if (-[HMAccessory suspendCapable](self, "suspendCapable"))
    objc_msgSend(v6, "setReachable:", 1);
  v188 = -[HMAccessory isReachable](self, "isReachable");
  if (v188 == objc_msgSend(v6, "isReachable"))
  {
    if (!v158)
      goto LABEL_133;
  }
  else
  {
    v189 = (void *)MEMORY[0x1A1AC1AAC]();
    v190 = self;
    HMFGetOSLogHandle();
    v191 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v192 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory isReachable](v190, "isReachable");
      HMFBooleanToString();
      v193 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isReachable");
      HMFBooleanToString();
      v194 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v192;
      v631 = 2112;
      v632 = v193;
      v633 = 2112;
      v634 = v194;
      _os_log_impl(&dword_19B1B0000, v191, OS_LOG_TYPE_INFO, "%{public}@Updating isReachable from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v189);
    -[HMAccessory setReachable:](v190, "setReachable:", objc_msgSend(v6, "isReachable"));
    v17 = 1;
  }
  -[HMAccessory delegate](self, "delegate");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "queue");
    v197 = objc_claimAutoreleasedReturnValue();
    v594[0] = MEMORY[0x1E0C809B0];
    v594[1] = 3221225472;
    v594[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_848;
    v594[3] = &unk_1E3AB5ED8;
    v594[4] = self;
    v595 = v195;
    dispatch_async(v197, v594);

  }
LABEL_133:
  v198 = -[HMAccessory reachableTransports](self, "reachableTransports");
  v199 = objc_msgSend(v6, "reachableTransports");
  v200 = MEMORY[0x1E0C809B0];
  if (v198 != v199)
  {
    -[HMAccessory setReachableTransports:](self, "setReachableTransports:", objc_msgSend(v6, "reachableTransports"));
    -[HMAccessory delegate](self, "delegate");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v201, "conformsToProtocol:", &unk_1EE45A8F8))
      v202 = v201;
    else
      v202 = 0;
    v203 = v202;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "queue");
      v205 = objc_claimAutoreleasedReturnValue();
      v592[0] = v200;
      v592[1] = 3221225472;
      v592[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3_851;
      v592[3] = &unk_1E3AB5ED8;
      v592[4] = self;
      v593 = v203;
      dispatch_async(v205, v592);

    }
    v17 = 1;
  }
  v206 = -[HMAccessory isControllable](self, "isControllable");
  if (v206 != objc_msgSend(v6, "isControllable"))
  {
    -[HMAccessory setControllable:](self, "setControllable:", objc_msgSend(v6, "isControllable"));
    -[HMAccessory context](self, "context");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "queue");
    v208 = objc_claimAutoreleasedReturnValue();
    v591[0] = v200;
    v591[1] = 3221225472;
    v591[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_5_853;
    v591[3] = &unk_1E3AB5E18;
    v591[4] = self;
    dispatch_async(v208, v591);

    v17 = 1;
  }
  v209 = -[HMAccessory accessoryReprovisionState](self, "accessoryReprovisionState");
  if (v209 != objc_msgSend(v6, "accessoryReprovisionState"))
  {
    -[HMAccessory setAccessoryReprovisionState:](self, "setAccessoryReprovisionState:", objc_msgSend(v6, "accessoryReprovisionState"));
    objc_msgSend(v556, "delegate");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v210, "conformsToProtocol:", &unk_1EE45A110))
      v211 = v210;
    else
      v211 = 0;
    v212 = v211;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "queue");
      v214 = objc_claimAutoreleasedReturnValue();
      v588[0] = v200;
      v588[1] = 3221225472;
      v588[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_6_966;
      v588[3] = &unk_1E3AB5CD0;
      v588[4] = self;
      v589 = v212;
      v590 = v556;
      dispatch_async(v214, v588);

    }
    v17 = 1;
  }
  -[HMAccessory firmwareVersion](self, "firmwareVersion");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firmwareVersion");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = HMFEqualObjects();

  if ((v217 & 1) == 0)
  {
    objc_msgSend(v6, "firmwareVersion");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v218);

    -[HMAccessory delegate](self, "delegate");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "queue");
      v221 = objc_claimAutoreleasedReturnValue();
      v586[0] = v200;
      v586[1] = 3221225472;
      v586[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_8;
      v586[3] = &unk_1E3AB5ED8;
      v586[4] = self;
      v587 = v219;
      dispatch_async(v221, v586);

    }
  }
  -[HMAccessory delegate](self, "delegate");
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v222, "conformsToProtocol:", &unk_1EE45A8F8))
    v223 = v222;
  else
    v223 = 0;
  v224 = v223;

  -[HMAccessory bundleID](self, "bundleID");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = HMFEqualObjects();

  if ((v227 & 1) == 0)
  {
    objc_msgSend(v6, "bundleID");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setBundleID:](self, "setBundleID:", v228);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "queue");
      v230 = objc_claimAutoreleasedReturnValue();
      v584[0] = v200;
      v584[1] = 3221225472;
      v584[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_10;
      v584[3] = &unk_1E3AB5ED8;
      v584[4] = self;
      v585 = v224;
      dispatch_async(v230, v584);

    }
  }
  -[HMAccessory storeID](self, "storeID");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storeID");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = HMFEqualObjects();

  if ((v233 & 1) == 0)
  {
    objc_msgSend(v6, "storeID");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setStoreID:](self, "setStoreID:", v234);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "queue");
      v236 = objc_claimAutoreleasedReturnValue();
      v582[0] = v200;
      v582[1] = 3221225472;
      v582[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_12;
      v582[3] = &unk_1E3AB5ED8;
      v582[4] = self;
      v583 = v224;
      dispatch_async(v236, v582);

    }
  }
  v237 = -[HMAccessory isFirmwareUpdateAvailable](self, "isFirmwareUpdateAvailable");
  if (v237 != objc_msgSend(v6, "isFirmwareUpdateAvailable"))
  {
    -[HMAccessory setFirmwareUpdateAvailable:](self, "setFirmwareUpdateAvailable:", objc_msgSend(v6, "isFirmwareUpdateAvailable"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "queue");
      v239 = objc_claimAutoreleasedReturnValue();
      v580[0] = v200;
      v580[1] = 3221225472;
      v580[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_14;
      v580[3] = &unk_1E3AB5ED8;
      v580[4] = self;
      v581 = v224;
      dispatch_async(v239, v580);

    }
  }
  if (objc_msgSend(v6, "hasOnboardedForNaturalLighting")
    && !-[HMAccessory hasOnboardedForNaturalLighting](self, "hasOnboardedForNaturalLighting"))
  {
    v240 = (void *)MEMORY[0x1A1AC1AAC]();
    v241 = self;
    HMFGetOSLogHandle();
    v242 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v242, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v243 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v630 = v243;
      _os_log_impl(&dword_19B1B0000, v242, OS_LOG_TYPE_INFO, "%{public}@Updating has onboarded accessory for natural lighting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v240);
    -[HMAccessory setHasOnboardedForNaturalLighting:](v241, "setHasOnboardedForNaturalLighting:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v241, "context");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v244, "queue");
      v245 = objc_claimAutoreleasedReturnValue();
      v578[0] = v200;
      v578[1] = 3221225472;
      v578[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_972;
      v578[3] = &unk_1E3AB5ED8;
      v578[4] = v241;
      v579 = v224;
      dispatch_async(v245, v578);

    }
  }
  if (_os_feature_enabled_impl())
  {
    v246 = -[HMAccessory supportsDiagnosticsTransfer](self, "supportsDiagnosticsTransfer");
    if (v246 != objc_msgSend(v6, "supportsDiagnosticsTransfer")
      || (-[HMAccessory supportedDiagnostics](self, "supportedDiagnostics"),
          v247 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "supportedDiagnostics"),
          v248 = (void *)objc_claimAutoreleasedReturnValue(),
          v248,
          v247,
          v247 != v248))
    {
      v249 = (void *)MEMORY[0x1A1AC1AAC]();
      v250 = self;
      HMFGetOSLogHandle();
      v251 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v251, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v252 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "supportedDiagnostics");
        v253 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v252;
        v631 = 2112;
        v632 = v253;
        _os_log_impl(&dword_19B1B0000, v251, OS_LOG_TYPE_INFO, "%{public}@Updating diagnostics support to %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v249);
      -[HMAccessory setSupportsDiagnosticsTransfer:](v250, "setSupportsDiagnosticsTransfer:", objc_msgSend(v6, "supportsDiagnosticsTransfer"));
      objc_msgSend(v6, "supportedDiagnostics");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory setSupportedDiagnostics:](v250, "setSupportedDiagnostics:", v254);

      -[HMAccessory context](v250, "context");
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "queue");
      v256 = objc_claimAutoreleasedReturnValue();
      v577[0] = v200;
      v577[1] = 3221225472;
      v577[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_974;
      v577[3] = &unk_1E3AB5E18;
      v577[4] = v250;
      dispatch_async(v256, v577);

    }
  }
  v257 = -[HMAccessory isCurrentAccessory](self, "isCurrentAccessory");
  if (v257 != objc_msgSend(v6, "isCurrentAccessory"))
    -[HMAccessory setCurrentAccessory:](self, "setCurrentAccessory:", objc_msgSend(v6, "isCurrentAccessory"));
  -[HMAccessory manufacturer](self, "manufacturer");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manufacturer");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = HMFEqualObjects();

  if ((v260 & 1) == 0)
  {
    objc_msgSend(v6, "manufacturer");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setManufacturer:](self, "setManufacturer:", v261);

  }
  -[HMAccessory model](self, "model");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  v264 = HMFEqualObjects();

  if ((v264 & 1) == 0)
  {
    objc_msgSend(v6, "model");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setModel:](self, "setModel:", v265);

  }
  -[HMAccessory serialNumber](self, "serialNumber");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialNumber");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = HMFEqualObjects();

  if ((v268 & 1) == 0)
  {
    objc_msgSend(v6, "serialNumber");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setSerialNumber:](self, "setSerialNumber:", v269);

  }
  -[HMAccessory accountIdentifier](self, "accountIdentifier");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountIdentifier");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = HMFEqualObjects();

  if ((v272 & 1) == 0)
  {
    objc_msgSend(v6, "accountIdentifier");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAccountIdentifier:](self, "setAccountIdentifier:", v273);

  }
  v274 = -[HMAccessory supportsIdentify](self, "supportsIdentify");
  if (v274 != objc_msgSend(v6, "supportsIdentify"))
    -[HMAccessory setSupportsIdentify:](self, "setSupportsIdentify:", objc_msgSend(v6, "supportsIdentify"));
  -[HMAccessory accessoryFlags](self, "accessoryFlags");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryFlags");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = HMFEqualObjects();

  if ((v277 & 1) == 0)
  {
    objc_msgSend(v6, "accessoryFlags");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v278, "integerValue") & 1) != 0)
      v279 = 1;
    else
      v279 = 2;

    if (-[HMAccessory additionalSetupStatus](self, "additionalSetupStatus") != v279)
    {
      -[HMAccessory setAdditionalSetupStatus:](self, "setAdditionalSetupStatus:", v279);
      -[HMAccessory context](self, "context");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "queue");
      v281 = objc_claimAutoreleasedReturnValue();
      v576[0] = v200;
      v576[1] = 3221225472;
      v576[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_975;
      v576[3] = &unk_1E3AB5E18;
      v576[4] = self;
      dispatch_async(v281, v576);

      v17 = 1;
    }
    objc_msgSend(v6, "accessoryFlags");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v283 = objc_msgSend(v282, "integerValue");
    if ((v283 & 2) != 0)
      v284 = 1;
    else
      v284 = 2;

    if (-[HMAccessory calibrationStatus](self, "calibrationStatus") != v284)
    {
      v285 = (void *)MEMORY[0x1A1AC1AAC]();
      v286 = self;
      HMFGetOSLogHandle();
      v287 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v287, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v288 = (id)objc_claimAutoreleasedReturnValue();
        v289 = -[HMAccessory calibrationStatus](v286, "calibrationStatus");
        v290 = "Unknown";
        if (v289 == 1)
          v290 = "InProgress";
        if (v289 == 2)
          v290 = "Complete";
        *(_DWORD *)buf = 138543874;
        v630 = v288;
        v631 = 2080;
        v632 = v290;
        if ((v283 & 2) != 0)
          v291 = "InProgress";
        else
          v291 = "Complete";
        v633 = 2080;
        v634 = (id)v291;
        _os_log_impl(&dword_19B1B0000, v287, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated from %s to %s", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v285);
      -[HMAccessory setCalibrationStatus:](v286, "setCalibrationStatus:", v284);
      -[HMAccessory context](v286, "context");
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "queue");
      v293 = objc_claimAutoreleasedReturnValue();
      v575[0] = v200;
      v575[1] = 3221225472;
      v575[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_976;
      v575[3] = &unk_1E3AB5E18;
      v575[4] = v286;
      dispatch_async(v293, v575);

      v17 = 1;
    }
    objc_msgSend(v6, "accessoryFlags");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAccessoryFlags:](self, "setAccessoryFlags:", v294);

    -[HMAccessory setCalibrationStatus:](self, "setCalibrationStatus:", objc_msgSend(v6, "calibrationStatus"));
  }
  v295 = -[HMAccessory certificationStatus](self, "certificationStatus");
  if (v295 != objc_msgSend(v6, "certificationStatus"))
    -[HMAccessory setCertificationStatus:](self, "setCertificationStatus:", objc_msgSend(v6, "certificationStatus"));
  -[HMAccessory setBridgedAccessory:](self, "setBridgedAccessory:", objc_msgSend(v6, "bridgedAccessory"));
  objc_msgSend(v6, "uniqueIdentifiersForBridgedAccessories");
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory setUniqueIdentifiersForBridgedAccessories:](self, "setUniqueIdentifiersForBridgedAccessories:", v296);

  -[HMAccessory category](self, "category");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = HMFEqualObjects();

  if ((v299 & 1) == 0)
  {
    v300 = (void *)MEMORY[0x1A1AC1AAC]();
    v301 = self;
    HMFGetOSLogHandle();
    v302 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v303 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory category](v301, "category");
      v304 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v303;
      v631 = 2112;
      v632 = v304;
      v633 = 2112;
      v634 = v305;
      _os_log_impl(&dword_19B1B0000, v302, OS_LOG_TYPE_INFO, "%{public}@Updating category: %@ with new category: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v300);
    objc_msgSend(v6, "category");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setCategory:](v301, "setCategory:", v306);

    v17 = 1;
  }
  objc_msgSend(v6, "accessoryProfiles");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "array");
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory _mergeProfiles:](self, "_mergeProfiles:", v308);

  if (!-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings")
    && (objc_msgSend(v6, "supportsMessagedHomePodSettings") & 1) == 0)
  {
    objc_msgSend(v6, "settings");
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory settings](self, "settings");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    v311 = (v309 == 0) ^ (v310 != 0);

    v312 = (void *)MEMORY[0x1A1AC1AAC]();
    if ((v311 & 1) != 0)
    {
      -[HMAccessory settings](self, "settings");
      v313 = (void *)objc_claimAutoreleasedReturnValue();
      v314 = objc_msgSend(v313, "mergeFromNewObject:", v309);

      if (v314)
      {
        v315 = (void *)MEMORY[0x1A1AC1AAC]();
        v316 = self;
        HMFGetOSLogHandle();
        v317 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v317, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v318 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v309, "longDescription");
          v319 = (char *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v630 = v318;
          v631 = 2112;
          v632 = v319;
          _os_log_impl(&dword_19B1B0000, v317, OS_LOG_TYPE_INFO, "%{public}@Merged settings: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v315);
        v17 = 1;
        v200 = MEMORY[0x1E0C809B0];
      }
      objc_autoreleasePoolPop(v312);
    }
    else
    {
      v320 = self;
      HMFGetOSLogHandle();
      v321 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v322 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v309, "longDescription");
        v323 = (char *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v322;
        v631 = 2112;
        v632 = v323;
        _os_log_impl(&dword_19B1B0000, v321, OS_LOG_TYPE_DEFAULT, "%{public}@Updating settings: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v312);
      -[HMAccessory setSettings:](v320, "setSettings:", v309);
      -[HMAccessory context](v320, "context");
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "queue");
      v325 = objc_claimAutoreleasedReturnValue();
      v573[0] = v200;
      v573[1] = 3221225472;
      v573[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_977;
      v573[3] = &unk_1E3AB5ED8;
      v573[4] = v320;
      v574 = v309;
      dispatch_async(v325, v573);

      v17 = 1;
    }

  }
  objc_msgSend(v6, "device");
  v326 = (char *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory device](self, "device");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v328 = HMFEqualObjects();

  if ((v328 & 1) != 0)
  {
    -[HMAccessory device](self, "device");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    v330 = objc_msgSend(v329, "mergeFromNewObject:", v326);

    if (!v330)
      goto LABEL_238;
  }
  else
  {
    v331 = (void *)MEMORY[0x1A1AC1AAC]();
    v332 = self;
    HMFGetOSLogHandle();
    v333 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v333, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v334 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v334;
      v631 = 2112;
      v632 = v326;
      _os_log_impl(&dword_19B1B0000, v333, OS_LOG_TYPE_INFO, "%{public}@Updating device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v331);
    -[HMAccessory setDevice:](v332, "setDevice:", v326);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v335, "queue");
    v336 = objc_claimAutoreleasedReturnValue();
    v571[0] = v200;
    v571[1] = 3221225472;
    v571[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_979;
    v571[3] = &unk_1E3AB5ED8;
    v571[4] = self;
    v572 = v224;
    dispatch_async(v336, v571);

  }
  v17 = 1;
LABEL_238:

  -[HMAccessory deviceIRKData](self, "deviceIRKData");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIRKData");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  v339 = HMFEqualObjects();

  if ((v339 & 1) == 0)
  {
    v340 = (void *)MEMORY[0x1A1AC1AAC]();
    v341 = self;
    HMFGetOSLogHandle();
    v342 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v342, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v343 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceIRKData");
      v344 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v343;
      v631 = 2112;
      v632 = v344;
      _os_log_impl(&dword_19B1B0000, v342, OS_LOG_TYPE_INFO, "%{public}@Updating deviceIRKData: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v340);
    objc_msgSend(v6, "deviceIRKData");
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setDeviceIRKData:](v341, "setDeviceIRKData:", v345);

    v17 = 1;
  }
  objc_msgSend(v6, "softwareVersion");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory softwareVersion](self, "softwareVersion");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = HMFEqualObjects();

  if ((v348 & 1) == 0)
  {
    -[HMAccessory setSoftwareVersion:](self, "setSoftwareVersion:", v346);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v349, "queue");
      v350 = objc_claimAutoreleasedReturnValue();
      v568[0] = v200;
      v568[1] = 3221225472;
      v568[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_982;
      v568[3] = &unk_1E3AB5CD0;
      v568[4] = self;
      v569 = v224;
      v570 = v346;
      dispatch_async(v350, v568);

    }
    v17 = 1;
  }
  -[HMAccessory softwareUpdateController](self, "softwareUpdateController");
  v351 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "softwareUpdateController");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v353 = v352;
  if (!v351)
  {
    -[HMAccessory setSoftwareUpdateController:](self, "setSoftwareUpdateController:", v352);

    -[HMAccessory softwareUpdateController](self, "softwareUpdateController");
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory context](self, "context");
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v354, "configureWithContext:accessory:", v355, self);
    goto LABEL_250;
  }

  if (v353)
  {
    -[HMAccessory softwareUpdateController](self, "softwareUpdateController");
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "softwareUpdateController");
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v354, "mergeFromNewObject:", v355);
LABEL_250:

    goto LABEL_252;
  }
  -[HMAccessory setSoftwareUpdateController:](self, "setSoftwareUpdateController:", 0);
LABEL_252:
  objc_msgSend(v6, "remoteLoginHandler");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  v357 = -[HMAccessory _mergeRemoteLoginHandler:](self, "_mergeRemoteLoginHandler:", v356);

  v358 = -[HMAccessory _updateHasSymptomsHandler:](self, "_updateHasSymptomsHandler:", objc_msgSend(v6, "hasSymptomsHandler"));
  v359 = -[HMAccessory supportsMediaAccessControl](self, "supportsMediaAccessControl");
  if (v359 == objc_msgSend(v6, "supportsMediaAccessControl"))
  {
    LODWORD(v50) = (v358 || v357) | v17;
  }
  else
  {
    -[HMAccessory setSupportsMediaAccessControl:](self, "setSupportsMediaAccessControl:", objc_msgSend(v6, "supportsMediaAccessControl"));
    LODWORD(v50) = 1;
  }
  v360 = -[HMAccessory supportsMediaContentProfile](self, "supportsMediaContentProfile");
  if (v360 != objc_msgSend(v6, "supportsMediaContentProfile"))
  {
    v361 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v362 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v362, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v363 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsMediaContentProfile](v50, "supportsMediaContentProfile");
      HMFBooleanToString();
      v364 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsMediaContentProfile");
      HMFBooleanToString();
      v365 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v363;
      v631 = 2112;
      v632 = v364;
      v633 = 2112;
      v634 = v365;
      _os_log_impl(&dword_19B1B0000, v362, OS_LOG_TYPE_INFO, "%{public}@Updating supportsMediaContentProfile from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v361);
    -[HMAccessory setSupportsMediaContentProfile:](v50, "setSupportsMediaContentProfile:", objc_msgSend(v6, "supportsMediaContentProfile"));
    -[HMAccessory context](v50, "context");
    v366 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v366, "queue");
    v367 = objc_claimAutoreleasedReturnValue();
    v200 = MEMORY[0x1E0C809B0];
    v567[0] = MEMORY[0x1E0C809B0];
    v567[1] = 3221225472;
    v567[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_984;
    v567[3] = &unk_1E3AB5E18;
    v567[4] = v50;
    dispatch_async(v367, v567);

    LODWORD(v50) = 1;
  }
  v368 = -[HMAccessory supportsCHIP](self, "supportsCHIP");
  if (v368 != objc_msgSend(v6, "supportsCHIP"))
  {
    v369 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v370 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v370, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v371 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsCHIP](v50, "supportsCHIP");
      HMFBooleanToString();
      v372 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsCHIP");
      HMFBooleanToString();
      v373 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v371;
      v631 = 2112;
      v632 = v372;
      v633 = 2112;
      v634 = v373;
      _os_log_impl(&dword_19B1B0000, v370, OS_LOG_TYPE_INFO, "%{public}@Updating supportsCHIP from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v369);
    -[HMAccessory setSupportsCHIP:](v50, "setSupportsCHIP:", objc_msgSend(v6, "supportsCHIP"));
    LODWORD(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  v374 = -[HMAccessory knownToSystemCommissioner](self, "knownToSystemCommissioner");
  if (v374 != objc_msgSend(v6, "knownToSystemCommissioner"))
  {
    v375 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v376 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v377 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory knownToSystemCommissioner](v50, "knownToSystemCommissioner");
      HMFBooleanToString();
      v378 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "knownToSystemCommissioner");
      HMFBooleanToString();
      v379 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v377;
      v631 = 2112;
      v632 = v378;
      v633 = 2112;
      v634 = v379;
      _os_log_impl(&dword_19B1B0000, v376, OS_LOG_TYPE_INFO, "%{public}@Updating knownToSystemCommissioner from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v375);
    -[HMAccessory setKnownToSystemCommissioner:](v50, "setKnownToSystemCommissioner:", objc_msgSend(v6, "knownToSystemCommissioner"));
    LODWORD(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  -[HMAccessory rootPublicKey](self, "rootPublicKey");
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootPublicKey");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v382 = HMFEqualObjects();

  v555 = v224;
  if ((v382 & 1) == 0)
  {
    v383 = (void *)MEMORY[0x1A1AC1AAC]();
    v384 = self;
    HMFGetOSLogHandle();
    v385 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v385, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v386 = (id)objc_claimAutoreleasedReturnValue();
      v552 = v383;
      v387 = (void *)MEMORY[0x1E0CB37E8];
      -[HMAccessory rootPublicKey](v384, "rootPublicKey");
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v387, "numberWithUnsignedInteger:", objc_msgSend(v388, "hash"));
      v389 = (char *)objc_claimAutoreleasedReturnValue();
      v390 = v346;
      v391 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "rootPublicKey");
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v391, "numberWithUnsignedInteger:", objc_msgSend(v392, "hash"));
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v386;
      v631 = 2112;
      v632 = v389;
      v633 = 2112;
      v634 = v393;
      _os_log_impl(&dword_19B1B0000, v385, OS_LOG_TYPE_INFO, "%{public}@Updating Root Public Key (Hash) from %@ to %@", buf, 0x20u);

      v346 = v390;
      v224 = v555;

      v383 = v552;
    }

    objc_autoreleasePoolPop(v383);
    LODWORD(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  -[HMAccessory nodeID](self, "nodeID");
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeID");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v396 = HMFEqualObjects();

  if ((v396 & 1) == 0)
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v397 = self;
    HMFGetOSLogHandle();
    v398 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v398, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v399 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory nodeID](v397, "nodeID");
      v400 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeID");
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v399;
      v631 = 2112;
      v632 = v400;
      v633 = 2112;
      v634 = v401;
      _os_log_impl(&dword_19B1B0000, v398, OS_LOG_TYPE_INFO, "%{public}@Updating NodeID from %@ to %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LODWORD(v50) = 1;
  }
  -[HMAccessory commissioningID](self, "commissioningID");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commissioningID");
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v404 = HMFEqualObjects();

  if ((v404 & 1) == 0)
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v405 = self;
    HMFGetOSLogHandle();
    v406 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v406, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v407 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory commissioningID](v405, "commissioningID");
      v408 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "commissioningID");
      v409 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v407;
      v631 = 2112;
      v632 = v408;
      v633 = 2112;
      v634 = v409;
      _os_log_impl(&dword_19B1B0000, v406, OS_LOG_TYPE_INFO, "%{public}@Updating commissioningID from %@ to %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LODWORD(v50) = 1;
  }
  -[HMAccessory vendorID](self, "vendorID");
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vendorID");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = HMFEqualObjects();

  if ((v412 & 1) == 0)
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v413 = self;
    HMFGetOSLogHandle();
    v414 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v414, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v415 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory vendorID](v413, "vendorID");
      v416 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vendorID");
      v417 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v415;
      v631 = 2112;
      v632 = v416;
      v633 = 2112;
      v634 = v417;
      _os_log_impl(&dword_19B1B0000, v414, OS_LOG_TYPE_INFO, "%{public}@Updating vendorID from %@ to %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LODWORD(v50) = 1;
  }
  -[HMAccessory productID](self, "productID");
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productID");
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v420 = HMFEqualObjects();

  if ((v420 & 1) == 0)
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v421 = self;
    HMFGetOSLogHandle();
    v422 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v422, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v423 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory productID](v421, "productID");
      v424 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productID");
      v425 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v423;
      v631 = 2112;
      v632 = v424;
      v633 = 2112;
      v634 = v425;
      _os_log_impl(&dword_19B1B0000, v422, OS_LOG_TYPE_INFO, "%{public}@Updating productID from %@ to %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LODWORD(v50) = 1;
  }
  v426 = -[HMAccessory requiresThreadRouter](self, "requiresThreadRouter");
  if (v426 != objc_msgSend(v6, "requiresThreadRouter"))
  {
    v427 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v428 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v428, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v429 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory requiresThreadRouter](v50, "requiresThreadRouter");
      HMFBooleanToString();
      v430 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requiresThreadRouter");
      HMFBooleanToString();
      v431 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v429;
      v631 = 2112;
      v632 = v430;
      v633 = 2112;
      v634 = v431;
      _os_log_impl(&dword_19B1B0000, v428, OS_LOG_TYPE_INFO, "%{public}@Updating requiresThreadRouter from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v427);
    -[HMAccessory setRequiresThreadRouter:](v50, "setRequiresThreadRouter:", objc_msgSend(v6, "requiresThreadRouter"));
    LODWORD(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  if (!-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
  {
    -[HMAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wifiNetworkInfo");
    v433 = (void *)objc_claimAutoreleasedReturnValue();
    v434 = HMFEqualObjects();

    if ((v434 & 1) == 0)
    {
      objc_msgSend(v6, "wifiNetworkInfo");
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory setWifiNetworkInfo:](self, "setWifiNetworkInfo:", v435);

      LODWORD(v50) = 1;
    }
  }
  -[HMAccessory networkProtectionGroupUUID](self, "networkProtectionGroupUUID");
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkProtectionGroupUUID");
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  v438 = HMFEqualObjects();

  if ((v438 & 1) == 0)
  {
    objc_msgSend(v6, "networkProtectionGroupUUID");
    v439 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setNetworkProtectionGroupUUID:](self, "setNetworkProtectionGroupUUID:", v439);

    LODWORD(v50) = 1;
  }
  -[HMAccessory audioDestination](self, "audioDestination");
  v440 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioDestination");
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  v442 = HMFEqualObjects();

  if ((v442 & 1) == 0)
  {
    v443 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v444 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v444, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v445 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory audioDestination](v50, "audioDestination");
      v446 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioDestination");
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v445;
      v631 = 2112;
      v632 = v446;
      v633 = 2112;
      v634 = v447;
      _os_log_impl(&dword_19B1B0000, v444, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ new audio destination: %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v443);
    objc_msgSend(v6, "audioDestination");
    v448 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAudioDestination:](v50, "setAudioDestination:", v448);

    -[HMAccessory context](v50, "context");
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v449, "queue");
    v450 = objc_claimAutoreleasedReturnValue();
    v566[0] = v200;
    v566[1] = 3221225472;
    v566[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_985;
    v566[3] = &unk_1E3AB5E18;
    v566[4] = v50;
    dispatch_async(v450, v566);

    LODWORD(v50) = 1;
  }
  -[HMAccessory audioDestinationController](self, "audioDestinationController");
  v451 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "audioDestinationController");
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  v453 = v452;
  if (v451)
  {

    if (v453)
    {
      -[HMAccessory audioDestinationController](self, "audioDestinationController");
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioDestinationController");
      v455 = (void *)objc_claimAutoreleasedReturnValue();
      v456 = objc_msgSend(v454, "mergeFromNewObject:", v455);

      if (!v456)
        goto LABEL_314;
      v457 = (void *)MEMORY[0x1A1AC1AAC]();
      v458 = self;
      HMFGetOSLogHandle();
      v459 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v459, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v460 = (id)objc_claimAutoreleasedReturnValue();
        -[HMAccessory audioDestinationController](v458, "audioDestinationController");
        v461 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v460;
        v631 = 2112;
        v632 = v461;
        _os_log_impl(&dword_19B1B0000, v459, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination controller: %@ due to accessory merge", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v457);
      -[HMAccessory context](v458, "context");
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v462, "queue");
      v463 = objc_claimAutoreleasedReturnValue();
      v464 = v463;
      v564[0] = v200;
      v564[1] = 3221225472;
      v564[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_987;
      v564[3] = &unk_1E3AB5E18;
      v564[4] = v458;
      v465 = v564;
    }
    else
    {
      v474 = (void *)MEMORY[0x1A1AC1AAC]();
      v475 = self;
      HMFGetOSLogHandle();
      v476 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v476, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v477 = (id)objc_claimAutoreleasedReturnValue();
        -[HMAccessory audioDestinationController](v475, "audioDestinationController");
        v478 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v630 = v477;
        v631 = 2112;
        v632 = v478;
        _os_log_impl(&dword_19B1B0000, v476, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination controller: %@ due to accessory merge", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v474);
      -[HMAccessory audioDestinationController](v475, "audioDestinationController");
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v479, "unconfigure");

      -[HMAccessory setAudioDestinationController:](v475, "setAudioDestinationController:", 0);
      -[HMAccessory context](v475, "context");
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v462, "queue");
      v463 = objc_claimAutoreleasedReturnValue();
      v464 = v463;
      v565[0] = v200;
      v565[1] = 3221225472;
      v565[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_986;
      v565[3] = &unk_1E3AB5E18;
      v565[4] = v475;
      v465 = v565;
    }
  }
  else
  {

    if (!v453)
      goto LABEL_314;
    v466 = (void *)MEMORY[0x1A1AC1AAC]();
    v467 = self;
    HMFGetOSLogHandle();
    v468 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v468, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v469 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioDestinationController");
      v470 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v469;
      v631 = 2112;
      v632 = v470;
      _os_log_impl(&dword_19B1B0000, v468, OS_LOG_TYPE_INFO, "%{public}@Adding new audio destination controller: %@ due to accessory merge", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v466);
    objc_msgSend(v6, "audioDestinationController");
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setAudioDestinationController:](v467, "setAudioDestinationController:", v471);

    -[HMAccessory audioDestinationController](v467, "audioDestinationController");
    v472 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory context](v467, "context");
    v473 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v472, "configureWithContext:dataSource:", v473, v467);

    -[HMAccessory context](v467, "context");
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v462, "queue");
    v463 = objc_claimAutoreleasedReturnValue();
    v464 = v463;
    v563[0] = v200;
    v563[1] = 3221225472;
    v563[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_988;
    v563[3] = &unk_1E3AB5E18;
    v563[4] = v467;
    v465 = v563;
  }
  dispatch_async(v463, v465);

  LODWORD(v50) = 1;
LABEL_314:
  objc_msgSend(v6, "audioAnalysisEventBulletinBoardNotification");
  v480 = (void *)objc_claimAutoreleasedReturnValue();

  if (v480)
  {
    -[HMAccessory audioAnalysisEventBulletinBoardNotification](self, "audioAnalysisEventBulletinBoardNotification");
    v481 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioAnalysisEventBulletinBoardNotification");
    v482 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = v50 | objc_msgSend(v481, "mergeFromNewObject:", v482);

  }
  if (-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings")
    || (objc_msgSend(v6, "supportsMessagedHomePodSettings") & 1) != 0)
  {
    goto LABEL_330;
  }
  v483 = -[HMAccessory preferredUserSelectionType](self, "preferredUserSelectionType");
  v484 = objc_msgSend(v6, "preferredUserSelectionType");
  if (v483 != v484)
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC](-[HMAccessory setPreferredUserSelectionType:](self, "setPreferredUserSelectionType:", objc_msgSend(v6, "preferredUserSelectionType")));
    v485 = self;
    HMFGetOSLogHandle();
    v486 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v486, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v487 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "preferredUserSelectionType"));
      v488 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v487;
      v631 = 2112;
      v632 = v488;
      _os_log_impl(&dword_19B1B0000, v486, OS_LOG_TYPE_INFO, "%{public}@Updating Preferred User selection type to%@", buf, 0x16u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LOBYTE(v50) = 1;
  }
  -[HMAccessory preferredMediaUserUUID](self, "preferredMediaUserUUID");
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredMediaUserUUID");
  v490 = (void *)objc_claimAutoreleasedReturnValue();
  v491 = HMFEqualObjects();

  if ((v491 & 1) != 0)
  {
    v492 = v483 == v484;
    v200 = MEMORY[0x1E0C809B0];
    if (v492)
      goto LABEL_330;
  }
  else
  {
    objc_msgSend(v6, "preferredMediaUserUUID");
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setPreferredMediaUserUUID:](self, "setPreferredMediaUserUUID:", v493);

    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v494 = self;
    HMFGetOSLogHandle();
    v495 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v495, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v496 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredMediaUserUUID");
      v497 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v496;
      v631 = 2112;
      v632 = v497;
      _os_log_impl(&dword_19B1B0000, v495, OS_LOG_TYPE_INFO, "%{public}@Updating Preferred Media User to %@", buf, 0x16u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v50);
    LOBYTE(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  -[HMAccessory context](self, "context");
  v498 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v498, "queue");
  v499 = objc_claimAutoreleasedReturnValue();
  v562[0] = v200;
  v562[1] = 3221225472;
  v562[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_989;
  v562[3] = &unk_1E3AB5E18;
  v562[4] = self;
  dispatch_async(v499, v562);

LABEL_330:
  v500 = -[HMAccessory supportsPrimaryUserInfoSubscription](self, "supportsPrimaryUserInfoSubscription");
  if (v500 != objc_msgSend(v6, "supportsPrimaryUserInfoSubscription"))
  {
    -[HMAccessory setSupportsPrimaryUserInfoSubscription:](self, "setSupportsPrimaryUserInfoSubscription:", objc_msgSend(v6, "supportsPrimaryUserInfoSubscription"));
    if (-[HMAccessory supportsPrimaryUserInfoSubscription](self, "supportsPrimaryUserInfoSubscription"))
      -[HMAccessory configureInfoDataProviderIfNeededWithOption:](self, "configureInfoDataProviderIfNeededWithOption:", 4);
    else
      -[HMAccessory unconfigureInfoDataProviderWithOptions:](self, "unconfigureInfoDataProviderWithOptions:", 4);
    LOBYTE(v50) = 1;
  }
  v501 = -[HMAccessory supportsPreferredMediaUser](self, "supportsPreferredMediaUser");
  if (v501 != objc_msgSend(v6, "supportsPreferredMediaUser"))
  {
    v502 = (void *)MEMORY[0x1A1AC1AAC](-[HMAccessory setSupportsPreferredMediaUser:](self, "setSupportsPreferredMediaUser:", objc_msgSend(v6, "supportsPreferredMediaUser")));
    v50 = self;
    HMFGetOSLogHandle();
    v503 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v503, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v504 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMAccessory supportsPreferredMediaUser](v50, "supportsPreferredMediaUser"));
      v505 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v630 = v504;
      v631 = 2112;
      v632 = v505;
      _os_log_impl(&dword_19B1B0000, v503, OS_LOG_TYPE_INFO, "%{public}@Updating supports Preferred Media User to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v502);
    -[HMAccessory context](v50, "context");
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v506, "queue");
    v507 = objc_claimAutoreleasedReturnValue();
    v561[0] = v200;
    v561[1] = 3221225472;
    v561[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_990;
    v561[3] = &unk_1E3AB5E18;
    v561[4] = v50;
    dispatch_async(v507, v561);

    LOBYTE(v50) = 1;
  }
  -[HMAccessory pendingConfigurationIdentifier](self, "pendingConfigurationIdentifier");
  v508 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingConfigurationIdentifier");
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  v510 = HMFEqualObjects();

  if ((v510 & 1) == 0)
  {
    v511 = (void *)MEMORY[0x1A1AC1AAC]();
    v512 = self;
    HMFGetOSLogHandle();
    v513 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v513, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v514 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory pendingConfigurationIdentifier](v512, "pendingConfigurationIdentifier");
      v515 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pendingConfigurationIdentifier");
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v514;
      v631 = 2112;
      v632 = v515;
      v633 = 2112;
      v634 = v516;
      _os_log_impl(&dword_19B1B0000, v513, OS_LOG_TYPE_INFO, "%{public}@Updating pendingConfigurationIdentifier from %@ to %@", buf, 0x20u);

      v224 = v555;
    }

    objc_autoreleasePoolPop(v511);
    objc_msgSend(v6, "pendingConfigurationIdentifier");
    v517 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setPendingConfigurationIdentifier:](v512, "setPendingConfigurationIdentifier:", v517);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](v512, "context");
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v518, "queue");
      v519 = objc_claimAutoreleasedReturnValue();
      v559[0] = v200;
      v559[1] = 3221225472;
      v559[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_992;
      v559[3] = &unk_1E3AB5ED8;
      v559[4] = v512;
      v560 = v224;
      dispatch_async(v519, v559);

    }
    LOBYTE(v50) = 1;
  }
  v520 = -[HMAccessory supportsManagedConfigurationProfile](self, "supportsManagedConfigurationProfile");
  if (v520 != objc_msgSend(v6, "supportsManagedConfigurationProfile"))
  {
    v521 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v522 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v522, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v523 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsManagedConfigurationProfile](v50, "supportsManagedConfigurationProfile");
      HMFBooleanToString();
      v524 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsManagedConfigurationProfile");
      HMFBooleanToString();
      v525 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v523;
      v631 = 2112;
      v632 = v524;
      v633 = 2112;
      v634 = v525;
      _os_log_impl(&dword_19B1B0000, v522, OS_LOG_TYPE_INFO, "%{public}@Updating supportsManagedConfigurationProfile from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v521);
    -[HMAccessory setSupportsManagedConfigurationProfile:](v50, "setSupportsManagedConfigurationProfile:", objc_msgSend(v6, "supportsManagedConfigurationProfile"));
    LOBYTE(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  v526 = -[HMAccessory productColor](self, "productColor");
  if (v526 != objc_msgSend(v6, "productColor"))
  {
    -[HMAccessory setProductColor:](self, "setProductColor:", objc_msgSend(v6, "productColor"));
    LOBYTE(v50) = 1;
  }
  v527 = -[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings");
  if (v527 != objc_msgSend(v6, "supportsMessagedHomePodSettings"))
  {
    v528 = (void *)MEMORY[0x1A1AC1AAC]();
    v529 = self;
    HMFGetOSLogHandle();
    v530 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v530, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v531 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsMessagedHomePodSettings](v529, "supportsMessagedHomePodSettings");
      HMFBooleanToString();
      v532 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsMessagedHomePodSettings");
      HMFBooleanToString();
      v533 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v531;
      v631 = 2112;
      v632 = v532;
      v633 = 2112;
      v634 = v533;
      _os_log_impl(&dword_19B1B0000, v530, OS_LOG_TYPE_DEFAULT, "%{public}@Updating supportsMessagedHomePodSettings from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v528);
    -[HMAccessory setSupportsMessagedHomePodSettings:](v529, "setSupportsMessagedHomePodSettings:", objc_msgSend(v6, "supportsMessagedHomePodSettings"));
    if (-[HMAccessory supportsMessagedHomePodSettings](v529, "supportsMessagedHomePodSettings"))
    {
      -[HMAccessory configureSettingsAdapterIfNeeded](v529, "configureSettingsAdapterIfNeeded");
      -[HMAccessory configureInfoDataProviderIfNeededWithOption:](v529, "configureInfoDataProviderIfNeededWithOption:", 5);
    }
    LOBYTE(v50) = 1;
    v200 = MEMORY[0x1E0C809B0];
  }
  v534 = -[HMAccessory supportsSoftwareUpdateV2](self, "supportsSoftwareUpdateV2");
  if (v534 != objc_msgSend(v6, "supportsSoftwareUpdateV2"))
  {
    -[HMAccessory setSupportsSoftwareUpdateV2:](self, "setSupportsSoftwareUpdateV2:", objc_msgSend(v6, "supportsSoftwareUpdateV2"));
    LOBYTE(v50) = 1;
  }
  v535 = -[HMAccessory supportsRMVonAppleTV](self, "supportsRMVonAppleTV");
  if (v535 != objc_msgSend(v6, "supportsRMVonAppleTV"))
  {
    v536 = (void *)MEMORY[0x1A1AC1AAC]();
    v50 = self;
    HMFGetOSLogHandle();
    v537 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v537, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v538 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsRMVonAppleTV](v50, "supportsRMVonAppleTV");
      HMFBooleanToString();
      v539 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsRMVonAppleTV");
      HMFBooleanToString();
      v540 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v538;
      v631 = 2112;
      v632 = v539;
      v633 = 2112;
      v634 = v540;
      _os_log_impl(&dword_19B1B0000, v537, OS_LOG_TYPE_INFO, "%{public}@Updating supportsRMVonAppleTV from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v536);
    -[HMAccessory setSupportsRMVonAppleTV:](v50, "setSupportsRMVonAppleTV:", objc_msgSend(v6, "supportsRMVonAppleTV"));
    -[HMAccessory context](v50, "context");
    v541 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v541, "queue");
    v542 = objc_claimAutoreleasedReturnValue();
    v200 = MEMORY[0x1E0C809B0];
    v558[0] = MEMORY[0x1E0C809B0];
    v558[1] = 3221225472;
    v558[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_994;
    v558[3] = &unk_1E3AB5E18;
    v558[4] = v50;
    dispatch_async(v542, v558);

    LOBYTE(v50) = 1;
  }
  v543 = -[HMAccessory supportsJustSiri](self, "supportsJustSiri");
  if (v543 != objc_msgSend(v6, "supportsJustSiri"))
  {
    v50 = (HMAccessory *)MEMORY[0x1A1AC1AAC]();
    v544 = self;
    HMFGetOSLogHandle();
    v545 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v545, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v546 = (id)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsJustSiri](v544, "supportsJustSiri");
      HMFBooleanToString();
      v547 = (char *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "supportsJustSiri");
      HMFBooleanToString();
      v548 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v630 = v546;
      v631 = 2112;
      v632 = v547;
      v633 = 2112;
      v634 = v548;
      _os_log_impl(&dword_19B1B0000, v545, OS_LOG_TYPE_INFO, "%{public}@Updating supportsJustSiri from %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v50);
    -[HMAccessory setSupportsJustSiri:](v544, "setSupportsJustSiri:", objc_msgSend(v6, "supportsJustSiri"));
    -[HMAccessory context](v544, "context");
    v549 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v549, "queue");
    v550 = objc_claimAutoreleasedReturnValue();
    v557[0] = v200;
    v557[1] = 3221225472;
    v557[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_995;
    v557[3] = &unk_1E3AB5E18;
    v557[4] = v544;
    dispatch_async(v550, v557);

    LOBYTE(v50) = 1;
  }

  v4 = v553;
LABEL_368:

  return (char)v50;
}

- (BOOL)_mergeRemoteLoginHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory remoteLoginHandler](self, "remoteLoginHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || v5)
  {
    -[HMAccessory remoteLoginHandler](self, "remoteLoginHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (v4 && v12)
    {
      -[HMAccessory remoteLoginHandler](self, "remoteLoginHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "mergeFromNewObject:", v4);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging new remote login handler: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMAccessory setRemoteLoginHandler:](v7, "setRemoteLoginHandler:", v4);
    -[HMAccessory context](v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_configureWithContext:accessory:", v10, v7);

    objc_msgSend(v4, "registerForMessages");
    objc_msgSend(v4, "postConfigure");
    v11 = 1;
  }

  return v11;
}

- (void)_mergeProfiles:(id)a3
{
  id v4;
  HMObjectMergeCollection *v5;
  void *v6;
  void *v7;
  HMObjectMergeCollection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMObjectMergeCollection alloc];
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v5, "initWithCurrentObjects:newObjects:", v7, v4);

  -[HMObjectMergeCollection removedObjects](v8, "removedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __30__HMAccessory__mergeProfiles___block_invoke;
  v28[3] = &unk_1E3AB2D90;
  v28[4] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v28);

  -[HMObjectMergeCollection addedObjects](v8, "addedObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __30__HMAccessory__mergeProfiles___block_invoke_997;
  v27[3] = &unk_1E3AB2D90;
  v27[4] = self;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v27);

  -[HMObjectMergeCollection mergeCommonObjects](v8, "mergeCommonObjects");
  -[HMObjectMergeCollection finalObjects](v8, "finalObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory accessoryProfiles](self, "accessoryProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setArray:", v12);

  -[HMObjectMergeCollection removedObjects](v8, "removedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __30__HMAccessory__mergeProfiles___block_invoke_998;
  v26[3] = &unk_1E3AB2D90;
  v26[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v26);

  -[HMObjectMergeCollection addedObjects](v8, "addedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __30__HMAccessory__mergeProfiles___block_invoke_1000;
  v25[3] = &unk_1E3AB2D90;
  v25[4] = self;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v25);

  if (-[HMObjectMergeCollection isModified](v8, "isModified"))
  {
    -[HMAccessory delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v20;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement accessory profile methods, calling didUpdateServices:. This                             behavior is not documented and will be removed in the near future. Please adopt                             accessory:didAddProfile: and/or accessory:didRemoveProfile:.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMAccessory context](v18, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "queue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __30__HMAccessory__mergeProfiles___block_invoke_1004;
      v23[3] = &unk_1E3AB5ED8;
      v23[4] = v18;
      v24 = v16;
      dispatch_async(v22, v23);

    }
  }

}

- (void)notifyDelegateOfAudioDestinationUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HMAccessory *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update audio destination using private delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __53__HMAccessory_notifyDelegateOfAudioDestinationUpdate__block_invoke;
      v16[3] = &unk_1E3AB5ED8;
      v17 = v7;
      v18 = v9;
      objc_msgSend(v4, "invokeBlock:", v16);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of audio destination update due to missing delegate caller from context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)notifyDelegateOfAudioDestinationControllerUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HMAccessory *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update audio destination controller using private delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__HMAccessory_notifyDelegateOfAudioDestinationControllerUpdate__block_invoke;
      v16[3] = &unk_1E3AB5ED8;
      v17 = v7;
      v18 = v9;
      objc_msgSend(v4, "invokeBlock:", v16);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of audio destination controller update due to missing delegate caller from context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)notifyDelegateUpdatedSupportsPreferredMediaUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HMAccessory *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated support for preferred media user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__HMAccessory_notifyDelegateUpdatedSupportsPreferredMediaUser__block_invoke;
      v16[3] = &unk_1E3AB5ED8;
      v17 = v7;
      v18 = v9;
      objc_msgSend(v4, "invokeBlock:", v16);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated preferred media user support due to missing delegateCaller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)notifyDelegateUpdatedPreferredMediaUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  HMAccessory *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated preferred media user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__HMAccessory_notifyDelegateUpdatedPreferredMediaUser__block_invoke;
      v16[3] = &unk_1E3AB5ED8;
      v17 = v7;
      v18 = v9;
      objc_msgSend(v4, "invokeBlock:", v16);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated preferred media user missing delegateCaller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)notifyDelegateUpdatedSupportsRMVonAppleTV
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMAccessory *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMAccessory *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsRMVonAppleTV](v9, "supportsRMVonAppleTV");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsRMVonAppleTV: %@, delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __56__HMAccessory_notifyDelegateUpdatedSupportsRMVonAppleTV__block_invoke;
      v17[3] = &unk_1E3AB5ED8;
      v18 = v7;
      v19 = v9;
      objc_msgSend(v4, "invokeBlock:", v17);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsRMVonAppleTV support due to missing delegateCaller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)notifyDelegateUpdatedSupportsJustSiri
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMAccessory *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMAccessory *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsJustSiri](v9, "supportsJustSiri");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsJustSiri: %@, delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__HMAccessory_notifyDelegateUpdatedSupportsJustSiri__block_invoke;
      v17[3] = &unk_1E3AB5ED8;
      v18 = v7;
      v19 = v9;
      objc_msgSend(v4, "invokeBlock:", v17);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsJustSiri support due to missing delegateCaller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)notifyDelegateUpdatedSupportsMediaContentProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMAccessory *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMAccessory *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMAccessory delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsMediaContentProfile](v9, "supportsMediaContentProfile");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsMediaContentProfile: %@, delegate: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__HMAccessory_notifyDelegateUpdatedSupportsMediaContentProfile__block_invoke;
      v17[3] = &unk_1E3AB5ED8;
      v18 = v7;
      v19 = v9;
      objc_msgSend(v4, "invokeBlock:", v17);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsMediaContentProfile support due to missing delegateCaller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)_handleCharacteristicValueUpdated:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  HMAccessory *v34;
  id v35;
  id v36;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "errorForKey:", CFSTR("kCharacteristicErrorDataKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeCompletionBlockForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6 && v8)
  {
    -[HMAccessory services](self, "services");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_firstObjectWithInstanceID:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v30 = v9;
      objc_msgSend(v15, "characteristics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hmf_firstObjectWithInstanceID:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v17;
      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v15;
        if (v8 == v18)
        {

          v8 = 0;
        }
        objc_msgSend(v17, "value");
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "headers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "hmf_dateForKey:", CFSTR("HMXPCMessageSentDateKey"));
        v20 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v20;
        objc_msgSend(v17, "_updateValue:valueUpdatedDate:", v8, v20);
        if (v13)
        {
          -[HMAccessory context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "delegateCaller");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v30;
          objc_msgSend(v22, "callCompletion:error:", v13, v30);

          v23 = (void *)v29;
          v15 = v27;
        }
        else
        {
          v9 = v30;
          v23 = (void *)v29;
          v15 = v27;
          if ((HMFEqualObjects() & 1) == 0)
          {
            -[HMAccessory delegate](self, "delegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[HMAccessory context](self, "context");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "delegateCaller");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v32[0] = MEMORY[0x1E0C809B0];
              v32[1] = 3221225472;
              v32[2] = __49__HMAccessory__handleCharacteristicValueUpdated___block_invoke;
              v32[3] = &unk_1E3AB59E8;
              v33 = v26;
              v34 = self;
              v35 = v27;
              v36 = v31;
              objc_msgSend(v24, "invokeBlock:", v32);

              v23 = (void *)v29;
            }

          }
        }

      }
      else
      {
        v9 = v30;
      }

    }
  }

}

- (void)_handleRenamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMAccessory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  HMAccessory *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kAccessoryName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeCompletionBlockForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMAccessory name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) != 0)
    {
      if (!v9)
        goto LABEL_11;
    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v15;
        v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated name: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMAccessory setName:](v13, "setName:", v5);
      if (!v9)
      {
        -[HMAccessory delegate](v13, "delegate");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_10;
        v18 = (void *)MEMORY[0x1A1AC1AAC]();
        v19 = v13;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v21;
          _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated name", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        -[HMAccessory context](v19, "context");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "delegateCaller");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __30__HMAccessory__handleRenamed___block_invoke;
        v24[3] = &unk_1E3AB5ED8;
        v16 = v16;
        v25 = v16;
        v26 = v19;
        objc_msgSend(v23, "invokeBlock:", v24);

        v17 = v25;
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    -[HMAccessory context](self, "context");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:", v9, 0);
    goto LABEL_9;
  }
LABEL_11:

}

- (void)_handlePairingStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  HMAccessory *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kAccessoryIsPairedKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    if ((_DWORD)v7 != -[HMAccessory paired](self, "paired"))
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessory paired](v9, "paired");
        HMFBooleanToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v11;
        v22 = 2112;
        v23 = v12;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating isPaired from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMAccessory setPaired:](v9, "setPaired:", v7);
      -[HMAccessory delegate](v9, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMAccessory context](v9, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "delegateCaller");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __42__HMAccessory__handlePairingStateChanged___block_invoke;
        v17[3] = &unk_1E3AB5ED8;
        v18 = v14;
        v19 = v9;
        objc_msgSend(v16, "invokeBlock:", v17);

      }
    }
  }

}

- (void)_handleAccessoryFlagsChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  HMAccessory *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "hmf_numberForKey:", CFSTR("HM.accessoryFlagsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "integerValue");
  v7 = -[HMAccessory additionalSetupStatus](self, "additionalSetupStatus");
  if ((v5 & 1) != 0)
  {
    if (v7 == 1)
      goto LABEL_7;
    v8 = 1;
  }
  else
  {
    if (v7 == 2)
      goto LABEL_7;
    v8 = 2;
  }
  -[HMAccessory setAdditionalSetupStatus:](self, "setAdditionalSetupStatus:", v8);
  -[HMAccessory _notifyDelegatesOfAdditionalSetupRequiredChange](self, "_notifyDelegatesOfAdditionalSetupRequiredChange");
LABEL_7:
  v9 = objc_msgSend(v6, "integerValue");
  v10 = -[HMAccessory calibrationStatus](self, "calibrationStatus");
  if ((v9 & 2) != 0)
  {
    if (v10 != 1)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v17;
        v15 = 1;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated to  HMAccessoryCalibrationStatusInProgress", (uint8_t *)&v18, 0xCu);

      }
      goto LABEL_15;
    }
  }
  else if (v10 != 2)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated to  HMAccessoryCalibrationStatusComplete", (uint8_t *)&v18, 0xCu);

    }
    v15 = 2;
LABEL_15:

    objc_autoreleasePoolPop(v11);
    -[HMAccessory setCalibrationStatus:](self, "setCalibrationStatus:", v15);
    -[HMAccessory _notifyDelegatesOfUpdatedCalibrationStatus](self, "_notifyDelegatesOfUpdatedCalibrationStatus");
  }
  -[HMAccessory setAccessoryFlags:](self, "setAccessoryFlags:", v6);

}

- (void)updateAccessoryInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  HMAccessory *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  HMAccessory *v44;
  char v45;
  _QWORD v46[4];
  id v47;
  HMAccessory *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  HMAccessory *v52;
  id v53;

  v4 = a3;
  -[HMAccessory delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A8F8))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryVendorInfoBundleIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    -[HMAccessory setBundleID:](self, "setBundleID:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegateCaller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke;
      v50[3] = &unk_1E3AB5CD0;
      v51 = v7;
      v52 = self;
      v53 = v8;
      objc_msgSend(v12, "invokeBlock:", v50);

    }
  }
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryVendorInfoStoreIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory storeID](self, "storeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    -[HMAccessory setStoreID:](self, "setStoreID:", v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_2;
      v46[3] = &unk_1E3AB5CD0;
      v47 = v7;
      v48 = self;
      v49 = v13;
      objc_msgSend(v17, "invokeBlock:", v46);

    }
  }
  v18 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("kAccessoryVendorInfoFirmwareUpdateAvailableKey"));
  if ((_DWORD)v18 != -[HMAccessory isFirmwareUpdateAvailable](self, "isFirmwareUpdateAvailable"))
  {
    -[HMAccessory setFirmwareUpdateAvailable:](self, "setFirmwareUpdateAvailable:", v18);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_3;
      v42[3] = &unk_1E3AB57F8;
      v43 = v7;
      v44 = self;
      v45 = v18;
      objc_msgSend(v20, "invokeBlock:", v42);

    }
  }
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryInfoManufacturerKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory manufacturer](self, "manufacturer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = HMFEqualObjects();

  if ((v23 & 1) == 0)
    -[HMAccessory setManufacturer:](self, "setManufacturer:", v21);
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryInfoModelKey"), v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory model](self, "model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = HMFEqualObjects();

  if ((v26 & 1) == 0)
    -[HMAccessory setModel:](self, "setModel:", v24);
  v27 = v8;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryInfoFirmwareVersionKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory firmwareVersion](self, "firmwareVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = HMFEqualObjects();

  if ((v30 & 1) == 0)
  {
    -[HMAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v28);
    -[HMAccessory delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMAccessory context](self, "context");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "delegateCaller");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_4;
      v38[3] = &unk_1E3AB5CD0;
      v39 = v31;
      v40 = self;
      v41 = v28;
      objc_msgSend(v33, "invokeBlock:", v38);

    }
  }
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryInfoSerialNumberKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory serialNumber](self, "serialNumber");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = HMFEqualObjects();

  if ((v36 & 1) == 0)
    -[HMAccessory setSerialNumber:](self, "setSerialNumber:", v34);

}

- (void)setSupportsIdentify:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsIdentify = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)identifyWithCompletionHandler:(void *)completion
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = completion;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory identifyWithCompletionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HMAccessory_identifyWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMAccessory identifyWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v4 + 2))(v4, v12);

  }
}

- (void)_identifyWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v26 = CFSTR("kAccessoryUUID");
    -[HMAccessory uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0D285F8]);
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
    v13 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", CFSTR("kIdentifyAccessoryRequestKey"), v12, v8);

    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __46__HMAccessory__identifyWithCompletionHandler___block_invoke;
    v23 = &unk_1E3AB59B8;
    v14 = v5;
    v24 = v14;
    v25 = v4;
    objc_msgSend(v13, "setResponseHandler:", &v20);
    objc_msgSend(v14, "messageDispatcher", v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendMessage:", v13);

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2080;
      v31 = "-[HMAccessory _identifyWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (BOOL)_updateFromAccessory:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[HMAccessory transportTypes](self, "transportTypes");
  v6 = objc_msgSend(v4, "transportTypes");
  v7 = v5 == v6;
  v8 = v5 != v6;
  if (!v7)
    -[HMAccessory setTransportTypes:](self, "setTransportTypes:", objc_msgSend(v4, "transportTypes"));
  os_unfair_lock_unlock(&self->_lock);
  v9 = -[HMAccessory knownToSystemCommissioner](self, "knownToSystemCommissioner");
  if (v9 != objc_msgSend(v4, "knownToSystemCommissioner"))
  {
    -[HMAccessory setKnownToSystemCommissioner:](self, "setKnownToSystemCommissioner:", objc_msgSend(v4, "knownToSystemCommissioner"));
    v8 = 1;
  }
  -[HMAccessory serialNumber](self, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v4, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setSerialNumber:](self, "setSerialNumber:", v13);

    v8 = 1;
  }
  -[HMAccessory productID](self, "productID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToNumber:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v4, "productID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setProductID:](self, "setProductID:", v17);

    v8 = 1;
  }
  -[HMAccessory vendorID](self, "vendorID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToNumber:", v19);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v4, "vendorID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setVendorID:](self, "setVendorID:", v21);

    v8 = 1;
  }
  -[HMAccessory nodeID](self, "nodeID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqualToNumber:", v23);

  if ((v24 & 1) == 0)
  {
    objc_msgSend(v4, "nodeID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setNodeID:](self, "setNodeID:", v25);

    v8 = 1;
  }
  v26 = -[HMAccessory requiresThreadRouter](self, "requiresThreadRouter");
  if (v26 != objc_msgSend(v4, "requiresThreadRouter"))
  {
    -[HMAccessory setRequiresThreadRouter:](self, "setRequiresThreadRouter:", objc_msgSend(v4, "requiresThreadRouter"));
    v8 = 1;
  }
  -[HMAccessory rootPublicKey](self, "rootPublicKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootPublicKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToData:", v28);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(v4, "rootPublicKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory setRootPublicKey:](self, "setRootPublicKey:", v30);

    v8 = 1;
  }

  return v8;
}

- (void)_listPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMAccessory *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  id v32;
  HMAccessory *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v5 = v4;
  -[HMAccessory home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = objc_alloc(MEMORY[0x1E0D285F8]);
      v10 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](self, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
      v13 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", CFSTR("kListPairingsRequestKey"), v12, 0);

      objc_msgSend(v8, "pendingRequests");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = _Block_copy(v5);
      objc_msgSend(v14, "addCompletionBlock:forIdentifier:", v16, v15);

      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __50__HMAccessory__listPairingsWithCompletionHandler___block_invoke;
      v30 = &unk_1E3AB4B08;
      v31 = v14;
      v32 = v15;
      v33 = self;
      v34 = v5;
      v17 = v15;
      v18 = v14;
      objc_msgSend(v13, "setResponseHandler:", &v27);
      objc_msgSend(v8, "messageDispatcher", v27, v28, v29, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendMessage:", v13);

    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v25;
        v37 = 2080;
        v38 = "-[HMAccessory _listPairingsWithCompletionHandler:]";
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
  }
  else
  {
    objc_msgSend(v7, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:obj:error:", v5, 0, v21);

  }
}

- (void)_auditPairingsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMAccessory *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _auditPairingsWithCompletionHandler:]", CFSTR("completionHandler"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v26;
      v32 = 2112;
      v33 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v6 = (void *)v5;
  if (v5)
  {
    -[HMAccessory home](self, "home");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_alloc(MEMORY[0x1E0D285F8]);
      v10 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](self, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
      v13 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", CFSTR("HMA.auditPairings"), v12, 0);

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __51__HMAccessory__auditPairingsWithCompletionHandler___block_invoke;
      v28[3] = &unk_1E3AB59B8;
      v28[4] = self;
      v29 = v4;
      objc_msgSend(v13, "setResponseHandler:", v28);
      objc_msgSend(v6, "messageDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sendMessage:", v13);

    }
    else
    {
      -[HMAccessory context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "callCompletion:error:", v4, v21);

      v8 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2080;
      v33 = "-[HMAccessory _auditPairingsWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }

}

- (void)deleteSiriHistoryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory deleteSiriHistoryWithCompletion:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__HMAccessory_deleteSiriHistoryWithCompletion___block_invoke;
    block[3] = &unk_1E3AB60A0;
    block[4] = self;
    v20 = v4;
    dispatch_async(v7, block);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2080;
      v24 = "-[HMAccessory deleteSiriHistoryWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v12);

  }
}

- (void)_deleteSiriHistoryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMAccessory *v25;
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory _deleteSiriHistoryWithCompletion:]", CFSTR("completion"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v27;
      v35 = 2112;
      v36 = (const char *)v23;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMAccessory siriEndpointProfile](v9, "siriEndpointProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "deleteSiriHistoryWithCompletionHandler:", v4);
    }
    else
    {
      objc_msgSend(v6, "messageDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](v9, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

      objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryDeleteSiriHistoryRequestMessage"), v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v9);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke;
      v29[3] = &unk_1E3AB4B30;
      objc_copyWeak(&v32, (id *)buf);
      v30 = v6;
      v31 = v4;
      objc_msgSend(v22, "setResponseHandler:", v29);
      objc_msgSend(v18, "sendMessage:completionHandler:", v22, 0);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

      v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v17;
      v35 = 2080;
      v36 = "-[HMAccessory _deleteSiriHistoryWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }

}

- (void)_handleServiceRenamed:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HMAccessory *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kServiceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeCompletionBlockForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    -[HMAccessory services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "_handleUpdateName:", v5);
      if (v10)
      {
        -[HMAccessory context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateCaller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "callCompletion:error:", v10, 0);

      }
      else
      {
        -[HMAccessory delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMAccessory context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "delegateCaller");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __37__HMAccessory__handleServiceRenamed___block_invoke;
          v18[3] = &unk_1E3AB5CD0;
          v19 = v15;
          v20 = self;
          v21 = v12;
          objc_msgSend(v17, "invokeBlock:", v18);

        }
      }
    }

  }
}

- (void)_handleServiceDefaultNameUpdate:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HMAccessory *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kServiceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeCompletionBlockForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    -[HMAccessory services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "_handleUpdateDefaultName:", v5);
      if (v10)
      {
        -[HMAccessory context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateCaller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "callCompletion:error:", v10, 0);

      }
      else
      {
        -[HMAccessory _privateDelegate](self, "_privateDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMAccessory context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "delegateCaller");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __47__HMAccessory__handleServiceDefaultNameUpdate___block_invoke;
          v18[3] = &unk_1E3AB5CD0;
          v19 = v15;
          v20 = self;
          v21 = v12;
          objc_msgSend(v17, "invokeBlock:", v18);

        }
      }
    }

  }
}

- (void)_handleServiceSubtype:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HMAccessory *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kServiceSubtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeCompletionBlockForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    -[HMAccessory services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "_handleUpdateServiceSubtype:", v5);
      if (v10)
      {
        -[HMAccessory context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateCaller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "callCompletion:error:", v10, 0);

      }
      else
      {
        -[HMAccessory _privateDelegate](self, "_privateDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMAccessory context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "delegateCaller");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __37__HMAccessory__handleServiceSubtype___block_invoke;
          v18[3] = &unk_1E3AB5CD0;
          v19 = v15;
          v20 = self;
          v21 = v12;
          objc_msgSend(v17, "invokeBlock:", v18);

        }
      }
    }

  }
}

- (void)_handleServiceConfigurationState:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HMAccessory *v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceConfigurationState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pendingRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeCompletionBlockForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    -[HMAccessory services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "_handleUpdateConfigurationState:", +[HMService _mapToServiceConfigurationStateFromIsConfiguredValue:](HMService, "_mapToServiceConfigurationStateFromIsConfiguredValue:", v5));
      if (v10)
      {
        -[HMAccessory context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "delegateCaller");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "callCompletion:error:", v10, 0);

      }
      else
      {
        -[HMAccessory _privateDelegate](self, "_privateDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMAccessory context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "delegateCaller");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __48__HMAccessory__handleServiceConfigurationState___block_invoke;
          v18[3] = &unk_1E3AB5CD0;
          v19 = v15;
          v20 = self;
          v21 = v12;
          objc_msgSend(v17, "invokeBlock:", v18);

        }
      }
    }

  }
}

- (void)_handleServiceMediaSourceIdentifierUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("mediaSourceIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v5)
  {
    -[HMAccessory _findService:](self, "_findService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "_handleMediaSourceIdentifierUpdated:", v8);

  }
}

- (void)_handleAccessoryCategoryChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", CFSTR("kAccessoryCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      -[HMAccessory setCategory:](self, "setCategory:", v6);
    }
    else
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = self;
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
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory category from data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  -[HMAccessory updateApplicationData:forService:completionHandler:](self, "updateApplicationData:forService:completionHandler:", a3, 0, a4);
}

- (void)updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  HMAccessory *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessory *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMAccessory context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory updateApplicationData:forService:completionHandler:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HMAccessory_updateApplicationData_forService_completionHandler___block_invoke;
    block[3] = &unk_1E3AB4D20;
    block[4] = self;
    v26 = v8;
    v27 = v9;
    v28 = v10;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v17;
      v31 = 2080;
      v32 = "-[HMAccessory updateApplicationData:forService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v18);

  }
}

- (void)_updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  HMAccessory *v11;
  HMAccessory *v12;
  HMAccessory *v13;
  void *v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMAccessory *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD aBlock[4];
  HMAccessory *v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a4;
  v42 = a5;
  -[HMAccessory context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMAccessory home](self, "home");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v8, "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v10, CFSTR("kAppDataInformationKey"));

      }
      v11 = self;
      v12 = v11;
      if (v41)
      {
        v13 = (HMAccessory *)v41;

        -[HMAccessory instanceID](v13, "instanceID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v14, CFSTR("kServiceInstanceID"));

        -[HMAccessory uuid](v13, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HMAccessory messageTargetUUID](v11, "messageTargetUUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
      }
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v38);
      v23 = (void *)MEMORY[0x1E0D285F8];
      v24 = (void *)objc_msgSend(v39, "copy");
      v37 = (void *)v22;
      objc_msgSend(v23, "messageWithName:destination:payload:", CFSTR("kSetAppDataRequestKey"), v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, v12);
      v26 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke;
      aBlock[3] = &unk_1E3AB5510;
      objc_copyWeak(&v51, (id *)buf);
      v27 = v13;
      v48 = v27;
      v49 = v8;
      v50 = v42;
      v28 = _Block_copy(aBlock);
      -[HMAccessory context](v12, "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pendingRequests");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = _Block_copy(v28);
      objc_msgSend(v30, "addCompletionBlock:forIdentifier:", v32, v31);

      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke_2;
      v43[3] = &unk_1E3AB60C8;
      v33 = v30;
      v44 = v33;
      v34 = v31;
      v45 = v34;
      v35 = v28;
      v46 = v35;
      objc_msgSend(v25, "setResponseHandler:", v43);
      objc_msgSend(v9, "messageDispatcher");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sendMessage:completionHandler:", v25, 0);

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      -[HMAccessory context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "callCompletion:error:", v42, v21);

    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v18;
      v54 = 2080;
      v55 = "-[HMAccessory _updateApplicationData:forService:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)notifyDelegateOfAppDataUpdateForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMAccessory *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke;
      block[3] = &unk_1E3AB5CD0;
      block[4] = self;
      v13 = v6;
      v14 = v4;
      dispatch_async(v7, block);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2080;
      v18 = "-[HMAccessory notifyDelegateOfAppDataUpdateForService:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_handleAccessoryControllableChanged:(id)a3
{
  -[HMAccessory setControllable:](self, "setControllable:", objc_msgSend(a3, "BOOLForKey:", CFSTR("controllable")));
  -[HMAccessory _notifyDelegatesOfUpdatedControllable](self, "_notifyDelegatesOfUpdatedControllable");
}

- (void)_notifyDelegatesOfAdditionalSetupRequiredChange
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  HMAccessory *v8;

  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__HMAccessory__notifyDelegatesOfAdditionalSetupRequiredChange__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegatesOfUpdatedCalibrationStatus
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  HMAccessory *v8;

  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__HMAccessory__notifyDelegatesOfUpdatedCalibrationStatus__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (void)_notifyDelegatesOfUpdatedControllable
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  HMAccessory *v8;

  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__HMAccessory__notifyDelegatesOfUpdatedControllable__block_invoke;
    v6[3] = &unk_1E3AB5ED8;
    v7 = v3;
    v8 = self;
    objc_msgSend(v5, "invokeBlock:", v6);

  }
}

- (id)_privateDelegate
{
  void *v2;
  id v3;

  -[HMAccessory delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE45A8F8))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setSymptomsHandler:(id)a3
{
  HMSymptomsHandler *v4;
  HMSymptomsHandler *symptomsHandler;

  v4 = (HMSymptomsHandler *)a3;
  os_unfair_lock_lock_with_options();
  symptomsHandler = self->_symptomsHandler;
  self->_symptomsHandler = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_createSymptomsHandler
{
  HMSymptomsHandler *v3;
  id v4;

  v3 = -[HMSymptomsHandler initWithAccessory:]([HMSymptomsHandler alloc], "initWithAccessory:", self);
  -[HMAccessory setSymptomsHandler:](self, "setSymptomsHandler:", v3);

  -[HMAccessory symptomsHandler](self, "symptomsHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configure");

}

- (BOOL)_updateHasSymptomsHandler:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  _QWORD *v9;
  BOOL v10;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[2];

  v3 = a3;
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMAccessory hasSymptomsHandler](self, "hasSymptomsHandler") && v3)
  {
    -[HMAccessory setHasSymptomsHandler:](self, "setHasSymptomsHandler:", 1);
    -[HMAccessory _createSymptomsHandler](self, "_createSymptomsHandler");
    -[HMAccessory context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke;
    v14[3] = &unk_1E3AB5ED8;
    v8 = (id *)v15;
    v15[0] = v5;
    v15[1] = self;
    v9 = v14;
LABEL_7:
    dispatch_async(v7, v9);

    v10 = 1;
    goto LABEL_8;
  }
  v10 = 0;
  if (-[HMAccessory hasSymptomsHandler](self, "hasSymptomsHandler") && !v3)
  {
    -[HMAccessory setHasSymptomsHandler:](self, "setHasSymptomsHandler:", 0);
    -[HMAccessory setSymptomsHandler:](self, "setSymptomsHandler:", 0);
    -[HMAccessory context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_2;
    v12[3] = &unk_1E3AB5ED8;
    v8 = (id *)v13;
    v13[0] = v5;
    v13[1] = self;
    v9 = v12;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (void)_notifyClientsOfTargetControlSupportUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying client of target control support update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__HMAccessory__notifyClientsOfTargetControlSupportUpdate__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v5;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)_notifyDelegateOfAddedControlTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  HMAccessory *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added target - %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMAccessory context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HMAccessory__notifyDelegateOfAddedControlTarget___block_invoke;
    v13[3] = &unk_1E3AB5CD0;
    v14 = v5;
    v15 = v7;
    v16 = v4;
    objc_msgSend(v12, "invokeBlock:", v13);

  }
}

- (void)_notifyDelegateOfRemovedControlTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  HMAccessory *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed control target - %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMAccessory context](v7, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__HMAccessory__notifyDelegateOfRemovedControlTarget___block_invoke;
    v13[3] = &unk_1E3AB5CD0;
    v14 = v5;
    v15 = v7;
    v16 = v4;
    objc_msgSend(v12, "invokeBlock:", v13);

  }
}

- (void)addControlTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  HMAccessory *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMAccessory *v45;
  NSObject *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  const __CFString *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory addControlTarget:completionHandler:]", CFSTR("completion"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1A1AC1AAC]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v47;
      v57 = 2112;
      v58 = (const char *)v43;
      _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v43, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMAccessory home](self, "home");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[HMAccessory context](self, "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "delegateCaller");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "callCompletion:error:", v7, v37);

      v11 = 0;
      goto LABEL_14;
    }
    v11 = (void *)v10;
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v53 = CFSTR("add");
        objc_msgSend(v6, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc(MEMORY[0x1E0D285F8]);
        v19 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMAccessory uuid](self, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);
        v22 = (void *)objc_msgSend(v18, "initWithName:destination:payload:", CFSTR("HMCT.configure"), v21, v17);

        -[HMAccessory context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pendingRequests");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = _Block_copy(v7);
        objc_msgSend(v24, "addCompletionBlock:forIdentifier:", v26, v25);

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __50__HMAccessory_addControlTarget_completionHandler___block_invoke;
        v49[3] = &unk_1E3AB5C08;
        v50 = v24;
        v51 = v25;
        v27 = v9;
        v52 = v27;
        v28 = v25;
        v29 = v24;
        objc_msgSend(v22, "setResponseHandler:", v49);
        objc_msgSend(v27, "messageDispatcher");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sendMessage:", v22);

        goto LABEL_14;
      }
      -[HMAccessory context](self, "context");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegateCaller");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = 11;
    }
    else
    {
      -[HMAccessory context](self, "context");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegateCaller");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = 20;
    }
    objc_msgSend(v40, "hmErrorWithCode:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "callCompletion:error:", v7, v42);

    goto LABEL_14;
  }
  v31 = (void *)MEMORY[0x1A1AC1AAC]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v34;
    v57 = 2080;
    v58 = "-[HMAccessory addControlTarget:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_14:

}

- (void)removeControlTarget:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  HMAccessory *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMAccessory *v45;
  NSObject *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  const __CFString *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory removeControlTarget:completionHandler:]", CFSTR("completion"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1A1AC1AAC]();
    v45 = self;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v47;
      v57 = 2112;
      v58 = (const char *)v43;
      _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v44);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v43, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMAccessory home](self, "home");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[HMAccessory context](self, "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "delegateCaller");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "callCompletion:error:", v7, v37);

      v11 = 0;
      goto LABEL_14;
    }
    v11 = (void *)v10;
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v53 = CFSTR("remove");
        objc_msgSend(v6, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc(MEMORY[0x1E0D285F8]);
        v19 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMAccessory uuid](self, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);
        v22 = (void *)objc_msgSend(v18, "initWithName:destination:payload:", CFSTR("HMCT.configure"), v21, v17);

        -[HMAccessory context](self, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "pendingRequests");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = _Block_copy(v7);
        objc_msgSend(v24, "addCompletionBlock:forIdentifier:", v26, v25);

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __53__HMAccessory_removeControlTarget_completionHandler___block_invoke;
        v49[3] = &unk_1E3AB5C08;
        v50 = v24;
        v51 = v25;
        v27 = v9;
        v52 = v27;
        v28 = v25;
        v29 = v24;
        objc_msgSend(v22, "setResponseHandler:", v49);
        objc_msgSend(v27, "messageDispatcher");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sendMessage:", v22);

        goto LABEL_14;
      }
      -[HMAccessory context](self, "context");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegateCaller");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = 11;
    }
    else
    {
      -[HMAccessory context](self, "context");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegateCaller");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = 20;
    }
    objc_msgSend(v40, "hmErrorWithCode:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "callCompletion:error:", v7, v42);

    goto LABEL_14;
  }
  v31 = (void *)MEMORY[0x1A1AC1AAC]();
  v32 = self;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v34;
    v57 = 2080;
    v58 = "-[HMAccessory removeControlTarget:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_14:

}

- (void)resetControlTargetsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  HMAccessory *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HMAccessory *v32;
  NSObject *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  const __CFString *v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory resetControlTargetsWithCompletionHandler:]", CFSTR("completion"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1A1AC1AAC]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v34;
      v44 = 2112;
      v45 = (const char *)v30;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v35);
  }
  v6 = (void *)v5;
  if (v5)
  {
    -[HMAccessory home](self, "home");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v40 = CFSTR("reset");
      v41 = MEMORY[0x1E0C9AA60];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D285F8]);
      v11 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMAccessory uuid](self, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);
      v14 = (void *)objc_msgSend(v10, "initWithName:destination:payload:", CFSTR("HMCT.configure"), v13, v9);

      -[HMAccessory context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pendingRequests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = _Block_copy(v4);
      objc_msgSend(v16, "addCompletionBlock:forIdentifier:", v18, v17);

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __56__HMAccessory_resetControlTargetsWithCompletionHandler___block_invoke;
      v36[3] = &unk_1E3AB5C08;
      v37 = v16;
      v38 = v17;
      v19 = v6;
      v39 = v19;
      v20 = v17;
      v21 = v16;
      objc_msgSend(v14, "setResponseHandler:", v36);
      objc_msgSend(v19, "messageDispatcher");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendMessage:", v14);

    }
    else
    {
      -[HMAccessory context](self, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "delegateCaller");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "callCompletion:error:", v4, v29);

      v8 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v26;
      v44 = 2080;
      v45 = "-[HMAccessory resetControlTargetsWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }

}

- (void)_handleTargetControlSupportUpdatedMessage:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "BOOLForKey:", CFSTR("supportsTargetControl"));
  v5 = v4 ^ -[HMAccessory supportsTargetControl](self, "supportsTargetControl");
  if (v5 == 1)
    -[HMAccessory setSupportsTargetControl:](self, "setSupportsTargetControl:", v4);
  v6 = objc_msgSend(v8, "BOOLForKey:", CFSTR("supportsTargetController"));
  if ((_DWORD)v6 != -[HMAccessory supportsTargetController](self, "supportsTargetController"))
  {
    -[HMAccessory setSupportsTargetController:](self, "setSupportsTargetController:", v6);
    v5 = 1;
  }
  v7 = objc_msgSend(v8, "BOOLForKey:", CFSTR("targetControllerHardwareSupport"));
  if ((_DWORD)v7 != -[HMAccessory targetControllerHardwareSupport](self, "targetControllerHardwareSupport"))
  {
    -[HMAccessory setTargetControllerHardwareSupport:](self, "setTargetControllerHardwareSupport:", v7);
LABEL_8:
    -[HMAccessory _notifyClientsOfTargetControlSupportUpdate](self, "_notifyClientsOfTargetControlSupportUpdate");
    goto LABEL_9;
  }
  if (v5)
    goto LABEL_8;
LABEL_9:

}

- (void)notifyClientsOfUpdatedSupportsAudioReturnChannel
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HMAccessory *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of accessory did update supports audio return: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63__HMAccessory_notifyClientsOfUpdatedSupportsAudioReturnChannel__block_invoke;
      v14[3] = &unk_1E3AB5ED8;
      v15 = v3;
      v16 = v5;
      objc_msgSend(v9, "invokeBlock:", v14);

    }
    else
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = v5;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify clients of accessory did update supports audio return due to no delegate caller", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
}

- (void)_notifyClientsOfMultiUserSupportUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying client of multi-user support update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__HMAccessory__notifyClientsOfMultiUserSupportUpdate__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v5;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)_notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[HMAccessory context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateCaller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__HMAccessory__notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate__block_invoke;
  v5[3] = &unk_1E3AB5E18;
  v5[4] = self;
  objc_msgSend(v4, "invokeBlock:", v5);

}

- (void)_handleMultiUserSupportUpdatedMessage:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "BOOLForKey:", CFSTR("supportsMultiUser"));
  if ((_DWORD)v4 != -[HMAccessory supportsMultiUser](self, "supportsMultiUser"))
  {
    -[HMAccessory setSupportsMultiUser:](self, "setSupportsMultiUser:", v4);
    -[HMAccessory _notifyClientsOfMultiUserSupportUpdate](self, "_notifyClientsOfMultiUserSupportUpdate");
  }
}

- (void)_notifyClientsOfSupportsCompanionInitiatedRestartUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports companion initiated restart update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__HMAccessory__notifyClientsOfSupportsCompanionInitiatedRestartUpdate__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v5;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)_handleSupportsCompanionInitiatedRestartUpdatedMessage:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "BOOLForKey:", CFSTR("HMAccessorySupportsCompanionInitiatedRestartMessageKey"));
  if ((_DWORD)v4 != -[HMAccessory supportsCompanionInitiatedRestart](self, "supportsCompanionInitiatedRestart"))
  {
    -[HMAccessory setSupportsCompanionInitiatedRestart:](self, "setSupportsCompanionInitiatedRestart:", v4);
    -[HMAccessory _notifyClientsOfSupportsCompanionInitiatedRestartUpdate](self, "_notifyClientsOfSupportsCompanionInitiatedRestartUpdate");
  }
}

- (void)_notifyClientsOfSupportsCompanionInitiatedObliterateUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports companion initiated obliterate update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__HMAccessory__notifyClientsOfSupportsCompanionInitiatedObliterateUpdate__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v5;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (void)_handleSupportsCompanionInitiatedObliterateUpdatedMessage:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "BOOLForKey:", CFSTR("HMAccessorySupportsCompanionInitiatedObliterateMessageKey"));
  if ((_DWORD)v4 != -[HMAccessory supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate"))
  {
    -[HMAccessory setSupportsCompanionInitiatedObliterate:](self, "setSupportsCompanionInitiatedObliterate:", v4);
    -[HMAccessory _notifyClientsOfSupportsCompanionInitiatedObliterateUpdate](self, "_notifyClientsOfSupportsCompanionInitiatedObliterateUpdate");
  }
}

- (void)_notifyClientsOfSupportsMusicAlarmUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMAccessory _privateDelegate](self, "_privateDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports creating music alarms update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    -[HMAccessory context](v5, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__HMAccessory__notifyClientsOfSupportsMusicAlarmUpdate__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v3;
    v12 = v5;
    objc_msgSend(v9, "invokeBlock:", v10);

  }
}

- (NSUUID)networkProtectionGroupUUID
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_networkProtectionGroupUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNetworkProtectionGroupUUID:(id)a3
{
  NSUUID *v4;
  NSUUID *networkProtectionGroupUUID;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  networkProtectionGroupUUID = self->_networkProtectionGroupUUID;
  self->_networkProtectionGroupUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)callCompletionHandler:(id)a3
{
  -[HMAccessory callCompletionHandler:error:](self, "callCompletionHandler:error:", a3, 0);
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMAccessory context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "callCompletion:error:", v6, v7);
    }
    else
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (NSString)audioDestinationIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessory audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)audioDestinationType
{
  void *v2;

  -[HMAccessory audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (BOOL)supportsAudioDestination
{
  void *v2;
  char v3;

  -[HMAccessory audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsHomeTheaterSupportedOptions");

  return v3;
}

- (BOOL)supportsAudioGroup
{
  void *v2;
  char v3;

  -[HMAccessory audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsSupportedOptions:", 8);

  return v3;
}

- (NSString)audioDestinationParentIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessory uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)audioDestinationMediaProfiles
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HMAccessory mediaProfile](self, "mediaProfile");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (NSUUID)audioDestinationGroupIdentifier
{
  void *v2;
  void *v3;

  -[HMAccessory audioDestination](self, "audioDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)hasOnboardedForNaturalLighting
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasOnboardedForNaturalLighting;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasOnboardedForNaturalLighting:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasOnboardedForNaturalLighting = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMAccessory *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMAccessory *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v10;
    v36 = 2112;
    v37 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update audio destination support options message with options: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMAccessory context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v32 = CFSTR("HMMediaDestinationSupportedOptionsPayloadKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory audioDestination](v8, "audioDestination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithTarget:", v18);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMMediaDestinationUpdateSupportedOptionsRequestMessage"), v19, v15);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __65__HMAccessory_updateAudioDestinationSupportedOptions_completion___block_invoke;
    v29 = &unk_1E3AB59B8;
    v30 = v8;
    v31 = v6;
    objc_msgSend(v20, "setResponseHandler:", &v26);
    v21 = (void *)objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    objc_msgSend(v13, "sendMessage:", v21);

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = v8;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options due to no message dispatcher given by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory callCompletionHandler:error:](v23, "callCompletionHandler:error:", v6, v15);
  }

}

- (id)mediaDestinationController:(id)a3 destinationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMAccessory *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaDestinationsWithHomeTheaterSupportedOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HMAccessory_mediaDestinationController_destinationWithIdentifier___block_invoke;
  v17[3] = &unk_1E3AB2DE8;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@No destination found in destinations: %@ home: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return v11;
}

- (BOOL)supportsDiagnosticsTransfer
{
  HMAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDiagnosticsTransfer;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsDiagnosticsTransfer:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDiagnosticsTransfer = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyClientsOfDiagnosticsTransferSupportUpdate
{
  void *v3;
  void *v4;
  HMAccessory *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HMAccessory *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[HMAccessory _privateDelegate](self, "_privateDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1A1AC1AAC]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v7;
        v15 = 2112;
        v16 = v3;
        _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of accessory diagnostics transfer support update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      -[HMAccessory context](v5, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegateCaller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__HMAccessory__notifyClientsOfDiagnosticsTransferSupportUpdate__block_invoke;
      v10[3] = &unk_1E3AB5ED8;
      v11 = v3;
      v12 = v5;
      objc_msgSend(v9, "invokeBlock:", v10);

    }
  }
}

- (void)_handleSupportsDiagnosticsTransferUpdateMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HMA.diagnosticsTransferSupport"));
  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMA.supportedDiagnosticsCodingKey"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v5 != -[HMAccessory supportsDiagnosticsTransfer](self, "supportsDiagnosticsTransfer")
    || (-[HMAccessory supportedDiagnostics](self, "supportedDiagnostics"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7 != v8))
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory supportsDiagnosticsTransfer](v10, "supportsDiagnosticsTransfer");
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating supportsDiagnostics from %@ to %@, full diagnostics support is %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    -[HMAccessory setSupportsDiagnosticsTransfer:](v10, "setSupportsDiagnosticsTransfer:", v5);
    -[HMAccessory setSupportedDiagnostics:](v10, "setSupportedDiagnostics:", v7);
    -[HMAccessory _notifyClientsOfDiagnosticsTransferSupportUpdate](v10, "_notifyClientsOfDiagnosticsTransferSupportUpdate");
  }

}

- (HMSupportedAccessoryDiagnostics)supportedDiagnostics
{
  os_unfair_lock_s *p_lock;
  HMSupportedAccessoryDiagnostics *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_supportedDiagnostics;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSupportedDiagnostics:(id)a3
{
  HMSupportedAccessoryDiagnostics *v4;
  HMSupportedAccessoryDiagnostics *supportedDiagnostics;

  v4 = (HMSupportedAccessoryDiagnostics *)a3;
  os_unfair_lock_lock_with_options();
  supportedDiagnostics = self->_supportedDiagnostics;
  self->_supportedDiagnostics = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)initiateDiagnosticsTransferWithCompletionHandler:(id)a3
{
  -[HMAccessory initiateDiagnosticsTransferWithOptions:completionHandler:](self, "initiateDiagnosticsTransferWithOptions:completionHandler:", 0, a3);
}

- (void)initiateDiagnosticsTransferWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  char v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMAccessory *v35;
  NSObject *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory initiateDiagnosticsTransferWithOptions:completionHandler:]", CFSTR("completion"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1A1AC1AAC]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v37;
      v44 = 2112;
      v45 = (const char *)v33;
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v33, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  -[HMAccessory context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v21;
      v44 = 2080;
      v45 = "-[HMAccessory initiateDiagnosticsTransferWithOptions:completionHandler:]";
      v22 = "%{public}@nil context - %s";
      v23 = v14;
      v24 = 22;
LABEL_12:
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);

    }
LABEL_13:

    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v17, 0);
    goto LABEL_16;
  }
  v10 = _os_feature_enabled_impl();
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v21;
      v22 = "%{public}@accessory diagnostics feature flag not enabled";
      v23 = v14;
      v24 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory uuid](v12, "uuid");
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v15;
    v44 = 2112;
    v45 = v16;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Dispatching a message to request diagnostics transfer: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory uuid](v12, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("kAccessoryUUID"));

  if (v6)
  {
    encodeRootObject(v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("kAccessoryDiagnosticsOptions"));

  }
  else
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, CFSTR("kAccessoryDiagnosticsOptions"));
  }
  v25 = objc_alloc(MEMORY[0x1E0D285F8]);
  v26 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMAccessory uuid](v12, "uuid");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithTarget:", v27);
  v29 = (void *)objc_msgSend(v25, "initWithName:destination:payload:", CFSTR("HMA.diagnosticsTransferRequest"), v28, v17);

  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __72__HMAccessory_initiateDiagnosticsTransferWithOptions_completionHandler___block_invoke;
  v39[3] = &unk_1E3AB60C8;
  v39[4] = v12;
  v40 = v30;
  v41 = v8;
  v31 = v30;
  objc_msgSend(v29, "setResponseHandler:", v39);
  objc_msgSend(v9, "messageDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sendMessage:", v29);

LABEL_16:
}

- (void)_invokeDidUpdateSupportsWalletKeyDelegate:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HMAccessory *v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMAccessory delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE45A8F8))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "delegateCaller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__HMAccessory__invokeDidUpdateSupportsWalletKeyDelegate___block_invoke;
      v14[3] = &unk_1E3AB57F8;
      v15 = v8;
      v16 = self;
      v17 = a3;
      objc_msgSend(v9, "invokeBlock:", v14);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2080;
      v21 = "-[HMAccessory _invokeDidUpdateSupportsWalletKeyDelegate:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)_invokeDidUpdateSupportsUWBUnlockDelegate:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMAccessory *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HMAccessory *v16;
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMAccessory delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE45A8F8))
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "delegateCaller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__HMAccessory__invokeDidUpdateSupportsUWBUnlockDelegate___block_invoke;
      v14[3] = &unk_1E3AB57F8;
      v15 = v8;
      v16 = self;
      v17 = a3;
      objc_msgSend(v9, "invokeBlock:", v14);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2080;
      v21 = "-[HMAccessory _invokeDidUpdateSupportsUWBUnlockDelegate:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (NSString)shortDescription
{
  void *v2;
  void *v3;

  -[HMAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)createSettingsAdapterWithDataSource:(id)a3 controller:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMAccessorySettingsAdapter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessorySettingsAdapter *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HMAccessorySettingsAdapter alloc];
  -[HMAccessory home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMAccessorySettingsAdapter initWithHomeIdentifier:dataSource:controller:workQueue:settingsContainer:containerIdentifier:containerType:settingsControl:context:](v11, "initWithHomeIdentifier:dataSource:controller:workQueue:settingsContainer:containerIdentifier:containerType:settingsControl:context:", v13, v10, v9, v15, self, v16, 1, self, v8);

  -[HMAccessory setSettingsAdapter:](self, "setSettingsAdapter:", v18);
  -[HMAccessory settingsAdapter](self, "settingsAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

}

- (void)configureSettingsAdapterWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAccessory settingsAdapter](self, "settingsAdapter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithCompletionHandler:", v4);

}

- (void)adapter:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessory *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessory settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to set root group to non-nil settings.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    -[HMAccessory setSettings:](self, "setSettings:", v7);
    -[HMAccessory settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory _notifyDelegateOfUpdatedSettings:](self, "_notifyDelegateOfUpdatedSettings:", v13);

  }
}

- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegateCaller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HMAccessory_adapter_didUpdateSettingKeyPaths___block_invoke;
    v10[3] = &unk_1E3AB6240;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v9, "invokeBlock:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  HMAccessory *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMAccessory settingsAdapter](self, "settingsAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMAccessory settingsAdapter](self, "settingsAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateWithKeyPath:value:completionHandler:", v8, v9, v10);
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Calling update setting with settings adapter object being nil", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:suggestion:", 8, CFSTR("Adapter is nil"), CFSTR("Configure adapter before use it"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);
  }

}

- (void)updateSettingsAdapterSettingReflected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[HMAccessory settingsAdapter](self, "settingsAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMAccessory settingsAdapter](self, "settingsAdapter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSettingsReflected:", v3);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempt to update adapter settings reflected with nil adapter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 wifiNetworkInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  HMAccessory *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  HMAccessory *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  HMAccessory *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[HMAccessory supportsMessagedHomePodSettings](self, "supportsMessagedHomePodSettings"))
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v19;
      v20 = "%{public}@Error processing wifi info as supportsMessagedHomePodSettings is disabled";
      v21 = v18;
      v22 = OS_LOG_TYPE_ERROR;
      v23 = 12;
      goto LABEL_8;
    }
LABEL_12:

    objc_autoreleasePoolPop(v15);
    goto LABEL_13;
  }
  -[HMAccessory uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v9);

  if ((v12 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory uniqueIdentifier](v16, "uniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v19;
      v41 = 2112;
      v42 = v24;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory identifier %@ is not same as delegate call identifier %@", buf, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  -[HMAccessory wifiNetworkInfo](self, "wifiNetworkInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToNetworkInfo:", v10);

  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v19;
      v41 = 2112;
      v42 = v10;
      v20 = "%{public}@Received WiFi network info %@ but it is same as current one";
      v21 = v18;
      v22 = OS_LOG_TYPE_DEBUG;
      v23 = 22;
LABEL_8:
      _os_log_impl(&dword_19B1B0000, v21, v22, v20, buf, v23);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v25;
    v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Received new WiFi network info %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMAccessory setWifiNetworkInfo:](v16, "setWifiNetworkInfo:", v10);
  -[HMAccessory delegate](v16, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "conformsToProtocol:", &unk_1EE45A8F8))
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = v16;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v32;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update WiFi network with delegate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMAccessory context](v30, "context");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "delegateCaller");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __101__HMAccessory_accessoryInfoDataProvider_didReceiveUpdatesForAccessoryWithIdentifier_wifiNetworkInfo___block_invoke;
    v35[3] = &unk_1E3AB5CD0;
    v36 = v28;
    v37 = v30;
    v38 = v10;
    objc_msgSend(v34, "invokeBlock:", v35);

  }
LABEL_13:

}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 primaryUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMAccessory *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  void *preferredMediaUserUUID;
  uint64_t v24;
  NSUUID *v25;
  void *v26;
  HMAccessory *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t preferredUserSelectionType;
  int v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v14;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive update primaryUserInfo: %@", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (!-[HMAccessory supportsMessagedHomePodSettings](v12, "supportsMessagedHomePodSettings"))
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = v12;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543362;
      v36 = v29;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error processing primary user info as supportsMessagedHomePodSettings is disabled", (uint8_t *)&v35, 0xCu);

    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "selectionType"))
  {
    objc_msgSend(v10, "uuidString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

      goto LABEL_15;
    }
  }
  if (objc_msgSend(v10, "selectionType") == 1)
  {
    objc_msgSend(v10, "uuidString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
LABEL_15:
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = v12;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuidString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "selectionType"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543874;
        v36 = v31;
        v37 = 2112;
        v38 = v32;
        v39 = 2112;
        v40 = v33;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected preferred media user UUID: %@, selectionType: %@", (uint8_t *)&v35, 0x20u);

      }
LABEL_12:

      objc_autoreleasePoolPop(v26);
      goto LABEL_26;
    }
  }
  os_unfair_lock_lock_with_options();
  -[NSUUID UUIDString](v12->_preferredMediaUserUUID, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuidString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v10, "uuidString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      preferredMediaUserUUID = v12->_preferredMediaUserUUID;
      v12->_preferredMediaUserUUID = 0;
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v10, "uuidString");
      preferredMediaUserUUID = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "initWithUUIDString:", preferredMediaUserUUID);
      v25 = v12->_preferredMediaUserUUID;
      v12->_preferredMediaUserUUID = (NSUUID *)v24;

    }
  }
  preferredUserSelectionType = v12->_preferredUserSelectionType;
  if (preferredUserSelectionType == objc_msgSend(v10, "selectionType"))
  {
    os_unfair_lock_unlock(&v12->_lock);
    if ((v19 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
    v12->_preferredUserSelectionType = objc_msgSend(v10, "selectionType");
    os_unfair_lock_unlock(&v12->_lock);
  }
  -[HMAccessory notifyDelegateUpdatedPreferredMediaUser](v12, "notifyDelegateUpdatedPreferredMediaUser");
LABEL_26:

}

- (void)setTransportTypes:(unint64_t)a3
{
  self->_transportTypes = a3;
}

- (void)setAdditionalSetupStatus:(unint64_t)a3
{
  self->_additionalSetupStatus = a3;
}

- (unint64_t)calibrationStatus
{
  return self->_calibrationStatus;
}

- (void)setCalibrationStatus:(unint64_t)a3
{
  self->_calibrationStatus = a3;
}

- (NSNumber)accessoryFlags
{
  return self->_accessoryFlags;
}

- (void)setAccessoryFlags:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryFlags, a3);
}

- (void)setAssociationOptions:(int64_t)a3
{
  self->_associationOptions = a3;
}

- (void)setHasSymptomsHandler:(BOOL)a3
{
  self->_hasSymptomsHandler = a3;
}

- (BOOL)mfiCertifiedACWG
{
  return self->_mfiCertifiedACWG;
}

- (void)setMfiCertifiedACWG:(BOOL)a3
{
  self->_mfiCertifiedACWG = a3;
}

- (NSNumber)weekDaySchedulesPerUserCapacity
{
  return self->_weekDaySchedulesPerUserCapacity;
}

- (NSNumber)yearDaySchedulesPerUserCapacity
{
  return self->_yearDaySchedulesPerUserCapacity;
}

- (void)setAssistantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setSupportsPrimaryUserInfoSubscription:(BOOL)a3
{
  self->_supportsPrimaryUserInfoSubscription = a3;
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (void)setAccessorySettingsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, a3);
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return self->_accessorySettingsController;
}

- (void)setAccessorySettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsController, a3);
}

- (void)setReachableTransports:(int64_t)a3
{
  self->_reachableTransports = a3;
}

- (void)setCurrentServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider
{
  return (HMAccessoryInfoDataProvider *)objc_getProperty(self, a2, 544, 1);
}

- (void)setAccessoryInfoDataProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (BOOL)supportsMediaContentProfile
{
  return self->_supportsMediaContentProfile;
}

- (void)setSupportsMediaContentProfile:(BOOL)a3
{
  self->_supportsMediaContentProfile = a3;
}

- (NSUUID)peerIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 552, 1);
}

- (void)setPeerIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 552);
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return self->_supportsHomeLevelLocationServiceSetting;
}

- (void)setSupportsHomeLevelLocationServiceSetting:(BOOL)a3
{
  self->_supportsHomeLevelLocationServiceSetting = a3;
}

- (HMAccessorySettingsAdapter)settingsAdapter
{
  return (HMAccessorySettingsAdapter *)objc_getProperty(self, a2, 560, 1);
}

- (void)setSettingsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setAccessoryReprovisionState:(unint64_t)a3
{
  self->_accessoryReprovisionState = a3;
}

- (void)setAccessoryProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryProfiles, a3);
}

- (void)setAudioDestinationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (void)setAudioDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioDestinationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accessoryProfiles, 0);
  objc_storeStrong((id *)&self->_settingsAdapter, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDataProvider, 0);
  objc_storeStrong((id *)&self->_currentServices, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_remoteLoginHandler, 0);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedDiagnostics, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEventBulletinBoardNotification, 0);
  objc_storeStrong((id *)&self->_yearDaySchedulesPerUserCapacity, 0);
  objc_storeStrong((id *)&self->_weekDaySchedulesPerUserCapacity, 0);
  objc_storeStrong((id *)&self->_readerIDACWG, 0);
  objc_storeStrong((id *)&self->_readerGroupSubIdentifierACWG, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserUUID, 0);
  objc_storeStrong((id *)&self->_networkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_controlTargetUUIDs, 0);
  objc_storeStrong((id *)&self->_wifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_commissioningID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryFlags, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersForBridgedAccessories, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_matterNodeID, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_room);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareUpdateController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

uint64_t __101__HMAccessory_accessoryInfoDataProvider_didReceiveUpdatesForAccessoryWithIdentifier_wifiNetworkInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateWifiNetworkInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __48__HMAccessory_adapter_didUpdateSettingKeyPaths___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsWillUpdate:", v5);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
          objc_msgSend(WeakRetained, "settings", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "settings:didUpdateForIdentifier:keyPath:", v12, v13, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = WeakRetained;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v15, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsDidUpdate:", v18);

  }
}

uint64_t __57__HMAccessory__invokeDidUpdateSupportsUWBUnlockDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateSupportsUWBUnlock:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __57__HMAccessory__invokeDidUpdateSupportsWalletKeyDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateSupportsWalletKey:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __72__HMAccessory_initiateDiagnosticsTransferWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Message response received for %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v15;
      v38 = 2112;
      v39 = v5;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@diagnostics transfer request failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:obj:", *(_QWORD *)(a1 + 48), v5, 0);
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMA.diagnosticsMetaDataCodingKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v16, &v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v35;
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v23;
          v38 = 2112;
          v39 = v18;
          _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@diagnostics transfer completed successfully with metadata: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(*(id *)(a1 + 32), "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "delegateCaller");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = *(_QWORD *)(a1 + 48);
        v28 = 0;
        v29 = v18;
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v34;
          v38 = 2112;
          v39 = 0;
          _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive diagnostics metadata from encoded metadata: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(*(id *)(a1 + 32), "context");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "delegateCaller");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = *(_QWORD *)(a1 + 48);
        v28 = v17;
        v29 = 0;
      }
      objc_msgSend(v25, "callCompletion:error:obj:", v27, v28, v29);

    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v33;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@nil encodedMetadata", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegateCaller");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "callCompletion:error:obj:", *(_QWORD *)(a1 + 48), v17, 0);
    }

  }
}

uint64_t __63__HMAccessory__notifyClientsOfDiagnosticsTransferSupportUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateDiagnosticsTransferSupport:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__HMAccessory_mediaDestinationController_destinationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "audioDestinationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __65__HMAccessory_updateAudioDestinationSupportedOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:error:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination supported options request message succeeded", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "callCompletionHandler:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __55__HMAccessory__notifyClientsOfSupportsMusicAlarmUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsMusicAlarm:", *(_QWORD *)(a1 + 40));
}

uint64_t __73__HMAccessory__notifyClientsOfSupportsCompanionInitiatedObliterateUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsCompanionInitiatedObliterate:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__HMAccessory__notifyClientsOfSupportsCompanionInitiatedRestartUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsCompanionInitiatedRestart:", *(_QWORD *)(a1 + 40));
}

void __75__HMAccessory__notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_privateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v2;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of home level location service setting support update using delegate: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "accessoryDidUpdateHomeLevelLocationServiceSettingSupport:", *(_QWORD *)(a1 + 32));

}

uint64_t __53__HMAccessory__notifyClientsOfMultiUserSupportUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateMultiUserSupport:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__HMAccessory_notifyClientsOfUpdatedSupportsAudioReturnChannel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateAudioReturnChannelSupport:", *(_QWORD *)(a1 + 40));
}

void __56__HMAccessory_resetControlTargetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

void __53__HMAccessory_removeControlTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

void __50__HMAccessory_addControlTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "removeCompletionBlockForIdentifier:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", v7, v5);

  }
}

uint64_t __53__HMAccessory__notifyDelegateOfRemovedControlTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didRemoveControlTarget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__HMAccessory__notifyDelegateOfAddedControlTarget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didAddControlTarget:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __57__HMAccessory__notifyClientsOfTargetControlSupportUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateTargetControlSupport:", *(_QWORD *)(a1 + 40));
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added symptoms handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1031;
    v10[3] = &unk_1E3AB5ED8;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v7, "invokeBlock:", v10);

  }
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed symptoms handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1033;
    v10[3] = &unk_1E3AB5ED8;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v7, "invokeBlock:", v10);

  }
}

uint64_t __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1033(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidRemoveSymptomsHandler:", *(_QWORD *)(a1 + 40));
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1031(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "symptomsHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory:didAddSymptomsHandler:", v2, v3);

}

uint64_t __52__HMAccessory__notifyDelegatesOfUpdatedControllable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateControllable:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__HMAccessory__notifyDelegatesOfUpdatedCalibrationStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateCalibrationStatus:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMAccessory__notifyDelegatesOfAdditionalSetupRequiredChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateAdditionalSetupRequired:", *(_QWORD *)(a1 + 40));
}

void __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke_2;
  v6[3] = &unk_1E3AB5CD0;
  v4 = a1[5];
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateApplicationDataForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setApplicationData:", *(_QWORD *)(a1 + 40));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 48), v4);

}

void __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __66__HMAccessory_updateApplicationData_forService_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateApplicationData:forService:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __48__HMAccessory__handleServiceConfigurationState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateConfigurationStateForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __37__HMAccessory__handleServiceSubtype___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateServiceSubtypeForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __47__HMAccessory__handleServiceDefaultNameUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateDefaultNameForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __37__HMAccessory__handleServiceRenamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateNameForService:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history request responded with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1018;
    v19[3] = &unk_1E3AB60A0;
    v14 = &v21;
    v21 = a1[5];
    v20 = v5;
    objc_msgSend(v13, "invokeBlock:", v19);

    v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Delete siri history request responded", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1019;
    v17[3] = &unk_1E3AB6078;
    v14 = &v18;
    v18 = a1[5];
    objc_msgSend(v15, "invokeBlock:", v17);
  }

}

uint64_t __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1018(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1019(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__HMAccessory_deleteSiriHistoryWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteSiriHistoryWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __51__HMAccessory__auditPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "context");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

  }
}

void __50__HMAccessory__listPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kDescriptionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), v6, v10);

  }
}

void __46__HMAccessory__identifyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegateCaller");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __45__HMAccessory_identifyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_identifyWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateBundleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateStoreID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateFirmwareUpdateAvailable:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateFirmwareVersion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __45__HMAccessory__handleCharacteristicsUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:service:didUpdateValueForCharacteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __45__HMAccessory__handleCharacteristicsUpdated___block_invoke_1017(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateServices:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__HMAccessory__handleConnectivityChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateReachability:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__HMAccessory__handleConnectivityChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateReachableTransports:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__HMAccessory__handlePairingStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateReachability:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__HMAccessory__handleRenamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateName:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__HMAccessory__handleCharacteristicValueUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:service:didUpdateValueForCharacteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __63__HMAccessory_notifyDelegateUpdatedSupportsMediaContentProfile__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsMediaContentProfile:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__HMAccessory_notifyDelegateUpdatedSupportsJustSiri__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsJustSiri:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__HMAccessory_notifyDelegateUpdatedSupportsRMVonAppleTV__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsRMVonAppleTV:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__HMAccessory_notifyDelegateUpdatedPreferredMediaUser__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdatePreferredMediaUser:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMAccessory_notifyDelegateUpdatedSupportsPreferredMediaUser__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateSupportsPreferredMediaUser:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__HMAccessory_notifyDelegateOfAudioDestinationControllerUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateAudioDestinationController:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__HMAccessory_notifyDelegateOfAudioDestinationUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateAudioDestination:", *(_QWORD *)(a1 + 40));
}

void __30__HMAccessory__mergeProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory profile via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "accessoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_unconfigure");

}

void __30__HMAccessory__mergeProfiles___block_invoke_997(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory profile via merge: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "accessoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__configureWithContext:accessory:", v9, *(_QWORD *)(a1 + 32));

}

void __30__HMAccessory__mergeProfiles___block_invoke_998(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__HMAccessory__mergeProfiles___block_invoke_2;
    block[3] = &unk_1E3AB5CD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

void __30__HMAccessory__mergeProfiles___block_invoke_1000(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__HMAccessory__mergeProfiles___block_invoke_2_1002;
    block[3] = &unk_1E3AB5CD0;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    dispatch_async(v6, block);

  }
}

void __30__HMAccessory__mergeProfiles___block_invoke_1004(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__HMAccessory__mergeProfiles___block_invoke_2_1005;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_2_1005(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateServices:", *(_QWORD *)(a1 + 40));
}

void __30__HMAccessory__mergeProfiles___block_invoke_2_1002(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeProfiles___block_invoke_3_1003;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_3_1003(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added profile: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "accessory:didAddProfile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __30__HMAccessory__mergeProfiles___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeProfiles___block_invoke_3;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed profile: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "accessory:didRemoveProfile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfTargetControlSupportUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfMultiUserSupportUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_811(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_812(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientsOfUpdatedSupportsAudioReturnChannel");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_813(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfSupportsCompanionInitiatedRestartUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfSupportsCompanionInitiatedObliterateUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfSupportsMusicAlarmUpdate");
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_6;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_816(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_817;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_819(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_820;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_822(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_823;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_825(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_826;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_828(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_829;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_831(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_832;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_834(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_835;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_836(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_837;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_839(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_840;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_843(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_844;
  v6[3] = &unk_1E3AB59E8;
  v7 = a1[5];
  v8 = a1[6];
  v4 = a1[7];
  v5 = a1[4];
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_3_845(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeDidUpdateSupportsWalletKeyDelegate:", objc_msgSend(*(id *)(a1 + 32), "supportsWalletKey"));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4_846(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeDidUpdateSupportsUWBUnlockDelegate:", objc_msgSend(*(id *)(a1 + 32), "supportsUWBUnlock"));
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_848(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_849;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_3_851(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4_852;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_5_853(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfUpdatedControllable");
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_6_966(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_7;
  v6[3] = &unk_1E3AB5CD0;
  v7 = a1[5];
  v4 = a1[6];
  v5 = a1[4];
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_9;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_11;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_13;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_15;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_972(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_973;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_974(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyClientsOfDiagnosticsTransferSupportUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_975(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfAdditionalSetupRequiredChange");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_976(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegatesOfUpdatedCalibrationStatus");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_977(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedSettings:", *(_QWORD *)(a1 + 40));
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_979(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_980;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_982(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_983;
  v6[3] = &unk_1E3AB5CD0;
  v4 = a1[5];
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_984(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateUpdatedSupportsMediaContentProfile");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_985(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfAudioDestinationUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_986(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfAudioDestinationControllerUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_987(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfAudioDestinationControllerUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_988(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfAudioDestinationControllerUpdate");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_989(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateUpdatedPreferredMediaUser");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_990(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateUpdatedSupportsPreferredMediaUser");
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_992(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_993;
  v6[3] = &unk_1E3AB5ED8;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_994(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateUpdatedSupportsRMVonAppleTV");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_995(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateUpdatedSupportsJustSiri");
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_993(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdatePendingConfigurationIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_983(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateSoftwareVersion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_2_980(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "device");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory:didUpdateDevice:", v2, v3);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_973(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidSetHasOnboardedForNaturalLighting:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:didUpdateFirmwareUpdateAvailable:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "isFirmwareUpdateAvailable"));
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_13(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "storeID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory:didUpdateStoreID:", v2, v3);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_11(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "bundleID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory:didUpdateBundleID:", v2, v3);

}

void __34__HMAccessory_mergeFromNewObject___block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "firmwareVersion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessory:didUpdateFirmwareVersion:", v2, v3);

}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateReprovisionStateForAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4_852(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateReachableTransports:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_849(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateReachability:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_844(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "home:didUpdateRoom:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_840(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateApplicationData:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_837(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateName:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_835(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryDidUpdateName:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_832(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports user media settings update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsUserMediaSettings:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_829(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports doorbell chime update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsDoorbellChime:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_826(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports third party music update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsThirdPartyMusic:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_823(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports audio analysis update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsAudioAnalysis:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_820(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports drop in update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsDropIn:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_817(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports media actions update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsMediaActions:", *(_QWORD *)(a1 + 32));
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports announce update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateSupportsAnnounce:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__HMAccessory__mergeControlTargetUUIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfAddedControlTarget:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__HMAccessory__mergeControlTargetUUIDs___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfRemovedControlTarget:", *(_QWORD *)(a1 + 40));
}

void __30__HMAccessory__mergeServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed service via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __30__HMAccessory__mergeServices___block_invoke_807(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added service via merge: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__configureWithContext:accessory:", v8, *(_QWORD *)(a1 + 32));

}

void __30__HMAccessory__mergeServices___block_invoke_809(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeServices___block_invoke_2;
  v5[3] = &unk_1E3AB5ED8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __30__HMAccessory__mergeServices___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling accessoryDidUpdateServices", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdateServices:", *(_QWORD *)(a1 + 32));
}

id __29__HMAccessory_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

uint64_t __76__HMAccessory__handleMultipleCharacteristicsUpdated_message_informDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessory:service:didUpdateValueForCharacteristic:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __56__HMAccessory__updateName_forService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (!v4)
  {
    objc_msgSend(WeakRetained, "setConfiguredName:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "setName:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 40), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateCaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 48), v4);

}

void __56__HMAccessory__updateName_forService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __84__HMAccessory__updateAuthorizationData_forService_characteristic_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setHasAuthorizationData:", objc_msgSend(a3, "hmf_BOOLForKey:", CFSTR("kCharacteristicAuthDataPresentKey")));
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 48), v6);

}

void __73__HMAccessory__updateAssociatedServiceType_forService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      v28 = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update associated service type: %@ with error: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "callCompletion:error:", *(_QWORD *)(a1 + 64), v5);
  }
  else
  {
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kServiceType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmf_firstObjectWithInstanceID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v20;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = v13;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Service not found for instance id: %@ updated service type: %@", (uint8_t *)&v28, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }
    v21 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v16, "_handleUpdateAssociatedServiceType:", v13));
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 40);
      v26 = *(void **)(a1 + 56);
      v28 = 138543874;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully updated associated service type: %@, for service: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "callCompletion:error:", *(_QWORD *)(a1 + 64), 0);

  }
}

void __45__HMAccessory__updateRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = v6;
  v5 = WeakRetained;
  if (!v6)
  {
    objc_msgSend(WeakRetained, "setRoom:", *(_QWORD *)(a1 + 32));
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "callCompletion:error:", *(_QWORD *)(a1 + 48), v4);

}

void __45__HMAccessory__updateRoom_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__HMAccessory__readValueForCharacteristic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "uuid");

  objc_msgSend(v5, "domain");
  objc_msgSend(v5, "code");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 64), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "delegateCaller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callCompletion:error:", v3, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "end");

}

void __71__HMAccessory__writeValue_forCharacteristic_service_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(*(id *)(a1 + 40), "uuid");

  objc_msgSend(v5, "domain");
  objc_msgSend(v5, "code");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 64), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "delegateCaller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callCompletion:error:", v3, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "end");

}

void __45__HMAccessory__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (!v5)
  {
    objc_msgSend(WeakRetained, "setConfiguredName:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "hmf_stringForKey:", CFSTR("kAccessoryName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "setName:", v9);

  }
  objc_msgSend(v7, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "callCompletion:error:", *(_QWORD *)(a1 + 40), v5);

}

uint64_t __53__HMAccessory_updateAccessoryName_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateName:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __44__HMAccessory_updateName_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "_updateName:completionHandler:", v3, a1[6]);
  }
  else
  {
    objc_msgSend(v2, "context");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCaller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callCompletion:error:", v5, v6);

  }
}

uint64_t __69__HMAccessory_clearMatterCredentialWithType_forUserIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__HMAccessory_clearMatterUserWithIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__HMAccessory_dumpMatterUsersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  if (a3)
  {
    v5 = a2;
    objc_msgSend(a3, "hmf_stringForKey:", CFSTR("users"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void (**)(uint64_t, _QWORD))(v6 + 16);
    v8 = a2;
    v7(v6, 0);
  }

}

uint64_t __58__HMAccessory_getAccessoryDiagnosticEventsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__HMAccessory_getAccessoryDiagnosticCountersWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__HMAccessory_queryLinkQualityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, id);
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  HMAccessoryLinkQualityResult *v19;
  id v20;

  v20 = a3;
  if (v20)
  {
    v5 = a2;
    v6 = objc_msgSend(v20, "hmf_BOOLForKey:", CFSTR("kAccessoryLinkQualitySupportedKey"));
    objc_msgSend(v20, "hmf_stringForKey:", CFSTR("kAccessoryMacAddressKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmf_stringForKey:", CFSTR("kAccessoryNetworkNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("kAccessoryLinkLayerTypeKey"));

    if (v10)
    {
      objc_msgSend(v20, "hmf_numberForKey:", CFSTR("kAccessoryLinkLayerTypeKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v20, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR("kAccessoryLinkQualityKey"));

    if (v16)
    {
      objc_msgSend(v20, "hmf_numberForKey:", CFSTR("kAccessoryLinkQualityKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

    }
    else
    {
      v18 = 0;
    }
    v19 = -[HMAccessoryLinkQualityResult initWithLinkQualitySupported:linkLayerType:macAddress:networkName:linkQuality:]([HMAccessoryLinkQualityResult alloc], "initWithLinkQualitySupported:linkLayerType:macAddress:networkName:linkQuality:", v6, v12, v7, v8, v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void (**)(uint64_t, _QWORD, id))(v13 + 16);
    v7 = a2;
    v14(v13, 0, v7);
  }

}

void __49__HMAccessory_queryLastSeenStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  HMAccessoryLastSeenStatus *v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (!a2)
  {
    objc_msgSend(v5, "hmf_dateForKey:", CFSTR("kAccessoryLastSeenKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("kAccessoryLowBatteryStatusKey"));

    if (v8)
    {
      objc_msgSend(v13, "hmf_numberForKey:", CFSTR("kAccessoryLowBatteryStatusKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (v6)
      {
LABEL_5:
        v11 = -[HMAccessoryLastSeenStatus initWithLastSeenDate:batteryStatus:]([HMAccessoryLastSeenStatus alloc], "initWithLastSeenDate:batteryStatus:", v6, v10);
        (*(void (**)(_QWORD, HMAccessoryLastSeenStatus *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11, 0);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
      if (v6)
        goto LABEL_5;
    }
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v11 = (HMAccessoryLastSeenStatus *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, HMAccessoryLastSeenStatus *))(v12 + 16))(v12, 0, v11);
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

void __55__HMAccessory_validatePairingAuthMethodWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "hmf_numberForKey:", CFSTR("HMA.authMethod"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = v4;
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v5, 0, objc_msgSend(v4, "integerValue"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, 5);

    }
  }
}

void __66__HMAccessory_queryAdvertisementInformationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  HMAccessoryAdvertisementInfo *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "hmf_stringForKey:", CFSTR("kIdentifierKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = -[HMAccessoryAdvertisementInfo initWithAccessoryIdentifier:]([HMAccessoryAdvertisementInfo alloc], "initWithAccessoryIdentifier:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HM.pairingIdentity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, &v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v35;
      v18 = v17;
      if (!v16)
      {
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v26;
          v41 = 2112;
          v42 = v18;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity for accessory from encoded pairing identity: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 32), "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "delegateCaller");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_746;
        v33[3] = &unk_1E3AB6078;
        v34 = *(id *)(a1 + 40);
        objc_msgSend(v28, "invokeBlock:", v33);

        v22 = v34;
        goto LABEL_13;
      }

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_2;
    v29[3] = &unk_1E3AB4D20;
    v21 = *(void **)(a1 + 40);
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = v16;
    v31 = 0;
    v32 = v21;
    v18 = v16;
    objc_msgSend(v20, "invokeBlock:", v29);

    v22 = v30;
LABEL_13:

    goto LABEL_14;
  }
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v11;
    v41 = 2112;
    v42 = v12;
    v43 = 2112;
    v44 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for accessory : %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegateCaller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_744;
  v36[3] = &unk_1E3AB60A0;
  v38 = *(id *)(a1 + 40);
  v37 = v5;
  objc_msgSend(v14, "invokeBlock:", v36);

  v15 = v38;
LABEL_14:

}

uint64_t __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_744(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_746(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identity for accessory : %@ / %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __44__HMAccessory__handlePairingIdentityUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate for pairing identity update: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "accessoryDidUpdatePairingIdentity:", *(_QWORD *)(a1 + 32));
}

void __76__HMAccessory_installManagedConfigurationProfileWithData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v5;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Install managed configuration profiles responded with error: %@", (uint8_t *)&v15, 0x16u);

      }
      v12 = 0;
    }
    else
    {
      objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMAccessory.mc.identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v14;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Install managed configuration profiles succeeded: %@", (uint8_t *)&v15, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__HMAccessory_removeManagedConfigurationProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v14;
        v21 = 2112;
        v22 = v5;
        v15 = "%{public}@Remove managed configuration profiles responded with error: %@";
        v16 = v13;
        v17 = OS_LOG_TYPE_ERROR;
        v18 = 22;
LABEL_7:
        _os_log_impl(&dword_19B1B0000, v16, v17, v15, (uint8_t *)&v19, v18);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v14;
      v15 = "%{public}@Remove managed configuration profiles responded";
      v16 = v13;
      v17 = OS_LOG_TYPE_INFO;
      v18 = 12;
      goto LABEL_7;
    }

    objc_autoreleasePoolPop(v10);
  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, v7, v8);

}

void __70__HMAccessory_fetchManagedConfigurationProfilesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    if (WeakRetained)
    {
      v9 = (void *)MEMORY[0x1A1AC1AAC]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v12;
        v39 = 2112;
        v40 = v5;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetch managed configuration profiles responded with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMAccessory.mc.profiles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v43[0] = objc_opt_class();
      v43[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v16, v13, &v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v36;
      if (v17)
      {
        if (v8)
        {
          v19 = (void *)MEMORY[0x1A1AC1AAC]();
          v20 = v8;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = v18;
            v34 = v19;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v22;
            v39 = 2112;
            v40 = v23;
            v41 = 2112;
            v42 = v17;
            _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Fetch managed configuration profiles responded: %@, %@", buf, 0x20u);

            v19 = v34;
            v18 = v33;
          }

          objc_autoreleasePoolPop(v19);
        }
        v5 = 0;
      }
      else
      {
        if (v8)
        {
          v29 = (void *)MEMORY[0x1A1AC1AAC]();
          v30 = v8;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = v29;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v32;
            v39 = 2112;
            v40 = v18;
            _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode profiles: %@", buf, 0x16u);

            v29 = v35;
          }

          objc_autoreleasePoolPop(v29);
        }
        v5 = v18;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      if (v8)
      {
        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        v25 = v8;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v27;
          v39 = 2112;
          v40 = 0;
          _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Encoded profiles are nil: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
      }
      v28 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v28 + 16))(v28, 0, v17);
      v5 = 0;
    }

  }
}

void __76__HMAccessory_updatePreferredMediaUserSelectionType_user_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v8, "uuid");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (!v5)
      {
        if (v9)
        {
          objc_msgSend(WeakRetained, "setPreferredMediaUserUUID:", v9);
          v11 = 1;
          goto LABEL_11;
        }
LABEL_10:
        objc_msgSend(WeakRetained, "setPreferredMediaUserUUID:", 0);
        v11 = 0;
        v10 = 0;
LABEL_11:
        v12 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(WeakRetained, "setPreferredUserSelectionType:", v11));
        v17 = WeakRetained;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferredMediaUserUUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "preferredUserSelectionType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v20;
          v23 = 2112;
          v24 = v18;
          v25 = 2112;
          v26 = v19;
          _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferredMediaUser on response to %@, type: %@", buf, 0x20u);

        }
LABEL_13:

        objc_autoreleasePoolPop(v12);
        goto LABEL_14;
      }
    }
    else
    {
      if (!v5)
        goto LABEL_10;
      v10 = 0;
    }
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = WeakRetained;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v15;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Updating preferredMediaUser on response to %@, type: %@ with error: %@", buf, 0x2Au);

    }
    goto LABEL_13;
  }
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __48__HMAccessory__notifyDelegateOfUpdatedSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE45A8F8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v28 = 138543618;
      v29 = v8;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated settings: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "accessory:didUpdateSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE459B90))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v28 = 138543618;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@(MP) Notifying client of updated settings: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v13, "mediaProfile:didUpdateSettings:", v10, *(_QWORD *)(a1 + 40));
  }

  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE452DD0))
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 40);
      v28 = 138543618;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@(MP) Notifying media object client of updated settings: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(v22, "mediaObject:didUpdateSettings:", v19, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __73__HMAccessory_updateShouldProcessTransactionRemovalWithValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__HMAccessory_unconfigureInfoDataProviderWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2048;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe to info data provider, option: %lu error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __59__HMAccessory_configureInfoDataProviderIfNeededWithOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to info data provider, error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)updatePendingConfigurationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  HMAccessory *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMAccessory *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMAccessory *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  -[HMAccessory context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory(PendingConfiguration) updatePendingConfigurationIdentifier:completionHandler:]", CFSTR("completionHandler"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v29;
      v41 = 2112;
      v42 = (const char *)v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v8 = (void *)v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, CFSTR("HMA.pendingConfigurationIdentifier"));
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory messageTargetUUID](self, "messageTargetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithTarget:", v11);

    v31 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryUpdatePendingConfigurationIdentifierMessage"), v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __92__HMAccessory_PendingConfiguration__updatePendingConfigurationIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_1E3AB5358;
    objc_copyWeak(&v37, &location);
    v14 = v32;
    v34 = v14;
    v15 = v8;
    v35 = v15;
    v36 = v6;
    v16 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v13, "setResponseHandler:", v33));
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v19;
      v41 = 2112;
      v42 = (const char *)v14;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating pending configuration identifier to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v15, "messageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendMessage:", v13);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v24;
      v41 = 2080;
      v42 = "-[HMAccessory(PendingConfiguration) updatePendingConfigurationIdentifier:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }

}

void __92__HMAccessory_PendingConfiguration__updatePendingConfigurationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v17 = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update pending configuration identifier to %@: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated pending configuration identifier to %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "setPendingConfigurationIdentifier:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

- (NSDictionary)serializedDictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[HMPBAccessoryReference accessoryReferenceWithAccessory:](HMPBAccessoryReference, "accessoryReferenceWithAccessory:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("HMShortcutsSerializedDictionaryVersion");
  v6[1] = CFSTR("HMShortcutsSerializedDictionaryProtocol");
  v7[0] = CFSTR("1.0");
  v7[1] = CFSTR("ProtoBuf");
  v6[2] = CFSTR("HMAccessorySerializedDataKey");
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (HMAccessory)accessoryWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "hmf_dataForKey:", CFSTR("HMAccessorySerializedDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMPBAccessoryReference accessoryReferenceWithData:](HMPBAccessoryReference, "accessoryReferenceWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessoryWithAccessoryReference:home:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessory *)v9;
}

+ (HMAccessory)accessoryWithAccessoryReference:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasUniqueIdentifier") & 1) != 0)
  {
    if ((objc_msgSend(v6, "hasHomeReference") & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v6, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmf_UUIDWithBytesAsData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v26 = (void *)MEMORY[0x1A1AC1AAC]();
        v27 = a1;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543362;
          v45 = v29;
          _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Accessory UniqueIdentifier", (uint8_t *)&v44, 0xCu);

        }
        objc_autoreleasePoolPop(v26);
        v19 = 0;
        goto LABEL_33;
      }
      objc_msgSend(v6, "homeReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "hasUniqueIdentifier") & 1) == 0)
      {
        v30 = (void *)MEMORY[0x1A1AC1AAC]();
        v31 = a1;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543362;
          v45 = v33;
          _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@HomeReference uniqueIdentifier not set", (uint8_t *)&v44, 0xCu);

        }
        objc_autoreleasePoolPop(v30);
        v19 = 0;
        goto LABEL_32;
      }
      v12 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v11, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmf_UUIDWithBytesAsData:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "isEqual:", v16);

        if ((v17 & 1) != 0)
        {
          objc_msgSend(v7, "accessoryWithUniqueIdentifier:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            v39 = (void *)MEMORY[0x1A1AC1AAC]();
            v40 = a1;
            HMFGetOSLogHandle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 138543618;
              v45 = v42;
              v46 = 2112;
              v47 = v10;
              _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Can't find accessory %@", (uint8_t *)&v44, 0x16u);

            }
            objc_autoreleasePoolPop(v39);
          }

          goto LABEL_31;
        }
        v34 = (void *)MEMORY[0x1A1AC1AAC]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uniqueIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543874;
          v45 = v37;
          v46 = 2112;
          v47 = v14;
          v48 = 2112;
          v49 = v38;
          _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Trying to dereference Characteristic Reference from different home %@ %@", (uint8_t *)&v44, 0x20u);

          goto LABEL_25;
        }
      }
      else
      {
        v34 = (void *)MEMORY[0x1A1AC1AAC]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138543362;
          v45 = v37;
          _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UniqueIdentifier", (uint8_t *)&v44, 0xCu);
LABEL_25:

        }
      }

      objc_autoreleasePoolPop(v34);
      v19 = 0;
LABEL_31:

LABEL_32:
LABEL_33:

      goto LABEL_34;
    }
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v24;
      v25 = "%{public}@HomeReference not set in accessoryReference";
      goto LABEL_13;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v24;
      v25 = "%{public}@AccessoryReference uniqueIdentifier not set";
LABEL_13:
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v44, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v21);
  v19 = 0;
LABEL_34:

  return (HMAccessory *)v19;
}

- (void)fetchCHIPPairingsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessory *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory(CHIP) fetchCHIPPairingsWithCompletion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching CHIP pairings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v12 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](v8, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryFetchCHIPPairingsMessage"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = v8;
    v16 = v6;
    v26 = v16;
    v27 = v4;
    objc_msgSend(v15, "setResponseHandler:", v25);
    objc_msgSend(v16, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:", v15);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2080;
      v31 = "-[HMAccessory(CHIP) fetchCHIPPairingsWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);
  }

}

- (void)removeCHIPPairings:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessory *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  -[HMAccessory context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing CHIP pairings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](v10, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithTarget:", v15);

    v26 = CFSTR("HMA.chipPairings");
    encodeRootObject(v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryRemoveCHIPPairingsMessage"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__HMAccessory_CHIP__removeCHIPPairings_completion___block_invoke;
    v23[3] = &unk_1E3AB60C8;
    v23[4] = v10;
    v20 = v8;
    v24 = v20;
    v25 = v7;
    objc_msgSend(v19, "setResponseHandler:", v23);
    objc_msgSend(v20, "messageDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendMessage:", v19);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v22;
    v30 = 2080;
    v31 = "-[HMAccessory(CHIP) removeCHIPPairings:completion:]";
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
LABEL_9:

  }
}

- (void)activateCHIPPairingModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Activating CHIP pairing mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryActivateCHIPPairingModeMessage"), v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__HMAccessory_CHIP__activateCHIPPairingModeWithCompletion___block_invoke;
    v18[3] = &unk_1E3AB60C8;
    v18[4] = v7;
    v15 = v5;
    v19 = v15;
    v20 = v4;
    objc_msgSend(v14, "setResponseHandler:", v18);
    objc_msgSend(v15, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v14);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    v23 = 2080;
    v24 = "-[HMAccessory(CHIP) activateCHIPPairingModeWithCompletion:]";
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:

  }
}

- (void)setCHIPPairingModeActive:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    -[HMAccessory activateCHIPPairingModeWithCompletion:](self, "activateCHIPPairingModeWithCompletion:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Setting CHIP pairing mode inactive is not supported", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMAccessory context](v8, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegateCaller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callCompletion:error:", v6, v13);

  }
}

- (void)activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMAccessory *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMAccessory *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMAccessory(CHIP) activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:]", CFSTR("completion"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = (const char *)v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Activating CHIP pairing mode and creating setup payload string", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v12 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](v8, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryActivateCHIPPairingModeAndCreateSetupPayloadStringMessage"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __86__HMAccessory_CHIP__activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion___block_invoke;
    v25[3] = &unk_1E3AB60C8;
    v25[4] = v8;
    v16 = v6;
    v26 = v16;
    v27 = v4;
    objc_msgSend(v15, "setResponseHandler:", v25);
    objc_msgSend(v16, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:", v15);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2080;
      v31 = "-[HMAccessory(CHIP) activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);
  }

}

- (void)removeCorrespondingSystemCommissionerPairingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessory *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing corresponding system commissioner pairing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](v7, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTarget:", v12);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMAccessoryRemoveCorrespondingSystemCommissionerPairingMessage"), v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__HMAccessory_CHIP__removeCorrespondingSystemCommissionerPairingWithCompletion___block_invoke;
    v18[3] = &unk_1E3AB60C8;
    v18[4] = v7;
    v15 = v5;
    v19 = v15;
    v20 = v4;
    objc_msgSend(v14, "setResponseHandler:", v18);
    objc_msgSend(v15, "messageDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendMessage:", v14);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    v23 = 2080;
    v24 = "-[HMAccessory(CHIP) removeCorrespondingSystemCommissionerPairingWithCompletion:]";
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:

  }
}

void __80__HMAccessory_CHIP__removeCorrespondingSystemCommissionerPairingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v12 = "%{public}@Failed to remove corresponding system commissioner pairing: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    v12 = "%{public}@Successfully removed corresponding system commissioner pairing";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __86__HMAccessory_CHIP__activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMA.chipSetupPayloadString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully activated CHIP pairing mode and created setup payload string: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 48);
    v16 = v7;
    v17 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate CHIP pairing mode and create setup payload string: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 48);
    v16 = 0;
    v17 = v5;
  }
  objc_msgSend(v13, "callCompletion:obj:error:", v15, v16, v17);

}

void __59__HMAccessory_CHIP__activateCHIPPairingModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v12 = "%{public}@Failed to activate CHIP pairing mode: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    v12 = "%{public}@Successfully activated CHIP pairing mode";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __51__HMAccessory_CHIP__removeCHIPPairings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      v12 = "%{public}@Failed to remove CHIP pairings: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    v12 = "%{public}@Successfully removed CHIP pairings";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMA.chipPairings"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    goto LABEL_7;
  if (!v7)
    goto LABEL_7;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v11, v8, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;

  if (v12)
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetched CHIP pairings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(a1[5], "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_13;
    v25[3] = &unk_1E3AB60A0;
    v18 = a1[6];
    v26 = v12;
    v27 = v18;
    v19 = v12;
    objc_msgSend(v17, "invokeBlock:", v25);

  }
  else
  {
LABEL_7:
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = a1[4];
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v23;
      v34 = 2112;
      v35 = v5;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch CHIP pairings: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(a1[5], "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_11;
    v28[3] = &unk_1E3AB60A0;
    v30 = a1[6];
    v5 = v5;
    v29 = v5;
    objc_msgSend(v24, "invokeBlock:", v28);

    v19 = v30;
  }

}

uint64_t __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (HMNetworkConfigurationProfile)networkConfigurationProfile
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMAccessory profiles](self, "profiles");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v2);
      v7 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v6);
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      v9 = v8;

      if (v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return (HMNetworkConfigurationProfile *)v7;
}

- (void)setHasOnboardedForNaturalLightingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HMAccessory *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  _QWORD aBlock[5];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessory context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessory uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    v9 = objc_alloc(MEMORY[0x1E0D285F8]);
    v10 = (void *)objc_msgSend(v9, "initWithName:destination:payload:", HMAccessorySetHasOnboardedForNaturalLightingMessage, v8, 0);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3AB59B8;
    aBlock[4] = self;
    v30 = v4;
    v12 = _Block_copy(aBlock);
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pendingRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _Block_copy(v12);
    objc_msgSend(v14, "addCompletionBlock:forIdentifier:", v15, v13);

    v23 = v11;
    v24 = 3221225472;
    v25 = __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke_5;
    v26 = &unk_1E3AB6200;
    v27 = v14;
    v28 = v13;
    v16 = v13;
    v17 = v14;
    objc_msgSend(v10, "setResponseHandler:", &v23);
    objc_msgSend(v5, "messageDispatcher", v23, v24, v25, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendMessage:", v10);

LABEL_7:
    goto LABEL_8;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    v33 = 2080;
    v34 = "-[HMAccessory(Light) setHasOnboardedForNaturalLightingWithCompletion:]";
    _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
    goto LABEL_7;
  }
LABEL_8:

}

void __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v22 = 138543874;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to onboard accessory for natural lighting %@:%@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v5;
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "setHasOnboardedForNaturalLighting:", 1));
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v21;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully onboarded accessory for natural lighting: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegateCaller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 0;
  }
  objc_msgSend(v13, "callCompletion:error:", v15, v16);

}

void __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);

}

@end
