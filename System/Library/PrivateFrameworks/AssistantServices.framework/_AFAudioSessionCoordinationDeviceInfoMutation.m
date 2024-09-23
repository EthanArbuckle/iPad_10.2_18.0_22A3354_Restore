@implementation _AFAudioSessionCoordinationDeviceInfoMutation

- (_AFAudioSessionCoordinationDeviceInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFAudioSessionCoordinationDeviceInfoMutation *v6;
  _AFAudioSessionCoordinationDeviceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationDeviceInfoMutation;
  v6 = -[_AFAudioSessionCoordinationDeviceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getPeerInfo
{
  AFPeerInfo *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_peerInfo;
  }
  else
  {
    -[AFAudioSessionCoordinationDeviceInfo peerInfo](self->_base, "peerInfo");
    v2 = (AFPeerInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPeerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peerInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getSystemInfo
{
  AFAudioSessionCoordinationSystemInfo *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_systemInfo;
  }
  else
  {
    -[AFAudioSessionCoordinationDeviceInfo systemInfo](self->_base, "systemInfo");
    v2 = (AFAudioSessionCoordinationSystemInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSystemInfo:(id)a3
{
  objc_storeStrong((id *)&self->_systemInfo, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
