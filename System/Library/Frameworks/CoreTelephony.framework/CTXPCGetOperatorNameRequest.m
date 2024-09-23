@implementation CTXPCGetOperatorNameRequest

- (CTXPCGetOperatorNameRequest)initWithContext:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CTXPCGetOperatorNameRequest *v9;
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
  v11.super_class = (Class)CTXPCGetOperatorNameRequest;
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
  _QWORD v16[5];

  v6 = a3;
  v7 = a4;
  -[CTXPCMessage namedArguments](self, "namedArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  switch(v11)
  {
    case 2:
      -[CTXPCSubscriptionContextRequest context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke_3;
      v14[3] = &unk_1E152FBF0;
      v13 = v14;
      v14[4] = v7;
      objc_msgSend(v6, "copyAbbreviatedOperatorName:completion:", v12, v14);
      goto LABEL_7;
    case 1:
      -[CTXPCSubscriptionContextRequest context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke_2;
      v15[3] = &unk_1E152FBF0;
      v13 = v15;
      v15[4] = v7;
      objc_msgSend(v6, "copyLocalizedOperatorName:completion:", v12, v15);
      goto LABEL_7;
    case 0:
      -[CTXPCSubscriptionContextRequest context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke;
      v16[3] = &unk_1E152FBF0;
      v13 = v16;
      v16[4] = v7;
      objc_msgSend(v6, "copyOperatorName:completion:", v12, v16);
LABEL_7:

      break;
  }

}

void __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetOperatorNameResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCGetOperatorNameResponse initWithOperatorName:]([CTXPCGetOperatorNameResponse alloc], "initWithOperatorName:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetOperatorNameResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCGetOperatorNameResponse initWithOperatorName:]([CTXPCGetOperatorNameResponse alloc], "initWithOperatorName:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__CTXPCGetOperatorNameRequest_performRequestWithHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetOperatorNameResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCGetOperatorNameResponse initWithOperatorName:]([CTXPCGetOperatorNameResponse alloc], "initWithOperatorName:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetOperatorNameRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
