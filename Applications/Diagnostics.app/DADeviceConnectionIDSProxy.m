@implementation DADeviceConnectionIDSProxy

- (DADeviceConnectionIDSProxy)initWithState:(id)a3
{
  id v5;
  DADeviceConnectionIDSProxy *v6;
  DADeviceConnectionIDSProxy *v7;
  DAIDSMessengerProxy *v8;
  DAIDSMessengerProxy *messenger;
  dispatch_queue_t v10;
  OS_dispatch_queue *messageSendingQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *messageReceivingQueue;
  NSNumber *lastMessageTimestamp;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceConnectionIDSProxy;
  v6 = -[DADeviceConnectionIDSProxy init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = objc_alloc_init(DAIDSMessengerProxy);
    messenger = v7->_messenger;
    v7->_messenger = v8;

    -[DAIDSMessengerProxy setReceiver:](v7->_messenger, "setReceiver:", v7);
    v7->_communicationAvailable = 1;
    v10 = dispatch_queue_create("com.apple.Diagnostics.messageSendingQueue", 0);
    messageSendingQueue = v7->_messageSendingQueue;
    v7->_messageSendingQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.Diagnostics.messageReceivingQueue", 0);
    messageReceivingQueue = v7->_messageReceivingQueue;
    v7->_messageReceivingQueue = (OS_dispatch_queue *)v12;

    lastMessageTimestamp = v7->_lastMessageTimestamp;
    v7->_lastMessageTimestamp = (NSNumber *)&off_10013F7C0;

  }
  return v7;
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)connect
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B27C;
  v2[3] = &unk_1001335E0;
  v2[4] = self;
  -[DADeviceConnectionIDSProxy _sendMessage:overrideCannotCommunicate:response:](self, "_sendMessage:overrideCannotCommunicate:response:", CFSTR("requestDeviceState"), 0, v2);
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B404;
  v2[3] = &unk_1001335E0;
  v2[4] = self;
  -[DADeviceConnectionIDSProxy _sendMessage:overrideCannotCommunicate:response:](self, "_sendMessage:overrideCannotCommunicate:response:", CFSTR("wakeDevice"), 1, v2);
}

- (void)idle
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B520;
  v2[3] = &unk_1001335E0;
  v2[4] = self;
  -[DADeviceConnectionIDSProxy _sendMessage:overrideCannotCommunicate:response:](self, "_sendMessage:overrideCannotCommunicate:response:", CFSTR("idleDevice"), 0, v2);
}

- (void)end
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
  objc_msgSend(v3, "setPhase:", 5);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B664;
  v4[3] = &unk_1001335E0;
  v4[4] = self;
  -[DADeviceConnectionIDSProxy _sendMessage:overrideCannotCommunicate:response:](self, "_sendMessage:overrideCannotCommunicate:response:", CFSTR("endDevice"), 0, v4);
}

- (void)_ping
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001B780;
  v2[3] = &unk_1001335E0;
  v2[4] = self;
  -[DADeviceConnectionIDSProxy _sendMessage:overrideCannotCommunicate:response:](self, "_sendMessage:overrideCannotCommunicate:response:", CFSTR("requestDeviceState"), 0, v2);
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  __CFString *v11;
  id v12;
  id v13;
  void (**v14)(id, __CFString *, _QWORD);
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  __CFString *v25;
  __int16 v26;
  id v27;

  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, __CFString *, _QWORD))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy destination](self, "destination"));
  v16 = objc_msgSend(v15, "isEqual:", v13);

  if (v16)
  {
    v17 = DiagnosticLogHandleForCategory(7);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received message: %@; from destination: %@;",
        (uint8_t *)&v24,
        0x16u);
    }

    v19 = CFSTR("messageReceived");
    -[DADeviceConnectionIDSProxy _resetDeviceStatePingTimer](self, "_resetDeviceStatePingTimer");
    if (-[__CFString isEqual:](v11, "isEqual:", CFSTR("deviceState")))
    {
      v20 = (__CFString *)v12;
      v21 = objc_opt_class(DADeviceState);
      if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      {
        v22 = DiagnosticLogHandleForCategory(7);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412546;
          v25 = v20;
          v26 = 2112;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received device state: %@; from destination: %@;",
            (uint8_t *)&v24,
            0x16u);
        }

        -[DADeviceConnectionIDSProxy _updateState:](self, "_updateState:", v20);
      }
    }
    else
    {
      v20 = v19;
      v19 = CFSTR("unknownMessage");
    }

    if (v14)
      v14[2](v14, v19, 0);

  }
}

- (void)_sendMessage:(id)a3 overrideCannotCommunicate:(BOOL)a4 response:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy destination](self, "destination"));

  if (v10)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_10001BD4C;
    v29[4] = sub_10001BD74;
    v30 = objc_retainBlock(v9);
    v11 = DiagnosticLogHandleForCategory(7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy destination](self, "destination"));
      *(_DWORD *)buf = 138412546;
      v32 = v8;
      v33 = 2112;
      v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding message to sending queue: %@; to destination: %@;",
        buf,
        0x16u);

    }
    v14 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy messageSendingQueue](self, "messageSendingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BD7C;
    block[3] = &unk_100133680;
    block[4] = self;
    v28 = a4;
    v25 = v8;
    v27 = v29;
    v26 = v9;
    dispatch_async(v14, block);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    v15 = DiagnosticLogHandleForCategory(7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000EAE68((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DADeviceConnectionIDSProxy"), 6, 0));
    if (v9)
      (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD))v9 + 2))(v9, 0, v23, 0, 0);
    +[DSAnalytics sendAnalyticsWithEvent:error:](DSAnalytics, "sendAnalyticsWithEvent:error:", 7, v23);

  }
}

- (void)_updateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy lastMessageTimestamp](self, "lastMessageTimestamp"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy lastMessageTimestamp](self, "lastMessageTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
  v8 = objc_msgSend(v7, "compare:", v6);
  objc_sync_exit(v5);

  if (v8 == (id)1)
  {
    if (objc_msgSend(v4, "phase") == (id)1 || !objc_msgSend(v4, "phase"))
      -[DADeviceConnectionIDSProxy _endDeviceStatePingTimer](self, "_endDeviceStatePingTimer");
    v9 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionIDSProxy state](self, "state"));
    -[NSObject updateWithDeviceState:](v9, "updateWithDeviceState:", v4);
  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(10);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000EB220((uint64_t)v6, (uint64_t)v7, v9);
  }

}

- (void)_startDeviceStatePingTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C7C0;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_endDeviceStatePingTimer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C968;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_resetDeviceStatePingTimer
{
  -[DADeviceConnectionIDSProxy _endDeviceStatePingTimer](self, "_endDeviceStatePingTimer");
  -[DADeviceConnectionIDSProxy _startDeviceStatePingTimer](self, "_startDeviceStatePingTimer");
}

- (DADeviceConnectionDelegate)delegate
{
  return (DADeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DAIDSMessengerProxy)messenger
{
  return self->_messenger;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (DASessionSettings)sessionSettings
{
  return self->_sessionSettings;
}

- (void)setSessionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sessionSettings, a3);
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (NSNumber)lastMessageTimestamp
{
  return self->_lastMessageTimestamp;
}

- (void)setLastMessageTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessageTimestamp, a3);
}

- (NSTimer)deviceStatePingTimer
{
  return self->_deviceStatePingTimer;
}

- (void)setDeviceStatePingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStatePingTimer, a3);
}

- (BOOL)isCommunicationAvailable
{
  return self->_communicationAvailable;
}

- (void)setCommunicationAvailable:(BOOL)a3
{
  self->_communicationAvailable = a3;
}

- (OS_dispatch_queue)messageSendingQueue
{
  return self->_messageSendingQueue;
}

- (void)setMessageSendingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingQueue, a3);
}

- (OS_dispatch_queue)messageReceivingQueue
{
  return self->_messageReceivingQueue;
}

- (void)setMessageReceivingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageReceivingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceivingQueue, 0);
  objc_storeStrong((id *)&self->_messageSendingQueue, 0);
  objc_storeStrong((id *)&self->_deviceStatePingTimer, 0);
  objc_storeStrong((id *)&self->_lastMessageTimestamp, 0);
  objc_storeStrong((id *)&self->_sessionSettings, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
