@implementation AWPersistentDataManager

- (AWPersistentDataManager)init
{
  AWPersistentDataManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AWPersistentDataManager;
  v2 = -[AWPersistentDataManager init](&v6, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)loadPersistentData
{
  int v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  const char *v7;
  int v8;
  char v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  uint64_t *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *timer;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  double v22;
  NSObject *v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  double v27;
  objc_class *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  int *v35;
  char *v36;
  const char *v37;
  int *v38;
  char *v39;
  unint64_t v40;
  double v41;
  _QWORD handler[6];
  id v43;
  int v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v44 = -1;
  v3 = objc_msgSend((id)objc_opt_class(), "AWPersistentDataExists:", &v44);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      v7 = "false";
      *(_DWORD *)buf = 134218498;
      v46 = v6;
      v47 = 2080;
      v48 = "com.apple.AttentionAwareness";
      if (v3)
        v7 = "true";
      v49 = 2080;
      v50 = v7;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: found %s shm object: %s", buf, 0x20u);
    }

  }
  v8 = v44;
  if (v3)
  {
    if (v44 != -1)
      __assert_rtn("-[AWPersistentDataManager loadPersistentData]", "PersistentDataManager.m", 242, "fd == -1");
    v8 = shm_open("com.apple.AttentionAwareness", 514, 384);
    v44 = v8;
  }
  if (v8 == -1)
  {
    if (currentLogLevel < 3)
    {
      v10 = 0;
      goto LABEL_53;
    }
    _AALog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v33 = absTimeNS();
      if (v33 == -1)
        v34 = INFINITY;
      else
        v34 = (double)v33 / 1000000000.0;
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 134218498;
      v46 = v34;
      v47 = 2080;
      v48 = "com.apple.AttentionAwareness";
      v49 = 2080;
      v50 = v36;
      _os_log_error_impl(&dword_1AF589000, v18, OS_LOG_TYPE_ERROR, "%13.5f: AW SHARED MEM: failed to open %s shm object: %s", buf, 0x20u);
    }
    v10 = 0;
    goto LABEL_52;
  }
  v43 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "truncateAWPersistentData:error:", &v44, &v43);
  v10 = (char *)v43;
  if ((v9 & 1) == 0)
  {
    if (currentLogLevel < 3)
      goto LABEL_53;
    _AALog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v19 = absTimeNS();
    if (v19 == -1)
      v20 = INFINITY;
    else
      v20 = (double)v19 / 1000000000.0;
    *(_DWORD *)buf = 134218498;
    v46 = v20;
    v47 = 2080;
    v48 = "com.apple.AttentionAwareness";
    v49 = 2112;
    v50 = v10;
    v37 = "%13.5f: AW SHARED MEM: failed to truncate %s shm object: %@";
    goto LABEL_51;
  }
  v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
  v12 = mmap(0, *MEMORY[0x1E0C85AD8], 3, 1, v44, 0);
  self->_shm_obj = v12;
  if (v12 == (void *)-1)
  {
    if (currentLogLevel < 3)
      goto LABEL_53;
    _AALog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    v21 = absTimeNS();
    if (v21 == -1)
      v22 = INFINITY;
    else
      v22 = (double)v21 / 1000000000.0;
    v38 = __error();
    v39 = strerror(*v38);
    *(_DWORD *)buf = 134218498;
    v46 = v22;
    v47 = 2080;
    v48 = "com.apple.AttentionAwareness";
    v49 = 2080;
    v50 = v39;
    v37 = "%13.5f: AW SHARED MEM: failed to map %s shm object: %s";
LABEL_51:
    _os_log_error_impl(&dword_1AF589000, v18, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);
    goto LABEL_52;
  }
  v13 = (uint64_t *)v12;
  if (!v3)
  {
LABEL_34:
    objc_msgSend((id)objc_opt_class(), "initAWPersistentDataHeader:", v13);
    if ((unint64_t)(*v11 - 32) >= 0x58)
    {
      v24 = 0;
      v25 = v13 + 4;
      do
      {
        v25[10] = 0;
        *((_OWORD *)v25 + 3) = 0uLL;
        *((_OWORD *)v25 + 4) = 0uLL;
        *((_OWORD *)v25 + 1) = 0uLL;
        *((_OWORD *)v25 + 2) = 0uLL;
        *(_OWORD *)v25 = 0uLL;
        v25 += 11;
        ++v24;
      }
      while (v24 < (*v11 - 32) / 0x58uLL);
    }
    goto LABEL_37;
  }
  if (!objc_msgSend((id)objc_opt_class(), "validateAWPersistentDataHeader:", v12))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v40 = absTimeNS();
        if (v40 == -1)
          v41 = INFINITY;
        else
          v41 = (double)v40 / 1000000000.0;
        *(_DWORD *)buf = 134218242;
        v46 = v41;
        v47 = 2080;
        v48 = "com.apple.AttentionAwareness";
        _os_log_error_impl(&dword_1AF589000, v23, OS_LOG_TYPE_ERROR, "%13.5f: AW SHARED MEM: failed to validate %s shm object", buf, 0x16u);
      }

    }
    goto LABEL_34;
  }
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = v14;

  v16 = self->_timer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45__AWPersistentDataManager_loadPersistentData__block_invoke;
  handler[3] = &unk_1E5F8EB10;
  handler[4] = self;
  handler[5] = v13;
  dispatch_source_set_event_handler(v16, handler);
  v17 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v17, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_resume((dispatch_object_t)self->_timer);
LABEL_37:
  self->_loadAbsTime = absTimeNS();
  if (currentLogLevel < 6)
    goto LABEL_53;
  _AALog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v26 = absTimeNS();
    if (v26 == -1)
      v27 = INFINITY;
    else
      v27 = (double)v26 / 1000000000.0;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (char *)objc_claimAutoreleasedReturnValue();
    v30 = *v13;
    v31 = v13[1];
    v32 = (*v11 - 32) / 0x58uLL;
    *(_DWORD *)buf = 134219266;
    v46 = v27;
    v47 = 2112;
    v48 = v29;
    v49 = 2080;
    v50 = "com.apple.AttentionAwareness";
    v51 = 2048;
    v52 = v30;
    v53 = 2048;
    v54 = v31;
    v55 = 2048;
    v56 = v32;
    _os_log_impl(&dword_1AF589000, v18, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: %@ created successfully with %s shm object: shm version %llu, shm size %llu, shm max clients %lu", buf, 0x3Eu);

  }
LABEL_52:

LABEL_53:
  if (v44 != -1)
    close(v44);

}

- (BOOL)checkPreconditions:(id *)a3
{
  void *shm_obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  shm_obj = self->_shm_obj;
  if (a3 && !shm_obj)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return shm_obj != 0;
}

- (BOOL)isValidIndexForConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _DWORD *shm_obj;
  int v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  audit_token_t v16;

  v8 = a3;
  v9 = v8;
  if (a4 < 0 || a4 >= (*MEMORY[0x1E0C85AD8] - 32) / 0x58uLL)
  {
    if (!a5)
      goto LABEL_17;
    v13 = 34;
  }
  else
  {
    shm_obj = self->_shm_obj;
    if (*(_QWORD *)&shm_obj[22 * a4 + 26])
    {
      v11 = shm_obj[22 * a4 + 28];
      if (v11 == objc_msgSend(v8, "processIdentifier"))
      {
        v12 = shm_obj[22 * a4 + 29];
        if (v9)
          objc_msgSend(v9, "auditToken");
        else
          memset(&v16, 0, sizeof(v16));
        if (v12 == audit_token_to_pidversion(&v16))
        {
          v14 = 1;
          goto LABEL_18;
        }
      }
      if (a5)
      {
        v13 = 1;
        goto LABEL_9;
      }
LABEL_17:
      v14 = 0;
      goto LABEL_18;
    }
    if (!a5)
      goto LABEL_17;
    v13 = 22;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v13, 0, *(_OWORD *)v16.val, *(_OWORD *)&v16.val[4]);
  v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v14;
}

- (int)nextFreeIndex
{
  unint64_t v2;
  uint64_t v4;
  char *shm_obj;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  v2 = *MEMORY[0x1E0C85AD8] - 32;
  if (v2 < 0x58)
  {
LABEL_5:
    LODWORD(v4) = -1;
  }
  else
  {
    v4 = 0;
    shm_obj = (char *)self->_shm_obj;
    v6 = v2 / 0x58;
    v7 = (uint64_t *)(shm_obj + 104);
    while (1)
    {
      v8 = *v7;
      v7 += 11;
      if (!v8)
        break;
      if (v6 == ++v4)
        goto LABEL_5;
    }
  }
  return v4;
}

- (int)openWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  int v8;
  _DWORD *shm_obj;
  int v10;
  char *v11;
  _DWORD *v12;
  NSObject *v14;
  unint64_t v15;
  double v16;
  int v17;
  audit_token_t v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[AWPersistentDataManager checkPreconditions:](self, "checkPreconditions:", a4))
  {
LABEL_7:
    v8 = -1;
    goto LABEL_8;
  }
  v7 = -[AWPersistentDataManager nextFreeIndex](self, "nextFreeIndex");
  if (v7 == -1)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 28, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  v8 = v7;
  shm_obj = self->_shm_obj;
  v10 = v7;
  v11 = (char *)&shm_obj[22 * v7];
  *((_QWORD *)v11 + 14) = 0;
  v12 = v11 + 112;
  *((_OWORD *)v12 - 2) = 0u;
  *((_OWORD *)v12 - 1) = 0u;
  *((_OWORD *)v12 - 4) = 0u;
  *((_OWORD *)v12 - 3) = 0u;
  *((_OWORD *)v12 - 5) = 0u;
  *((_QWORD *)v12 - 1) = absTimeNS();
  *v12 = objc_msgSend(v6, "processIdentifier");
  if (v6)
    objc_msgSend(v6, "auditToken");
  else
    memset(&v18, 0, sizeof(v18));
  shm_obj[22 * v10 + 29] = audit_token_to_pidversion(&v18);
  if (currentLogLevel >= 6)
  {
    _AALog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = absTimeNS();
      if (v15 == -1)
        v16 = INFINITY;
      else
        v16 = (double)v15 / 1000000000.0;
      v17 = *v12;
      *(_DWORD *)buf = 134218496;
      v20 = v16;
      v21 = 1024;
      v22 = v8;
      v23 = 1024;
      v24 = v17;
      _os_log_impl(&dword_1AF589000, v14, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: opening index %d for client with pid %d", buf, 0x18u);
    }

  }
LABEL_8:

  return v8;
}

- (BOOL)closeWithConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  _DWORD *shm_obj;
  NSObject *v10;
  unint64_t v11;
  double v12;
  BOOL v13;
  int v14;
  int v16;
  double v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[AWPersistentDataManager checkPreconditions:](self, "checkPreconditions:", a5)
    && -[AWPersistentDataManager isValidIndexForConnection:index:error:](self, "isValidIndexForConnection:index:error:", v8, v6, a5))
  {
    shm_obj = self->_shm_obj;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = absTimeNS();
        if (v11 == -1)
          v12 = INFINITY;
        else
          v12 = (double)v11 / 1000000000.0;
        v14 = shm_obj[22 * (int)v6 + 28];
        v16 = 134218496;
        v17 = v12;
        v18 = 1024;
        v19 = v6;
        v20 = 1024;
        v21 = v14;
        _os_log_impl(&dword_1AF589000, v10, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: closing index %d for client with pid %d", (uint8_t *)&v16, 0x18u);
      }

    }
    *(_QWORD *)&shm_obj[22 * (int)v6 + 28] = 0;
    *(_OWORD *)&shm_obj[22 * (int)v6 + 20] = 0u;
    *(_OWORD *)&shm_obj[22 * (int)v6 + 24] = 0u;
    *(_OWORD *)&shm_obj[22 * (int)v6 + 12] = 0u;
    *(_OWORD *)&shm_obj[22 * (int)v6 + 16] = 0u;
    *(_OWORD *)&shm_obj[22 * (int)v6 + 8] = 0u;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- ($F484E3E6FD0A2BE9213BA906CF92CD29)clientStateWithConnection:(id)a3 index:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  char *v9;
  $F484E3E6FD0A2BE9213BA906CF92CD29 *v10;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (-[AWPersistentDataManager checkPreconditions:](self, "checkPreconditions:", a5)
    && -[AWPersistentDataManager isValidIndexForConnection:index:error:](self, "isValidIndexForConnection:index:error:", v8, v6, a5))
  {
    v9 = (char *)self->_shm_obj + 88 * (int)v6;
    v10 = ($F484E3E6FD0A2BE9213BA906CF92CD29 *)(v9 + 32);
    *((_QWORD *)v9 + 13) = absTimeNS();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__AWPersistentDataManager_loadPersistentData__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  double v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t *)MEMORY[0x1E0C85AD8];
  v2 = *MEMORY[0x1E0C85AD8];
  if ((unint64_t)(*MEMORY[0x1E0C85AD8] - 32) >= 0x58)
  {
    v5 = 0;
    v6 = 0;
    v3 = 0;
    v7 = 0uLL;
    do
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v8 + v5;
      v10 = *(_QWORD *)(v8 + v5 + 104);
      if (v10 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) > v10)
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = absTimeNS();
            if (v12 == -1)
              v13 = INFINITY;
            else
              v13 = (double)v12 / 1000000000.0;
            v14 = *(_DWORD *)(v8 + v5 + 112);
            *(_DWORD *)buf = 134218496;
            v19 = v13;
            v20 = 1024;
            v21 = v6;
            v22 = 1024;
            LODWORD(v23) = v14;
            _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: reclaiming index %d from client with pid %d", buf, 0x18u);
          }

          v7 = 0uLL;
        }
        *(_QWORD *)(v9 + 112) = 0;
        *(_OWORD *)(v9 + 80) = v7;
        *(_OWORD *)(v9 + 96) = v7;
        *(_OWORD *)(v9 + 48) = v7;
        *(_OWORD *)(v9 + 64) = v7;
        *(_OWORD *)(v9 + 32) = v7;
        ++v3;
        v2 = *v1;
      }
      ++v6;
      v5 += 88;
    }
    while (v6 < (v2 - 32) / 0x58uLL);
  }
  else
  {
    v3 = 0;
  }
  if (currentLogLevel > 5)
  {
    _AALog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = absTimeNS();
      if (v16 == -1)
        v17 = INFINITY;
      else
        v17 = (double)v16 / 1000000000.0;
      *(_DWORD *)buf = 134218496;
      v19 = v17;
      v20 = 1024;
      v21 = v3;
      v22 = 2048;
      v23 = 10;
      _os_log_impl(&dword_1AF589000, v15, OS_LOG_TYPE_DEFAULT, "%13.5f: AW SHARED MEM: reclaimed %d client entries %llu sec after AW service relaunch", buf, 0x1Cu);
    }

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_218);
  return (id)sharedManager_manager;
}

+ (BOOL)AWPersistentDataExists:(int *)a3
{
  int v4;

  if (!a3)
    __assert_rtn("+[AWPersistentDataManager AWPersistentDataExists:]", "PersistentDataManager.m", 77, "fildes");
  v4 = shm_open("com.apple.AttentionAwareness", 2562, 384);
  *a3 = v4;
  return v4 == -1 && *__error() == 17;
}

+ (void)initAWPersistentDataHeader:(id *)a3
{
  if (!a3)
    __assert_rtn("+[AWPersistentDataManager initAWPersistentDataHeader:]", "PersistentDataManager.m", 90, "hdr");
  *(_OWORD *)&a3->var0 = xmmword_1AF5B9130;
  a3->var2 = *MEMORY[0x1E0C85AD8];
  a3->var3 = 88;
}

+ (BOOL)validateAWPersistentDataHeader:(id *)a3
{
  uint64_t *v4;
  NSObject *v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t var0;
  const char *v16;
  unint64_t var1;
  unint64_t var2;
  uint64_t v19;
  unint64_t var3;
  int v21;
  double v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
    __assert_rtn("+[AWPersistentDataManager validateAWPersistentDataHeader:]", "PersistentDataManager.m", 99, "hdr");
  if (a3->var0 == 1)
  {
    if (a3->var1 == 32)
    {
      v4 = (uint64_t *)MEMORY[0x1E0C85AD8];
      if (a3->var2 == *MEMORY[0x1E0C85AD8])
      {
        if (a3->var3 == 88)
          return 1;
        if (currentLogLevel >= 3)
        {
          _AALog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v13 = absTimeNS();
            if (v13 == -1)
              v14 = INFINITY;
            else
              v14 = (double)v13 / 1000000000.0;
            var3 = a3->var3;
            v21 = 134218496;
            v22 = v14;
            v23 = 2048;
            v24 = var3;
            v25 = 2048;
            v26 = 88;
            v16 = "%13.5f: AW SHARED MEM: unexpected client size %llu, expected %llu";
LABEL_31:
            _os_log_error_impl(&dword_1AF589000, v6, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, 0x20u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
      }
      else if (currentLogLevel >= 3)
      {
        _AALog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v11 = absTimeNS();
          if (v11 == -1)
            v12 = INFINITY;
          else
            v12 = (double)v11 / 1000000000.0;
          var2 = a3->var2;
          v19 = *v4;
          v21 = 134218496;
          v22 = v12;
          v23 = 2048;
          v24 = var2;
          v25 = 2048;
          v26 = v19;
          v16 = "%13.5f: AW SHARED MEM: unexpected shared memory size %llu, expected %llu";
          goto LABEL_31;
        }
LABEL_32:

      }
    }
    else if (currentLogLevel >= 3)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = absTimeNS();
        if (v9 == -1)
          v10 = INFINITY;
        else
          v10 = (double)v9 / 1000000000.0;
        var1 = a3->var1;
        v21 = 134218496;
        v22 = v10;
        v23 = 2048;
        v24 = var1;
        v25 = 2048;
        v26 = 32;
        v16 = "%13.5f: AW SHARED MEM: unexpected header size %llu, expected %llu";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (currentLogLevel >= 3)
  {
    _AALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = absTimeNS();
      if (v7 == -1)
        v8 = INFINITY;
      else
        v8 = (double)v7 / 1000000000.0;
      var0 = a3->var0;
      v21 = 134218496;
      v22 = v8;
      v23 = 2048;
      v24 = var0;
      v25 = 2048;
      v26 = 1;
      v16 = "%13.5f: AW SHARED MEM: unexpected header version %llu, expected %llu";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  return 0;
}

+ (BOOL)truncateAWPersistentData:(int *)a3 error:(id *)a4
{
  int v5;
  off_t *v7;
  off_t v8;
  int v9;
  NSObject *v10;
  BOOL result;
  NSObject *v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  double v22;
  int *v23;
  char *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int *v28;
  char *v29;
  const char *v30;
  int *v31;
  char *v32;
  off_t v33;
  int *v34;
  char *v35;
  int *v36;
  char *v37;
  id v38;
  stat v39;
  uint8_t buf[4];
  double v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
    __assert_rtn("+[AWPersistentDataManager truncateAWPersistentData:error:]", "PersistentDataManager.m", 134, "fildes");
  v5 = *a3;
  if (*a3 == -1)
    __assert_rtn("+[AWPersistentDataManager truncateAWPersistentData:error:]", "PersistentDataManager.m", 135, "*fildes != -1");
  memset(&v39, 0, sizeof(v39));
  if (fstat(v5, &v39) == -1)
  {
    if (currentLogLevel < 3)
      goto LABEL_48;
    _AALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v21 = absTimeNS();
    if (v21 == -1)
      v22 = INFINITY;
    else
      v22 = (double)v21 / 1000000000.0;
    v23 = __error();
    v24 = strerror(*v23);
    *(_DWORD *)buf = 134218498;
    v41 = v22;
    v42 = 2080;
    v43 = "com.apple.AttentionAwareness";
    v44 = 2080;
    v45 = v24;
    v25 = "%13.5f: AW SHARED MEM: failed to fstat %s shm object: %s";
    v26 = v10;
    v27 = 32;
    goto LABEL_37;
  }
  v7 = (off_t *)MEMORY[0x1E0C85AD8];
  v8 = *MEMORY[0x1E0C85AD8];
  if (v39.st_size && v39.st_size != v8)
  {
    if (shm_unlink("com.apple.AttentionAwareness") == -1)
    {
      if (currentLogLevel < 3)
        goto LABEL_48;
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      v13 = absTimeNS();
      if (v13 == -1)
        v14 = INFINITY;
      else
        v14 = (double)v13 / 1000000000.0;
      v28 = __error();
      v29 = strerror(*v28);
      *(_DWORD *)buf = 134218498;
      v41 = v14;
      v42 = 2080;
      v43 = "com.apple.AttentionAwareness";
      v44 = 2080;
      v45 = v29;
      v30 = "%13.5f: AW SHARED MEM: failed to unlink %s shm object: %s";
    }
    else if (close(*a3) == -1)
    {
      if (currentLogLevel < 3)
        goto LABEL_48;
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      v15 = absTimeNS();
      if (v15 == -1)
        v16 = INFINITY;
      else
        v16 = (double)v15 / 1000000000.0;
      v31 = __error();
      v32 = strerror(*v31);
      *(_DWORD *)buf = 134218498;
      v41 = v16;
      v42 = 2080;
      v43 = "com.apple.AttentionAwareness";
      v44 = 2080;
      v45 = v32;
      v30 = "%13.5f: AW SHARED MEM: failed to close open fildes for %s shm object: %s";
    }
    else
    {
      v9 = shm_open("com.apple.AttentionAwareness", 514, 384);
      *a3 = v9;
      if (v9 != -1)
      {
        v8 = *v7;
        goto LABEL_15;
      }
      if (currentLogLevel < 3)
        goto LABEL_48;
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_47:

        goto LABEL_48;
      }
      v19 = absTimeNS();
      if (v19 == -1)
        v20 = INFINITY;
      else
        v20 = (double)v19 / 1000000000.0;
      v36 = __error();
      v37 = strerror(*v36);
      *(_DWORD *)buf = 134218498;
      v41 = v20;
      v42 = 2080;
      v43 = "com.apple.AttentionAwareness";
      v44 = 2080;
      v45 = v37;
      v30 = "%13.5f: AW SHARED MEM: failed to reopen %s shm object: %s";
    }
    _os_log_error_impl(&dword_1AF589000, v12, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
    goto LABEL_47;
  }
  if (v39.st_size)
    return 1;
  v9 = *a3;
LABEL_15:
  if (ftruncate(v9, v8) != -1)
    return 1;
  if (currentLogLevel >= 3)
  {
    _AALog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_48;
    }
    v17 = absTimeNS();
    if (v17 == -1)
      v18 = INFINITY;
    else
      v18 = (double)v17 / 1000000000.0;
    v33 = *v7;
    v34 = __error();
    v35 = strerror(*v34);
    *(_DWORD *)buf = 134218754;
    v41 = v18;
    v42 = 2080;
    v43 = "com.apple.AttentionAwareness";
    v44 = 2048;
    v45 = (char *)v33;
    v46 = 2080;
    v47 = v35;
    v25 = "%13.5f: AW SHARED MEM: failed to truncate %s shm object to %lu: %s";
    v26 = v10;
    v27 = 42;
LABEL_37:
    _os_log_error_impl(&dword_1AF589000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_12;
  }
LABEL_48:
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v38;
  return result;
}

void __40__AWPersistentDataManager_sharedManager__block_invoke()
{
  AWPersistentDataManager *v0;
  void *v1;

  v0 = objc_alloc_init(AWPersistentDataManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

@end
