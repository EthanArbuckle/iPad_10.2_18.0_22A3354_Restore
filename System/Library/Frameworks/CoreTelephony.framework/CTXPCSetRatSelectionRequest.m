@implementation CTXPCSetRatSelectionRequest

- (CTXPCSetRatSelectionRequest)initWithContext:(id)a3 selection:(id)a4 preferred:(id)a5
{
  id v8;
  void *v9;
  CTXPCSetRatSelectionRequest *v10;
  objc_super v12;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("selection"), a5, CFSTR("preferred"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)CTXPCSetRatSelectionRequest;
  v10 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v12, sel_initWithContext_namedArguments_, v8, v9);

  return v10;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("selection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("preferred"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  -[CTXPCSubscriptionContextRequest context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__CTXPCSetRatSelectionRequest_performRequestWithHandler_completionHandler___block_invoke;
  v16[3] = &unk_1E152DA48;
  v15 = v7;
  v17 = v15;
  objc_msgSend(v6, "setRatSelection:selection:preferred:completion:", v14, v10, v13, v16);

}

uint64_t __75__CTXPCSetRatSelectionRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
