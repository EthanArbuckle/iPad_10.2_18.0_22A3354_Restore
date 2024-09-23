@implementation _AFExperimentConfigurationMutation

- (_AFExperimentConfigurationMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentConfigurationMutation *v6;
  _AFExperimentConfigurationMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentConfigurationMutation;
  v6 = -[_AFExperimentConfigurationMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getType
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_type;
  else
    return -[AFExperimentConfiguration type](self->_base, "type");
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    -[AFExperimentConfiguration identifier](self->_base, "identifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getVersion
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_version;
  }
  else
  {
    -[AFExperimentConfiguration version](self->_base, "version");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getControlGroup
{
  AFExperimentGroup *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_controlGroup;
  }
  else
  {
    -[AFExperimentConfiguration controlGroup](self->_base, "controlGroup");
    v2 = (AFExperimentGroup *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setControlGroup:(id)a3
{
  objc_storeStrong((id *)&self->_controlGroup, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getExperimentGroups
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_experimentGroups;
  }
  else
  {
    -[AFExperimentConfiguration experimentGroups](self->_base, "experimentGroups");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExperimentGroups:(id)a3
{
  objc_storeStrong((id *)&self->_experimentGroups, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (id)getSalt
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_salt;
  }
  else
  {
    -[AFExperimentConfiguration salt](self->_base, "salt");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_experimentGroups, 0);
  objc_storeStrong((id *)&self->_controlGroup, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
