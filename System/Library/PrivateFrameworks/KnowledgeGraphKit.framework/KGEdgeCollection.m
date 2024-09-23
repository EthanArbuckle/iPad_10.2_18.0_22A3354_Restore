@implementation KGEdgeCollection

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
  objc_msgSend(v3, "arrayOfEdgesWithIdentifiers:entityFactory:error:", v4, v5, 0);
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
      objc_msgSend(v9, "arrayOfEdgesWithIdentifiers:entityFactory:error:", v12, v10, 0);
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

- (void)enumerateEdgesUsingBlock:(id)a3
{
  -[KGEdgeCollection enumerateElementsWithBatchSize:usingBlock:](self, "enumerateElementsWithBatchSize:usingBlock:", 256, a3);
}

- (void)enumerateOrderedEdges:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, char *);
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  char v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, char *))a5;
  v33 = 0;
  -[KGGraph implementation](self->super._graph, "implementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KGGraph entityFactory](self->super._graph, "entityFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    v13 = 0;
    v26 = v10;
    v27 = v8;
    v25 = a4;
    while (1)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1CAA4B20C]();
      objc_msgSend(v8, "subarrayWithRange:", v12, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v13;
      v17 = v11;
      objc_msgSend(v10, "orderedArrayOfEdgesWithIdentifiers:entityFactory:error:", v16, v11, &v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v32;

      if (!v18)
        break;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v19 = v18;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v29 != v22)
              objc_enumerationMutation(v19);
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), &v33);
            if (v33)
            {
              v24 = v19;
              v10 = v26;
              goto LABEL_15;
            }
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v21)
            continue;
          break;
        }
      }

      v12 += v25;
      a4 = v25;

      objc_autoreleasePoolPop(v15);
      v8 = v27;
      v10 = v26;
      v11 = v17;
      if (v12 >= objc_msgSend(v27, "count"))
        goto LABEL_16;
    }
    KGLoggingConnection();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_error_impl(&dword_1CA0A5000, v19, OS_LOG_TYPE_ERROR, "failed loading ordered edges: %@", buf, 0xCu);
    }
    v24 = 0;
LABEL_15:

    objc_autoreleasePoolPop(v15);
    v8 = v27;
    v11 = v17;
LABEL_16:

  }
}

- (void)enumerateEdgesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
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
  objc_msgSend(v9, "edgeIdentifiers:sortedByStringPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGEdgeCollection enumerateOrderedEdges:withBatchSize:usingBlock:](self, "enumerateOrderedEdges:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)enumerateEdgesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
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
  objc_msgSend(v9, "edgeIdentifiers:sortedByIntegerPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGEdgeCollection enumerateOrderedEdges:withBatchSize:usingBlock:](self, "enumerateOrderedEdges:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
    }

  }
}

- (void)enumerateEdgesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
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
  objc_msgSend(v9, "edgeIdentifiers:sortedByFloatPropertyForName:ascending:limit:error:", v10, v8, 1, -1, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[KGEdgeCollection enumerateOrderedEdges:withBatchSize:usingBlock:](self, "enumerateOrderedEdges:withBatchSize:usingBlock:", v11, 256, v6);
  }
  else
  {
    KGLoggingConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1CA0A5000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
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
  v12[2] = __60__KGEdgeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke;
  v12[3] = &unk_1E83E4DD0;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  -[KGElementCollection enumerateElementIdentifierBatchesWithBatchSize:usingBlock:](self, "enumerateElementIdentifierBatchesWithBatchSize:usingBlock:", 256, v12);

}

void __60__KGEdgeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertiesForEdgesWithIdentifiers:propertyName:error:", a2, *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateUsingBlock:", *(_QWORD *)(a1 + 48));

}

@end
