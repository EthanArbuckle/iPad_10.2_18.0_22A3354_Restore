@implementation AXIPCOutstandingAsyncRequest

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXIPCOutstandingAsyncRequest;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_token != -1)
    dispatch_once(&initialize_token, &__block_literal_global_17);
}

void __42__AXIPCOutstandingAsyncRequest_initialize__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)OutstandingAsyncRequestsLock;
  OutstandingAsyncRequestsLock = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)AllOutstandingAsyncRequests;
  AllOutstandingAsyncRequests = (uint64_t)v2;

}

+ (id)lookupByPort:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend((id)OutstandingAsyncRequestsLock, "lock");
  v4 = (void *)AllOutstandingAsyncRequests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = AXRetainAutorelease(v6);
  objc_msgSend((id)OutstandingAsyncRequestsLock, "unlock");
  return v6;
}

+ (void)unregisterByPort:(unsigned int)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)OutstandingAsyncRequestsLock, "lock");
  v4 = (void *)AllOutstandingAsyncRequests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend((id)OutstandingAsyncRequestsLock, "unlock");
}

+ (void)registerOutstandingRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = (void *)OutstandingAsyncRequestsLock;
  v4 = a3;
  objc_msgSend(v3, "lock");
  v5 = (void *)AllOutstandingAsyncRequests;
  v6 = objc_msgSend(v4, "replyPort");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, v7);

  objc_msgSend((id)OutstandingAsyncRequestsLock, "unlock");
}

- (AXIPCOutstandingAsyncRequest)initWithReplyPort:(unsigned int)a3 handlerQueue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  AXIPCOutstandingAsyncRequest *v11;
  uint64_t v12;
  uint64_t v13;
  void *replyHandler;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AXIPCOutstandingAsyncRequest;
  v11 = -[AXIPCOutstandingAsyncRequest init](&v16, sel_init);
  if (v11)
  {
    if (a3 - 1 >= 0xFFFFFFFE)
      _AXAssert();
    v12 = MSHCreateMIGServerSource();
    v11->_replyMachPortSource = (__CFRunLoopSource *)v12;
    if (v12)
    {
      MSHMIGSourceSetSendOnceCallback();
      v11->_replyPort = a3;
      objc_storeStrong((id *)&v11->_replyQueue, a4);
      v13 = objc_msgSend(v10, "copy");
      replyHandler = v11->_replyHandler;
      v11->_replyHandler = (id)v13;
    }
    else
    {
      replyHandler = v11;
      v11 = 0;
    }

  }
  return v11;
}

- (void)dealloc
{
  id replyHandler;
  __CFRunLoopSource *replyMachPortSource;
  __CFRunLoopSource *v5;
  mach_port_name_t replyPort;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;

  replyHandler = self->_replyHandler;
  self->_replyHandler = 0;

  replyMachPortSource = self->_replyMachPortSource;
  if (replyMachPortSource)
  {
    CFRunLoopSourceInvalidate(replyMachPortSource);
    v5 = self->_replyMachPortSource;
    if (v5)
    {
      CFRelease(v5);
      self->_replyMachPortSource = 0;
    }
  }
  replyPort = self->_replyPort;
  if (replyPort + 1 >= 2)
  {
    v7 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], replyPort, 1u, -1);
    if ((_DWORD)v7)
    {
      v8 = v7;
      v9 = mach_error_string(v7);
      v12 = "-[AXIPCOutstandingAsyncRequest dealloc]";
      v13 = self->_replyPort;
      v10 = v8;
      v11 = v9;
      _AXAssert();
    }
    self->_replyPort = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)AXIPCOutstandingAsyncRequest;
  -[AXIPCOutstandingAsyncRequest dealloc](&v14, sel_dealloc, v10, v11, v12, v13);
}

- (void)registerAndListenForResponse
{
  __CFRunLoop *Main;
  __CFRunLoopSource *v4;

  objc_msgSend((id)objc_opt_class(), "registerOutstandingRequest:", self);
  Main = CFRunLoopGetMain();
  v4 = -[AXIPCOutstandingAsyncRequest replyMachPortSource](self, "replyMachPortSource");
  CFRunLoopAddSource(Main, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
}

- (void)_responseReceived:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AXIPCOutstandingAsyncRequest replyMachPortSource](self, "replyMachPortSource");
  MSHMIGSourceSetSendOnceCallback();
  objc_msgSend((id)objc_opt_class(), "unregisterByPort:", -[AXIPCOutstandingAsyncRequest replyPort](self, "replyPort"));
  -[AXIPCOutstandingAsyncRequest replyQueue](self, "replyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AXIPCOutstandingAsyncRequest__responseReceived___block_invoke;
  v7[3] = &unk_1E24C5200;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__AXIPCOutstandingAsyncRequest__responseReceived___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "replyHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), 0);

}

- (void)rawResponseReceived:(id)a3
{
  id v4;

  +[AXIPCMessage archivedMessageFromData:](AXIPCMessage, "archivedMessageFromData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXIPCOutstandingAsyncRequest _responseReceived:](self, "_responseReceived:", v4);

}

- (void)sendOnceRightDestroyed
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "unregisterByPort:", -[AXIPCOutstandingAsyncRequest replyPort](self, "replyPort"));
  -[AXIPCOutstandingAsyncRequest replyQueue](self, "replyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AXIPCOutstandingAsyncRequest_sendOnceRightDestroyed__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(v3, block);

}

void __54__AXIPCOutstandingAsyncRequest_sendOnceRightDestroyed__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;

  objc_msgSend(MEMORY[0x1E0CF39C0], "errorWithDescription:", CFSTR("reply send-once right was destroyed, so this async request (%@) will never receive a reply."), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "replyHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))v2)[2](v2, 0, v3);

}

- (void)initialSendAborted
{
  objc_msgSend((id)objc_opt_class(), "unregisterByPort:", -[AXIPCOutstandingAsyncRequest replyPort](self, "replyPort"));
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (unsigned)replyPort
{
  return self->_replyPort;
}

- (id)replyHandler
{
  return self->_replyHandler;
}

- (__CFRunLoopSource)replyMachPortSource
{
  return self->_replyMachPortSource;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end
