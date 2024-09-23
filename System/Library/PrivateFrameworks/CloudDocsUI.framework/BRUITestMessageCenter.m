@implementation BRUITestMessageCenter

- (BRUITestMessageCenter)init
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[BRUITestMessageCenter init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultCenter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-[%@ %@] is unavailable, use %@ instead."), v5, v6, v7);

  return 0;
}

- (id)_init
{
  BRUITestMessageCenter *v2;
  uint64_t v3;
  NSMutableDictionary *pendingReplies;
  uint64_t v5;
  NSMutableDictionary *messageHandlers;
  dispatch_queue_t v7;
  OS_dispatch_queue *messageQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRUITestMessageCenter;
  v2 = -[BRUITestMessageCenter init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingReplies = v2->_pendingReplies;
    v2->_pendingReplies = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("BRUITestMessageCenter-message-queue", 0);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1)
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_10);
  return (id)defaultCenter_defaultCenter;
}

void __38__BRUITestMessageCenter_defaultCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BRUITestMessageCenter _init]([BRUITestMessageCenter alloc], "_init");
  v1 = (void *)defaultCenter_defaultCenter;
  defaultCenter_defaultCenter = (uint64_t)v0;

}

- (void)startSender
{
  id v3;

  self->_isSender = 1;
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didReceiveMessage_, CFSTR("_BRUITestMessageReceiver"), 0);

}

- (void)startReceiver
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didReceiveMessage_, CFSTR("_BRUITestMessageSender"), 0);

}

- (void)stop
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)sendMessageNamed:(id)a3 userInfo:(id)a4 reply:(id)a5
{
  -[BRUITestMessageCenter _sendMessageNamed:userInfo:isReply:messageUUID:reply:](self, "_sendMessageNamed:userInfo:isReply:messageUUID:reply:", a3, a4, 0, 0, a5);
}

- (void)_sendMessageNamed:(id)a3 userInfo:(id)a4 isReply:(BOOL)a5 messageUUID:(id)a6 reply:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *messageQueue;
  id v24;
  void *v25;
  _QWORD block[5];
  id v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v9 = a5;
  v29[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = CFSTR("_kBRUITestMessageUUID");
  objc_msgSend(v14, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v29[1] = v12;
  v25 = v12;
  v28[1] = CFSTR("_kBRUITestMessageName");
  v28[2] = CFSTR("_kBRUITestMessageIsReply");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  v28[3] = CFSTR("_kBRUITestPid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v13)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, CFSTR("_kBRUITestMessagePayload"));
  if (!v9)
  {
    if (v15)
    {
      v21 = MEMORY[0x2207C9E60](v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingReplies, "setObject:forKeyedSubscript:", v21, v14);

  }
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__BRUITestMessageCenter__sendMessageNamed_userInfo_isReply_messageUUID_reply___block_invoke;
  block[3] = &unk_24E43A858;
  block[4] = self;
  v27 = v20;
  v24 = v20;
  dispatch_async(messageQueue, block);

}

void __78__BRUITestMessageCenter__sendMessageNamed_userInfo_isReply_messageUUID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
    v3 = CFSTR("_BRUITestMessageSender");
  else
    v3 = CFSTR("_BRUITestMessageReceiver");
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, *(_QWORD *)(a1 + 40));

}

- (void)didReceiveMessage:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  pid_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  char v15;
  void (**v16)(id, void *);
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  BRUITestMessageCenter *v23;
  id v24;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_kBRUITestPid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  v7 = getpid();

  if (v6 != v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_kBRUITestMessagePayload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_kBRUITestMessageUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_kBRUITestMessageIsReply"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingReplies, "objectForKeyedSubscript:", v10);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingReplies, "setObject:forKeyedSubscript:", 0, v10);
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      v16 = (void (**)(id, void *))MEMORY[0x2207C9E60](v13);
      v16[2](v16, v8);
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_kBRUITestMessageName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_messageHandlers, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__BRUITestMessageCenter_didReceiveMessage___block_invoke;
      block[3] = &unk_24E43B510;
      v20 = v18;
      v21 = v17;
      v22 = v8;
      v23 = self;
      v24 = v10;
      v16 = v17;
      v13 = v18;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    goto LABEL_7;
  }
LABEL_8:

}

void __43__BRUITestMessageCenter_didReceiveMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__BRUITestMessageCenter_didReceiveMessage___block_invoke_2;
  v5[3] = &unk_24E43B4E8;
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 56);
  v6 = v2;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "didReceiveMessageNamed:userInfo:reply:", v6, v4, v5);

}

uint64_t __43__BRUITestMessageCenter_didReceiveMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessageNamed:userInfo:isReply:messageUUID:reply:", *(_QWORD *)(a1 + 40), a2, 1, *(_QWORD *)(a1 + 48), 0);
}

- (void)setHandler:(id)a3 forMessageNamed:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageHandlers, "setObject:forKeyedSubscript:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_pendingReplies, 0);
}

@end
