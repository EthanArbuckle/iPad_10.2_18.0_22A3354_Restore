@implementation HDSourceManager

- (id)allSourcesWithError:(id *)a3
{
  return -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, 0, (uint64_t)a3);
}

- (id)clientSourcesForSourceIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  HDSourceManager *v17;
  id v18;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v10 = v7;
  v11 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, a4, v15);

  if ((_DWORD)a4)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

uint64_t __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD *v19;
  _QWORD v20[6];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v19 = a3;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 32);
      v21 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke_2;
      v20[3] = &unk_1E6CF7EE8;
      v20[4] = v12;
      v20[5] = v11;
      objc_msgSend(v13, "fetchObjectForKey:transaction:error:faultHandler:", v11, v5, &v21, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v21;
      v16 = v15;
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      }
      else
      {
        if (v15)
        {
          v16 = v15;
LABEL_11:
          if (v19)
            *v19 = objc_retainAutorelease(v16);
          else
            _HKLogDroppedError();

          goto LABEL_15;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("No source for %@"), v11);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_11;
      }
LABEL_15:

      if (!v14)
      {
        v17 = 0;
        goto LABEL_20;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  v17 = 1;
LABEL_20:

  return v17;
}

- (id)clientSourceForPersistentID:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSourceManager clientSourcesForSourceIDs:error:](self, "clientSourcesForSourceIDs:error:", v8, a4, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_sourceForBundleIdentifier:(void *)a3 createSourceBlock:(void *)a4 modifySourceBlock:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  _QWORD aBlock[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = 0;
  if (a1 && v9)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__90;
    v31 = __Block_byref_object_dispose__90;
    v32 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke;
    aBlock[3] = &unk_1E6CF7E80;
    v26 = &v27;
    aBlock[4] = a1;
    v23 = v9;
    v13 = (unint64_t)v10;
    v24 = (id)v13;
    v14 = (unint64_t)v11;
    v25 = (id)v14;
    v15 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    v17 = WeakRetained;
    if (v13 | v14)
    {
      objc_msgSend(WeakRetained, "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v18, a5, v15);

      if (v19)
      {
LABEL_8:
        v12 = (id)v28[5];

        _Block_object_dispose(&v27, 8);
        goto LABEL_9;
      }
      v17 = (void *)v28[5];
      v28[5] = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a5, v15);

    }
    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

uint64_t __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  id v26;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke_2;
  v22[3] = &unk_1E6CF7E58;
  v23 = v7;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 32);
  v24 = v9;
  v25 = v10;
  v26 = *(id *)(a1 + 48);
  objc_msgSend(v8, "fetchObjectForKey:transaction:error:faultHandler:", v23, v5, a3, v22);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
    {
      if (((*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v17, v5, a3, v14, v15, v16) & 1) == 0)
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = 0;

      }
    }
  }

  return 1;
}

- (id)allSourcesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__90;
  v19 = __Block_byref_object_dispose__90;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HDSourceManager_allSourcesForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E6CEB640;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v14 = &v15;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLogicalSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v12);

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16[5]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

+ (uint64_t)_isLocalDeviceBundleIdentifier:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB7738]);

  return v3;
}

- (id)localDeviceSourceWithError:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__90;
  v15 = __Block_byref_object_dispose__90;
  v16 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__HDSourceManager_localDeviceSourceWithError___block_invoke;
  v10[3] = &unk_1E6CEF700;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v10);

  if ((_DWORD)a3)
    v7 = (void *)v12[5];
  else
    v7 = 0;
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __46__HDSourceManager_localDeviceSourceWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  +[HDSourceEntity sourceForLocalDeviceWithDatabase:error:](HDSourceEntity, "sourceForLocalDeviceWithDatabase:error:", v6, &v16);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v16;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_2;
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSourceEntityForLocalDeviceWithError:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

LABEL_2:
    v11 = 1;
    goto LABEL_3;
  }
  if (a3)
  {
    v11 = 0;
    *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    _HKLogDroppedError();
    v11 = 0;
  }
LABEL_3:

  return v11;
}

- (BOOL)updateCurrentDeviceNameWithError:(id *)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HDKeyValueDomain *v13;
  id v14;
  HDKeyValueDomain *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  HDSourceManager *v24;
  HDKeyValueDomain *v25;
  id v26;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = objc_msgSend(WeakRetained, "profileType");

  if (v7 == 2)
    return 1;
  v9 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentDeviceDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [HDKeyValueDomain alloc];
  v14 = objc_loadWeakRetained((id *)p_profile);
  v15 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v13, "initWithCategory:domainName:profile:", 0, CFSTR("source-manager"), v14);

  v26 = 0;
  -[HDKeyValueDomain stringForKey:error:](v15, "stringForKey:error:", CFSTR("HKSourceLastObservedDeviceName"), &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  v18 = v17;
  if (v16 || !v17)
  {
    if (v16 && (objc_msgSend(v12, "isEqualToString:", v16) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v19 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v19, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__HDSourceManager_updateCurrentDeviceNameWithError___block_invoke;
      v22[3] = &unk_1E6CEB3F8;
      v23 = v12;
      v24 = self;
      v25 = v15;
      v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v20, a3, v22);

    }
  }
  else if (a3)
  {
    v8 = 0;
    *a3 = objc_retainAutorelease(v17);
  }
  else
  {
    _HKLogDroppedError();
    v8 = 0;
  }

  return v8;
}

- (id)clientSourceForSourceEntity:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "persistentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSourceManager clientSourceForPersistentID:error:](self, "clientSourceForPersistentID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__HDSourceManager_clientSourcesForSourceIDs_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  _BYTE v15[24];
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    +[HDSQLiteEntity entityWithPersistentID:](HDSourceEntity, "entityWithPersistentID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
      objc_msgSend(v5, "sourceWithProfile:error:", WeakRetained, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "_isApplication") & 1) != 0 || (objc_msgSend(v7, "_isConnectedGymSource") & 1) != 0)
      {
        v8 = 0;
        if (!v7)
          goto LABEL_16;
LABEL_9:
        if ((v8 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB6C18], "hd_getNameForSource:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            objc_msgSend(v7, "name");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isEqualToString:", v9);

            if ((v11 & 1) == 0)
            {
              _HKInitializeLogging();
              v12 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v15 = 138412546;
                *(_QWORD *)&v15[4] = v9;
                *(_WORD *)&v15[12] = 2112;
                *(_QWORD *)&v15[14] = v7;
                _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Updating name to \"%@\" for source %@", v15, 0x16u);
              }
              objc_msgSend(v7, "_setName:", v9);
              v13 = *(NSObject **)(v3 + 16);
              *(_QWORD *)v15 = MEMORY[0x1E0C809B0];
              *(_QWORD *)&v15[8] = 3221225472;
              *(_QWORD *)&v15[16] = __59__HDSourceManager__fetchClientSourceForPersistentID_error___block_invoke;
              v16 = &unk_1E6CECCA8;
              v17 = v5;
              v18 = v9;
              v19 = v3;
              v20 = v7;
              dispatch_async(v13, v15);

            }
          }

        }
        goto LABEL_16;
      }
      v8 = objc_msgSend(v7, "_isResearchStudy") ^ 1;
      if (v7)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 118, CFSTR("No source entity for specified persistent ID."));
      v7 = 0;
    }
LABEL_16:

    return v7;
  }
  return 0;
}

id __88__HDSourceManager__sourceForBundleIdentifier_createSourceBlock_modifySourceBlock_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, *(void **)(a1 + 32)))+[HDSourceEntity sourceForLocalDeviceWithDatabase:error:](HDSourceEntity, "sourceForLocalDeviceWithDatabase:error:", *(_QWORD *)(a1 + 40), a3);
  else
    objc_msgSend(*(id *)(a1 + 48), "localSourceForBundleIdentifier:error:", *(_QWORD *)(a1 + 32), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v5, a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (HDSourceManager)initWithProfile:(id)a3
{
  id v5;
  HDSourceManager *v6;
  HDSourceManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  HDDatabaseValueCache *v10;
  void *v11;
  uint64_t v12;
  HDDatabaseValueCache *sourceEntityByBundleIdentifierCache;
  HDDatabaseValueCache *v14;
  void *v15;
  uint64_t v16;
  HDDatabaseValueCache *clientSourceCache;
  HDDatabaseValueCache *v18;
  void *v19;
  uint64_t v20;
  HDDatabaseValueCache *localSourceForBundleIdentifierCache;
  HDDatabaseValueCache *v22;
  void *v23;
  uint64_t v24;
  HDDatabaseValueCache *localSourceForSourceID;
  void *v26;
  id WeakRetained;
  void *v29;
  objc_super v30;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v30.receiver = self;
  v30.super_class = (Class)HDSourceManager;
  v6 = -[HDSourceManager init](&v30, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = [HDDatabaseValueCache alloc];
    -[HDSourceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("entities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HDDatabaseValueCache initWithName:cacheScope:](v10, "initWithName:cacheScope:", v11, 2);
    sourceEntityByBundleIdentifierCache = v7->_sourceEntityByBundleIdentifierCache;
    v7->_sourceEntityByBundleIdentifierCache = (HDDatabaseValueCache *)v12;

    v14 = [HDDatabaseValueCache alloc];
    -[HDSourceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("client-sources"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDDatabaseValueCache initWithName:cacheScope:](v14, "initWithName:cacheScope:", v15, 2);
    clientSourceCache = v7->_clientSourceCache;
    v7->_clientSourceCache = (HDDatabaseValueCache *)v16;

    v18 = [HDDatabaseValueCache alloc];
    -[HDSourceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("local-entities"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDDatabaseValueCache initWithName:cacheScope:](v18, "initWithName:cacheScope:", v19, 2);
    localSourceForBundleIdentifierCache = v7->_localSourceForBundleIdentifierCache;
    v7->_localSourceForBundleIdentifierCache = (HDDatabaseValueCache *)v20;

    v22 = [HDDatabaseValueCache alloc];
    -[HDSourceManager hk_classNameWithTag:](v7, "hk_classNameWithTag:", CFSTR("local-entities-by-id"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDDatabaseValueCache initWithName:cacheScope:](v22, "initWithName:cacheScope:", v23, 1);
    localSourceForSourceID = v7->_localSourceForSourceID;
    v7->_localSourceForSourceID = (HDDatabaseValueCache *)v24;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v7, sel__applicationsUninstalledNotification_, CFSTR("HDHealthDaemonApplicationsUninstalledNotification"), 0);

    WeakRetained = objc_loadWeakRetained((id *)&v7->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v7, v7->_queue);

  }
  return v7;
}

- (HDSourceManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use the designated initializer"));

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDSourceManager;
  -[HDSourceManager dealloc](&v4, sel_dealloc);
}

uint64_t __52__HDSourceManager_updateCurrentDeviceNameWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v17;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[HDSourceEntity sourceForLocalDeviceWithDatabase:error:](HDSourceEntity, "sourceForLocalDeviceWithDatabase:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (!v7)
  {
    v15 = v8;
    v13 = v15;
    if (v15)
    {
      if (a3)
      {
        v13 = objc_retainAutorelease(v15);
        v12 = 0;
        *a3 = v13;
      }
      else
      {
        _HKLogDroppedError();
        v12 = 0;
      }
      goto LABEL_11;
    }
LABEL_8:
    v12 = 1;
LABEL_11:

    goto LABEL_12;
  }
  v10 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v12 = objc_msgSend(v7, "setName:profile:error:", v10, WeakRetained, a3);

  if ((_DWORD)v12)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "setString:forKey:error:", *(_QWORD *)(a1 + 32), CFSTR("HKSourceLastObservedDeviceName"), a3))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeAllObjectsWithTransaction:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeAllObjectsWithTransaction:", v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeAllObjectsWithTransaction:", v5);
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend(v13, "sourceOrderManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resetCacheWithTransaction:", v5);

      goto LABEL_8;
    }
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (BOOL)setLocalDeviceSourceUUID:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  HDSourceManager *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID != nil"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke;
  v20[3] = &unk_1E6CEB3F8;
  v21 = v9;
  v22 = self;
  v23 = v11;
  v14 = v11;
  v15 = v9;
  v16 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v20);

  return v16;
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD aBlock[6];

  v5 = a2;
  HDSourceEntityPredicateForSourceWithUUID(*(void **)(a1 + 32), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  +[HDSourceEntity sourcesWithPredicate:includeDeleted:profile:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:profile:error:", v6, 1, WeakRetained, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeAllObjectsWithTransaction:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeAllObjectsWithTransaction:", v5);
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v9, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDeviceProductType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v12, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "behavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentDeviceDisplayName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:", *(_QWORD *)(a1 + 48), 0, v5, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:transaction:", v19, v5);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "persistentID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
      v23 = v21;
      v25 = v32;
      v24 = v33;
      v26 = objc_msgSend(v17, "adoptAsLocalSourceWithLogicalSourceID:UUID:name:productType:profile:error:", v20, v23, v32, v33, v22, a3);

    }
    else
    {
      v27 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_2;
      aBlock[3] = &unk_1E6CF7CF0;
      aBlock[4] = *(_QWORD *)(a1 + 40);
      v31 = _Block_copy(aBlock);
      v34[0] = v27;
      v34[1] = 3221225472;
      v34[2] = __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_3;
      v34[3] = &unk_1E6CF7D18;
      v34[4] = *(_QWORD *)(a1 + 40);
      v35 = v15;
      v36 = *(id *)(a1 + 32);
      v25 = v32;
      v37 = v32;
      v24 = v33;
      v38 = v33;
      v28 = _Block_copy(v34);
      -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:](*(_QWORD *)(a1 + 40), (void *)*MEMORY[0x1E0CB7738], v31, v28, a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v29 != 0;

    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSourceEntityForLocalDeviceWithError:");
}

uint64_t __67__HDSourceManager_setLocalDeviceSourceUUID_bundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  uint64_t v17;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:transaction:", v11, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v17 = objc_msgSend(v10, "adoptAsLocalSourceWithLogicalSourceID:UUID:name:productType:profile:error:", v12, v13, v14, v15, WeakRetained, a4);

  return v17;
}

BOOL __55__HDSourceManager_allSourcesForBundleIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  if (v5)
  {
    if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, v6))
      HDSourceEntityPredicateForLocalDeviceSource();
    else
      HDSourceEntityPredicateForSourceWithBundleIdentifier((uint64_t)v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  +[HDSourceEntity sourcesWithPredicate:includeDeleted:profile:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:profile:error:", v5, 0, WeakRetained, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
  return v11;
}

- (id)localSourceForBundleIdentifier:(id)a3 error:(id *)a4
{
  return -[HDSourceManager localSourceForBundleIdentifier:copyIfNecessary:error:](self, "localSourceForBundleIdentifier:copyIfNecessary:error:", a3, 0, a4);
}

- (id)localSourceForBundleIdentifier:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  BOOL (*v22)(uint64_t, uint64_t, _QWORD *);
  void *v23;
  HDSourceManager *v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a4;
  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__90;
  v32 = __Block_byref_object_dispose__90;
  v33 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke;
  v23 = &unk_1E6CF7D68;
  v26 = &v28;
  v24 = self;
  v9 = v8;
  v25 = v9;
  v27 = v6;
  v10 = _Block_copy(&v20);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = WeakRetained;
  if (!v6)
  {
    objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v16, a5, v10);

    if (!v17)
      goto LABEL_3;
LABEL_5:
    v15 = (void *)v29[5];
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v10);

  if (v14)
    goto LABEL_5;
LABEL_3:
  v15 = 0;
LABEL_6:
  v18 = v15;

  _Block_object_dispose(&v28, 8);
  return v18;
}

BOOL __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  char v20;
  id v21;

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke_2;
  v17[3] = &unk_1E6CF7D40;
  v8 = v6;
  v20 = *(_BYTE *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v19 = v9;
  objc_msgSend(v7, "fetchObjectForKey:transaction:error:faultHandler:", v8, a2, &v21, v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v14 = 1;
  }
  else
  {
    v15 = v11;
    v14 = v15 == 0;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  return v14;
}

id __72__HDSourceManager_localSourceForBundleIdentifier_copyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, unint64_t *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id *v32;
  void *v33;
  id v34;
  id v35;
  id v36;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v36 = 0;
  +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "logicalSourceIDForBundleIdentifier:transaction:error:", v6, v5, &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;
  v9 = v8;
  if (!v7)
  {
    v13 = (unint64_t)v8;
    if (!v13)
    {
LABEL_21:

      goto LABEL_22;
    }
    if (!a3)
    {
LABEL_20:
      _HKLogDroppedError();
      goto LABEL_21;
    }
LABEL_10:
    v13 = (unint64_t)objc_retainAutorelease((id)v13);
    *a3 = v13;
    goto LABEL_21;
  }
  v10 = *MEMORY[0x1E0CB7738];
  v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CB7738]);
  v35 = v9;
  +[HDSourceEntity sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:](HDSourceEntity, "sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:", v7, v11, 1, v5, &v35);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (unint64_t)v35;

  if (!(v12 | v13))
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      v13 = 0;
      goto LABEL_22;
    }
    v14 = *(void **)(a1 + 32);
    v15 = *(id **)(a1 + 40);
    v16 = v15 + 1;
    v34 = 0;
    v17 = objc_loadWeakRetained(v15 + 1);
    v32 = v15;
    v33 = v17;
    if (v15)
    {
      v18 = v17;
      v19 = v5;
      v20 = v7;
      +[HDSourceEntity sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:](HDSourceEntity, "sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:", v20, objc_msgSend(v14, "isEqualToString:", v10), 0, v19, &v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        WeakRetained = objc_loadWeakRetained(v16);
        objc_msgSend(v21, "codableSourceWithProfile:error:", WeakRetained, &v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v18, "syncIdentityManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "currentSyncIdentity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "codableSyncIdentity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setSyncIdentity:", v27);

          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "hk_dataForUUIDBytes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setUuid:", v29);

          v30 = objc_loadWeakRetained(v16);
          objc_msgSend(v32, "insertCodableSource:provenance:profile:error:", v23, 0, v30, &v34);
          v12 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

    v13 = (unint64_t)v34;
  }
  if (!v12)
  {
    v13 = (unint64_t)(id)v13;
    if (v13)
    {
      if (!a3)
        goto LABEL_20;
      goto LABEL_10;
    }
LABEL_22:
    v12 = 0;
  }

  return (id)v12;
}

- (id)insertCodableSource:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "decodedUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (objc_msgSend(v9, "hasOptions"))
      v12 = objc_msgSend(v9, "options");
    else
      v12 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__90;
    v29 = __Block_byref_object_dispose__90;
    v30 = 0;
    objc_msgSend(v10, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__HDSourceManager_insertCodableSource_provenance_profile_error___block_invoke;
    v18[3] = &unk_1E6CF7068;
    v19 = v9;
    v20 = v10;
    v22 = &v25;
    v21 = v11;
    v23 = v12;
    v24 = a4;
    v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v14, a6, v18);

    if (v15)
      v16 = (void *)v26[5];
    else
      v16 = 0;
    v13 = v16;

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a6, 3, CFSTR("missing source UUID during decoding"));
    v13 = 0;
  }

  return v13;
}

BOOL __64__HDSourceManager_insertCodableSource_provenance_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  NSObject *v35;
  id v36;
  _QWORD *v37;
  id v38;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  id v49;
  void *v50;
  _QWORD *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "deleted") & 1) != 0)
  {
    v6 = &stru_1E6D11BB8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "deleted") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "owningAppBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:", v6, v7, v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "legacySyncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(a1 + 32), "hasSyncIdentity"))
  {
    v49 = v5;
    v51 = a3;
    v47 = v7;
    v48 = v6;
    v52 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v12, &v54);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v54;

  if (!v13)
  {
    v50 = 0;
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB52B0];
    v32 = v11;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v14;
      _os_log_fault_impl(&dword_1B7802000, v35, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
    }
    v36 = v14;
    v34 = v36;
    if (!v36)
    {
      v27 = v8;
      goto LABEL_29;
    }
    if (!a3)
    {
      v27 = v8;
      _HKLogDroppedError();
      goto LABEL_29;
    }
    v37 = a3;
    v27 = v8;
    v38 = objc_retainAutorelease(v36);
    v34 = v38;
LABEL_23:
    *v37 = v38;
LABEL_29:

    v33 = 0;
    goto LABEL_30;
  }
  v51 = a3;
  objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v14;
  objc_msgSend(v15, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v13, 1, v5, &v53);
  v16 = (void *)v13;
  v17 = objc_claimAutoreleasedReturnValue();
  v52 = v53;

  if (!v17)
  {
    v50 = v16;
    v39 = v7;
    _HKInitializeLogging();
    v40 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v52;
      _os_log_fault_impl(&dword_1B7802000, v40, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
    }
    v41 = v52;
    v34 = v41;
    v7 = v39;
    if (v41)
    {
      if (v51)
      {
        v37 = v51;
        v27 = v8;
        v38 = objc_retainAutorelease(v41);
        v34 = v38;
        v32 = 0;
        goto LABEL_23;
      }
      v27 = v8;
      _HKLogDroppedError();
    }
    else
    {
      v27 = v8;
    }
    v32 = 0;
    goto LABEL_29;
  }
  v47 = v7;
  v48 = v6;
  v49 = v5;

  v10 = (void *)v17;
LABEL_12:
  v46 = *(_QWORD *)(a1 + 48);
  v45 = objc_msgSend(v8, "persistentID");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "productType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(*(id *)(a1 + 32), "deleted");
  objc_msgSend(*(id *)(a1 + 32), "decodedModificationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v10, "entity");
  v24 = v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "persistentID");
  v44 = v23;
  v27 = v8;
  LOBYTE(v43) = v21;
  v28 = v19;
  v5 = v49;
  +[HDSourceEntity insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:](HDSourceEntity, "insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:", v46, v45, v18, v28, 0, v20, v43, v22, v44, v26, v49, v51);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  v32 = v24;
  v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
  v7 = v47;
  v6 = v48;
  v34 = v52;
LABEL_30:

  return v33;
}

- (id)localSourceForSourceID:(id)a3 copyIfNecessary:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  BOOL (*v22)(uint64_t, uint64_t, _QWORD *);
  void *v23;
  HDSourceManager *v24;
  id v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a4;
  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__90;
  v32 = __Block_byref_object_dispose__90;
  v33 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke;
  v23 = &unk_1E6CF7D68;
  v26 = &v28;
  v24 = self;
  v9 = v8;
  v25 = v9;
  v27 = v6;
  v10 = _Block_copy(&v20);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v12 = WeakRetained;
  if (!v6)
  {
    objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v16, a5, v10);

    if (!v17)
      goto LABEL_3;
LABEL_5:
    v15 = (void *)v29[5];
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "database", v20, v21, v22, v23, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a5, v10);

  if (v14)
    goto LABEL_5;
LABEL_3:
  v15 = 0;
LABEL_6:
  v18 = v15;

  _Block_object_dispose(&v28, 8);
  return v18;
}

BOOL __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  char v20;
  id v21;

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke_2;
  v17[3] = &unk_1E6CF7D40;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v19 = v9;
  v20 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v7, "fetchObjectForKey:transaction:error:faultHandler:", v8, a2, &v21, v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v14 = 1;
  }
  else
  {
    v15 = v11;
    v14 = v15 == 0;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  return v14;
}

id __64__HDSourceManager_localSourceForSourceID_copyIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  HDSourceEntity *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSourceEntity sourceBundleIdentifierInDatabase:error:](v6, "sourceBundleIdentifierInDatabase:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "localSourceForBundleIdentifier:copyIfNecessary:error:", v8, *(unsigned __int8 *)(a1 + 48), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)privateSourceForClinicalAccountIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7
{
  _BOOL4 v8;
  void *v11;
  void *v12;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB6C18], "_privateSourceForClinicalAccountIdentifier:name:", a3, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSourceManager _sourceFromEphemeralSource:provenance:createOrUpdateIfNecessary:error:]((uint64_t)self, v11, a4, v8, (uint64_t)a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_sourceFromEphemeralSource:(uint64_t)a3 provenance:(int)a4 createOrUpdateIfNecessary:(uint64_t)a5 error:
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD aBlock[5];
  id v24;
  uint64_t v25;

  v9 = a2;
  v10 = v9;
  if (a1)
  {
    if (a4)
    {
      objc_msgSend(v9, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error_, a1, CFSTR("HDSourceManager.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source.name"));

      }
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke;
      aBlock[3] = &unk_1E6CF7D90;
      aBlock[4] = a1;
      v13 = v10;
      v24 = v13;
      v25 = a3;
      v14 = _Block_copy(aBlock);
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke_2;
      v20[3] = &unk_1E6CF7DB8;
      v21 = v13;
      v22 = a1;
      v15 = _Block_copy(v20);

    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
    objc_msgSend(v10, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:](a1, v16, v14, v15, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)publicSourceForClinicalExternalIdentifier:(id)a3 provenance:(int64_t)a4 createOrUpdateIfNecessary:(BOOL)a5 nameOnCreateOrUpdate:(id)a6 error:(id *)a7
{
  _BOOL4 v8;
  void *v11;
  void *v12;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB6C18], "_publicSourceForClinicalExternalIdentifier:name:", a3, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSourceManager _sourceFromEphemeralSource:provenance:createOrUpdateIfNecessary:error:]((uint64_t)self, v11, a4, v8, (uint64_t)a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_owningAppBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "_options");
  objc_msgSend(*(id *)(a1 + 40), "_productType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSourceWithBundleIdentifier:owningAppBundleIdentifier:UUID:name:options:isCurrentDevice:productType:modificationDate:provenance:error:", v6, v7, v8, v9, v10, 0, v11, v12, *(_QWORD *)(a1 + 48), a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __89__HDSourceManager__sourceFromEphemeralSource_provenance_createOrUpdateIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v11 = objc_msgSend(v7, "setName:profile:error:", v9, WeakRetained, a4);

  if ((_DWORD)v11)
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:transaction:", v13, v8);

  }
  return v11;
}

- (id)sourceForClient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "sourceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB6C18], "hd_sourceForClient:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSourceManager sourceEntityForClientSource:createOrUpdateIfNecessary:error:](self, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", v8, 0, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 4, CFSTR("Missing application-identifier entitlement"));
    v9 = 0;
  }

  return v9;
}

- (id)createOrUpdateSourceForClient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v6 = a3;
  objc_msgSend(v6, "sourceBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB6C18], "hd_sourceForClient:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[HDSourceManager sourceEntityForClientSource:createOrUpdateIfNecessary:error:](self, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", v8, 1, &v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (uint64_t)v12;

    if (!(v9 | v10))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to create source for client %@"), v7);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    if (a4)
      *a4 = objc_retainAutorelease((id)v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 4, CFSTR("Missing application-identifier entitlement"));
    v9 = 0;
  }

  return (id)v9;
}

- (id)sourceForApplicationIdentifier:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 entitlements:(id)a5 name:(id)a6 error:(id *)a7
{
  _BOOL8 v8;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB6C18], "_sourceWithBundleIdentifier:defaultBundleIdentifier:appEntitlements:name:", a3, a3, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSourceManager sourceEntityForClientSource:createOrUpdateIfNecessary:error:](self, "sourceEntityForClientSource:createOrUpdateIfNecessary:error:", v10, v8, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sourceEntityForClientSource:(id)a3 createOrUpdateIfNecessary:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  HDSourceManager *v20;
  _QWORD aBlock[4];
  id v22;
  HDSourceManager *v23;
  id v24;

  v6 = a4;
  v9 = a3;
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

    if (v6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v14 = 0;
    goto LABEL_6;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke;
  aBlock[3] = &unk_1E6CF7DE0;
  v22 = v10;
  v23 = self;
  v12 = v9;
  v24 = v12;
  v13 = _Block_copy(aBlock);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke_2;
  v18[3] = &unk_1E6CF7DB8;
  v19 = v12;
  v20 = self;
  v14 = _Block_copy(v18);

LABEL_6:
  -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:]((uint64_t)self, v10, v13, v14, (uint64_t)a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke(void **a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  if (+[HDSourceManager _isLocalDeviceBundleIdentifier:]((uint64_t)HDSourceManager, a1[4]))
  {
    objc_msgSend(a1[5], "_createSourceEntityForLocalDeviceWithError:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x1E0CB6C18], "hd_isSpartanDeviceBundleIdentifier:", a1[4]))
  {
    v6 = a1[5];
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB6C18], "_connectedGymSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_owningAppBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "_options");
      objc_msgSend(v7, "_productType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](v6, v8, v9, v10, v11, 0, v12, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(a1[6], "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB6C18], "hd_getNameForSource:", a1[6]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = a1[4];
    v14 = a1[5];
    objc_msgSend(a1[6], "_owningAppBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1[6], "_options");
    v18 = objc_msgSend(a1[6], "_isLocalDevice");
    objc_msgSend(a1[6], "_productType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](v14, v15, v16, v13, v17, v18, v19, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_createSourceEntityForBundleIdentifier:(void *)a3 owningAppBundleIdentifier:(void *)a4 name:(uint64_t)a5 options:(uint64_t)a6 isCurrentDevice:(void *)a7 productType:(uint64_t)a8 error:
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  if (a1)
  {
    v15 = (void *)MEMORY[0x1E0CB3A28];
    v16 = a7;
    v17 = a4;
    v18 = a3;
    v19 = a2;
    objc_msgSend(v15, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertSourceWithBundleIdentifier:owningAppBundleIdentifier:UUID:name:options:isCurrentDevice:productType:modificationDate:provenance:error:", v19, v18, v20, v17, a5, a6, v16, v21, 0, a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  return v22;
}

uint64_t __79__HDSourceManager_sourceEntityForClientSource_createOrUpdateIfNecessary_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  char v16;

  v7 = a2;
  v8 = a3;
  v16 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_options");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v11 = objc_msgSend(v7, "setOptions:profile:didUpdate:error:", v9, WeakRetained, &v16, a4);

  if ((_DWORD)v11)
    v12 = v16 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:transaction:", v14, v8);

  }
  return v11;
}

- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 createIfNecessary:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD aBlock[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__HDSourceManager_sourceForAppleDeviceWithUUID_identifier_name_productType_createIfNecessary_error___block_invoke;
    aBlock[3] = &unk_1E6CF7E08;
    aBlock[4] = self;
    v22 = v15;
    v23 = v14;
    v24 = v16;
    v25 = v17;
    v18 = _Block_copy(aBlock);

  }
  else
  {
    v18 = 0;
  }
  -[HDSourceManager _sourceForBundleIdentifier:createSourceBlock:modifySourceBlock:error:]((uint64_t)self, v15, v18, 0, (uint64_t)a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __100__HDSourceManager_sourceForAppleDeviceWithUUID_identifier_name_productType_createIfNecessary_error___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v9 = HKSourceOptionsForAppleDevice();
  v10 = a1[8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v5, "insertSourceWithBundleIdentifier:owningAppBundleIdentifier:UUID:name:options:isCurrentDevice:productType:modificationDate:provenance:error:", v6, 0, v7, v8, v9, 0, v10, v11, 0, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (!v12)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v17 = a1[5];
      v18 = a1[6];
      *(_DWORD *)buf = 138412802;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2114;
      v25 = v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to insert local source for %@ %@: %{public}@", buf, 0x20u);
    }
    v15 = v13;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  return v12;
}

- (id)sourceForCodableSource:(id)a3 provenance:(int64_t)a4 createIfNecessary:(BOOL)a5 isDeleted:(BOOL *)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  _QWORD aBlock[4];
  id v20;
  HDSourceManager *v21;
  id v22;
  uint64_t *v23;
  BOOL *v24;
  int64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a5;
  v12 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__90;
  v31 = __Block_byref_object_dispose__90;
  v32 = 0;
  objc_msgSend(v12, "decodedUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HDSourceManager_sourceForCodableSource_provenance_createIfNecessary_isDeleted_error___block_invoke;
    aBlock[3] = &unk_1E6CF7E30;
    v23 = &v27;
    v24 = a6;
    v26 = v9;
    v20 = v13;
    v21 = self;
    v22 = v12;
    v25 = a4;
    v16 = _Block_copy(aBlock);
    if (v9)
      +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v15, a7, v16);
    else
      +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a7, v16);
    v17 = (id)v28[5];

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v27, 8);
  return v17;
}

BOOL __87__HDSourceManager_sourceForCodableSource_provenance_createIfNecessary_isDeleted_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HDSourceEntityPredicateForSourceWithUUID(*(void **)(a1 + 32), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  +[HDSourceEntity firstSourceWithPredicate:database:error:](HDSourceEntity, "firstSourceWithPredicate:database:error:", v7, v6, &v23);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v23;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    if (*(_QWORD *)(a1 + 64))
      **(_BYTE **)(a1 + 64) = objc_msgSend(v12, "BOOLeanForProperty:database:", CFSTR("deleted"), v6);
    goto LABEL_4;
  }
  v13 = v9 == 0;
  if (v9)
  {
    v14 = v9;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
    else
      _HKLogDroppedError();
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 80))
  {
LABEL_13:

    goto LABEL_14;
  }
  v15 = *(id **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained(v15 + 1);
  objc_msgSend(v15, "insertCodableSource:provenance:profile:error:", v16, v17, WeakRetained, a3);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v13 = 0;
    goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    **(_BYTE **)(a1 + 64) = objc_msgSend(*(id *)(a1 + 48), "deleted");
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
    goto LABEL_14;
  }
LABEL_4:
  v13 = 1;
LABEL_14:

  return v13;
}

- (id)clientSourceForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id WeakRetained;
  void *v15;
  _BOOL4 v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  id v26;

  v6 = a3;
  v26 = 0;
  -[HDSourceManager localSourceForBundleIdentifier:error:](self, "localSourceForBundleIdentifier:error:", v6, &v26);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  v9 = v8;
  if (v7)
    goto LABEL_2;
  if (!v8)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__90;
    v24 = __Block_byref_object_dispose__90;
    v25 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__HDSourceManager_clientSourceForBundleIdentifier_error___block_invoke;
    v17[3] = &unk_1E6CE8D70;
    v18 = v6;
    v19 = &v20;
    v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a4, v17);

    if (v16)
      v7 = (id)v21[5];
    else
      v7 = 0;

    _Block_object_dispose(&v20, 8);
    if (!v7)
    {
      v11 = 0;
      goto LABEL_3;
    }
LABEL_2:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSourceManager clientSourceForPersistentID:error:](self, "clientSourceForPersistentID:error:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
    v12 = v11;

    goto LABEL_4;
  }
  if (a4)
  {
    v12 = 0;
    *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    _HKLogDroppedError();
    v12 = 0;
  }
LABEL_4:

  return v12;
}

uint64_t __57__HDSourceManager_clientSourceForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  +[HDLogicalSourceEntity logicalSourceIDForBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "logicalSourceIDForBundleIdentifier:transaction:error:", v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSourceEntity sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:](HDSourceEntity, "sourceForLogicalSourceID:localDeviceBundleIdentifier:localOnly:transaction:error:", v7, objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CB7738]), 0, v6, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return 1;
}

- (id)uncachedClientSourceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  HDSourceEntity *v10;
  id WeakRetained;

  v8 = a3;
  -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](self->_clientSourceCache, "fetchObjectForKey:transaction:error:faultHandler:", v8, a4, a5, &__block_literal_global_95);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", objc_msgSend(v8, "longLongValue"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    -[HDSourceEntity sourceWithProfile:error:](v10, "sourceWithProfile:error:", WeakRetained, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __73__HDSourceManager_uncachedClientSourceForPersistentID_transaction_error___block_invoke()
{
  return 0;
}

- (id)clientSourceForSourceEntities:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSourceManager clientSourceForPersistentID:error:](self, "clientSourceForPersistentID:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sourceUUIDForBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  id WeakRetained;
  void *v8;

  -[HDSourceManager localSourceForBundleIdentifier:error:](self, "localSourceForBundleIdentifier:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v6, "sourceUUIDWithProfile:error:", WeakRetained, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)clientSourceForUUID:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  HDProfile **p_profile;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceUUID != nil"));

  }
  HDSourceEntityPredicateForSourceWithUUID(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDSourceEntity firstSourceWithPredicate:profile:error:](HDSourceEntity, "firstSourceWithPredicate:profile:error:", v8, WeakRetained, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v11, "sourceWithProfile:error:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_clientSourcesWithPredicate:(uint64_t)a3 error:
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  if (a1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke;
    v13[3] = &unk_1E6CEB3F8;
    v14 = v5;
    v15 = a1;
    v9 = v6;
    v16 = v9;
    v10 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a3, v13);

    if (v10)
      v11 = (void *)objc_msgSend(v9, "copy");
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)allWatchSourcesWithError:(id *)a3
{
  void *v5;
  void *v6;

  HDSourceEntityPredicateForAppleWatchSources();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke_2;
  v10[3] = &unk_1E6CF7F10;
  v7 = *(_QWORD *)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v8 = +[HDSourceEntity enumerateBundleIdentifiersForSourcesWithPredicate:database:error:enumerationHandler:](HDSourceEntity, "enumerateBundleIdentifiersForSourcesWithPredicate:database:error:enumerationHandler:", v7, v6, a3, v10);

  return v8;
}

BOOL __53__HDSourceManager__clientSourcesWithPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "clientSourceForBundleIdentifier:error:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  return v4 != 0;
}

- (void)profileDidBecomeReady:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0;
  v4 = -[HDSourceManager updateCurrentDeviceNameWithError:](self, "updateCurrentDeviceNameWithError:", &v10);
  v5 = v10;
  if (!v4)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "profileIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Current device source name update failed for profile with identifier %{public}@: %{public}@", buf, 0x16u);

    }
  }

}

- (id)insertSourceWithBundleIdentifier:(id)a3 owningAppBundleIdentifier:(id)a4 UUID:(id)a5 name:(id)a6 options:(unint64_t)a7 isCurrentDevice:(BOOL)a8 productType:(id)a9 modificationDate:(id)a10 provenance:(int64_t)a11 error:(id *)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id WeakRetained;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v32;
  _QWORD v35[4];
  id v36;
  id v37;
  HDSourceManager *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  unint64_t v44;
  int64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__90;
  v51 = __Block_byref_object_dispose__90;
  v52 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __158__HDSourceManager_insertSourceWithBundleIdentifier_owningAppBundleIdentifier_UUID_name_options_isCurrentDevice_productType_modificationDate_provenance_error___block_invoke;
  v35[3] = &unk_1E6CF7F38;
  v32 = v16;
  v36 = v32;
  v24 = v17;
  v37 = v24;
  v38 = self;
  v43 = &v47;
  v25 = v18;
  v39 = v25;
  v26 = v19;
  v40 = v26;
  v44 = a7;
  v46 = a8;
  v27 = v20;
  v41 = v27;
  v28 = v21;
  v42 = v28;
  v45 = a11;
  LODWORD(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDLogicalSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v23, a12, v35);

  if ((_DWORD)a6)
    v29 = (void *)v48[5];
  else
    v29 = 0;
  v30 = v29;

  _Block_object_dispose(&v47, 8);
  return v30;
}

BOOL __158__HDSourceManager_insertSourceWithBundleIdentifier_owningAppBundleIdentifier_UUID_name_options_isCurrentDevice_productType_modificationDate_provenance_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v17;

  v5 = a2;
  +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(WeakRetained, "syncIdentityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSyncIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "persistentID");

    LOBYTE(v17) = 0;
    +[HDSourceEntity insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:](HDSourceEntity, "insertSourceWithUUID:logicalSourceID:name:options:isCurrentDevice:productType:deleted:modificationDate:provenance:syncIdentity:transaction:error:", *(_QWORD *)(a1 + 56), objc_msgSend(v6, "persistentID"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), *(unsigned __int8 *)(a1 + 112), *(_QWORD *)(a1 + 72), v17, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 104), v11, v5, a3);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) != 0;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)createSourcesWithCodables:(id)a3 provenance:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  HDSourceManager *v18;
  id v19;
  int64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  int64_t v24;

  v8 = a3;
  objc_msgSend(v8, "hk_mapToSet:", &__block_literal_global_250);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_2;
  v21[3] = &unk_1E6CE7C58;
  v21[4] = self;
  v22 = v8;
  v24 = a4;
  v23 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_3;
  v16[3] = &unk_1E6CF7FA0;
  v17 = v23;
  v18 = self;
  v19 = v22;
  v20 = a4;
  v13 = v22;
  v14 = v23;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDSampleEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v11, a5, v21, v16);

  return (char)a5;
}

id __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "deleted"))
  {
    objc_msgSend(v2, "decodedUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDSourceManager _createSourcesWithCodables:provenance:sourceUUIDSToDelete:deleteSamples:transaction:error:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48), 1u, a2, a3);
}

- (uint64_t)_createSourcesWithCodables:(uint64_t)a3 provenance:(void *)a4 sourceUUIDSToDelete:(unsigned int)a5 deleteSamples:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  char v18;
  void *v19;
  uint64_t v20;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v23 = a4;
  v12 = a6;
  v24 = v11;
  if (a1)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v25 = v12;
          v18 = HKWithAutoreleasePool();

          if ((v18 & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v15)
          continue;
        break;
      }
    }

    v19 = v23;
    v20 = objc_msgSend(a1, "_deleteSourcesWithUUIDs:localSourceEntityCacheKey:syncIdentity:deleteSamples:transaction:error:", v23, 0, 0, a5, v12, a7);
  }
  else
  {
LABEL_12:
    v20 = 0;
    v19 = v23;
  }

  return v20;
}

BOOL __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _HDDeleteSourcesWithUUIDsEntry *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _BOOL8 v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    goto LABEL_3;
  v5 = -[_HDDeleteSourcesWithUUIDsEntry initWithUUIDs:bundleIdentifier:]([_HDDeleteSourcesWithUUIDsEntry alloc], "initWithUUIDs:bundleIdentifier:", *(_QWORD *)(a1 + 32), 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "addJournalEntry:error:", v5, a3);

  if (!v8)
    return 0;
LABEL_3:
  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_4;
  v16[3] = &unk_1E6CE7C58;
  v11 = *(void **)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 40);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 56);
  v17 = v12;
  v19 = v13;
  v18 = *(id *)(a1 + 32);
  v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v10, a3, v16);

  return v14;
}

uint64_t __62__HDSourceManager_createSourcesWithCodables_provenance_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDSourceManager _createSourcesWithCodables:provenance:sourceUUIDSToDelete:deleteSamples:transaction:error:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48), 0, a2, a3);
}

uint64_t __109__HDSourceManager__createSourcesWithCodables_provenance_sourceUUIDSToDelete_deleteSamples_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "decodedUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  HDSourceEntityPredicateForSourceWithUUID(v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "databaseForEntityClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSourceEntity firstSourceWithPredicate:database:error:](HDSourceEntity, "firstSourceWithPredicate:database:error:", v6, v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "sourceForCodableSource:provenance:createIfNecessary:isDeleted:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 1, 0, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = 138543618;
        v13 = v4;
        v14 = 2112;
        v15 = v11;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Failed to create source %{public}@ with codable source %@", (uint8_t *)&v12, 0x16u);
      }
      v8 = 0;
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)deleteSourceWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceManager.m"), 1091, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke;
  v17[3] = &unk_1E6CE7950;
  v17[4] = self;
  v18 = v7;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_2;
  v15[3] = &unk_1E6CECEC8;
  v15[4] = self;
  v16 = v18;
  v11 = v18;
  v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDSampleEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v9, a4, v17, v15);

  return v12;
}

uint64_t __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  -[HDSourceManager _sourceUUIDsForBundleIdentifier:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = *(id **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v8 + 1);
    objc_msgSend(WeakRetained, "syncIdentityManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentSyncIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "_deleteSourcesWithUUIDs:localSourceEntityCacheKey:syncIdentity:deleteSamples:transaction:error:", v6, v7, v11, 1, v5, a3);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_sourceUUIDsForBundleIdentifier:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_18;
  }
  objc_msgSend(a1, "allSourcesForBundleIdentifier:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v20 = v5;
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        v13 = a1 + 1;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
            WeakRetained = objc_loadWeakRetained(v13);
            objc_msgSend(v15, "sourceUUIDWithProfile:error:", WeakRetained, a3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {

              v18 = 0;
              goto LABEL_14;
            }
            objc_msgSend(v8, "addObject:", v17);

            ++v14;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v11)
            continue;
          break;
        }
      }

      v18 = v8;
LABEL_14:

      v5 = v20;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("No sources with bundle identifier \"%@\"), v5);
  }
  v18 = 0;
LABEL_17:

LABEL_18:
  return v18;
}

BOOL __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_3;
  v10[3] = &unk_1E6CE7950;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSourceEntity, "performWriteTransactionWithHealthDatabase:error:block:", v6, a3, v10);

  return v8;
}

uint64_t __58__HDSourceManager_deleteSourceWithBundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _HDDeleteSourcesWithUUIDsEntry *v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = a2;
  -[HDSourceManager _sourceUUIDsForBundleIdentifier:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[_HDDeleteSourcesWithUUIDsEntry initWithUUIDs:bundleIdentifier:]([_HDDeleteSourcesWithUUIDsEntry alloc], "initWithUUIDs:bundleIdentifier:", v6, *(_QWORD *)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "addJournalEntry:error:", v7, a3);

    if (v10)
    {
      v12 = *(id **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = objc_loadWeakRetained(v12 + 1);
      objc_msgSend(v13, "syncIdentityManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentSyncIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "_deleteSourcesWithUUIDs:localSourceEntityCacheKey:syncIdentity:deleteSamples:transaction:error:", v6, v11, v15, 0, v5, a3);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_deleteSourcesWithUUIDs:(id)a3 localSourceEntityCacheKey:(id)a4 syncIdentity:(id)a5 deleteSamples:(BOOL)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  HDDatabaseValueCache *sourceEntityByBundleIdentifierCache;
  id WeakRetained;
  void *v37;
  HDSourceManager *v39;
  void *v40;
  id v41;
  id obj;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  HDSourceManager *v53;
  id v54;
  id v55;
  id v56;
  _BYTE *v57;
  uint8_t v58[128];
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v10 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v41 = a4;
  v15 = a5;
  v16 = a7;
  v43 = v14;
  if (objc_msgSend(v14, "count"))
  {
    v39 = self;
    v44 = v16;
    objc_msgSend(v16, "databaseForEntityClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDSourceEntityPredicateForSourcesWithUUIDs(v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    +[HDSourceEntity sourcesWithPredicate:includeDeleted:database:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:database:error:", v40, 1, v17, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    if (v20)
    {
      if (objc_msgSend(v20, "count"))
      {
        if (!v10)
          goto LABEL_9;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v60 = __Block_byref_object_copy__90;
        v61 = __Block_byref_object_dispose__90;
        v62 = 0;
        v49 = MEMORY[0x1E0C809B0];
        v50 = 3221225472;
        v51 = __114__HDSourceManager__deleteSourcesWithUUIDs_localSourceEntityCacheKey_syncIdentity_deleteSamples_transaction_error___block_invoke;
        v52 = &unk_1E6CF7FC8;
        v53 = v39;
        v54 = v40;
        v55 = v17;
        v20 = v20;
        v56 = v20;
        v57 = buf;
        v22 = HKWithAutoreleasePool();
        if ((v22 & 1) != 0 && objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
        {
          objc_msgSend(v20, "setByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v23 = objc_claimAutoreleasedReturnValue();

          v20 = (id)v23;
        }

        _Block_object_dispose(buf, 8);
        if (!v22)
        {
          v21 = v20;
        }
        else
        {
LABEL_9:
          +[HDLogicalSourceEntity lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:](HDLogicalSourceEntity, "lookUpOrCreateLogicalSourceWithBundleIdentifier:owningAppBundleIdentifier:transaction:error:", &stru_1E6D11BB8, 0, v44, a8);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v25 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            v26 = v25;
            v27 = objc_msgSend(v20, "count");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v27;
            _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "Deleting sources with UUIDs %{public}@ (%lu entities)", buf, 0x16u);

          }
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          obj = v20;
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v46;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v46 != v29)
                  objc_enumerationMutation(obj);
                v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                if (v15)
                {
                  objc_msgSend(v15, "entity");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "persistentID");
                }
                else
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "valueForProperty:database:", CFSTR("sync_identity"), v17);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "integerValue");
                }
                v34 = v33;

                if (!objc_msgSend(v31, "deleteSourceWithTombstoneLogicalSourceID:syncIdentity:database:transaction:error:", objc_msgSend(v24, "persistentID"), v34, v17, v44, a8))
                {
                  LOBYTE(v22) = 0;
                  WeakRetained = obj;
                  goto LABEL_33;
                }
              }
              v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
              if (v28)
                continue;
              break;
            }
          }

          if (+[HDLogicalSourceEntity deleteLogicalSourceEntitiesIfNecessaryWithTransaction:error:](HDLogicalSourceEntity, "deleteLogicalSourceEntitiesIfNecessaryWithTransaction:error:", v44, a8))
          {
            sourceEntityByBundleIdentifierCache = v39->_sourceEntityByBundleIdentifierCache;
            if (v41)
              -[HDDatabaseValueCache removeObjectForKey:transaction:](sourceEntityByBundleIdentifierCache, "removeObjectForKey:transaction:", v41, v44);
            else
              -[HDDatabaseValueCache removeAllObjectsWithTransaction:](sourceEntityByBundleIdentifierCache, "removeAllObjectsWithTransaction:", v44);
            -[HDDatabaseValueCache removeAllObjectsWithTransaction:](v39->_clientSourceCache, "removeAllObjectsWithTransaction:", v44);
            -[HDDatabaseValueCache removeAllObjectsWithTransaction:](v39->_localSourceForBundleIdentifierCache, "removeAllObjectsWithTransaction:", v44);
            WeakRetained = objc_loadWeakRetained((id *)&v39->_profile);
            objc_msgSend(WeakRetained, "sourceOrderManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "resetCacheWithTransaction:", v44);

            LOBYTE(v22) = 1;
LABEL_33:

          }
          else
          {
            LOBYTE(v22) = 0;
          }

          v21 = obj;
        }
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a8, 3, CFSTR("No sources with UUIDs %@"), v43);
    }
    LOBYTE(v22) = 0;
LABEL_35:

    v16 = v44;
    goto LABEL_36;
  }
  LOBYTE(v22) = 1;
LABEL_36:

  return v22;
}

uint64_t __114__HDSourceManager__deleteSourcesWithUUIDs_localSourceEntityCacheKey_syncIdentity_deleteSamples_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id WeakRetained;
  void *v22;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v3 = *(id *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = v5;
  if (!v3)
  {

    goto LABEL_13;
  }
  v7 = (void *)MEMORY[0x1E0D29838];
  v8 = v4;
  objc_msgSend(v7, "predicateWithProperty:notEqualToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAB0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v6, v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SQLForEntityClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSourceEntity, "disambiguatedDatabaseTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSourceEntity, "disambiguatedSQLForProperty:", CFSTR("logical_source_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@ WHERE %@ AND NOT EXISTS (SELECT 1 FROM %@ s WHERE s.%@=%@ AND NOT s.%@ AND s.%@=?)"), CFSTR("logical_source_id"), v11, v12, v13, CFSTR("logical_source_id"), v14, CFSTR("deleted"), CFSTR("provenance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke;
  v35[3] = &unk_1E6CE9508;
  v18 = v9;
  v36 = v18;
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke_2;
  v33[3] = &unk_1E6CE8CF8;
  v34 = v16;
  v3 = v16;
  LODWORD(v16) = objc_msgSend(v8, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", v15, a2, v35, v33);

  if ((_DWORD)v16)
    v19 = v3;
  else
    v19 = 0;
  v20 = v19;

  if (!v20)
  {
    v3 = 0;
LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "dataManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "deleteSamplesWithSourceEntities:error:", *(_QWORD *)(a1 + 56), a2);

  if (!v23)
    goto LABEL_13;
  if (objc_msgSend(v20, "count"))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v24 = *(id *)(a1 + 48);
      HDSourceEntityPredicateForLocalSourcesWithLogicalSourceIDs((uint64_t)v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSourceEntity sourcesWithPredicate:includeDeleted:database:error:](HDSourceEntity, "sourcesWithPredicate:includeDeleted:database:error:", v25, 0, v24, a2);
      v26 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      goto LABEL_13;
  }
  v29 = 1;
LABEL_14:

  return v29;
}

uint64_t __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  int v3;
  int v5;

  v5 = 1;
  objc_msgSend(*(id *)(a1 + 32), "bindToStatement:bindingIndex:", a2, &v5);
  v3 = v5++;
  return sqlite3_bind_int64(a2, v3, 0);
}

uint64_t __93__HDSourceManager__logicalSourceIDsWithoutLocalSourceForSourcesWithPredicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

void __59__HDSourceManager__fetchClientSourceForPersistentID_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 8));
  v9 = 0;
  LOBYTE(v3) = objc_msgSend(v2, "setName:profile:error:", v3, WeakRetained, &v9);
  v5 = v9;

  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = a1[7];
      *(_DWORD *)buf = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to set name \"%@\" for source %@: %{public}@", buf, 0x20u);
    }
  }

}

- (id)_createSourceEntityForLocalDeviceWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB6C18], "_generateIdentifierForAppleDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDeviceProductType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6C18], "hd_currentDeviceSourceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HKSourceOptionsForAppleDevice();
  -[HDSourceManager _createSourceEntityForBundleIdentifier:owningAppBundleIdentifier:name:options:isCurrentDevice:productType:error:](self, v5, 0, v10, v11, 1, v9, (uint64_t)a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_applicationsUninstalledNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  HDProfile **p_profile;
  uint64_t i;
  void *v16;
  void *v17;
  id WeakRetained;
  HDSourceManager *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDSourceEntityPredicateForSourcesWithBundleIdentifiers((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDSourceEntityPredicateForSourcesWithOwnerBundleIdentifiers((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "disjunctionWithPredicate:otherPredicate:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    -[HDSourceManager _clientSourcesWithPredicate:error:]((uint64_t)self, v9, (uint64_t)&v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v46;
    if (v10)
    {
      if (!objc_msgSend(v10, "count"))
        goto LABEL_33;
      v33 = v11;
      v34 = v9;
      v35 = v8;
      v36 = v7;
      v37 = v6;
      v38 = v5;
      v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v32 = v10;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (!v12)
        goto LABEL_25;
      v13 = v12;
      v41 = *(_QWORD *)v43;
      p_profile = &self->_profile;
      while (1)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v41)
            objc_enumerationMutation(obj);
          if (self)
          {
            v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v16, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)p_profile);
            objc_msgSend(WeakRetained, "dataManager");
            v19 = self;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 0;
            v21 = objc_msgSend(v20, "hasSampleWithBundleIdentifier:error:", v17, &v48);
            v22 = v48;

            self = v19;
            if (v21 == 1)
              goto LABEL_14;
            if (!v21)
            {
              _HKInitializeLogging();
              v23 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v51 = v17;
                v52 = 2114;
                v53 = v22;
                _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Error while checking if application %{public}@ has samples: %{public}@", buf, 0x16u);
              }
LABEL_14:

              continue;
            }
            v47 = 0;
            v24 = -[HDSourceManager deleteSourceWithBundleIdentifier:error:](v19, "deleteSourceWithBundleIdentifier:error:", v17, &v47);
            v25 = v47;
            _HKInitializeLogging();
            v26 = *MEMORY[0x1E0CB52B0];
            v27 = *MEMORY[0x1E0CB52B0];
            if (v24)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v51 = v17;
                _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "Successfully deleted source without data for uninstalled application %{public}@", buf, 0xCu);
              }

              objc_msgSend(v16, "bundleIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v28);

            }
            else
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v51 = v17;
                v52 = 2114;
                v53 = v25;
                _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Failed to delete source without data for uninstalled application %{public}@: %{public}@", buf, 0x16u);
              }

            }
            self = v19;
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (!v13)
        {
LABEL_25:

          _HKInitializeLogging();
          v29 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v39;
            _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "Application(s) uninstalled, deleted sources without data: %{public}@", buf, 0xCu);
          }

          v6 = v37;
          v5 = v38;
          v8 = v35;
          v7 = v36;
          v11 = v33;
          v9 = v34;
          v10 = v32;
          goto LABEL_33;
        }
      }
    }
    if ((HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v31 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v51 = v11;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "Failed to look up sources to delete for uninstalled applications: %{public}@", buf, 0xCu);
      }
    }
LABEL_33:

  }
  else
  {
    _HKInitializeLogging();
    v30 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "Application uninstallation notification missing bundle identifiers", buf, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSourceForSourceID, 0);
  objc_storeStrong((id *)&self->_localSourceForBundleIdentifierCache, 0);
  objc_storeStrong((id *)&self->_clientSourceCache, 0);
  objc_storeStrong((id *)&self->_sourceEntityByBundleIdentifierCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
