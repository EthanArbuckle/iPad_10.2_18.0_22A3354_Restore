@implementation CTXPCSetRatSelectionMaskRequest

- (CTXPCSetRatSelectionMaskRequest)initWithDescriptor:(id)a3 selection:(unsigned __int8)a4 preferred:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CTXPCSetRatSelectionMaskRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v5 = a5;
  v6 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15[0] = CFSTR("selection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("preferred");
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetRatSelectionMaskRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithDescriptor:namedArguments:](&v14, sel_initWithDescriptor_namedArguments_, v8, v11);

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("selection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("preferred"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v14, "unsignedIntValue");

  -[CTXPCSubscriptionContextRequest descriptor](self, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__CTXPCSetRatSelectionMaskRequest_performRequestWithHandler_completionHandler___block_invoke;
  v17[3] = &unk_1E152DA48;
  v16 = v7;
  v18 = v16;
  objc_msgSend(v6, "setRatSelectionMask:selection:preferred:completion:", v15, v11, v10, v17);

}

uint64_t __79__CTXPCSetRatSelectionMaskRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSetRatSelectionMaskRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
