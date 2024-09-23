@implementation LNDisambiguationRequest

- (LNDisambiguationRequest)initWithIdentifier:(id)a3 parameterName:(id)a4 providedValues:(id)a5 dialog:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  LNDisambiguationRequest *v16;
  LNDisambiguationRequest *v17;
  uint64_t v18;
  LNDialog *dialog;
  id completionHandler;
  LNDisambiguationRequest *v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisambiguationRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterName"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisambiguationRequest.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisambiguationRequest.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providedValues"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)LNDisambiguationRequest;
  v16 = -[LNDisambiguationRequest init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_parameterName, a4);
    objc_storeStrong((id *)&v17->_providedValues, a5);
    v18 = objc_msgSend(v15, "copy");
    dialog = v17->_dialog;
    v17->_dialog = (LNDialog *)v18;

    completionHandler = v17->_completionHandler;
    v17->_completionHandler = 0;

    v21 = v17;
  }

  return v17;
}

- (void)respondWithSelectedIndex:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LNDisambiguationRequest responseWithSelectedIndex:value:](self, "responseWithSelectedIndex:value:", v4, 0);

}

- (void)respondWithValue:(id)a3
{
  -[LNDisambiguationRequest responseWithSelectedIndex:value:](self, "responseWithSelectedIndex:value:", 0, a3);
}

- (void)responseWithSelectedIndex:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  LNDisambiguationResponse *v8;
  void *v9;
  NSObject *v10;
  id completionHandler;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_completionHandler)
  {
    v8 = [LNDisambiguationResponse alloc];
    -[LNDisambiguationRequest identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LNDisambiguationResponse initWithIdentifier:selectedIndex:value:updates:](v8, "initWithIdentifier:selectedIndex:value:updates:", v9, v6, v7, 0);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      -[LNDisambiguationRequest identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v13;

    }
  }

}

- (void)respondWithUpdates:(id)a3
{
  id v4;
  LNDisambiguationResponse *v5;
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
    v5 = [LNDisambiguationResponse alloc];
    -[LNDisambiguationRequest identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LNDisambiguationResponse initWithIdentifier:selectedIndex:value:updates:](v5, "initWithIdentifier:selectedIndex:value:updates:", v6, 0, 0, v4);

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
      -[LNDisambiguationRequest identifier](self, "identifier");
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
      -[LNDisambiguationRequest identifier](self, "identifier");
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
  -[LNDisambiguationRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNDisambiguationRequest parameterName](self, "parameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterName"));

  -[LNDisambiguationRequest providedValues](self, "providedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("providedValues"));

  -[LNDisambiguationRequest dialog](self, "dialog");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dialog"));

}

- (LNDisambiguationRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  LNDisambiguationRequest *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("providedValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v5 && v6 && v10)
  {
    self = -[LNDisambiguationRequest initWithIdentifier:parameterName:providedValues:dialog:](self, "initWithIdentifier:parameterName:providedValues:dialog:", v5, v6, v10, v11);
    v12 = self;
  }

  return v12;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (NSArray)providedValues
{
  return self->_providedValues;
}

- (LNDialog)dialog
{
  return self->_dialog;
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
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_providedValues, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)respondWithSelectedItemIndex:(int64_t)a3
{
  void *v5;
  id v6;

  -[LNDisambiguationRequest providedValues](self, "providedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[LNDisambiguationRequest respondWithValue:](self, "respondWithValue:", v6);
}

@end
