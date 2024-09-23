@implementation _AFAudioSessionCoordinationSystemInfoMutation

- (_AFAudioSessionCoordinationSystemInfoMutation)initWithBase:(id)a3
{
  id v5;
  _AFAudioSessionCoordinationSystemInfoMutation *v6;
  _AFAudioSessionCoordinationSystemInfoMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationSystemInfoMutation;
  v6 = -[_AFAudioSessionCoordinationSystemInfoMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (BOOL)getIsSupportedAndEnabled
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_isSupportedAndEnabled;
  else
    return -[AFAudioSessionCoordinationSystemInfo isSupportedAndEnabled](self->_base, "isSupportedAndEnabled");
}

- (void)setIsSupportedAndEnabled:(BOOL)a3
{
  self->_isSupportedAndEnabled = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getHomeKitRoomName
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_homeKitRoomName;
  }
  else
  {
    -[AFAudioSessionCoordinationSystemInfo homeKitRoomName](self->_base, "homeKitRoomName");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeKitRoomName:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitRoomName, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getHomeKitMediaSystemIdentifier
{
  NSUUID *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_homeKitMediaSystemIdentifier;
  }
  else
  {
    -[AFAudioSessionCoordinationSystemInfo homeKitMediaSystemIdentifier](self->_base, "homeKitMediaSystemIdentifier");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHomeKitMediaSystemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitMediaSystemIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getMediaRemoteGroupIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_mediaRemoteGroupIdentifier;
  }
  else
  {
    -[AFAudioSessionCoordinationSystemInfo mediaRemoteGroupIdentifier](self->_base, "mediaRemoteGroupIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaRemoteGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteGroupIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getMediaRemoteRouteIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_mediaRemoteRouteIdentifier;
  }
  else
  {
    -[AFAudioSessionCoordinationSystemInfo mediaRemoteRouteIdentifier](self->_base, "mediaRemoteRouteIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaRemoteRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRemoteRouteIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitRoomName, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
