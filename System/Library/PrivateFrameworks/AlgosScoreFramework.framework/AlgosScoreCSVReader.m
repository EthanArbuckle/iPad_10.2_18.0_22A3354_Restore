@implementation AlgosScoreCSVReader

+ (id)csvReader:(id)a3 header:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  AlgosScoreCSVReader *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[AlgosScoreCSVReader initWithFileName:header:]([AlgosScoreCSVReader alloc], "initWithFileName:header:", v5, v4);

  return v6;
}

- (id)stripAndQuoteString:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = a3;
  v4 = &stru_24C3CB9B8;
  if ((objc_msgSend(v3, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\S+|\".*\"), 1, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if (!v11)
    {
      objc_msgSend(v5, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = objc_msgSend(v6, "range");
        objc_msgSend(v3, "substringWithRange:", v8, v9);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
  }

  return v4;
}

- (id)fixStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(v6);
        -[AlgosScoreCSVReader stripAndQuoteString:](self, "stripAndQuoteString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)parseFile:(id)a3 header:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  AlgosScoreCSVReader *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v43 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, &v43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v43;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v28 = v6;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      v13 = 1;
      v33 = self;
      v32 = v4;
      v30 = v9;
      v31 = v8;
      v29 = *(_QWORD *)v40;
      do
      {
        v14 = 0;
        v34 = v11;
        do
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
          {
            if ((v13 & v4) == 1)
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[AlgosScoreCSVReader fixStrings:](self, "fixStrings:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
              if (v19)
              {
                v20 = v19;
                v21 = 0;
                v22 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v36 != v22)
                      objc_enumerationMutation(v18);
                    v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21 + i);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "setObject:forKey:", v25, v24);

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
                  v21 += i;
                }
                while (v20);
              }

              self = v33;
              -[AlgosScoreCSVReader setHeadings:](v33, "setHeadings:", v16);
              v4 = v32;
              v9 = v30;
              v8 = v31;
              v12 = v29;
            }
            else
            {
              objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[AlgosScoreCSVReader fixStrings:](self, "fixStrings:", v16);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v26);

            }
            v13 = 0;
            v11 = v34;
          }
          ++v14;
        }
        while (v14 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v11);
    }
    -[AlgosScoreCSVReader setRows:](self, "setRows:", v8);

    v6 = v28;
    v7 = 0;
  }

  return v7;
}

- (AlgosScoreCSVReader)initWithFileName:(id)a3 header:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  AlgosScoreCSVReader *v7;
  AlgosScoreCSVReader *v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AlgosScoreCSVReader;
  v7 = -[AlgosScoreCSVReader init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AlgosScoreCSVReader parseFile:header:](v7, "parseFile:header:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AlgosScoreCSVReader setError:](v8, "setError:", v9);

  }
  return v8;
}

- (id)atRow:(id)a3 col:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  v7 = a4;
  -[AlgosScoreCSVReader headings](self, "headings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "integerValue"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24C3CB9B8;
  }

  return v10;
}

- (id)atRowIndex:(int64_t)a3 col:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[AlgosScoreCSVReader headings](self, "headings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  -[AlgosScoreCSVReader rows](self, "rows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)doubleAtRow:(id)a3 col:(id)a4 defaultValue:(double)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;

  v8 = a3;
  v9 = a4;
  -[AlgosScoreCSVReader atRow:col:](self, "atRow:col:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
  {
    objc_msgSend(v10, "doubleValue");
    a5 = v11;
  }

  return a5;
}

- (double)doubleAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(double)a5
{
  id v7;
  void *v8;
  double v9;

  v7 = a3;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
  {
    objc_msgSend(v8, "doubleValue");
    a5 = v9;
  }

  return a5;
}

- (int64_t)intAtRow:(id)a3 col:(id)a4 defaultValue:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[AlgosScoreCSVReader atRow:col:](self, "atRow:col:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
    a5 = objc_msgSend(v10, "longLongValue");

  return a5;
}

- (int64_t)intAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", &stru_24C3CB9B8) & 1) == 0)
    a5 = objc_msgSend(v8, "longLongValue");

  return a5;
}

- (void)sortOnColumnIndex:(int64_t)a3 ascending:(BOOL)a4
{
  id v6;
  _QWORD v7[5];
  BOOL v8;

  -[AlgosScoreCSVReader rows](self, "rows");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__AlgosScoreCSVReader_sortOnColumnIndex_ascending___block_invoke;
  v7[3] = &__block_descriptor_41_e11_q24__0_8_16l;
  v8 = a4;
  v7[4] = a3;
  objc_msgSend(v6, "sortUsingComparator:", v7);

}

BOOL __51__AlgosScoreCSVReader_sortOnColumnIndex_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "intValue");
  if (v5)
    return v9 > v11;
  else
    return v9 < v11;
}

- (void)sortOnColumn:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[AlgosScoreCSVReader headings](self, "headings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("No column field"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  -[AlgosScoreCSVReader sortOnColumnIndex:ascending:](self, "sortOnColumnIndex:ascending:", (int)objc_msgSend(v7, "intValue"), v4);

}

- (void)debugPrint:(int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[AlgosScoreCSVReader headings](self, "headings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        printf("%-15s", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i)), "cStringUsingEncoding:", 4));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  putchar(10);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[AlgosScoreCSVReader rows](self, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
LABEL_10:
    v13 = 0;
    v14 = a3 & ~(a3 >> 31);
    while (1)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(obj);
      if (v13 == v14)
        break;
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            printf("%-15s", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j)), "cStringUsingEncoding:", 4));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        }
        while (v18);
      }
      --a3;

      putchar(10);
      if (++v13 == v11)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v11)
          goto LABEL_10;
        break;
      }
    }
  }

}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (NSDictionary)headings
{
  return self->_headings;
}

- (void)setHeadings:(id)a3
{
  objc_storeStrong((id *)&self->_headings, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_headings, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
