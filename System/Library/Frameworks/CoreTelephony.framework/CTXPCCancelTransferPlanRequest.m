@implementation CTXPCCancelTransferPlanRequest

- (CTXPCCancelTransferPlanRequest)initWithPlan:(id)a3 fromDevice:(id)a4 keepCache:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CTXPCCancelTransferPlanRequest *v12;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v5 = a5;
  v16[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15[0] = CFSTR("plan");
  v15[1] = CFSTR("deviceID");
  v16[0] = v8;
  v16[1] = v9;
  v15[2] = CFSTR("keepCache");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCCancelTransferPlanRequest;
  v12 = -[CTXPCMessage initWithNamedArguments:](&v14, sel_initWithNamedArguments_, v11);

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[CTXPCCancelTransferPlanRequest plan](self, "plan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCancelTransferPlanRequest deviceIdentifier](self, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CTXPCCancelTransferPlanRequest keepCache](self, "keepCache");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__CTXPCCancelTransferPlanRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E152DA48;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "cancelCellularPlanTransfer:fromDevice:keepCache:completionHandler:", v8, v9, v10, v12);

}

uint64_t __78__CTXPCCancelTransferPlanRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCCancelTransferPlanRequest;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)plan
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("plan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTPlan>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("deviceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTDeviceIdentifier>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)keepCache
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("keepCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

@end
