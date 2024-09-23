@implementation LNConfirmationRequest

- (LNConfirmationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 value:(id)a5 dialog:(id)a6 viewSnippet:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LNConfirmationRequest *v19;
  LNConfirmationRequest *v20;
  uint64_t v21;
  LNDialog *dialog;
  uint64_t v23;
  LNViewSnippet *viewSnippet;
  id completionHandler;
  LNConfirmationRequest *v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationRequest.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterName"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationRequest.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)LNConfirmationRequest;
  v19 = -[LNConfirmationRequest init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_parameterName, a4);
    objc_storeStrong((id *)&v20->_value, a5);
    v21 = objc_msgSend(v17, "copy");
    dialog = v20->_dialog;
    v20->_dialog = (LNDialog *)v21;

    v23 = objc_msgSend(v18, "copy");
    viewSnippet = v20->_viewSnippet;
    v20->_viewSnippet = (LNViewSnippet *)v23;

    completionHandler = v20->_completionHandler;
    v20->_completionHandler = 0;

    v26 = v20;
  }

  return v20;
}

- (void)respondWithConfirmation:(BOOL)a3
{
  _BOOL8 v4;
  LNConfirmationResponse *v5;
  void *v6;
  id completionHandler;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  LNConfirmationResponse *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_completionHandler)
  {
    v4 = a3;
    v5 = [LNConfirmationResponse alloc];
    -[LNConfirmationRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[LNConfirmationResponse initWithIdentifier:confirmed:updates:](v5, "initWithIdentifier:confirmed:updates:", v6, v4, 0);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      -[LNConfirmationRequest identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;

    }
  }
}

- (void)respondWithUpdates:(id)a3
{
  id v4;
  LNConfirmationResponse *v5;
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
    v5 = [LNConfirmationResponse alloc];
    -[LNConfirmationRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNConfirmationResponse initWithIdentifier:confirmed:updates:](v5, "initWithIdentifier:confirmed:updates:", v6, 0, v4);

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
      -[LNConfirmationRequest identifier](self, "identifier");
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
      -[LNConfirmationRequest identifier](self, "identifier");
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
  void *v8;
  id v9;

  v4 = a3;
  -[LNConfirmationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNConfirmationRequest parameterName](self, "parameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterName"));

  -[LNConfirmationRequest value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

  -[LNConfirmationRequest dialog](self, "dialog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dialog"));

  -[LNConfirmationRequest viewSnippet](self, "viewSnippet");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("viewSnippet"));

}

- (LNConfirmationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LNConfirmationRequest *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewSnippet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v5 && v6 && v7)
  {
    self = -[LNConfirmationRequest initWithIdentifier:parameterName:value:dialog:viewSnippet:](self, "initWithIdentifier:parameterName:value:dialog:viewSnippet:", v5, v6, v7, v8, v9);
    v10 = self;
  }

  return v10;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (LNValue)value
{
  return self->_value;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_viewSnippet, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
