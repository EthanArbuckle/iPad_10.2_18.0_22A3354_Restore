@implementation CTXPCCheckPreFlightEligibilityRequest

- (CTXPCCheckPreFlightEligibilityRequest)initWithIccid:(id)a3 mccs:(id)a4 mncs:(id)a5 gid1s:(id)a6 gid2s:(id)a7 smdpUrl:(id)a8 iccidPrefix:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  CTXPCCheckPreFlightEligibilityRequest *v23;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("iccids"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("mccs"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("mncs"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("gid1s"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("gid2s"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("urlString"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("iccidPrefix"));
  v25.receiver = self;
  v25.super_class = (Class)CTXPCCheckPreFlightEligibilityRequest;
  v23 = -[CTXPCMessage initWithNamedArguments:](&v25, sel_initWithNamedArguments_, v22);

  return v23;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  -[CTXPCCheckPreFlightEligibilityRequest iccids](self, "iccids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest mccs](self, "mccs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest mncs](self, "mncs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest gid1s](self, "gid1s");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest gid2s](self, "gid2s");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest smdpUrl](self, "smdpUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCCheckPreFlightEligibilityRequest iccidPrefix](self, "iccidPrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__CTXPCCheckPreFlightEligibilityRequest_performRequestWithHandler_completionHandler___block_invoke;
  v16[3] = &unk_1E152FCB8;
  v15 = v7;
  v17 = v15;
  objc_msgSend(v6, "checkPreFlightEligibility:mccs:mncs:gid1s:gid2s:smdpUrl:iccidPrefix:completion:", v8, v9, v10, v11, v12, v13, v14, v16);

}

void __85__CTXPCCheckPreFlightEligibilityRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  return 14;
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCCheckPreFlightEligibilityRequest;
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

- (id)iccids
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iccids"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)mccs
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mccs"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)mncs
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mncs"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)gid1s
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gid1s"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)gid2s
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gid2s"));
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
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("urlString"));
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
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("iccidPrefix"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
