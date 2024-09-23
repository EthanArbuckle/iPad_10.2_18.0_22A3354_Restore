@implementation _AFAudioDeviceInfoMutation

- (_AFAudioDeviceInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFAudioDeviceInfoMutation *v6;
  _AFAudioDeviceInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioDeviceInfoMutation;
  v6 = -[_AFAudioDeviceInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getRoute
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_route;
  }
  else
  {
    -[AFAudioDeviceInfo route](self->_base, "route");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsRemoteDevice
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_isRemoteDevice;
  else
    return -[AFAudioDeviceInfo isRemoteDevice](self->_base, "isRemoteDevice");
}

- (void)setIsRemoteDevice:(BOOL)a3
{
  self->_isRemoteDevice = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getDeviceUID
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deviceUID;
  }
  else
  {
    -[AFAudioDeviceInfo deviceUID](self->_base, "deviceUID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUID, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
