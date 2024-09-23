@implementation _AFMyriadSessionMutation

- (_AFMyriadSessionMutation)initWithBase:(id)a3
{
  id v5;
  _AFMyriadSessionMutation *v6;
  _AFMyriadSessionMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadSessionMutation;
  v6 = -[_AFMyriadSessionMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getGeneration
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_generation;
  else
    return -[AFMyriadSession generation](self->_base, "generation");
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getSessionId
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_sessionId;
  }
  else
  {
    -[AFMyriadSession sessionId](self->_base, "sessionId");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getCurrentElectionAdvertisementId
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_currentElectionAdvertisementId;
  }
  else
  {
    -[AFMyriadSession currentElectionAdvertisementId](self->_base, "currentElectionAdvertisementId");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCurrentElectionAdvertisementId:(id)a3
{
  objc_storeStrong((id *)&self->_currentElectionAdvertisementId, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getCurrentElectionAdvertisementData
{
  NSData *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_currentElectionAdvertisementData;
  }
  else
  {
    -[AFMyriadSession currentElectionAdvertisementData](self->_base, "currentElectionAdvertisementData");
    v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCurrentElectionAdvertisementData:(id)a3
{
  objc_storeStrong((id *)&self->_currentElectionAdvertisementData, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getElectionAdvertisementDataByIds
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_electionAdvertisementDataByIds;
  }
  else
  {
    -[AFMyriadSession electionAdvertisementDataByIds](self->_base, "electionAdvertisementDataByIds");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setElectionAdvertisementDataByIds:(id)a3
{
  objc_storeStrong((id *)&self->_electionAdvertisementDataByIds, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionAdvertisementDataByIds, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementData, 0);
  objc_storeStrong((id *)&self->_currentElectionAdvertisementId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
