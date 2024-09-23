@implementation FlexReachability

- (FlexReachability)init
{
  FlexReachability *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *reachabilityQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlexReachability;
  v2 = -[FlexReachability init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.FlexMusic.reachability", v3);
    reachabilityQueue = v2->_reachabilityQueue;
    v2->_reachabilityQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id result;
  id v11;

  v4 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  result = SCNetworkReachabilityCreateWithName(0, v9);
  if (result)
  {
    v11 = result;
    result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((_QWORD *)result + 2) = v11;
      *((_BYTE *)result + 9) = 0;
    }
  }
  return result;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  id result;
  id v5;

  result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], (const sockaddr *)a3);
  if (result)
  {
    v5 = result;
    result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((_QWORD *)result + 2) = v5;
      *((_BYTE *)result + 9) = 0;
    }
  }
  return result;
}

+ (id)reachabilityForInternetConnection
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[1] = 0;
  v5[0] = 528;
  return (id)objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v5, v2, v3);
}

+ (id)reachabilityForLocalWiFi
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[1] = 0;
  v6[0] = 0xFEA900000210;
  v4 = (_BYTE *)objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v6, v2, v3);
  if (v4)
    v4[9] = 1;
  return v4;
}

- (BOOL)startNotifier
{
  NSObject *v3;
  const char *v4;
  uint8_t *p_context;
  BOOL result;
  int v7;
  FlexReachability *v8;
  SCNetworkReachabilityContext context;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_isNotifying)
  {
    FlexLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(context.version) = 138412290;
      *(CFIndex *)((char *)&context.version + 4) = (CFIndex)self;
      v4 = "ERROR: Attempting to start notifier when already notifying for %@";
      p_context = (uint8_t *)&context;
LABEL_9:
      _os_log_impl(&dword_20D016000, v3, OS_LOG_TYPE_DEFAULT, v4, p_context, 0xCu);
    }
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    if (SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_20D019AA8, &context)
      && SCNetworkReachabilitySetDispatchQueue(self->reachabilityRef, (dispatch_queue_t)self->_reachabilityQueue))
    {
      result = 1;
      self->_isNotifying = 1;
      return result;
    }
    FlexLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = self;
      v4 = "ERROR: Could not start notifier for %@";
      p_context = (uint8_t *)&v7;
      goto LABEL_9;
    }
  }

  return 0;
}

- (void)stopNotifier
{
  __SCNetworkReachability *reachabilityRef;
  NSObject *v4;
  int v5;
  FlexReachability *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_isNotifying)
  {
    reachabilityRef = self->reachabilityRef;
    if (reachabilityRef
      && SCNetworkReachabilitySetDispatchQueue(reachabilityRef, 0)
      && SCNetworkReachabilitySetCallback(self->reachabilityRef, 0, 0))
    {
      self->_isNotifying = 0;
    }
    else if (self->_isNotifying)
    {
      FlexLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138412290;
        v6 = self;
        _os_log_impl(&dword_20D016000, v4, OS_LOG_TYPE_DEFAULT, "ERROR: Could not stop notifier for %@", (uint8_t *)&v5, 0xCu);
      }

    }
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __SCNetworkReachability *reachabilityRef;
  objc_super v7;

  objc_msgSend_stopNotifier(self, a2, v2, v3, v4);
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v7.receiver = self;
  v7.super_class = (Class)FlexReachability;
  -[FlexReachability dealloc](&v7, sel_dealloc);
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v4;

  if ((a3 & 2) == 0)
    return 0;
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    LODWORD(v4) = 0;
  if ((a3 & 4) != 0)
    v4 = v4;
  else
    v4 = 1;
  if ((a3 & 0x40000) != 0)
    return 2;
  else
    return v4;
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

- (BOOL)interventionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 0x10) != 0;
}

- (int64_t)currentReachabilityStatus
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags))
    return 0;
  if (self->localWiFiRef)
    return objc_msgSend_localWiFiStatusForFlags_(self, v3, flags, v4, v5);
  return objc_msgSend_networkStatusForFlags_(self, v3, flags, v4, v5);
}

- (OS_dispatch_queue)reachabilityQueue
{
  return self->_reachabilityQueue;
}

- (void)setReachabilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityQueue, 0);
}

@end
