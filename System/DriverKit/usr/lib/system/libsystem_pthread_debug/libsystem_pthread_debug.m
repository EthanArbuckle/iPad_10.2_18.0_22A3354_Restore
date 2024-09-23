uint64_t _pthread_globals_init(uint64_t result)
{
  unsigned __int8 i;

  for (i = 0; i < 7u; ++i)
  {
    *(_WORD *)(result + 272 + 2 * i) = -1;
    *(_WORD *)(result + 286 + 2 * i) = -1;
    *(_WORD *)(result + 300 + 2 * i) = -1;
  }
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  kern_return_t v2;

  v2 = 22;
  if (a1->__sig == 1414022209)
  {
    if (!*(_DWORD *)&a1->__opaque[40] || *(_DWORD *)&a1->__opaque[40] == -1)
    {
      a1->__sig = 0;
      return 0;
    }
    else
    {
      v2 = mach_port_mod_refs(mach_task_self_, *(_DWORD *)&a1->__opaque[40], 0, -1);
      if (!v2)
        a1->__sig = 0;
    }
  }
  return v2;
}

int pthread_attr_getdetachstate(const pthread_attr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = a1->__opaque[32];
    return 0;
  }
  return v3;
}

int pthread_attr_getinheritsched(const pthread_attr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE1(*(_QWORD *)&a1->__opaque[32]);
    return 0;
  }
  return v3;
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if (((*(_QWORD *)&a1->__opaque[32] >> 24) & 1) != 0)
    {
      *a2 = *(sched_param *)&a1->__opaque[24];
    }
    else
    {
      a2->sched_priority = default_priority;
      *(_DWORD *)a2->__opaque = 10;
    }
    return 0;
  }
  return v3;
}

int pthread_attr_getschedpolicy(const pthread_attr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = BYTE2(*(_QWORD *)&a1->__opaque[32]);
    return 0;
  }
  return v3;
}

int pthread_attr_init(pthread_attr_t *a1)
{
  memcpy(a1, "ADHT", sizeof(pthread_attr_t));
  return 0;
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFFFFFF00 | a2;
    return 0;
  }
  return v3;
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2))
  {
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)a2 << 8);
    return 0;
  }
  return v3;
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *(sched_param *)&a1->__opaque[24] = *a2;
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFEFFFFFFLL | 0x1000000;
    return 0;
  }
  return v3;
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && (a2 == 1 || a2 == 2 || a2 == 4))
  {
    if (a2 != 2 && a2 != 4)
      *(_QWORD *)&a1->__opaque[32] &= ~0x8000000uLL;
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)a2 << 16);
    *(_QWORD *)&a1->__opaque[32] = *(_QWORD *)&a1->__opaque[32] & 0xFFFFFFFFFBFFFFFFLL | 0x4000000;
    return 0;
  }
  return v3;
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    if (a2 == 1)
    {
      return 0;
    }
    else if (a2 == 2)
    {
      return 45;
    }
  }
  return v3;
}

int pthread_attr_getscope(const pthread_attr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = 1;
    return 0;
  }
  return v3;
}

int pthread_attr_getstackaddr(const pthread_attr_t *a1, void **a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = *(void **)&a1->__opaque[8];
    return 0;
  }
  return v3;
}

int pthread_attr_setstackaddr(pthread_attr_t *a1, void *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0)
  {
    *(_QWORD *)&a1->__opaque[8] = a2;
    *(_QWORD *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(_QWORD *)a1->__opaque = 0;
    return 0;
  }
  return v3;
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }
  return v3;
}

uint64_t _pthread_attr_stacksize(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    return *(_QWORD *)(a1 + 24);
  else
    return 0x80000;
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0 && a2 >= 0x4000)
  {
    *(_QWORD *)&a1->__opaque[16] = a2;
    return 0;
  }
  return v3;
}

int pthread_attr_getstack(const pthread_attr_t *a1, void **a2, size_t *a3)
{
  int v4;

  v4 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = (void *)(*(_QWORD *)&a1->__opaque[8] - *(_QWORD *)&a1->__opaque[16]);
    *a3 = _pthread_attr_stacksize((uint64_t)a1);
    return 0;
  }
  return v4;
}

int pthread_attr_setstack(pthread_attr_t *a1, void *a2, size_t a3)
{
  int v4;

  v4 = 22;
  if (a1->__sig == 1414022209 && ((unint64_t)a2 & vm_page_mask) == 0 && (a3 & vm_page_mask) == 0 && a3 >= 0x4000)
  {
    *(_QWORD *)&a1->__opaque[8] = (char *)a2 + a3;
    *(_QWORD *)&a1->__opaque[16] = a3;
    return 0;
  }
  return v4;
}

int pthread_attr_setguardsize(pthread_attr_t *a1, size_t a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209 && (a2 & vm_page_mask) == 0)
  {
    *(_QWORD *)&a1->__opaque[32] &= ~0x10000000uLL;
    *(_QWORD *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_attr_getguardsize(const pthread_attr_t *a1, size_t *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1414022209)
  {
    *a2 = _pthread_attr_guardsize((uint64_t)a1);
    return 0;
  }
  return v3;
}

vm_size_t _pthread_attr_guardsize(uint64_t a1)
{
  if (((*(_QWORD *)(a1 + 40) >> 28) & 1) != 0)
    return vm_page_size;
  else
    return *(_QWORD *)(a1 + 8);
}

uint64_t pthread_attr_setcpupercent_np(_QWORD *a1, int a2, unint64_t a3)
{
  unsigned int v4;

  v4 = 22;
  if (*a1 == 1414022209
    && a2 < 255
    && a3 < 0x1FFFFFF
    && ((a1[5] >> 26) & 1) != 0
    && (BYTE2(a1[5]) == 2 || BYTE2(a1[5]) == 4))
  {
    a1[5] = a1[5] & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)a2 << 32);
    a1[5] = a1[5] & 0xFFFFFFFFFFLL | ((a3 & 0xFFFFFF) << 40);
    a1[5] = a1[5] & 0xFFFFFFFFF7FFFFFFLL | 0x8000000;
    return 0;
  }
  return v4;
}

uint64_t pthread_attr_setworkinterval_np(uint64_t a1, mach_port_name_t a2)
{
  unsigned int v3;

  v3 = 22;
  if (*(_QWORD *)a1 == 1414022209)
  {
    if (a2)
    {
      if (a2 != -1)
      {
        v3 = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
        if (!v3)
          *(_DWORD *)(a1 + 48) = a2;
      }
    }
  }
  return v3;
}

uint64_t _pthread_deallocate(uint64_t result, char a2)
{
  uint64_t v2;

  v2 = result;
  if (result != _main_thread_ptr)
  {
    if ((a2 & 1) == 0)
      _pthread_introspection_thread_destroy(result);
    result = mach_vm_deallocate(mach_task_self_, *(_QWORD *)(v2 + 192), *(_QWORD *)(v2 + 200));
    if ((_DWORD)result)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Unable to deallocate stack";
      qword_24058 = (int)result;
      __break(1u);
      JUMPOUT(0x1E58);
    }
  }
  return result;
}

uint64_t _pthread_introspection_thread_destroy(uint64_t result)
{
  if (_pthread_introspection_hook)
    return _pthread_introspection_hook_callout_thread_destroy(result);
  return result;
}

void _pthread_start(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  unsigned int v12;

  if (((HIBYTE(a6) >> 5) & 1) != 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel without PTHREAD_START_SUSPENDED support";
    qword_24058 = a6;
    __break(1u);
    JUMPOUT(0x1F2CLL);
  }
  if ((a6 & 0x10000000) == 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_24058 = a6;
    __break(1u);
    JUMPOUT(0x1F74);
  }
  v9 = 0;
  if (a2)
    v9 = a2 != -1;
  if (!v9)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: MACH_PORT_VALID(kport)";
    __break(1u);
    JUMPOUT(0x1FD0);
  }
  if (*(_DWORD *)(a1 + 248) != a2)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: _pthread_tsd_slot(self, MACH_THREAD_SELF) == kport";
    __break(1u);
    JUMPOUT(0x2014);
  }
  if ((*(_QWORD *)a1 ^ _pthread_ptr_munge_token) != a1)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  v6 = _pthread_markcancel_if_canceled(a1, a2);
  *(_QWORD *)(a1 + 216) = __thread_selfid(v6);
  if (*(_QWORD *)(a1 + 216) == -1)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x20E8);
  }
  v12 = *(_DWORD *)(a1 + 248);
  v8 = 0;
  if (v12)
    v8 = v12 != -1;
  if (!v8)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_24058 = v12;
    __break(1u);
    JUMPOUT(0x2170);
  }
  _pthread_introspection_thread_start((_QWORD *)a1);
  v7 = (*(uint64_t (**)(_QWORD))(a1 + 144))(*(_QWORD *)(a1 + 152));
  _pthread_exit(a1, v7);
}

void _pthread_exit(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  __disable_threadsignal(1);
  _pthread_setcancelstate_exit(a1);
  while (1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (!v2)
      break;
    (*(void (**)(_QWORD))v2)(*(_QWORD *)(v2 + 8));
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(v2 + 16);
  }
  _pthread_tsd_cleanup(a1);
  v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72);
  *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 72) = 0;
  if (v5)
    _os_semaphore_dispose(v5);
  _pthread_terminate_invoke(a1, a2);
  pthread_is_threaded_np();
}

int pthread_is_threaded_np(void)
{
  return __is_threaded;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  mach_port_t v2;
  pthread_t v3;
  char v4;
  mach_port_t v5;
  mach_port_t *v6;
  pthread_t v7;
  uint64_t v8;
  pthread_t v9;
  os_unfair_lock_t lock;
  unint64_t v11;
  int *i;
  int *v13;
  char v14;
  uint64_t v15;
  int *v16;
  os_unfair_lock_s *v17;
  os_unfair_lock_s *v18;
  unint64_t StatusReg;

  v3 = a1;
  v2 = 0;
  v7 = a1;
  v6 = &v2;
  v5 = 0;
  v4 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v11 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224))
  {
    v9 = v7;
    v8 = 0;
    v8 = v7->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v8 != v7)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v4 = 1;
    v5 = *(_DWORD *)&v7->__opaque[232];
  }
  else
  {
    v13 = (int *)v7;
    i = 0;
    if (v7)
    {
      v17 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
      for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
      {
        if (!i)
        {
          v18 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          v14 = 0;
          goto LABEL_15;
        }
        if (i == v13)
          break;
      }
      v16 = i;
      v15 = 0;
      v15 = *(_QWORD *)i ^ _pthread_ptr_munge_token;
      if ((int *)v15 != i)
        abort_with_reason(18, 4, "pthread_t was corrupted", 0);
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
LABEL_15:
    if ((v14 & 1) != 0)
    {
      v5 = *(_DWORD *)&v7->__opaque[232];
      v4 = 1;
      lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      v4 = 0;
    }
  }
  if (v6)
    *v6 = v5;
  return v2;
}

pthread_t pthread_from_mach_thread_np(mach_port_t a1)
{
  int *i;

  os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
  for (i = __pthread_head; i && i[62] != a1; i = (int *)*((_QWORD *)i + 2))
    ;
  os_unfair_lock_unlock(&_pthread_list_lock);
  return (pthread_t)i;
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  size_t v3;
  int *i;
  char v7;

  v3 = 0;
  if (!a1)
    return 3;
  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr)
  {
    v3 = *(_QWORD *)&a1->__opaque[160] - *(_QWORD *)&a1->__opaque[168];
  }
  else
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        v7 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1)
        break;
    }
    if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v7 = 1;
LABEL_14:
    if ((v7 & 1) != 0)
    {
      v3 = *(_QWORD *)&a1->__opaque[160] - *(_QWORD *)&a1->__opaque[168];
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
  }
  if (v3)
    return v3;
  else
    return 0x80000;
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  void *v2;
  int *i;
  char v6;

  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224) || a1 == (pthread_t)_main_thread_ptr)
    return *(void **)&a1->__opaque[160];
  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        v6 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1)
        break;
    }
    if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
LABEL_14:
  if ((v6 & 1) == 0)
    return &dword_0 + 3;
  v2 = *(void **)&a1->__opaque[160];
  os_unfair_lock_unlock(&_pthread_list_lock);
  return v2;
}

uint64_t pthread_main_thread_np()
{
  return _main_thread_ptr;
}

int pthread_main_np(void)
{
  unint64_t v0;

  v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return v0 == _main_thread_ptr;
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  unint64_t v3;
  int v4;
  int *i;
  char v9;

  v4 = 0;
  v3 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  if (!a2)
    return 22;
  if (a1 && a1 != (pthread_t)v3)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        v9 = 0;
        goto LABEL_14;
      }
      if (i == (int *)a1)
        break;
    }
    if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v9 = 1;
LABEL_14:
    if ((v9 & 1) != 0)
    {
      *a2 = *(_QWORD *)&a1->__opaque[200];
      if (!*a2)
        v4 = _pthread_threadid_slow((uint64_t)a1, a2);
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      return 3;
    }
  }
  else
  {
    *a2 = *(_QWORD *)(v3 + 216);
  }
  return v4;
}

uint64_t _pthread_threadid_slow(uint64_t a1, _QWORD *a2)
{
  integer_t thread_info_out[2];
  uint64_t v4;
  uint64_t v5;
  thread_inspect_t v6;
  mach_msg_type_number_t thread_info_outCnt;
  _QWORD *v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  thread_info_outCnt = 6;
  v6 = 0;
  v6 = *(_DWORD *)(a1 + 248);
  *(_QWORD *)thread_info_out = 0;
  v4 = 0;
  v5 = 0;
  if (thread_info(v6, 4u, thread_info_out, &thread_info_outCnt) || !*(_QWORD *)thread_info_out)
  {
    return 22;
  }
  else
  {
    *v8 = *(_QWORD *)thread_info_out;
    *(_QWORD *)(v9 + 216) = *(_QWORD *)thread_info_out;
    return 0;
  }
}

uint64_t pthread_cpu_number_np(unint64_t *a1)
{
  if (a1)
  {
    *a1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    return 0;
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  }
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  int *i;
  char v9;

  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    _platform_strlcpy(a2, &a1->__opaque[64], a3);
    return 0;
  }
  else
  {
    if (a1)
    {
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
      for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
      {
        if (!i)
        {
          os_unfair_lock_unlock(&_pthread_list_lock);
          v9 = 0;
          goto LABEL_13;
        }
        if (i == (int *)a1)
          break;
      }
      if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
        abort_with_reason(18, 4, "pthread_t was corrupted", 0);
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
LABEL_13:
    if ((v9 & 1) != 0)
    {
      _platform_strlcpy(a2, &a1->__opaque[64], a3);
      os_unfair_lock_unlock(&_pthread_list_lock);
      return 0;
    }
    else
    {
      return 3;
    }
  }
}

int pthread_setname_np(const char *a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int v5;

  v4 = (_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  v3 = 0;
  if (a1)
    v3 = _platform_strlen(a1);
  if ((_QWORD *)(*v4 ^ _pthread_ptr_munge_token) != v4)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  v1 = getpid();
  v5 = __proc_info(5, v1, 2, 0, a1, v3);
  if (!v5)
  {
    if (v3)
      _platform_strlcpy(v4 + 10, a1, 64);
    else
      _platform_bzero(v4 + 10, 64);
  }
  return v5;
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 0);
}

uint64_t _pthread_create(mach_vm_address_t *a1, const char *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  mach_port_name_t name;
  _BYTE v10[9];
  mach_vm_address_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  mach_vm_address_t *v16;
  uint64_t *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t StatusReg;
  char v26;
  mach_port_name_t v27;
  mach_vm_address_t v28;
  mach_port_name_t v29;
  mach_vm_address_t v30;
  mach_port_name_t v31;
  os_unfair_lock_s *v32;
  mach_port_name_t v33;
  os_unfair_lock_s *v34;
  mach_port_name_t v35;
  os_unfair_lock_s *v36;
  mach_port_name_t v37;
  os_unfair_lock_s *v38;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v11 = 0;
  v10[8] = 0;
  *(_QWORD *)v10 = a5 & 1;
  name = 0;
  v8 = 0;
  if (a2)
  {
    if (*(_QWORD *)v15 != 1414022209)
      return 22;
  }
  else
  {
    v15 = "ADHT";
  }
  v7 = 0x1000000;
  if ((*((_DWORD *)v15 + 10) & 0x1000000) != 0)
  {
    v6 = 0;
    v19 = v15;
    v18 = &v6;
    if ((*((_DWORD *)v15 + 10) & 0x1000000) != 0)
    {
      *v18 = *((_QWORD *)v19 + 4);
    }
    else
    {
      *(_DWORD *)v18 = default_priority;
      *((_DWORD *)v18 + 1) = 10;
    }
    v7 |= 0x2000000u;
    v7 |= *((unsigned __int8 *)v15 + 42) << 16;
    v7 |= (unsigned __int16)v6;
  }
  else if (*((_QWORD *)v15 + 4))
  {
    v7 |= 0x8000000 | *((_DWORD *)v15 + 8) & 0xFFFFFF;
  }
  if ((v12 & 2) != 0)
    v7 |= 0x20000000u;
  __is_threaded = 1;
  v11 = _pthread_allocate((uint64_t)v15, (mach_vm_address_t *)&v10[1], v10[0] & 1);
  if (v11)
  {
    if ((v10[0] & 1) != 0)
    {
      name = mach_thread_self();
    }
    else
    {
      v20 = 3;
      v24 = 3;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      name = *(_QWORD *)(StatusReg + 24);
    }
    *(_QWORD *)(v11 + 152) = v13;
    *(_QWORD *)(v11 + 144) = v14;
    v28 = v11;
    v27 = name;
    v26 = v10[0] & 1;
    v34 = &_pthread_list_lock;
    v33 = name;
    os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680, name);
    *(_QWORD *)(v28 + 16) = 0;
    *(_QWORD *)(v28 + 24) = off_28008;
    *off_28008 = (int *)v28;
    off_28008 = (int **)(v28 + 16);
    ++_pthread_count;
    v38 = &_pthread_list_lock;
    v37 = v27;
    os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, v27);
    if ((v26 & 1) == 0)
      _pthread_introspection_thread_create(v28);
    if (__bsdthread_create(v14, v13, *(_QWORD *)&v10[1], v11, v7) == -1)
    {
      v21 = 1;
      v22 = 1;
      v23 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      if (**(_DWORD **)(v23 + 8) == 24)
      {
        qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
        __break(1u);
        JUMPOUT(0x3568);
      }
      v30 = v11;
      v29 = name;
      v32 = &_pthread_list_lock;
      v31 = name;
      os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680, name);
      if (*(_QWORD *)(v30 + 16))
        *(_QWORD *)(*(_QWORD *)(v30 + 16) + 24) = *(_QWORD *)(v30 + 24);
      else
        off_28008 = *(int ***)(v30 + 24);
      **(_QWORD **)(v30 + 24) = *(_QWORD *)(v30 + 16);
      --_pthread_count;
      v36 = &_pthread_list_lock;
      v35 = v29;
      os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, v29);
      _pthread_deallocate(v11, v10[0] & 1);
      v11 = 0;
      v8 = 35;
    }
    if ((v10[0] & 1) != 0)
      mach_port_deallocate(mach_task_self_, name);
    *v16 = v11;
    return v8;
  }
  else
  {
    return 35;
  }
}

int pthread_create_from_mach_thread(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 1);
}

int pthread_create_suspended_np(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create((mach_vm_address_t *)a1, (const char *)a2, (uint64_t)a3, (uint64_t)a4, 2);
}

uint64_t pthread_install_workgroup_functions_np(uint64_t result)
{
  if (_pthread_workgroup_functions)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions already installed";
    qword_24058 = _pthread_workgroup_functions;
    __break(1u);
    JUMPOUT(0x3778);
  }
  _pthread_workgroup_functions = result;
  return result;
}

uint64_t pthread_create_with_workgroup_np(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!_pthread_workgroup_functions)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: workgroup functions not yet installed";
    __break(1u);
    JUMPOUT(0x37E0);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(_pthread_workgroup_functions + 8))(a1, a2, a3, a4, a5);
}

int pthread_detach(pthread_t a1)
{
  char v2;
  char v3;
  int v4;
  int *i;
  char v9;

  v4 = 0;
  v3 = 0;
  v2 = 0;
  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        v9 = 0;
        goto LABEL_11;
      }
      if (i == (int *)a1)
        break;
    }
    if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
LABEL_11:
  if ((v9 & 1) == 0)
    return 3;
  if ((a1->__opaque[33] & 1) != 0)
  {
    if (*(_DWORD *)&a1->__opaque[36] == -1)
    {
      v3 = 1;
    }
    else
    {
      a1->__opaque[33] &= ~1u;
      if (*(_QWORD *)&a1->__opaque[16])
      {
        _pthread_joiner_prepost_wake((uint64_t)a1);
        v2 = 1;
      }
    }
  }
  else
  {
    v4 = 22;
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  if ((v3 & 1) != 0)
  {
    pthread_join_NOCANCEL((uint64_t)a1, 0);
  }
  else if ((v2 & 1) != 0)
  {
    _pthread_joiner_wake((uint64_t)a1);
  }
  return v4;
}

uint64_t _pthread_joiner_wake(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = a1 + 52;
  while (1)
  {
    result = __ulock_wake(16777218, v2, 0);
    if (!(_DWORD)result || (_DWORD)result == -2)
      break;
    if ((_DWORD)result != -4)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: pthread_join() wake failure";
      qword_24058 = -(int)result;
      __break(1u);
      JUMPOUT(0x3B44);
    }
  }
  return result;
}

int pthread_kill(pthread_t a1, int a2)
{
  int v3;
  unsigned int v4;
  int v5;
  pthread_t v6;
  char v8;
  unsigned int v9;
  unsigned int *v10;
  pthread_t v11;
  uint64_t v12;
  pthread_t v13;
  os_unfair_lock_t lock;
  unint64_t v15;
  int *i;
  int *v17;
  char v18;
  uint64_t v19;
  int *v20;
  os_unfair_lock_s *v21;
  os_unfair_lock_s *v22;
  unint64_t StatusReg;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v6 = a1;
  v5 = a2;
  if (a2 < 0 || v5 > 32)
    return 22;
  v4 = 0;
  v11 = v6;
  v10 = &v4;
  v9 = 0;
  v8 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v15 = StatusReg;
  if (v6 == (pthread_t)(StatusReg - 224))
  {
    v13 = v11;
    v12 = 0;
    v12 = v11->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v12 != v11)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v8 = 1;
    v9 = *(_DWORD *)&v11->__opaque[232];
  }
  else
  {
    v17 = (int *)v11;
    i = 0;
    if (v11)
    {
      v21 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
      for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
      {
        if (!i)
        {
          v22 = &_pthread_list_lock;
          os_unfair_lock_unlock(&_pthread_list_lock);
          v18 = 0;
          goto LABEL_18;
        }
        if (i == v17)
          break;
      }
      v20 = i;
      v19 = 0;
      v19 = *(_QWORD *)i ^ _pthread_ptr_munge_token;
      if ((int *)v19 != i)
        abort_with_reason(18, 4, "pthread_t was corrupted", 0);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
LABEL_18:
    if ((v18 & 1) != 0)
    {
      v9 = *(_DWORD *)&v11->__opaque[232];
      v8 = 1;
      lock = &_pthread_list_lock;
      os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      v8 = 0;
    }
  }
  if (v10)
    *v10 = v9;
  if ((v8 & 1) == 0)
    return 3;
  v3 = __pthread_kill(v4, v5);
  if (v3 == -1)
  {
    v24 = 1;
    v25 = 1;
    v26 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    return **(_DWORD **)(v26 + 8);
  }
  return v3;
}

uint64_t __pthread_workqueue_setkill(int a1)
{
  return __bsdthread_ctl(4096, a1, 0);
}

void pthread_exit(void *a1)
{
  _QWORD *v1;
  unint64_t StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v1 = (_QWORD *)(StatusReg - 224);
  if ((*(_WORD *)(StatusReg - 146) & 0x400) != 0)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_exit() called from a thread not created by pthread_create()";
    __break(1u);
    JUMPOUT(0x3F28);
  }
  if ((_QWORD *)(*v1 ^ _pthread_ptr_munge_token) != v1)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  _pthread_exit((unint64_t)v1, (uint64_t)a1);
}

BOOL pthread_self_is_exiting_np()
{
  return (*(_WORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 58) & 0x20) != 0;
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  int *i;
  char v10;

  if (a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
    {
      if (!i)
      {
        os_unfair_lock_unlock(&_pthread_list_lock);
        v10 = 0;
        goto LABEL_11;
      }
      if (i == (int *)a1)
        break;
    }
    if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
LABEL_11:
  if ((v10 & 1) == 0)
    return 3;
  if (a2)
    *a2 = a1->__opaque[32];
  if (a3)
    *a3 = *(sched_param *)&a1->__opaque[40];
  os_unfair_lock_unlock(&_pthread_list_lock);
  return 0;
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  int v3;
  int v5;
  thread_act_t v6;
  const sched_param *v7;
  int v8;
  pthread_t v9;
  uint64_t v11;
  pthread_t v12;
  char v13;
  thread_act_t v14;
  thread_act_t *v15;
  pthread_t v16;
  uint64_t v17;
  pthread_t v18;
  os_unfair_lock_s *v19;
  os_unfair_lock_t lock;
  os_unfair_lock_t v21;
  unint64_t v22;
  unint64_t v23;
  int *i;
  int *v25;
  char v26;
  uint64_t v27;
  int *v28;
  os_unfair_lock_s *v29;
  os_unfair_lock_s *v30;
  int *j;
  int *v32;
  char v33;
  uint64_t v34;
  int *v35;
  os_unfair_lock_s *v36;
  os_unfair_lock_s *v37;
  kern_return_t v38;
  mach_msg_type_number_t v39;
  policy_base_t v40;
  uint64_t v41;
  uint64_t v42;
  const sched_param *v43;
  policy_t v44;
  thread_act_t v45;
  pthread_t v46;
  int v47;
  unint64_t StatusReg;
  unint64_t v49;

  v9 = a1;
  v8 = a2;
  v7 = a3;
  v6 = 0;
  v5 = 1;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v23 = StatusReg;
  if (a1 == (pthread_t)(StatusReg - 224) || v9 == (pthread_t)_main_thread_ptr)
  {
    v12 = v9;
    v11 = 0;
    v11 = v9->__sig ^ _pthread_ptr_munge_token;
    if ((pthread_t)v11 != v9)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v6 = *(_DWORD *)&v9->__opaque[232];
  }
  else
  {
    v5 = 0;
    v16 = v9;
    v15 = &v6;
    v14 = 0;
    v13 = 0;
    v49 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v22 = v49;
    if (v9 == (pthread_t)(v49 - 224))
    {
      v18 = v16;
      v17 = 0;
      v17 = v16->__sig ^ _pthread_ptr_munge_token;
      if ((pthread_t)v17 != v16)
        abort_with_reason(18, 4, "pthread_t was corrupted", 0);
      v13 = 1;
      v14 = *(_DWORD *)&v16->__opaque[232];
    }
    else
    {
      v25 = (int *)v16;
      i = 0;
      if (v16)
      {
        v29 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
        for (i = __pthread_head; ; i = (int *)*((_QWORD *)i + 2))
        {
          if (!i)
          {
            v30 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            v26 = 0;
            goto LABEL_20;
          }
          if (i == v25)
            break;
        }
        v28 = i;
        v27 = 0;
        v27 = *(_QWORD *)i ^ _pthread_ptr_munge_token;
        if ((int *)v27 != i)
          abort_with_reason(18, 4, "pthread_t was corrupted", 0);
        v26 = 1;
      }
      else
      {
        v26 = 0;
      }
LABEL_20:
      if ((v26 & 1) != 0)
      {
        v14 = *(_DWORD *)&v16->__opaque[232];
        v13 = 1;
        lock = &_pthread_list_lock;
        os_unfair_lock_unlock(&_pthread_list_lock);
      }
      else
      {
        v13 = 0;
      }
    }
    if (v15)
      *v15 = v14;
    if ((v13 & 1) == 0)
      return 3;
  }
  v46 = v9;
  v45 = v6;
  v44 = v8;
  v43 = v7;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v39 = 0;
  v38 = 0;
  if (((*(_WORD *)&v9->__opaque[62] >> 10) & 1) == 0)
  {
    switch(v44)
    {
      case 1:
        LODWORD(v41) = v43->sched_priority;
        v40 = (policy_base_t)&v41;
        v39 = 1;
        break;
      case 2:
        HIDWORD(v41) = v43->sched_priority;
        LODWORD(v42) = *(_DWORD *)v43->__opaque;
        v40 = (policy_base_t)&v41 + 1;
        v39 = 2;
        break;
      case 4:
        HIDWORD(v42) = v43->sched_priority;
        v40 = (policy_base_t)&v42 + 1;
        v39 = 1;
        break;
      default:
        v47 = 22;
        goto LABEL_40;
    }
    v38 = thread_policy(v45, v44, v40, v39, 1);
    if (v38)
      v3 = 22;
    else
      v3 = 0;
    v47 = v3;
    goto LABEL_40;
  }
  v47 = 45;
LABEL_40:
  if (!v47)
  {
    if (v5)
    {
      v19 = &_pthread_list_lock;
      os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    }
    else
    {
      v32 = (int *)v9;
      j = 0;
      if (v9)
      {
        v36 = &_pthread_list_lock;
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
        for (j = __pthread_head; ; j = (int *)*((_QWORD *)j + 2))
        {
          if (!j)
          {
            v37 = &_pthread_list_lock;
            os_unfair_lock_unlock(&_pthread_list_lock);
            v33 = 0;
            goto LABEL_54;
          }
          if (j == v32)
            break;
        }
        v35 = j;
        v34 = 0;
        v34 = *(_QWORD *)j ^ _pthread_ptr_munge_token;
        if ((int *)v34 != j)
          abort_with_reason(18, 4, "pthread_t was corrupted", 0);
        v33 = 1;
      }
      else
      {
        v33 = 0;
      }
LABEL_54:
      if ((v33 & 1) == 0)
        return 3;
    }
    v9->__opaque[32] = v8;
    *(sched_param *)&v9->__opaque[40] = *v7;
    v21 = &_pthread_list_lock;
    os_unfair_lock_unlock(&_pthread_list_lock);
    return 0;
  }
  return v47;
}

int sched_get_priority_min(int a1)
{
  return default_priority - 16;
}

int sched_get_priority_max(int a1)
{
  return default_priority + 16;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return a1 == a2;
}

uint64_t _pthread_set_self(uint64_t a1)
{
  *(_QWORD *)(a1 + 216) = __thread_selfid();
  if (*(_QWORD *)(a1 + 216) == -1)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x4998);
  }
  return _thread_set_tsd_base(a1 + 224);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  unint64_t v2;
  _QWORD v4[3];
  pthread_once_t *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(_QWORD *);
  _QWORD *v10;
  char *opaque;

  v5 = a1;
  v4[2] = a2;
  v4[0] = a1;
  v4[1] = a2;
  do
  {
    opaque = v5->__opaque;
    v10 = v4;
    v9 = __pthread_once_handler;
    v8 = 0;
    v2 = atomic_load((unint64_t *)v5->__opaque);
    v7 = v2;
    v8 = v2;
    v6 = v2;
    if (v2 != -1)
      _os_once(opaque, v10, v9);
  }
  while (v5->__sig == 816954554);
  return 0;
}

uint64_t __pthread_once_handler(_QWORD *a1)
{
  uint64_t result;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t StatusReg;

  v7 = a1;
  v6 = a1;
  v4 = 0;
  v5 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = StatusReg;
  v2 = StatusReg - 224;
  v3 = &__os_once_reset;
  v4 = *a1 + 8;
  v5 = *(_QWORD *)(StatusReg - 216);
  *(_QWORD *)(v2 + 8) = &v3;
  result = ((uint64_t (*)(void))v6[1])();
  *(_QWORD *)(v2 + 8) = v5;
  *(_QWORD *)*v6 = 1330529093;
  return result;
}

int pthread_getconcurrency(void)
{
  return pthread_concurrency;
}

int pthread_setconcurrency(int a1)
{
  if (a1 < 0)
    return 22;
  pthread_concurrency = a1;
  return 0;
}

uint64_t __pthread_init(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  vm_size_t v4;
  _BYTE *v6;
  _OWORD v7[3];
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15[2];
  host_t host;
  __int128 host_info_out;
  __int128 v18;
  mach_msg_type_number_t host_info_outCnt;
  host_flavor_t flavor;
  kern_return_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  int v48;
  int v49;
  char v50;
  unint64_t StatusReg;

  v26 = a1;
  v25 = a2;
  v24 = a3;
  v23 = a4;
  if (a1)
  {
    exitf = (uint64_t (*)(_QWORD))v26[1];
    if (*v26 >= 2uLL)
    {
      _pthread_malloc = (uint64_t (*)(_QWORD))v26[2];
      _pthread_free = (uint64_t (*)(_QWORD))v26[3];
    }
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v27 = StatusReg;
  v22 = StatusReg - 224;
  if (StatusReg == 224)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: PTHREAD_SELF TSD not initialized";
    __break(1u);
    JUMPOUT(0x4C68);
  }
  _main_thread_ptr = v22;
  v29 = v22;
  v28 = v22;
  *(_QWORD *)v22 = v22 ^ _pthread_ptr_munge_token;
  v21 = 0;
  flavor = 5;
  host_info_outCnt = 8;
  v18 = 0u;
  host_info_out = 0u;
  host = mach_host_self();
  v21 = host_info(host, flavor, (host_info_t)&host_info_out, &host_info_outCnt);
  if (v21)
  {
    v15[1] = v21;
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: host_info() failed";
    qword_24058 = v21;
    __break(1u);
    JUMPOUT(0x4D40);
  }
  default_priority = BYTE12(host_info_out);
  min_priority = BYTE8(v18);
  max_priority = BYTE12(v18);
  mach_port_deallocate(mach_task_self_, host);
  v15[0] = 0;
  v14 = 0;
  v13 = 0;
  v12 = 0;
  if (!parse_main_stack_params(v24, v15, &v14, &v13, &v12) || !v15[0] || !v14)
  {
    v11 = 8;
    v10 = 0x3B00000001;
    if (__sysctl(&v10, 2, v15, &v11, 0))
      v15[0] = 0x16FE00000;
    v14 = 1032192;
    v13 = 0;
    v12 = 0;
  }
  parse_ptr_munge_params(v25, v24);
  v30 = 0;
  v50 = 4;
  v49 = 0;
  v48 = 0;
  v47 = 2303;
  v36 = v22;
  v35 = "ADHT";
  v34 = v15[0];
  v33 = v14;
  v32 = v13;
  v31 = v12;
  v40 = v22;
  v39 = v22;
  *(_QWORD *)v22 = v22 ^ _pthread_ptr_munge_token;
  *(_QWORD *)(v36 + 224) = v36;
  *(_QWORD *)(v36 + 232) = v36 + 172;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    v46 = 0;
    v45 = 0;
    v44 = 0;
    v43 = 0;
    *(_QWORD *)(v36 + 256) = 0;
  }
  else
  {
    *(_QWORD *)(v36 + 256) = *((_QWORD *)v35 + 4);
  }
  *(_QWORD *)(v36 + 280) = _pthread_ptr_munge_token;
  *(_BYTE *)(v36 + 49) = *(_BYTE *)(v36 + 49) & 0xFB | (4 * (*((_QWORD *)v35 + 2) != 0));
  v42 = v36 + 72;
  v41 = 0;
  *(_DWORD *)(v36 + 72) = 0;
  *(_QWORD *)(v36 + 176) = v34;
  *(_QWORD *)(v36 + 184) = v34 - v33;
  *(_QWORD *)(v36 + 192) = v32;
  *(_QWORD *)(v36 + 200) = v31;
  v4 = _pthread_attr_guardsize((uint64_t)v35);
  *(_QWORD *)(v36 + 208) = v4;
  *(_BYTE *)(v36 + 49) = *(_BYTE *)(v36 + 49) & 0xFE | (v35[40] == 1);
  *(_BYTE *)(v36 + 78) = v35[41];
  *(_BYTE *)(v36 + 48) = BYTE2(*((_QWORD *)v35 + 5));
  *(_WORD *)(v36 + 78) = *(_WORD *)(v36 + 78) & 0xFDFF | ((v35[43] & 1) << 9);
  v38 = v35;
  v37 = v36 + 56;
  if ((*((_DWORD *)v35 + 10) & 0x1000000) != 0)
  {
    *(_QWORD *)v37 = *((_QWORD *)v38 + 4);
  }
  else
  {
    *(_DWORD *)v37 = default_priority;
    *(_DWORD *)(v37 + 4) = 10;
  }
  *(_WORD *)(v36 + 166) = 3;
  *(_BYTE *)(v22 + 49) |= 1u;
  v9 = 0;
  parse_main_thread_port(v24, &v9);
  _pthread_main_thread_init(v22, v9);
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  _pthread_bsdthread_init((uint64_t)v7);
  _pthread_key_global_init();
  _pthread_mutex_global_init(v25, (uint64_t)v7);
  v6 = (_BYTE *)_simple_getenv(v25, "PTHREAD_YIELD_TO_ZERO");
  if (v6)
    pthread_yield_to_zero = *v6 == 49;
  return 0;
}

uint64_t parse_main_stack_params(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;
  char *v12;
  unsigned int v13;
  char *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  v14 = (char *)_simple_getenv(a1, "main_stack");
  if (v14)
  {
    v13 = 0;
    v12 = v14;
    v5 = _pthread_strtoul(v14, &v12, 16);
    *v18 = v5;
    if (*v12 == 44)
    {
      v6 = _pthread_strtoul(v12 + 1, &v12, 16);
      *v17 = v6;
      if (*v12 == 44)
      {
        v7 = _pthread_strtoul(v12 + 1, &v12, 16);
        *v16 = v7;
        if (*v12 == 44)
        {
          v8 = _pthread_strtoul(v12 + 1, &v12, 16);
          *v15 = v8;
          if (*v12 == 44 || !*v12)
            v13 = 1;
        }
      }
    }
    v11 = v14;
    v9 = _platform_strlen(v14);
    _platform_bzero(v11, v9);
    return v13;
  }
  else
  {
    return 0;
  }
}

char *parse_ptr_munge_params(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *result;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v6 = 0;
  v5 = 0;
  v7 = (char *)_simple_getenv(a2, "ptr_munge");
  if (v7)
  {
    v5 = _pthread_strtoul(v7, &v6, 16);
    v4 = v7;
    v2 = _platform_strlen(v7);
    _platform_bzero(v4, v2);
  }
  result = (char *)_simple_getenv(v9, "PTHREAD_PTR_MUNGE_TOKEN");
  v7 = result;
  if (result)
  {
    result = (char *)_pthread_strtoul(v7, &v6, 16);
    if (result)
      v5 = (uint64_t)result;
  }
  _pthread_ptr_munge_token = v5;
  *(_QWORD *)_main_thread_ptr = _main_thread_ptr ^ v5;
  return result;
}

char *parse_main_thread_port(uint64_t a1, _DWORD *a2)
{
  char *result;
  int v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _DWORD *v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2;
  v6 = 0;
  result = (char *)_simple_getenv(a1, "th_port");
  v7 = result;
  if (result)
  {
    v3 = _pthread_strtoul(v7, &v6, 16);
    *v8 = v3;
    v5 = v7;
    v4 = _platform_strlen(v7);
    return (char *)_platform_bzero(v5, v4);
  }
  return result;
}

_QWORD *_pthread_main_thread_init(uint64_t a1, int a2)
{
  int *v2;
  mach_port_options_t v4;
  mach_port_name_t name;
  int v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  int v10;
  os_unfair_lock_s *v11;

  v7 = (_QWORD *)a1;
  v6 = a2;
  __pthread_head = 0;
  off_28008 = &__pthread_head;
  v11 = &_pthread_list_lock;
  v10 = 0;
  _pthread_list_lock._os_unfair_lock_opaque = 0;
  v9 = a1 + 72;
  v8 = 0;
  *(_DWORD *)(a1 + 72) = 0;
  v7[1] = 0;
  v7[4] = 0;
  *((_DWORD *)v7 + 13) = 0;
  if (v6)
    *((_DWORD *)v7 + 62) = v6;
  else
    *((_DWORD *)v7 + 62) = mach_thread_self();
  name = 0;
  *(_OWORD *)&v4.flags = xmmword_1F0F8;
  v4.reserved[1] = 0;
  mach_port_construct(mach_task_self_, &v4, 0, &name);
  *((_DWORD *)v7 + 60) = name;
  *((_DWORD *)v7 + 72) = 0;
  *((_DWORD *)v7 + 74) = 0;
  v2 = __pthread_head;
  v7[2] = __pthread_head;
  if (v2)
    *(_QWORD *)((char *)&dword_18 + (_QWORD)__pthread_head) = v7 + 2;
  else
    off_28008 = (int **)(v7 + 2);
  __pthread_head = (int *)v7;
  v7[3] = &__pthread_head;
  _pthread_count = 1;
  return _pthread_introspection_thread_start(v7);
}

uint64_t _pthread_bsdthread_init(uint64_t a1)
{
  uint64_t result;
  unsigned int v2;
  char v3;
  char v4;
  BOOL v5;
  uint64_t v6;
  char v8;

  _platform_bzero(a1, 56);
  *(_QWORD *)a1 = 56;
  *(_QWORD *)(a1 + 8) = 160;
  *(_DWORD *)(a1 + 28) = 40;
  *(_DWORD *)(a1 + 24) = 224;
  *(_DWORD *)(a1 + 32) = 24;
  *(_DWORD *)(a1 + 48) = 392;
  *(_DWORD *)(a1 + 52) = 960;
  result = __bsdthread_register(thread_start, start_wqthread, ((_DWORD)vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
  if ((int)result >= 1)
  {
    if ((~(_DWORD)result & 0x4000001E) != 0)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Missing required kernel support";
      qword_24058 = (int)result;
      __break(1u);
      JUMPOUT(0x5888);
    }
    __pthread_supported_features = result;
  }
  v6 = *(_QWORD *)(a1 + 16);
  v5 = 0;
  if ((v6 & 0x22000000) == 0)
    v5 = (v6 & 0x3F00) != 0;
  if (v5)
  {
    v2 = (unint64_t)(v6 & 0x3F00) >> 8;
    v3 = __clz(__rbit32(v2));
    if (v2)
      v4 = v3 + 1;
    else
      v4 = 0;
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }
  if (v8)
  {
    result = _pthread_set_main_qos(v6);
    *(_QWORD *)(_main_thread_ptr + 256) = v6;
  }
  if (*(_QWORD *)(a1 + 36))
    __pthread_stack_hint = *(_QWORD *)(a1 + 36);
  if (__libdispatch_workerfunction)
    return __workq_open();
  return result;
}

_QWORD *_pthread_introspection_thread_start(_QWORD *result)
{
  if (_pthread_introspection_hook)
    return (_QWORD *)_pthread_introspection_hook_callout_thread_start(result);
  return result;
}

uint64_t _pthread_main_thread_postfork_init(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  v1 = _pthread_main_thread_init(a1, 0);
  result = __thread_selfid(v1);
  *(_QWORD *)(a1 + 216) = result;
  if (*(_QWORD *)(a1 + 216) == -1)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x5AA4);
  }
  return result;
}

void sched_yield(void)
{
  if ((pthread_yield_to_zero & 1) != 0)
    swtch_pri(0);
  else
    thread_switch(0, 0, 0);
}

uint64_t _pthread_yield_to_enqueuer_4dispatch(uint64_t a1, uint64_t a2, mach_msg_timeout_t a3)
{
  int *i;
  mach_port_name_t thread_name;

  thread_name = 0;
  os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
  for (i = __pthread_head; i; i = (int *)*((_QWORD *)i + 2))
  {
    if (a2)
    {
      if (*(_QWORD *)&i[2 * a1 + 56] == a2)
      {
        thread_name = i[62];
        break;
      }
    }
    else if (*(_QWORD *)&i[2 * a1 + 56])
    {
      thread_name = i[62];
      break;
    }
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  thread_switch(thread_name, 4, a3);
  return 0;
}

uint64_t pthread_current_stack_contains_np(unint64_t a1, uint64_t a2)
{
  BOOL v4;
  unint64_t v5;
  unint64_t v6;

  v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 40);
  v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 48);
  if (v6 == v5)
  {
    return -45;
  }
  else if (__CFADD__(a1, a2))
  {
    return -22;
  }
  else
  {
    v4 = 0;
    if (v6 <= a1)
      return a1 + a2 <= v5;
    return v4;
  }
}

void _pthread_clear_qos_tsd(int a1)
{
  int *i;

  if (a1 && *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) != a1)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; i; i = (int *)*((_QWORD *)i + 2))
    {
      if (a1 == i[62])
      {
        *((_QWORD *)i + 32) = 0;
        break;
      }
    }
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  else
  {
    *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 0;
  }
}

uint64_t pthread_stack_frame_decode_np(_QWORD *a1, _QWORD *a2)
{
  if (a2)
    *a2 = a1[1];
  return *a1 & 0xFFFFFFFFFFFFFFLL;
}

uint64_t _pthread_wqthread(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;

  if ((a5 & 0x20000) == 0)
    _pthread_wqthread_setup(a1, a2, a3, a5);
  if ((a5 & 0x800000) != 0)
  {
    *(_BYTE *)(a1 + 164) = 1;
    v9 = 67111167;
  }
  else
  {
    *(_BYTE *)(a1 + 164) = 0;
    v14 = 0;
    if ((a5 & 0x80000) != 0)
      v14 = 0x1000000;
    if ((a5 & 0x100000) != 0)
    {
      v16 = v14 | 0x2000000;
    }
    else
    {
      if ((a5 & 0x10000) != 0)
        v14 |= 0x80000000uLL;
      if ((a5 & 0x4000) != 0)
      {
        v17 = BYTE3(v14) << 24;
        if ((_BYTE)a5 && a5 <= 6u)
          v17 |= (1 << (a5 + 7)) | 0xFF;
        v15 = v17;
      }
      else
      {
        if ((a5 & 0x8000) == 0)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Missing priority";
          qword_24058 = a5;
          __break(1u);
          JUMPOUT(0x6208);
        }
        v15 = v14 | 0xFFFF | a5 & 0xFFF;
      }
      v16 = v15;
    }
    v9 = v16;
  }
  *(_QWORD *)(a1 + 256) = v9;
  v8 = v9;
  if ((a5 & 0x1000000) != 0)
    v8 = v9 | 0x8000000;
  if (a6 == -1)
    _pthread_wqthread_exit(a1);
  if ((a5 & 0x400000) != 0)
  {
    *(void (**)())(a1 + 144) = __libdispatch_workloopfunction[0];
    *(_QWORD *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_workloopfunction[0]();
  }
  if ((a5 & 0x80000) != 0)
  {
    *(_QWORD *)(a1 + 144) = __libdispatch_keventfunction;
    *(_QWORD *)(a1 + 152) = a4;
    *(_DWORD *)(a1 + 160) = a6;
    __libdispatch_keventfunction();
  }
  *(_QWORD *)(a1 + 144) = __libdispatch_workerfunction;
  *(_QWORD *)(a1 + 152) = v8;
  *(_DWORD *)(a1 + 160) = 0;
  if ((__workq_newapi & 1) != 0)
    __libdispatch_workerfunction(v8);
  else
    _pthread_wqthread_legacy_worker_wrap(v8);
  result = __workq_kernreturn(4, 0, 0, 0);
  v7 = *(int *)(a1 + 172);
  qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __workq_kernreturn returned";
  qword_24058 = v7;
  return result;
}

_QWORD *_pthread_wqthread_setup(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  BOOL v5;
  unsigned int v9;
  vm_size_t v10;
  vm_size_t v11;

  v11 = a3 - vm_page_size;
  v10 = ((vm_page_size + a1 - 1) & -(uint64_t)vm_page_size)
      + ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask)
      - (a3
       - vm_page_size);
  *(_QWORD *)a1 = a1 ^ _pthread_ptr_munge_token;
  *(_QWORD *)(a1 + 224) = a1;
  *(_QWORD *)(a1 + 232) = a1 + 172;
  *(_QWORD *)(a1 + 256) = 2303;
  *(_QWORD *)(a1 + 280) = _pthread_ptr_munge_token;
  *(_BYTE *)(a1 + 49) &= ~4u;
  *(_DWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 176) = a1;
  *(_QWORD *)(a1 + 184) = a3;
  *(_QWORD *)(a1 + 192) = v11;
  *(_QWORD *)(a1 + 200) = v10;
  *(_QWORD *)(a1 + 208) = _pthread_attr_guardsize((uint64_t)"ADHT");
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a1 + 49) & 0xFE | (unk_1F138 == 1);
  *(_BYTE *)(a1 + 78) = unk_1F139;
  *(_BYTE *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 78) = *(_WORD *)(a1 + 78) & 0xFDFF | ((unk_1F13B & 1) << 9);
  *(_DWORD *)(a1 + 56) = default_priority;
  *(_DWORD *)(a1 + 60) = 10;
  *(_WORD *)(a1 + 166) = 3;
  *(_DWORD *)(a1 + 248) = a2;
  *(_WORD *)(a1 + 78) |= 0x400u;
  *(_WORD *)(a1 + 78) &= ~0x800u;
  *(_BYTE *)(a1 + 49) &= ~1u;
  if ((a4 & 0x200000) == 0)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread_set_tsd_base() wasn't called by the kernel";
    qword_24058 = a4;
    __break(1u);
    JUMPOUT(0x67A8);
  }
  *(_QWORD *)(a1 + 216) = __thread_selfid();
  if (*(_QWORD *)(a1 + 216) == -1)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: failed to set thread_id";
    __break(1u);
    JUMPOUT(0x6814);
  }
  os_unfair_lock_lock_no_tsd(&_pthread_list_lock, 327680, a2);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = off_28008;
  *off_28008 = (int *)a1;
  off_28008 = (int **)(a1 + 16);
  ++_pthread_count;
  os_unfair_lock_unlock_no_tsd(&_pthread_list_lock, a2);
  _pthread_introspection_thread_create(a1);
  v9 = *(_DWORD *)(a1 + 248);
  v5 = 0;
  if (v9)
    v5 = v9 != -1;
  if (!v5)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unable to allocate thread port, possible port leak";
    qword_24058 = v9;
    __break(1u);
    JUMPOUT(0x6954);
  }
  return _pthread_introspection_thread_start((_QWORD *)a1);
}

void _pthread_wqthread_exit(unint64_t a1)
{
  unsigned int v1;
  char v2;
  unsigned __int8 v3;
  BOOL v4;
  uint64_t v5;
  unsigned __int8 v6;

  v5 = *(_QWORD *)(a1 + 256);
  v4 = 0;
  if ((v5 & 0x22000000) == 0)
    v4 = (v5 & 0x3F00) != 0;
  if (v4)
  {
    v1 = (unint64_t)(v5 & 0x3F00) >> 8;
    v2 = __clz(__rbit32(v1));
    if (v1)
      v3 = v2 + 1;
    else
      v3 = 0;
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }
  if (!v6 || v6 > 4u)
    *(_QWORD *)(a1 + 256) = 2303;
  _pthread_exit(a1, 0);
}

uint64_t _pthread_wqthread_legacy_worker_wrap(uint64_t a1)
{
  unsigned int v1;
  char v2;
  char v3;
  uint64_t result;
  BOOL v5;
  uint64_t (*v6)(uint64_t, BOOL);
  char v7;

  v6 = (uint64_t (*)(uint64_t, BOOL))__libdispatch_workerfunction;
  v5 = 0;
  if ((a1 & 0x22000000) == 0)
    v5 = (a1 & 0x3F00) != 0;
  if (v5)
  {
    v1 = (unint64_t)(a1 & 0x3F00) >> 8;
    v2 = __clz(__rbit32(v1));
    if (v1)
      v3 = v2 + 1;
    else
      v3 = 0;
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  switch(v7)
  {
    case 2:
      result = ((uint64_t (*)(uint64_t, BOOL, _QWORD))__libdispatch_workerfunction)(3, (int)a1 < 0, 0);
      break;
    case 3:
      result = ((uint64_t (*)(uint64_t, BOOL, _QWORD))__libdispatch_workerfunction)(2, (int)a1 < 0, 0);
      break;
    case 4:
      *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = 4351;
      result = v6(1, (int)a1 < 0);
      break;
    case 5:
      result = ((uint64_t (*)(_QWORD, BOOL, _QWORD))__libdispatch_workerfunction)(0, (int)a1 < 0, 0);
      break;
    default:
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Invalid pthread priority for the legacy interface";
      qword_24058 = a1;
      __break(1u);
      JUMPOUT(0x6D84);
  }
  return result;
}

uint64_t pthread_workqueue_setdispatchoffset_np(unsigned int a1)
{
  return __workq_kernreturn(16, 0, a1, 0);
}

uint64_t pthread_workqueue_setup(uint64_t a1, unint64_t a2)
{
  int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t StatusReg;

  v10 = a1;
  v9 = a2;
  v8 = 16;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (a2 >= 4)
  {
    v3 = *(_DWORD *)(v10 + 4);
    if (v3 == 1)
    {
      v4 = 40;
    }
    else
    {
      if (v3 != 2)
        return 22;
      v4 = 48;
    }
    if (v10 && v9 >= v4)
    {
      if (!*(_DWORD *)v10 && *(_DWORD *)(v10 + 4))
      {
        if (__libdispatch_workerfunction)
        {
          return v8;
        }
        else
        {
          __workq_newapi = 1;
          v5 = 2;
          v6 = *(_QWORD *)(v10 + 32);
          v7 = *(_QWORD *)(v10 + 40);
          v8 = __workq_kernreturn(1024, &v5, 24, 0);
          if (v8 == -1)
          {
            v12 = 1;
            v13 = 1;
            StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            return **(_DWORD **)(StatusReg + 8);
          }
          else
          {
            __libdispatch_keventfunction = *(void (**)())(v10 + 8);
            __libdispatch_workloopfunction[0] = *(void (**)())(v10 + 16);
            __libdispatch_workerfunction = *(_UNKNOWN **)(v10 + 24);
            __workq_open();
            if (!__is_threaded)
              __is_threaded = 1;
            return 0;
          }
        }
      }
      else
      {
        return 45;
      }
    }
    else
    {
      return 22;
    }
  }
  else
  {
    return 22;
  }
}

uint64_t _pthread_workqueue_init_with_workloop(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  _DWORD __b[2];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  __b[0] = 0;
  __b[1] = 2;
  v7 = a2;
  v8 = a3;
  v9 = a1;
  v10 = a4;
  v11 = 0;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_init_with_kevent(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return _pthread_workqueue_init_with_workloop(a1, a2, 0, a3, a4);
}

uint64_t _pthread_workqueue_init(uint64_t a1, int a2, int a3)
{
  return _pthread_workqueue_init_with_kevent(a1, 0, a2, a3);
}

uint64_t pthread_workqueue_setdispatch_np(uint64_t a1)
{
  _QWORD __b[6];
  uint64_t v3;

  v3 = a1;
  memset(__b, 0, sizeof(__b));
  HIDWORD(__b[0]) = 2;
  __b[3] = v3;
  return pthread_workqueue_setup((uint64_t)__b, 0x30uLL);
}

uint64_t _pthread_workqueue_supported()
{
  if (!__pthread_supported_features)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: libpthread has not been initialized";
    __break(1u);
    JUMPOUT(0x7204);
  }
  return __pthread_supported_features;
}

uint64_t pthread_workqueue_addthreads_np(__int16 a1, char a2, unsigned int a3)
{
  int v4;
  uint64_t v5;
  unsigned int v6;

  if (__libdispatch_workerfunction)
  {
    v4 = 0;
    if ((a2 & 1) != 0)
      v4 = 0x80000000;
    v5 = _pthread_qos_class_encode_workqueue(a1 & 0xFFF, v4);
    v6 = __workq_kernreturn(32, 0, a3, v5);
    if (v6 == -1)
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    return v6;
  }
  else
  {
    return 1;
  }
}

BOOL _pthread_workqueue_should_narrow(uint64_t a1)
{
  int v2;

  v2 = __workq_kernreturn(512, 0, a1, 0);
  return v2 != -1 && v2 != 0;
}

uint64_t _pthread_workqueue_addthreads(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  if (__libdispatch_workerfunction)
  {
    v3 = __workq_kernreturn(32, 0, a1, a2);
    if (v3 == -1)
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    return v3;
  }
  else
  {
    return 1;
  }
}

uint64_t _pthread_workqueue_add_cooperativethreads(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  if (__libdispatch_workerfunction)
  {
    v3 = __workq_kernreturn(48, 0, a1, a2);
    if (v3 == -1)
      return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    return v3;
  }
  else
  {
    return 1;
  }
}

uint64_t _pthread_workqueue_set_event_manager_priority(uint64_t a1)
{
  unsigned int v2;

  v2 = __workq_kernreturn(128, 0, a1, 0);
  if (v2 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v2;
}

uint64_t _pthread_workqueue_allow_send_signals(char a1)
{
  return __bsdthread_ctl(0x4000, (1 << (a1 - 1)), 0);
}

uint64_t _pthread_workloop_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  int __b;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t StatusReg;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  __b = 36;
  v6 = 0;
  v7 = a1;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  if (a3 && (v14 & 0xFFFFFFFFFFFFFFFELL) == 0)
  {
    if (((*(_QWORD *)(v13 + 40) >> 24) & 1) != 0)
    {
      v6 |= 1u;
      v8 = *(_DWORD *)(v13 + 32);
    }
    if (((*(_QWORD *)(v13 + 40) >> 26) & 1) != 0)
    {
      v6 |= 2u;
      v9 = BYTE2(*(_QWORD *)(v13 + 40));
    }
    if (((*(_QWORD *)(v13 + 40) >> 27) & 1) != 0)
    {
      v6 |= 4u;
      v10 = BYTE4(*(_QWORD *)(v13 + 40));
      v11 = *(_QWORD *)(v13 + 40) >> 40;
    }
    if (*(_DWORD *)(v13 + 48) && *(_DWORD *)(v13 + 48) != -1)
    {
      v6 |= 8u;
      v12 = *(_DWORD *)(v13 + 48);
    }
    if ((v14 & 1) != 0)
      v6 |= 0x10u;
    v4 = __kqueue_workloop_ctl(1, 0, &__b, 36);
    if (v4 == -1)
    {
      v17 = 1;
      v18 = 1;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      return **(_DWORD **)(StatusReg + 8);
    }
    return v4;
  }
  else
  {
    return 22;
  }
}

uint64_t _pthread_workloop_destroy(uint64_t a1)
{
  unsigned int v2;
  _DWORD __b[2];
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t StatusReg;

  v10 = a1;
  __b[0] = 36;
  __b[1] = 0;
  v4 = a1;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v2 = __kqueue_workloop_ctl(2, 0, __b, 36);
  if (v2 == -1)
  {
    v11 = 1;
    v12 = 1;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    return **(unsigned int **)(StatusReg + 8);
  }
  return v2;
}

pthread_introspection_hook_t pthread_introspection_hook_install(pthread_introspection_hook_t hook)
{
  return (pthread_introspection_hook_t)_pthread_atomic_xchg_ptr((unint64_t *)&_pthread_introspection_hook, (unint64_t)hook);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)_platform_memset(__b, __c, __len);
}

void bzero(void *a1, size_t a2)
{
  _platform_bzero(a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)_platform_memmove(__dst, __src, __n);
}

mach_vm_address_t _pthread_allocate(uint64_t a1, mach_vm_address_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  kern_return_t v5;
  mach_vm_address_t v6;
  vm_size_t v7;
  BOOL v9;
  mach_vm_address_t v10;
  kern_return_t v11;
  vm_size_t v12;
  uint64_t v13;
  vm_size_t v14;
  vm_size_t size;
  mach_vm_address_t address;
  char v17;
  mach_vm_address_t *v18;
  uint64_t v19;
  vm_size_t v21;
  mach_vm_address_t v22;
  uint64_t v23;
  mach_vm_address_t v24;
  uint64_t v25;
  mach_vm_address_t v26;
  mach_vm_address_t v27;
  uint64_t v28;
  mach_vm_address_t v29;
  mach_vm_address_t v30;
  int v31;
  mach_vm_address_t v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  address = __pthread_stack_hint;
  v9 = 0;
  if (*(_QWORD *)(a1 + 24))
    v9 = *(_QWORD *)(v19 + 24) < 0x4000uLL;
  if (v9)
  {
    v3 = *(_QWORD *)(v19 + 24);
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Stack size in attrs is too small";
    qword_24058 = v3;
    __break(1u);
    JUMPOUT(0x7A9CLL);
  }
  if ((*(_QWORD *)(v19 + 16) & vm_page_mask) != 0)
  {
    v4 = *(_QWORD *)(v19 + 16);
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Unaligned stack addr in attrs";
    qword_24058 = v4;
    __break(1u);
    JUMPOUT(0x7AFCLL);
  }
  if (*(_QWORD *)(v19 + 16))
  {
    size = (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask;
    v14 = 0;
    v12 = 0;
    v13 = *(_QWORD *)(v19 + 24);
    v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0, 0, 3, 7, 1u);
  }
  else
  {
    v14 = _pthread_attr_guardsize(v19);
    v13 = _pthread_attr_stacksize(v19) + 12288;
    v12 = v13 + v14;
    size = (v13 + v14 + ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask) + vm_page_mask) & ~(_DWORD)vm_page_mask;
    v5 = mach_vm_map(mach_task_self_, &address, size, vm_page_size - 1, 503316481, 0, 0, 0, 3, 7, 1u);
  }
  v11 = v5;
  if (v5)
  {
    v11 = mach_vm_allocate(mach_task_self_, &address, size, 503316481);
  }
  else if (__syscall_logger && (v17 & 1) == 0)
  {
    __syscall_logger(503316624, mach_task_self_, size, 0, address);
  }
  if (v11)
  {
    *v18 = 0;
    return 0;
  }
  else
  {
    if (__syscall_logger && (v17 & 1) == 0)
      __syscall_logger(503316496, mach_task_self_, size, 0, address);
    if (v14)
      mach_vm_protect(mach_task_self_, address, v14, 0, 0);
    v10 = address + v12;
    if (*(_QWORD *)(v19 + 16))
      *v18 = *(_QWORD *)(v19 + 16);
    else
      *v18 = v10;
    v6 = *v18;
    v26 = v10;
    v25 = v19;
    v24 = v6;
    v23 = v13;
    v22 = address;
    v21 = size;
    v30 = v10;
    v29 = v10;
    *(_QWORD *)v10 = v10 ^ _pthread_ptr_munge_token;
    *(_QWORD *)(v26 + 224) = v26;
    *(_QWORD *)(v26 + 232) = v26 + 172;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      v36 = 0;
      v35 = 0;
      v34 = 0;
      v33 = 0;
      *(_QWORD *)(v26 + 256) = 0;
    }
    else
    {
      *(_QWORD *)(v26 + 256) = *(_QWORD *)(v25 + 32);
    }
    *(_QWORD *)(v26 + 280) = _pthread_ptr_munge_token;
    *(_BYTE *)(v26 + 49) = *(_BYTE *)(v26 + 49) & 0xFB | (4 * (*(_QWORD *)(v25 + 16) != 0));
    v32 = v26 + 72;
    v31 = 0;
    *(_DWORD *)(v26 + 72) = 0;
    *(_QWORD *)(v26 + 176) = v24;
    *(_QWORD *)(v26 + 184) = v24 - v23;
    *(_QWORD *)(v26 + 192) = v22;
    *(_QWORD *)(v26 + 200) = v21;
    v7 = _pthread_attr_guardsize(v25);
    *(_QWORD *)(v26 + 208) = v7;
    *(_BYTE *)(v26 + 49) = *(_BYTE *)(v26 + 49) & 0xFE | (*(_BYTE *)(v25 + 40) == 1);
    *(_BYTE *)(v26 + 78) = *(_BYTE *)(v25 + 41);
    *(_BYTE *)(v26 + 48) = BYTE2(*(_QWORD *)(v25 + 40));
    *(_WORD *)(v26 + 78) = *(_WORD *)(v26 + 78) & 0xFDFF | ((*(_BYTE *)(v25 + 43) & 1) << 9);
    v28 = v25;
    v27 = v26 + 56;
    if ((*(_DWORD *)(v25 + 40) & 0x1000000) != 0)
    {
      *(_QWORD *)v27 = *(_QWORD *)(v28 + 32);
    }
    else
    {
      *(_DWORD *)v27 = default_priority;
      *(_DWORD *)(v27 + 4) = 10;
    }
    *(_WORD *)(v26 + 166) = 3;
    return v10;
  }
}

uint64_t _pthread_introspection_thread_create(uint64_t result)
{
  if (_pthread_introspection_hook)
    return _pthread_introspection_hook_callout_thread_create(result);
  return result;
}

uint64_t _pthread_introspection_hook_callout_thread_create(uint64_t a1)
{
  return _pthread_introspection_call_hook(1u, a1, a1, (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
}

uint64_t _pthread_introspection_call_hook(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  __int16 v5;
  unint64_t v6;
  unint64_t StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v6 = StatusReg - 224;
  v5 = *(_WORD *)(StatusReg - 174);
  *(_WORD *)(v6 + 50) = a1;
  result = _pthread_introspection_hook(a1, a2, a3, a4);
  *(_WORD *)(v6 + 50) = v5;
  return result;
}

uint64_t _pthread_terminate_invoke(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  _BYTE v5[12288];
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t vars0;

  v9 = a1;
  v8 = a2;
  v7 = 0;
  if (((unint64_t)&vars0 & ~(vm_page_size - 1)) == (a1 & ~(vm_page_size - 1)))
  {
    v6 = v5;
    bzero(v5, 0x3000uLL);
    v7 = v6;
  }
  v2 = _pthread_terminate(v9, v8);
  return _pthread_terminate(v2, v3);
}

uint64_t _pthread_terminate(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  unsigned int v4;
  char v5;
  char v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  size_t v11;

  _pthread_introspection_thread_terminate((_QWORD *)a1);
  v11 = *(_QWORD *)(a1 + 192);
  v10 = *(_QWORD *)(a1 + 200);
  if (a1 <= v11 || a1 >= *(_QWORD *)(a1 + 192) + *(_QWORD *)(a1 + 200))
  {
    if (a1 == _main_thread_ptr)
    {
      v3 = *(_QWORD *)(a1 + 176);
      v11 = v3 - pthread_get_stacksize_np((pthread_t)a1);
      v8 = ((unint64_t)_pthread_current_stack_address() & -(uint64_t)vm_page_size) - v11;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = (a1 - v11) & -(uint64_t)vm_page_size;
    *(_QWORD *)(a1 + 192) += v8;
    *(_QWORD *)(a1 + 200) -= v8;
  }
  v7 = *(_DWORD *)(a1 + 248);
  v6 = 0;
  v5 = 0;
  v4 = 0;
  _pthread_dealloc_special_reply_port(a1);
  _pthread_dealloc_reply_port(a1);
  os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
  *(_DWORD *)(a1 + 52) = -1;
  *(_QWORD *)(a1 + 40) = a2;
  v9 = --_pthread_count < 1;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = _pthread_joiner_prepost_wake(a1);
    v5 = 1;
  }
  if ((*(_BYTE *)(a1 + 49) & 1) != 0)
  {
    v6 = 1;
    *(_BYTE *)(a1 + 49) |= 2u;
  }
  else
  {
    if (*(_QWORD *)(a1 + 16))
      *(_QWORD *)(*(_QWORD *)(a1 + 16) + 24) = *(_QWORD *)(a1 + 24);
    else
      off_28008 = *(int ***)(a1 + 24);
    **(_QWORD **)(a1 + 24) = *(_QWORD *)(a1 + 16);
  }
  os_unfair_lock_unlock(&_pthread_list_lock);
  if ((v5 & 1) != 0)
  {
    _pthread_joiner_wake(a1);
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    if (*(_QWORD *)(a1 + 32))
    {
      *(_BYTE *)(a1 + 49) |= 2u;
      v6 = 1;
    }
    os_unfair_lock_unlock(&_pthread_list_lock);
  }
  if ((v6 & 1) != 0 || a1 == _main_thread_ptr)
    v10 = v8;
  else
    _pthread_introspection_thread_destroy(a1);
  if (!v10)
    v11 = 0;
  if (v9)
    exitf(0);
  result = __bsdthread_terminate(v11, v10, v7, v4);
  qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: thread didn't terminate";
  qword_24058 = a1;
  __break(1u);
  return result;
}

_QWORD *_pthread_introspection_thread_terminate(_QWORD *result)
{
  if (_pthread_introspection_hook)
    return (_QWORD *)_pthread_introspection_hook_callout_thread_terminate(result);
  return result;
}

int *_pthread_current_stack_address()
{
  int *result;
  int v1;

  result = &v1;
  v1 = 0;
  return result;
}

uint64_t _pthread_dealloc_special_reply_port(uint64_t result)
{
  unsigned int v1;

  v1 = *(_DWORD *)(result + 288);
  if (v1)
  {
    *(_DWORD *)(result + 288) = 0;
    return thread_destruct_special_reply_port(v1, 0);
  }
  return result;
}

void _pthread_dealloc_reply_port(uint64_t a1)
{
  mach_port_t reply_port;

  reply_port = *(_DWORD *)(a1 + 240);
  if (reply_port)
    mig_dealloc_reply_port(reply_port);
}

uint64_t _pthread_introspection_hook_callout_thread_terminate(_QWORD *a1)
{
  if (a1 == (_QWORD *)_main_thread_ptr)
    return _pthread_introspection_call_hook(3u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  else
    return _pthread_introspection_call_hook(3u, (uint64_t)a1, a1[24], a1[25] - ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask));
}

uint64_t _pthread_strtoul(char *a1, _QWORD *a2, int a3)
{
  char v4;
  uint64_t v5;
  char *i;

  i = a1;
  v5 = 0;
  if ((a3 == 16 || !a3) && a1 && *a1 == 48 && a1[1] == 120)
  {
    for (i = a1 + 2; ; ++i)
    {
      v4 = *i;
      if (*i < 48 || v4 > 57)
      {
        if (v4 < 97 || v4 > 102)
        {
          if (v4 < 65 || v4 > 70)
            break;
          v5 = 16 * v5 + v4 - 55;
        }
        else
        {
          v5 = 16 * v5 + v4 - 87;
        }
      }
      else
      {
        v5 = 16 * v5 + v4 - 48;
      }
    }
  }
  *a2 = i;
  return v5;
}

uint64_t _pthread_introspection_hook_callout_thread_start(_QWORD *a1)
{
  if (a1 == (_QWORD *)_main_thread_ptr)
    return _pthread_introspection_call_hook(2u, (uint64_t)a1, a1[23] - a1[26], a1[22] - a1[23] + a1[26]);
  else
    return _pthread_introspection_call_hook(2u, (uint64_t)a1, a1[24], a1[25] - ((vm_page_mask + 6368) & ~(_DWORD)vm_page_mask));
}

uint64_t _pthread_introspection_hook_callout_thread_destroy(uint64_t a1)
{
  return _pthread_introspection_call_hook(4u, a1, a1, (vm_page_mask + 6368) & ~(_DWORD)vm_page_mask);
}

BOOL _pthread_setcancelstate_exit(uint64_t a1)
{
  unsigned __int16 v1;
  _BOOL8 result;
  unsigned __int16 *v3;
  _BOOL4 v4;
  unsigned __int16 v5;

  v3 = (unsigned __int16 *)(a1 + 166);
  do
  {
    if (_os_atomic_mo_has_acquire(0))
      v1 = __ldaxr(v3);
    else
      v1 = __ldxr(v3);
    v5 = v1 & 0xFFDC | 0x22;
    result = _os_atomic_mo_has_release(0);
    if (result)
      v4 = __stlxr(v5, v3) == 0;
    else
      v4 = __stxr(v5, v3) == 0;
  }
  while (!v4);
  return result;
}

int pthread_cancel(pthread_t a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  unsigned __int16 v7;
  int v8;
  unsigned __int16 *v10;
  unsigned __int16 v11;
  unsigned int v12;
  char v15;
  int *i;
  char v18;

  if (a1 == (pthread_t)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((pthread_t)(a1->__sig ^ _pthread_ptr_munge_token) != a1)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    v15 = 1;
  }
  else
  {
    if (a1)
    {
      v1 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        v2 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (!v2 && __stlxr(v1, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v2)
        os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
      for (i = __pthread_head; i; i = (int *)*((_QWORD *)i + 2))
      {
        if (i == (int *)a1)
        {
          if ((int *)(*(_QWORD *)i ^ _pthread_ptr_munge_token) != i)
            abort_with_reason(18, 4, "pthread_t was corrupted", 0);
          v18 = 1;
          goto LABEL_25;
        }
      }
      v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        v4 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (v4 == v3 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v4 != v3)
        os_unfair_lock_unlock(&_pthread_list_lock);
      v18 = 0;
    }
    else
    {
      v18 = 0;
    }
LABEL_25:
    if ((v18 & 1) != 0)
    {
      v15 = 1;
      v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
        v6 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
      while (v6 == v5 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
      if (v6 != v5)
        os_unfair_lock_unlock(&_pthread_list_lock);
    }
    else
    {
      v15 = 0;
    }
  }
  if ((v15 & 1) == 0)
    return 3;
  if (((*(_WORD *)&a1->__opaque[62] >> 10) & 1) != 0)
    return 45;
  v10 = (unsigned __int16 *)&a1->__opaque[150];
  v11 = *(_WORD *)&a1->__opaque[150];
  do
  {
    v7 = v11;
    do
      v8 = __ldaxr(v10);
    while (v8 == v11 && __stlxr(v11 | 0x10, v10));
    v11 = v8;
  }
  while (v7 != (unsigned __int16)v8);
  if ((v8 & 1) != 0)
  {
    v12 = *(_DWORD *)&a1->__opaque[232];
    if (v12)
      __pthread_markcancel(v12);
  }
  return 0;
}

int pthread_setcancelstate(int a1, int *a2)
{
  unsigned __int16 v2;
  _QWORD *v4;
  unsigned __int16 *v8;
  _BOOL4 v9;
  unsigned __int16 v10;
  char v11;

  v4 = (_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((_QWORD *)(*v4 ^ _pthread_ptr_munge_token) != v4)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  if (a1)
  {
    if (a1 != 1)
      return 22;
    __pthread_canceled(1);
  }
  else
  {
    __pthread_canceled(2);
  }
  v8 = (unsigned __int16 *)v4 + 83;
  do
  {
    if (_os_atomic_mo_has_acquire(0))
      v2 = __ldaxr(v8);
    else
      v2 = __ldxr(v8);
    v11 = v2;
    v10 = v2 & 0xFFFE | a1;
    if (_os_atomic_mo_has_release(0))
      v9 = __stlxr(v10, v8) == 0;
    else
      v9 = __stxr(v10, v8) == 0;
  }
  while (!v9);
  if (a2)
    *a2 = v11 & 1;
  return 0;
}

int pthread_setcanceltype(int a1, int *a2)
{
  unsigned __int16 v2;
  _QWORD *v4;
  unsigned __int16 *v8;
  _BOOL4 v9;
  unsigned __int16 v10;
  char v11;

  v4 = (_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((_QWORD *)(*v4 ^ _pthread_ptr_munge_token) != v4)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  if (a1 != 2 && a1)
    return 22;
  v8 = (unsigned __int16 *)v4 + 83;
  do
  {
    if (_os_atomic_mo_has_acquire(0))
      v2 = __ldaxr(v8);
    else
      v2 = __ldxr(v8);
    v11 = v2;
    v10 = v2 & 0xFFFD | a1;
    if (_os_atomic_mo_has_release(0))
      v9 = __stlxr(v10, v8) == 0;
    else
      v9 = __stxr(v10, v8) == 0;
  }
  while (!v9);
  if (a2)
    *a2 = v11 & 2;
  return 0;
}

void pthread_testcancel(void)
{
  char v0;
  unint64_t StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v0 = atomic_load((unsigned __int16 *)(StatusReg - 58));
  if ((v0 & 0x11) == 0x11)
  {
    if ((*(_QWORD *)(StatusReg - 224) ^ _pthread_ptr_munge_token) != StatusReg - 224)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    *(_BYTE *)(StatusReg - 59) = 1;
    pthread_exit((char *)&dword_0 + 1);
  }
}

uint64_t _pthread_markcancel_if_canceled(uint64_t result, unsigned int a2)
{
  char v2;

  v2 = atomic_load((unsigned __int16 *)(result + 166));
  if ((v2 & 0x11) == 0x11)
    return __pthread_markcancel(a2);
  return result;
}

uint64_t _pthread_exit_if_canceled(uint64_t result)
{
  unint64_t v1;
  int v2;

  v2 = result;
  if (result == 4)
  {
    result = __pthread_canceled(0);
    if (!(_DWORD)result)
    {
      v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
      if ((*(_QWORD *)v1 ^ _pthread_ptr_munge_token) != v1)
        abort_with_reason(18, 4, "pthread_t was corrupted", 0);
      *(_DWORD *)(v1 + 168) = v2;
      *(_BYTE *)(v1 + 165) = 1;
      pthread_exit((char *)&dword_0 + 1);
    }
  }
  return result;
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  int v4;

  v4 = 0;
  if (__pthread_sigmask(a1, a2, a3) == -1)
    return **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v4;
}

uint64_t _pthread_joiner_prepost_wake(uint64_t a1)
{
  unsigned __int16 v1;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = 0;
  if ((*(_BYTE *)(a1 + 49) & 1) != 0)
  {
    v3 = *(_DWORD *)(v4 + 20);
    *(_BYTE *)(a1 + 49) &= ~1u;
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    *(_QWORD *)(a1 + 32) = 0;
  }
  if (*(_QWORD *)(v4 + 8))
  {
    v6 = 17;
    v1 = atomic_load((unsigned __int16 *)(a1 + 166));
    if ((unsigned __int16)(v1 & v6) == 0x11)
      v5 = 1;
    else
      v5 = *(_QWORD *)(a1 + 40);
    **(_QWORD **)(v4 + 8) = v5;
  }
  return v3;
}

uint64_t _pthread_join(uint64_t a1, uint64_t *a2, int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned __int16 v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v9;
  _QWORD v10[2];
  __int128 v11;
  _QWORD *v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  int v25;
  int v26;
  uint64_t v27;
  int *i;
  int *v29;
  char v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  os_unfair_lock_s *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t StatusReg;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  os_unfair_lock_s *v44;
  BOOL v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  os_unfair_lock_s *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  BOOL v61;
  int v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  os_unfair_lock_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  BOOL v70;
  int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  os_unfair_lock_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;

  v15 = a1;
  v14 = a2;
  v13 = a3;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v17 = StatusReg;
  v12 = (_QWORD *)(StatusReg - 224);
  v10[0] = StatusReg - 224;
  v10[1] = a2;
  v11 = 0uLL;
  v9 = 0;
  v29 = (int *)a1;
  i = 0;
  if (a1)
  {
    v44 = &_pthread_list_lock;
    v51 = &_pthread_list_lock;
    v50 = 327680;
    v49 = 0;
    v52 = 3;
    v53 = 3;
    v54 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v49 = *(_QWORD *)(v54 + 24);
    v48 = 0;
    v47 = v49;
    v46 = v49;
    do
      v3 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (!v3 && __stlxr(v49, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v3)
      v48 = v3;
    v45 = v3 == 0;
    if (v3)
      a1 = os_unfair_lock_lock_with_options(v51, v50);
    for (i = __pthread_head; i; i = (int *)*((_QWORD *)i + 2))
    {
      if (i == v29)
      {
        v32 = i;
        v31 = 0;
        v31 = *(_QWORD *)i ^ _pthread_ptr_munge_token;
        if ((int *)v31 != i)
          a1 = abort_with_reason(18, 4, "pthread_t was corrupted", 0);
        v30 = 1;
        goto LABEL_25;
      }
    }
    v35 = &_pthread_list_lock;
    v75 = &_pthread_list_lock;
    v74 = 0;
    v76 = 3;
    v77 = 3;
    v78 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v74 = *(_QWORD *)(v78 + 24);
    v73 = 0;
    v72 = v74;
    v71 = 0;
    do
      v4 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (v4 == v74 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v4 != v74)
      v72 = v4;
    v70 = v4 == v74;
    if (v4 != v74)
      os_unfair_lock_unlock(v75);
    v30 = 0;
  }
  else
  {
    v30 = 0;
  }
LABEL_25:
  if ((v30 & 1) != 0)
  {
    v19 = v12;
    v18 = 0;
    v18 = *v12 ^ _pthread_ptr_munge_token;
    if ((_QWORD *)v18 != v12)
      a1 = abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    if ((*(_BYTE *)(v15 + 49) & 1) != 0 && !*(_QWORD *)(v15 + 32))
    {
      if ((_QWORD *)v15 == v12 || v12[4] && *(_QWORD *)v12[4] == v15)
      {
        v9 = 11;
      }
      else if (*(_DWORD *)(v15 + 52) == -1)
      {
        if (*(_QWORD *)(v15 + 16))
          *(_QWORD *)(*(_QWORD *)(v15 + 16) + 24) = *(_QWORD *)(v15 + 24);
        else
          off_28008 = *(int ***)(v15 + 24);
        **(_QWORD **)(v15 + 24) = *(_QWORD *)(v15 + 16);
        if ((*(_BYTE *)(v15 + 49) & 2) == 0)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_joiner_cleans_up";
          __break(1u);
          JUMPOUT(0x9F98);
        }
        *(_BYTE *)(v15 + 49) &= ~1u;
        if (v14)
        {
          v20 = v15;
          v27 = v15;
          v26 = 17;
          v5 = atomic_load((unsigned __int16 *)(v15 + 166));
          v23 = v5;
          v24 = v5;
          v22 = v5;
          v25 = v5;
          if ((v26 & ~v5) != 0)
            v21 = *(_QWORD *)(v20 + 40);
          else
            v21 = 1;
          *v14 = v21;
        }
      }
      else
      {
        LODWORD(v11) = *(_DWORD *)(v15 + 248);
        *(_DWORD *)(v15 + 52) = v11;
        *(_QWORD *)(v15 + 32) = v10;
        if ((*(_BYTE *)(v15 + 49) & 4) != 0)
        {
          v33 = 0;
          v42 = 9;
          v43 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          v33 = *(_QWORD *)(v43 + 72);
          if (v33)
          {
            v59 = 9;
            v58 = 0;
            v60 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            *(_QWORD *)(v60 + 72) = 0;
            v34 = v33;
          }
          else
          {
            v34 = _os_semaphore_create(a1);
          }
          DWORD1(v11) = v34;
        }
      }
    }
    else
    {
      v9 = 22;
    }
    v36 = &_pthread_list_lock;
    v66 = &_pthread_list_lock;
    v65 = 0;
    v67 = 3;
    v68 = 3;
    v69 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v65 = *(_QWORD *)(v69 + 24);
    v64 = 0;
    v63 = v65;
    v62 = 0;
    v6 = v65;
    do
      v7 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
    while (v7 == v6 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
    if (v7 != v6)
      v63 = v7;
    v61 = v7 == v6;
    if (v7 != v6)
      os_unfair_lock_unlock(v66);
    if (!v9)
    {
      if ((_DWORD)v11)
        v9 = _pthread_joiner_wait(v15, v10, v13);
      else
        _pthread_deallocate(v15, 0);
    }
    if (!v9 && DWORD1(v11) && (BYTE8(v11) & 1) == 0)
    {
      while (__semwait_signal_nocancel(DWORD1(v11), 0, 0, 0, 0))
        ;
    }
    if (DWORD1(v11))
    {
      v38 = DWORD1(v11);
      v37 = 0;
      v40 = 9;
      v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v37 = *(_QWORD *)(v41 + 72);
      v56 = 9;
      v55 = DWORD1(v11);
      v57 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(_QWORD *)(v57 + 72) = DWORD1(v11);
      if (v37)
        _os_semaphore_dispose(v37);
    }
    return v9;
  }
  else
  {
    return 3;
  }
}

uint64_t _pthread_joiner_wait(uint64_t a1, _DWORD *a2, int a3)
{
  unsigned int v3;
  unsigned __int16 v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  BOOL v10;
  BOOL v11;
  unsigned int v12;
  unsigned int *v13;
  int v17;

  v13 = (unsigned int *)(a1 + 52);
  v12 = 16777218;
  if (a3 == 2)
    v12 = 16908290;
  while (1)
  {
    v3 = atomic_load(v13);
    if (v3 == -1)
      break;
    if (v3 != a2[4])
    {
      qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_join() state corruption";
      qword_24058 = v3;
      __break(1u);
      JUMPOUT(0xA430);
    }
    if (-(int)__ulock_wait(v12, v13, a2[4]) == 4)
    {
      v10 = 0;
      if (a3 == 2)
      {
        v17 = 17;
        v4 = atomic_load((unsigned __int16 *)(*(_QWORD *)a2 + 166));
        v10 = (v17 & ~v4) == 0;
      }
      if (v10 && _pthread_joiner_abort_wait(a1, (uint64_t)a2))
      {
        *(_BYTE *)(*(_QWORD *)a2 + 165) = &dword_0 + 1;
        pthread_exit((char *)&dword_0 + 1);
      }
    }
  }
  v11 = 0;
  v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v6 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (!v6 && __stlxr(v5, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v6)
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
  if ((a2[6] & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 32) != (_QWORD)a2)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xA6B8);
    }
    *(_QWORD *)(a1 + 32) = 0;
    v11 = (*(_BYTE *)(a1 + 49) & 2) != 0;
  }
  v7 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v8 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (v8 == v7 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v8 != v7)
    os_unfair_lock_unlock(&_pthread_list_lock);
  if (v11)
    _pthread_deallocate(a1, 0);
  return 0;
}

uint64_t pthread_join_NOCANCEL(uint64_t a1, uint64_t *a2)
{
  int v2;

  _pthread_testcancel_if_cancelable_variant();
  v2 = _pthread_conformance();
  return _pthread_join(a1, a2, v2);
}

uint64_t _pthread_conformance()
{
  return 1;
}

uint64_t pthread_cond_wait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2)
{
  int v2;

  v2 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, 0, 0, v2);
}

uint64_t pthread_cond_timedwait_NOCANCEL(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3)
{
  int v3;

  v3 = _pthread_conformance();
  return _pthread_cond_wait(a1, a2, a3, 0, v3);
}

uint64_t sigwait_NOCANCEL(uint64_t a1, uint64_t a2)
{
  unsigned int v3;

  v3 = 0;
  _pthread_testcancel_if_cancelable_variant();
  if (__sigwait(a1, a2) == -1)
  {
    v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant();
    if (v3 == 4)
      return 0;
  }
  return v3;
}

BOOL _os_atomic_mo_has_acquire(int a1)
{
  BOOL v1;
  _BOOL4 v4;

  v1 = a1 == 2 || a1 == 1;
  v4 = 1;
  if (!v1 && a1 != 5 && a1 != 4)
    return 0;
  return v4;
}

BOOL _os_atomic_mo_has_release(int a1)
{
  return (a1 - 3) <= 2;
}

uint64_t _pthread_joiner_abort_wait(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  char v7;

  v7 = 0;
  v2 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v3 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (!v3 && __stlxr(v2, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v3)
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
  if ((*(_BYTE *)(a2 + 24) & 1) == 0 && *(_DWORD *)(a1 + 52) != -1)
  {
    if (*(_QWORD *)(a1 + 32) != a2)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Assertion failed: thread->tl_join_ctx == ctx";
      __break(1u);
      JUMPOUT(0xABA0);
    }
    *(_QWORD *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    v7 = 1;
  }
  v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v5 = __ldaxr(&_pthread_list_lock._os_unfair_lock_opaque);
  while (v5 == v4 && __stlxr(0, &_pthread_list_lock._os_unfair_lock_opaque));
  if (v5 != v4)
    os_unfair_lock_unlock(&_pthread_list_lock);
  return v7 & 1;
}

int pthread_condattr_init(pthread_condattr_t *a1)
{
  a1->__sig = 1129202753;
  *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | 2;
  return 0;
}

int pthread_condattr_destroy(pthread_condattr_t *a1)
{
  a1->__sig = 0;
  return 0;
}

int pthread_condattr_getpshared(const pthread_condattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1129202753)
  {
    *a2 = *(_DWORD *)a1->__opaque & 3;
    return 0;
  }
  return v3;
}

int pthread_condattr_setpshared(pthread_condattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1129202753 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = *(_DWORD *)a1->__opaque & 0xFFFFFFFC | a2 & 3;
    return 0;
  }
  return v3;
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 1, 1);
}

uint64_t _pthread_cond_wait(uint64_t a1, pthread_mutex_t *a2, uint64_t *a3, int a4, int a5)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t *v19;
  pthread_mutex_t *v20;
  unsigned int *v21;
  pthread_mutex_t *v23;
  pthread_mutex_t *v24;
  pthread_mutex_t *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int *v39;

  v21 = (unsigned int *)a1;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v17 = a5;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  v23 = a2;
  if ((a2->__sig & 0xFFFFFFFDLL) != 0x4D555458)
  {
    v24 = v20;
    if ((v20->__sig & 0xFFFFFFF0) != 0x32AAABA0)
      return 22;
  }
  v12 = 0;
  v25 = v20;
  v12 = (*(_DWORD *)&v20->__opaque[4] & 0x4000) != 0;
  v11 = 0;
  if (v12)
    v5 = 1129270854;
  else
    v5 = 1129270853;
  v11 = v5;
  v31 = v21;
  v30 = (unsigned int *)&v11;
  v29 = 0;
  v28 = 0;
  v27 = *v21;
  v28 = v27;
  v26 = v27;
  v29 = v27;
  if (v27 == 1018212795)
  {
    v32 = _pthread_cond_check_init_slow((uint64_t)v31, v30);
  }
  else
  {
    v39 = v31;
    v38 = v29;
    v37 = v30;
    v36 = 0;
    if (v29 == 1129270852)
    {
      if (*v37 != 1129270852)
      {
        v35 = 0;
        v35 = *v37;
        v34 = v35;
        *v39 = v35;
        v33 = v35;
      }
    }
    else if (v29 - 1129270853 < 2)
    {
      if (*v37 == 1129270852)
      {
        *v37 = v38;
      }
      else if (*v37 != v38)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xB0ACLL);
      }
    }
    else
    {
      v36 = 22;
    }
    v32 = v36;
  }
  v16 = v32;
  if (v32)
    return v16;
  if (v17 == 2)
    pthread_testcancel();
  if (v19)
  {
    if (v19[1] < 0 || (unint64_t)v19[1] >= 0x3B9ACA00)
      return 22;
    if (v18)
    {
      v14 = *v19;
      v15 = v19[1];
      if (!v14 && !v15)
        v13 = 1;
      goto LABEL_40;
    }
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
    __gettimeofday(&v7);
    v9 = v7;
    v10 = 1000 * (int)v8;
    if (*v19 == v7)
    {
      if (v19[1] > v10)
      {
LABEL_34:
        v15 = v19[1] - v10;
        v14 = *v19 - v9;
        if (v15 < 0)
        {
          v15 += 1000000000;
          --v14;
        }
        goto LABEL_40;
      }
    }
    else if (*v19 >= v9)
    {
      goto LABEL_34;
    }
    v13 = 1;
  }
LABEL_40:
  if (v12 || !*((_QWORD *)v21 + 2) || *((_QWORD *)v21 + 2) == (_QWORD)v20)
  {
    if ((v13 & 1) != 0)
    {
      v16 = pthread_mutex_unlock(v20);
      if (v16)
      {
        return v16;
      }
      else
      {
        v16 = pthread_mutex_lock(v20);
        if (v16)
          return v16;
        else
          return 60;
      }
    }
    else if (v12)
    {
      return _pthread_ulock_cond_wait((uint64_t)v21, (uint64_t)v20, &v14, v17);
    }
    else
    {
      return _pthread_psynch_cond_wait((uint64_t)v21, v20, &v14, v17);
    }
  }
  else
  {
    return 22;
  }
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v6;
  unsigned int v7;
  _BYTE v9[5];
  unsigned int *v10;
  unsigned int *v11;
  unsigned int *v12;
  unint64_t *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int sig;
  int v21;
  int v22;
  int v23;
  os_unfair_lock_s *v24;
  os_unfair_lock_s *v25;
  unsigned int **v26;
  unsigned int **v27;
  unint64_t **v28;
  unint64_t **v29;
  os_unfair_lock_s *v30;
  os_unfair_lock_s *v31;
  int v32;
  os_unfair_lock_s *v33;
  BOOL v34;
  int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  os_unfair_lock_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t StatusReg;

  v24 = (os_unfair_lock_s *)a1;
  v23 = 22;
  v22 = 0;
  v21 = 0;
  sig = a1->__sig;
  v21 = sig;
  v19 = sig;
  v22 = sig;
  if (sig == 1018212795 || sig == 1129270852)
  {
LABEL_28:
    v24->_os_unfair_lock_opaque = 0;
    return 0;
  }
  if (sig != 1129270853)
  {
    if (sig != 1129270854)
      return v23;
    goto LABEL_28;
  }
  v25 = v24 + 2;
  v33 = v24 + 2;
  v32 = 327680;
  os_unfair_lock_lock_with_options(&v24[2], 327680);
  v18 = 0;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v30 = v24;
  v29 = &v13;
  v28 = (unint64_t **)&v12;
  v27 = &v11;
  v26 = &v10;
  if (((v24[3]._os_unfair_lock_opaque >> 29) & 1) != 0)
  {
    *v28 = (unint64_t *)&v30[7]._os_unfair_lock_opaque;
    *v26 = &v30[8]._os_unfair_lock_opaque;
    *v27 = &v30[6]._os_unfair_lock_opaque;
  }
  else
  {
    *v28 = (unint64_t *)&v30[6]._os_unfair_lock_opaque;
    *v26 = &v30[7]._os_unfair_lock_opaque;
    *v27 = &v30[8]._os_unfair_lock_opaque;
  }
  *v29 = *v28;
  do
  {
    v16 = *v12;
    v15 = *v11;
    v14 = *v10;
    if ((v16 & 0xFFFFFF00) != (v14 & 0xFFFFFF00))
      break;
    v18 = ((unint64_t)v14 << 32) | v16;
    v17 = v18;
    v1 = v13;
    v2 = v18;
    v3 = v18;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
  }
  while (v4 != v2);
  v9[4] = 0;
  *(_DWORD *)v9 = (v14 & 2) != 0;
  if ((v14 & 2) != 0 && v24[3]._os_unfair_lock_opaque >> 30 == 1)
    *(_DWORD *)&v9[1] |= 0x10u;
  v24->_os_unfair_lock_opaque = 0;
  v23 = 0;
  v31 = v24 + 2;
  v39 = v24 + 2;
  v38 = 0;
  v40 = 3;
  v41 = 3;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v38 = *(_QWORD *)(StatusReg + 24);
  v37 = 0;
  v36 = v38;
  p_os_unfair_lock_opaque = &v24[2]._os_unfair_lock_opaque;
  v35 = 0;
  v6 = v38;
  do
    v7 = __ldaxr(p_os_unfair_lock_opaque);
  while (v7 == v6 && __stlxr(0, p_os_unfair_lock_opaque));
  if (v7 != v6)
    v36 = v7;
  v34 = v7 == v6;
  if (v7 != v6)
    os_unfair_lock_unlock(v39);
  if ((v9[0] & 1) != 0)
    __psynch_cvclrprepost(v24, v16, v15, v14, 0, v16, *(unsigned int *)&v9[1]);
  return v23;
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  int v15;
  __int16 v16;
  __int16 v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  pthread_cond_t *v22;
  unsigned int v24;
  unsigned int sig;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  pthread_cond_t *v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  _BOOL4 v34;
  BOOL v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  _BOOL4 v39;
  unsigned int v40;
  _BOOL4 v41;
  BOOL v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  _BOOL4 v46;
  unsigned int v47;
  _BOOL4 v48;
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  _BOOL4 v53;
  unint64_t v54;
  char v55;
  int v56;
  int v57;
  int v58;
  unsigned int *v59;
  unsigned int *v60;
  unsigned int *v61;
  unint64_t *v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  unint64_t v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  char v72;
  pthread_cond_t *v73;
  unsigned int **v75;
  unsigned int **v76;
  unsigned int **v77;
  unsigned int **v78;
  pthread_cond_t *v79;
  uint64_t v80;
  int v81;
  unsigned int v82;
  _BOOL4 v83;
  unint64_t v84;
  unint64_t *v85;
  _BOOL4 v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t *v89;
  unsigned int v90;
  char v91;
  pthread_cond_t *v92;
  pthread_cond_t *v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int *v99;
  unsigned int v100;
  pthread_cond_t *v101;

  v22 = a1;
  v21 = 1;
  v20 = 0;
  v19 = 1129270852;
  v29 = a1;
  v28 = &v19;
  v27 = 0;
  v26 = 0;
  sig = a1->__sig;
  v26 = sig;
  v24 = sig;
  v27 = sig;
  if (sig == 1018212795)
  {
    v30 = _pthread_cond_check_init_slow((uint64_t)v29, v28);
  }
  else
  {
    v101 = v29;
    v100 = v27;
    v99 = v28;
    v98 = 0;
    if (v27 == 1129270852)
    {
      if (*v99 != 1129270852)
      {
        v97 = 0;
        v97 = *v99;
        v96 = v97;
        LODWORD(v101->__sig) = v97;
        v95 = v97;
      }
    }
    else if (v27 - 1129270853 < 2)
    {
      if (*v99 == 1129270852)
      {
        *v99 = v100;
      }
      else if (*v99 != v100)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xBAD8);
      }
    }
    else
    {
      v98 = 22;
    }
    v30 = v98;
  }
  if (v30 || v19 == 1129270852)
    return v30;
  if (v19 != 1129270853)
  {
    if (v19 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v19;
      __break(1u);
      JUMPOUT(0xC544);
    }
    v92 = v22;
    v91 = v21 & 1;
    v90 = v20;
    v89 = 0;
    v94 = v22;
    v89 = (unint64_t *)&v94->__opaque[4 * ((*(_DWORD *)&v94->__opaque[4] >> 29) & 1) + 16];
    v88 = 0;
    v87 = 0;
    v86 = 0;
    v85 = v89;
    do
    {
      if (_os_atomic_mo_has_acquire(3))
        v13 = __ldaxr(v85);
      else
        v13 = __ldxr(v85);
      v88 = v13;
      if (!WORD2(v13) || WORD2(v88) == HIWORD(v88))
      {
        __clrex();
        return 0;
      }
      LODWORD(v84) = v88 + 1;
      WORD2(v84) = WORD2(v88);
      if ((v91 & 1) != 0)
      {
        v17 = WORD2(v88);
      }
      else
      {
        if (HIWORD(v88) + 1 < WORD2(v88))
          v16 = HIWORD(v88) + 1;
        else
          v16 = WORD2(v88);
        v17 = v16;
      }
      HIWORD(v84) = v17;
      v87 = v84;
      if (_os_atomic_mo_has_release(3))
        v86 = __stlxr(v87, v85) == 0;
      else
        v86 = __stxr(v87, v85) == 0;
    }
    while (!v86);
    v83 = v86;
    if (HIWORD(v88) < (int)WORD2(v88))
    {
      v82 = 16777217;
      if ((v91 & 1) != 0)
      {
        v82 |= 0x100u;
      }
      else if (v90)
      {
        v82 |= 0x200u;
      }
      while (1)
      {
        v81 = 0;
        v81 = __ulock_wake(v82, v89, v90);
        if ((v81 & 0x80000000) == 0)
          break;
        v15 = -v81;
        if (v81 == -2)
          break;
        if (v15 != 4)
        {
          if (v15 != 37)
          {
            v80 = -v81;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v80;
            __break(1u);
            JUMPOUT(0xC4E8);
          }
          if (!v90)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xC48CLL);
          }
          return pthread_cond_broadcast(v92);
        }
      }
    }
    return 0;
  }
  v73 = v22;
  v72 = v21 & 1;
  v71 = v20;
  v70 = 0;
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v66 = 0;
  v65 = 0;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v79 = v22;
  v78 = (unsigned int **)&v62;
  v77 = &v61;
  v76 = &v60;
  v75 = &v59;
  if ((*(_DWORD *)&v22->__opaque[4] & 0x20000000) != 0)
  {
    *v77 = (unsigned int *)&v79->__opaque[20];
    *v75 = (unsigned int *)&v79->__opaque[24];
    *v76 = (unsigned int *)&v79->__opaque[16];
  }
  else
  {
    *v77 = (unsigned int *)&v79->__opaque[16];
    *v75 = (unsigned int *)&v79->__opaque[20];
    *v76 = (unsigned int *)&v79->__opaque[24];
  }
  *v78 = *v77;
  v55 = 0;
  do
  {
    v55 = 0;
    v65 = *v61;
    v64 = *v60;
    v63 = *v59;
    v69 = 0;
    v68 = 0;
    if ((v65 & 0xFFFFFF00) == (v63 & 0xFFFFFF00) || !v71 && (v65 & 0xFFFFFF00) == (v64 & 0xFFFFFF00))
    {
      v67 = (unint64_t)v63 << 32;
      v67 |= v65;
      v66 = v67;
      v54 = v67;
      v53 = 0;
      v1 = v62;
      v51 = v67;
      v50 = v67;
      v52 = v67;
      v2 = v67;
      v3 = v67;
      do
        v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2)
        v54 = v4;
      v49 = v4 == v2;
      v53 = v4 == v2;
      v48 = v53;
      if (v4 == v2)
        return 0;
      v55 = 1;
    }
    else
    {
      if (v71)
        break;
      if (is_seqhigher(v63 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v58 > 0x2000)
          return 35;
LABEL_51:
        sched_yield();
        v55 = 1;
        goto LABEL_58;
      }
      if (is_seqhigher(v64 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v57 > 0x2000)
        {
          if (v56)
            return 35;
          v47 = v64;
          v46 = 0;
          v5 = v60;
          v44 = v63 & 0xFFFFFF00;
          v43 = v63 & 0xFFFFFF00;
          v45 = v63 & 0xFFFFFF00;
          v6 = v64;
          v7 = v63 & 0xFFFFFF00;
          do
            v8 = __ldaxr(v5);
          while (v8 == v6 && __stlxr(v7, v5));
          if (v8 != v6)
            v47 = v8;
          v42 = v8 == v6;
          v46 = v8 == v6;
          v41 = v46;
          if (v8 == v6)
          {
            v56 = 1;
            v57 = 0;
          }
        }
        goto LABEL_51;
      }
      if (is_seqlower(v64 & 0xFFFFFF00, v63 & 0xFFFFFF00))
        v68 = v63 & 0xFFFFFF00;
      else
        v68 = v64 & 0xFFFFFF00;
      if ((v72 & 1) != 0)
      {
        v69 = diff_genseq(v65, v68);
        v68 = v65 & 0xFFFFFF00;
      }
      else
      {
        v68 += 256;
      }
    }
LABEL_58:
    v18 = 1;
    if ((v55 & 1) == 0)
    {
      v40 = v64;
      v39 = 0;
      v9 = v60;
      v37 = v68;
      v36 = v68;
      v38 = v68;
      v10 = v64;
      v11 = v68;
      do
        v12 = __ldaxr(v9);
      while (v12 == v10 && __stlxr(v11, v9));
      if (v12 != v10)
        v40 = v12;
      v35 = v12 == v10;
      v39 = v12 == v10;
      v34 = v39;
      v18 = v12 != v10;
    }
  }
  while (v18);
  v33 = 0;
  if (*(_DWORD *)&v73->__opaque[4] >> 30 == 1)
    v33 |= 0x10u;
  v32 = v65 | ((unint64_t)v63 << 32);
  if ((v72 & 1) != 0)
  {
    v31 = v69 | ((unint64_t)v64 << 32);
    v70 = __psynch_cvbroad(v73, v32, v31, v33, 0, 0);
  }
  else
  {
    v70 = __psynch_cvsignal(v73, v32, v64, v71, 0, 0, 0, v33);
  }
  if (v70 != -1 && v70)
    _pthread_cond_updateval((uint64_t)v73, 0, 0, v70);
  return 0;
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  int v16;
  __int16 v17;
  __int16 v18;
  BOOL v19;
  mach_port_t v20;
  unsigned int v22;
  mach_port_t v23;
  char v24;
  pthread_cond_t *v25;
  unsigned int v27;
  unsigned int sig;
  unsigned int v29;
  unsigned int v30;
  unsigned int *v31;
  pthread_cond_t *v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  _BOOL4 v37;
  BOOL v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  _BOOL4 v42;
  unsigned int v43;
  _BOOL4 v44;
  BOOL v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  _BOOL4 v49;
  unsigned int v50;
  _BOOL4 v51;
  BOOL v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  unint64_t v57;
  char v58;
  int v59;
  int v60;
  int v61;
  unsigned int *v62;
  unsigned int *v63;
  unsigned int *v64;
  unint64_t *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unint64_t v69;
  unint64_t v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  mach_port_t v74;
  char v75;
  pthread_cond_t *v76;
  unsigned int **v78;
  unsigned int **v79;
  unsigned int **v80;
  unsigned int **v81;
  pthread_cond_t *v82;
  uint64_t v83;
  int v84;
  unsigned int v85;
  _BOOL4 v86;
  unint64_t v87;
  unint64_t *v88;
  _BOOL4 v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t *v92;
  mach_port_t v93;
  char v94;
  pthread_cond_t *v95;
  pthread_cond_t *v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  unsigned int *v102;
  unsigned int v103;
  pthread_cond_t *v104;

  v20 = 0;
  if (a2)
    v20 = pthread_mach_thread_np(a2);
  v25 = a1;
  v24 = 0;
  v23 = v20;
  v22 = 1129270852;
  v32 = a1;
  v31 = &v22;
  v30 = 0;
  v29 = 0;
  sig = a1->__sig;
  v29 = sig;
  v27 = sig;
  v30 = sig;
  if (sig == 1018212795)
  {
    v33 = _pthread_cond_check_init_slow((uint64_t)v32, v31);
  }
  else
  {
    v104 = v32;
    v103 = v30;
    v102 = v31;
    v101 = 0;
    if (v30 == 1129270852)
    {
      if (*v102 != 1129270852)
      {
        v100 = 0;
        v100 = *v102;
        v99 = v100;
        LODWORD(v104->__sig) = v100;
        v98 = v100;
      }
    }
    else if (v103 - 1129270853 < 2)
    {
      if (*v102 == 1129270852)
      {
        *v102 = v103;
      }
      else if (*v102 != v103)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xC784);
      }
    }
    else
    {
      v101 = 22;
    }
    v33 = v101;
  }
  if (v33 || v22 == 1129270852)
    return v33;
  if (v22 != 1129270853)
  {
    if (v22 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v22;
      __break(1u);
      JUMPOUT(0xD248);
    }
    v95 = v25;
    v94 = v24 & 1;
    v93 = v23;
    v92 = 0;
    v97 = v25;
    v92 = (unint64_t *)&v97->__opaque[4 * ((*(_DWORD *)&v97->__opaque[4] >> 29) & 1) + 16];
    v91 = 0;
    v90 = 0;
    v89 = 0;
    v88 = v92;
    do
    {
      if (_os_atomic_mo_has_acquire(3))
        v14 = __ldaxr(v88);
      else
        v14 = __ldxr(v88);
      v91 = v14;
      if (!WORD2(v14) || WORD2(v91) == HIWORD(v91))
      {
        __clrex();
        return 0;
      }
      LODWORD(v87) = v91 + 1;
      WORD2(v87) = WORD2(v91);
      if ((v94 & 1) != 0)
      {
        v18 = WORD2(v91);
      }
      else
      {
        if (HIWORD(v91) + 1 < WORD2(v91))
          v17 = HIWORD(v91) + 1;
        else
          v17 = WORD2(v91);
        v18 = v17;
      }
      HIWORD(v87) = v18;
      v90 = v87;
      if (_os_atomic_mo_has_release(3))
        v89 = __stlxr(v90, v88) == 0;
      else
        v89 = __stxr(v90, v88) == 0;
    }
    while (!v89);
    v86 = v89;
    if (HIWORD(v91) < (int)WORD2(v91))
    {
      v85 = 16777217;
      if ((v94 & 1) != 0)
      {
        v85 |= 0x100u;
      }
      else if (v93)
      {
        v85 |= 0x200u;
      }
      while (1)
      {
        v84 = 0;
        v84 = __ulock_wake(v85, v92, v93);
        if ((v84 & 0x80000000) == 0)
          break;
        v16 = -v84;
        if (v84 == -2)
          break;
        if (v16 != 4)
        {
          if (v16 != 37)
          {
            v83 = -v84;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v83;
            __break(1u);
            JUMPOUT(0xD1ECLL);
          }
          if (!v93)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xD188);
          }
          return pthread_cond_broadcast(v95);
        }
      }
    }
    return 0;
  }
  v76 = v25;
  v75 = v24 & 1;
  v74 = v23;
  v73 = 0;
  v72 = 0;
  v71 = 0;
  v70 = 0;
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v66 = 0;
  v65 = 0;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v82 = v25;
  v81 = (unsigned int **)&v65;
  v80 = &v64;
  v79 = &v63;
  v78 = &v62;
  if ((*(_DWORD *)&v25->__opaque[4] & 0x20000000) != 0)
  {
    *v80 = (unsigned int *)&v82->__opaque[20];
    *v78 = (unsigned int *)&v82->__opaque[24];
    *v79 = (unsigned int *)&v82->__opaque[16];
  }
  else
  {
    *v80 = (unsigned int *)&v82->__opaque[16];
    *v78 = (unsigned int *)&v82->__opaque[20];
    *v79 = (unsigned int *)&v82->__opaque[24];
  }
  *v81 = *v80;
  v58 = 0;
  do
  {
    v58 = 0;
    v68 = *v64;
    v67 = *v63;
    v66 = *v62;
    v72 = 0;
    v71 = 0;
    if ((v68 & 0xFFFFFF00) == (v66 & 0xFFFFFF00) || !v74 && (v68 & 0xFFFFFF00) == (v67 & 0xFFFFFF00))
    {
      v70 = (unint64_t)v66 << 32;
      v70 |= v68;
      v69 = v70;
      v57 = v70;
      v56 = 0;
      v2 = v65;
      v54 = v70;
      v53 = v70;
      v55 = v70;
      v3 = v70;
      v4 = v70;
      do
        v5 = __ldaxr(v2);
      while (v5 == v3 && __stlxr(v4, v2));
      if (v5 != v3)
        v57 = v5;
      v52 = v5 == v3;
      v56 = v5 == v3;
      v51 = v56;
      if (v5 == v3)
        return 0;
      v58 = 1;
    }
    else
    {
      if (v74)
        break;
      if (is_seqhigher(v66 & 0xFFFFFF00, v68 & 0xFFFFFF00))
      {
        if (++v61 > 0x2000)
          return 35;
LABEL_53:
        sched_yield();
        v58 = 1;
        goto LABEL_60;
      }
      if (is_seqhigher(v67 & 0xFFFFFF00, v68 & 0xFFFFFF00))
      {
        if (++v60 > 0x2000)
        {
          if (v59)
            return 35;
          v50 = v67;
          v49 = 0;
          v6 = v63;
          v47 = v66 & 0xFFFFFF00;
          v46 = v66 & 0xFFFFFF00;
          v48 = v66 & 0xFFFFFF00;
          v7 = v67;
          v8 = v66 & 0xFFFFFF00;
          do
            v9 = __ldaxr(v6);
          while (v9 == v7 && __stlxr(v8, v6));
          if (v9 != v7)
            v50 = v9;
          v45 = v9 == v7;
          v49 = v9 == v7;
          v44 = v49;
          if (v9 == v7)
          {
            v59 = 1;
            v60 = 0;
          }
        }
        goto LABEL_53;
      }
      if (is_seqlower(v67 & 0xFFFFFF00, v66 & 0xFFFFFF00))
        v71 = v66 & 0xFFFFFF00;
      else
        v71 = v67 & 0xFFFFFF00;
      if ((v75 & 1) != 0)
      {
        v72 = diff_genseq(v68, v71);
        v71 = v68 & 0xFFFFFF00;
      }
      else
      {
        v71 += 256;
      }
    }
LABEL_60:
    v19 = 1;
    if ((v58 & 1) == 0)
    {
      v43 = v67;
      v42 = 0;
      v10 = v63;
      v40 = v71;
      v39 = v71;
      v41 = v71;
      v11 = v67;
      v12 = v71;
      do
        v13 = __ldaxr(v10);
      while (v13 == v11 && __stlxr(v12, v10));
      if (v13 != v11)
        v43 = v13;
      v38 = v13 == v11;
      v42 = v13 == v11;
      v37 = v42;
      v19 = v13 != v11;
    }
  }
  while (v19);
  v36 = 0;
  if (*(_DWORD *)&v76->__opaque[4] >> 30 == 1)
    v36 |= 0x10u;
  v35 = v68 | ((unint64_t)v66 << 32);
  if ((v75 & 1) != 0)
  {
    v34 = v72 | ((unint64_t)v67 << 32);
    v73 = __psynch_cvbroad(v76, v35, v34, v36, 0, 0);
  }
  else
  {
    v73 = __psynch_cvsignal(v76, v35, v67, v74, 0, 0, 0, v36);
  }
  if (v73 != -1 && v73)
    _pthread_cond_updateval((uint64_t)v76, 0, 0, v73);
  return 0;
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  int v15;
  __int16 v16;
  __int16 v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  pthread_cond_t *v22;
  unsigned int v24;
  unsigned int sig;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  pthread_cond_t *v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  _BOOL4 v34;
  BOOL v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  _BOOL4 v39;
  unsigned int v40;
  _BOOL4 v41;
  BOOL v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  _BOOL4 v46;
  unsigned int v47;
  _BOOL4 v48;
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  _BOOL4 v53;
  unint64_t v54;
  char v55;
  int v56;
  int v57;
  int v58;
  unsigned int *v59;
  unsigned int *v60;
  unsigned int *v61;
  unint64_t *v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  unint64_t v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  char v72;
  pthread_cond_t *v73;
  unsigned int **v75;
  unsigned int **v76;
  unsigned int **v77;
  unsigned int **v78;
  pthread_cond_t *v79;
  uint64_t v80;
  int v81;
  unsigned int v82;
  _BOOL4 v83;
  unint64_t v84;
  unint64_t *v85;
  _BOOL4 v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t *v89;
  unsigned int v90;
  char v91;
  pthread_cond_t *v92;
  pthread_cond_t *v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int *v99;
  unsigned int v100;
  pthread_cond_t *v101;

  v22 = a1;
  v21 = 0;
  v20 = 0;
  v19 = 1129270852;
  v29 = a1;
  v28 = &v19;
  v27 = 0;
  v26 = 0;
  sig = a1->__sig;
  v26 = sig;
  v24 = sig;
  v27 = sig;
  if (sig == 1018212795)
  {
    v30 = _pthread_cond_check_init_slow((uint64_t)v29, v28);
  }
  else
  {
    v101 = v29;
    v100 = v27;
    v99 = v28;
    v98 = 0;
    if (v27 == 1129270852)
    {
      if (*v99 != 1129270852)
      {
        v97 = 0;
        v97 = *v99;
        v96 = v97;
        LODWORD(v101->__sig) = v97;
        v95 = v97;
      }
    }
    else if (v27 - 1129270853 < 2)
    {
      if (*v99 == 1129270852)
      {
        *v99 = v100;
      }
      else if (*v99 != v100)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xD438);
      }
    }
    else
    {
      v98 = 22;
    }
    v30 = v98;
  }
  if (v30 || v19 == 1129270852)
    return v30;
  if (v19 != 1129270853)
  {
    if (v19 != 1129270854)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: impossible cond signature";
      qword_24058 = v19;
      __break(1u);
      JUMPOUT(0xDEA4);
    }
    v92 = v22;
    v91 = v21 & 1;
    v90 = v20;
    v89 = 0;
    v94 = v22;
    v89 = (unint64_t *)&v94->__opaque[4 * ((*(_DWORD *)&v94->__opaque[4] >> 29) & 1) + 16];
    v88 = 0;
    v87 = 0;
    v86 = 0;
    v85 = v89;
    do
    {
      if (_os_atomic_mo_has_acquire(3))
        v13 = __ldaxr(v85);
      else
        v13 = __ldxr(v85);
      v88 = v13;
      if (!WORD2(v13) || WORD2(v88) == HIWORD(v88))
      {
        __clrex();
        return 0;
      }
      LODWORD(v84) = v88 + 1;
      WORD2(v84) = WORD2(v88);
      if ((v91 & 1) != 0)
      {
        v17 = WORD2(v88);
      }
      else
      {
        if (HIWORD(v88) + 1 < WORD2(v88))
          v16 = HIWORD(v88) + 1;
        else
          v16 = WORD2(v88);
        v17 = v16;
      }
      HIWORD(v84) = v17;
      v87 = v84;
      if (_os_atomic_mo_has_release(3))
        v86 = __stlxr(v87, v85) == 0;
      else
        v86 = __stxr(v87, v85) == 0;
    }
    while (!v86);
    v83 = v86;
    if (HIWORD(v88) < (int)WORD2(v88))
    {
      v82 = 16777217;
      if ((v91 & 1) != 0)
      {
        v82 |= 0x100u;
      }
      else if (v90)
      {
        v82 |= 0x200u;
      }
      while (1)
      {
        v81 = 0;
        v81 = __ulock_wake(v82, v89, v90);
        if ((v81 & 0x80000000) == 0)
          break;
        v15 = -v81;
        if (v81 == -2)
          break;
        if (v15 != 4)
        {
          if (v15 != 37)
          {
            v80 = -v81;
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
            qword_24058 = v80;
            __break(1u);
            JUMPOUT(0xDE48);
          }
          if (!v90)
          {
            qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: EALREADY from ulock_wake";
            __break(1u);
            JUMPOUT(0xDDECLL);
          }
          return pthread_cond_broadcast(v92);
        }
      }
    }
    return 0;
  }
  v73 = v22;
  v72 = v21 & 1;
  v71 = v20;
  v70 = 0;
  v69 = 0;
  v68 = 0;
  v67 = 0;
  v66 = 0;
  v65 = 0;
  v64 = 0;
  v63 = 0;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v79 = v22;
  v78 = (unsigned int **)&v62;
  v77 = &v61;
  v76 = &v60;
  v75 = &v59;
  if ((*(_DWORD *)&v22->__opaque[4] & 0x20000000) != 0)
  {
    *v77 = (unsigned int *)&v79->__opaque[20];
    *v75 = (unsigned int *)&v79->__opaque[24];
    *v76 = (unsigned int *)&v79->__opaque[16];
  }
  else
  {
    *v77 = (unsigned int *)&v79->__opaque[16];
    *v75 = (unsigned int *)&v79->__opaque[20];
    *v76 = (unsigned int *)&v79->__opaque[24];
  }
  *v78 = *v77;
  v55 = 0;
  do
  {
    v55 = 0;
    v65 = *v61;
    v64 = *v60;
    v63 = *v59;
    v69 = 0;
    v68 = 0;
    if ((v65 & 0xFFFFFF00) == (v63 & 0xFFFFFF00) || !v71 && (v65 & 0xFFFFFF00) == (v64 & 0xFFFFFF00))
    {
      v67 = (unint64_t)v63 << 32;
      v67 |= v65;
      v66 = v67;
      v54 = v67;
      v53 = 0;
      v1 = v62;
      v51 = v67;
      v50 = v67;
      v52 = v67;
      v2 = v67;
      v3 = v67;
      do
        v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2)
        v54 = v4;
      v49 = v4 == v2;
      v53 = v4 == v2;
      v48 = v53;
      if (v4 == v2)
        return 0;
      v55 = 1;
    }
    else
    {
      if (v71)
        break;
      if (is_seqhigher(v63 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v58 > 0x2000)
          return 35;
LABEL_51:
        sched_yield();
        v55 = 1;
        goto LABEL_58;
      }
      if (is_seqhigher(v64 & 0xFFFFFF00, v65 & 0xFFFFFF00))
      {
        if (++v57 > 0x2000)
        {
          if (v56)
            return 35;
          v47 = v64;
          v46 = 0;
          v5 = v60;
          v44 = v63 & 0xFFFFFF00;
          v43 = v63 & 0xFFFFFF00;
          v45 = v63 & 0xFFFFFF00;
          v6 = v64;
          v7 = v63 & 0xFFFFFF00;
          do
            v8 = __ldaxr(v5);
          while (v8 == v6 && __stlxr(v7, v5));
          if (v8 != v6)
            v47 = v8;
          v42 = v8 == v6;
          v46 = v8 == v6;
          v41 = v46;
          if (v8 == v6)
          {
            v56 = 1;
            v57 = 0;
          }
        }
        goto LABEL_51;
      }
      if (is_seqlower(v64 & 0xFFFFFF00, v63 & 0xFFFFFF00))
        v68 = v63 & 0xFFFFFF00;
      else
        v68 = v64 & 0xFFFFFF00;
      if ((v72 & 1) != 0)
      {
        v69 = diff_genseq(v65, v68);
        v68 = v65 & 0xFFFFFF00;
      }
      else
      {
        v68 += 256;
      }
    }
LABEL_58:
    v18 = 1;
    if ((v55 & 1) == 0)
    {
      v40 = v64;
      v39 = 0;
      v9 = v60;
      v37 = v68;
      v36 = v68;
      v38 = v68;
      v10 = v64;
      v11 = v68;
      do
        v12 = __ldaxr(v9);
      while (v12 == v10 && __stlxr(v11, v9));
      if (v12 != v10)
        v40 = v12;
      v35 = v12 == v10;
      v39 = v12 == v10;
      v34 = v39;
      v18 = v12 != v10;
    }
  }
  while (v18);
  v33 = 0;
  if (*(_DWORD *)&v73->__opaque[4] >> 30 == 1)
    v33 |= 0x10u;
  v32 = v65 | ((unint64_t)v63 << 32);
  if ((v72 & 1) != 0)
  {
    v31 = v69 | ((unint64_t)v64 << 32);
    v70 = __psynch_cvbroad(v73, v32, v31, v33, 0, 0);
  }
  else
  {
    v70 = __psynch_cvsignal(v73, v32, v64, v71, 0, 0, 0, v33);
  }
  if (v70 != -1 && v70)
    _pthread_cond_updateval((uint64_t)v73, 0, 0, v70);
  return 0;
}

uint64_t _pthread_ulock_cond_wait(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];
  int v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t *v34;
  int v35;
  char v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  int v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  BOOL v48;
  char v49;
  BOOL v50;
  unint64_t v51;
  unint64_t StatusReg;

  v45 = a1;
  v44 = a2;
  v43 = a3;
  v42 = a4;
  v41 = a4 == 2;
  v40 = 0;
  if (*a3 || v43[1])
  {
    v39 = 0;
    v39 = v43[1] & 0x3FFFFFFF;
    v38 = 0;
    v37 = 0;
    v36 = 0;
    v4 = *v43;
    v5 = *v43 < 0;
    if (*v43 < 0)
      v4 = -v4;
    v6 = ((unint64_t)v4 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
    v7 = 1000000000 * v4;
    if (*v43 >= 0)
      v8 = 1000000000 * v4;
    else
      v8 = -1000000000 * v4;
    if (!v7)
      v5 = 0;
    if (v6)
      v5 = 1;
    v38 = v8;
    v50 = v5;
    v37 = v5;
    v9 = __CFADD__(v39, v8);
    v10 = v39 + v8;
    v11 = v9;
    v40 = v10;
    v49 = v11;
    v36 = v11 & 1;
    v35 = v37 | v11 & 1;
    v48 = v35 != 0;
    if (v37 | v11 & 1)
      v40 = -1;
  }
  v34 = 0;
  v47 = v45;
  v34 = (unint64_t *)(v47 + 4 * ((*(_DWORD *)(v47 + 12) >> 29) & 1) + 24);
  v33 = 0;
  v31 = 0x100000000;
  v30 = 0x100000000;
  v32 = 0x100000000;
  v28 = 0;
  v26 = 0x100000000;
  v25 = 0x100000000;
  v27 = 0x100000000;
  v16 = *v34;
  do
  {
    v12 = v16;
    do
      v13 = __ldaxr(v34);
    while (v13 == v16 && __stlxr(v16 + v26, v34));
    v16 = v13;
  }
  while (v13 != v12);
  v24 = v13;
  v28 = v13;
  v23 = v13;
  v29 = v13 + v32;
  v33 = v13 + v32;
  v22 = _pthread_mutex_ulock_unlock(v44);
  if (v22)
    return _pthread_ulock_cond_wait_complete(v34, 0, v22);
  while (1)
  {
    v21 = 16777217;
    if (v41)
    {
      v20[0] = v45;
      v20[1] = v44;
      v19 = 0;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v51 = StatusReg;
      v17 = StatusReg - 224;
      v18[0] = _pthread_ulock_cond_cleanup;
      v18[1] = v20;
      v19 = *(_QWORD *)(StatusReg - 216);
      *(_QWORD *)(v17 + 8) = v18;
      v22 = __ulock_wait2(16908289, v34, v33, v40, 0);
      pthread_testcancel();
      *(_QWORD *)(v17 + 8) = v19;
    }
    else
    {
      v22 = __ulock_wait2(16777217, v34, v33, v40, 0);
    }
    if ((v22 & 0x80000000) == 0)
    {
      v22 = 0;
      goto LABEL_36;
    }
    v15 = -v22;
    if (v22 == -4)
    {
      v22 = 0;
      return _pthread_ulock_cond_wait_complete(v34, v44, v22);
    }
    if (v15 != 14)
      break;
LABEL_36:
    if (*(_DWORD *)v34 != (_DWORD)v33)
      return _pthread_ulock_cond_wait_complete(v34, v44, v22);
  }
  if (v15 != 60)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
    qword_24058 = -v22;
    __break(1u);
    JUMPOUT(0xE30CLL);
  }
  v22 = 60;
  return _pthread_ulock_cond_wait_complete(v34, v44, v22);
}

uint64_t _pthread_psynch_cond_wait(uint64_t a1, pthread_mutex_t *a2, _QWORD *a3, int a4)
{
  unint64_t *v4;
  unint64_t v5;
  int v7;
  unint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  unsigned int v11;
  _BOOL4 v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int *v24;
  unsigned int *v25;
  unsigned int *v26;
  unint64_t *v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  _QWORD *v39;
  pthread_mutex_t *v40;
  uint64_t v41;
  unsigned int **v43;
  unsigned int **v44;
  unint64_t **v45;
  unint64_t **v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t StatusReg;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v41 = a1;
  v40 = a2;
  v39 = a3;
  v38 = a4;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v30 = 0;
  v29 = 0;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v23 = 0;
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v47 = a1;
  v46 = &v27;
  v45 = (unint64_t **)&v26;
  v44 = &v25;
  v43 = &v24;
  if (((*(_DWORD *)(a1 + 12) >> 29) & 1) != 0)
  {
    *v45 = (unint64_t *)(v47 + 28);
    *v43 = (unsigned int *)(v47 + 32);
    *v44 = (unsigned int *)(v47 + 24);
  }
  else
  {
    *v45 = (unint64_t *)(v47 + 24);
    *v43 = (unsigned int *)(v47 + 28);
    *v44 = (unsigned int *)(v47 + 32);
  }
  *v46 = *v45;
  do
  {
    v33 = *v26;
    v32 = *v25;
    v31 = *v24;
    v23 = ((unint64_t)v31 << 32) | v33;
    v28 = v31 & 3;
    v29 = v31 & 0xFFFFFF00;
    v30 = v33 + 256;
    v22 = ((unint64_t)(v31 & 0xFFFFFF00) << 32) | (v33 + 256);
    v18 = v23;
    v17 = 0;
    v4 = v27;
    v15 = v22;
    v14 = v22;
    v16 = v22;
    do
      v5 = __ldaxr(v4);
    while (v5 == v23 && __stlxr(v22, v4));
    if (v5 != v23)
      v18 = v5;
    v13 = v5 == v23;
    v17 = v5 == v23;
    v12 = v17;
  }
  while (v5 != v23);
  *(_QWORD *)(v41 + 16) = v40;
  v11 = _pthread_mutex_droplock((uint64_t)v40, &v35, &v19, &v37, &v36);
  if (v11)
  {
    return 22;
  }
  else
  {
    if ((v35 & 0x1000) != 0)
    {
      v21 = v37 | ((unint64_t)v36 << 32);
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v35 &= ~0x2000u;
    v20 = v30 | ((unint64_t)(v29 | v28) << 32);
    if (v38 == 2)
    {
      v10 = 0;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v48 = StatusReg;
      v8 = StatusReg - 224;
      v9[0] = _pthread_psynch_cond_cleanup;
      v9[1] = v41;
      v10 = *(_QWORD *)(StatusReg - 216);
      *(_QWORD *)(v8 + 8) = v9;
      v34 = __psynch_cvwait(v41, v20, v32, v19, v21, v35, *v39, v39[1]);
      pthread_testcancel();
      *(_QWORD *)(v8 + 8) = v10;
    }
    else
    {
      v34 = __psynch_cvwait(v41, v20, v32, v19, v21, v35, *v39, v39[1]);
    }
    if (v34 == -1)
    {
      v50 = 1;
      v51 = 1;
      v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = **(_DWORD **)(v52 + 8);
      if (v7 == 4)
      {
        v11 = 0;
      }
      else if (v7 == 60)
      {
        v11 = 60;
      }
      else
      {
        v11 = 22;
      }
      _pthread_cond_updateval(v41, (uint64_t)v40, v7, 0);
    }
    else if (v34)
    {
      _pthread_cond_updateval(v41, (uint64_t)v40, 0, v34);
    }
    pthread_mutex_lock(v40);
    return v11;
  }
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  int result;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  const pthread_condattr_t *v8;
  unsigned int *v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  unsigned int *v14;

  *(_DWORD *)a1->__opaque = 0;
  v9 = (unsigned int *)a1;
  v8 = a2;
  v7 = 1129270852;
  v6 = 0;
  v5 = 0;
  v4 = 0;
  v3 = 0;
  *(_QWORD *)&a1->__opaque[8] = 0;
  v9[6] = 0;
  v9[7] = 0;
  v9[8] = 0;
  v9[3] &= 0xE0000000;
  v9[3] = v9[3] & 0xDFFFFFFF | (((((_BYTE)v9 + 24) & 7) != 0) << 29);
  v14 = v9;
  v13 = &v6;
  v12 = &v5;
  v11 = &v4;
  v10 = &v3;
  if (((v9[3] >> 29) & 1) != 0)
  {
    *v12 = (uint64_t)(v14 + 7);
    *v10 = v14 + 8;
    *v11 = (uint64_t)(v14 + 6);
  }
  else
  {
    *v12 = (uint64_t)(v14 + 6);
    *v10 = v14 + 7;
    *v11 = (uint64_t)(v14 + 8);
  }
  *v13 = *v12;
  *v3 = 1;
  if (v8)
    v9[3] = v9[3] & 0x3FFFFFFF | (*(_DWORD *)v8->__opaque << 30);
  else
    v9[3] = v9[3] & 0x3FFFFFFF | 0x80000000;
  result = 0;
  v9[1] = 0;
  atomic_store(v7, v9);
  return result;
}

BOOL is_seqhigher(int a1, int a2)
{
  unsigned int v3;
  unsigned int v4;

  v4 = a1 & 0xFFFFFF00;
  v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) <= (a2 & 0xFFFFFF00))
    return v3 - v4 > 0x7FFFFF80;
  else
    return v4 - v3 < 0x7FFFFF80;
}

BOOL is_seqlower(int a1, int a2)
{
  unsigned int v3;
  unsigned int v4;

  v4 = a1 & 0xFFFFFF00;
  v3 = a2 & 0xFFFFFF00;
  if ((a1 & 0xFFFFFF00) >= (a2 & 0xFFFFFF00))
    return v4 - v3 > 0x7FFFFF80;
  else
    return v3 - v4 < 0x7FFFFF80;
}

uint64_t diff_genseq(int a1, int a2)
{
  if ((a1 & 0xFFFFFF00) == (a2 & 0xFFFFFF00))
    return 0;
  else
    return (a1 & 0xFFFFFF00) - (a2 & 0xFFFFFF00);
}

uint64_t _pthread_cond_updateval(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int *v12;
  unint64_t *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int **v26;
  unsigned int **v27;
  unsigned int **v28;
  unsigned int **v29;
  unsigned int *v30;

  v25 = a1;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  if (a3)
  {
    v22 = 256;
    if ((v23 & 0x100) != 0)
      v22 |= 1u;
    if ((v23 & 0x200) != 0)
      v22 |= 2u;
  }
  v30 = (unsigned int *)v25;
  v29 = (unsigned int **)&v13;
  v28 = &v12;
  v27 = &v11;
  v26 = &v10;
  if (((*(_DWORD *)(v25 + 12) >> 29) & 1) != 0)
  {
    *v28 = v30 + 7;
    *v26 = v30 + 8;
    *v27 = v30 + 6;
  }
  else
  {
    *v28 = v30 + 6;
    *v26 = v30 + 7;
    *v27 = v30 + 8;
  }
  *v29 = *v28;
  do
  {
    v16 = *v12;
    v15 = *v11;
    v14 = *v10;
    v19 = 0;
    v21 = 0;
    result = diff_genseq(v16, v14);
    v20 = result;
    v18 = (unint64_t)v14 << 32;
    v18 |= v16;
    if ((_DWORD)result || (v22 & 2) != 0)
    {
      v19 = (v14 & 0xFFFFFF00) + (v22 & 0xFFFFFF00);
      v19 |= v14 & 3 | v22 & 3;
      if ((v19 & 0xFFFFFF00) == (v16 & 0xFFFFFF00) && (v19 & 3) == 3)
      {
        v19 &= ~2u;
        v21 = 1;
      }
      v17 = (unint64_t)v19 << 32;
      v17 |= v16;
    }
    else
    {
      v17 = v18;
    }
    v5 = v13;
    v6 = v18;
    v7 = v17;
    do
      v8 = __ldaxr(v5);
    while (v8 == v6 && __stlxr(v7, v5));
  }
  while (v8 != v6);
  if (v20 && (v19 & 0xFFFFFF00) == (v16 & 0xFFFFFF00))
    *(_QWORD *)(v25 + 16) = 0;
  if (v21)
  {
    v9 = 0;
    if (*(_DWORD *)(v25 + 12) >> 30 == 1)
      v9 = 16;
    return __psynch_cvclrprepost(v25, v16, v15, v19, 0, v16, v9);
  }
  return result;
}

uint64_t _pthread_cond_check_init_slow(uint64_t a1, unsigned int *a2)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  unsigned int *v24;
  BOOL v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t StatusReg;
  BOOL v35;
  int v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  os_unfair_lock_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int *v50;

  v31 = a1 + 8;
  v30 = 327680;
  v29 = 0;
  v32 = 3;
  v33 = 3;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v29 = *(_QWORD *)(StatusReg + 24);
  v28 = 0;
  v27 = v29;
  v2 = (unsigned int *)(a1 + 8);
  v26 = v29;
  do
    v3 = __ldaxr(v2);
  while (!v3 && __stlxr(v29, v2));
  if (v3)
    v28 = v3;
  v25 = v3 == 0;
  if (v3)
    os_unfair_lock_lock_with_options(v31, v30);
  v9 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 1018212795)
  {
    v4 = *a2;
    v19 = (unsigned int *)a1;
    v18 = 0;
    v17 = v4;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    *(_QWORD *)(a1 + 16) = 0;
    v19[6] = 0;
    v19[7] = 0;
    v19[8] = 0;
    v19[3] &= 0xE0000000;
    v19[3] = v19[3] & 0xDFFFFFFF | (((((_BYTE)v19 + 24) & 7) != 0) << 29);
    v24 = v19;
    v23 = &v16;
    v22 = &v15;
    v21 = &v14;
    v20 = &v13;
    if ((v19[3] & 0x20000000) != 0)
    {
      *v22 = (uint64_t)(v24 + 7);
      *v20 = v24 + 8;
      *v21 = (uint64_t)(v24 + 6);
    }
    else
    {
      *v22 = (uint64_t)(v24 + 6);
      *v20 = v24 + 7;
      *v21 = (uint64_t)(v24 + 8);
    }
    *v23 = *v22;
    *v13 = 1;
    if (v18)
      v19[3] = v19[3] & 0x3FFFFFFF | (*(_DWORD *)(v18 + 8) << 30);
    else
      v19[3] = v19[3] & 0x3FFFFFFF | 0x80000000;
    v19[1] = 0;
    atomic_store(v17, v19);
    v10 = 0;
  }
  else
  {
    v50 = (unsigned int *)a1;
    v49 = v9;
    v48 = a2;
    v47 = 0;
    if (v9 == 1129270852)
    {
      if (*v48 != 1129270852)
      {
        v46 = 0;
        v46 = *v48;
        v45 = v46;
        *v50 = v46;
        v44 = v46;
      }
    }
    else if (v49 - 1129270853 < 2)
    {
      if (*v48 == 1129270852)
      {
        *v48 = v49;
      }
      else if (*v48 != v49)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: Mixed ulock and psych condvar use";
        __break(1u);
        JUMPOUT(0xF570);
      }
    }
    else
    {
      v47 = 22;
    }
    v10 = v47;
  }
  v40 = (os_unfair_lock_t)(a1 + 8);
  v39 = 0;
  v41 = 3;
  v42 = 3;
  v43 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v39 = *(_QWORD *)(v43 + 24);
  v38 = 0;
  v37 = v39;
  v5 = (unsigned int *)(a1 + 8);
  v36 = 0;
  v6 = v39;
  do
    v7 = __ldaxr(v5);
  while (v7 == v6 && __stlxr(0, v5));
  if (v7 != v6)
    v37 = v7;
  v35 = v7 == v6;
  if (v7 != v6)
    os_unfair_lock_unlock(v40);
  return v10;
}

uint64_t _pthread_ulock_cond_wait_complete(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  __int16 v5;
  unint64_t v6;
  _BOOL4 v7;

  if (a2)
    _pthread_mutex_ulock_lock(a2, 0);
  do
  {
    if (_os_atomic_mo_has_acquire(2))
      v3 = __ldaxr(a1);
    else
      v3 = __ldxr(a1);
    LODWORD(v6) = v3;
    WORD2(v6) = WORD2(v3) - 1;
    if (HIWORD(v3))
      v5 = HIWORD(v3) - 1;
    else
      v5 = 0;
    HIWORD(v6) = v5;
    if (_os_atomic_mo_has_release(2))
      v7 = __stlxr(v6, a1) == 0;
    else
      v7 = __stxr(v6, a1) == 0;
  }
  while (!v7);
  return a3;
}

uint64_t _pthread_ulock_cond_cleanup(uint64_t *a1)
{
  _pthread_ulock_cond_wait_complete((unint64_t *)(*a1 + 24 + 4 * ((*(_DWORD *)(*a1 + 12) >> 29) & 1)), a1[1], 0);
  return pthread_cond_signal((pthread_cond_t *)*a1);
}

uint64_t _pthread_psynch_cond_cleanup(uint64_t result)
{
  pthread_mutex_t *v1;
  unint64_t StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (*(_BYTE *)(StatusReg - 59))
  {
    v1 = *(pthread_mutex_t **)(result + 16);
    result = _pthread_cond_updateval(result, (uint64_t)v1, *(_DWORD *)(StatusReg - 56), 0);
    if (v1)
      return pthread_mutex_lock(v1);
  }
  return result;
}

_BYTE *_pthread_mutex_global_init(uint64_t a1, uint64_t a2)
{
  _BYTE *result;
  BOOL v3;
  BOOL v4;
  int v5;
  char *v6;
  _BYTE *v7;
  int v8;
  int v9;

  v9 = 2;
  if (*(_DWORD *)(a2 + 44))
  {
    v8 = *(unsigned __int8 *)(a2 + 44);
    if (_pthread_mutex_policy_validate(v8))
      v9 = _pthread_mutex_policy_to_opt(v8);
  }
  v6 = (char *)_simple_getenv(a1, "PTHREAD_MUTEX_DEFAULT_POLICY");
  if (v6)
  {
    v5 = *v6 - 48;
    if (_pthread_mutex_policy_validate(v5))
      v9 = _pthread_mutex_policy_to_opt(v5);
  }
  if (v9 != __pthread_mutex_default_opt_policy)
    __pthread_mutex_default_opt_policy = v9;
  v4 = 0;
  v7 = (_BYTE *)_simple_getenv(a1, "PTHREAD_MUTEX_USE_ULOCK");
  if (v7)
  {
    v4 = *v7 == 49;
  }
  else if (*(_DWORD *)(a2 + 44))
  {
    v4 = (*(_DWORD *)(a2 + 44) & 0x100) != 0;
  }
  if (v4 != (__pthread_mutex_use_ulock & 1))
    __pthread_mutex_use_ulock = v4;
  v3 = 0;
  result = (_BYTE *)_simple_getenv(a1, "PTHREAD_MUTEX_ADAPTIVE_SPIN");
  if (result)
  {
    v3 = *result == 49;
  }
  else if (*(_DWORD *)(a2 + 44))
  {
    v3 = (*(_DWORD *)(a2 + 44) & 0x200) != 0;
  }
  if (v3 != (__pthread_mutex_ulock_adaptive_spin & 1))
    __pthread_mutex_ulock_adaptive_spin = v3;
  return result;
}

BOOL _pthread_mutex_policy_validate(int a1)
{
  BOOL v2;

  v2 = 0;
  if (a1 >= 0)
    return a1 < 4;
  return v2;
}

uint64_t _pthread_mutex_policy_to_opt(int a1)
{
  if (a1 == 1)
    return 1;
  else
    return 2;
}

BOOL mutex_seq_atomic_cmpxchgv_relaxed(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;

  v7 = *a2;
  v3 = *a2;
  v4 = *a3;
  do
    v5 = __ldaxr(a1);
  while (v5 == v3 && __stlxr(v4, a1));
  if (v5 != v3)
    v7 = v5;
  *a2 = v7;
  return v5 == v3;
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  pthread_mutex_t *v2;
  unint64_t v4;
  unsigned int *v5;
  int v6;
  char *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  int v11;
  const pthread_mutexattr_t *v12;
  pthread_mutex_t *v13;
  _QWORD **v15;
  pthread_mutex_t *v16;
  char **v17;
  pthread_mutex_t *v18;
  pthread_mutex_t *v19;
  pthread_mutex_t *v20;

  *(_DWORD *)a1->__opaque = 0;
  v13 = a1;
  v12 = a2;
  v11 = 7;
  *(_DWORD *)&a1->__opaque[4] = 0;
  *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFDFFF | 0x2000;
  if (v12)
  {
    if (v12->__sig == 1297373249)
    {
      *(_WORD *)&v13->__opaque[8] = *(_DWORD *)v12->__opaque;
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFFC | *(_DWORD *)&v12->__opaque[4] & 3;
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFE3F | (((*(_DWORD *)&v12->__opaque[4] >> 6) & 7) << 6);
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFF3 | (4
                                                                                * ((*(_DWORD *)&v12->__opaque[4] >> 2) & 3));
      *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFFFCF | (16
                                                                                * ((*(_DWORD *)&v12->__opaque[4] >> 4) & 3));
      *(_WORD *)&v13->__opaque[10] = 0;
      v10 = 1297437784;
      if (((*(_DWORD *)&v13->__opaque[4] >> 2) & 3) == 0)
      {
        v19 = v13;
        if (((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 1
          || (v20 = v13, ((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 2))
        {
          v10 = _pthread_mutex_sig_fast;
        }
      }
      if (((*(_DWORD *)&v13->__opaque[4] >> 2) & 3) == 0
        && ((*(_DWORD *)&v13->__opaque[4] >> 6) & 7) == 2
        && ((*(_DWORD *)&v13->__opaque[4] >> 4) & 3) == 2
        && v10 == _pthread_mutex_sig_fast)
      {
        *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
      }
      else
      {
        *(_DWORD *)&v13->__opaque[4] &= ~0x4000u;
      }
      if (((*(_DWORD *)&v13->__opaque[4] >> 14) & 1) != 0)
      {
        v2 = v13;
        *(_QWORD *)&v13->__opaque[16] = -1;
        *(_QWORD *)&v2->__opaque[24] = -1;
        *(_QWORD *)&v2->__opaque[32] = -1;
        v9 = 0;
        *(_DWORD *)&v13->__opaque[16] = 0;
      }
      else
      {
        v16 = v13;
        v15 = &v8;
        v8 = (_QWORD *)((unint64_t)&v13->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
        v18 = v13;
        v17 = &v7;
        v7 = (char *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
        if (v7 != &v13->__opaque[16])
        {
          *(_DWORD *)&v13->__opaque[4] = *(_DWORD *)&v13->__opaque[4] & 0xFFFFF7FF | 0x800;
          *(_QWORD *)&v13->__opaque[16] = -1;
        }
        *(_QWORD *)&v13->__opaque[32] = -1;
        *(_QWORD *)v7 = 0;
        *v8 = 0;
      }
      v6 = v10;
      *(_QWORD *)&v13->__opaque[40] = ~(unint64_t)v13;
      *(_DWORD *)&v13->__opaque[48] = v6;
      *(_DWORD *)&v13->__opaque[52] = v6;
      *(_DWORD *)&v13->__opaque[12] = v6;
      v5 = (unsigned int *)v13;
      HIDWORD(v13->__sig) = HIDWORD(v10);
      atomic_store(v10, v5);
      return 0;
    }
    else
    {
      return 22;
    }
  }
  else
  {
    v4 = (v11 - 1);
    if (v4 <= 6)
      __asm { BR              X8 }
    return 22;
  }
}

int pthread_mutex_getprioceiling(const pthread_mutex_t *a1, int *a2)
{
  unsigned int *opaque;
  int v3;
  unsigned int v4;
  int v7;

  v7 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options(a1->__opaque, 327680);
    *a2 = *(__int16 *)&a1->__opaque[8];
    v7 = 0;
    opaque = (unsigned int *)a1->__opaque;
    v3 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    do
      v4 = __ldaxr(opaque);
    while (v4 == v3 && __stlxr(0, opaque));
    if (v4 != v3)
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
  }
  return v7;
}

int pthread_mutex_setprioceiling(pthread_mutex_t *a1, int a2, int *a3)
{
  unsigned int *opaque;
  int v4;
  unsigned int v5;
  int v7;

  v7 = 22;
  if ((a1->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    os_unfair_lock_lock_with_options(a1->__opaque, 327680);
    if (a2 >= -999 && a2 <= 999)
    {
      *a3 = *(__int16 *)&a1->__opaque[8];
      *(_WORD *)&a1->__opaque[8] = a2;
      v7 = 0;
    }
    opaque = (unsigned int *)a1->__opaque;
    v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    do
      v5 = __ldaxr(opaque);
    while (v5 == v4 && __stlxr(0, opaque));
    if (v5 != v4)
      os_unfair_lock_unlock((os_unfair_lock_t)a1->__opaque);
  }
  return v7;
}

int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getprotocol(const pthread_mutexattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = *(_DWORD *)&a1->__opaque[4] & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getpolicy_np(const pthread_mutexattr_t *a1, int *a2)
{
  int v3;
  int v4;

  v4 = 22;
  if (a1->__sig == 1297373249)
  {
    v3 = (*(_DWORD *)&a1->__opaque[4] >> 6) & 7;
    if (v3 == 1)
    {
      *a2 = 1;
      return 0;
    }
    else if (v3 == 2)
    {
      *a2 = 3;
      return 0;
    }
  }
  return v4;
}

int pthread_mutexattr_gettype(const pthread_mutexattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 2) & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_getpshared(const pthread_mutexattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249)
  {
    *a2 = (*(_DWORD *)&a1->__opaque[4] >> 4) & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  int result;

  result = 0;
  *(_DWORD *)a1->__opaque = 0;
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFFC;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | ((__pthread_mutex_default_opt_policy & 7) << 6);
  *(_DWORD *)&a1->__opaque[4] &= 0xFFFFFFF3;
  a1->__sig = 1297373249;
  *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | 0x20;
  return result;
}

int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249 && a2 >= -999 && a2 <= 999)
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setprotocol(pthread_mutexattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFFC | a2 & 3;
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249)
  {
    if (a2 == 1)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x40;
      return 0;
    }
    else if (a2 == 3)
    {
      *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFE3F | 0x80;
      return 0;
    }
  }
  return v3;
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249 && a2 <= 2)
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFF3 | (4 * (a2 & 3));
    return 0;
  }
  return v3;
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1297373249 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)&a1->__opaque[4] = *(_DWORD *)&a1->__opaque[4] & 0xFFFFFFCF | (16 * (a2 & 3));
    return 0;
  }
  return v3;
}

uint64_t _pthread_mutex_fairshare_lock_slow(uint64_t a1, char a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t **v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t StatusReg;

  v17 = a1;
  v16 = a2 & 1;
  v15 = 0;
  v14 = 0;
  v29 = a1;
  v28 = &v13;
  v13 = (uint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = 0;
  v11 = 0;
  v31 = v13;
  v30 = &v12;
  v12 = *v13;
  v33 = a1;
  v32 = &v10;
  v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg - 8);
  v40 = a1;
  v39 = a2 & 1;
  v38 = v10;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    v37 = 0;
    v44 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = *(_QWORD *)(v44 - 8);
    v36 = 0;
    v35 = *v38;
    v36 = v35;
    v34 = v35;
    if (v35 == v37)
    {
      v42 = v40;
      if (((*(_DWORD *)(v40 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v40 + 12)) == 0xFFFF)
        {
          v41 = -35;
        }
        else
        {
          *(_DWORD *)(v40 + 12) = *(unsigned __int16 *)(v40 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v40 + 12)) + 1) << 16);
          v41 = HIWORD(*(_DWORD *)(v40 + 12));
        }
      }
      else if ((v39 & 1) != 0)
      {
        v41 = -16;
      }
      else
      {
        v41 = -11;
      }
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  v15 = v41;
  if (v41 <= 0)
  {
    if (v15 >= 0)
    {
      do
      {
        v11 = v12;
        v9 = *v10;
        v7 = (v12 & 2) == 0;
        if ((v16 & 1) == 0 || (v12 & 2) == 0)
        {
          LODWORD(v11) = v11 + 256;
          LODWORD(v11) = v11 | 3;
        }
        v27 = v13;
        v26 = &v12;
        v25 = &v11;
        v24 = v12;
        v23 = 0;
        v2 = (unint64_t *)v13;
        v21 = v11;
        v20 = v11;
        v22 = v11;
        v3 = v12;
        v4 = v11;
        do
          v5 = __ldaxr(v2);
        while (v5 == v3 && __stlxr(v4, v2));
        if (v5 != v3)
          v24 = v5;
        v19 = v5 == v3;
        v23 = v5 == v3;
        *v26 = v24;
        v18 = v23;
      }
      while (!v23);
      if (v7)
      {
        *v10 = v8;
        v15 = 0;
      }
      else if ((v16 & 1) != 0)
      {
        v15 = 16;
      }
      else
      {
        v15 = _pthread_mutex_fairshare_lock_wait(v17, v11, v9);
      }
      if (!v15)
      {
        v43 = v17;
        if (((*(_DWORD *)(v17 + 12) >> 2) & 3) == 2)
          *(_DWORD *)(v17 + 12) = *(unsigned __int16 *)(v17 + 12) | 0x10000;
      }
    }
    else
    {
      return -v15;
    }
  }
  else
  {
    v14 = 1;
    return 0;
  }
  return v15;
}

uint64_t _pthread_mutex_fairshare_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t **v14;
  uint64_t v15;
  unint64_t StatusReg;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  BOOL v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t *v36;
  unint64_t *v37;
  unint64_t **v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t *v41;
  _QWORD **v42;
  uint64_t v43;
  uint64_t v44;

  v13 = a2;
  v12 = a1;
  v11 = a3;
  v15 = a1;
  v14 = &v10;
  v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v9 = *(_QWORD *)(StatusReg - 8);
  do
  {
    do
    {
      v8 = __psynch_mutexwait(v12, v13, HIDWORD(v13), v11, *(unsigned int *)(v12 + 12));
      v11 = *v10;
    }
    while (v8 == -1);
    v27 = v12;
    v26 = v9;
    v25 = 0;
    v44 = v12;
    v25 = ((*(_DWORD *)(v12 + 12) >> 6) & 7) == 2;
    v24 = 1;
    v39 = v12;
    v38 = &v23;
    v23 = (unint64_t *)((v12 + 39) & 0xFFFFFFFFFFFFFFF8);
    v22 = 0;
    v21 = 0;
    v41 = v23;
    v40 = &v22;
    v22 = *v23;
    v43 = v12;
    v42 = &v20;
    v20 = (_QWORD *)((v12 + 31) & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v21 = v22;
      if (v25)
      {
        v24 = (v22 & 2) == 0;
      }
      else if ((v22 & 3) == 3)
      {
        break;
      }
      LODWORD(v21) = v21 | 3;
      v37 = v23;
      v36 = &v22;
      v35 = &v21;
      v34 = v22;
      v33 = 0;
      v3 = v23;
      v31 = v21;
      v30 = v21;
      v32 = v21;
      v4 = v22;
      v5 = v21;
      do
        v6 = __ldaxr(v3);
      while (v6 == v4 && __stlxr(v5, v3));
      if (v6 != v4)
        v34 = v6;
      v29 = v6 == v4;
      v33 = v6 == v4;
      *v36 = v34;
      v28 = v33;
    }
    while (!v33);
    if (v24)
    {
      v19 = v26;
      v18 = v26;
      *v20 = v26;
      v17 = v19;
    }
  }
  while (!v24);
  return 0;
}

uint64_t _pthread_mutex_fairshare_unlock_slow(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t *v17;
  uint64_t v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t *v38;
  unsigned int v39;
  _DWORD *v40;
  uint64_t *v41;
  uint64_t *v42;
  unsigned int *v43;
  uint64_t v44;
  int v45;
  _BOOL4 v46;
  BOOL v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL4 v51;
  unint64_t v52;
  unint64_t *v53;
  unint64_t *v54;
  unint64_t *v55;
  unint64_t **v56;
  uint64_t v57;
  unint64_t *v58;
  unint64_t *v59;
  uint64_t **v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  unint64_t StatusReg;

  v15 = a1;
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v44 = a1;
  v43 = &v12;
  v42 = 0;
  v41 = &v13;
  v40 = (_DWORD *)&v13 + 1;
  v39 = 0;
  v39 = *(_DWORD *)(a1 + 12);
  v39 &= ~0x1000u;
  v57 = a1;
  v56 = &v38;
  v38 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v37 = 0;
  v36 = 0;
  v59 = v38;
  v58 = &v37;
  v37 = *v38;
  v61 = a1;
  v60 = &v35;
  v35 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v67 = a1;
  v66 = v35;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    v65 = 0;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v65 = *(_QWORD *)(StatusReg - 8);
    v64 = 0;
    v63 = *v66;
    v64 = v63;
    v62 = v63;
    if (v63 == v65)
    {
      v69 = v67;
      v68 = ((*(_DWORD *)(v67 + 12) >> 2) & 3) == 2
         && (v1 = HIWORD(*(_DWORD *)(v67 + 12)),
             *(_DWORD *)(v67 + 12) = *(unsigned __int16 *)(v67 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }
    else
    {
      v68 = -1;
    }
  }
  else
  {
    v68 = 0;
  }
  v32 = v68;
  if (v68 <= 0)
  {
    if (v32 >= 0)
    {
      v31 = 0;
      v30 = 0;
      do
      {
        v36 = v37;
        v29 = 0;
        v28 = *v35;
        v29 = v28;
        v27 = v28;
        v34 = v28;
        v31 = 0;
        v30 = 0;
        v26 = 0;
        v26 = diff_genseq(v37, SHIDWORD(v37));
        if (v26)
        {
          HIDWORD(v36) += 256;
          if ((v37 & 0xFFFFFF00) == (HIDWORD(v36) & 0xFFFFFF00))
          {
            LODWORD(v36) = v36 & 0xFFFFFFFC;
            v31 = 1;
            v33 = 0;
          }
          else
          {
            v33 = -1;
            v39 |= 0x1000u;
          }
          if (v33 != v34)
          {
            v25 = v34;
            v24 = 0;
            v2 = (unint64_t *)v35;
            v22 = v33;
            v21 = v33;
            v23 = v33;
            v3 = v34;
            v4 = v33;
            do
              v5 = __ldaxr(v2);
            while (v5 == v3 && __stlxr(v4, v2));
            if (v5 != v3)
              v25 = v5;
            v20 = v5 == v3;
            v24 = v5 == v3;
            v19 = v24;
            if (v5 != v3)
              _pthread_mutex_corruption_abort();
          }
        }
        else
        {
          v30 = 1;
        }
        if ((v31 & 1) != 0 || (v30 & 1) != 0)
          v39 &= ~0x1000u;
        v55 = v38;
        v54 = &v37;
        v53 = &v36;
        v52 = v37;
        v51 = 0;
        v6 = v38;
        v49 = v36;
        v48 = v36;
        v50 = v36;
        v7 = v37;
        v8 = v36;
        do
          v9 = __ldaxr(v6);
        while (v9 == v7 && __stlxr(v8, v6));
        if (v9 != v7)
          v52 = v9;
        v47 = v9 == v7;
        v51 = v9 == v7;
        *v54 = v52;
        v46 = v51;
      }
      while (!v51);
      if (v41)
        *(_DWORD *)v41 = v36;
      if (v40)
        *v40 = HIDWORD(v36);
      if (v42)
        *v42 = v44;
      if (v43)
        *v43 = v39;
      v45 = 0;
    }
    else
    {
      v45 = -v32;
    }
  }
  else
  {
    if (v43)
      *v43 = v39;
    v45 = 0;
  }
  v14 = v45;
  if (v45)
  {
    return v14;
  }
  else if ((v12 & 0x1000) != 0)
  {
    return _pthread_mutex_fairshare_unlock_drop(v15, v13, v12);
  }
  else
  {
    v18 = v15;
    v17 = &v11;
    v11 = (v15 + 31) & 0xFFFFFFFFFFFFFFF8;
    return 0;
  }
}

uint64_t _pthread_mutex_fairshare_unlock_drop(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _QWORD *v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t StatusReg;

  v9 = a2;
  v8 = a1;
  v7 = a3;
  v6 = 0;
  v5 = 0;
  v12 = a1;
  v11 = &v4;
  v4 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v5 = __psynch_mutexdrop(a1, a2, HIDWORD(a2), *v4, a3);
  if (v5 == -1)
  {
    v13 = 1;
    v14 = 1;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v6 = **(_DWORD **)(StatusReg + 8);
    if (v6 == 4)
      v6 = 0;
    if (v6)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_24058 = v6;
      __break(1u);
      JUMPOUT(0x11C18);
    }
    return 0;
  }
  else
  {
    return 0;
  }
}

uint64_t _pthread_mutex_ulock_lock(uint64_t a1, char a2)
{
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg + 24) & 0xFFFFFFFC;
  v7 = 0;
  v2 = (unsigned int *)(a1 + 24);
  v3 = *(_QWORD *)(StatusReg + 24) & 0xFFFFFFFCLL;
  do
    v4 = __ldaxr(v2);
  while (!v4 && __stlxr(v3, v2));
  if (v4)
    v7 = v4;
  v6 = 0;
  if (v4)
  {
    if ((a2 & 1) != 0)
      return 16;
    else
      return _pthread_mutex_ulock_lock_slow(a1, v8, v7);
  }
  return v6;
}

uint64_t _pthread_mutex_ulock_lock_slow(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;
  BOOL v8;
  int v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  char v18;

  v18 = 0;
  v17 = 16777218;
  if ((__pthread_mutex_ulock_adaptive_spin & 1) != 0)
    v17 = 17039362;
  do
  {
    v16 = 0;
    do
    {
      v15 = a3 & 0xFFFFFFFC;
      if ((v16 & 1) != 0)
      {
        v15 = -4;
        v16 = 0;
      }
      v14 = a3;
      v3 = (unsigned int *)(a1 + 24);
      do
        v4 = __ldaxr(v3);
      while (v4 == a3 && __stlxr(v15 | 1, v3));
      v10 = v4 == a3;
      if (v4 != a3)
        v14 = v4;
      a3 = v14;
      if (v10)
      {
        v13 = __ulock_wait(v17, a1 + 24, v15 | 1);
        if ((v13 & 0x80000000) == 0)
        {
          if (v13 >= 1)
            v18 = 1;
LABEL_21:
          a3 = *(_DWORD *)(a1 + 24);
          continue;
        }
        v9 = -v13;
        if (v13 == -4 || v9 == 14)
          goto LABEL_21;
        if (v9 != 105)
        {
          qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wait failure";
          qword_24058 = v13;
          __break(1u);
          JUMPOUT(0x12030);
        }
        v16 = 1;
      }
    }
    while (a3);
    v12 = a2;
    if ((v18 & 1) != 0)
      v12 = a2 | 1;
    v11 = 0;
    v5 = (unsigned int *)(a1 + 24);
    do
      v6 = __ldaxr(v5);
    while (v6 == a3 && __stlxr(v12, v5));
    v8 = v6 == a3;
    if (v6 != a3)
      v11 = v6;
    a3 = v11;
  }
  while (!v8);
  return 0;
}

uint64_t _pthread_mutex_ulock_unlock(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int *v4;
  int v5;
  unsigned int v6;
  int v7;

  v7 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) & 0xFFFFFFFC;
  v5 = *(_DWORD *)(a1 + 24);
  do
  {
    v1 = v5;
    v4 = (unsigned int *)(a1 + 24);
    do
      v2 = __ldaxr(v4);
    while (v2 == v5 && __stlxr(0, v4));
    v5 = v2;
  }
  while (v2 != v1);
  v6 = 0;
  if (v2 != v7)
    return _pthread_mutex_ulock_unlock_slow(a1, v7, v2);
  return v6;
}

uint64_t _pthread_mutex_ulock_unlock_slow(uint64_t a1, int a2, int a3)
{
  int v4;
  int v5;

  if (a3)
  {
    v5 = 0;
    if ((a3 & 0xFFFFFFFC) == a2)
    {
      if ((a3 & 1) == 0)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: unlock_slow without orig_waiters";
        __break(1u);
        JUMPOUT(0x123B8);
      }
    }
    else
    {
      if ((a3 & 1) == 0)
        return 0;
      v5 = 1024;
    }
    while (1)
    {
      v4 = __ulock_wake(v5 | 0x1000002u, a1 + 24, 0);
      if ((v4 & 0x80000000) == 0 || v4 == -2)
        break;
      if (-v4 != 4)
      {
        qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: ulock_wake failure";
        qword_24058 = -v4;
        __break(1u);
        JUMPOUT(0x12480);
      }
    }
  }
  return 0;
}

uint64_t _pthread_mutex_firstfit_unlock_slow(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  BOOL v30;
  unsigned int v31;
  _DWORD *v32;
  uint64_t *v33;
  uint64_t *v34;
  unsigned int *v35;
  uint64_t v36;
  unsigned int v37;
  _BOOL4 v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _BOOL4 v43;
  unint64_t v44;
  unint64_t *v45;
  unint64_t *v46;
  unint64_t *v47;
  unint64_t **v48;
  uint64_t v49;
  unint64_t *v50;
  unint64_t *v51;
  uint64_t **v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  unint64_t StatusReg;

  v12 = a1;
  v11 = 0;
  v10 = 0;
  v36 = a1;
  v35 = &v10;
  v34 = 0;
  v33 = &v11;
  v32 = (_DWORD *)&v11 + 1;
  v31 = 0;
  v31 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
  v30 = 0;
  v49 = a1;
  v48 = &v29;
  v29 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v28 = 0;
  v27 = 0;
  v51 = v29;
  v50 = &v28;
  v28 = *v29;
  v53 = a1;
  v52 = &v26;
  v26 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v25 = 0;
  v24 = 0;
  v59 = a1;
  v58 = v26;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    v57 = 0;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v57 = *(_QWORD *)(StatusReg - 8);
    v56 = 0;
    v55 = *v58;
    v56 = v55;
    v54 = v55;
    if (v55 == v57)
    {
      v61 = v59;
      v60 = ((*(_DWORD *)(v59 + 12) >> 2) & 3) == 2
         && (v1 = HIWORD(*(_DWORD *)(v59 + 12)),
             *(_DWORD *)(v59 + 12) = *(unsigned __int16 *)(v59 + 12) | ((unsigned __int16)(v1 - 1) << 16),
             (_WORD)v1 != 1);
    }
    else
    {
      v60 = -1;
    }
  }
  else
  {
    v60 = 0;
  }
  v24 = v60;
  if (v60 <= 0)
  {
    if (v24 >= 0)
    {
      do
      {
        v27 = v28;
        v23 = 0;
        v22 = *v26;
        v23 = v22;
        v21 = v22;
        v25 = v22;
        v30 = (int)diff_genseq(v28, SHIDWORD(v28)) > 0;
        LODWORD(v27) = v27 & 0xFFFFFFFD;
        if (v30)
          HIDWORD(v27) += 256;
        if (v25)
        {
          v20 = v25;
          v19 = 0;
          v2 = (unint64_t *)v26;
          v17 = 0;
          v16 = 0;
          v18 = 0;
          v3 = v25;
          do
            v4 = __ldaxr(v2);
          while (v4 == v3 && __stlxr(0, v2));
          if (v4 != v3)
            v20 = v4;
          v15 = v4 == v3;
          v19 = v4 == v3;
          v14 = v19;
          if (v4 != v3)
            _pthread_mutex_corruption_abort();
        }
        v47 = v29;
        v46 = &v28;
        v45 = &v27;
        v44 = v28;
        v43 = 0;
        v5 = v29;
        v41 = v27;
        v40 = v27;
        v42 = v27;
        v6 = v28;
        v7 = v27;
        do
          v8 = __ldaxr(v5);
        while (v8 == v6 && __stlxr(v7, v5));
        if (v8 != v6)
          v44 = v8;
        v39 = v8 == v6;
        v43 = v8 == v6;
        *v46 = v44;
        v38 = v43;
      }
      while (!v43);
      if (v30)
        v31 |= 0x1000u;
      if (v33)
        *(_DWORD *)v33 = v27;
      if (v32)
        *v32 = HIDWORD(v27);
      if (v34)
        *v34 = v36;
      if (v35)
        *v35 = v31;
      v37 = 0;
    }
    else
    {
      v37 = -v24;
    }
  }
  else
  {
    if (v35)
      *v35 = v31;
    v37 = 0;
  }
  if (v37)
  {
    return v37;
  }
  else if ((v10 & 0x1000) != 0)
  {
    return _pthread_mutex_firstfit_wake(v12, v11, v10);
  }
  else
  {
    return 0;
  }
}

uint64_t _pthread_mutex_firstfit_wake(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4;

  if (__psynch_mutexdrop(a1, a2, HIDWORD(a2), 0, a3) == -1)
  {
    v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v4 == 4)
      v4 = 0;
    if (v4)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __psynch_mutexdrop failed";
      qword_24058 = v4;
      __break(1u);
      JUMPOUT(0x12B18);
    }
  }
  return 0;
}

uint64_t _pthread_mutex_firstfit_lock_slow(uint64_t a1, char a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t **v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t StatusReg;

  v17 = a1;
  v16 = a2 & 1;
  v15 = 0;
  v14 = 0;
  v29 = a1;
  v28 = &v13;
  v13 = (uint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = 0;
  v11 = 0;
  v31 = v13;
  v30 = &v12;
  v12 = *v13;
  v33 = a1;
  v32 = &v10;
  v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8 = *(_QWORD *)(StatusReg - 8);
  v40 = a1;
  v39 = a2 & 1;
  v38 = v10;
  if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
  {
    v37 = 0;
    v44 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = *(_QWORD *)(v44 - 8);
    v36 = 0;
    v35 = *v38;
    v36 = v35;
    v34 = v35;
    if (v35 == v37)
    {
      v42 = v40;
      if (((*(_DWORD *)(v40 + 12) >> 2) & 3) == 2)
      {
        if (HIWORD(*(_DWORD *)(v40 + 12)) == 0xFFFF)
        {
          v41 = -35;
        }
        else
        {
          *(_DWORD *)(v40 + 12) = *(unsigned __int16 *)(v40 + 12) | ((unsigned __int16)(HIWORD(*(_DWORD *)(v40 + 12)) + 1) << 16);
          v41 = HIWORD(*(_DWORD *)(v40 + 12));
        }
      }
      else if ((v39 & 1) != 0)
      {
        v41 = -16;
      }
      else
      {
        v41 = -11;
      }
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }
  v15 = v41;
  if (v41 <= 0)
  {
    if (v15 >= 0)
    {
      do
      {
        v11 = v12;
        v9 = *v10;
        v7 = (v12 & 2) == 0;
        if ((v16 & 1) == 0 || (v12 & 2) == 0)
        {
          if ((v12 & 2) != 0)
            LODWORD(v11) = v11 + 256;
          else
            LODWORD(v11) = v11 | 2;
        }
        v27 = v13;
        v26 = &v12;
        v25 = &v11;
        v24 = v12;
        v23 = 0;
        v2 = (unint64_t *)v13;
        v21 = v11;
        v20 = v11;
        v22 = v11;
        v3 = v12;
        v4 = v11;
        do
          v5 = __ldaxr(v2);
        while (v5 == v3 && __stlxr(v4, v2));
        if (v5 != v3)
          v24 = v5;
        v19 = v5 == v3;
        v23 = v5 == v3;
        *v26 = v24;
        v18 = v23;
      }
      while (!v23);
      if (v7)
      {
        *v10 = v8;
        v15 = 0;
      }
      else if ((v16 & 1) != 0)
      {
        v15 = 16;
      }
      else
      {
        v15 = _pthread_mutex_firstfit_lock_wait(v17, v11, v9);
      }
      if (!v15)
      {
        v43 = v17;
        if (((*(_DWORD *)(v17 + 12) >> 2) & 3) == 2)
          *(_DWORD *)(v17 + 12) = *(unsigned __int16 *)(v17 + 12) | 0x10000;
      }
    }
    else
    {
      return -v15;
    }
  }
  else
  {
    v14 = 1;
    return 0;
  }
  return v15;
}

uint64_t _pthread_mutex_firstfit_lock_wait(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  unint64_t StatusReg;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  BOOL v22;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t *v34;
  unint64_t *v35;
  unint64_t **v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t *v39;
  _QWORD **v40;
  uint64_t v41;

  v13[0] = a2;
  v12 = a1;
  v11 = a3;
  v13[2] = a1;
  v13[1] = &v10;
  v10 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v9 = *(_QWORD *)(StatusReg - 8);
  do
  {
    do
    {
      v8 = __psynch_mutexwait(v12, LODWORD(v13[0]), HIDWORD(v13[0]), v11, *(unsigned int *)(v12 + 12));
      v11 = *v10;
    }
    while (v8 == -1);
    v25 = v12;
    v24 = v9;
    v23 = v13;
    v22 = 0;
    v37 = v12;
    v36 = &v21;
    v21 = (unint64_t *)((v12 + 39) & 0xFFFFFFFFFFFFFFF8);
    v20 = 0;
    v19 = 0;
    v39 = v21;
    v38 = &v20;
    v20 = *v21;
    v41 = v12;
    v40 = &v18;
    v18 = (_QWORD *)((v12 + 31) & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v19 = v20;
      v22 = (v20 & 2) == 0;
      if ((v20 & 2) != 0)
        LODWORD(v19) = v19 + 256;
      else
        LODWORD(v19) = v19 | 2;
      v35 = v21;
      v34 = &v20;
      v33 = &v19;
      v32 = v20;
      v31 = 0;
      v3 = v21;
      v29 = v19;
      v28 = v19;
      v30 = v19;
      v4 = v20;
      v5 = v19;
      do
        v6 = __ldaxr(v3);
      while (v6 == v4 && __stlxr(v5, v3));
      if (v6 != v4)
        v32 = v6;
      v27 = v6 == v4;
      v31 = v6 == v4;
      *v34 = v32;
      v26 = v31;
    }
    while (!v31);
    if (v22)
    {
      v17 = v24;
      v16 = v24;
      *v18 = v24;
      v15 = v17;
    }
    if (v23)
      *v23 = v19;
  }
  while (!v22);
  return 0;
}

uint64_t _pthread_mutex_droplock(uint64_t a1, _DWORD *a2, _QWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  int v29;
  _DWORD *v30;
  _DWORD *v31;
  _QWORD *v32;
  _DWORD *v33;
  uint64_t v34;
  _BOOL4 v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _BOOL4 v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t *v44;
  unint64_t *v45;
  unint64_t **v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t *v49;
  uint64_t **v50;
  uint64_t v51;
  _BOOL4 v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL4 v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  uint64_t *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t *v67;
  BOOL v68;
  unsigned int v69;
  _DWORD *v70;
  _DWORD *v71;
  _QWORD *v72;
  unsigned int *v73;
  uint64_t v74;
  _BOOL4 v76;
  BOOL v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  _BOOL4 v81;
  unint64_t v82;
  unint64_t *v83;
  unint64_t *v84;
  unint64_t *v85;
  unint64_t **v86;
  uint64_t v87;
  unint64_t *v88;
  unint64_t *v89;
  uint64_t **v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  unint64_t StatusReg;

  v92 = a1;
  if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    v34 = a1;
    v33 = a2;
    v32 = a3;
    v31 = a4;
    v30 = a5;
    v29 = 0;
    v29 = *(_DWORD *)(a1 + 12);
    v29 &= ~0x1000u;
    v47 = a1;
    v46 = &v28;
    v28 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v27 = 0;
    v26 = 0;
    v49 = v28;
    v48 = &v27;
    v27 = *v28;
    v51 = a1;
    v50 = &v25;
    v25 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v107 = a1;
    v106 = v25;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      v105 = 0;
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v105 = *(_QWORD *)(StatusReg - 8);
      v104 = 0;
      v103 = *v106;
      v104 = v103;
      v102 = v103;
      if (v103 == v105)
      {
        v109 = v107;
        v108 = ((*(_DWORD *)(v107 + 12) >> 2) & 3) == 2
            && (v5 = HIWORD(*(_DWORD *)(v107 + 12)),
                *(_DWORD *)(v107 + 12) = *(unsigned __int16 *)(v107 + 12) | ((unsigned __int16)(v5 - 1) << 16),
                (_WORD)v5 != 1);
      }
      else
      {
        v108 = -1;
      }
    }
    else
    {
      v108 = 0;
    }
    if (v108 <= 0)
    {
      if (v108 >= 0)
      {
        do
        {
          v26 = v27;
          v24 = *v25;
          v22 = 0;
          v21 = 0;
          if (diff_genseq(v27, SHIDWORD(v27)))
          {
            HIDWORD(v26) += 256;
            if ((v27 & 0xFFFFFF00) == (HIDWORD(v26) & 0xFFFFFF00))
            {
              LODWORD(v26) = v26 & 0xFFFFFFFC;
              v22 = 1;
              v23 = 0;
            }
            else
            {
              v23 = -1;
              v29 |= 0x1000u;
            }
            if (v23 != v24)
            {
              v6 = (unint64_t *)v25;
              do
                v7 = __ldaxr(v6);
              while (v7 == v24 && __stlxr(v23, v6));
              if (v7 != v24)
                _pthread_mutex_corruption_abort();
            }
          }
          else
          {
            v21 = 1;
          }
          if ((v22 & 1) != 0 || (v21 & 1) != 0)
            v29 &= ~0x1000u;
          v45 = v28;
          v44 = &v27;
          v43 = &v26;
          v42 = v27;
          v41 = 0;
          v8 = v28;
          v39 = v26;
          v38 = v26;
          v40 = v26;
          v9 = v27;
          v10 = v26;
          do
            v11 = __ldaxr(v8);
          while (v11 == v9 && __stlxr(v10, v8));
          if (v11 != v9)
            v42 = v11;
          v37 = v11 == v9;
          v41 = v11 == v9;
          *v44 = v42;
          v36 = v41;
        }
        while (!v41);
        if (v31)
          *v31 = v26;
        if (v30)
          *v30 = HIDWORD(v26);
        if (v32)
          *v32 = v34;
        if (v33)
          *v33 = v29;
        return 0;
      }
      else
      {
        return -v108;
      }
    }
    else
    {
      if (v33)
        *v33 = v29;
      return 0;
    }
  }
  else
  {
    v74 = a1;
    v73 = a2;
    v72 = a3;
    v71 = a4;
    v70 = a5;
    v69 = 0;
    v69 = *(_DWORD *)(a1 + 12) & 0xFFFFEFFF;
    v68 = 0;
    v87 = a1;
    v86 = &v67;
    v67 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
    v66 = 0;
    v65 = 0;
    v89 = v67;
    v88 = &v66;
    v66 = *v67;
    v91 = a1;
    v90 = &v64;
    v64 = (uint64_t *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
    v63 = 0;
    v62 = 0;
    v98 = a1;
    v97 = v64;
    if (((*(_DWORD *)(a1 + 12) >> 2) & 3) != 0)
    {
      v96 = 0;
      v101 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v96 = *(_QWORD *)(v101 - 8);
      v95 = 0;
      v94 = *v97;
      v95 = v94;
      v93 = v94;
      if (v94 == v96)
      {
        v100 = v98;
        v99 = ((*(_DWORD *)(v98 + 12) >> 2) & 3) == 2
           && (v12 = HIWORD(*(_DWORD *)(v98 + 12)),
               *(_DWORD *)(v98 + 12) = *(unsigned __int16 *)(v98 + 12) | ((unsigned __int16)(v12 - 1) << 16),
               (_WORD)v12 != 1);
      }
      else
      {
        v99 = -1;
      }
    }
    else
    {
      v99 = 0;
    }
    v62 = v99;
    if (v99 <= 0)
    {
      if (v62 >= 0)
      {
        do
        {
          v65 = v66;
          v61 = 0;
          v60 = *v64;
          v61 = v60;
          v59 = v60;
          v63 = v60;
          v68 = (int)diff_genseq(v66, SHIDWORD(v66)) > 0;
          LODWORD(v65) = v65 & 0xFFFFFFFD;
          if (v68)
            HIDWORD(v65) += 256;
          if (v63)
          {
            v58 = v63;
            v57 = 0;
            v13 = (unint64_t *)v64;
            v55 = 0;
            v54 = 0;
            v56 = 0;
            do
              v14 = __ldaxr(v13);
            while (v14 == v63 && __stlxr(0, v13));
            if (v14 != v63)
              v58 = v14;
            v53 = v14 == v63;
            v57 = v14 == v63;
            v52 = v57;
            if (v14 != v63)
              _pthread_mutex_corruption_abort();
          }
          v85 = v67;
          v84 = &v66;
          v83 = &v65;
          v82 = v66;
          v81 = 0;
          v15 = v67;
          v79 = v65;
          v78 = v65;
          v80 = v65;
          v16 = v66;
          v17 = v65;
          do
            v18 = __ldaxr(v15);
          while (v18 == v16 && __stlxr(v17, v15));
          if (v18 != v16)
            v82 = v18;
          v77 = v18 == v16;
          v81 = v18 == v16;
          *v84 = v82;
          v76 = v81;
        }
        while (!v81);
        if (v68)
          v69 |= 0x1000u;
        if (v71)
          *v71 = v65;
        if (v70)
          *v70 = HIDWORD(v65);
        if (v72)
          *v72 = v74;
        if (v73)
          *v73 = v69;
        return 0;
      }
      else
      {
        return -v62;
      }
    }
    else
    {
      if (v73)
        *v73 = v69;
      return 0;
    }
  }
}

uint64_t _pthread_mutex_lock_init_slow(uint64_t a1, char a2)
{
  char v3;
  unsigned int v6;

  v3 = a2 & 1;
  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
    v6 = 0;
  else
    v6 = _pthread_mutex_check_init_slow(a1);
  if (v6)
  {
    return v6;
  }
  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_lock_slow(a1, v3 & 1);
  }
  else if (((*(_DWORD *)(a1 + 12) >> 14) & 1) != 0)
  {
    return _pthread_mutex_ulock_lock(a1, v3 & 1);
  }
  else
  {
    return _pthread_mutex_firstfit_lock_slow(a1, v3 & 1);
  }
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  _QWORD *v9;
  pthread_mutex_t *v10;
  _BOOL4 v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t **v22;
  pthread_mutex_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  _QWORD **v26;
  pthread_mutex_t *v27;
  pthread_mutex_t *v28;
  pthread_mutex_t *v29;
  pthread_mutex_t *v30;

  v10 = a1;
  v30 = a1;
  if (a1->__sig != 1297437786)
    return _pthread_mutex_unlock_init_slow((uint64_t)v10);
  v28 = v10;
  if (((*(_DWORD *)&v10->__opaque[4] >> 6) & 7) == 1)
    return _pthread_mutex_fairshare_unlock((uint64_t)v10);
  v29 = v10;
  if (((*(_DWORD *)&v10->__opaque[4] >> 14) & 1) != 0)
    return _pthread_mutex_ulock_unlock((uint64_t)v10);
  v27 = v10;
  v26 = &v9;
  v9 = (_QWORD *)((unint64_t)&v10->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  v23 = v10;
  v22 = &v8;
  v8 = (unint64_t *)((unint64_t)&v10->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  v7 = 0;
  v6 = 0;
  v25 = v8;
  v24 = &v7;
  v7 = *v8;
  *v9 = 0;
  do
  {
    v6 = v7;
    if (diff_genseq(v7, SHIDWORD(v7)))
      return _pthread_mutex_firstfit_unlock_slow((uint64_t)v10);
    LODWORD(v6) = v6 & 0xFFFFFFFD;
    v21 = v8;
    v20 = &v7;
    v19 = &v6;
    v18 = v7;
    v17 = 0;
    v1 = v8;
    v15 = v6;
    v14 = v6;
    v16 = v6;
    v2 = v7;
    v3 = v6;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v18 = v4;
    v13 = v4 == v2;
    v17 = v4 == v2;
    *v20 = v18;
    v12 = v17;
  }
  while (!v17);
  return 0;
}

uint64_t _pthread_mutex_unlock_init_slow(uint64_t a1)
{
  unsigned int v4;

  if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
    v4 = 0;
  else
    v4 = _pthread_mutex_check_init_slow(a1);
  if (v4)
  {
    return v4;
  }
  else if (((*(_DWORD *)(a1 + 12) >> 6) & 7) == 1)
  {
    return _pthread_mutex_fairshare_unlock_slow(a1);
  }
  else if (((*(_DWORD *)(a1 + 12) >> 14) & 1) != 0)
  {
    return _pthread_mutex_ulock_unlock(a1);
  }
  else
  {
    return _pthread_mutex_firstfit_unlock_slow(a1);
  }
}

uint64_t _pthread_mutex_fairshare_unlock(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _BYTE v6[12];
  unint64_t v7;
  unint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  _BYTE *v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t **v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  _QWORD **v26;
  uint64_t v27;

  v10 = a1;
  v27 = a1;
  v26 = &v9;
  v9 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v23 = a1;
  v22 = &v8;
  v8 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v7 = 0;
  *(_QWORD *)&v6[4] = 0;
  v25 = v8;
  v24 = &v7;
  v7 = *v8;
  *(_QWORD *)v6 = diff_genseq(v7, SHIDWORD(v7));
  if (*(_DWORD *)v6)
  {
    *v9 = 0;
    do
    {
      *(_DWORD *)&v6[4] = v7;
      *(_DWORD *)&v6[8] = HIDWORD(v7) + 256;
      if ((v7 & 0xFFFFFF00) != ((HIDWORD(v7) + 256) & 0xFFFFFF00))
        return _pthread_mutex_fairshare_unlock_slow(v10);
      *(_DWORD *)&v6[4] &= 0xFFFFFFFC;
      v21 = v8;
      v20 = &v7;
      v19 = &v6[4];
      v18 = v7;
      v17 = 0;
      v1 = v8;
      v15 = *(_QWORD *)&v6[4];
      v14 = *(_QWORD *)&v6[4];
      v16 = *(_QWORD *)&v6[4];
      v2 = v7;
      v3 = *(_QWORD *)&v6[4];
      do
        v4 = __ldaxr(v1);
      while (v4 == v2 && __stlxr(v3, v1));
      if (v4 != v2)
        v18 = v4;
      v13 = v4 == v2;
      v17 = v4 == v2;
      *v20 = v18;
      v12 = v17;
    }
    while (!v17);
    return 0;
  }
  else
  {
    return 0;
  }
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  pthread_mutex_t *v14;
  _BOOL4 v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t **v26;
  pthread_mutex_t *v27;
  unint64_t *v28;
  unint64_t *v29;
  _QWORD **v30;
  pthread_mutex_t *v31;
  unint64_t StatusReg;

  if (a1->__sig != 1297437786)
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 0);
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1)
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 0);
  if (((*(_DWORD *)&a1->__opaque[4] >> 14) & 1) != 0)
    return _pthread_mutex_ulock_lock((uint64_t)a1, 0);
  v14 = a1;
  v13 = 0;
  v31 = a1;
  v30 = &v12;
  v12 = (_QWORD *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  v11 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v11 = *(_QWORD *)(StatusReg - 8);
  v27 = a1;
  v26 = &v10;
  v10 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  v9 = 0;
  v8 = 0;
  v29 = v10;
  v28 = &v9;
  v9 = *v10;
  if ((v9 & 2) != 0)
    return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
  do
  {
    v8 = v9;
    v7 = (v9 & 2) == 0;
    if ((v13 & 1) != 0 && (v9 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }
    if ((v9 & 2) != 0)
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
    LODWORD(v8) = v8 | 2;
    v25 = v10;
    v24 = &v9;
    v23 = &v8;
    v22 = v9;
    v21 = 0;
    v1 = v10;
    v19 = v8;
    v18 = v8;
    v20 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v22 = v4;
    v17 = v4 == v2;
    v21 = v4 == v2;
    *v24 = v22;
    v16 = v21;
  }
  while (!v21);
  if (v7)
  {
    *v12 = v11;
    return 0;
  }
  else
  {
    if ((v13 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x14970);
    }
    return 16;
  }
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  pthread_mutex_t *v14;
  _BOOL4 v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t **v26;
  pthread_mutex_t *v27;
  unint64_t *v28;
  unint64_t *v29;
  _QWORD **v30;
  pthread_mutex_t *v31;
  unint64_t StatusReg;

  if (a1->__sig != 1297437786)
    return _pthread_mutex_lock_init_slow((uint64_t)a1, 1);
  if (((*(_DWORD *)&a1->__opaque[4] >> 6) & 7) == 1)
    return _pthread_mutex_fairshare_lock((uint64_t)a1, 1);
  if (((*(_DWORD *)&a1->__opaque[4] >> 14) & 1) != 0)
    return _pthread_mutex_ulock_lock((uint64_t)a1, 1);
  v14 = a1;
  v13 = 1;
  v31 = a1;
  v30 = &v12;
  v12 = (_QWORD *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
  v11 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v11 = *(_QWORD *)(StatusReg - 8);
  v27 = a1;
  v26 = &v10;
  v10 = (unint64_t *)((unint64_t)&a1->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
  v9 = 0;
  v8 = 0;
  v29 = v10;
  v28 = &v9;
  v9 = *v10;
  do
  {
    v8 = v9;
    v7 = (v9 & 2) == 0;
    if ((v13 & 1) != 0 && (v9 & 2) != 0)
    {
      __dmb(9u);
      return 16;
    }
    if ((v9 & 2) != 0)
      return _pthread_mutex_firstfit_lock_slow((uint64_t)v14, v13 & 1);
    LODWORD(v8) = v8 | 2;
    v25 = v10;
    v24 = &v9;
    v23 = &v8;
    v22 = v9;
    v21 = 0;
    v1 = v10;
    v19 = v8;
    v18 = v8;
    v20 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v22 = v4;
    v17 = v4 == v2;
    v21 = v4 == v2;
    *v24 = v22;
    v16 = v21;
  }
  while (!v21);
  if (v7)
  {
    *v12 = v11;
    return 0;
  }
  else
  {
    if ((v13 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x14D18);
    }
    return 16;
  }
}

void _pthread_mutex_enable_legacy_mode(void)
{
  _pthread_mutex_sig_fast = 1297437784;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  char v1;
  char v2;
  unsigned int v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  pthread_mutex_t *v12;
  pthread_mutex_t *v13;
  char *opaque;
  char *v15;
  _QWORD **v16;
  pthread_mutex_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD **v20;
  pthread_mutex_t *v21;
  pthread_mutex_t *v22;
  pthread_mutex_t *v23;
  BOOL v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t StatusReg;
  BOOL v34;
  int v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v12 = a1;
  v11 = 22;
  opaque = a1->__opaque;
  v30 = (unsigned int *)a1->__opaque;
  v29 = 327680;
  if (v1)
    v2 = 0;
  else
    v2 = 1;
  if ((v2 & 1) == 0)
    goto LABEL_11;
  v28 = 0;
  v31 = 3;
  v32 = 3;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v28 = *(_QWORD *)(StatusReg + 24);
  v27 = 0;
  v26 = v28;
  v25 = v28;
  do
    v3 = __ldaxr(v30);
  while (!v3 && __stlxr(v28, v30));
  if (v3)
    v27 = v3;
  v24 = v3 == 0;
  if (v3)
LABEL_11:
    os_unfair_lock_lock_with_options(v30, v29);
  v13 = v12;
  if ((v12->__sig & 0xFFFFFFFDLL) == 0x4D555458)
  {
    v11 = 16;
    v22 = v12;
    if (((*(_DWORD *)&v12->__opaque[4] >> 14) & 1) == 0 || *(_DWORD *)&v12->__opaque[16])
    {
      v17 = v12;
      v16 = &v10;
      v10 = (_QWORD *)((unint64_t)&v12->__opaque[31] & 0xFFFFFFFFFFFFFFF8);
      v9 = 0;
      v19 = v10;
      v18 = &v9;
      v9 = *v10;
      v21 = v12;
      v20 = &v8;
      v8 = (_QWORD *)((unint64_t)&v12->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      if (!*v8 && (v9 & 0xFFFFFF00) == (HIDWORD(v9) & 0xFFFFFF00))
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v23 = v12;
    if ((v12->__sig & 0xFFFFFFF0) == 0x32AAABA0)
      v11 = 0;
  }
  if (!v11)
    v12->__sig = 0;
  v15 = v12->__opaque;
  v39 = v12->__opaque;
  v38 = 0;
  v40 = 3;
  v41 = 3;
  v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v38 = *(_QWORD *)(v42 + 24);
  v37 = 0;
  v36 = v38;
  v4 = (unsigned int *)v12->__opaque;
  v35 = 0;
  v5 = v38;
  do
    v6 = __ldaxr(v4);
  while (v6 == v5 && __stlxr(0, v4));
  if (v6 != v5)
    v36 = v6;
  v34 = v6 == v5;
  if (v6 != v5)
    os_unfair_lock_unlock((os_unfair_lock_t)v39);
  return v11;
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  if (a1->__sig != 1297373249)
    return 22;
  a1->__sig = 0;
  return 0;
}

uint64_t _pthread_mutex_check_init_slow(uint64_t a1)
{
  BOOL v1;
  char v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v10;
  unsigned int v11;
  unsigned int *v13;
  int v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD **v27;
  uint64_t v28;
  _QWORD **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t StatusReg;
  BOOL v44;
  int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  os_unfair_lock_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;

  v11 = 22;
  v33 = a1;
  v1 = (*(_QWORD *)a1 & 0xFFFFFFF0) == 850045856;
  if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
  {
    v25 = a1 + 8;
    v40 = (unsigned int *)(a1 + 8);
    v39 = 327680;
    v2 = !v1;
    if ((v2 & 1) == 0)
      goto LABEL_12;
    v38 = 0;
    v41 = 3;
    v42 = 3;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v38 = *(_QWORD *)(StatusReg + 24);
    v37 = 0;
    v36 = v38;
    v35 = v38;
    do
      v3 = __ldaxr(v40);
    while (!v3 && __stlxr(v38, v40));
    if (v3)
      v37 = v3;
    v34 = v3 == 0;
    if (v3)
LABEL_12:
      os_unfair_lock_lock_with_options(v40, v39);
    v32 = a1;
    if ((*(_QWORD *)a1 & 0xFFFFFFF0) == 0x32AAABA0)
    {
      v4 = *(_QWORD *)a1 & 0xF;
      v21 = a1;
      v20 = 0;
      v19 = v4;
      *(_DWORD *)(a1 + 12) = 0;
      *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFDFFF | 0x2000;
      if (v20)
      {
        if (*(_QWORD *)v20 == 1297373249)
        {
          *(_WORD *)(v21 + 16) = *(_DWORD *)(v20 + 8);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFFC | *(_DWORD *)(v20 + 12) & 3;
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFE3F | (((*(_DWORD *)(v20 + 12) >> 6) & 7) << 6);
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFF3 | (4 * ((*(_DWORD *)(v20 + 12) >> 2) & 3));
          *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFFFCF | (16 * ((*(_DWORD *)(v20 + 12) >> 4) & 3));
          *(_WORD *)(v21 + 18) = 0;
          v18 = 1297437784;
          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0)
          {
            v31 = v21;
            if (((*(_DWORD *)(v21 + 12) >> 6) & 7) == 1 || (v53 = v21, ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2))
              v18 = _pthread_mutex_sig_fast;
          }
          if (((*(_DWORD *)(v21 + 12) >> 2) & 3) == 0
            && ((*(_DWORD *)(v21 + 12) >> 6) & 7) == 2
            && ((*(_DWORD *)(v21 + 12) >> 4) & 3) == 2
            && v18 == _pthread_mutex_sig_fast)
          {
            *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFBFFF | ((__pthread_mutex_use_ulock & 1) << 14);
          }
          else
          {
            *(_DWORD *)(v21 + 12) &= ~0x4000u;
          }
          if (((*(_DWORD *)(v21 + 12) >> 14) & 1) != 0)
          {
            v5 = v21;
            *(_QWORD *)(v21 + 24) = -1;
            *(_QWORD *)(v5 + 32) = -1;
            *(_QWORD *)(v5 + 40) = -1;
            v17 = 0;
            *(_DWORD *)(v21 + 24) = 0;
          }
          else
          {
            v28 = v21;
            v27 = &v16;
            v16 = (_QWORD *)((v21 + 39) & 0xFFFFFFFFFFFFFFF8);
            v30 = v21;
            v29 = &v15;
            v15 = (_QWORD *)((v21 + 31) & 0xFFFFFFFFFFFFFFF8);
            if (v15 != (_QWORD *)(v21 + 24))
            {
              *(_DWORD *)(v21 + 12) = *(_DWORD *)(v21 + 12) & 0xFFFFF7FF | 0x800;
              *(_QWORD *)(v21 + 24) = -1;
            }
            *(_QWORD *)(v21 + 40) = -1;
            *v15 = 0;
            *v16 = 0;
          }
          v14 = v18;
          *(_QWORD *)(v21 + 48) = ~v21;
          *(_DWORD *)(v21 + 56) = v14;
          *(_DWORD *)(v21 + 60) = v14;
          *(_DWORD *)(v21 + 20) = v14;
          v13 = (unsigned int *)v21;
          *(_DWORD *)(v21 + 4) = HIDWORD(v18);
          atomic_store(v18, v13);
          v22 = 0;
        }
        else
        {
          v22 = 22;
        }
      }
      else
      {
        v10 = (v19 - 1);
        if (v10 <= 6)
          __asm { BR              X8 }
        v22 = 22;
      }
      v11 = v22;
    }
    else
    {
      v24 = a1;
      if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
        v11 = 0;
    }
    v26 = a1 + 8;
    v49 = (os_unfair_lock_t)(a1 + 8);
    v48 = 0;
    v50 = 3;
    v51 = 3;
    v52 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v48 = *(_QWORD *)(v52 + 24);
    v47 = 0;
    v46 = v48;
    v6 = (unsigned int *)(a1 + 8);
    v45 = 0;
    v7 = v48;
    do
      v8 = __ldaxr(v6);
    while (v8 == v7 && __stlxr(0, v6));
    if (v8 != v7)
      v46 = v8;
    v44 = v8 == v7;
    if (v8 != v7)
      os_unfair_lock_unlock(v49);
  }
  else
  {
    v23 = a1;
    if ((*(_QWORD *)a1 & 0xFFFFFFFDLL) == 0x4D555458)
      return 0;
  }
  return v11;
}

uint64_t _pthread_mutex_fairshare_lock(uint64_t a1, char a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  uint64_t v14;
  _BOOL4 v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t **v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t *v29;
  _QWORD **v30;
  uint64_t v31;
  unint64_t StatusReg;

  v14 = a1;
  v13 = a2 & 1;
  v31 = a1;
  v30 = &v12;
  v12 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
  v11 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v11 = *(_QWORD *)(StatusReg - 8);
  v27 = a1;
  v26 = &v10;
  v10 = (unint64_t *)((a1 + 39) & 0xFFFFFFFFFFFFFFF8);
  v9 = 0;
  v8 = 0;
  v29 = v10;
  v28 = &v9;
  v9 = *v10;
  if ((v9 & 2) != 0)
  {
    return _pthread_mutex_fairshare_lock_slow(v14, v13 & 1);
  }
  else
  {
    do
    {
      v8 = v9;
      v7 = (v9 & 2) == 0;
      if ((v13 & 1) == 0 || (v9 & 2) == 0)
      {
        if ((v9 & 2) != 0)
          return _pthread_mutex_fairshare_lock_slow(v14, v13 & 1);
        LODWORD(v8) = v8 + 256;
        LODWORD(v8) = v8 | 3;
      }
      v25 = v10;
      v24 = &v9;
      v23 = &v8;
      v22 = v9;
      v21 = 0;
      v2 = v10;
      v19 = v8;
      v18 = v8;
      v20 = v8;
      v3 = v9;
      v4 = v8;
      do
        v5 = __ldaxr(v2);
      while (v5 == v3 && __stlxr(v4, v2));
      if (v5 != v3)
        v22 = v5;
      v17 = v5 == v3;
      v21 = v5 == v3;
      *v24 = v22;
      v16 = v21;
    }
    while (!v21);
    if (v7)
    {
      *v12 = v11;
      return 0;
    }
    else
    {
      if ((v13 & 1) == 0)
      {
        __break(1u);
        JUMPOUT(0x15C78);
      }
      return 16;
    }
  }
}

void *__cdecl malloc(size_t __size)
{
  if (_pthread_malloc)
    return (void *)_pthread_malloc(__size);
  else
    return 0;
}

void free(void *a1)
{
  if (_pthread_free)
    _pthread_free(a1);
}

uint64_t _pthread_qos_class_to_thread_qos(int a1)
{
  unint64_t v2;

  v2 = (a1 - 5);
  if (v2 <= 0x1C)
    __asm { BR              X8 }
  return 0;
}

uint64_t _pthread_set_main_qos(uint64_t result)
{
  _main_qos = result;
  return result;
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  unsigned __int8 v4;
  char v5;
  unsigned int v8;

  v5 = __relative_priority;
  v4 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (__attr->__sig != 1414022209 || ((*(_QWORD *)&__attr->__opaque[32] >> 24) & 1) != 0)
    return 22;
  v8 = 0;
  if (v4 && v4 < 7u)
    v8 = (1 << (v4 + 7)) | (v5 - 1);
  *(_QWORD *)&__attr->__opaque[24] = v8;
  *(_QWORD *)&__attr->__opaque[32] = *(_QWORD *)&__attr->__opaque[32] & 0xFFFFFFFFFDFFFFFFLL | 0x2000000;
  *(_QWORD *)&__attr->__opaque[32] &= ~0x1000000uLL;
  return 0;
}

uint64_t _pthread_validate_qos_class_and_relpri(int a1, int a2)
{
  if (a2 <= 0 && a2 >= -15)
    return _pthread_qos_class_to_thread_qos(a1);
  else
    return 0;
}

int pthread_attr_get_qos_class_np(pthread_attr_t *__attr, qos_class_t *__qos_class, int *__relative_priority)
{
  if (__attr->__sig != 1414022209)
    return 22;
  if (((*(_QWORD *)&__attr->__opaque[32] >> 25) & 1) != 0)
    _pthread_priority_split(*(_QWORD *)&__attr->__opaque[24], __qos_class, __relative_priority);
  else
    _pthread_priority_split(0, __qos_class, __relative_priority);
  return 0;
}

uint64_t _pthread_priority_split(uint64_t result, _DWORD *a2, int *a3)
{
  unsigned int v3;
  char v4;
  unsigned __int8 v5;
  BOOL v6;
  BOOL v7;
  int v10;
  unsigned __int8 v11;
  int v12;

  v10 = result;
  v7 = 0;
  if ((result & 0x22000000) == 0)
    v7 = (result & 0x3F00) != 0;
  if (v7)
  {
    v3 = (unint64_t)(result & 0x3F00) >> 8;
    v4 = __clz(__rbit32(v3));
    if (v3)
      v5 = v4 + 1;
    else
      v5 = 0;
    v11 = v5;
  }
  else
  {
    v11 = 0;
  }
  if (a2)
  {
    result = _pthread_qos_class_from_thread_qos(v11);
    *a2 = result;
  }
  if (a3)
  {
    v6 = 0;
    if ((v10 & 0x22000000) == 0)
      v6 = (v10 & 0x3F00) != 0;
    if (v6)
      v12 = (char)v10 + 1;
    else
      v12 = 0;
    *a3 = v12;
  }
  return result;
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  unsigned __int8 v3;
  char v4;
  uint64_t v6;

  v4 = __relative_priority;
  v3 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v3)
    return 22;
  v6 = 0;
  if (v3 < 7u)
    LODWORD(v6) = (1 << (v3 + 7)) | (v4 - 1);
  return _pthread_set_properties_self(1, v6, 0);
}

uint64_t _pthread_set_properties_self(int a1, uint64_t a2, unsigned int a3)
{
  unsigned int v4;
  unint64_t v6;
  char v9;

  v9 = a1;
  v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  v4 = 0;
  if ((*(_QWORD *)v6 ^ _pthread_ptr_munge_token) != v6)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  if ((*(_BYTE *)(v6 + 164) & 1) == 0 || (v9 & 0x2D) == 0 || (a1 & 0xFFFFFFD2) != 0)
    v4 = __bsdthread_ctl(256, a2, a3);
  if ((v9 & 1) != 0 && (!v4 || **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) == 2))
    *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) = a2 & 0xFF403FFF;
  if (v4)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v4;
}

uint64_t pthread_set_qos_class_np(_QWORD *a1, qos_class_t a2, int a3)
{
  if (a1 == (_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224))
  {
    if ((_QWORD *)(*a1 ^ _pthread_ptr_munge_token) != a1)
      abort_with_reason(18, 4, "pthread_t was corrupted", 0);
    return pthread_set_qos_class_self_np(a2, a3);
  }
  else
  {
    return 1;
  }
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  _pthread_priority_split(*(_QWORD *)&__pthread->__opaque[240], __qos_class, __relative_priority);
  return 0;
}

qos_class_t qos_class_self(void)
{
  unsigned int v0;
  char v1;
  unsigned __int8 v2;
  BOOL v4;
  uint64_t v5;

  v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32);
  v4 = 0;
  if ((v5 & 0x22000000) == 0)
    v4 = (v5 & 0x3F00) != 0;
  if (!v4)
    return _pthread_qos_class_from_thread_qos(0);
  v0 = (unint64_t)(v5 & 0x3F00) >> 8;
  v1 = __clz(__rbit32(v0));
  if (v0)
    v2 = v1 + 1;
  else
    v2 = 0;
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_from_thread_qos(unsigned __int8 a1)
{
  if (a1 < 7u)
    return _pthread_qos_class_from_thread_qos_thread_qos_to_qos_class[a1];
  else
    return 0;
}

qos_class_t qos_class_main(void)
{
  unsigned int v0;
  char v1;
  unsigned __int8 v2;
  BOOL v4;

  v4 = 0;
  if ((_main_qos & 0x22000000) == 0)
    v4 = (_main_qos & 0x3F00) != 0;
  if (!v4)
    return _pthread_qos_class_from_thread_qos(0);
  v0 = (unint64_t)(_main_qos & 0x3F00) >> 8;
  v1 = __clz(__rbit32(v0));
  if (v0)
    v2 = v1 + 1;
  else
    v2 = 0;
  return _pthread_qos_class_from_thread_qos(v2);
}

uint64_t _pthread_qos_class_encode(int a1, char a2, int a3)
{
  unsigned int v6;
  unsigned __int8 v7;

  v7 = _pthread_qos_class_to_thread_qos(a1);
  v6 = a3 & 0xFF000000;
  if (v7 && v7 < 7u)
    v6 |= (1 << (v7 + 7)) | (a2 - 1);
  return v6;
}

uint64_t _pthread_qos_class_decode(uint64_t a1, int *a2, _QWORD *a3)
{
  unsigned int v4;
  _QWORD *v5;
  int *v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2;
  v5 = a3;
  v4 = 0;
  _pthread_priority_split(a1, &v4, a2);
  if (v5)
    *v5 = v7 & 0xFF000000;
  return v4;
}

uint64_t _pthread_qos_class_and_override_encode(int a1, char a2, int a3, int a4)
{
  unsigned __int8 v5;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned int v11;

  v5 = _pthread_qos_class_to_thread_qos(a1);
  v10 = _pthread_qos_class_to_thread_qos(a4);
  v11 = a3 & 0xFF000000;
  if (v5 && v5 < 7u)
    v11 |= (1 << (v5 + 7)) | (a2 - 1);
  v9 = v11;
  if (v10 && v10 < 7u)
    return v11 | (1 << (v10 + 13)) | 0x800000;
  return v9;
}

uint64_t _pthread_qos_class_and_override_decode(int a1, int *a2, _QWORD *a3, _DWORD *a4)
{
  unsigned int v4;
  char v5;
  unsigned __int8 v6;
  unsigned int v7;
  char v8;
  unsigned __int8 v9;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  unsigned __int8 v17;
  unsigned __int8 v18;
  int v19;

  v13 = 0;
  if ((a1 & 0x22000000) == 0)
    v13 = (a1 & 0x3F00) != 0;
  if (v13)
  {
    v4 = (unint64_t)(a1 & 0x3F00) >> 8;
    v5 = __clz(__rbit32(v4));
    if (v4)
      v6 = v5 + 1;
    else
      v6 = 0;
    v17 = v6;
  }
  else
  {
    v17 = 0;
  }
  v12 = 0;
  if ((a1 & 0x22000000) == 0)
  {
    v12 = 0;
    if ((a1 & 0x800000) != 0)
      v12 = (a1 & 0x3FC000) != 0;
  }
  if (v12)
  {
    v7 = (a1 & 0x3FC000u) >> 14;
    v8 = __clz(__rbit32(v7));
    if (v7)
      v9 = v8 + 1;
    else
      v9 = 0;
    v18 = v9;
  }
  else
  {
    v18 = 0;
  }
  if (a4)
    *a4 = _pthread_qos_class_from_thread_qos(v18);
  if (a3)
    *a3 = a1 & 0xFF000000;
  if (a2)
  {
    v11 = 0;
    if ((a1 & 0x22000000) == 0)
      v11 = (a1 & 0x3F00) != 0;
    if (v11)
      v19 = (char)a1 + 1;
    else
      v19 = 0;
    *a2 = v19;
  }
  return _pthread_qos_class_from_thread_qos(v17);
}

uint64_t _pthread_sched_pri_encode(int a1, int a2)
{
  return a2 & 0xDF000000 | 0x20000000 | a1;
}

uint64_t _pthread_sched_pri_decode(int a1, _QWORD *a2)
{
  if (a2)
    *a2 = a1 & 0xDF000000;
  if ((a1 & 0x20000000) != 0)
    return (unsigned __int16)a1;
  else
    return 0;
}

uint64_t _pthread_qos_class_encode_workqueue(int a1, int a2)
{
  unsigned __int8 v3;
  unsigned int v4;

  if (a1)
  {
    if (a1 == 1)
    {
      v3 = 4;
    }
    else
    {
      if (a1 != 2)
      {
        if (a1 == 3)
        {
          v3 = 2;
          goto LABEL_11;
        }
        if (a1 != 128)
        {
          qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid priority";
          qword_24058 = a1;
          __break(1u);
          JUMPOUT(0x16FF0);
        }
      }
      v3 = 3;
    }
  }
  else
  {
    v3 = 6;
  }
LABEL_11:
  v4 = HIBYTE(a2) << 24;
  if (v3 <= 6u)
    v4 |= (1 << (v3 + 7)) | 0xFF;
  return v4;
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_properties_self(4, 0, 0);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_properties_self(8, 0, 0);
}

uint64_t pthread_prefer_alternate_cluster_self()
{
  return _pthread_set_properties_self(32, 0, 0);
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  mach_port_t v3;
  mach_vm_address_t address;
  char v6;
  int v7;
  _BYTE v8[5];
  void *v9;
  int v10;
  qos_class_t v11;
  pthread_t v12;
  uint64_t v14;
  int v15;
  int v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t StatusReg;

  v12 = __pthread;
  v11 = __qos_class;
  v10 = __relative_priority;
  v9 = 0;
  v8[4] = 0;
  v7 = 0;
  v6 = 1;
  *(_DWORD *)v8 = _pthread_validate_qos_class_and_relpri(__qos_class, __relative_priority);
  if (!v8[0])
    return 0;
  address = (mach_vm_address_t)malloc(0x20uLL);
  if (address
    || (address = vm_page_size,
        v6 = 0,
        (*(_DWORD *)&v8[1] = mach_vm_allocate(mach_task_self_, &address, (vm_page_size + 31) & ~(vm_page_size - 1), 1241513985)) == 0))
  {
    v9 = (void *)address;
    *(_DWORD *)address = 1870030194;
    *((_QWORD *)v9 + 1) = v12;
    v3 = pthread_mach_thread_np(v12);
    *((_DWORD *)v9 + 1) = v3;
    v17 = v8[0];
    v16 = v10;
    v15 = 0;
    v14 = 0;
    if (v8[0] && v17 < 7u)
    {
      LODWORD(v14) = v14 | (1 << (v17 + 7));
      LODWORD(v14) = v14 | (v16 - 1);
    }
    *((_QWORD *)v9 + 2) = v14;
    *((_BYTE *)v9 + 24) = v6 & 1;
    *(_DWORD *)&v8[1] = mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, 1);
    if (*(_DWORD *)&v8[1])
      v7 = 22;
    if (!v7)
    {
      v7 = __bsdthread_ctl(64, *((unsigned int *)v9 + 1), *((_QWORD *)v9 + 2));
      if (v7)
        mach_port_mod_refs(mach_task_self_, *((_DWORD *)v9 + 1), 0, -1);
    }
    if (v7)
    {
      if ((v6 & 1) != 0)
        free(v9);
      else
        mach_vm_deallocate(mach_task_self_, address, (vm_page_size + 31) & ~(vm_page_size - 1));
      return 0;
    }
    return (pthread_override_t)v9;
  }
  else
  {
    v18 = 1;
    v19 = 1;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    **(_DWORD **)(StatusReg + 8) = 12;
    return 0;
  }
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  int v2;

  if (_pthread_atomic_xchg_uint32_relaxed((unsigned int *)__override, 0x7265766Fu) != 1870030194)
  {
    __break(1u);
    JUMPOUT(0x1746CLL);
  }
  v2 = __bsdthread_ctl(128, *((unsigned int *)__override + 1), __override);
  if (v2 == -1)
    v2 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (v2 == 14)
    v2 = 0;
  if (mach_port_mod_refs(mach_task_self_, *((_DWORD *)__override + 1), 0, -1))
    v2 = 22;
  if ((*((_BYTE *)__override + 24) & 1) != 0)
  {
    free(__override);
  }
  else if (mach_vm_deallocate(mach_task_self_, (mach_vm_address_t)__override, (vm_page_size + 31) & ~(vm_page_size - 1)))
  {
    return 22;
  }
  return v2;
}

uint64_t _pthread_qos_override_start_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  v3 = __bsdthread_ctl(64, a1, a2);
  if (v3 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v3;
}

uint64_t _pthread_qos_override_end_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  v3 = __bsdthread_ctl(128, a1, a2);
  if (v3 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v3;
}

uint64_t _pthread_override_qos_class_start_direct(unsigned int a1, uint64_t a2)
{
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  return _pthread_qos_override_start_direct(a1, a2);
}

uint64_t _pthread_override_qos_class_end_direct(unsigned int a1)
{
  return _pthread_qos_override_end_direct(a1, _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
}

uint64_t _pthread_workqueue_override_start_direct(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  v3 = __bsdthread_ctl(1024, a1, a2);
  if (v3 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v3;
}

uint64_t _pthread_workqueue_override_start_direct_check_owner(unsigned int a1, uint64_t a2, int *a3)
{
  unsigned int v4;

  if (!_pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check)
    a3 = 0;
  while (1)
  {
    while (1)
    {
      v4 = __bsdthread_ctl(1024, a1, a2);
      if (v4 == -1)
        v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      if (!a3 || v4 != 22)
        break;
      if ((unint64_t)a3 % 4)
        return 22;
      _pthread_workqueue_override_start_direct_check_owner_kernel_supports_owner_check = 0;
      a3 = 0;
    }
    if (!a3 || v4 != 14)
      break;
    if (ulock_owner_value_to_port_name(*a3) != a1)
      return 70;
  }
  return v4;
}

uint64_t ulock_owner_value_to_port_name(int a1)
{
  return a1 | 3u;
}

uint64_t _pthread_workqueue_override_reset()
{
  unsigned int v1;

  v1 = __bsdthread_ctl(512, 0, 0);
  if (v1 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v1;
}

uint64_t _pthread_workqueue_asynchronous_override_add(unsigned int a1, uint64_t a2)
{
  unsigned int v3;

  v3 = __bsdthread_ctl(1025, a1, a2);
  if (v3 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v3;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_self(uint64_t a1)
{
  unsigned int v2;

  v2 = __bsdthread_ctl(1026, 0, a1);
  if (v2 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v2;
}

uint64_t _pthread_workqueue_asynchronous_override_reset_all_self()
{
  unsigned int v1;

  v1 = __bsdthread_ctl(1026, 1, 0);
  if (v1 == -1)
    return **(unsigned int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  return v1;
}

uint64_t pthread_qos_max_parallelism(int a1, uint64_t a2)
{
  unsigned __int16 *v3;
  uint64_t v4;
  unsigned __int8 v5;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a1;
  if (!a1)
    v7 = 21;
  v5 = _pthread_qos_class_to_thread_qos(v7);
  if (!v5 || (a2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }
  else
  {
    v4 = 1;
    if (_os_alloc_once_table[32] == -1)
      v9 = _os_alloc_once_table[33];
    else
      v9 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
    v3 = (unsigned __int16 *)(v9 + 272 + 2 * v5);
    if ((a2 & 1) != 0)
    {
      v4 = 0;
      if (_os_alloc_once_table[32] == -1)
        v10 = _os_alloc_once_table[33];
      else
        v10 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
      v3 = (unsigned __int16 *)(v10 + 286 + 2 * v5);
    }
    else if ((a2 & 2) != 0)
    {
      v4 = 4;
      if (_os_alloc_once_table[32] == -1)
        v11 = _os_alloc_once_table[33];
      else
        v11 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
      v3 = (unsigned __int16 *)(v11 + 300 + 2 * v5);
    }
    if (*v3 == 0xFFFF)
      *v3 = _pthread_workqueue_parallelism_for_priority(v5, v4);
    return *v3;
  }
}

uint64_t _pthread_workqueue_parallelism_for_priority(int a1, uint64_t a2)
{
  int v3;
  int v4;
  char v5;

  v5 = a2;
  v3 = __bsdthread_ctl(2048, a1, a2);
  if (v3 == -1)
  {
    v4 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (v4 != 22 && v4 != 45)
    {
      qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: qos_max_parallelism failed";
      qword_24058 = v4;
      __break(1u);
      JUMPOUT(0x17FD0);
    }
    if ((v5 & 1) != 0)
    {
      return MEMORY[0xFFFFFC036];
    }
    else if ((v5 & 4) != 0)
    {
      if (v4 != 45)
      {
        __break(1u);
        JUMPOUT(0x18020);
      }
      return 0;
    }
    else
    {
      return MEMORY[0xFFFFFC035];
    }
  }
  else
  {
    return (unsigned __int16)v3;
  }
}

uint64_t pthread_time_constraint_max_parallelism(char a1)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v3 = 1;
  if (_os_alloc_once_table[32] == -1)
    v6 = _os_alloc_once_table[33];
  else
    v6 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  v2 = (unsigned __int16 *)(v6 + 272);
  if ((a1 & 1) != 0)
  {
    v3 = 0;
    if (_os_alloc_once_table[32] == -1)
      v7 = _os_alloc_once_table[33];
    else
      v7 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
    v2 = (unsigned __int16 *)(v7 + 286);
  }
  else if ((a1 & 2) != 0)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 22;
    return -1;
  }
  if (*v2 == 0xFFFF)
    *v2 = _pthread_workqueue_parallelism_for_priority(0, v3 | 2);
  return *v2;
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  switch(__qos_class)
  {
    case 5u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 3);
    case 9u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 2);
    case 0x11u:
      return posix_spawnattr_set_qos_clamp_np(__attr, 1);
  }
  return 22;
}

int posix_spawnattr_get_qos_class_np(const posix_spawnattr_t *__attr, qos_class_t *__qos_class)
{
  int qos_clamp_np;
  uint64_t v4;
  qos_class_t *v5;
  const posix_spawnattr_t *v6;

  v6 = __attr;
  v5 = __qos_class;
  v4 = 0;
  if (!__qos_class)
    return 22;
  qos_clamp_np = posix_spawnattr_get_qos_clamp_np(v6, &v4);
  if (qos_clamp_np)
    return qos_clamp_np;
  switch(v4)
  {
    case 1:
      *v5 = QOS_CLASS_UTILITY;
      break;
    case 2:
      *v5 = QOS_CLASS_BACKGROUND;
      break;
    case 3:
      *v5 = 5;
      break;
    default:
      *v5 = QOS_CLASS_UNSPECIFIED;
      break;
  }
  return 0;
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  a1->__sig = 1381452865;
  *(_DWORD *)a1->__opaque = 2;
  return 0;
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  int result;

  a1->__sig = 0;
  result = 0;
  *(_DWORD *)a1->__opaque = 0;
  return result;
}

int pthread_rwlockattr_getpshared(const pthread_rwlockattr_t *a1, int *a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1381452865)
  {
    *a2 = *(_DWORD *)a1->__opaque;
    return 0;
  }
  return v3;
}

int pthread_rwlockattr_setpshared(pthread_rwlockattr_t *a1, int a2)
{
  int v3;

  v3 = 22;
  if (a1->__sig == 1381452865 && (a2 == 2 || a2 == 1))
  {
    *(_DWORD *)a1->__opaque = a2;
    return 0;
  }
  return v3;
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  char v1;
  char v2;
  unsigned int v3;
  unsigned __int128 *v4;
  unsigned __int128 v5;
  int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  int v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  pthread_rwlock_t *v17;
  pthread_rwlock_t *v18;
  char *v19;
  unint64_t *v20;
  pthread_rwlock_t *v21;
  unsigned __int128 v22;
  unsigned __int128 v23;
  unsigned __int128 v24;
  int v25;
  unsigned __int128 *v26;
  unint64_t v27;
  BOOL v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int *opaque;
  uint64_t v35;
  uint64_t v36;
  unint64_t StatusReg;
  BOOL v38;
  int v39;
  unsigned int v40;
  int v41;
  unsigned int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v11 = 0;
  opaque = (unsigned int *)a1->__opaque;
  v33 = 327680;
  if (v1)
    v2 = 0;
  else
    v2 = 1;
  if ((v2 & 1) == 0)
    goto LABEL_11;
  v32 = 0;
  v35 = 3;
  v36 = 3;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v32 = *(_QWORD *)(StatusReg + 24);
  v31 = 0;
  v30 = v32;
  v29 = v32;
  do
    v3 = __ldaxr(opaque);
  while (!v3 && __stlxr(v32, opaque));
  if (v3)
    v31 = v3;
  v28 = v3 == 0;
  if (v3)
LABEL_11:
    os_unfair_lock_lock_with_options(opaque, v33);
  if (a1->__sig == 1381452875)
  {
    v17 = a1;
    v16 = 0;
    v21 = a1;
    v20 = &v15;
    v15 = (unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0;
    v13 = 0;
    v14 = 0;
    v27 = v15;
    v26 = (unsigned __int128 *)&v13;
    v25 = 3;
    v24 = 0u;
    v4 = (unsigned __int128 *)v15;
    do
    {
      while (1)
      {
        v5 = __ldxp(v4);
        v6 = (_QWORD)v5 != 0;
        if (*((_QWORD *)&v5 + 1))
          ++v6;
        if (v6)
          break;
        if (!__stxp(0, v4))
          goto LABEL_20;
      }
    }
    while (__stxp(v5, v4));
LABEL_20:
    v23 = v5;
    v24 = v5;
    v22 = v5;
    *v26 = v5;
    if ((v13 & 0xFFFFFF00) != (_DWORD)v14)
      v16 = 16;
    v11 = v16;
  }
  else
  {
    v18 = a1;
    if (a1->__sig != 766030772)
      v11 = 22;
  }
  if (!v11)
    a1->__sig = 0;
  v19 = a1->__opaque;
  v43 = a1->__opaque;
  v42 = 0;
  v44 = 3;
  v45 = 3;
  v46 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v42 = *(_QWORD *)(v46 + 24);
  v41 = 0;
  v40 = v42;
  v7 = (unsigned int *)a1->__opaque;
  v39 = 0;
  v8 = v42;
  do
    v9 = __ldaxr(v7);
  while (v9 == v8 && __stlxr(0, v7));
  if (v9 != v8)
    v40 = v9;
  v38 = v9 == v8;
  if (v9 != v8)
    os_unfair_lock_unlock((os_unfair_lock_t)v43);
  return v11;
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  unsigned __int128 *v2;
  unsigned __int128 v3;
  int v4;
  pthread_rwlock_t *v5;
  pthread_rwlock_t *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  pthread_rwlock_t *v13;
  int v14;
  char *opaque;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  char *v25;
  pthread_rwlock_t *v26;
  const pthread_rwlockattr_t *v27;
  pthread_rwlock_t *v28;
  char **v29;
  pthread_rwlock_t *v30;
  unint64_t *v31;
  pthread_rwlock_t *v32;
  unsigned __int128 v33;
  unsigned __int128 v34;
  unsigned __int128 v35;
  int v36;
  unsigned __int128 *v37;
  unint64_t v38;
  pthread_rwlock_t **v39;
  pthread_rwlock_t *v40;

  v8 = 0;
  if (a2 && a2->__sig != 1381452865)
    v8 = 22;
  if (!v8 && a1->__sig == 1381452875)
  {
    v13 = a1;
    v12 = 0;
    v32 = a1;
    v31 = &v11;
    v11 = (unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0;
    v9 = 0;
    v10 = 0;
    v38 = v11;
    v37 = (unsigned __int128 *)&v9;
    v36 = 3;
    v35 = 0u;
    v2 = (unsigned __int128 *)v11;
    do
    {
      while (1)
      {
        v3 = __ldxp(v2);
        v4 = (_QWORD)v3 != 0;
        if (*((_QWORD *)&v3 + 1))
          ++v4;
        if (v4)
          break;
        if (!__stxp(0, v2))
          goto LABEL_13;
      }
    }
    while (__stxp(v3, v2));
LABEL_13:
    v34 = v3;
    v35 = v3;
    v33 = v3;
    *v37 = v3;
    if ((v9 & 0xFFFFFF00) != (_DWORD)v10)
      v12 = 16;
    v8 = v12;
  }
  if (!v8)
  {
    opaque = a1->__opaque;
    v14 = 0;
    *(_DWORD *)a1->__opaque = 0;
    v28 = a1;
    v27 = a2;
    v40 = a1;
    v39 = &v26;
    v26 = (pthread_rwlock_t *)((unint64_t)&a1->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
    v30 = a1;
    v29 = &v25;
    v25 = (char *)((unint64_t)&a1->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
    if (v26 != (pthread_rwlock_t *)&a1->__opaque[16])
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0xDFFFFFFF | 0x20000000;
      *(_QWORD *)&v28->__opaque[16] = -1;
    }
    if (v25 != &v28->__opaque[24])
    {
      v5 = v28;
      *(_QWORD *)&v28->__opaque[24] = -1;
      *(_QWORD *)&v5->__opaque[32] = -1;
    }
    v6 = v28;
    *(_QWORD *)&v28->__opaque[40] = -1;
    *(_QWORD *)&v6->__opaque[48] = -1;
    v26->__sig = 0;
    *(_QWORD *)&v24 = 0x1000000C0;
    DWORD2(v24) = 0;
    *(_OWORD *)v25 = v24;
    if (v27 && *(_DWORD *)v27->__opaque == 1)
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0x3FFFFFFF | 0x40000000;
      *(_DWORD *)&v28->__opaque[8] = 16;
    }
    else
    {
      *(_DWORD *)&v28->__opaque[4] = *(_DWORD *)&v28->__opaque[4] & 0x3FFFFFFF | 0x80000000;
      *(_DWORD *)&v28->__opaque[8] = 32;
    }
    v23 = 1381452875;
    _platform_bzero(&v28->__opaque[56], 136);
    v22 = v23;
    v21 = ~(unint64_t)v28;
    *(_QWORD *)&v28->__opaque[56] = ~(unint64_t)v28;
    *(_DWORD *)&v28->__opaque[188] = v22;
    *(_DWORD *)&v28->__opaque[12] = v22;
    v20 = (unsigned int *)v28;
    v19 = (unsigned int *)&v23;
    HIDWORD(v28->__sig) = HIDWORD(v23);
    v18 = 0;
    v18 = *v19;
    v17 = v18;
    atomic_store(v18, v20);
    v16 = v18;
    return 0;
  }
  return v8;
}

uint64_t _pthread_rwlock_lock_slow(_QWORD *a1, char a2, char a3)
{
  unsigned __int128 *v3;
  unsigned __int128 v4;
  int v5;
  unsigned __int128 *v6;
  unsigned __int128 v7;
  int v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unsigned int v21;
  char v22;
  char v23;
  _QWORD *v24;
  unsigned int v26;
  _QWORD *v27;
  unsigned int v28;
  _QWORD *v29;
  unint64_t *v30;
  uint64_t v31;
  unsigned __int128 v32;
  unsigned __int128 v33;
  unsigned __int128 v34;
  int v35;
  unsigned __int128 *v36;
  unint64_t v37;
  unsigned __int128 v38;
  unsigned __int128 v39;
  unsigned __int128 v40;
  int v41;
  unsigned __int128 *v42;
  unint64_t v43;
  _QWORD **v44;
  uint64_t v45;
  _BOOL4 v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  unint64_t v52;
  int v53;
  BOOL v54;
  int v55;
  __int128 *v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t StatusReg;

  v24 = a1;
  v23 = a2 & 1;
  v22 = a3 & 1;
  v21 = 0;
  v27 = a1;
  v26 = 0;
  v29 = a1;
  if (*a1 == 1381452875)
    v28 = v26;
  else
    v28 = _pthread_rwlock_check_init_slow((uint64_t)v27);
  v21 = v28;
  if (v28)
  {
    return v21;
  }
  else
  {
    v31 = (uint64_t)v24;
    v30 = &v20;
    v20 = ((unint64_t)v24 + 47) & 0xFFFFFFFFFFFFFFF0;
    v19 = 0uLL;
    v18 = 0uLL;
    v43 = v20;
    v42 = (unsigned __int128 *)&v19;
    v41 = 3;
    v40 = 0u;
    v3 = (unsigned __int128 *)v20;
    do
    {
      while (1)
      {
        v4 = __ldxp(v3);
        v5 = (_QWORD)v4 != 0;
        if (*((_QWORD *)&v4 + 1))
          ++v5;
        if (v5)
          break;
        if (!__stxp(0, v3))
          goto LABEL_13;
      }
    }
    while (__stxp(v4, v3));
LABEL_13:
    v39 = v4;
    v40 = v4;
    v38 = v4;
    *v42 = v4;
    v45 = (uint64_t)v24;
    v44 = &v17;
    v17 = (_QWORD *)(((unint64_t)v24 + 31) & 0xFFFFFFFFFFFFFFF8);
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v16 = *(_QWORD *)(StatusReg - 8);
    if ((v19 & 2) != 0 && *v17 == v16)
    {
      return 11;
    }
    else
    {
      do
      {
        v15 = 0;
        while (1)
        {
          v18 = v19;
          if ((v23 & 1) != 0)
            v14 = (v19 & 5) == 0;
          else
            v14 = (v19 & 0x40) != 0;
          if ((v22 & 1) != 0 && !v14)
            goto LABEL_43;
          if (!v14)
            break;
          if ((v23 & 1) == 0)
          {
            LODWORD(v18) = v18 & 0xFFFFFF00;
            LODWORD(v18) = v18 | 0x83;
            goto LABEL_37;
          }
          if (diff_genseq(v19, SDWORD2(v19)) < 0xFFFFFF00)
          {
            LODWORD(v18) = v18 & 0xFFFFFFBF;
LABEL_37:
            LODWORD(v18) = v18 + 256;
            DWORD1(v18) += 256;
            goto LABEL_43;
          }
          if (++v15 > 1024)
            return 35;
          sched_yield();
          v37 = v20;
          v36 = (unsigned __int128 *)&v19;
          v35 = 3;
          v34 = 0u;
          v6 = (unsigned __int128 *)v20;
          do
          {
            while (1)
            {
              v7 = __ldxp(v6);
              v8 = (_QWORD)v7 != 0;
              if (*((_QWORD *)&v7 + 1))
                ++v8;
              if (v8)
                break;
              if (!__stxp(0, v6))
                goto LABEL_34;
            }
          }
          while (__stxp(v7, v6));
LABEL_34:
          v33 = v7;
          v34 = v7;
          v32 = v7;
          *v36 = v7;
        }
        if ((v23 & 1) != 0)
          LODWORD(v18) = v18 & 0xFFFFFFBF;
        else
          LODWORD(v18) = v18 | 5;
        LODWORD(v18) = v18 + 256;
        if ((BYTE4(v19) & 1) != 0)
        {
          DWORD1(v18) = BYTE4(v18) & 0xFE;
          DWORD1(v18) |= v19 & 0xFFFFFF00;
        }
LABEL_43:
        v58 = v20;
        v57 = (unint64_t *)&v19;
        v56 = &v18;
        v55 = 1;
        v54 = 0;
        v53 = 0;
        v52 = v19;
        v51 = 0;
        v9 = (unint64_t *)v20;
        v49 = v18;
        v48 = v18;
        v50 = v18;
        v10 = v19;
        v11 = v18;
        do
          v12 = __ldaxr(v9);
        while (v12 == v10 && __stlxr(v11, v9));
        if (v12 != v10)
          v52 = v12;
        v47 = v12 == v10;
        v51 = v12 == v10;
        *v57 = v52;
        v46 = v51;
        v54 = v51;
        if (v51)
          v53 = 1;
      }
      while (!v53);
      if (v14)
      {
        if ((v23 & 1) == 0)
          *v17 = v16;
        return 0;
      }
      else if ((v22 & 1) != 0)
      {
        return 16;
      }
      else
      {
        return _pthread_rwlock_lock_wait((uint64_t)v24, v23 & 1, v18, DWORD2(v18));
      }
    }
  }
}

uint64_t _pthread_rwlock_lock_wait(uint64_t a1, char a2, uint64_t a3, unsigned int a4)
{
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v9;
  int v10;
  __int128 v15;
  __int128 v16;
  unint64_t *v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  unint64_t **v21;
  uint64_t v22;
  int v23;
  __int128 *v24;
  unint64_t *v25;
  _BOOL4 v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  unint64_t v32;
  int v33;
  BOOL v34;
  int v35;
  __int128 *v36;
  unint64_t *v37;
  unint64_t *v38;

  do
  {
    if ((a2 & 1) != 0)
      v9 = __psynch_rw_rdlock(a1, a3, a4, HIDWORD(a3), *(unsigned int *)(a1 + 16));
    else
      v9 = __psynch_rw_wrlock(a1, a3, a4, HIDWORD(a3), *(unsigned int *)(a1 + 16));
    if (v9 == -1)
      v10 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    else
      v10 = 0;
  }
  while (v10 == 4);
  if (v10)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwlock returned unknown error";
    qword_24058 = v10;
    __break(1u);
    JUMPOUT(0x19E90);
  }
  v20 = a1;
  v19 = v9;
  v18 = (v9 & 0x40) != 0;
  v22 = a1;
  v21 = &v17;
  v17 = (unint64_t *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
  v16 = 0uLL;
  v15 = 0uLL;
  v25 = v17;
  v24 = &v16;
  v23 = 1;
  *(_QWORD *)&v16 = *v17;
  do
  {
    v15 = v16;
    if (v18 || (BYTE4(v16) & 2) != 0)
    {
      LODWORD(v15) = _pthread_rwlock_modbits(v16, v19, BYTE4(v16) & 4);
      DWORD1(v15) += v19 & 0xFFFFFF00;
      if (!v18)
        DWORD1(v15) &= 0xFFFFFF00;
      DWORD1(v15) &= ~4u;
    }
    v38 = v17;
    v37 = (unint64_t *)&v16;
    v36 = &v15;
    v35 = 1;
    v34 = 0;
    v33 = 0;
    v32 = v16;
    v31 = 0;
    v4 = v17;
    v29 = v15;
    v28 = v15;
    v30 = v15;
    v5 = v16;
    v6 = v15;
    do
      v7 = __ldaxr(v4);
    while (v7 == v5 && __stlxr(v6, v4));
    if (v7 != v5)
      v32 = v7;
    v27 = v7 == v5;
    v31 = v7 == v5;
    *v37 = v32;
    v26 = v31;
    v34 = v31;
    if (v31)
      v33 = 1;
  }
  while (!v33);
  return 0;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  unint64_t *v10;
  char v11;
  char v12;
  pthread_rwlock_t *v13;
  pthread_rwlock_t *v15;
  unint64_t **v16;
  pthread_rwlock_t *v17;
  _QWORD **v18;
  pthread_rwlock_t *v19;
  _BOOL4 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  __int128 *v30;
  unint64_t *v31;
  unint64_t *v32;
  int v33;
  __int128 *v34;
  unint64_t *v35;
  unint64_t StatusReg;

  v13 = a1;
  v12 = 1;
  v11 = 0;
  v15 = a1;
  if (a1->__sig != 1381452875)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v17 = v13;
  v16 = &v10;
  v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  v9 = 0uLL;
  v8 = 0uLL;
  v35 = v10;
  v34 = &v9;
  v33 = 3;
  v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v7 = 0;
  do
  {
    v8 = v9;
    if ((v12 & 1) != 0)
      v7 = (v9 & 5) == 0;
    else
      v7 = (v9 & 0x40) != 0;
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7)
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      if ((v12 & 1) != 0)
      {
        if (diff_genseq(v9, SDWORD2(v9)) >= 0xFFFFFF00)
          return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }
      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }
    v32 = v10;
    v31 = (unint64_t *)&v9;
    v30 = &v8;
    v29 = 1;
    v28 = 0;
    v27 = 0;
    v26 = v9;
    v25 = 0;
    v1 = v10;
    v23 = v8;
    v22 = v8;
    v24 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v26 = v4;
    v21 = v4 == v2;
    v25 = v4 == v2;
    *v31 = v26;
    v20 = v25;
    v28 = v25;
    if (v25)
      v27 = 1;
  }
  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      v19 = v13;
      v18 = &v6;
      v6 = (_QWORD *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *v6 = *(_QWORD *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1A588);
    }
    return 16;
  }
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  unint64_t *v10;
  char v11;
  char v12;
  pthread_rwlock_t *v13;
  pthread_rwlock_t *v15;
  unint64_t **v16;
  pthread_rwlock_t *v17;
  _QWORD **v18;
  pthread_rwlock_t *v19;
  _BOOL4 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  __int128 *v30;
  unint64_t *v31;
  unint64_t *v32;
  int v33;
  __int128 *v34;
  unint64_t *v35;
  unint64_t StatusReg;

  v13 = a1;
  v12 = 1;
  v11 = 1;
  v15 = a1;
  if (a1->__sig != 1381452875)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v17 = v13;
  v16 = &v10;
  v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  v9 = 0uLL;
  v8 = 0uLL;
  v35 = v10;
  v34 = &v9;
  v33 = 3;
  v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v7 = 0;
  do
  {
    v8 = v9;
    if ((v12 & 1) != 0)
      v7 = (v9 & 5) == 0;
    else
      v7 = (v9 & 0x40) != 0;
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7)
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      if ((v12 & 1) != 0)
      {
        if (diff_genseq(v9, SDWORD2(v9)) >= 0xFFFFFF00)
          return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }
      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }
    v32 = v10;
    v31 = (unint64_t *)&v9;
    v30 = &v8;
    v29 = 1;
    v28 = 0;
    v27 = 0;
    v26 = v9;
    v25 = 0;
    v1 = v10;
    v23 = v8;
    v22 = v8;
    v24 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v26 = v4;
    v21 = v4 == v2;
    v25 = v4 == v2;
    *v31 = v26;
    v20 = v25;
    v28 = v25;
    if (v25)
      v27 = 1;
  }
  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      v19 = v13;
      v18 = &v6;
      v6 = (_QWORD *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *v6 = *(_QWORD *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1AC80);
    }
    return 16;
  }
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  unint64_t *v10;
  char v11;
  char v12;
  pthread_rwlock_t *v13;
  pthread_rwlock_t *v15;
  unint64_t **v16;
  pthread_rwlock_t *v17;
  _QWORD **v18;
  pthread_rwlock_t *v19;
  _BOOL4 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  __int128 *v30;
  unint64_t *v31;
  unint64_t *v32;
  int v33;
  __int128 *v34;
  unint64_t *v35;
  unint64_t StatusReg;

  v13 = a1;
  v12 = 0;
  v11 = 0;
  v15 = a1;
  if (a1->__sig != 1381452875)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v17 = v13;
  v16 = &v10;
  v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  v9 = 0uLL;
  v8 = 0uLL;
  v35 = v10;
  v34 = &v9;
  v33 = 3;
  v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v7 = 0;
  do
  {
    v8 = v9;
    if ((v12 & 1) != 0)
      v7 = (v9 & 5) == 0;
    else
      v7 = (v9 & 0x40) != 0;
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7)
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      if ((v12 & 1) != 0)
      {
        if (diff_genseq(v9, SDWORD2(v9)) >= 0xFFFFFF00)
          return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }
      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }
    v32 = v10;
    v31 = (unint64_t *)&v9;
    v30 = &v8;
    v29 = 1;
    v28 = 0;
    v27 = 0;
    v26 = v9;
    v25 = 0;
    v1 = v10;
    v23 = v8;
    v22 = v8;
    v24 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v26 = v4;
    v21 = v4 == v2;
    v25 = v4 == v2;
    *v31 = v26;
    v20 = v25;
    v28 = v25;
    if (v25)
      v27 = 1;
  }
  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      v19 = v13;
      v18 = &v6;
      v6 = (_QWORD *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *v6 = *(_QWORD *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1B374);
    }
    return 16;
  }
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  unint64_t *v10;
  char v11;
  char v12;
  pthread_rwlock_t *v13;
  pthread_rwlock_t *v15;
  unint64_t **v16;
  pthread_rwlock_t *v17;
  _QWORD **v18;
  pthread_rwlock_t *v19;
  _BOOL4 v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  __int128 *v30;
  unint64_t *v31;
  unint64_t *v32;
  int v33;
  __int128 *v34;
  unint64_t *v35;
  unint64_t StatusReg;

  v13 = a1;
  v12 = 0;
  v11 = 1;
  v15 = a1;
  if (a1->__sig != 1381452875)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v17 = v13;
  v16 = &v10;
  v10 = (unint64_t *)((unint64_t)&v13->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  v9 = 0uLL;
  v8 = 0uLL;
  v35 = v10;
  v34 = &v9;
  v33 = 3;
  v9 = *(_OWORD *)v10;
  if ((v9 & 2) != 0)
    return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
  v7 = 0;
  do
  {
    v8 = v9;
    if ((v12 & 1) != 0)
      v7 = (v9 & 5) == 0;
    else
      v7 = (v9 & 0x40) != 0;
    if ((v11 & 1) == 0 || v7)
    {
      if (!v7)
        return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
      if ((v12 & 1) != 0)
      {
        if (diff_genseq(v9, SDWORD2(v9)) >= 0xFFFFFF00)
          return _pthread_rwlock_lock_slow(v13, v12 & 1, v11 & 1);
        LODWORD(v8) = v8 & 0xFFFFFFBF;
      }
      else
      {
        LODWORD(v8) = v8 & 0xFFFFFF00;
        LODWORD(v8) = v8 | 0x83;
      }
      LODWORD(v8) = v8 + 256;
      DWORD1(v8) += 256;
    }
    v32 = v10;
    v31 = (unint64_t *)&v9;
    v30 = &v8;
    v29 = 1;
    v28 = 0;
    v27 = 0;
    v26 = v9;
    v25 = 0;
    v1 = v10;
    v23 = v8;
    v22 = v8;
    v24 = v8;
    v2 = v9;
    v3 = v8;
    do
      v4 = __ldaxr(v1);
    while (v4 == v2 && __stlxr(v3, v1));
    if (v4 != v2)
      v26 = v4;
    v21 = v4 == v2;
    v25 = v4 == v2;
    *v31 = v26;
    v20 = v25;
    v28 = v25;
    if (v25)
      v27 = 1;
  }
  while (!v27);
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
      v19 = v13;
      v18 = &v6;
      v6 = (_QWORD *)((unint64_t)&v13->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *v6 = *(_QWORD *)(StatusReg - 8);
    }
    return 0;
  }
  else
  {
    if ((v11 & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x1BA6CLL);
    }
    return 16;
  }
}

uint64_t _pthread_rwlock_unlock_slow(_QWORD *a1, int a2)
{
  unsigned __int128 *v2;
  unsigned __int128 v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int128 v8;
  int v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v19;
  int v20;
  char v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  int v26;
  unsigned int v27;
  int v28;
  _QWORD *v29;
  unsigned int v31;
  _QWORD *v32;
  unsigned int v33;
  _QWORD *v34;
  _OWORD **v35;
  uint64_t v36;
  _QWORD **v37;
  uint64_t v38;
  int v39;
  __int128 *v40;
  _OWORD *v41;
  _BOOL4 v42;
  BOOL v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  _BOOL4 v47;
  unsigned int v48;
  _BOOL4 v49;
  BOOL v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BOOL4 v54;
  unint64_t v55;
  _BOOL4 v56;
  BOOL v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BOOL4 v61;
  unsigned __int128 v62;
  int v63;
  BOOL v64;
  int v65;
  __int128 *v66;
  unsigned __int128 *v67;
  _OWORD *v68;

  v29 = a1;
  v28 = a2;
  v27 = 0;
  v26 = 3;
  v32 = a1;
  v31 = 0;
  v34 = a1;
  if (*a1 == 1381452875)
    v33 = v31;
  else
    v33 = _pthread_rwlock_check_init_slow((uint64_t)v32);
  v27 = v33;
  if (v33)
  {
    return v27;
  }
  else
  {
    v36 = (uint64_t)v29;
    v35 = &v25;
    v25 = (_OWORD *)(((unint64_t)v29 + 47) & 0xFFFFFFFFFFFFFFF0);
    v24 = 0uLL;
    v23 = 0uLL;
    v41 = v25;
    v40 = &v24;
    v39 = v26;
    v24 = *v25;
    if ((v24 & 0x40) != 0)
    {
      return 0;
    }
    else
    {
      if ((v24 & 2) != 0)
      {
        v38 = (uint64_t)v29;
        v37 = &v22;
        v22 = (_QWORD *)(((unint64_t)v29 + 31) & 0xFFFFFFFFFFFFFFF8);
        *v22 = 0;
      }
      do
      {
        v26 &= ~v28;
        v23 = v24;
        if ((v26 & 2) != 0)
          DWORD2(v23) += 256;
        v21 = 0;
        v20 = v24 & 0xFFFFFF00;
        if (DWORD2(v23) == (v24 & 0xFFFFFF00))
        {
          LODWORD(v23) = v20 | 0xC0;
          DWORD1(v23) = v20 | 1;
        }
        else if ((v24 & 7) != 0 && DWORD2(v23) == (DWORD1(v24) & 0xFFFFFF00))
        {
          v21 = 1;
          LODWORD(v23) = v20 | 1;
          DWORD1(v23) |= 2u;
          if ((v24 & 4) != 0)
            DWORD1(v23) |= 4u;
        }
        v19 = v26;
        v68 = v25;
        v67 = (unsigned __int128 *)&v24;
        v66 = &v23;
        v65 = v26;
        v64 = 0;
        v63 = 0;
        switch(v26)
        {
          case 1:
            v55 = 0;
            v55 = *(_QWORD *)v67;
            v54 = 0;
            v10 = (unint64_t *)v68;
            v52 = 0;
            v52 = *(_QWORD *)v66;
            v51 = v52;
            v53 = v52;
            v11 = v55;
            v12 = v52;
            do
              v13 = __ldaxr(v10);
            while (v13 == v11 && __stlxr(v12, v10));
            if (v13 != v11)
              v55 = v13;
            v50 = v13 == v11;
            v54 = v13 == v11;
            *(_QWORD *)v67 = v55;
            v49 = v54;
            v64 = v54;
            if (v54)
              v63 = 1;
            break;
          case 2:
            v48 = 0;
            v48 = *((_DWORD *)v67 + 2);
            v47 = 0;
            v14 = (unsigned int *)v68 + 2;
            v45 = 0;
            v45 = *((_DWORD *)v66 + 2);
            v44 = v45;
            v46 = v45;
            v15 = v48;
            v16 = v45;
            do
              v17 = __ldaxr(v14);
            while (v17 == v15 && __stlxr(v16, v14));
            if (v17 != v15)
              v48 = v17;
            v43 = v17 == v15;
            v47 = v17 == v15;
            *((_DWORD *)v67 + 2) = v48;
            v42 = v47;
            v64 = v47;
            if (v47)
              v63 = 2;
            break;
          case 3:
            v62 = 0u;
            v62 = *v67;
            v61 = 0;
            v2 = v68;
            v59 = 0u;
            v59 = *v66;
            v58 = v59;
            v60 = v59;
            v3 = v62;
            v4 = *((_QWORD *)&v62 + 1);
            v5 = v62;
            v6 = *((_QWORD *)&v59 + 1);
            v7 = v59;
            do
            {
              while (1)
              {
                v8 = __ldxp(v2);
                v9 = (_QWORD)v8 != v5;
                if (*((_QWORD *)&v8 + 1) != v4)
                  ++v9;
                if (v9)
                  break;
                if (!__stlxp(__PAIR128__(v6, v7), v2))
                  goto LABEL_28;
              }
            }
            while (__stlxp(v8, v2));
LABEL_28:
            if (v8 != v3)
              v62 = v8;
            v57 = v8 == v3;
            v61 = v57;
            *v67 = v62;
            v56 = v61;
            v64 = v61;
            if (v61)
              v63 = 3;
            break;
          default:
            __break(1u);
            JUMPOUT(0x1C138);
        }
        v28 = v63;
      }
      while (v19 != v63);
      if ((v21 & 1) != 0)
        return _pthread_rwlock_unlock_drop((uint64_t)v29, v24, *((uint64_t *)&v24 + 1), v23, DWORD2(v23));
      return v27;
    }
  }
}

uint64_t _pthread_rwlock_unlock_drop(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  int v6;
  unsigned int v8;

  v8 = HIDWORD(a4);
  do
  {
    if (__psynch_rw_unlock(a1, a2, a5, v8, *(unsigned int *)(a1 + 16)) == -1)
      v6 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    else
      v6 = 0;
  }
  while (v6 == 4);
  if (v6)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: kernel rwunlock returned unknown error";
    qword_24058 = v6;
    __break(1u);
    JUMPOUT(0x1C2B4);
  }
  return 0;
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  unsigned __int128 *v1;
  unsigned __int128 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int128 v7;
  int v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v18;
  BOOL v19;
  int v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  _OWORD *v24;
  int v25;
  int v26;
  pthread_rwlock_t *v27;
  pthread_rwlock_t *v29;
  _OWORD **v30;
  pthread_rwlock_t *v31;
  _QWORD **v32;
  pthread_rwlock_t *v33;
  int v34;
  __int128 *v35;
  _OWORD *v36;
  _BOOL4 v37;
  BOOL v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  _BOOL4 v42;
  unsigned int v43;
  _BOOL4 v44;
  BOOL v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _BOOL4 v49;
  unint64_t v50;
  _BOOL4 v51;
  BOOL v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BOOL4 v56;
  unsigned __int128 v57;
  int v58;
  BOOL v59;
  int v60;
  __int128 *v61;
  unsigned __int128 *v62;
  _OWORD *v63;

  v27 = a1;
  v26 = 3;
  v25 = 0;
  v29 = a1;
  if (a1->__sig != 1381452875)
    return _pthread_rwlock_unlock_slow(v27, v25);
  v31 = v27;
  v30 = &v24;
  v24 = (_OWORD *)((unint64_t)&v27->__opaque[39] & 0xFFFFFFFFFFFFFFF0);
  v23 = 0uLL;
  v22 = 0uLL;
  v36 = v24;
  v35 = &v23;
  v34 = v26;
  v23 = *v24;
  if ((v23 & 0x40) != 0)
    return 0;
  if ((v23 & 2) != 0)
  {
    v33 = v27;
    v32 = &v21;
    v21 = (_QWORD *)((unint64_t)&v27->__opaque[23] & 0xFFFFFFFFFFFFFFF8);
    *v21 = 0;
  }
  do
  {
    if (v25)
      return _pthread_rwlock_unlock_slow(v27, v25);
    v22 = v23;
    if ((v26 & 2) != 0)
      DWORD2(v22) += 256;
    v20 = v23 & 0xFFFFFF00;
    if (DWORD2(v22) == (v23 & 0xFFFFFF00))
    {
      LODWORD(v22) = v20 | 0xC0;
      DWORD1(v22) = v20 | 1;
    }
    else
    {
      v19 = 1;
      if ((v23 & 7) != 0)
        v19 = DWORD2(v22) != (DWORD1(v23) & 0xFFFFFF00);
      if (!v19)
        return _pthread_rwlock_unlock_slow(v27, v25);
    }
    v18 = v26;
    v63 = v24;
    v62 = (unsigned __int128 *)&v23;
    v61 = &v22;
    v60 = v26;
    v59 = 0;
    v58 = 0;
    switch(v26)
    {
      case 1:
        v50 = 0;
        v50 = *(_QWORD *)v62;
        v49 = 0;
        v9 = (unint64_t *)v63;
        v47 = 0;
        v47 = *(_QWORD *)v61;
        v46 = v47;
        v48 = v47;
        v10 = v50;
        v11 = v47;
        do
          v12 = __ldaxr(v9);
        while (v12 == v10 && __stlxr(v11, v9));
        if (v12 != v10)
          v50 = v12;
        v45 = v12 == v10;
        v49 = v12 == v10;
        *(_QWORD *)v62 = v50;
        v44 = v49;
        v59 = v49;
        if (v49)
          v58 = 1;
        break;
      case 2:
        v43 = 0;
        v43 = *((_DWORD *)v62 + 2);
        v42 = 0;
        v13 = (unsigned int *)v63 + 2;
        v40 = 0;
        v40 = *((_DWORD *)v61 + 2);
        v39 = v40;
        v41 = v40;
        v14 = v43;
        v15 = v40;
        do
          v16 = __ldaxr(v13);
        while (v16 == v14 && __stlxr(v15, v13));
        if (v16 != v14)
          v43 = v16;
        v38 = v16 == v14;
        v42 = v16 == v14;
        *((_DWORD *)v62 + 2) = v43;
        v37 = v42;
        v59 = v42;
        if (v42)
          v58 = 2;
        break;
      case 3:
        v57 = 0u;
        v57 = *v62;
        v56 = 0;
        v1 = v63;
        v54 = 0u;
        v54 = *v61;
        v53 = v54;
        v55 = v54;
        v2 = v57;
        v3 = *((_QWORD *)&v57 + 1);
        v4 = v57;
        v5 = *((_QWORD *)&v54 + 1);
        v6 = v54;
        do
        {
          while (1)
          {
            v7 = __ldxp(v1);
            v8 = (_QWORD)v7 != v4;
            if (*((_QWORD *)&v7 + 1) != v3)
              ++v8;
            if (v8)
              break;
            if (!__stlxp(__PAIR128__(v5, v6), v1))
              goto LABEL_26;
          }
        }
        while (__stlxp(v7, v1));
LABEL_26:
        if (v7 != v2)
          v57 = v7;
        v52 = v7 == v2;
        v56 = v52;
        *v62 = v57;
        v51 = v56;
        v59 = v56;
        if (v56)
          v58 = 3;
        break;
      default:
        __break(1u);
        JUMPOUT(0x1C928);
    }
    v25 = v58;
  }
  while (v18 != v58);
  return 0;
}

uint64_t _pthread_rwlock_check_init_slow(uint64_t a1)
{
  BOOL v1;
  char v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v10;
  unsigned int *v12;
  _DWORD v13[3];
  __int128 v14;
  _OWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD **v19;
  uint64_t v20;
  _QWORD **v21;
  uint64_t v22;
  BOOL v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t StatusReg;
  BOOL v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  os_unfair_lock_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  v10 = 22;
  v1 = *(_QWORD *)a1 == 766030772;
  if (*(_QWORD *)a1 == 766030772)
  {
    v29 = (unsigned int *)(a1 + 8);
    v28 = 327680;
    v2 = !v1;
    if ((v2 & 1) == 0)
      goto LABEL_12;
    v27 = 0;
    v30 = 3;
    v31 = 3;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v27 = *(_QWORD *)(StatusReg + 24);
    v26 = 0;
    v25 = v27;
    v24 = v27;
    do
      v3 = __ldaxr(v29);
    while (!v3 && __stlxr(v27, v29));
    if (v3)
      v26 = v3;
    v23 = v3 == 0;
    if (v3)
LABEL_12:
      os_unfair_lock_lock_with_options(v29, v28);
    if (*(_QWORD *)a1 == 766030772)
    {
      v18 = a1;
      v17 = 0;
      v22 = a1;
      v21 = &v16;
      v16 = (_QWORD *)((a1 + 31) & 0xFFFFFFFFFFFFFFF8);
      v20 = a1;
      v19 = &v15;
      v15 = (_OWORD *)((a1 + 47) & 0xFFFFFFFFFFFFFFF0);
      if (v16 != (_QWORD *)(a1 + 24))
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0xDFFFFFFF | 0x20000000;
        *(_QWORD *)(v18 + 24) = -1;
      }
      if (v15 != (_OWORD *)(v18 + 32))
      {
        v4 = v18;
        *(_QWORD *)(v18 + 32) = -1;
        *(_QWORD *)(v4 + 40) = -1;
      }
      v5 = v18;
      *(_QWORD *)(v18 + 48) = -1;
      *(_QWORD *)(v5 + 56) = -1;
      *v16 = 0;
      *(_QWORD *)&v14 = 0x1000000C0;
      DWORD2(v14) = 0;
      *v15 = v14;
      if (v17 && *(_DWORD *)(v17 + 8) == 1)
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0x3FFFFFFF | 0x40000000;
        *(_DWORD *)(v18 + 16) = 16;
      }
      else
      {
        *(_DWORD *)(v18 + 12) = *(_DWORD *)(v18 + 12) & 0x3FFFFFFF | 0x80000000;
        *(_DWORD *)(v18 + 16) = 32;
      }
      BYTE1(v13[2]) = 0;
      HIWORD(v13[2]) = 0;
      _platform_bzero(v18 + 64, 136);
      strcpy((char *)v13, "KLWRKLWR");
      *(_QWORD *)(v18 + 64) = ~v18;
      *(_DWORD *)(v18 + 196) = v13[0];
      *(_DWORD *)(v18 + 20) = v13[0];
      v12 = (unsigned int *)v18;
      *(_DWORD *)(v18 + 4) = v13[2];
      atomic_store(v13[1], v12);
      v10 = 0;
    }
    else if (*(_QWORD *)a1 == 1381452875)
    {
      v10 = 0;
    }
    v38 = (os_unfair_lock_t)(a1 + 8);
    v37 = 0;
    v39 = 3;
    v40 = 3;
    v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v37 = *(_QWORD *)(v41 + 24);
    v36 = 0;
    v35 = v37;
    v6 = (unsigned int *)(a1 + 8);
    v34 = 0;
    v7 = v37;
    do
      v8 = __ldaxr(v6);
    while (v8 == v7 && __stlxr(0, v6));
    if (v8 != v7)
      v35 = v8;
    v33 = v8 == v7;
    if (v8 != v7)
      os_unfair_lock_unlock(v38);
  }
  else if (*(_QWORD *)a1 == 1381452875)
  {
    return 0;
  }
  return v10;
}

uint64_t _pthread_rwlock_modbits(int a1, unsigned __int8 a2, int a3)
{
  int v4;

  v4 = (a1 | a2) & 0xBF;
  if ((a2 & 1) == 0 && (a1 & 4) == 0)
    v4 = (a1 | a2) & 0xBE;
  if (a3 && (a3 & 4) != 0 && (v4 & 4) == 0 && (v4 & 2) == 0)
    v4 |= 5u;
  return a1 & 0xFFFFFF00 | v4;
}

uint64_t pthread_chdir_np(uint64_t a1)
{
  return __pthread_chdir(a1);
}

uint64_t pthread_fchdir_np(unsigned int a1)
{
  return __pthread_fchdir(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  pthread_key_t i;
  int v4;

  v4 = 35;
  os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680);
  for (i = 256; i < 0x300; ++i)
  {
    if ((_pthread_key_set_destructor(i, (uint64_t)a2) & 1) != 0)
    {
      *a1 = i;
      v4 = 0;
      break;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v4;
}

uint64_t _pthread_key_set_destructor(uint64_t a1, uint64_t a2)
{
  char v3;

  if (_pthread_keys[a1])
  {
    v3 = 0;
  }
  else
  {
    _pthread_keys[a1] = ~a2;
    v3 = 1;
  }
  return v3 & 1;
}

int pthread_key_delete(pthread_key_t a1)
{
  int *i;
  int v3;

  v3 = 22;
  os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680);
  if (a1 >= 0x100 && a1 < 0x300 && (_pthread_key_unset_destructor(a1) & 1) != 0)
  {
    os_unfair_lock_lock_with_options(&_pthread_list_lock, 327680);
    for (i = __pthread_head; i; i = (int *)*((_QWORD *)i + 2))
      *(_QWORD *)&i[2 * a1 + 56] = 0;
    os_unfair_lock_unlock(&_pthread_list_lock);
    v3 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
  return v3;
}

uint64_t _pthread_key_unset_destructor(uint64_t a1)
{
  char v2;

  if (_pthread_keys[a1])
  {
    _pthread_keys[a1] = 0;
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  return v2 & 1;
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224, a1, (uint64_t)a2);
}

uint64_t _pthread_setspecific(uint64_t a1, unint64_t a2, uint64_t a3)
{
  char v4;
  unsigned int v5;

  v5 = 22;
  if (a2 >= 0xA && a2 < 0x300)
  {
    v4 = _pthread_key_get_destructor(a2, 0) & 1;
    if (a2 < 0x100 || (v4 & 1) != 0)
    {
      *(_QWORD *)(a1 + 224 + 8 * a2) = a3;
      v5 = 0;
      if (a2 < 0x100)
        _pthread_key_set_destructor(a2, 0);
      if (a2 > *(unsigned __int16 *)(a1 + 76))
        *(_WORD *)(a1 + 76) = a2;
    }
  }
  return v5;
}

uint64_t _pthread_setspecific_static(unint64_t a1, uint64_t a2)
{
  unsigned int v3;

  v3 = 22;
  if (a1 < 0x100)
  {
    *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1) = a2;
    return 0;
  }
  return v3;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * a1);
}

int pthread_introspection_setspecific_np(pthread_t thread, pthread_key_t key, const void *value)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_setspecific_np outside of a CREATE"
                           " introspection hook";
    __break(1u);
    JUMPOUT(0x1D558);
  }
  return _pthread_setspecific((uint64_t)thread, key, (uint64_t)value);
}

pthread_t _pthread_self()
{
  return pthread_self();
}

void *__cdecl pthread_introspection_getspecific_np(pthread_t thread, pthread_key_t key)
{
  if (*(_WORD *)&_pthread_self()->__opaque[34] != 4)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Calling pthread_introspection_getspecific_np outside of a DESTRO"
                           "Y introspection hook";
    __break(1u);
    JUMPOUT(0x1D5E4);
  }
  return *(void **)&thread->__opaque[8 * key + 208];
}

uint64_t _pthread_tsd_cleanup(uint64_t a1)
{
  return _pthread_tsd_cleanup_new(a1);
}

uint64_t _pthread_tsd_cleanup_new(uint64_t result)
{
  unint64_t j;
  unint64_t k;
  unint64_t m;
  int i;
  uint64_t v5;

  v5 = result;
  for (i = 0; i < 4; ++i)
  {
    for (j = 256; j <= *(unsigned __int16 *)(v5 + 76); ++j)
      result = _pthread_tsd_cleanup_key(v5, j);
    for (k = 125; k <= 0xD1; ++k)
      result = _pthread_tsd_cleanup_key(v5, k);
    for (m = 10; m <= __pthread_tsd_max; ++m)
      result = _pthread_tsd_cleanup_key(v5, m);
  }
  *(_WORD *)(v5 + 76) = 0;
  return result;
}

uint64_t pthread_key_init_np(int a1, uint64_t a2)
{
  unsigned int v3;

  v3 = 22;
  if (a1 >= 10 && a1 < 256)
  {
    os_unfair_lock_lock_with_options(&__pthread_tsd_lock, 327680);
    _pthread_key_set_destructor(a1, a2);
    if (a1 > __pthread_tsd_max)
      __pthread_tsd_max = a1;
    os_unfair_lock_unlock((os_unfair_lock_t)&__pthread_tsd_lock);
    return 0;
  }
  return v3;
}

pthread_t pthread_self(void)
{
  _opaque_pthread_t *v1;

  v1 = (_opaque_pthread_t *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224);
  if ((_opaque_pthread_t *)(v1->__sig ^ _pthread_ptr_munge_token) != v1)
    abort_with_reason(18, 4, "pthread_t was corrupted", 0);
  return v1;
}

uint64_t _pthread_key_get_destructor(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;

  v3 = _pthread_keys[a1];
  if (v3)
  {
    if (a2)
      *a2 = ~v3;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

uint64_t _pthread_tsd_cleanup_key(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a2;
  v5 = 0;
  result = _pthread_key_get_destructor(a2, (uint64_t *)&v5);
  if ((result & 1) != 0)
  {
    v4 = (uint64_t *)(v7 + 224 + 8 * v6);
    v3 = *v4;
    if (*v4)
    {
      *v4 = 0;
      if (v5)
        return v5(v3);
    }
  }
  return result;
}

int pthread_join(pthread_t a1, void **a2)
{
  int v2;

  _pthread_testcancel_if_cancelable_variant_0();
  v2 = _pthread_conformance_0();
  return _pthread_join((uint64_t)a1, (uint64_t *)a2, v2);
}

void _pthread_testcancel_if_cancelable_variant_0()
{
  pthread_testcancel();
}

uint64_t _pthread_conformance_0()
{
  return 2;
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  int v2;

  v2 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, 0, 0, v2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  int v3;

  v3 = _pthread_conformance_0();
  return _pthread_cond_wait((uint64_t)a1, a2, &a3->tv_sec, 0, v3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  int v3;

  v3 = 0;
  _pthread_testcancel_if_cancelable_variant_0();
  if (__sigwait(a1, a2) == -1)
  {
    v3 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    _pthread_testcancel_if_cancelable_variant_0();
    if (v3 == 4)
      return 0;
  }
  return v3;
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  vm_size_t v3;
  void (**v5)(void);
  vm_size_t size;
  mach_vm_address_t v7;
  kern_return_t v8;
  uint64_t v9;
  vm_size_t v10;
  int v11;
  void (*v12)(void);
  void (*v13)(void);
  void (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v14 = a1;
  v13 = a2;
  v12 = a3;
  v11 = 0;
  v10 = 0;
  v9 = 0;
  v25 = 16;
  v24 = 320;
  v23 = _pthread_globals_init;
  v22 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1)
  {
    v26 = v22[1];
  }
  else
  {
    v21 = _os_alloc_once(v22, v24, v23);
    v26 = v21;
  }
  v9 = v26;
  v17 = v26 + 12;
  os_unfair_lock_lock_with_options(v26 + 12, 327680);
  v3 = *(_QWORD *)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v3 + 1;
  v10 = v3;
  if (v3)
  {
    if (v10 == 10)
    {
      v8 = 0;
      v7 = 0;
      size = 24 * (vm_page_size / 0x18);
      v20 = v9 + 12;
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
      v8 = mach_vm_map(mach_task_self_, &v7, size, vm_page_size - 1, 1224736769, 0, 0, 0, 3, 7, 1u);
      v16 = v9 + 12;
      os_unfair_lock_lock_with_options(v9 + 12, 327680);
      if (v8)
      {
        v11 = 12;
      }
      else if (*(_QWORD *)(v9 + 264) == v9 + 24)
      {
        *(_QWORD *)(v9 + 264) = v7;
        _platform_memmove(*(_QWORD *)(v9 + 264), v9 + 24, 240);
        _platform_bzero(v9 + 24, 240);
      }
      else
      {
        v19 = v9 + 12;
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
        mach_vm_deallocate(mach_task_self_, v7, size);
        v15 = v9 + 12;
        os_unfair_lock_lock_with_options(v9 + 12, 327680);
      }
    }
    else if (v10 >= vm_page_size / 0x18)
    {
      v11 = 12;
    }
  }
  else
  {
    *(_QWORD *)(v9 + 264) = v9 + 24;
  }
  if (!v11)
  {
    v5 = (void (**)(void))(*(_QWORD *)(v9 + 264) + 24 * v10);
    *v5 = v14;
    v5[1] = v13;
    v5[2] = v12;
  }
  v18 = v9 + 12;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 12));
  return v11;
}

uint64_t _pthread_atfork_prepare_handlers()
{
  uint64_t result;
  uint64_t (**v1)(uint64_t);
  uint64_t i;
  uint64_t v3;

  if (_os_alloc_once_table[32] == -1)
    v3 = _os_alloc_once_table[33];
  else
    v3 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  result = os_unfair_lock_lock_with_options(v3 + 12, 327680);
  for (i = *(_QWORD *)(v3 + 16); i; --i)
  {
    v1 = (uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 264) + 24 * (i - 1));
    if (*v1)
      result = (*v1)(result);
  }
  return result;
}

uint64_t _pthread_atfork_prepare()
{
  _QWORD *v1;

  if (_os_alloc_once_table[32] == -1)
    v1 = (_QWORD *)_os_alloc_once_table[33];
  else
    v1 = (_QWORD *)_os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  os_unfair_lock_lock_with_options(v1 + 1, 327680);
  *v1 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 224;
  return os_unfair_lock_lock_with_options(*v1 + 72, 327680);
}

void _pthread_atfork_parent()
{
  uint64_t v0;

  if (_os_alloc_once_table[32] == -1)
    v0 = _os_alloc_once_table[33];
  else
    v0 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)v0 + 72));
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 8));
}

void _pthread_atfork_parent_handlers()
{
  uint64_t v0;
  unint64_t i;
  uint64_t v2;

  if (_os_alloc_once_table[32] == -1)
    v2 = _os_alloc_once_table[33];
  else
    v2 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  for (i = 0; i < *(_QWORD *)(v2 + 16); ++i)
  {
    v0 = *(_QWORD *)(v2 + 264) + 24 * i;
    if (*(_QWORD *)(v0 + 8))
      (*(void (**)(void))(v0 + 8))();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 12));
}

uint64_t _pthread_atfork_child()
{
  _BYTE __b[56];
  uint64_t *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = 0;
  v9 = 16;
  v8 = 320;
  v7 = _pthread_globals_init;
  v6 = &_os_alloc_once_table[32];
  if (_os_alloc_once_table[32] == -1)
  {
    v10 = v6[1];
  }
  else
  {
    v5 = _os_alloc_once(v6, v8, v7);
    v10 = v5;
  }
  v2 = (uint64_t *)v10;
  v4 = v10 + 8;
  v3 = 0;
  *(_DWORD *)(v10 + 8) = 0;
  __is_threaded = 0;
  _pthread_main_thread_postfork_init(*v2);
  memset(__b, 0, sizeof(__b));
  return _pthread_bsdthread_init((uint64_t)__b);
}

void _pthread_atfork_child_handlers()
{
  uint64_t v0;
  unint64_t i;
  uint64_t v2;

  if (_os_alloc_once_table[32] == -1)
    v2 = _os_alloc_once_table[33];
  else
    v2 = _os_alloc_once(&_os_alloc_once_table[32], 320, _pthread_globals_init);
  for (i = 0; i < *(_QWORD *)(v2 + 16); ++i)
  {
    v0 = *(_QWORD *)(v2 + 264) + 24 * i;
    if (*(_QWORD *)(v0 + 16))
      (*(void (**)(void))(v0 + 16))();
  }
  *(_DWORD *)(v2 + 12) = 0;
}

uint64_t _pthread_fork_prepare()
{
  _pthread_atfork_prepare_handlers();
  return _pthread_atfork_prepare();
}

void _pthread_fork_parent()
{
  _pthread_atfork_parent();
  _pthread_atfork_parent_handlers();
}

uint64_t _pthread_fork_child()
{
  return _pthread_atfork_child();
}

void _pthread_fork_child_postinit()
{
  _pthread_atfork_child_handlers();
}

float pthread_dependency_init_np(_OWORD *a1, _opaque_pthread_t *a2)
{
  float result;

  result = COERCE_FLOAT(pthread_mach_thread_np(a2));
  *a1 = LODWORD(result);
  return result;
}

uint64_t _pthread_dependency_fulfill_slow(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  if (a2 == -1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fufilling pthread_dependency_t twice";
    __break(1u);
    JUMPOUT(0x1E6A8);
  }
  if (a2 != *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Fulfilled a dependency not owned by current thread";
    qword_24058 = a2;
    __break(1u);
    JUMPOUT(0x1E720);
  }
  result = __ulock_wake(16777218, a1 + 4, 0);
  if ((-(int)result | 2) != 2)
  {
    qword_24028 = (uint64_t)"BUG IN LIBPTHREAD: __ulock_wake() failed";
    qword_24058 = -(int)result;
    __break(1u);
    JUMPOUT(0x1E7B4);
  }
  return result;
}

uint64_t pthread_dependency_fulfill_np(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int *v4;
  unsigned int v5;

  *(_QWORD *)(result + 8) = a2;
  v5 = *(_DWORD *)(result + 4);
  do
  {
    v2 = v5;
    v4 = (unsigned int *)(result + 4);
    do
      v3 = __ldaxr(v4);
    while (v3 == v5 && __stlxr(0xFFFFFFFF, v4));
    v5 = v3;
  }
  while (v3 != v2);
  if (v3)
    return _pthread_dependency_fulfill_slow(result, v3);
  return result;
}

uint64_t pthread_dependency_wait_np(unsigned int *a1)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  int v7;
  int v8;

  v1 = a1 + 1;
  v2 = *a1;
  do
    v3 = __ldaxr(v1);
  while (!v3 && __stlxr(v2, v1));
  if (!v3)
  {
    do
    {
      v8 = __ulock_wait(16777218, a1 + 1, *a1);
      v7 = -v8;
      if (v8 && v7 != 4 && v7 != 14)
      {
        if (v7 != 105)
        {
          qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: __ulock_wait() failed";
          qword_24058 = -v8;
          __break(1u);
          JUMPOUT(0x1EA8CLL);
        }
        v4 = *a1;
        qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Waiting on orphaned dependency";
        qword_24058 = v4;
        __break(1u);
        JUMPOUT(0x1EA40);
      }
    }
    while (a1[1] == *a1);
  }
  v5 = atomic_load(a1 + 1);
  if (v5 != -1)
  {
    qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Corrupted pthread_dependency_t";
    qword_24058 = v5;
    __break(1u);
    JUMPOUT(0x1EB20);
  }
  return *((_QWORD *)a1 + 1);
}

unint64_t _pthread_atomic_xchg_ptr(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;

  v5 = *a1;
  do
  {
    v2 = v5;
    do
      v3 = __ldaxr(a1);
    while (v3 == v5 && __stlxr(a2, a1));
    v5 = v3;
  }
  while (v3 != v2);
  return v3;
}

uint64_t _pthread_atomic_xchg_uint32_relaxed(unsigned int *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v5;

  v5 = *a1;
  do
  {
    v2 = v5;
    do
      v3 = __ldaxr(a1);
    while (v3 == v5 && __stlxr(a2, a1));
    v5 = v3;
  }
  while (v3 != v2);
  return v3;
}

void start_wqthread(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  _pthread_wqthread(a1, a2, a3, a4, a5, a6);
  __break(1u);
}

void thread_start(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  _pthread_start(a1, a2, a3, a4, a5, a6);
  thread_chkstk_darwin(v9, v10, v11, v12, v13, v14, v15, v16, a9);
}

void thread_chkstk_darwin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v9;
  unint64_t StatusReg;
  unint64_t v11;
  uint64_t *v12;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if ((unint64_t)&a9 >= *(_QWORD *)(StatusReg - 48)
    || (v11 = *(_QWORD *)(StatusReg - 40), (unint64_t)&a9 <= v11)
    || (unint64_t)&a9 < v9
    || (unint64_t)&a9 - v9 < v11)
  {
    v12 = &a9;
    if (v9 >= 0x1000)
    {
      do
      {
        v12 -= 512;
        v9 -= 4096;
      }
      while (v9 > 0x1000);
    }
  }
}

void __pthread_invalid_workloopfunction()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqwl setup";
  __break(1u);
}

void __pthread_invalid_keventfunction()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: Invalid kqworkq setup";
  __break(1u);
}

void _pthread_mutex_corruption_abort()
{
  qword_24028 = (uint64_t)"BUG IN CLIENT OF LIBPTHREAD: pthread_mutex corruption: mutex owner changed in the middle of lock/unlock";
  __break(1u);
  __bsdthread_create();
}
