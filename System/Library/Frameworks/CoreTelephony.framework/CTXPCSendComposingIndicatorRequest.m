@implementation CTXPCSendComposingIndicatorRequest

- (CTXPCSendComposingIndicatorRequest)initWithContext:(id)a3 destination:(id)a4 messageID:(id)a5 indication:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCSendComposingIndicatorRequest *v15;
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
  v18[2] = CFSTR("indication");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendComposingIndicatorRequest;
  v15 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v17, sel_initWithContext_namedArguments_, v10, v14);

  return v15;
}

- (CTXPCSendComposingIndicatorRequest)initWithContext:(id)a3 groupChatURI:(id)a4 messageID:(id)a5 indication:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CTXPCSendComposingIndicatorRequest *v15;
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
  v18[2] = CFSTR("indication");
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CTXPCSendComposingIndicatorRequest;
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

- (CTLazuliMessageComposingIndicator)indication
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("indication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliMessageComposingIndicator>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliMessageComposingIndicator *)v4;
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
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, id);
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendComposingIndicatorRequest messageID](self, "messageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendComposingIndicatorRequest indication](self, "indication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendComposingIndicatorRequest destination](self, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = 0;
    objc_msgSend(v6, "sendComposingIndicator:to:withMessageID:withIndication:withError:", v8, v11, v9, v10, &v16);
    v12 = v16;
    v7[2](v7, 0, v12);
  }
  else
  {
    -[CTXPCSendComposingIndicatorRequest groupChatURI](self, "groupChatURI");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __82__CTXPCSendComposingIndicatorRequest_performRequestWithHandler_completionHandler___block_invoke;
      v14[3] = &unk_1E152DA48;
      v15 = v7;
      objc_msgSend(v6, "sendGroupComposingIndicator:toGroupDestination:withMessageID:withIndication:completion:", v8, v12, v9, v10, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v13);

    }
  }

}

uint64_t __82__CTXPCSendComposingIndicatorRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSendComposingIndicatorRequest;
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

@end
