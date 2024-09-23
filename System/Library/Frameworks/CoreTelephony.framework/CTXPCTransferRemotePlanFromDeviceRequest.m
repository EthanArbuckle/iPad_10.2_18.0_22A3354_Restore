@implementation CTXPCTransferRemotePlanFromDeviceRequest

- (CTXPCTransferRemotePlanFromDeviceRequest)initWithPlanID:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCTransferRemotePlanFromDeviceRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("planID"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("deviceID"));
  v11.receiver = self;
  v11.super_class = (Class)CTXPCTransferRemotePlanFromDeviceRequest;
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
  -[CTXPCTransferRemotePlanFromDeviceRequest planID](self, "planID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCTransferRemotePlanFromDeviceRequest deviceIdentifier](self, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__CTXPCTransferRemotePlanFromDeviceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FCB8;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "transferRemotePlan:fromDevice:completion:", v8, v9, v11);

}

void __88__CTXPCTransferRemotePlanFromDeviceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  return 3;
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCTransferRemotePlanFromDeviceRequest;
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

- (id)planID
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("planID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTRemotePlanIdentifier>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deviceIdentifier
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("deviceID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
