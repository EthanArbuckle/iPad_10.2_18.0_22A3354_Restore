@implementation _AFExperimentStateMutation

- (_AFExperimentStateMutation)initWithBase:(id)a3
{
  id v5;
  _AFExperimentStateMutation *v6;
  _AFExperimentStateMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentStateMutation;
  v6 = -[_AFExperimentStateMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getLastSyncDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_lastSyncDate;
  }
  else
  {
    -[AFExperimentState lastSyncDate](self->_base, "lastSyncDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLastSyncDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSyncDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)getDidEnd
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_didEnd;
  else
    return -[AFExperimentState didEnd](self->_base, "didEnd");
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getEndingGroupIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_endingGroupIdentifier;
  }
  else
  {
    -[AFExperimentState endingGroupIdentifier](self->_base, "endingGroupIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setEndingGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endingGroupIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getVersion
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_version;
  }
  else
  {
    -[AFExperimentState version](self->_base, "version");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_endingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
