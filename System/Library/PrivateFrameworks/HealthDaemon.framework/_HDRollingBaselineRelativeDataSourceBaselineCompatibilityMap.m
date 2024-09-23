@implementation _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap

- (_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap)initWithProfile:(id)a3 quantityType:(id)a4
{
  id v6;
  id v7;
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *v8;
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *v9;
  uint64_t v10;
  NSMutableDictionary *bundleIDBySourceID;
  void *v12;
  int v13;
  uint64_t v14;
  NSDictionary *canonicalBundleIDByBundleID;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap;
  v8 = -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIDBySourceID = v9->_bundleIDBySourceID;
    v9->_bundleIDBySourceID = (NSMutableDictionary *)v10;

    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB5A68]);

    if (v13)
    {
      objc_msgSend((id)objc_opt_class(), "_canonicalSleepingWristTemperatureBundleIDByBundleIDWithProfile:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      canonicalBundleIDByBundleID = v9->_canonicalBundleIDByBundleID;
      v9->_canonicalBundleIDByBundleID = (NSDictionary *)v14;
    }
    else
    {
      canonicalBundleIDByBundleID = v9->_canonicalBundleIDByBundleID;
      v9->_canonicalBundleIDByBundleID = (NSDictionary *)MEMORY[0x1E0C9AA70];
    }

  }
  return v9;
}

+ (id)_canonicalSleepingWristTemperatureBundleIDByBundleIDWithProfile:(id)a3
{
  void *v3;
  void *v4;

  +[HDKeyValueDomain _wristTemperatureIdentifierDomainWithProfile:](HDKeyValueDomain, "_wristTemperatureIdentifierDomainWithProfile:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_wristTemperatureResolvedSourceIdentifiersBySourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)baselineCompatibilityIDForSourceID:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleInternalInstall");

  if ((v6 & 1) != 0)
  {
    v15 = 0;
    -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap _bundleIDForSourceID:error:](self, "_bundleIDForSourceID:error:", a3, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v7)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_canonicalBundleIDByBundleID, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = 0;
        goto LABEL_9;
      }
      v10 = v9;
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

- (id)_bundleIDForSourceID:(int64_t)a3 error:(id *)a4
{
  NSMutableDictionary *bundleIDBySourceID;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  bundleIDBySourceID = self->_bundleIDBySourceID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](bundleIDBySourceID, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "sourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v11, "clientSourceForPersistentID:error:", v12, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;

    if (v13)
    {
      objc_msgSend(v13, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_bundleIDBySourceID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v9, v16);

      v17 = v13;
LABEL_11:

      return v9;
    }
    _HKInitializeLogging();
    v18 = (id)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v21;
      v27 = 2114;
      v28 = v14;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error determining source for ID %{public}@: %{public}@", buf, 0x20u);

    }
    v19 = v14;
    v17 = v19;
    if (v19)
    {
      if (a4)
      {
        v9 = 0;
        *a4 = objc_retainAutorelease(v19);
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v9 = 0;
    goto LABEL_11;
  }
  return v9;
}

- (id)predicateForDataEntitiesWithSourceIDsCompatibleWithSourceID:(int64_t)a3
{
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  NSDictionary *obj;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  _HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if ((v4 & 1) != 0)
  {
    v33 = 0;
    -[_HDRollingBaselineRelativeDataSourceBaselineCompatibilityMap _bundleIDForSourceID:error:](self, "_bundleIDForSourceID:error:", a3, &v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v33;
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForSourceIdentifier((uint64_t)v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

      return v16;
    }
    -[NSDictionary objectForKeyedSubscript:](self->_canonicalBundleIDByBundleID, "objectForKeyedSubscript:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = self->_canonicalBundleIDByBundleID;
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v30 != v7)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](self->_canonicalBundleIDByBundleID, "objectForKeyedSubscript:", v9, v22);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqual:", v26))
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
              objc_msgSend(WeakRetained, "sourceManager");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v5;
              objc_msgSend(v12, "allSourcesForBundleIdentifier:error:", v9, &v28);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v28;

              if (!v13)
              {
                _HKInitializeLogging();
                v18 = *MEMORY[0x1E0CB5348];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v35 = self;
                  v36 = 2114;
                  v37 = v9;
                  v38 = 2114;
                  v39 = v14;
                  _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error source entities for bundle ID %{public}@: %{public}@", buf, 0x20u);
                }

                v5 = v14;
                goto LABEL_21;
              }
              objc_msgSend(v25, "unionSet:", v13);

              v5 = v14;
            }

          }
          v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_21:

      if (!objc_msgSend(v25, "count"))
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = self;
          v36 = 2114;
          v37 = v26;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] No source entities found for canonical bundle ID %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3, v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForSourceIdentifier((uint64_t)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }
      HDDataEntityPredicateForSourceEntitySet(7, v25);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForSourceIdentifier((uint64_t)v25);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v17;
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForSourceIdentifier((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDBySourceID, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIDByBundleID, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
