@implementation HMBModel

- (HMBModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  id v7;
  id v8;
  HMBModel *v9;
  HMBModel *v10;
  uint64_t v11;
  NSSet *hmbUnavailableProperties;
  uint64_t v13;
  NSSet *hmbReadOnlyProperties;
  HMBModel *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMBModel;
  v9 = -[HMBModel init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hmbModelID, a3);
    objc_storeStrong((id *)&v10->_hmbParentModelID, a4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    hmbUnavailableProperties = v10->_hmbUnavailableProperties;
    v10->_hmbUnavailableProperties = (NSSet *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    hmbReadOnlyProperties = v10->_hmbReadOnlyProperties;
    v10->_hmbReadOnlyProperties = (NSSet *)v13;

    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hmbModelContainer);
  objc_storeStrong((id *)&self->_hmbReadOnlyProperties, 0);
  objc_storeStrong((id *)&self->_hmbUnavailableProperties, 0);
  objc_storeStrong((id *)&self->_hmbDataVersion, 0);
  objc_storeStrong((id *)&self->_hmbType, 0);
  objc_storeStrong((id *)&self->_hmbParentModelID, 0);
  objc_storeStrong((id *)&self->_hmbModelID, 0);
  objc_storeStrong((id *)&self->_hmbReserved, 0);
}

- (BOOL)hmbPropertyIsAvailable:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMBModel hmbUnavailableProperties](self, "hmbUnavailableProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

- (NSSet)hmbUnavailableProperties
{
  return self->_hmbUnavailableProperties;
}

- (NSMutableDictionary)hmbReserved
{
  return self->_hmbReserved;
}

- (BOOL)hmbPropertyIsReadOnly:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMBModel hmbReadOnlyProperties](self, "hmbReadOnlyProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)hmbReadOnlyProperties
{
  return self->_hmbReadOnlyProperties;
}

- (void)setHmbReserved:(id)a3
{
  objc_storeStrong((id *)&self->_hmbReserved, a3);
}

- (NSUUID)hmbModelID
{
  return self->_hmbModelID;
}

- (id)populateModelWithDictionary:(id)a3 fromStorageLocation:(unint64_t)a4 using:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *context;
  void *v38;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint64_t *v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[2];
  _BYTE v57[128];
  _QWORD v58[8];

  v58[6] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v40 = v7;
  if (!v7)
    _HMFPreconditionFailure();
  v38 = v8;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1632;
  v54 = __Block_byref_object_dispose__1633;
  v55 = 0;
  context = (void *)MEMORY[0x1D17B6230]();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  -[HMBModel setHmbReserved:](self, "setHmbReserved:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "valueForKey:", CFSTR("_u"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);
  -[HMBModel setHmbModelID:](self, "setHmbModelID:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "valueForKey:", CFSTR("_P"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
  -[HMBModel setHmbParentModelID:](self, "setHmbParentModelID:", v15);

  objc_msgSend(v7, "valueForKey:", CFSTR("_T"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel setHmbType:](self, "setHmbType:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D286E0]);
  objc_msgSend(v7, "valueForKey:", CFSTR("_V"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithVersionString:", v18);
  -[HMBModel setHmbDataVersion:](self, "setHmbDataVersion:", v19);

  -[HMBModel hmbReserved](self, "hmbReserved");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = CFSTR("_P");
  v58[1] = CFSTR("_u");
  v58[2] = CFSTR("_v");
  v58[3] = CFSTR("_T");
  v58[4] = CFSTR("_G");
  v58[5] = CFSTR("_V");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectsForKeys:", v21);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v56[0] = CFSTR("_R");
  v56[1] = CFSTR("_U");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[HMBModel hmbReserved](self, "hmbReserved");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hmf_dictionaryForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HMBModel hmbReserved](self, "hmbReserved");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "na_dictionaryByMappingValues:", &__block_literal_global_372);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v30, v26);

        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v23);
  }

  +[HMBModelContainer allowedTypes](HMBModelContainer, "allowedTypes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __66__HMBModel_populateModelWithDictionary_fromStorageLocation_using___block_invoke;
  v41[3] = &unk_1E8931948;
  v41[4] = self;
  v33 = v31;
  v42 = v33;
  v44 = &v50;
  v34 = v38;
  v43 = v34;
  v45 = a4;
  objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v41);

  objc_autoreleasePoolPop(context);
  v35 = (id)v51[5];
  _Block_object_dispose(&v50, 8);

  return v35;
}

- (HMFVersion)hmbDataVersion
{
  return self->_hmbDataVersion;
}

- (void)hmbAssociateWithContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMBModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *hmbType;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailureWithFormat();
  v5 = v4;
  -[HMBModel hmbModelContainer](self, "hmbModelContainer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HMBModel hmbContainerDataVersion](self, "hmbContainerDataVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1D17B6230]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbContainerDataVersion](v12, "hmbContainerDataVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dataVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v14;
        v41 = 2112;
        v42 = v15;
        v43 = 2112;
        v44 = v16;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Associating with a container with a different data version (%@ != %@).", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
  }
  -[HMBModel setHmbModelContainer:](self, "setHmbModelContainer:", v5);
  if (!self->_hmbType)
  {
    objc_msgSend(v5, "typeNameForModelClass:", objc_opt_class());
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    hmbType = self->_hmbType;
    self->_hmbType = v17;

  }
  if (!self->_hmbDataVersion)
  {
    -[HMBModel hmbContainerDataVersion](self, "hmbContainerDataVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel setHmbDataVersion:](self, "setHmbDataVersion:", v19);

    -[HMBModel hmbReserved](self, "hmbReserved");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel setHmbReserved:](self, "setHmbReserved:", v21);

    }
    -[HMBModel hmbReserved](self, "hmbReserved");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readOnlyVersionsForModelClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("_R"));

    -[HMBModel hmbReserved](self, "hmbReserved");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unavailableVersionsForModelClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("_U"));

  }
  __calculateUnavailableReadOnly(self, v5);
  __modelReferenceFields(self);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v26);
        -[HMBModel hmbPropertyNamed:](self, "hmbPropertyNamed:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
        v33 = v32;

        objc_msgSend(v33, "associateWithContainer:", v5);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v28);
  }

}

- (HMFVersion)hmbContainerDataVersion
{
  void *v2;
  void *v3;

  -[HMBModel hmbModelContainer](self, "hmbModelContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFVersion *)v3;
}

- (BOOL)_validateType:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  _QWORD v56[3];
  _QWORD v57[3];
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[3];
  _QWORD v61[3];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  +[HMBModelContainer allowedTypes](HMBModelContainer, "allowedTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v53 != v10)
        objc_enumerationMutation(v7);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v14 = v6;
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            v24 = *(_QWORD *)v49;
LABEL_16:
            v25 = 0;
            v26 = v23 + v22;
            while (1)
            {
              if (*(_QWORD *)v49 != v24)
                objc_enumerationMutation(v14);
              if (-[HMBModel _validateType:error:](self, "_validateType:error:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v25), a4))
              {
                break;
              }
              if (v22 == ++v25)
              {
                v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
                v23 = v26;
                if (v22)
                  goto LABEL_16;
                goto LABEL_33;
              }
            }
            if (!a4)
              goto LABEL_39;
            objc_msgSend(*a4, "userInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", CFSTR("pathStack"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%lu]"), v23 + v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v18;
            v34 = v19;
            goto LABEL_36;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v32 = 0;
            goto LABEL_41;
          }
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v14 = v6;
          v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v45;
LABEL_26:
            v30 = 0;
            while (1)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v14);
              v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v30);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                  goto LABEL_39;
                v43 = (void *)MEMORY[0x1E0CB35C8];
                v36 = *MEMORY[0x1E0D27FC8];
                v56[0] = CFSTR("message");
                objc_msgSend(MEMORY[0x1E0CB37A0], "string");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v57[0] = v15;
                v56[1] = CFSTR("pathStack");
                v37 = (void *)MEMORY[0x1E0C99DE8];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v31);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "arrayWithObject:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v57[1] = v19;
                v56[2] = CFSTR("errorText");
                v38 = (void *)MEMORY[0x1E0CB3940];
                v39 = (objc_class *)objc_opt_class();
                NSStringFromClass(v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "stringWithFormat:", CFSTR("(key must be of string type (is %@))"), v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v57[2] = v41;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "errorWithDomain:code:userInfo:", v36, 3, v42);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_37;
              }
              objc_msgSend(v14, "objectForKey:", v31);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[HMBModel _validateType:error:](self, "_validateType:error:", v15, a4))
                break;

              if (v28 == ++v30)
              {
                v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
                if (v28)
                  goto LABEL_26;
                goto LABEL_33;
              }
            }
            if (!a4)
              goto LABEL_38;
            objc_msgSend(*a4, "userInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", CFSTR("pathStack"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v33;
            v34 = v31;
LABEL_36:
            objc_msgSend(v33, "addObject:", v34);
LABEL_37:

LABEL_38:
LABEL_39:
            v32 = 1;
LABEL_40:

            goto LABEL_41;
          }
        }
LABEL_33:
        v32 = 0;
        goto LABEL_40;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v9)
      continue;
    break;
  }
LABEL_11:

  if (a4)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D27FC8];
    v60[0] = CFSTR("message");
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v61[0] = v14;
    v60[1] = CFSTR("pathStack");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v15;
    v60[2] = CFSTR("errorText");
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("(%@ not a valid type within an aggregate type)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 3, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  v32 = 1;
LABEL_41:

  return v32;
}

- (id)validateType:(id)a3 path:(id)a4
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
  uint64_t v15;
  uint64_t v16;
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v32 = 0;
  LODWORD(self) = -[HMBModel _validateType:error:](self, "_validateType:error:", a3, &v32);
  v7 = v32;
  v8 = v7;
  v9 = 0;
  if ((_DWORD)self)
  {
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("pathStack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v6);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v12, "reverseObjectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "appendFormat:", CFSTR("/%@"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v16);
    }

    objc_msgSend(v8, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("errorText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" %@"), v20);

    objc_msgSend(v8, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("message"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setString:", v13);

    v23 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v8, "code");
    v33 = CFSTR("message");
    v34 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)hmbPrepareForStorageLocation:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  -[HMBModel hmbReserved](self, "hmbReserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (a3 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "hmbProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__HMBModel_hmbPrepareForStorageLocation___block_invoke;
    v11[3] = &unk_1E8931FF0;
    v12 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  return v8;
}

- (id)prepareForStorageLocation:(unint64_t)a3 using:(id)a4 updatedModelIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  HMBModel *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  HMBModel *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  _QWORD v49[4];
  id v50;
  HMBModel *v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  HMBModel *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__1632;
  v61 = __Block_byref_object_dispose__1633;
  v62 = 0;
  -[HMBModel hmbModelID](self, "hmbModelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (-[HMBModel hmbParentModelID](self, "hmbParentModelID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = v13 == 0,
        v13,
        v12,
        v14))
  {
    v31 = (void *)MEMORY[0x1D17B6230]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v34;
      v65 = 2112;
      v66 = v32;
      _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container because modelID or parentModelID are missing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, &unk_1E8947978);
      v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v30 = 0;
      *a6 = v35;
      goto LABEL_28;
    }
LABEL_18:
    v30 = 0;
    goto LABEL_28;
  }
  if (!self->_hmbDataVersion)
  {
    v36 = (void *)MEMORY[0x1D17B6230]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v39;
      v65 = 2112;
      v66 = v37;
      _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container because hmbDataVersion is missing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, &unk_1E89479A0);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  -[HMBModel hmbPrepareForStorageLocation:](self, "hmbPrepareForStorageLocation:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbDataVersion](self, "hmbDataVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "versionString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("_V"));

  -[HMBModel hmbType](self, "hmbType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("_T"));

  -[HMBModel hmbModelID](self, "hmbModelID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("_u"));

  -[HMBModel hmbParentModelID](self, "hmbParentModelID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("_P"));

  -[HMBModel hmbMinimumSupportedVersion](self, "hmbMinimumSupportedVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v23 == 0;

  if ((_DWORD)v21)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_T"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("_t"));

  }
  __modelReferenceFields(self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __66__HMBModel_prepareForStorageLocation_using_updatedModelIDs_error___block_invoke;
  v49[3] = &unk_1E8931970;
  v27 = v15;
  v55 = &v57;
  v50 = v27;
  v51 = self;
  v52 = v11;
  v28 = v25;
  v53 = v28;
  v54 = v10;
  v56 = a3;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v49);

  v29 = (void *)v58[5];
  if (v29)
  {
    v30 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v29);
  }
  else
  {
    -[HMBModel hmbReserved](self, "hmbReserved");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "hmf_dictionaryForKey:", CFSTR("_R"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v41, "count"))
    {
      objc_msgSend(v41, "na_dictionaryByMappingValues:", &__block_literal_global_374);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v42, CFSTR("_R"));

    }
    -[HMBModel hmbReserved](self, "hmbReserved");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hmf_dictionaryForKey:", CFSTR("_U"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v44, "count"))
    {
      objc_msgSend(v44, "na_dictionaryByMappingValues:", &__block_literal_global_374);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v45, CFSTR("_U"));

    }
    v46 = (objc_class *)objc_msgSend((id)objc_opt_class(), "hmbGenericRepresentation");
    if (v46 && (-[objc_class isEqual:](v46, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v47, CFSTR("_G"));

    }
    v30 = v27;

  }
LABEL_28:
  _Block_object_dispose(&v57, 8);

  return v30;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBModel hmbModelID](self, "hmbModelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hmbModelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel hmbModelID](self, "hmbModelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSSet)hmbSetProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  -[HMBModel hmbReserved](self, "hmbReserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMBModel hmbUnavailableProperties](self, "hmbUnavailableProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMBModel hmbReserved](self, "hmbReserved", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "characterAtIndex:", 0) != 95
          && (objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSSet *)v5;
}

- (BOOL)hmbPropertyWasSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[HMBModel hmbReserved](self, "hmbReserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMBModel hmbUnavailableProperties](self, "hmbUnavailableProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)hmbIsModelReadOnly
{
  char v3;
  void *v4;
  void *v5;

  if (-[HMBModel hmbIsModelGenericRepresentation](self, "hmbIsModelGenericRepresentation"))
    return 1;
  objc_msgSend((id)objc_opt_class(), "hmbReadOnlyBefore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMBModel hmbContainerDataVersion](self, "hmbContainerDataVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isGreaterThanOrEqualTo:", v5);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hmbIsModelGenericRepresentation
{
  uint64_t v2;
  void *v4;

  v2 = objc_msgSend((id)objc_opt_class(), "hmbGenericRepresentation");
  if ((objc_msgSend((id)objc_opt_class(), "isEqual:", v2) & 1) != 0)
    return 1;
  v4 = (void *)objc_opt_class();
  return objc_msgSend(v4, "isEqual:", objc_opt_class());
}

- (BOOL)hmbValidForStorage:(id)a3
{
  id v4;
  void *v5;
  HMBModel *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  HMBModel *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  HMBModel *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    -[HMBModel hmbAssociateWithContainer:](self, "hmbAssociateWithContainer:", v4);
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel hmbCanonicalType](v6, "hmbCanonicalType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel hmbModelID](v6, "hmbModelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel hmbParentModelID](v6, "hmbParentModelID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v47 = v8;
      v48 = 2112;
      v49 = v9;
      v50 = 2112;
      v51 = v11;
      v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@Model %@.%@.%@ suppressing validity check due to HMDBackingStoreModelObject backport.", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    v14 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hmbProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    -[HMBModel hmbModelID](self, "hmbModelID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v18 = (void *)MEMORY[0x1D17B6230]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v37 = v18;
        HMFGetLogIdentifier();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbCanonicalType](v19, "hmbCanonicalType");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbModelID](v19, "hmbModelID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbParentModelID](v19, "hmbParentModelID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v21;
        v48 = 2112;
        v49 = v39;
        v50 = 2112;
        v51 = v23;
        v52 = 2112;
        v53 = v25;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (modelID is not set).", buf, 0x2Au);

        v18 = v37;
      }

      objc_autoreleasePoolPop(v18);
      *((_BYTE *)v43 + 24) = 0;
    }
    -[HMBModel hmbParentModelID](self, "hmbParentModelID", v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      v28 = (void *)MEMORY[0x1D17B6230]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v38 = v28;
        HMFGetLogIdentifier();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbCanonicalType](v29, "hmbCanonicalType");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbModelID](v29, "hmbModelID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbParentModelID](v29, "hmbParentModelID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v31;
        v48 = 2112;
        v49 = v40;
        v50 = 2112;
        v51 = v33;
        v52 = 2112;
        v53 = v35;
        _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (parentModelID is not set).", buf, 0x2Au);

        v28 = v38;
      }

      objc_autoreleasePoolPop(v28);
      *((_BYTE *)v43 + 24) = 0;
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __31__HMBModel_hmbValidForStorage___block_invoke;
    v41[3] = &unk_1E8931998;
    v41[4] = self;
    v41[5] = &v42;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v41, v38);
    v14 = *((_BYTE *)v43 + 24) != 0;
    _Block_object_dispose(&v42, 8);

  }
  return v14;
}

- (id)hmbModelByMergingFromModel:(id)a3 isFromCloud:(BOOL)a4 error:(id *)a5
{
  HMBModel *v8;
  HMBModel *v9;
  HMBModel *v10;
  HMBModel *v11;
  void *v12;
  HMBModel *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  HMBModel *v17;
  NSString *v18;
  void *v19;
  HMBModel *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  HMBModel *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  HMBModel *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  HMBModel *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  HMBModel *v59;
  id v60;
  _QWORD *v61;
  HMBModel *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  HMBModel *v79;
  BOOL v80;
  id v81;
  _QWORD v82[4];
  id v83;
  HMBModel *v84;
  HMBModel *v85;
  id v86;
  uint64_t v87;
  BOOL v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[2];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = (HMBModel *)a3;
  v9 = v8;
  if (v8 == self)
  {
    v17 = v8;
    goto LABEL_52;
  }
  v80 = a4;
  v10 = self;
  v11 = v9;
  if (-[HMBModel hmbCanonicalTypeInferred](v10, "hmbCanonicalTypeInferred"))
  {
    v12 = (void *)MEMORY[0x1D17B6230]();
    v13 = v10;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v95 = v15;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@[HMBModel hmbMerge:from:] called with nil container on target (worrysome in production code).", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = objc_opt_class();
  }
  else
  {
    -[HMBModel hmbType](v10, "hmbType");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = (uint64_t)NSClassFromString(v18);

  }
  if (-[HMBModel hmbCanonicalTypeInferred](v11, "hmbCanonicalTypeInferred"))
  {
    v19 = (void *)MEMORY[0x1D17B6230]();
    v20 = v10;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v95 = v22;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@[HMBModel hmbMerge:from:] called with nil container on source (worrysome in production code).", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = objc_opt_class();
    if (!v16)
    {
LABEL_19:
      if (!(v16 | v23))
      {
        -[HMBModel hmbType](v10, "hmbType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbType](v11, "hmbType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqualToString:", v33);

        v35 = MEMORY[0x1D17B6230]();
        v36 = v10;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
        if ((v34 & 1) != 0)
        {
          if (v38)
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMBModel hmbType](v36, "hmbType");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v95 = v39;
            v96 = 2112;
            v97 = v40;
            _os_log_impl(&dword_1CCD48000, v37, OS_LOG_TYPE_INFO, "%{public}@Merging two unknown model objects object using the default rules %@.", buf, 0x16u);
LABEL_29:

          }
        }
        else if (v38)
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel hmbType](v36, "hmbType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel hmbType](v11, "hmbType");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = v39;
          v96 = 2112;
          v97 = v40;
          v98 = 2112;
          v99 = v51;
          _os_log_impl(&dword_1CCD48000, v37, OS_LOG_TYPE_INFO, "%{public}@Merging two unknown model objects object using the default rules (%@ and %@)", buf, 0x20u);

          goto LABEL_29;
        }

        v52 = (void *)v35;
LABEL_35:
        objc_autoreleasePoolPop(v52);
        goto LABEL_36;
      }
      v41 = MEMORY[0x1D17B6230]();
      v42 = v10;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (!v16 || v23)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel hmbType](v42, "hmbType");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBModel hmbType](v11, "hmbType");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = v45;
          v96 = 2112;
          v97 = v46;
          v98 = 2112;
          v99 = v47;
          v48 = "%{public}@Going to merge, but things won't be better until our type flips. (%@ / %@)";
          v49 = v44;
          v50 = OS_LOG_TYPE_ERROR;
          goto LABEL_33;
        }
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbType](v11, "hmbType");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbType](v42, "hmbType");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = v45;
        v96 = 2112;
        v97 = v46;
        v98 = 2112;
        v99 = v47;
        v48 = "%{public}@Going to merge unknown (probably from future) model type %@ with %@.";
        v49 = v44;
        v50 = OS_LOG_TYPE_INFO;
LABEL_33:
        _os_log_impl(&dword_1CCD48000, v49, v50, v48, buf, 0x20u);

      }
      v52 = (void *)v41;
      goto LABEL_35;
    }
  }
  else
  {
    -[HMBModel hmbType](v11, "hmbType");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = (uint64_t)NSClassFromString(v24);

    if (!v16)
      goto LABEL_19;
  }
  if (!v23)
    goto LABEL_19;
  if ((objc_msgSend((id)v16, "isSubclassOfClass:", v23) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1D17B6230]();
    v26 = v10;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass((Class)v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass((Class)v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v28;
      v96 = 2112;
      v97 = v29;
      v98 = 2112;
      v99 = v30;
      _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot merge. This object %@ is not a sub-class of %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
LABEL_36:
  v31 = 0;
LABEL_37:

  if (v31)
  {
    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v31);
  }
  else
  {
    v79 = v9;
    v53 = (void *)-[HMBModel copy](v10, "copy");
    objc_msgSend(v53, "hmbReserved");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "mutableCopy");

    v56 = objc_opt_class();
    -[HMBModel hmbReserved](v11, "hmbReserved");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __57__HMBModel_hmbModelByMergingFromModel_isFromCloud_error___block_invoke;
    v82[3] = &unk_1E89319C0;
    v58 = v53;
    v88 = v80;
    v87 = v56;
    v83 = v58;
    v84 = v10;
    v59 = v11;
    v85 = v59;
    v60 = v55;
    v86 = v60;
    objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v82);

    objc_msgSend(v58, "setHmbReserved:", v60);
    v61 = v58;
    v62 = v59;
    if (!v61[6]
      || (objc_msgSend(v61, "hmbDataVersion"),
          v63 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMBModel hmbDataVersion](v62, "hmbDataVersion"),
          v64 = (void *)objc_claimAutoreleasedReturnValue(),
          v65 = objc_msgSend(v63, "isGreaterThanOrEqualTo:", v64),
          v64,
          v63,
          (v65 & 1) == 0))
    {
      v81 = v60;
      -[HMBModel hmbDataVersion](v62, "hmbDataVersion");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v66, "copy");
      objc_msgSend(v61, "setHmbDataVersion:", v67);

      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v93[0] = CFSTR("_U");
      v93[1] = CFSTR("_R");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, buf, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v70; ++i)
          {
            if (*(_QWORD *)v90 != v71)
              objc_enumerationMutation(v68);
            v73 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
            -[HMBModel hmbReserved](v62, "hmbReserved");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "hmf_dictionaryForKey:", v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v61, "hmbReserved");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:forKey:", v75, v73);

          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, buf, 16);
        }
        while (v70);
      }

      __calculateUnavailableReadOnly(v61, 0);
      v60 = v81;
    }

    v77 = v86;
    v17 = v61;

    v9 = v79;
  }

LABEL_52:
  return v17;
}

- (void)hmbMergeSetPropertiesFromModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  objc_msgSend(v4, "hmbSetProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "hmbPropertyNamed:isSet:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModel hmbSetProperty:named:](self, "hmbSetProperty:named:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)hmbModelByMergingSetPropertiesFromModel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[HMBModel copy](self, "copy");
  objc_msgSend(v5, "hmbMergeSetPropertiesFromModel:", v4);

  return v5;
}

- (BOOL)hmbIsDifferentFromModel:(id)a3 differingFields:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, _BYTE *);
  void *v15;
  HMBModel *v16;
  id v17;
  id v18;
  id *v19;

  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "hmbPropertyNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __52__HMBModel_hmbIsDifferentFromModel_differingFields___block_invoke;
    v15 = &unk_1E89319E8;
    v16 = self;
    v17 = v6;
    v9 = v7;
    v18 = v9;
    v19 = a4;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v12);

    if (a4)
      *a4 = objc_retainAutorelease(v9);
    v10 = objc_msgSend(v9, "count", v12, v13, v14, v15, v16) != 0;

  }
  else
  {
    if (a4)
    {
      -[HMBModel hmbSetProperties](self, "hmbSetProperties");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = 1;
  }

  return v10;
}

- (NSString)hmbType
{
  NSString *hmbType;
  void *v5;
  HMBModel *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  hmbType = self->_hmbType;
  if (hmbType)
    return hmbType;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMBModel hmbType] called without having an associated id<HMBModelContainer>.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHmbMinimumSupportedVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HMBModel hmbReserved](self, "hmbReserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel setHmbReserved:](self, "setHmbReserved:", v5);

  }
  objc_msgSend(v8, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbReserved](self, "hmbReserved");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("_i"));

}

- (HMFVersion)hmbMinimumSupportedVersion
{
  void *v2;
  void *v3;
  void *v4;

  -[HMBModel hmbReserved](self, "hmbReserved");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("_i"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v3);
  else
    v4 = 0;

  return (HMFVersion *)v4;
}

- (void)hmbSetProperty:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  __setProperty(self, v6, v7);

}

- (void)hmbUnsetPropertyNamed:(id)a3
{
  __setProperty(self, a3, 0);
}

- (id)hmbPropertyNamed:(id)a3 isSet:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMBModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel hmbCanonicalType](v12, "hmbCanonicalType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to get value of property %@ from type %@ (no such property exists)", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
  -[HMBModel hmbReserved](self, "hmbReserved");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = v10 != 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)hmbDefaultValueForPropertyNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBModel *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "defaultValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBModel hmbCanonicalType](v9, "hmbCanonicalType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2112;
      v17 = v4;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to get default value of property %@ from type %@ (no such property exists)", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)hmbPropertyNamed:(id)a3
{
  return -[HMBModel hmbPropertyNamed:isSet:](self, "hmbPropertyNamed:isSet:", a3, 0);
}

- (NSString)hmbCanonicalType
{
  NSString *v2;
  objc_class *v3;
  objc_class *v4;
  void *v5;
  char v6;
  NSString *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v2 = self->_hmbType;
  if (!v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSString isEqual:](v2, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = v2;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v10, v2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)hmbCanonicalTypeInferred
{
  return self->_hmbType == 0;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMFVersion *hmbDataVersion;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  BOOL v30;
  id obj;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbCanonicalType](self, "hmbCanonicalType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8935680;
  if (self->_hmbType)
    v7 = &stru_1E8935680;
  else
    v7 = CFSTR(" (inferred)");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%@"), v4, v7);

  -[HMBModel hmbModelID](self, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  uuid: %@"), v9);

  -[HMBModel hmbParentModelID](self, "hmbParentModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  parent: %@"), v11);

  if (self->_hmbDataVersion)
    hmbDataVersion = self->_hmbDataVersion;
  else
    hmbDataVersion = (HMFVersion *)CFSTR("<UNSET>");
  -[HMBModel hmbContainerDataVersion](self, "hmbContainerDataVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = "";
  if (!v13)
    v14 = " (override)";
  v32 = v3;
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  version: %@%s"), hmbDataVersion, v14);

  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = +[HMBModel hmbShouldLogPrivateInformation](HMBModel, "hmbShouldLogPrivateInformation");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v16)
  {
    v17 = v16;
    v33 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "hmbProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMBModel hmbReserved](self, "hmbReserved");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForKey:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          +[HMBModel formattedStringForValue:](HMBModel, "formattedStringForValue:", v23);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = v6;
          v26 = v6;
        }
        else
        {
          objc_msgSend(v21, "defaultValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
            goto LABEL_27;
          objc_msgSend(v21, "defaultValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMBModel formattedStringForValue:](HMBModel, "formattedStringForValue:", v23);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v25 = v6;
          v26 = CFSTR(" (default)");
        }

        v6 = v25;
        if (-[HMBModel hmbPropertyIsReadOnly:](self, "hmbPropertyIsReadOnly:", v19))
          v28 = CFSTR(" (read-only)");
        else
          v28 = v25;
        if (objc_msgSend(v21, "loggingVisibility") == 3
          || !v30 && (!v21 || objc_msgSend(v21, "loggingVisibility") == 1))
        {

          v24 = CFSTR("...");
        }
        objc_msgSend(v32, "appendFormat:", CFSTR("\n  %@%@%@: %@"), v19, v28, v26, v24);

LABEL_27:
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v17);
  }

  return (NSString *)v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMBModel hmbModelID](self, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbParentModelID](self, "hmbParentModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithModelID:parentModelID:", v5, v6);

  v8 = -[NSMutableDictionary mutableCopy](self->_hmbReserved, "mutableCopy");
  v9 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hmbModelContainer);
  objc_storeWeak((id *)(v7 + 80), WeakRetained);

  objc_storeStrong((id *)(v7 + 48), self->_hmbDataVersion);
  objc_storeStrong((id *)(v7 + 40), self->_hmbType);
  objc_storeStrong((id *)(v7 + 64), self->_hmbUnavailableProperties);
  objc_storeStrong((id *)(v7 + 72), self->_hmbReadOnlyProperties);
  *(_QWORD *)(v7 + 56) = self->_hmbRecordRow;
  return (id)v7;
}

- (NSSet)hmbSetExternalProperties
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend((id)objc_opt_class(), "hmbExternalProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__HMBModel_hmbSetExternalProperties__block_invoke;
  v6[3] = &unk_1E8932848;
  v6[4] = self;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)hmbSetExternalRecordFields
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMBModel hmbSetExternalProperties](self, "hmbSetExternalProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__HMBModel_hmbSetExternalRecordFields__block_invoke;
  v6[3] = &unk_1E8931A30;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)dumpDebug:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  HMBModel *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMBModel debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17B6230]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v14;
          v23 = 2112;
          v24 = v15;
          v25 = 2112;
          v26 = v10;
          _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@%@%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v7);
  }

}

- (void)dumpDebug
{
  -[HMBModel dumpDebug:](self, "dumpDebug:", &stru_1E8935680);
}

- (NSString)hmbDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMBModel hmbCanonicalType](self, "hmbCanonicalType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModel hmbModelID](self, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBModel hmbModelID](self, "hmbModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHmbModelID:(id)a3
{
  objc_storeStrong((id *)&self->_hmbModelID, a3);
}

- (NSUUID)hmbParentModelID
{
  return self->_hmbParentModelID;
}

- (void)setHmbParentModelID:(id)a3
{
  objc_storeStrong((id *)&self->_hmbParentModelID, a3);
}

- (void)setHmbType:(id)a3
{
  objc_storeStrong((id *)&self->_hmbType, a3);
}

- (void)setHmbDataVersion:(id)a3
{
  objc_storeStrong((id *)&self->_hmbDataVersion, a3);
}

- (unint64_t)hmbRecordRow
{
  return self->_hmbRecordRow;
}

- (void)setHmbRecordRow:(unint64_t)a3
{
  self->_hmbRecordRow = a3;
}

- (void)setHmbUnavailableProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hmbUnavailableProperties, a3);
}

- (void)setHmbReadOnlyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hmbReadOnlyProperties, a3);
}

- (BOOL)hmbIgnoreModel
{
  return self->_hmbIgnoreModel;
}

- (HMBModelContainer)hmbModelContainer
{
  return (HMBModelContainer *)objc_loadWeakRetained((id *)&self->_hmbModelContainer);
}

- (void)setHmbModelContainer:(id)a3
{
  objc_storeWeak((id *)&self->_hmbModelContainer, a3);
}

id __38__HMBModel_hmbSetExternalRecordFields__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "hmbProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "externalRecordField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __36__HMBModel_hmbSetExternalProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hmbReserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

void __52__HMBModel_hmbIsDifferentFromModel_differingFields___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v5 = a2;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "hmbPropertyNamed:isSet:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 40), "hmbPropertyNamed:isSet:", v5, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v8 || (__isEqualDeepCompare(v6, v7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    if (!*(_QWORD *)(a1 + 56))
      *a3 = 1;
  }

}

void __57__HMBModel_hmbModelByMergingFromModel_isFromCloud_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "characterAtIndex:", 0) == 95)
    goto LABEL_19;
  objc_msgSend((id)objc_opt_class(), "hmbPropertyNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (!v8)
    goto LABEL_14;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 64), "hmbProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "excludeFromCloudStorage"))
    {
      objc_msgSend(v10, "externalRecordField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v21 = (void *)MEMORY[0x1D17B6230]();
        v22 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "hmbType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543874;
          v27 = v24;
          v28 = 2112;
          v29 = v25;
          v30 = 2112;
          v31 = v5;
          _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Model %@ from cloud contained local only property %@, dropping", (uint8_t *)&v26, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        goto LABEL_18;
      }
    }

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "hmbPropertyIsReadOnly:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "hmbReserved");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = *(void **)(a1 + 56);
      objc_msgSend(v10, "hmbObjectByMergingFromObject:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setValue:forKey:", v20, v5);

LABEL_18:
      goto LABEL_19;
    }

LABEL_14:
    objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v6, v5);
    goto LABEL_19;
  }
  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hmbType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v26 = 138544130;
    v27 = v15;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_INFO, "%{public}@Unable to merge %@ property of model class %@ (marked readonly for %@).", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
LABEL_19:

}

void __31__HMBModel_hmbValidForStorage___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(v8, "isOptional") & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "hmbPropertyWasSet:", v7) & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hmbCanonicalType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hmbModelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hmbParentModelID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (field %@ is not set).", buf, 0x34u);

      v9 = v18;
    }

    objc_autoreleasePoolPop(v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __66__HMBModel_prepareForStorageLocation_using_updatedModelIDs_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_34;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      +[HMBModelContainer allowedTypes](HMBModelContainer, "allowedTypes");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v57;
LABEL_8:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_33;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
            if (v15)
              goto LABEL_8;
            break;
          }
        }
      }

      if (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot encode value of type %@ for property '%@' requring NSObject type"), objc_opt_class(), v7);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1D17B6230]();
        v19 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          v65 = v21;
          v66 = 2112;
          v67 = v22;
          v68 = 2112;
          v69 = v13;
          _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model %@ for container: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0D27FC8];
        v62 = CFSTR("message");
        v63 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 3, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

        *a4 = 1;
LABEL_33:

        goto LABEL_34;
      }
      if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 56), "containsObject:", v7))
      {
        v29 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
        v13 = v30;

        objc_msgSend(v13, "isValidForContainer:updatedModelIDs:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

        v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        if (v34)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@ (property could not be validated): %@"), v7, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x1D17B6230]();
          v37 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v54 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v65 = v39;
            v66 = 2112;
            v67 = v35;
            _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container: %@", buf, 0x16u);

            v36 = v54;
          }

          objc_autoreleasePoolPop(v36);
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v41 = *MEMORY[0x1E0D27FC8];
          v60 = CFSTR("message");
          v61 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 3, v42);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v45 = *(void **)(v44 + 40);
          *(_QWORD *)(v44 + 40) = v43;

          *a4 = 1;
          goto LABEL_33;
        }

      }
      v46 = *(_QWORD *)(a1 + 80);
      v47 = *(void **)(a1 + 64);
      v48 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      obj = *(id *)(v48 + 40);
      objc_msgSend(v47, "encodePropertyValue:forProperty:field:storageLocation:error:", v9, v7, v8, v46, &obj);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v48 + 40), obj);
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v7);
      }
      else
      {
        v49 = (void *)MEMORY[0x1D17B6230]();
        v50 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v65 = v52;
          v66 = 2112;
          v67 = v53;
          _os_log_impl(&dword_1CCD48000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v49);
        *a4 = 1;
      }
      goto LABEL_33;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "validateType:path:", v9, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    *a4 = 1;
LABEL_34:

}

void __41__HMBModel_hmbPrepareForStorageLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "excludeFromCloudStorage"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v5);

}

void __66__HMBModel_populateModelWithDictionary_fromStorageLocation_using___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hmbReserved");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && v10)
  {
    if (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()))
    {
      objc_msgSend(*(id *)(a1 + 32), "hmbReserved");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v7);

    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = *(id *)(a1 + 40);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v37 != v14)
              objc_enumerationMutation(v12);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              LODWORD(v13) = 1;
              goto LABEL_15;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_15:

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        && (!(_DWORD)v13
         || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(v8, "classObj")) & 1) == 0
         && (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()) & 1) == 0))
      {
        v10 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v10;
        else
          v16 = 0;
        v17 = v16;

        if (v17)
        {
          v18 = *(_QWORD *)(a1 + 64);
          v19 = *(void **)(a1 + 48);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          obj = *(id *)(v20 + 40);
          objc_msgSend(v19, "decodePropertyValueFromData:forProperty:field:storageLocation:error:", v17, v7, v8, v18, &obj);
          v21 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)(v20 + 40), obj);

          if (v21)
          {
            objc_msgSend(*(id *)(a1 + 32), "hmbReserved");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setValue:forKey:", v21, v7);

            v10 = (id)v21;
          }
          else
          {
            v30 = (void *)MEMORY[0x1D17B6230]();
            v31 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              v41 = v33;
              v42 = 2112;
              v43 = v7;
              v44 = 2112;
              v45 = v34;
              _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode value for %@ property: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v30);
            v10 = 0;
            *a4 = 1;
          }
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = *MEMORY[0x1E0D27FC8];
          v46 = CFSTR("message");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expecting internal storage to be a NSData, but it's a %@"), objc_opt_class());
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 3, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v29 = *(void **)(v28 + 40);
          *(_QWORD *)(v28 + 40) = v27;

          *a4 = 1;
        }

      }
    }
  }

}

+ (BOOL)hmbShouldLogPrivateInformation
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("shouldLogPrivateInformation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (NSDictionary)hmbProperties
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

+ (NSSet)hmbPropertyNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "hmbProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

+ (NSArray)hmbQueries
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (id)hmbMutableModelClassesWithQueries
{
  if (hmbMutableModelClassesWithQueries_onceToken != -1)
    dispatch_once(&hmbMutableModelClassesWithQueries_onceToken, &__block_literal_global_1698);
  return (id)hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries;
}

+ (NSSet)hmbModelClassesWithQueries
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "hmbMutableModelClassesWithQueries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

+ (void)hmbResetModelsWithQueries
{
  id v2;

  objc_msgSend(a1, "hmbMutableModelClassesWithQueries");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (void)hmbPrepareQueries
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(a1, "hmbQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(a1, "hmbMutableModelClassesWithQueries");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", a1);

  }
  else
  {
    objc_msgSend(a1, "hmbProperties");
    v7[1] = 3221225472;
    v7[2] = __29__HMBModel_hmbPrepareQueries__block_invoke;
    v7[3] = &__block_descriptor_40_e40_v32__0__NSString_8__HMBModelField_16_B24l;
    v7[4] = a1;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

+ (NSUUID)hmbSchemaHashRoot
{
  if (hmbSchemaHashRoot_onceToken != -1)
    dispatch_once(&hmbSchemaHashRoot_onceToken, &__block_literal_global_33);
  return (NSUUID *)(id)hmbSchemaHashRoot__schemaHashRoot;
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 0;
}

+ (NSString)hmbExternalRecordType
{
  return (NSString *)CFSTR("Record");
}

+ (HMFVersion)hmbReadOnlyBefore
{
  return 0;
}

+ (Class)hmbGenericRepresentation
{
  return (Class)objc_opt_class();
}

+ (BOOL)propertyDiffersFrom:(id)a3 to:(id)a4
{
  return __isEqualDeepCompare(a3, a4) ^ 1;
}

+ (id)formattedStringForValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (!v5)
  {
    v7 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSArray: %lu items>"), objc_msgSend(v9, "count"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
    v10 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSDictionary: %lu items>"), objc_msgSend(v12, "count"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "hmbDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "stringWithFormat:", CFSTR("<NSData: %@>"), v18);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      objc_msgSend(v14, "description");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (__CFString *)v13;
LABEL_22:

    goto LABEL_23;
  }
  v6 = CFSTR("<NULL>");
LABEL_24:

  return v6;
}

+ (NSSet)hmbExternalProperties
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (__modelExternalStorageFields_onceToken != -1)
    dispatch_once(&__modelExternalStorageFields_onceToken, &__block_literal_global_375);
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__modelExternalStorageFields_externalStorageFields, "objectForKey:", a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((objc_msgSend(a1, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "hmbProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = ____modelExternalStorageFields_block_invoke_2;
      v8[3] = &unk_1E8931FF0;
      v6 = v4;
      v9 = v6;
      objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
      v3 = v6;
      objc_msgSend((id)__modelExternalStorageFields_externalStorageFields, "setObject:forKey:", v3, a1);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__modelExternalStorageFields_externalStorageFields, "setObject:forKey:", v3, a1);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__modelExternalStorageFields_lock);
  return (NSSet *)v3;
}

+ (NSSet)hmbExternalRecordFields
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "hmbExternalProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__HMBModel_hmbExternalRecordFields__block_invoke;
  v6[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1)
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_138);
  return (id)logCategory__hmf_once_v39;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  objc_class *v10;
  void (*v11)(void);
  const char *v12;
  unsigned __int8 v13;
  objc_super v15;

  keyFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend((id)objc_opt_class(), "hmbProperties"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v5);

    v10 = (objc_class *)objc_opt_class();
    if (v9)
    {
      v11 = (void (*)(void))propertyIMP;
      v12 = "@@:";
    }
    else
    {
      v11 = (void (*)(void))setPropertyIMP;
      v12 = "v@:@";
    }
    class_addMethod(v10, a3, v11, v12);
    v13 = 1;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___HMBModel;
    v13 = objc_msgSendSuper2(&v15, sel_resolveInstanceMethod_, a3);
  }

  return v13;
}

void __23__HMBModel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39;
  logCategory__hmf_once_v39 = v0;

}

id __35__HMBModel_hmbExternalRecordFields__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hmbProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "externalRecordField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __29__HMBModel_hmbSchemaHashRoot__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("551E3F88-0C11-4402-A486-6D1EB759AADD"));
  v1 = (void *)hmbSchemaHashRoot__schemaHashRoot;
  hmbSchemaHashRoot__schemaHashRoot = v0;

}

void __29__HMBModel_hmbPrepareQueries__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "encodeBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "hmbMutableModelClassesWithQueries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 32));

    *a4 = 1;
  }
}

void __45__HMBModel_hmbMutableModelClassesWithQueries__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries;
  hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries = v0;

}

@end
