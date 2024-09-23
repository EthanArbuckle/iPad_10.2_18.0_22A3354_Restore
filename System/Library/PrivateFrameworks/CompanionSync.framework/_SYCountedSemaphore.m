@implementation _SYCountedSemaphore

- (_SYCountedSemaphore)init
{
  return -[_SYCountedSemaphore initWithCount:](self, "initWithCount:", 1);
}

- (_SYCountedSemaphore)initWithCount:(int64_t)a3
{
  unsigned int v3;
  _SYCountedSemaphore *v4;
  _SYCountedSemaphore *v5;
  _SYCountedSemaphore *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SYCountedSemaphore;
  v4 = -[_SYCountedSemaphore init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    atomic_store(v3, (unsigned int *)&v4->_count);
    v6 = v4;
  }

  return v5;
}

- (void)invalidate
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_211704000, v2, v3, "Error destroying Mach semaphore: %d (%{public}s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)_ensureSemaphore
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_211704000, v2, v3, "Failed to create semaphore! %d (%{public}s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (BOOL)waitWithTimeout:(double)a3
{
  int *p_count;
  int v4;

  p_count = &self->_count;
  do
    v4 = __ldaxr((unsigned int *)p_count);
  while (__stxr(v4 - 1, (unsigned int *)p_count));
  return v4 > 0 || -[_SYCountedSemaphore _waitSemaphoreWithTimeout:](self, "_waitSemaphoreWithTimeout:", a3);
}

- (void)signal
{
  int *p_count;
  unsigned int v3;

  p_count = &self->_count;
  do
    v3 = __ldxr((unsigned int *)p_count);
  while (__stlxr(v3 + 1, (unsigned int *)p_count));
  if ((v3 & 0x80000000) != 0)
    -[_SYCountedSemaphore _signalSemaphore](self, "_signalSemaphore");
}

- (BOOL)_waitSemaphoreWithTimeout:(double)a3
{
  int *p_signals;
  unsigned __int8 v4;
  unint64_t v7;
  int *p_count;
  unsigned int v9;
  unsigned int v10;
  char v11;
  uint64_t v12;
  int v13;
  unsigned __int8 v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  semaphore_t v18;
  kern_return_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  mach_timespec_t v24;

  p_signals = &self->_signals;
  atomic_load((unsigned int *)&self->_signals);
  v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v4 & 1) != 0)
    goto LABEL_40;
  v7 = (unint64_t)(a3 * 1000000000.0);
  p_count = &self->_count;
  while (2)
  {
    v9 = atomic_load((unsigned int *)p_signals);
    while (v9)
    {
      v10 = __ldxr((unsigned int *)p_signals);
      if (v10 != v9)
      {
        __clrex();
LABEL_9:
        v11 = 0;
        goto LABEL_10;
      }
      if (__stxr(v9 - 1, (unsigned int *)p_signals))
        goto LABEL_9;
      v11 = 1;
LABEL_10:
      v9 = v10;
      if ((v11 & 1) != 0)
      {
        LOBYTE(v21) = 1;
        return v21;
      }
    }
    -[_SYCountedSemaphore _ensureSemaphore](self, "_ensureSemaphore");
    if (a3 < 0.0)
      goto LABEL_13;
    if (a3 == 0.0)
    {
LABEL_18:
      v15 = atomic_load((unsigned int *)p_count);
      while (1)
      {
        if ((v15 & 0x80000000) == 0)
          goto LABEL_13;
        v16 = __ldxr((unsigned int *)p_count);
        if (v16 != v15)
          break;
        if (__stxr(v15 + 1, (unsigned int *)p_count))
          goto LABEL_24;
        v17 = 1;
LABEL_25:
        v15 = v16;
        if ((v17 & 1) != 0)
          goto LABEL_40;
      }
      __clrex();
LABEL_24:
      v17 = 0;
      goto LABEL_25;
    }
    if (v7 == -1)
    {
      do
      {
LABEL_13:
        v12 = atomic_load(&self->_sem_port);
        v13 = MEMORY[0x212BE1160](v12);
      }
      while (v13 == 14);
      if (!v13)
      {
LABEL_15:
        LOBYTE(v21) = 0;
        v14 = atomic_load((unsigned __int8 *)&self->_invalidated);
        if ((v14 & 1) != 0)
          return v21;
        continue;
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v22 = (void *)_sync_log_facilities;
      v21 = os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT);
      if (v21)
      {
        -[_SYCountedSemaphore _waitSemaphoreWithTimeout:].cold.1(v22);
        goto LABEL_40;
      }
    }
    else
    {
      if (!v7)
        goto LABEL_18;
      do
      {
        v18 = atomic_load(&self->_sem_port);
        v24.tv_sec = v7 / 0x3B9ACA00;
        v24.tv_nsec = v7 % 0x3B9ACA00;
        v19 = semaphore_timedwait(v18, v24);
      }
      while (v19 == 14);
      if (!v19)
        goto LABEL_15;
      if (v19 == 49)
        goto LABEL_18;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v20 = (void *)_sync_log_facilities;
      v21 = os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT);
      if (v21)
      {
        -[_SYCountedSemaphore _waitSemaphoreWithTimeout:].cold.2(v20);
LABEL_40:
        LOBYTE(v21) = 0;
      }
    }
    return v21;
  }
}

- (void)_signalSemaphore
{
  int *p_signals;
  unsigned int v4;
  uint64_t v5;

  p_signals = &self->_signals;
  do
    v4 = __ldxr((unsigned int *)p_signals);
  while (__stxr(v4 + 1, (unsigned int *)p_signals));
  -[_SYCountedSemaphore _ensureSemaphore](self, "_ensureSemaphore");
  v5 = atomic_load(&self->_sem_port);
  if (MEMORY[0x212BE113C](v5))
    _os_assumes_log();
}

- (void)_waitSemaphoreWithTimeout:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_211704000, v2, v3, "Error draining semaphore: %d (%{public}s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)_waitSemaphoreWithTimeout:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_211704000, v2, v3, "Failed to wait on semaphore, but it didn't time out or abort: %d (%{public}s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
