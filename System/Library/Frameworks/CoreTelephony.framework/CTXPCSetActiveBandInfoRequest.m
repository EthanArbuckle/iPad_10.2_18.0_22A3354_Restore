@implementation CTXPCSetActiveBandInfoRequest

- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bands:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CTXPCSetActiveBandInfoRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v15[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("bands");
  v16[0] = v10;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetActiveBandInfoRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (CTXPCSetActiveBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4 bandInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CTXPCSetActiveBandInfoRequest *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v15[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("bands");
  v16[0] = v10;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CTXPCSetActiveBandInfoRequest;
  v12 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v14, sel_initWithContext_namedArguments_, v8, v11);

  return v12;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("bands"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == 1)
  {
    CTThrowingCastIfClass<CTBandInfo>(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v17[3] = &unk_1E152DA48;
    v16 = v17;
    v17[4] = v7;
    objc_msgSend(v6, "setActiveBandInfo:bands:completion:", v15, v14, v17);
    goto LABEL_5;
  }
  if (!v11)
  {
    CTThrowingCastIfClass<NSDictionary>(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
    v18[3] = &unk_1E152DA48;
    v16 = v18;
    v18[4] = v7;
    objc_msgSend(v6, "setBandInfo:bands:completion:", v15, v14, v18);
LABEL_5:

  }
}

uint64_t __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__CTXPCSetActiveBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCSetActiveBandInfoRequest;
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

@end
