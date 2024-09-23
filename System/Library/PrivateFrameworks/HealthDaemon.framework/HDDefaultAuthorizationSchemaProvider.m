@implementation HDDefaultAuthorizationSchemaProvider

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id *v39;
  id v40;
  HDDefaultAuthorizationSchemaProvider *v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v43 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1E0CB6AD8];
  v51[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hd_sampleTypesForObjects:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v18, v14, v15, &v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v49;
  v21 = v20;
  if (!v19)
  {
    v28 = 2;
    if (!v20)
      goto LABEL_21;
    goto LABEL_18;
  }
  v41 = self;
  objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "count");
  v36 = v22;
  if (v23 != objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v41, CFSTR("HDDefaultAuthorizationSchemaProvider.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

  }
  v38 = v15;
  v39 = a7;
  v40 = v14;
  v42 = v13;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v18;
  v24 = v18;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v46;
    v28 = 2;
    do
    {
      v29 = 0;
      v30 = v21;
      do
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v24);
        v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v29);
        objc_msgSend(v19, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v30;
        v33 = +[HDAuthorizationStatus isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:](HDAuthorizationStatus, "isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:", v31, v32, v43, 0, &v44);
        v21 = v44;

        if (v33)
          v28 = 1;

        ++v29;
        v30 = v21;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v26);
  }
  else
  {
    v28 = 2;
  }

  v14 = v40;
  v13 = v42;
  v15 = v38;
  a7 = v39;
  v18 = v37;
  if (v21)
  {
LABEL_18:
    if (a7)
      *a7 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }
LABEL_21:

  return v28;
}

- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v38 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v15, v13, v14, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v44;
  v18 = v17;
  if (!v16)
  {
    v25 = 2;
    if (!v17)
      goto LABEL_21;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "count");
  v33 = v19;
  if (v20 != objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDefaultAuthorizationSchemaProvider.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

  }
  v35 = v14;
  v36 = a7;
  v37 = v13;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v15;
  v21 = v15;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    v25 = 2;
    do
    {
      v26 = 0;
      v27 = v18;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v26);
        objc_msgSend(v16, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v27;
        v30 = +[HDAuthorizationStatus isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:](HDAuthorizationStatus, "isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:", v28, v29, v38, 0, &v39);
        v18 = v39;

        if (v30)
          v25 = 1;

        ++v26;
        v27 = v18;
      }
      while (v23 != v26);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 2;
  }

  a7 = v36;
  v13 = v37;
  v15 = v34;
  v14 = v35;
  if (v18)
  {
LABEL_18:
    if (a7)
      *a7 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }
LABEL_21:

  return v25;
}

- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v38 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v15, v13, v14, &v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v44;
  v18 = v17;
  if (!v16)
  {
    v25 = 2;
    if (!v17)
      goto LABEL_21;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "count");
  v33 = v19;
  if (v20 != objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDefaultAuthorizationSchemaProvider.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

  }
  v35 = v14;
  v36 = a7;
  v37 = v13;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = v15;
  v21 = v15;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    v25 = 2;
    do
    {
      v26 = 0;
      v27 = v18;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v26);
        objc_msgSend(v16, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v27;
        v30 = +[HDAuthorizationStatus isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:](HDAuthorizationStatus, "isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:", v28, v29, v38, 1, &v39);
        v18 = v39;

        if (v30)
          v25 = 1;

        ++v26;
        v27 = v18;
      }
      while (v23 != v26);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 2;
  }

  a7 = v36;
  v13 = v37;
  v15 = v34;
  v14 = v35;
  if (v18)
  {
LABEL_18:
    if (a7)
      *a7 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }
LABEL_21:

  return v25;
}

- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id *v39;
  id v40;
  HDDefaultAuthorizationSchemaProvider *v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v43 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x1E0CB6AD8];
  v51[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hd_sampleTypesForObjects:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v18, v14, v15, &v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v49;
  v21 = v20;
  if (!v19)
  {
    v28 = 2;
    if (!v20)
      goto LABEL_21;
    goto LABEL_18;
  }
  v41 = self;
  objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "count");
  v36 = v22;
  if (v23 != objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v41, CFSTR("HDDefaultAuthorizationSchemaProvider.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

  }
  v38 = v15;
  v39 = a7;
  v40 = v14;
  v42 = v13;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v18;
  v24 = v18;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v46;
    v28 = 2;
    do
    {
      v29 = 0;
      v30 = v21;
      do
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v24);
        v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v29);
        objc_msgSend(v19, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v30;
        v33 = +[HDAuthorizationStatus isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:](HDAuthorizationStatus, "isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:", v31, v32, v43, 1, &v44);
        v21 = v44;

        if (v33)
          v28 = 1;

        ++v29;
        v30 = v21;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v26);
  }
  else
  {
    v28 = 2;
  }

  v14 = v40;
  v13 = v42;
  v15 = v38;
  a7 = v39;
  v18 = v37;
  if (v21)
  {
LABEL_18:
    if (a7)
      *a7 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }
LABEL_21:

  return v28;
}

- (int64_t)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 bundleIdentifier:(id)a5 options:(unint64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _BOOL4 v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  char v39;
  void *v40;
  int64_t v41;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  HDDefaultAuthorizationSchemaProvider *v55;
  id v56;
  id v57;
  id v58;
  SEL v59;
  unint64_t v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v14, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke;
  v52[3] = &unk_1E6CE9140;
  v22 = v17;
  v53 = v22;
  v23 = v16;
  v54 = v23;
  v55 = self;
  v59 = a2;
  v56 = v20;
  v24 = v14;
  v57 = v24;
  v58 = v15;
  v60 = a6;
  v25 = v15;
  v26 = v20;
  v27 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAuthorizationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v21, a8, v52);

  if ((a6 & 2) != 0 && v27)
  {
    v28 = v24;
    v29 = v22;
    if (self)
    {
      v30 = v23;
      v51 = v29;
      objc_msgSend(v29, "sourceManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 0;
      objc_msgSend(v31, "clientSourceForBundleIdentifier:error:", v30, &v62);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v62;
      v49 = v26;
      if (v32)
      {
        if (objc_msgSend(v32, "_requiresAuthorization"))
        {
          objc_msgSend(v28, "hk_filterKeysWithBlock:", &__block_literal_global_27);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "allObjects");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v28, "allKeys");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v51, "sourceOrderManager", v28, v25);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v33;
        v39 = objc_msgSend(v38, "addOrderedSource:objectTypes:error:", v32, v35, &v61);
        v37 = v61;

        if ((v39 & 1) == 0)
        {
          _HKInitializeLogging();
          v40 = (void *)*MEMORY[0x1E0CB5280];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
          {
            v45 = v40;
            objc_msgSend(v32, "bundleIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v46;
            v65 = 2114;
            v66 = v37;
            _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "Failed to update source order while changing authorization status for %{public}@: %{public}@", buf, 0x16u);

          }
        }

        v28 = v47;
        v25 = v48;
      }
      else
      {
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          v43 = v36;
          objc_msgSend(0, "bundleIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = v44;
          v65 = 2114;
          v66 = v33;
          _os_log_error_impl(&dword_1B7802000, v43, OS_LOG_TYPE_ERROR, "Failed to find source %{public}@ to update source order after authorization update: %{public}@", buf, 0x16u);

        }
        v37 = v33;
      }
      v29 = v51;

      v26 = v49;
    }

  }
  if (v27)
    v41 = 1;
  else
    v41 = 2;

  return v41;
}

BOOL __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *, _BYTE *);
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v41 = 0;
  objc_msgSend(v6, "localSourceForBundleIdentifier:copyIfNecessary:error:", v7, 1, &v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v41;

  if (v8)
  {
    +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__22;
      v39 = __Block_byref_object_dispose__22;
      v40 = 0;
      v11 = *(void **)(a1 + 64);
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke_200;
      v30 = &unk_1E6CEB9E0;
      v12 = v10;
      v13 = *(_QWORD *)(a1 + 48);
      v31 = v12;
      v32 = v13;
      v14 = *(_QWORD *)(a1 + 80);
      v33 = &v35;
      v34 = v14;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v27);
      v15 = (void *)v36[5];
      if (v15)
      {
        v16 = v15;
        v17 = v16;
        if (a3)
        {
          v18 = 0;
          *a3 = objc_retainAutorelease(v16);
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
      }
      else
      {
        v18 = +[HDAuthorizationEntity setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:](HDAuthorizationEntity, "setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:", *(_QWORD *)(a1 + 64), MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 72), v8, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), a3, v27, v28, v29, v30);
        if (!*(_QWORD *)(a1 + 48))
          goto LABEL_19;
        v19 = *(void **)(a1 + 32);
        v20 = CFSTR("Authorization changed");
        objc_msgSend(v19, "nanoSyncManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Authorization changed"), 0);

        if (!*(_QWORD *)(a1 + 48))
          goto LABEL_19;
        v23 = a1 + 32;
        v22 = *(void **)(a1 + 32);
        v24 = *(id *)(v23 + 8);
        objc_msgSend(v22, "daemon");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "xpcEventManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "authorizationChangedForBundleIdentifier:", v24);

      }
LABEL_19:

      _Block_object_dispose(&v35, 8);
      goto LABEL_20;
    }
    v12 = 0;
    v18 = 0;
  }
  else
  {
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 80), CFSTR("No source with bundle identifier %@"), *(_QWORD *)(a1 + 40));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v9 = 0;
        v18 = 0;
        goto LABEL_21;
      }
    }
    if (a3)
    {
      v12 = objc_retainAutorelease(v12);
      v18 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      v18 = 0;
    }
    v9 = v12;
  }
LABEL_20:

LABEL_21:
  return v18;
}

void __123__HDDefaultAuthorizationSchemaProvider_setAuthorizationStatuses_authorizationModes_bundleIdentifier_options_profile_error___block_invoke_200(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "integerValue");
  if (v8)
  {
    if ((objc_msgSend(v8, "isCompatibleStatus:", v9) & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Invalid authorization status %@ for type %@, request %ld"), v7, v15, objc_msgSend(v8, "request"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 56), CFSTR("Missing authorization record for type %@"), v15, v13, v14);
  }
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_6:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;

}

uint64_t __112__HDDefaultAuthorizationSchemaProvider__updateSourceOrderWithAuthorizationStatuses_forBundleIdentifier_profile___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "integerValue");
  if ((HKAuthorizationStatusAllowsReading() & 1) != 0)
    return 1;
  else
    return HKAuthorizationStatusAllowsSharing();
}

@end
