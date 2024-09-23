@implementation _AFCommandExecutionInfoMutation

- (_AFCommandExecutionInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFCommandExecutionInfoMutation *v6;
  _AFCommandExecutionInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCommandExecutionInfoMutation;
  v6 = -[_AFCommandExecutionInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getExecutionID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_executionID;
  }
  else
  {
    -[AFCommandExecutionInfo executionID](self->_base, "executionID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setExecutionID:(id)a3
{
  objc_storeStrong((id *)&self->_executionID, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getRequestID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_requestID;
  }
  else
  {
    -[AFCommandExecutionInfo requestID](self->_base, "requestID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getTurnId
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_turnId;
  }
  else
  {
    -[AFCommandExecutionInfo turnId](self->_base, "turnId");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTurnId:(id)a3
{
  objc_storeStrong((id *)&self->_turnId, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getOriginPeerInfo
{
  AFPeerInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_originPeerInfo;
  }
  else
  {
    -[AFCommandExecutionInfo originPeerInfo](self->_base, "originPeerInfo");
    v2 = (AFPeerInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setOriginPeerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_originPeerInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getCurrentHomeInfo
{
  AFHomeInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_currentHomeInfo;
  }
  else
  {
    -[AFCommandExecutionInfo currentHomeInfo](self->_base, "currentHomeInfo");
    v2 = (AFHomeInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCurrentHomeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentHomeInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getEndpointInfo
{
  AFEndpointInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_endpointInfo;
  }
  else
  {
    -[AFCommandExecutionInfo endpointInfo](self->_base, "endpointInfo");
    v2 = (AFEndpointInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setEndpointInfo:(id)a3
{
  objc_storeStrong((id *)&self->_endpointInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getInstanceInfo
{
  AFInstanceInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_instanceInfo;
  }
  else
  {
    -[AFCommandExecutionInfo instanceInfo](self->_base, "instanceInfo");
    v2 = (AFInstanceInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setInstanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_instanceInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getSpeechInfo
{
  AFSpeechInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_speechInfo;
  }
  else
  {
    -[AFCommandExecutionInfo speechInfo](self->_base, "speechInfo");
    v2 = (AFSpeechInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSpeechInfo:(id)a3
{
  objc_storeStrong((id *)&self->_speechInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getRequestHandlingContextSnapshot
{
  AFRequestHandlingContext *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_requestHandlingContextSnapshot;
  }
  else
  {
    -[AFCommandExecutionInfo requestHandlingContextSnapshot](self->_base, "requestHandlingContextSnapshot");
    v2 = (AFRequestHandlingContext *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRequestHandlingContextSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandlingContextSnapshot, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getDeviceRestrictions
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_deviceRestrictions;
  }
  else
  {
    -[AFCommandExecutionInfo deviceRestrictions](self->_base, "deviceRestrictions");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceRestrictions:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRestrictions, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getUserInfo
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    -[AFCommandExecutionInfo userInfo](self->_base, "userInfo");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_requestHandlingContextSnapshot, 0);
  objc_storeStrong((id *)&self->_speechInfo, 0);
  objc_storeStrong((id *)&self->_instanceInfo, 0);
  objc_storeStrong((id *)&self->_endpointInfo, 0);
  objc_storeStrong((id *)&self->_currentHomeInfo, 0);
  objc_storeStrong((id *)&self->_originPeerInfo, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_executionID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
