@implementation HTMonitorPidHangEvent

- (id)initHTMonitorPidHangEvent:(id *)a3 shmem_size:(unint64_t)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HTMonitorPidHangEvent;
  result = -[HTMonitorPidHangEvent init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  munmap(self->_shmem_region, self->_shmem_size);
  self->_shmem_region = 0;
  self->_shmem_size = 0;
  v3.receiver = self;
  v3.super_class = (Class)HTMonitorPidHangEvent;
  -[HTMonitorPidHangEvent dealloc](&v3, sel_dealloc);
}

+ (void)checkHangForPid:(int)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)pidHangEventDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  shared_ht_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = pidHangEventDict;
    _os_log_impl(&dword_1AF62F000, v7, OS_LOG_TYPE_INFO, "HangTracerMonitor:checkHangForPid pidHangEventDict  %@", buf, 0xCu);
  }

  if (v6)
  {
    v8 = *(_DWORD *)(v6[1] + 4);
    shared_ht_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (!v10)
        goto LABEL_13;
      v11 = *(_DWORD *)(v6[1] + 4);
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v11;
      v12 = "HangTracerMonitor:checkHangForPid number of hang Events =  %d";
      v13 = v9;
      v14 = 8;
    }
    else
    {
      if (!v10)
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v12 = "HangTracerMonitor:checkHangForPid number of hang Events is 0";
      v13 = v9;
      v14 = 2;
    }
    _os_log_impl(&dword_1AF62F000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
LABEL_13:

    v16 = v6[1];
    if (*(_DWORD *)(v16 + 4))
    {
      v17 = 0;
      v18 = 32;
      do
      {
        v19 = (unsigned int *)(v16 + v18);
        if (atomic_load(v19))
        {
          shared_ht_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v23) = a3;
            _os_log_impl(&dword_1AF62F000, v21, OS_LOG_TYPE_INFO, "HangTracerMonitor:checkHangForPid hang event suspend count is not 0 for pid=%u ", buf, 8u);
          }

        }
        else
        {
          HTCheckForHangForHTMonitor((uint64_t)(v19 - 6), v6[1] + 3080);
        }
        ++v17;
        v16 = v6[1];
        v18 += 384;
      }
      while (v17 < *(unsigned int *)(v16 + 4));
    }
    goto LABEL_21;
  }
  shared_ht_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = a3;
    _os_log_impl(&dword_1AF62F000, v15, OS_LOG_TYPE_DEFAULT, "HangTracerMonitor:checkHangForPid(pid=%u) is not present in pidHangEventDict ", buf, 8u);
  }

LABEL_21:
}

- ($2B1CEEAC013A2A6D6A5F780F196821AB)shmem_region
{
  return self->_shmem_region;
}

- (unint64_t)shmem_size
{
  return self->_shmem_size;
}

@end
