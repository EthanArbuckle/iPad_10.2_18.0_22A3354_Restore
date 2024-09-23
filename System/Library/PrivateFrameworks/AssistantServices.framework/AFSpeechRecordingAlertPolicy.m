@implementation AFSpeechRecordingAlertPolicy

- (AFSpeechRecordingAlertPolicy)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechRecordingAlertPolicyMutation *);
  AFSpeechRecordingAlertPolicy *v5;
  AFSpeechRecordingAlertPolicy *v6;
  _AFSpeechRecordingAlertPolicyMutation *v7;
  void *v8;
  uint64_t v9;
  AFSpeechRecordingAlertBehavior *startingAlertBehavior;
  void *v11;
  uint64_t v12;
  AFSpeechRecordingAlertBehavior *stoppedAlertBehavior;
  void *v14;
  uint64_t v15;
  AFSpeechRecordingAlertBehavior *stoppedWithErrorAlertBehavior;
  objc_super v18;

  v4 = (void (**)(id, _AFSpeechRecordingAlertPolicyMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechRecordingAlertPolicy;
  v5 = -[AFSpeechRecordingAlertPolicy init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechRecordingAlertPolicyMutation initWithBase:]([_AFSpeechRecordingAlertPolicyMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechRecordingAlertPolicyMutation isDirty](v7, "isDirty"))
    {
      -[_AFSpeechRecordingAlertPolicyMutation getStartingAlertBehavior](v7, "getStartingAlertBehavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      startingAlertBehavior = v6->_startingAlertBehavior;
      v6->_startingAlertBehavior = (AFSpeechRecordingAlertBehavior *)v9;

      -[_AFSpeechRecordingAlertPolicyMutation getStoppedAlertBehavior](v7, "getStoppedAlertBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      stoppedAlertBehavior = v6->_stoppedAlertBehavior;
      v6->_stoppedAlertBehavior = (AFSpeechRecordingAlertBehavior *)v12;

      -[_AFSpeechRecordingAlertPolicyMutation getStoppedWithErrorAlertBehavior](v7, "getStoppedWithErrorAlertBehavior");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      stoppedWithErrorAlertBehavior = v6->_stoppedWithErrorAlertBehavior;
      v6->_stoppedWithErrorAlertBehavior = (AFSpeechRecordingAlertBehavior *)v15;

    }
  }

  return v6;
}

- (AFSpeechRecordingAlertPolicy)init
{
  return -[AFSpeechRecordingAlertPolicy initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechRecordingAlertPolicy)initWithStartingAlertBehavior:(id)a3 stoppedAlertBehavior:(id)a4 stoppedWithErrorAlertBehavior:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  AFSpeechRecordingAlertPolicy *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__AFSpeechRecordingAlertPolicy_initWithStartingAlertBehavior_stoppedAlertBehavior_stoppedWithErrorAlertBehavior___block_invoke;
  v16[3] = &unk_1E3A303C0;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = -[AFSpeechRecordingAlertPolicy initWithBuilder:](self, "initWithBuilder:", v16);

  return v14;
}

- (id)description
{
  return -[AFSpeechRecordingAlertPolicy _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechRecordingAlertPolicy;
  -[AFSpeechRecordingAlertPolicy description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {startingAlertBehavior = %@, stoppedAlertBehavior = %@, stoppedWithErrorAlertBehavior = %@}"), v5, self->_startingAlertBehavior, self->_stoppedAlertBehavior, self->_stoppedWithErrorAlertBehavior);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[AFSpeechRecordingAlertBehavior hash](self->_startingAlertBehavior, "hash");
  v4 = -[AFSpeechRecordingAlertBehavior hash](self->_stoppedAlertBehavior, "hash") ^ v3;
  return v4 ^ -[AFSpeechRecordingAlertBehavior hash](self->_stoppedWithErrorAlertBehavior, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechRecordingAlertPolicy *v4;
  AFSpeechRecordingAlertPolicy *v5;
  AFSpeechRecordingAlertBehavior *v6;
  AFSpeechRecordingAlertBehavior *startingAlertBehavior;
  AFSpeechRecordingAlertBehavior *v8;
  AFSpeechRecordingAlertBehavior *stoppedAlertBehavior;
  AFSpeechRecordingAlertBehavior *v10;
  AFSpeechRecordingAlertBehavior *stoppedWithErrorAlertBehavior;
  BOOL v12;

  v4 = (AFSpeechRecordingAlertPolicy *)a3;
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
      -[AFSpeechRecordingAlertPolicy startingAlertBehavior](v5, "startingAlertBehavior");
      v6 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
      startingAlertBehavior = self->_startingAlertBehavior;
      if (startingAlertBehavior == v6
        || -[AFSpeechRecordingAlertBehavior isEqual:](startingAlertBehavior, "isEqual:", v6))
      {
        -[AFSpeechRecordingAlertPolicy stoppedAlertBehavior](v5, "stoppedAlertBehavior");
        v8 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
        stoppedAlertBehavior = self->_stoppedAlertBehavior;
        if (stoppedAlertBehavior == v8
          || -[AFSpeechRecordingAlertBehavior isEqual:](stoppedAlertBehavior, "isEqual:", v8))
        {
          -[AFSpeechRecordingAlertPolicy stoppedWithErrorAlertBehavior](v5, "stoppedWithErrorAlertBehavior");
          v10 = (AFSpeechRecordingAlertBehavior *)objc_claimAutoreleasedReturnValue();
          stoppedWithErrorAlertBehavior = self->_stoppedWithErrorAlertBehavior;
          v12 = stoppedWithErrorAlertBehavior == v10
             || -[AFSpeechRecordingAlertBehavior isEqual:](stoppedWithErrorAlertBehavior, "isEqual:", v10);

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

- (AFSpeechRecordingAlertPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AFSpeechRecordingAlertPolicy *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechRecordingAlertPolicy::startingAlertBehavior"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechRecordingAlertPolicy::stoppedAlertBehavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechRecordingAlertPolicy::stoppedWithErrorAlertBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSpeechRecordingAlertPolicy initWithStartingAlertBehavior:stoppedAlertBehavior:stoppedWithErrorAlertBehavior:](self, "initWithStartingAlertBehavior:stoppedAlertBehavior:stoppedWithErrorAlertBehavior:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  AFSpeechRecordingAlertBehavior *startingAlertBehavior;
  id v5;

  startingAlertBehavior = self->_startingAlertBehavior;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startingAlertBehavior, CFSTR("AFSpeechRecordingAlertPolicy::startingAlertBehavior"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stoppedAlertBehavior, CFSTR("AFSpeechRecordingAlertPolicy::stoppedAlertBehavior"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stoppedWithErrorAlertBehavior, CFSTR("AFSpeechRecordingAlertPolicy::stoppedWithErrorAlertBehavior"));

}

- (AFSpeechRecordingAlertBehavior)startingAlertBehavior
{
  return self->_startingAlertBehavior;
}

- (AFSpeechRecordingAlertBehavior)stoppedAlertBehavior
{
  return self->_stoppedAlertBehavior;
}

- (AFSpeechRecordingAlertBehavior)stoppedWithErrorAlertBehavior
{
  return self->_stoppedWithErrorAlertBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppedWithErrorAlertBehavior, 0);
  objc_storeStrong((id *)&self->_stoppedAlertBehavior, 0);
  objc_storeStrong((id *)&self->_startingAlertBehavior, 0);
}

void __113__AFSpeechRecordingAlertPolicy_initWithStartingAlertBehavior_stoppedAlertBehavior_stoppedWithErrorAlertBehavior___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setStartingAlertBehavior:", v3);
  objc_msgSend(v4, "setStoppedAlertBehavior:", a1[5]);
  objc_msgSend(v4, "setStoppedWithErrorAlertBehavior:", a1[6]);

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
  void (**v4)(id, _AFSpeechRecordingAlertPolicyMutation *);
  _AFSpeechRecordingAlertPolicyMutation *v5;
  AFSpeechRecordingAlertPolicy *v6;
  void *v7;
  uint64_t v8;
  AFSpeechRecordingAlertBehavior *startingAlertBehavior;
  void *v10;
  uint64_t v11;
  AFSpeechRecordingAlertBehavior *stoppedAlertBehavior;
  void *v13;
  uint64_t v14;
  AFSpeechRecordingAlertBehavior *stoppedWithErrorAlertBehavior;

  v4 = (void (**)(id, _AFSpeechRecordingAlertPolicyMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechRecordingAlertPolicyMutation initWithBase:]([_AFSpeechRecordingAlertPolicyMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechRecordingAlertPolicyMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechRecordingAlertPolicy);
      -[_AFSpeechRecordingAlertPolicyMutation getStartingAlertBehavior](v5, "getStartingAlertBehavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      startingAlertBehavior = v6->_startingAlertBehavior;
      v6->_startingAlertBehavior = (AFSpeechRecordingAlertBehavior *)v8;

      -[_AFSpeechRecordingAlertPolicyMutation getStoppedAlertBehavior](v5, "getStoppedAlertBehavior");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      stoppedAlertBehavior = v6->_stoppedAlertBehavior;
      v6->_stoppedAlertBehavior = (AFSpeechRecordingAlertBehavior *)v11;

      -[_AFSpeechRecordingAlertPolicyMutation getStoppedWithErrorAlertBehavior](v5, "getStoppedWithErrorAlertBehavior");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      stoppedWithErrorAlertBehavior = v6->_stoppedWithErrorAlertBehavior;
      v6->_stoppedWithErrorAlertBehavior = (AFSpeechRecordingAlertBehavior *)v14;

    }
    else
    {
      v6 = (AFSpeechRecordingAlertPolicy *)-[AFSpeechRecordingAlertPolicy copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechRecordingAlertPolicy *)-[AFSpeechRecordingAlertPolicy copy](self, "copy");
  }

  return v6;
}

@end
