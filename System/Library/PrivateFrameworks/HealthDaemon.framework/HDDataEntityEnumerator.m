@implementation HDDataEntityEnumerator

- (void)addEncodingOptionsFromDictionary:(id)a3
{
  NSMutableDictionary *encodingOptions;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  encodingOptions = self->_encodingOptions;
  if (encodingOptions)
  {
    -[NSMutableDictionary addEntriesFromDictionary:](encodingOptions, "addEntriesFromDictionary:", a3);
  }
  else
  {
    v5 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    v6 = self->_encodingOptions;
    self->_encodingOptions = v5;

  }
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  HDDatabaseTransactionContext *databaseTransactionContext;
  char v12;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = v7;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));

    if (v8)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));
    v12 = 0;
    goto LABEL_4;
  }
  if (!v7)
    goto LABEL_6;
LABEL_3:
  v9 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
  -[HDProfile database](self->_profile, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  databaseTransactionContext = self->_databaseTransactionContext;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HDDataEntityEnumerator_enumerateWithError_handler___block_invoke;
  v15[3] = &unk_1E6CEE458;
  v15[4] = self;
  v16 = v8;
  v12 = -[objc_class performReadTransactionWithHealthDatabase:context:error:block:](v9, "performReadTransactionWithHealthDatabase:context:error:block:", v10, databaseTransactionContext, a3, v15);

LABEL_4:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_lastSQL, 0);
  objc_storeStrong((id *)&self->_databaseTransactionContext, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_deletedObjectsPredicate, 0);
  objc_storeStrong((id *)&self->_deletedObjectsAnchor, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_objectTypes, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (BOOL)enumerateIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5
{
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  HDDatabaseTransactionContext *databaseTransactionContext;
  char v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  objc_class *v22;
  _QWORD v23[4];
  id v24;

  v9 = a5;
  v10 = v9;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));

    if (v10)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

    v14 = 0;
    goto LABEL_9;
  }
  if (!v9)
    goto LABEL_11;
LABEL_3:
  if (a3)
  {
    v11 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 137, CFSTR("Querying with a nil entity class %@. You're about to be sad. Did you forget to implement -hd_dataEntityClass or an extension in HKObject+HDExtensions?"), self);

    }
    -[HDProfile database](self->_profile, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    databaseTransactionContext = self->_databaseTransactionContext;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_2;
    v20[3] = &unk_1E6D09EC8;
    v20[4] = self;
    v22 = v11;
    v21 = v10;
    v14 = -[objc_class performReadTransactionWithHealthDatabase:context:error:block:](v11, "performReadTransactionWithHealthDatabase:context:error:block:", v12, databaseTransactionContext, a4, v20);

    v15 = v21;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke;
    v23[3] = &unk_1E6CF9C30;
    v24 = v10;
    v14 = -[HDDataEntityEnumerator enumerateWithError:handler:](self, "enumerateWithError:handler:", a4, v23);
    v15 = v24;
  }

LABEL_9:
  return v14;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void)setAuthorizationFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setRestrictedSourceEntities:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedSourceEntities, a3);
}

- (NSNumber)anchor
{
  return self->_anchor;
}

uint64_t __53__HDDataEntityEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2, const __CFString **a3)
{
  return -[HDDataEntityEnumerator _enumerateObjectsWithDatabaseTransaction:error:handler:](*(_QWORD **)(a1 + 32), a2, a3, *(void **)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDataEntityEnumerator;
  v4 = -[HDSQLiteQueryDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 8, self->_profile);
  *((_BYTE *)v4 + 80) = self->_useLeftJoin;
  return v4;
}

- (uint64_t)_prepareDescriptor:(const __CFString *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  const __CFString *v31;
  unsigned __int8 v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend((id)a1, "entityClass");
    objc_msgSend((id)a1, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 88);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0D29840];
      HDSampleEntityPredicateForDataTypes(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "compoundPredicateWithPredicate:otherPredicate:", v10, v7);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    if (objc_msgSend(*(id *)(a1 + 112), "longLongValue") >= 1)
    {
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", CFSTR("data_id"), *(_QWORD *)(a1 + 112));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v7, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    v14 = *(void **)(a1 + 160);
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(v14, "predicateWithProfile:", *(_QWORD *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "compoundPredicateWithPredicate:otherPredicate:", v7, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v17;
    }
    objc_msgSend(v6, "predicateMatchingPreferredEntityTypeIfRequiredWithPredicate:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(void **)(a1 + 96);
    if (v19)
    {
      HDDataEntityPredicateForSourceEntitySet(7, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v20, v18);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    if (!*(_BYTE *)(a1 + 81))
    {
      v22 = (void *)MEMORY[0x1E0D29890];
      objc_msgSend(v6, "additionalPredicateForEnumeration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "compoundPredicateWithPredicate:otherPredicate:", v23, v18);
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v24;
    }
    if (*(_QWORD *)(a1 + 136)
      && (-[HDDataEntityEnumerator _setOrderingTermsOnDescriptor:error:](a1, v5, (uint64_t)a3) & 1) == 0)
    {
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        if (a3)
          v31 = *a3;
        else
          v31 = CFSTR("<no provided outError>");
        *(_DWORD *)buf = 138543362;
        v34 = v31;
        _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Invalid sort descriptor: %{public}@", buf, 0xCu);
      }
      v27 = 0;
    }
    else
    {
      objc_msgSend(v5, "setPredicate:", v18);
      if (objc_msgSend((id)a1, "improveJoinOrderingForStartDateIndexSelection"))
      {
        v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v26 = (void *)objc_opt_class();
        do
        {
          objc_msgSend(v25, "addObject:", v26);
          v26 = (void *)objc_msgSend(v26, "superclass");
        }
        while ((objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class()) & 1) != 0);
        objc_msgSend(v5, "setPreferredEntityJoinOrder:", v25);

      }
      v27 = 1;
    }
    v32 = v27;

    v29 = v32;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

- (id)_joinClauseForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_useLeftJoin)
  {
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = objc_alloc(MEMORY[0x1E0C99E20]);
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, 0);

    v10 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
    if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class())
      && v10 != (objc_class *)objc_opt_class())
    {
      do
      {
        if (-[objc_class isBackedByTable](v10, "isBackedByTable"))
        {
          -[objc_class disambiguatedDatabaseTable](v10, "disambiguatedDatabaseTable");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v11);

          -[objc_class disambiguatedDatabaseTable](v10, "disambiguatedDatabaseTable");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR(" LEFT JOIN %@ USING(%@)"), v12, CFSTR("data_id"));

        }
        v10 = (objc_class *)-[objc_class superclass](v10, "superclass");
      }
      while (v10 != (objc_class *)objc_opt_class());
    }
    v13 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[objc_class joinClausesForProperty:](v13, "joinClausesForProperty:", CFSTR("data_provenances.source_id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v15);

    -[HDSQLiteQueryDescriptor predicate](self, "predicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "SQLJoinClausesForEntityClass:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v17);

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v4;
    v18 = v4;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          -[objc_class joinClausesForProperty:](v13, "joinClausesForProperty:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v14, "unionSet:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v20);
    }

    v37.receiver = self;
    v37.super_class = (Class)HDDataEntityEnumerator;
    -[HDSQLiteQueryDescriptor _sortedJoinClauses:preferredOrder:baseTables:](&v37, sel__sortedJoinClauses_preferredOrder_baseTables_, v14, 0, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "SQLJoinClause");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v26);
    }

    v4 = v31;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)HDDataEntityEnumerator;
    -[HDSQLiteQueryDescriptor _joinClauseForProperties:](&v32, sel__joinClauseForProperties_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)_prepareDeletedObjectsAndSamplesDescriptor:(const __CFString *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v34;
  void *v35;
  _QWORD v36[2];
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
  if (*(_QWORD *)(a1 + 136)
    && (-[HDDataEntityEnumerator _setOrderingTermsOnDescriptor:error:](a1, v5, (uint64_t)a3) & 1) == 0)
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v34 = *a3;
      else
        v34 = CFSTR("<no provided outError>");
      *(_DWORD *)buf = 138412290;
      v38 = v34;
      _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "Invalid sort descriptor: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *(void **)(a1 + 88);
  if (v8)
  {
    HDSampleEntityPredicateForDataTypes(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_addNonNilObject:", v9);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "longLongValue") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", v6, *(_QWORD *)(a1 + 112));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_addNonNilObject:", v10);

  }
  v35 = v5;
  v11 = *(void **)(a1 + 96);
  if (v11)
  {
    HDDataEntityPredicateForSourceEntitySet(7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_addNonNilObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend((id)a1, "entityClass");
  HDDataEntityPredicateForType(1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_addNonNilObject:", v16);

  objc_msgSend((id)a1, "predicate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_addNonNilObject:", v17);

  if (!*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v15, "additionalPredicateForEnumeration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_addNonNilObject:", v18);

  }
  v19 = *(void **)(a1 + 160);
  if (v19)
  {
    objc_msgSend(v19, "predicateWithProfile:", *(_QWORD *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_addNonNilObject:", v20);

  }
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  HDDataEntityPredicateForType(2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hk_addNonNilObject:", v23);

  if (objc_msgSend(*(id *)(a1 + 120), "longLongValue") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", v6, *(_QWORD *)(a1 + 120));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hk_addNonNilObject:", v24);

  }
  objc_msgSend(v22, "hk_addNonNilObject:", *(_QWORD *)(a1 + 128));
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D29890];
  v27 = (void *)MEMORY[0x1E0D29840];
  v36[0] = v21;
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "predicateMatchingAnyPredicates:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "compoundPredicateWithPredicate:otherPredicate:", v13, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v35;
  objc_msgSend(v35, "setPredicate:", v30);

  v31 = 1;
LABEL_19:

  return v31;
}

- (void)setDeletedObjectsAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_deletedObjectsAnchor, a3);
}

- (id)_initWithEntityClass:(Class)a3 profile:(id)a4
{
  id v7;
  HDDataEntityEnumerator *v8;
  HDDataEntityEnumerator *v9;
  objc_super v11;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDataEntityEnumerator;
  v8 = -[HDDataEntityEnumerator init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_profile, a4);
    v11.receiver = v9;
    v11.super_class = (Class)HDDataEntityEnumerator;
    -[HDSQLiteQueryDescriptor setEntityClass:](&v11, sel_setEntityClass_, a3);
  }

  return v9;
}

- (id)_initWithObjectType:(id)a3 entityClass:(Class)a4 profile:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  objc_msgSend(v8, "setWithObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDDataEntityEnumerator _initWithObjectTypes:entityClass:profile:](self, "_initWithObjectTypes:entityClass:profile:", v10, a4, v9);

  return v11;
}

- (id)_initWithObjectTypes:(id)a3 entityClass:(Class)a4 profile:(id)a5
{
  id v9;
  id *v10;
  id *v11;

  v9 = a3;
  v10 = -[HDDataEntityEnumerator _initWithEntityClass:profile:](self, "_initWithEntityClass:profile:", a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong(v10 + 11, a3);

  return v11;
}

- (void)setEncodingOption:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *encodingOptions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  encodingOptions = self->_encodingOptions;
  if (!encodingOptions)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_encodingOptions;
    self->_encodingOptions = v8;

    encodingOptions = self->_encodingOptions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](encodingOptions, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)encodingOptionForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_encodingOptions, "objectForKeyedSubscript:", a3);
}

- (uint64_t)_enumerateObjectsWithDatabaseTransaction:(const __CFString *)a3 error:(void *)a4 handler:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = (void *)objc_msgSend(a1, "copy");
    if (-[HDDataEntityEnumerator _prepareDescriptor:error:]((uint64_t)a1, v9, a3))
    {
      v10 = (void *)objc_msgSend(a1, "entityClass");
      v11 = objc_alloc(MEMORY[0x1E0D29898]);
      objc_msgSend(v7, "databaseForEntityClass:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDatabase:descriptor:", v12, v9);

      v14 = a1[8];
      v15 = a1[9];
      objc_msgSend(a1, "authorizationFilter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v14, v7, 1, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "orderedProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke;
      v26[3] = &unk_1E6CEE9A0;
      v19 = v17;
      v27 = v19;
      v28 = v8;
      v20 = objc_msgSend(v13, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v18, &v29, v26);
      v21 = v29;

      objc_msgSend(v13, "lastSQLStatement");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      v24 = (void *)a1[19];
      a1[19] = v23;

      objc_msgSend(v19, "finish");
      if (v21)
      {
        if (a3)
        {
          v20 = 0;
          *a3 = (const __CFString *)objc_retainAutorelease(v21);
        }
        else
        {
          _HKLogDroppedError();
          v20 = 0;
        }
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)enumerateInTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));

    if (v11)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

    v12 = 0;
    goto LABEL_4;
  }
  if (!v10)
    goto LABEL_6;
LABEL_3:
  v12 = -[HDDataEntityEnumerator _enumerateObjectsWithDatabaseTransaction:error:handler:](self, v9, (const __CFString **)a4, v11);
LABEL_4:

  return v12;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_2(uint64_t a1, void *a2, const __CFString **a3)
{
  id v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v6[80] = 1;
  if (-[HDDataEntityEnumerator _prepareDeletedObjectsAndSamplesDescriptor:error:](*(_QWORD *)(a1 + 32), v6, a3))
  {
    objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v26, v6);
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[8];
    v11 = v9[9];
    objc_msgSend(v9, "authorizationFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", v10, v5, 1, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    v30[1] = CFSTR("type");
    v30[2] = CFSTR("external_sync_ids.sid");
    v30[3] = CFSTR("external_sync_ids.version");
    v30[4] = CFSTR("external_sync_ids.object_code");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orderedProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_3;
    v27[3] = &unk_1E6D00818;
    v18 = *(id *)(a1 + 40);
    v28 = v13;
    v29 = v18;
    v19 = v13;
    v20 = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v17, a3, v27);
    objc_msgSend(v7, "lastSQLStatement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 152);
    *(_QWORD *)(v23 + 152) = v22;

    objc_msgSend(v19, "finish");
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __73__HDDataEntityEnumerator_enumerateIncludingDeletedObjects_error_handler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v7 = HDSQLiteColumnAsInt64();
  if (HDSQLiteColumnAsInt64() == 2)
  {
    HDSQLiteColumnWithNameAsUUID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB65B8], "_metadataWithSyncIdentifier:syncVersion:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB65B8], "_deletedObjectWithUUID:metadata:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      LOBYTE(a4) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    if (v12)
      return a4 & 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForPersistentID:row:error:", v7, a3, a4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      return v15;
    }
  }
  LOBYTE(a4) = 1;
  return a4 & 1;
}

- (BOOL)enumerateSampleTimesIncludingDeletedObjects:(BOOL)a3 error:(id *)a4 handler:(id)a5
{
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  HDDatabaseTransactionContext *databaseTransactionContext;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  objc_class *v21;
  BOOL v22;

  v9 = a5;
  v10 = v9;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));

    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

    v14 = 0;
    goto LABEL_6;
  }
  if (!v9)
    goto LABEL_8;
LABEL_3:
  v11 = -[HDSQLiteQueryDescriptor entityClass](self, "entityClass");
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataEntityEnumerator.m"), 215, CFSTR("Querying with a nil entity class %@. You're about to be sad. Did you forget to implement -hd_dataEntityClass or an extension in HKObject+HDExtensions?"), self);

  }
  -[HDProfile database](self->_profile, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  databaseTransactionContext = self->_databaseTransactionContext;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke;
  v19[3] = &unk_1E6D09EF0;
  v22 = a3;
  v19[4] = self;
  v21 = v11;
  v20 = v10;
  v14 = -[objc_class performReadTransactionWithHealthDatabase:context:error:block:](v11, "performReadTransactionWithHealthDatabase:context:error:block:", v12, databaseTransactionContext, a4, v19);

LABEL_6:
  return v14;
}

uint64_t __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke(uint64_t a1, void *a2, const __CFString **a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(a1 + 56))
  {
    if (-[HDDataEntityEnumerator _prepareDescriptor:error:](v7, v6, a3))
      goto LABEL_5;
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  if (!-[HDDataEntityEnumerator _prepareDeletedObjectsAndSamplesDescriptor:error:](v7, v6, a3))
    goto LABEL_6;
  v6[80] = 1;
LABEL_5:
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29898]), "initWithDatabase:descriptor:", v8, v6);
  +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("data_id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v20[1] = CFSTR("start_date");
  v20[2] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke_2;
  v18[3] = &unk_1E6CE91B8;
  v19 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v9, "enumerateProperties:error:enumerationHandler:", v11, a3, v18);
  objc_msgSend(v9, "lastSQLStatement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 152);
  *(_QWORD *)(v15 + 152) = v14;

LABEL_7:
  return v12;
}

uint64_t __84__HDDataEntityEnumerator_enumerateSampleTimesIncludingDeletedObjects_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  __n128 v6;

  HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a3, 1) & 1) != 0)
    v5 = 2.22507386e-308;
  else
    v5 = MEMORY[0x1BCCAB1A4](a3, 1);
  if ((MEMORY[0x1BCCAB204](a3, 2) & 1) != 0)
    v6.n128_u64[0] = 0x10000000000000;
  else
    v6.n128_u64[0] = MEMORY[0x1BCCAB1A4](a3, 2);
  return (*(uint64_t (**)(double, __n128))(*(_QWORD *)(a1 + 32) + 16))(v5, v6);
}

- (uint64_t)_setOrderingTermsOnDescriptor:(uint64_t)a3 error:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend((id)a1, "entityClass");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *(id *)(a1 + 136);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "orderingTermForSortDescriptor:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v12, "key");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "hk_assignError:code:format:", a3, 3, CFSTR("%@ is not a valid sort key for samples of type %@"), v17, *(_QWORD *)(a1 + 88));

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v5, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "setOrderingTerms:", v5);
  v15 = 1;
LABEL_11:

  return v15;
}

uint64_t __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v2 = HKWithAutoreleasePool();

  return v2;
}

uint64_t __81__HDDataEntityEnumerator__enumerateObjectsWithDatabaseTransaction_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForPersistentID:row:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v4 = 1;

  return v4;
}

- (NSSet)objectTypes
{
  return self->_objectTypes;
}

- (NSSet)restrictedSourceEntities
{
  return self->_restrictedSourceEntities;
}

- (NSNumber)deletedObjectsAnchor
{
  return self->_deletedObjectsAnchor;
}

- (HDSQLitePredicate)deletedObjectsPredicate
{
  return self->_deletedObjectsPredicate;
}

- (void)setDeletedObjectsPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (HDDatabaseTransactionContext)databaseTransactionContext
{
  return self->_databaseTransactionContext;
}

- (void)setDatabaseTransactionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)ignoreEntityClassAdditionalPredicateForEnumeration
{
  return self->_ignoreEntityClassAdditionalPredicateForEnumeration;
}

- (void)setIgnoreEntityClassAdditionalPredicateForEnumeration:(BOOL)a3
{
  self->_ignoreEntityClassAdditionalPredicateForEnumeration = a3;
}

- (BOOL)improveJoinOrderingForStartDateIndexSelection
{
  return self->_improveJoinOrderingForStartDateIndexSelection;
}

- (void)setImproveJoinOrderingForStartDateIndexSelection:(BOOL)a3
{
  self->_improveJoinOrderingForStartDateIndexSelection = a3;
}

- (NSString)lastSQL
{
  return self->_lastSQL;
}

- (_HKFilter)filter
{
  return self->_filter;
}

@end
