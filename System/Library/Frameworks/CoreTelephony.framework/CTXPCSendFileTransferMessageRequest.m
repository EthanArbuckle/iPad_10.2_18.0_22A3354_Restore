@implementation CTXPCSendFileTransferMessageRequest

- (CTXPCSendFileTransferMessageRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 descriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCSendFileTransferMessageRequest *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = CFSTR("destination");
  v18[1] = CFSTR("messageID");
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = CFSTR("descriptor");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendFileTransferMessageRequest;
  v15 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v17, sel_initWithContext_namedArguments_, v10, v14);

  return v15;
}

- (CTXPCSendFileTransferMessageRequest)initWithContext:(id)a3 groupChatURI:(id)a4 messageID:(id)a5 descriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCSendFileTransferMessageRequest *v15;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = CFSTR("groupChatURI");
  v18[1] = CFSTR("messageID");
  v19[0] = v11;
  v19[1] = v12;
  v18[2] = CFSTR("descriptor");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendFileTransferMessageRequest;
  v15 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v17, sel_initWithContext_namedArguments_, v10, v14);

  return v15;
}

- (CTLazuliMessageID)messageID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("messageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliMessageID>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliMessageID *)v4;
}

- (CTLazuliFileTransferDescriptor)lazuliDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("descriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliFileTransferDescriptor>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliFileTransferDescriptor *)v4;
}

- (CTLazuliDestination)destination
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("destination"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTLazuliDestination *)v4;
}

- (CTLazuliGroupChatUri)groupChatURI
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("groupChatURI"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTLazuliGroupChatUri *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendFileTransferMessageRequest messageID](self, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendFileTransferMessageRequest lazuliDescriptor](self, "lazuliDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendFileTransferMessageRequest destination](self, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__CTXPCSendFileTransferMessageRequest_performRequestWithHandler_completionHandler___block_invoke;
    v16[3] = &unk_1E152DA48;
    v17 = v7;
    objc_msgSend(v6, "sendFileTransferMessage:to:withMessageID:withFileInformation:completion:", v8, v11, v9, v10, v16);
    v12 = v17;
  }
  else
  {
    -[CTXPCSendFileTransferMessageRequest groupChatURI](self, "groupChatURI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __83__CTXPCSendFileTransferMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2;
      v14[3] = &unk_1E152DA48;
      v15 = v7;
      objc_msgSend(v6, "sendFileTransferMessage:toGroupDestination:withMessageID:withFileInformation:completion:", v8, v12, v9, v10, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

    }
  }

}

uint64_t __83__CTXPCSendFileTransferMessageRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__CTXPCSendFileTransferMessageRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendFileTransferMessageRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isSensitiveMessage
{
  return 1;
}

@end
