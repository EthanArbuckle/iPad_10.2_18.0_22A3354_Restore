@implementation EFSQLQueryGenerator

+ (id)_createStatementForPredicate:(id)a3 propertyMapper:(id)a4 tablesUsed:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  EFSQLColumnExpression *v48;
  void *v49;
  void *v50;
  EFSQLColumnExpression *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v59;
  void *v60;
  id v61;
  id obj;
  id obja;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  EFSQLSelectStatement *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v69 = a4;
  v61 = a5;
  v59 = v7;
  if ((objc_msgSend(v7, "ef_matchesEverything") & 1) != 0)
  {
    v60 = 0;
  }
  else if ((objc_msgSend(v7, "ef_matchesNothing") & 1) != 0)
  {
    v60 = (void *)MEMORY[0x1E0C9AAA0];
  }
  else
  {
    objc_msgSend(v7, "predicateNodeFromPropertyMapper:addingTablesUsed:", v69, v61);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sqlExpressable");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v69, "mainTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = objc_claimAutoreleasedReturnValue();

  v64 = (void *)v10;
  objc_msgSend(v61, "removeObject:", v10);
  v70 = (void *)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v61, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v67)
  {
    v65 = *(_QWORD *)v76;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v76 != v65)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v11);
        if ((objc_msgSend(v70, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v69, "tableRelationships");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            i = (void *)v14;
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLQueryGenerator.m"), 155, CFSTR("Query references table %@ without a table relationship"), v12);
          for (i = 0; ; i = v29)
          {

LABEL_15:
            objc_msgSend(i, "sourceColumn");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "table");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v64);

            if ((v20 & 1) != 0)
              break;
            _ef_log_EFSQLQueryGenerator();
            v21 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(i, "ef_publicDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v81 = v22;
              _os_log_impl(&dword_1B106E000, v21, OS_LOG_TYPE_INFO, "Current tableRelationship %{public}@", buf, 0xCu);

            }
            if (!i)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLQueryGenerator.m"), 159, CFSTR("No existing table relationship exists to the main table"), v12);

            }
            objc_msgSend(i, "sourceColumn");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "table");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v70, "containsObject:", v16))
            {

              break;
            }
            objc_msgSend(v70, "addObject:", v16);
            objc_msgSend(v69, "tableRelationships");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(i, "sourceColumn");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "table");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            _ef_log_EFSQLQueryGenerator();
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v29, "ef_publicDescription");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "tableRelationships");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v81 = v31;
              v82 = 2112;
              v83 = v32;
              _os_log_impl(&dword_1B106E000, v30, OS_LOG_TYPE_INFO, "Iterating into tableRelationship: %{public}@ tableRelationships: %@", buf, 0x16u);

            }
            if (!v29)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFSQLQueryGenerator.m"), 170, CFSTR("Query references table %@ without a table relationship"), v12);

            }
          }
          objc_msgSend(v70, "addObject:", v12);

        }
        v11 = (char *)v11 + 1;
      }
      while (v67 != v11);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      v67 = (id)v35;
    }
    while (v35);
  }

  v68 = -[EFSQLSelectStatement initWithTable:]([EFSQLSelectStatement alloc], "initWithTable:", v64);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obja = v70;
  v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v36)
  {
    v66 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v72 != v66)
          objc_enumerationMutation(obja);
        v38 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
        objc_msgSend(v69, "tableRelationships");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "sourceColumn");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "columnExpressionWithFullName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "tableAlias");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          v45 = v43;
        }
        else
        {
          objc_msgSend(v40, "destinationColumn");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "table");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "name");
          v45 = (id)objc_claimAutoreleasedReturnValue();

        }
        v48 = [EFSQLColumnExpression alloc];
        objc_msgSend(v40, "destinationColumn");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "name");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = -[EFSQLColumnExpression initWithName:table:](v48, "initWithName:table:", v50, v45);

        objc_msgSend(v42, "equalTo:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "useLeftOuterJoin"))
        {
          objc_msgSend(v40, "tableAlias");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = -[EFSQLSelectStatement leftOuterJoin:alias:on:](v68, "leftOuterJoin:alias:on:", v38, v53, v52);
        }
        else
        {
          objc_msgSend(v40, "tableAlias");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[EFSQLSelectStatement join:alias:on:](v68, "join:alias:on:", v38, v53, v52);
        }

      }
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v36);
  }

  -[EFSQLSelectStatement setWhere:](v68, "setWhere:", v60);
  return v68;
}

+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5
{
  objc_msgSend(a1, "countStatementForPredicate:propertyMapper:distinctBy:groupBy:groupByTable:", a3, a4, a5, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(int64_t)a6 propertyMapper:(id)a7 protectedDataAvailable:(BOOL)a8
{
  _BOOL4 v8;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  NSObject *v66;
  void *v67;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id obj;
  id obja;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  id v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  id v112;
  uint64_t v113;

  v8 = a8;
  v113 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v72 = a4;
  v71 = a5;
  v80 = a7;
  _ef_log_EFSQLQueryGenerator();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v112 = obj;
    _os_log_impl(&dword_1B106E000, v14, OS_LOG_TYPE_INFO, "selectStatementForReturnObjectKeypaths called for %@", buf, 0xCu);
  }

  v15 = a1;
  v79 = (void *)objc_opt_new();
  v70 = objc_msgSend(obj, "count");
  if (!v70)
  {
    objc_msgSend(v80, "mainTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "keyPathMappers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    if (v8)
    {
      v19 = objc_claimAutoreleasedReturnValue();

      obj = (id)v19;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke;
      v103[3] = &unk_1E62A73E0;
      v104 = v80;
      v105 = v17;
      objc_msgSend(v20, "ef_filter:", v103);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = v104;
      obj = (id)v21;
    }

  }
  v78 = (void *)objc_opt_new();
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obja = obj;
  v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v100 != v23)
          objc_enumerationMutation(obja);
        v25 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
        objc_msgSend(v80, "keyPathMappers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("EFSQLQueryGenerator.m"), 56, CFSTR("Asked to select keyPath %@ without mapper"), v25);

        }
        objc_msgSend(v27, "selectResultExpression");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v78, "ef_addObjectIfAbsent:", v27);
          objc_msgSend(v27, "tableName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v29);

        }
      }
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    }
    while (v22);
  }

  v77 = (void *)objc_opt_new();
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v74 = v71;
  v31 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v96;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v96 != v32)
          objc_enumerationMutation(v74);
        v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * j);
        objc_msgSend(v80, "keyPathMappers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "key");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v34, "ascending"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v77, "ef_addObjectIfAbsentAccordingToEquals:", v39);
          objc_msgSend(v37, "tableName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v40);

        }
      }
      v31 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    }
    while (v31);
  }

  objc_msgSend(v15, "_createStatementForPredicate:propertyMapper:tablesUsed:", v72, v80, v79);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v73 = v77;
  v42 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v92;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v92 != v43)
          objc_enumerationMutation(v73);
        v45 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
        objc_msgSend(v45, "first");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "selectResultAlias");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          objc_msgSend(v46, "selectResultAlias");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[EFSQLColumnExpression column:](EFSQLColumnExpression, "column:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v46, "selectResultExpression");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v45, "second");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "orderBy:ascending:", v49, objc_msgSend(v50, "BOOLValue"));

      }
      v42 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
    }
    while (v42);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v51 = v78;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v88;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v88 != v53)
          objc_enumerationMutation(v51);
        v55 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * m);
        objc_msgSend(v55, "selectResultExpression");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          objc_msgSend(v55, "selectResultExpression");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "selectResultAlias");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addResult:alias:", v57, v58);

        }
      }
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
    }
    while (v52);
  }

  if (!v70)
  {
    objc_msgSend(v80, "mainTable");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "name");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(v80, "additionalColumns");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v84;
      do
      {
        for (n = 0; n != v62; ++n)
        {
          if (*(_QWORD *)v84 != v63)
            objc_enumerationMutation(v61);
          objc_msgSend(v41, "addResultColumn:fromTable:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * n), v60);
        }
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
      }
      while (v62);
    }

    objc_msgSend(v80, "additionalSelectExpressions");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke_2;
    v81[3] = &unk_1E62A7408;
    v82 = v41;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v81);

  }
  if (a6 >= 1)
    objc_msgSend(v41, "setLimit:");
  _ef_log_EFSQLQueryGenerator();
  v66 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v41, "queryString");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v112 = v67;
    _os_log_impl(&dword_1B106E000, v66, OS_LOG_TYPE_INFO, "selectStatementForReturnObjectKeypaths returning: %@", buf, 0xCu);

  }
  return v41;
}

void ___ef_log_EFSQLQueryGenerator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EFSQLQueryGenerator");
  v1 = (void *)_ef_log_EFSQLQueryGenerator_log;
  _ef_log_EFSQLQueryGenerator_log = (uint64_t)v0;

}

+ (id)selectStatementForReturnObjectKeypaths:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 propertyMapper:(id)a6 protectedDataAvailable:(BOOL)a7
{
  objc_msgSend(a1, "selectStatementForReturnObjectKeypaths:predicate:sortDescriptors:limit:propertyMapper:protectedDataAvailable:", a3, a4, a5, 0, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyPathMappers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableRelationships");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isProtectedTable") ^ 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t __132__EFSQLQueryGenerator_selectStatementForReturnObjectKeypaths_predicate_sortDescriptors_limit_propertyMapper_protectedDataAvailable___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addResult:alias:", a3, a2);
}

+ (id)countStatementForPredicate:(id)a3 propertyMapper:(id)a4 distinctBy:(id)a5 groupBy:(id)a6 groupByTable:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_opt_new();
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "addObject:", v16);
  objc_msgSend(a1, "_createStatementForPredicate:propertyMapper:tablesUsed:", v12, v13, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    +[EFSQLAggregateFunction countDistinct:](EFSQLAggregateFunction, "countDistinct:", v14);
  else
    +[EFSQLAggregateFunction count:](EFSQLAggregateFunction, "count:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addResult:alias:", v20, 0);

  if (v15)
  {
    objc_msgSend(v19, "addResultColumn:fromTable:", v15, v16);
    objc_msgSend(v19, "groupByColumn:fromTable:", v15, v16);
  }

  return v19;
}

+ (void)_createStatementForPredicate:(void *)a1 propertyMapper:(uint8_t *)buf tablesUsed:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Exception occurred when mapping predicate:\n%{public}@", buf, 0xCu);

}

@end
