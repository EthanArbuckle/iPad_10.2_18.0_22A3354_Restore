@implementation CTXPCIsAutofillAllowedForDomainWithinClientRequest

- (CTXPCIsAutofillAllowedForDomainWithinClientRequest)initWithDomain:(id)a3 clientBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCIsAutofillAllowedForDomainWithinClientRequest *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12[0] = CFSTR("domain");
  v12[1] = CFSTR("bundleID");
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCIsAutofillAllowedForDomainWithinClientRequest;
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
  -[CTXPCIsAutofillAllowedForDomainWithinClientRequest domain](self, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCIsAutofillAllowedForDomainWithinClientRequest clientBundleIdentifier](self, "clientBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__CTXPCIsAutofillAllowedForDomainWithinClientRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FCB8;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "isAutofilleSIMIdAllowedForDomain:clientBundleIdentifier:completion:", v8, v9, v11);

}

void __98__CTXPCIsAutofillAllowedForDomainWithinClientRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  CTXPCBooleanResponseMessage *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[CTXPCBooleanResponseMessage initWithResult:]([CTXPCBooleanResponseMessage alloc], "initWithResult:", a2);
  (*(void (**)(uint64_t, CTXPCBooleanResponseMessage *, id))(v5 + 16))(v5, v6, v7);

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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCIsAutofillAllowedForDomainWithinClientRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)domain
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("domain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)clientBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
