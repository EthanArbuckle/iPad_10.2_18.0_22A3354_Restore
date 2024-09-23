@implementation HDClientAuthorizationOracle

- (HDClientAuthorizationOracle)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDClientAuthorizationOracle)initWithSourceBundleIdentifier:(id)a3 entitlements:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDClientAuthorizationOracle *v11;
  HDClientAuthorizationOracle *v12;
  uint64_t v13;
  NSString *sourceBundleIdentifier;
  NSMutableArray *v15;
  NSMutableArray *authorizationRequestIdentifiers;
  uint64_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HDClientAuthorizationOracle;
  v11 = -[HDClientAuthorizationOracle init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a5);
    v13 = objc_msgSend(v8, "copy");
    sourceBundleIdentifier = v12->_sourceBundleIdentifier;
    v12->_sourceBundleIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_entitlements, a4);
    v12->_clientHasPrivateEntitlement = -[_HKEntitlements hasEntitlement:](v12->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    authorizationRequestIdentifiers = v12->_authorizationRequestIdentifiers;
    v12->_authorizationRequestIdentifiers = v15;

    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

  }
  return v12;
}

- (void)invalidate
{
  BOOL *p_invalidated;
  NSObject *queue;
  _QWORD block[5];

  p_invalidated = &self->_invalidated;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_invalidated))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if (self)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__HDClientAuthorizationOracle__invalidate__block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (BOOL)clientHasAuthorizationForAllTypes
{
  HDKeyValueDomain *v3;
  HDKeyValueDomain *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  HDClientAuthorizationOracle *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSString isEqualToString:](self->_sourceBundleIdentifier, "isEqualToString:", *MEMORY[0x1E0CB77C0]))
    return 0;
  v3 = [HDKeyValueDomain alloc];
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v3, "initWithCategory:domainName:profile:", 5, *MEMORY[0x1E0CB77B0], self->_profile);
  v5 = *MEMORY[0x1E0CB77B8];
  v12 = 0;
  -[HDKeyValueDomain numberForKey:error:](v4, "numberForKey:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v6, "integerValue") == 1;
  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch authorization status for all types: %{public}@", buf, 0x16u);
      }
    }
    v9 = 0;
  }

  return v9;
}

- (id)filteredObjectsForReadAuthorization:(id)a3 anchor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v25;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  HDClientAuthorizationOracle *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  HDClientAuthorizationOracle *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v9) & 1) != 0)
    {
LABEL_3:
      v10 = v7;
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  v27 = v8;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = v7;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "hd_sampleType", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v33 = 0;
          -[HDClientAuthorizationOracle readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v17, &v33);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v33;
          v21 = v20;
          if (v19)
            v22 = 1;
          else
            v22 = v20 == 0;
          if (v22)
          {
            if (v19)
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);
          }
          else
          {
            _HKInitializeLogging();
            v23 = *MEMORY[0x1E0CB5280];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v39 = self;
              v40 = 2114;
              v41 = v17;
              _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find read authorization status for type: %{public}@", buf, 0x16u);
            }
          }

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v14);
  }

  v8 = v27;
  if (!self->_sourceBundleIdentifier)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = self;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@: No client source bundle identifier while filtering samples", buf, 0xCu);
    }
  }
  if (objc_msgSend(v11, "count", v27))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __80__HDClientAuthorizationOracle_filteredObjectsForReadAuthorization_anchor_error___block_invoke;
    v29[3] = &unk_1E6CEEE98;
    v30 = v11;
    v31 = self;
    v32 = v8;
    objc_msgSend(v12, "hk_filter:", v29);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }
  v7 = v28;

LABEL_30:
  return v10;
}

uint64_t __80__HDClientAuthorizationOracle_filteredObjectsForReadAuthorization_anchor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "hd_sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDClientAuthorizationOracle _isAuthorizedToReadDataTypeForObject:anchor:authorizationStatus:](*(_QWORD *)(a1 + 40), v3, *(void **)(a1 + 48), v5);

  return v6;
}

- (uint64_t)_isAuthorizedToReadDataTypeForObject:(void *)a3 anchor:(void *)a4 authorizationStatus:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11 = objc_msgSend(v9, "canRead");
    if (objc_msgSend(v10, "authorizationMode") == 1)
    {
      v12 = objc_msgSend(v8, "longLongValue");
      objc_msgSend(v10, "objectLimitAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12 <= objc_msgSend(v13, "longLongValue");

    }
    objc_msgSend(v10, "restrictedBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "_source");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v14);

      if ((v17 & 1) == 0)
        goto LABEL_11;
    }
    else if (!v11)
    {
      goto LABEL_11;
    }
    if (*(_BYTE *)(a1 + 32)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_msgSend(v7, "_requiresPrivateEntitlementForQueries") & 1) == 0)
    {
      a1 = 1;
      goto LABEL_13;
    }
LABEL_11:
    a1 = 0;
LABEL_13:

  }
  return a1;
}

- (void)authorizationStatusForType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  HDClientAuthorizationOracle *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __69__HDClientAuthorizationOracle_authorizationStatusForType_completion___block_invoke;
  v18 = &unk_1E6CEEEC0;
  v20 = self;
  v21 = v7;
  v19 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = &v15;
  if (self)
  {
    -[HDProfile database](self->_profile, "database", v15, v16, v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __71__HDClientAuthorizationOracle__authorizationStatusForTypes_completion___block_invoke;
    v22[3] = &unk_1E6CEA160;
    v22[4] = self;
    v23 = v12;
    v24 = v13;
    objc_msgSend(v14, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", 0, v22);

  }
}

void __69__HDClientAuthorizationOracle_authorizationStatusForType_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = a1[6];
    if (a1[5] && (unint64_t)(v4 - 101) <= 3)
      v6 = qword_1B7F3B330[v4 - 101];
    else
      v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v7, 0);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __71__HDClientAuthorizationOracle__authorizationStatusForTypes_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1[4] + 8), "authorizationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[4] + 16);
  v7 = 0;
  objc_msgSend(v2, "authorizationStatusForTypes:bundleIdentifier:error:", v3, v4, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;

  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)performReadAuthorizationTransactionWithError:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[HDProfile database](self->_profile, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke;
  v10[3] = &unk_1E6CEE458;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDAuthorizationEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a3, v10);

  return (char)a3;
}

uint64_t __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke_2;
  v12[3] = &unk_1E6CEEEE8;
  v6 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v7 = v5;
  v8 = _Block_copy(v12);
  v10 = (*(uint64_t (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8, a3, v9);

  return v10;
}

uint64_t __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "hd_sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "readAuthorizationStatusForType:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_7:
      v14 = 0;
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);
  }
  if (!objc_msgSend(v10, "canRead"))
    goto LABEL_7;
  objc_msgSend(v10, "restrictedBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "_source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v11);

  }
  else
  {
    v14 = (objc_msgSend(v10, "authorizationMode") != 1
        || v8
        && (v15 = objc_msgSend(v8, "longLongValue"),
            objc_msgSend(v10, "objectLimitAnchor"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "longLongValue"),
            v16,
            v15 <= v17))
       && (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 32)
        || (objc_msgSend(v7, "_requiresPrivateEntitlementForQueries") & 1) == 0);
  }

LABEL_16:
  return v14;
}

- (id)additionalAuthorizationPredicateForObjectType:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HDClientAuthorizationOracle readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "authorizationPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDClientAuthorizationOracle readAuthorizationStatusesForTypes:error:](self, "readAuthorizationStatusesForTypes:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)readAuthorizationStatusesForTypes:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HDClientAuthorizationOracle *v20;
  _HKEntitlements *entitlements;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("types != nil && types.count > 0"));

  }
  v9 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v9) & 1) != 0)
    {
LABEL_29:
      -[HDClientAuthorizationOracle _unrestrictedAuthorizationForTypes:]((uint64_t)self, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_29;
  }
  if ((objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_46) & 1) == 0)
    goto LABEL_29;
  +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:", self->_sourceBundleIdentifier, v8, self->_profile, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v11)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v13)
      goto LABEL_24;
    v14 = v13;
    v15 = *(_QWORD *)v30;
    v28 = *MEMORY[0x1E0CB5DF0];
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
        objc_msgSend(v17, "code");
        if ((HKDataTypeRequiresAuthorization() & 1) == 0
          || (objc_msgSend(v17, "code"), HKDataTypeRequiresPerObjectAuthorization()))
        {
          +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus](HDReadAuthorizationStatus, "unrestrictedReadAuthorizationStatus");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v20 = self;
        entitlements = self->_entitlements;
        objc_msgSend(v17, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(entitlements) = -[_HKEntitlements arrayEntitlement:containsString:](entitlements, "arrayEntitlement:containsString:", v28, v22);

        if ((_DWORD)entitlements)
        {
          +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus](HDReadAuthorizationStatus, "unrestrictedReadAuthorizationStatus");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          self = v20;
          goto LABEL_16;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        self = v20;
        if (!v23)
        {
          +[HDReadAuthorizationStatus notDerminedReadAuthorizationStatus](HDReadAuthorizationStatus, "notDerminedReadAuthorizationStatus");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_15:
          v19 = (void *)v18;
LABEL_16:
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);

        }
        ++v16;
      }
      while (v14 != v16);
      v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v14 = v24;
      if (!v24)
      {
LABEL_24:

        v25 = (void *)objc_msgSend(v11, "copy");
        goto LABEL_26;
      }
    }
  }
  v25 = 0;
LABEL_26:

LABEL_30:
  return v25;
}

- (id)_unrestrictedAuthorizationForTypes:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  if (!a1)
    return 0;
  v2 = a2;
  +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus](HDReadAuthorizationStatus, "unrestrictedReadAuthorizationStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HDClientAuthorizationOracle__unrestrictedAuthorizationForTypes___block_invoke;
  v7[3] = &unk_1E6CEEF50;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "hk_mapToDictionary:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __71__HDClientAuthorizationOracle_readAuthorizationStatusesForTypes_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "code");
  return HKDataTypeRequiresAuthorization();
}

- (BOOL)isAuthorizedToReadObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSString *sourceBundleIdentifier;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HDProfile *profile;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hd_sampleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "hd_sampleType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9
        && (-[_HKEntitlements arrayEntitlement:containsString:](self->_entitlements, "arrayEntitlement:containsString:", *MEMORY[0x1E0CB5DF0], v9) & 1) != 0)
      {
        LOBYTE(self) = 1;
LABEL_41:

        goto LABEL_42;
      }
      v37 = 0;
      -[HDClientAuthorizationOracle readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v7, &v37);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v37;
      v12 = v11;
      if (!v10)
      {
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 5, CFSTR("Failed to fetch read authorization status for object: %@"), v6);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v12 = 0;
            v28 = 0;
            LOBYTE(self) = 0;
LABEL_39:

            v12 = v28;
            goto LABEL_40;
          }
        }
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();

        LOBYTE(self) = 0;
        if (v12)
          goto LABEL_40;
        v28 = 0;
        v12 = v13;
        goto LABEL_39;
      }
      if ((-[HDClientAuthorizationOracle _isAuthorizedToReadDataTypeForObject:anchor:authorizationStatus:]((uint64_t)self, v6, 0, v10) & 1) != 0)
      {
        LOBYTE(self) = 1;
LABEL_40:

        goto LABEL_41;
      }
      v14 = v6;
      v15 = v14;
      if (!self)
      {
        v18 = v12;
        goto LABEL_38;
      }
      v36 = v14;
      objc_msgSend(v14, "hd_sampleType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17
        && (-[_HKEntitlements arrayEntitlement:containsString:](self->_entitlements, "arrayEntitlement:containsString:", *MEMORY[0x1E0CB5DF0], v17) & 1) != 0)
      {
        LOBYTE(self) = 1;
        v18 = v12;
        v15 = v36;
LABEL_37:

LABEL_38:
        v28 = v18;
        goto LABEL_39;
      }
      -[HDProfile sourceManager](self->_profile, "sourceManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      v39 = 0;
      objc_msgSend(v19, "localSourceForBundleIdentifier:error:", sourceBundleIdentifier, &v39);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v39;

      v34 = v17;
      if (v21)
      {
        v23 = v21;
        v40[0] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        profile = self->_profile;
        v38 = v22;
        v33 = v23;
        +[HDObjectAuthorizationEntity authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:](HDObjectAuthorizationEntity, "authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:", v24, v23, 0, profile, &v38);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v38;

        objc_msgSend(v26, "firstObject");
        v27 = (id)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          LOBYTE(self) = objc_msgSend(v27, "status") == 2;
          v18 = v12;
          v15 = v36;
          v21 = v33;
LABEL_36:

          v17 = v34;
          goto LABEL_37;
        }
        v21 = v33;
        if (v35)
        {
          v18 = objc_retainAutorelease(v35);

          v27 = 0;
          LOBYTE(self) = 0;
          v35 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 2000, CFSTR("Failed to fetch HKObjectAuthorizationRecord for object: %@, client bundle identifier: %@"), v36, self->_sourceBundleIdentifier);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          v18 = v12;
          if (v30)
          {
            v18 = objc_retainAutorelease(v30);

          }
          v27 = 0;
          LOBYTE(self) = 0;
          v35 = 0;
          v21 = v33;
        }
      }
      else
      {
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 124, CFSTR("Failed to find local source entity for client with bundle identifier: %@"), self->_sourceBundleIdentifier);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v15 = v36;
          if (v29)
          {
            v27 = objc_retainAutorelease(v29);

            LOBYTE(self) = 0;
            v35 = 0;
            v18 = v27;
          }
          else
          {
            v27 = 0;
            LOBYTE(self) = 0;
            v35 = 0;
            v18 = v12;
          }
          goto LABEL_36;
        }
        v27 = objc_retainAutorelease(v22);
        LOBYTE(self) = 0;
        v18 = v27;
        v35 = v27;
      }
      v15 = v36;
      goto LABEL_36;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 1301, CFSTR("Object %@ is not a sample"), v6);
  LOBYTE(self) = 0;
LABEL_42:

  return (char)self;
}

- (BOOL)isAuthorizationStatusDeterminedForTypes:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  void *v19;
  char v20;
  _HKEntitlements *entitlements;
  HDClientAuthorizationOracle *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v7) & 1) != 0)
    {
LABEL_3:
      v8 = 1;
      goto LABEL_33;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  -[HDProfile authorizationManager](self->_profile, "authorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationStatusForTypes:bundleIdentifier:error:", v6, self->_sourceBundleIdentifier, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = v6;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v13)
    goto LABEL_18;
  v14 = v13;
  v15 = *(_QWORD *)v38;
  v32 = *MEMORY[0x1E0CB5DF0];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v17, "code", v31);
      v18 = HKDataTypeRequiresAuthorization();
      v19 = &unk_1E6DFAC28;
      if (v18)
      {
        objc_msgSend(v17, "code", &unk_1E6DFAC28);
        v20 = HKDataTypeRequiresPerObjectAuthorization();
        v19 = &unk_1E6DFAC28;
        if ((v20 & 1) == 0)
        {
          entitlements = self->_entitlements;
          objc_msgSend(v17, "identifier", &unk_1E6DFAC28);
          v22 = self;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(entitlements) = -[_HKEntitlements arrayEntitlement:containsString:](entitlements, "arrayEntitlement:containsString:", v32, v23);

          self = v22;
          v19 = &unk_1E6DFAC28;
          if ((entitlements & 1) == 0)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v17);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
              continue;
            v19 = &unk_1E6DFAC40;
          }
        }
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  }
  while (v14);
LABEL_18:

  if (objc_msgSend(v11, "count"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v11, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      v6 = v31;
      while (2)
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          if ((unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "integerValue", v31) - 101) > 3)
          {
            v8 = 0;
            goto LABEL_31;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v27)
          continue;
        break;
      }
      v8 = 1;
    }
    else
    {
      v8 = 1;
      v6 = v31;
    }
LABEL_31:

  }
  else
  {
    v8 = 0;
    v6 = v31;
  }

LABEL_33:
  return v8;
}

void __42__HDClientAuthorizationOracle__invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "authorizationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    objc_msgSend(v6, "cancelAuthorizationRequestsWithIdentifiers:", v2);

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("The connection to the view service was invalidated."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

  }
}

uint64_t __66__HDClientAuthorizationOracle__unrestrictedAuthorizationForTypes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, a2, *(_QWORD *)(a1 + 32));
}

- (void)performIfAuthorizedToReadObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SEL v38;
  id v39;
  id v40;
  void *v41;
  NSObject *queue;
  char v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  SEL v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objects count] > 0"));

  if (!v13)
    goto LABEL_30;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_19:
      v19 = 0;
      goto LABEL_20;
    }
  }
  else if (v15)
  {
    goto LABEL_19;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v17)
  {

    goto LABEL_19;
  }
  v18 = v17;
  v38 = a2;
  v39 = v13;
  v41 = v14;
  queue = v12;
  v40 = v11;
  v19 = 0;
  v20 = *(_QWORD *)v55;
  v43 = 1;
  do
  {
    v21 = v16;
    v22 = 0;
    v23 = v19;
    do
    {
      if (*(_QWORD *)v55 != v20)
        objc_enumerationMutation(v21);
      v24 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v22);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v53 = v23;
      v29 = objc_msgSend(v25, "isClientAuthorizedToReadObject:sourceBundleIdentifier:clientEntitlements:profile:error:", v24, sourceBundleIdentifier, entitlements, profile, &v53);
      v19 = v53;

      if (v29 == 1)
        objc_msgSend(v44, "addObject:", v24);
      else
        v43 = 0;
      ++v22;
      v23 = v19;
    }
    while (v18 != v22);
    v16 = v21;
    v18 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  }
  while (v18);

  if ((v43 & 1) != 0)
  {
    v13 = v39;
    v11 = v40;
    v14 = v41;
    v12 = queue;
LABEL_20:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E6CE9C08;
    v51 = v44;
    v52 = v13;
    v30 = (void (**)(_QWORD))_Block_copy(aBlock);
    v31 = v30;
    if (v12)
      dispatch_async(v12, v30);
    else
      v30[2](v30);

    v32 = v51;
    goto LABEL_24;
  }
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v45[3] = &unk_1E6CED420;
  v45[4] = self;
  v46 = v21;
  v19 = v19;
  v47 = v19;
  v49 = v38;
  v14 = v41;
  v48 = v41;
  v33 = (void (**)(_QWORD))_Block_copy(v45);
  v34 = v33;
  v12 = queue;
  if (queue)
    dispatch_async(queue, v33);
  else
    v33[2](v33);
  v13 = v39;
  v11 = v40;

  v32 = v46;
LABEL_24:

}

void __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB6AD8], "hd_sampleTypesForObjects:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(v4, "count"))
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6AD8], "hd_sampleTypesForObjects:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not read authorized for data type(s) %@", buf, 0x16u);
    }

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 526, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToReadTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SEL v38;
  id v39;
  id v40;
  void *v41;
  NSObject *queue;
  char v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  SEL v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[types count] > 0"));

  if (!v13)
    goto LABEL_30;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_19:
      v19 = 0;
      goto LABEL_20;
    }
  }
  else if (v15)
  {
    goto LABEL_19;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (!v17)
  {

    goto LABEL_19;
  }
  v18 = v17;
  v38 = a2;
  v39 = v13;
  v41 = v14;
  queue = v12;
  v40 = v11;
  v19 = 0;
  v20 = *(_QWORD *)v55;
  v43 = 1;
  do
  {
    v21 = v16;
    v22 = 0;
    v23 = v19;
    do
    {
      if (*(_QWORD *)v55 != v20)
        objc_enumerationMutation(v21);
      v24 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v22);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v53 = v23;
      v29 = objc_msgSend(v25, "isClientAuthorizedToReadType:sourceBundleIdentifier:clientEntitlements:profile:error:", v24, sourceBundleIdentifier, entitlements, profile, &v53);
      v19 = v53;

      if (v29 == 1)
        objc_msgSend(v44, "addObject:", v24);
      else
        v43 = 0;
      ++v22;
      v23 = v19;
    }
    while (v18 != v22);
    v16 = v21;
    v18 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  }
  while (v18);

  if ((v43 & 1) != 0)
  {
    v13 = v39;
    v11 = v40;
    v14 = v41;
    v12 = queue;
LABEL_20:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E6CE8C48;
    v52 = v13;
    v51 = v44;
    v30 = (void (**)(_QWORD))_Block_copy(aBlock);
    v31 = v30;
    if (v12)
      dispatch_async(v12, v30);
    else
      v30[2](v30);

    v32 = v52;
    goto LABEL_24;
  }
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v45[3] = &unk_1E6CED420;
  v45[4] = self;
  v46 = v21;
  v19 = v19;
  v47 = v19;
  v49 = v38;
  v14 = v41;
  v48 = v41;
  v33 = (void (**)(_QWORD))_Block_copy(v45);
  v34 = v33;
  v12 = queue;
  if (queue)
    dispatch_async(queue, v33);
  else
    v33[2](v33);
  v13 = v39;
  v11 = v40;

  v32 = v46;
LABEL_24:

}

void __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
}

uint64_t __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6)
      goto LABEL_5;
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v9 = "Client %@ is not read authorized for data type(s) %@";
    v10 = v5;
    v11 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_5;
    v13 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    v9 = "Client %@ is not write authorized for data type(s).";
    v10 = v5;
    v11 = 12;
  }
  _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToSaveObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SEL v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  SEL v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objects count] > 0"));

  if (!v13)
    goto LABEL_27;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 609, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_16:
      v19 = 0;
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    goto LABEL_16;
  }
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v50 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (!v17)
  {

    goto LABEL_16;
  }
  v18 = v17;
  v37 = a2;
  v38 = v14;
  v39 = v13;
  v40 = v12;
  v41 = v11;
  v19 = 0;
  v20 = *(_QWORD *)v51;
  LOBYTE(v14) = 1;
  do
  {
    v21 = 0;
    v22 = v19;
    do
    {
      if (*(_QWORD *)v51 != v20)
        objc_enumerationMutation(v16);
      v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v21);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v49 = v22;
      v28 = objc_msgSend(v24, "isClientAuthorizedToWriteObject:sourceBundleIdentifier:clientEntitlements:profile:error:", v23, sourceBundleIdentifier, entitlements, profile, &v49);
      v19 = v49;

      LODWORD(v14) = (v28 == 1) & v14;
      ++v21;
      v22 = v19;
    }
    while (v18 != v21);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  }
  while (v18);

  if ((_DWORD)v14)
  {
    v12 = v40;
    v11 = v41;
    v14 = v38;
    v13 = v39;
LABEL_17:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E6CE7DE0;
    v48 = v13;
    v29 = (void (**)(_QWORD))_Block_copy(aBlock);
    v30 = v29;
    if (v12)
      dispatch_async(v12, v29);
    else
      v29[2](v29);

    v31 = v48;
    goto LABEL_21;
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v42[3] = &unk_1E6CED420;
  v42[4] = self;
  v43 = v16;
  v19 = v19;
  v44 = v19;
  v14 = v38;
  v46 = v37;
  v45 = v38;
  v32 = (void (**)(_QWORD))_Block_copy(v42);
  v33 = v32;
  v12 = v40;
  v11 = v41;
  v13 = v39;
  if (v40)
    dispatch_async(v40, v32);
  else
    v32[2](v32);

  v31 = v43;
LABEL_21:

}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  HDSetHealthInUseDefaultWithReason(CFSTR("Saving objects to the database."));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HDSetHealthInUseDefaultWithReason(CFSTR("Saving objects to the database."));
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6AD8], "hd_sampleTypesForObjects:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s) %@", buf, 0x16u);
    }

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 652, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToSaveObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SEL v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  SEL v46;
  _QWORD aBlock[4];
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[types count] > 0"));

  if (!v13)
    goto LABEL_27;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 671, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_16:
      v19 = 0;
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    goto LABEL_16;
  }
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v50 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (!v17)
  {

    goto LABEL_16;
  }
  v18 = v17;
  v37 = a2;
  v38 = v14;
  v39 = v13;
  v40 = v12;
  v41 = v11;
  v19 = 0;
  v20 = *(_QWORD *)v51;
  LOBYTE(v14) = 1;
  do
  {
    v21 = 0;
    v22 = v19;
    do
    {
      if (*(_QWORD *)v51 != v20)
        objc_enumerationMutation(v16);
      v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v21);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v49 = v22;
      v28 = objc_msgSend(v24, "isClientAuthorizedToWriteType:sourceBundleIdentifier:clientEntitlements:profile:error:", v23, sourceBundleIdentifier, entitlements, profile, &v49);
      v19 = v49;

      LODWORD(v14) = (v28 == 1) & v14;
      ++v21;
      v22 = v19;
    }
    while (v18 != v21);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  }
  while (v18);

  if ((_DWORD)v14)
  {
    v12 = v40;
    v11 = v41;
    v14 = v38;
    v13 = v39;
LABEL_17:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E6CE7DE0;
    v48 = v13;
    v29 = (void (**)(_QWORD))_Block_copy(aBlock);
    v30 = v29;
    if (v12)
      dispatch_async(v12, v29);
    else
      v29[2](v29);

    v31 = v48;
    goto LABEL_21;
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v42[3] = &unk_1E6CED420;
  v42[4] = self;
  v43 = v16;
  v19 = v19;
  v44 = v19;
  v14 = v38;
  v46 = v37;
  v45 = v38;
  v32 = (void (**)(_QWORD))_Block_copy(v42);
  v33 = v32;
  v12 = v40;
  v11 = v41;
  v13 = v39;
  if (v40)
    dispatch_async(v40, v32);
  else
    v32[2](v32);

  v31 = v43;
LABEL_21:

}

uint64_t __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  HDSetHealthInUseDefaultWithReason(CFSTR("Saving objects to the database."));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HDSetHealthInUseDefaultWithReason(CFSTR("Saving objects to the database."));
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6)
      goto LABEL_5;
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v9 = "Client %@ is not write authorized for data type(s) %@";
    v10 = v5;
    v11 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_5;
    v13 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    v9 = "Client %@ is not write authorized for data type(s).";
    v10 = v5;
    v11 = 12;
  }
  _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 713, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToDeleteObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void (**v36)(_QWORD);
  void *v37;
  SEL v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  SEL v47;
  _QWORD aBlock[4];
  id v49;
  char v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 731, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 730, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objects count] > 0"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_6:
      v16 = 0;
      v17 = 0;
LABEL_21:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke;
      aBlock[3] = &unk_1E6CEEF78;
      v49 = v13;
      v50 = v16;
      v33 = (void (**)(_QWORD))_Block_copy(aBlock);
      v34 = v33;
      if (v12)
        dispatch_async(v12, v33);
      else
        v33[2](v33);

      v35 = v49;
      goto LABEL_25;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  v42 = v13;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v22)
  {

    v17 = 0;
    v16 = 1;
    v13 = v42;
    goto LABEL_21;
  }
  v23 = v22;
  v38 = a2;
  v39 = v14;
  v40 = v12;
  v41 = v11;
  v17 = 0;
  v24 = *(_QWORD *)v53;
  LOBYTE(v14) = 1;
  do
  {
    v25 = 0;
    v26 = v17;
    do
    {
      if (*(_QWORD *)v53 != v24)
        objc_enumerationMutation(v21);
      v27 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v25);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v51 = v26;
      v32 = objc_msgSend(v28, "isClientAuthorizedToWriteObject:sourceBundleIdentifier:clientEntitlements:profile:error:", v27, sourceBundleIdentifier, entitlements, profile, &v51);
      v17 = v51;

      LODWORD(v14) = (v32 == 1) & v14;
      ++v25;
      v26 = v17;
    }
    while (v23 != v25);
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  }
  while (v23);

  if ((_DWORD)v14)
  {
    v16 = 1;
    v12 = v40;
    v11 = v41;
    v13 = v42;
    v14 = v39;
    goto LABEL_21;
  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v43[3] = &unk_1E6CED420;
  v43[4] = self;
  v44 = v21;
  v17 = v17;
  v45 = v17;
  v14 = v39;
  v47 = v38;
  v46 = v39;
  v36 = (void (**)(_QWORD))_Block_copy(v43);
  v37 = v36;
  v12 = v40;
  v11 = v41;
  if (v40)
    dispatch_async(v40, v36);
  else
    v36[2](v36);
  v13 = v42;

  v35 = v44;
LABEL_25:

}

uint64_t __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6AD8], "hd_sampleTypesForObjects:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not delete authorized for data type(s) %@", buf, 0x16u);
    }

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not delete authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToDeleteObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *sourceBundleIdentifier;
  _HKEntitlements *entitlements;
  HDProfile *profile;
  uint64_t v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void (**v36)(_QWORD);
  void *v37;
  SEL v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  SEL v47;
  _QWORD aBlock[4];
  id v49;
  char v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v11, "count"))
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 794, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 793, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[types count] > 0"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 795, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler != NULL"));

LABEL_4:
  v15 = -[HDClientAuthorizationOracle clientHasAuthorizationForAllTypes](self, "clientHasAuthorizationForAllTypes");
  if (self)
  {
    if (((-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) | v15) & 1) != 0)
    {
LABEL_6:
      v16 = 0;
      v17 = 0;
LABEL_21:
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke;
      aBlock[3] = &unk_1E6CEEF78;
      v49 = v13;
      v50 = v16;
      v33 = (void (**)(_QWORD))_Block_copy(aBlock);
      v34 = v33;
      if (v12)
        dispatch_async(v12, v33);
      else
        v33[2](v33);

      v35 = v49;
      goto LABEL_25;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  v42 = v13;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v22)
  {

    v17 = 0;
    v16 = 1;
    v13 = v42;
    goto LABEL_21;
  }
  v23 = v22;
  v38 = a2;
  v39 = v14;
  v40 = v12;
  v41 = v11;
  v17 = 0;
  v24 = *(_QWORD *)v53;
  LOBYTE(v14) = 1;
  do
  {
    v25 = 0;
    v26 = v17;
    do
    {
      if (*(_QWORD *)v53 != v24)
        objc_enumerationMutation(v21);
      v27 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v25);
      -[HDProfile authorizationManager](self->_profile, "authorizationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      v51 = v26;
      v32 = objc_msgSend(v28, "isClientAuthorizedToWriteType:sourceBundleIdentifier:clientEntitlements:profile:error:", v27, sourceBundleIdentifier, entitlements, profile, &v51);
      v17 = v51;

      LODWORD(v14) = (v32 == 1) & v14;
      ++v25;
      v26 = v17;
    }
    while (v23 != v25);
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  }
  while (v23);

  if ((_DWORD)v14)
  {
    v16 = 1;
    v12 = v40;
    v11 = v41;
    v13 = v42;
    v14 = v39;
    goto LABEL_21;
  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v43[3] = &unk_1E6CED420;
  v43[4] = self;
  v44 = v21;
  v17 = v17;
  v45 = v17;
  v14 = v39;
  v47 = v38;
  v46 = v39;
  v36 = (void (**)(_QWORD))_Block_copy(v43);
  v37 = v36;
  v12 = v40;
  v11 = v41;
  if (v40)
    dispatch_async(v40, v36);
  else
    v36[2](v36);
  v13 = v42;

  v35 = v44;
LABEL_25:

}

uint64_t __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6)
      goto LABEL_5;
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v9 = "Client %@ is not delete authorized for data type(s) %@";
    v10 = v5;
    v11 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_5;
    v13 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    v16 = v13;
    v9 = "Client %@ is not delete authorized for data type(s).";
    v10 = v5;
    v11 = 12;
  }
  _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("HDClientAuthorizationOracle.m"), 840, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)enqueueObjectAuthorizationRequestWithContext:(id)a3 sourceEntity:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v9 = a5;
  v17 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (self
    && -[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]))
  {
    objc_msgSend(v17, "samples");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v14 + 2))(v14, 0, v15, 0);
  }
  else
  {
    -[HDProfile authorizationManager](self->_profile, "authorizationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "enqueueObjectAuthorizationRequestForBundleIdentifier:context:promptIfNeeded:authorizationNeededHandler:completion:", self->_sourceBundleIdentifier, v17, v9, v13, v14);
  }

}

- (void)handleObjectAuthorizationRequestsWithPromptHandler:(id)a3 completion:(id)a4
{
  HDProfile *profile;
  id v7;
  id v8;
  id v9;

  profile = self->_profile;
  v7 = a4;
  v8 = a3;
  -[HDProfile authorizationManager](profile, "authorizationManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleObjectAuthorizationRequestsForBundleIdentifier:promptHandler:completion:", self->_sourceBundleIdentifier, v8, v7);

}

- (void)createRecalibrateEstimatesRequestRecordForSampleType:(id)a3 sourceEntity:(id)a4 effectiveDate:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, uint64_t);
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  NSString *sourceBundleIdentifier;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  void (**v32)(id, _QWORD, uint64_t);
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, uint64_t))a6;
  if (!v13)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    v19 = CFSTR("Effective date cannot be nil.");
LABEL_14:
    objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, v19);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v29 = (void *)v28;
    v14[2](v14, 0, v28);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "compare:", v15);

  if (v16 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Effective date (%@) cannot be in the future."), v13);
LABEL_16:
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!v11)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    v19 = CFSTR("Sample type cannot be nil.");
    goto LABEL_14;
  }
  if ((objc_msgSend(v11, "allowsRecalibrationForEstimates") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Estimate recalibration is not supported for %@."), v11);
    goto LABEL_16;
  }
  if (!self
    || (-[_HKEntitlements hasEntitlement:](self->_entitlements, "hasEntitlement:", *MEMORY[0x1E0CB47D8]) & 1) == 0)
  {
    -[HDProfile authorizationManager](self->_profile, "authorizationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    v33 = 0;
    objc_msgSend(v20, "authorizationStatusForTypes:bundleIdentifier:error:", v21, sourceBundleIdentifier, &v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;

    objc_msgSend(v23, "objectForKey:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if (objc_msgSend(v25, "integerValue") == 101)
      {

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Client %@ is not authorized to read and share %@."), self->_sourceBundleIdentifier, v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, (uint64_t)v30);

    }
    else
    {
      v14[2](v14, 0, (uint64_t)v24);
    }

    goto LABEL_18;
  }
LABEL_12:
  -[HDProfile authorizationManager](self->_profile, "authorizationManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke;
  v31[3] = &unk_1E6CEEFA0;
  v31[4] = self;
  v32 = v14;
  objc_msgSend(v27, "createRecalibrateEstimatesRequestRecordForSource:sampleType:effectiveDate:handler:", v12, v11, v13, v31);

LABEL_18:
}

void __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v8 = a3;
  if (v5)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke_2;
    v11[3] = &unk_1E6CE8080;
    v11[4] = v9;
    v12 = v5;
    dispatch_async(v10, v11);

  }
  (*(void (**)(_QWORD, id, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v8, v6, v7);

}

void __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

- (void)enqueueAuthorizationRequestToWriteTypes:(id)a3 readTypes:(id)a4 authorizationNeededHandler:(id)a5 requestCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  char v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSString *sourceBundleIdentifier;
  NSObject *queue;
  void *v39;
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  void (**v45)(id, _QWORD, void *);
  id v46;
  char v47;
  uint8_t buf[4];
  NSString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 942, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestCompletionHandler != NULL"));

  }
  if (!objc_msgSend(v11, "count") && !objc_msgSend(v12, "count"))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = objc_opt_class();
    v23 = CFSTR("Must specify types to share or read");
    goto LABEL_35;
  }
  if (objc_msgSend(v11, "count")
    && (objc_msgSend(MEMORY[0x1E0CB6978], "_allowAuthorizationForSharingWithTypes:entitlements:disallowedTypes:", v11, self->_entitlements, 0) & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = objc_opt_class();
    v23 = CFSTR("Invalid types for sharing");
LABEL_35:
    objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v22, a2, v23);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v39);

    goto LABEL_36;
  }
  if (objc_msgSend(v12, "count")
    && (objc_msgSend(MEMORY[0x1E0CB6978], "_allowAuthorizationForReadingWithTypes:entitlements:disallowedTypes:", v12, self->_entitlements, 0) & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = objc_opt_class();
    v23 = CFSTR("Invalid types for reading");
    goto LABEL_35;
  }
  v47 = 0;
  -[HDProfile profileExtensionsConformingToProtocol:](self->_profile, "profileExtensionsConformingToProtocol:", &unk_1EF252278);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v46 = 0;
    v17 = objc_msgSend(v16, "deviceConfigurationSupportsHealthRecords:error:", &v47, &v46);
    v18 = (NSString *)v46;
    v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (v18)
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v19;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to determine Health Records feature availability with error: %{public}@", buf, 0xCu);
        }
      }
    }

    if (v47)
      goto LABEL_24;
  }
  else
  {
    -[HDProfile daemon](self->_profile, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "behavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isAppleWatch");

    if ((v26 & 1) == 0)
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Unable to get Health Records plugin", buf, 2u);
      }
    }
  }
  _HKInitializeLogging();
  v28 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "CHR is not supported, removing clinical types from the request", buf, 2u);
  }
  v29 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB63D8], "allTypes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_minus:", v31);
  v32 = objc_claimAutoreleasedReturnValue();

  v12 = (id)v32;
LABEL_24:
  v33 = objc_msgSend(v11, "count");
  if (v33 + objc_msgSend(v12, "count"))
  {
    _HKInitializeLogging();
    v36 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
    {
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v49 = sourceBundleIdentifier;
      _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "Enqueuing authorization request for %@", buf, 0xCu);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __133__HDClientAuthorizationOracle_enqueueAuthorizationRequestToWriteTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_285;
    block[3] = &unk_1E6CEEFE8;
    block[4] = self;
    v42 = v11;
    v43 = v12;
    v44 = v13;
    v45 = v14;
    dispatch_async(queue, block);

  }
  else
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD, void *))v13 + 2))(v13, v34, 0, 0, &__block_literal_global_284);

    }
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "There are zero types to write and read, not creating an authorization request", buf, 2u);
    }
    v14[2](v14, 1, 0);
  }

LABEL_36:
}

void __133__HDClientAuthorizationOracle_enqueueAuthorizationRequestToWriteTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_285(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD aBlock[5];
  id v24;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(void **)(v2 + 16);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7 = v5;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E6CEF038;
  aBlock[4] = v2;
  v9 = v7;
  v24 = v9;
  v10 = v4;
  v11 = v1;
  v12 = v3;
  v13 = _Block_copy(aBlock);
  if (v6)
  {
    v17 = v8;
    v18 = 3221225472;
    v19 = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_3;
    v20 = &unk_1E6CEF038;
    v21 = v2;
    v22 = v6;
    v14 = _Block_copy(&v17);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(*(id *)(v2 + 8), "authorizationManager", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enqueueAuthorizationRequestForBundleIdentifier:writeTypes:readTypes:authorizationNeededHandler:completion:", v12, v11, v10, v14, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(*(id *)(v2 + 40), "addObject:", v16);

}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6CEF010;
  block[4] = v9;
  v15 = v7;
  v18 = a3;
  v16 = v8;
  v17 = v10;
  v12 = v8;
  v13 = v7;
  dispatch_async(v11, block);

}

uint64_t __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return result;
}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "authorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);

  v10 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E6CED650;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  (*(void (**)(uint64_t, id, uint64_t, id, _QWORD *))(v10 + 16))(v10, v11, a3, v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cancelAuthorizationRequestsWithIdentifiers:", v3);

}

- (void)handleAuthorizationRequestsWithPromptHandler:(id)a3 requestCompletionHandler:(id)a4
{
  -[HDClientAuthorizationOracle handleAuthorizationRequestsForBundleIdentifier:promptHandler:requestCompletionHandler:](self, "handleAuthorizationRequestsForBundleIdentifier:promptHandler:requestCompletionHandler:", self->_sourceBundleIdentifier, a3, a4);
}

- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 requestCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __117__HDClientAuthorizationOracle_handleAuthorizationRequestsForBundleIdentifier_promptHandler_requestCompletionHandler___block_invoke;
  v15[3] = &unk_1E6CED3D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __117__HDClientAuthorizationOracle_handleAuthorizationRequestsForBundleIdentifier_promptHandler_requestCompletionHandler___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "authorizationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAuthorizationRequestsForBundleIdentifier:promptHandler:completion:", a1[5], a1[6], a1[7]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 clientProcess:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *queue;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientAuthorizationOracle.m"), 1089, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != NULL"));

  }
  v12 = *MEMORY[0x1E0CB4800];
  v20 = 0;
  v13 = objc_msgSend(v10, "hasRequiredEntitlement:error:", v12, &v20);
  v14 = v20;
  if ((v13 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __134__HDClientAuthorizationOracle_Privileged__beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_clientProcess_completion___block_invoke;
    block[3] = &unk_1E6CEA160;
    block[4] = self;
    v18 = v9;
    v19 = v11;
    dispatch_async(queue, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v14);
  }

}

void __134__HDClientAuthorizationOracle_Privileged__beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_clientProcess_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  v5 = v4;
  if (v1)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E6CEF060;
    v17 = v4;
    v5 = _Block_copy(aBlock);
    v7 = atomic_load((unsigned __int8 *)(v1 + 64));
    if ((v7 & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = objc_opt_class();
      v10 = CFSTR("Authorization server invalidated");
    }
    else if (*(_QWORD *)(v1 + 56))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = objc_opt_class();
      v10 = CFSTR("There is already an open transaction");
    }
    else
    {
      if (v3)
      {
        objc_msgSend(*(id *)(v1 + 8), "authorizationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_354;
        v13[3] = &unk_1E6CEF0B0;
        v13[4] = v1;
        v14 = v3;
        v15 = v5;
        objc_msgSend(v12, "beginAuthorizationDelegateTransactionWithSessionIdentifier:completion:", v14, v13);

        goto LABEL_7;
      }
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = objc_opt_class();
      v10 = CFSTR("sessionIdentifier may not be nil");
    }
    objc_msgSend(v8, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v9, sel__queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion_, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v5 + 2))(v5, 0, v11);

LABEL_7:
  }

}

void __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Could not begin transaction: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_354(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E6CEF088;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 48);
  block[1] = 3221225472;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = *(id *)(a1 + 48);
  v17 = v6;
  v18 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

uint64_t __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)endAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v8 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__HDClientAuthorizationOracle_Privileged__endAuthorizationRequestDelegateTransactionWithSessionIdentifier_error___block_invoke;
    block[3] = &unk_1E6CE7FB8;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(queue, block);

  }
}

void __113__HDClientAuthorizationOracle_Privileged__endAuthorizationRequestDelegateTransactionWithSessionIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 56);
  if (v3 == v2 || v2 && objc_msgSend(v3, "isEqual:"))
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
    {
      v5 = a1[5];
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "Ending transaction %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(*(id *)(a1[4] + 8), "authorizationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:", *(_QWORD *)(a1[4] + 56), a1[6]);

    v7 = a1[4];
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v10 = a1[5];
      v11 = *(_QWORD *)(a1[4] + 56);
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "No active transaction to end (Ending %{public}@, but active is %{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)updateDefaultAuthorizationStatusesForSource:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *sourceBundleIdentifier;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;

  v5 = a4;
  -[_HKEntitlements typesForReadAuthorizationOverride](self->_entitlements, "typesForReadAuthorizationOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKEntitlements typesForWriteAuthorizationOverride](self->_entitlements, "typesForWriteAuthorizationOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke;
  aBlock[3] = &unk_1E6CE77F0;
  v29 = v5;
  v10 = _Block_copy(aBlock);
  if (objc_msgSend(v8, "count"))
  {
    -[HDProfile authorizationManager](self->_profile, "authorizationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    v27 = 0;
    objc_msgSend(v11, "authorizationStatusForTypes:bundleIdentifier:error:", v8, sourceBundleIdentifier, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    if (v13)
    {
      v19 = v14;
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23[0] = v9;
      v23[1] = 3221225472;
      v23[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_3;
      v23[3] = &unk_1E6CEF0D8;
      v16 = v6;
      v24 = v16;
      v17 = v7;
      v25 = v17;
      v18 = v15;
      v26 = v18;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v23);
      if (objc_msgSend(v18, "count"))
      {
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_4;
        v20[3] = &unk_1E6CE7868;
        v20[4] = self;
        v21 = v18;
        v22 = v10;
        -[HDClientAuthorizationOracle enqueueAuthorizationRequestToWriteTypes:readTypes:authorizationNeededHandler:requestCompletionHandler:](self, "enqueueAuthorizationRequestToWriteTypes:readTypes:authorizationNeededHandler:requestCompletionHandler:", v17, v16, 0, v20);
        -[HDClientAuthorizationOracle handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:](self, "handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:", 0, 0);

      }
      else
      {
        (*((void (**)(void *, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
      }

      v14 = v19;
    }
    else
    {
      (*((void (**)(void *, _QWORD, id))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    (*((void (**)(void *, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

uint64_t __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "integerValue") == 100)
  {
    v5 = objc_msgSend(a1[4], "containsObject:", v11);
    v6 = objc_msgSend(a1[5], "containsObject:", v11);
    v7 = 103;
    if ((v6 & v5) != 0)
      v7 = 101;
    v8 = 104;
    if (v6)
      v8 = 102;
    if (v5)
      v9 = v7;
    else
      v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v10, v11);

  }
}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_4(_QWORD *a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "authorizationManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", a1[5], MEMORY[0x1E0C9AA70], *(_QWORD *)(a1[4] + 16), 2, a1[6]);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

@end
