@implementation CTXPCHandleTermsAndConditionsCompletedRequest

- (CTXPCHandleTermsAndConditionsCompletedRequest)initWithSourceIccid:(id)a3 consented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CTXPCHandleTermsAndConditionsCompletedRequest *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v4 = a4;
  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12[0] = CFSTR("sourceIccid");
  v12[1] = CFSTR("consented");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCHandleTermsAndConditionsCompletedRequest;
  v9 = -[CTXPCMessage initWithNamedArguments:](&v11, sel_initWithNamedArguments_, v8);

  return v9;
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CTXPCHandleTermsAndConditionsCompletedRequest sourceIccid](self, "sourceIccid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTXPCHandleTermsAndConditionsCompletedRequest consented](self, "consented");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__CTXPCHandleTermsAndConditionsCompletedRequest_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152DA48;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "handleTermsAndConditionsCompleted:consented:completion:", v8, v9, v11);

}

uint64_t __93__CTXPCHandleTermsAndConditionsCompletedRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
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
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCHandleTermsAndConditionsCompletedRequest;
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

- (id)sourceIccid
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("sourceIccid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)consented
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("consented"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSNumber>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

@end
