@implementation AFExperimentServerConfigurationInfo

- (AFExperimentServerConfigurationInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentServerConfigurationInfoMutation *);
  AFExperimentServerConfigurationInfo *v5;
  AFExperimentServerConfigurationInfo *v6;
  _AFExperimentServerConfigurationInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *configurationIdentifier;
  void *v11;
  uint64_t v12;
  NSURL *configurationURL;
  double v14;
  objc_super v16;

  v4 = (void (**)(id, _AFExperimentServerConfigurationInfoMutation *))a3;
  v16.receiver = self;
  v16.super_class = (Class)AFExperimentServerConfigurationInfo;
  v5 = -[AFExperimentServerConfigurationInfo init](&v16, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentServerConfigurationInfoMutation initWithBase:]([_AFExperimentServerConfigurationInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentServerConfigurationInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFExperimentServerConfigurationInfoMutation getConfigurationIdentifier](v7, "getConfigurationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v9;

      -[_AFExperimentServerConfigurationInfoMutation getConfigurationURL](v7, "getConfigurationURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      configurationURL = v6->_configurationURL;
      v6->_configurationURL = (NSURL *)v12;

      -[_AFExperimentServerConfigurationInfoMutation getMaxTimeToSync](v7, "getMaxTimeToSync");
      v6->_maxTimeToSync = v14;
    }

  }
  return v6;
}

- (AFExperimentServerConfigurationInfo)init
{
  return -[AFExperimentServerConfigurationInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperimentServerConfigurationInfo)initWithConfigurationIdentifier:(id)a3 configurationURL:(id)a4 maxTimeToSync:(double)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AFExperimentServerConfigurationInfo *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__AFExperimentServerConfigurationInfo_initWithConfigurationIdentifier_configurationURL_maxTimeToSync___block_invoke;
  v14[3] = &unk_1E3A33308;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v10 = v9;
  v11 = v8;
  v12 = -[AFExperimentServerConfigurationInfo initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (NSString)description
{
  return (NSString *)-[AFExperimentServerConfigurationInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentServerConfigurationInfo;
  -[AFExperimentServerConfigurationInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {configurationIdentifier = %@, configurationURL = %@, maxTimeToSync = %f}"), v5, self->_configurationIdentifier, self->_configurationURL, *(_QWORD *)&self->_maxTimeToSync);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_configurationIdentifier, "hash");
  v4 = -[NSURL hash](self->_configurationURL, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxTimeToSync);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFExperimentServerConfigurationInfo *v4;
  AFExperimentServerConfigurationInfo *v5;
  double maxTimeToSync;
  double v7;
  BOOL v8;
  NSString *v9;
  NSString *configurationIdentifier;
  NSURL *v11;
  NSURL *configurationURL;

  v4 = (AFExperimentServerConfigurationInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      maxTimeToSync = self->_maxTimeToSync;
      -[AFExperimentServerConfigurationInfo maxTimeToSync](v5, "maxTimeToSync");
      if (maxTimeToSync == v7)
      {
        -[AFExperimentServerConfigurationInfo configurationIdentifier](v5, "configurationIdentifier");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        configurationIdentifier = self->_configurationIdentifier;
        if (configurationIdentifier == v9
          || -[NSString isEqual:](configurationIdentifier, "isEqual:", v9))
        {
          -[AFExperimentServerConfigurationInfo configurationURL](v5, "configurationURL");
          v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
          configurationURL = self->_configurationURL;
          v8 = configurationURL == v11 || -[NSURL isEqual:](configurationURL, "isEqual:", v11);

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (AFExperimentServerConfigurationInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  AFExperimentServerConfigurationInfo *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentServerConfigurationInfo::configurationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentServerConfigurationInfo::configurationURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentServerConfigurationInfo::maxTimeToSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = -[AFExperimentServerConfigurationInfo initWithConfigurationIdentifier:configurationURL:maxTimeToSync:](self, "initWithConfigurationIdentifier:configurationURL:maxTimeToSync:", v5, v6, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *configurationIdentifier;
  id v5;
  id v6;

  configurationIdentifier = self->_configurationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configurationIdentifier, CFSTR("AFExperimentServerConfigurationInfo::configurationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurationURL, CFSTR("AFExperimentServerConfigurationInfo::configurationURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxTimeToSync);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFExperimentServerConfigurationInfo::maxTimeToSync"));

}

- (AFExperimentServerConfigurationInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFExperimentServerConfigurationInfo *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("configurationIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("configurationURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("maxTimeToSync"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    self = -[AFExperimentServerConfigurationInfo initWithConfigurationIdentifier:configurationURL:maxTimeToSync:](self, "initWithConfigurationIdentifier:configurationURL:maxTimeToSync:", v7, v10, v14);
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
  NSString *configurationIdentifier;
  NSURL *configurationURL;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  configurationIdentifier = self->_configurationIdentifier;
  if (configurationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", configurationIdentifier, CFSTR("configurationIdentifier"));
  configurationURL = self->_configurationURL;
  if (configurationURL)
    objc_msgSend(v4, "setObject:forKey:", configurationURL, CFSTR("configurationURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxTimeToSync);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("maxTimeToSync"));

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (double)maxTimeToSync
{
  return self->_maxTimeToSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

void __102__AFExperimentServerConfigurationInfo_initWithConfigurationIdentifier_configurationURL_maxTimeToSync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setConfigurationIdentifier:", v3);
  objc_msgSend(v4, "setConfigurationURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setMaxTimeToSync:", *(double *)(a1 + 48));

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
  void (**v4)(id, _AFExperimentServerConfigurationInfoMutation *);
  _AFExperimentServerConfigurationInfoMutation *v5;
  AFExperimentServerConfigurationInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *configurationIdentifier;
  void *v10;
  uint64_t v11;
  NSURL *configurationURL;
  double v13;

  v4 = (void (**)(id, _AFExperimentServerConfigurationInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentServerConfigurationInfoMutation initWithBase:]([_AFExperimentServerConfigurationInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentServerConfigurationInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperimentServerConfigurationInfo);
      -[_AFExperimentServerConfigurationInfoMutation getConfigurationIdentifier](v5, "getConfigurationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v8;

      -[_AFExperimentServerConfigurationInfoMutation getConfigurationURL](v5, "getConfigurationURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      configurationURL = v6->_configurationURL;
      v6->_configurationURL = (NSURL *)v11;

      -[_AFExperimentServerConfigurationInfoMutation getMaxTimeToSync](v5, "getMaxTimeToSync");
      v6->_maxTimeToSync = v13;
    }
    else
    {
      v6 = (AFExperimentServerConfigurationInfo *)-[AFExperimentServerConfigurationInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperimentServerConfigurationInfo *)-[AFExperimentServerConfigurationInfo copy](self, "copy");
  }

  return v6;
}

@end
