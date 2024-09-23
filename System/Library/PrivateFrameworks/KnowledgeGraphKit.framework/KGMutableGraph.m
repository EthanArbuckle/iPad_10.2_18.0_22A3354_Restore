@implementation KGMutableGraph

- (KGMutableGraph)initWithMutableImplementation:(id)a3 entityFactory:(id)a4
{
  KGMutableGraph *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *transactionQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KGMutableGraph;
  v4 = -[KGGraph initWithImplementation:entityFactory:](&v8, sel_initWithImplementation_entityFactory_, a3, a4);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.kgdb.changes", 0);
    transactionQueue = v4->_transactionQueue;
    v4->_transactionQueue = (OS_dispatch_queue *)v5;

  }
  return v4;
}

- (BOOL)_applyNodeChangeRequests:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "node", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "identifier");

        objc_msgSend(v11, "properties");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "updateNodeForIdentifier:withProperties:error:", v13, v15, a4);

          if (!v17)
          {
            v18 = 0;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_12:

  return v18;
}

- (BOOL)_applyEdgeChangeRequests:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "edge", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "identifier");

        objc_msgSend(v11, "properties");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "updateEdgeForIdentifier:withProperties:error:", v13, v15, a4);

          if (!v17)
          {
            v18 = 0;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_12:

  return v18;
}

- (BOOL)_performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  NSObject *v24;
  id v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodesToInsert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "addNodes:error:", v8, a4);

  if (!v9)
    goto LABEL_8;
  -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgesToInsert");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "addEdges:error:", v11, a4);

  if (!v12)
    goto LABEL_8;
  objc_msgSend(v6, "nodeUpdates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[KGMutableGraph _applyNodeChangeRequests:error:](self, "_applyNodeChangeRequests:error:", v13, a4);

  if (!v14)
    goto LABEL_8;
  objc_msgSend(v6, "edgeUpdates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[KGMutableGraph _applyEdgeChangeRequests:error:](self, "_applyEdgeChangeRequests:error:", v15, a4);

  if (!v16)
    goto LABEL_8;
  -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgeIdentifiersToRemove");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "removeEdgesForIdentifiers:error:", v18, a4);

  if (!v19)
    goto LABEL_8;
  -[KGMutableGraph mutableImplementation](self, "mutableImplementation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeIdentifiersToRemove");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "removeNodesForIdentifiers:error:", v21, a4);

  if ((v22 & 1) != 0)
  {
    v23 = 1;
  }
  else
  {
LABEL_8:
    KGLoggingConnection();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = *a4;
      v27 = 138412290;
      v28 = v26;
      _os_log_error_impl(&dword_1CA0A5000, v24, OS_LOG_TYPE_ERROR, "Error with applying mutations (%@)", (uint8_t *)&v27, 0xCu);
    }

    v23 = 0;
  }
  objc_msgSend(v6, "setResolved");

  return v23;
}

- (BOOL)performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *transactionQueue;
  id v8;
  uint64_t *v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6140;
  v20 = __Block_byref_object_dispose__6141;
  v21 = 0;
  transactionQueue = self->_transactionQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__KGMutableGraph_performChangesAndWait_error___block_invoke;
  v12[3] = &unk_1E83E63A0;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(transactionQueue, v12);
  v9 = v23;
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = v23;
  }
  v10 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionQueue, 0);
}

void __46__KGMutableGraph_performChangesAndWait_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_performChangesAndWait:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

@end
