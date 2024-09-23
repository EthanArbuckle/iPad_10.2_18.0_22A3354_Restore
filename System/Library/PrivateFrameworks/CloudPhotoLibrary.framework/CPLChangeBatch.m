@implementation CPLChangeBatch

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CPLChangeBatch records](self, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("records"));
  -[CPLChangeBatch _additionalRecords](self, "_additionalRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("additionalRecords"));

}

- (CPLChangeBatch)initWithCoder:(id)a3
{
  id v4;
  CPLChangeBatch *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CPLChangeBatch init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("records"));
    v10 = objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_27;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v10;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v11)
    {
      v12 = v11;
      v21 = v4;
      v13 = 0;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CPLChangeBatch addRecord:](v5, "addRecord:", v16);
          }
          else
          {
            if (!v13)
              v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v13, "addObject:", v16);
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v12);

      v8 = 0x1E0C99000;
      if (!v13)
      {
        v4 = v21;
        goto LABEL_22;
      }
      v4 = v21;
      if (_CPLSilentLogging)
      {
LABEL_22:
        objc_msgSend(*(id *)(v8 + 3680), "setWithObjects:", v7, v6, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("additionalRecords"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
LABEL_25:

          goto LABEL_28;
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CPLChangeBatch _setAdditionalRecords:](v5, "_setAdditionalRecords:", v19);
          goto LABEL_25;
        }

LABEL_27:
        v5 = 0;
        goto LABEL_28;
      }
      __CPLGenericOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Bad records in a batch during deserialization: %@", buf, 0xCu);
      }
    }
    else
    {
      v13 = 0;
      v17 = v10;
    }

    goto LABEL_22;
  }
LABEL_28:

  return v5;
}

- (id)cplFullDescription
{
  void *v3;
  void *v4;
  CPLChangeBatch *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@: [\n"), objc_opt_class());
  v4 = (void *)MEMORY[0x1B5E08BF0]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self;
  v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "cplFullDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  -[CPLChangeBatch _additionalRecords](v5, "_additionalRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v3, "appendString:", CFSTR("Additional records:\n"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "cplFullDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  objc_autoreleasePoolPop(v4);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_addChange:(id)a3 resultBatch:(id)a4 changesPerScopedIdentifier:(id)a5 changesPerClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v17, "scopedIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", v13);
  objc_msgSend(v12, "objectForKey:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v13);
  objc_msgSend(v17, "relatedScopedIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[CPLChangeBatch _addChange:resultBatch:changesPerScopedIdentifier:changesPerClass:](self, "_addChange:resultBatch:changesPerScopedIdentifier:changesPerClass:", v16, v10, v11, v12);

  }
  objc_msgSend(v10, "addObject:", v17);

}

- (BOOL)sortBatchWithError:(id *)a3
{
  CPLChangeBatch *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  CPLChangeBatch *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  CPLChangeBatch *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t k;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  void *v60;
  CPLChangeBatch *obj;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
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
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (-[CPLChangeBatch count](self, "count") <= 1)
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v5 = self;
    v6 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v79;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v79 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "scopedIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("Tried to sort a batch containing a %@ with no identifier"), objc_opt_class());
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (a3)
              *a3 = objc_retainAutorelease(v37);

            v11 = 0;
            goto LABEL_81;
          }
        }
        v7 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
        v11 = 1;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v11 = 1;
    }
    goto LABEL_81;
  }
  v57 = a3;
  if (sortBatchWithError__onceToken != -1)
    dispatch_once(&sortBatchWithError__onceToken, &__block_literal_global_152);
  v12 = MEMORY[0x1B5E08BF0]();
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v65 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v16 = self;
  v17 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  v58 = v13;
  v56 = (void *)v12;
  if (v17)
  {
    v18 = v17;
    v59 = 0;
    v60 = 0;
    v19 = *(_QWORD *)v75;
    while (1)
    {
      v20 = 0;
      v63 = v18;
      do
      {
        if (*(_QWORD *)v75 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v20);
        objc_msgSend(v21, "scopedIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 50, CFSTR("Tried to sort a batch containing a %@ with no identifier"), objc_opt_class());
          v5 = (CPLChangeBatch *)objc_claimAutoreleasedReturnValue();
          v11 = 0;
          v39 = v16;
          goto LABEL_78;
        }
        v23 = (void *)v22;
        objc_msgSend(v21, "realIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = v15;
LABEL_21:
          objc_msgSend(v25, "addObject:", v21);
          goto LABEL_22;
        }
        v26 = (void *)objc_opt_class();
        v27 = objc_msgSend(v21, "changeType");
        if (objc_msgSend(v26, "isSubclassOfClass:", sortBatchWithError__scopeChangeClass))
        {
          if (v27 == 1024)
          {
            v25 = v60;
            v18 = v63;
            if (!v60)
              v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v60 = v25;
          }
          else
          {
            v25 = v59;
            v18 = v63;
            if (!v59)
              v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v59 = v25;
          }
          goto LABEL_21;
        }
        if (v27 != 1024)
        {
          objc_msgSend(v14, "objectForKey:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v29 = v30;
            v31 = v21;
            v32 = v23;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v21, v23);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v14;
            v31 = v29;
            v32 = v26;
          }
          objc_msgSend(v30, "setObject:forKey:", v31, v32);
          v33 = v65;
          v34 = v21;
          v35 = v23;
          goto LABEL_41;
        }
        objc_msgSend(v58, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v58;
          v34 = v29;
          v35 = v26;
LABEL_41:
          objc_msgSend(v33, "setObject:forKey:", v34, v35);
          goto LABEL_42;
        }
        v29 = v28;
        objc_msgSend(v28, "addObject:", v21);
LABEL_42:

        v18 = v63;
LABEL_22:

        ++v20;
      }
      while (v18 != v20);
      v36 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      v18 = v36;
      if (!v36)
      {

        if (v59)
          objc_msgSend(v15, "addObjectsFromArray:");
        else
          v59 = 0;
        v13 = v58;
        goto LABEL_52;
      }
    }
  }

  v59 = 0;
  v60 = 0;
LABEL_52:
  +[CPLEngineTransientRepository orderedClassesForDelete](CPLEngineTransientRepository, "orderedClassesForDelete");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v71 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
          objc_msgSend(v15, "addObjectsFromArray:", v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
    }
    while (v42);
  }
  +[CPLEngineTransientRepository orderedClassesForChanges](CPLEngineTransientRepository, "orderedClassesForChanges");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLChangeBatch records](v16, "records");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "mutableCopy");

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v39 = v46;
  v64 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v64)
  {
    obj = v39;
    v62 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v67 != v62)
          objc_enumerationMutation(obj);
        objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v50, "count"))
        {
          v51 = 0;
          do
          {
            if (v51 >= objc_msgSend(v48, "count"))
              break;
            objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "scopedIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectForKeyedSubscript:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54)
            {
              objc_msgSend(v48, "removeObjectAtIndex:", v51);
              -[CPLChangeBatch _addChange:resultBatch:changesPerScopedIdentifier:changesPerClass:](v16, "_addChange:resultBatch:changesPerScopedIdentifier:changesPerClass:", v52, v15, v65, v14);
            }
            else
            {
              ++v51;
            }

          }
          while (objc_msgSend(v50, "count"));
        }

      }
      v39 = obj;
      v64 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v64);
  }

  if (v60)
    objc_msgSend(v15, "addObjectsFromArray:", v60);
  -[CPLChangeBatch _setRecords:](v16, "_setRecords:", v15);

  v5 = 0;
  v11 = 1;
LABEL_78:

  objc_autoreleasePoolPop(v56);
  if (v57 && !v11)
  {
    v5 = objc_retainAutorelease(v5);
    v11 = 0;
    *v57 = v5;
  }
LABEL_81:

  return v11;
}

- (void)extractInitialDownloadBatch:(id *)a3 shouldConsiderRecordFilter:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  id v8;
  CPLChangeBatch *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  CPLChangeBatch *v26;
  CPLChangeBatch *v27;
  id v28;
  id *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  CPLChangeBatch *v36;
  id v37;
  unsigned int (**v38)(id, void *);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a4;
  v29 = a3;
  *a3 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = self;
  v10 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  v30 = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "isFullRecord", v29);
        if ((objc_msgSend(v14, "supportsSharingScopedIdentifier") & 1) != 0)
        {
          objc_msgSend(v14, "sharingScopeIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            v17 = 0;
          else
            v17 = v15;
          if (v17 != 1)
            goto LABEL_24;
        }
        else if ((v15 & 1) == 0)
        {
          goto LABEL_24;
        }
        if (objc_msgSend(v14, "isMasterChange") && v6[2](v6, v14))
        {
          objc_msgSend(v14, "scopedIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v8, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v8, "setObject:forKey:", v14, v18);

              goto LABEL_25;
            }
          }
          goto LABEL_23;
        }
        if (!objc_msgSend(v14, "isAssetChange"))
          goto LABEL_24;
        objc_msgSend(v14, "realIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          goto LABEL_24;
        objc_msgSend(v14, "masterScopedIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_23;
        objc_msgSend(v31, "objectForKey:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v8 = v30;
LABEL_23:

LABEL_24:
          objc_msgSend(v7, "addObject:", v14);
          goto LABEL_25;
        }
        objc_msgSend(v31, "setObject:forKey:", v14, v18);

        v8 = v30;
LABEL_25:
        ++v13;
      }
      while (v11 != v13);
      v22 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v11 = v22;
    }
    while (v22);
  }

  v23 = v31;
  v24 = objc_msgSend(v31, "count");
  v25 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    v26 = objc_alloc_init(CPLChangeBatch);
    v34[0] = v25;
    v34[1] = 3221225472;
    v34[2] = __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke;
    v34[3] = &unk_1E60D9618;
    v35 = v8;
    v38 = v6;
    v27 = v26;
    v36 = v27;
    v37 = v7;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v34);
    if (-[CPLChangeBatch count](v27, "count"))
      *v29 = objc_retainAutorelease(v27);

    v8 = v30;
    v23 = v31;
  }
  v32[0] = v25;
  v32[1] = 3221225472;
  v32[2] = __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke_2;
  v32[3] = &unk_1E60D9640;
  v33 = v7;
  v28 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v32);
  -[CPLChangeBatch _setRecords:](v9, "_setRecords:", v28);

}

void __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    objc_msgSend(*(id *)(a1 + 40), "addRecord:", v6);
    objc_msgSend(*(id *)(a1 + 40), "addRecord:", v5);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  }

}

uint64_t __103__CPLChangeBatch_CPLEngineTransientRepository__extractInitialDownloadBatch_shouldConsiderRecordFilter___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __67__CPLChangeBatch_CPLEngineTransientRepository__sortBatchWithError___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  sortBatchWithError__scopeChangeClass = result;
  return result;
}

- (CPLChangeBatch)init
{
  CPLChangeBatch *v2;
  NSMutableArray *v3;
  NSMutableArray *records;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLChangeBatch;
  v2 = -[CPLChangeBatch init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v2->_records;
    v2->_records = v3;

  }
  return v2;
}

- (CPLChangeBatch)initWithRecords:(id)a3
{
  id v4;
  CPLChangeBatch *v5;
  uint64_t v6;
  NSMutableArray *records;

  v4 = a3;
  v5 = -[CPLChangeBatch init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    records = v5->_records;
    v5->_records = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)_initWithRecords:(id)a3
{
  id v5;
  CPLChangeBatch *v6;
  CPLChangeBatch *v7;

  v5 = a3;
  v6 = -[CPLChangeBatch init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_records, a3);

  return v7;
}

- (void)addRecord:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  CPLChangeBatch *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = self;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Trying to add a nil record to %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 92, CFSTR("Trying to add a nil record to %@"), self);

    abort();
  }
  v9 = v5;
  -[NSMutableArray addObject:](self->_records, "addObject:", v5);
  if (self->_calculateEstimatedBatchSize)
    self->_estimatedBatchSize += objc_msgSend(v9, "estimatedRecordSize");

}

- (void)addRecordsFromBatch:(id)a3
{
  id v5;
  NSMutableArray *records;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  CPLChangeBatch *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Trying to add a nil list of records to %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v10, 100, CFSTR("Trying to add a nil list of records to %@"), self);

    abort();
  }
  records = self->_records;
  v11 = v5;
  objc_msgSend(v5, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](records, "addObjectsFromArray:", v7);

  self->_estimatedBatchSize = 0;
  self->_calculateEstimatedBatchSize = 0;

}

- (void)removeRecordWithScopedIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray count](self->_records, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_records, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scopedIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v10);

      if (v9)
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_records, "removeObjectAtIndex:", v6);
    self->_estimatedBatchSize = 0;
    self->_calculateEstimatedBatchSize = 0;

  }
LABEL_7:

}

- (NSArray)records
{
  return (NSArray *)self->_records;
}

- (BOOL)hasChangeWithScopedIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_records;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "scopedIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_records;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "scopedIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)filterScopeChangeFromBatch
{
  uint64_t v3;
  NSMutableArray *records;
  NSMutableArray *v5;
  id v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20597;
  v23 = __Block_byref_object_dispose__20598;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__20597;
  v13 = __Block_byref_object_dispose__20598;
  v14 = 0;
  v3 = objc_opt_class();
  records = self->_records;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CPLChangeBatch_filterScopeChangeFromBatch__block_invoke;
  v8[3] = &unk_1E60DD528;
  v8[4] = &v19;
  v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](records, "enumerateObjectsUsingBlock:", v8);
  if (v20[5])
  {
    v5 = self->_records;
    if (v10[5])
      -[NSMutableArray removeObjectsAtIndexes:](v5, "removeObjectsAtIndexes:");
    else
      -[NSMutableArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", v16[3]);
  }
  v6 = (id)v20[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (id)additionalRecordWithScopedIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_additionalRecords, "objectForKey:", a3);
}

- (void)_setAdditionalRecords:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *additionalRecords;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  additionalRecords = self->_additionalRecords;
  self->_additionalRecords = v5;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = self->_additionalRecords;
          objc_msgSend(v12, "scopedIdentifier", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  self->_estimatedBatchSize = 0;
  self->_calculateEstimatedBatchSize = 0;

}

- (id)_additionalRecords
{
  return (id)-[NSMutableDictionary allValues](self->_additionalRecords, "allValues");
}

- (void)_addAdditionalRecord:(id)a3
{
  id v4;
  NSMutableDictionary *additionalRecords;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v4 = a3;
  additionalRecords = self->_additionalRecords;
  v9 = v4;
  if (!additionalRecords)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_additionalRecords;
    self->_additionalRecords = v6;

    v4 = v9;
    additionalRecords = self->_additionalRecords;
  }
  objc_msgSend(v4, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](additionalRecords, "setObject:forKeyedSubscript:", v9, v8);

  if (self->_calculateEstimatedBatchSize)
    self->_estimatedBatchSize += objc_msgSend(v9, "estimatedRecordSize");

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *records;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    records = self->_records;
    objc_msgSend(v4, "records");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableArray isEqual:](records, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_records, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_records, "objectAtIndex:", a3);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_records, "count");
}

- (void)_setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
  self->_estimatedBatchSize = 0;
  self->_calculateEstimatedBatchSize = 0;
}

- (id)summaryDescription
{
  id v3;
  id v4;
  id v5;
  id v6;
  CPLChangeBatch *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  id obj;
  __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[CPLChangeBatch count](self, "count"))
  {
    v28 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v5 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = self;
    v8 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v13 = objc_opt_class();
          objc_msgSend(v6, "addObject:", v13);
          v14 = objc_msgSend(v12, "changeType");
          v15 = v5;
          if (v14 != 1024)
          {
            if (objc_msgSend(v12, "isFullRecord"))
              v15 = v3;
            else
              v15 = v4;
          }
          objc_msgSend(v15, "addObject:", v13);
        }
        v9 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      v19 = 1;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          v22 = objc_msgSend(v3, "countForObject:", v21);
          v23 = objc_msgSend(v4, "countForObject:", v21);
          v24 = objc_msgSend(v5, "countForObject:", v21);
          if ((v19 & 1) != 0)
            v25 = CFSTR("%@: +%lu/%lu/-%lu");
          else
            v25 = CFSTR(", %@: +%lu/%lu/-%lu");
          -[__CFString appendFormat:](v28, "appendFormat:", v25, v21, v22, v23, v24);
          v19 = 0;
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        v19 = 0;
      }
      while (v17);
    }

    -[__CFString appendFormat:](v28, "appendFormat:", CFSTR("]"));
  }
  else
  {
    v28 = CFSTR("[empty batch]");
  }
  return v28;
}

- (id)localResourceOfType:(unint64_t)a3 forItemWithCloudScopedIdentifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableDictionary objectForKey:](self->_localResources, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)appendLocalResources:(id)a3 forItemWithCloudScopedIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *localResources;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v19 = v7;
    if (!self->_localResources)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      localResources = self->_localResources;
      self->_localResources = v9;

    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "resourceType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    v8 = v19;
    -[NSMutableDictionary setObject:forKey:](self->_localResources, "setObject:forKey:", v11, v19);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *additionalRecords;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableDictionary *localResources;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_records;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "copy");
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithRecords:", v4);
  v12 = MEMORY[0x1E0C809B0];
  if (self->_additionalRecords)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_additionalRecords, "count"));
    additionalRecords = self->_additionalRecords;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __31__CPLChangeBatch_copyWithZone___block_invoke;
    v26[3] = &unk_1E60DD550;
    v15 = v13;
    v27 = v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](additionalRecords, "enumerateKeysAndObjectsUsingBlock:", v26);
    v16 = (void *)v11[2];
    v11[2] = v15;
    v17 = v15;

  }
  if (self->_localResources)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableDictionary count](self->_localResources, "count"));
    localResources = self->_localResources;
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __31__CPLChangeBatch_copyWithZone___block_invoke_2;
    v24[3] = &unk_1E60DD5A0;
    v20 = v18;
    v25 = v20;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](localResources, "enumerateKeysAndObjectsUsingBlock:", v24);
    v21 = (void *)v11[3];
    v11[3] = v20;
    v22 = v20;

  }
  return v11;
}

- (id)_descriptionRedacted:(BOOL)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[CPLChangeBatch count](self, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_records, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = self->_records;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (a3)
            objc_msgSend(v11, "redactedDescription");
          else
            objc_msgSend(v11, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_opt_class();
    -[CPLChangeBatch summaryDescription](self, "summaryDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(",\n  "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %@ {{\n  %@\n}}>"), v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = objc_opt_class();
    -[CPLChangeBatch summaryDescription](self, "summaryDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@ %@>"), v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    return v22;
  }
}

- (id)description
{
  return -[CPLChangeBatch _descriptionRedacted:](self, "_descriptionRedacted:", 0);
}

- (id)redactedDescription
{
  return -[CPLChangeBatch _descriptionRedacted:](self, "_descriptionRedacted:", 1);
}

- (unint64_t)estimatedBatchSize
{
  _BOOL4 calculateEstimatedBatchSize;
  unint64_t result;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *additionalRecords;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  calculateEstimatedBatchSize = self->_calculateEstimatedBatchSize;
  result = self->_estimatedBatchSize;
  if (!calculateEstimatedBatchSize)
  {
    if (result)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Estimated batch size should not have been calculated yet", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeBatch.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 343, CFSTR("Estimated batch size should not have been calculated yet"));

      abort();
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_records;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          self->_estimatedBatchSize += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "estimatedRecordSize");
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    additionalRecords = self->_additionalRecords;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __36__CPLChangeBatch_estimatedBatchSize__block_invoke;
    v15[3] = &unk_1E60DD550;
    v15[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](additionalRecords, "enumerateKeysAndObjectsUsingBlock:", v15);
    self->_calculateEstimatedBatchSize = 1;
    return self->_estimatedBatchSize;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localResources, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

uint64_t __36__CPLChangeBatch_estimatedBatchSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "estimatedRecordSize");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += result;
  return result;
}

void __31__CPLChangeBatch_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __31__CPLChangeBatch_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__CPLChangeBatch_copyWithZone___block_invoke_3;
  v10[3] = &unk_1E60DD578;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __31__CPLChangeBatch_copyWithZone___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __44__CPLChangeBatch_filterScopeChangeFromBatch__block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;

  v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(_QWORD *)(a1[4] + 8);
    v10 = *(void **)(v7 + 40);
    v9 = (id *)(v7 + 40);
    v8 = v10;
    if (v10)
    {
      v15 = 0;
      objc_msgSend(v8, "updateScopeFromScopeChange:direction:didHaveChanges:", v6, 2, &v15);
      v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (!v11)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
        v13 = *(_QWORD *)(a1[6] + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      }
      objc_msgSend(v11, "addIndex:", a3);
    }
    else
    {
      objc_storeStrong(v9, a2);
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    }
  }

}

@end
