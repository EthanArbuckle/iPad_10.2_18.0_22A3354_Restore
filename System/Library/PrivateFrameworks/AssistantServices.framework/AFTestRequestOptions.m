@implementation AFTestRequestOptions

- (AFTestRequestOptions)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFTestRequestOptionsMutation *);
  AFTestRequestOptions *v5;
  AFTestRequestOptions *v6;
  _AFTestRequestOptionsMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *inputOrigin;
  void *v11;
  uint64_t v12;
  NSNumber *isEyesFree;
  objc_super v15;

  v4 = (void (**)(id, _AFTestRequestOptionsMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFTestRequestOptions;
  v5 = -[AFTestRequestOptions init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFTestRequestOptionsMutation initWithBase:]([_AFTestRequestOptionsMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFTestRequestOptionsMutation isDirty](v7, "isDirty"))
    {
      v6->_requestPath = -[_AFTestRequestOptionsMutation getRequestPath](v7, "getRequestPath");
      -[_AFTestRequestOptionsMutation getInputOrigin](v7, "getInputOrigin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v9;

      -[_AFTestRequestOptionsMutation getIsEyesFree](v7, "getIsEyesFree");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      isEyesFree = v6->_isEyesFree;
      v6->_isEyesFree = (NSNumber *)v12;

    }
  }

  return v6;
}

- (AFTestRequestOptions)init
{
  return -[AFTestRequestOptions initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFTestRequestOptions)initWithRequestPath:(int64_t)a3 inputOrigin:(id)a4 isEyesFree:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AFTestRequestOptions *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__AFTestRequestOptions_initWithRequestPath_inputOrigin_isEyesFree___block_invoke;
  v14[3] = &unk_1E3A2CDD8;
  v16 = v9;
  v17 = a3;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  v12 = -[AFTestRequestOptions initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (id)description
{
  return -[AFTestRequestOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t requestPath;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFTestRequestOptions;
  -[AFTestRequestOptions description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  requestPath = self->_requestPath;
  if (requestPath > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2E438[requestPath];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {requestPath = %@, inputOrigin = %@, isEyesFree = %@}"), v5, v8, self->_inputOrigin, self->_isEyesFree);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_inputOrigin, "hash");
  v6 = v5 ^ -[NSNumber hash](self->_isEyesFree, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFTestRequestOptions *v4;
  AFTestRequestOptions *v5;
  int64_t requestPath;
  NSString *v7;
  NSString *inputOrigin;
  NSNumber *v9;
  NSNumber *isEyesFree;
  BOOL v11;

  v4 = (AFTestRequestOptions *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      requestPath = self->_requestPath;
      if (requestPath == -[AFTestRequestOptions requestPath](v5, "requestPath"))
      {
        -[AFTestRequestOptions inputOrigin](v5, "inputOrigin");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        inputOrigin = self->_inputOrigin;
        if (inputOrigin == v7 || -[NSString isEqual:](inputOrigin, "isEqual:", v7))
        {
          -[AFTestRequestOptions isEyesFree](v5, "isEyesFree");
          v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          isEyesFree = self->_isEyesFree;
          v11 = isEyesFree == v9 || -[NSNumber isEqual:](isEyesFree, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (AFTestRequestOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AFTestRequestOptions *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFTestRequestOptions::requestPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFTestRequestOptions::inputOrigin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFTestRequestOptions::isEyesFree"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFTestRequestOptions initWithRequestPath:inputOrigin:isEyesFree:](self, "initWithRequestPath:inputOrigin:isEyesFree:", v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t requestPath;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  requestPath = self->_requestPath;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", requestPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFTestRequestOptions::requestPath"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_inputOrigin, CFSTR("AFTestRequestOptions::inputOrigin"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_isEyesFree, CFSTR("AFTestRequestOptions::isEyesFree"));

}

- (int64_t)requestPath
{
  return self->_requestPath;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSNumber)isEyesFree
{
  return self->_isEyesFree;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
}

void __67__AFTestRequestOptions_initWithRequestPath_inputOrigin_isEyesFree___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setRequestPath:", v3);
  objc_msgSend(v4, "setInputOrigin:", a1[4]);
  objc_msgSend(v4, "setIsEyesFree:", a1[5]);

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
  void (**v4)(id, _AFTestRequestOptionsMutation *);
  _AFTestRequestOptionsMutation *v5;
  AFTestRequestOptions *v6;
  void *v7;
  uint64_t v8;
  NSString *inputOrigin;
  void *v10;
  uint64_t v11;
  NSNumber *isEyesFree;

  v4 = (void (**)(id, _AFTestRequestOptionsMutation *))a3;
  if (v4)
  {
    v5 = -[_AFTestRequestOptionsMutation initWithBase:]([_AFTestRequestOptionsMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFTestRequestOptionsMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFTestRequestOptions);
      v6->_requestPath = -[_AFTestRequestOptionsMutation getRequestPath](v5, "getRequestPath");
      -[_AFTestRequestOptionsMutation getInputOrigin](v5, "getInputOrigin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v8;

      -[_AFTestRequestOptionsMutation getIsEyesFree](v5, "getIsEyesFree");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      isEyesFree = v6->_isEyesFree;
      v6->_isEyesFree = (NSNumber *)v11;

    }
    else
    {
      v6 = (AFTestRequestOptions *)-[AFTestRequestOptions copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFTestRequestOptions *)-[AFTestRequestOptions copy](self, "copy");
  }

  return v6;
}

@end
