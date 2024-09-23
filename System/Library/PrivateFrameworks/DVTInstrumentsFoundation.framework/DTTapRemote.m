@implementation DTTapRemote

- (DTTapRemote)initWithConfig:(id)a3 memoHandler:(id)a4 messageHandler:(id)a5 connection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DTTapRemote *v14;
  DTTapRemote *v15;
  void *v16;
  uint64_t v17;
  DTXChannel *channel;
  DTXChannel *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  DTXChannel *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *unprocessedMessageQueue;
  _QWORD v29[5];
  _QWORD v30[3];
  char v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)DTTapRemote;
  v14 = -[DTTap initWithConfig:memoHandler:](&v35, sel_initWithConfig_memoHandler_, v10, v11);
  v15 = v14;
  if (v14)
  {
    if (!v12)
      sub_222BC6A54();
    objc_storeStrong((id *)&v14->_messageHandler, a5);
    objc_storeStrong((id *)&v15->_connection, a6);
    v15->_connectionEnabled = 1;
    objc_initWeak(&location, v15);
    objc_msgSend(v10, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeChannelWithIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    channel = v15->_channel;
    v15->_channel = (DTXChannel *)v17;

    v19 = v15->_channel;
    v20 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_222B6EECC;
    v32[3] = &unk_24EB2A258;
    objc_copyWeak(&v33, &location);
    -[DTXChannel setMessageHandler:](v19, "setMessageHandler:", v32);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 1;
    -[DTTap config](v15, "config");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "plist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_setConfig_, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15->_channel;
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = sub_222B6EFA8;
    v29[3] = &unk_24EB28CC0;
    v29[4] = v30;
    -[DTXChannel sendMessageSync:replyHandler:](v24, "sendMessageSync:replyHandler:", v23, v29);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("DTTapRemote unprocessed message queue", v25);
    unprocessedMessageQueue = v15->_unprocessedMessageQueue;
    v15->_unprocessedMessageQueue = (OS_dispatch_queue *)v26;

    _Block_object_dispose(v30, 8);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)messageReceived:(id)a3
{
  id v4;
  void *v5;
  NSObject *unprocessedMessageQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    unprocessedMessageQueue = self->_unprocessedMessageQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222B6F0C8;
    v7[3] = &unk_24EB28350;
    v7[4] = self;
    v8 = v4;
    dispatch_async(unprocessedMessageQueue, v7);

  }
}

- (void)_start
{
  void *v3;
  DTXChannel *channel;
  _QWORD v5[5];
  _QWORD v6[3];
  char v7;

  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v7 = 1;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_start, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    channel = self->_channel;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B6F25C;
    v5[3] = &unk_24EB28CC0;
    v5[4] = v6;
    -[DTXChannel sendMessageSync:replyHandler:](channel, "sendMessageSync:replyHandler:", v3, v5);

    _Block_object_dispose(v6, 8);
  }
}

- (void)_stop
{
  void *v3;
  DTXChannel *channel;
  _QWORD v5[5];
  _QWORD v6[3];
  char v7;

  if (self->_connectionEnabled)
  {
    if (!self->_channel)
      return;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v7 = 1;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_stop, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    channel = self->_channel;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B6F43C;
    v5[3] = &unk_24EB28CC0;
    v5[4] = v6;
    -[DTXChannel sendMessageSync:replyHandler:](channel, "sendMessageSync:replyHandler:", v3, v5);

    _Block_object_dispose(v6, 8);
  }
  -[DTTap setIsRunning:](self, "setIsRunning:", 0);
}

- (void)_pause
{
  void *v3;
  DTXChannel *channel;
  _QWORD v5[5];
  _QWORD v6[3];
  char v7;

  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v7 = 1;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_pause, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    channel = self->_channel;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B6F600;
    v5[3] = &unk_24EB28CC0;
    v5[4] = v6;
    -[DTXChannel sendMessageSync:replyHandler:](channel, "sendMessageSync:replyHandler:", v3, v5);

    _Block_object_dispose(v6, 8);
  }
}

- (void)_unpause
{
  void *v3;
  DTXChannel *channel;
  _QWORD v5[5];
  _QWORD v6[3];
  char v7;

  if (self->_channel)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v7 = 1;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_unpause, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    channel = self->_channel;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_222B6F7C4;
    v5[3] = &unk_24EB28CC0;
    v5[4] = v6;
    -[DTXChannel sendMessageSync:replyHandler:](channel, "sendMessageSync:replyHandler:", v3, v5);

    _Block_object_dispose(v6, 8);
  }
}

- (id)_fetchDataForReason:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  DTXChannel *channel;
  void *v8;
  void *v9;
  void *v10;

  -[DTTap config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "serviceVersion");

  if (a3 == 1 && v6 >= 2)
  {
    channel = self->_channel;
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_fetchDataNow, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTXChannel sendControlSync:replyHandler:](channel, "sendControlSync:replyHandler:", v8, &unk_24EB278D0);

  }
  dispatch_sync((dispatch_queue_t)self->_unprocessedMessageQueue, &unk_24EB2A278);
  -[DTTap memoHandler](self, "memoHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleMemo:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (DTTapMessageHandler)messageHandler
{
  return self->_messageHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_unprocessedMessageQueue, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
