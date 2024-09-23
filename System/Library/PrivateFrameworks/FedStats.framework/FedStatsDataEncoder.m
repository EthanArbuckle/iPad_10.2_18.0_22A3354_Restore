@implementation FedStatsDataEncoder

- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4
{
  id v7;
  id v8;
  FedStatsDataEncoder *v9;
  FedStatsDataEncoder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *typeConfiguration;
  FedStatsDataEncoder *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)FedStatsDataEncoder;
  v9 = -[FedStatsDataEncoder init](&v43, sel_init);
  v10 = v9;
  if (v9)
  {
    v32 = v9;
    objc_storeStrong((id *)&v9->_dataTypes, a3);
    objc_msgSend(v8, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCEF0];
    v33 = v7;
    objc_msgSend(v7, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v12;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v8, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "typesInCombination");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v36;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v36 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v15, "removeObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26++));
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v24);
          }

          objc_msgSend(v15, "removeObject:", v20);
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v17);
    }

    objc_msgSend(v15, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v10 = v32;
    typeConfiguration = v32->_typeConfiguration;
    v32->_typeConfiguration = (NSArray *)v29;

    v7 = v33;
  }

  return v10;
}

uint64_t __58__FedStatsDataEncoder_initWithDataTypes_combinationTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  objc_class *v41;
  id *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 100, CFSTR("Missing data type content"));
      v35 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    goto LABEL_43;
  }
  v41 = (objc_class *)a1;
  v42 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v43 = v7;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v56;
  v12 = 0x250C50000uLL;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v56 != v11)
        objc_enumerationMutation(v8);
      v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v8, "objectForKey:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("dataType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v36 = v42;
        if (v42)
        {
          v46 = v15;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing data type specifier key \"%@\"), CFSTR("dataType"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v37 = 100;
LABEL_35:
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v37, v22);
          *v36 = (id)objc_claimAutoreleasedReturnValue();
          v34 = v48;
          goto LABEL_41;
        }
LABEL_36:
        v35 = 0;
LABEL_37:
        v7 = v43;
        v34 = v48;
        goto LABEL_42;
      }
      v17 = objc_msgSend(*(id *)(v12 + 4088), "dataTypeFromString:", v16);
      if (v17 != 99)
      {
        v46 = v15;
        if (v17 != -1)
        {
          v18 = v8;
          v19 = v12;
          v20 = *(void **)(v12 + 4088);
          v54 = 0;
          objc_msgSend(v20, "createFedStatsDataType:dataTypeParams:possibleError:", v16, v15, &v54);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v54;
          if (v21)
          {
            objc_msgSend(v48, "setValue:forKey:", v21, v14);

            v12 = v19;
            v8 = v18;
            v15 = v46;
            goto LABEL_14;
          }
          if (v42)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create data type \"%@\"), v14);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v22, v39);
            *v42 = (id)objc_claimAutoreleasedReturnValue();

          }
          v34 = v48;
          v8 = v18;
LABEL_41:

          v35 = 0;
          v15 = v46;
          goto LABEL_42;
        }
        v36 = v42;
        if (v42)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not supported"), v16);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v37 = 101;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      objc_msgSend(v44, "addObject:", v14);
LABEL_14:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v15 = v44;
  v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v23)
  {
    v24 = v23;
    v45 = *(_QWORD *)v51;
    while (2)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v15);
        v26 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v8, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dictionaryWithDictionary:", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[FedStatsCombinationType kAvailableTypes](FedStatsCombinationType, "kAvailableTypes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v29;
        v60 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addEntriesFromDictionary:", v30);

        v49 = 0;
        +[FedStatsCombinationType createFromDict:possibleError:](FedStatsCombinationType, "createFromDict:possibleError:", v16, &v49);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v49;
        if (!v31)
        {
          if (v42)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not create data type \"%@\"), v26);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v32, v38);
            *v42 = (id)objc_claimAutoreleasedReturnValue();

          }
          v35 = 0;
          v8 = v47;
          goto LABEL_37;
        }
        objc_msgSend(v47, "setValue:forKey:", v31, v26);
        objc_msgSend(v48, "setValue:forKey:", v31, v26);

      }
      v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v24)
        continue;
      break;
    }
  }

  v33 = [v41 alloc];
  v34 = v48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v48);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v47);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "initWithDataTypes:combinationTypes:", v15, v16);
  v7 = v43;
LABEL_42:

LABEL_43:
  return v35;
}

- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v26);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v25 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v11, "dataType") == 99)
    {
      v30 = a5;
      v29 = v11;
      objc_msgSend(v29, "typesInCombination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setValue:forKey:", v20, v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v16);
      }

      v21 = (void *)objc_msgSend(v13, "copy");
      v32 = 0;
      v22 = v29;
      objc_msgSend(v29, "encodeToIndex:possibleError:", v21, &v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;

      a5 = v30;
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v11, "encodeToIndex:possibleError:", v22, &v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31;
    }

    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v11, "classCount"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsDataEncoderDimensionalResult resultWithIndex:dimensionality:](FedStatsDataEncoderDimensionalResult, "resultWithIndex:dimensionality:", v23, v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a5)
      {
        v25 = 0;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot encode data to \"%@\"), v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v24, v27);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_25:

  return v25;
}

- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v11, "dataType") == 99)
      {
        v27 = a5;
        v26 = v11;
        objc_msgSend(v26, "typesInCombination");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setValue:forKey:", v20, v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v16);
        }

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "encodeToOneHotVector:possibleError:", v21, v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v8, "objectForKey:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "encodeToOneHotVector:possibleError:", v24, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = 0;
    }

  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "decodeFromOneHotVector:possibleError:", v8, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v12 = 0;
    }

  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  if (v31)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[FedStatsDataEncoder dataTypes](self, "dataTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v14, "classCount");

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v8);

      if (v9 > 0x186A0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Resulting dimensionality %lu is larger than max dimensionality %lu"), v9, 100000);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v15);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v33;
      while (2)
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v18);
          v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23);
          -[FedStatsDataEncoder encodeToBitVector:withType:possibleError:](self, "encodeToBitVector:withType:possibleError:", v31, v25, a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            if (a4)
            {
              v26 = objc_msgSend(*a4, "code");
              v27 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(*a4, "localizedDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", CFSTR("Error encoding \"%@\" type: %@"), v25, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v26, v29);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v16 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v17, "appendData:", v21);
          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v20)
          continue;
        break;
      }

    }
    v16 = v17;
LABEL_29:

  }
  else
  {
    if (!a4)
    {
LABEL_14:
      v16 = 0;
      goto LABEL_30;
    }
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_30:

  return v16;
}

- (id)encodeToIndex:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 1)
  {
    if (a4)
    {
      v23 = CFSTR("This API is only available for single type in encoding schema");
      v24 = 900;
LABEL_19:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v24, v23);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_23:
    v20 = 0;
    goto LABEL_27;
  }
  if (!v6)
  {
    if (a4)
    {
      v23 = CFSTR("Provided data is empty");
      v24 = 401;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  v31 = a4;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[FedStatsDataEncoder dataTypes](self, "dataTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[FedStatsDataEncoder dataTypes](self, "dataTypes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "dataType") == 99)
        {

        }
        else
        {
          objc_msgSend(v6, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            if (v31)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided data does not contain a value for \"%@\"), v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v25);
              *v31 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_23;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  -[FedStatsDataEncoder encodeToIndex:withType:error:](self, "encodeToIndex:withType:error:", v6, v19, &v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v32;

  if (v20)
  {
    v22 = v20;
  }
  else if (v31)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Cannot encode data to \"%@\"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v21, v29);
    *v31 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:

  return v20;
}

- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v6 = (void *)MEMORY[0x24BDBCED8];
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v25)
  {
    v8 = 0;
    v24 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      v10 = a4;
      if (*(_QWORD *)v29 != v24)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9);
      -[FedStatsDataEncoder dataTypes](self, "dataTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "classCount");
      objc_msgSend(v26, "subdataWithRange:", v8, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      -[FedStatsDataEncoder decodeFromBitVector:withType:possibleError:](self, "decodeFromBitVector:withType:possibleError:", v15, v11, &v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (v16)
        break;
      if (!v10)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The decoder for \"%@\" failed"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = v10;
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 500, v17, v18);
      *v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
      if (!v16)
      {

        v20 = 0;
        v19 = v23;
        goto LABEL_19;
      }
      if (v25 == ++v9)
      {
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v25)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v23, "addEntriesFromDictionary:", v16);
    else
      objc_msgSend(v23, "setValue:forKey:", v16, v11);
    v8 += v14;
LABEL_13:
    a4 = v10;
    goto LABEL_14;
  }
LABEL_17:

  v19 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v20;
}

+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  NSObject *v41;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  _BYTE v57[7];
  id v58;
  char v59;
  _BYTE v60[15];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  uint8_t buf[4];
  uint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    if (a6)
    {
      v24 = CFSTR("encodeDataArray missing data type content");
LABEL_22:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, v24);
      v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
LABEL_23:
    v25 = 0;
    goto LABEL_53;
  }
  if (!v9)
  {
    if (a6)
    {
      v24 = CFSTR("encodeDataArray missing data array");
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v70 = 0;
  +[FedStatsDataEncoder createWithDataTypeContent:possibleError:](FedStatsDataEncoder, "createWithDataTypeContent:possibleError:", v10, &v70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v70;
  v13 = v12;
  if (v11)
  {
    v43 = v12;
    v44 = v10;
    +[FedStatsDataSampler samplerWithCount:](FedStatsDataSampler, "samplerWithCount:", 20);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v45 = v9;
    if (v15 < 2)
    {
      *a5 = 1;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v26 = v9;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v62;
        v47 = v26;
        v48 = v11;
        v46 = *(_QWORD *)v62;
        do
        {
          v30 = 0;
          v49 = v28;
          do
          {
            if (*(_QWORD *)v62 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v30);
            if (v31)
            {
              v58 = 0;
              objc_msgSend(v11, "encodeToIndex:error:", v31, &v58);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v58;
              if (v32)
              {
                objc_msgSend(v50, "addItem:", v32);
              }
              else
              {
                +[FedStatsLog logger](FedStatsLog, "logger");
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.3(&v56, v57);

                v54 = 0u;
                v55 = 0u;
                v52 = 0u;
                v53 = 0u;
                v51 = v33;
                -[NSObject describe](v33, "describe");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
                if (v36)
                {
                  v37 = v36;
                  v38 = *(_QWORD *)v53;
                  do
                  {
                    for (i = 0; i != v37; ++i)
                    {
                      if (*(_QWORD *)v53 != v38)
                        objc_enumerationMutation(v35);
                      v40 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                      +[FedStatsLog logger](FedStatsLog, "logger");
                      v41 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v72 = v40;
                        _os_log_debug_impl(&dword_23B40B000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                    }
                    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v52, v73, 16);
                  }
                  while (v37);
                }

                v26 = v47;
                v11 = v48;
                v29 = v46;
                v28 = v49;
                v32 = 0;
                v33 = v51;
              }

            }
            else
            {
              +[FedStatsLog logger](FedStatsLog, "logger");
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.2(&v59, v60);
            }

            ++v30;
          }
          while (v30 != v28);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        }
        while (v28);
      }
    }
    else
    {
      *a5 = 2;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v67 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
            v65 = 0;
            objc_msgSend(v11, "encodeToBitVector:possibleError:", v21, &v65);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v50, "addItem:", v22);
            }
            else
            {
              +[FedStatsLog logger](FedStatsLog, "logger");
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.1(buf, &buf[1]);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
        }
        while (v18);
      }
    }
    v9 = v45;

    objc_msgSend(v50, "getResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v43;
    v10 = v44;
  }
  else if (a6)
  {
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v12, CFSTR("encodeDataArray encoder construction failed"));
    v25 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

LABEL_53:
  return v25;
}

+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  __objc2_class **v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint8_t buf[4];
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;
  _QWORD v90[4];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "length");
    if (v16 >= objc_msgSend(CFSTR("fedstats:"), "length")
      && (objc_msgSend(v15, "substringToIndex:", objc_msgSend(CFSTR("fedstats:"), "length")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("fedstats:")),
          v17,
          (v18 & 1) != 0))
    {
      v19 = v15;
    }
    else
    {
      objc_msgSend(CFSTR("fedstats:"), "stringByAppendingString:", v15);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    v21 = off_250C51000;
    +[FedStatsLog logger](FedStatsLog, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.5();

    v81 = 0;
    v82 = 0;
    +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](FedStatsDataEncoder, "encodeDataArray:dataTypeContent:resultType:errorOut:", v11, v12, &v82, &v81);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v81;
    if (!v23)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v24, CFSTR("encodeDataArrayAndRecord failed at encoding"));
        v30 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_69;
    }
    +[FedStatsLog logger](FedStatsLog, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.4(v23, v25);

    +[FedStatsLog logger](FedStatsLog, "logger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.3(v26, v27, v28);

    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2CBA0]), "initWithKey:", v20);
    if (!v72)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 600, CFSTR("encodeDataArrayAndRecord failed at recorder allocation"));
        v30 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_68;
    }
    if (objc_msgSend(v13, "count"))
    {
      v29 = v13;
    }
    else
    {
      v89 = *MEMORY[0x24BE2CBF0];
      v90[0] = &stru_250C51910;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v71 = v29;
    if (objc_msgSend(v23, "count"))
    {
      if (v82 == 1)
      {
        v63 = v24;
        v68 = v11;
        v69 = v20;
        v65 = v15;
        v66 = v13;
        v67 = v12;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v64 = v23;
        v33 = v23;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v78 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v38, "dimensionality");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
              {
                objc_msgSend(v38, "index");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "arrayByAddingObject:", v41);
              }
              else
              {
                v42 = (void *)MEMORY[0x24BDBCE30];
                objc_msgSend(v38, "index");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "arrayWithObject:", v41);
              }
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "dimensionality");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKey:", v43, v44);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
          }
          while (v35);
        }

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v45 = v32;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
        if (v46)
        {
          v47 = v46;
          v70 = 0;
          v48 = *(_QWORD *)v74;
          v49 = *MEMORY[0x24BE2CBC8];
          v50 = *MEMORY[0x24BE2CBD0];
          v21 = off_250C51000;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v74 != v48)
                objc_enumerationMutation(v45);
              v52 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
              -[__objc2_class logger](v21[2], "logger");
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v86 = v52;
                _os_log_debug_impl(&dword_23B40B000, v53, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord recording with dimension = \"%@\", buf, 0xCu);
              }

              v54 = (void *)objc_msgSend(v71, "mutableCopy");
              v83 = v49;
              v84 = v52;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "setObject:forKey:", v55, v50);

              objc_msgSend(v45, "objectForKey:", v52);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v72, "record:metadata:", v56, v54);

              if ((v57 & 1) != 0)
              {
                objc_msgSend(v45, "objectForKey:", v52);
                v58 = objc_claimAutoreleasedReturnValue();
                v70 += -[NSObject count](v58, "count");
                v21 = off_250C51000;
              }
              else
              {
                v21 = off_250C51000;
                +[FedStatsLog logger](FedStatsLog, "logger");
                v58 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v86 = v69;
                  _os_log_debug_impl(&dword_23B40B000, v58, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record numbers for key '%@'", buf, 0xCu);
                }
              }

            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
          }
          while (v47);
        }
        else
        {
          v70 = 0;
          v21 = off_250C51000;
        }

        v12 = v67;
        v11 = v68;
        v15 = v65;
        v13 = v66;
        v20 = v69;
        v24 = v63;
        v23 = v64;
        v31 = v70;
        goto LABEL_64;
      }
      if (v82 != 2)
      {
        if (a7)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported result type \"%lu\" in data encoder"), v82);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v59);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        v30 = 0;
        goto LABEL_67;
      }
      if ((objc_msgSend(v72, "recordBitVectors:metadata:", v23, v71) & 1) != 0)
      {
        v31 = objc_msgSend(v23, "count");
LABEL_64:
        -[__objc2_class logger](v21[2], "logger");
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.1();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_67:

LABEL_68:
LABEL_69:

        goto LABEL_70;
      }
      +[FedStatsLog logger](FedStatsLog, "logger");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.2();

    }
    v31 = 0;
    goto LABEL_64;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, CFSTR("encodeDataArrayAndRecord missing collection ID key"));
    v30 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
  }
LABEL_70:

  return v30;
}

+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v16, v14, v13, v12, a7, v19, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  return +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", a3, a4, MEMORY[0x24BDBD1B8], a5, a6);
}

+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v13, v11, v10, a6, v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  id *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  const __CFString *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id *v80;
  const __CFString *v81;
  uint64_t v82;
  id v83;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  id obj;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[2];
  _QWORD v123[2];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v15 = v11;
  v98 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
  if (v98)
  {
    v97 = *(_QWORD *)v119;
    v16 = 0x250C50000;
    v86 = v15;
    v92 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v119 != v97)
          objc_enumerationMutation(v15);
        v101 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v17);
        objc_msgSend(v15, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");

        objc_msgSend(v20, "objectForKey:", CFSTR("dataType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = +[FedStatsDataTypeFactory dataTypeFromString:](FedStatsDataTypeFactory, "dataTypeFromString:", v21);

        if (v22 != 3)
        {
          objc_msgSend(v15, "objectForKey:", v18);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v35, v18);

          goto LABEL_121;
        }
        v93 = v18;
        objc_msgSend(v20, "objectForKey:", CFSTR("categoryFile"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v20;
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v117 = 0;
            +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:requiredForCollectionKey:error:](FedStatsCategoricalTypeAssetSpecifier, "assetSpecifierWithKey:requiredForCollectionKey:error:", v23, 0, &v117);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v117;
            v38 = v37;
            v100 = v36;
            if (v36)
            {
              if (v12)
              {
                v116 = v37;
                objc_msgSend(v36, "assetSpecifierValueForDataPoint:error:", v12, &v116);
                v39 = objc_claimAutoreleasedReturnValue();
                v24 = v116;

                v27 = (void *)v39;
                if (v39)
                {
                  if (v13)
                  {
                    objc_msgSend(v13, "objectForKey:", v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v40)
                    {
                      v95 = v24;
                      v88 = v23;
                      objc_msgSend(v20, "setObject:forKey:", v40, CFSTR("categoryFile"));
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v20);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v92, "setObject:forKey:", v41, v93);
                      v42 = 3;
                      goto LABEL_42;
                    }
                    if (a8)
                    {
                      v95 = v24;
                      v88 = v23;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No URL found for asset name '%@'"), v39);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, v41);
                      *a8 = (id)objc_claimAutoreleasedReturnValue();
                      v42 = 1;
LABEL_42:

                      v23 = v88;
                      v24 = v95;
                    }
                    else
                    {
                      v42 = 1;
                    }

LABEL_44:
                    v27 = (void *)v39;
                  }
                  else
                  {
                    if (a7)
                    {
                      objc_msgSend(*a7, "arrayByAddingObject:", v39);
                      *a7 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v42 = 3;
                    v16 = 0x250C50000;
                  }
                }
                else
                {
                  if (a8)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v23);
                    v89 = v23;
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = 0;
                    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 400, v24, v46);
                    *a8 = (id)objc_claimAutoreleasedReturnValue();

                    v23 = v89;
                  }
                  v42 = 1;
                }
LABEL_45:
                v14 = v92;
                goto LABEL_118;
              }
              if (!a6)
              {
                v42 = 3;
                goto LABEL_119;
              }
              v43 = v23;
              v44 = *a6;
              objc_msgSend(v100, "parameters");
              v39 = objc_claimAutoreleasedReturnValue();
              v45 = v44;
              v23 = v43;
              objc_msgSend(v45, "arrayByAddingObjectsFromArray:", v39);
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              v42 = 3;
            }
            else
            {
              if (!a8)
              {
                v42 = 1;
                goto LABEL_119;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v23);
              v39 = objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 400, v38, v39);
              *a8 = (id)objc_claimAutoreleasedReturnValue();
              v42 = 1;
            }
            v24 = v38;
            goto LABEL_44;
          }
        }
        objc_msgSend(v20, "objectForKey:", CFSTR("prefixSize"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v94 = v24;
        if (!v24)
          goto LABEL_59;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v24, "unsignedIntegerValue"))
          goto LABEL_59;
        objc_msgSend(v20, "objectForKey:", CFSTR("prefixTreeParameters"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "mutableCopy");

        v100 = v26;
        objc_msgSend(v26, "objectForKey:", CFSTR("fileName"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v115 = 0;
            +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:requiredForCollectionKey:error:](FedStatsCategoricalTypeAssetSpecifier, "assetSpecifierWithKey:requiredForCollectionKey:error:", v27, 0, &v115);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v115;
            v30 = v29;
            if (!v28)
            {
              v24 = v94;
              if (a8)
              {
                v102 = v27;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v27);
                v47 = objc_claimAutoreleasedReturnValue();
                +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 400, v30, v47);
                *a8 = (id)objc_claimAutoreleasedReturnValue();
                v31 = (void *)v47;
                v28 = 0;
                v32 = v30;
                goto LABEL_147;
              }
              goto LABEL_148;
            }
            v24 = v94;
            if (v12)
            {
              v102 = v27;
              v114 = v29;
              objc_msgSend(v28, "assetSpecifierValueForDataPoint:error:", v12, &v114);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v114;

              if (!v31)
              {
                if (a8)
                {
                  v87 = v23;
                  v49 = v12;
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot process asset specifier '%@'"), v102);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 400, v32, v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_145;
                }
LABEL_147:

                v30 = v32;
                v27 = v102;
LABEL_148:

                v42 = 1;
                v15 = v86;
                goto LABEL_45;
              }
              if (v13)
              {
                v87 = v23;
                objc_msgSend(v13, "objectForKey:", v31);
                v33 = objc_claimAutoreleasedReturnValue();
                if (!v33)
                {
                  if (a8)
                  {
                    v49 = v12;
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No URL found for asset name '%@'"), v31);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, v50);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_145:
                    *a8 = v51;

                    v12 = v49;
                    v16 = 0x250C50000;
                  }
                  v23 = v87;
                  goto LABEL_147;
                }
                v34 = (void *)v33;
                objc_msgSend(v100, "setObject:forKey:", v33, CFSTR("fileName"));
                objc_msgSend(v99, "setObject:forKey:", v100, CFSTR("prefixTreeParameters"));

                v30 = v32;
                v23 = v87;
              }
              else
              {
                if (a7)
                {
                  objc_msgSend(*a7, "arrayByAddingObject:", v31);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
                v30 = v32;
                v16 = 0x250C50000uLL;
              }
LABEL_56:

              v20 = v99;
              v27 = v102;
            }
            else if (a6)
            {
              v102 = v27;
              v48 = *a6;
              objc_msgSend(v28, "parameters");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "arrayByAddingObjectsFromArray:", v31);
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_56;
            }

            v15 = v86;
          }
        }

        v24 = v94;
LABEL_59:
        objc_msgSend(v20, "objectForKey:", CFSTR("filters"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v100)
          goto LABEL_81;
        v90 = v23;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v100, "count"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        obj = v100;
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
        if (!v52)
          goto LABEL_80;
        v53 = v52;
        v106 = *(_QWORD *)v111;
        while (2)
        {
          for (i = 0; i != v53; ++i)
          {
            if (*(_QWORD *)v111 != v106)
              objc_enumerationMutation(obj);
            v55 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            objc_msgSend(v55, "objectForKey:", CFSTR("filterParameters"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectForKey:", CFSTR("filterVariant"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
              v58 = v56 == 0;
            else
              v58 = 1;
            if (!v58)
            {
              v59 = *(void **)(v16 + 3992);
              if (v12)
              {
                if (v13)
                {
                  v60 = a6;
                  v109 = 0;
                  objc_msgSend(v59, "forVariant:mutateParameters:usingFieldValues:assetURLs:error:", v57, v56, v12, v13, &v109);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = v109;
                  if (!v61)
                  {
                    if (a8)
                    {
                      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 900, v62, CFSTR("Cannot modify specifiers with field values in filter variant"));
                      *a8 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    a6 = v60;
                    v16 = 0x250C50000;
                    v24 = v94;
                    v27 = v103;
                    goto LABEL_97;
                  }
                  v122[0] = CFSTR("filterVariant");
                  v122[1] = CFSTR("filterParameters");
                  v123[0] = v57;
                  v123[1] = v61;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
                  v63 = v13;
                  v64 = v12;
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "addObject:", v65);

                  v12 = v64;
                  v13 = v63;

                  a6 = v60;
                  v16 = 0x250C50000;
                }
                else
                {
                  objc_msgSend(v59, "forVariant:assetNamesInParameters:usingFieldValues:", v57, v56, v12);
                  v67 = objc_claimAutoreleasedReturnValue();
                  if (!v67)
                  {
                    v24 = v94;
                    v27 = v103;
                    if (a8)
                    {
                      v71 = CFSTR("Cannot extract asset names using field values from filter parameters");
LABEL_96:
                      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v71);
                      *a8 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    goto LABEL_97;
                  }
                  v62 = (id)v67;
                  objc_msgSend(*a7, "arrayByAddingObjectsFromArray:", v67);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
              else
              {
                objc_msgSend(v59, "forVariant:requiredFieldsInParameters:", v57, v56);
                v66 = objc_claimAutoreleasedReturnValue();
                if (!v66)
                {
                  v24 = v94;
                  v27 = v103;
                  if (a8)
                  {
                    v71 = CFSTR("Cannot extract required fields from filter parameters");
                    goto LABEL_96;
                  }
LABEL_97:

                  v42 = 1;
                  v15 = v86;
                  v23 = v90;
                  v14 = v92;
                  goto LABEL_117;
                }
                v62 = (id)v66;
                objc_msgSend(*a6, "arrayByAddingObjectsFromArray:", v66);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

            }
          }
          v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
          if (v53)
            continue;
          break;
        }
LABEL_80:

        v20 = v99;
        objc_msgSend(v99, "setObject:forKey:", v103, CFSTR("filters"));

        v15 = v86;
        v23 = v90;
        v24 = v94;
LABEL_81:
        objc_msgSend(v20, "objectForKey:", CFSTR("tokenizerVariant"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_102;
        objc_msgSend(v20, "objectForKey:", CFSTR("tokenizerParameters"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        if (!obj)
          goto LABEL_101;
        if (!v12)
        {
          v68 = v27;
          +[FedStatsCategoricalTypeTokenizerFactory forVariant:requiredFieldsInParameters:](FedStatsCategoricalTypeTokenizerFactory, "forVariant:requiredFieldsInParameters:", v27, obj);
          v72 = objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            v70 = (id)v72;
            objc_msgSend(*a6, "arrayByAddingObjectsFromArray:", v72);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_100;
          }
          v80 = a8;
          if (a8)
          {
            v81 = CFSTR("Cannot extract required fields from tokenizer parameters");
            goto LABEL_136;
          }
LABEL_137:
          v42 = 1;
          goto LABEL_138;
        }
        if (!v13)
        {
          v68 = v27;
          +[FedStatsCategoricalTypeTokenizerFactory forVariant:assetNamesInParameters:usingFieldValues:](FedStatsCategoricalTypeTokenizerFactory, "forVariant:assetNamesInParameters:usingFieldValues:", v27, obj, v12);
          v73 = objc_claimAutoreleasedReturnValue();
          if (!v73)
          {
            v80 = a8;
            if (a8)
            {
              v81 = CFSTR("Cannot extract asset names using field values from tokenizer parameters");
LABEL_136:
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v81);
              *v80 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_137;
          }
          v70 = (id)v73;
          objc_msgSend(*a7, "arrayByAddingObjectsFromArray:", v73);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          v16 = 0x250C50000;
LABEL_100:

          v27 = v68;
LABEL_101:

LABEL_102:
          objc_msgSend(v20, "objectForKey:", CFSTR("preEncodingVariant"));
          obj = (id)objc_claimAutoreleasedReturnValue();
          if (obj)
          {
            objc_msgSend(v20, "objectForKey:", CFSTR("preEncodingParameters"));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74)
            {
              v104 = v27;
              if (v12)
              {
                if (v13)
                {
                  v75 = v23;
                  v107 = 0;
                  +[FedStatsCategoricalTypePreEncoderFactory forVariant:mutateParameters:usingFieldValues:assetURLs:error:](FedStatsCategoricalTypePreEncoderFactory, "forVariant:mutateParameters:usingFieldValues:assetURLs:error:", obj, v74, v12, v13, &v107);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = v107;
                  if (v76)
                  {
                    objc_msgSend(v20, "setObject:forKey:", v76, CFSTR("preEncodingParameters"));

                    v23 = v75;
                    v24 = v94;
                    goto LABEL_112;
                  }
                  if (a8)
                  {
                    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 900, v77, CFSTR("Cannot modify specifiers with field values in pre-encoder variant"));
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  v42 = 1;
                  v23 = v75;
                  v24 = v94;
LABEL_142:
                  v27 = v104;
LABEL_115:

                  v15 = v86;
                  goto LABEL_116;
                }
                +[FedStatsCategoricalTypePreEncoderFactory forVariant:assetNamesInParameters:usingFieldValues:](FedStatsCategoricalTypePreEncoderFactory, "forVariant:assetNamesInParameters:usingFieldValues:", obj, v74, v12);
                v79 = objc_claimAutoreleasedReturnValue();
                if (!v79)
                {
                  if (a8)
                  {
                    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("Cannot extract asset names using field values from pre-encoding parameters"));
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v42 = 1;
                  goto LABEL_142;
                }
                v77 = (id)v79;
                objc_msgSend(*a7, "arrayByAddingObjectsFromArray:", v79);
                *a7 = (id)objc_claimAutoreleasedReturnValue();
                v16 = 0x250C50000;
              }
              else
              {
                +[FedStatsCategoricalTypePreEncoderFactory forVariant:requiredFieldsInParameters:](FedStatsCategoricalTypePreEncoderFactory, "forVariant:requiredFieldsInParameters:", obj, v74);
                v78 = objc_claimAutoreleasedReturnValue();
                if (!v78)
                {
                  if (a8)
                  {
                    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("Cannot extract required fields from pre-encoding parameters"));
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v42 = 1;
                  goto LABEL_115;
                }
                v77 = (id)v78;
                objc_msgSend(*a6, "arrayByAddingObjectsFromArray:", v78);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_112:

              v27 = v104;
            }

          }
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v20);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setObject:forKey:", v74, v93);
          v42 = 0;
          goto LABEL_115;
        }
        v91 = v23;
        v108 = 0;
        v68 = v27;
        +[FedStatsCategoricalTypeTokenizerFactory forVariant:mutateParameters:usingFieldValues:assetURLs:error:](FedStatsCategoricalTypeTokenizerFactory, "forVariant:mutateParameters:usingFieldValues:assetURLs:error:", v27, obj, v12, v13, &v108);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v108;
        if (v69)
        {
          objc_msgSend(v20, "setObject:forKey:", v69, CFSTR("tokenizerParameters"));

          v23 = v91;
          v24 = v94;
          goto LABEL_100;
        }
        if (a8)
        {
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 900, v70, CFSTR("Cannot modify specifiers with field values in tokenizer variant"));
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }

        v42 = 1;
        v23 = v91;
        v24 = v94;
LABEL_138:
        v27 = v68;
LABEL_116:
        v14 = v92;
LABEL_117:

LABEL_118:
        v38 = v24;
LABEL_119:

        if (v42 != 3 && v42)
        {

          v83 = 0;
          goto LABEL_152;
        }
LABEL_121:
        v17 = v101 + 1;
      }
      while (v101 + 1 != v98);
      v82 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
      v98 = v82;
    }
    while (v82);
  }

  v83 = v14;
LABEL_152:

  return v83;
}

+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 error:(id *)a6
{
  return +[FedStatsDataEncoder mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:](FedStatsDataEncoder, "mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:", a3, a4, a5, 0, 0, 0);
}

+ (id)extractAssetNamesFrom:(id)a3 usingFieldValues:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v10 = (id)MEMORY[0x24BDBD1A8];
  v4 = +[FedStatsDataEncoder mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:](FedStatsDataEncoder, "mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:", a3, a4, 0, 0, &v10, 0);
  v5 = v10;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)extractRequiredFieldsFrom:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  v9 = (id)MEMORY[0x24BDBD1A8];
  v3 = +[FedStatsDataEncoder mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:](FedStatsDataEncoder, "mutateDataTypeContent:usingFieldValues:assetURLs:requiredFields:assetNames:error:", a3, 0, 0, &v9, 0, 0);
  v4 = v9;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_dataTypes, a3);
}

- (NSArray)typeConfiguration
{
  return self->_typeConfiguration;
}

- (void)setTypeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_typeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeConfiguration, 0);
  objc_storeStrong((id *)&self->_dataTypes, 0);
}

+ (void)encodeDataArray:(_BYTE *)a1 dataTypeContent:(_BYTE *)a2 resultType:errorOut:.cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_23B40B000, v2, (uint64_t)v2, "Cannot process data point, skipping...", v3);
}

+ (void)encodeDataArray:(_BYTE *)a1 dataTypeContent:(_BYTE *)a2 resultType:errorOut:.cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_23B40B000, v2, (uint64_t)v2, "Non-dictionary or nil in the input, skipping...", v3);
}

+ (void)encodeDataArray:(_BYTE *)a1 dataTypeContent:(_BYTE *)a2 resultType:errorOut:.cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1(&dword_23B40B000, v2, (uint64_t)v2, "Cannot encode a data point, skipping. Encountered error:", v3);
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23B40B000, v0, v1, "Recorded %lu data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23B40B000, v0, v1, "encodeDataArrayAndRecord failed to record bit vectors for key '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)encodeDataArrayAndRecord:(uint64_t)a3 dataTypeContent:metadata:baseKey:errorOut:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1(&dword_23B40B000, a1, a3, "encodeDataArrayAndRecord encoded data array, recording", v3);
}

+ (void)encodeDataArrayAndRecord:(void *)a1 dataTypeContent:(NSObject *)a2 metadata:baseKey:errorOut:.cold.4(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23B40B000, a2, OS_LOG_TYPE_DEBUG, "Encoded %lu data", v3, 0xCu);
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23B40B000, v0, v1, "encodeDataArrayAndRecord with baseKey = \"%@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
