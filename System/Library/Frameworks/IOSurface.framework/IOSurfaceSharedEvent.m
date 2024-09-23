@implementation IOSurfaceSharedEvent

- (IOSurfaceSharedEvent)init
{
  return -[IOSurfaceSharedEvent initWithOptions:](self, "initWithOptions:", 0);
}

- (IOSurfaceSharedEvent)initWithOptions:(unint64_t)a3
{
  char *v4;
  mach_port_t v5;
  uint64_t v6;
  mach_port_t v7;
  uint32_t v9;
  uint64_t v10;
  uint32_t outputCnt;
  uint64_t input;
  objc_super v13;
  uint64_t v14[2];
  __int128 v15;
  uint64_t output[3];

  output[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)IOSurfaceSharedEvent;
  v4 = -[IOSurfaceSharedEvent init](&v13, sel_init);
  if (v4)
  {
    input = a3;
    outputCnt = 2;
    v5 = _ioSurfaceConnect();
    if (IOConnectCallMethod(v5, 0x24u, &input, 1u, 0, 0, output, &outputCnt, 0, 0))
      goto LABEL_4;
    v6 = LODWORD(output[0]);
    *((_DWORD *)v4 + 2) = output[0];
    *((_QWORD *)v4 + 2) = output[1];
    v10 = v6;
    *(_OWORD *)v14 = 0u;
    v15 = 0u;
    v9 = 4;
    v7 = _ioSurfaceConnect();
    if (IOConnectCallMethod(v7, 0x26u, &v10, 1u, 0, 0, v14, &v9, 0, 0))
    {
LABEL_4:

      return 0;
    }
    else
    {
      *(_OWORD *)(v4 + 24) = v15;
    }
  }
  return (IOSurfaceSharedEvent *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IOSurfaceSharedEvent)initWithMachPort:(unsigned int)a3
{
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output[2];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a3, 0, 1);
  self->_eventPort = a3;
  input = a3;
  *(_OWORD *)output = 0u;
  v10 = 0u;
  outputCnt = 4;
  v5 = _ioSurfaceConnect();
  if (IOConnectCallMethod(v5, 0x26u, &input, 1u, 0, 0, output, &outputCnt, 0, 0))
  {

    return 0;
  }
  else
  {
    self->_signaledValue = (const unint64_t *)output[1];
    *(_OWORD *)&self->_globalTraceObjectID = v10;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."));
  v4 = (void *)xpc_mach_send_create();
  objc_msgSend(a3, "encodeXPCObject:forKey:", v4, CFSTR("IOSurface.port"));
  xpc_release(v4);
}

- (IOSurfaceSharedEvent)initWithCoder:(id)a3
{
  uint64_t right;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."));
  if (objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], CFSTR("IOSurface.port")))
  {
    right = xpc_mach_send_get_right();
    if ((_DWORD)right)
      return -[IOSurfaceSharedEvent initWithMachPort:](self, "initWithMachPort:", right);
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], self->_eventPort, 0, -1);
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceSharedEvent;
  -[IOSurfaceSharedEvent dealloc](&v3, sel_dealloc);
}

- (void)setSignaledValue:(unint64_t)a3
{
  io_connect_t v5;

  v5 = _ioSurfaceConnect();
  IOConnectTrap2(v5, 7u, self->_eventPort, a3);
}

- (unint64_t)signaledValue
{
  return *self->_signaledValue;
}

- (BOOL)supportsRollback
{
  return self->_eventOptions & 1;
}

- (BOOL)supportsLowLatencySignalAndWait
{
  return (LOBYTE(self->_eventOptions) >> 1) & 1;
}

- (BOOL)waitUntilSignaledValue:(unint64_t)a3 timeoutMS:(unint64_t)a4
{
  io_connect_t v7;

  if (*self->_signaledValue >= a3)
    return 1;
  v7 = _ioSurfaceConnect();
  return IOConnectTrap3(v7, 6u, self->_eventPort, a3, a4) == 0;
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  IOSurfaceSharedEventNotifyEventListener(a3, self, self->_eventPort, a4, a5);
}

- (unsigned)eventPort
{
  return self->_eventPort;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

@end
