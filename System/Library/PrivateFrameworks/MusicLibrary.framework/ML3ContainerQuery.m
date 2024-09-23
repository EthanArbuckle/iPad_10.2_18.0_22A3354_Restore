@implementation ML3ContainerQuery

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3ContainerQuery;
  v4 = -[ML3Query copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[ML3Predicate copy](self->_containerPredicate, "copy");
  v6 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v5;

  objc_storeStrong((id *)v4 + 12, self->_container);
  return v4;
}

- (ML3ContainerQuery)initWithEntityClass:(Class)a3 container:(id)a4 predicate:(id)a5 orderingTerms:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  ML3Predicate *v15;
  ML3Predicate *containerPredicate;
  void *v17;
  int v18;
  void *v19;
  int v20;
  ML3Predicate *v21;
  ML3Predicate *v22;
  void *v23;
  ML3Predicate *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  void **v31;
  _BOOL4 v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  ML3ContainerQuery *v37;
  objc_super v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("container_item.container_pid"), v14, 1);
  v15 = (ML3Predicate *)objc_claimAutoreleasedReturnValue();
  containerPredicate = self->_containerPredicate;
  self->_containerPredicate = v15;

  objc_storeStrong((id *)&self->_container, a4);
  objc_msgSend(v11, "valueForProperty:", CFSTR("smart_is_dynamic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  objc_msgSend(v11, "valueForProperty:", CFSTR("distinguished_kind"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");

  if (v18)
  {
    objc_msgSend(v11, "smartCriteriaPredicate");
    v21 = (ML3Predicate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = self->_containerPredicate;
  }
  v22 = v21;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v12, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v23);
    v24 = (ML3Predicate *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_20;
  }
  else
  {
    v24 = v21;
    if (v13)
      goto LABEL_20;
  }
  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting"))
  {
    objc_msgSend(v11, "limitOrderingTerms");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(v11, "displayOrderingTerms");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v18)
    {
      objc_msgSend(v11, "displayOrderingTerms");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    objc_msgSend(v11, "valueForProperty:", CFSTR("has_cloud_play_order"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "intValue");

    if (v29)
    {
      objc_msgSend(v11, "cloudDisplayOrderingTerms");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_20;
      +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("container_item.position"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v26;
      v30 = (void *)MEMORY[0x1E0C99D20];
      v31 = (void **)v41;
    }
    else
    {
      +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("container_item.position"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      v30 = (void *)MEMORY[0x1E0C99D20];
      v31 = &v40;
    }
    objc_msgSend(v30, "arrayWithObjects:count:", v31, 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v27;

LABEL_20:
  v32 = v18 == 0;
  if (v20 == 71)
    v32 = 1;
  v33 = !v32;
  v34 = 4;
  if (v33)
    v34 = 0;
  v35 = v34 | (8 * (v20 == 71));
  objc_msgSend(v11, "library");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)ML3ContainerQuery;
  v37 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](&v39, sel_initWithLibrary_entityClass_predicate_orderingTerms_usingSections_nonDirectAggregateQuery_propertyToCount_options_, v36, a3, v24, v13, 0, 0, 0, v35);

  return v37;
}

- (ML3ContainerQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  Class v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ML3ContainerQuery *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("musicLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);

  v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("containerPersistentID")), v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("orderingTerm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ML3ContainerQuery initWithEntityClass:container:predicate:orderingTerms:](self, "initWithEntityClass:container:predicate:orderingTerms:", v7, v8, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ML3Query library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("musicLibrary"));

  NSStringFromClass(-[ML3Query entityClass](self, "entityClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("entityClass"));

  -[ML3ContainerQuery container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v7, "persistentID"), CFSTR("containerPersistentID"));

  -[ML3Query predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("predicate"));

  -[ML3Query orderingTerms](self, "orderingTerms");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("orderingTerms"));

}

- (BOOL)requiresSmartLimiting
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ML3Entity valueForProperty:](self->_container, "valueForProperty:", CFSTR("smart_is_limited"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "intValue"))
  {
    -[ML3Entity valueForProperty:](self->_container, "valueForProperty:", CFSTR("smart_is_dynamic"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intValue") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasEntities
{
  ML3MusicLibrary *library;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  objc_super v11;

  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    library = self->super._library;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__ML3ContainerQuery_hasEntities__block_invoke;
    v6[3] = &unk_1E5B64FE0;
    v6[4] = self;
    v6[5] = &v7;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v6);
    v4 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ML3ContainerQuery;
    return -[ML3Query hasEntities](&v11, sel_hasEntities);
  }
  return v4;
}

- (unint64_t)countOfDistinctRowsForColumn:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  ML3MusicLibrary *library;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  objc_super v16;

  v4 = a3;
  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting"))
  {
    if (-[ML3Container isLimitedByCount](self->_container, "isLimitedByCount"))
    {
      v15.receiver = self;
      v15.super_class = (Class)ML3ContainerQuery;
      v5 = -[ML3Query countOfDistinctRowsForColumn:](&v15, sel_countOfDistinctRowsForColumn_, v4);
      v6 = -[ML3Container limitValue](self->_container, "limitValue");
      if ((unint64_t)v5 >= v6)
        v7 = v6;
      else
        v7 = (unint64_t)v5;
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      library = self->super._library;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke;
      v10[3] = &unk_1E5B64FE0;
      v10[4] = self;
      v10[5] = &v11;
      -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v10);
      v7 = v12[3];
      _Block_object_dispose(&v11, 8);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ML3ContainerQuery;
    v7 = -[ML3Query countOfDistinctRowsForColumn:](&v16, sel_countOfDistinctRowsForColumn_, v4);
  }

  return v7;
}

- (unint64_t)countOfEntities
{
  return -[ML3ContainerQuery countOfDistinctRowsForColumn:](self, "countOfDistinctRowsForColumn:", self->super._propertyToCount);
}

- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4
{
  id v7;
  id v8;
  ML3MusicLibrary *library;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  if (valueForAggregateFunction_onEntitiesForProperty__onceToken != -1)
    dispatch_once(&valueForAggregateFunction_onEntitiesForProperty__onceToken, &__block_literal_global_6874);
  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting"))
  {
    if (objc_msgSend((id)__supportedAggregateFunctions, "containsObject:", v7))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      library = self->super._library;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_2;
      v13[3] = &unk_1E5B62250;
      v13[4] = self;
      v14 = v8;
      v15 = v7;
      v16 = &v17;
      -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18[3]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ContainerQuery.m"), 209, CFSTR("Attempting to get value for unsupported aggregate function %@"), v7);

      v10 = 0;
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ML3ContainerQuery;
    -[ML3Query valueForAggregateFunction:onEntitiesForProperty:](&v21, sel_valueForAggregateFunction_onEntitiesForProperty_, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting"))
  {
    if (-[ML3Container isLimitedByCount](self->_container, "isLimitedByCount"))
    {
      v7 = 1;
      goto LABEL_8;
    }
    -[ML3Container limitingProperty](self->_container, "limitingProperty");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v6 = (id)v10;
      goto LABEL_8;
    }
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = 0;
LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)ML3ContainerQuery;
  -[ML3Query selectPersistentIDsSQLAndProperties:ordered:](&v14, sel_selectPersistentIDsSQLAndProperties_ordered_, v6, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(" LIMIT %lu"), -[ML3Container limitValue](self->_container, "limitValue"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  return v11;
}

- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ML3ContainerQuery requiresSmartLimiting](self, "requiresSmartLimiting")
    && !-[ML3Container isLimitedByCount](self->_container, "isLimitedByCount"))
  {
    -[ML3Container limitingProperty](self->_container, "limitingProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executeQuery:withParameters:limitProperty:limitValue:", v8, v10, v12, -[ML3Container limitValue](self->_container, "limitValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ML3ContainerQuery;
    -[ML3Query enumerationDatabaseResultForSQL:onConnection:withParameters:](&v14, sel_enumerationDatabaseResultForSQL_onConnection_withParameters_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (ML3Container)container
{
  return self->_container;
}

- (NSArray)limitedPersistentIDs
{
  return self->_limitedPersistentIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedPersistentIDs, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_containerPredicate, 0);
}

void __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, void *);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "spotlightPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v6, v3, v4, 0, 0);

  }
  v7 = *(void **)(a1 + 32);
  v18[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isLimitedByCount"))
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "limitValue");
  else
    v9 = 0;
  objc_msgSend(v7, "selectSQLWithColumns:orderingTerms:limit:", v8, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enumerationDatabaseResultForSQL:onConnection:withParameters:", v10, v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("TOTAL")))
  {
    v17 = MEMORY[0x1E0C809B0];
    v13 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_3;
    v14 = &v17;
LABEL_12:
    v14[1] = 3221225472;
    v14[2] = (uint64_t)v13;
    v14[3] = (uint64_t)&unk_1E5B65200;
    v14[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v12, "enumerateRowsWithBlock:");
    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("MAX")))
  {
    v16 = MEMORY[0x1E0C809B0];
    v13 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_4;
    v14 = &v16;
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("MIN")))
  {
    v15 = MEMORY[0x1E0C809B0];
    v13 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_5;
    v14 = &v15;
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (result > v5)
    v5 = result;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (result < v5)
    v5 = result;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "int64ForColumnIndex:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TOTAL"), CFSTR("MAX"), CFSTR("MIN"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__supportedAggregateFunctions;
  __supportedAggregateFunctions = v0;

}

void __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "spotlightPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v5, v9, v3, 0, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "selectPersistentIDsSQLAndProperties:ordered:", 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enumerationDatabaseResultForSQL:onConnection:withParameters:", v6, v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke_2;
  v10[3] = &unk_1E5B65200;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "enumerateRowsWithBlock:", v10);

}

uint64_t __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __32__ML3ContainerQuery_hasEntities__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "spotlightPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v5, v13, v3, 0, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "selectPersistentIDsSQLAndProperties:ordered:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isLimitedByCount"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "limitValue") < 1)
      v7 = 1;
    else
      v7 = (int)log10((double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "limitValue")) + 1;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v6, "length") - v7, v7, CFSTR("1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("SELECT 1 FROM (%@)"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT 1 FROM (%@ LIMIT 1)"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enumerationDatabaseResultForSQL:onConnection:withParameters:", v8, v13, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v12, "hasAtLeastOneRow");

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
