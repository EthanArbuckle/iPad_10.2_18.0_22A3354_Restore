@implementation AFExperimentContext

- (AFExperimentForSiriVOXSounds)experimentForSiriVOXSounds
{
  void *v2;
  void *v3;

  -[AFExperimentContext experimentsByConfigurationIdentifier](self, "experimentsByConfigurationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("siri_vox_sounds_experiment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFExperimentForSiriVOXSounds *)v3;
}

- (AFExperimentContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentContextMutation *);
  AFExperimentContext *v5;
  AFExperimentContext *v6;
  _AFExperimentContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *experimentsByConfigurationIdentifier;
  objc_super v12;

  v4 = (void (**)(id, _AFExperimentContextMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFExperimentContext;
  v5 = -[AFExperimentContext init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentContextMutation initWithBase:]([_AFExperimentContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentContextMutation isDirty](v7, "isDirty"))
    {
      -[_AFExperimentContextMutation getExperimentsByConfigurationIdentifier](v7, "getExperimentsByConfigurationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      experimentsByConfigurationIdentifier = v6->_experimentsByConfigurationIdentifier;
      v6->_experimentsByConfigurationIdentifier = (NSDictionary *)v9;

    }
  }

  return v6;
}

- (AFExperimentContext)init
{
  return -[AFExperimentContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperimentContext)initWithExperimentsByConfigurationIdentifier:(id)a3
{
  id v4;
  id v5;
  AFExperimentContext *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__AFExperimentContext_initWithExperimentsByConfigurationIdentifier___block_invoke;
  v8[3] = &unk_1E3A326A0;
  v9 = v4;
  v5 = v4;
  v6 = -[AFExperimentContext initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

- (id)description
{
  return -[AFExperimentContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentContext;
  -[AFExperimentContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {experimentsByConfigurationIdentifier = %@}"), v5, self->_experimentsByConfigurationIdentifier);

  return v6;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_experimentsByConfigurationIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AFExperimentContext *v4;
  NSDictionary *v5;
  NSDictionary *experimentsByConfigurationIdentifier;
  BOOL v7;

  v4 = (AFExperimentContext *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFExperimentContext experimentsByConfigurationIdentifier](v4, "experimentsByConfigurationIdentifier");
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      experimentsByConfigurationIdentifier = self->_experimentsByConfigurationIdentifier;
      v7 = experimentsByConfigurationIdentifier == v5
        || -[NSDictionary isEqual:](experimentsByConfigurationIdentifier, "isEqual:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFExperimentContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AFExperimentContext *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("AFExperimentContext::experimentsByConfigurationIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFExperimentContext initWithExperimentsByConfigurationIdentifier:](self, "initWithExperimentsByConfigurationIdentifier:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_experimentsByConfigurationIdentifier, CFSTR("AFExperimentContext::experimentsByConfigurationIdentifier"));
}

- (NSDictionary)experimentsByConfigurationIdentifier
{
  return self->_experimentsByConfigurationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentsByConfigurationIdentifier, 0);
}

uint64_t __68__AFExperimentContext_initWithExperimentsByConfigurationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setExperimentsByConfigurationIdentifier:", *(_QWORD *)(a1 + 32));
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
  void (**v4)(id, _AFExperimentContextMutation *);
  _AFExperimentContextMutation *v5;
  AFExperimentContext *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *experimentsByConfigurationIdentifier;

  v4 = (void (**)(id, _AFExperimentContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentContextMutation initWithBase:]([_AFExperimentContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperimentContext);
      -[_AFExperimentContextMutation getExperimentsByConfigurationIdentifier](v5, "getExperimentsByConfigurationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      experimentsByConfigurationIdentifier = v6->_experimentsByConfigurationIdentifier;
      v6->_experimentsByConfigurationIdentifier = (NSDictionary *)v8;

    }
    else
    {
      v6 = (AFExperimentContext *)-[AFExperimentContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperimentContext *)-[AFExperimentContext copy](self, "copy");
  }

  return v6;
}

- (AFExperimentForSiriVOXTapToSiriBehavior)experimentForSiriVOXTapToSiriBehavior
{
  void *v2;
  void *v3;

  -[AFExperimentContext experimentsByConfigurationIdentifier](self, "experimentsByConfigurationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("siri_vox_tap_to_siri_behavior_experiment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFExperimentForSiriVOXTapToSiriBehavior *)v3;
}

- (AFInvocationFeedbackExperiment)invocationFeedbackExperiment
{
  void *v2;
  void *v3;

  -[AFExperimentContext experimentsByConfigurationIdentifier](self, "experimentsByConfigurationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("invocation_feedback_experiment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AFInvocationFeedbackExperiment *)v3;
}

@end
