@implementation CTXPCSubscriberGetPseudoIdentityRequest

- (CTXPCSubscriberGetPseudoIdentityRequest)initWithContext:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCSubscriberGetPseudoIdentityRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = CFSTR("service");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSubscriberGetPseudoIdentityRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSubscriberGetPseudoIdentityRequest service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__CTXPCSubscriberGetPseudoIdentityRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FBF0;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "context:getPseudoIdentityFor:completion:", v8, v9, v11);

}

void __87__CTXPCSubscriberGetPseudoIdentityRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCSimCommonResultResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCSimCommonResultResponse initWithResult:]([CTXPCSimCommonResultResponse alloc], "initWithResult:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)service
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 5;
}

@end
