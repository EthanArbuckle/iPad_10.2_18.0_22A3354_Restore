@implementation CTXPCGetRemotePlanSignupInfoRequest

- (CTXPCGetRemotePlanSignupInfoRequest)initWithContext:(id)a3 userConsent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CTXPCGetRemotePlanSignupInfoRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("userConsent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetRemotePlanSignupInfoRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTXPCGetRemotePlanSignupInfoRequest userConsent](self, "userConsent");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__CTXPCGetRemotePlanSignupInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FD30;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "remotePlanSignupInfoFor:userConsent:completion:", v8, v9, v11);

}

void __83__CTXPCGetRemotePlanSignupInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v10 = -[CTXPCWebsheetInfoResponse initWithURL:postdata:]([CTXPCWebsheetInfoResponse alloc], "initWithURL:postdata:", v11, v7);
  (*(void (**)(uint64_t, CTXPCWebsheetInfoResponse *, id))(v9 + 16))(v9, v10, v8);

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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetRemotePlanSignupInfoRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)userConsent
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("userConsent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

@end
