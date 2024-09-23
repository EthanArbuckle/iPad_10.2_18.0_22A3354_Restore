@implementation CPLMomentShareFeature

- (BOOL)disableFeatureInStore:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  id *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id obj;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[12];
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v31 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v4, "downloadQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v5, "enumeratorForScopesIncludeInactive:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v41;
    v33 = v5;
LABEL_3:
    v11 = 0;
    v34 = v8;
    while (1)
    {
      if (*(_QWORD *)v41 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
      v13 = (void *)MEMORY[0x1B5E08BF0]();
      if ((objc_msgSend(v12, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        if (!_CPLSilentLogging)
        {
          __CPLFeaturesOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "scopeIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v15;
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Disabling %@", buf, 0xCu);

          }
        }
        objc_msgSend(v5, "flagsForScope:", v12, v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setValue:forFlag:", 1, 262152);
        v39 = v9;
        v17 = objc_msgSend(v5, "updateFlags:forScope:error:", v16, v12, &v39);
        v18 = v39;

        if (!v17)
        {
          v9 = v18;
LABEL_34:

          objc_autoreleasePoolPop(v13);
LABEL_35:

          v29 = 0;
          goto LABEL_36;
        }
        v38 = v18;
        v19 = objc_msgSend(v5, "setDisabledDate:forScope:error:", v35, v12, &v38);
        v9 = v38;

        if (!v19)
          goto LABEL_34;
        v20 = v10;
        v21 = 0;
        do
        {
          v22 = v9;
          v23 = v21;
          *(_QWORD *)buf = 0;
          v24 = objc_msgSend(v12, "localIndex");
          v37 = v9;
          v25 = objc_msgSend(v6, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", v24, 100, buf, &v37);
          v9 = v37;

          if (!v25)
            break;
          v21 = *(_QWORD *)buf + v23;
        }
        while (*(uint64_t *)buf > 0);
        if (v23 > 0)
          v26 = v25;
        else
          v26 = 0;
        if (v26 != 1 || _CPLSilentLogging)
        {

          objc_autoreleasePoolPop(v13);
          v10 = v20;
          v5 = v33;
          v8 = v34;
          if ((v25 & 1) == 0)
            goto LABEL_35;
          goto LABEL_26;
        }
        __CPLFeaturesOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "scopeIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v23;
          v45 = 2112;
          v46 = v28;
          _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_DEFAULT, "Removed %ld background downloads from queue for %@", buf, 0x16u);

        }
        v10 = v20;
        v5 = v33;
        v8 = v34;
      }
      objc_autoreleasePoolPop(v13);
LABEL_26:
      if (++v11 == v8)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_30;
      }
    }
  }
  v9 = 0;
LABEL_30:

  if (v31)
  {
    v9 = objc_retainAutorelease(v9);
    *v31 = v9;
  }
  v29 = 1;
LABEL_36:

  return v29;
}

- (BOOL)enableFeatureInStore:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  char v18;
  char v19;
  id v20;
  BOOL v21;
  id *v23;
  id v24;
  id obj;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v23 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "enumeratorForScopesIncludeInactive:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v30;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x1B5E08BF0]();
      v12 = objc_msgSend(v10, "scopeType");
      if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(v4, "flagsForScope:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "valueForFlag:", 0x40000) & 1) != 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLFeaturesOSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "scopeIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v34 = v15;
              _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEFAULT, "Enabling %@", buf, 0xCu);

            }
          }
          objc_msgSend(v13, "setValue:forFlag:", 0, 262152, v23);
          v28 = v7;
          v16 = objc_msgSend(v4, "updateFlags:forScope:error:", v13, v10, &v28);
          v17 = v28;

          if ((v16 & 1) == 0)
          {

            objc_autoreleasePoolPop(v11);
            v7 = v17;
LABEL_28:

            v21 = 0;
            goto LABEL_29;
          }
          v27 = v17;
          v18 = objc_msgSend(v4, "setDisabledDate:forScope:error:", 0, v10, &v27);
          v7 = v27;

          objc_autoreleasePoolPop(v11);
          if ((v18 & 1) == 0)
            goto LABEL_28;
          goto LABEL_20;
        }

      }
      else if (!v12)
      {
        v26 = v7;
        v19 = objc_msgSend(v4, "setScopeNeedsUpdateFromTransport:error:", v10, &v26);
        v20 = v26;

        objc_autoreleasePoolPop(v11);
        v7 = v20;
        if ((v19 & 1) == 0)
          goto LABEL_28;
        goto LABEL_20;
      }
      objc_autoreleasePoolPop(v11);
LABEL_20:
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
  }
  v7 = 0;
LABEL_24:

  if (v23)
  {
    v7 = objc_retainAutorelease(v7);
    *v23 = v7;
  }
  v21 = 1;
LABEL_29:

  return v21;
}

- (BOOL)handleScopeWhenFeatureIsDisabled:(id)a3 scopeType:(int64_t)a4 store:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  id *v31;
  void *context;
  id v33;
  id v34;
  id v35;
  _BYTE buf[12];
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    context = (void *)MEMORY[0x1B5E08BF0]();
    if (!_CPLSilentLogging)
    {
      __CPLFeaturesOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "scopeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v12;
        v37 = 2112;
        v38 = (uint64_t)v13;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Automatically disabling %@ because feature for %@ is disabled", buf, 0x16u);

      }
    }
    objc_msgSend(v10, "scopes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "downloadQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "flagsForScope:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forFlag:", 1, 262152);
    v35 = 0;
    v18 = objc_msgSend(v14, "updateFlags:forScope:error:", v17, v9, &v35);
    v19 = v35;
    v20 = v19;
    if (v18)
    {
      v34 = v19;
      LODWORD(v21) = objc_msgSend(v14, "setDisabledDate:forScope:error:", v16, v9, &v34);
      v22 = v34;

      if ((_DWORD)v21)
      {
        v31 = a6;
        v23 = 0;
        v20 = v22;
        do
        {
          v24 = v20;
          v25 = v23;
          *(_QWORD *)buf = 0;
          v26 = objc_msgSend(v9, "localIndex");
          v33 = v20;
          LODWORD(v21) = objc_msgSend(v15, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", v26, 100, buf, &v33);
          v20 = v33;

          if (!(_DWORD)v21)
            break;
          v23 = *(_QWORD *)buf + v25;
        }
        while (*(uint64_t *)buf > 0);
        if (v25 > 0)
          v27 = v21;
        else
          v27 = 0;
        if (v27 == 1)
        {
          a6 = v31;
          if (!_CPLSilentLogging)
          {
            __CPLFeaturesOSLogDomain();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "scopeIdentifier");
              v28 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v25;
              v37 = 2112;
              v38 = v28;
              v29 = (void *)v28;
              _os_log_impl(&dword_1B03C2000, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "Removed %ld background downloads from queue for %@", buf, 0x16u);

            }
            LOBYTE(v21) = 1;
          }
        }
        else
        {
          a6 = v31;
        }
      }
      else
      {
        v20 = v22;
      }
    }
    else
    {
      LOBYTE(v21) = 0;
    }

    objc_autoreleasePoolPop(context);
    if (a6 && (v21 & 1) == 0)
    {
      v20 = objc_retainAutorelease(v20);
      LOBYTE(v21) = 0;
      *a6 = v20;
    }
  }
  else
  {
    v20 = 0;
    LOBYTE(v21) = 1;
  }

  return v21;
}

@end
