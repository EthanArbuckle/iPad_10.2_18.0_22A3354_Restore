@implementation HDContributorManager

- (HDContributorManager)initWithProfile:(id)a3
{
  id v4;
  HDContributorManager *v5;
  HDContributorManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDContributorManager;
  v5 = -[HDContributorManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)contributorForReference:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v6;
  id WeakRetained;
  void *v8;

  p_profile = &self->_profile;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  +[HDContributorEntity contributorForReference:profile:error:](HDContributorEntity, "contributorForReference:profile:error:", v6, WeakRetained, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defaultContributorReference
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = objc_msgSend(WeakRetained, "profileType");

  if (v3 == 1)
    +[HDContributorReference contributorReferenceForNoContributor](HDContributorReference, "contributorReferenceForNoContributor");
  else
    +[HDContributorReference contributorReferenceForPrimaryUser](HDContributorReference, "contributorReferenceForPrimaryUser");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)insertOrLookupContributorEntityWithReference:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;

  v8 = a3;
  v9 = a4;
  switch(objc_msgSend(v8, "contributorType"))
  {
    case 1:
      objc_msgSend(v8, "persistentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = CFSTR("Contributor reference for unknown type should have a persistent ID");
        goto LABEL_19;
      }
      objc_msgSend(v8, "persistentID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSQLiteEntity entityWithPersistentID:](HDContributorEntity, "entityWithPersistentID:", v11);
      self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    case 2:
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "syncIdentityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentSyncIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDContributorEntity insertOrLookupContributorEntityForNoContributorWithTransaction:syncIdentity:error:](HDContributorEntity, "insertOrLookupContributorEntityForNoContributorWithTransaction:syncIdentity:error:", v9, objc_msgSend(v15, "persistentID"), a5);
      self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    case 3:
      if (!self)
        goto LABEL_21;
      v16 = v9;
      objc_msgSend(v16, "databaseForEntityClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = 0;
      +[HDContributorEntity primaryUserContributorInDatabase:error:](HDContributorEntity, "primaryUserContributorInDatabase:error:", v17, &v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v31;
      WeakRetained = v19;
      if (v18)
      {
        self = v18;
      }
      else if (v19)
      {
        if (a5)
        {
          self = 0;
          *a5 = objc_retainAutorelease(v19);
        }
        else
        {
          _HKLogDroppedError();
          self = 0;
        }
      }
      else
      {
        -[HDContributorManager _primaryAppleAccount](self, "_primaryAppleAccount");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDContributorManager _imPreferredAccount](self, "_imPreferredAccount");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(v29, "syncIdentityManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "currentSyncIdentity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "entity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDContributorEntity insertPrimaryUserWithAppleID:callerID:syncIdentity:database:error:](HDContributorEntity, "insertPrimaryUserWithAppleID:callerID:syncIdentity:database:error:", v30, v24, objc_msgSend(v26, "persistentID"), v17, a5);
        self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_13;
    case 4:
      objc_msgSend(v8, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v8, "UUID");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_loadWeakRetained((id *)&self->_profile);
        +[HDContributorEntity contributorEntityWithUUID:profile:includeDeleted:error:](HDContributorEntity, "contributorEntityWithUUID:profile:includeDeleted:error:", WeakRetained, v13, 0, a5);
        self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = CFSTR("Contributor reference for other type should have an UUID");
LABEL_19:
        objc_msgSend(v21, "hk_assignError:code:format:", a5, 100, v22, v27);
LABEL_20:
        self = 0;
      }
LABEL_21:

      return self;
    default:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Contributor reference of invalid type %ld"), objc_msgSend(v8, "contributorType"));
      goto LABEL_20;
  }
}

- (id)_primaryAppleAccount
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  HDContributorManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching primary Apple account", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_msgSend(v4, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_imPreferredAccount
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void (*IMPreferredAccountForServiceSymbolLoc)(id);
  void *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v3 = (void *)_MergedGlobals_204;
  v18 = _MergedGlobals_204;
  if (!_MergedGlobals_204)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getIMServiceImplClass_block_invoke;
    v20 = &unk_1E6CECDD0;
    v21 = &v15;
    __getIMServiceImplClass_block_invoke((uint64_t)buf);
    v3 = (void *)v16[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v4, "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  if (!qword_1ED5522A8)
  {
    *(_OWORD *)buf = xmmword_1E6CF2FE8;
    *(_QWORD *)&buf[16] = 0;
    qword_1ED5522A8 = _sl_dlopen();
  }
  if (qword_1ED5522A8 && getIMPreferredAccountForServiceSymbolLoc())
  {
    v6 = v5;
    IMPreferredAccountForServiceSymbolLoc = (void (*)(id))getIMPreferredAccountForServiceSymbolLoc();
    if (!IMPreferredAccountForServiceSymbolLoc)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IMAccount *getIMPreferredAccountForService(IMService *__strong)");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("HDContributorManager.m"), 34, CFSTR("%s"), dlerror());

      __break(1u);
    }
    IMPreferredAccountForServiceSymbolLoc(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("non-nil");
      if (!v9)
        v11 = CFSTR("nil");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: returned %{public}@ string", buf, 0x16u);
    }

  }
  else
  {
LABEL_14:
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
