@implementation ACHEarnedInstanceJournalEntry

- (ACHEarnedInstanceJournalEntry)initWithEarnedInstance:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6
{
  id v11;
  ACHEarnedInstanceJournalEntry *v12;
  ACHEarnedInstanceJournalEntry *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHEarnedInstanceJournalEntry;
  v12 = -[ACHEarnedInstanceJournalEntry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_action = a6;
    objc_storeStrong((id *)&v12->_earnedInstance, a3);
    v13->_provenance = a4;
    v13->_useLegacySyncIdentity = a5;
  }

  return v13;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  id WeakRetained;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke;
  v25[3] = &unk_24D13ABC8;
  v26 = v5;
  v27 = v6;
  v11 = v7;
  v28 = v11;
  v12 = v8;
  v29 = v12;
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke_2;
  v22[3] = &unk_24D13AA18;
  v13 = v27;
  v23 = v13;
  v14 = v26;
  v24 = v14;
  v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](ACHEarnedInstanceEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v9, &v30, v25, v22);
  v16 = v30;

  if (v15)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&journalAppliedObserverLock);
    WeakRetained = objc_loadWeakRetained(&_journalEntryAppliedObserver);

    if (WeakRetained)
    {
      v18 = objc_loadWeakRetained(&_journalEntryAppliedObserver);
      v19 = (void *)objc_msgSend(v11, "copy");
      v20 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v18, "earnedInstanceEntityDidApplyJournalEntriesInsertedEarnedInstances:removedEarnedInstances:", v19, v20);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&journalAppliedObserverLock);
  }
  else
  {
    ACHLogDatabase();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      v33 = 2114;
      v34 = v16;
      _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Error applying journaled earned instances: %@: %{public}@", buf, 0x16u);
    }

  }
}

uint64_t __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = 0x24D139000uLL;
  v26 = a2;
  objc_msgSend(v26, "databaseForEntityClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    LOBYTE(v28) = 1;
    while (1)
    {
      v8 = 0;
      v27 = v6;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "action", v25);
        if (v10 != 1)
        {
          if (v10)
            goto LABEL_16;
          objc_msgSend(v9, "earnedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ACHEarnedInstanceSyncIdentityFromEarnedInstance(v11, objc_msgSend(v9, "useLegacySyncIdentity"), *(void **)(a1 + 40), v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v4;
          v14 = *(void **)(v4 + 2608);
          objc_msgSend(v9, "earnedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v9, "provenance");
          objc_msgSend(v12, "entity");
          v17 = a1;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_insertEarnedInstance:provenance:syncIdentity:database:error:", v15, v16, objc_msgSend(v18, "persistentID"), v25, a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v9, "earnedInstance");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "copy");

            objc_msgSend(v21, "setKey:", objc_msgSend(v19, "persistentID"));
            objc_msgSend(*(id *)(v17 + 48), "addObject:", v21);

          }
          else
          {
            LOBYTE(v28) = 0;
          }
          v4 = v13;
          a1 = v17;
          v6 = v27;
          goto LABEL_14;
        }
        objc_msgSend(v9, "earnedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(*(id *)(v4 + 2608), "removeEarnedInstances:profile:error:", v12, *(_QWORD *)(a1 + 40), a3);
        if (v28)
        {
          v23 = *(void **)(a1 + 56);
          objc_msgSend(v9, "earnedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v19);
LABEL_14:

        }
LABEL_16:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (!v6)
        goto LABEL_20;
    }
  }
  LOBYTE(v28) = 1;
LABEL_20:

  return v28 & 1;
}

uint64_t __58__ACHEarnedInstanceJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addJournalEntries:error:", *(_QWORD *)(a1 + 40), a3);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHEarnedInstanceJournalEntry)initWithCoder:(id)a3
{
  id v4;
  ACHEarnedInstanceJournalEntry *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  ACHEarnedInstance *earnedInstance;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHEarnedInstanceJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earnedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017F0]), "initWithData:", v6);
      if (v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE01830]), "initWithCodable:", v7);
        earnedInstance = v5->_earnedInstance;
        v5->_earnedInstance = (ACHEarnedInstance *)v8;

        -[ACHEarnedInstance setKey:](v5->_earnedInstance, "setKey:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("persistentID")));
      }

    }
    v5->_provenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provenance"));
    v5->_useLegacySyncIdentity = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("useLegacySyncIdentity")))
      v5->_useLegacySyncIdentity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLegacySyncIdentity"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", self->_action, CFSTR("action"));
  -[ACHEarnedInstanceJournalEntry earnedInstance](self, "earnedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ACHCodableFromEarnedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("earnedInstance"));
    -[ACHEarnedInstanceJournalEntry earnedInstance](self, "earnedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeInt64:forKey:", objc_msgSend(v7, "key"), CFSTR("persistentID"));

  }
  objc_msgSend(v8, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));
  objc_msgSend(v8, "encodeBool:forKey:", self->_useLegacySyncIdentity, CFSTR("useLegacySyncIdentity"));

}

- (int64_t)action
{
  return self->_action;
}

- (ACHEarnedInstance)earnedInstance
{
  return self->_earnedInstance;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (BOOL)useLegacySyncIdentity
{
  return self->_useLegacySyncIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earnedInstance, 0);
}

@end
