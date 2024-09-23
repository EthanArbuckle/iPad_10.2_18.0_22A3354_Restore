@implementation VCSessionMessaging

- (VCSessionMessaging)initWithControlChannel:(id)a3 remoteVersion:(id)a4
{
  VCSessionMessaging *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionMessaging;
  v5 = -[VCSessionMessaging init](&v7, sel_init, a3, a4);
  if (v5)
  {
    v5->topics = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v5->participants = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_storeWeak(&v5->controlChannelWeak, a3);
    objc_msgSend(a3, "setMessageReceivedDelegate:", v5);
  }
  return v5;
}

- (void)addParticipant:(id)a3 controlChannelProtocolVersion:(int)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->participants, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4), a3);
}

- (void)startMessaging
{
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__VCSessionMessaging_startMessaging__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

void __36__VCSessionMessaging_startMessaging__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1DF088A10]();
  objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), "setMessageReceivedDelegate:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 32);
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectEnumerator");
  while (1)
  {
    v5 = (void *)objc_msgSend(v4, "nextObject");
    if (!v5)
      break;
    objc_msgSend(v5, "setIsSendingEnabled:", 1);
  }
  objc_sync_exit(v3);
  objc_autoreleasePoolPop(v2);
}

- (void)stopMessaging
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF088A10](self, a2);
  objc_msgSend(objc_loadWeak(&self->controlChannelWeak), "setMessageReceivedDelegate:", 0);
  objc_sync_enter(self);
  v4 = (void *)-[NSMutableDictionary objectEnumerator](self->topics, "objectEnumerator");
  while (1)
  {
    v5 = (void *)objc_msgSend(v4, "nextObject");
    if (!v5)
      break;
    objc_msgSend(v5, "setIsSendingEnabled:", 0);
  }

  self->topics = 0;
  objc_sync_exit(self);
  objc_autoreleasePoolPop(v3);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCSessionMessaging dealloc]";
      v10 = 1024;
      v11 = 77;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging dealloc", buf, 0x1Cu);
    }
  }

  objc_storeWeak(&self->controlChannelWeak, 0);
  v5.receiver = self;
  v5.super_class = (Class)VCSessionMessaging;
  -[VCSessionMessaging dealloc](&v5, sel_dealloc);
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 receiveHandler:(id)a6
{
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendCompletionHandler:receiveHandler:](self, "addTopic:associatedStrings:allowConcurrent:sendCompletionHandler:receiveHandler:", a3, a4, a5, 0, a6);
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendMessageDictionaryCompletionHandler:(id)a6 receiveMessageDictionaryHandler:(id)a7
{
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](self, "addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", a3, a4, a5, 1, a6, a7);
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 sendMessageDictionaryCompletionHandler:(id)a7 receiveMessageDictionaryHandler:(id)a8
{
  _QWORD *v9;
  VCSessionMessageTopic *v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  if (a7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __152__VCSessionMessaging_addTopic_associatedStrings_allowConcurrent_requireReliable_sendMessageDictionaryCompletionHandler_receiveMessageDictionaryHandler___block_invoke;
    v11[3] = &unk_1E9E58320;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a7;
    v9 = v11;
  }
  else
  {
    v9 = 0;
  }
  v10 = -[VCSessionMessageTopic initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:]([VCSessionMessageTopic alloc], "initWithTopicKey:strings:allowConcurrent:requireReliable:controlChannel:sendMessageDataCompletionHandler:receiveMessageDictionaryHandler:", a3, a4, a5, a6, objc_loadWeak(&self->controlChannelWeak), v9, a8);
  objc_sync_enter(self);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->topics, "setObject:forKeyedSubscript:", v10, -[VCSessionMessageTopic topicKey](v10, "topicKey"));
  objc_sync_exit(self);

}

void __152__VCSessionMessaging_addTopic_associatedStrings_allowConcurrent_requireReliable_sendMessageDictionaryCompletionHandler_receiveMessageDictionaryHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", a4))
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", a4), "intValue");
  else
    v7 = 1;
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "newDictionaryFromUnpackedMessage:forTopic:controlChannelVersion:", a2, *(_QWORD *)(a1 + 40), v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendCompletionHandler:(id)a6 receiveHandler:(id)a7
{
  VCSessionMessageTopic *v8;

  v8 = -[VCSessionMessageTopic initWithTopicKey:strings:allowConcurrent:controlChannel:sendCompletionHandler:receiveHandler:]([VCSessionMessageTopic alloc], "initWithTopicKey:strings:allowConcurrent:controlChannel:sendCompletionHandler:receiveHandler:", a3, a4, a5, objc_loadWeak(&self->controlChannelWeak), a6, a7);
  objc_sync_enter(self);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->topics, "setObject:forKeyedSubscript:", v8, -[VCSessionMessageTopic topicKey](v8, "topicKey"));
  objc_sync_exit(self);

}

- (void)sendMessage:(id)a3 withTopic:(id)a4
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCSessionMessaging sendMessage:withTopic:]";
      v14 = 1024;
      v15 = 166;
      v16 = 2112;
      v17 = a3;
      v18 = 2112;
      v19 = a4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage:%@, %@, %@", (uint8_t *)&v10, 0x3Au);
    }
  }
  objc_msgSend(v7, "sendMessage:", a3);
  objc_sync_exit(self);
}

- (void)sendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316674;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCSessionMessaging sendMessage:withTopic:participantID:]";
      v16 = 1024;
      v17 = 176;
      v18 = 2112;
      v19 = a3;
      v20 = 2048;
      v21 = a5;
      v22 = 2112;
      v23 = a4;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage:%@ for participantID:%llu, %@, %@", (uint8_t *)&v12, 0x44u);
    }
  }
  objc_msgSend(v9, "sendMessage:participantID:", a3, a5);
  objc_sync_exit(self);
}

- (void)sendMessageDictionary:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316674;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCSessionMessaging sendMessageDictionary:withTopic:participantID:]";
      v18 = 1024;
      v19 = 186;
      v20 = 2112;
      v21 = a3;
      v22 = 2048;
      v23 = a5;
      v24 = 2112;
      v25 = a4;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessageDictionary=%@ for participantID=%llu, topicKey=%@, topic=%@", (uint8_t *)&v14, 0x44u);
    }
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5)))
  {
    v12 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5)), "intValue");
  }
  else
  {
    v12 = 1;
  }
  v13 = -[VCSessionMessaging newPackedMessageFromDictionary:forTopic:controlChannelVersion:](self, "newPackedMessageFromDictionary:forTopic:controlChannelVersion:", a3, a4, v12);
  objc_msgSend(v9, "sendMessage:participantID:", v13, a5);

  objc_sync_exit(self);
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  void *v13;
  uint64_t v14;
  NSObject *v15;
  char v16;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCSessionMessaging sendReliableMessage:withTopic:participantID:withOptions:completion:]";
      v23 = 1024;
      v24 = 204;
      v25 = 2112;
      v26 = a3;
      v27 = 2048;
      v28 = a5;
      v29 = 2112;
      v30 = a4;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage=%@ for participantID=%llu, topicKey=%@, topic=%@", buf, 0x44u);
    }
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__VCSessionMessaging_sendReliableMessage_withTopic_participantID_withOptions_completion___block_invoke;
  v18[3] = &unk_1E9E58348;
  v18[4] = a7;
  v16 = objc_msgSend(v13, "sendReliableMessage:participantID:withOptions:completion:", a3, a5, a6, v18);
  objc_sync_exit(self);
  return v16;
}

uint64_t __89__VCSessionMessaging_sendReliableMessage_withTopic_participantID_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newPackedMessageFromDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(a3, "allKeys");
  if (objc_msgSend(v4, "count")
    && (v19 = 0u,
        v20 = 0u,
        v17 = 0u,
        v18 = 0u,
        (v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16)) != 0))
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(a3, "objectForKeyedSubscript:", v10);
        if (v10)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          if (v7)
            v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@=%@:"), v7, v10, v11);
          else
            v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@:"), v10, v11, v15);
          v7 = (void *)v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)newDictionaryFromUnpackedMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=")));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16[1] = objc_msgSend(v9, "substringFromIndex:", v10 + 1, objc_msgSend(v9, "substringToIndex:", v10));
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
        v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v13 = objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        if (v12)
        {
          v14 = v13;
          if (v13)
          {
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
          }
        }
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  }
  while (v5);
  return v6;
}

- (id)newPackedMessageFromMomentsDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(a3, "allKeys");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
      v11 = objc_msgSend(a3, "objectForKeyedSubscript:", v10);
      if (v10)
        v12 = v11 == 0;
      else
        v12 = 1;
      if (!v12)
      {
        v13 = v11;
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@=%@?"), v10, v13);
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  }
  while (v6);
  return v7;
}

- (id)newDictionaryFromUnpackedMomentsMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("?"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v3);
      v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v10);
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  }
  while (v5);
  return v6;
}

- (id)newPackedMessageFromDictionaryV2:(id)a3
{
  void *v4;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMessaging newPackedMessageFromDictionaryV2:].cold.1();
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", a3, 200) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMessaging newPackedMessageFromDictionaryV2:].cold.2();
    }
    goto LABEL_14;
  }
  v8 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v8);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCSessionMessaging newPackedMessageFromDictionaryV2:]";
        v13 = 1024;
        v14 = 316;
        v15 = 2112;
        v16 = a3;
        v17 = 2112;
        v18 = v8;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d newPackedMessageFromDictionaryV2 failed to create binary plist for dictionary=%@ with error=%@", buf, 0x30u);
      }
    }
LABEL_14:
    v4 = 0;
  }
  return v4;
}

- (id)newDictionaryFromUnpackedMessageV2:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionMessaging newDictionaryFromUnpackedMessageV2:].cold.1();
    }
    goto LABEL_11;
  }
  v11 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, &v12, &v11);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v14 = v7;
        v15 = 2080;
        v16 = "-[VCSessionMessaging newDictionaryFromUnpackedMessageV2:]";
        v17 = 1024;
        v18 = 331;
        v19 = 2112;
        v20 = a3;
        v21 = 2112;
        v22 = v11;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 failed to create property list from message=%@ with error=%@", buf, 0x30u);
      }
    }
LABEL_11:
    v5 = 0;
    return v5;
  }
  v5 = (void *)v4;
  if (v12 != (void *)200 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCSessionMessaging newDictionaryFromUnpackedMessageV2:]";
      v17 = 1024;
      v18 = 332;
      v19 = 2048;
      v20 = v12;
      v21 = 2112;
      v22 = a3;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 unexpected format=%lu received from message=%@", buf, 0x30u);
    }
  }
  return v5;
}

- (id)newPackedMessageFromDictionary:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5
{
  if (a5 == 2)
    return -[VCSessionMessaging newPackedMessageFromDictionaryV2:](self, "newPackedMessageFromDictionaryV2:", a3, a4);
  if (a5 != 1)
    return 0;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("VCSessionMomentsStateMessageTopic")))
    return -[VCSessionMessaging newPackedMessageFromMomentsDictionary:](self, "newPackedMessageFromMomentsDictionary:", a3);
  return -[VCSessionMessaging newPackedMessageFromDictionary:](self, "newPackedMessageFromDictionary:", a3);
}

- (id)newDictionaryFromUnpackedMessage:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5
{
  if (a5 == 2)
    return -[VCSessionMessaging newDictionaryFromUnpackedMessageV2:](self, "newDictionaryFromUnpackedMessageV2:", a3, a4);
  if (a5 != 1)
    return 0;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("VCSessionMomentsStateMessageTopic")))
    return -[VCSessionMessaging newDictionaryFromUnpackedMomentsMessage:](self, "newDictionaryFromUnpackedMomentsMessage:", a3);
  return -[VCSessionMessaging newDictionaryFromUnpackedMessage:](self, "newDictionaryFromUnpackedMessage:", a3);
}

- (void)searchMatchingTopic:(id)a3 payload:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
  uint64_t v7;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = *(_QWORD *)&a5;
  v34 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (a3)
    v21 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:"), a3);
  else
    v21 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v23 = v10;
      v24 = 2080;
      v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
      v26 = 1024;
      v27 = 388;
      v28 = 2112;
      v29 = (uint64_t)v21;
      v30 = 2112;
      v31 = a4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate receivedMessage callback with message '%@%@'", buf, 0x30u);
    }
  }
  v12 = (void *)-[NSMutableDictionary objectEnumerator](self->topics, "objectEnumerator");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  while (1)
  {
    v14 = (void *)objc_msgSend(v12, "nextObject");
    if (!v14)
      break;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v17 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v14, "topicKey");
          *(_DWORD *)buf = 136316418;
          v23 = v15;
          v24 = 2080;
          v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
          v26 = 1024;
          v27 = 393;
          v28 = 2112;
          v29 = v18;
          v30 = 2112;
          v31 = (id)v21;
          v32 = 2112;
          v33 = a4;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Is topic '%@' assisiated with incoming message '%@%@' block...", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(v14, "topicKey");
        *(_DWORD *)buf = 136316418;
        v23 = v15;
        v24 = 2080;
        v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
        v26 = 1024;
        v27 = 393;
        v28 = 2112;
        v29 = v19;
        v30 = 2112;
        v31 = (id)v21;
        v32 = 2112;
        v33 = a4;
        _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Is topic '%@' assisiated with incoming message '%@%@' block...", buf, 0x3Au);
      }
    }
    if ((objc_msgSend((id)objc_msgSend(v14, "topicKey"), "isEqualToString:", a3) & 1) != 0
      || (isKindOfClass & 1) != 0 && objc_msgSend(v14, "isPayloadAssociated:", a4))
    {
      objc_msgSend(v14, "passMessage:sequence:fromParticipant:", a4, v7, a6);
    }
  }
  objc_sync_exit(self);
}

- (void)controlChannel:(id)a3 receivedMessage:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
  -[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:](self, "searchMatchingTopic:payload:transactionID:fromParticipant:", 0, a4, *(_QWORD *)&a5, a6);
}

- (id)allocMessageFromPayload:(id)a3 forTopic:(id)a4 participantID:(id)a5
{
  uint64_t v9;
  id v10;
  id v11;

  if (-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", a5))
    v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", a5), "intValue");
  else
    v9 = 1;
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4), "expectedMessageType") == 1)
  {
    if ((_DWORD)v9 == 1)
    {
      if (!a3)
      {
LABEL_12:
        v11 = -[VCSessionMessaging newDictionaryFromUnpackedMessage:forTopic:controlChannelVersion:](self, "newDictionaryFromUnpackedMessage:forTopic:controlChannelVersion:", a3, a4, v9);
        goto LABEL_14;
      }
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, 4);
    }
    else
    {
      v10 = a3;
    }
    a3 = v10;
    goto LABEL_12;
  }
  if (a3)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, 4);
    a3 = 0;
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)controlChannel:(id)a3 topic:(id)a4 payload:(id)a5 transactionID:(unsigned int)a6 fromParticipant:(id)a7
{
  uint64_t v8;
  unint64_t v11;

  v8 = *(_QWORD *)&a6;
  v11 = -[VCSessionMessaging allocMessageFromPayload:forTopic:participantID:](self, "allocMessageFromPayload:forTopic:participantID:", a5, a4, a7);
  if ((unint64_t)a4 | v11)
  {
    -[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:](self, "searchMatchingTopic:payload:transactionID:fromParticipant:", a4, v11, v8, a7);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionMessaging controlChannel:topic:payload:transactionID:fromParticipant:].cold.1();
  }

}

- (void)controlChannel:(id)a3 sendReliableMessage:(id)a4 didSucceed:(BOOL)a5 toParticipant:(id)a6
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCSessionMessaging controlChannel:sendReliableMessage:didSucceed:toParticipant:]";
      v12 = 1024;
      v13 = 443;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate sendReliableMessage callback...", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)controlChannel:(id)a3 clearTransactionCacheForParticipant:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCSessionMessaging controlChannel:clearTransactionCacheForParticipant:]";
      v14 = 1024;
      v15 = 448;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate clearParticipantTransactionCacheForParticipant callback...", (uint8_t *)&v10, 0x1Cu);
    }
  }
  v8 = (void *)-[NSMutableDictionary objectEnumerator](self->topics, "objectEnumerator");
  while (1)
  {
    v9 = (void *)objc_msgSend(v8, "nextObject");
    if (!v9)
      break;
    objc_msgSend(v9, "clearTransactionCacheForParticipant:", a4);
  }
  objc_sync_exit(self);
}

- (void)newPackedMessageFromDictionaryV2:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d newPackedMessageFromDictionaryV2 tuples must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newPackedMessageFromDictionaryV2:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCSessionMessaging newPackedMessageFromDictionaryV2:]";
  v6 = 1024;
  v7 = 309;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d newPackedMessageFromDictionaryV2 can't save as binary dictionary=%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)newDictionaryFromUnpackedMessageV2:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 message must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)controlChannel:topic:payload:transactionID:fromParticipant:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Topic and payload can not be both nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
