@implementation CTXPCUnblockPUKRequest

- (CTXPCUnblockPUKRequest)initWithContext:(id)a3 puk:(id)a4 pin:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CTXPCUnblockPUKRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = CFSTR("updated-pin");
  v15[1] = CFSTR("puk");
  v16[0] = v10;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCUnblockPUKRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCUnblockPUKRequest puk](self, "puk");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCUnblockPUKRequest pin](self, "pin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__CTXPCUnblockPUKRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E152DA48;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "unlockPUK:puk:newPin:completion:", v8, v9, v10, v12);

}

- (NSString)puk
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("puk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)pin
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("updated-pin"));
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
