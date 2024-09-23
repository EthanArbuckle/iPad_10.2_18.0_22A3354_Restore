@implementation _AFExperimentContextMutation

- (_AFExperimentContextMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentContextMutation *v6;
  _AFExperimentContextMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentContextMutation;
  v6 = -[_AFExperimentContextMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getExperimentsByConfigurationIdentifier
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_experimentsByConfigurationIdentifier;
  }
  else
  {
    -[AFExperimentContext experimentsByConfigurationIdentifier](self->_base, "experimentsByConfigurationIdentifier");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExperimentsByConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_experimentsByConfigurationIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentsByConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
