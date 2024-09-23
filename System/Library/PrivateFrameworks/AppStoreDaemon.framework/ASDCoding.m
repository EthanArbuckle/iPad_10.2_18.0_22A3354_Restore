@implementation ASDCoding

+ (id)createDataByEncodingError:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)createErrorByDecodingData:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)securelyEncodeObject:(id)a3 forKey:(id)a4 withCoder:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[ASDCoding _findNonSecureClassesFromObject:]((uint64_t)a1, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Attempted to encode classes that don't conform to NSSecureCoding: '%@' with key '%@'"), v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = (id)objc_opt_class();
      v22 = 2114;
      v23 = v16;
      v19 = v21;
      _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@", buf, 0x16u);

    }
    ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 507, CFSTR("Error encoding object"), v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (a6 && v17)
    {
      v17 = objc_retainAutorelease(v17);
      *a6 = v17;
    }
  }
  else
  {
    objc_msgSend(v12, "encodeObject:forKey:", v10, v11);
    v17 = 0;
  }

  return v17 == 0;
}

+ (id)_findNonSecureClassesFromObject:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (v2)
  {
    v4 = v3;
    v5 = (id)objc_opt_new();
    if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EE37DC20) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = (id)objc_opt_class();
        v27 = 2114;
        v28 = v6;
        v16 = v26;
        _os_log_error_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%{public}@]:  Error: Found class %{public}@ that doesn't conform to NSSecureCoding", buf, 0x16u);

      }
      objc_msgSend(v5, "addObject:", v6);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASDCoding _findNonSecureClassesFromObject:](v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
        objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __45__ASDCoding__findNonSecureClassesFromObject___block_invoke;
      v21[3] = &unk_1E37BF960;
      v23 = v4;
      v5 = v5;
      v22 = v5;
      objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v21);
      v9 = v22;
LABEL_23:

      goto LABEL_24;
    }
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE38D210))
    {
      v9 = v2;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            +[ASDCoding _findNonSecureClassesFromObject:](v4, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count"))
              objc_msgSend(v5, "addObjectsFromArray:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
        }
        while (v11);
      }
      goto LABEL_23;
    }
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_24:

  return v5;
}

void __45__ASDCoding__findNonSecureClassesFromObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[ASDCoding _findNonSecureClassesFromObject:](*(_QWORD *)(a1 + 40), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);

}

@end
