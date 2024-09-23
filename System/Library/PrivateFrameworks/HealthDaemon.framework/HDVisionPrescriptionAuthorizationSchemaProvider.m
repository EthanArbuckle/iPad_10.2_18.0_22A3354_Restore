@implementation HDVisionPrescriptionAuthorizationSchemaProvider

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v39 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0CB6AD8];
  v47[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hd_sampleTypesForObjects:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v17, v13, v14, &v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v45;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "count");
    v34 = v20;
    if (v21 != objc_msgSend(v20, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDVisionPrescriptionAuthorizationSchemaProvider.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

    }
    v36 = v14;
    v37 = v13;
    v38 = v12;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v35 = v17;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      v26 = 2;
      do
      {
        v27 = 0;
        v28 = v19;
        do
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v27);
          objc_msgSend(v18, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v28;
          v31 = +[HDAuthorizationStatus isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:](HDAuthorizationStatus, "isAuthorizedForObjectType:authorizationStatus:clientEntitlements:sharing:error:", v29, v30, v39, 0, &v40);
          v19 = v40;

          if (v31)
            v26 = 1;

          ++v27;
          v28 = v19;
        }
        while (v24 != v27);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 2;
    }

    v13 = v37;
    v12 = v38;
    v17 = v35;
    v14 = v36;
  }
  else
  {
    v26 = 2;
  }

  return v26;
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
  HDVisionPrescriptionAuthorizationSchemaProvider *v41;
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
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v41, CFSTR("HDVisionPrescriptionAuthorizationSchemaProvider.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] == [typesIncludingParentTypes count]"));

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

- (int64_t)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  void *v31;
  id *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v36 = a6;
  v14 = a7;
  objc_msgSend(v14, "sourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localSourceForBundleIdentifier:error:", v13, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "sourceUUIDWithProfile:error:", v14, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v31 = v16;
      v32 = a8;
      v33 = v14;
      v34 = v13;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v35 = v12;
      v19 = v12;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            v25 = objc_alloc(MEMORY[0x1E0CB6970]);
            objc_msgSend(v19, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = HKObjectAuthorizationStatusForNumber();
            v28 = (void *)objc_msgSend(v25, "initWithObjectUUID:sourceUUID:sessionUUID:status:modificationDate:", v24, v17, v36, v27, CFAbsoluteTimeGetCurrent());

            objc_msgSend(v18, "addObject:", v28);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v21);
      }

      v14 = v33;
      if (+[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v18, 0, objc_msgSend(v33, "currentSyncIdentityPersistentID"), v33, v32))
      {
        v29 = 1;
      }
      else
      {
        v29 = 2;
      }

      v13 = v34;
      v12 = v35;
      v16 = v31;
    }
    else
    {
      v29 = 2;
    }

  }
  else
  {
    v29 = 2;
  }

  return v29;
}

@end
