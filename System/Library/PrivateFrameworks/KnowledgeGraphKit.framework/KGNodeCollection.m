@implementation KGNodeCollection

- (id)allObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[KGGraph implementation](self->super._graph, "implementation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->super._graph, "entityFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayOfNodesWithIdentifiers:entityFactory:error:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, char *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, char *))a4;
  -[KGElementCollection identifiers](self, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v24 = 0;
  -[KGGraph implementation](self->super._graph, "implementation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->super._graph, "entityFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEmpty") & 1) == 0)
  {
    v19 = a3;
    do
    {
      v11 = (void *)MEMORY[0x1CAA4B20C]();
      objc_msgSend(v8, "prefix:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subtractIdentifierSet:", v12);
      objc_msgSend(v9, "arrayOfNodesWithIdentifiers:entityFactory:error:", v12, v10, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            v6[2](v6, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), &v24);
            if (v24)
            {

              objc_autoreleasePoolPop(v11);
              goto LABEL_14;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v16)
            continue;
          break;
        }
      }

      objc_autoreleasePoolPop(v11);
      a3 = v19;
    }
    while ((objc_msgSend(v8, "isEmpty") & 1) == 0);
  }
LABEL_14:

}

- (void)enumerateNodesUsingBlock:(id)a3
{
  -[KGNodeCollection enumerateElementsWithBatchSize:usingBlock:](self, "enumerateElementsWithBatchSize:usingBlock:", 256, a3);
}

- (void)enumerateOrderedNodes:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, char *);
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  char v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, char *))a5;
  v35 = 0;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->super._graph, "entityFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    v13 = 0;
    v27 = a4;
    v28 = v10;
    v29 = v8;
    while (1)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1CAA4B20C]();
      v16 = objc_msgSend(v8, "count");
      v17 = v16 - v12 >= a4 ? a4 : v16 - v12;
      objc_msgSend(v8, "subarrayWithRange:", v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v13;
      v19 = v11;
      objc_msgSend(v10, "orderedArrayOfNodesWithIdentifiers:entityFactory:error:", v18, v11, &v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v34;

      if (!v20)
        break;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = v20;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v21);
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), &v35);
            if (v35)
            {
              v26 = v21;
              v10 = v28;
              goto LABEL_18;
            }
          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          if (v23)
            continue;
          break;
        }
      }

      v12 += v27;
      a4 = v27;

      objc_autoreleasePoolPop(v15);
      v8 = v29;
      v10 = v28;
      v11 = v19;
      if (v12 >= objc_msgSend(v29, "count"))
        goto LABEL_19;
    }
    KGLoggingConnection();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v21, OS_LOG_TYPE_ERROR, "failed loading ordered nodes: %@", buf, 0xCu);
    }
    v26 = 0;
LABEL_18:

    objc_autoreleasePoolPop(v15);
    v11 = v19;
    v8 = v29;
LABEL_19:

  }
}

- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  KGGraph *graph;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  graph = self->super._graph;
  v8 = a3;
  -[KGGraph implementation](graph, "implementation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "nodeIdentifiers:sortedByStringPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGNodeCollection enumerateOrderedNodes:withBatchSize:usingBlock:](self, "enumerateOrderedNodes:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  KGGraph *graph;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  graph = self->super._graph;
  v8 = a3;
  -[KGGraph implementation](graph, "implementation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "nodeIdentifiers:sortedByIntegerPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGNodeCollection enumerateOrderedNodes:withBatchSize:usingBlock:](self, "enumerateOrderedNodes:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
{
  id v6;
  KGGraph *graph;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  graph = self->super._graph;
  v8 = a3;
  -[KGGraph implementation](graph, "implementation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "nodeIdentifiers:sortedByFloatPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGNodeCollection enumerateOrderedNodes:withBatchSize:usingBlock:](self, "enumerateOrderedNodes:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)enumerateIdentifiersSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t, uint8_t *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, uint8_t *))a5;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "nodeIdentifiers:sortedByStringPropertyForName:ascending:limit:error:", v11, v8, v6, -1, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        if (buf[0])
          break;
        v9[2](v9, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "unsignedIntegerValue", (_QWORD)v19), buf);
        if (v16 == v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    KGLoggingConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }

}

- (void)enumerateIdentifiersSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t, uint8_t *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, uint8_t *))a5;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "nodeIdentifiers:sortedByIntegerPropertyForName:ascending:limit:error:", v11, v8, v6, -1, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        if (buf[0])
          break;
        v9[2](v9, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "unsignedIntegerValue", (_QWORD)v19), buf);
        if (v16 == v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    KGLoggingConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }

}

- (void)enumerateIdentifiersSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, uint8_t *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, uint8_t *))a5;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "nodeIdentifiers:sortedByFloatPropertyForName:ascending:limit:error:", v11, v8, v6, -1, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        if (buf[0])
          break;
        v9[2](v9, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "unsignedIntValue", (_QWORD)v19), buf);
        if (v16 == v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    KGLoggingConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }

}

- (void)enumerateIdentifiersSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, uint8_t *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, uint8_t *))a5;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGElementCollection identifiers](self, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "nodeIdentifiers:sortedByUnsignedIntegerPropertyForName:ascending:limit:error:", v11, v8, v6, -1, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v12;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        if (buf[0])
          break;
        v9[2](v9, objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "unsignedIntValue", (_QWORD)v19), buf);
        if (v16 == v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    KGLoggingConnection();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }

}

- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[KGGraph implementation](self->super._graph, "implementation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__KGNodeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke;
  v12[3] = &unk_1E83E4DD0;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  -[KGElementCollection enumerateElementIdentifierBatchesWithBatchSize:usingBlock:](self, "enumerateElementIdentifierBatchesWithBatchSize:usingBlock:", 256, v12);

}

void __60__KGNodeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertiesForNodesWithIdentifiers:propertyName:error:", a2, *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateUsingBlock:", *(_QWORD *)(a1 + 48));

}

@end
