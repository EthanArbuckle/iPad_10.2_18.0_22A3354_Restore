@implementation CTXPCEnablePINRequest

- (CTXPCEnablePINRequest)initWithContext:(id)a3 enable:(BOOL)a4 pin:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CTXPCEnablePINRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v6 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v15[0] = CFSTR("current-pn");
  v15[1] = CFSTR("enable-pin");
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCEnablePINRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTXPCEnablePINRequest enable](self, "enable");
  -[CTXPCEnablePINRequest pin](self, "pin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__CTXPCEnablePINRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E152DA48;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "saveSIMLockValue:enabled:pin:completion:", v8, v9, v10, v12);

}

uint64_t __69__CTXPCEnablePINRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)enable
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("enable-pin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
  return (char)v2;
}

- (NSString)pin
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("current-pn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCEnablePINRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
