@implementation INResolveIntentParametersForwardingAction

- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterNames:(id)a4
{
  id v7;
  INResolveIntentParametersForwardingAction *v8;
  INResolveIntentParametersForwardingAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResolveIntentParametersForwardingAction;
  v8 = -[INIntentForwardingAction initWithIntent:](&v11, sel_initWithIntent_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parameterNames, a4);
    v9->_resolvesAllParameters = 1;
  }

  return v9;
}

- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4
{
  id v6;
  INResolveIntentParametersForwardingAction *v7;
  uint64_t v8;
  NSArray *parameterNames;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResolveIntentParametersForwardingAction;
  v7 = -[INIntentForwardingAction initWithIntent:](&v11, sel_initWithIntent_, a3);
  if (v7)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    parameterNames = v7->_parameterNames;
    v7->_parameterNames = (NSArray *)v8;

    v7->_resolvesAllParameters = 0;
  }

  return v7;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSArray *parameterNames;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)INResolveIntentParametersForwardingAction;
  if (!-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v13, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    parameterNames = self->_parameterNames;
    if (self->_resolvesAllParameters)
    {
      -[INIntentForwardingAction intent](self, "intent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[INResolveIntentParametersForwardingAction _completionHandlerForMultipleParametersWithActionCompletionHandler:](self, "_completionHandlerForMultipleParametersWithActionCompletionHandler:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolveIntentSlots:forIntent:completionBlock:", parameterNames, v9, v10);
    }
    else
    {
      -[NSArray firstObject](self->_parameterNames, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentForwardingAction intent](self, "intent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[INResolveIntentParametersForwardingAction _completionHandlerForSingleParameterNamed:withActionCompletionHandler:](self, "_completionHandlerForSingleParameterNamed:withActionCompletionHandler:", v9, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolveIntentSlot:forIntent:completionBlock:", v9, v10, v11);

    }
  }

  return 1;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  _BOOL4 resolvesAllParameters;
  NSArray *parameterNames;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  resolvesAllParameters = self->_resolvesAllParameters;
  parameterNames = self->_parameterNames;
  v8 = a4;
  v9 = a3;
  if (resolvesAllParameters)
  {
    -[INIntentForwardingAction intent](self, "intent");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[INResolveIntentParametersForwardingAction _completionHandlerForMultipleParametersWithActionCompletionHandler:](self, "_completionHandlerForMultipleParametersWithActionCompletionHandler:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "resolveIntentParameters:forIntent:completionBlock:", parameterNames, v12, v10);
  }
  else
  {
    -[NSArray firstObject](parameterNames, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[INIntentForwardingAction intent](self, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INResolveIntentParametersForwardingAction _completionHandlerForSingleParameterNamed:withActionCompletionHandler:](self, "_completionHandlerForSingleParameterNamed:withActionCompletionHandler:", v12, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "resolveIntentParameter:forIntent:completionBlock:", v12, v10, v11);
    v9 = (id)v11;
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INResolveIntentParametersForwardingAction;
  v4 = a3;
  -[INIntentForwardingAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterNames, CFSTR("parameterNames"), v5.receiver, v5.super_class);

}

- (INResolveIntentParametersForwardingAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  INResolveIntentParametersForwardingAction *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameterNames"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INResolveIntentParametersForwardingAction initWithIntent:parameterNames:](self, "initWithIntent:parameterNames:", v5, v9);
  return v10;
}

- (id)_completionHandlerForMultipleParametersWithActionCompletionHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __112__INResolveIntentParametersForwardingAction__completionHandlerForMultipleParametersWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E228A228;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D7812C4](v7);

  return v5;
}

- (id)_completionHandlerForSingleParameterNamed:(id)a3 withActionCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__INResolveIntentParametersForwardingAction__completionHandlerForSingleParameterNamed_withActionCompletionHandler___block_invoke;
  v11[3] = &unk_1E228A250;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x18D7812C4](v11);

  return v9;
}

- (BOOL)resolvesAllParameters
{
  return self->_resolvesAllParameters;
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterNames, 0);
}

void __115__INResolveIntentParametersForwardingAction__completionHandlerForSingleParameterNamed_withActionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  INExtensionContextSlotResolutionResult *v4;
  INResolveIntentParametersForwardingActionResponse *v5;
  void *v6;
  INResolveIntentParametersForwardingActionResponse *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[INExtensionContextSlotResolutionResult initWithResult:data:]([INExtensionContextSlotResolutionResult alloc], "initWithResult:data:", -1, v3);

  v5 = [INResolveIntentParametersForwardingActionResponse alloc];
  v8 = *(_QWORD *)(a1 + 32);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INResolveIntentParametersForwardingActionResponse initWithSuccess:updatedIntent:parameterResolutionResults:error:](v5, "initWithSuccess:updatedIntent:parameterResolutionResults:error:", 1, 0, v6, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __112__INResolveIntentParametersForwardingAction__completionHandlerForMultipleParametersWithActionCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  INResolveIntentParametersForwardingActionResponse *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[INResolveIntentParametersForwardingActionResponse initWithSuccess:updatedIntent:parameterResolutionResults:error:]([INResolveIntentParametersForwardingActionResponse alloc], "initWithSuccess:updatedIntent:parameterResolutionResults:error:", a2, v8, v7, 0);

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
