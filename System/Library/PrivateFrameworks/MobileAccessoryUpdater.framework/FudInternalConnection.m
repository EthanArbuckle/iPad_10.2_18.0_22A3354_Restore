@implementation FudInternalConnection

- (FudInternalConnection)initWithClientIdentifier:(id)a3 handlerQueue:(id)a4 messageHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FudInternalConnection *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v18;
  FudInternalConnection *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FudInternalConnection;
  v14 = -[FudInternalConnection init](&v20, sel_init);
  if (initWithClientIdentifier_handlerQueue_messageHandler__onceToken != -1)
    dispatch_once(&initWithClientIdentifier_handlerQueue_messageHandler__onceToken, &__block_literal_global_0);
  if (!_msgIDLock)
  {
    v18 = CFSTR("Failed to create msg id mutex");
LABEL_17:
    FudLog(3, (uint64_t)v18, v8, v9, v10, v11, v12, v13, (uint64_t)v20.receiver);
    v19 = v14;
    return 0;
  }
  if (!a3)
  {
    v18 = CFSTR("Can't create connection without client identifier");
    goto LABEL_17;
  }
  if (!a5)
  {
    v18 = CFSTR("Can't create connection without handler");
    goto LABEL_17;
  }
  if (!a4)
  {
    v18 = CFSTR("Can't create connection without handler queue");
    goto LABEL_17;
  }
  v14->didStop = 0;
  v14->clientIdentifier = (NSString *)a3;
  v15 = _Block_copy(a5);
  v14->messageHandler = v15;
  if (!v15)
  {
    v18 = CFSTR("Failed to copy block handler");
    goto LABEL_17;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 0);
  v14->pendingRequests = (NSMutableDictionary *)v16;
  if (!v16)
  {
    v18 = CFSTR("Failed to create pending requests dict");
    goto LABEL_17;
  }
  v14->handlerQueue = (OS_dispatch_queue *)a4;
  dispatch_retain((dispatch_object_t)a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v14, sel_handleInboundNotification_, CFSTR("MAUInternalMessageClientNotification"), 0);
  return v14;
}

dispatch_semaphore_t __78__FudInternalConnection_initWithClientIdentifier_handlerQueue_messageHandler___block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(1);
  _msgIDLock = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  NSObject *handlerQueue;
  id messageHandler;
  objc_super v5;

  handlerQueue = self->handlerQueue;
  if (handlerQueue)
    dispatch_release(handlerQueue);
  messageHandler = self->messageHandler;
  if (messageHandler)
    _Block_release(messageHandler);

  v5.receiver = self;
  v5.super_class = (Class)FudInternalConnection;
  -[FudInternalConnection dealloc](&v5, sel_dealloc);
}

- (int64_t)getNextMessageID
{
  int64_t v2;

  dispatch_semaphore_wait((dispatch_semaphore_t)_msgIDLock, 0xFFFFFFFFFFFFFFFFLL);
  v2 = ++_gNextMsgID;
  dispatch_semaphore_signal((dispatch_semaphore_t)_msgIDLock);
  return v2;
}

- (void)handleInboundNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id messageHandler;
  uint64_t v23;
  void *v24;
  NSObject *handlerQueue;
  const __CFString *v26;
  uint64_t v27[6];
  uint64_t v28;

  FudLog(7, (uint64_t)CFSTR("Client got an internal notification"), (uint64_t)a3, v3, v4, v5, v6, v7, v27[0]);
  if (!a3)
  {
    v26 = CFSTR("Can't handle NULL notification");
LABEL_18:
    FudLog(3, (uint64_t)v26, v10, v11, v12, v13, v14, v15, v28);
    return;
  }
  v16 = (void *)objc_msgSend(a3, "userInfo");
  if (!v16)
  {
    v26 = CFSTR("Can't handle NULL user info in notification");
    goto LABEL_18;
  }
  v17 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("InternalMessage"));
  if (!v17)
  {
    v26 = CFSTR("Can't handle NULL msg in notification");
    goto LABEL_18;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "objectForKey:", CFSTR("ClientIdentifier"));
  if (!v19)
  {
    v26 = CFSTR("Failed to convert client identifier to string");
    goto LABEL_18;
  }
  if (-[NSString isEqualToString:](self->clientIdentifier, "isEqualToString:", v19))
  {
    v20 = objc_msgSend(v18, "objectForKey:", CFSTR("MessageID"));
    if (v20
      && (v21 = v20,
          messageHandler = (id)-[NSMutableDictionary objectForKey:](self->pendingRequests, "objectForKey:", v20),
          -[NSMutableDictionary removeObjectForKey:](self->pendingRequests, "removeObjectForKey:", v21),
          messageHandler)
      || (messageHandler = self->messageHandler) != 0)
    {
      v23 = _CFXPCCreateXPCObjectFromCFObject();
      if (v23)
      {
        v24 = (void *)v23;
        handlerQueue = self->handlerQueue;
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = (uint64_t)__51__FudInternalConnection_handleInboundNotification___block_invoke;
        v27[3] = (uint64_t)&unk_24DE14280;
        v27[4] = (uint64_t)v24;
        v27[5] = (uint64_t)messageHandler;
        dispatch_sync(handlerQueue, v27);
        xpc_release(v24);
        return;
      }
      v26 = CFSTR("Failed to convert dict to xpc dict");
    }
    else
    {
      v26 = CFSTR("No handler found for msg ID");
    }
    goto LABEL_18;
  }
}

uint64_t __51__FudInternalConnection_handleInboundNotification___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)stop
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  self->didStop = 1;
}

- (void)sendMessageToFud:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v10;
  int64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;

  if (!a3)
  {
    v20 = CFSTR("Can't send NULL msg");
LABEL_13:
    FudLog(3, (uint64_t)v20, (uint64_t)a3, v3, v4, v5, v6, v7, v21);
    v22 = 0;
    goto LABEL_7;
  }
  if (self->didStop)
  {
    v20 = CFSTR("Can't send message after it was explicitly stopped");
    goto LABEL_13;
  }
  v10 = -[FudInternalConnection getNextMessageID](self, "getNextMessageID");
  if (!v10)
  {
    v20 = CFSTR("Failed to get message ID");
    goto LABEL_13;
  }
  v11 = v10;
  v12 = -[NSString cStringUsingEncoding:](self->clientIdentifier, "cStringUsingEncoding:", 4);
  if (!v12)
  {
    v20 = CFSTR("Failed to get c client identifier");
    goto LABEL_13;
  }
  xpc_dictionary_set_string(a3, "ClientIdentifier", v12);
  xpc_dictionary_set_int64(a3, "MessageID", v11);
  xpc_dictionary_set_BOOL(a3, "InternalClient", 1);
  v22 = (id)_CFXPCCreateCFObjectFromXPCObject();
  if (!v22)
  {
    v20 = CFSTR("Failed to convert xpc dict into cf dict");
    goto LABEL_13;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  objc_msgSend(v13, "setObject:forKey:", v22, CFSTR("InternalMessage"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MAUInternalMessageFudNotification"), self, v13);
  FudLog(7, (uint64_t)CFSTR("Client sent an internal message"), v14, v15, v16, v17, v18, v19, v21);
LABEL_7:

}

- (void)sendMessageToFud:(id)a3 reply:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v11;
  int64_t v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  id v23;

  if (!a3)
  {
    v21 = CFSTR("Can't send NULL msg");
LABEL_15:
    FudLog(3, (uint64_t)v21, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v22);
    v23 = 0;
    goto LABEL_8;
  }
  if (!a4)
  {
    v21 = CFSTR("Can't handle reply with NULL handler");
    goto LABEL_15;
  }
  if (self->didStop)
  {
    v21 = CFSTR("Can't send message after it was explicitly stopped");
    goto LABEL_15;
  }
  v11 = -[FudInternalConnection getNextMessageID](self, "getNextMessageID");
  if (!v11)
  {
    v21 = CFSTR("Failed to get message ID");
    goto LABEL_15;
  }
  v12 = v11;
  v13 = -[NSString cStringUsingEncoding:](self->clientIdentifier, "cStringUsingEncoding:", 4);
  if (!v13)
  {
    v21 = CFSTR("Failed to get c client identifier");
    goto LABEL_15;
  }
  xpc_dictionary_set_string(a3, "ClientIdentifier", v13);
  xpc_dictionary_set_int64(a3, "MessageID", v12);
  xpc_dictionary_set_BOOL(a3, "InternalClient", 1);
  v23 = (id)_CFXPCCreateCFObjectFromXPCObject();
  if (!v23)
  {
    v21 = CFSTR("Failed to convert xpc dict into cf dict");
    goto LABEL_15;
  }
  _Block_copy(a4);
  -[NSMutableDictionary setObject:forKey:](self->pendingRequests, "setObject:forKey:", a4, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12));
  _Block_release(a4);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  objc_msgSend(v14, "setObject:forKey:", v23, CFSTR("InternalMessage"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MAUInternalMessageFudNotification"), self, v14);
  FudLog(7, (uint64_t)CFSTR("Client sent an internal message, expecting reply for msg ID %lld."), v15, v16, v17, v18, v19, v20, v12);
LABEL_8:

}

@end
