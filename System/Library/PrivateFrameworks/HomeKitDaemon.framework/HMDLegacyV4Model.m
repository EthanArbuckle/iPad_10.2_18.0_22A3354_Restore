@implementation HMDLegacyV4Model

- (id)hmbType
{
  void *v2;
  void *v3;
  void *v4;
  id result;

  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__propertiesMap, "objectForKey:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "hmdTypeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    return v4;
  }
  else
  {
    result = (id)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDLegacyV4Model *v23;
  NSObject *v24;
  void *v25;
  id v26;
  HMDLegacyV4Model *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *contexta;
  void *context;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  if (a6)
    v13 = a6;
  else
    v13 = (id *)&v35;
  v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (!v16)
    _HMFPreconditionFailure();
  -[HMDLegacyV4Model convertToHMDModelObject](self, "convertToHMDModelObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeWithEncoding:for:error:", 1, 1, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMBModel hmbParentModelID](self, "hmbParentModelID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordWithExistingRecord:modelData:parentModelID:modelContainer:error:", v10, v18, v19, v12, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = v20;
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *v13;
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        v31 = (void *)v29;
        v38 = 2112;
        v39 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to create CKRecord for encapsulated legacy record: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      contexta = v22;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *v13;
      *(_DWORD *)buf = 138543618;
      v37 = (uint64_t)v25;
      v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode model for cloud record: %@", buf, 0x16u);

      v22 = contexta;
    }

    objc_autoreleasePoolPop(v22);
    v20 = 0;
  }

  return v20;
}

- (id)convertToHMDModelObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _Unwind_Exception *v15;

  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__propertiesMap, "objectForKey:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  if (!v3)
  {
    v15 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    _Unwind_Resume(v15);
  }
  -[HMBModel hmbParentModelID](self, "hmbParentModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hmf_isEqualToUUID:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[HMBModel hmbParentModelID](self, "hmbParentModelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = objc_alloc((Class)objc_msgSend(v3, "hmdModelClass"));
  -[HMBModel hmbModelID](self, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v7, "initWithUUID:parentUUID:", v8, v6);

  -[HMBModel hmbReserved](self, "hmbReserved");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = (void *)v9[1];
  v9[1] = v11;

  +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBsoDataVersion:", v13);

  return v9;
}

+ (Class)hmbModelClassForHMDModelClass:(Class)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  objc_class *ClassPair;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  HMDLegacyV4ModelInfo *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  objc_class *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (hmbModelClassForHMDModelClass__onceToken != -1)
    dispatch_once(&hmbModelClassForHMDModelClass__onceToken, &__block_literal_global_16626);
  os_unfair_lock_lock_with_options();
  if (!a3)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  v5 = (void *)objc_msgSend((id)__classMap, "objectForKey:", a3);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), CFSTR("WRAP_"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (objc_class *)objc_opt_class();
    v11 = objc_retainAutorelease(v9);
    ClassPair = objc_allocateClassPair(v10, (const char *)objc_msgSend(v11, "UTF8String"), 0);
    objc_registerClassPair(ClassPair);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = ClassPair;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Created Legacy wrapper class: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = -[HMDLegacyV4ModelInfo initWithClass:]([HMDLegacyV4ModelInfo alloc], "initWithClass:", a3);
    objc_msgSend((id)__propertiesMap, "setObject:forKey:", v17, ClassPair);
    objc_msgSend((id)__classMap, "setObject:forKey:", ClassPair, a3);
    v6 = ClassPair;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
  return v6;
}

+ (id)hmbProperties
{
  void *v2;
  void *v3;
  void *v4;
  id result;

  os_unfair_lock_lock_with_options();
  objc_msgSend((id)__propertiesMap, "objectForKey:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "properties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    return v4;
  }
  else
  {
    result = (id)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  char isKindOfClass;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v70 = 0;
  if (a5)
    v10 = a5;
  else
    v10 = (id *)&v70;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    _HMFPreconditionFailure();
  objc_msgSend(v8, "recordType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", CFSTR("ObjectRecord"));

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("k00"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD1620];
      objc_msgSend(MEMORY[0x24BE4ECA8], "allowedTypes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unarchivedObjectOfClasses:fromData:error:", v18, v16, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = v19;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v22 = v20;
        else
          v22 = 0;
        v69 = v22;

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v20, "hmf_numberForKey:", *MEMORY[0x24BE4ED60]);
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = v20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v39 = v23;
        else
          v39 = 0;
        v40 = v39;

        v68 = v40;
        if (objc_msgSend(v40, "unsignedIntegerValue") == 1)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("k%02lu"), 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v41);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "decryptData:decompress:error:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v63 = v43;
          if (v43)
          {
            v44 = v43;
            v62 = v41;
            v66 = v19;
            v45 = (void *)MEMORY[0x227676638]();
            v46 = a1;
            HMFGetOSLogHandle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (objc_class *)objc_opt_class();
              NSStringFromClass(v48);
              v60 = v45;
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v72 = v61;
              v73 = 2112;
              v74 = v49;
              v75 = 2112;
              v76 = v44;
              _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@%@ unable to decrypt model data (will try decoding it unencrypted): %@", buf, 0x20u);

              v45 = v60;
            }

            objc_autoreleasePoolPop(v45);
            v50 = v64;
            v51 = v64;

            v42 = v51;
            v19 = v66;
            v41 = v62;
          }
          else
          {
            v50 = v64;
          }
          +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v42, 1, v10);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "convertToLegacyV4");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "hmbAssociateWithContainer:", v13);

        }
        else
        {
          v52 = (void *)MEMORY[0x227676638]();
          v53 = a1;
          HMFGetOSLogHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v65 = v52;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (objc_class *)objc_opt_class();
            NSStringFromClass(v56);
            v67 = v19;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v72 = v55;
            v73 = 2112;
            v74 = v57;
            v75 = 2112;
            v76 = v20;
            _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@%@ Unexpected encoding: %@", buf, 0x20u);

            v19 = v67;
            v52 = v65;
          }

          objc_autoreleasePoolPop(v52);
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
          v29 = 0;
          *v10 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v34 = (void *)MEMORY[0x227676638]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *v10;
          *(_DWORD *)buf = 138543874;
          v72 = v37;
          v73 = 2112;
          v74 = v16;
          v75 = 2112;
          v76 = v38;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@NSKeyedUnarchiver failed to unarchive metadata %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v34);
        if (*v10)
        {
          v29 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
          v29 = 0;
          *v10 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly nil recordMetadata.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v29 = 0;
      *v10 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v27;
      v73 = 2112;
      v74 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unexpected legacy record type: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v29 = 0;
    *v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

void __50__HMDLegacyV4Model_hmbModelClassForHMDModelClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__classMap;
  __classMap = v0;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__propertiesMap;
  __propertiesMap = v2;

}

@end
