@implementation HMDFetchedSettingsDriverPreferences

- (HMDFetchedSettingsDriverPreferences)initWithQueue:(id)a3 userDefaults:(id)a4 prefix:(id)a5 defaultValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDFetchedSettingsDriverPreferences *v15;
  HMDFetchedSettingsDriverPreferences *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  SEL v24;
  void *v25;
  void *v26;
  HMDFetchedSettingsDriverPreferences *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  SEL v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  HMDFetchedSettingsDriverPreferences *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  SEL v41;
  void *v42;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v54.receiver = self;
  v54.super_class = (Class)HMDFetchedSettingsDriverPreferences;
  v15 = -[HMDFetchedSettingsDriverPreferences init](&v54, sel_init);
  v16 = v15;
  if (v15)
  {
    v44 = v12;
    v45 = v11;
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_userDefaults, a4);
    objc_storeStrong((id *)&v16->_prefix, a5);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v14;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    if (!v17)
      goto LABEL_23;
    v18 = v17;
    v19 = *(_QWORD *)v51;
    v20 = 0x24BDD7000uLL;
    v46 = v13;
    v47 = *(_QWORD *)v51;
    v48 = v14;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v13, "stringByAppendingString:", v22, v44, v45);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty(v16, v24, 24, 1), "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          if (objc_msgSend(*(id *)(v20 + 1048), "isKeyPathForBooleanSettingType:", v22))
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v16;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectForKeyedSubscript:", v22);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v56 = v29;
              v57 = 2112;
              v58 = v30;
              v59 = 2114;
              v60 = v22;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Setting default BOOL value %@ for Key: %{public}@", buf, 0x20u);

              v13 = v46;
            }

            objc_autoreleasePoolPop(v26);
            v32 = objc_getProperty(v27, v31, 24, 1);
            objc_msgSend(obj, "objectForKeyedSubscript:", v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setBool:forKey:", objc_msgSend(v33, "BOOLValue"), v23);
            goto LABEL_16;
          }
          v34 = objc_msgSend(*(id *)(v20 + 1048), "isKeyPathForConstrainedNumberSettingType:", v22);
          v35 = (void *)MEMORY[0x227676638]();
          v36 = v16;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v34)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "objectForKeyedSubscript:", v22);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v56 = v39;
              v57 = 2112;
              v58 = v40;
              v59 = 2114;
              v60 = v22;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Setting default integer value %@ for Key: %{public}@", buf, 0x20u);

              v13 = v46;
            }

            objc_autoreleasePoolPop(v35);
            v32 = objc_getProperty(v36, v41, 24, 1);
            objc_msgSend(obj, "objectForKeyedSubscript:", v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setInteger:forKey:", objc_msgSend(v33, "integerValue"), v23);
LABEL_16:

          }
          else
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v56 = v42;
              v57 = 2114;
              v58 = v22;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Data type for Key %{public}@ not supported", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v35);
          }
          v19 = v47;
          v14 = v48;
          v20 = 0x24BDD7000;
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (!v18)
      {
LABEL_23:

        v12 = v44;
        v11 = v45;
        break;
      }
    }
  }

  return v16;
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  NSObject *Property;
  void *v9;
  HMDFetchedSettingsDriverPreferences *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HMDFetchedSettingsDriverPreferences *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDFetchedSettingsDriverPreferences *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  HMDFetchedSettingsDriverPreferences *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  HMDFetchedSettingsDriverPreferences *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  HMDFetchedSettingsDriverPreferences *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void (**v67)(id, void *, void *);
  HMDFetchedSettingsDriverPreferences *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  HMDFetchedSettingsDriverPreferences *v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v67 = (void (**)(id, void *, void *))a4;
  if (self)
    Property = objc_getProperty(self, v7, 16, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v82 = v12;
    v83 = 2114;
    v84 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Got fetch request for keyPaths:%{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v6;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (!v75)
  {
    v15 = 0;
    goto LABEL_57;
  }
  v74 = *(_QWORD *)v77;
  v14 = 0x24BDD7000uLL;
  v15 = 0;
  v68 = self;
  v72 = v10;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v77 != v74)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v16);
      if (self)
        v18 = objc_getProperty(v10, v13, 32, 1);
      else
        v18 = 0;
      objc_msgSend(v18, "stringByAppendingString:", v17, v67);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        v21 = objc_getProperty(v10, v19, 24, 1);
      else
        v21 = 0;
      objc_msgSend(v21, "objectForKey:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v10;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = v15;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v36;
          v83 = 2114;
          v84 = v17;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not found", buf, 0x16u);

          v15 = v35;
          v14 = 0x24BDD7000;
        }

        objc_autoreleasePoolPop(v32);
        v37 = (void *)MEMORY[0x24BDD1540];
        v38 = 2;
        goto LABEL_36;
      }
      if (objc_msgSend(*(id *)(v14 + 1048), "isKeyPathForBooleanSettingType:", v17))
      {
        if (self)
          v24 = objc_getProperty(v10, v23, 24, 1);
        else
          v24 = 0;
        v25 = objc_msgSend(v24, "BOOLForKey:", v20);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD74E0]), "initWithKeyPath:readOnly:BOOLValue:", v17, 0, v25);
        v27 = (void *)MEMORY[0x227676638]();
        v28 = v10;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v26)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v31;
            v83 = 2114;
            v84 = v17;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@BOOL %{public}@", buf, 0x16u);

            v10 = v72;
          }

          objc_autoreleasePoolPop(v27);
          objc_msgSend(v71, "addObject:", v26);
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v58;
            v83 = 2114;
            v84 = v17;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Boolean data type for Key %{public}@ had no integer setting", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v27);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v59 = objc_claimAutoreleasedReturnValue();

          v26 = 0;
          v15 = (void *)v59;
        }
      }
      else
      {
        if (!objc_msgSend(*(id *)(v14 + 1048), "isKeyPathForConstrainedNumberSettingType:", v17))
        {
          v53 = (void *)MEMORY[0x227676638]();
          v54 = v10;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = v15;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v57;
            v83 = 2114;
            v84 = v17;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Data type of key %{public}@ is neither a BOOL nor a number", buf, 0x16u);

            v15 = v56;
            v14 = 0x24BDD7000;
          }

          objc_autoreleasePoolPop(v53);
          v37 = (void *)MEMORY[0x24BDD1540];
          v38 = 48;
LABEL_36:
          objc_msgSend(v37, "hmErrorWithCode:", v38);
          v26 = v15;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_48;
        }
        objc_msgSend(*(id *)(v14 + 1048), "defaultSettingsConstraintsForKeyPath:", v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v70 = v15;
          if (self)
            v40 = objc_getProperty(v10, v39, 24, 1);
          else
            v40 = 0;
          v69 = objc_msgSend(v40, "integerForKey:", v20);
          v41 = objc_alloc(MEMORY[0x24BDD74E8]);
          objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "integerValue");
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "integerValue");
          objc_msgSend(v26, "objectAtIndexedSubscript:", 3);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(v41, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v17, 0, v69, v43, v45, objc_msgSend(v46, "integerValue"));

          v48 = (void *)MEMORY[0x227676638]();
          v49 = v72;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v47)
          {
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v82 = v52;
              v83 = 2114;
              v84 = v17;
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@int %{public}@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v48);
            objc_msgSend(v71, "addObject:", v47);
            self = v68;
            v15 = v70;
          }
          else
          {
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v82 = v64;
              v83 = 2114;
              v84 = v17;
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Integer data type for Key %{public}@ had no integer setting", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v48);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
            v65 = objc_claimAutoreleasedReturnValue();

            v47 = 0;
            v15 = (void *)v65;
            self = v68;
          }
        }
        else
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = v10;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v82 = v63;
            v83 = 2114;
            v84 = v17;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@Default settings constraints for Key %{public}@ not found", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v60);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v47 = v15;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v10 = v72;
      }
      v14 = 0x24BDD7000;
LABEL_48:

      ++v16;
    }
    while (v75 != v16);
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    v75 = v66;
  }
  while (v66);
LABEL_57:

  v67[2](v67, v71, v15);
}

- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  void (**v11)(id, _QWORD);
  NSObject *Property;
  char v13;
  void *v14;
  HMDFetchedSettingsDriverPreferences *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  HMDFetchedSettingsDriverPreferences *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  if (self)
    Property = objc_getProperty(self, v10, 16, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v13 = objc_msgSend(MEMORY[0x24BDD7418], "isKeyPathForBooleanSettingType:", v8);
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v18;
      v41 = 2114;
      v42 = v8;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (self)
      v20 = objc_getProperty(v15, v19, 32, 1);
    else
      v20 = 0;
    objc_msgSend(v20, "stringByAppendingString:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v23 = objc_getProperty(v15, v21, 24, 1);
    else
      v23 = 0;
    objc_msgSend(v23, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && (v26 = objc_msgSend(v24, "BOOLValue"), v26 == objc_msgSend(v9, "BOOLValue")))
    {
      v11[2](v11, 0);
    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v15;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v30;
        v41 = 2114;
        v42 = v8;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Changing %{public}@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      if (self)
        v32 = objc_getProperty(v28, v31, 24, 1);
      else
        v32 = 0;
      v33 = v32;
      objc_msgSend(v33, "setBool:forKey:", objc_msgSend(v9, "BOOLValue"), v22);

      v11[2](v11, 0);
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD74E0]), "initWithKeyPath:readOnly:BOOLValue:", v8, 0, objc_msgSend(v9, "BOOLValue"));
      -[HMDFetchedSettingsDriverPreferences delegate](v28, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "driver:didUpdateSettings:", v28, v36);

    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v37;
      v41 = 2114;
      v42 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not part of expected BOOL keys", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v22);
  }

}

- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  void (**v11)(id, _QWORD);
  NSObject *Property;
  char v13;
  void *v14;
  HMDFetchedSettingsDriverPreferences *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HMDFetchedSettingsDriverPreferences *v29;
  NSObject *v30;
  HMDFetchedSettingsDriverPreferences *v31;
  void *v32;
  id v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  HMDFetchedSettingsDriverPreferences *v43;
  void (**v44)(id, _QWORD);
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDFetchedSettingsDriverPreferences *v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  if (self)
    Property = objc_getProperty(self, v10, 16, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  v13 = objc_msgSend(MEMORY[0x24BDD7418], "isKeyPathForConstrainedNumberSettingType:", v8);
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v18;
      v58 = 2114;
      v59 = v8;
      v60 = 2112;
      v61 = v9;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (self)
      v20 = objc_getProperty(v15, v19, 32, 1);
    else
      v20 = 0;
    objc_msgSend(v20, "stringByAppendingString:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v23 = objc_getProperty(v15, v21, 24, 1);
    else
      v23 = 0;
    objc_msgSend(v23, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && (v26 = objc_msgSend(v24, "integerValue"), v26 == objc_msgSend(v9, "integerValue")))
    {
      v11[2](v11, 0);
    }
    else
    {
      v54 = v8;
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v15;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v31 = v29;
        v32 = v25;
        v33 = v9;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v34;
        v58 = 2114;
        v59 = v54;
        v60 = 2112;
        v61 = v33;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Changing %{public}@ to %@", buf, 0x20u);

        v9 = v33;
        v25 = v32;
        v29 = v31;
      }

      objc_autoreleasePoolPop(v28);
      if (self)
        v36 = objc_getProperty(v29, v35, 24, 1);
      else
        v36 = 0;
      v8 = v54;
      v37 = v36;
      objc_msgSend(v37, "setInteger:forKey:", objc_msgSend(v9, "integerValue"), v22);

      v11[2](v11, 0);
      objc_msgSend(MEMORY[0x24BDD7418], "defaultSettingsConstraintsForKeyPath:", v54);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v52 = objc_alloc(MEMORY[0x24BDD74E8]);
        v51 = objc_msgSend(v9, "integerValue");
        objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "integerValue");
        objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
        v53 = v25;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "integerValue");
        objc_msgSend(v38, "objectAtIndexedSubscript:", 3);
        v43 = v29;
        v44 = v11;
        v45 = v9;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v52, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v54, 0, v51, v40, v42, objc_msgSend(v46, "integerValue"));

        v9 = v45;
        v11 = v44;

        -[HMDFetchedSettingsDriverPreferences delegate](v43, "delegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v47;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v43;
        v8 = v54;
        objc_msgSend(v48, "driver:didUpdateSettings:", v50, v49);

        v25 = v53;
      }

    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v27;
      v58 = 2114;
      v59 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not part of expected integer keys", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v11)[2](v11, v22);
  }

}

- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  HMDFetchedSettingsDriverPreferences *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Only BOOL settings are supported keyPath: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v15);

}

- (void)languageValueListWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, MEMORY[0x24BDBD1A8], 0);
}

- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  HMDFetchedSettingsDriverPreferences *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Primary user info is not supported for keyPath: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v15);

}

- (HMDFetchedSettingsDriverDelegate)delegate
{
  return (HMDFetchedSettingsDriverDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_49874 != -1)
    dispatch_once(&logCategory__hmf_once_t3_49874, &__block_literal_global_49875);
  return (id)logCategory__hmf_once_v4_49876;
}

void __50__HMDFetchedSettingsDriverPreferences_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_49876;
  logCategory__hmf_once_v4_49876 = v0;

}

@end
