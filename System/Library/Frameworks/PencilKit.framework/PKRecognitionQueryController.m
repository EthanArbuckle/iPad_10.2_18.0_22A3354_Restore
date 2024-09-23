@implementation PKRecognitionQueryController

- (id)initWithRecognitionSessionManager:(id *)a1
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v13;

  v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKRecognitionQueryController;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = a1[2];
      a1[2] = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = a1[3];
      a1[3] = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = a1[4];
      a1[4] = v8;

      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = a1[5];
      a1[5] = v10;

      objc_storeWeak(a1 + 6, v3);
    }
  }

  return a1;
}

- (void)removeQueryWithIdentifier:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v3 = a1[2];
    v6 = a2;
    objc_msgSend(v3, "objectForKey:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionQueryController _cleanupQuery:]((uint64_t)a1, v4);

    objc_msgSend(a1[3], "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionQueryController _cleanupQuery:]((uint64_t)a1, v5);

    objc_msgSend(a1[4], "removeObjectForKey:", v6);
    objc_msgSend(a1[2], "removeObjectForKey:", v6);
    objc_msgSend(a1[3], "removeObjectForKey:", v6);
    objc_msgSend(a1[5], "removeObjectForKey:", v6);

  }
}

- (void)_cleanupQuery:(uint64_t)a1
{
  id v2;

  if (a1)
  {
    v2 = a2;
    objc_msgSend(v2, "pause");
    objc_msgSend(v2, "setDelegate:", 0);
    objc_msgSend(v2, "teardown");

  }
}

- (id)visibleStrokesQueryWithIdentifier:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)drawingQueryWithIdentifier:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectForKey:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)updateQueriesIfNecessaryWithState:(id *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1[4], "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v3)
      goto LABEL_14;
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = (objc_class *)objc_msgSend(a1[4], "objectForKey:", v7);
        if (a2 == 3)
        {
          objc_msgSend(a1[2], "objectForKey:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = a1 + 2;
          if (v9)
            continue;
        }
        else
        {
          objc_msgSend(a1[3], "objectForKey:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = a1 + 3;
          if (v11)
            continue;
        }
        -[PKRecognitionQueryController setupAndStartQuery:]((uint64_t)a1, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v10, "setObject:forKeyedSubscript:", v12, v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v4)
      {
LABEL_14:

        return;
      }
    }
  }
}

- (id)setupAndStartQuery:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  if (a1)
  {
    v3 = [a2 alloc];
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = (void *)objc_msgSend(v3, "initWithRecognitionSessionManager:", WeakRetained);

    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "setDelegate:", v6);

    if (*(_BYTE *)(a1 + 8))
      objc_msgSend(v5, "setupForMath");
    objc_msgSend(v5, "start");
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setupVisibleStrokesQueries
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[PKRecognitionQueryController clearVisibleStrokesQueries](a1);
    -[PKRecognitionQueryController clearDrawingQueries](a1);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          -[PKRecognitionQueryController setupAndStartQuery:](a1, (Class)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v8, v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
}

- (void)setupDrawingQueriesIfNecessary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a1[4], "allKeys", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          v8 = (objc_class *)objc_msgSend(a1[4], "objectForKeyedSubscript:", v7);
          objc_msgSend(a1[2], "objectForKey:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
            -[PKRecognitionQueryController setupAndStartQuery:]((uint64_t)a1, v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[2], "setObject:forKey:", v10, v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1[5], "objectForKeyedSubscript:", v7);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setValidSuffixes:", v11);

            }
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

  }
}

- (void)setupForMath
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SEL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    a1[8] = 1;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(objc_getProperty(a1, a2, 24, 1), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v7++), "setupForMath");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(objc_getProperty(a1, v8, 16, 1), "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setupForMath");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
}

- (uint64_t)clearVisibleStrokesQueries
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(result + 24), "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          -[PKRecognitionQueryController _cleanupQuery:](v1, *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 24), "removeAllObjects");
  }
  return result;
}

- (uint64_t)clearDrawingQueries
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(result + 16), "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          -[PKRecognitionQueryController _cleanupQuery:](v1, *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    return objc_msgSend(*(id *)(v1 + 16), "removeAllObjects");
  }
  return result;
}

- (void)setSuffixes:(void *)a3 forQueryWithIdentifier:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToSet:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v5);
    objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setValidSuffixes:", v10);

  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recognitionManager);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_queriesToCreate, 0);
  objc_storeStrong((id *)&self->_visibleStrokeQueries, 0);
  objc_storeStrong((id *)&self->_drawingQueries, 0);
}

@end
