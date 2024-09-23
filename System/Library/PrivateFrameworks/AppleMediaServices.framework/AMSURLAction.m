@implementation AMSURLAction

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setDialogResult:(id)a3
{
  objc_storeStrong((id *)&self->_dialogResult, a3);
}

- (void)setAuthenticateResult:(id)a3
{
  objc_storeStrong((id *)&self->_authenticateResult, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedMethod, 0);
  objc_storeStrong((id *)&self->_updatedBody, 0);
  objc_storeStrong((id *)&self->_updatedHeaders, 0);
  objc_storeStrong((id *)&self->_dialogResult, 0);
  objc_storeStrong((id *)&self->_authenticateResult, 0);
  objc_storeStrong((id *)&self->_retryIdentifier, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_updatedBuyParams, 0);
}

+ (id)proceedAction
{
  return -[AMSURLAction initWithType:]([AMSURLAction alloc], "initWithType:", 0);
}

- (AMSURLAction)initWithType:(int64_t)a3
{
  AMSURLAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSURLAction;
  result = -[AMSURLAction init](&v5, sel_init);
  if (result)
    result->_actionType = a3;
  return result;
}

+ (AMSURLAction)actionWithError:(id)a3
{
  NSError *v3;
  AMSURLAction *v4;
  NSError *error;

  v3 = (NSError *)a3;
  v4 = -[AMSURLAction initWithType:]([AMSURLAction alloc], "initWithType:", 3);
  error = v4->_error;
  v4->_error = v3;

  return v4;
}

+ (id)retryAction
{
  return -[AMSURLAction initWithType:]([AMSURLAction alloc], "initWithType:", 2);
}

+ (id)redirectActionWithURL:(id)a3
{
  id v4;
  AMSURLAction *v5;
  NSURL *v6;
  void *redirectURL;

  v4 = a3;
  if (v4)
  {
    v5 = -[AMSURLAction initWithType:]([AMSURLAction alloc], "initWithType:", 1);
    v6 = (NSURL *)v4;
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = v6;
  }
  else
  {
    AMSError(301, CFSTR("Unable to redirect"), CFSTR("Redirect URL not found"), 0);
    redirectURL = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "actionWithError:", redirectURL);
    v5 = (AMSURLAction *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (AMSURLAction)initWithType:(int64_t)a3 error:(id)a4 reason:(id)a5 redirectURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSURLAction *v14;
  AMSURLAction *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSURLAction;
  v14 = -[AMSURLAction init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_actionType = a3;
    objc_storeStrong((id *)&v14->_error, a4);
    objc_storeStrong((id *)&v15->_reason, a5);
    objc_storeStrong((id *)&v15->_redirectURL, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[AMSURLAction actionType](self, "actionType");
  -[AMSURLAction reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLAction redirectURL](self, "redirectURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AMSLogableURL(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLAction retryIdentifier](self, "retryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ type=%ld reason=%@ redirectURL=%@ retryId=%@>"), v4, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSURLAction actionType](self, "actionType"), CFSTR("actionType"));
  -[AMSURLAction error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

  -[AMSURLAction reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reason"));

  -[AMSURLAction redirectURL](self, "redirectURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("redirectURL"));

  -[AMSURLAction updatedBody](self, "updatedBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("updatedBody"));

  -[AMSURLAction updatedBuyParams](self, "updatedBuyParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("updateBuyParams"));

  -[AMSURLAction updatedHeaders](self, "updatedHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("updatedHeaders"));

  -[AMSURLAction updatedMethod](self, "updatedMethod");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("updatedMethod"));

}

- (AMSURLAction)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  AMSURLAction *v9;
  void *v10;
  uint64_t v11;
  NSData *updatedBody;
  uint64_t v13;
  NSString *updatedBuyParams;
  void *v15;
  uint64_t v16;
  NSDictionary *updatedHeaders;
  uint64_t v18;
  NSString *updatedMethod;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redirectURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSURLAction initWithType:error:reason:redirectURL:](self, "initWithType:error:reason:redirectURL:", v5, v6, v7, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("updatedBody"));
    v11 = objc_claimAutoreleasedReturnValue();
    updatedBody = v9->_updatedBody;
    v9->_updatedBody = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateBuyParams"));
    v13 = objc_claimAutoreleasedReturnValue();
    updatedBuyParams = v9->_updatedBuyParams;
    v9->_updatedBuyParams = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_JSONClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("updatedHeaders"));
    v16 = objc_claimAutoreleasedReturnValue();
    updatedHeaders = v9->_updatedHeaders;
    v9->_updatedHeaders = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedMethod"));
    v18 = objc_claimAutoreleasedReturnValue();
    updatedMethod = v9->_updatedMethod;
    v9->_updatedMethod = (NSString *)v18;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)updatedBuyParams
{
  return self->_updatedBuyParams;
}

- (void)setUpdatedBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_updatedBuyParams, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (NSString)retryIdentifier
{
  return self->_retryIdentifier;
}

- (void)setRetryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_retryIdentifier, a3);
}

- (AMSAuthenticateResult)authenticateResult
{
  return self->_authenticateResult;
}

- (AMSDialogResult)dialogResult
{
  return self->_dialogResult;
}

- (NSDictionary)updatedHeaders
{
  return self->_updatedHeaders;
}

- (void)setUpdatedHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_updatedHeaders, a3);
}

- (NSData)updatedBody
{
  return self->_updatedBody;
}

- (void)setUpdatedBody:(id)a3
{
  objc_storeStrong((id *)&self->_updatedBody, a3);
}

- (NSString)updatedMethod
{
  return self->_updatedMethod;
}

- (void)setUpdatedMethod:(id)a3
{
  objc_storeStrong((id *)&self->_updatedMethod, a3);
}

@end
