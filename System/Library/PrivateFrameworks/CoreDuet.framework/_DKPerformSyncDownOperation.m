@implementation _DKPerformSyncDownOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peers:(void *)a6 policy:(void *)a7 type:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  id v20;
  id v21;
  objc_super v22;

  v14 = a3;
  v21 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)_DKPerformSyncDownOperation;
    v17 = (id *)objc_msgSendSuper2(&v22, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))-[_DKPerformSyncDownOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncDownOperation performSyncDown]((void **)&self->super.super.super.super.isa);
}

- (void)performSyncDown
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = (void *)objc_opt_new();
    if (objc_msgSend(a1[39], "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v4 = a1[39];
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        while (2)
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
            v10 = objc_opt_class();
            if ((+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, a1[41], v3, a1[38], v9, a1[40]) & 1) != 0)
            {

              goto LABEL_14;
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }

    }
    else
    {
      v11 = objc_opt_class();
      if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v11, a1[41], v3, a1[38], 0, a1[40]))
      {
LABEL_14:
        -[_DKPerformSyncDownOperation performSyncDown2](a1);
LABEL_16:

        return;
      }
    }
    objc_msgSend(a1, "endOperation", (_QWORD)v12);
    goto LABEL_16;
  }
}

- (void)performSyncDown2
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 304), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v4, v5, "%{public}@: Finding peers for sync down operation on transport %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end
