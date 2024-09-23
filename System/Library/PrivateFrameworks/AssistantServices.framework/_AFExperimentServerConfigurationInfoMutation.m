@implementation _AFExperimentServerConfigurationInfoMutation

- (_AFExperimentServerConfigurationInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentServerConfigurationInfoMutation *v6;
  _AFExperimentServerConfigurationInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentServerConfigurationInfoMutation;
  v6 = -[_AFExperimentServerConfigurationInfoMutation init](&v9, sel_init);
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
    -[AFExperimentServerConfigurationInfo configurationIdentifier](self->_base, "configurationIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_configurationIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getConfigurationURL
{
  NSURL *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_configurationURL;
  }
  else
  {
    -[AFExperimentServerConfigurationInfo configurationURL](self->_base, "configurationURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfigurationURL:(id)a3
{
  objc_storeStrong((id *)&self->_configurationURL, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (double)getMaxTimeToSync
{
  double result;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_maxTimeToSync;
  -[AFExperimentServerConfigurationInfo maxTimeToSync](self->_base, "maxTimeToSync");
  return result;
}

- (void)setMaxTimeToSync:(double)a3
{
  self->_maxTimeToSync = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
