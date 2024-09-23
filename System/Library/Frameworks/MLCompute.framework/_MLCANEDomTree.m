@implementation _MLCANEDomTree

+ (id)computeDominationForGraph:(id)a3
{
  void *v4;
  void *v5;

  +[_MLCANEDomTree computeDominationForGraphImpl:](_MLCANEDomTree, "computeDominationForGraphImpl:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initDomTree:", v4);

  return v5;
}

- (BOOL)doesLayer:(id)a3 dominates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  if (v6 == a4)
  {
    v11 = 1;
  }
  else
  {
    v7 = a4;
    -[_MLCANEDomTree dominationTree](self, "dominationTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = objc_msgSend(v10, "containsObject:", v6);
    else
      v11 = 0;

  }
  return v11;
}

- (BOOL)doesLayer:(id)a3 dominatesSubgraph:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[_MLCANEDomTree doesLayer:dominates:](self, "doesLayer:dominates:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)doesSubgraph:(id)a3 dominatesLayer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (-[_MLCANEDomTree doesLayer:dominates:](self, "doesLayer:dominates:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v7, (_QWORD)v15))
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)doesSubgraph:(id)a3 dominatesSubgraph:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  BOOL v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v39;
    v25 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v12, "resultTensors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v28)
        {
          v14 = *(_QWORD *)v35;
          v29 = v13;
          v27 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v35 != v14)
                objc_enumerationMutation(v13);
              v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v16, "childLayers");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v31;
                while (2)
                {
                  for (j = 0; j != v19; ++j)
                  {
                    if (*(_QWORD *)v31 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                    if ((objc_msgSend(v8, "containsObject:", v22) & 1) == 0
                      && -[_MLCANEDomTree doesLayer:dominatesSubgraph:](self, "doesLayer:dominatesSubgraph:", v22, v7))
                    {

                      v23 = 1;
                      goto LABEL_27;
                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                  if (v19)
                    continue;
                  break;
                }
              }

              v13 = v29;
              v14 = v27;
            }
            v10 = v25;
            v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v28);
        }

        ++v11;
      }
      while (v11 != v26);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      v23 = 0;
    }
    while (v9);
  }
  else
  {
    v23 = 0;
  }
LABEL_27:

  return v23;
}

- (id)getDominanceFrontierForSubgraph:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
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
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v5);
        v22 = v6;
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v7, "sourceTensors", v20);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v12, "parentLayers");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v25 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                    if ((objc_msgSend(v5, "containsObject:", v18) & 1) == 0)
                      objc_msgSend(v4, "addObject:", v18);
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                }
                while (v15);
              }

            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v9);
        }

        v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v21);
  }

  return v4;
}

- (id)getPostDominanceFrontierForSubgraph:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
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
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v5);
        v22 = v6;
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v7, "resultTensors", v20);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(obj);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              v24 = 0u;
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              objc_msgSend(v12, "childLayers");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v25;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v25 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                    if ((objc_msgSend(v5, "containsObject:", v18) & 1) == 0)
                      objc_msgSend(v4, "addObject:", v18);
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
                }
                while (v15);
              }

            }
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v9);
        }

        v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v21);
  }

  return v4;
}

+ (void)computeDominationForLayer:(id)a3 dominationTree:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "sourceTensors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v25)
    {
      v12 = *(_QWORD *)v33;
      v27 = v11;
      v24 = *(_QWORD *)v33;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v11);
          v26 = v13;
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v14, "parentLayers", v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                objc_msgSend(v10, "addObject:", v20);
                objc_msgSend(a1, "computeDominationForLayer:dominationTree:", v20, v7);
                objc_msgSend(v20, "key");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectForKeyedSubscript:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v22)
                {

                  v23 = v27;
                  goto LABEL_19;
                }
                objc_msgSend(v10, "unionSet:", v22);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v17)
                continue;
              break;
            }
          }

          v13 = v26 + 1;
          v11 = v27;
          v12 = v24;
        }
        while (v26 + 1 != v25);
        v25 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v25);
    }

    objc_msgSend(v6, "key");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v23);
LABEL_19:

  }
}

+ (id)computeDominationForGraphImpl:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
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
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isLastLayer", (_QWORD)v13))
          objc_msgSend(a1, "computeDominationForLayer:dominationTree:", v11, v5);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)initDomTree:(id)a3
{
  id v5;
  _MLCANEDomTree *v6;
  _MLCANEDomTree *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEDomTree;
  v6 = -[_MLCANEDomTree init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dominationTree, a3);

  return v7;
}

- (NSDictionary)dominationTree
{
  return self->_dominationTree;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominationTree, 0);
}

@end
