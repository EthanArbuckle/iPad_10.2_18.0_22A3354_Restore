@implementation _HDOntologyFeatureCoordinatorRequireOperation

- (_HDOntologyFeatureCoordinatorRequireOperation)init
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

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  id *v16;
  char v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id WeakRetained;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  NSArray *v27;
  id *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = self->_items;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v9, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ontologyUpdateCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "featureCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__HDOntologyFeatureCoordinator__processRequiredShardItems_profile_transaction_error___block_invoke;
  v26[3] = &unk_1E6D09C70;
  v15 = v8;
  v27 = v15;
  v16 = v14;
  v28 = v16;
  v29 = &v30;
  v17 = objc_msgSend(v13, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, v10, a5, v26);
  _HKInitializeLogging();
  HKLogHealthOntology();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v11;
    v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: has new required shards %{public}@", buf, 0x16u);

  }
  if (*((_BYTE *)v31 + 24) && v16)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = (uint64_t)v16;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Trigger gated ontology update", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained(v16 + 8);
    objc_msgSend(WeakRetained, "triggerGatedUpdateWithMaximumDelay:completion:", &__block_literal_global_239_0, 5.0);

  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromBool();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *a5;
    *(_DWORD *)buf = 138543874;
    v35 = v11;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v24;
    _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: _processRequiredShardItems success %@: %@", buf, 0x20u);

  }
  _Block_object_dispose(&v30, 8);

  return v17;
}

- (id)transactionContext
{
  void *v2;
  void *v3;

  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsJournalingDuringProtectedRead:", 1);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("items"));
}

- (_HDOntologyFeatureCoordinatorRequireOperation)initWithCoder:(id)a3
{
  id v4;
  _HDOntologyFeatureCoordinatorRequireOperation *v5;
  void *v6;
  uint64_t v7;
  NSArray *items;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HDOntologyFeatureCoordinatorRequireOperation;
  v5 = -[_HDOntologyFeatureCoordinatorRequireOperation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("items"));
    v7 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
