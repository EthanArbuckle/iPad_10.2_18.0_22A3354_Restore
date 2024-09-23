@implementation FBWorkspaceConnectionsState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidSet, 0);
}

- (BOOL)isEqual:(id)a3
{
  FBWorkspaceConnectionsState *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (FBWorkspaceConnectionsState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      v7 = -[NSMutableIndexSet isEqualToIndexSet:](self->_pidSet, "isEqualToIndexSet:", v4->_pidSet);
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)serializedDataLength
{
  return 4 * -[NSMutableIndexSet count](self->_pidSet, "count") + 4;
}

- (int64_t)serializeToWriter:(id)a3
{
  uint64_t (**v4)(id, _DWORD *, uint64_t);
  uint64_t v5;
  NSMutableIndexSet *pidSet;
  uint64_t *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int *v17;
  NSObject *v18;
  int v20;
  int v21;
  _QWORD v22[4];
  uint64_t (**v23)(id, _DWORD *, uint64_t);
  uint64_t *v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  char *v35;
  char __strerrbuf[256];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _DWORD *, uint64_t))a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if ((unint64_t)-[NSMutableIndexSet count](self->_pidSet, "count") >> 31)
  {
    FBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBWorkspaceConnectionsState serializeToWriter:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = -1;
    v27[3] = -1;
  }
  else
  {
    v25 = -[NSMutableIndexSet count](self->_pidSet, "count");
    v5 = v4[2](v4, &v25, 4);
    if (v5 < 0)
    {
      v17 = __error();
      strerror_r(*v17, __strerrbuf, 0x100uLL);
      FBLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = v25;
        v21 = *__error();
        *(_DWORD *)buf = 67109634;
        v31 = v20;
        v32 = 1024;
        v33 = v21;
        v34 = 2080;
        v35 = __strerrbuf;
        _os_log_error_impl(&dword_1A359A000, v18, OS_LOG_TYPE_ERROR, "failed to write count (%i) : errno=%i (%s)", buf, 0x18u);
      }

      v7 = v27;
      v27[3] = -1;
    }
    else
    {
      v27[3] += v5;
      pidSet = self->_pidSet;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke;
      v22[3] = &unk_1E4A135D8;
      v23 = v4;
      v24 = &v26;
      -[NSMutableIndexSet enumerateIndexesUsingBlock:](pidSet, "enumerateIndexesUsingBlock:", v22);

      v7 = v27;
    }
    v16 = v7[3];
  }
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke(uint64_t a1, int a2, _BYTE *a3)
{
  uint64_t v5;
  int *v6;
  NSObject *v7;
  int v8;
  char __strerrbuf[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v5 < 0)
  {
    v6 = __error();
    strerror_r(*v6, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke_cold_1();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    *a3 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
  }
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBWorkspaceConnectionsState;
  return -[FBWorkspaceConnectionsState copy](&v3, sel_copy);
}

- (id)_initWithIndexSet:(id)a3
{
  id v4;
  FBWorkspaceConnectionsState *v5;
  uint64_t v6;
  NSMutableIndexSet *pidSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBWorkspaceConnectionsState;
  v5 = -[FBWorkspaceConnectionsState init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    pidSet = v5->_pidSet;
    v5->_pidSet = (NSMutableIndexSet *)v6;

  }
  return v5;
}

- (FBWorkspaceConnectionsState)init
{
  return (FBWorkspaceConnectionsState *)-[FBWorkspaceConnectionsState _initWithIndexSet:](self, "_initWithIndexSet:", 0);
}

- (NSSet)processIdentifiers
{
  void *v3;
  NSMutableIndexSet *pidSet;
  id v5;
  _QWORD v7[4];
  id v8;

  if (-[NSMutableIndexSet count](self->_pidSet, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableIndexSet count](self->_pidSet, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    pidSet = self->_pidSet;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__FBWorkspaceConnectionsState_processIdentifiers__block_invoke;
    v7[3] = &unk_1E4A135B0;
    v5 = v3;
    v8 = v5;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](pidSet, "enumerateIndexesUsingBlock:", v7);

    return (NSSet *)v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

void __49__FBWorkspaceConnectionsState_processIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)mutableCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBWorkspaceConnectionsState;
  return -[FBWorkspaceConnectionsState mutableCopy](&v3, sel_mutableCopy);
}

+ (unint64_t)minimumSerializedDataLength
{
  return 4;
}

+ (id)deserializeLength:(unint64_t *)a3 fromReader:(id)a4
{
  uint64_t (**v5)(id, int *, uint64_t);
  id *v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  id *v11;
  int *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  NSObject *v22;
  int v24;
  int v25;
  char __strerrbuf[256];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(id, int *, uint64_t))a4;
  v6 = (id *)objc_opt_new();
  v25 = 0;
  v7 = v5[2](v5, &v25, 4);
  if (v7 < 0)
  {
    v12 = __error();
    strerror_r(*v12, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsState deserializeLength:fromReader:].cold.4((uint64_t)__strerrbuf, v13);
  }
  else
  {
    v8 = v7;
    if (v25 < 1)
    {
LABEL_8:
      if (a3)
        *a3 = v8;
      v11 = v6;
      goto LABEL_22;
    }
    v9 = 0;
    while ((uint64_t)(v8 + 4) >= 0)
    {
      v24 = -1;
      v10 = v5[2](v5, &v24, 4);
      if (v10 < 0)
      {
        v21 = __error();
        strerror_r(*v21, __strerrbuf, 0x100uLL);
        FBLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[FBWorkspaceConnectionsState deserializeLength:fromReader:].cold.2();
        goto LABEL_20;
      }
      if (v24 <= 0)
      {
        FBLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          +[FBWorkspaceConnectionsState deserializeLength:fromReader:].cold.1(v9, &v24, v22);
LABEL_20:

        goto LABEL_21;
      }
      v8 += v10;
      objc_msgSend(v6[1], "addIndex:");
      if (++v9 >= v25)
        goto LABEL_8;
    }
    FBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBWorkspaceConnectionsState serializeToWriter:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

LABEL_21:
  v11 = 0;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  return -[NSMutableIndexSet hash](self->_pidSet, "hash");
}

- (id)description
{
  void *v3;
  NSMutableIndexSet *pidSet;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, unint64_t);
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pidSet = self->_pidSet;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__FBWorkspaceConnectionsState_description__block_invoke;
  v11 = &unk_1E4A13600;
  v12 = v3;
  v5 = v3;
  -[NSMutableIndexSet enumerateRangesUsingBlock:](pidSet, "enumerateRangesUsingBlock:", &v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p pids=%@>"), objc_opt_class(), self, v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __42__FBWorkspaceConnectionsState_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v8);

  if (a3 >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("-"));
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 + a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBWorkspaceConnectionsState _initWithIndexSet:]([FBMutableWorkspaceConnectionsState alloc], "_initWithIndexSet:", self->_pidSet);
}

- (void)serializeToWriter:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A359A000, a1, a3, "data section is too large", a5, a6, a7, a8, 0);
}

void __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_1A359A000, v0, v1, "failed to write pid (%i) : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_2();
}

+ (void)deserializeLength:(os_log_t)log fromReader:.cold.1(int a1, int *a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1 + 1;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1A359A000, log, OS_LOG_TYPE_ERROR, "pid %i is invalid (%i)", (uint8_t *)v4, 0xEu);
}

+ (void)deserializeLength:fromReader:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_1A359A000, v0, v1, "failed to read pid %i : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_2();
}

+ (void)deserializeLength:(uint64_t)a1 fromReader:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5[0] = 67109378;
  v5[1] = v4;
  v6 = 2080;
  v7 = a1;
  _os_log_error_impl(&dword_1A359A000, a2, OS_LOG_TYPE_ERROR, "failed to read count : errno=%i (%s)", (uint8_t *)v5, 0x12u);
}

@end
