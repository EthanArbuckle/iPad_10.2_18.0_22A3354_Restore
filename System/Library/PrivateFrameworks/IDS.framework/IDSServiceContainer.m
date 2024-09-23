@implementation IDSServiceContainer

- (IDSServiceMonitor)monitor
{
  return self->_monitor;
}

- (IDSServiceContainer)initWithService:(id)a3
{
  id v4;
  IDSServiceContainer *v5;
  IDSServiceMonitor *v6;
  IDSServiceMonitor *monitor;
  NSMutableSet *v8;
  NSMutableSet *listeners;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSServiceContainer;
  v5 = -[IDSServiceContainer init](&v11, sel_init);
  if (v5)
  {
    v6 = -[IDSServiceMonitor initWithService:]([IDSServiceMonitor alloc], "initWithService:", v4);
    monitor = v5->_monitor;
    v5->_monitor = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    listeners = v5->_listeners;
    v5->_listeners = v8;

  }
  return v5;
}

- (BOOL)hasListenerID:(id)a3
{
  if (a3)
    return -[NSMutableSet containsObject:](self->_listeners, "containsObject:");
  else
    return 0;
}

- (BOOL)addListenerID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSMutableSet addObject:](self->_listeners, "addObject:", v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)removeListenerID:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_listeners, "removeObject:", a3);
  return a3 != 0;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
