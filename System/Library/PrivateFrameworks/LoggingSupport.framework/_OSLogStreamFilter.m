@implementation _OSLogStreamFilter

- (_OSLogStreamFilter)initWithPredicate:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  _OSLogStreamFilter *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *filter;
  _OSLogStreamFilter *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  objc_super v17;

  v4 = a3;
  v5 = getenv("LOG_USE_STREAMFILTER");
  if (v5 && !strcmp(v5, "0"))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165050);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165068);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4165080);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)_OSLogStreamFilter;
    v9 = -[_OSLogStreamFilter init](&v17, sel_init);
    if (v9)
    {
      _OSLogGetSimplePredicate(v4, v6, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (requiresLogicalExpression(v10))
      {
        -[_OSLogStreamFilter encodePredicate:](v9, "encodePredicate:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        filter = v9->_filter;
        v9->_filter = (NSMutableDictionary *)v11;

        -[_OSLogStreamFilter reduceFilter:](v9, "reduceFilter:", v9->_filter);
      }
      else
      {
        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = v9->_filter;
        v9->_filter = v14;

        objc_msgSend(v10, "acceptVisitor:flags:", v9, 0);
      }

    }
    self = v9;

    v13 = self;
  }

  return v13;
}

- (id)encodePredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_OSLogStreamFilter dictionaryForComparisonPredicate:](self, "dictionaryForComparisonPredicate:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("logicalExp"));
      v7 = v4;
      if (objc_msgSend(v7, "compoundPredicateType") != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "compoundPredicateType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("operator"));

      }
      v9 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v7, "subpredicates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v6;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("subfilters"));
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v7, "subpredicates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            -[_OSLogStreamFilter encodePredicate:](self, "encodePredicate:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v11, "addObject:", v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

    }
  }

  return v5;
}

- (void)reduceFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id obj;
  uint64_t v69;
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
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logicalExp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v60 = v4;
    v61 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subfilters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v79 != v10)
            objc_enumerationMutation(v7);
          -[_OSLogStreamFilter reduceFilter:](self, "reduceFilter:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      }
      while (v9);
    }
    if (objc_msgSend(v7, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          objc_msgSend(v7, "removeObjectAtIndex:", v12--);
        ++v12;
      }
      while (v12 < objc_msgSend(v7, "count"));
    }
    v4 = v60;
    v6 = v61;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("operator"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v7;
      if (!v15)
        goto LABEL_36;
      v16 = v15;
      v17 = objc_msgSend(v15, "unsignedIntegerValue");

      if (v17)
      {
        if (v17 == 1)
        {
          if (objc_msgSend(v7, "count"))
          {
            v18 = 0;
            do
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("logicalExp"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (v20)
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("operator"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  v23 = v22;
                  v24 = objc_msgSend(v22, "unsignedIntegerValue");

                  if (v24 == 1)
                  {
                    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("subfilters"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "removeObjectAtIndex:", v18--);
                    objc_msgSend(v64, "addObjectsFromArray:", v25);

                  }
                }
              }

              ++v18;
              v7 = v64;
            }
            while (v18 < objc_msgSend(v64, "count"));
          }
          v4 = v60;
          v6 = v61;
          if (objc_msgSend(v7, "count") != 1)
            goto LABEL_70;
          objc_msgSend(v61, "setObject:forKeyedSubscript:", 0, CFSTR("operator"));
          goto LABEL_36;
        }
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("logicalExp"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {

          v4 = v60;
LABEL_69:
          v6 = v61;
          goto LABEL_70;
        }
        v28 = v27;
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("operator"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (uint64_t)v29;
        if (v29)
        {
          v30 = objc_msgSend(v29, "unsignedIntegerValue");

          if (v30)
          {
            v17 = 0;
          }
          else
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("subfilters"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "removeAllObjects");
            objc_msgSend(v7, "addObject:", v32);
            objc_msgSend(v61, "setObject:forKeyedSubscript:", 0, CFSTR("operator"));

            v17 = 2;
          }
        }

      }
      v4 = v60;
      v6 = v61;
      if (v17 == 2)
      {
LABEL_36:
        objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("operator"));
        if (objc_msgSend(v7, "count"))
        {
          v67 = 0;
          v33 = 0;
          do
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("logicalExp"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = v35;
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("operator"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37
                || (v38 = v37,
                    v39 = v34,
                    v40 = objc_msgSend(v37, "unsignedIntegerValue"),
                    v38,
                    v41 = v40 == 2,
                    v34 = v39,
                    v41))
              {
                v58 = v36;
                objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("subfilters"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "removeObjectAtIndex:", v33--);
                objc_msgSend(v7, "addObjectsFromArray:", v42);

              }
              else
              {
                v58 = v36;
              }
            }
            else
            {
              if (v67)
              {
                v62 = v34;
                v63 = v33;
                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                obj = v34;
                v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                if (v66)
                {
                  v65 = *(_QWORD *)v75;
                  do
                  {
                    v43 = 0;
                    do
                    {
                      if (*(_QWORD *)v75 != v65)
                        objc_enumerationMutation(obj);
                      v69 = v43;
                      v44 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v43);
                      objc_msgSend(obj, "objectForKeyedSubscript:", v44);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "objectForKeyedSubscript:", v44);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v46)
                      {
                        v46 = (void *)objc_opt_new();
                        objc_msgSend(v67, "setObject:forKeyedSubscript:", v46, v44);
                      }
                      v72 = 0u;
                      v73 = 0u;
                      v70 = 0u;
                      v71 = 0u;
                      v47 = v45;
                      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
                      if (v48)
                      {
                        v49 = v48;
                        v50 = *(_QWORD *)v71;
                        do
                        {
                          for (j = 0; j != v49; ++j)
                          {
                            if (*(_QWORD *)v71 != v50)
                              objc_enumerationMutation(v47);
                            v52 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
                            objc_msgSend(v47, "objectForKeyedSubscript:", v52);
                            v53 = (void *)objc_claimAutoreleasedReturnValue();
                            v54 = objc_msgSend(v53, "unsignedLongLongValue");

                            objc_msgSend(v46, "objectForKeyedSubscript:", v52);
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = objc_msgSend(v55, "unsignedLongLongValue");

                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56 | v54);
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v46, "setObject:forKeyedSubscript:", v57, v52);

                          }
                          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
                        }
                        while (v49);
                      }

                      v43 = v69 + 1;
                    }
                    while (v69 + 1 != v66);
                    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                  }
                  while (v66);
                }

                v7 = v64;
                objc_msgSend(v64, "removeObjectAtIndex:", v63);
                v33 = v63 - 1;
                v34 = v62;
              }
              else
              {
                v67 = v34;
              }
              v58 = 0;
            }

            ++v33;
          }
          while (v33 < objc_msgSend(v7, "count"));
        }
        else
        {
          v67 = 0;
        }
        v4 = v60;
        if (objc_msgSend(v7, "count") == 1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "removeAllObjects");
          objc_msgSend(v60, "addEntriesFromDictionary:", v59);

        }
        goto LABEL_69;
      }
    }
    else
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", 0, CFSTR("logicalExp"));
    }
LABEL_70:

  }
}

- (NSData)data
{
  void *filter;

  filter = self->_filter;
  if (filter)
  {
    filter = (void *)objc_msgSend(filter, "count");
    if (filter)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_filter, 200, 0, 0);
      filter = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSData *)filter;
}

- (void)addProcessID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *pids;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v18 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      pids = self->_pids;
      if (!pids)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_pids;
        self->_pids = v12;

        pids = self->_pids;
      }
      v9 = pids;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("pid"));
    objc_msgSend(v18, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16 | a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v14);

    v8 = v18;
  }

}

- (void)addProcess:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *processes;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      processes = self->_processes;
      if (!processes)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_processes;
        self->_processes = v12;

        processes = self->_processes;
      }
      v9 = processes;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("process"));
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15 | a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    v8 = v17;
  }

}

- (void)addProcessImagePath:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *processImagePaths;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      processImagePaths = self->_processImagePaths;
      if (!processImagePaths)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_processImagePaths;
        self->_processImagePaths = v12;

        processImagePaths = self->_processImagePaths;
      }
      v9 = processImagePaths;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("processImagePath"));
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15 | a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    v8 = v17;
  }

}

- (void)addUserID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *uids;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v18 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      uids = self->_uids;
      if (!uids)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_uids;
        self->_uids = v12;

        uids = self->_uids;
      }
      v9 = uids;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("uid"));
    objc_msgSend(v18, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16 | a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v14);

    v8 = v18;
  }

}

- (void)addSubsystem:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *subsystems;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      subsystems = self->_subsystems;
      if (!subsystems)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_subsystems;
        self->_subsystems = v12;

        subsystems = self->_subsystems;
      }
      v9 = subsystems;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("subsystem"));
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15 | a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    v8 = v17;
  }

}

- (void)addCategory:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *categories;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    v17 = v8;
    if (a5)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (NSMutableDictionary *)objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E08]));
      *a5 = v10;
    }
    else
    {
      categories = self->_categories;
      if (!categories)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_categories;
        self->_categories = v12;

        categories = self->_categories;
      }
      v9 = categories;
      v10 = self->_filter;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, CFSTR("category"));
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15 | a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    v8 = v17;
  }

}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5 returningDict:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  if (objc_msgSend(v13, "expressionType") == 3)
  {
    objc_msgSend(v13, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("processID")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("processIdentifier")))
    {
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcessID:flags:returningDict:](self, "addProcessID:flags:returningDict:", v12, a5, a6);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("process")))
    {
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcess:flags:returningDict:](self, "addProcess:flags:returningDict:", v12, a5, a6);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("processImagePath")))
    {
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcessImagePath:flags:returningDict:](self, "addProcessImagePath:flags:returningDict:", v12, a5, a6);
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("userID")) & 1) != 0
           || objc_msgSend(v11, "isEqualToString:", CFSTR("userIdentifier")))
    {
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addUserID:flags:returningDict:](self, "addUserID:flags:returningDict:", v12, a5, a6);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("subsystem")))
    {
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addSubsystem:flags:returningDict:](self, "addSubsystem:flags:returningDict:", v12, a5, a6);
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("category")))
        goto LABEL_6;
      objc_msgSend(v10, "constantValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addCategory:flags:returningDict:](self, "addCategory:flags:returningDict:", v12, a5, a6);
    }

LABEL_6:
  }

}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5
{
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:](self, "processLeftExpression:andRightExpression:flags:returningDict:", a3, a4, a5, 0);
}

- (unint64_t)flagsForPredicate:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "predicateOperatorType");
  return (unint64_t)(v3 - 8) < 2 || v3 == 99;
}

- (id)dictionaryForComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_OSLogStreamFilter flagsForPredicate:](self, "flagsForPredicate:", v4);

  v11 = 0;
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:](self, "processLeftExpression:andRightExpression:flags:returningDict:", v5, v6, v7, &v11);
  v8 = v11;
  if (!v8)
  {
    v10 = 0;
    -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:](self, "processLeftExpression:andRightExpression:flags:returningDict:", v6, v5, v7, &v10);
    v8 = v10;
  }

  return v8;
}

- (void)processComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "leftExpression");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_OSLogStreamFilter flagsForPredicate:](self, "flagsForPredicate:", v4);

  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:](self, "processLeftExpression:andRightExpression:flags:", v7, v5, v6);
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:](self, "processLeftExpression:andRightExpression:flags:", v5, v7, v6);

}

- (void)visitPredicate:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_OSLogStreamFilter processComparisonPredicate:](self, "processComparisonPredicate:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_uids, 0);
  objc_storeStrong((id *)&self->_processImagePaths, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
