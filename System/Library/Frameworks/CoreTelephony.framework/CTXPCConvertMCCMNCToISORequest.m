@implementation CTXPCConvertMCCMNCToISORequest

- (CTXPCConvertMCCMNCToISORequest)initWithMcc:(id)a3 mnc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCConvertMCCMNCToISORequest *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12[0] = CFSTR("mcc");
  v12[1] = CFSTR("mnc");
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCConvertMCCMNCToISORequest;
  v9 = -[CTXPCMessage initWithNamedArguments:](&v11, sel_initWithNamedArguments_, v8);

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
  -[CTXPCConvertMCCMNCToISORequest mcc](self, "mcc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCConvertMCCMNCToISORequest mnc](self, "mnc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__CTXPCConvertMCCMNCToISORequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E1534BF0;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "copyMobileSubscriberIso3CountryCode:MNC:completion:", v8, v9, v11);

}

void __78__CTXPCConvertMCCMNCToISORequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCSimCommonArrayResultResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCSimCommonArrayResultResponse initWithResult:]([CTXPCSimCommonArrayResultResponse alloc], "initWithResult:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)mcc
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mcc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)mnc
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mnc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int)requiredEntitlement
{
  return 3;
}

@end
