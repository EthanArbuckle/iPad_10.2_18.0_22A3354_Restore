@implementation AFRequestHandlingContext

- (AFRequestHandlingContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFRequestHandlingContextMutation *);
  AFRequestHandlingContext *v5;
  AFRequestHandlingContext *v6;
  _AFRequestHandlingContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *requestID;
  void *v11;
  uint64_t v12;
  NSString *inputDeviceID;
  void *v14;
  uint64_t v15;
  NSString *inputAssistantID;
  objc_super v18;

  v4 = (void (**)(id, _AFRequestHandlingContextMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFRequestHandlingContext;
  v5 = -[AFRequestHandlingContext init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFRequestHandlingContextMutation initWithBase:]([_AFRequestHandlingContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFRequestHandlingContextMutation isDirty](v7, "isDirty"))
    {
      -[_AFRequestHandlingContextMutation getRequestID](v7, "getRequestID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v9;

      -[_AFRequestHandlingContextMutation getInputDeviceID](v7, "getInputDeviceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      inputDeviceID = v6->_inputDeviceID;
      v6->_inputDeviceID = (NSString *)v12;

      -[_AFRequestHandlingContextMutation getInputAssistantID](v7, "getInputAssistantID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      inputAssistantID = v6->_inputAssistantID;
      v6->_inputAssistantID = (NSString *)v15;

    }
  }

  return v6;
}

- (AFRequestHandlingContext)init
{
  return -[AFRequestHandlingContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFRequestHandlingContext)initWithRequestID:(id)a3 inputDeviceID:(id)a4 inputAssistantID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AFRequestHandlingContext *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__AFRequestHandlingContext_initWithRequestID_inputDeviceID_inputAssistantID___block_invoke;
  v16[3] = &unk_1E3A31048;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = -[AFRequestHandlingContext initWithBuilder:](self, "initWithBuilder:", v16);

  return v14;
}

- (NSString)description
{
  return (NSString *)-[AFRequestHandlingContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFRequestHandlingContext;
  -[AFRequestHandlingContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {requestID = %@, inputDeviceID = %@, inputAssistantID = %@}"), v5, self->_requestID, self->_inputDeviceID, self->_inputAssistantID);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_requestID, "hash");
  v4 = -[NSString hash](self->_inputDeviceID, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_inputAssistantID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFRequestHandlingContext *v4;
  AFRequestHandlingContext *v5;
  NSString *v6;
  NSString *requestID;
  NSString *v8;
  NSString *inputDeviceID;
  NSString *v10;
  NSString *inputAssistantID;
  BOOL v12;

  v4 = (AFRequestHandlingContext *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFRequestHandlingContext requestID](v5, "requestID");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestID = self->_requestID;
      if (requestID == v6 || -[NSString isEqual:](requestID, "isEqual:", v6))
      {
        -[AFRequestHandlingContext inputDeviceID](v5, "inputDeviceID");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        inputDeviceID = self->_inputDeviceID;
        if (inputDeviceID == v8 || -[NSString isEqual:](inputDeviceID, "isEqual:", v8))
        {
          -[AFRequestHandlingContext inputAssistantID](v5, "inputAssistantID");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          inputAssistantID = self->_inputAssistantID;
          v12 = inputAssistantID == v10 || -[NSString isEqual:](inputAssistantID, "isEqual:", v10);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (AFRequestHandlingContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AFRequestHandlingContext *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFRequestHandlingContext::requestID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFRequestHandlingContext::inputDeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFRequestHandlingContext::inputAssistantID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFRequestHandlingContext initWithRequestID:inputDeviceID:inputAssistantID:](self, "initWithRequestID:inputDeviceID:inputAssistantID:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestID;
  id v5;

  requestID = self->_requestID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestID, CFSTR("AFRequestHandlingContext::requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputDeviceID, CFSTR("AFRequestHandlingContext::inputDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputAssistantID, CFSTR("AFRequestHandlingContext::inputAssistantID"));

}

- (AFRequestHandlingContext)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFRequestHandlingContext *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("requestID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("inputDeviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("inputAssistantID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    self = -[AFRequestHandlingContext initWithRequestID:inputDeviceID:inputAssistantID:](self, "initWithRequestID:inputDeviceID:inputAssistantID:", v7, v10, v12);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *requestID;
  NSString *inputDeviceID;
  NSString *inputAssistantID;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  requestID = self->_requestID;
  if (requestID)
    objc_msgSend(v3, "setObject:forKey:", requestID, CFSTR("requestID"));
  inputDeviceID = self->_inputDeviceID;
  if (inputDeviceID)
    objc_msgSend(v4, "setObject:forKey:", inputDeviceID, CFSTR("inputDeviceID"));
  inputAssistantID = self->_inputAssistantID;
  if (inputAssistantID)
    objc_msgSend(v4, "setObject:forKey:", inputAssistantID, CFSTR("inputAssistantID"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)inputDeviceID
{
  return self->_inputDeviceID;
}

- (NSString)inputAssistantID
{
  return self->_inputAssistantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantID, 0);
  objc_storeStrong((id *)&self->_inputDeviceID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

void __77__AFRequestHandlingContext_initWithRequestID_inputDeviceID_inputAssistantID___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setRequestID:", v3);
  objc_msgSend(v4, "setInputDeviceID:", a1[5]);
  objc_msgSend(v4, "setInputAssistantID:", a1[6]);

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
  void (**v4)(id, _AFRequestHandlingContextMutation *);
  _AFRequestHandlingContextMutation *v5;
  AFRequestHandlingContext *v6;
  void *v7;
  uint64_t v8;
  NSString *requestID;
  void *v10;
  uint64_t v11;
  NSString *inputDeviceID;
  void *v13;
  uint64_t v14;
  NSString *inputAssistantID;

  v4 = (void (**)(id, _AFRequestHandlingContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFRequestHandlingContextMutation initWithBase:]([_AFRequestHandlingContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFRequestHandlingContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFRequestHandlingContext);
      -[_AFRequestHandlingContextMutation getRequestID](v5, "getRequestID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      requestID = v6->_requestID;
      v6->_requestID = (NSString *)v8;

      -[_AFRequestHandlingContextMutation getInputDeviceID](v5, "getInputDeviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      inputDeviceID = v6->_inputDeviceID;
      v6->_inputDeviceID = (NSString *)v11;

      -[_AFRequestHandlingContextMutation getInputAssistantID](v5, "getInputAssistantID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      inputAssistantID = v6->_inputAssistantID;
      v6->_inputAssistantID = (NSString *)v14;

    }
    else
    {
      v6 = (AFRequestHandlingContext *)-[AFRequestHandlingContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFRequestHandlingContext *)-[AFRequestHandlingContext copy](self, "copy");
  }

  return v6;
}

@end
