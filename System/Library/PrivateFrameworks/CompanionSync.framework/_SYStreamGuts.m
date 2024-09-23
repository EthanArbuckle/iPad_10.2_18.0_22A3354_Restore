@implementation _SYStreamGuts

- (void)dealloc
{
  __CFRunLoopSource *runloopSource;
  mach_port_name_t port;
  objc_super v5;

  runloopSource = self->_runloopSource;
  if (runloopSource)
    CFRelease(runloopSource);
  port = self->_port;
  if (port)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], port);
  v5.receiver = self;
  v5.super_class = (Class)_SYStreamGuts;
  -[_SYStreamGuts dealloc](&v5, sel_dealloc);
}

- (void)setEventHandler:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  id handler;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  id v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (a3 && v6)
  {
    v7 = (void *)objc_msgSend(a3, "copy");
    handler = self->_handler;
    self->_handler = v7;

    v9 = (OS_dispatch_queue *)v12;
    queue = self->_queue;
    self->_queue = v9;
  }
  else
  {
    v11 = self->_handler;
    self->_handler = 0;

    queue = self->_queue;
    self->_queue = 0;
  }

}

- (void)createRunloopSourceForStream:(id)a3
{
  ipc_space_t *v5;
  unsigned int *p_port;
  CFRunLoopSourceContext context;

  v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  p_port = &self->_port;
  if (!mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &self->_port))
  {
    if (mach_port_insert_right(*v5, *p_port, *p_port, 0x14u))
      JUMPOUT(0x212BE0CB0);
    context.version = 1;
    context.info = a3;
    memset(&context.retain, 0, 40);
    context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))__SYZlibStreamGetPort;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))__SYZlibStreamPerform;
    self->_runloopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &context);
  }
}

- (void)postStreamEvent:(unint64_t)a3 forStream:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  unint64_t v13;

  v6 = a4;
  if (self->_queue)
  {
    v7 = (void *)objc_msgSend(self->_handler, "copy");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43___SYStreamGuts_postStreamEvent_forStream___block_invoke;
    block[3] = &unk_24CC653C8;
    v12 = v7;
    v11 = v6;
    v13 = a3;
    v9 = v7;
    dispatch_async(queue, block);

  }
  else if (self->_runloopSource)
  {
    _TryPostEvent(a3, self, 1);
  }

}

- (void)storeProperty:(id)a3 forKey:(id)a4
{
  id v6;
  _SYStreamGuts *v7;
  NSMutableDictionary *propertyStore;
  uint64_t v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  propertyStore = v7->_propertyStore;
  if (v11 && !propertyStore)
  {
    v9 = objc_opt_new();
    v10 = v7->_propertyStore;
    v7->_propertyStore = (NSMutableDictionary *)v9;

    propertyStore = v7->_propertyStore;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](propertyStore, "setObject:forKeyedSubscript:", v11, v6);
  objc_sync_exit(v7);

}

- (id)propertyForKey:(id)a3
{
  id v4;
  _SYStreamGuts *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_propertyStore, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyStore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
