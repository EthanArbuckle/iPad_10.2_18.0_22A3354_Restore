@implementation CTXPCInstallPendingPlansRequest

- (CTXPCInstallPendingPlansRequest)initWithPlanList:(id)a3
{
  id v4;
  void *v5;
  CTXPCInstallPendingPlansRequest *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("plans");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CTXPCInstallPendingPlansRequest;
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
  -[CTXPCInstallPendingPlansRequest planList](self, "planList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__CTXPCInstallPendingPlansRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152DA48;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "installPendingPlanList:completion:", v8, v10);

}

uint64_t __79__CTXPCInstallPendingPlansRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCInstallPendingPlansRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)planList
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("plans"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTPlanList>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
