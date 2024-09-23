@implementation HDOntologyDatabase

- (HDOntologyDatabase)init
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

- (HDOntologyDatabase)initWithProfile:(id)a3
{
  id v4;
  HDOntologyDatabase *v5;
  HDOntologyDatabase *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKObserverSet *databaseAvailableObservers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDOntologyDatabase;
  v5 = -[HDOntologyDatabase init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogHealthOntology();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("HDOntologyDatabaseAvailabilityObserver"), v8);
    databaseAvailableObservers = v6->_databaseAvailableObservers;
    v6->_databaseAvailableObservers = (HKObserverSet *)v9;

  }
  return v6;
}

- (BOOL)performTransactionWithError:(id *)a3 transactionHandler:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;

  v6 = a4;
  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = objc_msgSend(v7, "performOntologyTransactionForWrite:profile:databaseTransaction:error:transactionHandler:", 0, WeakRetained, 0, a3, v6);

  return (char)a3;
}

- (id)backingStore
{
  void *v1;
  id v2;
  id WeakRetained;
  void *v4;

  if (a1)
  {
    v1 = *(void **)(a1 + 32);
    if (v1)
    {
      v2 = v1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "daemon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ontologyBackingStore");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)performTransactionWithDatabaseTransaction:(id)a3 error:(id *)a4 transactionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;

  v8 = a5;
  v9 = a3;
  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = objc_msgSend(v10, "performOntologyTransactionForWrite:profile:databaseTransaction:error:transactionHandler:", 0, WeakRetained, v9, a4, v8);

  return (char)a4;
}

- (id)ontologyContentVersionWithError:(id *)a3
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__66;
  v11 = __Block_byref_object_dispose__66;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HDOntologyDatabase_ontologyContentVersionWithError___block_invoke;
  v6[3] = &unk_1E6CF3C38;
  v6[4] = &v7;
  if (-[HDOntologyDatabase performTransactionWithError:transactionHandler:](self, "performTransactionWithError:transactionHandler:", a3, v6))
  {
    v3 = (void *)v8[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __54__HDOntologyDatabase_ontologyContentVersionWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDOntologyDatabase ontologyContentVersionWithTransaction:error:](HDOntologyDatabase, "ontologyContentVersionWithTransaction:error:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

+ (id)ontologyContentVersionWithTransaction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  id v15;

  v5 = a3;
  objc_opt_self();
  +[HDOntologyShardRegistry importedMercuryZipTSVEntriesWithTransaction:error:](HDOntologyShardRegistry, "importedMercuryZipTSVEntriesWithTransaction:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69C0]), "initWithShardEntries:", v6);

  if (!v7)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "isEmptyVersion") & 1) != 0)
  {
    v8 = v5;
    objc_opt_self();
    objc_msgSend(v8, "graphDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    LODWORD(v8) = objc_msgSend(v9, "metadataValueForKey:valueOut:error:", CFSTR("ontologyAssetVersion"), &v15, a4);
    v10 = (__CFString *)v15;

    v11 = 0;
    if ((_DWORD)v8)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB69C0]);
      if (v10)
        v13 = v10;
      else
        v13 = &stru_1E6D11BB8;
      v11 = (void *)objc_msgSend(v12, "initWithString:", v13);
    }

  }
  else
  {
    v7 = v7;
    v11 = v7;
  }
LABEL_13:

  return v11;
}

- (void)ontologyBackingStore:(id)a3 didBecomeAvailable:(BOOL)a4
{
  HKObserverSet *databaseAvailableObservers;
  _QWORD v5[5];
  BOOL v6;

  databaseAvailableObservers = self->_databaseAvailableObservers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__HDOntologyDatabase_ontologyBackingStore_didBecomeAvailable___block_invoke;
  v5[3] = &unk_1E6CF3C60;
  v5[4] = self;
  v6 = a4;
  -[HKObserverSet notifyObservers:](databaseAvailableObservers, "notifyObservers:", v5);
}

uint64_t __62__HDOntologyDatabase_ontologyBackingStore_didBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyDatabase:didBecomeAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isAvailable
{
  void *v2;
  char v3;

  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

- (void)addOntologyDatabaseAvailabilityObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerOntologyDatabase:", self);

  -[HKObserverSet registerObserver:](self->_databaseAvailableObservers, "registerObserver:", v5);
}

- (void)removeOntologyDatabaseAvailabilityObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_databaseAvailableObservers, "unregisterObserver:", a3);
}

- (void)invalidateAndWait
{
  -[HDOntologyBackingStore invalidate](self->_unitTesting_ontologyBackingStore, "invalidate");
}

- (void)unitTesting_close
{
  id v2;

  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "close");

}

- (BOOL)unitTesting_performWriteTransactionWithError:(id *)a3 transactionHandler:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;

  v6 = a4;
  -[HDOntologyDatabase backingStore]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = objc_msgSend(v7, "performOntologyTransactionForWrite:profile:databaseTransaction:error:transactionHandler:", 1, WeakRetained, 0, a3, v6);

  return (char)a3;
}

- (id)unitTesting_schemaVersionWithError:(id *)a3
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__66;
  v11 = __Block_byref_object_dispose__66;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HDOntologyDatabase_unitTesting_schemaVersionWithError___block_invoke;
  v6[3] = &unk_1E6CF3C38;
  v6[4] = &v7;
  if (-[HDOntologyDatabase performTransactionWithError:transactionHandler:](self, "performTransactionWithError:transactionHandler:", a3, v6))
  {
    v3 = (void *)v8[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __57__HDOntologyDatabase_unitTesting_schemaVersionWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "graphDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schemaVersionWithError:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDOntologyBackingStore)unitTesting_ontologyBackingStore
{
  return self->_unitTesting_ontologyBackingStore;
}

- (void)setUnitTesting_ontologyBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyBackingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyBackingStore, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_databaseAvailableObservers, 0);
}

@end
