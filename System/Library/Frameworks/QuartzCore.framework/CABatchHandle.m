@implementation CABatchHandle

- (_QWORD)_initWithPort:(uint64_t)a3 name:
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  BOOL v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)CABatchHandle;
  v5 = objc_msgSendSuper2(&v12, sel_init);
  if (!v5)
    __assert_rtn("-[CABatchHandle _initWithPort:name:]", "CABatchHandle.mm", 162, "self");
  v6 = v5;
  do
  {
    do
    {
      v7 = __ldaxr(&-[CABatchHandle _initWithPort:name:]::last_handle_name);
      v8 = __stlxr(v7 + 1, &-[CABatchHandle _initWithPort:name:]::last_handle_name);
      v9 = v7 + 1;
      v10 = v7 == -1;
    }
    while (v8);
  }
  while (v10);
  v5[1] = v9;
  v5[2] = a3;
  *((_DWORD *)v5 + 6) = a2;
  kdebug_trace();
  return v6;
}

- (void)dealloc
{
  SpinLock *p_lock;
  _BOOL4 invalidated;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self
    || (p_lock = &self->_lock,
        os_unfair_lock_lock((os_unfair_lock_t)&self->_lock),
        invalidated = self->_invalidated,
        os_unfair_lock_unlock((os_unfair_lock_t)p_lock),
        !invalidated))
  {
    __assert_rtn("-[CABatchHandle dealloc]", "CABatchHandle.mm", 207, "[self isInvalidated]");
  }
  v5.receiver = self;
  v5.super_class = (Class)CABatchHandle;
  -[CABatchHandle dealloc](&v5, sel_dealloc);
}

- (CABatchHandle)init
{
  __assert_rtn("-[CABatchHandle init]", "CABatchHandle.mm", 234, "NO");
}

- (void)invalidate
{
  SpinLock *p_lock;
  mach_port_name_t port;

  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  }
  else
  {
    self->_invalidated = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
    port = self->_port;
    if (port)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], port);
    if (self->_handle_name)
      kdebug_trace();
  }
}

- (id)createXPCRepresentation
{
  xpc_object_t v2;
  SpinLock *p_lock;
  unsigned int port;

  if (self->_port + 1 < 2)
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  if (self->_invalidated)
    port = 0;
  else
    port = self->_port;
  v2 = encode_batch_handle_port(self->_handle_name, self->_batch_name, port);
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int port;
  _QWORD *v6;

  if (self && self->_port + 1 >= 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
    if (self->_invalidated || mach_port_insert_right(*MEMORY[0x1E0C83DA0], self->_port, self->_port, 0x13u))
      port = 0;
    else
      port = self->_port;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
  }
  else
  {
    port = 0;
  }
  v6 = -[CABatchHandle _initWithPort:name:](+[CABatchHandle allocWithZone:](CABatchHandle, "allocWithZone:", a3), port, self->_batch_name);
  kdebug_trace();
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[CABatchHandle encodeWithCoder:]", "CABatchHandle.mm", 318, "[coder isKindOfClass:[NSXPCCoder class]]");
  v5 = -[CABatchHandle createXPCRepresentation](self, "createXPCRepresentation");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, "encodeXPCObject:forKey:", v5, CFSTR("x"));
    xpc_release(v6);
  }
}

- (CABatchHandle)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  CABatchHandle *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x186DBE2E4]();
    v6 = (void *)objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("x"));
    v7 = v6;
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v6 = 0;
  }
  v8 = (CABatchHandle *)-[CABatchHandle _initWithXPCRepresentation:](self, v6);

  return v8;
}

- (id)description
{
  void *v3;
  unint64_t handle_name;
  unint64_t batch_name;
  const __CFString *v6;
  _BOOL4 invalidated;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  handle_name = self->_handle_name;
  batch_name = self->_batch_name;
  v6 = CFSTR("NO");
  if (self->_port + 1 >= 2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
    invalidated = self->_invalidated;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);
    if (!invalidated)
      v6 = CFSTR("YES");
    if (batch_name)
      return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<CABatchHandle:%p name=%llx batch=%llx usable=%@>"), self, handle_name, batch_name, v6);
  }
  else if (batch_name)
  {
    return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<CABatchHandle:%p name=%llx batch=%llx usable=%@>"), self, handle_name, batch_name, v6);
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<CABatchHandle:%p name=%llx usable=%@>"), self, handle_name, v6, v9);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 7) = 0;
  return self;
}

- (_QWORD)_initWithXPCRepresentation:(_QWORD *)a1
{
  _QWORD *v2;
  uint64_t uint64;
  int v5;

  v2 = a1;
  if (a1)
  {
    if (a2 && object_getClass(a2) == (Class)MEMORY[0x1E0C812F8])
    {
      uint64 = xpc_dictionary_get_uint64(a2, "f");
      xpc_dictionary_get_uint64(a2, "e");
      v5 = xpc_dictionary_copy_mach_send();
    }
    else
    {
      uint64 = 0;
      v5 = 0;
    }
    v2 = -[CABatchHandle _initWithPort:name:](v2, v5, uint64);
    kdebug_trace();
  }
  return v2;
}

+ (id)createFromXPCRepresentation:(id)a3
{
  return -[CABatchHandle _initWithXPCRepresentation:]([CABatchHandle alloc], a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
