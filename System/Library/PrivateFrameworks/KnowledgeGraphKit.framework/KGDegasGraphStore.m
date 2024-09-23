@implementation KGDegasGraphStore

- (KGDegasGraphStore)initWithURL:(id)a3
{
  id v5;
  KGDegasGraphStore *v6;
  KGDegasGraphStore *v7;
  KGDegasGraphStore *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KGDegasGraphStore;
  v6 = -[KGDegasGraphStore init](&v12, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  if (v5)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_url, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  KGLoggingConnection();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1CA0A5000, v9, OS_LOG_TYPE_ERROR, "Failed to instantiate graph store, url is nil", v11, 2u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)graphVersion
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[KGDatabase graphVersion](self->_database, "graphVersion");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setGraphVersion:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase setGraphVersion:](self->_database, "setGraphVersion:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_graphIdentifier
{
  os_unfair_lock_assert_owner(&self->_lock);
  return -[KGDatabase graphIdentifier](self->_database, "graphIdentifier");
}

- (NSUUID)graphIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDegasGraphStore _lock_graphIdentifier](self, "_lock_graphIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSUUID *)v4;
}

- (BOOL)noFatalError
{
  return -[KGDatabase noFatalError](self->_database, "noFatalError");
}

- (void)enableInTransactionCheck
{
  self->_inTransactionCheckIsEnabled = 1;
}

- (BOOL)addNodes:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase addNodes:error:](self->_database, "addNodes:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)addEdges:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase addEdges:error:](self->_database, "addEdges:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (void)_lock_enumerateNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  KGDatabase *database;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  database = self->_database;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__KGDegasGraphStore__lock_enumerateNodesWithIdentifiers_entityFactory_block___block_invoke;
  v14[3] = &unk_1E83E2550;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[KGDatabase enumerateNodesWithIdentifiers:block:](database, "enumerateNodesWithIdentifiers:block:", v10, v14);

}

- (id)arrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  p_lock = &self->_lock;
  v8 = a4;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__KGDegasGraphStore_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v13[3] = &unk_1E83E2578;
  v11 = v10;
  v14 = v11;
  -[KGDegasGraphStore _lock_enumerateNodesWithIdentifiers:entityFactory:block:](self, "_lock_enumerateNodesWithIdentifiers:entityFactory:block:", v9, v8, v13);

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)orderedArrayOfNodesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  KGElementIdentifierSet *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  os_unfair_lock_t lock;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[KGElementIdentifierSet initWithIndexArray:]([KGElementIdentifierSet alloc], "initWithIndexArray:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[KGElementIdentifierSet count](v9, "count"));
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __76__KGDegasGraphStore_orderedArrayOfNodesWithIdentifiers_entityFactory_error___block_invoke;
  v38[3] = &unk_1E83E2578;
  v12 = v11;
  v39 = v12;
  v29 = v8;
  -[KGDegasGraphStore _lock_enumerateNodesWithIdentifiers:entityFactory:block:](self, "_lock_enumerateNodesWithIdentifiers:entityFactory:block:", v9, v8, v38);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "identifier", lock));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v15);
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = v7;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), lock);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v20, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v23);
  }

  os_unfair_lock_unlock(lock);
  return v20;
}

- (id)_lock_nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v7;
  KGElementIdentifierSet *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__661;
  v16 = __Block_byref_object_dispose__662;
  v17 = 0;
  v8 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__KGDegasGraphStore__lock_nodeForIdentifier_entityFactory_error___block_invoke;
  v11[3] = &unk_1E83E25A0;
  v11[4] = &v12;
  -[KGDegasGraphStore _lock_enumerateNodesWithIdentifiers:entityFactory:block:](self, "_lock_enumerateNodesWithIdentifiers:entityFactory:block:", v8, v7, v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)nodeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_nodeForIdentifier:entityFactory:error:](self, "_lock_nodeForIdentifier:entityFactory:error:", a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)_lock_enumerateEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  KGDatabase *database;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase allNodeIdentifiersOfEdgesWithIdentifiers:error:](self->_database, "allNodeIdentifiersOfEdgesWithIdentifiers:error:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke;
    v30[3] = &unk_1E83E2578;
    v16 = v14;
    v31 = v16;
    -[KGDegasGraphStore _lock_enumerateNodesWithIdentifiers:entityFactory:block:](self, "_lock_enumerateNodesWithIdentifiers:entityFactory:block:", v13, v11, v30);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    database = self->_database;
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke_2;
    v21[3] = &unk_1E83E25C8;
    v18 = v16;
    v22 = v18;
    v23 = v11;
    v25 = &v26;
    v24 = v12;
    -[KGDatabase enumerateEdgesWithIdentifiers:block:](database, "enumerateEdgesWithIdentifiers:block:", v10, v21);
    v19 = *((_BYTE *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)arrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__KGDegasGraphStore_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v14[3] = &unk_1E83E25F0;
  v12 = v11;
  v15 = v12;
  -[KGDegasGraphStore _lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:](self, "_lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:", v10, v9, a5, v14);

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)orderedArrayOfEdgesWithIdentifiers:(id)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KGElementIdentifierSet *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  os_unfair_lock_t lock;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = -[KGElementIdentifierSet initWithIndexArray:]([KGElementIdentifierSet alloc], "initWithIndexArray:", v8);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[KGElementIdentifierSet count](v10, "count"));
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __76__KGDegasGraphStore_orderedArrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke;
  v39[3] = &unk_1E83E25F0;
  v13 = v12;
  v40 = v13;
  v30 = v9;
  -[KGDegasGraphStore _lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:](self, "_lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:", v10, v9, a5, v39);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier", lock));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v16);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), lock);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v21, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v24);
  }

  os_unfair_lock_unlock(lock);
  return v21;
}

- (id)edgeForIdentifier:(unint64_t)a3 entityFactory:(id)a4 error:(id *)a5
{
  id v8;
  KGElementIdentifierSet *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__661;
  v17 = __Block_byref_object_dispose__662;
  v18 = 0;
  v9 = -[KGElementIdentifierSet initWithElementIdentifier:]([KGElementIdentifierSet alloc], "initWithElementIdentifier:", a3);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__KGDegasGraphStore_edgeForIdentifier_entityFactory_error___block_invoke;
  v12[3] = &unk_1E83E2618;
  v12[4] = &v13;
  -[KGDegasGraphStore _lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:](self, "_lock_enumerateEdgesWithIdentifiers:entityFactory:error:block:", v9, v8, a5, v12);
  os_unfair_lock_unlock(&self->_lock);
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (BOOL)_lock_filterNodesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v8 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v10, "count"))
  {
    v11 = *a5;
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "count"))
    {
      v16 = 1;
    }
    else
    {
      -[KGDatabase intersectionOfNodesWithLabels:filterNodeIdentifiers:error:](self->_database, "intersectionOfNodesWithLabels:filterNodeIdentifiers:error:", v10, v12, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KGDatabase intersectionOfTombstoneNodesWithLabels:filterNodeIdentifiers:error:](self->_database, "intersectionOfTombstoneNodesWithLabels:filterNodeIdentifiers:error:", v10, v12, a6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifierSetByFormingUnion:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      v16 = v13 != 0;
      if (v13)
        objc_storeStrong(a5, v13);

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)_lock_filterNodesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v8 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v10, "count"))
  {
    v11 = *a5;
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "count"))
    {
      v16 = 1;
    }
    else
    {
      -[KGDatabase unionOfNodesWithLabels:filterNodeIdentifiers:error:](self->_database, "unionOfNodesWithLabels:filterNodeIdentifiers:error:", v10, v12, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KGDatabase unionOfTombstoneNodesWithLabels:filterNodeIdentifiers:error:](self->_database, "unionOfTombstoneNodesWithLabels:filterNodeIdentifiers:error:", v10, v12, a6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifierSetByFormingUnion:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      v16 = v13 != 0;
      if (v13)
        objc_storeStrong(a5, v13);

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)_resolvedPropertyValue:(id)a3 isScalar:(BOOL *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      if (v6 == 1)
      {
        objc_msgSend(v5, "firstObject");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v9 = (void *)v7;
        goto LABEL_13;
      }
      goto LABEL_16;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 1;
      if (!a4)
        return v5;
      goto LABEL_14;
    }
    v8 = objc_msgSend(v5, "count");
    if (v8)
    {
      if (v8 == 1)
      {
        objc_msgSend(v5, "anyObject");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
LABEL_16:
      v10 = 0;
      if (!a4)
        return v5;
      goto LABEL_14;
    }
  }
  v9 = 0;
LABEL_13:

  v10 = 1;
  v5 = v9;
  if (a4)
LABEL_14:
    *a4 = v10;
  return v5;
}

- (BOOL)_lock_filterNodesWithProperties:(id)a3 includeTombstones:(BOOL)a4 nodeIdentifiers:(id *)a5 error:(id *)a6
{
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  KGDatabase *database;
  void *v19;
  id *v20;
  void *v21;
  KGDatabase *v22;
  void *v23;
  uint64_t v24;
  KGDatabase *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  KGMutableElementIdentifierSet *v34;
  id v35;
  id v36;
  KGDatabase *v38;
  id *v39;
  id v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  _BOOL4 v44;
  id obj;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v44 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (id *)*a5;
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "isEmpty") & 1) != 0)
    {
      LOBYTE(a5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v9;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (!v43)
    {
LABEL_40:

      if (v11)
      {
        v11 = v11;
        obj = *a5;
        *a5 = v11;
        LOBYTE(a5) = 1;
LABEL_42:

      }
      else
      {
        LOBYTE(a5) = 0;
      }
      goto LABEL_44;
    }
    v12 = *(_QWORD *)v48;
    v41 = *(_QWORD *)v48;
    v42 = a6;
    v39 = a5;
    v40 = v9;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v12)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v13);
      objc_msgSend(obj, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 1;
      -[KGDegasGraphStore _resolvedPropertyValue:isScalar:](self, "_resolvedPropertyValue:isScalar:", v15, &v46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v34 = objc_alloc_init(KGMutableElementIdentifierSet);
        v35 = *v39;
        *v39 = v34;

        LOBYTE(a5) = 1;
LABEL_38:
        v9 = v40;
        goto LABEL_42;
      }
      if (!v46)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        database = self->_database;
        objc_msgSend(v17, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](database, "filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v19, objc_msgSend(v17, "comparator"), v11, a6);
        v20 = a6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v22 = self->_database;
          objc_msgSend(v17, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](v22, "filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v23, objc_msgSend(v17, "comparator"), v11, v20);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[KGDatabase filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](self->_database, "filterNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v16, 1, v11, a6);
          a5 = (id *)objc_claimAutoreleasedReturnValue();
          if (!v44)
            goto LABEL_27;
          -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:](self->_database, "filterTombstoneNodeIdentifiersForPropertyName:value:comparator:nodeIdentifiers:error:", v14, v16, 1, v11, a6);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        v17 = v16;
        v25 = self->_database;
        objc_msgSend(v17, "value1");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value2");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase filterNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:](v25, "filterNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:", v14, v26, v27, objc_msgSend(v17, "comparator"), v11, a6);
        v28 = a6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v38 = self->_database;
          objc_msgSend(v17, "value1");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value2");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:](v38, "filterTombstoneNodeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:nodeIdentifiers:error:", v14, v29, v30, objc_msgSend(v17, "comparator"), v11, v28);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_20:
          objc_msgSend(v21, "identifierSetByFormingUnion:", a5);
          v31 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v31;
          v12 = v41;
LABEL_25:

          goto LABEL_26;
        }
      }
      v12 = v41;
LABEL_26:

      a5 = (id *)v21;
      a6 = v42;
LABEL_27:
      if (!a5)
      {
        v36 = *v39;
        *v39 = 0;

        goto LABEL_38;
      }
      if (v11)
      {
        objc_msgSend(v11, "identifierSetByIntersectingIdentifierSet:", a5);
        v32 = objc_claimAutoreleasedReturnValue();

        v11 = (id *)v32;
      }
      else
      {
        v11 = a5;
      }
      v33 = objc_msgSend(v11, "count");

      if (!v33)
      {
        a5 = v39;
        v9 = v40;
        goto LABEL_40;
      }
      if (v43 == ++v13)
      {
        a5 = v39;
        v9 = v40;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v43)
          goto LABEL_7;
        goto LABEL_40;
      }
    }
    -[KGDatabase filterNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:](self->_database, "filterNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:", v14, v16, 1, v11, a6);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_27;
    -[KGDatabase filterTombstoneNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:](self->_database, "filterTombstoneNodeIdentifiersForPropertyName:values:comparator:nodeIdentifiers:error:", v14, v16, 1, v11, a6);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v17 = (id)v24;
    objc_msgSend(a5, "identifierSetByFormingUnion:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_45:

  return (char)a5;
}

- (id)_lock_nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  KGDatabase *v12;
  void *v13;
  id v14;
  id v15;
  KGDatabase *database;
  void *v17;
  id v18;
  int v19;
  void *v20;
  KGDatabase *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  BOOL v32;
  KGDatabase *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = v9;
  v47 = v10;
  v11 = (void *)MEMORY[0x1CAA4B20C]();
  if (!objc_msgSend(v8, "whereNoInAndOutEdges"))
  {
    if (objc_msgSend(v8, "whereNoInEdges"))
    {
      database = self->_database;
      v45 = 0;
      -[KGDatabase nodeIdentifiersWhereNoInEdgesWithError:](database, "nodeIdentifiersWhereNoInEdgesWithError:", &v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v45;
      if (v17)
      {
        if (v10)
        {
          objc_msgSend(v10, "identifierSetByIntersectingIdentifierSet:", v17);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v47 = v18;

        }
        else
        {
          v18 = v17;
          v47 = v18;
        }

        if ((objc_msgSend(v8, "whereNoOutEdges") & 1) == 0)
        {
          v15 = v18;
          goto LABEL_26;
        }
        v19 = 1;
        goto LABEL_20;
      }
      if ((objc_msgSend(v8, "whereNoOutEdges") & 1) == 0)
        goto LABEL_37;
      v19 = 0;
    }
    else
    {
      v14 = 0;
      if (!objc_msgSend(v8, "whereNoOutEdges"))
      {
        v15 = v10;
        goto LABEL_26;
      }
      v19 = 1;
    }
    v18 = v10;
LABEL_20:
    v20 = v14;
    v21 = self->_database;
    v44 = v14;
    -[KGDatabase nodeIdentifiersWhereNoOutEdgesWithError:](v21, "nodeIdentifiersWhereNoOutEdgesWithError:", &v44);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v44;

    if (!v15)
      goto LABEL_37;
    if (v18)
    {
      objc_msgSend(v18, "identifierSetByIntersectingIdentifierSet:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v47;
      v47 = v22;

      v15 = v22;
      if (!v19)
        goto LABEL_37;
    }
    else
    {
      v47 = v15;
      if ((v19 & 1) == 0)
        goto LABEL_37;
    }
    goto LABEL_26;
  }
  v12 = self->_database;
  v46 = 0;
  -[KGDatabase nodeIdentifiersWhereNoEdgesWithError:](v12, "nodeIdentifiersWhereNoEdgesWithError:", &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;
  if (!v13)
    goto LABEL_37;
  if (v10)
  {
    objc_msgSend(v10, "identifierSetByIntersectingIdentifierSet:", v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v15;

  }
  else
  {
    v15 = v13;
    v47 = v15;
  }

LABEL_26:
  if (!objc_msgSend(v8, "noLabelsOrProperties"))
  {
    objc_msgSend(v8, "requiredLabels");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v14;
    v26 = -[KGDegasGraphStore _lock_filterNodesWithRequiredLabels:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithRequiredLabels:includeTombstones:nodeIdentifiers:error:", v25, objc_msgSend(v8, "includeTombstones"), &v47, &v42);
    v27 = v42;

    if (v26)
    {
      objc_msgSend(v8, "optionalLabels");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v27;
      v29 = -[KGDegasGraphStore _lock_filterNodesWithOptionalLabels:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithOptionalLabels:includeTombstones:nodeIdentifiers:error:", v28, objc_msgSend(v8, "includeTombstones"), &v47, &v41);
      v30 = v41;

      if (v29)
      {
        objc_msgSend(v8, "properties");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v30;
        v32 = -[KGDegasGraphStore _lock_filterNodesWithProperties:includeTombstones:nodeIdentifiers:error:](self, "_lock_filterNodesWithProperties:includeTombstones:nodeIdentifiers:error:", v31, objc_msgSend(v8, "includeTombstones"), &v47, &v40);
        v14 = v40;

        if (v32)
          goto LABEL_28;
      }
      else
      {
        v14 = v30;
      }
    }
    else
    {
      v14 = v27;
    }
LABEL_37:
    v14 = v14;
    v36 = v47;
    v47 = 0;

    v24 = v14;
    goto LABEL_38;
  }
  if (!v15)
  {
    v33 = self->_database;
    v43 = v14;
    -[KGDatabase allNodesWithError:](v33, "allNodesWithError:", &v43);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v43;

    v47 = v34;
    v24 = 0;
    v14 = v35;
    if (v34)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_28:
  v24 = 0;
LABEL_38:

  objc_autoreleasePoolPop(v11);
  v37 = v47;
  if (a5 && !v47)
  {
    *a5 = objc_retainAutorelease(v24);
    v37 = v47;
  }
  v38 = v37;

  return v38;
}

- (id)nodeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (BOOL)_lock_filterEdgesWithRequiredLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v8 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v10, "count"))
  {
    v11 = *a5;
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "count"))
    {
      v16 = 1;
    }
    else
    {
      -[KGDatabase intersectionOfEdgesWithLabels:filterEdgeIdentifiers:error:](self->_database, "intersectionOfEdgesWithLabels:filterEdgeIdentifiers:error:", v10, v12, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KGDatabase intersectionOfTombstoneEdgesWithLabels:filterEdgeIdentifiers:error:](self->_database, "intersectionOfTombstoneEdgesWithLabels:filterEdgeIdentifiers:error:", v10, v12, a6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifierSetByFormingUnion:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      v16 = v13 != 0;
      if (v13)
        objc_storeStrong(a5, v13);

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)_lock_filterEdgesWithOptionalLabels:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v8 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v10, "count"))
  {
    v11 = *a5;
    v12 = v11;
    if (v11 && !objc_msgSend(v11, "count"))
    {
      v16 = 1;
    }
    else
    {
      -[KGDatabase unionOfEdgesWithLabels:filterEdgeIdentifiers:error:](self->_database, "unionOfEdgesWithLabels:filterEdgeIdentifiers:error:", v10, v12, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[KGDatabase unionOfTombstoneEdgesWithLabels:filterEdgeIdentifiers:error:](self->_database, "unionOfTombstoneEdgesWithLabels:filterEdgeIdentifiers:error:", v10, v12, a6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifierSetByFormingUnion:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      v16 = v13 != 0;
      if (v13)
        objc_storeStrong(a5, v13);

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)_lock_filterEdgesWithProperties:(id)a3 includeTombstones:(BOOL)a4 edgeIdentifiers:(id *)a5 error:(id *)a6
{
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  KGDatabase *database;
  void *v19;
  id *v20;
  void *v21;
  KGDatabase *v22;
  void *v23;
  uint64_t v24;
  KGDatabase *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  KGMutableElementIdentifierSet *v34;
  id v35;
  id v36;
  KGDatabase *v38;
  id *v39;
  id v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  _BOOL4 v44;
  id obj;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v44 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (id *)*a5;
    v11 = v10;
    if (v10 && (objc_msgSend(v10, "isEmpty") & 1) != 0)
    {
      LOBYTE(a5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v9;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (!v43)
    {
LABEL_40:

      if (v11)
      {
        v11 = v11;
        obj = *a5;
        *a5 = v11;
        LOBYTE(a5) = 1;
LABEL_42:

      }
      else
      {
        LOBYTE(a5) = 0;
      }
      goto LABEL_44;
    }
    v12 = *(_QWORD *)v48;
    v41 = *(_QWORD *)v48;
    v42 = a6;
    v39 = a5;
    v40 = v9;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v12)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v13);
      objc_msgSend(obj, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 1;
      -[KGDegasGraphStore _resolvedPropertyValue:isScalar:](self, "_resolvedPropertyValue:isScalar:", v15, &v46);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v34 = objc_alloc_init(KGMutableElementIdentifierSet);
        v35 = *v39;
        *v39 = v34;

        LOBYTE(a5) = 1;
LABEL_38:
        v9 = v40;
        goto LABEL_42;
      }
      if (!v46)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        database = self->_database;
        objc_msgSend(v17, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](database, "filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v19, objc_msgSend(v17, "comparator"), v11, a6);
        v20 = a6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v22 = self->_database;
          objc_msgSend(v17, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](v22, "filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v23, objc_msgSend(v17, "comparator"), v11, v20);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[KGDatabase filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](self->_database, "filterEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v16, 1, v11, a6);
          a5 = (id *)objc_claimAutoreleasedReturnValue();
          if (!v44)
            goto LABEL_27;
          -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:](self->_database, "filterTombstoneEdgeIdentifiersForPropertyName:value:comparator:edgeIdentifiers:error:", v14, v16, 1, v11, a6);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        v17 = v16;
        v25 = self->_database;
        objc_msgSend(v17, "value1");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value2");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGDatabase filterEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:](v25, "filterEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:", v14, v26, v27, objc_msgSend(v17, "comparator"), v11, a6);
        v28 = a6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          v38 = self->_database;
          objc_msgSend(v17, "value1");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value2");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:](v38, "filterTombstoneEdgeIdentifiersForPropertyName:rangeValue1:rangeValue2:comparator:edgeIdentifiers:error:", v14, v29, v30, objc_msgSend(v17, "comparator"), v11, v28);
          a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_20:
          objc_msgSend(v21, "identifierSetByFormingUnion:", a5);
          v31 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v31;
          v12 = v41;
LABEL_25:

          goto LABEL_26;
        }
      }
      v12 = v41;
LABEL_26:

      a5 = (id *)v21;
      a6 = v42;
LABEL_27:
      if (!a5)
      {
        v36 = *v39;
        *v39 = 0;

        goto LABEL_38;
      }
      if (v11)
      {
        objc_msgSend(v11, "identifierSetByIntersectingIdentifierSet:", a5);
        v32 = objc_claimAutoreleasedReturnValue();

        v11 = (id *)v32;
      }
      else
      {
        v11 = a5;
      }
      v33 = objc_msgSend(v11, "isEmpty");

      if ((v33 & 1) != 0)
      {
        a5 = v39;
        v9 = v40;
        goto LABEL_40;
      }
      if (v43 == ++v13)
      {
        a5 = v39;
        v9 = v40;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v43)
          goto LABEL_7;
        goto LABEL_40;
      }
    }
    -[KGDatabase filterEdgeIdentifiersForPropertyName:values:comparator:edgeIdentifiers:error:](self->_database, "filterEdgeIdentifiersForPropertyName:values:comparator:edgeIdentifiers:error:", v14, v16, 1, v11, a6);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_27;
    -[KGDatabase filterTombstoneEdgeIdentifiersForPropertyName:values:comparator:edgeIdentifiers:error:](self->_database, "filterTombstoneEdgeIdentifiersForPropertyName:values:comparator:edgeIdentifiers:error:", v14, v16, 1, v11, a6);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v17 = (id)v24;
    objc_msgSend(a5, "identifierSetByFormingUnion:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  LOBYTE(a5) = 1;
LABEL_45:

  return (char)a5;
}

- (id)_lock_edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  KGDatabase *database;
  void *v21;
  id v22;
  id v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = v9;
  v29 = v10;
  v11 = (void *)MEMORY[0x1CAA4B20C]();
  if (objc_msgSend(v8, "noLabelsOrProperties"))
  {
    if (v10)
    {
      v12 = 0;
LABEL_9:

      objc_autoreleasePoolPop(v11);
      v12 = 0;
      goto LABEL_13;
    }
    database = self->_database;
    v28 = 0;
    -[KGDatabase allEdgesWithError:](database, "allEdgesWithError:", &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;
    v29 = v21;
    if (v21)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v8, "requiredLabels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v14 = -[KGDegasGraphStore _lock_filterEdgesWithRequiredLabels:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithRequiredLabels:includeTombstones:edgeIdentifiers:error:", v13, objc_msgSend(v8, "includeTombstones"), &v29, &v27);
    v12 = v27;

    if (v14)
    {
      objc_msgSend(v8, "optionalLabels");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      v16 = -[KGDegasGraphStore _lock_filterEdgesWithOptionalLabels:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithOptionalLabels:includeTombstones:edgeIdentifiers:error:", v15, objc_msgSend(v8, "includeTombstones"), &v29, &v26);
      v17 = v26;

      if (v16)
      {
        objc_msgSend(v8, "properties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v17;
        v19 = -[KGDegasGraphStore _lock_filterEdgesWithProperties:includeTombstones:edgeIdentifiers:error:](self, "_lock_filterEdgesWithProperties:includeTombstones:edgeIdentifiers:error:", v18, objc_msgSend(v8, "includeTombstones"), &v29, &v25);
        v12 = v25;

        if (v19)
          goto LABEL_9;
      }
      else
      {
        v12 = v17;
      }
    }
  }
  v22 = v29;
  v29 = 0;

  objc_autoreleasePoolPop(v11);
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    *a5 = v12;
  }
LABEL_13:
  v23 = v29;

  return v23;
}

- (id)edgeIdentifiersMatchingFilter:(id)a3 intersectingIdentifiers:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;

  p_lock = &self->_lock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  KGElementIdentifierSet *v9;
  KGElementIdentifierSet *v10;
  uint64_t v11;
  KGElementIdentifierSet *v12;

  v6 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v9 = objc_alloc_init(KGElementIdentifierSet);
  v10 = objc_alloc_init(KGElementIdentifierSet);
  if ((v6 & 1) != 0
    && (-[KGDatabase inEdgeIdentifiersOfNodesWithIdentifiers:error:](self->_database, "inEdgeIdentifiersOfNodesWithIdentifiers:error:", v8, a5), v11 = objc_claimAutoreleasedReturnValue(), v9, (v9 = (KGElementIdentifierSet *)v11) == 0))
  {
    v12 = 0;
  }
  else if ((v6 & 2) == 0
         || (-[KGDatabase outEdgeIdentifiersOfNodesWithIdentifiers:error:](self->_database, "outEdgeIdentifiersOfNodesWithIdentifiers:error:", v8, a5), v12 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue(), v10, (v10 = v12) != 0))
  {
    if (-[KGElementIdentifierSet isEmpty](v9, "isEmpty"))
    {
      v12 = v10;
      v10 = v12;
    }
    else if (-[KGElementIdentifierSet isEmpty](v10, "isEmpty"))
    {
      v12 = v9;
      v9 = v12;
    }
    else
    {
      -[KGElementIdentifierSet identifierSetByFormingUnion:](v9, "identifierSetByFormingUnion:", v10);
      v12 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:](self, "_lock_edgeIdentifiersWithStartNodeIdentifiers:edgeDirection:error:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  char v7;
  id v10;
  id v11;
  KGElementIdentifierSet *v12;
  KGElementIdentifierSet *v13;
  id v14;
  void *v15;
  void *v16;
  KGElementIdentifierSet *v17;
  KGElementIdentifierSet *v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v12 = objc_alloc_init(KGElementIdentifierSet);
  v13 = objc_alloc_init(KGElementIdentifierSet);
  v14 = v11;
  v15 = v14;
  if ((v7 & 1) != 0)
  {
    -[KGDatabase filterInEdgeIdentifiersOfNodesWithIdentifiers:filterEdgeIdentifiers:error:](self->_database, "filterInEdgeIdentifiersOfNodesWithIdentifiers:filterEdgeIdentifiers:error:", v10, v14, a6);
    v17 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = 0;
      v12 = 0;
      v16 = v15;
      goto LABEL_18;
    }
    if ((v7 & 2) != 0)
    {
      -[KGElementIdentifierSet identifierSetByIntersectingIdentifierSet:](v17, "identifierSetByIntersectingIdentifierSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
LABEL_10:
      -[KGDatabase filterOutEdgeIdentifiersOfNodesWithIdentifiers:filterEdgeIdentifiers:error:](self->_database, "filterOutEdgeIdentifiersOfNodesWithIdentifiers:filterEdgeIdentifiers:error:", v10, v16, a6);
      v18 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v13 = 0;
        goto LABEL_18;
      }
      v13 = v18;
      goto LABEL_12;
    }
    v12 = v17;
  }
  else
  {
    v16 = v14;
    if ((v7 & 2) != 0)
      goto LABEL_10;
  }
  v16 = v15;
LABEL_12:
  if (-[KGElementIdentifierSet isEmpty](v12, "isEmpty"))
  {
    v18 = v13;
    v13 = v18;
  }
  else if (-[KGElementIdentifierSet isEmpty](v13, "isEmpty"))
  {
    v18 = v12;
    v12 = v18;
  }
  else
  {
    -[KGElementIdentifierSet identifierSetByFormingUnion:](v12, "identifierSetByFormingUnion:", v13);
    v18 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v18;
}

- (id)edgeIdentifiersWithStartNodeIdentifiers:(id)a3 intersectingEdgeIdentifiers:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  os_unfair_lock_s *p_lock;
  id v11;
  id v12;
  void *v13;

  p_lock = &self->_lock;
  v11 = a4;
  v12 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_edgeIdentifiersWithStartNodeIdentifiers:intersectingEdgeIdentifiers:edgeDirection:error:](self, "_lock_edgeIdentifiersWithStartNodeIdentifiers:intersectingEdgeIdentifiers:edgeDirection:error:", v12, v11, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (id)edgeIdentifiersBetween:(id)a3 endNodeIdentifiers:(id)a4 edgeFilter:(id)a5 edgeDirection:(unint64_t)a6 error:(id *)a7
{
  char v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if ((v8 & 2) != 0)
  {
    -[KGDatabase filterEdgeIdentifiersBetween:targetNodeIdentifiers:filterEdgeIdentifiers:error:](self->_database, "filterEdgeIdentifiersBetween:targetNodeIdentifiers:filterEdgeIdentifiers:error:", v12, v13, 0, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      os_unfair_lock_unlock(&self->_lock);
      goto LABEL_13;
    }
  }
  else
  {
    v15 = 0;
  }
  if ((v8 & 1) == 0)
  {
    v16 = 0;
    if (!v15)
      goto LABEL_10;
    goto LABEL_15;
  }
  -[KGDatabase filterEdgeIdentifiersBetween:targetNodeIdentifiers:filterEdgeIdentifiers:error:](self->_database, "filterEdgeIdentifiersBetween:targetNodeIdentifiers:filterEdgeIdentifiers:error:", v13, v12, 0, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v16 = v17;
    if (v15)
    {
      objc_msgSend(v15, "identifierSetByFormingUnion:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
      if (!v18)
      {
LABEL_10:
        v19 = 0;
LABEL_16:
        os_unfair_lock_unlock(&self->_lock);

        goto LABEL_17;
      }
    }
    else
    {
      v16 = v17;
      v15 = v16;
    }
LABEL_15:
    -[KGDegasGraphStore _lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "_lock_edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v14, v15, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  os_unfair_lock_unlock(&self->_lock);

LABEL_13:
  v19 = 0;
LABEL_17:

  return v19;
}

- (id)edgeIdentifiersForNodeIdentifier:(unint64_t)a3 withLabels:(id)a4 edgeDirection:(unint64_t)a5 error:(id *)a6
{
  os_unfair_lock_s *p_lock;
  id v11;
  void *v12;

  p_lock = &self->_lock;
  v11 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase edgeIdentifiersWithLabels:direction:forNodeIdentifier:error:](self->_database, "edgeIdentifiersWithLabels:direction:forNodeIdentifier:error:", v11, a5, a3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)_lock_neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  KGElementIdentifierSet *v12;
  KGElementIdentifierSet *v13;

  v10 = a3;
  v11 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v10, "count"))
  {
    -[KGDatabase neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](self->_database, "neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", v10, a4, v11, a6);
    v12 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_alloc_init(KGElementIdentifierSet);
  }
  v13 = v12;

  return v13;
}

- (id)neighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  os_unfair_lock_s *p_lock;
  id v11;
  id v12;
  void *v13;

  p_lock = &self->_lock;
  v11 = a5;
  v12 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](self, "_lock_neighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", v12, a4, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (id)transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  KGElementIdentifierSet *v12;

  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
    -[KGDatabase transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:](self->_database, "transitiveClosureNeighborNodeIdentifiersWithStartNodeIdentifiers:edgeDirection:edgeFilter:error:", v10, a4, v11, a6);
    v12 = (KGElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v12 = objc_alloc_init(KGElementIdentifierSet);
  }

  return v12;
}

- (id)_lock_nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  KGMutableElementIdentifierSet *v9;
  KGElementIdentifierSet *v10;
  _BOOL4 v11;
  BOOL v12;

  v6 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(KGMutableElementIdentifierSet);
    if ((v6 & 1) == 0)
    {
      if ((v6 & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
    v11 = -[KGDatabase appendNodeIdentifiersOfEdgesWithIdentifiers:sourceNodeIdentifiers:targetNodeIdentifiers:error:](self->_database, "appendNodeIdentifiersOfEdgesWithIdentifiers:sourceNodeIdentifiers:targetNodeIdentifiers:error:", v8, 0, v9, a5);
    if ((v6 & 2) != 0)
    {
      if (v11)
      {
LABEL_10:
        v12 = -[KGDatabase appendNodeIdentifiersOfEdgesWithIdentifiers:sourceNodeIdentifiers:targetNodeIdentifiers:error:](self->_database, "appendNodeIdentifiersOfEdgesWithIdentifiers:sourceNodeIdentifiers:targetNodeIdentifiers:error:", v8, v9, 0, a5);
        v10 = 0;
        if (!v12)
        {
LABEL_13:

          goto LABEL_14;
        }
LABEL_11:
        v10 = v9;
        goto LABEL_13;
      }
    }
    else if (v11)
    {
      goto LABEL_11;
    }
    v10 = 0;
    goto LABEL_13;
  }
  v10 = objc_alloc_init(KGElementIdentifierSet);
LABEL_14:

  return v10;
}

- (id)nodeIdentifiersOfEdgesWithIdentifiers:(id)a3 edgeDirection:(unint64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:](self, "_lock_nodeIdentifiersOfEdgesWithIdentifiers:edgeDirection:error:", v9, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)nodeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:](self->_database, "nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:", v13, 3, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:](self->_database, "nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:", v13, 1, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:](self->_database, "nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:", v13, 2, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)nodeIdentifiers:(id)a3 sortedByUnsignedIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:](self->_database, "nodeIdentifiersSortedByPropertyForName:dataType:ascending:limit:nodeIdentifiers:error:", v13, 4, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)edgeIdentifiers:(id)a3 sortedByStringPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:](self->_database, "edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:", v13, 3, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)edgeIdentifiers:(id)a3 sortedByIntegerPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:](self->_database, "edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:", v13, 1, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)edgeIdentifiers:(id)a3 sortedByFloatPropertyForName:(id)a4 ascending:(BOOL)a5 limit:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  p_lock = &self->_lock;
  v13 = a4;
  v14 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:](self->_database, "edgeIdentifiersSortedByPropertyForName:dataType:ascending:limit:edgeIdentifiers:error:", v13, 2, v9, a6, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)_lock_targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  KGDatabase *database;
  id v8;
  KGMutableDirectedBinaryAdjacency *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  database = self->_database;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__KGDegasGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke;
  v22[3] = &unk_1E83E2640;
  v8 = v6;
  v23 = v8;
  -[KGDatabase enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:block:](database, "enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:block:", v5, v22);
  v9 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v9, "setTargets:forSource:", v16, objc_msgSend(v15, "unsignedIntegerValue"));

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)_lock_sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  KGDatabase *database;
  id v8;
  KGMutableDirectedBinaryAdjacency *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  database = self->_database;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__KGDegasGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke;
  v22[3] = &unk_1E83E2640;
  v8 = v6;
  v23 = v8;
  -[KGDatabase enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:block:](database, "enumerateSourceAndTargetIdentifiersWithEdgeIdentifiers:block:", v5, v22);
  v9 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[KGMutableDirectedBinaryAdjacency setTargets:forSource:](v9, "setTargets:forSource:", v16, objc_msgSend(v15, "unsignedIntegerValue"));

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)targetsBySourceWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_targetsBySourceWithEdgeIdentifiers:error:](self, "_lock_targetsBySourceWithEdgeIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)sourcesByTargetWithEdgeIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[KGDegasGraphStore _lock_sourcesByTargetWithEdgeIdentifiers:error:](self, "_lock_sourcesByTargetWithEdgeIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)propertiesForNodesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  KGMutablePropertyValueArray *v10;
  KGDatabase *database;
  KGMutablePropertyValueArray *v12;
  _QWORD v14[4];
  KGMutablePropertyValueArray *v15;

  p_lock = &self->_lock;
  v8 = a4;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = objc_alloc_init(KGMutablePropertyValueArray);
  database = self->_database;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__KGDegasGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke;
  v14[3] = &unk_1E83E2668;
  v12 = v10;
  v15 = v12;
  -[KGDatabase enumeratePropertyValuesForNodesWithIdentifiers:propertyName:withBlock:](database, "enumeratePropertyValuesForNodesWithIdentifiers:propertyName:withBlock:", v9, v8, v14);

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)propertiesForEdgesWithIdentifiers:(id)a3 propertyName:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  KGMutablePropertyValueArray *v10;
  KGDatabase *database;
  KGMutablePropertyValueArray *v12;
  _QWORD v14[4];
  KGMutablePropertyValueArray *v15;

  p_lock = &self->_lock;
  v8 = a4;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = objc_alloc_init(KGMutablePropertyValueArray);
  database = self->_database;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__KGDegasGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke;
  v14[3] = &unk_1E83E2668;
  v12 = v10;
  v15 = v12;
  -[KGDatabase enumeratePropertyValuesForEdgesWithIdentifiers:propertyName:withBlock:](database, "enumeratePropertyValuesForEdgesWithIdentifiers:propertyName:withBlock:", v9, v8, v14);

  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)nodeLabels
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase nodeLabels](self->_database, "nodeLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)edgeLabels
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase edgeLabels](self->_database, "edgeLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)labelsOfNodesForIdentifiers:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase labelsOfNodesForIdentifiers:](self->_database, "labelsOfNodesForIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)labelsOfEdgesForIdentifiers:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  -[KGDatabase labelsOfEdgesForIdentifiers:](self->_database, "labelsOfEdgesForIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)removeNodeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase removeNode:error:](self->_database, "removeNode:error:", a3, a4);
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeEdgeForIdentifier:(unint64_t)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase removeEdge:error:](self->_database, "removeEdge:error:", a3, a4);
  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeNodesForIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase removeNodes:error:](self->_database, "removeNodes:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)removeEdgesForIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase removeEdges:error:](self->_database, "removeEdges:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (BOOL)updateNodeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = -[KGDatabase setNodeProperties:forIdentifier:error:](self->_database, "setNodeProperties:forIdentifier:error:", v9, a3, a5);

  if (!v10)
  {
    KGLoggingConnection();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *a5;
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v11, OS_LOG_TYPE_ERROR, "node update failed: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)updateEdgeForIdentifier:(unint64_t)a3 withProperties:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v10 = -[KGDatabase setEdgeProperties:forIdentifier:error:](self->_database, "setEdgeProperties:forIdentifier:error:", v9, a3, a5);

  if (!v10)
  {
    KGLoggingConnection();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *a5;
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v11, OS_LOG_TYPE_ERROR, "edge update failed: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)beginTransactionWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  int64_t transactionCounter;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transactionCounter = self->_transactionCounter;
  if (transactionCounter)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[KGDatabase beginTransactionWithError:](self->_database, "beginTransactionWithError:", a3);
    transactionCounter = self->_transactionCounter;
  }
  self->_transactionCounter = transactionCounter + 1;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  int64_t transactionCounter;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  transactionCounter = self->_transactionCounter;
  self->_transactionCounter = transactionCounter - 1;
  if (transactionCounter <= 0)
    __assert_rtn("-[KGDegasGraphStore commitTransactionWithError:]", "KGDegasGraphStore.m", 1349, "_transactionCounter >= 0");
  v7 = transactionCounter != 1
    || -[KGDatabase commitTransactionWithError:](self->_database, "commitTransactionWithError:", a3);
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  int64_t v6;
  NSObject *v7;
  BOOL v8;
  uint8_t v10[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_transactionCounter - 1;
  self->_transactionCounter = v6;
  if (v6)
  {
    KGLoggingConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1CA0A5000, v7, OS_LOG_TYPE_FAULT, "graph database transaction rollback called at non-root level!", v10, 2u);
    }

  }
  v8 = -[KGDatabase rollbackTransactionWithError:](self->_database, "rollbackTransactionWithError:", a3);
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)openWithMode:(unint64_t)a3 error:(id *)a4
{
  KGDatabase *v7;
  KGDatabase *database;
  char v9;
  BOOL result;
  id v11;
  KGDatabase *v12;

  if (self->_url)
  {
    v7 = -[KGDatabase initWithURL:]([KGDatabase alloc], "initWithURL:", self->_url);
    database = self->_database;
    self->_database = v7;

    if (a3)
      v9 = a3;
    else
      v9 = 6;
    if ((v9 & 1) != 0)
      self->_isReadOnly = 1;
    if (-[KGDatabase openWithMode:error:](self->_database, "openWithMode:error:"))
      return 1;
    v12 = self->_database;
    self->_database = 0;

  }
  else if (a4)
  {
    kg_errorWithCode(5004);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v11;
    return result;
  }
  return 0;
}

- (void)close
{
  KGDatabase *database;

  -[KGDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  LOBYTE(a4) = -[KGDatabase copyToURL:error:](self->_database, "copyToURL:error:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

- (id)changesAfterToken:(id)a3 transactionLimit:(int64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v8;
  uint64_t v9;
  id v10;
  KGDatabase *database;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;

  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v9 = objc_msgSend(v8, "transactionSequenceNumber");

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  database = self->_database;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__KGDegasGraphStore_changesAfterToken_transactionLimit_error___block_invoke;
  v16[3] = &unk_1E83E2690;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  -[KGDatabase transactionChangesAfterTransactionId:limit:block:](database, "transactionChangesAfterTransactionId:limit:block:", v9, a4, v16);
  os_unfair_lock_unlock(p_lock);
  v13 = v17;
  v14 = v12;

  return v14;
}

- (id)nodeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 nodeFilter:(id)a5 error:(id *)a6
{
  id v10;
  os_unfair_lock_s *p_lock;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  KGDatabase *database;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;

  v10 = a5;
  p_lock = &self->_lock;
  v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v13 = objc_msgSend(v12, "transactionSequenceNumber");

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "setIncludeTombstones:", 1);
  -[KGDegasGraphStore nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "nodeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v10, 0, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v10, "setIncludeTombstones:", 0);
    database = self->_database;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__KGDegasGraphStore_nodeChangesAfterToken_transactionLimit_nodeFilter_error___block_invoke;
    v20[3] = &unk_1E83E26B8;
    v20[4] = self;
    v21 = v15;
    v17 = v14;
    v22 = v17;
    -[KGDatabase transactionChangesAfterTransactionId:limit:block:](database, "transactionChangesAfterTransactionId:limit:block:", v13, a4, v20);
    os_unfair_lock_unlock(p_lock);
    v18 = v17;

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v18 = 0;
  }

  return v18;
}

- (id)edgeChangesAfterToken:(id)a3 transactionLimit:(int64_t)a4 edgeFilter:(id)a5 error:(id *)a6
{
  id v10;
  os_unfair_lock_s *p_lock;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  KGDatabase *database;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;

  v10 = a5;
  p_lock = &self->_lock;
  v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  CheckInTransaction(self->_inTransactionCheckIsEnabled, self->_transactionCounter);
  v13 = objc_msgSend(v12, "transactionSequenceNumber");

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "setIncludeTombstones:", 1);
  -[KGDegasGraphStore edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:](self, "edgeIdentifiersMatchingFilter:intersectingIdentifiers:error:", v10, 0, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v10, "setIncludeTombstones:", 0);
    database = self->_database;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__KGDegasGraphStore_edgeChangesAfterToken_transactionLimit_edgeFilter_error___block_invoke;
    v20[3] = &unk_1E83E26B8;
    v20[4] = self;
    v21 = v15;
    v17 = v14;
    v22 = v17;
    -[KGDatabase transactionChangesAfterTransactionId:limit:block:](database, "transactionChangesAfterTransactionId:limit:block:", v13, a4, v20);
    os_unfair_lock_unlock(p_lock);
    v18 = v17;

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v18 = 0;
  }

  return v18;
}

- (KGDatabase)database
{
  return self->_database;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (int64_t)transactionCounter
{
  return self->_transactionCounter;
}

- (void)setTransactionCounter:(int64_t)a3
{
  self->_transactionCounter = a3;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __77__KGDegasGraphStore_edgeChangesAfterToken_transactionLimit_edgeFilter_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8)
{
  id v12;
  id v13;
  id v14;
  KGTransactionToken *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KGGraphChange *v20;
  id v21;

  v12 = a8;
  v13 = a6;
  v14 = a4;
  v15 = [KGTransactionToken alloc];
  objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[KGTransactionToken initForGraphIdentifier:transactionSequence:](v15, "initForGraphIdentifier:transactionSequence:", v16, a2);

  objc_msgSend(v14, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[KGGraphChange initWithTransactionToken:edgesInserted:edgesUpdated:edgesDeleted:]([KGGraphChange alloc], "initWithTransactionToken:edgesInserted:edgesUpdated:edgesDeleted:", v21, v17, v18, v19);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);

}

void __77__KGDegasGraphStore_nodeChangesAfterToken_transactionLimit_nodeFilter_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v11;
  id v12;
  id v13;
  KGTransactionToken *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  KGGraphChange *v19;
  id v20;

  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = [KGTransactionToken alloc];
  objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[KGTransactionToken initForGraphIdentifier:transactionSequence:](v14, "initForGraphIdentifier:transactionSequence:", v15, a2);

  objc_msgSend(v13, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifierSetByIntersectingIdentifierSet:", *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[KGGraphChange initWithTransactionToken:nodesInserted:nodesUpdated:nodesDeleted:]([KGGraphChange alloc], "initWithTransactionToken:nodesInserted:nodesUpdated:nodesDeleted:", v20, v16, v17, v18);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v19);

}

void __62__KGDegasGraphStore_changesAfterToken_transactionLimit_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  KGTransactionToken *v21;
  void *v22;
  KGGraphChange *v23;
  id v24;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = [KGTransactionToken alloc];
  objc_msgSend(*(id *)(a1 + 32), "_lock_graphIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[KGTransactionToken initForGraphIdentifier:transactionSequence:](v21, "initForGraphIdentifier:transactionSequence:", v22, a2);

  v23 = -[KGGraphChange initWithTransactionToken:nodesInserted:edgesInserted:nodesUpdated:edgesUpdated:nodesDeleted:edgesDeleted:]([KGGraphChange alloc], "initWithTransactionToken:nodesInserted:edgesInserted:nodesUpdated:edgesUpdated:nodesDeleted:edgesDeleted:", v24, v20, v19, v18, v17, v16, v15);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);

}

uint64_t __74__KGDegasGraphStore_propertiesForEdgesWithIdentifiers_propertyName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendValue:forIdentifier:", a3, a2);
}

uint64_t __74__KGDegasGraphStore_propertiesForNodesWithIdentifiers_propertyName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendValue:forIdentifier:", a3, a2);
}

void __68__KGDegasGraphStore__lock_sourcesByTargetWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  KGMutableElementIdentifierSet *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(KGMutableElementIdentifierSet);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  -[KGMutableElementIdentifierSet addIdentifier:](v6, "addIdentifier:", a3);

}

void __68__KGDegasGraphStore__lock_targetsBySourceWithEdgeIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  KGMutableElementIdentifierSet *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (KGMutableElementIdentifierSet *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(KGMutableElementIdentifierSet);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  -[KGMutableElementIdentifierSet addIdentifier:](v6, "addIdentifier:", a4);

}

void __59__KGDegasGraphStore_edgeForIdentifier_entityFactory_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

uint64_t __76__KGDegasGraphStore_orderedArrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __69__KGDegasGraphStore_arrayOfEdgesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

}

void __83__KGDegasGraphStore__lock_enumerateEdgesWithIdentifiers_entityFactory_error_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, _BYTE *a7)
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v13 = a6;
  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v20 = v19 == 0;
  else
    v20 = 1;
  if (v20)
  {
    *a7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "edgeWithIdentifier:labels:properties:sourceNode:targetNode:", a2, v23, v13, v16, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a7 = 1;
    }

  }
}

void __65__KGDegasGraphStore__lock_nodeForIdentifier_entityFactory_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

uint64_t __76__KGDegasGraphStore_orderedArrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __69__KGDegasGraphStore_arrayOfNodesWithIdentifiers_entityFactory_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __77__KGDegasGraphStore__lock_enumerateNodesWithIdentifiers_entityFactory_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "nodeWithIdentifier:labels:properties:", a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v6;
  }

}

+ (NSString)persistentStoreFileExtension
{
  __CFString *v2;

  v2 = CFSTR("kgdb");
  return (NSString *)CFSTR("kgdb");
}

+ (BOOL)copyFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase copyFromURL:toURL:error:](KGDatabase, "copyFromURL:toURL:error:", a3, a4, a5);
}

+ (BOOL)destroyAtURL:(id)a3 error:(id *)a4
{
  return +[KGDatabase destroyAtURL:error:](KGDatabase, "destroyAtURL:error:", a3, a4);
}

+ (BOOL)migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[KGDatabase migrateFromURL:toURL:error:](KGDatabase, "migrateFromURL:toURL:error:", a3, a4, a5);
}

@end
