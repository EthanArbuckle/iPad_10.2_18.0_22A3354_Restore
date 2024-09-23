@implementation ML3Entity

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

void __43__ML3Entity_getValues_forProperties_count___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__ML3Entity_getValues_forProperties_count___block_invoke_2;
  v10[3] = &__block_descriptor_40_e40_v32__0__ML3DatabaseRow_8__NSError_16_B24l;
  v10[4] = a1[6];
  objc_msgSend(v9, "enumerateRowsWithBlock:", v10);

}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "predisambiguatedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "_createDisambiguatedSQLForProperty:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)subselectStatementForProperty:(id)a3
{
  return 0;
}

+ (id)predicateIncludingSystemwidePredicatesWithPredicate:(id)a3 library:(id)a4 options:(int64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultFilterPredicates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  if ((v5 & 1) != 0)
    goto LABEL_7;
  if ((id)objc_opt_class() != a1)
  {
    objc_msgSend(v9, "libraryEntityFilterPredicatesForEntityClass:", a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "addObjectsFromArray:", v12);

  }
  if ((id)objc_opt_class() != a1)
  {
LABEL_7:
    if ((v5 & 2) != 0)
      goto LABEL_14;
    goto LABEL_8;
  }
  objc_msgSend(v9, "libraryEntityFilterPredicatesForContainerClass:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v10, "addObjectsFromArray:", v14);

  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((id)objc_opt_class() == a1 && objc_msgSend(v9, "mediaRestrictionEnabled"))
    {
      +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

    }
  }
LABEL_14:
  if ((v5 & 8) != 0 && (id)objc_opt_class() == a1)
  {
    +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("(item.base_location_id OR item.remote_location_id)"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    if ((v5 & 4) != 0)
      goto LABEL_20;
  }
  else if ((v5 & 4) != 0)
  {
    goto LABEL_20;
  }
  if ((id)objc_opt_class() != a1)
  {
    +[ML3PropertyPredicate predicateWithProperty:](ML3PropertyPredicate, "predicateWithProperty:", CFSTR("in_my_library"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

  }
LABEL_20:
  if (v8)
    objc_msgSend(v10, "addObject:", v8);
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    if (objc_msgSend(v10, "count") != 1)
    {
      v18 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v10, "lastObject");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
LABEL_28:

  return v18;
}

+ (id)defaultFilterPredicates
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

+ (id)predisambiguatedProperties
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("entity_revision.revision");
  v3[1] = CFSTR("entity_revision.deleted");
  v4[0] = CFSTR("entity_revision.revision");
  v4[1] = CFSTR("entity_revision.deleted");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  ML3Query *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v8, a1, v9, v10, 0, 0, 0, 0);

  return v11;
}

+ (id)allItemsQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  ML3Query *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v10, a1, v11, v12, v6, 0, 0, 4);

  return v13;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "defaultOrderingTerms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithLibrary:predicate:orderingTerms:usingSections:", v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  ML3Query *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v10, a1, v11, v12, v6, 0, 0, 0);

  return v13;
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  size_t v5;
  const void **v6;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  id WeakRetained;
  id *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id *v24;
  id v25;
  char *v26;
  _QWORD v27[2];
  id *v28;
  char *v29;
  _QWORD v30[4];
  id v31;
  ML3Entity *v32;
  id *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v5 = a5;
    v6 = a4;
    if (a5 == 1 && objc_msgSend((id)*a4, "isEqualToString:", CFSTR("ROWID")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27[1] = v27;
      v9 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v9, v5);
      v10 = 8 * v5;
      v29 = (char *)v27 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v29, 8 * v5);
      v11 = 0;
      v12 = 0;
      do
      {
        a3[v11] = 0;
        if (objc_msgSend((id)objc_opt_class(), "propertyIsCountProperty:", v6[v11]))
          v9[v11] = 1;
        else
          objc_storeStrong((id *)&v29[8 * v12++], (id)v6[v11]);
        ++v11;
      }
      while (v5 != v11);
      bzero(a3, 8 * v5);
      WeakRetained = objc_loadWeakRetained((id *)&self->_library);
      if (v12)
      {
        v14 = (id *)malloc_type_calloc(8uLL, v12, 0x11EAEA48uLL);
        v15 = (void *)objc_msgSend((id)objc_opt_class(), "newSelectSQLForProperties:count:predicate:", v29, v12, 0);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __43__ML3Entity_getValues_forProperties_count___block_invoke;
        v30[3] = &unk_1E5B5CC08;
        v31 = v15;
        v32 = self;
        v28 = v14;
        v33 = v14;
        v16 = v15;
        objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v30);

      }
      else
      {
        v28 = 0;
      }
      v17 = 0;
      do
      {
        if (*v9++)
        {
          v19 = (void *)objc_opt_class();
          v20 = WeakRetained;
          objc_msgSend((id)objc_opt_class(), "queryWithLibrary:predicate:", WeakRetained, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "countingQueryForBaseQuery:countProperty:forIdentifier:", v21, *v6, self->_persistentID);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "countOfEntities"));
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = &unk_1E5BAAB48;
          }
          *a3 = v23;

          WeakRetained = v20;
        }
        else
        {
          v24 = v28;
          *a3 = objc_retainAutorelease(v28[v17]);
          v25 = v24[v17];
          v24[v17] = 0;

          ++v17;
        }
        ++a3;
        ++v6;
        --v5;
      }
      while (v5);
      free(v28);

      v26 = v29 - 8;
      do
      {

        v10 -= 8;
      }
      while (v10);
    }
  }
}

+ (id)newSelectSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  const void **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
LABEL_3:
    v48 = v9;
    v49 = v8;
    objc_msgSend(a1, "databaseTable");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SQLForEntityClass:", a1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1E5B66908;
    v13 = v12;

    v46 = v13;
    v14 = -[__CFString length](v13, "length");
    v15 = CFSTR(" AND ");
    if (!v14)
      v15 = &stru_1E5B66908;
    v45 = v15;
    objc_msgSend(v7, "SQLJoinClausesForClass:", a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "mutableCopy");

    v18 = a4;
    if (a4)
    {
      v19 = 0;
      v20 = a3;
      do
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(a1, "joinClausesForProperty:", v20[v19]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v52 != v24)
                objc_enumerationMutation(v21);
              v26 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              if (!v17)
                v17 = objc_alloc_init(MEMORY[0x1E0C99E10]);
              objc_msgSend(v17, "addObject:", v26);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          }
          while (v23);
        }

        ++v19;
        v20 = a3;
      }
      while (v19 != v18);
    }
    else
    {
      v20 = a3;
    }
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "objectEnumerator");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR(" "));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = &stru_1E5B66908;
    }
    objc_msgSend(a1, "disambiguatedSelectSQLForProperty:", *v20);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    if (v18 < 2)
    {
      v38 = (void *)v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v18 - 1;
      v40 = (uint64_t *)(v20 + 1);
      do
      {
        objc_msgSend(v38, "appendString:", CFSTR(","));
        v41 = *v40++;
        objc_msgSend(a1, "disambiguatedSelectSQLForProperty:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "appendString:", v42);

        --v39;
      }
      while (v39);

    }
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ %@ WHERE %@.ROWID = ?%@%@"), v38, v47, v35, v47, v45, v46);
    v9 = v48;
    if (!v7 && v48)
      objc_msgSend(v49, "setObject:forKey:", v43, v48);

    v8 = v49;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "threadDictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "objectForKey:", CFSTR("ML3EntityPropertySelectSQLCache"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("ML3EntityPropertySelectSQLCache"));
  }
  NSStringFromClass((Class)a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", v30);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    NSStringFromClass((Class)a1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v8, v31);

  }
  if (a4 == 1)
  {
    v32 = (id)*a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", a3, a4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v32;
  objc_msgSend(v8, "objectForKey:", v32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (!v43)
    goto LABEL_3;
LABEL_42:

  return v43;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return 0;
}

+ (void)predisambiguateProperties:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend((id)objc_opt_class(), "_createDisambiguatedSQLForProperty:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

+ (id)_createDisambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "joinClausesForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "databaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v8, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)joinClausesForProperty:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("entity_revision.revision")))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 80);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", CFSTR("JOIN entity_revision ON ("));
  objc_msgSend(a1, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  objc_msgSend(v4, "appendString:", CFSTR(".ROWID = entity_revision.entity_pid)"));
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)disambiguatedSelectSQLForProperty:(id)a3
{
  id v4;
  __CFString *v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("entity_revision.revision")) & 1) != 0)
  {
    v5 = CFSTR("MAX(entity_revision.revision)");
  }
  else
  {
    objc_msgSend(a1, "disambiguatedSQLForProperty:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)newWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentID:inLibrary:", a3, v6);

  return v7;
}

- (ML3Entity)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v7;
  ML3Entity *v8;
  ML3Entity *v9;
  void *v11;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3Entity;
  v8 = -[ML3Entity init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_persistentID = a3;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("ML3Entity.m"), 63, &stru_1E5B66908);

    }
    objc_storeWeak((id *)&v9->_library, v7);
  }

  return v9;
}

void __43__ML3Entity_getValues_forProperties_count___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = a2;
  v6 = objc_msgSend(v14, "columnCount");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 1;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 8 * v8);
      *(_QWORD *)(v11 + 8 * v8) = v10;

      v8 = v9;
    }
    while (v7 > v9++);
  }
  *a4 = 1;

}

+ (id)aggregateQueryWithUnitQuery:(id)a3 foreignPersistentIDProperty:(id)a4
{
  id v6;
  id v7;
  ML3AggregateQuery *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ML3AggregateQuery initWithUnitQuery:aggregateEntityClass:foreignPersistentIDProperty:]([ML3AggregateQuery alloc], "initWithUnitQuery:aggregateEntityClass:foreignPersistentIDProperty:", v7, a1, v6);

  return v8;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  return 0;
}

+ (id)anyInLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8;
  id v9;
  ML3Query *v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v8, a1, v9, 0, 0, 0, 0, a5);
  v11 = -[ML3Query anyEntityPersistentID](v10, "anyEntityPersistentID");
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentID:inLibrary:", v11, v8);
  else
    v12 = 0;

  return v12;
}

- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  return -[ML3Entity initWithDictionary:inLibrary:cachedNameOrders:usingConnection:](self, "initWithDictionary:inLibrary:cachedNameOrders:usingConnection:", a3, a4, a5, 0);
}

- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t IntegerUUID;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  ML3Entity *v21;
  id v22;
  void *v23;
  ML3Entity *v24;
  id v25;
  id v26;
  id v27;
  int v28;
  ML3Entity *v29;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  ML3Entity *v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[4];
  id v46;
  ML3Entity *v47;
  id v48;
  SEL v49;

  v11 = a3;
  v12 = a4;
  v32 = a5;
  v13 = a6;
  v33 = v11;
  objc_msgSend(v11, "objectForKey:", CFSTR("ROWID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  if (v14)
    IntegerUUID = objc_msgSend(v14, "longLongValue", v14, v32);
  else
    IntegerUUID = ML3CreateIntegerUUID();
  v16 = IntegerUUID;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "unsettableProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke;
  v45[3] = &unk_1E5B5C530;
  v20 = v18;
  v46 = v20;
  v21 = self;
  v47 = v21;
  v49 = a2;
  v22 = v17;
  v48 = v22;
  objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v45);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  v23 = v13;
  if (!v13)
  {
    objc_msgSend(v12, "checkoutWriterConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_2;
  v34[3] = &unk_1E5B5C580;
  v24 = v21;
  v35 = v24;
  v25 = v22;
  v36 = v25;
  v40 = v16;
  v26 = v12;
  v37 = v26;
  v39 = &v41;
  v27 = v23;
  v38 = v27;
  objc_msgSend(v27, "performTransactionWithBlock:", v34);
  if (!v13)
  {
    objc_msgSend(v26, "checkInDatabaseConnection:", v27);

    v27 = 0;
  }
  if (*((_BYTE *)v42 + 24)
    && (v28 = objc_msgSend((id)objc_opt_class(), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:", v26, v16, 0, 0), *((_BYTE *)v42 + 24) = v28, v28))
  {
    v24 = -[ML3Entity initWithPersistentID:inLibrary:](v24, "initWithPersistentID:inLibrary:", v16, v26);
    v29 = v24;
  }
  else
  {
    v29 = 0;
  }

  _Block_object_dispose(&v41, 8);
  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t persistentID;
  id WeakRetained;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  persistentID = self->_persistentID;
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v7 = (void *)objc_msgSend(v4, "initWithPersistentID:inLibrary:", persistentID, WeakRetained);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() && v4[2] == self->_persistentID)
  {
    objc_msgSend(v4, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Entity library](self, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_persistentID;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3Entity;
  -[ML3Entity description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("(pid = %lld)"), self->_persistentID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)existsInLibrary
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  _QWORD v9[4];
  id v10;
  ML3Entity *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = (void *)objc_opt_class();
  v4 = (void *)objc_msgSend(CFSTR("SELECT 1 FROM "), "mutableCopy");
  objc_msgSend(v3, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  objc_msgSend(v4, "appendString:", CFSTR(" WHERE ROWID = ? LIMIT 1;"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__ML3Entity_existsInLibrary__block_invoke;
  v9[3] = &unk_1E5B62DC0;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v9);

  LOBYTE(self) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

- (BOOL)matchesPredicate:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14 = CFSTR("ROWID");
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "newSelectSQLForProperties:count:predicate:", &v14, 1, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__ML3Entity_matchesPredicate___block_invoke;
  v10[3] = &unk_1E5B62250;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v12 = v8;
  v13 = &v15;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v10);

  LOBYTE(WeakRetained) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)WeakRetained;
}

- (id)URL
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  v4 = -[ML3Entity persistentID](self, "persistentID");
  -[ML3Entity library](self, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForEntityWithPersistentID:libraryUID:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getValuesForProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v36 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("ROWID")))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("ROWID"));

          }
          else
          {
            if (objc_msgSend((id)objc_opt_class(), "propertyIsCountProperty:", v13))
              v15 = v7;
            else
              v15 = v6;
            objc_msgSend(v15, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v10);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    v17 = (void *)objc_opt_class();
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), self->_persistentID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", WeakRetained, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __36__ML3Entity_getValuesForProperties___block_invoke;
    v41[3] = &unk_1E5B61DB8;
    v42 = v6;
    v35 = v5;
    v20 = v5;
    v43 = v20;
    v33 = v42;
    v34 = v19;
    objc_msgSend(v19, "enumeratePersistentIDsAndProperties:usingBlock:", v42, v41);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = v7;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = (void *)objc_opt_class();
          objc_msgSend((id)objc_opt_class(), "queryWithLibrary:predicate:", WeakRetained, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "countingQueryForBaseQuery:countProperty:forIdentifier:", v28, v26, self->_persistentID);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            v30 = objc_msgSend(v29, "countOfEntities");
          else
            v30 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v31, v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v23);
    }

    v5 = v35;
    v4 = v36;
  }

  return v5;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = a3;
  -[ML3Entity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v6, &v7, 1);
  v4 = v6;

  return v4;
}

- (BOOL)setValues:(const void *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  unsigned int v12;
  void *v13;
  void *v14;
  BOOL v15;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  if (a5)
  {
    v11 = 0;
    v12 = 1;
    do
    {
      if (a3[v11])
      {
        objc_msgSend(v9, "addObject:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
      if (a4[v11])
      {
        objc_msgSend(v10, "addObject:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

      }
      v11 = v12++;
    }
    while (v11 < a5);
  }
  v15 = -[ML3Entity setValues:forProperties:](self, "setValues:forProperties:", v9, v10);

  return v15;
}

- (BOOL)setValues:(id)a3 forProperties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ML3Entity library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkoutWriterConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushTransaction");
  LOBYTE(self) = -[ML3Entity setValues:forProperties:usingConnection:](self, "setValues:forProperties:usingConnection:", v7, v6, v9);

  objc_msgSend(v9, "popTransactionAndCommit:", 1);
  objc_msgSend(v8, "checkInDatabaseConnection:", v9);

  return (char)self;
}

- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, BOOL, _QWORD);
  id WeakRetained;
  int v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, BOOL, _QWORD))a6;
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    v14 = objc_msgSend(WeakRetained, "isCurrentThreadInTransaction");

    if (v14)
    {
      v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "Warning: ignoring asynchronous flag", buf, 2u);
      }

      goto LABEL_10;
    }
    if (!a5)
    {
LABEL_10:
      v12[2](v12, -[ML3Entity setValues:forProperties:](self, "setValues:forProperties:", v10, v11), 0);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a5)
  {
LABEL_9:
    -[ML3Entity library](self, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__ML3Entity_setValues_forProperties_async_withCompletionBlock___block_invoke;
    v17[3] = &unk_1E5B5C5F8;
    v17[4] = self;
    v18 = v10;
    v19 = v11;
    objc_msgSend(v16, "performAsyncDatabaseWriteTransactionWithBlock:completionBlock:", v17, v12);

    goto LABEL_11;
  }
  -[ML3Entity setValues:forProperties:](self, "setValues:forProperties:", v10, v11);
LABEL_11:

}

- (BOOL)setValues:(id)a3 forProperties:(id)a4 usingConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity library](self, "library");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v11, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", v10, v9, v13, v14, v8);

  return (char)self;
}

- (BOOL)setValuesForPropertiesWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[ML3Entity setValues:forProperties:](self, "setValues:forProperties:", v6, v5);
  return (char)self;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v13[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = -[ML3Entity setValues:forProperties:](self, "setValues:forProperties:", v9, v10);
  return (char)v8;
}

- (void)didChangeValueForProperties:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  objc_msgSend(v5, "_didChangeValueForProperties:inLibrary:", v4, WeakRetained);

}

- (BOOL)deleteFromLibrary
{
  void *v3;
  id WeakRetained;

  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  LOBYTE(self) = objc_msgSend(v3, "deleteFromLibrary:deletionType:persistentIDs:count:", WeakRetained, 2, &self->_persistentID, 1);

  return (char)self;
}

- (void)incrementRevision
{
  void *v3;
  id WeakRetained;

  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  objc_msgSend(v3, "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:", WeakRetained, self->_persistentID, 0, 0);

}

- (ML3MusicLibrary)library
{
  return (ML3MusicLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

uint64_t __63__ML3Entity_setValues_forProperties_async_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValues:forProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

unint64_t __36__ML3Entity_getValuesForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  unint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v7 = *(_QWORD *)(a3 + 8 * i);
      if (v7)
      {
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v7, v9);

      }
      result = objc_msgSend(*(id *)(a1 + 32), "count");
    }
  }
  return result;
}

void __30__ML3Entity_matchesPredicate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "databaseStatementParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  objc_msgSend(v5, "executeQuery:withParameters:", *(_QWORD *)(a1 + 48), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "hasAtLeastOneRow");
}

void __28__ML3Entity_existsInLibrary__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1[4];
  v5 = *(_QWORD *)(a1[5] + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v9, "hasAtLeastOneRow");
}

void __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v14) & 1) != 0)
    goto LABEL_2;
  objc_msgSend((id)objc_opt_class(), "joinClausesForProperty:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "foreignDatabaseTableForProperty:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("ML3Entity.m"), 327, CFSTR("Cannot perform insert with %@ property: no table"), v14);

    }
    objc_msgSend((id)objc_opt_class(), "foreignColumnForProperty:", v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("ML3Entity.m"), 329, CFSTR("Cannot perform insert with %@ property: no column"), v14);

      v7 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ROWID")) & 1) != 0)
    {
LABEL_2:
      v6 = 0;
      v7 = 0;
      goto LABEL_15;
    }
    objc_msgSend((id)objc_opt_class(), "databaseTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
  }
  v7 = v10;
LABEL_11:
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v12, v6);
    }
    objc_msgSend(v12, "setValue:forKey:", v5, v7);

  }
LABEL_15:

}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v3 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_3;
  v24[3] = &unk_1E5B5C558;
  v4 = *(_QWORD *)(a1 + 72);
  v27 = v2;
  v28 = v4;
  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v25 = v6;
  v26 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v2, "extraTablesToInsert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          objc_msgSend(v2, "insertValues:intoTable:persistentID:library:", 0, v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v10);
  }

  if (objc_msgSend((id)objc_opt_class(), "insertionChangesLibraryContents"))
  {
    v18[0] = v3;
    v18[1] = 3221225472;
    v18[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_4;
    v18[3] = &unk_1E5B64F90;
    v15 = *(void **)(a1 + 56);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v15, "enqueueBlockForTransactionCommit:", v18);

  }
  v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

  return v16;
}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "insertValues:intoTable:persistentID:library:", a3, a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_4(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "notifyEntitiesAddedOrRemoved");
    return objc_msgSend(*(id *)(v2 + 32), "notifyContentsDidChange");
  }
  return result;
}

+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 library:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  id v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__ML3Entity_insertValues_intoTable_persistentID_library___block_invoke;
  v16[3] = &unk_1E5B5C4E0;
  v19 = &v22;
  v20 = a1;
  v13 = v10;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  v21 = a5;
  objc_msgSend(v12, "databaseConnectionAllowingWrites:withBlock:", 1, v16);
  LOBYTE(a5) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return a5;
}

+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  __CFString *v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v38 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v12, "appendString:", CFSTR("INSERT OR REPLACE INTO "));
  objc_msgSend(v12, "appendString:", v11);
  objc_msgSend(v12, "appendString:", CFSTR(" ("));
  v39 = v11;
  objc_msgSend(a1, "persistentIDColumnForTable:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("ROWID");
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  v37 = v16;
  objc_msgSend(v12, "appendString:", v16);
  objc_msgSend(v10, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v12, "appendString:", CFSTR(", "));
        objc_msgSend(v12, "appendString:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v19);
  }
  objc_msgSend(v12, "appendString:", CFSTR(") VALUES (?"));
  if (objc_msgSend(v17, "count"))
  {
    v23 = 0;
    do
    {
      objc_msgSend(v12, "appendString:", CFSTR(", ?"));
      ++v23;
    }
    while (v23 < objc_msgSend(v17, "count"));
  }
  objc_msgSend(v12, "appendString:", CFSTR(");"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count") + 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = v17;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          v33 = v31;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        v34 = v33;

        objc_msgSend(v24, "addObject:", v34);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v28);
  }

  v35 = objc_msgSend(v38, "executeUpdate:withParameters:error:", v12, v24, 0);
  return v35;
}

+ (id)unsettableProperties
{
  return 0;
}

+ (BOOL)_shouldIncrementRevisionForType:(int)a3 persistentID:(int64_t)a4 usingConnection:(id)a5
{
  id v8;
  uint64_t v9;
  char v10;

  v8 = a5;
  v9 = objc_msgSend(a1, "revisionTrackingCode");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else if (a3 && v9 == +[ML3Track revisionTrackingCode](ML3Track, "revisionTrackingCode"))
  {
    v10 = (char)+[ML3Track trackWithPersistentID:existsInLibraryWithConnection:](ML3Track, "trackWithPersistentID:existsInLibraryWithConnection:", a4, v8);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__ML3Entity_incrementRevisionForRevisionTypeContentWithLibrary_deletionType_persistentIDs___block_invoke;
  v12[3] = &unk_1E5B5C508;
  v14 = &v17;
  v15 = a1;
  v16 = a4;
  v10 = v9;
  v13 = v10;
  objc_msgSend(v8, "performDatabaseTransactionWithBlock:", v12);
  LOBYTE(a4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return a4;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  char v30;
  id v31;
  int v32;
  void *v33;
  NSObject *v34;
  char v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  void *v39;
  char v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  char v52;
  NSObject *v53;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *contexta;
  int v63;
  char v64;
  void *v65;
  void *v66;
  unsigned int obj;
  id obja;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void *v80;
  uint8_t buf[4];
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v6 = *(_QWORD *)&a4;
  v85 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(a1, "revisionTrackingCode");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    obj = v6;
    v79 = 0u;
    v77 = 0u;
    v78 = 0u;
    v76 = 0u;
    v13 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v77 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          if (objc_msgSend(a1, "_shouldIncrementRevisionForType:persistentID:usingConnection:", 0, objc_msgSend(v19, "longLongValue"), v8))objc_msgSend(v12, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      }
      while (v16);
    }

    v9 = v13;
    v6 = obj;
  }
  v20 = objc_msgSend(v12, "count");
  if (v20)
  {
    v59 = v20;
    v57 = v9;
    v21 = -1;
    v22 = 1;
    objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", 500 * objc_msgSend(CFSTR(",(?,?,?,?)"), "length") - 1, CFSTR(",(?,?,?,?)"), 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES "), "stringByAppendingString:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obja = v12;
    v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    v58 = v12;
    if (v24)
    {
      v25 = v24;
      v55 = -1;
      v26 = 0;
      v63 = 0;
      v27 = *(_QWORD *)v73;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v73 != v27)
            objc_enumerationMutation(obja);
          v29 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          if (objc_msgSend(v29, "longLongValue", v55))
          {
            objc_msgSend(v23, "addObject:", v29);
            objc_msgSend(v23, "addObject:", v66);
            objc_msgSend(v23, "addObject:", v65);
            objc_msgSend(v23, "addObject:", &unk_1E5BAAB48);
            if (objc_msgSend(v23, "count") == 2000)
            {
              v71 = v26;
              v30 = objc_msgSend(v8, "executeUpdate:withParameters:error:", v60, v23, &v71);
              v31 = v71;

              if ((v30 & 1) == 0)
              {
                v36 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v82 = v31;
                  _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_DEFAULT, "Failed to insert batch of persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
                }

                v22 = 0;
                goto LABEL_36;
              }
              if ((v63 & 1) != 0)
                v32 = v63;
              else
                v32 = 1;
              v63 = v32;
              objc_msgSend(v23, "removeAllObjects");
              v26 = v31;
            }
          }
          else if (MSVDeviceOSIsInternalInstall())
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Entity.m"), 183, CFSTR("incrementRevisionForRevisionTypeContentWithConnection called with invalid pid"));

          }
        }
        v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        if (v25)
          continue;
        break;
      }
      v22 = 1;
      v31 = v26;
LABEL_36:
      v12 = v58;
      v37 = v63;
      v21 = v55;
    }
    else
    {
      v31 = 0;
      v37 = 0;
    }

    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(&stru_1E5B66908, "stringByPaddingToLength:withString:startingAtIndex:", v21 + ((unint64_t)objc_msgSend(v23, "count") >> 2) * objc_msgSend(CFSTR(",(?,?,?,?)"), "length"), CFSTR(",(?,?,?,?)"), 1);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES "), "stringByAppendingString:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v31;
      v40 = objc_msgSend(v8, "executeUpdate:withParameters:error:", v39, v23, &v70);
      v41 = v70;

      if ((v40 & 1) == 0)
      {
        v53 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v82 = v41;
          _os_log_impl(&dword_1AC149000, v53, OS_LOG_TYPE_DEFAULT, "Failed to insert batch of persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
        }

        goto LABEL_59;
      }
      if ((v37 & 1) == 0)
        v37 = 1;

      v31 = v41;
    }
    else if (!v22)
    {
LABEL_56:
      v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v82 = v31;
        _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEFAULT, "Failed to delete persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
      }
      v41 = v31;
LABEL_59:

      v52 = 0;
      v31 = v41;
      goto LABEL_60;
    }
    v64 = v37;
    v42 = 0;
    v43 = v59;
    do
    {
      v44 = v31;
      contexta = (void *)MEMORY[0x1AF43CC0C]();
      if (v43 - v42 >= 0x1F4)
        v45 = 500;
      else
        v45 = v43 - v42;
      +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM entity_revision WHERE revision_type > ? AND entity_pid"), v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(obja, "subarrayWithRange:", v42, v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = &unk_1E5BAAB48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "arrayByAddingObjectsFromArray:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = v44;
      v51 = objc_msgSend(v8, "executeUpdate:withParameters:error:", v47, v50, &v69);
      v31 = v69;

      v43 = v59;
      objc_autoreleasePoolPop(contexta);
      if (!v51)
        break;
      v42 += v45;
    }
    while (v42 < v59);
    if ((v51 & 1) != 0)
    {
      v52 = 1;
      v12 = v58;
      v37 = v64;
LABEL_60:

      v35 = v52 & v37;
      v9 = v57;
      goto LABEL_61;
    }
    v12 = v58;
    v37 = v64;
    goto LABEL_56;
  }
  v34 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEBUG, "No entities for which to increment revision numbers.", buf, 2u);
  }

  v35 = 0;
LABEL_61:

  return v35;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  uint64_t v7;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const int64_t *v16;
  uint64_t v17;
  void *v18;
  int v19;
  BOOL v20;
  const int64_t *v22;
  id v23;

  v22 = a5;
  v7 = *(_QWORD *)&a4;
  v23 = a3;
  if (a6)
  {
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1AF43CC0C]();
      if (a6 - v9 >= 0x1F4)
        v11 = 500;
      else
        v11 = a6 - v9;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 + v9;
      if (v11 + v9 >= a6)
        v14 = a6;
      else
        v14 = v11 + v9;
      v15 = v9 - v14;
      if (v9 < v14)
      {
        v16 = &v22[v9];
        do
        {
          v17 = *v16++;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          v20 = __CFADD__(v15++, 1);
        }
        while (!v20);
      }
      v19 = objc_msgSend(a1, "incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:", v23, v7, v12);

      objc_autoreleasePoolPop(v10);
      if (v19)
        v20 = v13 >= a6;
      else
        v20 = 1;
      v9 = v13;
    }
    while (!v20);
  }
  else
  {
    LOBYTE(v19) = 1;
  }

  return v19;
}

+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  int64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__ML3Entity_incrementRevisionWithLibrary_persistentID_deletionType_revisionType___block_invoke;
  v13[3] = &unk_1E5B62CF0;
  v15 = &v20;
  v16 = a1;
  v11 = v10;
  v14 = v11;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  objc_msgSend(v11, "databaseConnectionAllowingWrites:withBlock:", 1, v13);
  LOBYTE(a6) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6 usingConnection:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[5];

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v30[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  if (!(_DWORD)v9 || !(_DWORD)v8)
  {
    if (a4)
      goto LABEL_4;
LABEL_11:
    if (MSVDeviceOSIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Entity.m"), 278, CFSTR("incrementRevisionWithLibrary called with invalid pid"));

    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Entity.m"), 275, CFSTR("Wrong revision type for deletion type: %d, %d"), v8, v9);

  if (!a4)
    goto LABEL_11;
LABEL_4:
  v15 = objc_msgSend(a1, "revisionTrackingCode");
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    LOBYTE(v16) = 1;
    goto LABEL_14;
  }
  v17 = v15;
  if (!objc_msgSend(a1, "_shouldIncrementRevisionForType:persistentID:usingConnection:", v8, a4, v14))
  {
LABEL_13:
    LOBYTE(v16) = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "executeUpdate:withParameters:error:", CFSTR("REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES (?, ?, ?, ?)"), v22, 0);

  if (!(_DWORD)v8 && v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM entity_revision WHERE entity_pid=? AND revision_type > ?"), v25, 0);

    goto LABEL_5;
  }
LABEL_14:

  return v16;
}

+ (BOOL)insertionChangesLibraryContents
{
  return 1;
}

+ (void)enumeratePersistentIDsInLibrary:(id)a3 matchingPredicate:(id)a4 orderingTerms:(id)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 options:(int64_t)a8 usingBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  unint64_t v48;
  const int64_t *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  unint64_t v60;
  const int64_t *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
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
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = v18;
  if (a7)
  {
    v48 = a7;
    v49 = a6;
    v51 = v18;
    objc_msgSend(a1, "databaseTable");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v21, "appendString:", CFSTR("SELECT "));
    objc_msgSend(v21, "appendString:", v20);
    objc_msgSend(v21, "appendString:", CFSTR(".ROWID FROM "));
    v50 = (void *)v20;
    objc_msgSend(v21, "appendString:", v20);
    v55 = a1;
    v53 = v15;
    objc_msgSend(a1, "predicateIncludingSystemwidePredicatesWithPredicate:library:options:", v16, v15, a8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v52 = v17;
    v23 = v17;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    obj = v23;
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v74 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          objc_msgSend(v28, "property");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "joinClausesForProperty:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v70;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v70 != v33)
                  objc_enumerationMutation(v30);
                objc_msgSend(v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j));
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
            }
            while (v32);
          }

        }
        v23 = obj;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      }
      while (v25);
    }

    objc_msgSend(v47, "SQLJoinClausesForClass:", v55);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
      objc_msgSend(v22, "unionOrderedSet:", v35);
    v46 = v35;
    v67 = 0u;
    v68 = 0u;
    v66 = 0u;
    v65 = 0u;
    v36 = v22;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v66 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
          objc_msgSend(v21, "appendString:", CFSTR(" "));
          objc_msgSend(v21, "appendString:", v41);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      }
      while (v38);
    }

    objc_msgSend(v21, "appendString:", CFSTR(" WHERE "));
    if (v47)
    {
      objc_msgSend(v47, "appendSQLToMutableString:entityClass:", v21, v55);
      objc_msgSend(v21, "appendString:", CFSTR(" AND "));
    }
    objc_msgSend(v21, "appendString:", v50);
    objc_msgSend(v21, "appendString:", CFSTR(".ROWID IN (?"));
    v15 = v53;
    if (v48 >= 2)
    {
      v42 = v48 - 1;
      do
      {
        objc_msgSend(v21, "appendString:", CFSTR(",?"));
        --v42;
      }
      while (v42);
    }
    objc_msgSend(v21, "appendString:", CFSTR(")"));
    v43 = objc_msgSend(obj, "count");
    v44 = MEMORY[0x1E0C809B0];
    if (v43)
    {
      objc_msgSend(v21, "appendString:", CFSTR("ORDER BY "));
      v62[0] = v44;
      v62[1] = 3221225472;
      v62[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke;
      v62[3] = &unk_1E5B5C5A8;
      v63 = v21;
      v64 = v55;
      objc_msgSend(obj, "enumerateObjectsUsingBlock:", v62);

    }
    v56[0] = v44;
    v56[1] = 3221225472;
    v56[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_2;
    v56[3] = &unk_1E5B5C5D0;
    v16 = v47;
    v60 = v48;
    v61 = v49;
    v57 = v16;
    v58 = v21;
    v19 = v51;
    v59 = v51;
    v45 = v21;
    objc_msgSend(v53, "databaseConnectionAllowingWrites:withBlock:", 0, v56);

    v17 = v52;
  }

}

+ (id)subselectPropertyForProperty:(id)a3
{
  return 0;
}

+ (id)newSelectAllEntitiesSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const void **v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  const void **v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a1, "databaseTable");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "SQLForEntityClass:", a1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_1E5B66908;
  v12 = v11;

  v38 = v12;
  v13 = -[__CFString length](v12, "length");
  v14 = CFSTR(" WHERE ");
  if (!v13)
    v14 = &stru_1E5B66908;
  v37 = v14;
  v40 = v8;
  v41 = a1;
  objc_msgSend(v8, "SQLJoinClausesForClass:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "mutableCopy");

  if (a4)
  {
    v17 = 0;
    do
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v18 = a3;
      objc_msgSend(v41, "joinClausesForProperty:", a3[v17]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (!v16)
              v16 = objc_alloc_init(MEMORY[0x1E0C99E10]);
            objc_msgSend(v16, "addObject:", v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v21);
      }

      ++v17;
      a3 = v18;
    }
    while (v17 != a4);
  }
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "objectEnumerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(" "));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = &stru_1E5B66908;
  }
  objc_msgSend(v41, "disambiguatedSelectSQLForProperty:", *a3);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (a4 < 2)
  {
    v30 = (void *)v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a4 - 1;
    v32 = a3 + 1;
    do
    {
      objc_msgSend(v30, "appendString:", CFSTR(","));
      v33 = (uint64_t)*v32++;
      objc_msgSend(v41, "disambiguatedSelectSQLForProperty:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appendString:", v34);

      --v31;
    }
    while (v31);

  }
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ %@%@%@"), v30, v39, v27, v37, v38);

  return v35;
}

+ (id)entityURLScheme
{
  return CFSTR("x-media-library");
}

+ (id)entityFromURL:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityURLScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v27 = a4;
    v28 = v6;
    objc_msgSend(v7, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    +[ML3MusicLibrary allLibraries](ML3MusicLibrary, "allLibraries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v17, "libraryUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v11, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {
            objc_msgSend(a1, "_entityForURLComponents:inLibrary:verifyExistence:reason:", v7, v17, 1, v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No library with UID: %@"), v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v27)
      *v27 = objc_retainAutorelease(v20);

    v22 = 0;
LABEL_17:
    v6 = v28;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "scheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Invalid URL scheme: %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v25);

    v22 = 0;
  }

  return v22;
}

+ (id)entityFromURL:(id)a3 inLibrary:(id)a4
{
  return (id)objc_msgSend(a1, "entityFromURL:inLibrary:verifyExistence:", a3, a4, 1);
}

+ (id)entityFromURL:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3998];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithURL:resolvingAgainstBaseURL:", v10, 0);

  objc_msgSend(a1, "_entityForURLComponents:inLibrary:verifyExistence:reason:", v11, v9, v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_entityForURLComponents:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5 reason:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityURLScheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v10, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v10, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pathComponents");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v19, "count") > 2)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "integerValue");

        objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "longLongValue");

        v29 = (objc_class *)MLEntityClassForType(v26);
        if (v29)
        {
          if (v28)
          {
            v30 = v29;
            v31 = (void *)objc_msgSend([v29 alloc], "initWithPersistentID:inLibrary:", v28, v11);
            v32 = v31;
            if (!v7 || (objc_msgSend(v31, "existsInLibrary") & 1) != 0)
            {
              v32 = v32;
              v24 = v32;
LABEL_23:

              goto LABEL_24;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No %@ entity exists with persistentID: %lld"), v30, v28);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (a6)
              *a6 = objc_retainAutorelease(v34);

LABEL_22:
            v24 = 0;
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid entity persistentID: %lld"), 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid entity type: %ld"), v26);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Insufficient path components [requires three]: %@"), v19);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v33;
      if (a6)
      {
        v32 = objc_retainAutorelease(v33);
        v24 = 0;
        *a6 = v32;
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Library UID mismatch: %@ != %@"), v21, v23);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Invalid URL scheme: %@"), v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a6)
  {
    v19 = objc_retainAutorelease(v19);
    v24 = 0;
    *a6 = v19;
  }
  else
  {
    v24 = 0;
  }
LABEL_24:

  return v24;
}

+ (id)URLForEntityWithPersistentID:(int64_t)a3 libraryUID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "entityURLScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScheme:", v9);

  objc_msgSend(v8, "setHost:", v7);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v17[0] = CFSTR("/");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(a1, "revisionTrackingCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathWithComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPath:", v14);

  objc_msgSend(v8, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateByOptimizingPredicate:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "predicateByOptimizingComparisonPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  return v4;
}

+ (id)predicateByOptimizingComparisonPredicate:(id)a3
{
  return a3;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:inLibrary:cachedNameOrders:usingConnection:", v7, v6, 0, 0);

  return v8;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:inLibrary:cachedNameOrders:usingConnection:", v10, v9, v8, 0);

  return v11;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:inLibrary:cachedNameOrders:usingConnection:", v13, v12, v11, v10);

  return v14;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignColumnForProperty:(id)a3
{
  return 0;
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = 138543618;
    v12 = (id)objc_msgSend(v6, "entityClass");
    v13 = 2114;
    v14 = v7;
    v9 = v12;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Invalid count query for entity class %{public}@, count property %{public}@", (uint8_t *)&v11, 0x16u);

  }
  return 0;
}

+ (BOOL)setValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  dispatch_semaphore_t v27;
  void *v28;
  NSObject *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  __int128 *p_buf;
  id v38;
  const __CFString *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[4];
  __int128 buf;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 1;
  if (v12 && v13 && v15 && objc_msgSend(v14, "count"))
  {
    if (objc_msgSend(v15, "isHomeSharingLibrary"))
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Ignoring write to read-only Home Sharing database. Properties: %{public}@", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v44 = 0x2020000000;
      v45 = 0;
      v42[0] = v14;
      v41[0] = CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey");
      v41[1] = CFSTR("MLDatabaseOperationAttributeEntityClassKey");
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v21;
      v42[2] = v12;
      v41[2] = CFSTR("MLDatabaseOperationAttributeValuesKey");
      v41[3] = CFSTR("MLDatabaseOperationAttributePropertiesKey");
      v42[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "currentTransactionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0C99E08];
      v39 = CFSTR("MLDatabaseOperationOptionDatabasePathKey");
      objc_msgSend(v15, "databasePath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dictionaryWithDictionary:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        objc_msgSend(v26, "setObject:forKey:", v22, CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));
      v27 = dispatch_semaphore_create(0);
      +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke;
      v32[3] = &unk_1E5B5C648;
      p_buf = &buf;
      v33 = v16;
      v38 = a1;
      v34 = v13;
      v35 = v15;
      v29 = v27;
      v36 = v29;
      objc_msgSend(v28, "performDatabaseOperation:withAttributes:options:completionHandler:", 1, v31, v26, v32);
      dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      v17 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
    }
  }

  return v17;
}

+ (BOOL)setDifferentValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  uint64_t *v43;
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[6];
  const __CFString *v50;
  void *v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _BYTE buf[24];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 1;
  if (v12 && v13 && v15 && objc_msgSend(v14, "count"))
  {
    if (objc_msgSend(v15, "isHomeSharingLibrary"))
    {
      v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_ERROR, "Ignoring write to read-only Home Sharing database. Properties: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v20 = objc_msgSend(v12, "count");
      if (v20 == objc_msgSend(v14, "count"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v55) = 1;
        v21 = objc_msgSend(v13, "count");
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke;
        v49[3] = &unk_1E5B5C670;
        v49[4] = buf;
        v49[5] = v21;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v49);
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v45 = 0;
          v46 = &v45;
          v47 = 0x2020000000;
          v48 = 0;
          v53[0] = v14;
          v52[0] = CFSTR("MLDatabaseOperationAttributePersistentIDsArrayKey");
          v52[1] = CFSTR("MLDatabaseOperationAttributeEntityClassKey");
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v53[1] = v23;
          v53[2] = v12;
          v52[2] = CFSTR("MLDatabaseOperationAttributeValuesKey");
          v52[3] = CFSTR("MLDatabaseOperationAttributePropertiesKey");
          v52[4] = CFSTR("MLDatabaseOperationAttributeApplyDifferentValuesToPIDs");
          v53[3] = v13;
          v53[4] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 5);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "currentTransactionID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0C99E08];
          v50 = CFSTR("MLDatabaseOperationOptionDatabasePathKey");
          objc_msgSend(v15, "databasePath");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dictionaryWithDictionary:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
            objc_msgSend(v27, "setObject:forKey:", v37, CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));
          v28 = dispatch_semaphore_create(0);
          +[MLMediaLibraryService sharedMediaLibraryService](MLMediaLibraryService, "sharedMediaLibraryService");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2;
          v38[3] = &unk_1E5B5C648;
          v43 = &v45;
          v39 = v16;
          v44 = a1;
          v40 = v13;
          v41 = v15;
          v30 = v28;
          v42 = v30;
          objc_msgSend(v29, "performDatabaseOperation:withAttributes:options:completionHandler:", 1, v36, v27, v38);
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
          v17 = *((_BYTE *)v46 + 24) != 0;

          _Block_object_dispose(&v45, 8);
        }
        else
        {
          v17 = 0;
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v31 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = objc_msgSend(v12, "count");
          *(_WORD *)&buf[22] = 2048;
          v55 = objc_msgSend(v14, "count");
          _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_ERROR, "Ignoring not setting properties=%{public}@ as the input is not valid (values.count=%lu, persistentIDs.count=%lu)", buf, 0x20u);
        }

        v32 = objc_msgSend(v12, "count");
        if (v32 == objc_msgSend(v14, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[ML3Entity setDifferentValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:]");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("ML3Entity.m"), 1035, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values.count != persistentIDs.count"));

        }
        v17 = 0;
      }
    }
  }

  return v17;
}

+ (void)_didChangeValueForProperties:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  int v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v18 = v6;
    v10 = *(_QWORD *)v20;
    v11 = 3;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ROWID")) & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "unsettableProperties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if ((v15 & 1) == 0)
          {
            if (objc_msgSend((id)objc_opt_class(), "libraryContentsChangeForProperty:", v13))
            {
              v6 = v18;
              objc_msgSend(v18, "notifyContentsDidChange");
              if (objc_msgSend((id)objc_opt_class(), "assistantLibraryContentsChangeForProperty:", v13))
                objc_msgSend(v18, "notifyAssistantContentsDidChange");
              goto LABEL_22;
            }
            v16 = objc_msgSend((id)objc_opt_class(), "libraryDynamicChangeForProperty:", v13);
            if (v11 >= 2)
              v17 = 2;
            else
              v17 = v11;
            if (v16)
              v11 = 1;
            else
              v11 = v17;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }

    if (v11 == 2)
    {
      v6 = v18;
      objc_msgSend(v18, "notifyInvisiblePropertyDidChange");
    }
    else
    {
      v6 = v18;
      if (v11 == 1)
        objc_msgSend(v18, "notifyNonContentsPropertyDidChange");
    }
  }
  else
  {
LABEL_22:

  }
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  return 1;
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return 1;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return 1;
}

+ (BOOL)_deleteRowForPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 library:(id)a5 table:(id)a6 usingColumn:(id)a7 usingConnection:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const int64_t *v25;
  uint64_t v26;
  void *v27;
  int v28;
  BOOL v29;
  id v31;
  id v32;
  id v34;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v34 = a8;
  if (a4)
  {
    v32 = v12;
    v31 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    do
    {
      v17 = (void *)MEMORY[0x1AF43CC0C]();
      if (a4 - v16 >= 0x1F4)
        v18 = 500;
      else
        v18 = a4 - v16;
      +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "statementWithPrefix:inParameterCount:", v15, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v18 + v16;
      if (v18 + v16 >= a4)
        v23 = a4;
      else
        v23 = v18 + v16;
      v24 = v16 - v23;
      if (v16 < v23)
      {
        v25 = &a3[v16];
        do
        {
          v26 = *v25++;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

          v29 = __CFADD__(v24++, 1);
        }
        while (!v29);
      }
      v28 = objc_msgSend(v34, "executeUpdate:withParameters:error:", v20, v21, 0);

      objc_autoreleasePoolPop(v17);
      if (v28)
        v29 = v22 >= a4;
      else
        v29 = 1;
      v16 = v22;
    }
    while (!v29);

    v12 = v32;
    v14 = v31;
  }
  else
  {
    LOBYTE(v28) = 1;
  }

  return v28;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  const int64_t *v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__ML3Entity_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
  v13[3] = &unk_1E5B5C698;
  v15 = &v20;
  v16 = a1;
  v11 = v10;
  v19 = a4;
  v14 = v11;
  v17 = a5;
  v18 = a6;
  objc_msgSend(v11, "databaseConnectionAllowingWrites:withBlock:", 1, v13);
  LOBYTE(a6) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  return objc_msgSend(a1, "deleteFromLibrary:deletionType:canonicalizeCollections:persistentIDs:count:usingConnection:", a3, *(_QWORD *)&a4, 1, a5, a6, a7);
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8
{
  id v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  unint64_t v23;
  id v24;
  const int64_t *v25;
  SEL v26;
  int v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v15 = a3;
  v16 = a8;
  if (a7)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke;
    v19[3] = &unk_1E5B5C6C0;
    v23 = a7;
    v24 = a1;
    v25 = a6;
    v20 = v15;
    v26 = a2;
    v28 = a5;
    v21 = v16;
    v22 = &v29;
    v27 = a4;
    objc_msgSend(v21, "performTransactionWithBlock:", v19);
    v17 = *((_BYTE *)v30 + 24) != 0;

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  return 0;
}

+ (id)extraTablesToDelete
{
  return 0;
}

+ (id)extraTablesToInsert
{
  return 0;
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return 0;
}

+ (id)collectionClassesToUpdateBeforeDelete
{
  return 0;
}

+ (id)allProperties
{
  return 0;
}

+ (id)indexableSQLForProperties:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "joinClausesForProperty:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Entity.m"), 1348, CFSTR("Properties requiring a join cannot be indexed"));

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)orderingSQLForProperties:(id)a3 directionality:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(a1, "disambiguatedSQLForProperty:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("ASC");
        if (objc_msgSend(v6, "count") > (unint64_t)(v9 + i))
        {
          objc_msgSend(v6, "objectAtIndex:", (v9 + i));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        -[__CFString uppercaseString](v13, "uppercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("DESC"));

        if (v15)
        {
          objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %@"), CFSTR("DESC"));
          v16 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v16;
        }
        objc_msgSend(v21, "addObject:", v12);

      }
      v9 += i;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (int64_t)revisionTrackingCode
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)enumeratePersistentIDsInLibrary:(id)a3 afterRevision:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  if (v7)
  {
    v8 = a3;
    v9 = objc_msgSend((id)objc_opt_class(), "revisionTrackingCode");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ML3Entity_enumeratePersistentIDsInLibrary_afterRevision_usingBlock___block_invoke;
    v10[3] = &unk_1E5B5C6E8;
    v11 = v7;
    objc_msgSend(v8, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:usingBlock:", a4, v9, 3, v10);

  }
}

uint64_t __70__ML3Entity_enumeratePersistentIDsInLibrary_afterRevision_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  NSObject *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v60;
  id obj;
  id obja;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  _BYTE v77[18];
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "databaseTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)v77 = v3;
    *(_WORD *)&v77[8] = 2114;
    *(_QWORD *)&v77[10] = v4;
    _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "deleting %lu rows from %{public}@ table", buf, 0x16u);

  }
  v6 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "databaseTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "_deleteRowForPersistentIDs:count:library:table:usingColumn:usingConnection:", v5, v7, v8, v9, CFSTR("ROWID"), *(_QWORD *)(a1 + 40));

  if (!(_DWORD)v5)
    return 0;
  v73 = 0u;
  v74 = 0u;
  v72 = 0u;
  v71 = 0u;
  objc_msgSend(*(id *)(a1 + 64), "extraTablesToDelete");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v72;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v72 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 64), "persistentIDColumnForTable:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), CFSTR("ML3Entity.m"), 1207, CFSTR("no pid column for %@ %@"), objc_opt_class(), v14);

        }
        v16 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v77 = v17;
          *(_WORD *)&v77[8] = 2114;
          *(_QWORD *)&v77[10] = v14;
          v78 = 2114;
          v79 = v15;
          _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "deleting %lu rows from %{public}@ table using column=%{public}@", buf, 0x20u);
        }

        if ((objc_msgSend(*(id *)(a1 + 64), "_deleteRowForPersistentIDs:count:library:table:usingColumn:usingConnection:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v14, v15, *(_QWORD *)(a1 + 40)) & 1) == 0)
        {
          v56 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            v57 = *(_QWORD *)(a1 + 64);
            objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(".%@"), v15);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)v77 = v57;
            *(_WORD *)&v77[8] = 2114;
            *(_QWORD *)&v77[10] = v58;
            _os_log_impl(&dword_1AC149000, v56, OS_LOG_TYPE_ERROR, "Could not delete %{public}@ %{public}@", buf, 0x16u);

          }
          goto LABEL_57;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v11)
        continue;
      break;
    }
  }

  v18 = objc_opt_class();
  if (v18 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 56))
    {
      v20 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v20));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v21);

        ++v20;
      }
      while (v20 < *(_QWORD *)(a1 + 56));
    }
    v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v77 = v23;
      _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_DEFAULT, "deleting %lu items from item store, stats table", buf, 0xCu);
    }

    v24 = *(_QWORD *)(a1 + 56);
    if (v24)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0x1E5B4A000uLL;
      obja = v19;
      do
      {
        v28 = v24 - v26;
        if (v28 >= 0x1F4)
          v29 = 500;
        else
          v29 = v28;
        objc_msgSend(v19, "subarrayWithRange:", v26, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v27 + 3008), "defaultRenderer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM item_stats WHERE item_pid IN(SELECT item_pid FROM item_store WHERE sync_id = 0 AND item_pid"), v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "stringByAppendingString:", CFSTR(")"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = *(void **)(a1 + 40);
        v70 = v25;
        v35 = objc_msgSend(v34, "executeUpdate:withParameters:error:", v33, v30, &v70);
        v36 = v70;

        if ((v35 & 1) == 0)
        {
          v37 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v77 = v36;
            _os_log_impl(&dword_1AC149000, v37, OS_LOG_TYPE_DEFAULT, "Failed to clean up item_stats where sync_id = 0 with error: %{public}@", buf, 0xCu);
          }

        }
        v38 = v27;
        objc_msgSend(*(id *)(v27 + 3008), "defaultRenderer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM item_store WHERE sync_id = 0 AND item_pid"), v29);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = *(void **)(a1 + 40);
        v69 = v36;
        v42 = objc_msgSend(v41, "executeUpdate:withParameters:error:", v40, v30, &v69);
        v25 = v69;

        if ((v42 & 1) == 0)
        {
          v43 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v77 = v25;
            _os_log_impl(&dword_1AC149000, v43, OS_LOG_TYPE_DEFAULT, "Failed to clean up item_store where sync_id = 0 with error: %{public}@", buf, 0xCu);
          }

        }
        v26 += v29;

        v24 = *(_QWORD *)(a1 + 56);
        v27 = v38;
        v19 = obja;
      }
      while (v26 < v24);

    }
  }
  if (!*(_BYTE *)(a1 + 92))
    goto LABEL_50;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(*(id *)(a1 + 64), "collectionClassesToUpdateBeforeDelete");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v44)
  {
LABEL_49:

LABEL_50:
    objc_msgSend(*(id *)(a1 + 64), "incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:count:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
    v50 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = *(_DWORD *)(a1 + 88);
      v52 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v77 = v51;
      *(_WORD *)&v77[4] = 2048;
      *(_QWORD *)&v77[6] = v52;
      _os_log_impl(&dword_1AC149000, v50, OS_LOG_TYPE_DEFAULT, "finished incrementing revsion with deletionType=%d for %lu persistentIDs", buf, 0x12u);
    }

    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_158;
    v63[3] = &unk_1E5B64F90;
    v53 = *(void **)(a1 + 40);
    v64 = *(id *)(a1 + 32);
    objc_msgSend(v53, "enqueueBlockForTransactionCommit:", v63);
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v55 = 1;
    *(_BYTE *)(v54 + 24) = 1;

    return v55;
  }
  v45 = v44;
  v46 = *(_QWORD *)v66;
LABEL_41:
  v47 = 0;
  while (1)
  {
    if (*(_QWORD *)v66 != v46)
      objc_enumerationMutation(obj);
    v48 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v47);
    v49 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v77 = v48;
      _os_log_impl(&dword_1AC149000, v49, OS_LOG_TYPE_DEFAULT, "canonicalize collection=%{public}@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v48, "canonicalizeCollectionRepresentativeItemsInLibrary:usingConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      break;
    if (v45 == ++v47)
    {
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      if (v45)
        goto LABEL_41;
      goto LABEL_49;
    }
  }
LABEL_57:
  v55 = 0;

  return v55;
}

uint64_t __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_158(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "notifyEntitiesAddedOrRemoved");
  return objc_msgSend(*(id *)(a1 + 32), "notifyContentsDidChange");
}

uint64_t __64__ML3Entity_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "deleteFromLibrary:deletionType:persistentIDs:count:usingConnection:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "count") != *(_QWORD *)(a1 + 40))
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "Not enough values to update all properties in %{public}@", buf, 0xCu);
    }

    if (a4)
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      if (objc_msgSend(v6, "count") == *(_QWORD *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[ML3Entity setDifferentValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("ML3Entity.m"), 1048, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("obj.count != propsCount"));

      }
    }
  }

}

void __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_3;
    v9[3] = &unk_1E5B5C620;
    v12 = *(_QWORD *)(a1 + 72);
    v7 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "enqueueBlockForTransactionCommit:", v9);

    v8 = v10;
  }
  else
  {
    if (!v5)
      goto LABEL_4;
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Daemon reported set values for properties was unsuccessful. %{public}@", buf, 0xCu);
    }
  }

LABEL_4:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_didChangeValueForProperties:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2;
    v9[3] = &unk_1E5B5C620;
    v12 = *(_QWORD *)(a1 + 72);
    v7 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v7, "enqueueBlockForTransactionCommit:", v9);

    v8 = v10;
  }
  else
  {
    if (!v5)
      goto LABEL_4;
    v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "Daemon reported set values for properties was unsuccessful. %{public}@", buf, 0xCu);
    }
  }

LABEL_4:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_didChangeValueForProperties:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(v5, "appendSQLToMutableString:entityClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "databaseStatementParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (*(_QWORD *)(a1 + 56))
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      v5 = v6;
    }
    while (*(_QWORD *)(a1 + 56) > (unint64_t)v6++);
  }
  objc_msgSend(v10, "executeQuery:withParameters:", *(_QWORD *)(a1 + 40), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_3;
  v11[3] = &unk_1E5B5F810;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v11);

}

uint64_t __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "int64ForColumnIndex:", 0), &v6);
  *a4 = v6;
  return result;
}

void __81__ML3Entity_incrementRevisionWithLibrary_persistentID_deletionType_revisionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), v3);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
}

uint64_t __91__ML3Entity_incrementRevisionForRevisionTypeContentWithLibrary_deletionType_persistentIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "incrementRevisionForRevisionTypeContentWithConnection:deletionType:persistentIDs:", a2, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __57__ML3Entity_insertValues_intoTable_persistentID_library___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  char v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "insertValues:intoTable:persistentID:connection:", a1[4], a1[5], a1[8], v3);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
}

+ (id)anyInLibrary:(id)a3 predicate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "anyInLibrary:predicate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  objc_msgSend(a1, "queryWithLibrary:predicate:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 usingSections:(BOOL)a6
{
  objc_msgSend(a1, "queryWithLibrary:predicate:usingSections:", a3, a4, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6 usingSections:(BOOL)a7
{
  objc_msgSend(a1, "queryWithLibrary:predicate:usingSections:", a3, a4, a7, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "defaultOrderingTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithLibrary:predicate:orderingTerms:usingSections:options:", v8, v9, v10, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 usingSections:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  ML3Query *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "defaultOrderingTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v8, a1, v9, v10, v5, 0, 0, 0);

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ML3Query *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v10, a1, v11, v12, 0, 0, v13, 0);

  return v14;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6 options:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ML3Query *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v12, a1, v13, v14, 0, 0, v15, a7);

  return v16;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6 options:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  ML3Query *v15;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v12, a1, v13, v14, v8, 0, 0, a7);

  return v15;
}

+ (id)unrestrictedQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  ML3Query *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v8, a1, v9, v10, 0, 0, 0, 3);

  return v11;
}

+ (id)unrestrictedAllItemsQueryWithlibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  ML3Query *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:]([ML3Query alloc], "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v8, a1, v9, v10, 0, 0, 0, 7);

  return v11;
}

@end
