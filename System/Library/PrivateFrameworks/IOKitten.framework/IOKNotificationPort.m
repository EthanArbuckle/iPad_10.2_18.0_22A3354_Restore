@implementation IOKNotificationPort

- (void)dealloc
{
  IONotificationPort *port;
  objc_super v4;

  port = self->_port;
  if (port)
    IONotificationPortDestroy(port);
  v4.receiver = self;
  v4.super_class = (Class)IOKNotificationPort;
  -[IOKNotificationPort dealloc](&v4, sel_dealloc);
}

- (IOKNotificationPort)initWithMasterPort:(unsigned int)a3 onDispatchQueue:(id)a4
{
  NSObject *v7;
  IOKNotificationPort *v8;
  IONotificationPort *port;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IOKNotificationPort;
  v8 = -[IOKNotificationPort init](&v11, sel_init);
  if (v8)
  {
    v8->_port = IONotificationPortCreate(a3);
    objc_storeStrong((id *)&v8->_queue, a4);
    port = v8->_port;
    if (port)
    {
      IONotificationPortSetDispatchQueue(port, v7);
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IONotificationPort)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)initOnDispatchQueue:(id)a3
{
  return -[IOKNotificationPort initWithMasterPort:onDispatchQueue:](self, "initWithMasterPort:onDispatchQueue:", *MEMORY[0x24BDD8B20], a3);
}

- (IOKNotificationPort)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[IOKNotificationPort init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (unsigned)machPort
{
  return IONotificationPortGetMachPort(-[IOKNotificationPort port](self, "port"));
}

@end
