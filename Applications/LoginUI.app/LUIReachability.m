@implementation LUIReachability

+ (LUIReachability)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const sockaddr *)a3);
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 2) = v5;
      *((_BYTE *)v4 + 8) = 0;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return (LUIReachability *)v4;
}

+ (LUIReachability)reachabilityForInternetConnection
{
  _QWORD v3[2];

  v3[1] = 0;
  v3[0] = 528;
  return (LUIReachability *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v3));
}

+ (LUIReachability)reachabilityForLocalWiFi
{
  _BYTE *v2;
  _QWORD v4[2];

  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v4));
  if (v2)
    v2[8] = 1;
  return (LUIReachability *)v2;
}

- (LUIReachability)init
{
  LUIReachability *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observerQueue;
  NSMutableArray *v5;
  NSMutableArray *networkObservers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LUIReachability;
  v2 = -[LUIReachability init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("LUIReachability_observer_queue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(NSMutableArray);
    networkObservers = v2->_networkObservers;
    v2->_networkObservers = v5;

  }
  return v2;
}

- (unint64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (a3 >> 1) & 1;
}

- (unint64_t)networkStatusForFlags:(unsigned int)a3
{
  unint64_t v4;

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

- (void)_printReachabilityStatus:(unint64_t)a3
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  uint8_t buf[2];
  __int16 v8;

  switch(a3)
  {
    case 2uLL:
      v3 = qword_100088F10;
      if (!os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
        return;
      v6 = 0;
      v4 = "Network is reachable via WWAN";
      v5 = (uint8_t *)&v6;
      goto LABEL_10;
    case 1uLL:
      v3 = qword_100088F10;
      if (!os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)buf = 0;
      v4 = "Network is reachable via WiFi";
      v5 = buf;
      goto LABEL_10;
    case 0uLL:
      v3 = qword_100088F10;
      if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        v4 = "Network is not reachable";
        v5 = (uint8_t *)&v8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
      break;
  }
}

- (unint64_t)currentReachabilityStatus
{
  _BOOL4 localWiFiRef;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  uint8_t v9[16];
  uint8_t buf[12];
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags))
  {
    localWiFiRef = self->localWiFiRef;
    v4 = qword_100088F10;
    v5 = os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT);
    if (localWiFiRef)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking local WiFi status", buf, 2u);
      }
      v6 = -[LUIReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking network status", v9, 2u);
      }
      v6 = -[LUIReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  -[LUIReachability _printReachabilityStatus:](self, "_printReachabilityStatus:", v7);
  return v7;
}

- (void)waitForNetworkAndExecuteBlock:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029794;
  v7[3] = &unk_100069330;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

- (void)_queue_notifyObservers
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];

  v3 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will notifiy all network observers", buf, 2u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIReachability networkObservers](self, "networkObservers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8) + 16))();
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIReachability networkObservers](self, "networkObservers"));
  objc_msgSend(v9, "removeAllObjects");

}

- (void)_observeNetworkReachability
{
  NSObject *v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Main;
  SCNetworkReachabilityContext v6;

  v3 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6.version) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start observing network reachability", (uint8_t *)&v6, 2u);
  }
  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = self;
  SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_100029A34, &v6);
  reachabilityRef = self->reachabilityRef;
  Main = CFRunLoopGetMain();
  SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Main, kCFRunLoopCommonModes);
  -[LUIReachability setIsWaitingForNetwork:](self, "setIsWaitingForNetwork:", 1);
}

- (void)_networkReachabilityChanged:(unsigned int)a3
{
  NSObject *observerQueue;
  _QWORD v4[5];
  unsigned int v5;

  observerQueue = self->_observerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029A9C;
  v4[3] = &unk_100069B30;
  v4[4] = self;
  v5 = a3;
  dispatch_async(observerQueue, v4);
}

- (NSMutableArray)networkObservers
{
  return self->_networkObservers;
}

- (void)setNetworkObservers:(id)a3
{
  objc_storeStrong((id *)&self->_networkObservers, a3);
}

- (BOOL)isWaitingForNetwork
{
  return self->_isWaitingForNetwork;
}

- (void)setIsWaitingForNetwork:(BOOL)a3
{
  self->_isWaitingForNetwork = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_networkObservers, 0);
}

@end
