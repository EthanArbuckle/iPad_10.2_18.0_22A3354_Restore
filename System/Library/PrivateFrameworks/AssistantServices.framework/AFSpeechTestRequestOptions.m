@implementation AFSpeechTestRequestOptions

- (AFSpeechTestRequestOptions)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechTestRequestOptionsMutation *);
  AFSpeechTestRequestOptions *v5;
  AFSpeechTestRequestOptions *v6;
  _AFSpeechTestRequestOptionsMutation *v7;
  void *v8;
  uint64_t v9;
  NSArray *jitContext;
  void *v11;
  uint64_t v12;
  NSString *overrideModelPath;
  objc_super v15;

  v4 = (void (**)(id, _AFSpeechTestRequestOptionsMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSpeechTestRequestOptions;
  v5 = -[AFSpeechTestRequestOptions init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechTestRequestOptionsMutation initWithBase:]([_AFSpeechTestRequestOptionsMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechTestRequestOptionsMutation isDirty](v7, "isDirty"))
    {
      -[_AFSpeechTestRequestOptionsMutation getJitContext](v7, "getJitContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      jitContext = v6->_jitContext;
      v6->_jitContext = (NSArray *)v9;

      -[_AFSpeechTestRequestOptionsMutation getOverrideModelPath](v7, "getOverrideModelPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      overrideModelPath = v6->_overrideModelPath;
      v6->_overrideModelPath = (NSString *)v12;

    }
  }

  return v6;
}

- (AFSpeechTestRequestOptions)init
{
  return -[AFSpeechTestRequestOptions initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechTestRequestOptions)initWithJitContext:(id)a3 overrideModelPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFSpeechTestRequestOptions *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__AFSpeechTestRequestOptions_initWithJitContext_overrideModelPath___block_invoke;
  v12[3] = &unk_1E3A2E2E8;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFSpeechTestRequestOptions initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFSpeechTestRequestOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechTestRequestOptions;
  -[AFSpeechTestRequestOptions description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {jitContext = %@, overrideModelPath = %@}"), v5, self->_jitContext, self->_overrideModelPath);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_jitContext, "hash");
  return -[NSString hash](self->_overrideModelPath, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechTestRequestOptions *v4;
  AFSpeechTestRequestOptions *v5;
  NSArray *v6;
  NSArray *jitContext;
  NSString *v8;
  NSString *overrideModelPath;
  BOOL v10;

  v4 = (AFSpeechTestRequestOptions *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFSpeechTestRequestOptions jitContext](v5, "jitContext");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      jitContext = self->_jitContext;
      if (jitContext == v6 || -[NSArray isEqual:](jitContext, "isEqual:", v6))
      {
        -[AFSpeechTestRequestOptions overrideModelPath](v5, "overrideModelPath");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        overrideModelPath = self->_overrideModelPath;
        v10 = overrideModelPath == v8 || -[NSString isEqual:](overrideModelPath, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFSpeechTestRequestOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  AFSpeechTestRequestOptions *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("AFSpeechTestRequestOptions::jitContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechTestRequestOptions::overrideModelPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFSpeechTestRequestOptions initWithJitContext:overrideModelPath:](self, "initWithJitContext:overrideModelPath:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *jitContext;
  id v5;

  jitContext = self->_jitContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", jitContext, CFSTR("AFSpeechTestRequestOptions::jitContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideModelPath, CFSTR("AFSpeechTestRequestOptions::overrideModelPath"));

}

- (NSArray)jitContext
{
  return self->_jitContext;
}

- (NSString)overrideModelPath
{
  return self->_overrideModelPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitContext, 0);
}

void __67__AFSpeechTestRequestOptions_initWithJitContext_overrideModelPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setJitContext:", v3);
  objc_msgSend(v4, "setOverrideModelPath:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFSpeechTestRequestOptionsMutation *);
  _AFSpeechTestRequestOptionsMutation *v5;
  AFSpeechTestRequestOptions *v6;
  void *v7;
  uint64_t v8;
  NSArray *jitContext;
  void *v10;
  uint64_t v11;
  NSString *overrideModelPath;

  v4 = (void (**)(id, _AFSpeechTestRequestOptionsMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechTestRequestOptionsMutation initWithBase:]([_AFSpeechTestRequestOptionsMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechTestRequestOptionsMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechTestRequestOptions);
      -[_AFSpeechTestRequestOptionsMutation getJitContext](v5, "getJitContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      jitContext = v6->_jitContext;
      v6->_jitContext = (NSArray *)v8;

      -[_AFSpeechTestRequestOptionsMutation getOverrideModelPath](v5, "getOverrideModelPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      overrideModelPath = v6->_overrideModelPath;
      v6->_overrideModelPath = (NSString *)v11;

    }
    else
    {
      v6 = (AFSpeechTestRequestOptions *)-[AFSpeechTestRequestOptions copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechTestRequestOptions *)-[AFSpeechTestRequestOptions copy](self, "copy");
  }

  return v6;
}

@end
