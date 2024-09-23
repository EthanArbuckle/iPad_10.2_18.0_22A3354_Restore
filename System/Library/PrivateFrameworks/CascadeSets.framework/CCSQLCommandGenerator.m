@implementation CCSQLCommandGenerator

+ (id)_produceJoinCriterionClause:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  CCSQLCommandClause *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "subCriteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "sqlOperator");
  if (v6 > 0x10)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (((1 << v6) & 0x1FBFD) != 0)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CCSQLCommandGenerator _produceJoinCriterionClause:].cold.1(v4, v7);

    goto LABEL_6;
  }
  if (v6 == 1)
  {
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v4, "columnName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefixColumnName:withTableName:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "comparingColumnName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "comparingTableName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefixColumnName:withTableName:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ = %@"), v14, v17);

  }
  else
  {
    v30 = v4;
    v18 = objc_msgSend(v5, "count");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v18);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v5;
    v20 = v5;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(a1, "_produceJoinCriterionClause:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v25, "clause");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("(%@)"), v27);
            objc_msgSend(v19, "addObject:", v28);

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" AND "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v4 = v30;

    v5 = v29;
  }
LABEL_7:
  v9 = -[CCSQLCommandClause initWithClause:parameters:]([CCSQLCommandClause alloc], "initWithClause:parameters:", v8, 0);

  return v9;
}

+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  CCDatabaseUpdate *v36;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x24BDD17C8];
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_msgSend([v15 alloc], "initWithFormat:", CFSTR("UPDATE %@"), v12);
  objc_msgSend(a1, "_produceSetValuesClauseForColumnNames:columnValues:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "clause");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" SET %@"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  objc_msgSend(a1, "_produceCriterionClause:tableName:", v13, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "clause");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v25;
  }
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" RETURNING %@"), v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v27;
  }
  objc_msgSend(v18, "stringByAppendingString:", CFSTR(";"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "parameters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  objc_msgSend(v23, "parameters");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count") + v30;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "parameters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v34);

  objc_msgSend(v23, "parameters");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObjectsFromArray:", v35);

  v36 = -[CCDatabaseCommand initWithCommandString:parameters:]([CCDatabaseUpdate alloc], "initWithCommandString:parameters:", v28, v33);
  return v36;
}

+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CCDatabaseSelect *v37;
  void *v38;
  CCDatabaseSelect *v39;
  id v41;
  id v42;

  v13 = a5;
  v16 = a3;
  v42 = a7;
  v41 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a6;
  objc_msgSend(a1, "_produceSelectClauseWithTableName:columnNames:count:", v16, a4, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  objc_msgSend(a1, "_generateJoinClause:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "clause");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "parameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v25);

    v20 = (void *)v24;
  }
  objc_msgSend(a1, "_produceCriterionClause:tableName:", v42, v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "clause");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "parameters");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v30);

    v20 = (void *)v29;
  }
  objc_msgSend(a1, "_generateOrderByClause:", v41);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v31)
  {
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" ORDER BY %@"), v31);
    v33 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v33;
  }
  if (v17)
  {
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" LIMIT %@"), CFSTR("?"));
    v34 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v17);
    v20 = (void *)v34;
  }
  if (v18)
  {
    objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" OFFSET %@"), CFSTR("?"));
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v18);
    v20 = (void *)v35;
  }
  objc_msgSend(v20, "stringByAppendingString:", CFSTR(";"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = [CCDatabaseSelect alloc];
  if (objc_msgSend(v21, "count"))
    v38 = v21;
  else
    v38 = 0;
  v39 = -[CCDatabaseCommand initWithCommandString:parameters:](v37, "initWithCommandString:parameters:", v36, v38);

  return v39;
}

+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  CCSQLCommandClause *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v113 = a4;
  if (v6)
  {
    objc_msgSend(v6, "columnName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefixColumnName:withTableName:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "comparingColumnName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "comparingTableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefixColumnName:withTableName:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "columnValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subCriteria");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subQuery");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    switch(objc_msgSend(v6, "sqlOperator"))
    {
      case 1:
        v16 = v15;
        objc_msgSend(v6, "comparingColumnName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_alloc(MEMORY[0x24BDD17C8]);
        v19 = v18;
        if (!v17)
        {
          objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@ = %@"), v9, v37);
          goto LABEL_60;
        }
        v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@ = %@"), v9, v12);
        v21 = v112;
        v15 = v16;
        if (v20)
          goto LABEL_69;
        goto LABEL_58;
      case 2:
        v23 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v24 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "initWithFormat:", CFSTR("%@ < %@"), v9, v25);
        goto LABEL_11;
      case 3:
        v27 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v24 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v27, "initWithFormat:", CFSTR("%@ <= %@"), v9, v25);
        goto LABEL_11;
      case 4:
        v28 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v24 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v28, "initWithFormat:", CFSTR("%@ >= %@"), v9, v25);
LABEL_11:
        v20 = (void *)v26;

        v15 = v24;
        objc_msgSend(v13, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v29);

        goto LABEL_68;
      case 5:
        v30 = v15;
        v31 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("%@ MATCH %@"), v113, v32);

        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v13, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@ : %@"), v9, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "addObject:", v35);
        v15 = v30;
        goto LABEL_68;
      case 6:
        v16 = v15;
        v36 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "initWithFormat:", CFSTR("%@ != %@"), v9, v37);
        goto LABEL_60;
      case 7:
        v39 = v15;
        v40 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v42 = v14;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v40;
        v15 = v39;
        v20 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("%@ BETWEEN (%@) AND (%@)"), v9, v41, v43);

        v14 = v42;
        v45 = v39;
        goto LABEL_44;
      case 8:
        v111 = v12;
        v46 = v15;
        v47 = objc_alloc(MEMORY[0x24BDD17C8]);
        v21 = v112;
        if (v112)
        {
          objc_msgSend(v112, "commandString");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_removeEndingSemicolonFromCommandString:", v48);
          v49 = v14;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("%@ IN (%@)"), v9, v50);

          v14 = v49;
          objc_msgSend(v112, "parameters");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
          objc_msgSend(v46, "addObjectsFromArray:", v51);

          v15 = v46;
        }
        else
        {
          objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("%@ IN (%@)"), v9, v101);

          v15 = v46;
          objc_msgSend(v46, "addObjectsFromArray:", v13);
        }
LABEL_57:
        v12 = v111;
        if (v20)
        {
LABEL_69:
          v22 = -[CCSQLCommandClause initWithClause:parameters:]([CCSQLCommandClause alloc], "initWithClause:parameters:", v20, v15);

        }
        else
        {
LABEL_58:
          v22 = 0;
        }
LABEL_70:

        break;
      case 9:
        v16 = v15;
        v52 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v52, "initWithFormat:", CFSTR("%@ LIKE %@"), v9, v37);
LABEL_60:
        v20 = (void *)v38;

        objc_msgSend(v13, "firstObject");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v100);

        v15 = v16;
        goto LABEL_68;
      case 10:
        v53 = v12;
        v54 = v15;
        v109 = v13;
        v111 = v53;
        v105 = v9;
        v106 = v6;
        v55 = objc_msgSend(v14, "count");
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v55);
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v107 = v14;
        v57 = v14;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v119;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v119 != v60)
                objc_enumerationMutation(v57);
              objc_msgSend(a1, "_produceCriterionClause:tableName:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i), v113);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
              {
                v63 = objc_alloc(MEMORY[0x24BDD17C8]);
                objc_msgSend(v62, "clause");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("(%@)"), v64);
                objc_msgSend(v56, "addObject:", v65);

                objc_msgSend(v62, "parameters");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "addObjectsFromArray:", v66);

              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
          }
          while (v59);
        }

        if (!objc_msgSend(v56, "count"))
          goto LABEL_55;
        v67 = CFSTR(" AND ");
        goto LABEL_40;
      case 11:
        v68 = v12;
        v54 = v15;
        v109 = v13;
        v111 = v68;
        v105 = v9;
        v106 = v6;
        v69 = objc_msgSend(v14, "count");
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v69);
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v107 = v14;
        v70 = v14;
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v115;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v115 != v73)
                objc_enumerationMutation(v70);
              objc_msgSend(a1, "_produceCriterionClause:tableName:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j), v113);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
              {
                v76 = objc_alloc(MEMORY[0x24BDD17C8]);
                objc_msgSend(v75, "clause");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = (void *)objc_msgSend(v76, "initWithFormat:", CFSTR("(%@)"), v77);
                objc_msgSend(v56, "addObject:", v78);

                objc_msgSend(v75, "parameters");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "addObjectsFromArray:", v79);

              }
            }
            v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
          }
          while (v72);
        }

        if (objc_msgSend(v56, "count"))
        {
          v67 = CFSTR(" OR ");
LABEL_40:
          objc_msgSend(v56, "componentsJoinedByString:", v67);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_55:
          v20 = 0;
        }
        v9 = v105;
        v14 = v107;
        v13 = v109;
        v21 = v112;
        v15 = v54;

        v6 = v106;
        goto LABEL_57;
      case 12:
        v80 = v15;
        v81 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v9;
        v104 = v82;
        v83 = CFSTR("%@ IS %@");
        goto LABEL_43;
      case 13:
        v80 = v15;
        v81 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", objc_msgSend(v13, "count"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v9;
        v104 = v82;
        v83 = CFSTR("%@ IS NOT %@");
LABEL_43:
        v84 = v81;
        v15 = v80;
        v20 = (void *)objc_msgSend(v84, "initWithFormat:", v83, v103, v104);

        v45 = v80;
LABEL_44:
        objc_msgSend(v45, "addObjectsFromArray:", v13);
        goto LABEL_68;
      case 14:
        objc_msgSend(v14, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        if (v85)
        {
          v86 = v12;
          v87 = v15;
          objc_msgSend(a1, "_produceCriterionClause:tableName:", v85, v113);
          v88 = objc_claimAutoreleasedReturnValue();
          if (v88)
          {
            v89 = (void *)v88;
            v108 = v14;
            v110 = v13;
            v90 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v89, "clause");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = (void *)objc_msgSend(v90, "initWithFormat:", CFSTR("(%@)"), v91);

            objc_msgSend(v89, "parameters");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "addObjectsFromArray:", v93);

            if (v92)
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NOT %@"), v92);

            }
            else
            {
              v20 = 0;
            }
            v14 = v108;
            v13 = v110;
          }
          else
          {
            v20 = 0;
          }
          v15 = v87;
          v12 = v86;
        }
        else
        {
          v20 = 0;
        }

LABEL_68:
        v21 = v112;
        if (v20)
          goto LABEL_69;
        goto LABEL_58;
      case 15:
        v21 = v112;
        if (!v112)
          goto LABEL_58;
        v111 = v12;
        v46 = v15;
        v94 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v112, "commandString");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_removeEndingSemicolonFromCommandString:", v95);
        v96 = v14;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v94, "initWithFormat:", CFSTR("EXISTS (%@)"), v97);
        goto LABEL_53;
      case 16:
        v21 = v112;
        if (!v112)
          goto LABEL_58;
        v111 = v12;
        v46 = v15;
        v99 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v112, "commandString");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_removeEndingSemicolonFromCommandString:", v95);
        v96 = v14;
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v99, "initWithFormat:", CFSTR("NOT EXISTS (%@)"), v97);
LABEL_53:
        v20 = (void *)v98;

        v14 = v96;
        objc_msgSend(v21, "parameters");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      default:
        v22 = 0;
        v21 = v112;
        goto LABEL_70;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)prefixColumnName:(id)a3 withTableName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), a4, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    if (a3 == 1)
    {
      v4 = CFSTR("?");
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
      do
      {
        objc_msgSend(v5, "addObject:", CFSTR("?"));
        --v3;
      }
      while (v3);
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = &stru_250991730;
  }
  return v4;
}

+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v8);
LABEL_6:
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT * FROM %@"), v8);
    goto LABEL_6;
  }
  objc_msgSend(a1, "_generateCommaSeparatedValuesString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("SELECT %@ FROM %@"), v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v13;
}

+ (id)_generateOrderByClause:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v6 = objc_msgSend(v4, "orderMode");
  switch(v6)
  {
    case 3:
      v8 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v5, "columnNames");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_generateCommaSeparatedValuesString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@ DESC"), v10);
LABEL_10:
      v7 = (__CFString *)v11;

      break;
    case 2:
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v5, "columnNames");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_generateCommaSeparatedValuesString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@ ASC"), v10);
      goto LABEL_10;
    case 1:
      v7 = CFSTR("rank");
      break;
    default:
      v7 = 0;
      break;
  }
LABEL_11:

  return v7;
}

+ (id)_generateJoinClause:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CCSQLCommandClause *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "joinType"))
  {
    v24 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "joinTables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v11, "joinCriterion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_produceJoinCriterionClause:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          switch(objc_msgSend(v5, "joinType"))
          {
            case 1:
              v14 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v11, "table");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "clause");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v14, "initWithFormat:", CFSTR(" JOIN %@ ON (%@)"), v15, v16);
              goto LABEL_13;
            case 2:
              v18 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v11, "table");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "clause");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v18, "initWithFormat:", CFSTR(" LEFT JOIN %@ ON (%@)"), v15, v16);
              goto LABEL_13;
            case 3:
              v19 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v11, "table");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "clause");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v19, "initWithFormat:", CFSTR(" RIGHT JOIN %@ ON (%@)"), v15, v16);
              goto LABEL_13;
            case 4:
              v20 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v11, "table");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "clause");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v20, "initWithFormat:", CFSTR(" FULL JOIN %@ ON (%@)"), v15, v16);
LABEL_13:
              v21 = (void *)v17;

              if (v21)
              {
                objc_msgSend(v24, "appendString:", v21);

              }
              break;
            default:
              break;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    v22 = -[CCSQLCommandClause initWithClause:parameters:]([CCSQLCommandClause alloc], "initWithClause:parameters:", v24, 0);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)_generateCommaSeparatedValuesString:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 == 1)
      objc_msgSend(v3, "objectAtIndex:", 0);
    else
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_250991730;
  }

  return v5;
}

+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CCSQLCommandClause *v19;
  CCSQLCommandClause *v20;
  CCSQLCommandClause *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 && (v9 = v8, objc_msgSend(v7, "count") == v8))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
    v11 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "count"))
    {
      v12 = 0;
      do
      {
        v13 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v6, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@ = %@"), v14, v15);
        objc_msgSend(v10, "addObject:", v16);

        objc_msgSend(v7, "objectAtIndex:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v12;
      }
      while (v12 < objc_msgSend(v6, "count"));
    }
    if ((unint64_t)objc_msgSend(v10, "count") <= 1)
    {
      v21 = [CCSQLCommandClause alloc];
      objc_msgSend(v10, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
    }
    else
    {
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [CCSQLCommandClause alloc];
    }
    v20 = -[CCSQLCommandClause initWithClause:parameters:](v19, "initWithClause:parameters:", v18, v11);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v15, "commandString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v15, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" LIMIT %@"), CFSTR("?"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertString:atIndex:", v13, objc_msgSend(v10, "length") - 1);
  objc_msgSend(v12, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" OFFSET %@"), CFSTR("?"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertString:atIndex:", v14, objc_msgSend(v10, "length") - 1);
  objc_msgSend(v12, "addObject:", v7);

  objc_msgSend(v15, "replaceParameters:", v12);
  objc_msgSend(v15, "updateCommandString:", v10);

}

+ (void)replaceOffset:(id)a3 forSelect:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "count") - 1, v6);
  objc_msgSend(v5, "updateParameters:", v8);

}

- (CCSQLCommandGenerator)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CCDatabaseDelete *v19;
  void *v20;
  CCDatabaseDelete *v21;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithFormat:", CFSTR("DELETE FROM %@"), v11);
  objc_msgSend(a1, "_produceCriterionClause:tableName:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "clause");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" WHERE %@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" RETURNING %@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v17;
  }
  objc_msgSend(v12, "stringByAppendingString:", CFSTR(";"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [CCDatabaseDelete alloc];
  objc_msgSend(v13, "parameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CCDatabaseCommand initWithCommandString:parameters:](v19, "initWithCommandString:parameters:", v18, v20);

  return v21;
}

+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5 onConflict:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(a6, "type");
  if ((unint64_t)(v13 - 1) > 2)
    v14 = CFSTR("INSERT INTO %@ (%@) VALUES (%@)");
  else
    v14 = off_250990888[v13 - 1];
  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "count");

  objc_msgSend(a1, "_generateCommaSeparatedPlaceholdersString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithFormat:", v14, v12, v16, v18);

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(" RETURNING %@"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  objc_msgSend(v19, "stringByAppendingString:", CFSTR(";"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_removeEndingSemicolonFromCommandString:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(";")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (void)_produceJoinCriterionClause:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "sqlOperator");
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Inavlid join criterion, sql operator not supported for join %ld", (uint8_t *)&v3, 0xCu);
}

@end
