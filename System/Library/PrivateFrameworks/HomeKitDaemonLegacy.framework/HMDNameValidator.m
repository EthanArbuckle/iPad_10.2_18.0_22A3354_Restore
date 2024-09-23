@implementation HMDNameValidator

- (HMDNameValidator)initWithUUID:(id)a3
{
  id v5;
  HMDNameValidator *v6;
  uint64_t v7;
  NSMutableDictionary *namespaceList;
  uint64_t v9;
  NSPredicate *nonZeroLengthPredicate;
  id v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDNameValidator;
  v6 = -[HMDNameValidator init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    namespaceList = v6->_namespaceList;
    v6->_namespaceList = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_homeManagerUUID, a3);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("length != 0"));
    v9 = objc_claimAutoreleasedReturnValue();
    nonZeroLengthPredicate = v6->_nonZeroLengthPredicate;
    v6->_nonZeroLengthPredicate = (NSPredicate *)v9;

    v11 = -[HMDNameValidator _addNamespace:](v6, "_addNamespace:", v6->_homeManagerUUID);
  }

  return v6;
}

- (id)_addNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMDNameValidator namespaceList](self, "namespaceList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNameValidator namespaceList](self, "namespaceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    v7 = 0;
  }

  return v7;
}

- (id)_removeNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HMDNameValidator namespaceList](self, "namespaceList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDNameValidator namespaceList](self, "namespaceList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)despaceName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNameValidator nonZeroLengthPredicate](self, "nonZeroLengthPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentsJoinedByString:", &stru_1E89C3E38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_validateName:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  if (!v4)
  {
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v12;
      v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is empty", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v6, 129))
  {
    objc_msgSend(v6, "addCharactersInString:", CFSTR("."));
    v14 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v6, 133);
    if (v14 != objc_msgSend(v3, "length") - 1)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v18;
        v26 = 2112;
        v27 = v3;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not end with allowed characters", (uint8_t *)&v24, 0x16u);

      }
      v10 = 60;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v15);

    objc_msgSend(v6, "addCharactersInString:", CFSTR("’',-&#"));
    objc_msgSend(v6, "invertedSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v16, 133) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v22;
        v26 = 2112;
        v27 = v3;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ contains disallowed characters", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(v5);
    v13 = v17;
LABEL_20:
    v19 = v13;
    goto LABEL_21;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not start with allowed characters", (uint8_t *)&v24, 0x16u);

  }
  v10 = 36;
LABEL_15:

  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
LABEL_21:

  return v19;
}

- (id)trimNotAllowedCharactersFromName:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formUnionWithCharacterSet:", v9);

    objc_msgSend(v8, "addCharactersInString:", CFSTR(".’',-&#"));
    objc_msgSend(v8, "invertedSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_1E89C3E38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is empty", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)_checkForConflict:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDNameValidator despaceName:](self, "despaceName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNameValidator namespaceList](self, "namespaceList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!objc_msgSend(v10, "containsObject:", v8))
    {
      v15 = 0;
      goto LABEL_9;
    }
    v11 = 31;
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 2;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v15;
}

- (id)_addName:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDNameValidator _validateName:](self, "_validateName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[HMDNameValidator despaceName:](self, "despaceName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNameValidator namespaceList](self, "namespaceList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!objc_msgSend(v11, "containsObject:", v9))
      {
        objc_msgSend(v11, "addObject:", v9);
        v8 = 0;
        goto LABEL_10;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB8C70];
      v14 = 31;
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v17;
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@ to remove name %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB8C70];
      v14 = 2;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  return v8;
}

- (id)_removeName:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDNameValidator namespaceList](self, "namespaceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDNameValidator despaceName:](self, "despaceName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
    {
      objc_msgSend(v9, "removeObject:", v10);
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v14;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@ to remove name %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v61 = v7;
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v82 = v12;
      v83 = 2112;
      v84 = v7;
      v85 = 2112;
      v86 = v9;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to replace %@ with same entry in namespaces %@ - skipping...", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v13 = 0;
  }
  else
  {
    v58 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v56 = v9;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v75 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          -[HMDNameValidator _removeName:namespace:](self, "_removeName:namespace:", v7, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)MEMORY[0x1D17BA0A0]();
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v82 = v23;
              v83 = 2112;
              v84 = v7;
              v85 = 2112;
              v86 = v19;
              v87 = 2112;
              v88 = v20;
              _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove existing name %@ from namespace %@ error %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v21);
          }
          else
          {
            objc_msgSend(v59, "addObject:", v19);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
      }
      while (v16);
    }

    v8 = v58;
    if (v58)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v24 = v14;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v71;
        v28 = v57;
        while (2)
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v71 != v27)
              objc_enumerationMutation(v24);
            v30 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            -[HMDNameValidator _addName:namespace:](self, "_addName:namespace:", v58, v30);
            v31 = objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v55 = (void *)v31;
              v32 = (void *)MEMORY[0x1D17BA0A0]();
              HMFGetOSLogHandle();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v82 = v34;
                v83 = 2112;
                v84 = v58;
                v85 = 2112;
                v86 = v30;
                v87 = 2112;
                v88 = v55;
                _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to add new name %@ from namespace %@  error %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v32);

              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v35 = v57;
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
              if (v36)
              {
                v37 = v36;
                v38 = *(_QWORD *)v67;
                do
                {
                  for (k = 0; k != v37; ++k)
                  {
                    if (*(_QWORD *)v67 != v38)
                      objc_enumerationMutation(v35);
                    v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
                    -[HMDNameValidator _removeName:namespace:](self, "_removeName:namespace:", v8, v40);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v41)
                    {
                      v42 = (void *)MEMORY[0x1D17BA0A0]();
                      HMFGetOSLogHandle();
                      v43 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v82 = v44;
                        v83 = 2112;
                        v84 = v58;
                        v85 = 2112;
                        v86 = v40;
                        v87 = 2112;
                        v88 = v41;
                        _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove new name %@ to namespace %@ error %@", buf, 0x2Au);

                        v8 = v58;
                      }

                      objc_autoreleasePoolPop(v42);
                    }

                  }
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
                }
                while (v37);
              }

              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v24 = v59;
              v45 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
              if (v45)
              {
                v46 = v45;
                v47 = *(_QWORD *)v63;
                do
                {
                  for (m = 0; m != v46; ++m)
                  {
                    if (*(_QWORD *)v63 != v47)
                      objc_enumerationMutation(v24);
                    v49 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
                    -[HMDNameValidator _addName:namespace:](self, "_addName:namespace:", v61, v49);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v50)
                    {
                      v51 = (void *)MEMORY[0x1D17BA0A0]();
                      HMFGetOSLogHandle();
                      v52 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v82 = v53;
                        v83 = 2112;
                        v84 = v61;
                        v85 = 2112;
                        v86 = v49;
                        v87 = 2112;
                        v88 = v50;
                        _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to add existing name %@ to namespace %@ error %@", buf, 0x2Au);

                      }
                      objc_autoreleasePoolPop(v51);
                    }

                  }
                  v46 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
                }
                while (v46);
                v8 = v58;
              }
              v28 = v57;
              v13 = v55;
              goto LABEL_55;
            }
            objc_msgSend(v57, "addObject:", v30);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          if (v26)
            continue;
          break;
        }
        v13 = 0;
      }
      else
      {
        v13 = 0;
        v28 = v57;
      }
LABEL_55:

    }
    else
    {
      v13 = 0;
      v28 = v57;
    }

    v9 = v56;
  }

  return v13;
}

- (id)addNamespace:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDNameValidator _addNamespace:](self, "_addNamespace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to add namespace", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)removeNamespace:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDNameValidator _removeNamespace:](self, "_removeNamespace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to remove namespace", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)validateName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNameValidator _validateName:](self, "_validateName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)checkForConflict:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNameValidator _checkForConflict:namespace:](self, "_checkForConflict:namespace:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)addName:(id)a3 namespace:(id)a4
{
  return -[HMDNameValidator addName:namespace:voiceShortcutCheck:](self, "addName:namespace:voiceShortcutCheck:", a3, a4, 0);
}

- (id)addActionSetName:(id)a3 namespace:(id)a4
{
  return -[HMDNameValidator addName:namespace:voiceShortcutCheck:](self, "addName:namespace:voiceShortcutCheck:", a3, a4, 1);
}

- (id)addName:(id)a3 namespace:(id)a4 voiceShortcutCheck:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to add %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v15;
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5 && !isNameValidWithVoiceShortcut(v8))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2300);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB3388];
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 95, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDNameValidator _addName:namespace:](self, "_addName:namespace:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
LABEL_13:

  return v11;
}

- (id)removeName:(id)a3 namespace:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to remove %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v13;
    goto LABEL_9;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDNameValidator _removeName:namespace:](self, "_removeName:namespace:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
LABEL_9:

  return v9;
}

- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  return -[HMDNameValidator replaceName:withNewName:inNamespaces:voiceShortcutCheck:](self, "replaceName:withNewName:inNamespaces:voiceShortcutCheck:", a3, a4, a5, 0);
}

- (id)replaceActionSetName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  return -[HMDNameValidator replaceName:withNewName:inNamespaces:voiceShortcutCheck:](self, "replaceName:withNewName:inNamespaces:voiceShortcutCheck:", a3, a4, a5, 1);
}

- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5 voiceShortcutCheck:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v12, "count"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Empty set of namespace UUIDs in operation to replace %@ with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (void *)v18;
    goto LABEL_14;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v6 && !isNameValidWithVoiceShortcut(v11))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2300);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CB3388];
    v23 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 95, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDNameValidator _replaceName:withNewName:inNamespaces:](self, "_replaceName:withNewName:inNamespaces:", v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
LABEL_14:

  return v14;
}

- (NSMutableDictionary)namespaceList
{
  return self->_namespaceList;
}

- (void)setNamespaceList:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceList, a3);
}

- (NSUUID)homeManagerUUID
{
  return self->_homeManagerUUID;
}

- (void)setHomeManagerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_homeManagerUUID, a3);
}

- (NSPredicate)nonZeroLengthPredicate
{
  return self->_nonZeroLengthPredicate;
}

- (void)setNonZeroLengthPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_nonZeroLengthPredicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonZeroLengthPredicate, 0);
  objc_storeStrong((id *)&self->_homeManagerUUID, 0);
  objc_storeStrong((id *)&self->_namespaceList, 0);
}

@end
