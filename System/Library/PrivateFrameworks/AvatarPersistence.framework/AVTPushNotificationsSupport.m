@implementation AVTPushNotificationsSupport

- (AVTPushNotificationsSupport)initWithEnvironment:(id)a3 connectionFactory:(id)a4
{
  id v7;
  id v8;
  AVTPushNotificationsSupport *v9;
  AVTPushNotificationsSupport *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  OS_dispatch_queue *connectionQueue;
  uint64_t v14;
  AVTUILogger *logger;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTPushNotificationsSupport;
  v9 = -[AVTPushNotificationsSupport init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_msgSend(v7, "serialQueueProvider");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v11)[2](v11, "com.apple.AvatarUI.AVTPushNotificationSupport.connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(v7, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v10->_logger;
    v10->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v10->_connectionFactory, a4);
  }

  return v10;
}

- (void)getAPSEnvironmentString:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, *MEMORY[0x24BE08720], 0);
}

- (void)setupConnectionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AVTPushNotificationsSupport_setupConnectionWithCompletionHandler___block_invoke;
  v6[3] = &unk_24DD32FE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AVTPushNotificationsSupport getAPSEnvironmentString:](self, "getAPSEnvironmentString:", v6);

}

void __68__AVTPushNotificationsSupport_setupConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionWithEnvironmentName:namedDelegatePort:queue:", v5, CFSTR("com.apple.aps.avatar.service"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v9, 0);
    }
    else
    {
      v14 = *MEMORY[0x24BDD0FD8];
      v15[0] = CFSTR("Unable to create an APSConnection");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTError errorWithCode:userInfo:](AVTError, "errorWithCode:userInfo:", 1, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v13);

    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
  }

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AVTPushNotificationsSupport logger](self, "logger");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "logPushConnectionReceivedPublicToken:", v6);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[AVTPushNotificationsSupport logger](self, "logger");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "logPushConnectionReceivedToken:topic:identifier:", v12, v10, v9);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB9170], "notificationFromRemoteNotificationDictionary:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPushNotificationsSupport logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logPushNotificationReceivedForTopic:payload:", v8, v9);

  -[AVTPushNotificationsSupport delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didReceivePushNotification:", self);

}

+ (id)topic
{
  return (id)objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.avatarsd"));
}

- (void)startListeningToPushNotifications
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__AVTPushNotificationsSupport_startListeningToPushNotifications__block_invoke;
  v2[3] = &unk_24DD33008;
  v2[4] = self;
  -[AVTPushNotificationsSupport setupConnectionWithCompletionHandler:](self, "setupConnectionWithCompletionHandler:", v2);
}

void __64__AVTPushNotificationsSupport_startListeningToPushNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setPushConnection:", v5);
    objc_msgSend((id)objc_opt_class(), "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pushConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEnabledTopics:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logUnableToCreatePushConnection:", v11);

  }
}

- (void)stopListeningToPushNotifications
{
  id v2;

  -[AVTPushNotificationsSupport pushConnection](self, "pushConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setEnabledTopics:", 0);

}

- (AVTPushNotificationsSupportDelegate)delegate
{
  return (AVTPushNotificationsSupportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnection, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTPushNotificationsConnectionFactory)connectionFactory
{
  return self->_connectionFactory;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
