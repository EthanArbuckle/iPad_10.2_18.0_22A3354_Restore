@implementation CTXPCGetBandInfoRequest

- (CTXPCGetBandInfoRequest)initWithContext:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CTXPCGetBandInfoRequest *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCGetBandInfoRequest;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
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
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 == 1)
  {
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2;
    v14[3] = &unk_1E1532698;
    v13 = v14;
    v14[4] = v7;
    objc_msgSend(v6, "getBandInfo:completion:", v12, v14);
    goto LABEL_5;
  }
  if (!v11)
  {
    -[CTXPCSubscriptionContextRequest context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
    v15[3] = &unk_1E152FC68;
    v13 = v15;
    v15[4] = v7;
    objc_msgSend(v6, "copyBandInfo:completion:", v12, v15);
LABEL_5:

  }
}

void __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetBandInfoResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = 0;
  if (v7 && !v5)
    v6 = -[CTXPCGetBandInfoResponse initWithBandMasks:]([CTXPCGetBandInfoResponse alloc], "initWithBandMasks:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__CTXPCGetBandInfoRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetBandInfoResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = 0;
  if (v7 && !v5)
    v6 = -[CTXPCGetBandInfoResponse initWithBandInfo:]([CTXPCGetBandInfoResponse alloc], "initWithBandInfo:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetBandInfoRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
