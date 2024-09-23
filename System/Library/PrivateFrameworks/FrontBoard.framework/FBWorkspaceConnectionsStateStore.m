@implementation FBWorkspaceConnectionsStateStore

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  uint8_t v16[16];

  v1 = (uint64_t *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*v1 + 32), *v2);
    v3 = *(_QWORD *)(*v1 + 40);
    if (v3 <= 0)
      v4 = -(-v3 & 3);
    else
      v4 = *(_QWORD *)(*v1 + 40) & 3;
    v5 = (void *)objc_opt_class();
    v6 = 8;
    if (((v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0)
      v6 = 16;
    if (objc_msgSend(v5, "_storeState:toPath:withGeneration:injectedFailure:", *v2, *(_QWORD *)(*v1 + v6), (v4 & 0xFFFFFFFFFFFFFFFELL) == 2, *v1 + 48))
    {
      v7 = v4 + 1;
      FBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_2();

      *(_QWORD *)(*v1 + 40) = v7;
      if (*(_QWORD *)(*v1 + 48) == 1)
      {
        *(_QWORD *)(*v1 + 48) = 0;
        FBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_1();

      }
      else if (v3)
      {
        v11 = (void *)objc_opt_class();
        v12 = 8;
        if (((v3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0)
          v12 = 16;
        objc_msgSend(v11, "_unlinkShmPath:graceful:", *(_QWORD *)(*v1 + v12), 0);
      }
    }
    else if (v3)
    {
      FBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_3(v10);

    }
    else
    {
      v13 = *v1;
      if (*(_QWORD *)(*v1 + 8) || *(_QWORD *)(v13 + 16))
      {
        if (*(_BYTE *)(v13 + 56))
        {
          v14 = OS_LOG_TYPE_DEBUG;
        }
        else
        {
          *(_BYTE *)(v13 + 56) = 1;
          v14 = OS_LOG_TYPE_ERROR;
        }
        FBLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, v14))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1A359A000, v15, v14, "failed to write new workspace connections state to shm - are we sandboxed?", v16, 2u);
        }

      }
    }
  }
}

+ (void)_unlinkShmPath:(id)a3 graceful:(BOOL)a4
{
  id v5;
  id v6;
  int *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char __strerrbuf[256];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B47FCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B4860);
  }

  *__error() = 0;
  v6 = objc_retainAutorelease(v5);
  if (shm_unlink((const char *)objc_msgSend(v6, "UTF8String")) && !a4)
  {
    v7 = __error();
    strerror_r(*v7, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:].cold.2();

  }
}

+ (BOOL)_storeState:(id)a3 toPath:(id)a4 withGeneration:(BOOL)a5 injectedFailure:(int64_t *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  int v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  int *v20;
  NSObject *v21;
  BOOL v22;
  unint64_t v23;
  size_t v24;
  int *v25;
  NSObject *v26;
  char *v27;
  uint64_t v28;
  NSObject *v29;
  int *v30;
  int *v31;
  NSObject *v32;
  NSObject *v34;
  char v35;
  int *v36;
  NSObject *v37;
  int *v38;
  NSObject *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  char *v46;
  _QWORD v47[8];
  _QWORD v48[4];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  char *v54;
  char __strerrbuf[4];
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  unint64_t v60;
  uint64_t v61;

  v7 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v10;
  NSClassFromString(CFSTR("FBWorkspaceConnectionsState"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.1();
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B4ECCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateClass]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.12();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B4F30);
  }

  v13 = v11;
  if (!v13)
  {
    if (a6)
    {
LABEL_19:
      v22 = 0;
      goto LABEL_42;
    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("failure"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B49FCLL);
  }
  NSClassFromString(CFSTR("NSString"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.11();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B4F94);
  }

  if (!a6)
    goto LABEL_13;
  *__error() = 0;
  v14 = objc_retainAutorelease(v13);
  v15 = shm_open((const char *)objc_msgSend(v14, "UTF8String"), 2562, 384);
  if (v15 < 0)
  {
    v20 = __error();
    strerror_r(*v20, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.10();

    goto LABEL_19;
  }
  v16 = v15;
  v17 = objc_msgSend(v12, "serializedDataLength");
  if (v17 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shmLength out of range"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.3();
    objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B4FECLL);
  }
  if (*a6 != 2)
  {
    v23 = v17;
    v24 = v17 + 1;
    *__error() = 0;
    if (ftruncate(v16, v24))
    {
      v25 = __error();
      strerror_r(*v25, __strerrbuf, 0x100uLL);
      FBLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.9();
    }
    else
    {
      if (*a6 == 3)
      {
        *a6 = 0;
        FBLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.6();
        goto LABEL_11;
      }
      *__error() = 0;
      v27 = (char *)mmap(0, v24, 2, 1, v16, 0);
      if (v27 != (char *)-1)
      {
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x2020000000;
        v48[3] = 0;
        v47[1] = 3221225472;
        v47[2] = __86__FBWorkspaceConnectionsStateStore__storeState_toPath_withGeneration_injectedFailure___block_invoke;
        v47[3] = &unk_1E4A146C8;
        v47[4] = v48;
        v47[5] = v23;
        v46 = v27;
        v47[0] = MEMORY[0x1E0C809B0];
        v47[6] = v27;
        v47[7] = 1;
        v28 = objc_msgSend(v12, "serializeToWriter:", v47);
        if (v28 == v23)
        {
          if (*a6 == 4)
          {
            *a6 = 0;
            FBLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.8();

            v22 = 0;
          }
          else
          {
            if (v7)
              v35 = 3;
            else
              v35 = 1;
            *v46 = v35;
            *__error() = 0;
            if (msync(v46, v24, 16) == -1)
            {
              v36 = __error();
              strerror_r(*v36, __strerrbuf, 0x100uLL);
              FBLogCommon();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                v45 = *__error();
                *(_DWORD *)buf = 138412802;
                v50 = v14;
                v51 = 1024;
                v52 = v45;
                v53 = 2080;
                v54 = __strerrbuf;
                _os_log_error_impl(&dword_1A359A000, v37, OS_LOG_TYPE_ERROR, "failed to msync %@ : errno=%i (%s)", buf, 0x1Cu);
              }

            }
            v22 = 1;
          }
        }
        else
        {
          FBLogCommon();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__strerrbuf = 138412802;
            v56 = v14;
            v57 = 2048;
            v58 = v28;
            v59 = 2048;
            v60 = v23;
            _os_log_error_impl(&dword_1A359A000, v34, OS_LOG_TYPE_ERROR, "data length inconsistent in %@ - unlinking : actual=%zi expected=%zu", (uint8_t *)__strerrbuf, 0x20u);
          }

          objc_msgSend(a1, "_unlinkShmPath:graceful:", v14, 0);
          v22 = 0;
        }
        *__error() = 0;
        if (munmap(v46, v24) == -1)
        {
          v38 = __error();
          strerror_r(*v38, __strerrbuf, 0x100uLL);
          FBLogCommon();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = *__error();
            *(_DWORD *)buf = 138412802;
            v50 = v14;
            v51 = 1024;
            v52 = v40;
            v53 = 2080;
            v54 = __strerrbuf;
            _os_log_error_impl(&dword_1A359A000, v39, OS_LOG_TYPE_ERROR, "failed to munmap %@ - unlinking : errno=%i (%s)", buf, 0x1Cu);
          }

          objc_msgSend(a1, "_unlinkShmPath:graceful:", v14, 0);
        }
        _Block_object_dispose(v48, 8);
        goto LABEL_38;
      }
      v30 = __error();
      strerror_r(*v30, __strerrbuf, 0x100uLL);
      FBLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.7();
    }

    objc_msgSend(a1, "_unlinkShmPath:graceful:", v14, 0);
    goto LABEL_37;
  }
  *a6 = 0;
  FBLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.5();
LABEL_11:

LABEL_37:
  v22 = 0;
LABEL_38:
  *__error() = 0;
  if (close(v16))
  {
    v31 = __error();
    strerror_r(*v31, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.4();

  }
LABEL_42:

  return v22;
}

uint64_t __86__FBWorkspaceConnectionsStateStore__storeState_toPath_withGeneration_injectedFailure___block_invoke(_QWORD *a1, const void *a2, size_t a3)
{
  unint64_t v3;
  size_t v4;
  size_t v6;
  size_t v7;

  v3 = a1[5];
  v4 = v3 - a3;
  if (v3 >= a3 && (v6 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), v6 <= v4))
  {
    v7 = a3;
    memcpy((void *)(a1[6] + a1[7] + v6), a2, a3);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v7;
  }
  else
  {
    *__error() = 14;
    return -1;
  }
  return v7;
}

- (void)setState:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  NSClassFromString(CFSTR("FBWorkspaceConnectionsState"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceConnectionsStateStore setState:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35BDE24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceConnectionsStateStore setState:].cold.1();
    goto LABEL_9;
  }

  v5 = (void *)objc_msgSend(v4, "copy");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FBWorkspaceConnectionsStateStore_setState___block_invoke;
  block[3] = &unk_1E4A11FD0;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (FBWorkspaceConnectionsStateStore)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBWorkspaceConnectionsStateStore *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBWorkspaceConnectionsStateStore *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBWorkspaceConnectionsStateStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBWorkspaceConnectionsStateStore.m");
    v17 = 1024;
    v18 = 73;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBWorkspaceConnectionsStateStore *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithIdentifier:(id)a3
{
  id v4;
  FBWorkspaceConnectionsStateStore *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSString *path1;
  uint64_t v10;
  NSString *path2;
  void *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  id result;
  void *v18;
  _QWORD block[4];
  FBWorkspaceConnectionsStateStore *v20;
  id v21;
  objc_super v22;

  v4 = a3;
  if (v4 && (NSClassFromString(CFSTR("NSString")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBWorkspaceConnectionsStateStore _initWithIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v22.receiver = self;
    v22.super_class = (Class)FBWorkspaceConnectionsStateStore;
    v5 = -[FBWorkspaceConnectionsStateStore init](&v22, sel_init);
    if (v5)
    {
      if (v4)
      {
        v6 = v4;
        if ((unint64_t)objc_msgSend(v6, "length") < 0x1A)
        {
          v7 = v6;
        }
        else
        {
          objc_msgSend(v6, "substringToIndex:", 25);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        v4 = v7;

        _pathForIdentifierAndBuffer(v4, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        path1 = v5->_path1;
        v5->_path1 = (NSString *)v8;

        _pathForIdentifierAndBuffer(v4, 1);
        v10 = objc_claimAutoreleasedReturnValue();
        path2 = v5->_path2;
        v5->_path2 = (NSString *)v10;

      }
      objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serviceClass:", 25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = BSDispatchQueueCreate();
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v14;

      v5->_queue_nextWriteFailure = 0;
      v16 = v5->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke;
      block[3] = &unk_1E4A11FD0;
      v20 = v5;
      v4 = v4;
      v21 = v4;
      dispatch_async(v16, block);

    }
    return v5;
  }
  return result;
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[12];
  __int16 v23;
  __int16 v24;

  v24 = 0;
  v1 = a1 + 32;
  objc_msgSend((id)objc_opt_class(), "_loadStateFromPath:outGeneration:outExisted:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v24 + 1, &v24);
  v2 = objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend((id)objc_opt_class(), "_loadStateFromPath:outGeneration:outExisted:", *(_QWORD *)(*(_QWORD *)v1 + 16), (char *)&v23 + 1, &v23);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 | v3)
  {
    if (v2)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
    {
      if (!v3)
      {
LABEL_21:
        FBLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_INFO, "restored previous workspace connections state (1)", v21, 2u);
        }

        objc_storeStrong((id *)(*(_QWORD *)v1 + 32), (id)v2);
        v7 = 3;
        if (!HIBYTE(v24))
          v7 = 1;
LABEL_25:
        *(_QWORD *)(*(_QWORD *)v1 + 40) = v7;
        FBLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_1();

        goto LABEL_31;
      }
    }
    else
    {
      v11 = HIBYTE(v24);
      v12 = HIBYTE(v23);
      v13 = (void *)objc_opt_class();
      v14 = 16;
      if (v11 == v12)
        v14 = 8;
      objc_msgSend(v13, "_unlinkShmPath:graceful:", *(_QWORD *)(*(_QWORD *)v1 + v14), 0);
      FBLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_2(v11 == v12, v15);

      if (v11 != v12)
        goto LABEL_21;
    }
    FBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A359A000, v6, OS_LOG_TYPE_INFO, "restored previous workspace connections state (2)", buf, 2u);
    }

    objc_storeStrong((id *)(*(_QWORD *)v1 + 32), v4);
    v7 = 4;
    if (!HIBYTE(v23))
      v7 = 2;
    goto LABEL_25;
  }
  v8 = v24 | v23;
  FBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_3();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "no previous workspace connections state - initializing", v20, 2u);
  }

  v18 = objc_opt_new();
  v19 = *(void **)(*(_QWORD *)v1 + 32);
  *(_QWORD *)(*(_QWORD *)v1 + 32) = v18;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = 0;
LABEL_31:

}

- (FBWorkspaceConnectionsState)state
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__FBWorkspaceConnectionsStateStore_state__block_invoke;
  v5[3] = &unk_1E4A12C98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBWorkspaceConnectionsState *)v3;
}

void __41__FBWorkspaceConnectionsStateStore_state__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (int64_t)_lastUsedBuffer
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__FBWorkspaceConnectionsStateStore__lastUsedBuffer__block_invoke;
  v5[3] = &unk_1E4A12C98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__FBWorkspaceConnectionsStateStore__lastUsedBuffer__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (void)_setFailureModeForNextWrite:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__FBWorkspaceConnectionsStateStore__setFailureModeForNextWrite___block_invoke;
  v4[3] = &unk_1E4A14678;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async_and_wait(queue, v4);
}

uint64_t __64__FBWorkspaceConnectionsStateStore__setFailureModeForNextWrite___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

+ (void)_unlinkAllForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _unlinkAllForIdentifier:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FE970);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _unlinkAllForIdentifier:].cold.1();
    goto LABEL_12;
  }

  v5 = v4;
  if ((unint64_t)objc_msgSend(v5, "length") < 0x1A)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "substringToIndex:", 25);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;

  _pathForIdentifierAndBuffer(v10, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unlinkShmPath:graceful:", v7, 1);

  _pathForIdentifierAndBuffer(v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unlinkShmPath:graceful:", v8, 1);

}

+ (id)_loadStateFromPath:(id)a3 outGeneration:(BOOL *)a4 outExisted:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int *v20;
  NSObject *v21;
  int *v22;
  NSObject *v23;
  int *v25;
  NSObject *v26;
  int *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  stat v34;
  uint64_t v35;
  char *v36;
  _QWORD v37[4];
  unint64_t v38;
  stat v39;
  char __strerrbuf[4];
  id v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  off_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.10();
      objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35FEFE8);
    }
  }

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("outGenerationTwiddle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.1();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FEF20);
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("outExisted"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FEF84);
  }
  if (!v8)
    goto LABEL_27;
  *__error() = 0;
  v9 = objc_retainAutorelease(v8);
  v10 = shm_open((const char *)objc_msgSend(v9, "UTF8String"), 0);
  if (v10 < 0)
  {
    if (*__error() == 2)
    {
      v18 = 0;
      goto LABEL_28;
    }
    v22 = __error();
    strerror_r(*v22, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.9();

LABEL_27:
    v18 = 0;
    *a5 = 0;
    goto LABEL_28;
  }
  v11 = v10;
  *a5 = 1;
  v12 = +[FBWorkspaceConnectionsState minimumSerializedDataLength](FBWorkspaceConnectionsState, "minimumSerializedDataLength");
  if (v12 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shmLength cannot exceed SSIZE_MAX"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.3();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35FF040);
  }
  v13 = v12;
  memset(&v39, 0, sizeof(v39));
  if (fstat(v11, &v39) || v39.st_size <= v13)
  {
    FBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.8();
  }
  else
  {
    *__error() = 0;
    v14 = (char *)mmap(0, v39.st_size, 1, 1, v11, 0);
    v15 = v14;
    if (v14 != (char *)-1)
    {
      v16 = *v14;
      if ((*v14 & 1) != 0)
      {
        v37[2] = 0x2020000000;
        v33[1] = 3221225472;
        v34 = v39;
        v37[3] = 0;
        v38 = -1;
        v37[0] = 0;
        v37[1] = v37;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[2] = __80__FBWorkspaceConnectionsStateStore__loadStateFromPath_outGeneration_outExisted___block_invoke;
        v33[3] = &unk_1E4A146A0;
        v33[4] = v37;
        v35 = 1;
        v36 = v14;
        +[FBWorkspaceConnectionsState deserializeLength:fromReader:](FBWorkspaceConnectionsState, "deserializeLength:fromReader:", &v38, v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 && v38 >= v13 && v38 <= 0x7FFFFFFFFFFFFFFDLL)
        {
          *a4 = (v16 & 2) != 0;
        }
        else
        {
          FBLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__strerrbuf = 138413058;
            v41 = v9;
            v42 = 2048;
            v43 = v13;
            v44 = 2048;
            v45 = v38;
            v46 = 2048;
            v47 = v39.st_size - 1;
            _os_log_error_impl(&dword_1A359A000, v26, OS_LOG_TYPE_ERROR, "data length inconsistent in %@ - unlinking : min=%zu actual=%zu expected=%llu", (uint8_t *)__strerrbuf, 0x2Au);
          }

          objc_msgSend(a1, "_unlinkShmPath:graceful:", v9, 0);
          v18 = 0;
        }
        _Block_object_dispose(v37, 8);
      }
      else
      {
        FBLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.7();

        objc_msgSend(a1, "_unlinkShmPath:graceful:", v9, 0);
        v18 = 0;
      }
      *__error() = 0;
      if (munmap(v15, v39.st_size) == -1)
      {
        v27 = __error();
        strerror_r(*v27, __strerrbuf, 0x100uLL);
        FBLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.6();

        objc_msgSend(a1, "_unlinkShmPath:graceful:", v9, 0);
      }
      goto LABEL_18;
    }
    v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.5();
  }

  objc_msgSend(a1, "_unlinkShmPath:graceful:", v9, 0);
  v18 = 0;
LABEL_18:
  *__error() = 0;
  if (close(v11))
  {
    v20 = __error();
    strerror_r(*v20, __strerrbuf, 0x100uLL);
    FBLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.4();

  }
LABEL_28:

  return v18;
}

size_t __80__FBWorkspaceConnectionsStateStore__loadStateFromPath_outGeneration_outExisted___block_invoke(_QWORD *a1, void *__dst, size_t a3)
{
  uint64_t v3;
  size_t v4;
  BOOL v5;
  size_t v6;
  size_t v8;
  size_t v9;

  v3 = a1[23];
  v4 = a1[17] - v3;
  v5 = v4 >= a3;
  v6 = v4 - a3;
  if (v5 && (v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), v8 <= v6))
  {
    v9 = a3;
    memcpy(__dst, (const void *)(a1[24] + v3 + v8), a3);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v9;
  }
  else
  {
    *__error() = 14;
    return -1;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path2, 0);
  objc_storeStrong((id *)&self->_path1, 0);
}

- (void)_initWithIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A359A000, v0, v1, "previous workspace connections = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_2(char a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
    v2 = 2;
  else
    v2 = 1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A359A000, a2, OS_LOG_TYPE_ERROR, "previous workspace connections state wasn't clean - resolving latest (%i)", (uint8_t *)v3, 8u);
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  _os_log_fault_impl(&dword_1A359A000, v0, OS_LOG_TYPE_FAULT, "all previous workspace connections states are bad : %@", v1, 0xCu);
  OUTLINED_FUNCTION_12();
}

- (void)setState:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  _os_log_error_impl(&dword_1A359A000, v0, OS_LOG_TYPE_ERROR, "simulating failure to purge old buffer : %@", v1, 0xCu);
  OUTLINED_FUNCTION_12();
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A359A000, v0, v1, "stored new workspace connections = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A359A000, log, OS_LOG_TYPE_FAULT, "workspace connections state desynced with shm", v1, 2u);
}

+ (void)_unlinkAllForIdentifier:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to close read of %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to mmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to munmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "validity check failed for %@ - unlinking", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1A359A000, v1, OS_LOG_TYPE_ERROR, "invalid size of %@ - unlinking : size=%lli", v2, 0x16u);
  OUTLINED_FUNCTION_12();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to read %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.10()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_unlinkShmPath:graceful:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_unlinkShmPath:graceful:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to unlink %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to close write of %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "simulating crash after opening new buffer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "simulating crash after resizing new buffer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to mmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6(&dword_1A359A000, v0, v1, "simulating crash after writing data to new buffer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to set the size of %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_5();
  __error();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_5_3(&dword_1A359A000, v0, v1, "failed to create %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_13();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.11()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.12()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
