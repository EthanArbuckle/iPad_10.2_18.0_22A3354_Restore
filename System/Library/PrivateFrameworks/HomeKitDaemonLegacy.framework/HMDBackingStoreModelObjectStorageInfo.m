@implementation HMDBackingStoreModelObjectStorageInfo

- (Class)classObj
{
  return self->_classObj;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (HMDBackingStoreModelObjectStorageInfo)initWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6 defaultSet:(BOOL)a7 defaultValue:(id)a8 additonalDecodeClasses:(id)a9
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  HMDBackingStoreModelObjectStorageInfo *v19;
  HMDBackingStoreModelObjectStorageInfo *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  HMDBackingStoreModelObjectStorageInfo *v27;
  void *v28;
  id *v29;
  NSObject *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id *v40;
  Class v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v10 = a7;
  v51 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v38 = a6;
  v17 = a8;
  v18 = a9;
  v42.receiver = self;
  v42.super_class = (Class)HMDBackingStoreModelObjectStorageInfo;
  v19 = -[HMDBackingStoreModelObjectStorageInfo init](&v42, sel_init);
  v20 = v19;
  if (!v19)
  {
    v27 = 0;
    v23 = v17;
    goto LABEL_16;
  }
  v36 = v16;
  objc_storeStrong((id *)&v19->_classObj, a3);
  +[HMDBackingStore deeplyProblematicObjectTypes](HMDBackingStore, "deeplyProblematicObjectTypes");
  v37 = v18;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke;
  v39[3] = &unk_1E89A5E80;
  v41 = a3;
  v22 = v20;
  v40 = v22;
  objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);

  v18 = v37;
  v22[3] = (id)a4;
  objc_storeStrong(v22 + 4, a5);
  objc_storeStrong(v22 + 5, a6);
  *((_BYTE *)v22 + 8) = v10;
  objc_storeStrong(v22 + 6, a8);
  if (v37)
  {
    if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v23 = v17;
      if (objc_msgSend(v37, "count"))
      {
        objc_msgSend(v37, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_15419);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObjectsFromArray:", v37);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v22[7];
        v22[7] = (id)v25;

        goto LABEL_8;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v24 = v22[7];
  v22[7] = 0;
  v23 = v17;
LABEL_8:

  if (v23 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v22;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v44 = v31;
      v45 = 2112;
      v46 = v23;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v34;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to create a Storage Info with a default value %@ of type %@ when the stored type is %@", buf, 0x2Au);

      v18 = v37;
    }

    objc_autoreleasePoolPop(v28);
    v27 = 0;
  }
  else
  {
    v27 = v22;
  }

  v16 = v36;
LABEL_16:

  return v27;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[HMDBackingStoreModelObjectStorageInfo defaultValueSet](self, "defaultValueSet");
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(-[HMDBackingStoreModelObjectStorageInfo classObj](self, "classObj"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObjectStorageInfo logging](self, "logging");
  -[HMDBackingStoreModelObjectStorageInfo readOnly](self, "readOnly");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObjectStorageInfo unavailable](self, "unavailable");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v3)
  {
    -[HMDBackingStoreModelObjectStorageInfo defaultValue](self, "defaultValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<HMDBackingStoreModelObjectStorageInfo class: %@  logging: %lu  readOnly: %@ unavailable: %@ defaultValue:%@>"), v5, v6, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<HMDBackingStoreModelObjectStorageInfo class: %@  logging: %lu  readOnly: %@  unavailable: %@>"), v5, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (unint64_t)logging
{
  return self->_logging;
}

- (HMFVersion)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(id)a3
{
  objc_storeStrong((id *)&self->_readOnly, a3);
}

- (HMFVersion)unavailable
{
  return self->_unavailable;
}

- (void)setUnavailable:(id)a3
{
  objc_storeStrong((id *)&self->_unavailable, a3);
}

- (BOOL)defaultValueSet
{
  return self->_defaultValueSet;
}

- (NSSet)decodeClasses
{
  return self->_decodeClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodeClasses, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_unavailable, 0);
  objc_storeStrong((id *)&self->_readOnly, 0);
  objc_storeStrong((id *)&self->_classObj, 0);
}

void __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke(uint64_t a1, objc_class *a2, _BYTE *a3)
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Encoding top level type of %@ will fail in the future.", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    *a3 = 1;
  }
}

id __131__HMDBackingStoreModelObjectStorageInfo_initWithClass_logging_readOnly_unavailable_defaultSet_defaultValue_additonalDecodeClasses___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id result;
  void *v6;
  SEL v7;
  Class v8;

  +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", a2) & 1) != 0)
  {

  }
  else
  {
    v4 = objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class());

    if ((v4 & 1) == 0)
    {
LABEL_7:
      v6 = (void *)_HMFPreconditionFailure();
      return +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](v6, v7, v8);
    }
  }
  if ((objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (result = (id)objc_msgSend(a2, "isSubclassOfClass:", objc_opt_class()), (_DWORD)result))
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  return result;
}

+ (id)infoWithClass:(Class)a3
{
  return -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, 1, 0, 0, 0, 0, 0);
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4
{
  return -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a4, 0, 0, 0, 0, 0);
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5
{
  id v7;
  HMDBackingStoreModelObjectStorageInfo *v8;

  v7 = a5;
  v8 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a4, v7, 0, 0, 0, 0);

  return v8;
}

+ (id)infoWithClass:(Class)a3 logging:(unint64_t)a4 readOnly:(id)a5 unavailable:(id)a6
{
  id v9;
  id v10;
  HMDBackingStoreModelObjectStorageInfo *v11;

  v9 = a6;
  v10 = a5;
  v11 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a4, v10, v9, 0, 0, 0);

  return v11;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4
{
  id v5;
  HMDBackingStoreModelObjectStorageInfo *v6;

  v5 = a4;
  v6 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, 1, 0, 0, 1, v5, 0);

  return v6;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5
{
  id v7;
  HMDBackingStoreModelObjectStorageInfo *v8;

  v7 = a4;
  v8 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a5, 0, 0, 1, v7, 0);

  return v8;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6
{
  id v9;
  id v10;
  HMDBackingStoreModelObjectStorageInfo *v11;

  v9 = a6;
  v10 = a4;
  v11 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a5, v9, 0, 1, v10, 0);

  return v11;
}

+ (id)infoWithClass:(Class)a3 defaultValue:(id)a4 logging:(unint64_t)a5 readOnly:(id)a6 unavailable:(id)a7
{
  id v11;
  id v12;
  id v13;
  HMDBackingStoreModelObjectStorageInfo *v14;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, a5, v12, v11, 1, v13, 0);

  return v14;
}

+ (id)infoWithClass:(Class)a3 additionalDecodeClasses:(id)a4
{
  id v5;
  HMDBackingStoreModelObjectStorageInfo *v6;

  v5 = a4;
  v6 = -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", a3, 1, 0, 0, 0, 0, v5);

  return v6;
}

+ (id)deprecatedField
{
  return -[HMDBackingStoreModelObjectStorageInfo initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:]([HMDBackingStoreModelObjectStorageInfo alloc], "initWithClass:logging:readOnly:unavailable:defaultSet:defaultValue:additonalDecodeClasses:", objc_opt_class(), 0, 0, 0, 0, 0, 0);
}

@end
