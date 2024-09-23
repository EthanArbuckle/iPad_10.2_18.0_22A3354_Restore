@implementation CHContactProvider

- (CHContactProvider)initWithDataSource:(id)a3
{
  id v5;
  CHContactProvider *v6;
  CHContactProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHContactProvider;
  v6 = -[CHContactProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)contactsByHandleForCalls:(id)a3 keyDescriptors:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CHContactProvider *v23;
  id *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v23 = self;
  v24 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v14, "remoteParticipantHandles", v23, v24, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19++));
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v17);
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHContactProvider contactsByHandleForHandles:keyDescriptors:error:](v23, "contactsByHandleForHandles:keyDescriptors:error:", v20, v7, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)contactsByHandleForHandles:(id)a3 keyDescriptors:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v13, "normalizedValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "length"))
        {
          objc_msgSend(v13, "value");
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v16, "addObject:", v13);
          }
          else
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v17, v14);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v10);
  }

  -[CHContactProvider dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v40;
  objc_msgSend(v40, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contactsByContactHandleForContactHandles:keyDescriptors:error:", v20, v35, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v21, "allKeys");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v46 != v38)
            objc_enumerationMutation(v36);
          v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v42;
              do
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v42 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
                  objc_msgSend(v21, "objectForKeyedSubscript:", v24);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, v31);

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              }
              while (v28);
            }
          }

          v19 = v40;
        }
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v39);
    }

  }
  else
  {
    v22 = 0;
  }
  v33 = (void *)objc_msgSend(v22, "copy");

  return v33;
}

- (CHContactDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
