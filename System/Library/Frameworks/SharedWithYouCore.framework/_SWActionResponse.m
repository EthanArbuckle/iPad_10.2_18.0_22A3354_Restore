@implementation _SWActionResponse

+ (id)responseWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSuccess:error:", v4, v6);

  return v7;
}

- (_SWActionResponse)initWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7;
  _SWActionResponse *v8;
  _SWActionResponse *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SWActionResponse;
  v8 = -[_SWActionResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (_SWActionResponse)initWithDestinationResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t IsYes;
  void *v7;
  void *v8;
  _SWActionResponse *v9;

  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flagForSetting:", 1);
  IsYes = BSSettingFlagIsYes();

  objc_msgSend(v4, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForSetting:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_SWActionResponse initWithSuccess:error:](self, "initWithSuccess:error:", IsYes, v8);
  return v9;
}

+ (id)responseWithDestinationResponse:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 483940);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = NSClassFromString(v5),
        -[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
    && -[objc_class instancesRespondToSelector:](v6, "instancesRespondToSelector:", sel_initWithDestinationResponse_))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithDestinationResponse:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSActionResponseSettings:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v6, 483940);

  objc_msgSend(v4, "setFlag:forSetting:", -[_SWActionResponse success](self, "success"), 1);
  -[_SWActionResponse error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v7, 1);

}

- (BSActionResponse)sourceBSActionResponse
{
  BSActionResponse *sourceBSActionResponse;
  _SWBSActionResponseSettings *v4;
  id v5;
  void *v6;
  BSActionResponse *v7;
  BSActionResponse *v8;

  sourceBSActionResponse = self->_sourceBSActionResponse;
  if (!sourceBSActionResponse)
  {
    v4 = objc_alloc_init(_SWBSActionResponseSettings);
    -[_SWActionResponse encodeWithBSActionResponseSettings:](self, "encodeWithBSActionResponseSettings:", v4);
    v5 = objc_alloc(MEMORY[0x1E0D016A8]);
    -[_SWBSActionResponseSettings bsSettings](v4, "bsSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (BSActionResponse *)objc_msgSend(v5, "initWithInfo:error:", v6, 0);
    v8 = self->_sourceBSActionResponse;
    self->_sourceBSActionResponse = v7;

    sourceBSActionResponse = self->_sourceBSActionResponse;
  }
  return sourceBSActionResponse;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWActionResponse)initWithCoder:(id)a3
{
  id v4;
  _SWActionResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWActionResponse;
  v5 = -[_SWActionResponse init](&v12, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_success);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_error);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[_SWActionResponse success](self, "success");
  NSStringFromSelector(sel_success);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  -[_SWActionResponse error](self, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSuccess:", -[_SWActionResponse success](self, "success"));
  -[_SWActionResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[_SWActionResponse isEqualToActionResponse:](self, "isEqualToActionResponse:", v4);

  return v5;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  void *v3;
  _SWActionResponse *v5;
  _BOOL4 v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (_SWActionResponse *)a3;
  if (v5 == self)
  {
    v7 = 1;
    goto LABEL_12;
  }
  v6 = -[_SWActionResponse success](self, "success");
  if (v6 == -[_SWActionResponse success](v5, "success"))
  {
    -[_SWActionResponse error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (-[_SWActionResponse error](v5, "error"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[_SWActionResponse error](self, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SWActionResponse error](v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v7 = 1;
    }

    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sourceBSActionResponse, 0);
}

@end
