@implementation CTXPCSetMaxDataRateRequest

- (CTXPCSetMaxDataRateRequest)initWithContext:(id)a3 rate:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CTXPCSetMaxDataRateRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("maxDataRate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSetMaxDataRateRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("maxDataRate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  -[CTXPCSubscriptionContextRequest context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CTXPCSetMaxDataRateRequest_performRequestWithHandler_completionHandler___block_invoke;
  v14[3] = &unk_1E152DA48;
  v13 = v7;
  v15 = v13;
  objc_msgSend(v6, "setMaxDataRate:rate:completion:", v12, v11, v14);

}

uint64_t __74__CTXPCSetMaxDataRateRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 18;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetMaxDataRateRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
