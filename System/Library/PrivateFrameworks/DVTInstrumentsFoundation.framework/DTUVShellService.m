@implementation DTUVShellService

- (DTUVShellService)initWithChannel:(id)a3
{
  id v4;
  DTUVShellService *v5;
  uint64_t v6;
  NSMutableArray *queuedServiceMessages;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *messageQueue;
  _QWORD v12[4];
  DTUVShellService *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DTUVShellService;
  v5 = -[DTXService initWithChannel:](&v15, sel_initWithChannel_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    queuedServiceMessages = v5->_queuedServiceMessages;
    v5->_queuedServiceMessages = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-MessageQueue"), objc_opt_class());
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    messageQueue = v5->_messageQueue;
    v5->_messageQueue = (OS_dispatch_queue *)v9;

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_222BAAB6C;
    v12[3] = &unk_24EB2B508;
    v13 = v5;
    v14 = v4;
    DTUVLaunchPreviewShell(v12);

  }
  return v5;
}

- (void)_bindServiceCancelationToChannelCancelation
{
  DTUVService *service;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  service = self->_service;
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222BAAD64;
  v7[3] = &unk_24EB27E30;
  v7[4] = self;
  -[DTUVService observeCancelation:](service, "observeCancelation:", v7);
  -[DTXService channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = sub_222BAAD94;
  v6[3] = &unk_24EB27E30;
  v6[4] = self;
  objc_msgSend(v5, "registerDisconnectHandler:", v6);

}

- (void)_activateService
{
  DTUVService *service;
  _QWORD v3[5];

  service = self->_service;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_222BAAE08;
  v3[3] = &unk_24EB2B530;
  v3[4] = self;
  -[DTUVService activateWithCompletion:](service, "activateWithCompletion:", v3);
}

- (void)_replyToQueuedMessages:(id)a3
{
  id v4;
  NSObject *messageQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222BAB04C;
  block[3] = &unk_24EB28350;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(messageQueue, block);

}

- (void)messageReceived:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *messageQueue;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  if ((id)*MEMORY[0x24BE2A988] != v4)
  {
    v12 = 0;
    -[DTUVShellService _makeServiceMessageFrom:error:](self, "_makeServiceMessageFrom:error:", v4, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v5)
    {
      messageQueue = self->_messageQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222BAB2B4;
      block[3] = &unk_24EB28350;
      block[4] = self;
      v11 = v5;
      dispatch_sync(messageQueue, block);

    }
    else
    {
      -[DTXService channel](self, "channel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v4, "newReplyWithError:", v6);
      objc_msgSend(v8, "sendControlAsync:replyHandler:", v9, 0);

    }
  }

}

- (void)sendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DTUVShellService _makeDTXMessageFrom:](self, "_makeDTXMessageFrom:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DTUVShellService _makeDTXReplyHandlerFrom:](self, "_makeDTXReplyHandlerFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DTXService channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendControlAsync:replyHandler:", v7, v5);

}

- (id)_makeServiceMessageFrom:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "stringForMessageKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTUVShellService _makeServiceReplyHandlerFrom:](self, "_makeServiceReplyHandlerFrom:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DTUVMakeServiceMessage(v7, v9, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_makeServiceReplyHandlerFrom:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  DTUVShellService *v9;

  v4 = a3;
  if (objc_msgSend(v4, "integerForMessageKey:", CFSTR("UVOneWayMessageKey")) == 1)
  {
    v5 = 0;
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_222BAB4B0;
    v7[3] = &unk_24EB2B558;
    v8 = v4;
    v9 = self;
    v5 = _Block_copy(v7);

  }
  return v5;
}

- (id)_makeDTXMessageFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BE2A960];
  if (v4)
  {
    objc_msgSend(v3, "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A960], "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "messageType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "messageType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setString:forMessageKey:", v9, CFSTR("type"));

  }
  objc_msgSend(v3, "replyHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v7, "setInteger:forMessageKey:", 1, CFSTR("UVOneWayMessageKey"));

  return v7;
}

- (id)_makeDTXReplyHandlerFrom:(id)a3
{
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "replyHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_222BAB6D0;
    aBlock[3] = &unk_24EB2A1F0;
    v7 = v3;
    v4 = _Block_copy(aBlock);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceMessageHandler, 0);
  objc_storeStrong((id *)&self->_queuedServiceMessages, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
