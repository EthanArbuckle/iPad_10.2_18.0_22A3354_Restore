@implementation CABatchInfo

- (id)newXPCBatchHandle
{
  SpinLock *p_lock;
  unsigned int port;
  xpc_object_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  port = self->_port;
  if (port + 1 < 2 || self->_invalidated)
    v5 = 0;
  else
    v5 = encode_batch_handle_port(0, self->_batch_name, port);
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v5;
}

- (id)newBatchHandle
{
  SpinLock *p_lock;
  mach_port_name_t port;
  _QWORD *v5;
  unsigned int v7;
  unint64_t batch_name;
  const char *v9;
  int v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  port = self->_port;
  if (port + 1 >= 2 && !self->_invalidated && !mach_port_insert_right(*MEMORY[0x1E0C83DA0], port, self->_port, 0x13u))
  {
    v7 = self->_port;
    batch_name = self->_batch_name;
    objc_opt_self();
    if (v7 + 1 < 2)
    {
      v9 = "MACH_PORT_VALID (port)";
      v10 = 151;
    }
    else
    {
      if (batch_name)
      {
        v5 = -[CABatchHandle _initWithPort:name:]([CABatchHandle alloc], v7, batch_name);
        goto LABEL_5;
      }
      v9 = "name > 0";
      v10 = 152;
    }
    __assert_rtn("+[CABatchHandle _newBatchWithPort:name:]", "CABatchHandle.mm", v10, v9);
  }
  v5 = 0;
LABEL_5:
  os_unfair_lock_unlock((os_unfair_lock_t)p_lock);
  return v5;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
    __assert_rtn("-[CABatchInfo dealloc]", "CABatchHandle.mm", 129, "_invalidated");
  v2.receiver = self;
  v2.super_class = (Class)CABatchInfo;
  -[CABatchInfo dealloc](&v2, sel_dealloc);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 5) = 0;
  return self;
}

+ (CABatchInfo)_newInfoWithUnownedPort:(unint64_t)a3 name:
{
  CABatchInfo *result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  result = [CABatchInfo alloc];
  if (result)
  {
    v6.receiver = result;
    v6.super_class = (Class)CABatchInfo;
    result = (CABatchInfo *)objc_msgSendSuper2(&v6, sel_init);
    if (!result)
      __assert_rtn("-[CABatchInfo _initWithUnownedPort:name:]", "CABatchHandle.mm", 83, "self");
    if (a2 + 1 <= 1)
      __assert_rtn("-[CABatchInfo _initWithUnownedPort:name:]", "CABatchHandle.mm", 84, "MACH_PORT_VALID (port)");
    result->_batch_name = a3;
    result->_port = a2;
    result->_invalidated = 0;
  }
  return result;
}

@end
