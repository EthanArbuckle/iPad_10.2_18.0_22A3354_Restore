@implementation INGetIntentParameterOptionsForwardingAction

- (INGetIntentParameterOptionsForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4 searchTerm:(id)a5
{
  id v8;
  id v9;
  INGetIntentParameterOptionsForwardingAction *v10;
  uint64_t v11;
  NSString *parameterName;
  uint64_t v13;
  NSString *searchTerm;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INGetIntentParameterOptionsForwardingAction;
  v10 = -[INIntentForwardingAction initWithIntent:](&v16, sel_initWithIntent_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    parameterName = v10->_parameterName;
    v10->_parameterName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    searchTerm = v10->_searchTerm;
    v10->_searchTerm = (NSString *)v13;

  }
  return v10;
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSString *parameterName;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INGetIntentParameterOptionsForwardingAction;
  if (!-[INIntentForwardingAction executeRemotelyWithVendorRemote:completionHandler:](&v14, sel_executeRemotelyWithVendorRemote_completionHandler_, v6, v7))
  {
    v8 = objc_opt_respondsToSelector();
    parameterName = self->_parameterName;
    -[INIntentForwardingAction intent](self, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
    {
      -[INGetIntentParameterOptionsForwardingAction searchTerm](self, "searchTerm");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[INGetIntentParameterOptionsForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getIntentParameterOptions:forIntent:searchTerm:completionBlock:", parameterName, v10, v11, v12);

    }
    else
    {
      -[INGetIntentParameterOptionsForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getIntentParameterOptions:forIntent:completionBlock:", parameterName, v10, v11);
    }

  }
  return 1;
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  NSString *parameterName;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  parameterName = self->_parameterName;
  v7 = a4;
  v8 = a3;
  -[INIntentForwardingAction intent](self, "intent");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[INGetIntentParameterOptionsForwardingAction searchTerm](self, "searchTerm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetIntentParameterOptionsForwardingAction _completionHandlerWithActionCompletionHandler:](self, "_completionHandlerWithActionCompletionHandler:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "getIntentParameterOptions:forIntent:searchTerm:completionBlock:", parameterName, v11, v9, v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INGetIntentParameterOptionsForwardingAction;
  v4 = a3;
  -[INIntentForwardingAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterName, CFSTR("parameterName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchTerm, CFSTR("searchTerm"));

}

- (INGetIntentParameterOptionsForwardingAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  INGetIntentParameterOptionsForwardingAction *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchTerm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INGetIntentParameterOptionsForwardingAction initWithIntent:parameterName:searchTerm:](self, "initWithIntent:parameterName:searchTerm:", v5, v6, v7);
  return v8;
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
  v7[2] = __93__INGetIntentParameterOptionsForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke;
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

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
}

void __93__INGetIntentParameterOptionsForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  INGetIntentParameterOptionsForwardingActionResponse *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[INGetIntentParameterOptionsForwardingActionResponse initWithArchivedObjectCollection:error:]([INGetIntentParameterOptionsForwardingActionResponse alloc], "initWithArchivedObjectCollection:error:", v6, v5);

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
