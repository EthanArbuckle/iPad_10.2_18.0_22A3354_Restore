@implementation SWAction

+ (SWAction)actionWithDestinationAction:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 51729);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = NSClassFromString(v5),
        -[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
    && -[objc_class instancesRespondToSelector:](v6, "instancesRespondToSelector:", sel_initWithDestinationAction_))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithDestinationAction:", v3);
  }
  else
  {
    v7 = 0;
  }

  return (SWAction *)v7;
}

- (SWAction)init
{
  SWAction *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SWAction;
  v2 = -[SWAction init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    *(_WORD *)&v2->_complete = 0;
  }
  return v2;
}

- (SWAction)initWithDestinationAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SWAction *v8;
  SWAction *v9;
  SWAction *v10;
  objc_super v12;

  v5 = a3;
  objc_msgSend(v5, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForSetting:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SWAction;
    v8 = -[SWAction init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_destinationBSAction, a3);
      objc_storeStrong((id *)&v9->_uuid, v7);
      *(_WORD *)&v9->_complete = 0;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BSAction)sourceBSAction
{
  BSAction *sourceBSAction;
  _SWBSActionSettings *v4;
  void *v5;
  id v6;
  void *v7;
  BSAction *v8;
  BSAction *v9;
  _QWORD v11[5];

  sourceBSAction = self->_sourceBSAction;
  if (!sourceBSAction)
  {
    v4 = objc_alloc_init(_SWBSActionSettings);
    -[SWAction encodeWithBSActionSettings:](self, "encodeWithBSActionSettings:", v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__SWAction_sourceBSAction__block_invoke;
    v11[3] = &unk_1E217B328;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D01698]);
    -[_SWBSActionSettings bsSettings](v4, "bsSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (BSAction *)objc_msgSend(v6, "initWithInfo:responder:", v7, v5);
    v9 = self->_sourceBSAction;
    self->_sourceBSAction = v8;

    sourceBSAction = self->_sourceBSAction;
  }
  return sourceBSAction;
}

void __26__SWAction_sourceBSAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_SWActionResponse responseWithDestinationResponse:](_SWActionResponse, "responseWithDestinationResponse:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "success");
    v7 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v7, "fulfillWithResponse:", v5);
    else
      objc_msgSend(v7, "failWithResponse:", v5);
  }
  else
  {
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2FE0];
      v14 = *MEMORY[0x1E0CB2938];
      v15[0] = CFSTR("Did not get a valid BSActionResponse back from remote BSAction");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 2, v13);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[_SWActionResponse responseWithSuccess:error:](_SWActionResponse, "responseWithSuccess:error:", 0, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "failWithResponse:", v5);

  }
}

- (void)encodeWithBSActionSettings:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v6, 51729);

  -[SWAction uuid](self, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v7, 1);

}

- (void)fail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (!-[SWAction isComplete](self, "isComplete"))
  {
    -[SWAction setComplete:](self, "setComplete:", 1);
    -[SWAction response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v11[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SWAction was explicitly failed"), &stru_1E217B478, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      v11[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SWAction was explicitly failed"), &stru_1E217B478, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SharedWithYouCore._SWActionResponseErrorDomain"), 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SWActionResponse responseWithSuccess:error:](_SWActionResponse, "responseWithSuccess:error:", 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAction setResponse:](self, "setResponse:", v10);

    }
    -[SWAction _processResponse](self, "_processResponse");
  }
}

- (void)fulfill
{
  void *v3;
  void *v4;

  if (!-[SWAction isComplete](self, "isComplete"))
  {
    -[SWAction setComplete:](self, "setComplete:", 1);
    -[SWAction response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      +[_SWActionResponse responseWithSuccess:error:](_SWActionResponse, "responseWithSuccess:error:", 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAction setResponse:](self, "setResponse:", v4);

    }
    -[SWAction _processResponse](self, "_processResponse");
  }
}

- (void)fulfillWithResponse:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SWAction isComplete](self, "isComplete"))
  {
    -[SWAction setResponse:](self, "setResponse:", v4);
    -[SWAction fulfill](self, "fulfill");
  }

}

- (void)failWithResponse:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SWAction isComplete](self, "isComplete"))
  {
    -[SWAction setResponse:](self, "setResponse:", v4);
    -[SWAction fail](self, "fail");
  }

}

- (void)setResponseHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  id obj;

  obj = a3;
  -[SWAction responseHandler](self, "responseHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_responseHandler, obj);
    v6 = -[SWAction isComplete](self, "isComplete");
    v5 = obj;
    if (v6)
    {
      v7 = -[SWAction hasSentResponse](self, "hasSentResponse");
      v5 = obj;
      if (!v7)
      {
        -[SWAction _processResponse](self, "_processResponse");
        v5 = obj;
      }
    }
  }

}

- (void)setResponseHandlerBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id responseHandlerBlock;
  _BOOL4 v8;
  BOOL v9;
  id v10;

  v10 = a3;
  -[SWAction responseHandlerBlock](self, "responseHandlerBlock");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 != v10)
  {
    v6 = (void *)MEMORY[0x18D77B254](v10);
    responseHandlerBlock = self->_responseHandlerBlock;
    self->_responseHandlerBlock = v6;

    v8 = -[SWAction isComplete](self, "isComplete");
    v5 = v10;
    if (v8)
    {
      v9 = -[SWAction hasSentResponse](self, "hasSentResponse");
      v5 = v10;
      if (!v9)
      {
        -[SWAction _processResponse](self, "_processResponse");
        v5 = v10;
      }
    }
  }

}

- (void)_processResponse
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (!-[SWAction hasSentResponse](self, "hasSentResponse"))
  {
    -[SWAction response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SWAction responseHandler](self, "responseHandler");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        -[SWAction responseHandler](self, "responseHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_opt_respondsToSelector();

        if ((v7 & 1) != 0)
        {
          -[SWAction responseHandler](self, "responseHandler");
          v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[SWAction response](self, "response");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleResponse:forAction:", v9, self);
LABEL_8:

          -[SWAction setHasSentResponse:](self, "setHasSentResponse:", 1);
          return;
        }
      }
      -[SWAction responseHandlerBlock](self, "responseHandlerBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[SWAction responseHandlerBlock](self, "responseHandlerBlock");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[SWAction response](self, "response");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v9);
        goto LABEL_8;
      }
      -[SWAction destinationBSAction](self, "destinationBSAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SWAction response](self, "response");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sourceBSActionResponse");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        -[SWAction destinationBSAction](self, "destinationBSAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sendResponse:", v14);

      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWAction)initWithCoder:(id)a3
{
  id v4;
  SWAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _SWActionResponse *response;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SWAction;
  v5 = -[SWAction init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    NSStringFromSelector(sel_isComplete);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_complete = objc_msgSend(v4, "decodeBoolForKey:", v10);

    v11 = objc_opt_class();
    NSStringFromSelector(sel_response);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (_SWActionResponse *)v13;

    NSStringFromSelector(sel_hasSentResponse);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasSentResponse = objc_msgSend(v4, "decodeBoolForKey:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  -[SWAction uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SWAction isComplete](self, "isComplete");
  NSStringFromSelector(sel_isComplete);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  -[SWAction response](self, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_response);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[SWAction hasSentResponse](self, "hasSentResponse");
  NSStringFromSelector(sel_hasSentResponse);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    -[SWAction uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUuid:", v5);

    objc_msgSend(v4, "setComplete:", -[SWAction isComplete](self, "isComplete"));
    -[SWAction response](self, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResponse:", v6);

    objc_msgSend(v4, "setHasSentResponse:", -[SWAction hasSentResponse](self, "hasSentResponse"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SWAction isEqualToAction:](self, "isEqualToAction:", v4);

  return v5;
}

- (BOOL)isEqualToAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SWAction *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v9 = (SWAction *)a3;
  if (v9 == self)
  {
    LOBYTE(v12) = 1;
    goto LABEL_15;
  }
  -[SWAction uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (-[SWAction uuid](v9, "uuid"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SWAction uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWAction uuid](v9, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqual:", v5))
    {
      LOBYTE(v12) = 0;
LABEL_11:

      goto LABEL_12;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v13 = -[SWAction isComplete](self, "isComplete");
  if (v13 == -[SWAction isComplete](v9, "isComplete"))
  {
    -[SWAction response](self, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (-[SWAction response](v9, "response"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWAction response](self, "response", v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWAction response](v9, "response");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqual:", v7))
      {
        LOBYTE(v12) = 0;
        goto LABEL_24;
      }
      v20 = v3;
      v16 = 1;
    }
    else
    {
      v19 = 0;
      v20 = v3;
      v16 = 0;
    }
    v17 = -[SWAction hasSentResponse](self, "hasSentResponse", v19);
    v12 = v17 ^ -[SWAction hasSentResponse](v9, "hasSentResponse") ^ 1;
    if (!v16)
    {
      v3 = v20;
      if (v15)
      {
LABEL_25:

        if ((v11 & 1) == 0)
          goto LABEL_12;
        goto LABEL_11;
      }
LABEL_28:

      if ((v11 & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
    v3 = v20;
LABEL_24:

    if (v15)
      goto LABEL_25;
    goto LABEL_28;
  }
  LOBYTE(v12) = 0;
  if (v11)
    goto LABEL_11;
LABEL_12:
  if (!v10)

LABEL_15:
  return v12;
}

- (_SWActionResponseHandler)responseHandler
{
  return (_SWActionResponseHandler *)objc_loadWeakRetained((id *)&self->_responseHandler);
}

- (id)responseHandlerBlock
{
  return self->_responseHandlerBlock;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)hasSentResponse
{
  return self->_hasSentResponse;
}

- (void)setHasSentResponse:(BOOL)a3
{
  self->_hasSentResponse = a3;
}

- (_SWActionResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (BSAction)destinationBSAction
{
  return self->_destinationBSAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationBSAction, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_responseHandlerBlock, 0);
  objc_destroyWeak((id *)&self->_responseHandler);
  objc_storeStrong((id *)&self->_sourceBSAction, 0);
}

@end
