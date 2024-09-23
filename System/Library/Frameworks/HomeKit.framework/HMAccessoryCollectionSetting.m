@implementation HMAccessoryCollectionSetting

- (HMAccessoryCollectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _HMAccessorySetting *v14;
  HMAccessoryCollectionSetting *v15;
  HMAccessoryCollectionSetting *v17;
  SEL v18;
  id v19;

  v8 = a3;
  v9 = a5;
  if (!v9)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if ((objc_msgSend(v12, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) != 0)
      goto LABEL_9;
    _HMFPreconditionFailure();
LABEL_8:
    v12 = 0;
LABEL_9:
    __constraintsForItems(self, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_HMAccessorySetting initWithType:properties:name:constraints:]([_HMAccessorySetting alloc], "initWithType:properties:name:constraints:", 5, a4, v8, v13);
    v15 = -[HMAccessoryCollectionSetting initWithInternal:](self, "initWithInternal:", v14);

    return v15;
  }
  v17 = (HMAccessoryCollectionSetting *)_HMFPreconditionFailure();
  return -[HMAccessoryCollectionSetting initWithInternal:](v17, v18, v19);
}

- (HMAccessoryCollectionSetting)initWithInternal:(id)a3
{
  id v4;
  HMAccessoryCollectionSetting *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessoryCollectionSetting;
  v5 = -[HMAccessorySetting initWithInternal:](&v19, sel_initWithInternal_, v4);
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "constraints", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          objc_msgSend(v13, "setSetting:", v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSSet)itemValueClasses
{
  void *v2;
  void *v3;

  -[HMAccessorySetting keyPath](self, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMAccessoryCollectionSetting itemValueClassesForKeyPath:](HMAccessoryCollectionSetting, "itemValueClassesForKeyPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setItemValueClass:(Class)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCollectionSetting setItemValueClasses:](self, "setItemValueClasses:", v4);

}

- (void)setItemValueClasses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMAccessorySetting keyPath](self, "keyPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[HMAccessoryCollectionSetting setItemValueClasses:forKeyPath:](HMAccessoryCollectionSetting, "setItemValueClasses:forKeyPath:", v4, v5);

}

- (void)addItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessoryCollectionSetting *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  HMAccessorySettingConstraint *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMAccessoryCollectionSetting *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v6, "setSetting:", self));
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v11;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Adding item: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v31 = 0;
    v12 = __validateItem(v9, v6, &v31);
    v13 = v31;
    if ((v12 & 1) != 0)
    {
      v14 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 4, v6);
      objc_initWeak((id *)buf, v9);
      objc_initWeak(&location, v6);
      -[HMAccessorySetting internal](v9, "internal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __58__HMAccessoryCollectionSetting_addItem_completionHandler___block_invoke;
      v26[3] = &unk_1E3AB5478;
      objc_copyWeak(&v28, (id *)buf);
      objc_copyWeak(&v29, &location);
      v27 = v7;
      objc_msgSend(v15, "addConstraint:completionHandler:", v14, v26);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = v9;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2112;
        v35 = v6;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      -[HMAccessorySetting internal](v21, "internal");
      v14 = (HMAccessorySettingConstraint *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingConstraint context](v14, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "delegateCaller");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "callCompletion:error:", v7, v13);

    }
  }
  else
  {
    -[HMAccessorySetting internal](self, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "callCompletion:error:", v7, v19);

  }
}

- (void)removeItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMAccessoryCollectionSetting *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  if (v6)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HMAccessorySetting internal](self, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "value", v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (objc_msgSend(v6, "isEqual:", v15))
          {
            v9 = v12;

            goto LABEL_15;
          }

        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v19;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Removing item: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_initWeak((id *)buf, v17);
    objc_initWeak(&location, v6);
    -[HMAccessorySetting internal](v17, "internal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__HMAccessoryCollectionSetting_removeItem_completionHandler___block_invoke;
    v27[3] = &unk_1E3AB54E8;
    objc_copyWeak(&v30, (id *)buf);
    v28 = v6;
    objc_copyWeak(&v31, &location);
    v29 = v26;
    objc_msgSend(v20, "removeConstraint:completionHandler:", v9, v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

    v21 = v26;
  }
  else
  {
    -[HMAccessorySetting internal](self, "internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v26;
    objc_msgSend(v24, "callCompletion:error:", v26, v25);

  }
}

- (void)replaceItem:(id)a3 withItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_5:
    _HMFPreconditionFailure();
  }
  if (!v9)
    goto LABEL_5;
  v11 = v10;
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryCollectionSetting replaceItems:withItems:completionHandler:](self, "replaceItems:withItems:completionHandler:", v12, v13, v11);

}

- (void)replaceItems:(id)a3 withItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAccessoryCollectionSetting *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  HMAccessoryCollectionSetting *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  HMAccessoryCollectionSetting *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v52 = a5;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_44;
  }
  if (!v8)
  {
LABEL_44:
    _HMFPreconditionFailure();
    goto LABEL_45;
  }
  v50 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v51 = v8;
  v53 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intersectSet:", v11);

  if (objc_msgSend(v10, "count"))
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v79 = v15;
      v80 = 2112;
      v81 = v10;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring common items: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v10, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectsInArray:", v16);

    objc_msgSend(v10, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "removeObjectsInArray:", v17);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting internal](self, "internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraints");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v9;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v59)
  {
    v57 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v75 != v57)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v21 = v58;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v71;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v71 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_msgSend(v25, "value");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v27 = v26;
              else
                v27 = 0;
              v28 = v27;

              if (objc_msgSend(v20, "isEqual:", v28))
              {
                objc_msgSend(v56, "addObject:", v25);

                goto LABEL_25;
              }

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_25:

      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v59);
  }

  if ((objc_msgSend(v53, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) == 0)
  {
LABEL_45:
    _HMFPreconditionFailure();
    __break(1u);
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v29 = v53;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v67;
    while (2)
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v67 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
        objc_msgSend(v33, "setSetting:", self);
        v65 = 0;
        v34 = __validateItem(self, v33, &v65);
        v35 = v65;
        v36 = v35;
        if ((v34 & 1) == 0)
        {
          v43 = (void *)MEMORY[0x1A1AC1AAC]();
          v44 = self;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v79 = v46;
            v80 = 2112;
            v81 = v33;
            _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v43);
          -[HMAccessorySetting internal](v44, "internal");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "context");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "delegateCaller");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "callCompletion:error:", v52, v36);

          v37 = v29;
          goto LABEL_42;
        }

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      if (v30)
        continue;
      break;
    }
  }

  __constraintsForItems(self, v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1A1AC1AAC]();
  v39 = self;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v79 = v41;
    v80 = 2112;
    v81 = obj;
    v82 = 2112;
    v83 = v29;
    _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing items, %@, with items, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v38);
  objc_initWeak((id *)buf, v39);
  -[HMAccessorySetting internal](v39, "internal");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __73__HMAccessoryCollectionSetting_replaceItems_withItems_completionHandler___block_invoke;
  v60[3] = &unk_1E3AB5510;
  objc_copyWeak(&v64, (id *)buf);
  v61 = obj;
  v62 = v29;
  v63 = v52;
  objc_msgSend(v42, "replaceConstraints:withConstraints:completionHandler:", v56, v37, v60);

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);
LABEL_42:

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
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
  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraints");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v16) == 4)
        {
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          if (v13)
            objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  HMAccessoryCollectionSetting *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMAccessoryCollectionSetting *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v11 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if ((objc_msgSend(v10, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) == 0)
LABEL_25:
    _HMFPreconditionFailure();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v15, "setSetting:", self);
        v36 = 0;
        v16 = __validateItem(self, v15, &v36);
        v17 = v36;
        v18 = v17;
        if ((v16 & 1) == 0)
        {
          v19 = (void *)MEMORY[0x1A1AC1AAC]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v22;
            v43 = 2112;
            v44 = v15;
            _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v19);
          -[HMAccessorySetting internal](v20, "internal");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "delegateCaller");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "callCompletion:error:", v7, v18);

          goto LABEL_23;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v12)
        continue;
      break;
    }
  }

LABEL_20:
  v26 = (void *)MEMORY[0x1A1AC1AAC]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with items: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  objc_initWeak((id *)buf, v27);
  __constraintsForItems(v27, v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting internal](v27, "internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __62__HMAccessoryCollectionSetting_updateValue_completionHandler___block_invoke;
  v32[3] = &unk_1E3AB5538;
  objc_copyWeak(&v35, (id *)buf);
  v11 = v11;
  v33 = v11;
  v34 = v7;
  objc_msgSend(v31, "updateConstraints:completionHandler:", v30, v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);
LABEL_23:

}

- (void)_setting:(id)a3 didAddConstraint:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a4, "value", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setSetting:", self);
  -[HMAccessorySetting internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting _settingDidUpdateValue:](self, "_settingDidUpdateValue:", v8);

}

- (void)_setting:(id)a3 didRemoveConstraint:(id)a4
{
  id v5;

  -[HMAccessorySetting internal](self, "internal", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting _settingDidUpdateValue:](self, "_settingDidUpdateValue:", v5);

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;

  -[HMAccessoryCollectionSetting value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  return v11;
}

void __62__HMAccessoryCollectionSetting_updateValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v17 = 138543874;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v3;
    v11 = "%{public}@Failed to update items, %@, with error: %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v15;
    v11 = "%{public}@Updated item: %@";
    v12 = v8;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v12, v13, v11, (uint8_t *)&v17, v14);

LABEL_7:
  objc_autoreleasePoolPop(v5);
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);

}

void __73__HMAccessoryCollectionSetting_replaceItems_withItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to replace items, %@, with items, %@, with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Replaced items, %@, with items, %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19++), "setSetting:", 0, (_QWORD)v21);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v17);
    }

  }
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v3);

}

void __61__HMAccessoryCollectionSetting_removeItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove item, %@, with error: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed item: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v13 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v13, "setSetting:", 0);

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);

}

void __58__HMAccessoryCollectionSetting_addItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = WeakRetained;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v3;
    v11 = "%{public}@Failed to add item, %@, with error: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    v11 = "%{public}@Added item: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v12, v13, v11, (uint8_t *)&v16, v14);

LABEL_7:
  objc_autoreleasePoolPop(v6);
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);

}

+ (id)itemValueClassesForKeyPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[_HMAccessoryCollectionSettingItemClassManager sharedManager](_HMAccessoryCollectionSettingItemClassManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemValueClassesForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setItemValueClass:(Class)a3 forKeyPath:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setItemValueClasses:forKeyPath:", v8, v7);

}

+ (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[_HMAccessoryCollectionSettingItemClassManager sharedManager](_HMAccessoryCollectionSettingItemClassManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemValueClasses:forKeyPath:", v6, v5);

}

+ (void)removeItemValueClassesForKeyPath:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_HMAccessoryCollectionSettingItemClassManager sharedManager](_HMAccessoryCollectionSettingItemClassManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemValueClassesForKeyPath:", v3);

}

@end
