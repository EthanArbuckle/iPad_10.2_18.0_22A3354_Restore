@implementation MPMiddlewareOperationMap

+ (id)mapForRequest:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  id obj;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id *v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
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
  __int128 v82;
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
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5[1];
  v5[1] = (id)v6;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "middlewareClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v5[2];
  v5[2] = (id)v10;

  v12 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "middlewareClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v5[3];
  v58 = v5;
  v5[3] = (id)v14;

  v16 = objc_alloc(MEMORY[0x1E0CB3748]);
  objc_msgSend(v4, "middlewareClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v17, "count"));

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v57 = v4;
  objc_msgSend(v4, "middlewareClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v59)
  {
    v55 = *(_QWORD *)v91;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v91 != v55)
          objc_enumerationMutation(obj);
        v62 = v19;
        v20 = objc_alloc_init(*(Class *)(*((_QWORD *)&v90 + 1) + 8 * v19));
        objc_msgSend(v20, "operationsForRequest:", v57);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58[1], "setObject:forKey:", v21, v20);
        v61 = v20;
        objc_msgSend(v58[2], "addObject:", v20);
        objc_msgSend(v58[3], "addObjectsFromArray:", v21);
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v68 = v21;
        v22 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v87;
          v63 = *(_QWORD *)v87;
          do
          {
            v25 = 0;
            v66 = (id)v23;
            do
            {
              if (*(_QWORD *)v87 != v24)
                objc_enumerationMutation(v68);
              v26 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v25);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v27 = v26;
                v82 = 0u;
                v83 = 0u;
                v84 = 0u;
                v85 = 0u;
                objc_msgSend(v27, "outputProtocols");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v83;
                  do
                  {
                    for (i = 0; i != v30; ++i)
                    {
                      if (*(_QWORD *)v83 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                      objc_msgSend(v18, "objectForKey:", v33);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v34)
                      {
                        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v18, "setObject:forKey:", v34, v33);
                      }
                      objc_msgSend(v34, "addObject:", v27);

                    }
                    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
                  }
                  while (v30);
                }

                v24 = v63;
                v23 = (uint64_t)v66;
              }
              ++v25;
            }
            while (v25 != v23);
            v23 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
          }
          while (v23);
        }

        v19 = v62 + 1;
      }
      while (v62 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v59);
  }

  if (objc_msgSend(v18, "count"))
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v35 = v58[3];
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v79;
      v60 = v35;
      v56 = *(_QWORD *)v79;
      do
      {
        v39 = 0;
        v64 = v37;
        do
        {
          if (*(_QWORD *)v79 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v39);
          if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v65 = v39;
            v41 = v40;
            objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            objc_msgSend(v41, "inputProtocols");
            v67 = (id)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
            if (v43)
            {
              v44 = v43;
              v69 = *(id *)v75;
              do
              {
                for (j = 0; j != v44; ++j)
                {
                  if (*(id *)v75 != v69)
                    objc_enumerationMutation(v67);
                  v46 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
                  objc_msgSend(v18, "objectForKey:", v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                  {
                    objc_msgSend(v42, "setObject:forKey:", v47, v46);
                    v72 = 0u;
                    v73 = 0u;
                    v70 = 0u;
                    v71 = 0u;
                    v48 = v47;
                    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v71;
                      do
                      {
                        for (k = 0; k != v50; ++k)
                        {
                          if (*(_QWORD *)v71 != v51)
                            objc_enumerationMutation(v48);
                          objc_msgSend(v41, "addDependency:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k));
                        }
                        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
                      }
                      while (v50);
                    }

                    objc_msgSend(v41, "setInputOperations:", v42);
                  }

                }
                v44 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
              }
              while (v44);
            }

            v35 = v60;
            v38 = v56;
            v37 = v64;
            v39 = v65;
          }
          ++v39;
        }
        while (v39 != v37);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
      }
      while (v37);
    }

  }
  return v58;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMiddlewareOperationMap;
  return -[MPMiddlewareOperationMap init](&v3, sel_init);
}

- (id)operationsForMiddleware:(id)a3
{
  return -[NSMapTable objectForKey:](self->_middlewareOperationMap, "objectForKey:", a3);
}

- (id)allMiddleware
{
  return self->_middleware;
}

- (id)allOperations
{
  return self->_operations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_middlewareOperationMap, 0);
}

@end
