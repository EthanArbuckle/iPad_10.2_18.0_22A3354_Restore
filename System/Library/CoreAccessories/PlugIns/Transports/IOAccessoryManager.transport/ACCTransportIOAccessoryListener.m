@implementation ACCTransportIOAccessoryListener

- (ACCTransportIOAccessoryListener)initWithDelegate:(id)a3
{
  id v4;
  ACCTransportIOAccessoryListener *v5;
  ACCTransportIOAccessoryListener *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ioAccessoryListenerQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCTransportIOAccessoryListener;
  v5 = -[ACCTransportIOAccessoryListener init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_create("com.apple.ACCTransport.IOAccessoryListener", 0);
    ioAccessoryListenerQueue = v6->_ioAccessoryListenerQueue;
    v6->_ioAccessoryListenerQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[ACCTransportIOAccessoryListener stopListening](self, "stopListening");
  v3.receiver = self;
  v3.super_class = (Class)ACCTransportIOAccessoryListener;
  -[ACCTransportIOAccessoryListener dealloc](&v3, sel_dealloc);
}

- (void)startListening
{
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryManagerClass](self, "_startListeningForIOAccessoryManagerClass");
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryPortClass](self, "_startListeningForIOAccessoryPortClass");
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryAuthCPClass](self, "_startListeningForIOAccessoryAuthCPClass");
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryEAClass](self, "_startListeningForIOAccessoryEAClass");
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryOOBPairingClass](self, "_startListeningForIOAccessoryOOBPairingClass");
  -[ACCTransportIOAccessoryListener _startListeningForIOAccessoryConfigStreamClass](self, "_startListeningForIOAccessoryConfigStreamClass");
}

- (void)stopListening
{
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryOOBPairingClass](self, "_stopListeningForIOAccessoryOOBPairingClass");
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryEAClass](self, "_stopListeningForIOAccessoryEAClass");
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryAuthCPClass](self, "_stopListeningForIOAccessoryAuthCPClass");
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryPortClass](self, "_stopListeningForIOAccessoryPortClass");
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryManagerClass](self, "_stopListeningForIOAccessoryManagerClass");
  -[ACCTransportIOAccessoryListener _stopListeningForIOAccessoryConfigStreamClass](self, "_stopListeningForIOAccessoryConfigStreamClass");
}

- (void)_startListeningForIOAccessoryManagerClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kIOAccessoryManagerClass kIOTerminatedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryManagerAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryManagerServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryManagerTerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryManagerServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryManagerClass
{
  IONotificationPort *ioAccessoryManagerClassNotify;
  io_object_t ioAccessoryManagerClassIteratorArrived;
  io_object_t ioAccessoryManagerClassIteratorTerminated;

  ioAccessoryManagerClassNotify = self->_ioAccessoryManagerClassNotify;
  if (ioAccessoryManagerClassNotify)
    IONotificationPortDestroy(ioAccessoryManagerClassNotify);
  ioAccessoryManagerClassIteratorArrived = self->_ioAccessoryManagerClassIteratorArrived;
  if (ioAccessoryManagerClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryManagerClassIteratorArrived);
    self->_ioAccessoryManagerClassIteratorArrived = 0;
  }
  ioAccessoryManagerClassIteratorTerminated = self->_ioAccessoryManagerClassIteratorTerminated;
  if (ioAccessoryManagerClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryManagerClassIteratorTerminated);
    self->_ioAccessoryManagerClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryPortClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kIOAccessoryPortClass kIOPublishNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryPortAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryPortServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryPortTerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryPortServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryPortClass
{
  IONotificationPort *ioAccessoryPortClassNotify;
  io_object_t ioAccessoryPortClassIteratorArrived;
  io_object_t ioAccessoryPortClassIteratorTerminated;

  ioAccessoryPortClassNotify = self->_ioAccessoryPortClassNotify;
  if (ioAccessoryPortClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryPortClassNotify);
    self->_ioAccessoryPortClassNotify = 0;
  }
  ioAccessoryPortClassIteratorArrived = self->_ioAccessoryPortClassIteratorArrived;
  if (ioAccessoryPortClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryPortClassIteratorArrived);
    self->_ioAccessoryPortClassIteratorArrived = 0;
  }
  ioAccessoryPortClassIteratorTerminated = self->_ioAccessoryPortClassIteratorTerminated;
  if (ioAccessoryPortClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryPortClassIteratorTerminated);
    self->_ioAccessoryPortClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryAuthCPClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kAppleAuthCPClassKey kIOPublishNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryAuthCPAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryAuthCPServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryAuthCPTerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryAuthCPServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryAuthCPClass
{
  IONotificationPort *ioAccessoryAuthCPClassNotify;
  io_object_t ioAccessoryAuthCPClassIteratorArrived;
  io_object_t ioAccessoryAuthCPClassIteratorTerminated;

  ioAccessoryAuthCPClassNotify = self->_ioAccessoryAuthCPClassNotify;
  if (ioAccessoryAuthCPClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryAuthCPClassNotify);
    self->_ioAccessoryAuthCPClassNotify = 0;
  }
  ioAccessoryAuthCPClassIteratorArrived = self->_ioAccessoryAuthCPClassIteratorArrived;
  if (ioAccessoryAuthCPClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryAuthCPClassIteratorArrived);
    self->_ioAccessoryAuthCPClassIteratorArrived = 0;
  }
  ioAccessoryAuthCPClassIteratorTerminated = self->_ioAccessoryAuthCPClassIteratorTerminated;
  if (ioAccessoryAuthCPClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryAuthCPClassIteratorTerminated);
    self->_ioAccessoryAuthCPClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryEAClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kIOAccessoryEAInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryEAAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryEAServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryEATerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryEAServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryEAClass
{
  IONotificationPort *ioAccessoryEAClassNotify;
  io_object_t ioAccessoryEAClassIteratorArrived;
  io_object_t ioAccessoryEAClassIteratorTerminated;

  ioAccessoryEAClassNotify = self->_ioAccessoryEAClassNotify;
  if (ioAccessoryEAClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryEAClassNotify);
    self->_ioAccessoryEAClassNotify = 0;
  }
  ioAccessoryEAClassIteratorArrived = self->_ioAccessoryEAClassIteratorArrived;
  if (ioAccessoryEAClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryEAClassIteratorArrived);
    self->_ioAccessoryEAClassIteratorArrived = 0;
  }
  ioAccessoryEAClassIteratorTerminated = self->_ioAccessoryEAClassIteratorTerminated;
  if (ioAccessoryEAClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryEAClassIteratorTerminated);
    self->_ioAccessoryEAClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryOOBPairingClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kIOAccessoryOOBPairingInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryOOBPairingAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryOOBPairingServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryOOBPairingTerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryOOBPairingServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryOOBPairingClass
{
  IONotificationPort *ioAccessoryOOBPairingClassNotify;
  io_object_t ioAccessoryOOBPairingClassIteratorArrived;
  io_object_t ioAccessoryOOBPairingClassIteratorTerminated;

  ioAccessoryOOBPairingClassNotify = self->_ioAccessoryOOBPairingClassNotify;
  if (ioAccessoryOOBPairingClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryOOBPairingClassNotify);
    self->_ioAccessoryOOBPairingClassNotify = 0;
  }
  ioAccessoryOOBPairingClassIteratorArrived = self->_ioAccessoryOOBPairingClassIteratorArrived;
  if (ioAccessoryOOBPairingClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryOOBPairingClassIteratorArrived);
    self->_ioAccessoryOOBPairingClassIteratorArrived = 0;
  }
  ioAccessoryOOBPairingClassIteratorTerminated = self->_ioAccessoryOOBPairingClassIteratorTerminated;
  if (ioAccessoryOOBPairingClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryOOBPairingClassIteratorTerminated);
    self->_ioAccessoryOOBPairingClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryConfigStreamClass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_21722C000, v0, v1, "ret = 0x%X for kIOAccessoryConfigStreamInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_ioAccessoryConfigStreamAttached:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryConfigStreamServiceArrived:", v3);

    }
  }
}

- (void)_ioAccessoryConfigStreamTerminated:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  -[ACCTransportIOAccessoryListener delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ACCTransportIOAccessoryListener delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[ACCTransportIOAccessoryListener delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "IOAccessoryConfigStreamServiceTerminated:", v3);

    }
  }
}

- (void)_stopListeningForIOAccessoryConfigStreamClass
{
  IONotificationPort *ioAccessoryConfigStreamClassNotify;
  io_object_t ioAccessoryConfigStreamClassIteratorArrived;
  io_object_t ioAccessoryConfigStreamClassIteratorTerminated;

  ioAccessoryConfigStreamClassNotify = self->_ioAccessoryConfigStreamClassNotify;
  if (ioAccessoryConfigStreamClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryConfigStreamClassNotify);
    self->_ioAccessoryConfigStreamClassNotify = 0;
  }
  ioAccessoryConfigStreamClassIteratorArrived = self->_ioAccessoryConfigStreamClassIteratorArrived;
  if (ioAccessoryConfigStreamClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryConfigStreamClassIteratorArrived);
    self->_ioAccessoryConfigStreamClassIteratorArrived = 0;
  }
  ioAccessoryConfigStreamClassIteratorTerminated = self->_ioAccessoryConfigStreamClassIteratorTerminated;
  if (ioAccessoryConfigStreamClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryConfigStreamClassIteratorTerminated);
    self->_ioAccessoryConfigStreamClassIteratorTerminated = 0;
  }
}

- (ACCTransportIOAccessoryListenerProtocol)delegate
{
  return (ACCTransportIOAccessoryListenerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ioAccessoryListenerQueue, 0);
}

@end
