@implementation INGetIntentParameterDefaultValueForwardingAction

- (INGetIntentParameterDefaultValueForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4
{
  id v6;
  INGetIntentParameterDefaultValueForwardingAction *v7;
  uint64_t v8;
  NSString *parameterName;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  v7 = -[INIntentForwardingAction initWithIntent:](&v11, sel_initWithIntent_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    parameterName = v7->_parameterName;
    v7->_parameterName = (NSString *)v8;

  }
  return v7;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSString *parameterName;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  if (!-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v13, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    -[INIntentForwardingAction intent](self, "intent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentWithTypedIntent(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    parameterName = self->_parameterName;
    -[INGetIntentParameterDefaultValueForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getIntentParameterDefaultValue:forIntent:completionBlock:", parameterName, v9, v11);

  }
  return 1;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  NSString *parameterName;
  id v7;
  id v8;
  void *v9;
  id v10;

  parameterName = self->_parameterName;
  v7 = a4;
  v8 = a3;
  -[INIntentForwardingAction intent](self, "intent");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[INGetIntentParameterDefaultValueForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "getIntentParameterDefaultValue:forIntent:completionBlock:", parameterName, v10, v9);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  v4 = a3;
  -[INIntentForwardingAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterName, CFSTR("parameterName"), v5.receiver, v5.super_class);

}

- (INGetIntentParameterDefaultValueForwardingAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INGetIntentParameterDefaultValueForwardingAction *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INGetIntentParameterDefaultValueForwardingAction initWithIntent:parameterName:](self, "initWithIntent:parameterName:", v5, v6);
  return v7;
}

- (id)_completionHandlerWithActionCompletionHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__INGetIntentParameterDefaultValueForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E2293D30;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D7812C4](v7);

  return v5;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterName, 0);
}

void __98__INGetIntentParameterDefaultValueForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  INGetIntentParameterDefaultValueForwardingActionResponse *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[INGetIntentParameterDefaultValueForwardingActionResponse initWithArchivedDefaultValue:error:]([INGetIntentParameterDefaultValueForwardingActionResponse alloc], "initWithArchivedDefaultValue:error:", v6, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
