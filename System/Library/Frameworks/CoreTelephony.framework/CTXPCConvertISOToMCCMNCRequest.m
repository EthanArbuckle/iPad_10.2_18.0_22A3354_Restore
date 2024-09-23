@implementation CTXPCConvertISOToMCCMNCRequest

- (CTXPCConvertISOToMCCMNCRequest)initWithIso:(id)a3
{
  id v4;
  void *v5;
  CTXPCConvertISOToMCCMNCRequest *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("iso");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CTXPCConvertISOToMCCMNCRequest;
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
  -[CTXPCConvertISOToMCCMNCRequest iso](self, "iso");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__CTXPCConvertISOToMCCMNCRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E1534BF0;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "copyMccOrPlmnsListForIso3CountryCode:completion:", v8, v10);

}

void __78__CTXPCConvertISOToMCCMNCRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)iso
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("iso"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)requiredEntitlement
{
  return 3;
}

@end
