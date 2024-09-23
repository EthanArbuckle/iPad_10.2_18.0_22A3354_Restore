@implementation AFSetAudioSessionActiveContext

- (AFSetAudioSessionActiveContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSetAudioSessionActiveContextMutation *);
  AFSetAudioSessionActiveContext *v5;
  AFSetAudioSessionActiveContext *v6;
  _AFSetAudioSessionActiveContextMutation *v7;
  void *v8;
  uint64_t v9;
  AFSpeechRequestOptions *speechRequestOptions;
  objc_super v12;

  v4 = (void (**)(id, _AFSetAudioSessionActiveContextMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetAudioSessionActiveContext;
  v5 = -[AFSetAudioSessionActiveContext init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSetAudioSessionActiveContextMutation initWithBase:]([_AFSetAudioSessionActiveContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSetAudioSessionActiveContextMutation isDirty](v7, "isDirty"))
    {
      v6->_options = -[_AFSetAudioSessionActiveContextMutation getOptions](v7, "getOptions");
      v6->_reason = -[_AFSetAudioSessionActiveContextMutation getReason](v7, "getReason");
      -[_AFSetAudioSessionActiveContextMutation getSpeechRequestOptions](v7, "getSpeechRequestOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      speechRequestOptions = v6->_speechRequestOptions;
      v6->_speechRequestOptions = (AFSpeechRequestOptions *)v9;

    }
  }

  return v6;
}

- (AFSetAudioSessionActiveContext)init
{
  return -[AFSetAudioSessionActiveContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSetAudioSessionActiveContext)initWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5
{
  id v8;
  id v9;
  AFSetAudioSessionActiveContext *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  int64_t v15;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__AFSetAudioSessionActiveContext_initWithOptions_reason_speechRequestOptions___block_invoke;
  v12[3] = &unk_1E3A2D788;
  v14 = a3;
  v15 = a4;
  v13 = v8;
  v9 = v8;
  v10 = -[AFSetAudioSessionActiveContext initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFSetAudioSessionActiveContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t reason;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFSetAudioSessionActiveContext;
  -[AFSetAudioSessionActiveContext description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AFSetAudioSessionActiveOptionsGetNames(self->_options);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  if (reason > 3)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1E3A32718[reason];
  v10 = v9;
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {options = %@, reason = %@, speechRequestOptions = %@}"), v5, v7, v10, self->_speechRequestOptions);

  return v11;
}

- (id)redactedDescription
{
  id v3;
  unint64_t reason;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  reason = self->_reason;
  if (reason > 3)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A32718[reason];
  v6 = v5;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("reason = %@"), v6);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_options);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[AFSpeechRequestOptions hash](self->_speechRequestOptions, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AFSetAudioSessionActiveContext *v4;
  AFSetAudioSessionActiveContext *v5;
  unint64_t options;
  int64_t reason;
  AFSpeechRequestOptions *v8;
  AFSpeechRequestOptions *speechRequestOptions;
  BOOL v10;

  v4 = (AFSetAudioSessionActiveContext *)a3;
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
      options = self->_options;
      if (options == -[AFSetAudioSessionActiveContext options](v5, "options")
        && (reason = self->_reason, reason == -[AFSetAudioSessionActiveContext reason](v5, "reason")))
      {
        -[AFSetAudioSessionActiveContext speechRequestOptions](v5, "speechRequestOptions");
        v8 = (AFSpeechRequestOptions *)objc_claimAutoreleasedReturnValue();
        speechRequestOptions = self->_speechRequestOptions;
        v10 = speechRequestOptions == v8
           || -[AFSpeechRequestOptions isEqual:](speechRequestOptions, "isEqual:", v8);

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

- (AFSetAudioSessionActiveContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  AFSetAudioSessionActiveContext *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSetAudioSessionActiveContext::options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSetAudioSessionActiveContext::reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSetAudioSessionActiveContext::speechRequestOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFSetAudioSessionActiveContext initWithOptions:reason:speechRequestOptions:](self, "initWithOptions:reason:speechRequestOptions:", v6, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t options;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  options = self->_options;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", options);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("AFSetAudioSessionActiveContext::options"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_reason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("AFSetAudioSessionActiveContext::reason"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_speechRequestOptions, CFSTR("AFSetAudioSessionActiveContext::speechRequestOptions"));
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)reason
{
  return self->_reason;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
}

void __78__AFSetAudioSessionActiveContext_initWithOptions_reason_speechRequestOptions___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[5];
  v4 = a2;
  objc_msgSend(v4, "setOptions:", v3);
  objc_msgSend(v4, "setReason:", a1[6]);
  objc_msgSend(v4, "setSpeechRequestOptions:", a1[4]);

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
  void (**v4)(id, _AFSetAudioSessionActiveContextMutation *);
  _AFSetAudioSessionActiveContextMutation *v5;
  AFSetAudioSessionActiveContext *v6;
  void *v7;
  uint64_t v8;
  AFSpeechRequestOptions *speechRequestOptions;

  v4 = (void (**)(id, _AFSetAudioSessionActiveContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSetAudioSessionActiveContextMutation initWithBase:]([_AFSetAudioSessionActiveContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSetAudioSessionActiveContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSetAudioSessionActiveContext);
      v6->_options = -[_AFSetAudioSessionActiveContextMutation getOptions](v5, "getOptions");
      v6->_reason = -[_AFSetAudioSessionActiveContextMutation getReason](v5, "getReason");
      -[_AFSetAudioSessionActiveContextMutation getSpeechRequestOptions](v5, "getSpeechRequestOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      speechRequestOptions = v6->_speechRequestOptions;
      v6->_speechRequestOptions = (AFSpeechRequestOptions *)v8;

    }
    else
    {
      v6 = (AFSetAudioSessionActiveContext *)-[AFSetAudioSessionActiveContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSetAudioSessionActiveContext *)-[AFSetAudioSessionActiveContext copy](self, "copy");
  }

  return v6;
}

@end
