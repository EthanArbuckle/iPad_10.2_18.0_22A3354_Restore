@implementation GCIONotificationPort

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3
{
  GCIONotificationPort *v4;
  IONotificationPortRef v5;
  NSObject *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCIONotificationPort;
  v4 = -[GCIONotificationPort init](&v8, sel_init);
  v5 = IONotificationPortCreate(a3);
  v4->_port = v5;
  if (!v5)
  {
    v7 = _gc_log_iokit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[GCIONotificationPort initWithMainPort:].cold.1(v7);
    return 0;
  }
  return v4;
}

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4 cancellationHandler:(id)a5
{
  GCIONotificationPort *v7;

  v7 = -[GCIONotificationPort initWithMainPort:](self, "initWithMainPort:", *(_QWORD *)&a3);
  -[GCIONotificationPort setQueue:cancellationHandler:](v7, "setQueue:cancellationHandler:", a4, a5);
  return v7;
}

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4
{
  return -[GCIONotificationPort initWithMainPort:queue:cancellationHandler:](self, "initWithMainPort:queue:cancellationHandler:", *(_QWORD *)&a3, a4, 0);
}

- (GCIONotificationPort)initWithQueue:(id)a3
{
  return -[GCIONotificationPort initWithMainPort:queue:](self, "initWithMainPort:queue:", *MEMORY[0x1E0CBBAA8], a3);
}

- (GCIONotificationPort)init
{
  return -[GCIONotificationPort initWithMainPort:](self, "initWithMainPort:", *MEMORY[0x1E0CBBAA8]);
}

- (void)dealloc
{
  objc_super v3;

  IONotificationPortDestroy(self->_port);
  self->_port = 0;
  self->_queue = 0;
  self->_cancellationSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)GCIONotificationPort;
  -[GCIONotificationPort dealloc](&v3, sel_dealloc);
}

- (id)description
{
  GCIONotificationPort *v2;
  uint64_t MachPort;

  if (self)
  {
    v2 = self;
    MachPort = IONotificationPortGetMachPort(self->_port);
    self = (GCIONotificationPort *)v2->_queue;
  }
  else
  {
    MachPort = 0;
  }
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<IONotificationPort port='%#08x' queue='%s'>"), MachPort, dispatch_queue_get_label(&self->super));
}

- (uint64_t)wakePort
{
  if (result)
    return IONotificationPortGetMachPort(*(IONotificationPortRef *)(result + 8));
  return result;
}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (id)redactedDescription
{
  GCIONotificationPort *v2;
  uint64_t MachPort;

  if (self)
  {
    v2 = self;
    MachPort = IONotificationPortGetMachPort(self->_port);
    self = (GCIONotificationPort *)v2->_queue;
  }
  else
  {
    MachPort = 0;
  }
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<IONotificationPort port='%#08x' queue='%s'>"), MachPort, dispatch_queue_get_label(&self->super));
}

- (id)debugDescription
{
  objc_class *v3;
  NSString *v4;
  uint64_t MachPort;
  NSObject *queue;

  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if (self)
  {
    MachPort = IONotificationPortGetMachPort(self->_port);
    queue = self->_queue;
  }
  else
  {
    MachPort = 0;
    queue = 0;
  }
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p port='%#08x' queue='%s'>"), v4, self, MachPort, dispatch_queue_get_label(queue));
}

- (void)setQueue:(id)a3 cancellationHandler:(id)a4
{
  mach_port_t MachPort;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  mach_port_t v11;
  _QWORD handler[6];

  if (!a3)
    objc_msgSend((id)unk_1F03A9A20(&off_1F03A9B88, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCIONotificationPort.m"), 76, CFSTR("Assertion failed: queue != ((void *)0)"));
  IONotificationPortSetDispatchQueue(self->_port, (dispatch_queue_t)a3);
  self->_queue = (OS_dispatch_queue *)a3;
  if (a4)
  {
    MachPort = IONotificationPortGetMachPort(self->_port);
    mach_port_insert_right(*MEMORY[0x1E0C83DA0], MachPort, MachPort, 0x14u);
    v8 = dispatch_source_create(MEMORY[0x1E0C80DA0], MachPort, 1uLL, (dispatch_queue_t)self->_queue);
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke;
    handler[3] = &unk_1EA4D45D0;
    handler[4] = v8;
    handler[5] = a4;
    dispatch_source_set_event_handler(v8, handler);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke_2;
    v10[3] = &unk_1EA4D45F8;
    v11 = MachPort;
    v10[4] = v8;
    dispatch_source_set_cancel_handler(v8, v10);
    self->_cancellationSource = (OS_dispatch_source *)v8;
    dispatch_activate(v8);
  }
}

void __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke_2(uint64_t a1)
{
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (uint64_t)port
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)initWithMainPort:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "IONotificationPortCreate() failed.", v1, 2u);
}

@end
