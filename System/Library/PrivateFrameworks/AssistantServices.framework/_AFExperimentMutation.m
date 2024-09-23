@implementation _AFExperimentMutation

- (_AFExperimentMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentMutation *v6;
  _AFExperimentMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentMutation;
  v6 = -[_AFExperimentMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getConfigurationIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_configurationIdentifier;
  }
  else
  {
    -[AFExperiment configurationIdentifier](self->_base, "configurationIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_configurationIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getConfigurationVersion
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_configurationVersion;
  }
  else
  {
    -[AFExperiment configurationVersion](self->_base, "configurationVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfigurationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configurationVersion, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getDeploymentGroupIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deploymentGroupIdentifier;
  }
  else
  {
    -[AFExperiment deploymentGroupIdentifier](self->_base, "deploymentGroupIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeploymentGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentGroupIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getDeploymentGroupProperties
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_deploymentGroupProperties;
  }
  else
  {
    -[AFExperiment deploymentGroupProperties](self->_base, "deploymentGroupProperties");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeploymentGroupProperties:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentGroupProperties, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getDeploymentReason
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_deploymentReason;
  else
    return -[AFExperiment deploymentReason](self->_base, "deploymentReason");
}

- (void)setDeploymentReason:(int64_t)a3
{
  self->_deploymentReason = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentGroupProperties, 0);
  objc_storeStrong((id *)&self->_deploymentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
