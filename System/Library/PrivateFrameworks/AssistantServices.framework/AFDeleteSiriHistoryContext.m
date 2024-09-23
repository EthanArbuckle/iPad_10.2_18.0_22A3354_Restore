@implementation AFDeleteSiriHistoryContext

- (AFDeleteSiriHistoryContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFDeleteSiriHistoryContextMutation *);
  AFDeleteSiriHistoryContext *v5;
  AFDeleteSiriHistoryContext *v6;
  _AFDeleteSiriHistoryContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *successTitle;
  void *v11;
  uint64_t v12;
  NSString *successBody;
  void *v14;
  uint64_t v15;
  NSString *successButtonText;
  void *v17;
  uint64_t v18;
  NSString *errorTitle;
  void *v20;
  uint64_t v21;
  NSString *errorBody;
  void *v23;
  uint64_t v24;
  NSString *errorButtonText;
  objc_super v27;

  v4 = (void (**)(id, _AFDeleteSiriHistoryContextMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFDeleteSiriHistoryContext;
  v5 = -[AFDeleteSiriHistoryContext init](&v27, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFDeleteSiriHistoryContextMutation initWithBase:]([_AFDeleteSiriHistoryContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFDeleteSiriHistoryContextMutation isDirty](v7, "isDirty"))
    {
      -[_AFDeleteSiriHistoryContextMutation getSuccessTitle](v7, "getSuccessTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      successTitle = v6->_successTitle;
      v6->_successTitle = (NSString *)v9;

      -[_AFDeleteSiriHistoryContextMutation getSuccessBody](v7, "getSuccessBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      successBody = v6->_successBody;
      v6->_successBody = (NSString *)v12;

      -[_AFDeleteSiriHistoryContextMutation getSuccessButtonText](v7, "getSuccessButtonText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      successButtonText = v6->_successButtonText;
      v6->_successButtonText = (NSString *)v15;

      -[_AFDeleteSiriHistoryContextMutation getErrorTitle](v7, "getErrorTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      errorTitle = v6->_errorTitle;
      v6->_errorTitle = (NSString *)v18;

      -[_AFDeleteSiriHistoryContextMutation getErrorBody](v7, "getErrorBody");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      errorBody = v6->_errorBody;
      v6->_errorBody = (NSString *)v21;

      -[_AFDeleteSiriHistoryContextMutation getErrorButtonText](v7, "getErrorButtonText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      errorButtonText = v6->_errorButtonText;
      v6->_errorButtonText = (NSString *)v24;

    }
  }

  return v6;
}

- (AFDeleteSiriHistoryContext)init
{
  return -[AFDeleteSiriHistoryContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFDeleteSiriHistoryContext)initWithSuccessTitle:(id)a3 successBody:(id)a4 successButtonText:(id)a5 errorTitle:(id)a6 errorBody:(id)a7 errorButtonText:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  AFDeleteSiriHistoryContext *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __118__AFDeleteSiriHistoryContext_initWithSuccessTitle_successBody_successButtonText_errorTitle_errorBody_errorButtonText___block_invoke;
  v28[3] = &unk_1E3A2E538;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v20 = v19;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = -[AFDeleteSiriHistoryContext initWithBuilder:](self, "initWithBuilder:", v28);

  return v26;
}

- (id)description
{
  return -[AFDeleteSiriHistoryContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFDeleteSiriHistoryContext;
  -[AFDeleteSiriHistoryContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {successTitle = %@, successBody = %@, successButtonText = %@, errorTitle = %@, errorBody = %@, errorButtonText = %@}"), v5, self->_successTitle, self->_successBody, self->_successButtonText, self->_errorTitle, self->_errorBody, self->_errorButtonText);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_successTitle, "hash");
  v4 = -[NSString hash](self->_successBody, "hash") ^ v3;
  v5 = -[NSString hash](self->_successButtonText, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_errorTitle, "hash");
  v7 = -[NSString hash](self->_errorBody, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_errorButtonText, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFDeleteSiriHistoryContext *v4;
  AFDeleteSiriHistoryContext *v5;
  NSString *v6;
  NSString *successTitle;
  NSString *v8;
  NSString *successBody;
  NSString *v10;
  NSString *successButtonText;
  NSString *v12;
  NSString *errorTitle;
  NSString *v14;
  NSString *errorBody;
  NSString *v16;
  NSString *errorButtonText;
  BOOL v18;

  v4 = (AFDeleteSiriHistoryContext *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFDeleteSiriHistoryContext successTitle](v5, "successTitle");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      successTitle = self->_successTitle;
      if (successTitle == v6 || -[NSString isEqual:](successTitle, "isEqual:", v6))
      {
        -[AFDeleteSiriHistoryContext successBody](v5, "successBody");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        successBody = self->_successBody;
        if (successBody == v8 || -[NSString isEqual:](successBody, "isEqual:", v8))
        {
          -[AFDeleteSiriHistoryContext successButtonText](v5, "successButtonText");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          successButtonText = self->_successButtonText;
          if (successButtonText == v10 || -[NSString isEqual:](successButtonText, "isEqual:", v10))
          {
            -[AFDeleteSiriHistoryContext errorTitle](v5, "errorTitle");
            v12 = (NSString *)objc_claimAutoreleasedReturnValue();
            errorTitle = self->_errorTitle;
            if (errorTitle == v12 || -[NSString isEqual:](errorTitle, "isEqual:", v12))
            {
              -[AFDeleteSiriHistoryContext errorBody](v5, "errorBody");
              v14 = (NSString *)objc_claimAutoreleasedReturnValue();
              errorBody = self->_errorBody;
              if (errorBody == v14 || -[NSString isEqual:](errorBody, "isEqual:", v14))
              {
                -[AFDeleteSiriHistoryContext errorButtonText](v5, "errorButtonText");
                v16 = (NSString *)objc_claimAutoreleasedReturnValue();
                errorButtonText = self->_errorButtonText;
                v18 = errorButtonText == v16 || -[NSString isEqual:](errorButtonText, "isEqual:", v16);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (AFDeleteSiriHistoryContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AFDeleteSiriHistoryContext *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::successTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::successBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::successButtonText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::errorTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::errorBody"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeleteSiriHistoryContext::errorButtonText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AFDeleteSiriHistoryContext initWithSuccessTitle:successBody:successButtonText:errorTitle:errorBody:errorButtonText:](self, "initWithSuccessTitle:successBody:successButtonText:errorTitle:errorBody:errorButtonText:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *successTitle;
  id v5;

  successTitle = self->_successTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", successTitle, CFSTR("AFDeleteSiriHistoryContext::successTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_successBody, CFSTR("AFDeleteSiriHistoryContext::successBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_successButtonText, CFSTR("AFDeleteSiriHistoryContext::successButtonText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorTitle, CFSTR("AFDeleteSiriHistoryContext::errorTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorBody, CFSTR("AFDeleteSiriHistoryContext::errorBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorButtonText, CFSTR("AFDeleteSiriHistoryContext::errorButtonText"));

}

- (NSString)successTitle
{
  return self->_successTitle;
}

- (NSString)successBody
{
  return self->_successBody;
}

- (NSString)successButtonText
{
  return self->_successButtonText;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)errorBody
{
  return self->_errorBody;
}

- (NSString)errorButtonText
{
  return self->_errorButtonText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorButtonText, 0);
  objc_storeStrong((id *)&self->_errorBody, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_successButtonText, 0);
  objc_storeStrong((id *)&self->_successBody, 0);
  objc_storeStrong((id *)&self->_successTitle, 0);
}

void __118__AFDeleteSiriHistoryContext_initWithSuccessTitle_successBody_successButtonText_errorTitle_errorBody_errorButtonText___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setSuccessTitle:", v3);
  objc_msgSend(v4, "setSuccessBody:", a1[5]);
  objc_msgSend(v4, "setSuccessButtonText:", a1[6]);
  objc_msgSend(v4, "setErrorTitle:", a1[7]);
  objc_msgSend(v4, "setErrorBody:", a1[8]);
  objc_msgSend(v4, "setErrorButtonText:", a1[9]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFDeleteSiriHistoryContextMutation *);
  _AFDeleteSiriHistoryContextMutation *v5;
  AFDeleteSiriHistoryContext *v6;
  void *v7;
  uint64_t v8;
  NSString *successTitle;
  void *v10;
  uint64_t v11;
  NSString *successBody;
  void *v13;
  uint64_t v14;
  NSString *successButtonText;
  void *v16;
  uint64_t v17;
  NSString *errorTitle;
  void *v19;
  uint64_t v20;
  NSString *errorBody;
  void *v22;
  uint64_t v23;
  NSString *errorButtonText;

  v4 = (void (**)(id, _AFDeleteSiriHistoryContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFDeleteSiriHistoryContextMutation initWithBase:]([_AFDeleteSiriHistoryContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFDeleteSiriHistoryContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFDeleteSiriHistoryContext);
      -[_AFDeleteSiriHistoryContextMutation getSuccessTitle](v5, "getSuccessTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      successTitle = v6->_successTitle;
      v6->_successTitle = (NSString *)v8;

      -[_AFDeleteSiriHistoryContextMutation getSuccessBody](v5, "getSuccessBody");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      successBody = v6->_successBody;
      v6->_successBody = (NSString *)v11;

      -[_AFDeleteSiriHistoryContextMutation getSuccessButtonText](v5, "getSuccessButtonText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      successButtonText = v6->_successButtonText;
      v6->_successButtonText = (NSString *)v14;

      -[_AFDeleteSiriHistoryContextMutation getErrorTitle](v5, "getErrorTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      errorTitle = v6->_errorTitle;
      v6->_errorTitle = (NSString *)v17;

      -[_AFDeleteSiriHistoryContextMutation getErrorBody](v5, "getErrorBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      errorBody = v6->_errorBody;
      v6->_errorBody = (NSString *)v20;

      -[_AFDeleteSiriHistoryContextMutation getErrorButtonText](v5, "getErrorButtonText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      errorButtonText = v6->_errorButtonText;
      v6->_errorButtonText = (NSString *)v23;

    }
    else
    {
      v6 = (AFDeleteSiriHistoryContext *)-[AFDeleteSiriHistoryContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFDeleteSiriHistoryContext *)-[AFDeleteSiriHistoryContext copy](self, "copy");
  }

  return v6;
}

@end
