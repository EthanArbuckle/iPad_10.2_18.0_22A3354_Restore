@implementation EDBiomeInteractionEventLog

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDBiomeInteractionEventLog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1)
    dispatch_once(&log_onceToken_11, block);
  return (OS_os_log *)(id)log_log_11;
}

void __33__EDBiomeInteractionEventLog_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;

}

- (EDBiomeInteractionEventLog)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_block_t v6;
  _QWORD block[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EDBiomeInteractionEventLog;
  v2 = -[EDBiomeInteractionEventLog init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("em_biome_stream", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__EDBiomeInteractionEventLog_init__block_invoke;
    block[3] = &unk_1E949AEB8;
    v9 = v2;
    v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(*((dispatch_queue_t *)v2 + 1), v6);

  }
  return (EDBiomeInteractionEventLog *)v2;
}

void __34__EDBiomeInteractionEventLog_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D1E0E8], "url");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D024C0]);
  objc_msgSend(v12, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStoreBasePath:segmentSize:", v3, *MEMORY[0x1E0D02500]);

  v5 = objc_alloc(MEMORY[0x1E0D02790]);
  v6 = objc_msgSend(v5, "initWithPrivateStreamIdentifier:storeConfig:", *MEMORY[0x1E0D1E3D8], v4);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "source");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v9;

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:date:message:data:].cold.1();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D1E3E8], *MEMORY[0x1E0D1E3E0], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v9) & 1) == 0)
  {
    +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", v11, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageIDHeader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ec_messageIDSubstring");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v9, v16, v14);
    -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v17);

  }
}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a6;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:date:conversationID:data:].cold.1();

  +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D1E408]);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v9, 0, v12);
  -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v14);

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:dataFromMessage:].cold.1();

  objc_msgSend(v7, "messageIDHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ec_messageIDSubstring");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", MEMORY[0x1E0C9AA70], v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v6, v10, v11);
  -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v12);

}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:dataFromMessage:account:].cold.1();

  objc_msgSend(v9, "messageIDHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ec_messageIDSubstring");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", MEMORY[0x1E0C9AA70], v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D1E400]);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v8, v13, v14);
  -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v16);

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:date:message:mailbox:].cold.1();

  objc_msgSend(v10, "messageIDHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ec_messageIDSubstring");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", MEMORY[0x1E0C9AA70], v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D1E3F0]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D1E420]);

  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v9, v14, v15);
  -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v17);

}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  +[EDBiomeInteractionEventLog log](EDBiomeInteractionEventLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[EDBiomeInteractionEventLog persistEvent:date:message:mailboxType:].cold.1();

  objc_msgSend(v10, "messageIDHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ec_messageIDSubstring");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDBiomeInteractionEventLog payloadFromData:message:](EDBiomeInteractionEventLog, "payloadFromData:message:", MEMORY[0x1E0C9AA70], v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D1E3F0]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D1E420]);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E0E0]), "initWithEventName:messageId:payload:", v9, v13, v14);
  -[EDBiomeInteractionEventLog donateToBiomeWithEvent:](self, "donateToBiomeWithEvent:", v16);

}

- (void)donateToBiomeWithEvent:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__EDBiomeInteractionEventLog_donateToBiomeWithEvent___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);

}

uint64_t __53__EDBiomeInteractionEventLog_donateToBiomeWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sendEvent:", *(_QWORD *)(a1 + 40));
}

+ (id)payloadFromData:(id)a3 message:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "persistentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "persistentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D1E428]);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "globalMessageID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D1E418]);

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)persistEvent:date:message:data:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:data:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistEvent:date:conversationID:data:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:conversationID:data:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistEvent:dataFromMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:dataFromMessage:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistEvent:dataFromMessage:account:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:dataFromMessage:account:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistEvent:date:message:mailbox:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:mailbox:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistEvent:date:message:mailboxType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1D2F2C000, v0, v1, "-[EDBiomeInteractionEvent persistEvent:date:message:mailboxType:] .. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
