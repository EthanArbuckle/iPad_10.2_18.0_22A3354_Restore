@implementation CTXPCGetWebsheetInfoForTransferRemotePlanRequest

- (CTXPCGetWebsheetInfoForTransferRemotePlanRequest)initWithPlan:(id)a3
{
  id v4;
  void *v5;
  CTXPCGetWebsheetInfoForTransferRemotePlanRequest *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("plan");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CTXPCGetWebsheetInfoForTransferRemotePlanRequest;
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
  -[CTXPCGetWebsheetInfoForTransferRemotePlanRequest plan](self, "plan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__CTXPCGetWebsheetInfoForTransferRemotePlanRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152FD08;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "transferRemotePlan:completion:", v8, v10);

}

void __96__CTXPCGetWebsheetInfoForTransferRemotePlanRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  CTXPCWebsheetInfoResponse *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = -[CTXPCWebsheetInfoResponse initWithURLString:postdata:]([CTXPCWebsheetInfoResponse alloc], "initWithURLString:postdata:", v11, v7);
  (*(void (**)(uint64_t, CTXPCWebsheetInfoResponse *, id))(v9 + 16))(v9, v10, v8);

}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetWebsheetInfoForTransferRemotePlanRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)plan
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("plan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTPlan>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
