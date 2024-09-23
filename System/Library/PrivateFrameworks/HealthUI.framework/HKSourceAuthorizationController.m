@implementation HKSourceAuthorizationController

- (HKSourceAuthorizationController)initWithHealthStore:(id)a3 source:(id)a4 typesForSharing:(id)a5 typesForReading:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKSourceAuthorizationController *v16;
  HKSourceAuthorizationController *v17;
  uint64_t v18;
  HKAuthorizationStore *authorizationStore;
  uint64_t v20;
  NSSet *requestedTypesForSharing;
  uint64_t v22;
  NSSet *requestedTypesForReading;
  NSDictionary *requestedDocumentAuths;
  void *v26;
  void *v27;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceAuthorizationController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthStore != nil"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSourceAuthorizationController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)HKSourceAuthorizationController;
  v16 = -[HKSourceAuthorizationController init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_healthStore, a3);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6330]), "initWithHealthStore:", v12);
    authorizationStore = v17->_authorizationStore;
    v17->_authorizationStore = (HKAuthorizationStore *)v18;

    objc_storeStrong((id *)&v17->_source, a4);
    v20 = objc_msgSend(v14, "copy");
    requestedTypesForSharing = v17->_requestedTypesForSharing;
    v17->_requestedTypesForSharing = (NSSet *)v20;

    v22 = objc_msgSend(v15, "copy");
    requestedTypesForReading = v17->_requestedTypesForReading;
    v17->_requestedTypesForReading = (NSSet *)v22;

    requestedDocumentAuths = v17->_requestedDocumentAuths;
    v17->_requestedDocumentAuths = 0;

    v17->_isUpdatingAllTypes = 0;
    -[HKSourceAuthorizationController reload](v17, "reload");
  }

  return v17;
}

- (void)reload
{
  -[HKSourceAuthorizationController _reloadTypeAuthorizationRecords](self, "_reloadTypeAuthorizationRecords");
  -[HKSourceAuthorizationController _reloadDocumentAuthorizationRecords](self, "_reloadDocumentAuthorizationRecords");
}

- (void)_reloadDocumentAuthorizationRecords
{
  void *v3;
  HKAuthorizationStore *authorizationStore;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  authorizationStore = self->_authorizationStore;
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke;
  v6[3] = &unk_1E9C44E60;
  v6[4] = self;
  -[HKAuthorizationStore fetchAuthorizationStatusesForDocumentType:bundleIdentifier:completion:](authorizationStore, "fetchAuthorizationStatusesForDocumentType:bundleIdentifier:completion:", v3, v5, v6);

}

void __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  objc_msgSend(*(id *)(a1 + 32), "setRequestedDocumentAuths:", v5);

}

- (void)_reloadTypeAuthorizationRecords
{
  dispatch_semaphore_t v3;
  HKAuthorizationStore *authorizationStore;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *typesEnabledForSharing;
  NSMutableSet *v12;
  NSMutableSet *typesEnabledForReading;
  void *v14;
  id v15;
  id v16;
  NSArray *v17;
  NSArray *orderedTypesForSharing;
  NSArray *v19;
  NSArray *orderedTypesForReading;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HKSourceAuthorizationController *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__26;
  v35 = __Block_byref_object_dispose__26;
  v36 = 0;
  v3 = dispatch_semaphore_create(0);
  authorizationStore = self->_authorizationStore;
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke;
  v28[3] = &unk_1E9C45CC8;
  v30 = &v31;
  v28[4] = self;
  v7 = v3;
  v29 = v7;
  -[HKAuthorizationStore fetchAuthorizationRecordsForBundleIdentifier:completion:](authorizationStore, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v5, v28);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  typesEnabledForSharing = self->_typesEnabledForSharing;
  self->_typesEnabledForSharing = v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  typesEnabledForReading = self->_typesEnabledForReading;
  self->_typesEnabledForReading = v12;

  v14 = (void *)v32[5];
  v21 = v6;
  v22 = 3221225472;
  v23 = __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_196;
  v24 = &unk_1E9C45CF0;
  v25 = self;
  v15 = v8;
  v26 = v15;
  v16 = v9;
  v27 = v16;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v21);
  -[HKSourceAuthorizationController _sortedTypes:](self, "_sortedTypes:", v15, v21, v22, v23, v24, v25);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedTypesForSharing = self->_orderedTypesForSharing;
  self->_orderedTypesForSharing = v17;

  -[HKSourceAuthorizationController _sortedTypes:](self, "_sortedTypes:", v16);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedTypesForReading = self->_orderedTypesForReading;
  self->_orderedTypesForReading = v19;

  _Block_object_dispose(&v31, 8);
}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_cold_1(a1, v8);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "status");
  if ((objc_msgSend(v10, "isClinicalType") & 1) == 0)
  {
    if (v6 == 100 || (v7 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v7 + 88)) || !*(_QWORD *)(v7 + 80))
    {
      if (objc_msgSend(v5, "requestedSharing"))
      {
        v8 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        if (!v8 || objc_msgSend(v8, "containsObject:", v10))
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          if (HKAuthorizationStatusAllowsSharing())
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", v10);
        }
      }
      if (objc_msgSend(v5, "requestedReading"))
      {
        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
        if (!v9 || objc_msgSend(v9, "containsObject:", v10))
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
          if (HKAuthorizationStatusAllowsReading())
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v10);
        }
      }
    }
  }

}

- (id)_sortedTypes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_78);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __48__HKSourceAuthorizationController__sortedTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "hk_localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)isRequestingDocumentAuthorization
{
  NSArray *orderedTypesForReading;
  void *v3;

  orderedTypesForReading = self->_orderedTypesForReading;
  objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(orderedTypesForReading) = -[NSArray indexOfObject:](orderedTypesForReading, "indexOfObject:", v3) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)orderedTypesForReading;
}

- (unint64_t)countOfTypesInSection:(int64_t)a3
{
  void *v3;
  unint64_t v4;

  -[HKSourceAuthorizationController typesInSection:](self, "typesInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)typesInSection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 4)
  {
    v3 = 48;
  }
  else
  {
    if (a3 != 6)
      return 0;
    v3 = 56;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)objectAuthorizationStatusesForDocuments
{
  return self->_requestedDocumentAuths;
}

- (void)commitObjectAuthorizationStatuses:(id)a3
{
  HKAuthorizationStore *authorizationStore;
  HKSource *source;
  HKSourceAuthorizationController *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  authorizationStore = self->_authorizationStore;
  source = self->_source;
  v6 = self;
  v7 = a3;
  -[HKSource bundleIdentifier](source, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke;
  v9[3] = &unk_1E9C3FB40;
  v9[4] = v6;
  -[HKAuthorizationStore setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:](authorizationStore, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:", v7, 0, v8, 0, v9);

}

void __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke_cold_1(a1, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_reloadDocumentAuthorizationRecords");

}

- (void)resetObjectAuthorizationStatuses
{
  void *v3;
  HKAuthorizationStore *authorizationStore;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  authorizationStore = self->_authorizationStore;
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke;
  v6[3] = &unk_1E9C3FB40;
  v6[4] = self;
  -[HKAuthorizationStore resetAllObjectAuthorizationStatusForBundleIdentifier:objectType:completion:](authorizationStore, "resetAllObjectAuthorizationStatusForBundleIdentifier:objectType:completion:", v5, v3, v6);

}

void __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke_cold_1(a1, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "_reloadDocumentAuthorizationRecords");

}

- (BOOL)isTypeEnabled:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HKSourceAuthorizationController _enabledTypesInSection:](self, "_enabledTypesInSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return (char)self;
}

- (void)setEnabled:(BOOL)a3 forType:(id)a4 inSection:(int64_t)a5 commit:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;

  v6 = a6;
  v8 = a3;
  v10 = a4;
  -[HKSourceAuthorizationController _enabledTypesInSection:](self, "_enabledTypesInSection:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[HKSourceAuthorizationController _parentTypeDisabledForType:inSection:](self, "_parentTypeDisabledForType:inSection:", v10, a5)&& !self->_isUpdatingAllTypes)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke;
      v19[3] = &unk_1E9C45D58;
      v19[4] = self;
      v20 = v10;
      v21 = a5;
      dispatch_async(MEMORY[0x1E0C80D38], v19);

      goto LABEL_12;
    }
    objc_msgSend(v11, "addObject:", v10);
    if (!v6)
      goto LABEL_12;
LABEL_9:
    -[HKSourceAuthorizationController _updateAuthorizationStatusWithTypes:](self, "_updateAuthorizationStatusWithTypes:", v12);
    goto LABEL_12;
  }
  -[HKSourceAuthorizationController _enabledSubTypesForType:inSection:](self, "_enabledSubTypesForType:inSection:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") && !self->_isUpdatingAllTypes)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke_2;
    block[3] = &unk_1E9C418D8;
    block[4] = self;
    v16 = v13;
    v17 = v10;
    v18 = a5;
    v14 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_12;
  }
  objc_msgSend(v11, "removeObject:", v10);

  if (v6)
    goto LABEL_9;
LABEL_12:

}

void __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "parentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationController:parentTypeIsDisabled:forType:inSection:", v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationController:subTypesEnabled:forType:inSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (BOOL)_parentTypeDisabledForType:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  char v13;

  v6 = a3;
  objc_msgSend(v6, "parentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKSourceAuthorizationController typesInSection:](self, "typesInSection:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    objc_msgSend(v6, "parentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = !-[HKSourceAuthorizationController isTypeEnabled:inSection:](self, "isTypeEnabled:inSection:", v11, a4);

    v13 = v10 & v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_enabledSubTypesForType:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  -[HKSourceAuthorizationController _enabledTypesInSection:](self, "_enabledTypesInSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__HKSourceAuthorizationController__enabledSubTypesForType_inSection___block_invoke;
  v11[3] = &unk_1E9C45D80;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "objectsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __69__HKSourceAuthorizationController__enabledSubTypesForType_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)allTypesEnabled
{
  _BOOL4 v3;

  v3 = -[HKSourceAuthorizationController allTypesEnabledInSection:](self, "allTypesEnabledInSection:", 6);
  if (v3)
    LOBYTE(v3) = -[HKSourceAuthorizationController allTypesEnabledInSection:](self, "allTypesEnabledInSection:", 4);
  return v3;
}

- (BOOL)allTypesEnabledInSection:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 == 6)
  {
    v4 = 56;
    v5 = 72;
    goto LABEL_5;
  }
  if (a3 == 4)
  {
    v4 = 48;
    v5 = 64;
LABEL_5:
    v6 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "count");
    return v6 == objc_msgSend(*(id *)((char *)&self->super.isa + v4), "count");
  }
  return 0;
}

- (BOOL)anyTypeEnabled
{
  return -[NSMutableSet count](self->_typesEnabledForReading, "count")
      || -[NSMutableSet count](self->_typesEnabledForSharing, "count") != 0;
}

- (BOOL)anyTypeRequested
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HKSourceAuthorizationController orderedTypesForReading](self, "orderedTypesForReading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[HKSourceAuthorizationController orderedTypesForSharing](self, "orderedTypesForSharing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)setEnabled:(BOOL)a3 forAllTypesInSection:(int64_t)a4 commit:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  self->_isUpdatingAllTypes = 1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HKSourceAuthorizationController typesInSection:](self, "typesInSection:", a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HKSourceAuthorizationController setEnabled:forType:inSection:commit:](self, "setEnabled:forType:inSection:commit:", v7, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a4, v5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  self->_isUpdatingAllTypes = 0;
}

- (void)commitAuthorizationStatuses
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_orderedTypesForSharing);
  objc_msgSend(v3, "addObjectsFromArray:", self->_orderedTypesForReading);
  -[HKSourceAuthorizationController _updateAuthorizationStatusWithTypes:](self, "_updateAuthorizationStatusWithTypes:", v3);

}

- (int64_t)_authorizationStatusWithType:(id)a3
{
  NSMutableSet *typesEnabledForSharing;
  id v5;

  typesEnabledForSharing = self->_typesEnabledForSharing;
  v5 = a3;
  -[NSMutableSet containsObject:](typesEnabledForSharing, "containsObject:", v5);
  -[NSMutableSet containsObject:](self->_typesEnabledForReading, "containsObject:", v5);

  return HKInternalAuthorizationStatusMake();
}

- (void)_updateAuthorizationStatusWithTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKSourceAuthorizationController _authorizationStatusWithType:](self, "_authorizationStatusWithType:", v11, (_QWORD)v13));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[HKSourceAuthorizationController _setAuthorizationStatuses:](self, "_setAuthorizationStatuses:", v5);
}

- (void)_setAuthorizationStatuses:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  HKAuthorizationStore *authorizationStore;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_semaphore_t v10;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  authorizationStore = self->_authorizationStore;
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke;
  v9[3] = &unk_1E9C3FB40;
  v10 = v5;
  v8 = v5;
  -[HKAuthorizationStore setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:](authorizationStore, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v4, MEMORY[0x1E0C9AA70], v7, 0, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0CB5280];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  _HKInitializeLogging();
  v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
    __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_1(v14);
  notify_post("HKUIAuthorizationDidUpdateNotification");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_enabledTypesInSection:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 4)
  {
    v3 = 64;
  }
  else
  {
    if (a3 != 6)
      return 0;
    v3 = 72;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (HKSourceAuthorizationControllerDelegate)delegate
{
  return (HKSourceAuthorizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)orderedTypesForSharing
{
  return self->_orderedTypesForSharing;
}

- (void)setOrderedTypesForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTypesForSharing, a3);
}

- (NSArray)orderedTypesForReading
{
  return self->_orderedTypesForReading;
}

- (void)setOrderedTypesForReading:(id)a3
{
  objc_storeStrong((id *)&self->_orderedTypesForReading, a3);
}

- (NSMutableSet)typesEnabledForSharing
{
  return self->_typesEnabledForSharing;
}

- (void)setTypesEnabledForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_typesEnabledForSharing, a3);
}

- (NSMutableSet)typesEnabledForReading
{
  return self->_typesEnabledForReading;
}

- (void)setTypesEnabledForReading:(id)a3
{
  objc_storeStrong((id *)&self->_typesEnabledForReading, a3);
}

- (NSSet)requestedTypesForSharing
{
  return self->_requestedTypesForSharing;
}

- (void)setRequestedTypesForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_requestedTypesForSharing, a3);
}

- (NSSet)requestedTypesForReading
{
  return self->_requestedTypesForReading;
}

- (void)setRequestedTypesForReading:(id)a3
{
  objc_storeStrong((id *)&self->_requestedTypesForReading, a3);
}

- (NSDictionary)requestedDocumentAuths
{
  return self->_requestedDocumentAuths;
}

- (void)setRequestedDocumentAuths:(id)a3
{
  objc_storeStrong((id *)&self->_requestedDocumentAuths, a3);
}

- (BOOL)isUpdatingAllTypes
{
  return self->_isUpdatingAllTypes;
}

- (void)setIsUpdatingAllTypes:(BOOL)a3
{
  self->_isUpdatingAllTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedDocumentAuths, 0);
  objc_storeStrong((id *)&self->_requestedTypesForReading, 0);
  objc_storeStrong((id *)&self->_requestedTypesForSharing, 0);
  objc_storeStrong((id *)&self->_typesEnabledForReading, 0);
  objc_storeStrong((id *)&self->_typesEnabledForSharing, 0);
  objc_storeStrong((id *)&self->_orderedTypesForReading, 0);
  objc_storeStrong((id *)&self->_orderedTypesForSharing, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
}

void __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "failed to get object authorization records with error: %@", a5, a6, a7, a8, 2u);
}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = OUTLINED_FUNCTION_2_2(a1, a2);
  v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v4, v5, "%{public}@: failed to get authorization records: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_0_2();
}

void __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v6, v7, "Failed to set status for bundleId %@ with error: %@.", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_2();
}

void __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v6, v7, "Failed to reset authorization for bundle id: %@ with error: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_2();
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7813000, log, OS_LOG_TYPE_DEBUG, "Posting notification from HealthPrivacyService", v1, 2u);
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to set authorization statuses: %{public}@", a5, a6, a7, a8, 2u);
}

@end
