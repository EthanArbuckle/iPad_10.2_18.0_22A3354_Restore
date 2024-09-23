@implementation FedStatsCategoricalTypeDenyList

- (FedStatsCategoricalTypeDenyList)initWithDenyList:(id)a3 tableName:(id)a4 columnName:(id)a5
{
  id v9;
  id v10;
  id v11;
  FedStatsCategoricalTypeDenyList *v12;
  FedStatsCategoricalTypeDenyList *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FedStatsCategoricalTypeDenyList;
  v12 = -[FedStatsCategoricalTypeDenyList init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_denyListDB, a3);
    objc_storeStrong((id *)&v13->_tableName, a4);
    objc_storeStrong((id *)&v13->_columnName, a5);
  }

  return v13;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  objc_class *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("fileName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v8;
      v55 = 0;
      +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v8, 114, &v55);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v55;
      v12 = v11;
      if (!v10)
      {
        if (a4)
        {
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v11, CFSTR("The URL cannot be loaded as a database"));
          v27 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
        goto LABEL_61;
      }
      v50 = v11;
      objc_msgSend(v6, "objectForKey:", CFSTR("tableName"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4 && !v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v49 = (objc_class *)a1;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (a4 && (isKindOfClass & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v52 = (void *)v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM SQLITE_MASTER WHERE type == 'table' AND name == '%@'"), CFSTR("tableCount"), v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      objc_msgSend(v10, "runQuery:error:", v18, &v54);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v54;
      v51 = v10;
      if (!v19 || (objc_msgSend(v19, "next"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (a4)
        {
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v20, CFSTR("Cannot query list of tables in deny list database"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = 1;
LABEL_35:

        if (v26)
        {
          v27 = 0;
          v12 = v50;
          v10 = v51;
          v30 = v52;
LABEL_60:

LABEL_61:
          goto LABEL_62;
        }
        objc_msgSend(v6, "objectForKey:", CFSTR("columnName"));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (a4 && !v31)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v33);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_opt_class();
        v34 = objc_opt_isKindOfClass();
        if (a4 && (v34 & 1) == 0)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v35);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'"), CFSTR("columnCount"), v52, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v10 = v51;
        objc_msgSend(v51, "runQuery:error:", v36, &v53);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v53;
        if (!v37 || (objc_msgSend(v37, "next"), (v39 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          if (a4)
          {
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v38, CFSTR("Cannot query list of columns in deny list database table"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v44 = v38;
          v43 = 1;
          goto LABEL_56;
        }
        v40 = v39;
        v48 = v38;
        objc_msgSend(v39, "objectForKey:", CFSTR("columnCount"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v41;
        if (v41)
        {
          v42 = objc_msgSend(v41, "unsignedIntegerValue");
          v43 = v42 != 1;
          if (!a4 || v42 == 1)
            goto LABEL_55;
        }
        else if (!a4)
        {
LABEL_54:
          v43 = 1;
LABEL_55:

          v44 = v48;
LABEL_56:

          if (v43)
          {
            v27 = 0;
            v12 = v50;
            v30 = v52;
          }
          else
          {
            v30 = v52;
            v27 = (void *)objc_msgSend([v49 alloc], "initWithDenyList:tableName:columnName:", v10, v52, v32);
            v12 = v50;
          }

          goto LABEL_60;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v45);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v10 = v51;
        goto LABEL_54;
      }
      v22 = v21;
      objc_msgSend(v21, "objectForKey:", CFSTR("tableCount"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = objc_msgSend(v23, "unsignedIntegerValue");
        v26 = v25 != 1;
        if (!a4 || v25 == 1)
          goto LABEL_34;
      }
      else if (!a4)
      {
LABEL_33:
        v26 = 1;
LABEL_34:

        goto LABEL_35;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
    if (a4)
    {
      goto LABEL_28;
    }
  }
  else if (a4)
  {
LABEL_28:
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27 = 0;
LABEL_62:

  return v27;
}

- (BOOL)isInDenyList:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[FedStatsCategoricalTypeDenyList tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalTypeDenyList columnName](self, "columnName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM '%@' WHERE %@ == '%@'"), CFSTR("matchCount"), v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FedStatsCategoricalTypeDenyList denyListDB](self, "denyListDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "runQuery:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "next"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    objc_msgSend(v11, "objectForKey:", CFSTR("matchCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "unsignedIntegerValue") != 0;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)filter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = a3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FedStatsCategoricalTypeDenyList isInDenyList:](self, "isInDenyList:", v6))
      v7 = 0;
    else
      v7 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(v13, "objectForKey:", CFSTR("fileName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a8 = (id *)v13;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
    +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:requiredForCollectionKey:error:](FedStatsCategoricalTypeAssetSpecifier, "assetSpecifierWithKey:requiredForCollectionKey:error:", v16, 0, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;
    v19 = v18;
    if (v17)
    {
      if (v14)
      {
        v29 = v18;
        objc_msgSend(v17, "assetSpecifierValueForDataPoint:error:", v14, &v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29;

        if (v20)
        {
          if (v15)
          {
            objc_msgSend(v15, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              a8 = (id *)objc_msgSend(v13, "mutableCopy");
              objc_msgSend(a8, "setObject:forKey:", v21, CFSTR("fileName"));
            }
            else if (a8)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing asset URL for '%@'"), v16);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 300, v26);
              *a8 = (id)objc_claimAutoreleasedReturnValue();

              a8 = 0;
            }

          }
          else
          {
            if (a7)
            {
              v31[0] = v20;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            a8 = (id *)v13;
          }
        }
        else if (a8)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v28;
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 300, v28, v25);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

          a8 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v24 = v28;
        goto LABEL_27;
      }
      if (a6)
      {
        objc_msgSend(v17, "parameters");
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      a8 = (id *)v13;
    }
    else if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 300, v19, v23);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
    v24 = v19;
LABEL_28:

    goto LABEL_29;
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Value for '%@' must be either a string or URL"), CFSTR("fileName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v22);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    a8 = 0;
  }
LABEL_29:

  return a8;
}

- (FedStatsSQLiteDatabase)denyListDB
{
  return self->_denyListDB;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_denyListDB, 0);
}

@end
