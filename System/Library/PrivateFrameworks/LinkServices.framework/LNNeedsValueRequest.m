@implementation LNNeedsValueRequest

- (LNNeedsValueRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 dialog:(id)a5 viewSnippet:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  LNNeedsValueRequest *v16;
  LNNeedsValueRequest *v17;
  uint64_t v18;
  LNDialog *dialog;
  uint64_t v20;
  LNViewSnippet *viewSnippet;
  id completionHandler;
  LNNeedsValueRequest *v23;
  void *v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNNeedsValueRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNNeedsValueRequest.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterName"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)LNNeedsValueRequest;
  v16 = -[LNNeedsValueRequest init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_parameterName, a4);
    v18 = objc_msgSend(v14, "copy");
    dialog = v17->_dialog;
    v17->_dialog = (LNDialog *)v18;

    v20 = objc_msgSend(v15, "copy");
    viewSnippet = v17->_viewSnippet;
    v17->_viewSnippet = (LNViewSnippet *)v20;

    completionHandler = v17->_completionHandler;
    v17->_completionHandler = 0;

    v23 = v17;
  }

  return v17;
}

- (void)respondWithValue:(id)a3
{
  id v4;
  LNNeedsValueResponse *v5;
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
    v5 = [LNNeedsValueResponse alloc];
    -[LNNeedsValueRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNNeedsValueResponse initWithIdentifier:value:updates:](v5, "initWithIdentifier:value:updates:", v6, v4, 0);

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
      -[LNNeedsValueRequest identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;

    }
  }

}

- (void)respondWithUpdates:(id)a3
{
  id v4;
  LNNeedsValueResponse *v5;
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
    v5 = [LNNeedsValueResponse alloc];
    -[LNNeedsValueRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNNeedsValueResponse initWithIdentifier:value:updates:](v5, "initWithIdentifier:value:updates:", v6, 0, v4);

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
      -[LNNeedsValueRequest identifier](self, "identifier");
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
      -[LNNeedsValueRequest identifier](self, "identifier");
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
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNNeedsValueRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNNeedsValueRequest parameterName](self, "parameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterName"));

  -[LNNeedsValueRequest dialog](self, "dialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dialog"));

  -[LNNeedsValueRequest viewSnippet](self, "viewSnippet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("viewSnippet"));

}

- (LNNeedsValueRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  LNNeedsValueRequest *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewSnippet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = -[LNNeedsValueRequest initWithIdentifier:parameterName:dialog:viewSnippet:](self, "initWithIdentifier:parameterName:dialog:viewSnippet:", v5, v6, v7, v8);
    v10 = self;
  }

  return v10;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (LNViewSnippet)viewSnippet
{
  return self->_viewSnippet;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
