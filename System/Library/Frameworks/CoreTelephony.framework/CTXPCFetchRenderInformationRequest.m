@implementation CTXPCFetchRenderInformationRequest

- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCFetchRenderInformationRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = CFSTR("destination");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCFetchRenderInformationRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (CTXPCFetchRenderInformationRequest)initWithContext:(id)a3 destination:(id)a4 operationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CTXPCFetchRenderInformationRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = CFSTR("destination");
  v15[1] = CFSTR("operationID");
  v16[0] = v9;
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCFetchRenderInformationRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (CTLazuliDestination)destination
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("destination"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliDestination>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliDestination *)v4;
}

- (CTLazuliOperationID)operationID
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("operationID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTLazuliOperationID *)v4;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCFetchRenderInformationRequest destination](self, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCFetchRenderInformationRequest operationID](self, "operationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke;
    v14[3] = &unk_1E152DA48;
    v11 = &v15;
    v15 = v7;
    objc_msgSend(v6, "fetchRenderInformation:forChatBot:withOperationID:completion:", v8, v9, v10, v14);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v12[3] = &unk_1E152DA48;
    v11 = &v13;
    v13 = v7;
    objc_msgSend(v6, "fetchChatBotRenderInformation:forDestination:completion:", v8, v9, v12);
  }

}

uint64_t __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__CTXPCFetchRenderInformationRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCFetchRenderInformationRequest;
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
