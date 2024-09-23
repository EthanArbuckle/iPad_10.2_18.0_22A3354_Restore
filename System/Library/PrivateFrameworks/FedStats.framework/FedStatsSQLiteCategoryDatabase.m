@implementation FedStatsSQLiteCategoryDatabase

- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 tableName:(id)a4 categoryColumnName:(id)a5 indexColumnName:(id)a6 minIndex:(unint64_t)a7 maxIndex:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FedStatsSQLiteCategoryDatabase *v18;
  FedStatsSQLiteCategoryDatabase *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FedStatsSQLiteCategoryDatabase;
  v18 = -[FedStatsSQLiteCategoryDatabase init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sqliteDB, a3);
    objc_storeStrong((id *)&v19->_tableName, a4);
    objc_storeStrong((id *)&v19->_categoryColumnName, a5);
    objc_storeStrong((id *)&v19->_indexColumnName, a6);
    v19->_minIndex = a7;
    v19->_maxIndex = a8;
  }

  return v19;
}

- (unint64_t)dimensionality
{
  unint64_t v3;

  v3 = -[FedStatsSQLiteCategoryDatabase maxIndex](self, "maxIndex");
  return v3 - -[FedStatsSQLiteCategoryDatabase minIndex](self, "minIndex") + 1;
}

+ (FedStatsSQLiteCategoryDatabase)databaseWithFileURL:(id)a3 minIndex:(unint64_t)a4 maxIndex:(unint64_t)a5 checkForPrimaryKey:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  const __CFString *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  objc_class *v71;
  unint64_t v72;
  unint64_t v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;

  v8 = a6;
  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = 0;
    +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v12, 114, &v77);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v77;
    if (!v13)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v14, CFSTR("Cannot open database"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v36 = 0;
        *a7 = v37;
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:
      v36 = 0;
      goto LABEL_25;
    }
    v73 = a4;
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = v13;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("SELECT COUNT(*) AS %@ FROM SQLITE_MASTER WHERE type == 'table'"), CFSTR("tableCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(v16, "runQuery:error:", v17, &v78);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v72 = a5;
      objc_msgSend(v18, "next");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = v19;
        v71 = (objc_class *)a1;
        objc_msgSend(v19, "objectForKey:", CFSTR("tableCount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v70 = v13;
            v22 = objc_msgSend(v21, "unsignedIntegerValue");

            v23 = v22 == 1;
            v13 = v70;
            if (!v23)
            {
LABEL_21:
              if (a7)
              {
                +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("Database does not have exactly one table"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_23;
              }
              goto LABEL_24;
            }
            v24 = (void *)MEMORY[0x24BDD17C8];
            v25 = v16;
            objc_msgSend(v24, "stringWithFormat:", CFSTR("SELECT %@ FROM SQLITE_MASTER WHERE type == 'table'"), CFSTR("name"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0;
            objc_msgSend(v25, "runQuery:error:", v26, &v78);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v78;
            if (v27)
            {
              v68 = v25;
              objc_msgSend(v27, "next");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                v67 = v26;
                objc_msgSend(v29, "objectForKey:", CFSTR("name"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v31;
                v33 = v28;
                if (v31)
                {
                  v34 = v31;
                  v35 = v14;
                }
                else
                {
                  +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v28, CFSTR("Cannot lookup table name"));
                  v35 = (id)objc_claimAutoreleasedReturnValue();
                }
                v39 = v32;

                v26 = v67;
              }
              else
              {
                v33 = v28;
                +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v28, CFSTR("Cannot check query result"));
                v35 = (id)objc_claimAutoreleasedReturnValue();
                v39 = 0;
              }

              v25 = v68;
            }
            else
            {
              +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v28, CFSTR("Cannot query database"));
              v33 = v28;
              v35 = (id)objc_claimAutoreleasedReturnValue();
              v39 = 0;
            }

            v40 = v35;
            v41 = v39;
            if (!v39)
            {
              if (a7)
              {
                +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v40, CFSTR("Cannot get table name from database"));
                v36 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v36 = 0;
              }
              v13 = v70;
              goto LABEL_77;
            }
            v42 = (void *)MEMORY[0x24BDD17C8];
            v43 = v25;
            objc_msgSend(v42, "stringWithFormat:", CFSTR("SELECT COUNT(*) AS %@ FROM PRAGMA_TABLE_XINFO('%@')"), CFSTR("columnCount"), v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0;
            objc_msgSend(v43, "runQuery:error:", v44, &v78);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v45)
            {

              v13 = v70;
              goto LABEL_61;
            }
            v46 = v40;
            objc_msgSend(v45, "next");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v70;
            if (v47)
            {
              v48 = v47;
              v69 = v41;
              objc_msgSend(v47, "objectForKey:", CFSTR("columnCount"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v50 = objc_msgSend(v49, "unsignedIntegerValue");

                  v23 = v50 == 2;
                  v41 = v69;
                  v13 = v70;
                  v40 = v46;
                  if (!v23)
                  {
LABEL_61:
                    if (a7)
                    {
                      v66 = CFSTR("Database table does not have exactly two columns");
LABEL_63:
                      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v66);
                      v36 = 0;
                      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:

                      v14 = v40;
                      goto LABEL_25;
                    }
                    goto LABEL_76;
                  }
                  if (!v8)
                    goto LABEL_46;
                  v51 = (void *)MEMORY[0x24BDD17C8];
                  v52 = v43;
                  objc_msgSend(v51, "stringWithFormat:", CFSTR("SELECT COUNT(*) AS %@ FROM PRAGMA_INDEX_LIST('%@') AS indices, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin == 'pk' AND index_info.key == 1;"),
                    CFSTR("indexColumnCount"),
                    v69);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v78 = 0;
                  objc_msgSend(v52, "runQuery:error:", v53, &v78);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v54)
                  {
                    objc_msgSend(v54, "next");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v55)
                    {
                      v56 = v55;
                      objc_msgSend(v55, "objectForKey:", CFSTR("indexColumnCount"));
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v57)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v58 = objc_msgSend(v57, "unsignedIntegerValue");

                          v23 = v58 == 2;
                          v41 = v69;
                          v13 = v70;
                          v40 = v46;
                          if (!v23)
                          {
LABEL_74:
                            if (a7)
                            {
                              v66 = CFSTR("Database table does not have primary key with the two columns");
                              goto LABEL_63;
                            }
LABEL_76:
                            v36 = 0;
                            goto LABEL_77;
                          }
LABEL_46:
                          v76 = v40;
                          getColumnName(v43, (uint64_t)v41, (uint64_t)CFSTR("TEXT"), &v76);
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          v60 = v76;

                          if (!v59)
                          {
                            if (a7)
                            {
                              +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v60, CFSTR("Cannot get text-typed column name from table"));
                              v36 = 0;
                              *a7 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              v36 = 0;
                            }
                            goto LABEL_85;
                          }
                          v75 = v60;
                          getColumnName(v43, (uint64_t)v41, (uint64_t)CFSTR("INTEGER"), &v75);
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          v62 = v75;

                          if (v61)
                          {
                            if (v73 == 0x7FFFFFFFFFFFFFFFLL)
                              v63 = 1;
                            else
                              v63 = v73;
                            if (v72 == 0x7FFFFFFFFFFFFFFFLL)
                            {
                              v74 = v62;
                              getColumnMaxValue(v43, (uint64_t)v41, (uint64_t)v61, &v74);
                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                              v65 = v74;

                              if (!v64)
                              {
                                if (a7)
                                {
                                  +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v65, CFSTR("Cannot get number of rows from database"));
                                  v36 = 0;
                                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  v36 = 0;
                                }
                                v62 = v65;
                                v41 = v69;
                                v13 = v70;
                                goto LABEL_84;
                              }
                              v72 = objc_msgSend(v64, "unsignedIntegerValue");

                              v62 = v65;
                              v41 = v69;
                              v13 = v70;
                            }
                            v36 = (void *)objc_msgSend([v71 alloc], "initWithSQLiteDatabase:tableName:categoryColumnName:indexColumnName:minIndex:maxIndex:", v43, v41, v59, v61, v63, v72);
                          }
                          else if (a7)
                          {
                            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v62, CFSTR("Cannot get text-typed column name from table"));
                            v36 = 0;
                            *a7 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v36 = 0;
                          }
LABEL_84:

                          v60 = v62;
LABEL_85:

                          v40 = v60;
                          goto LABEL_77;
                        }
                      }

                      v41 = v69;
                      v13 = v70;
LABEL_73:
                      v40 = v46;
                      goto LABEL_74;
                    }

                  }
                  v13 = v70;
                  goto LABEL_73;
                }
              }

              v41 = v69;
            }
            else
            {

            }
            v40 = v46;
            goto LABEL_61;
          }
        }

      }
    }

    goto LABEL_21;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("SQLite categories database requires a path in URL"));
    v36 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
LABEL_26:

  return (FedStatsSQLiteCategoryDatabase *)v36;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
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
  id v20;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[FedStatsSQLiteCategoryDatabase indexColumnName](self, "indexColumnName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsSQLiteCategoryDatabase tableName](self, "tableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsSQLiteCategoryDatabase categoryColumnName](self, "categoryColumnName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1"), v8, v9, v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FedStatsSQLiteCategoryDatabase sqliteDB](self, "sqliteDB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v12, "runQuery:error:", v11, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    if (v13)
    {
      objc_msgSend(v13, "next");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[FedStatsSQLiteCategoryDatabase indexColumnName](self, "indexColumnName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") - -[FedStatsSQLiteCategoryDatabase minIndex](self, "minIndex") + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (a4)
        {
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("Database columns are malformed"));
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = &unk_250C57B60;
      }

    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v14, CFSTR("Failed to lookup category in the database"));
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Input category should be a string"));
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)decode:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v18;

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[FedStatsSQLiteCategoryDatabase categoryColumnName](self, "categoryColumnName", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsSQLiteCategoryDatabase tableName](self, "tableName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsSQLiteCategoryDatabase indexColumnName](self, "indexColumnName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@ == %lu ORDER BY RANDOM() LIMIT 1"), v7, v8, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FedStatsSQLiteCategoryDatabase sqliteDB](self, "sqliteDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "runQuery:error:", v10, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "next");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[FedStatsSQLiteCategoryDatabase categoryColumnName](self, "categoryColumnName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v16 = v15;
      else
        v16 = 0;

    }
    else
    {
      v16 = CFSTR("FedStatsCategoricalDataOutOfBounds");
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 tableName:(id)a5 categoryColumnName:(id)a6 indexColumnName:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  int v33;
  const __CFString *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42[2];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = v17;
      v39 = v16;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v45 != v21)
              objc_enumerationMutation(v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a8)
              {
                *a8 = (id)objc_claimAutoreleasedReturnValue();
              }

              v35 = 0;
              v17 = v38;
              v16 = v39;
              goto LABEL_37;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v20)
            continue;
          break;
        }
      }

      v43 = 0;
      +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v13, 119, &v43);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v43;
      if (v23)
      {
        v17 = v38;
        v16 = v39;
        v40 = v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CREATE TABLE '%@' ('%@' INTEGER, '%@' TEXT, PRIMARY KEY('%@','%@')) WITHOUT ROWID"), v15, v38, v39, v38, v39);
        v42[1] = v24;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "execute:error:");
        v26 = v24;

        v41 = v23;
        if (v25)
        {
          v27 = 0;
          v28 = 1;
          do
          {
            if (v28 - 1 >= (unint64_t)objc_msgSend(v18, "count"))
            {
              v33 = 0;
              goto LABEL_34;
            }
            v29 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v18, "objectAtIndex:", v28 - 1);
            v30 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("INSERT INTO '%@' VALUES (%lu, '%@')"), v40, v28, v30);
            v31 = objc_claimAutoreleasedReturnValue();

            v42[0] = v26;
            LOBYTE(v30) = objc_msgSend(v41, "execute:error:", v31, v42);
            v32 = v42[0];

            ++v28;
            v26 = v32;
            v27 = (void *)v31;
          }
          while ((v30 & 1) != 0);
          if (a8)
          {
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v32, CFSTR("Cannot insert elements into the table"));
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          v33 = 1;
          v26 = v32;
          v27 = (void *)v31;
LABEL_34:
          v17 = v38;

          v16 = v39;
          v15 = v40;
        }
        else
        {
          if (a8)
          {
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          v33 = 1;
          v15 = v40;
        }

        if (!v33)
        {
          +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:", v13, 1, objc_msgSend(v18, "count"), 1, a8);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
      }
      else
      {
        v17 = v38;
        v16 = v39;
        if (a8)
        {
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v24, CFSTR("Cannot create new database"));
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      goto LABEL_36;
    }
    if (a8)
    {
      goto LABEL_23;
    }
LABEL_36:
    v35 = 0;
    goto LABEL_37;
  }
  if (!a8)
    goto LABEL_36;
LABEL_23:
  +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v34);
  v35 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v35;
}

- (FedStatsSQLiteDatabase)sqliteDB
{
  return (FedStatsSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)categoryColumnName
{
  return self->_categoryColumnName;
}

- (NSString)indexColumnName
{
  return self->_indexColumnName;
}

- (unint64_t)minIndex
{
  return self->_minIndex;
}

- (unint64_t)maxIndex
{
  return self->_maxIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexColumnName, 0);
  objc_storeStrong((id *)&self->_categoryColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_sqliteDB, 0);
}

@end
