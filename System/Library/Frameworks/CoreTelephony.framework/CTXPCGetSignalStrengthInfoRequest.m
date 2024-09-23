@implementation CTXPCGetSignalStrengthInfoRequest

- (CTXPCGetSignalStrengthInfoRequest)initWithContext:(id)a3 forPublic:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CTXPCGetSignalStrengthInfoRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("public");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetSignalStrengthInfoRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (CTXPCGetSignalStrengthInfoRequest)initWithDescriptor:(id)a3 forPublic:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CTXPCGetSignalStrengthInfoRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("public");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetSignalStrengthInfoRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithDescriptor:namedArguments:](&v11, sel_initWithDescriptor_namedArguments_, v6, v8);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("public"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    -[CTXPCSubscriptionContextRequest descriptor](self, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__CTXPCGetSignalStrengthInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E15326C0;
    v13 = v15;
    v15[4] = v7;
    objc_msgSend(v6, "getPublicSignalStrength:completion:", v12, v15);
  }
  else
  {
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__CTXPCGetSignalStrengthInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v14[3] = &unk_1E15326C0;
    v13 = v14;
    v14[4] = v7;
    objc_msgSend(v6, "getSignalStrengthInfo:completion:", v12, v14);
  }

}

void __81__CTXPCGetSignalStrengthInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetSignalStrengthInfoResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = 0;
  if (v7 && !v5)
    v6 = -[CTXPCGetSignalStrengthInfoResponse initWithSignalStrengthInfo:]([CTXPCGetSignalStrengthInfoResponse alloc], "initWithSignalStrengthInfo:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__CTXPCGetSignalStrengthInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetSignalStrengthInfoResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = 0;
  if (v7 && !v5)
    v6 = -[CTXPCGetSignalStrengthInfoResponse initWithSignalStrengthInfo:]([CTXPCGetSignalStrengthInfoResponse alloc], "initWithSignalStrengthInfo:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("public"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    return 8;
  else
    return 3;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetSignalStrengthInfoRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
