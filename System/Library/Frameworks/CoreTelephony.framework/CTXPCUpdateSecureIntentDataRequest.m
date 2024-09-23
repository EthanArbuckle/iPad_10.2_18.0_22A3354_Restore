@implementation CTXPCUpdateSecureIntentDataRequest

- (CTXPCUpdateSecureIntentDataRequest)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CTXPCUpdateSecureIntentDataRequest *v7;
  objc_super v9;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = CFSTR("data");
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)CTXPCUpdateSecureIntentDataRequest;
    v7 = -[CTXPCMessage initWithNamedArguments:](&v9, sel_initWithNamedArguments_, v6);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CTXPCUpdateSecureIntentDataRequest;
    v7 = -[CTXPCRequestMessage init](&v10, sel_init);
  }

  return v7;
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
  -[CTXPCUpdateSecureIntentDataRequest data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__CTXPCUpdateSecureIntentDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152DA48;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "updateSecureIntentData:completion:", v8, v10);

}

uint64_t __82__CTXPCUpdateSecureIntentDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCUpdateSecureIntentDataRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)data
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("data"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
