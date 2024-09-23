@implementation INResolveIntentParametersForwardingActionResponse

- (INResolveIntentParametersForwardingActionResponse)initWithSuccess:(BOOL)a3 updatedIntent:(id)a4 parameterResolutionResults:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  INResolveIntentParametersForwardingActionResponse *v13;
  INResolveIntentParametersForwardingActionResponse *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INResolveIntentParametersForwardingActionResponse;
  v13 = -[INIntentForwardingActionResponse initWithError:](&v16, sel_initWithError_, a6);
  v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    objc_storeStrong((id *)&v13->_updatedIntent, a4);
    objc_storeStrong((id *)&v14->_parameterResolutionResults, a5);
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INResolveIntentParametersForwardingActionResponse;
  v4 = a3;
  -[INIntentForwardingActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_success, CFSTR("success"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatedIntent, CFSTR("updatedIntent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterResolutionResults, CFSTR("parameterResolutionResults"));

}

- (INResolveIntentParametersForwardingActionResponse)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  INResolveIntentParametersForwardingActionResponse *v18;
  void *v20;
  unsigned int v21;

  v3 = a3;
  v21 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("success"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedIntent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("parameterResolutionResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("error"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[INResolveIntentParametersForwardingActionResponse initWithSuccess:updatedIntent:parameterResolutionResults:error:](self, "initWithSuccess:updatedIntent:parameterResolutionResults:error:", v21, v20, v8, v17);
  return v18;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (INIntent)updatedIntent
{
  return self->_updatedIntent;
}

- (NSDictionary)parameterResolutionResults
{
  return self->_parameterResolutionResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterResolutionResults, 0);
  objc_storeStrong((id *)&self->_updatedIntent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
