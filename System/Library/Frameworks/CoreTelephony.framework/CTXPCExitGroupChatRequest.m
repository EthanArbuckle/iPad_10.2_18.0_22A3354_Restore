@implementation CTXPCExitGroupChatRequest

- (CTXPCExitGroupChatRequest)initWithContext:(id)a3 groupChatURI:(id)a4 operationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CTXPCExitGroupChatRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = CFSTR("groupChatURI");
  v15[1] = CFSTR("operationID");
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCExitGroupChatRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (CTLazuliGroupChatUri)groupChatURI
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("groupChatURI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliGroupChatUri>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliGroupChatUri *)v4;
}

- (CTLazuliOperationID)operationID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("operationID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliOperationID>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliOperationID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCExitGroupChatRequest groupChatURI](self, "groupChatURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCExitGroupChatRequest operationID](self, "operationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CTXPCExitGroupChatRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E152DA48;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "exit:groupChat:withOperationID:completion:", v8, v9, v10, v12);

}

uint64_t __73__CTXPCExitGroupChatRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCExitGroupChatRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
