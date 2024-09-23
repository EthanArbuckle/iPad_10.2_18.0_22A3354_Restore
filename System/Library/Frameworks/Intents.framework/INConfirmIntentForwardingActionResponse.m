@implementation INConfirmIntentForwardingActionResponse

- (INConfirmIntentForwardingActionResponse)initWithIntentResponse:(id)a3 launchContextActivityData:(id)a4 cacheItems:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  INConfirmIntentForwardingActionResponse *v14;
  INConfirmIntentForwardingActionResponse *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INConfirmIntentForwardingActionResponse;
  v14 = -[INIntentForwardingActionResponse initWithError:](&v17, sel_initWithError_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_intentResponse, a3);
    objc_storeStrong((id *)&v15->_launchContextActivityData, a4);
    objc_storeStrong((id *)&v15->_cacheItems, a5);
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INConfirmIntentForwardingActionResponse;
  v4 = a3;
  -[INIntentForwardingActionResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentResponse, CFSTR("intentResponse"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_launchContextActivityData, CFSTR("launchContextActivityData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cacheItems, CFSTR("cacheItems"));

}

- (INConfirmIntentForwardingActionResponse)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  INConfirmIntentForwardingActionResponse *v17;
  void *v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentResponse"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchContextActivityData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("cacheItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("error"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[INConfirmIntentForwardingActionResponse initWithIntentResponse:launchContextActivityData:cacheItems:error:](self, "initWithIntentResponse:launchContextActivityData:cacheItems:error:", v20, v19, v7, v16);
  return v17;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (NSData)launchContextActivityData
{
  return self->_launchContextActivityData;
}

- (NSSet)cacheItems
{
  return self->_cacheItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheItems, 0);
  objc_storeStrong((id *)&self->_launchContextActivityData, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
