@implementation HDFeatureSettingsManager

- (HDFeatureSettingsManager)initWithProfile:(id)a3
{
  id v4;
  HDFeatureSettingsManager *v5;
  HDFeatureSettingsManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *observersByFeatureIdentifier;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDFeatureSettingsManager;
  v5 = -[HDFeatureSettingsManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByFeatureIdentifier = v6->_observersByFeatureIdentifier;
    v6->_observersByFeatureIdentifier = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__settingsDidSyncNotification_, CFSTR("HDUnprotectedFeatureSettingsSyncEntityDidSync"), v4);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDFeatureSettingsManager;
  -[HDFeatureSettingsManager dealloc](&v4, sel_dealloc);
}

- (id)featureSettingsForFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161;
  v30 = __Block_byref_object_dispose__161;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__161;
  v24 = __Block_byref_object_dispose__161;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDFeatureSettingsManager_featureSettingsForFeatureIdentifier_error___block_invoke;
  block[3] = &unk_1E6CEF868;
  v18 = &v26;
  v9 = v7;
  v17 = v9;
  v19 = &v20;
  dispatch_sync(queue, block);
  v10 = (void *)v21[5];
  if (v10)
  {
    v11 = v10;
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

    v14 = 0;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB6720]);
    v14 = (void *)objc_msgSend(v13, "initWithDictionary:", v27[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (id)_featureSettingsKeyValueDomainWithFeatureIdentifier:(id *)a1
{
  id *v2;
  id v3;
  HDKeyValueDomain *v4;
  id WeakRetained;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = [HDKeyValueDomain alloc];
    WeakRetained = objc_loadWeakRetained(v2 + 1);
    v2 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v4, "initWithCategory:domainName:profile:", 4, v3, WeakRetained);

  }
  return v2;
}

void __70__HDFeatureSettingsManager_featureSettingsForFeatureIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "allValuesWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)setFeatureSettingsValues:(id)a3 featureIdentifier:(id)a4 suppressNotificationsToObserver:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__161;
  v35 = __Block_byref_object_dispose__161;
  v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  block[3] = &unk_1E6D03EC8;
  v29 = &v37;
  v30 = &v31;
  block[4] = self;
  v15 = v12;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  v17 = v10;
  v27 = v17;
  v18 = v11;
  v28 = v18;
  dispatch_sync(queue, block);
  v19 = (void *)v32[5];
  if (v19)
  {
    v20 = v19;
    v21 = v20;
    if (a6)
      *a6 = objc_retainAutorelease(v20);
    else
      _HKLogDroppedError();

  }
  v22 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v14 = *(id *)(v2 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke_2;
  v9[3] = &unk_1E6D03EA0;
  v10 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = *(_OWORD *)(a1 + 64);
  v7 = (id)v8;
  v13 = v8;
  LOBYTE(v3) = -[HDFeatureSettingsManager _performWriteTransactionAndNotifyObserversWithError:suppressNotificationsToObserver:block:inaccessibilityHandler:](v3, (uint64_t)&v14, v4, v9);
  objc_storeStrong((id *)(v2 + 40), v14);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v3;

}

id __109__HDFeatureSettingsManager_setFeatureSettingsValues_featureIdentifier_suppressNotificationsToObserver_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v51 = 0;
  objc_msgSend(v6, "allValuesWithError:", &v51);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v51;
  if (v8)
  {
    v9 = v8;
    if (a3)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
    goto LABEL_38;
  }
  v39 = a3;
  v41 = v5;
  objc_msgSend(*(id *)(a1 + 40), "keyValueStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v7;
  v12 = (void *)objc_msgSend(v7, "mutableCopy");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  v42 = v13;
  v43 = v12;
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
        {
          if ((objc_msgSend(v21, "isEqual:", v20) & 1) != 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          }
          else
          {
            v27 = *(_QWORD *)(a1 + 48);
            v28 = *(void **)(a1 + 32);
            v46 = v16;
            v29 = -[HDFeatureSettingsManager _setFeatureSettingsValue:forKey:keyValueDomain:error:](v27, v22, v19, v28, &v46);
            v30 = v46;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v29;
            v16 = v30;
            v13 = v42;
            v12 = v43;
          }
          objc_msgSend(v12, "removeObjectForKey:", v19);
        }
        else
        {
          v23 = *(_QWORD *)(a1 + 48);
          v24 = *(void **)(a1 + 32);
          v45 = v16;
          v25 = -[HDFeatureSettingsManager _setFeatureSettingsValue:forKey:keyValueDomain:error:](v23, v22, v19, v24, &v45);
          v26 = v45;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v25;
          v16 = v26;
          v13 = v42;
          v12 = v43;
        }
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          v31 = v16;
          v9 = v31;
          v7 = v40;
          v5 = v41;
          if (v31)
          {
            if (v39)
              *v39 = objc_retainAutorelease(v31);
            else
              _HKLogDroppedError();
          }

          v36 = v42;
          v10 = 0;
          goto LABEL_37;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }

  if (!objc_msgSend(v12, "count"))
  {
    v9 = v16;
    v7 = v40;
    v5 = v41;
    goto LABEL_28;
  }
  v32 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v12, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithArray:", v33);

  v35 = *(void **)(a1 + 32);
  v44 = v16;
  LOBYTE(v32) = objc_msgSend(v35, "removeValuesForKeys:error:", v34, &v44);
  v9 = v44;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_BYTE)v32;
  v7 = v40;
  v5 = v41;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {

LABEL_28:
    v10 = *(id *)(a1 + 56);
    goto LABEL_36;
  }
  v37 = v9;
  v9 = v37;
  if (v37)
  {
    if (v39)
      *v39 = objc_retainAutorelease(v37);
    else
      _HKLogDroppedError();
  }

  v10 = 0;
LABEL_36:
  v36 = v42;
LABEL_37:

LABEL_38:
  return v10;
}

- (uint64_t)_setFeatureSettingsValue:(void *)a3 forKey:(void *)a4 keyValueDomain:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0;
      a1 = objc_msgSend(v11, "setData:forKey:error:", v9, v10, &v17);
      v12 = v17;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0;
        a1 = objc_msgSend(v11, "setNumber:forKey:error:", v9, v10, &v16);
        v12 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__setFeatureSettingsValue_forKey_keyValueDomain_error_, CFSTR("Value (%@) has an invalid type, expected NSData, NSNumber or NSString."), v9);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          a1 = 0;
          if (v13)
          {
LABEL_9:
            if (a5)
              *a5 = objc_retainAutorelease(v13);
            else
              _HKLogDroppedError();
          }
LABEL_12:

          goto LABEL_13;
        }
        v15 = 0;
        a1 = objc_msgSend(v11, "setString:forKey:error:", v9, v10, &v15);
        v12 = v15;
      }
    }
    v13 = v12;
    if (v13)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(uint64_t)a1 suppressNotificationsToObserver:(uint64_t)a2 block:(void *)a3 inaccessibilityHandler:(void *)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__161;
    v17[4] = __Block_byref_object_dispose__161;
    v18 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke;
    v13[3] = &unk_1E6D03F68;
    v16 = v17;
    v15 = v8;
    v13[4] = a1;
    v14 = v7;
    v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDOnboardingCompletionEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v10, a2, v13, 0);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setFeatureSettingsData:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__161;
  v33 = __Block_byref_object_dispose__161;
  v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HDFeatureSettingsManager_setFeatureSettingsData_forKey_featureIdentifier_error___block_invoke;
  block[3] = &unk_1E6CFA658;
  v27 = &v35;
  v15 = v13;
  v24 = v15;
  v16 = v10;
  v25 = v16;
  v17 = v11;
  v26 = v17;
  v28 = &v29;
  dispatch_sync(queue, block);
  v18 = (void *)v30[5];
  if (v18)
  {
    v19 = v18;
    v20 = v19;
    if (a6)
      *a6 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();

  }
  if (*((_BYTE *)v36 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v12, 0);
    v21 = *((_BYTE *)v36 + 24) != 0;
  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __82__HDFeatureSettingsManager_setFeatureSettingsData_forKey_featureIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "setData:forKey:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (void)_notifyObserversOfFeatureIdentifier:(void *)a3 excludingObserver:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__HDFeatureSettingsManager__notifyObserversOfFeatureIdentifier_excludingObserver___block_invoke;
    v8[3] = &unk_1E6D03F90;
    v9 = v6;
    v10 = a1;
    v11 = v5;
    objc_msgSend(v7, "notifyObservers:", v8);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }

}

- (BOOL)setFeatureSettingsNumber:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 suppressNotificationsToObserver:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__161;
  v36 = __Block_byref_object_dispose__161;
  v37 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__HDFeatureSettingsManager_setFeatureSettingsNumber_forKey_featureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  block[3] = &unk_1E6CFA658;
  v30 = &v38;
  v18 = v16;
  v27 = v18;
  v19 = v12;
  v28 = v19;
  v20 = v13;
  v29 = v20;
  v31 = &v32;
  dispatch_sync(queue, block);
  v21 = (void *)v33[5];
  if (v21)
  {
    v22 = v21;
    v23 = v22;
    if (a7)
      *a7 = objc_retainAutorelease(v22);
    else
      _HKLogDroppedError();

  }
  if (*((_BYTE *)v39 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v14, v15);
    v24 = *((_BYTE *)v39 + 24) != 0;
  }
  else
  {
    v24 = 0;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __116__HDFeatureSettingsManager_setFeatureSettingsNumber_forKey_featureIdentifier_suppressNotificationsToObserver_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "setNumber:forKey:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)setFeatureSettingsString:(id)a3 forKey:(id)a4 featureIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__161;
  v33 = __Block_byref_object_dispose__161;
  v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HDFeatureSettingsManager_setFeatureSettingsString_forKey_featureIdentifier_error___block_invoke;
  block[3] = &unk_1E6CFA658;
  v27 = &v35;
  v15 = v13;
  v24 = v15;
  v16 = v10;
  v25 = v16;
  v17 = v11;
  v26 = v17;
  v28 = &v29;
  dispatch_sync(queue, block);
  v18 = (void *)v30[5];
  if (v18)
  {
    v19 = v18;
    v20 = v19;
    if (a6)
      *a6 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();

  }
  if (*((_BYTE *)v36 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v12, 0);
    v21 = *((_BYTE *)v36 + 24) != 0;
  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __84__HDFeatureSettingsManager_setFeatureSettingsString_forKey_featureIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "setString:forKey:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (BOOL)removeFeatureSettingsValueForKey:(id)a3 featureIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__161;
  v29 = __Block_byref_object_dispose__161;
  v30 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__HDFeatureSettingsManager_removeFeatureSettingsValueForKey_featureIdentifier_error___block_invoke;
  v20[3] = &unk_1E6CEF9D0;
  v23 = &v31;
  v13 = v10;
  v21 = v13;
  v14 = v11;
  v22 = v14;
  v24 = &v25;
  dispatch_sync(queue, v20);
  v15 = (void *)v26[5];
  if (v15)
  {
    v16 = v15;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();

  }
  if (*((_BYTE *)v32 + 24))
  {
    -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, v9, 0);
    v18 = *((_BYTE *)v32 + 24) != 0;
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

void __85__HDFeatureSettingsManager_removeFeatureSettingsValueForKey_featureIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "removeValuesForKeys:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)resetFeatureSettingsForFeatureIdentifier:(id)a3 suppressNotificationsToObserver:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v9 = a4;
  -[HDFeatureSettingsManager _featureSettingsKeyValueDomainWithFeatureIdentifier:]((id *)&self->super.isa, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__161;
  v30 = __Block_byref_object_dispose__161;
  v31 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke;
  v20[3] = &unk_1E6D03F18;
  v24 = &v32;
  v25 = &v26;
  v20[4] = self;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = v8;
  v23 = v14;
  dispatch_sync(queue, v20);
  v15 = (void *)v27[5];
  if (v15)
  {
    v16 = v15;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();

  }
  v18 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(id *)(v3 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke_2;
  v6[3] = &unk_1E6D03EF0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6[1] = 3221225472;
  v9 = v2;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  LOBYTE(v4) = -[HDFeatureSettingsManager _performWriteTransactionAndNotifyObserversWithError:suppressNotificationsToObserver:block:inaccessibilityHandler:](v4, (uint64_t)&v10, v5, v6);
  objc_storeStrong((id *)(v3 + 40), v10);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v4;

}

id __107__HDFeatureSettingsManager_resetFeatureSettingsForFeatureIdentifier_suppressNotificationsToObserver_error___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  char v6;
  id v7;
  id v8;
  id v10;

  v5 = *(void **)(a1 + 32);
  v10 = 0;
  v6 = objc_msgSend(v5, "setValueForAllKeys:error:", 0, &v10);
  v7 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  if (v7)
  {
    if (a3)
    {
      v8 = 0;
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      _HKLogDroppedError();
      v8 = 0;
    }
  }
  else
  {
    v8 = *(id *)(a1 + 40);
  }

  return v8;
}

BOOL __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;

  v5 = a1[6];
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke_2;
  v15[3] = &unk_1E6D03F40;
  v11 = a1[7];
  v12 = (void *)a1[5];
  v15[4] = a1[4];
  v17 = v11;
  v16 = v12;
  objc_msgSend(v7, "onCommit:orRollback:", v15, 0);

  v13 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0;
  return v13;
}

void __141__HDFeatureSettingsManager__performWriteTransactionAndNotifyObserversWithError_suppressNotificationsToObserver_block_inaccessibilityHandler___block_invoke_2(uint64_t a1)
{
  -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:](*(_QWORD *)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(void **)(a1 + 40));
}

void __82__HDFeatureSettingsManager__notifyObserversOfFeatureIdentifier_excludingObserver___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1[4] && objc_msgSend(v3, "isEqual:"))
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEBUG))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Observer %{public}@ was skipped", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v4, "featureSettingsManager:didUpdateSettingsForFeatureIdentifier:", a1[5], a1[6]);
  }

}

- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByFeatureIdentifier, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithName:loggingCategory:", v8, v12);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observersByFeatureIdentifier, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(v10, "registerObserver:queue:", v13, v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDFeatureSettingsManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:
{
  const os_unfair_lock *v5;
  id v6;
  id v7;
  id v8;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 24);
    v6 = a3;
    v7 = a2;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "unregisterObserver:", v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_observersByFeatureIdentifier, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HDFeatureSettingsManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v4, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_settingsDidSyncNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature settings notification received (%{public}@)", buf, 0x16u);

  }
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HDUnprotectedFeatureSettingsSyncEntityDidSyncNotificationDomainNamesKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[HDFeatureSettingsManager _notifyObserversOfFeatureIdentifier:excludingObserver:]((uint64_t)self, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v16++), 0);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByFeatureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
