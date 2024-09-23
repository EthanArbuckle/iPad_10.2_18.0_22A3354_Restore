@implementation FBKQuestionDependencyGraph

- (FBKQuestionDependencyGraph)initWithBugForm:(id)a3
{
  id v5;
  FBKQuestionDependencyGraph *v6;
  FBKQuestionDependencyGraph *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSMapTable *tatToQuestionMap;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMapTable *v25;
  void *v26;
  void *v27;
  uint64_t m;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  FBKQuestionDependencyNode *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t ii;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSDictionary *nodes;
  void *v53;
  id obj;
  id obja;
  id objb;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v91.receiver = self;
  v91.super_class = (Class)FBKQuestionDependencyGraph;
  v6 = -[FBKQuestionDependencyGraph init](&v91, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bugForm, a3);
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v5, "questionGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v88 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "questions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v11 += objc_msgSend(v14, "count");

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, v11);
    tatToQuestionMap = v7->_tatToQuestionMap;
    v7->_tatToQuestionMap = (NSMapTable *)v15;

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v53 = v5;
    objc_msgSend(v5, "questionGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    if (v60)
    {
      v57 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v84 != v57)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          objc_msgSend(v18, "questions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v80;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v80 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
                v25 = v7->_tatToQuestionMap;
                objc_msgSend(v24, "role");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMapTable setObject:forKey:](v25, "setObject:forKey:", v24, v26);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
            }
            while (v21);
          }

        }
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
      }
      while (v60);
    }

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v11);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v53, "questionGroups");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    if (v61)
    {
      v58 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v76 != v58)
            objc_enumerationMutation(obja);
          v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * m);
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          objc_msgSend(v29, "questions");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v72;
            do
            {
              for (n = 0; n != v32; ++n)
              {
                if (*(_QWORD *)v72 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * n);
                v36 = -[FBKQuestionDependencyNode initWithQuestion:]([FBKQuestionDependencyNode alloc], "initWithQuestion:", v35);
                -[FBKQuestionDependencyNode setGraph:](v36, "setGraph:", v7);
                objc_msgSend(v35, "ID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKey:", v36, v37);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
            }
            while (v32);
          }

        }
        v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
      }
      while (v61);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v38 = v27;
    v59 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
    if (v59)
    {
      objb = *(id *)v68;
      do
      {
        v39 = 0;
        do
        {
          if (*(id *)v68 != objb)
            objc_enumerationMutation(v38);
          v62 = v39;
          objc_msgSend(v38, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v39));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v40, "dependencyTats");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v92, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v64;
            do
            {
              for (ii = 0; ii != v43; ++ii)
              {
                if (*(_QWORD *)v64 != v44)
                  objc_enumerationMutation(v41);
                -[NSMapTable objectForKey:](v7->_tatToQuestionMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * ii));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v46;
                if (v46)
                {
                  objc_msgSend(v46, "ID");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "objectForKey:", v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v49, "registerDependentChild:", v40);
                }

              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v92, 16);
            }
            while (v43);
          }

          v39 = v62 + 1;
        }
        while (v62 + 1 != v59);
        v59 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
      }
      while (v59);
    }

    v50 = objc_msgSend(v38, "copy");
    nodes = v7->_nodes;
    v7->_nodes = (NSDictionary *)v50;

    v5 = v53;
  }

  return v7;
}

- (id)dependencyNodeForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKQuestionDependencyGraph nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)visibilityForQuestion:(id)a3 inFormResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "visible"))
  {
    if (objc_msgSend(v6, "isConditional"))
    {
      -[FBKQuestionDependencyGraph dependencyNodeForQuestion:](self, "dependencyNodeForQuestion:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v10 = objc_msgSend(v8, "isVisibleInFormResponse:", v7);
      else
        v10 = 1;

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)questionsDependentOnQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKQuestionDependencyGraph nodes](self, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v31 = v4;
    objc_msgSend(v7, "dependentChildren");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
          -[FBKQuestionDependencyGraph tatToQuestionMap](self, "tatToQuestionMap");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "tat");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v9, "addObject:", v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v12);
    }

    v4 = v31;
    objc_msgSend(v31, "role");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR(":area"));

    if (v20)
    {
      -[FBKQuestionDependencyGraph tatToQuestionMap](self, "tatToQuestionMap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      -[FBKQuestionDependencyGraph tatToQuestionMap](self, "tatToQuestionMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      if (v23 != v25)
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:].cold.3(v9, v26);

        +[FBKLog appHandle](FBKLog, "appHandle");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:].cold.2(self, v27);

        +[FBKLog appHandle](FBKLog, "appHandle");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:].cold.1(v28);

        v4 = v31;
      }
    }
    v29 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (FBKBugForm)bugForm
{
  return (FBKBugForm *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBugForm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMapTable)tatToQuestionMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTatToQuestionMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)nodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_tatToQuestionMap, 0);
  objc_storeStrong((id *)&self->_bugForm, 0);
}

- (void)questionsDependentOnQuestion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21D9A9000, log, OS_LOG_TYPE_FAULT, "Area question has less than 5 dependent questions. This is likely a bug in the application.", v1, 2u);
}

- (void)questionsDependentOnQuestion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "tatToQuestionMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(a1, "tatToQuestionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218240;
  v9 = v6;
  v10 = 2048;
  v11 = v7;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "tatToQuestionMap has %lu keys, but %lu items", (uint8_t *)&v8, 0x16u);

}

- (void)questionsDependentOnQuestion:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKey:", CFSTR("role"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Dependency graph may have issue. Area question resulted in in following tats being added: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
