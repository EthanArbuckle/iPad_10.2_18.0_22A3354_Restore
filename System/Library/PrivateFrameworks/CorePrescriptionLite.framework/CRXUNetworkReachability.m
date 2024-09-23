@implementation CRXUNetworkReachability

+ (CRXUNetworkReachability)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CRXUNetworkReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___0 != -1)
    dispatch_once(&sharedInstance___once__LINE___0, block);
  return (CRXUNetworkReachability *)(id)sharedInstance_instance_0;
}

void __41__CRXUNetworkReachability_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;

}

- (CRXUNetworkReachability)init
{
  id v2;
  CRXUNetworkReachability *v3;
  uint64_t v4;
  CRXUDispatchQueue *serialQueue;
  CRXUWeakObserverList *v6;
  CRXUWeakObserverList *observers;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRXUNetworkReachability;
  v2 = -[CRXUNetworkReachability init](&v11, sel_init);
  v3 = (CRXUNetworkReachability *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 3) = 0;
    *((_WORD *)v2 + 8) = 528;
    *((_QWORD *)v2 + 1) = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], (const sockaddr *)v2 + 1);
    +[CRXUDispatchQueue serialQueueWithName:](CRXUDispatchQueue, "serialQueueWithName:", CFSTR("com.apple.CorePrescription.NetworkQueue"));
    v4 = objc_claimAutoreleasedReturnValue();
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (CRXUDispatchQueue *)v4;

    -[CRXUNetworkReachability registerNetworkReachabilityCallback](v3, "registerNetworkReachabilityCallback");
    v6 = objc_alloc_init(CRXUWeakObserverList);
    observers = v3->_observers;
    v3->_observers = v6;

    v8 = os_log_create(CRXULoggingSubsystem, CRXULoggingCategory);
    log = v3->_log;
    v3->_log = (OS_os_log *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_reachabilityRef);
  v3.receiver = self;
  v3.super_class = (Class)CRXUNetworkReachability;
  -[CRXUNetworkReachability dealloc](&v3, sel_dealloc);
}

- (BOOL)isConnected
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 2) != 0;
}

- (void)addNetworkObserver:(id)a3
{
  -[CRXUWeakObserverList addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeNetworkObserver:(id)a3
{
  -[CRXUWeakObserverList removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)registerNetworkReachabilityCallback
{
  os_log_t v0;
  uint8_t v1[14];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = 86;
  _os_log_error_impl(&dword_239FC4000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Error in observing network calls", v1, 0x12u);
}

- (void)noteReachabilityChange
{
  os_log_t v0;
  uint8_t v1[14];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = 92;
  _os_log_debug_impl(&dword_239FC4000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: (notify) internet is Connected", v1, 0x12u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
