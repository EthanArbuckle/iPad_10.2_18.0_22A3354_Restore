@implementation _AFExperimentGroupMutation

- (_AFExperimentGroupMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentGroupMutation *v6;
  _AFExperimentGroupMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentGroupMutation;
  v6 = -[_AFExperimentGroupMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    -[AFExperimentGroup identifier](self->_base, "identifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getAllocation
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_allocation;
  else
    return -[AFExperimentGroup allocation](self->_base, "allocation");
}

- (void)setAllocation:(unint64_t)a3
{
  self->_allocation = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getProperties
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_properties;
  }
  else
  {
    -[AFExperimentGroup properties](self->_base, "properties");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
