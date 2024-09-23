@implementation _AFInstanceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUUID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setInstanceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceUUID, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setApplicationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_applicationUUID, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (_AFInstanceInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFInstanceInfoMutation *v6;
  _AFInstanceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFInstanceInfoMutation;
  v6 = -[_AFInstanceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (id)getInstanceUUID
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_instanceUUID;
  }
  else
  {
    -[AFInstanceInfo instanceUUID](self->_base, "instanceUUID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)getApplicationUUID
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_applicationUUID;
  }
  else
  {
    -[AFInstanceInfo applicationUUID](self->_base, "applicationUUID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (int64_t)getApplicationType
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_applicationType;
  else
    return -[AFInstanceInfo applicationType](self->_base, "applicationType");
}

@end
