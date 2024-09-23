@implementation HKClinicalSourceAuthorizationController

- (HKClinicalSourceAuthorizationController)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 source:(id)a5 typesRequestedForReading:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKClinicalSourceAuthorizationController *v15;
  HKClinicalSourceAuthorizationController *v16;
  uint64_t v17;
  HKAuthorizationStore *authorizationStore;
  uint64_t v19;
  HKSource *source;
  uint64_t v21;
  NSSet *typesRequestedForReading;
  NSMutableSet *v23;
  NSMutableSet *typesEnabledForReading;
  NSArray *orderedTypesForReading;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKClinicalSourceAuthorizationController;
  v15 = -[HKClinicalSourceAuthorizationController init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_healthRecordsStore, a4);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6330]), "initWithHealthStore:", v11);
    authorizationStore = v16->_authorizationStore;
    v16->_authorizationStore = (HKAuthorizationStore *)v17;

    v19 = objc_msgSend(v13, "copy");
    source = v16->_source;
    v16->_source = (HKSource *)v19;

    v21 = objc_msgSend(v14, "copy");
    typesRequestedForReading = v16->_typesRequestedForReading;
    v16->_typesRequestedForReading = (NSSet *)v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    typesEnabledForReading = v16->_typesEnabledForReading;
    v16->_typesEnabledForReading = v23;

    orderedTypesForReading = v16->_orderedTypesForReading;
    v16->_orderedTypesForReading = (NSArray *)MEMORY[0x1E0C9AA60];

    -[HKClinicalSourceAuthorizationController reload](v16, "reload");
  }

  return v16;
}

- (id)_fetchAllClinicalAuthorizationRecordsWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
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

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v5 = dispatch_semaphore_create(0);
  -[HKClinicalSourceAuthorizationController authorizationStore](self, "authorizationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSourceAuthorizationController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke;
  v16[3] = &unk_1E9C42058;
  v18 = &v20;
  v19 = &v26;
  v9 = v5;
  v17 = v9;
  objc_msgSend(v6, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v8, v16);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v27[5], "hk_filter:", &__block_literal_global_27);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v27[5];
  v27[5] = v10;

  v12 = (id)v21[5];
  v13 = v12;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  v14 = (id)v27[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v5;
  v16 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_185(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isClinicalType");
}

- (void)reload
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSSet *v11;
  NSSet *typesForReading;
  NSArray *v13;
  NSArray *orderedTypesForReading;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  HKClinicalSourceAuthorizationController *v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;

  -[HKClinicalSourceAuthorizationController setAnyDeterminedTypeAllowsReading:](self, "setAnyDeterminedTypeAllowsReading:", 0);
  -[HKClinicalSourceAuthorizationController setAuthorizationModeForSource:](self, "setAuthorizationModeForSource:", 1);
  -[HKClinicalSourceAuthorizationController setDisplayReadAuthorizationAnchorDate:](self, "setDisplayReadAuthorizationAnchorDate:", 0);
  -[HKClinicalSourceAuthorizationController setFetchError:](self, "setFetchError:", 0);
  v24 = 0;
  -[HKClinicalSourceAuthorizationController _fetchAllClinicalAuthorizationRecordsWithError:](self, "_fetchAllClinicalAuthorizationRecordsWithError:", &v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;
  -[HKClinicalSourceAuthorizationController setFetchError:](self, "setFetchError:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[HKClinicalSourceAuthorizationController typesRequestedForReading](self, "typesRequestedForReading");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __49__HKClinicalSourceAuthorizationController_reload__block_invoke;
  v18 = &unk_1E9C420C0;
  v23 = v7 == 0;
  v8 = v7;
  v19 = v8;
  v20 = self;
  v9 = v6;
  v21 = v9;
  v10 = v5;
  v22 = v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v15);
  v11 = (NSSet *)objc_msgSend(v9, "copy", v15, v16, v17, v18);
  typesForReading = self->_typesForReading;
  self->_typesForReading = v11;

  objc_storeStrong((id *)&self->_typesEnabledForReading, v5);
  if (v3)
  {
    -[HKClinicalSourceAuthorizationController _orderTypes:](self, "_orderTypes:", v9);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    orderedTypesForReading = self->_orderedTypesForReading;
    self->_orderedTypesForReading = v13;
  }
  else
  {
    orderedTypesForReading = self->_orderedTypesForReading;
    self->_orderedTypesForReading = 0;
  }

}

void __49__HKClinicalSourceAuthorizationController_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "status");
  v7 = v6;
  if (*(_BYTE *)(a1 + 64) || v6 != 100 || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9))
  {
    objc_msgSend(v5, "status");
    if (HKAuthorizationStatusAllowsReading())
      objc_msgSend(*(id *)(a1 + 40), "setAnyDeterminedTypeAllowsReading:", 1);
    if (v7 != 100)
    {
      objc_msgSend(*(id *)(a1 + 40), "setAuthorizationModeForSource:", objc_msgSend(v5, "mode"));
      objc_msgSend(v5, "anchorLimitModifiedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setDisplayReadAuthorizationAnchorDate:", v8);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    if (objc_msgSend(v5, "readingEnabled"))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  }

}

- (id)_orderTypes:(id)a3
{
  HKHealthStore *healthStore;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  healthStore = self->_healthStore;
  v4 = a3;
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", healthStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKClinicalSourceAuthorizationController__orderTypes___block_invoke;
  aBlock[3] = &unk_1E9C420E8;
  v12 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);
  objc_msgSend(v4, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __55__HKClinicalSourceAuthorizationController__orderTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "displayTypeForObjectType:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayTypeForObjectType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "localizedCaseInsensitiveCompare:", v12);

  return v13;
}

- (BOOL)isTypeEnabled:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v11;

  v5 = a3;
  -[HKClinicalSourceAuthorizationController typesForReading](self, "typesForReading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.typesForReading containsObject:type]"));

  }
  -[HKClinicalSourceAuthorizationController typesEnabledForReading](self, "typesEnabledForReading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v5);

  return v9;
}

- (void)setEnabled:(BOOL)a3 forType:(id)a4 commit:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v6 = a3;
  v13 = a4;
  -[HKClinicalSourceAuthorizationController typesEnabledForReading](self, "typesEnabledForReading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "addObject:", v13);
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v8, "removeObject:", v13);
  if (v5)
  {
LABEL_5:
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v13, 0);
    -[HKClinicalSourceAuthorizationController _authorizationStatusesWithTypes:](self, "_authorizationStatusesWithTypes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalSourceAuthorizationController _authorizationModesWithMode:types:](self, "_authorizationModesWithMode:types:", -[HKClinicalSourceAuthorizationController authorizationModeForSource](self, "authorizationModeForSource"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalSourceAuthorizationController _setAuthorizationStatuses:modes:shouldUpdateAnchor:](self, "_setAuthorizationStatuses:modes:shouldUpdateAnchor:", v11, v12, 0);

  }
LABEL_6:

}

- (void)setEnabledForAllTypes:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[HKClinicalSourceAuthorizationController typesForReading](self, "typesForReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        -[HKClinicalSourceAuthorizationController setEnabled:forType:commit:](self, "setEnabled:forType:commit:", v3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)commitAllTypesAndUpdateAuthorizationAnchorWithMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  -[HKClinicalSourceAuthorizationController setAuthorizationModeForSource:](self, "setAuthorizationModeForSource:");
  -[HKClinicalSourceAuthorizationController typesForReading](self, "typesForReading");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HKClinicalSourceAuthorizationController _authorizationModesWithMode:types:](self, "_authorizationModesWithMode:types:", a3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalSourceAuthorizationController _authorizationStatusesWithTypes:](self, "_authorizationStatusesWithTypes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalSourceAuthorizationController _setAuthorizationStatuses:modes:shouldUpdateAnchor:](self, "_setAuthorizationStatuses:modes:shouldUpdateAnchor:", v7, v6, 1);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKClinicalSourceAuthorizationController commitAllTypesAndUpdateAuthorizationAnchorWithMode:].cold.1(v8);
  }

}

- (BOOL)_shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:(int64_t)a3
{
  return a3 != 0;
}

- (void)_updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue");
        if (v10 >= 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 219, CFSTR("Invalid mode: %ld"), v10);

        }
        if (-[HKClinicalSourceAuthorizationController _shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:](self, "_shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:", v10))
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99D68]);
          -[HKClinicalSourceAuthorizationController setDisplayReadAuthorizationAnchorDate:](self, "setDisplayReadAuthorizationAnchorDate:", v11);

          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_updateReminderRegistrationIfNeededForCommittingModes:(id)a3 anyTypeEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unint64_t v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modes.count > 0"));

  }
  memset(v12, 0, sizeof(v12));
  if (objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v12, v13, 16))
  {
    v8 = objc_msgSend(**((id **)&v12[0] + 1), "integerValue");
    if (v8 < 2)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 238, CFSTR("Invalid mode: %ld"), v8);

  }
  v8 = 1;
LABEL_7:
  if (v8)
    v10 = 0;
  else
    v10 = v4;
  -[HKClinicalSourceAuthorizationController _commitModeConfirmationAlertRegistrationShouldDisplay:](self, "_commitModeConfirmationAlertRegistrationShouldDisplay:", v10);

}

- (void)_commitModeConfirmationAlertRegistrationShouldDisplay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  -[HKClinicalSourceAuthorizationController healthRecordsStore](self, "healthRecordsStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSourceAuthorizationController source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke;
  v8[3] = &unk_1E9C42110;
  v9 = v3;
  v8[4] = self;
  v7 = _Block_copy(v8);
  if (v3)
    objc_msgSend(v5, "registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:completion:", v6, v7);
  else
    objc_msgSend(v5, "deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:completion:", v6, v7);

}

void __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
  objc_msgSend(*(id *)(a1 + 32), "_unitTesting_reminderRegistryCompletion");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t))(v13 + 16))(v13);

}

- (BOOL)allTypesEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[HKClinicalSourceAuthorizationController typesEnabledForReading](self, "typesEnabledForReading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSourceAuthorizationController typesForReading](self, "typesForReading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToSet:", v4);

  return v5;
}

- (BOOL)anyTypeEnabled
{
  void *v2;
  BOOL v3;

  -[HKClinicalSourceAuthorizationController typesEnabledForReading](self, "typesEnabledForReading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)anyTypeRequested
{
  void *v2;
  BOOL v3;

  -[HKClinicalSourceAuthorizationController typesForReading](self, "typesForReading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (int64_t)_authorizationStatusWithType:(id)a3
{
  -[NSMutableSet containsObject:](self->_typesEnabledForReading, "containsObject:", a3);
  return HKInternalAuthorizationStatusMake();
}

- (id)_authorizationModesWithMode:(int64_t)a3 types:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_authorizationStatusesWithTypes:(id)a3
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKClinicalSourceAuthorizationController _authorizationStatusWithType:](self, "_authorizationStatusWithType:", v11, (_QWORD)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_setAuthorizationStatuses:(id)a3 modes:(id)a4 shouldUpdateAnchor:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  dispatch_semaphore_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v41;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "isClinicalType") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type.isClinicalType"));

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v12);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v16);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v19), "isClinicalType") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSourceAuthorizationController.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type.isClinicalType"));

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v17);
  }

  v21 = dispatch_semaphore_create(0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  -[HKClinicalSourceAuthorizationController authorizationStore](self, "authorizationStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalSourceAuthorizationController source](self, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke;
  v29[3] = &unk_1E9C42138;
  v31 = &v32;
  v25 = v21;
  v30 = v25;
  objc_msgSend(v22, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v11, v16, v24, v5, v29);

  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v33 + 24))
  {
    objc_msgSend(v16, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalSourceAuthorizationController source](self, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "_isApplication");

    if (v28)
      -[HKClinicalSourceAuthorizationController _updateReminderRegistrationIfNeededForCommittingModes:anyTypeEnabled:](self, "_updateReminderRegistrationIfNeededForCommittingModes:anyTypeEnabled:", v26, -[HKClinicalSourceAuthorizationController anyTypeEnabled](self, "anyTypeEnabled"));
    if (v5)
      -[HKClinicalSourceAuthorizationController _updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:](self, "_updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:", v26);

  }
  _Block_object_dispose(&v32, 8);

}

void __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (HKSource)source
{
  return self->_source;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSArray)orderedTypesForReading
{
  return self->_orderedTypesForReading;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)authorizationModeForSource
{
  return self->_authorizationModeForSource;
}

- (void)setAuthorizationModeForSource:(int64_t)a3
{
  self->_authorizationModeForSource = a3;
}

- (BOOL)anyDeterminedTypeAllowsReading
{
  return self->_anyDeterminedTypeAllowsReading;
}

- (void)setAnyDeterminedTypeAllowsReading:(BOOL)a3
{
  self->_anyDeterminedTypeAllowsReading = a3;
}

- (NSDate)displayReadAuthorizationAnchorDate
{
  return self->_displayReadAuthorizationAnchorDate;
}

- (void)setDisplayReadAuthorizationAnchorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (NSSet)typesForReading
{
  return self->_typesForReading;
}

- (void)setTypesForReading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)typesRequestedForReading
{
  return self->_typesRequestedForReading;
}

- (NSMutableSet)typesEnabledForReading
{
  return self->_typesEnabledForReading;
}

- (id)_unitTesting_reminderRegistryCompletion
{
  return self->__unitTesting_reminderRegistryCompletion;
}

- (void)_unitTesting_setReminderRegistryCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__unitTesting_reminderRegistryCompletion, 0);
  objc_storeStrong((id *)&self->_typesEnabledForReading, 0);
  objc_storeStrong((id *)&self->_typesRequestedForReading, 0);
  objc_storeStrong((id *)&self->_typesForReading, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_displayReadAuthorizationAnchorDate, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_orderedTypesForReading, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to get authorization records: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)commitAllTypesAndUpdateAuthorizationAnchorWithMode:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "Unable to commit clinical source authorization determinations: no types for reading", v1, 2u);
}

void __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to update mode alert confirmation with shouldDisplay: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

void __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Received error when setting authorization state: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

@end
