@implementation CWFSCNetworkReachability

- (CWFSCNetworkReachability)init
{
  CWFSCNetworkReachability *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *mutexQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventQueue;
  const __SCNetworkReachability *v9;
  SCNetworkReachabilityContext v11;
  objc_super v12;
  sockaddr address;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CWFSCNetworkReachability;
  v2 = -[CWFSCNetworkReachability init](&v12, sel_init);
  if (!v2)
    goto LABEL_7;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.corewifi.SC-reach-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue)
    goto LABEL_7;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.corewifi.SC-reach-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue)
    goto LABEL_7;
  address = (sockaddr)xmmword_1B0711430;
  v9 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address);
  v2->_reachabilityRef = v9;
  if (v9)
  {
    v11.version = 0;
    memset(&v11.retain, 0, 24);
    v11.info = v2;
    SCNetworkReachabilitySetCallback(v9, (SCNetworkReachabilityCallBack)sub_1B0643DF0, &v11);
  }
  else
  {
LABEL_7:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)CWFSCNetworkReachability;
  -[CWFSCNetworkReachability dealloc](&v4, sel_dealloc);
}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0643FDC;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B064407C;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B0644154;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)flags
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags);
  return flags;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
