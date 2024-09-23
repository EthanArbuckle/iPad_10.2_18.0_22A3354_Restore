@implementation AFMyriadContext

- (AFMyriadContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFMyriadContextMutation *);
  AFMyriadContext *v5;
  AFMyriadContext *v6;
  _AFMyriadContextMutation *v7;
  void *v8;
  uint64_t v9;
  AFMyriadPerceptualAudioHash *perceptualAudioHash;
  void *v11;
  uint64_t v12;
  AFMyriadGoodnessScoreOverrideState *overrideState;
  objc_super v15;

  v4 = (void (**)(id, _AFMyriadContextMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFMyriadContext;
  v5 = -[AFMyriadContext init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFMyriadContextMutation initWithBase:]([_AFMyriadContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFMyriadContextMutation isDirty](v7, "isDirty"))
    {
      v6->_timestamp = -[_AFMyriadContextMutation getTimestamp](v7, "getTimestamp");
      -[_AFMyriadContextMutation getPerceptualAudioHash](v7, "getPerceptualAudioHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (AFMyriadPerceptualAudioHash *)v9;

      -[_AFMyriadContextMutation getOverrideState](v7, "getOverrideState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      overrideState = v6->_overrideState;
      v6->_overrideState = (AFMyriadGoodnessScoreOverrideState *)v12;

      v6->_activationSource = -[_AFMyriadContextMutation getActivationSource](v7, "getActivationSource");
      v6->_activationExpirationTime = -[_AFMyriadContextMutation getActivationExpirationTime](v7, "getActivationExpirationTime");
    }

  }
  return v6;
}

- (AFMyriadContext)init
{
  return -[AFMyriadContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFMyriadContext)initWithTimestamp:(unint64_t)a3 perceptualAudioHash:(id)a4 overrideState:(id)a5 activationSource:(int64_t)a6 activationExpirationTime:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  AFMyriadContext *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;

  v12 = a4;
  v13 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__AFMyriadContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke;
  v18[3] = &unk_1E3A2DAC0;
  v19 = v12;
  v20 = v13;
  v21 = a3;
  v22 = a6;
  v23 = a7;
  v14 = v13;
  v15 = v12;
  v16 = -[AFMyriadContext initWithBuilder:](self, "initWithBuilder:", v18);

  return v16;
}

- (id)description
{
  return -[AFMyriadContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t timestamp;
  AFMyriadPerceptualAudioHash *perceptualAudioHash;
  unint64_t activationSource;
  AFMyriadGoodnessScoreOverrideState *overrideState;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)AFMyriadContext;
  -[AFMyriadContext description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  perceptualAudioHash = self->_perceptualAudioHash;
  overrideState = self->_overrideState;
  activationSource = self->_activationSource;
  if (activationSource > 0xF)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A2D180[activationSource];
  v11 = v10;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timestamp = %llu, perceptualAudioHash = %@, overrideState = %@, activationSource = %@, activationExpirationTime = %llu}"), v5, timestamp, perceptualAudioHash, overrideState, v11, self->_activationExpirationTime);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[AFMyriadPerceptualAudioHash hash](self->_perceptualAudioHash, "hash");
  v6 = v5 ^ -[AFMyriadGoodnessScoreOverrideState hash](self->_overrideState, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activationSource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activationExpirationTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  AFMyriadContext *v4;
  AFMyriadContext *v5;
  unint64_t timestamp;
  int64_t activationSource;
  unint64_t activationExpirationTime;
  AFMyriadPerceptualAudioHash *v9;
  AFMyriadPerceptualAudioHash *perceptualAudioHash;
  AFMyriadGoodnessScoreOverrideState *v11;
  AFMyriadGoodnessScoreOverrideState *overrideState;
  BOOL v13;

  v4 = (AFMyriadContext *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timestamp = self->_timestamp;
      if (timestamp == -[AFMyriadContext timestamp](v5, "timestamp")
        && (activationSource = self->_activationSource,
            activationSource == -[AFMyriadContext activationSource](v5, "activationSource"))
        && (activationExpirationTime = self->_activationExpirationTime,
            activationExpirationTime == -[AFMyriadContext activationExpirationTime](v5, "activationExpirationTime")))
      {
        -[AFMyriadContext perceptualAudioHash](v5, "perceptualAudioHash");
        v9 = (AFMyriadPerceptualAudioHash *)objc_claimAutoreleasedReturnValue();
        perceptualAudioHash = self->_perceptualAudioHash;
        if (perceptualAudioHash == v9 || -[AFMyriadPerceptualAudioHash isEqual:](perceptualAudioHash, "isEqual:", v9))
        {
          -[AFMyriadContext overrideState](v5, "overrideState");
          v11 = (AFMyriadGoodnessScoreOverrideState *)objc_claimAutoreleasedReturnValue();
          overrideState = self->_overrideState;
          v13 = overrideState == v11 || -[AFMyriadGoodnessScoreOverrideState isEqual:](overrideState, "isEqual:", v11);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AFMyriadContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  AFMyriadContext *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadContext::timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadContext::perceptualAudioHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadContext::overrideState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadContext::activationSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFMyriadContext::activationExpirationTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "unsignedLongLongValue");
  v13 = -[AFMyriadContext initWithTimestamp:perceptualAudioHash:overrideState:activationSource:activationExpirationTime:](self, "initWithTimestamp:perceptualAudioHash:overrideState:activationSource:activationExpirationTime:", v6, v7, v8, v10, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  timestamp = self->_timestamp;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFMyriadContext::timestamp"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_perceptualAudioHash, CFSTR("AFMyriadContext::perceptualAudioHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_overrideState, CFSTR("AFMyriadContext::overrideState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_activationSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFMyriadContext::activationSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_activationExpirationTime);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFMyriadContext::activationExpirationTime"));

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AFMyriadPerceptualAudioHash)perceptualAudioHash
{
  return self->_perceptualAudioHash;
}

- (AFMyriadGoodnessScoreOverrideState)overrideState
{
  return self->_overrideState;
}

- (int64_t)activationSource
{
  return self->_activationSource;
}

- (unint64_t)activationExpirationTime
{
  return self->_activationExpirationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_perceptualAudioHash, 0);
}

void __113__AFMyriadContext_initWithTimestamp_perceptualAudioHash_overrideState_activationSource_activationExpirationTime___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setPerceptualAudioHash:", a1[4]);
  objc_msgSend(v4, "setOverrideState:", a1[5]);
  objc_msgSend(v4, "setActivationSource:", a1[7]);
  objc_msgSend(v4, "setActivationExpirationTime:", a1[8]);

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
  void (**v4)(id, _AFMyriadContextMutation *);
  _AFMyriadContextMutation *v5;
  AFMyriadContext *v6;
  void *v7;
  uint64_t v8;
  AFMyriadPerceptualAudioHash *perceptualAudioHash;
  void *v10;
  uint64_t v11;
  AFMyriadGoodnessScoreOverrideState *overrideState;

  v4 = (void (**)(id, _AFMyriadContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFMyriadContextMutation initWithBase:]([_AFMyriadContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFMyriadContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFMyriadContext);
      v6->_timestamp = -[_AFMyriadContextMutation getTimestamp](v5, "getTimestamp");
      -[_AFMyriadContextMutation getPerceptualAudioHash](v5, "getPerceptualAudioHash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      perceptualAudioHash = v6->_perceptualAudioHash;
      v6->_perceptualAudioHash = (AFMyriadPerceptualAudioHash *)v8;

      -[_AFMyriadContextMutation getOverrideState](v5, "getOverrideState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      overrideState = v6->_overrideState;
      v6->_overrideState = (AFMyriadGoodnessScoreOverrideState *)v11;

      v6->_activationSource = -[_AFMyriadContextMutation getActivationSource](v5, "getActivationSource");
      v6->_activationExpirationTime = -[_AFMyriadContextMutation getActivationExpirationTime](v5, "getActivationExpirationTime");
    }
    else
    {
      v6 = (AFMyriadContext *)-[AFMyriadContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFMyriadContext *)-[AFMyriadContext copy](self, "copy");
  }

  return v6;
}

@end
