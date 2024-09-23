@implementation CTXPCDecodeSuggestionsBase64Request

- (CTXPCDecodeSuggestionsBase64Request)initWithContext:(id)a3 base64String:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCDecodeSuggestionsBase64Request *v9;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = CFSTR("base64String");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CTXPCDecodeSuggestionsBase64Request;
  v9 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](&v11, sel_initWithContext_namedArguments_, v6, v8);

  return v9;
}

- (CTLazuliDeepLinkBase64String)base64String
{
  void *v2;
  void *v3;
  void *v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("base64String"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTThrowingCastIfClass<CTLazuliDeepLinkBase64String>(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTLazuliDeepLinkBase64String *)v4;
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
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCDecodeSuggestionsBase64Request base64String](self, "base64String");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__CTXPCDecodeSuggestionsBase64Request_performRequestWithHandler_completionHandler___block_invoke;
  v11[3] = &unk_1E152FE70;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v6, "decodeSuggestionsBase64:withBase64String:completion:", v8, v9, v11);

}

void __83__CTXPCDecodeSuggestionsBase64Request_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCDecodeSuggestionsBase64Response *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
    v6 = -[CTXPCDecodeSuggestionsBase64Response initWithDecodedPayload:]([CTXPCDecodeSuggestionsBase64Response alloc], "initWithDecodedPayload:", v5);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 7;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCDecodeSuggestionsBase64Request;
  objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
