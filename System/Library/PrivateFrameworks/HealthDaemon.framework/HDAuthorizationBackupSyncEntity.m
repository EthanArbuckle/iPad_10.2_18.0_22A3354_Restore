@implementation HDAuthorizationBackupSyncEntity

+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDAuthorizationBackupSyncEntity;
  v5 = a4;
  v6 = a3;
  objc_msgSendSuper2(&v11, sel_createCodableSourceAuthorizationWithSource_syncSession_, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionUUID", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hk_dataForUUIDBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackupUUID:", v9);

  objc_msgSend(v7, "setSource:", v6);
  return v7;
}

+ (void)setAuthorizationBackupPushIdentifier:(id)a3 syncStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("PushIdentifier"));
  +[HDAuthorizationBackupSyncEntity _setBackupInfo:]((uint64_t)a1, v9);

}

+ (id)_backupInfoWithSyncStore:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  const __CFString **v14;
  uint64_t v15;
  void *v16;
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_self();
  objc_msgSend(v2, "databaseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v16 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backupInfoUserDefaultsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DatabaseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PushIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_8:
    v18 = CFSTR("DatabaseIdentifier");
    v19 = v5;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v19;
    v14 = &v18;
    v15 = 1;
LABEL_9:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "isEqualToString:", v5))
  {
    if (objc_msgSend(v10, "length"))
    {
      v20[0] = CFSTR("DatabaseIdentifier");
      v20[1] = CFSTR("PullIdentifier");
      v21[0] = v5;
      v21[1] = v10;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = (void **)v21;
      v14 = (const __CFString **)v20;
      v15 = 2;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v11 = v8;
LABEL_10:
  v16 = v11;

LABEL_12:
  return v16;
}

+ (void)_setBackupInfo:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v2 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backupInfoUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, v4);
  else
    objc_msgSend(v3, "removeObjectForKey:", v4);

}

+ (id)authorizationBackupPullIdentifierWithSyncStore:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PullIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  return v6;
}

+ (id)authorizationBackupPushIdentifierWithSyncStore:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

  return v6;
}

+ (void)resetAuthorizationBackupIdentifiers
{
  +[HDAuthorizationBackupSyncEntity _setBackupInfo:]((uint64_t)a1, 0);
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 48);
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  end = a4.end;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = HDSyncAnchorRangeMake(0, end);
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HDAuthorizationBackupSyncEntity;
  LOBYTE(a7) = objc_msgSendSuper2(&v18, sel_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error_, v14, v15, v16, v13, v12, a7);

  return (char)a7;
}

+ (void)didGenerateCodableSourceAuthorizationsForSyncSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "sessionUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setAuthorizationBackupPushIdentifier:syncStore:", v6, v5);
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  int64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  id *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "authorizationBackupPullIdentifierWithSyncStore:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v33 = a7;
    v34 = v13;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v35 = v11;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v21, "decodedBackupUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "isEqual:", v14))
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v15, "count"))
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E0CB5370];
      v13 = v34;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (void *)objc_msgSend(v15, "count");
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 134218242;
        v41 = v25;
        v42 = 2114;
        v43 = v26;
        v27 = v26;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "Applying %lu objects for %{public}@", buf, 0x16u);

      }
      v28 = +[HDAuthorizationEntity _insertCodableSourceAuthorizations:overwriteExisting:syncStore:profile:error:]((uint64_t)HDAuthorizationEntity, v15, 0, v12, v34, (uint64_t)v33) ^ 1;
      v11 = v35;
    }
    else
    {
      v28 = 0;
      v13 = v34;
      v11 = v35;
    }

  }
  else
  {
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      *(_DWORD *)buf = 138543362;
      v41 = (id)objc_opt_class();
      v31 = v41;
      _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@ objects (missing pull identifier)", buf, 0xCu);

    }
    v28 = 0;
  }

  return v28;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

+ (id)excludedSyncIdentitiesForSession:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "syncStoreType");
  return (v3 < 6) & (0x24u >> v3);
}

@end
