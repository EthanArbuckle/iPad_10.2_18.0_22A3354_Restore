@implementation AFSiriActivationResult

- (AFSiriActivationResult)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSiriActivationResultMutation *);
  AFSiriActivationResult *v5;
  AFSiriActivationResult *v6;
  _AFSiriActivationResultMutation *v7;
  void *v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = (void (**)(id, _AFSiriActivationResultMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSiriActivationResult;
  v5 = -[AFSiriActivationResult init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSiriActivationResultMutation initWithBase:]([_AFSiriActivationResultMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSiriActivationResultMutation isDirty](v7, "isDirty"))
    {
      v6->_actionType = -[_AFSiriActivationResultMutation getActionType](v7, "getActionType");
      -[_AFSiriActivationResultMutation getError](v7, "getError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      error = v6->_error;
      v6->_error = (NSError *)v9;

    }
  }

  return v6;
}

- (AFSiriActivationResult)init
{
  return -[AFSiriActivationResult initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSiriActivationResult)initWithActionType:(int64_t)a3 error:(id)a4
{
  id v6;
  id v7;
  AFSiriActivationResult *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__AFSiriActivationResult_initWithActionType_error___block_invoke;
  v10[3] = &unk_1E3A35E68;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = -[AFSiriActivationResult initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (NSString)description
{
  return (NSString *)-[AFSiriActivationResult _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t actionType;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFSiriActivationResult;
  -[AFSiriActivationResult description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  actionType = self->_actionType;
  if (actionType > 6)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2EEE8[actionType];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {actionType = %@, error = %@}"), v5, v8, self->_error);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_actionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSError hash](self->_error, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFSiriActivationResult *v4;
  AFSiriActivationResult *v5;
  int64_t actionType;
  NSError *v7;
  NSError *error;
  BOOL v9;

  v4 = (AFSiriActivationResult *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      actionType = self->_actionType;
      if (actionType == -[AFSiriActivationResult actionType](v5, "actionType"))
      {
        -[AFSiriActivationResult error](v5, "error");
        v7 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        v9 = error == v7 || -[NSError isEqual:](error, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFSiriActivationResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AFSiriActivationResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationResult::actionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationResult::error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSiriActivationResult initWithActionType:error:](self, "initWithActionType:error:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t actionType;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  actionType = self->_actionType;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", actionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFSiriActivationResult::actionType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_error, CFSTR("AFSiriActivationResult::error"));
}

- (AFSiriActivationResult)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  AFSiriActivationResult *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("actionType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = AFSiriActivationActionTypeGetFromName(v5);
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    self = -[AFSiriActivationResult initWithActionType:error:](self, "initWithActionType:error:", v6, v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  unint64_t actionType;
  __CFString *v5;
  __CFString *v6;
  NSError *error;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  actionType = self->_actionType;
  if (actionType > 6)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A2EEE8[actionType];
  v6 = v5;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("actionType"));

  error = self->_error;
  if (error)
    objc_msgSend(v3, "setObject:forKey:", error, CFSTR("error"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

void __51__AFSiriActivationResult_initWithActionType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setActionType:", v3);
  objc_msgSend(v4, "setError:", *(_QWORD *)(a1 + 32));

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
  void (**v4)(id, _AFSiriActivationResultMutation *);
  _AFSiriActivationResultMutation *v5;
  AFSiriActivationResult *v6;
  void *v7;
  uint64_t v8;
  NSError *error;

  v4 = (void (**)(id, _AFSiriActivationResultMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSiriActivationResultMutation initWithBase:]([_AFSiriActivationResultMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSiriActivationResultMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSiriActivationResult);
      v6->_actionType = -[_AFSiriActivationResultMutation getActionType](v5, "getActionType");
      -[_AFSiriActivationResultMutation getError](v5, "getError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      error = v6->_error;
      v6->_error = (NSError *)v8;

    }
    else
    {
      v6 = (AFSiriActivationResult *)-[AFSiriActivationResult copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSiriActivationResult *)-[AFSiriActivationResult copy](self, "copy");
  }

  return v6;
}

@end
