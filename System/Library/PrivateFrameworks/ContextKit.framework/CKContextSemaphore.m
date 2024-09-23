@implementation CKContextSemaphore

- (void)setActiveGauge:(unint64_t)a3
{
  atomic_store(a3, &self->_shm->var0);
}

- (BOOL)tryAcquireNeedsIncPending:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];

  v3 = a3;
  if (-[CKContextSemaphore busy](self, "busy"))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C81028];
    while (-[CKContextSemaphore waitFor:](self, "waitFor:", 0.1) >= 1)
    {
      v7 = mach_absolute_time();
      if (v5)
      {
        if (kMaxTryAcquireTimeNanos)
          v8 = 60000000000;
        else
          v8 = 0;
        if ((v7 - v5) * sTimebaseInfo / dword_1ECF9183C > v8)
        {
          v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[CKContextSemaphore tryAcquireNeedsIncPending:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
            LOBYTE(v9) = 0;
          }
          return v9;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1A1AA2000, v6, OS_LOG_TYPE_INFO, "tryAcquire delay", v18, 2u);
        }
      }
      else
      {
        v5 = v7;
      }
      if (!-[CKContextSemaphore busy](self, "busy"))
        break;
    }
  }
  if (v3)
    -[CKContextSemaphore incPending](self, "incPending");
  LOBYTE(v9) = 1;
  return v9;
}

- (void)incPending
{
  int *p_var4;
  unsigned int v4;
  unsigned int *p_var7;
  unsigned int v6;

  atomic_store(mach_absolute_time(), &self->_shm->var6);
  p_var4 = &self->_shm->var4;
  do
    v4 = __ldaxr((unsigned int *)p_var4);
  while (__stlxr(v4 + 1, (unsigned int *)p_var4));
  p_var7 = &self->_shm->var7;
  do
    v6 = __ldaxr(p_var7);
  while (__stlxr(v6 + 1, p_var7));
}

- (BOOL)busy
{
  return -[CKContextSemaphore gauge](self, "gauge") != 0;
}

- (unint64_t)gauge
{
  unint64_t v2;
  int v3;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *p_var5;
  unsigned int v17;

  v2 = atomic_load(&self->_shm->var0);
  v3 = atomic_load((unsigned int *)&self->_shm->var4);
  if (v3 >= 1)
  {
    v5 = atomic_load(&self->_shm->var6);
    v6 = (mach_absolute_time() - v5) * sTimebaseInfo / dword_1ECF9183C;
    v7 = 1000000000;
    if (!kMaxPendingTimeNanos)
      v7 = 0;
    if (v6 <= v7)
    {
      v2 += v3;
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v8)
        -[CKContextSemaphore gauge].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      -[CKContextSemaphore resetPending](self, "resetPending");
      p_var5 = &self->_shm->var5;
      do
        v17 = __ldaxr((unsigned int *)p_var5);
      while (__stlxr(v17 + 1, (unsigned int *)p_var5));
    }
  }
  return v2;
}

- (void)resetPending
{
  atomic_store(mach_absolute_time(), &self->_shm->var6);
  atomic_store(0, (unsigned int *)&self->_shm->var4);
}

- (void)gauge
{
  OUTLINED_FUNCTION_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "Detected stale pending counter; resetting to 0",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_2();
}

- (void)notify
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "semaphore_signal failed with %i: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!dword_1ECF9183C)
      mach_timebase_info((mach_timebase_info_t)&sTimebaseInfo);
    kMaxTryAcquireTimeNanos = 1;
    kMaxPendingTimeNanos = 1;
  }
}

- (id)initSemaphoreForXPCService
{
  CKContextSemaphore *v2;
  CKContextSemaphore *v3;
  vm_map_t *v4;
  kern_return_t v5;
  mach_error_t v6;
  kern_return_t v7;
  mach_error_t v8;
  CKContextSemaphore *v9;
  void *v10;
  OS_xpc_object *v11;
  OS_xpc_object *shmObject;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *region;
  semaphore_t semaphore;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKContextSemaphore;
  v2 = -[CKContextSemaphore init](&v24, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_11;
  v2->_shmSize = 40;
  semaphore = 0;
  v4 = (vm_map_t *)MEMORY[0x1E0C83DA0];
  v5 = semaphore_create(*MEMORY[0x1E0C83DA0], &semaphore, 0, 0);
  if (!v5)
  {
    v3->_sema = semaphore;
    v3->_semaOwner = 1;
    region = 0;
    v7 = vm_allocate(*v4, (vm_address_t *)&region, 0x28uLL, 1);
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[CKContextSemaphore initSemaphoreForXPCService].cold.2(v8);
      goto LABEL_8;
    }
    v10 = region;
    v3->_shm = ($DAEF8D68CAA1A328661E3A0179F40554 *)region;
    v11 = (OS_xpc_object *)xpc_shmem_create(v10, 0x28uLL);
    if (!v11)
    {
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v14)
        -[CKContextSemaphore initSemaphoreForXPCService].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
      goto LABEL_8;
    }
    shmObject = v3->_shmObject;
    v3->_shmObject = v11;

LABEL_11:
    v9 = v3;
    goto LABEL_12;
  }
  v6 = v5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[CKContextSemaphore initSemaphoreForXPCService].cold.3(v6);
LABEL_8:
  v9 = 0;
LABEL_12:

  return v9;
}

- (CKContextSemaphore)initWithCoder:(id)a3
{
  id v4;
  CKContextSemaphore *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  OS_xpc_object *shmObject;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CKContextSemaphore *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKContextSemaphore;
  v5 = -[CKContextSemaphore init](&v28, sel_init);
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5->_semaOwner = 0;
    v6 = v4;
    v7 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("shm_size"));
    v5->_shmSize = v7;
    if (v7 <= 0x27)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[CKContextSemaphore initWithCoder:].cold.1((uint64_t)&v5->_shmSize, v8, v9, v10, v11, v12, v13, v14);
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("semaphore_obj"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sema = xpc_mach_send_copy_right();
    objc_msgSend(v6, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81388], CFSTR("shm_obj"));
    v16 = objc_claimAutoreleasedReturnValue();
    shmObject = v5->_shmObject;
    v5->_shmObject = (OS_xpc_object *)v16;

    v18 = xpc_shmem_map(v5->_shmObject, (void **)&v5->_shm);
    v19 = v18;
    if (v18 < v5->_shmSize)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[CKContextSemaphore initWithCoder:].cold.2((uint64_t)&v5->_shmSize, v19, v20, v21, v22, v23, v24, v25);

      goto LABEL_10;
    }
    v5->_shmSize = v18;

LABEL_13:
    v26 = v5;
    goto LABEL_14;
  }
LABEL_11:
  v26 = 0;
LABEL_14:

  return v26;
}

- (void)dealloc
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "vm_deallocate failed with %i: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (unint64_t)sharedMemorySize
{
  return self->_shmSize;
}

- (unint64_t)activeGauge
{
  return atomic_load(&self->_shm->var0);
}

- (int64_t)pending
{
  return (int)atomic_load((unsigned int *)&self->_shm->var4);
}

- (void)decPending
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = a1;
  _os_log_debug_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "pending count turned negative; oldVal=%ld",
    (uint8_t *)&v1,
    0xCu);
  OUTLINED_FUNCTION_3();
}

- (int64_t)pendingExceptionsCount
{
  return (int)atomic_load((unsigned int *)&self->_shm->var5);
}

- (unint64_t)numAcquired
{
  return atomic_load(&self->_shm->var7);
}

- (unint64_t)requestsServed
{
  return atomic_load(&self->_shm->var1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t shmSize;
  id v7;

  v4 = a3;
  v5 = (void *)xpc_mach_send_create();
  shmSize = self->_shmSize;
  v7 = v4;
  objc_msgSend(v7, "encodeInteger:forKey:", shmSize, CFSTR("shm_size"));
  objc_msgSend(v7, "encodeXPCObject:forKey:", v5, CFSTR("semaphore_obj"));
  objc_msgSend(v7, "encodeXPCObject:forKey:", self->_shmObject, CFSTR("shm_obj"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)notifyAll
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "semaphore_signal_all failed with %i: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (int64_t)waitFor:(double)a3
{
  float v3;
  uint64_t v4;
  char *__ptr32 *v5;
  mach_timespec_t v6;
  kern_return_t v7;
  mach_error_t v8;
  int64_t result;
  _DWORD v10[2];
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = floor(a3);
  v4 = v3;
  v5 = &off_1A1AB2000;
  LODWORD(v5) = llround((a3 - (double)v4) * 1000000000.0);
  v6 = (mach_timespec_t)(v4 | ((_QWORD)v5 << 32));
  v7 = semaphore_timedwait(self->_sema, v6);
  v8 = v7;
  if (v7 > 36)
  {
    if (v7 == 37 || v7 == 42)
    {
LABEL_8:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109378;
        v10[1] = v8;
        v11 = 2080;
        v12 = mach_error_string(v8);
        _os_log_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "semaphore_timedwait returned %i: %s", (uint8_t *)v10, 0x12u);
      }
    }
    else
    {
      if (v7 == 49)
        return 1;
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[CKContextSemaphore waitFor:].cold.1(v8);
    }
    return -1;
  }
  else
  {
    switch(v7)
    {
      case 9:
        goto LABEL_8;
      case 10:
      case 14:
        return 1;
      case 11:
      case 12:
      case 13:
      case 15:
      case 16:
      case 17:
        goto LABEL_12;
      case 18:
        result = -2;
        break;
      default:
        if (v7)
          goto LABEL_12;
        result = 0;
        break;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shmObject, 0);
}

- (void)initSemaphoreForXPCService
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "semaphore_create failed with %i: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "shmSize too small: %lu vs %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "mapped shmSize too small: %zu vs. expected %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)waitFor:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(a1);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A1AA2000, MEMORY[0x1E0C81028], v1, "semaphore_timedwait failed with %i: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)tryAcquireNeedsIncPending:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1A1AA2000, MEMORY[0x1E0C81028], a3, "tryAcquire timeout", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
