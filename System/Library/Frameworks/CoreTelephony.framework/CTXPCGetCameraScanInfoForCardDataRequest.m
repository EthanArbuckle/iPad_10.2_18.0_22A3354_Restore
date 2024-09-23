@implementation CTXPCGetCameraScanInfoForCardDataRequest

- (CTXPCGetCameraScanInfoForCardDataRequest)initWithCardData:(id)a3
{
  id v4;
  void *v5;
  CTXPCGetCameraScanInfoForCardDataRequest *v6;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("cardData"));
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetCameraScanInfoForCardDataRequest;
  v6 = -[CTXPCMessage initWithNamedArguments:](&v8, sel_initWithNamedArguments_, v5);

  return v6;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[CTXPCGetCameraScanInfoForCardDataRequest cardData](self, "cardData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__CTXPCGetCameraScanInfoForCardDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152FB50;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "getCameraScanInfoForCardData:completionHandler:", v8, v10);

}

void __88__CTXPCGetCameraScanInfoForCardDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetCameraScanInfoForCardDataResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[CTXPCGetCameraScanInfoForCardDataResponse initWithAction:]([CTXPCGetCameraScanInfoForCardDataResponse alloc], "initWithAction:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 3;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetCameraScanInfoForCardDataRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cardData
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cardData"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
