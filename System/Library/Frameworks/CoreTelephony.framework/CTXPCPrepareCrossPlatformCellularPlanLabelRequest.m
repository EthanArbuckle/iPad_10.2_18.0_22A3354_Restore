@implementation CTXPCPrepareCrossPlatformCellularPlanLabelRequest

- (CTXPCPrepareCrossPlatformCellularPlanLabelRequest)initWithPlanLabels:(id)a3
{
  id v4;
  void *v5;
  CTXPCPrepareCrossPlatformCellularPlanLabelRequest *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = CFSTR("planLabels");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CTXPCPrepareCrossPlatformCellularPlanLabelRequest;
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
  -[CTXPCPrepareCrossPlatformCellularPlanLabelRequest planLabels](self, "planLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__CTXPCPrepareCrossPlatformCellularPlanLabelRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152FD80;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "prepareCrossPlatformCellularPlanLabel:completion:", v8, v10);

}

void __97__CTXPCPrepareCrossPlatformCellularPlanLabelRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  CTXPCSubscriptionInfoMessage *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = -[CTXPCSubscriptionInfoMessage initWithInfo:]([CTXPCSubscriptionInfoMessage alloc], "initWithInfo:", v8);
  (*(void (**)(uint64_t, CTXPCSubscriptionInfoMessage *, id))(v6 + 16))(v6, v7, v5);

}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCPrepareCrossPlatformCellularPlanLabelRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)planLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("planLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSArray<CTCellularPlanCrossPlatformLabel *>>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
