@implementation APUIBrokerHelper

- (APUIBrokerHelper)init
{
  APUIBrokerHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  uint64_t v7;
  NSMutableDictionary *pendingRequests;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APUIBrokerHelper;
  v2 = -[APUIBrokerHelper init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("APUIBrokerHelper.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("APUIBrokerHelper.notification", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMutableDictionary *)v7;

  }
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper init]", 33554482, "APUIBrokerHelper [%{ptr}] created.", v2);
  }
  return v2;
}

- (void)_handleGetInfoResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  int v17;
  const __CFString *v18;
  int v19;
  OS_dispatch_queue *notificationQueue;
  _QWORD block[4];
  __CFString *v22;
  id v23;
  int v24;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    if (v10 && !IsAppleInternalBuild())
      v14 = CFSTR("#Redacted#");
    else
      v14 = v10;
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 33554482, "[%{ptr}] Handling discovery broker GetInfo %'@ response error: %{error} %@", self, v11, v12, v14);
  }
  v15 = NSErrorToOSStatus(v12);
  if ((_DWORD)v15)
  {
    v19 = v15;
    APSLogErrorAt(v15, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 99, 0);
    v16 = 0;
  }
  else
  {
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("BrokerGroupInfo")));
    if (v16)
    {
      if (dword_10001EB68 <= 50
        && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
      {
        v17 = IsAppleInternalBuild();
        v18 = CFSTR("#Redacted#");
        if (v17)
          v18 = v16;
        LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 33554482, "[%{ptr}] GetInfo response - request %'@ succeeded with brokerGroupInfo %@\n", self, v11, v18);
      }
      v19 = 0;
    }
    else
    {
      APSLogErrorAt(0, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 102, 0);
      v19 = -6705;
    }
  }
  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005684;
    block[3] = &unk_100018638;
    v23 = v13;
    v24 = v19;
    v22 = v16;
    dispatch_async((dispatch_queue_t)notificationQueue, block);

  }
}

- (void)getBrokerGroupInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  APUIBrokerHelper *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000057B8;
  block[3] = &unk_100018688;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)_handleAuthenticationResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  int v17;
  const __CFString *v18;
  int v19;
  OS_dispatch_queue *notificationQueue;
  _QWORD block[4];
  __CFString *v22;
  id v23;
  int v24;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    if (v10 && !IsAppleInternalBuild())
      v14 = CFSTR("#Redacted#");
    else
      v14 = v10;
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 33554482, "[%{ptr}] Handling discovery broker authentication %'@ response error: %{error} %@", self, v11, v12, v14);
  }
  v15 = NSErrorToOSStatus(v12);
  if ((_DWORD)v15)
  {
    v19 = v15;
    APSLogErrorAt(v15, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 146, 0);
    v16 = 0;
    goto LABEL_20;
  }
  if (!v10)
  {
    APSLogErrorAt(0, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 148, 0);
    v16 = 0;
LABEL_26:
    v19 = -6705;
    goto LABEL_20;
  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("AuthTargetReceiverDeviceID")));
  if (!v16)
  {
    APSLogErrorAt(0, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 151, 0);
    goto LABEL_26;
  }
  if (dword_10001EB68 <= 50
    && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554482)))
  {
    v17 = IsAppleInternalBuild();
    v18 = CFSTR("#Redacted#");
    if (v17)
      v18 = v16;
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 33554482, "[%{ptr}] Auth response - request %'@ succeeded with authTargetReceiverDeviceID %@\n", self, v11, v18);
  }
  v19 = 0;
LABEL_20:
  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005AE4;
    block[3] = &unk_100018638;
    v23 = v13;
    v24 = v19;
    v22 = v16;
    dispatch_async((dispatch_queue_t)notificationQueue, block);

  }
}

- (void)performBrokerAuthenticationForBrokerGroup:(id)a3 withBrokerAuth:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  APUIBrokerHelper *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005C38;
  v15[3] = &unk_1000186B0;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);

}

- (void)_sendBrokerRequest:(id)a3 params:(id)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_dispatch_queue *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005DF4;
  block[3] = &unk_100018700;
  block[4] = self;
  v18 = v11;
  v20 = v12;
  v21 = a5;
  v19 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)_handleBrokerResponse:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  APUIBrokerHelper *v15;
  void *v16;
  id v17;
  NSObject *v18;
  __CFString *v19;

  v4 = (__CFString *)a3;
  v19 = v4;
  if (!v4)
  {
    APSLogErrorAt(0, "-[APUIBrokerHelper _handleBrokerResponse:]", 248, 0);
LABEL_25:
    v10 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  if (dword_10001EB68 <= 50)
  {
    if (dword_10001EB68 != -1 || (v8 = _LogCategory_Initialize(&dword_10001EB68, 33554482), v5 = v19, v8))
    {
      v6 = IsAppleInternalBuild();
      v7 = CFSTR("#Redacted#");
      if (v6)
        v7 = v19;
      LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleBrokerResponse:]", 33554482, "[%{ptr}] Handling discovery broker response %@", self, v7);
      v5 = v19;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("RequestType")));
  if (!v9)
  {
    if (dword_10001EB68 <= 90
      && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554522)))
    {
      LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleBrokerResponse:]", 33554522, "[%{ptr}] Broker response - no command specified\n", self);
    }
    goto LABEL_25;
  }
  v10 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", CFSTR("RequestUUID")));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", CFSTR("Status")));
    v14 = objc_msgSend(v13, "intValue");

    if ((_DWORD)v14)
      APSLogErrorAt(v14, "-[APUIBrokerHelper _handleBrokerResponse:]", 265, 0);
    v15 = self;
    objc_sync_enter(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15->_pendingRequests, "objectForKeyedSubscript:", v12));
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      objc_msgSend(v17, "setResponse:", v19);
      objc_msgSend(v17, "setStatus:", v14);
      objc_sync_exit(v17);

      objc_sync_exit(v15);
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "semaphore"));
      dispatch_semaphore_signal(v18);

    }
    else
    {
      objc_sync_exit(v15);

    }
  }
  else if (dword_10001EB68 <= 90
         && (dword_10001EB68 != -1 || _LogCategory_Initialize(&dword_10001EB68, 33554522)))
  {
    LogPrintF(&dword_10001EB68, "-[APUIBrokerHelper _handleBrokerResponse:]", 33554522, "[%{ptr}] Broker response - no request UUID specified\n", self);
  }
LABEL_16:

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006614;
  block[3] = &unk_100018720;
  block[4] = a1;
  if (qword_10001F048 != -1)
    dispatch_once(&qword_10001F048, block);
  return (id)qword_10001F050;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
