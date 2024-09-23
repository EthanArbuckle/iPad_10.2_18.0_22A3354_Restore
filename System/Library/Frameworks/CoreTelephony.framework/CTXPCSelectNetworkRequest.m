@implementation CTXPCSelectNetworkRequest

- (CTXPCSelectNetworkRequest)initWithContext:(id)a3 network:(id)a4
{
  id v6;
  void *v7;
  CTXPCSelectNetworkRequest *v8;
  objc_super v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("network"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CTXPCSelectNetworkRequest;
  v8 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v10, sel_initWithContext_namedArguments_, v6, v7);

  return v8;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("network"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  -[CTXPCSubscriptionContextRequest context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v13[3] = &unk_1E152DA48;
    v12 = v13;
    v13[4] = v7;
    objc_msgSend(v6, "selectNetwork:network:completion:", v11, v10, v13);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke;
    v14[3] = &unk_1E152DA48;
    v12 = v14;
    v14[4] = v7;
    objc_msgSend(v6, "automaticallySelectNetwork:completion:", v11, v14);
  }

}

uint64_t __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__CTXPCSelectNetworkRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSelectNetworkRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
