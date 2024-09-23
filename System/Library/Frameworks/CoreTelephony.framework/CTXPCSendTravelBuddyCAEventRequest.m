@implementation CTXPCSendTravelBuddyCAEventRequest

- (CTXPCSendTravelBuddyCAEventRequest)initWithAction:(id)a3 carrierName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCSendTravelBuddyCAEventRequest *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12[0] = CFSTR("action");
  v12[1] = CFSTR("carrier");
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCSendTravelBuddyCAEventRequest;
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
  -[CTXPCSendTravelBuddyCAEventRequest action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSendTravelBuddyCAEventRequest carrierName](self, "carrierName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__CTXPCSendTravelBuddyCAEventRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152DA48;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "sendTravelBuddyCAEventWithCompletion:carrierName:completion:", v8, v9, v11);

}

uint64_t __82__CTXPCSendTravelBuddyCAEventRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSendTravelBuddyCAEventRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)action
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)carrierName
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("carrier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
