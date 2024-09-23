@implementation LNActionConfirmationRequest

- (LNActionConfirmationRequest)initWithIdentifier:(id)a3 result:(id)a4
{
  id v8;
  id v9;
  LNActionConfirmationRequest *v10;
  LNActionConfirmationRequest *v11;
  uint64_t v12;
  LNSuccessResult *v13;
  id completionHandler;
  LNActionConfirmationRequest *v15;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfirmationRequest.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  v18.receiver = self;
  v18.super_class = (Class)LNActionConfirmationRequest;
  v10 = -[LNActionConfirmationRequest init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v12 = objc_msgSend(v9, "copy");
    v13 = v11->_result;
    v11->_result = (LNSuccessResult *)v12;

    completionHandler = v11->_completionHandler;
    v11->_completionHandler = 0;

    v15 = v11;
  }

  return v11;
}

- (void)respondWithConfirmation:(BOOL)a3
{
  LNActionConfirmationResponse *v4;
  void *v5;
  id completionHandler;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  LNActionConfirmationResponse *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v10 = (LNActionConfirmationResponse *)objc_claimAutoreleasedReturnValue();
    -[LNActionConfirmationRequest respondWithError:](self, "respondWithError:");
    goto LABEL_5;
  }
  if (self->_completionHandler)
  {
    v4 = [LNActionConfirmationResponse alloc];
    -[LNActionConfirmationRequest identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LNActionConfirmationResponse initWithIdentifier:](v4, "initWithIdentifier:", v5);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

LABEL_5:
    return;
  }
  getLNLogCategoryExecution();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_opt_class();
    -[LNActionConfirmationRequest identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v9;

  }
}

- (void)respondWithUpdates:(id)a3
{
  id v4;
  LNActionConfirmationResponse *v5;
  void *v6;
  NSObject *v7;
  id completionHandler;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_completionHandler)
  {
    v5 = [LNActionConfirmationResponse alloc];
    -[LNActionConfirmationRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNActionConfirmationResponse initWithIdentifier:updates:](v5, "initWithIdentifier:updates:", v6, v4);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      -[LNActionConfirmationRequest identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;

    }
  }

}

- (void)respondWithError:(id)a3
{
  void (**completionHandler)(id, _QWORD, id);
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_opt_class();
      -[LNActionConfirmationRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;

    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNActionConfirmationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNActionConfirmationRequest result](self, "result");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("result"));

}

- (LNActionConfirmationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  LNActionConfirmationRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[LNActionConfirmationRequest initWithIdentifier:result:](self, "initWithIdentifier:result:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
