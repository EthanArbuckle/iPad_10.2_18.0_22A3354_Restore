@implementation FedStatsCategoricalTypeHuffmanEncoder

- (FedStatsCategoricalTypeHuffmanEncoder)initWithHuffmanEncoderDatabase:(id)a3 tableName:(id)a4 lookupColumnName:(id)a5 codeColumnName:(id)a6 unknownTokenBitString:(id)a7 endTokenBitString:(id)a8 exploreUnknownToken:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  FedStatsCategoricalTypeHuffmanEncoder *v19;
  FedStatsCategoricalTypeHuffmanEncoder *v20;
  uint64_t v21;
  FedStatsCategoricalTypeTokenizerProtocol *explorationTokenizer;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v17 = a7;
  v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)FedStatsCategoricalTypeHuffmanEncoder;
  v19 = -[FedStatsCategoricalTypeHuffmanEncoder init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_huffmanDB, a3);
    objc_storeStrong((id *)&v20->_tableName, a4);
    objc_storeStrong((id *)&v20->_lookupColumnName, a5);
    objc_storeStrong((id *)&v20->_codeColumnName, a6);
    objc_storeStrong((id *)&v20->_unknownTokenBitString, a7);
    objc_storeStrong((id *)&v20->_endTokenBitString, a8);
    if (a9)
    {
      +[FedStatsCategoricalTypeCharacterTokenizer instanceWithParameters:error:](FedStatsCategoricalTypeCharacterTokenizer, "instanceWithParameters:error:", MEMORY[0x24BDBD1B8], 0);
      v21 = objc_claimAutoreleasedReturnValue();
      explorationTokenizer = v20->_explorationTokenizer;
      v20->_explorationTokenizer = (FedStatsCategoricalTypeTokenizerProtocol *)v21;
    }
    else
    {
      explorationTokenizer = v20->_explorationTokenizer;
      v20->_explorationTokenizer = 0;
    }

  }
  return v20;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83[2];
  id v84;

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
      objc_msgSend(v6, "objectForKey:", CFSTR("tableName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("valueColumnName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v6, "objectForKey:", CFSTR("indexColumnName"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v84 = 0;
                  +[FedStatsSQLiteDatabase databaseWithURL:mode:error:](FedStatsSQLiteDatabase, "databaseWithURL:mode:error:", v9, 114, &v84);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = v84;
                  if (!v13)
                  {
                    if (a4)
                    {
                      v24 = v82;
                      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v82, CFSTR("Cannot load Huffman database"));
                      v19 = 0;
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_84:

                      goto LABEL_85;
                    }
                    v19 = 0;
LABEL_83:
                    v24 = v82;
                    goto LABEL_84;
                  }
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM SQLITE_MASTER WHERE type == 'table' AND name == '%@'"), CFSTR("tableCount"), v10);
                  v83[1] = 0;
                  v81 = v13;
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "runQuery:error:");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = 0;
                  v71 = v14;
                  v80 = v12;
                  if (v14 && (objc_msgSend(v14, "next"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    v62 = v15;
                    objc_msgSend(v15, "objectForKey:", CFSTR("tableCount"));
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v60 = v16;
                    if (v16 && objc_msgSend(v16, "unsignedIntegerValue") == 1)
                    {
                      v17 = 0;
                    }
                    else
                    {
                      if (a4)
                      {
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v25);
                        *a4 = (id)objc_claimAutoreleasedReturnValue();

                      }
                      v17 = 1;
                    }

                  }
                  else
                  {
                    if (a4)
                    {
                      v23 = v66;
                      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v66, CFSTR("Cannot query list of tables in Huffman database"));
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                      v17 = 1;
LABEL_52:

                      if (v17)
                        goto LABEL_82;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'"), CFSTR("columnCount"), v10, v11);
                      v26 = objc_claimAutoreleasedReturnValue();
                      v83[0] = 0;
                      objc_msgSend(v81, "runQuery:error:", v26, v83);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = v83[0];
                      v72 = v27;
                      v76 = (void *)v26;
                      if (!v27)
                        goto LABEL_59;
                      objc_msgSend(v27, "next");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v28)
                      {
                        v63 = v28;
                        objc_msgSend(v28, "objectForKey:", CFSTR("columnCount"));
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v29 && (v61 = v29, v30 = objc_msgSend(v29, "unsignedIntegerValue") == 1, v29 = v61, v30))
                        {
                          v31 = 0;
                        }
                        else
                        {
                          if (a4)
                          {
                            v33 = v29;
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v34);
                            *a4 = (id)objc_claimAutoreleasedReturnValue();

                            v29 = v33;
                          }
                          v31 = 1;
                        }

                        v32 = v67;
                      }
                      else
                      {
LABEL_59:
                        v32 = v67;
                        if (a4)
                        {
                          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v67, CFSTR("Cannot query list of columns in Huffman database table"));
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        v31 = 1;
                      }

                      if (v31)
                        goto LABEL_82;
                      v35 = v80;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'"), CFSTR("columnCount"), v10, v80);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "runQuery:error:");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v68 = 0;
                      v73 = v36;
                      if (!v36)
                        goto LABEL_74;
                      objc_msgSend(v36, "next");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v37)
                      {
                        v64 = v37;
                        objc_msgSend(v37, "objectForKey:", CFSTR("columnCount"));
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v38
                          && (v39 = v38, v30 = objc_msgSend(v38, "unsignedIntegerValue") == 1, v38 = v39, v35 = v80, v30))
                        {
                          v40 = 0;
                        }
                        else
                        {
                          if (a4)
                          {
                            v42 = v35;
                            v43 = v38;
                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v44);
                            *a4 = (id)objc_claimAutoreleasedReturnValue();

                            v38 = v43;
                          }
                          v40 = 1;
                        }

                        v41 = v68;
                      }
                      else
                      {
LABEL_74:
                        v41 = v68;
                        if (a4)
                        {
                          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v68, CFSTR("Cannot query list of columns in Huffman database table"));
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        v40 = 1;
                      }

                      if (v40)
                      {
LABEL_82:
                        v19 = 0;
                        v12 = v80;
                        v13 = v81;
                        goto LABEL_83;
                      }
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1"), v80, v10, v11, CFSTR("<ET>"));
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "runQuery:error:");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v78 = 0;
                      if (v46
                        && (objc_msgSend(v46, "next"), (v47 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        v48 = v47;
                        objc_msgSend(v47, "objectForKey:", v80);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();

                        v49 = 1;
                      }
                      else if (a4)
                      {
                        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v78, CFSTR("Cannot query end token in Huffman database table"));
                        v74 = 0;
                        v49 = 0;
                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v74 = 0;
                        v49 = 0;
                      }

                      if (!v49)
                      {
                        v19 = 0;
                        v12 = v80;
                        v13 = v81;
                        v24 = v82;
LABEL_111:

                        goto LABEL_84;
                      }
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1"), v80, v10, v11, CFSTR("<UT>"));
                      v70 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "runQuery:error:");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = 0;
                      if (v50
                        && (objc_msgSend(v50, "next"), (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                      {
                        v52 = v51;
                        objc_msgSend(v51, "objectForKey:", v80);
                        v79 = (void *)objc_claimAutoreleasedReturnValue();

                        v53 = 1;
                      }
                      else
                      {
                        if (a4)
                        {
                          v54 = v65;
                          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 101, v65, CFSTR("Cannot query unknown token in Huffman database table"));
                          v79 = 0;
                          v53 = 0;
                          *a4 = (id)objc_claimAutoreleasedReturnValue();
                          v55 = (void *)v70;
LABEL_104:

                          if (v53)
                          {
                            objc_msgSend(v6, "objectForKey:", CFSTR("exploreUnknownToken"));
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
                              v57 = objc_claimAutoreleasedReturnValue();

                              v56 = (void *)v57;
                            }
                            v58 = objc_alloc((Class)a1);
                            LOBYTE(v59) = objc_msgSend(v56, "BOOLValue");
                            v12 = v80;
                            v13 = v81;
                            v19 = (void *)objc_msgSend(v58, "initWithHuffmanEncoderDatabase:tableName:lookupColumnName:codeColumnName:unknownTokenBitString:endTokenBitString:exploreUnknownToken:", v81, v10, v11, v80, v79, v74, v59);

                          }
                          else
                          {
                            v19 = 0;
                            v12 = v80;
                            v13 = v81;
                          }
                          v24 = v82;

                          goto LABEL_111;
                        }
                        v79 = 0;
                        v53 = 0;
                      }
                      v54 = v65;
                      v55 = (void *)v70;
                      goto LABEL_104;
                    }
                    v17 = 1;
                  }
                  v23 = v66;
                  goto LABEL_52;
                }
                if (a4)
                {
                  goto LABEL_40;
                }
              }
              else if (a4)
              {
LABEL_40:
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v22);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              v19 = 0;
LABEL_85:

              goto LABEL_86;
            }
            if (a4)
            {
              goto LABEL_34;
            }
          }
          else if (a4)
          {
LABEL_34:
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v21);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v19 = 0;
LABEL_86:

          goto LABEL_87;
        }
        if (a4)
        {
          goto LABEL_28;
        }
      }
      else if (a4)
      {
LABEL_28:
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
LABEL_87:

      goto LABEL_88;
    }
    if (a4)
    {
      goto LABEL_24;
    }
  }
  else if (a4)
  {
LABEL_24:
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 101, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v19 = 0;
LABEL_88:

  return v19;
}

- (id)codeForToken:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[FedStatsCategoricalTypeHuffmanEncoder codeColumnName](self, "codeColumnName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalTypeHuffmanEncoder tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalTypeHuffmanEncoder lookupColumnName](self, "lookupColumnName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1"), v6, v7, v8, CFSTR("%@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FedStatsCategoricalTypeHuffmanEncoder huffmanDB](self, "huffmanDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "runQuery:error:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v12, "next"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    -[FedStatsCategoricalTypeHuffmanEncoder codeColumnName](self, "codeColumnName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FedStatsCategoricalTypeHuffmanEncoder unknownTokenBitString](self, "unknownTokenBitString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)preEncode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v5;
    v7 = v5;
    v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v36)
    {
      v8 = *(_QWORD *)v42;
      v9 = 0x24BDD1000uLL;
      v34 = v7;
      v35 = v6;
      v33 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[FedStatsCategoricalTypeHuffmanEncoder codeForToken:](self, "codeForToken:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FedStatsCategoricalTypeHuffmanEncoder unknownTokenBitString](self, "unknownTokenBitString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v12);

          if (v14)
          {
            objc_msgSend(*(id *)(v9 + 1992), "stringWithFormat:", CFSTR("%@"), v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[FedStatsCategoricalTypeHuffmanEncoder explorationTokenizer](self, "explorationTokenizer");
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16 && (v17 = (void *)v16, v18 = objc_msgSend(v15, "length"), v17, v18 != 1))
            {
              -[FedStatsCategoricalTypeHuffmanEncoder explorationTokenizer](self, "explorationTokenizer");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "tokenize:", v15);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v22 = v20;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v38;
                do
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v38 != v25)
                      objc_enumerationMutation(v22);
                    -[FedStatsCategoricalTypeHuffmanEncoder codeForToken:](self, "codeForToken:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v27);

                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                }
                while (v24);
              }

              objc_msgSend(v21, "componentsJoinedByString:", &stru_250C51910);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v35;
              objc_msgSend(v35, "addObject:", v28);

              v8 = v33;
              v7 = v34;
              v9 = 0x24BDD1000;
            }
            else
            {
              objc_msgSend(v6, "addObject:", v12);
            }

          }
          else
          {
            objc_msgSend(v6, "addObject:", v12);
          }

        }
        v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v36);
    }

    -[FedStatsCategoricalTypeHuffmanEncoder endTokenBitString](self, "endTokenBitString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v29);

    objc_msgSend(v6, "componentsJoinedByString:", &stru_250C51910);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v32;
  }
  else
  {
    v30 = 0;
  }

  return v30;
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
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing asset URL for '%@'"), v20);
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

- (FedStatsSQLiteDatabase)huffmanDB
{
  return self->_huffmanDB;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)lookupColumnName
{
  return self->_lookupColumnName;
}

- (NSString)codeColumnName
{
  return self->_codeColumnName;
}

- (NSString)unknownTokenBitString
{
  return self->_unknownTokenBitString;
}

- (NSString)endTokenBitString
{
  return self->_endTokenBitString;
}

- (FedStatsCategoricalTypeTokenizerProtocol)explorationTokenizer
{
  return self->_explorationTokenizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explorationTokenizer, 0);
  objc_storeStrong((id *)&self->_endTokenBitString, 0);
  objc_storeStrong((id *)&self->_unknownTokenBitString, 0);
  objc_storeStrong((id *)&self->_codeColumnName, 0);
  objc_storeStrong((id *)&self->_lookupColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_huffmanDB, 0);
}

@end
