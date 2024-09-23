@implementation SGDocumentUnderstandingConsumer

- (SGDocumentUnderstandingConsumer)init
{
  SGDocumentUnderstandingConsumer *v2;
  uint64_t v3;
  DUDocumentHarvesting *duReceiver;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGDocumentUnderstandingConsumer;
  v2 = -[SGDocumentUnderstandingConsumer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    duReceiver = v2->_duReceiver;
    v2->_duReceiver = (DUDocumentHarvesting *)v3;

    objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerMailConsumer:levelOfService:", v2, 2);
    objc_msgSend(v5, "registerMessagesConsumer:levelOfService:", v2, 2);
    objc_msgSend(v5, "registerNotesConsumer:levelOfService:", v2, 2);
    objc_msgSend(v5, "registerRemindersConsumer:levelOfService:", v2, 2);

  }
  return v2;
}

- (id)consumerName
{
  return CFSTR("com.apple.CoreSuggestionsInternals.SGDocumentUnderstandingConsumer");
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
}

- (id)consumeMailContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  uint8_t buf[8];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeMailContentWithContext", buf, 2u);
  }

  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeAsProto");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)buf)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }

  }
  v8 = NSSelectorFromString((NSString *)CFSTR("addSerializedDocument:documentType:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[DUDocumentHarvesting methodSignatureForSelector:](self->_duReceiver, "methodSignatureForSelector:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelector:", v8);
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 0);
    objc_msgSend(v11, "setArgument:atIndex:", v14, 3);
    objc_msgSend(v11, "invokeWithTarget:", self->_duReceiver);

    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  uint8_t buf[8];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeMessagesContentWithContext", buf, 2u);
  }

  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeAsProto");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)buf)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }

  }
  v8 = NSSelectorFromString((NSString *)CFSTR("addSerializedDocument:documentType:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[DUDocumentHarvesting methodSignatureForSelector:](self->_duReceiver, "methodSignatureForSelector:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelector:", v8);
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 1);
    objc_msgSend(v11, "setArgument:atIndex:", v14, 3);
    objc_msgSend(v11, "invokeWithTarget:", self->_duReceiver);

    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)consumeNotesContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  uint8_t buf[8];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeNotesContentWithContext", buf, 2u);
  }

  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeAsProto");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)buf)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }

  }
  v8 = NSSelectorFromString((NSString *)CFSTR("addSerializedDocument:documentType:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[DUDocumentHarvesting methodSignatureForSelector:](self->_duReceiver, "methodSignatureForSelector:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelector:", v8);
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 2);
    objc_msgSend(v11, "setArgument:atIndex:", v14, 3);
    objc_msgSend(v11, "invokeWithTarget:", self->_duReceiver);

    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SEL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  uint8_t buf[8];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeRemindersContentWithContext", buf, 2u);
  }

  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeAsProto");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)buf)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }

  }
  v8 = NSSelectorFromString((NSString *)CFSTR("addSerializedDocument:documentType:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    -[DUDocumentHarvesting methodSignatureForSelector:](self->_duReceiver, "methodSignatureForSelector:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelector:", v8);
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 3);
    objc_msgSend(v11, "setArgument:atIndex:", v14, 3);
    objc_msgSend(v11, "invokeWithTarget:", self->_duReceiver);

    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duReceiver, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_10793 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_10793, &__block_literal_global_10794);
  return (id)sharedInstance__pasExprOnceResult_10795;
}

void __49__SGDocumentUnderstandingConsumer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10795;
  sharedInstance__pasExprOnceResult_10795 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
