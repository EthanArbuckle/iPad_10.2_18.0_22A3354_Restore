@implementation _AFHomeInfoMutation

- (_AFHomeInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeInfoMutation *v6;
  _AFHomeInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeInfoMutation;
  v6 = -[_AFHomeInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getHomeIdentifier
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_homeIdentifier;
  }
  else
  {
    -[AFHomeInfo homeIdentifier](self->_base, "homeIdentifier");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)getActivityNotificationsEnabledForPersonalRequests
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_activityNotificationsEnabledForPersonalRequests;
  else
    return -[AFHomeInfo activityNotificationsEnabledForPersonalRequests](self->_base, "activityNotificationsEnabledForPersonalRequests");
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  self->_activityNotificationsEnabledForPersonalRequests = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
