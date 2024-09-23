@implementation FTCServiceContainer

- (FTCServiceContainer)initWithServiceType:(int64_t)a3
{
  FTCServiceContainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTCServiceContainer;
  v4 = -[FTCServiceContainer init](&v6, sel_init);
  if (v4)
  {
    v4->_monitor = -[FTCServiceMonitor initWithServiceType:]([FTCServiceMonitor alloc], "initWithServiceType:", a3);
    v4->_listeners = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTCServiceContainer;
  -[FTCServiceContainer dealloc](&v3, sel_dealloc);
}

- (BOOL)hasListenerID:(id)a3
{
  if (a3)
    return MEMORY[0x24BEDD108](self->_listeners, sel_containsObject_);
  else
    return 0;
}

- (BOOL)addListenerID:(id)a3
{
  uint64_t v5;

  if (a3)
  {
    v5 = objc_msgSend(a3, "length");
    if (v5)
    {
      -[NSMutableSet addObject:](self->_listeners, "addObject:", a3);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)removeListenerID:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_listeners, "removeObject:", a3);
  return a3 != 0;
}

- (FTCServiceMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

@end
