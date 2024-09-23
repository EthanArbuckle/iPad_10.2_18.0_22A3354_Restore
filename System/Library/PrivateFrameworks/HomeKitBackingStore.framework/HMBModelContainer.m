@implementation HMBModelContainer

- (HMBModelContainer)init
{
  void *v3;
  void *v4;
  HMBModelContainer *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("4.0.0"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", CFSTR("1.0.0"));
  v5 = -[HMBModelContainer initWithDataVersion:legacyDataVersion:](self, "initWithDataVersion:legacyDataVersion:", v3, v4);

  return v5;
}

- (HMBModelContainer)initWithDataVersion:(id)a3 legacyDataVersion:(id)a4
{
  id v7;
  id v8;
  HMBModelContainer *v9;
  HMBModelContainer *v10;
  uint64_t v11;
  NSMapTable *classToNameTransform;
  uint64_t v13;
  NSMapTable *nameToClassTransform;
  uint64_t v15;
  NSMapTable *objectPropertyHashLookup;
  uint64_t v17;
  NSMapTable *classReadOnlyVersionCache;
  uint64_t v19;
  NSMapTable *classUnavailableVersionCache;
  uint64_t v21;
  NSMapTable *queryFieldsCache;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMBModelContainer;
  v9 = -[HMBModelContainer init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyDataVersion, a4);
    objc_storeStrong((id *)&v10->_dataVersion, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    classToNameTransform = v10->_classToNameTransform;
    v10->_classToNameTransform = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    nameToClassTransform = v10->_nameToClassTransform;
    v10->_nameToClassTransform = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    objectPropertyHashLookup = v10->_objectPropertyHashLookup;
    v10->_objectPropertyHashLookup = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    classReadOnlyVersionCache = v10->_classReadOnlyVersionCache;
    v10->_classReadOnlyVersionCache = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    classUnavailableVersionCache = v10->_classUnavailableVersionCache;
    v10->_classUnavailableVersionCache = (NSMapTable *)v19;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    queryFieldsCache = v10->_queryFieldsCache;
    v10->_queryFieldsCache = (NSMapTable *)v21;

  }
  return v10;
}

- (id)readOnlyVersionsForModelClass:(Class)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id result;
  _QWORD v13[4];
  id v14;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBModelContainer classReadOnlyVersionCache](self, "classReadOnlyVersionCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class hmbProperties](a3, "hmbProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__HMBModelContainer_readOnlyVersionsForModelClass___block_invoke;
    v13[3] = &unk_1E8931FF0;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
    v7 = v10;
    -[HMBModelContainer classReadOnlyVersionCache](self, "classReadOnlyVersionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, a3);

LABEL_4:
    os_unfair_lock_unlock(p_propertyLock);
    return v7;
  }
  result = (id)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

- (id)unavailableVersionsForModelClass:(Class)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id result;
  _QWORD v13[4];
  id v14;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBModelContainer classUnavailableVersionCache](self, "classUnavailableVersionCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class hmbProperties](a3, "hmbProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__HMBModelContainer_unavailableVersionsForModelClass___block_invoke;
    v13[3] = &unk_1E8931FF0;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
    v7 = v10;
    -[HMBModelContainer classUnavailableVersionCache](self, "classUnavailableVersionCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, a3);

LABEL_4:
    os_unfair_lock_unlock(p_propertyLock);
    return v7;
  }
  result = (id)_HMFPreconditionFailure();
  __break(1u);
  return result;
}

- (unint64_t)bestModelEncodingForStorageLocation:(unint64_t)a3
{
  return 2;
}

- (id)typeNameForModelClass:(Class)a3
{
  void *v4;
  void *v5;

  -[HMBModelContainer classToNameTransform](self, "classToNameTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    NSStringFromClass(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (Class)modelClassForTypeName:(id)a3
{
  NSString *v4;
  void *v5;
  Class v6;
  objc_class *v7;

  v4 = (NSString *)a3;
  -[HMBModelContainer nameToClassTransform](self, "nameToClassTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (Class)objc_msgSend(v5, "objectForKey:", v4);

  if (!v6)
    v6 = NSClassFromString(v4);
  v7 = v6;

  return v7;
}

- (id)dataFromModel:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 updatedModelIDs:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  HMBModelContainer *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  HMBModelContainer *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  objc_msgSend(v12, "hmbAssociateWithContainer:", self);
  v28 = 0;
  objc_msgSend(v12, "prepareForStorageLocation:using:updatedModelIDs:error:", a5, self, v13, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  if (!v14)
  {
    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v12;
      v33 = 2112;
      v34 = (unint64_t)v15;
      _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare model %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    if (a7)
    {
      v21 = objc_retainAutorelease(v15);
LABEL_15:
      v22 = 0;
      *a7 = v21;
      goto LABEL_17;
    }
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  if (a4 == 2)
  {
    +[HMBModelContainer encodeAsOPACK:error:](HMBModelContainer, "encodeAsOPACK:error:", v14, a7);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a4 != 1)
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2112;
      v32 = v12;
      v33 = 2048;
      v34 = a4;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot encode data from model %@ with unknown encoding: %lu", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  +[HMBModelContainer encodeAsNSDictionary:error:](HMBModelContainer, "encodeAsNSDictionary:error:", v14, a7);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v22 = (void *)v16;
LABEL_17:

  return v22;
}

- (id)modelFromDictionary:(id)a3 storageLocation:(unint64_t)a4 typeName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  objc_class *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMBModelContainer *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = -[HMBModelContainer _modelClassFromDictionary:typeName:error:](self, "_modelClassFromDictionary:typeName:error:", v10, v11, a6);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v10, "hmf_stringForKey:", CFSTR("_V"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v38 = (void *)v14;
    }
    else
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("_v"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        if (!a6)
        {
          v16 = 0;
          goto LABEL_20;
        }
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0D27FC8];
        v45 = CFSTR("message");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("expecting a versioning key named %@ but one does not exist"), CFSTR("_v"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 3, v23);
        v16 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
      if (v10)
      {
        -[HMBModelContainer legacyDataVersion](self, "legacyDataVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "versionString");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = CFSTR("0.0.0");
      }
      v38 = 0;
      v24 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v24, "setObject:forKey:", v19, CFSTR("_V"));

      v10 = v24;
    }
    v25 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v10, "valueForKey:", CFSTR("_u"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "initWithUUIDString:", v26);

    v22 = (void *)v27;
    v28 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v10, "valueForKey:", CFSTR("_P"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);

    v30 = (void *)objc_msgSend([v13 alloc], "initWithModelID:parentModelID:", v22, v23);
    objc_msgSend(v30, "populateModelWithDictionary:fromStorageLocation:using:", v10, a4, self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)MEMORY[0x1D17B6230]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = v22;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v35;
        v41 = 2112;
        v42 = v10;
        v43 = 2112;
        v44 = v31;
        _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to populate model with dictionary %@: %@", buf, 0x20u);

        v22 = v37;
      }

      objc_autoreleasePoolPop(v32);
      v16 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v31);
    }
    else
    {
      objc_msgSend(v30, "hmbAssociateWithContainer:", self);
      v16 = v30;
    }
    v15 = v38;

    goto LABEL_19;
  }
  v16 = 0;
LABEL_21:

  return v16;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 type:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMBModelContainer *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (a4 == 2)
  {
    +[HMBModelContainer decodeAsOPACK:error:](HMBModelContainer, "decodeAsOPACK:error:", v12, a7);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2048;
        v25 = a4;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize from unknown encoding: %lu", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
        v16 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    +[HMBModelContainer decodeAsNSDictionary:error:](HMBModelContainer, "decodeAsNSDictionary:error:", v12, a7);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
  if (!v14)
    goto LABEL_11;
  -[HMBModelContainer modelFromDictionary:storageLocation:typeName:error:](self, "modelFromDictionary:storageLocation:typeName:error:", v14, a5, v13, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v16;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 error:(id *)a6
{
  return -[HMBModelContainer modelFromData:encoding:storageLocation:type:error:](self, "modelFromData:encoding:storageLocation:type:error:", a3, a4, a5, 0, a6);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableModelContainer *v4;
  void *v5;
  void *v6;
  HMBMutableModelContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = [HMBMutableModelContainer alloc];
  -[HMBModelContainer dataVersion](self, "dataVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelContainer legacyDataVersion](self, "legacyDataVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModelContainer initWithDataVersion:legacyDataVersion:](v4, "initWithDataVersion:legacyDataVersion:", v5, v6);

  if (v7)
  {
    -[HMBModelContainer classToNameTransform](self, "classToNameTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[HMBModelContainer setClassToNameTransform:](v7, "setClassToNameTransform:", v9);

    -[HMBModelContainer nameToClassTransform](self, "nameToClassTransform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[HMBModelContainer setNameToClassTransform:](v7, "setNameToClassTransform:", v11);

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HMBModelContainer dataVersion](self, "dataVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBModelContainer legacyDataVersion](self, "legacyDataVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDataVersion:legacyDataVersion:", v5, v6);

  if (v7)
  {
    -[HMBModelContainer classToNameTransform](self, "classToNameTransform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v7, "setClassToNameTransform:", v9);

    -[HMBModelContainer nameToClassTransform](self, "nameToClassTransform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v7, "setNameToClassTransform:", v11);

  }
  return v7;
}

- (id)schemaHashForModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "hmbPropertyNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "dataUsingEncoding:", 4, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendData:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v15 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend((id)objc_opt_class(), "hmbSchemaHashRoot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hmf_UUIDWithNamespace:data:", v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)updateLocalZone:(id)a3
{
  void *v4;
  HMBModelContainer *v5;
  SEL v6;
  id v7;
  id obj;

  obj = a3;
  -[HMBModelContainer localZone](self, "localZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    if (!v4)
      objc_storeWeak((id *)&self->_localZone, obj);

  }
  else
  {
    v5 = (HMBModelContainer *)_HMFPreconditionFailure();
    -[HMBModelContainer updateMirror:](v5, v6, v7);
  }
}

- (void)updateMirror:(id)a3
{
  void *v4;
  HMBModelContainer *v5;
  SEL v6;
  id v7;
  id v8;
  id *v9;
  id obj;

  obj = a3;
  -[HMBModelContainer mirror](self, "mirror");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    if (!v4)
      objc_storeWeak((id *)&self->_mirror, obj);

  }
  else
  {
    v5 = (HMBModelContainer *)_HMFPreconditionFailure();
    -[HMBModelContainer _modelClassFromDictionary:typeName:error:](v5, v6, v7, v8, v9);
  }
}

- (Class)_modelClassFromDictionary:(id)a3 typeName:(id)a4 error:(id *)a5
{
  id v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  int v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;
  HMBModelContainer *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMBModelContainer *v28;
  NSObject *v29;
  void *v30;
  NSString *v31;
  Class v32;
  void *v33;
  HMBModelContainer *v34;
  NSObject *v35;
  void *v36;
  void *v38;
  HMBModelContainer *v39;
  NSObject *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  objc_msgSend(v8, "hmf_stringForKey:", CFSTR("_i"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286E0]), "initWithVersionString:", v10);
    -[HMBModelContainer dataVersion](self, "dataVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAtLeastVersion:", v11);

    if (!v13)
    {
      v16 = (void *)MEMORY[0x1D17B6230]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBModelContainer dataVersion](v17, "dataVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v19;
        v46 = 2112;
        v47 = v11;
        v48 = 2112;
        v49 = v20;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@Using HMBModelUnsupported because model's minimum version %@ is higher than current version: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      objc_opt_class();
      a5 = (id *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }

  }
  if (!v9)
  {
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("_T"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v8, "hmf_stringForKey:", CFSTR("_t"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v38 = (void *)MEMORY[0x1D17B6230]();
        v39 = self;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v41;
          v46 = 2112;
          v47 = (NSString *)v8;
          _os_log_impl(&dword_1CCD48000, v40, OS_LOG_TYPE_ERROR, "%{public}@Cannot find type information in model dictionary: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        v9 = 0;
        goto LABEL_16;
      }
    }
  }
  v14 = -[HMBModelContainer modelClassForTypeName:](self, "modelClassForTypeName:", v9);
  if (v14)
  {
    v15 = v14;
LABEL_9:
    if ((-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      a5 = v15;
      goto LABEL_25;
    }
    if (!a5)
      goto LABEL_25;
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D27FC8];
    v42 = CFSTR("message");
    v23 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("remapped (or explicit map) is not a subclass of HMBModel (%@ is not a sub-class of HMBModel)"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 3, v26);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
    a5 = 0;
    goto LABEL_25;
  }
  v27 = (void *)MEMORY[0x1D17B6230]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v30;
    v46 = 2112;
    v47 = v9;
    _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_INFO, "%{public}@Unable to find model class named %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(v8, "hmf_stringForKey:", CFSTR("_G"));
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = NSClassFromString(v31);
    if (v32)
    {
      v15 = v32;
      v9 = v31;
      goto LABEL_9;
    }
  }
  v33 = (void *)MEMORY[0x1D17B6230]();
  v34 = v28;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v36;
    v46 = 2112;
    v47 = v31;
    _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_INFO, "%{public}@Unable to resolve type name to class: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v33);
  objc_opt_class();
  a5 = (id *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
LABEL_25:

  return (Class)a5;
}

- (id)encodePropertyValue:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFA284D8) & 1) != 0)
  {
    v26 = 0;
    objc_msgSend(v10, "hmbEncodeForStorageLocation:error:", a6, &v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26;
    v14 = v13;
    if (v12)
    {
      v15 = v12;
      v16 = v15;
    }
    else
    {
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to encode value %@ for property '%@': %@"), objc_opt_class(), v11, v14);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (a7)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0D27FC8];
        v27[0] = CFSTR("message");
        v27[1] = CFSTR("underlyingError");
        v28[0] = v20;
        v28[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 3, v24);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
      v16 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot encode value of type %@ for property '%@' because it does not conform to HMBModelObjectCoder"), objc_opt_class(), v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v17;
    if (!a7)
    {
      v16 = 0;
      goto LABEL_12;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D27FC8];
    v29 = CFSTR("message");
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 3, v15);
    v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v16;
}

- (id)decodePropertyValueFromData:(id)a3 forProperty:(id)a4 field:(id)a5 storageLocation:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if ((objc_msgSend((id)objc_msgSend(v13, "classObj"), "conformsToProtocol:", &unk_1EFA284D8) & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(v13, "classObj"), "hmbDecodeData:fromStorageLocation:error:", v11, a6, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a7)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D27FC8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("should conform to HMBModelObjectCoder (but storage class for property %@ does not)"), v12, CFSTR("message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 3, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return a7;
}

- (HMFVersion)legacyDataVersion
{
  return self->_legacyDataVersion;
}

- (HMFVersion)dataVersion
{
  return self->_dataVersion;
}

- (NSMapTable)queryFieldsCache
{
  return self->_queryFieldsCache;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_loadWeakRetained((id *)&self->_localZone);
}

- (HMBMirrorProtocol)mirror
{
  return (HMBMirrorProtocol *)objc_loadWeakRetained((id *)&self->_mirror);
}

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
}

- (void)setClassToNameTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMapTable)nameToClassTransform
{
  return self->_nameToClassTransform;
}

- (void)setNameToClassTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMapTable)objectPropertyHashLookup
{
  return self->_objectPropertyHashLookup;
}

- (void)setObjectPropertyHashLookup:(id)a3
{
  objc_storeStrong((id *)&self->_objectPropertyHashLookup, a3);
}

- (NSMapTable)classReadOnlyVersionCache
{
  return self->_classReadOnlyVersionCache;
}

- (void)setClassReadOnlyVersionCache:(id)a3
{
  objc_storeStrong((id *)&self->_classReadOnlyVersionCache, a3);
}

- (NSMapTable)classUnavailableVersionCache
{
  return self->_classUnavailableVersionCache;
}

- (void)setClassUnavailableVersionCache:(id)a3
{
  objc_storeStrong((id *)&self->_classUnavailableVersionCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classUnavailableVersionCache, 0);
  objc_storeStrong((id *)&self->_classReadOnlyVersionCache, 0);
  objc_storeStrong((id *)&self->_objectPropertyHashLookup, 0);
  objc_storeStrong((id *)&self->_nameToClassTransform, 0);
  objc_storeStrong((id *)&self->_classToNameTransform, 0);
  objc_destroyWeak((id *)&self->_mirror);
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_queryFieldsCache, 0);
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_legacyDataVersion, 0);
}

void __54__HMBModelContainer_unavailableVersionsForModelClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "unavailableVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "unavailableVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

void __51__HMBModelContainer_readOnlyVersionsForModelClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "readonlyVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "readonlyVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken != -1)
    dispatch_once(&allowedTypes_onceToken, &__block_literal_global_2485);
  return (NSSet *)(id)allowedTypes__allowedTypes;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1)
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_9);
  return (NSSet *)(id)internalAllowedTypes__internalAllowedTypes;
}

+ (id)encodeAsOPACK:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B60D4]();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = 0;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to OPACK encode dictionary %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if (a4)
      *a4 = objc_retainAutorelease(0);

  }
  return v7;
}

+ (id)decodeAsOPACK:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)OPACKDecodeData();
  v8 = v7;
  if (!v7)
  {
    v12 = 0;
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v23;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to OPACK decode model data %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    if (a4)
    {
      v19 = objc_retainAutorelease(0);
      v12 = v19;
      goto LABEL_16;
    }
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v9 = v7;
  objc_opt_class();
  v10 = objc_opt_isKindOfClass() & 1;
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  if (!v10)
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2112;
      v28 = (id)objc_opt_class();
      v29 = 2112;
      v30 = v9;
      v18 = v28;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@OPACK-decoded model data was not a dictionary: (%@) %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v13 = 0;
      *a4 = v19;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v13 = v9;
LABEL_18:

  return v13;
}

+ (id)encodeAsNSDictionary:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)decodeAsNSDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = (void *)MEMORY[0x1E0CB3710];
  +[HMBModelContainer internalAllowedTypes](HMBModelContainer, "internalAllowedTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;

  if (v10)
  {
    v12 = v10;
    objc_opt_class();
    v13 = objc_opt_isKindOfClass() & 1;
    if (v13)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    if (v13)
    {
      v16 = v12;
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17B6230]();
      v22 = a1;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = v21;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v31 = v24;
        v32 = 2112;
        v33 = v25;
        v34 = 2112;
        v35 = v12;
        v26 = v25;
        _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unarchived model data was not a dictionary: (%@) %@", buf, 0x20u);

        v21 = v28;
      }

      objc_autoreleasePoolPop(v21);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17B6230]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v20;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive model data %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  objc_autoreleasePoolPop(v7);
  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1)
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_99);
  return (id)logCategory__hmf_once_v22;
}

void __32__HMBModelContainer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22;
  logCategory__hmf_once_v22 = v0;

}

void __41__HMBModelContainer_internalAllowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  +[HMBModelContainer allowedTypes](HMBModelContainer, "allowedTypes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithSet:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;

}

void __33__HMBModelContainer_allowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedTypes__allowedTypes;
  allowedTypes__allowedTypes = v2;

}

@end
