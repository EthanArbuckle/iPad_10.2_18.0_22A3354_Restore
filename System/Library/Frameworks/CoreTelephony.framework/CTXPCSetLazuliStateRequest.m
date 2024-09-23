@implementation CTXPCSetLazuliStateRequest

- (CTXPCSetLazuliStateRequest)initWithContext:(id)a3 shouldEnable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CTXPCSetLazuliStateRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("shouldEnable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetLazuliStateRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (BOOL)shouldEnable
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shouldEnable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  return (char)v2;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v6 = a3;
  v7 = a4;
  if (-[CTXPCSetLazuliStateRequest shouldEnable](self, "shouldEnable"))
  {
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__CTXPCSetLazuliStateRequest_performRequestWithHandler_completionHandler___block_invoke;
    v11[3] = &unk_1E152DA48;
    v9 = v11;
    v11[4] = v7;
    objc_msgSend(v6, "enableLazuli:completion:", v8, v11);
  }
  else
  {
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__CTXPCSetLazuliStateRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v10[3] = &unk_1E152DA48;
    v9 = v10;
    v10[4] = v7;
    objc_msgSend(v6, "disableLazuli:completion:", v8, v10);
  }

}

uint64_t __74__CTXPCSetLazuliStateRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__CTXPCSetLazuliStateRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetLazuliStateRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)requiredEntitlement
{
  if (-[CTXPCSetLazuliStateRequest shouldEnable](self, "shouldEnable"))
    return 18;
  else
    return 19;
}

@end
