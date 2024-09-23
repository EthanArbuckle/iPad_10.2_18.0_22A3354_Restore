@implementation CADisplayPowerAssertion

- (void)dealloc
{
  mach_port_name_t server_port;
  ipc_space_t *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayPowerAssertion"), CFSTR("The %@ assertion (%@) is deallocated without calling -invalidate first."), NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier);
  server_port = self->_server_port;
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (server_port + 1 >= 2)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], server_port);
  mach_port_destruct(*v4, self->_client_port, -1, (mach_port_context_t)self->_identifier);

  v5.receiver = self;
  v5.super_class = (Class)CADisplayPowerAssertion;
  -[CADisplayPowerAssertion dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v4), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("active: %i, invalidated: %i, reason: %@, identifier: %@"), self->_active, self->_invalidated, NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_ensureValid
{
  if (self->_invalidated)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayPowerAssertion"), CFSTR("The %@ assertion (%@) is already invalidated."), NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier);
}

- (void)_acquireAndWait:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int server_port;
  unsigned int display_id;
  pid_t v7;
  unsigned int client_port;
  int reason;
  mach_port_t reply_port;
  mach_msg_return_t v11;
  _BYTE msg[36];
  int v13;
  uint64_t v14;
  unsigned int v15;
  pid_t v16;
  int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[CADisplayPowerAssertion _ensureValid](self, "_ensureValid");
  if (self->_active)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayPowerAssertion"), CFSTR("The %@ assertion (%@) is already active."), NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier);
  server_port = self->_server_port;
  display_id = self->_display_id;
  v7 = getpid();
  client_port = self->_client_port;
  reason = self->_reason;
  if (v3)
  {
    memset(&msg[4], 0, 32);
    *(_DWORD *)&msg[24] = 1;
    *(_DWORD *)&msg[28] = client_port;
    v13 = 1245184;
    v14 = *MEMORY[0x1E0C804E8];
    v15 = display_id;
    v16 = v7;
    v17 = reason;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = server_port;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = -2147478253;
    *(_QWORD *)&msg[16] = 0x9D5D00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v11 = mach_msg((mach_msg_header_t *)msg, 3, 0x3Cu, 0x2Cu, reply_port, 0, 0);
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if (v11)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if (*(_DWORD *)&msg[20] != 40385
           || (*(_DWORD *)msg & 0x80000000) != 0
           || *(_DWORD *)&msg[4] != 36
           || *(_DWORD *)&msg[8]
           || *(_DWORD *)&msg[32])
    {
      mach_msg_destroy((mach_msg_header_t *)msg);
    }
  }
  else
  {
    memset(&msg[4], 0, 32);
    *(_DWORD *)&msg[28] = client_port;
    v13 = 1245184;
    v14 = *MEMORY[0x1E0C804E8];
    v15 = display_id;
    v16 = v7;
    v17 = reason;
    *(_DWORD *)msg = -2147483629;
    *(_DWORD *)&msg[8] = server_port;
    *(_QWORD *)&msg[20] = 0x100009D5CLL;
    if (MEMORY[0x1E0C85B60])
      voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_msg((mach_msg_header_t *)msg, 1, 0x3Cu, 0, 0, 0, 0);
  }
  self->_active = 1;
}

- (void)acquire
{
  -[CADisplayPowerAssertion _acquireAndWait:](self, "_acquireAndWait:", 0);
}

- (void)acquireAndWaitForPowerOn
{
  -[CADisplayPowerAssertion _acquireAndWait:](self, "_acquireAndWait:", 1);
}

- (void)cancel
{
  unsigned int display_id;
  unsigned int server_port;
  unsigned int client_port;
  _BYTE msg[36];
  int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CADisplayPowerAssertion _ensureValid](self, "_ensureValid");
  if (!self->_active)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayPowerAssertion"), CFSTR("The %@ assertion (%@) is not active."), NSStringFromCADisplayPowerAssertionReason(self->_reason), self->_identifier);
  display_id = self->_display_id;
  server_port = self->_server_port;
  client_port = self->_client_port;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[28] = client_port;
  v7 = 1245184;
  *(_OWORD *)&msg[4] = 0u;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = display_id;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = server_port;
  *(_QWORD *)&msg[20] = 0x100009D5ELL;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  mach_msg((mach_msg_header_t *)msg, 1, 0x34u, 0, 0, 0, 0);
  self->_active = 0;
}

- (void)invalidate
{
  -[CADisplayPowerAssertion _ensureValid](self, "_ensureValid");
  if (self->_active)
    -[CADisplayPowerAssertion cancel](self, "cancel");
  self->_invalidated = 1;
}

- (void)initializeClientPort
{
  uint64_t v3;
  mach_port_options_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v4.flags = xmmword_18475F108;
  v4.reserved[1] = 0;
  v3 = mach_port_construct(*MEMORY[0x1E0C83DA0], &v4, (mach_port_context_t)self->_identifier, &self->_client_port);
  CA_CLIENT_MACH_PORT_ALLOCATE_FAILED(v3, self->_client_port);
}

- (id)_initWithDisplayId:(unsigned int)a3 reason:(int64_t)a4 identifier:(id)a5
{
  CADisplayPowerAssertion *v8;
  CADisplayPowerAssertion *v9;
  unsigned int ServerPort;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CADisplayPowerAssertion;
  v8 = -[CADisplayPowerAssertion init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_display_id = a3;
    v8->_reason = a4;
    v8->_identifier = (NSString *)objc_msgSend(a5, "copy");
    ServerPort = CARenderServerGetServerPort(0);
    v9->_server_port = ServerPort;
    if (ServerPort)
    {
      -[CADisplayPowerAssertion initializeClientPort](v9, "initializeClientPort");
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

@end
