@implementation CTXPCSupportsPlanProvisioningRequest

- (CTXPCSupportsPlanProvisioningRequest)initWithCarrierDescriptors:(id)a3 smdpUrl:(id)a4 iccidPrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CTXPCSupportsPlanProvisioningRequest *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("carrierDescriptors"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("smdpUrl"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("iccidPrefix"));
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSupportsPlanProvisioningRequest;
  v12 = -[CTXPCMessage initWithNamedArguments:](&v14, sel_initWithNamedArguments_, v11);

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
  -[CTXPCSupportsPlanProvisioningRequest carrierDescriptors](self, "carrierDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSupportsPlanProvisioningRequest smdpUrl](self, "smdpUrl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCSupportsPlanProvisioningRequest iccidPrefix](self, "iccidPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__CTXPCSupportsPlanProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E152FB00;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v6, "supportsPlanProvisioning:carrierDescriptors:smdpUrl:iccidPrefix:completionHandler:", 0, v8, v9, v10, v12);

}

void __84__CTXPCSupportsPlanProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CTXPCBooleanResponseMessage *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[CTXPCBooleanResponseMessage initWithResult:]([CTXPCBooleanResponseMessage alloc], "initWithResult:", a2);
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (int)requiredEntitlement
{
  return 26;
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSupportsPlanProvisioningRequest;
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

- (id)carrierDescriptors
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("carrierDescriptors"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)smdpUrl
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("smdpUrl"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)iccidPrefix
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("iccidPrefix"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
