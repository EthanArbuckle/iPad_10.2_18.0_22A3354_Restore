@implementation AMSDeviceOffersStore

- (NSArray)cachedRegistrationGroups
{
  void *v2;
  void *v3;
  AMSStorageDatabase *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    v4 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
    v12 = 0;
    -[AMSStorageDatabase valueForKey:error:](v4, "valueForKey:error:", CFSTR("deviceGroups"), &v12);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v5)
    {
      +[AMSLogConfig sharedDeviceOffersConfig](AMSLogConfig, "sharedDeviceOffersConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_opt_class();
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v14 = v8;
        v15 = 2114;
        v16 = v9;
        v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error fetching cached device groups: %{public}@", buf, 0x20u);

      }
    }

    if (v2)
      goto LABEL_3;
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  +[AMSDefaults deviceGroups](AMSDefaults, "deviceGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_11;
LABEL_3:
  objc_msgSend(v2, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return (NSArray *)v3;
}

AMSDeviceOfferRegistrationGroup *__48__AMSDeviceOffersStore_cachedRegistrationGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSDeviceOfferRegistrationGroup *v3;

  v2 = a2;
  v3 = -[AMSDeviceOfferRegistrationGroup initWithDatabaseEntry:]([AMSDeviceOfferRegistrationGroup alloc], "initWithDatabaseEntry:", v2);

  return v3;
}

- (NSArray)companionSerialNumbers
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDeviceOffersStore deviceOfferEligibility](self, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("companionSerialNumbers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (NSDictionary)deviceOfferEligibility
{
  _BOOL4 v2;
  __objc2_class **v3;

  v2 = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal");
  v3 = off_1E2519B38;
  if (v2)
    v3 = off_1E2519680;
  -[__objc2_class deviceOfferEligibility](*v3, "deviceOfferEligibility");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)deviceOffers
{
  void *v2;
  void *v3;

  -[AMSDeviceOffersStore deviceOfferEligibility](self, "deviceOfferEligibility");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceOffers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)deviceRegistrationDenyList
{
  void *v2;
  id v3;
  id v4;
  AMSStorageDatabase *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    v5 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
    v17 = 0;
    -[AMSStorageDatabase valueForKey:error:](v5, "valueForKey:error:", CFSTR("deviceRegistrationBlacklist"), &v17);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    if (v6)
    {
      +[AMSLogConfig sharedDeviceOffersConfig](AMSLogConfig, "sharedDeviceOffersConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        AMSLogKey();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v9;
        v20 = 2114;
        v21 = v10;
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error fetching denylist: %{public}@", buf, 0x20u);

      }
    }

    if (v2)
      goto LABEL_3;
LABEL_12:
    v4 = 0;
    goto LABEL_15;
  }
  +[AMSDefaults deviceRegistrationDenyList](AMSDefaults, "deviceRegistrationDenyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_12;
LABEL_3:
  v3 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

LABEL_15:
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "OSLogObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    AMSLogKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up denylist: %{public}@", buf, 0x20u);

  }
  return (NSArray *)v4;
}

- (void)setCachedRegistrationGroups:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    +[AMSDefaults setDeviceGroups:](AMSDefaults, "setDeviceGroups:", v4);
  }
  else
  {
    v11 = 0;
    -[AMSDeviceOffersStore _dbSetNullableValue:forKey:error:](self, "_dbSetNullableValue:forKey:error:", v4, CFSTR("deviceGroups"), &v11);
    v5 = v11;
    if (v5)
    {
      +[AMSLogConfig sharedDeviceOffersConfig](AMSLogConfig, "sharedDeviceOffersConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_opt_class();
        AMSLogKey();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v13 = v8;
        v14 = 2114;
        v15 = v9;
        v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error writing device groups to db: %{public}@", buf, 0x20u);

      }
    }

  }
}

uint64_t __52__AMSDeviceOffersStore_setCachedRegistrationGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeToDictionary");
}

- (void)setDeviceOfferEligibility:(id)a3
{
  _BOOL4 v3;
  __objc2_class **v4;
  id v5;

  v5 = a3;
  v3 = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal");
  v4 = off_1E2519B38;
  if (v3)
    v4 = off_1E2519680;
  -[__objc2_class setDeviceOfferEligibility:](*v4, "setDeviceOfferEligibility:", v5);

}

- (void)setDeviceOffers:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  -[AMSDeviceOffersStore deviceOfferEligibility](self, "deviceOfferEligibility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = v6;
  else
    v8 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v4, "dictionaryWithDictionary:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("deviceOffers"));
  v9 = (void *)objc_msgSend(v10, "copy");
  -[AMSDeviceOffersStore setDeviceOfferEligibility:](self, "setDeviceOfferEligibility:", v9);

}

- (void)setDeviceRegistrationDenyList:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedDeviceOffersConfig](AMSLogConfig, "sharedDeviceOffersConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    v21 = 1024;
    LODWORD(v22[0]) = +[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal");
    WORD2(v22[0]) = 2114;
    *(_QWORD *)((char *)v22 + 6) = v4;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating device offer denylist (%d): %{public}@", buf, 0x26u);

  }
  if (+[AMSDefaults migratedStorageToDefaultsForNonAMSInternal](AMSDefaults, "migratedStorageToDefaultsForNonAMSInternal"))
  {
    v9 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    +[AMSDefaults setDeviceRegistrationDenyList:](AMSDefaults, "setDeviceRegistrationDenyList:", v10);
  }
  else
  {
    v16 = 0;
    -[AMSDeviceOffersStore _dbSetNullableValue:forKey:error:](self, "_dbSetNullableValue:forKey:error:", v4, CFSTR("deviceRegistrationBlacklist"), &v16);
    v10 = v16;
    if (v10)
    {
      +[AMSLogConfig sharedDeviceOffersConfig](AMSLogConfig, "sharedDeviceOffersConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v13;
        v19 = 2114;
        v20 = v14;
        v21 = 2114;
        v22[0] = v15;
        _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was an error writing the device registration denylist to db: %{public}@", buf, 0x20u);

      }
    }
  }

}

- (void)_dbSetNullableValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  AMSStorageDatabase *v8;
  AMSStorageDatabase *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = -[AMSStorageDatabase initWithDomain:]([AMSStorageDatabase alloc], "initWithDomain:", CFSTR("com.apple.AppleMediaServices"));
  v9 = v8;
  if (v10)
    -[AMSStorageDatabase setValue:forKey:error:](v8, "setValue:forKey:error:", v10, v7, a5);
  else
    -[AMSStorageDatabase deleteForKey:error:](v8, "deleteForKey:error:", v7, a5);

}

- (void)removeCachedRegistrationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[AMSDeviceOffersStore cachedRegistrationGroups](self, "cachedRegistrationGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "splitGroups:byItem:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "second");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOffersStore setCachedRegistrationGroups:](self, "setCachedRegistrationGroups:", v16);
  objc_msgSend((id)objc_opt_class(), "serialsBySubtractingAGroups:fromBGroups:", v16, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E20];
  -[AMSDeviceOffersStore deviceRegistrationDenyList](self, "deviceRegistrationDenyList");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "minusSet:", v9);
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOffersStore setDeviceRegistrationDenyList:](self, "setDeviceRegistrationDenyList:", v15);

}

+ (id)splitGroups:(id)a3 byItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  AMSPair *v17;
  id obj;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "registrationItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __43__AMSDeviceOffersStore_splitGroups_byItem___block_invoke;
        v20[3] = &unk_1E2541210;
        v21 = v6;
        v15 = objc_msgSend(v14, "ams_anyWithTest:", v20);

        if (v15)
          v16 = v7;
        else
          v16 = v8;
        objc_msgSend(v16, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v17 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v7, v8);
  return v17;
}

uint64_t __43__AMSDeviceOffersStore_splitGroups_byItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

+ (id)serialsBySubtractingAGroups:(id)a3 fromBGroups:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a1, "serialsFromGroups:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "serialsFromGroups:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "minusSet:", v7);
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

+ (id)serialsFromGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "registrationItems", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ams_mapWithTransform:", &__block_literal_global_23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObjectsFromArray:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

uint64_t __42__AMSDeviceOffersStore_serialsFromGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialNumber");
}

@end
