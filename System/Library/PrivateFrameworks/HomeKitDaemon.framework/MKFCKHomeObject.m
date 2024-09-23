@implementation MKFCKHomeObject

- (BOOL)isReadyToImportIntoLocalModelWithContext:(id)a3
{
  return 1;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  -[MKFCKModel willSave](&v7, sel_willSave);
  -[MKFCKHomeObject homeModelID](self, "homeModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[MKFCKHomeObject home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "modelID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFCKHomeObject setHomeModelID:](self, "setHomeModelID:", v6);

    }
  }
}

- (BOOL)validateForInsert:(id *)a3
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  v5 = -[HMDManagedObject validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[MKFCKHomeObject _validateConstraints:]((uint64_t)self, a3);
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKFCKHomeObject;
  v5 = -[HMDManagedObject validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
    LOBYTE(v5) = -[MKFCKHomeObject _validateConstraints:]((uint64_t)self, a3);
  return v5;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = *MEMORY[0x24BDBCAB0];
  v13 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (uint64_t)_validateConstraints:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  if (result)
  {
    v3 = (void *)result;
    if ((objc_msgSend((id)result, "shouldSkipValidationDuringImport") & 1) == 0)
    {
      objc_msgSend(v3, "home");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        objc_msgSend(v3, "homeModelID");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          objc_msgSend(v3, "home");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "modelID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "homeModelID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if ((v11 & 1) == 0)
          {
            if (!a2)
              return 0;
            objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("homeModelID must match home.modelID"));
            v12 = (id)objc_claimAutoreleasedReturnValue();
            result = 0;
            *a2 = v12;
            return result;
          }
        }
        else
        {

        }
      }
    }
    return 1;
  }
  return result;
}

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

+ (id)rootKeyPath
{
  return CFSTR("home");
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectWithID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Cloud model inserted, waiting for home update to insert local model: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

  return 1;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  BOOL v33;
  void *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "objectWithID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MKFPropertyNamesFromDescriptions(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchLocalModelWithContext:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v37 = v15;
    v18 = (void *)MEMORY[0x227676638]();
    v31 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v32;
      v40 = 2112;
      v41 = v14;
      v42 = 2114;
      v43 = v37;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Cloud model updated, waiting for home update to insert local model: %@ (%{public}@)", buf, 0x20u);

    }
    goto LABEL_17;
  }
  if (objc_msgSend(v14, "importIntoLocalModel:updatedProperties:context:", v16, v11, v13))
  {
    v36 = v12;
    v37 = v15;
    v17 = objc_msgSend(v16, "hasPersistentChangedValues");
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v22;
        v40 = 2112;
        v41 = v16;
        v42 = 2114;
        v43 = v37;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v19;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "debugDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v26;
        v40 = 2112;
        v41 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        v23 = v35;
      }

      objc_autoreleasePoolPop(v23);
      v18 = (void *)MEMORY[0x227676638]();
      v28 = v24;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "debugDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      v40 = 2112;
      v41 = v30;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    }
    else
    {
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        v12 = v36;
LABEL_17:

        objc_autoreleasePoolPop(v18);
        v33 = 1;
        v15 = v37;
        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v29;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  v33 = 0;
LABEL_18:

  return v33;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmd_debugIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2160;
    v25 = 1752392040;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Cloud model deleted: %@::%{mask.hash}@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);

  return 1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectWithID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v15;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Local model inserted, waiting for home update to insert cloud model: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v12);

  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  BOOL v34;
  void *v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "objectWithID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MKFPropertyNamesFromDescriptions(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchWithLocalModel:context:", v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    v38 = v15;
    v19 = (void *)MEMORY[0x227676638]();
    v32 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      v41 = 2112;
      v42 = v14;
      v43 = 2114;
      v44 = v38;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Local model updated but no cloud model exists: %@ (%{public}@)", buf, 0x20u);

    }
    goto LABEL_17;
  }
  if (objc_msgSend(v16, "exportFromLocalModel:updatedProperties:context:", v14, v11, v13))
  {
    v37 = v12;
    v38 = v15;
    v18 = objc_msgSend(v17, "hasPersistentChangedValues");
    v19 = (void *)MEMORY[0x227676638]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v23;
        v41 = 2112;
        v42 = v17;
        v43 = 2114;
        v44 = v38;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v20;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "debugDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v27;
        v41 = 2112;
        v42 = v28;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        v24 = v36;
      }

      objc_autoreleasePoolPop(v24);
      v19 = (void *)MEMORY[0x227676638]();
      v29 = v25;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "debugDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    }
    else
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        v12 = v37;
LABEL_17:

        objc_autoreleasePoolPop(v19);
        v34 = 1;
        v15 = v38;
        goto LABEL_18;
      }
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  v34 = 0;
LABEL_18:

  return v34;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmd_debugIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2160;
    v25 = 1752392040;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Local model deleted: %@::%{mask.hash}@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);

  return 1;
}

- (BOOL)validateHome:(id *)a3 error:(id *)a4
{
  id v7;
  char isKindOfClass;
  BOOL result;
  void *v10;
  MKFCKHomeObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport"))
    return 1;
  v7 = *a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
      return 1;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a3;
    v16 = 138543874;
    v17 = v13;
    v18 = 2114;
    v19 = CFSTR("home");
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("home"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v15;
  return result;
}

- (BOOL)validateHomeModelID:(id *)a3 error:(id *)a4
{
  BOOL result;
  void *v8;
  MKFCKHomeObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[MKFCKModel shouldSkipValidationDuringImport](self, "shouldSkipValidationDuringImport")
    || !*a3
    || (objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", *a3, CFSTR("homeModelID"), a4) & 1) != 0)
  {
    return 1;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a3;
    v14 = 138543874;
    v15 = v11;
    v16 = 2114;
    v17 = CFSTR("homeModelID");
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, CFSTR("homeModelID"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v13;
  return result;
}

- (id)_accessoryWithModelID:(void *)a3 context:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[MKFCKAccessory fetchRequest](MKFCKAccessory, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(a1, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@ && %K == %@"), CFSTR("home"), v9, CFSTR("modelID"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    v18 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v7, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      objc_msgSend(v11, "firstObject");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v20 = v16;
        v21 = 2160;
        v22 = 1752392040;
        v23 = 2112;
        v24 = v5;
        v25 = 2114;
        v26 = v12;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessories for modelID %{mask.hash}@: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v13);
      a1 = 0;
    }

  }
  return a1;
}

- (BOOL)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    objc_msgSend(v9, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relationshipsByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "relationshipForLocalName:localModel:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:cloudRelationship:context:](a1, v9, v12, v13, v7);
  }
  return a1 != 0;
}

- (void)_importSiblingRelationshipsIntoLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v9 = a5;
  v10 = a4;
  v11 = a2;
  objc_msgSend(a3, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mutableSetValueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "valueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v30[3] = &unk_24E78F998;
  v18 = v16;
  v31 = v18;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v25[3] = &unk_24E77B680;
  v26 = v18;
  v22 = v9;
  v27 = v22;
  v28 = a1;
  v19 = v13;
  v29 = v19;
  v20 = v18;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_9;
  v23[3] = &unk_24E77B6A8;
  v24 = v19;
  v21 = v19;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v23);

}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v4);
  objc_msgSend(v3, "fetchLocalModelWithContext:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@No local sibling found, home import will fix it later: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

void __105__MKFCKHomeObject__importSiblingRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);

}

void __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
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
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!objc_msgSend(v5, "isDeletedLocallyWithContext:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v5, "modelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, v10);
      v12 = (void *)v11;
    }
    else
    {
      objc_msgSend(v5, "createLocalModelWithContext:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "importIntoLocalModel:updatedProperties:context:", v12, v13, *(_QWORD *)(a1 + 32));

    if ((v14 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a3 = 1;
LABEL_29:

      goto LABEL_30;
    }
    if (v11)
    {
      v15 = objc_msgSend(v12, "hasPersistentChangedValues");
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v41;
          v45 = 2112;
          v46 = v12;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);

        }
        goto LABEL_28;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "changedValues");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "allKeys");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v20;
        v45 = 2112;
        v46 = v12;
        v47 = 2114;
        v48 = v22;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      v23 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "debugDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v26;
        v45 = 2112;
        v46 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v16 = (void *)MEMORY[0x227676638]();
      v28 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
LABEL_24:

LABEL_28:
        objc_autoreleasePoolPop(v16);
        goto LABEL_29;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2112;
        v46 = v12;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v34 = (void *)MEMORY[0x227676638]();
      v35 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v37;
        v45 = 2112;
        v46 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v16 = (void *)MEMORY[0x227676638]();
      v28 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
    }
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v39;
    v45 = 2112;
    v46 = v40;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_24;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v9;
    v45 = 2112;
    v46 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skip create/update since model is already deleted locally: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
LABEL_30:

}

- (BOOL)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 context:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    objc_msgSend(v9, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relationshipsByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "relationshipForLocalName:localModel:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:cloudRelationship:context:](a1, v9, v12, v13, v7);
  }
  return a1 != 0;
}

- (void)_exportSiblingRelationshipsFromLocalModel:(void *)a3 localRelationship:(void *)a4 cloudRelationship:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v9 = a5;
  v10 = a4;
  v11 = a2;
  objc_msgSend(a3, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "mutableSetValueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v30[3] = &unk_24E77B6F8;
  v18 = v16;
  v31 = v18;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v25[3] = &unk_24E77B720;
  v26 = v18;
  v22 = v9;
  v27 = v22;
  v28 = a1;
  v19 = v15;
  v29 = v19;
  v20 = v18;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_13;
  v23[3] = &unk_24E77B748;
  v24 = v19;
  v21 = v19;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v23);

}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:](HMDCoreDataCloudTransform, "exportTransformableClassFromEntity:", v4);

  objc_msgSend(v3, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v6);
  -[objc_class fetchWithLocalModel:context:](v5, "fetchWithLocalModel:context:", v3, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v7) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@No cloud sibling found, home export will fix it later: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __105__MKFCKHomeObject__exportSiblingRelationshipsFromLocalModel_localRelationship_cloudRelationship_context___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);

}

@end
