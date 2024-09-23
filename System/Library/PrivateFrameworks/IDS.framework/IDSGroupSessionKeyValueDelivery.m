@implementation IDSGroupSessionKeyValueDelivery

- (IDSGroupSessionKeyValueDelivery)initWithSessionID:(id)a3
{
  id v5;
  IDSGroupSessionKeyValueDelivery *v6;
  IDSGroupSessionKeyValueDelivery *v7;
  NSMutableArray *v8;
  NSMutableArray *deliveryHandlers;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  v6 = -[IDSGroupSessionKeyValueDelivery init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionID, a3);
    if (!v7->_deliveryHandlers)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      deliveryHandlers = v7->_deliveryHandlers;
      v7->_deliveryHandlers = v8;

    }
    objc_msgSend(MEMORY[0x1E0D34D40], "GroupSessionKeyValueDelivery");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "IDSGroupSessionKeyValueDelivery init: %@", buf, 0xCu);
    }

    -[IDSGroupSessionKeyValueDelivery _setUpXPC](v7, "_setUpXPC");
  }

  return v7;
}

- (void)dealloc
{
  NSString *sessionID;
  IDSXPCGroupSessionKeyValueDelivery *xpc;
  objc_super v5;

  sessionID = self->_sessionID;
  self->_sessionID = 0;

  xpc = self->_xpc;
  self->_xpc = 0;

  v5.receiver = self;
  v5.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  -[IDSGroupSessionKeyValueDelivery dealloc](&v5, sel_dealloc);
}

- (void)_setUpXPC
{
  NSString *v3;
  void *v4;
  NSObject *v5;
  NSString *v6;
  IDSXPCGroupSessionKeyValueDelivery *v7;
  IDSXPCGroupSessionKeyValueDelivery *xpc;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NSString *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = self->_sessionID;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1906EE2E4;
  v19 = sub_1906EE144;
  v20 = 0;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = sub_1907A4FA0;
  v12 = &unk_1E2C60308;
  v14 = &v15;
  v6 = v3;
  v13 = v6;
  dispatch_sync(v5, &v9);

  objc_msgSend((id)v16[5], "remoteObjectProxy", v9, v10, v11, v12);
  v7 = (IDSXPCGroupSessionKeyValueDelivery *)objc_claimAutoreleasedReturnValue();
  xpc = self->_xpc;
  self->_xpc = v7;

  _Block_object_dispose(&v15, 8);
}

- (void)addDeliveryHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  IDSGroupSessionKeyValueDelivery *v10;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907A53A8;
  v8[3] = &unk_1E2C607A8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)removeDeliveryHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907A54D4;
  v8[3] = &unk_1E2C607A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  _QWORD block[6];
  unsigned int v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907A573C;
  block[3] = &unk_1E2C643F8;
  v10 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(v8, block);

}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_sendData_forKey_encryption_capability_completionHandler_);
}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  IDSGroupSessionKeyValueDelivery *v23;
  id v24;
  unsigned int v25;
  unsigned int v26;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907A5978;
  block[3] = &unk_1E2C638D8;
  v21 = v12;
  v22 = v13;
  v23 = self;
  v24 = v14;
  v25 = a4;
  v26 = a5;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  dispatch_async(v16, block);

}

- (void)test_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unsigned int v15;

  v8 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907A5D30;
  v12[3] = &unk_1E2C64448;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = a5;
  v11 = v8;
  dispatch_async(v10, v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
}

- (IDSGroupSessionKeyValueDelivery)initWithCoder:(id)a3
{
  id v3;
  IDSGroupSessionKeyValueDelivery *v4;
  void *v5;
  IDSGroupSessionKeyValueDelivery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSGroupSessionKeyValueDelivery;
  v3 = a3;
  v4 = -[IDSGroupSessionKeyValueDelivery init](&v8, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"), v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 = -[IDSGroupSessionKeyValueDelivery initWithSessionID:](v4, "initWithSessionID:", v5);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryHandlers, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
