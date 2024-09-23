@implementation CTXPCEncryptDataRequest

- (CTXPCEncryptDataRequest)initWithMcc:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 plainText:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  CTXPCEncryptDataRequest *v19;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = CFSTR("mcc");
  v22[1] = CFSTR("mnc");
  v23[0] = v12;
  v23[1] = v13;
  v22[2] = CFSTR("plainText");
  v23[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("gid1"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("gid2"));
  v21.receiver = self;
  v21.super_class = (Class)CTXPCEncryptDataRequest;
  v19 = -[CTXPCMessage initWithNamedArguments:](&v21, sel_initWithNamedArguments_, v18);

  return v19;
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
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[CTXPCEncryptDataRequest mcc](self, "mcc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCEncryptDataRequest mnc](self, "mnc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCEncryptDataRequest gid1](self, "gid1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCEncryptDataRequest gid2](self, "gid2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCEncryptDataRequest plainText](self, "plainText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__CTXPCEncryptDataRequest_performRequestWithHandler_completionHandler___block_invoke;
  v14[3] = &unk_1E152FBF0;
  v13 = v7;
  v15 = v13;
  objc_msgSend(v6, "encryptDataWithCarrierIdentifiers:mnc:gid1:gid2:data:completion:", v8, v9, v10, v11, v12, v14);

}

void __71__CTXPCEncryptDataRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  CTXPCEncryptDataResponse *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = -[CTXPCEncryptDataResponse initWithCipherText:]([CTXPCEncryptDataResponse alloc], "initWithCipherText:", v8);
  (*(void (**)(uint64_t, CTXPCEncryptDataResponse *, id))(v6 + 16))(v6, v7, v5);

}

- (int)requiredEntitlement
{
  return 25;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCEncryptDataRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mcc
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mcc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mnc
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mnc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)gid1
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("gid1"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)gid2
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("gid2"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)plainText
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("plainText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<NSString>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
