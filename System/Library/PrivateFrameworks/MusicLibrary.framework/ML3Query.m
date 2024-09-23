@implementation ML3Query

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7 distinct:(BOOL)a8 limit:(unint64_t)a9
{
  _BOOL4 v9;
  void *v14;
  Class entityClass;
  Class v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t ii;
  id v48;
  _BOOL4 v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id obj;
  id v58;
  _QWORD v59[4];
  id v60;
  ML3Query *v61;
  _QWORD v62[4];
  id v63;
  ML3Query *v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v9 = a8;
  v50 = a7;
  v92 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v54 = a4;
  v51 = a5;
  v56 = a6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v14;
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (v16 = self->_entityClass, v16 == (Class)objc_opt_class()))
  {
    -[ML3Query predicateIncludingSystemwidePredicates](self, "predicateIncludingSystemwidePredicates");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ML3Query predicate](self, "predicate");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  v52 = (void *)v17;
  objc_msgSend(v14, "appendString:", CFSTR("SELECT "));
  if (v9)
    objc_msgSend(v14, "appendString:", CFSTR("DISTINCT "));
  objc_msgSend(v55, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v19);

  objc_msgSend(v14, "appendString:", CFSTR(" FROM "));
  objc_msgSend(v14, "appendString:", v53);
  v20 = objc_alloc(MEMORY[0x1E0C99E10]);
  objc_msgSend(v18, "SQLJoinClausesForClass:", self->_entityClass);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithOrderedSet:", v21);

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v51;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v84 != v24)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "property");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        -[objc_class joinClausesForProperty:](self->_entityClass, "joinClausesForProperty:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v80 != v29)
                objc_enumerationMutation(v27);
              objc_msgSend(v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
          }
          while (v28);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v23);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v31 = v55;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v76;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v76 != v33)
          objc_enumerationMutation(v31);
        v35 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        -[objc_class joinClausesForProperty:](self->_entityClass, "joinClausesForProperty:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
        if (v37)
        {
          v38 = *(_QWORD *)v72;
          do
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v72 != v38)
                objc_enumerationMutation(v36);
              objc_msgSend(v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m));
            }
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
          }
          while (v37);
        }

      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v32);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v40 = v22;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v68;
    do
    {
      for (n = 0; n != v41; ++n)
      {
        if (*(_QWORD *)v68 != v42)
          objc_enumerationMutation(v40);
        v44 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * n);
        objc_msgSend(v58, "appendString:", CFSTR(" "));
        objc_msgSend(v58, "appendString:", v44);
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    }
    while (v41);
  }

  v45 = v58;
  if (v52)
  {
    objc_msgSend(v58, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v52, "appendSQLToMutableString:entityClass:", v58, self->_entityClass);
  }
  if (v50 && objc_msgSend(obj, "count"))
  {
    objc_msgSend(v58, "appendString:", CFSTR(" AND ("));
    v46 = objc_msgSend(obj, "count");
    if (v46)
    {
      for (ii = 0; ii != v46; ++ii)
      {
        if (ii)
          objc_msgSend(v58, "appendString:", CFSTR(" OR "));
        objc_msgSend(v58, "appendString:", CFSTR("("));
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke;
        v62[3] = &unk_1E5B5FA78;
        v66 = ii;
        v48 = v58;
        v63 = v48;
        v64 = self;
        v65 = v56;
        objc_msgSend(obj, "enumerateObjectsUsingBlock:", v62);
        objc_msgSend(v48, "appendString:", CFSTR(")"));

      }
    }
    v45 = v58;
    objc_msgSend(v58, "appendString:", CFSTR(")"));
  }
  if (v54)
  {
    objc_msgSend(v45, "appendString:", CFSTR(" GROUP BY "));
    objc_msgSend(v45, "appendString:", v54);
    objc_msgSend(v45, "appendString:", CFSTR(" ORDER BY "));
    objc_msgSend(v45, "appendString:", v54);
  }
  else if (objc_msgSend(obj, "count"))
  {
    objc_msgSend(v45, "appendString:", CFSTR(" ORDER BY "));
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke_2;
    v59[3] = &unk_1E5B5FAA0;
    v60 = v45;
    v61 = self;
    objc_msgSend(obj, "enumerateObjectsUsingBlock:", v59);

    v45 = v58;
  }
  if (a9)
    objc_msgSend(v45, "appendFormat:", CFSTR(" LIMIT %lu"), a9);

  return v58;
}

void __33__ML3Query_anyEntityPersistentID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
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
  v7 = *(id **)(a1 + 32);
  objc_msgSend(v7[2], "databaseTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".ROWID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectSQLWithColumns:orderingTerms:limit:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v13, "int64ValueForFirstRowAndColumn");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDirectAggregateQuery, 0);
  objc_storeStrong((id *)&self->_propertyToCount, 0);
  objc_storeStrong((id *)&self->_orderingTerms, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (id)persistentIDParameters
{
  Class entityClass;
  Class v4;
  void *v5;
  void *v6;
  void *v7;

  entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (v4 = self->_entityClass, v4 == (Class)objc_opt_class()))
  {
    -[ML3Query predicateIncludingSystemwidePredicates](self, "predicateIncludingSystemwidePredicates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ML3Query predicate](self, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "databaseStatementParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ML3Predicate)predicateIncludingSystemwidePredicates
{
  ML3Predicate *v3;

  if (-[objc_class isSubclassOfClass:](self->_entityClass, "isSubclassOfClass:", objc_opt_class()))
  {
    -[objc_class predicateIncludingSystemwidePredicatesWithPredicate:library:options:](self->_entityClass, "predicateIncludingSystemwidePredicatesWithPredicate:library:options:", self->_predicate, self->_library, self->_options);
    v3 = (ML3Predicate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_predicate;
  }
  return v3;
}

- (BOOL)hasRowForColumn:(id)a3
{
  id v4;
  ML3MusicLibrary *library;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  library = self->_library;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__ML3Query_hasRowForColumn___block_invoke;
  v8[3] = &unk_1E5B62DC0;
  v8[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v8);
  LOBYTE(library) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)library;
}

- (BOOL)hasEntities
{
  return -[ML3Query hasRowForColumn:](self, "hasRowForColumn:", 0);
}

- (ML3Query)initWithLibrary:(id)a3 entityClass:(Class)a4 predicate:(id)a5 orderingTerms:(id)a6 usingSections:(BOOL)a7 nonDirectAggregateQuery:(id)a8 propertyToCount:(id)a9 options:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  ML3Query *v19;
  ML3Query *v20;
  uint64_t v21;
  NSArray *orderingTerms;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v16 = a5;
  v17 = a6;
  v25 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ML3Query;
  v19 = -[ML3Query init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_entityClass = a4;
    objc_storeStrong((id *)&v19->_predicate, a5);
    v21 = objc_msgSend(v17, "copy");
    orderingTerms = v20->_orderingTerms;
    v20->_orderingTerms = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_propertyToCount, a9);
    objc_storeStrong((id *)&v20->_library, a3);
    v20->_usingSections = a7;
    objc_storeStrong((id *)&v20->_nonDirectAggregateQuery, a8);
    v20->_filtersOnDynamicProperties = objc_msgSend(v16, "isDynamicForEntityClass:", a4);
    v20->_options = a10;
  }

  return v20;
}

void __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(v5, "appendSQLToMutableString:entityClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));

}

void __95__ML3Query_enumeratePersistentIDsAndProperties_ordered_sectionProperty_cancelBlock_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2114;
      v34 = v8;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error enumerating results. err=%{public}@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v11 = *(_QWORD *)(a1 + 64);
    if (v11 && (*(unsigned int (**)(void))(v11 + 16))())
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_7;
    }
    v12 = objc_msgSend(v7, "int64ForColumnIndex:", 0);
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v7, "intForColumnIndex:", 1);
    if (!*(_QWORD *)(a1 + 96))
    {
LABEL_30:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      goto LABEL_7;
    }
    v13 = 0;
    v14 = (_QWORD *)(a1 + 104);
    v15 = (_QWORD *)(a1 + 152);
    v30 = v7;
    while (1)
    {
      if (*(_BYTE *)(a1 + 192)
        && std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v14, v13))
      {
        v16 = objc_msgSend(v7, "int64ForColumnIndex:", v13 + 1);
        ML3SpotlightMatchPredicateNameForID(v16, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v15, v13))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(v18 + 16);
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "countingQueryForBaseQuery:countProperty:forIdentifier:", v18, v20, v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "countOfEntities"));
            v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v14;
              v26 = v15;
              v27 = v12;
              v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
              objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v13);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v28;
              v33 = 2114;
              v34 = v29;
              _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "No counting query for entity class %{public}@ count property %{public}@", buf, 0x16u);

              v12 = v27;
              v15 = v26;
              v14 = v25;
              v7 = v30;
            }

            v22 = &unk_1E5BAAE78;
          }
          *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v13) = v22;

          goto LABEL_29;
        }
        v23 = 1;
        if (*(_QWORD *)(a1 + 40))
          v23 = 2;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v23 + v13);
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v13) = v17;
LABEL_29:
      if (*(_QWORD *)(a1 + 96) <= (unint64_t)++v13)
        goto LABEL_30;
    }
  }
LABEL_6:
  *a4 = 1;
LABEL_7:

}

uint64_t __69__ML3Query_enumeratePersistentIDsAndSectionsWithProperty_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__ML3Query_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__ML3Query_enumeratePersistentIDsAndProperties_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ML3Query_enumeratePersistentIDsAndProperties_ordered_cancelBlock_usingBlock___block_invoke;
  v12[3] = &unk_1E5B5F9B8;
  v13 = v10;
  v11 = v10;
  -[ML3Query enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:](self, "enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:", a3, v7, 0, a5, v12);

}

- (unint64_t)countOfDistinctRowsForColumn:(id)a3
{
  id v4;
  ML3MusicLibrary *library;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  library = self->_library;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ML3Query_countOfDistinctRowsForColumn___block_invoke;
  v9[3] = &unk_1E5B62DC0;
  v9[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__ML3Query_countOfDistinctRowsForColumn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
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
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COUNT(DISTINCT %@)"), *(_QWORD *)(a1 + 40));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("COUNT()");
  }
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[10];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIN(%@, %lu)"), v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD **)(a1 + 32);
    v7 = (__CFString *)v10;
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v18[0] = v7;
    v18[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v8, "selectSQLWithColumns:orderingTerms:limit:", v12, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v16, "int64ValueForFirstRowAndColumn");

}

- (ML3Predicate)predicate
{
  return self->_predicate;
}

- (NSArray)orderingTerms
{
  return self->_orderingTerms;
}

- (BOOL)usingSections
{
  return self->_usingSections;
}

- (int64_t)options
{
  return self->_options;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 sectionProperty:(id)a5 cancelBlock:(id)a6 usingBlock:(id)a7
{
  uint64_t v10;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  size_t v29;
  size_t v30;
  void *v31;
  unsigned int v32;
  void *v33;
  id v34;
  void *v35;
  unsigned int (**v36)(void);
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  unsigned int (**v42)(void);
  id v43;
  _QWORD *v44;
  _QWORD *v45;
  size_t v46;
  _QWORD v47[6];
  _BYTE v48[48];
  _QWORD v49[4];
  _QWORD v50[3];
  char v51;
  _BYTE v52[32];
  int v53;
  _BYTE v54[32];
  int v55;

  v10 = a4;
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a5;
  v36 = (unsigned int (**)(void))a6;
  v34 = a7;
  -[ML3Query library](self, "library");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "checkoutReaderConnection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v54, 0, sizeof(v54));
  v55 = 1065353216;
  v33 = (void *)v13;
  if (v12 | v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v12, "count") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
      objc_msgSend(v14, "addObject:", v13);
    if (v12)
    {
      for (i = 0; objc_msgSend((id)v12, "count") > i; ++i)
      {
        objc_msgSend((id)v12, "objectAtIndexedSubscript:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[objc_class propertyIsCountProperty:](self->_entityClass, "propertyIsCountProperty:", v17))
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v54, i, i);
        else
          objc_msgSend(v15, "addObject:", v17);

      }
    }
  }
  else
  {
    v15 = 0;
  }
  -[ML3Predicate spotlightPredicate](self->_predicate, "spotlightPredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v52, 0, sizeof(v52));
  v53 = 1065353216;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v10;
    objc_msgSend(v18, "appendSQLToMutableString:entityClass:", v19, self->_entityClass);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_orderingTerms, "count") + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", self->_orderingTerms);
    +[ML3OrderingTerm orderingTermWithProperty:direction:](ML3OrderingTerm, "orderingTermWithProperty:direction:", v19, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    objc_storeStrong((id *)&self->_orderingTerms, v20);
    v22 = 0;
    v23 = 0;
    while (objc_msgSend(v15, "count") > v22)
    {
      objc_msgSend(v15, "objectAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3Query nameOrderPropertyForProperty:](self, "nameOrderPropertyForProperty:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v22, v25);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v52, v22, v22);
        v23 = 1;
      }

      ++v22;
    }
    -[ML3Query library](self, "library");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23 & 1;
    -[ML3Query loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:](self, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v26, v37, v18, v23 & 1, v36);

    if (v36 && v36[2]())
    {
      objc_msgSend(v35, "checkInDatabaseConnection:", v37);
      goto LABEL_29;
    }

    v10 = v32;
  }
  else
  {
    v27 = 0;
  }
  -[ML3Query selectPersistentIDsSQLAndProperties:ordered:](self, "selectPersistentIDsSQLAndProperties:ordered:", v15, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Query persistentIDParameters](self, "persistentIDParameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Query enumerationDatabaseResultForSQL:onConnection:withParameters:](self, "enumerationDatabaseResultForSQL:onConnection:withParameters:", v19, v37, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend((id)v12, "count");
  v30 = v29;
  if (v29)
  {
    v31 = malloc_type_calloc(v29, 8uLL, 0x80040B8603338uLL);
    bzero(v31, 8 * v30);
  }
  else
  {
    v31 = 0;
  }
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3321888768;
  v38[2] = __95__ML3Query_enumeratePersistentIDsAndProperties_ordered_sectionProperty_cancelBlock_usingBlock___block_invoke;
  v38[3] = &unk_1E5B52608;
  v38[4] = self;
  v44 = v50;
  v42 = v36;
  v39 = v33;
  v46 = v30;
  v48[40] = v27;
  std::unordered_set<int>::unordered_set((uint64_t)v47, (uint64_t)v52);
  v47[5] = v31;
  v40 = v18;
  std::unordered_set<int>::unordered_set((uint64_t)v48, (uint64_t)v54);
  v41 = (id)v12;
  v43 = v34;
  v45 = v49;
  objc_msgSend(v28, "enumerateRowsWithBlock:", v38);
  objc_msgSend(v35, "checkInDatabaseConnection:", v37);
  if (v31)
    free(v31);

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v48);
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v47);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);

LABEL_29:
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v52);

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v54);
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

void __28__ML3Query_hasRowForColumn___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "spotlightPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v5, v12, v3, 0, 0);

  }
  v6 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v7 = *(const __CFString **)(a1 + 40);
  else
    v7 = CFSTR("1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectSQLWithColumns:orderingTerms:limit:", v8, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentIDParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:withParameters:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "hasAtLeastOneRow");

}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 limit:(unint64_t)a5
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, 0, a4, 0, 0, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5
{
  objc_msgSend(a4, "executeQuery:withParameters:", a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4 distinct:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  Class entityClass;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a5;
  v5 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  entityClass = self->_entityClass;
  -[ML3Query persistentIDProperty](self, "persistentIDProperty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v11);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        -[objc_class disambiguatedSQLForProperty:](self->_entityClass, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  if (v5)
    -[ML3Query selectSQLWithColumns:groupBy:distinct:](self, "selectSQLWithColumns:groupBy:distinct:", v8, 0, v19);
  else
    -[ML3Query selectSQLWithColumns:orderingTerms:distinct:](self, "selectSQLWithColumns:orderingTerms:distinct:", v8, 0, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 distinct:(BOOL)a5
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, a4, self->_orderingTerms, 0, 0, a5, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)sectionProperty
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_usingSections || !-[NSArray count](self->_orderingTerms, "count"))
  {
    v4 = 0;
    goto LABEL_6;
  }
  -[NSArray objectAtIndex:](self->_orderingTerms, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  -[objc_class sectionPropertyForProperty:](self->_entityClass, "sectionPropertyForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return (NSString *)v5;
}

- (BOOL)filtersOnDynamicProperties
{
  return self->_filtersOnDynamicProperties;
}

- (void)enumeratePersistentIDsAndSectionsWithProperty:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__ML3Query_enumeratePersistentIDsAndSectionsWithProperty_usingBlock___block_invoke;
  v8[3] = &unk_1E5B5F9B8;
  v9 = v6;
  v7 = v6;
  -[ML3Query enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:](self, "enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:", 0, 1, a3, 0, v8);

}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  -[ML3Query selectPersistentIDsSQLAndProperties:ordered:distinct:](self, "selectPersistentIDsSQLAndProperties:ordered:distinct:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)persistentIDProperty
{
  __CFString *v2;

  v2 = CFSTR("ROWID");
  return (NSString *)CFSTR("ROWID");
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ML3Query_enumeratePersistentIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E5B5F9B8;
  v7 = v4;
  v5 = v4;
  -[ML3Query enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:](self, "enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:", 0, 1, 0, 0, v6);

}

- (unint64_t)countOfEntities
{
  return -[ML3Query countOfDistinctRowsForColumn:](self, "countOfDistinctRowsForColumn:", self->_propertyToCount);
}

- (int64_t)anyEntityPersistentID
{
  ML3MusicLibrary *library;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  library = self->_library;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__ML3Query_anyEntityPersistentID__block_invoke;
  v5[3] = &unk_1E5B64FE0;
  v5[4] = self;
  v5[5] = &v6;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_options & 1;
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (ML3Query)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  Class v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ML3Query *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("musicLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("orderingTerms"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usingSections"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonDirectAggregateQuery"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyToCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](self, "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v5, v7, v8, v12, v13, v14, v15, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("options")));

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ML3Query library](self, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("musicLibrary"));

  NSStringFromClass(-[ML3Query entityClass](self, "entityClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("entityClass"));

  -[ML3Query predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("predicate"));

  -[ML3Query orderingTerms](self, "orderingTerms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("orderingTerms"));

  -[ML3Query nonDirectAggregateQuery](self, "nonDirectAggregateQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("nonDirectAggregateQuery"));

  -[ML3Query propertyToCount](self, "propertyToCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("propertyToCount"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query usingSections](self, "usingSections"), CFSTR("usingSections"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query ignoreSystemFilterPredicates](self, "ignoreSystemFilterPredicates"), CFSTR("ignoreSystemFilterPredicates"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query ignoreRestrictionsPredicates](self, "ignoreRestrictionsPredicates"), CFSTR("ignoreRestrictionsPredicates"));
  objc_msgSend(v10, "encodeInt64:forKey:", self->_options, CFSTR("options"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  int v7;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  int v24;
  _BOOL4 v25;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = -[ML3Query entityClass](self, "entityClass");
    if (v6 == (objc_class *)objc_msgSend(v4, "entityClass"))
    {
      -[ML3Query predicate](self, "predicate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          LOBYTE(v7) = 0;
LABEL_23:

          goto LABEL_4;
        }
      }
      -[ML3Query orderingTerms](self, "orderingTerms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "orderingTerms", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = v15;
      if (v16 == v17)
      {

      }
      else
      {
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
        {
          LOBYTE(v7) = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      -[ML3Query nonDirectAggregateQuery](self, "nonDirectAggregateQuery");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nonDirectAggregateQuery");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      if (v21 == v22)
      {

      }
      else
      {
        v7 = objc_msgSend(v21, "isEqual:", v22);

        if (!v7)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      v23 = -[ML3Query usingSections](self, "usingSections");
      if (v23 == objc_msgSend(v4, "usingSections")
        && (v24 = -[ML3Query ignoreSystemFilterPredicates](self, "ignoreSystemFilterPredicates"),
            v24 == objc_msgSend(v4, "ignoreSystemFilterPredicates")))
      {
        v25 = -[ML3Query ignoreRestrictionsPredicates](self, "ignoreRestrictionsPredicates");
        v7 = v25 ^ objc_msgSend(v4, "ignoreRestrictionsPredicates") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
      goto LABEL_21;
    }
  }
  LOBYTE(v7) = 0;
LABEL_4:

  return v7;
}

- (id)reverseQuery
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v3 = (_QWORD *)-[ML3Query copy](self, "copy");
  +[ML3OrderingTerm reversedTerms:](ML3OrderingTerm, "reversedTerms:", self->_orderingTerms);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[4];
  v3[4] = v4;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_library);
  v4[2] = self->_entityClass;
  v5 = -[ML3Predicate copy](self->_predicate, "copy");
  v6 = v4[3];
  v4[3] = (id)v5;

  v7 = -[NSArray copy](self->_orderingTerms, "copy");
  v8 = v4[4];
  v4[4] = (id)v7;

  v9 = -[ML3AggregateQuery copy](self->_nonDirectAggregateQuery, "copy");
  v10 = v4[6];
  v4[6] = (id)v9;

  objc_storeStrong(v4 + 5, self->_propertyToCount);
  *((_BYTE *)v4 + 56) = self->_usingSections;
  v4[10] = (id)self->_limit;
  v4[8] = (id)self->_options;
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3Query;
  -[ML3Query description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(_predicate = %@, _orderingTerms = %@, _using sections = %d)"), v4, self->_predicate, self->_orderingTerms, self->_usingSections);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sections
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __20__ML3Query_sections__block_invoke;
  v6[3] = &unk_1E5B5F8F0;
  v4 = v3;
  v7 = v4;
  -[ML3Query enumerateSectionsUsingBlock:](self, "enumerateSectionsUsingBlock:", v6);

  return v4;
}

- (BOOL)deleteAllEntitiesFromLibrary
{
  return -[ML3Query deleteAllEntitiesFromLibraryWithDeletionType:](self, "deleteAllEntitiesFromLibraryWithDeletionType:", 1);
}

- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3
{
  ML3MusicLibrary *library;
  char v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  library = self->_library;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke;
  v6[3] = &unk_1E5B5F940;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  -[ML3MusicLibrary performDatabaseTransactionWithBlock:](library, "performDatabaseTransactionWithBlock:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3 usingConnection:(id)a4
{
  char v4;
  _QWORD v6[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke;
  v6[3] = &unk_1E5B5F968;
  v6[4] = self;
  v6[5] = &v8;
  v7 = a3;
  objc_msgSend(a4, "performTransactionWithBlock:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4;
  ML3QuerySection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = a3;
  if (self->_usingSections)
  {
    -[ML3Query library](self, "library");
    v5 = (ML3QuerySection *)objc_claimAutoreleasedReturnValue();
    -[ML3Query selectSectionsSQL](self, "selectSectionsSQL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Query sectionProperty](self, "sectionProperty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3QuerySection checkoutReaderConnection](v5, "checkoutReaderConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Predicate spotlightPredicate](self->_predicate, "spotlightPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[ML3Query library](self, "library");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3Query loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:](self, "loadNamesFromLibrary:onConnection:forPredicate:loadAllNames:cancelHandler:", v9, v7, v8, 0, 0);

    }
    -[ML3Query sectionsParameters](self, "sectionsParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery:withParameters:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__ML3Query_enumerateSectionsUsingBlock___block_invoke;
    v14[3] = &unk_1E5B5F990;
    v12 = v13;
    v15 = v12;
    v17 = v20;
    v16 = v4;
    v18 = v19;
    objc_msgSend(v11, "enumerateRowsWithBlock:", v14);
    -[ML3QuerySection checkInDatabaseConnection:](v5, "checkInDatabaseConnection:", v7);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);

  }
  else
  {
    v5 = objc_alloc_init(ML3QuerySection);
    -[ML3QuerySection setRange:](v5, "setRange:", 0, -[ML3Query countOfEntities](self, "countOfEntities"));
    LOBYTE(v20[0]) = 0;
    (*((void (**)(id, ML3QuerySection *, _QWORD, _QWORD *))v4 + 2))(v4, v5, 0, v20);
  }

}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ML3Query_enumeratePersistentIDsAndProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E5B5F9B8;
  v9 = v6;
  v7 = v6;
  -[ML3Query enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:](self, "enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:", a3, 1, 0, 0, v8);

}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__ML3Query_enumeratePersistentIDsAndProperties_ordered_usingBlock___block_invoke;
  v10[3] = &unk_1E5B5F9B8;
  v11 = v8;
  v9 = v8;
  -[ML3Query enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:](self, "enumeratePersistentIDsAndProperties:ordered:sectionProperty:cancelBlock:usingBlock:", a3, v5, 0, 0, v10);

}

- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ML3MusicLibrary *library;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[ML3Query valueForAggregateFunction:onEntitiesForProperty:]::onceToken != -1)
    dispatch_once(&-[ML3Query valueForAggregateFunction:onEntitiesForProperty:]::onceToken, &__block_literal_global_4015);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4016;
  v26 = __Block_byref_object_dispose__4017;
  v27 = 0;
  if (objc_msgSend((id)__supportedAggregateFunctions, "containsObject:", v6))
  {
    -[objc_class disambiguatedSQLForProperty:](-[ML3Query entityClass](self, "entityClass"), "disambiguatedSQLForProperty:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@(%@)"), v6, v8);
      v28[0] = v9;
      v28[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3Query selectSQLWithColumns:orderingTerms:](self, "selectSQLWithColumns:orderingTerms:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[ML3Query persistentIDParameters](self, "persistentIDParameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      library = self->_library;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke_67;
      v18[3] = &unk_1E5B62DC0;
      v14 = v11;
      v19 = v14;
      v20 = v12;
      v21 = &v22;
      v15 = v12;
      -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v18);

    }
  }
  v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, a4, self->_orderingTerms, 0, 0, 0, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 directionality:(id)a5
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, 0, a4, a5, 0, 0, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, 0, a4, 0, 0, 0, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 distinct:(BOOL)a5
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, 0, a4, 0, 0, a5, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, a4, a5, 0, 0, 0, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 limit:(unint64_t)a6
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, a4, a5, 0, 0, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7
{
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:directionality:usingLowerBound:distinct:limit:", a3, a4, a5, a6, a7, 0, self->_limit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lowerBoundParametersForOrderingTerms:(id)a3 lowerBoundPersistentID:(int64_t)a4
{
  uint64_t v6;
  id v7;
  id v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  ML3MusicLibrary *library;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  int64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  ML3Query *v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendString:", CFSTR("SELECT "));
  v6 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke;
  v37[3] = &unk_1E5B5FA00;
  v7 = v23;
  v38 = v7;
  v39 = self;
  v8 = v25;
  v40 = v8;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v37);
  objc_msgSend(v7, "appendString:", CFSTR(" FROM "));
  objc_msgSend(v7, "appendString:", v27);
  if (objc_msgSend(v8, "count"))
  {
    v9 = a4;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v13);
          objc_msgSend(v7, "appendString:", CFSTR(" "));
          objc_msgSend(v7, "appendString:", v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v11);
    }

    a4 = v9;
    v6 = MEMORY[0x1E0C809B0];
  }
  objc_msgSend(v7, "appendString:", CFSTR(" WHERE "));
  -[objc_class databaseTable](self->_entityClass, "databaseTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v15);

  objc_msgSend(v7, "appendString:", CFSTR(".ROWID = ?"));
  library = self->_library;
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_2;
  v28[3] = &unk_1E5B5FA50;
  v17 = v7;
  v29 = v17;
  v32 = a4;
  v18 = v26;
  v30 = v18;
  v19 = v24;
  v31 = v19;
  -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v28);
  v20 = v31;
  v21 = v19;

  return v21;
}

- (id)selectSectionsSQL
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t limit;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ML3Query persistentIDProperty](self, "persistentIDProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](self->_entityClass, "disambiguatedSQLForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_limit)
  {
    v6 = -[ML3Query sectionsPersistentIDColumnIsDistinct](self, "sectionsPersistentIDColumnIsDistinct");
    limit = self->_limit;
    if (v6)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIN(COUNT(DISTINCT %@), %lu)"), v5, limit);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIN(COUNT(%@), %lu)"), v5, limit);
  }
  else if (-[ML3Query sectionsPersistentIDColumnIsDistinct](self, "sectionsPersistentIDColumnIsDistinct"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COUNT(DISTINCT %@)"), v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COUNT(%@)"), v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[ML3Query sectionProperty](self, "sectionProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[objc_class disambiguatedSQLForProperty:](self->_entityClass, "disambiguatedSQLForProperty:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);
  }
  else
  {
    v10 = 0;
  }
  -[ML3Query selectSQLWithColumns:groupBy:orderingTerms:limit:](self, "selectSQLWithColumns:groupBy:orderingTerms:limit:", v3, v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sectionsParameters
{
  Class entityClass;
  Class v4;
  void *v5;
  void *v6;
  void *v7;

  entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (v4 = self->_entityClass, v4 == (Class)objc_opt_class()))
  {
    -[ML3Query predicateIncludingSystemwidePredicates](self, "predicateIncludingSystemwidePredicates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ML3Query predicate](self, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "databaseStatementParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)selectUnorderedPersistentIDsSQL
{
  return -[ML3Query selectPersistentIDsSQLAndProperties:ordered:](self, "selectPersistentIDsSQLAndProperties:ordered:", 0, 0);
}

- (NSString)selectPersistentIDsSQL
{
  return (NSString *)-[ML3Query selectPersistentIDsSQLAndProperties:ordered:](self, "selectPersistentIDsSQLAndProperties:ordered:", 0, 1);
}

- (NSString)selectCountSQL
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("COUNT(1)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Query selectSQLWithColumns:orderingTerms:](self, "selectSQLWithColumns:orderingTerms:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)countStatementParameters
{
  void *v2;
  void *v3;

  -[ML3Query predicateIncludingSystemwidePredicates](self, "predicateIncludingSystemwidePredicates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseStatementParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)sectionsPersistentIDColumnIsDistinct
{
  return 0;
}

- (NSString)propertyToCount
{
  return self->_propertyToCount;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (ML3AggregateQuery)nonDirectAggregateQuery
{
  return self->_nonDirectAggregateQuery;
}

void __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  int v13;
  id v14;

  v7 = a2;
  if (*(_QWORD *)(a1 + 56) >= a3)
  {
    v14 = v7;
    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" AND "));
    objc_msgSend(v14, "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "disambiguatedSQLForProperty:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    if (*(_QWORD *)(a1 + 56) == a3)
    {
      v11 = objc_msgSend(*(id *)(a1 + 48), "count");
      if (v11 > a3
        && (objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "uppercaseString"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "isEqualToString:", CFSTR("DESC"))))
      {

      }
      else
      {
        v13 = objc_msgSend(v14, "direction");
        if (v11 > a3)
        {

        }
        if (v13 != 2)
        {
          v12 = CFSTR(" > ");
          goto LABEL_15;
        }
      }
      v12 = CFSTR(" < ");
    }
    else
    {
      v12 = CFSTR(" = ");
    }
LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v12);
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("?"));

    v7 = v14;
    goto LABEL_16;
  }
  *a4 = 1;
LABEL_16:

}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(v5, "appendSQLToMutableString:entityClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(v5, "property", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "joinClausesForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_3;
  v8[3] = &unk_1E5B639C0;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateRowsWithBlock:", v8);

}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v10 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v6)
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = *(void **)(a1 + 32);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_4;
      v11[3] = &unk_1E5B5FA28;
      v14 = v7;
      v12 = v10;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

      ++v7;
    }
    while (v6 != v7);
  }
  *a4 = 1;

}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (*(_QWORD *)(a1 + 48) >= a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7 = (void *)v5;
    v9 = (id)v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v7);
    v8 = v9;
    if (!v9)
    {

      v8 = 0;
    }

  }
  else
  {
    *a4 = 1;
  }
}

void __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke_67(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "executeQuery:withParameters:", a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForFirstRowAndColumn");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("TOTAL"), CFSTR("MAX"), CFSTR("MIN"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__supportedAggregateFunctions;
  __supportedAggregateFunctions = v0;

}

uint64_t __67__ML3Query_enumeratePersistentIDsAndProperties_ordered_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ML3Query_enumeratePersistentIDsAndProperties_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__ML3Query_enumerateSectionsUsingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  int v8;
  ML3QuerySection *v9;
  char v10;
  char v11;

  v6 = a2;
  v7 = objc_msgSend(v6, "int64ForColumnIndex:", 0);
  if (v7
    && (!a1[4] ? (v8 = 0) : (v8 = objc_msgSend(v6, "intForColumnIndex:", 1)),
        v9 = -[ML3QuerySection initWithRange:sectionIndex:]([ML3QuerySection alloc], "initWithRange:sectionIndex:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), v7, v8), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v7, v11 = 0, v9))
  {
    (*(void (**)(void))(a1[5] + 16))();
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v10 = v11;

  }
  else
  {
    v10 = 0;
  }
  *a4 = v10;

}

uint64_t __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 10000;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = malloc_type_malloc(0x13880uLL, 0x100004000313F17uLL);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke_2;
  v5[3] = &unk_1E5B5F918;
  v5[4] = &v10;
  v5[5] = v14;
  v5[6] = &v6;
  objc_msgSend(v2, "enumeratePersistentIDsUsingBlock:", v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteFromLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), v7[3], v11[3]);
  free((void *)v7[3]);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v3;
}

_QWORD *__73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = result;
  v6 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v7 = *(_QWORD *)(result[5] + 8);
  if (v6 == *(_QWORD *)(v7 + 24))
  {
    *(_QWORD *)(v7 + 24) = 2 * v6;
    result = malloc_type_realloc(*(void **)(*(_QWORD *)(result[6] + 8) + 24), 8 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24), 0x100004000313F17uLL);
    *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) = result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) + 8 * a3) = a2;
  ++*(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24);
  return result;
}

uint64_t __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 10000;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = malloc_type_malloc(0x13880uLL, 0x100004000313F17uLL);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke_2;
  v5[3] = &unk_1E5B5F918;
  v5[4] = &v10;
  v5[5] = v14;
  v5[6] = &v6;
  objc_msgSend(v2, "enumeratePersistentIDsUsingBlock:", v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "deleteFromLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), v7[3], v11[3]);
  free((void *)v7[3]);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v3;
}

_QWORD *__57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = result;
  v6 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v7 = *(_QWORD *)(result[5] + 8);
  if (v6 == *(_QWORD *)(v7 + 24))
  {
    *(_QWORD *)(v7 + 24) = 2 * v6;
    result = malloc_type_realloc(*(void **)(*(_QWORD *)(result[6] + 8) + 24), 8 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24), 0x100004000313F17uLL);
    *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) = result;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) + 8 * a3) = a2;
  ++*(_QWORD *)(*(_QWORD *)(v5[4] + 8) + 24);
  return result;
}

uint64_t __20__ML3Query_sections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)loadNamesFromLibrary:(id)a3 onConnection:(id)a4 forPredicate:(id)a5 loadAllNames:(BOOL)a6 cancelHandler:(id)a7
{
  _BOOL4 v8;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  if (v8)
  {
    v14 = +[ML3SpotlightNameCache copyFromLibrary:cancelHandler:](ML3SpotlightNameCache, "copyFromLibrary:cancelHandler:", v16, v13);
    v15 = (void *)v12[1];
    v12[1] = v14;

  }
  +[ML3SpotlightMatchingNameCache loadFromLibrary:namesMatchingString:cancelHandler:](ML3SpotlightMatchingNameCache, "loadFromLibrary:namesMatchingString:cancelHandler:", v16, v12[3], v13);

}

- (id)nameOrderPropertyForProperty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7[0] = CFSTR("item_extra.title");
  v7[1] = CFSTR("album.album");
  v8[0] = CFSTR("item_search.search_title");
  v8[1] = CFSTR("item_search.search_album");
  v7[2] = CFSTR("album_artist.album_artist");
  v7[3] = CFSTR("item_artist.item_artist");
  v8[2] = CFSTR("item_search.search_album_artist");
  v8[3] = CFSTR("item_search.search_artist");
  v7[4] = CFSTR("composer.composer");
  v7[5] = CFSTR("item_artist.series_name");
  v8[4] = CFSTR("item_search.search_composer");
  v8[5] = CFSTR("item_search.search_series");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
