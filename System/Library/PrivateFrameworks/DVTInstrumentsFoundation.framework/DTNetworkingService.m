@implementation DTNetworkingService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.networking"), 2, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.networking.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.networking.deferred"), 1, a1);

}

- (DTNetworkingService)initWithChannel:(id)a3
{
  DTNetworkingService *v3;
  DTNetworkingService *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)DTNetworkingService;
  v3 = -[DTXService initWithChannel:](&v19, sel_initWithChannel_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_filteredToPid = -1;
    v5 = dispatch_queue_create("com.apple.dt.instruments.networking", 0);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v5;

    v4->_netstatMan = 0;
    v4->_isAppleInternal = +[DTInstrumentServer isAppleInternal](DTInstrumentServer, "isAppleInternal");
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("XRIncludeLoopback"));

    if ((v8 & 1) != 0 || (v18 = 0, !sub_222B1E094((uint64_t)"lo0", &v18)))
      NSLog(CFSTR("Including Loopback device in recording"));
    else
      v4->_hiddenInterfaces |= 1 << v18;
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(&unk_24EB4E8A0, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(&unk_24EB4E8A0);
          if (sub_222B1E094(objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12)), "UTF8String"), &v18))
          {
            v4->_hiddenInterfaces |= 1 << v18;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(&unk_24EB4E8A0, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }
  }
  return v4;
}

- (void)messageReceived:(id)a3
{
  if (objc_msgSend(a3, "errorStatus") == 2)
  {
    self->_seenInterfaces = 0;
    self->_isDisconnected = 1;
    MEMORY[0x24BEDD108](self, sel_stopMonitoring);
  }
}

- (void)startMonitoring
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_222B1E304;
  v4[3] = &unk_24EB28000;
  objc_copyWeak(&v5, &location);
  dispatch_sync(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)serviceName
{
  return CFSTR("com.apple.instruments.server.services.networking");
}

- (void)stopMonitoring
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B1E5DC;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)setTargetPID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *workQueue;
  _QWORD block[5];
  int v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "intValue");
    v7 = v6;
    if ((v6 - 1000001) < 0xFFF0BDBE)
    {
      NSLog(CFSTR("Supplied pid to filter, %d, is invalid, removing all pid filters"), v6);
      self->_filteredToPid = -1;
    }
  }
  else
  {
    NSLog(CFSTR("Passed a nil PID for the filter, removing pid filtering for networking service"));
    v7 = -1;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B1E6E8;
  block[3] = &unk_24EB28028;
  block[4] = self;
  v10 = v7;
  dispatch_async(workQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
