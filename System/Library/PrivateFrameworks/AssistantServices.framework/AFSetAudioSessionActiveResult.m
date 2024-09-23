@implementation AFSetAudioSessionActiveResult

- (AFSetAudioSessionActiveResult)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSetAudioSessionActiveResultMutation *);
  AFSetAudioSessionActiveResult *v5;
  AFSetAudioSessionActiveResult *v6;
  _AFSetAudioSessionActiveResultMutation *v7;
  void *v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v4 = (void (**)(id, _AFSetAudioSessionActiveResultMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSetAudioSessionActiveResult;
  v5 = -[AFSetAudioSessionActiveResult init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSetAudioSessionActiveResultMutation initWithBase:]([_AFSetAudioSessionActiveResultMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSetAudioSessionActiveResultMutation isDirty](v7, "isDirty"))
    {
      v6->_audioSessionID = -[_AFSetAudioSessionActiveResultMutation getAudioSessionID](v7, "getAudioSessionID");
      -[_AFSetAudioSessionActiveResultMutation getError](v7, "getError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      error = v6->_error;
      v6->_error = (NSError *)v9;

    }
  }

  return v6;
}

- (AFSetAudioSessionActiveResult)init
{
  return -[AFSetAudioSessionActiveResult initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSetAudioSessionActiveResult)initWithAudioSessionID:(unsigned int)a3 error:(id)a4
{
  id v6;
  id v7;
  AFSetAudioSessionActiveResult *v8;
  _QWORD v10[4];
  id v11;
  unsigned int v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AFSetAudioSessionActiveResult_initWithAudioSessionID_error___block_invoke;
  v10[3] = &unk_1E3A36B48;
  v12 = a3;
  v11 = v6;
  v7 = v6;
  v8 = -[AFSetAudioSessionActiveResult initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[AFSetAudioSessionActiveResult _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSetAudioSessionActiveResult;
  -[AFSetAudioSessionActiveResult description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {audioSessionID = %u, error = %@}"), v5, self->_audioSessionID, self->_error);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_audioSessionID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSError hash](self->_error, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFSetAudioSessionActiveResult *v4;
  AFSetAudioSessionActiveResult *v5;
  unsigned int audioSessionID;
  NSError *v7;
  NSError *error;
  BOOL v9;

  v4 = (AFSetAudioSessionActiveResult *)a3;
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
      audioSessionID = self->_audioSessionID;
      if (audioSessionID == -[AFSetAudioSessionActiveResult audioSessionID](v5, "audioSessionID"))
      {
        -[AFSetAudioSessionActiveResult error](v5, "error");
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

- (AFSetAudioSessionActiveResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AFSetAudioSessionActiveResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSetAudioSessionActiveResult::audioSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSetAudioSessionActiveResult::error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSetAudioSessionActiveResult initWithAudioSessionID:error:](self, "initWithAudioSessionID:error:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t audioSessionID;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  audioSessionID = self->_audioSessionID;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", audioSessionID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFSetAudioSessionActiveResult::audioSessionID"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_error, CFSTR("AFSetAudioSessionActiveResult::error"));
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

void __62__AFSetAudioSessionActiveResult_initWithAudioSessionID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setAudioSessionID:", v3);
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
  void (**v4)(id, _AFSetAudioSessionActiveResultMutation *);
  _AFSetAudioSessionActiveResultMutation *v5;
  AFSetAudioSessionActiveResult *v6;
  void *v7;
  uint64_t v8;
  NSError *error;

  v4 = (void (**)(id, _AFSetAudioSessionActiveResultMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSetAudioSessionActiveResultMutation initWithBase:]([_AFSetAudioSessionActiveResultMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSetAudioSessionActiveResultMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSetAudioSessionActiveResult);
      v6->_audioSessionID = -[_AFSetAudioSessionActiveResultMutation getAudioSessionID](v5, "getAudioSessionID");
      -[_AFSetAudioSessionActiveResultMutation getError](v5, "getError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      error = v6->_error;
      v6->_error = (NSError *)v8;

    }
    else
    {
      v6 = (AFSetAudioSessionActiveResult *)-[AFSetAudioSessionActiveResult copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSetAudioSessionActiveResult *)-[AFSetAudioSessionActiveResult copy](self, "copy");
  }

  return v6;
}

@end
