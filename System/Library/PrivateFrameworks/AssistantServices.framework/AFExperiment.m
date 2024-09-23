@implementation AFExperiment

- (BOOL)playsTwoShotSoundForSiriVOXSounds
{
  void *v2;
  void *v3;
  char v4;

  -[AFExperiment deploymentGroupProperties](self, "deploymentGroupProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("playsTwoShotSound"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)playsSessionInactiveSoundForSiriVOXSounds
{
  void *v2;
  void *v3;
  char v4;

  -[AFExperiment deploymentGroupProperties](self, "deploymentGroupProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("playsSessionInactiveSound"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)logExperimentExposureForSiriVOXSounds
{
  void *v3;
  id v4;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextCreateWithExperiment(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 3401, v3);

}

- (AFExperiment)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentMutation *);
  AFExperiment *v5;
  AFExperiment *v6;
  _AFExperimentMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *configurationIdentifier;
  void *v11;
  uint64_t v12;
  NSString *configurationVersion;
  void *v14;
  uint64_t v15;
  NSString *deploymentGroupIdentifier;
  void *v17;
  uint64_t v18;
  NSDictionary *deploymentGroupProperties;
  objc_super v21;

  v4 = (void (**)(id, _AFExperimentMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFExperiment;
  v5 = -[AFExperiment init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentMutation initWithBase:]([_AFExperimentMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentMutation isDirty](v7, "isDirty"))
    {
      -[_AFExperimentMutation getConfigurationIdentifier](v7, "getConfigurationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v9;

      -[_AFExperimentMutation getConfigurationVersion](v7, "getConfigurationVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      configurationVersion = v6->_configurationVersion;
      v6->_configurationVersion = (NSString *)v12;

      -[_AFExperimentMutation getDeploymentGroupIdentifier](v7, "getDeploymentGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      deploymentGroupIdentifier = v6->_deploymentGroupIdentifier;
      v6->_deploymentGroupIdentifier = (NSString *)v15;

      -[_AFExperimentMutation getDeploymentGroupProperties](v7, "getDeploymentGroupProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      deploymentGroupProperties = v6->_deploymentGroupProperties;
      v6->_deploymentGroupProperties = (NSDictionary *)v18;

      v6->_deploymentReason = -[_AFExperimentMutation getDeploymentReason](v7, "getDeploymentReason");
    }

  }
  return v6;
}

- (AFExperiment)init
{
  return -[AFExperiment initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperiment)initWithConfigurationIdentifier:(id)a3 configurationVersion:(id)a4 deploymentGroupIdentifier:(id)a5 deploymentGroupProperties:(id)a6 deploymentReason:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AFExperiment *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __138__AFExperiment_initWithConfigurationIdentifier_configurationVersion_deploymentGroupIdentifier_deploymentGroupProperties_deploymentReason___block_invoke;
  v22[3] = &unk_1E3A30410;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a7;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = -[AFExperiment initWithBuilder:](self, "initWithBuilder:", v22);

  return v20;
}

- (NSString)description
{
  return (NSString *)-[AFExperiment _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  NSString *configurationIdentifier;
  NSString *configurationVersion;
  NSString *deploymentGroupIdentifier;
  NSDictionary *deploymentGroupProperties;
  unint64_t deploymentReason;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15.receiver = self;
  v15.super_class = (Class)AFExperiment;
  -[AFExperiment description](&v15, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  configurationIdentifier = self->_configurationIdentifier;
  configurationVersion = self->_configurationVersion;
  deploymentGroupIdentifier = self->_deploymentGroupIdentifier;
  deploymentGroupProperties = self->_deploymentGroupProperties;
  deploymentReason = self->_deploymentReason;
  if (deploymentReason > 2)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E3A32B90[deploymentReason];
  v12 = v11;
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {configurationIdentifier = %@, configurationVersion = %@, deploymentGroupIdentifier = %@, deploymentGroupProperties = %@, deploymentReason = %@}"), v5, configurationIdentifier, configurationVersion, deploymentGroupIdentifier, deploymentGroupProperties, v12);

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_configurationIdentifier, "hash");
  v4 = -[NSString hash](self->_configurationVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_deploymentGroupIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSDictionary hash](self->_deploymentGroupProperties, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deploymentReason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFExperiment *v4;
  AFExperiment *v5;
  int64_t deploymentReason;
  NSString *v7;
  NSString *configurationIdentifier;
  NSString *v9;
  NSString *configurationVersion;
  NSString *v11;
  NSString *deploymentGroupIdentifier;
  NSDictionary *v13;
  NSDictionary *deploymentGroupProperties;
  BOOL v15;

  v4 = (AFExperiment *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deploymentReason = self->_deploymentReason;
      if (deploymentReason == -[AFExperiment deploymentReason](v5, "deploymentReason"))
      {
        -[AFExperiment configurationIdentifier](v5, "configurationIdentifier");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        configurationIdentifier = self->_configurationIdentifier;
        if (configurationIdentifier == v7
          || -[NSString isEqual:](configurationIdentifier, "isEqual:", v7))
        {
          -[AFExperiment configurationVersion](v5, "configurationVersion");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          configurationVersion = self->_configurationVersion;
          if (configurationVersion == v9 || -[NSString isEqual:](configurationVersion, "isEqual:", v9))
          {
            -[AFExperiment deploymentGroupIdentifier](v5, "deploymentGroupIdentifier");
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            deploymentGroupIdentifier = self->_deploymentGroupIdentifier;
            if (deploymentGroupIdentifier == v11
              || -[NSString isEqual:](deploymentGroupIdentifier, "isEqual:", v11))
            {
              -[AFExperiment deploymentGroupProperties](v5, "deploymentGroupProperties");
              v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              deploymentGroupProperties = self->_deploymentGroupProperties;
              v15 = deploymentGroupProperties == v13
                 || -[NSDictionary isEqual:](deploymentGroupProperties, "isEqual:", v13);

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (AFExperiment)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  AFExperiment *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperiment::configurationIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperiment::configurationVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperiment::deploymentGroupIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = (void *)v4;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("AFExperiment::deploymentGroupProperties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperiment::deploymentReason"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "integerValue");
  v18 = -[AFExperiment initWithConfigurationIdentifier:configurationVersion:deploymentGroupIdentifier:deploymentGroupProperties:deploymentReason:](self, "initWithConfigurationIdentifier:configurationVersion:deploymentGroupIdentifier:deploymentGroupProperties:deploymentReason:", v23, v22, v21, v15, v17);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *configurationIdentifier;
  id v5;
  id v6;

  configurationIdentifier = self->_configurationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configurationIdentifier, CFSTR("AFExperiment::configurationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configurationVersion, CFSTR("AFExperiment::configurationVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deploymentGroupIdentifier, CFSTR("AFExperiment::deploymentGroupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deploymentGroupProperties, CFSTR("AFExperiment::deploymentGroupProperties"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deploymentReason);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFExperiment::deploymentReason"));

}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (NSString)configurationVersion
{
  return self->_configurationVersion;
}

- (NSString)deploymentGroupIdentifier
{
  return self->_deploymentGroupIdentifier;
}

- (NSDictionary)deploymentGroupProperties
{
  return self->_deploymentGroupProperties;
}

- (int64_t)deploymentReason
{
  return self->_deploymentReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentGroupProperties, 0);
  objc_storeStrong((id *)&self->_deploymentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

void __138__AFExperiment_initWithConfigurationIdentifier_configurationVersion_deploymentGroupIdentifier_deploymentGroupProperties_deploymentReason___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setConfigurationIdentifier:", v3);
  objc_msgSend(v4, "setConfigurationVersion:", a1[5]);
  objc_msgSend(v4, "setDeploymentGroupIdentifier:", a1[6]);
  objc_msgSend(v4, "setDeploymentGroupProperties:", a1[7]);
  objc_msgSend(v4, "setDeploymentReason:", a1[8]);

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
  void (**v4)(id, _AFExperimentMutation *);
  _AFExperimentMutation *v5;
  AFExperiment *v6;
  void *v7;
  uint64_t v8;
  NSString *configurationIdentifier;
  void *v10;
  uint64_t v11;
  NSString *configurationVersion;
  void *v13;
  uint64_t v14;
  NSString *deploymentGroupIdentifier;
  void *v16;
  uint64_t v17;
  NSDictionary *deploymentGroupProperties;

  v4 = (void (**)(id, _AFExperimentMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentMutation initWithBase:]([_AFExperimentMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperiment);
      -[_AFExperimentMutation getConfigurationIdentifier](v5, "getConfigurationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v8;

      -[_AFExperimentMutation getConfigurationVersion](v5, "getConfigurationVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      configurationVersion = v6->_configurationVersion;
      v6->_configurationVersion = (NSString *)v11;

      -[_AFExperimentMutation getDeploymentGroupIdentifier](v5, "getDeploymentGroupIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      deploymentGroupIdentifier = v6->_deploymentGroupIdentifier;
      v6->_deploymentGroupIdentifier = (NSString *)v14;

      -[_AFExperimentMutation getDeploymentGroupProperties](v5, "getDeploymentGroupProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      deploymentGroupProperties = v6->_deploymentGroupProperties;
      v6->_deploymentGroupProperties = (NSDictionary *)v17;

      v6->_deploymentReason = -[_AFExperimentMutation getDeploymentReason](v5, "getDeploymentReason");
    }
    else
    {
      v6 = (AFExperiment *)-[AFExperiment copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperiment *)-[AFExperiment copy](self, "copy");
  }

  return v6;
}

- (BOOL)playsSound
{
  void *v2;
  void *v3;
  char v4;

  -[AFExperiment deploymentGroupProperties](self, "deploymentGroupProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("playsSound"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)logExperimentExposureForTapToSiriBehavior
{
  void *v3;
  id v4;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextCreateWithExperiment(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 3402, v3);

}

- (unint64_t)featureGroups
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AFExperiment deploymentGroupProperties](self, "deploymentGroupProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("featureGroups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)logExperimentExposureForInvocationFeedbacks
{
  void *v3;
  id v4;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextCreateWithExperiment(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 3403, v3);

}

- (BOOL)isFeatureGroupOneEnabled
{
  return -[AFExperiment featureGroups](self, "featureGroups") & 1;
}

- (BOOL)isFeatureGroupTwoEnabled
{
  return (-[AFExperiment featureGroups](self, "featureGroups") >> 1) & 1;
}

- (BOOL)isFeatureGroupThreeEnabled
{
  return (-[AFExperiment featureGroups](self, "featureGroups") >> 2) & 1;
}

- (BOOL)isFeatureGroupFourEnabled
{
  return (-[AFExperiment featureGroups](self, "featureGroups") >> 3) & 1;
}

@end
