@implementation _AFAudioSessionCoordinationSnapshotMutation

- (_AFAudioSessionCoordinationSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFAudioSessionCoordinationSnapshotMutation *v6;
  _AFAudioSessionCoordinationSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioSessionCoordinationSnapshotMutation;
  v6 = -[_AFAudioSessionCoordinationSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getCurrentOrUpNextDateInterval
{
  NSDateInterval *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_currentOrUpNextDateInterval;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot currentOrUpNextDateInterval](self->_base, "currentOrUpNextDateInterval");
    v2 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCurrentOrUpNextDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (BOOL)getIsAudioSessionActive
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
    return self->_isAudioSessionActive;
  else
    return -[AFAudioSessionCoordinationSnapshot isAudioSessionActive](self->_base, "isAudioSessionActive");
}

- (void)setIsAudioSessionActive:(BOOL)a3
{
  self->_isAudioSessionActive = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getLocalActiveAssertionContexts
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_localActiveAssertionContexts;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot localActiveAssertionContexts](self->_base, "localActiveAssertionContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocalActiveAssertionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_localActiveAssertionContexts, a3);
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getLocalPendingAssertionContexts
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_localPendingAssertionContexts;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot localPendingAssertionContexts](self->_base, "localPendingAssertionContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocalPendingAssertionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_localPendingAssertionContexts, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getRemoteActiveAssertionContexts
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_remoteActiveAssertionContexts;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot remoteActiveAssertionContexts](self->_base, "remoteActiveAssertionContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRemoteActiveAssertionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_remoteActiveAssertionContexts, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getRemotePendingAssertionContexts
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_remotePendingAssertionContexts;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot remotePendingAssertionContexts](self->_base, "remotePendingAssertionContexts");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRemotePendingAssertionContexts:(id)a3
{
  objc_storeStrong((id *)&self->_remotePendingAssertionContexts, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getLocalDevice
{
  AFAudioSessionCoordinationDeviceInfo *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_localDevice;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot localDevice](self->_base, "localDevice");
    v2 = (AFAudioSessionCoordinationDeviceInfo *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLocalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_localDevice, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getRemoteQualifiedInRangeDevices
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_remoteQualifiedInRangeDevices;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot remoteQualifiedInRangeDevices](self->_base, "remoteQualifiedInRangeDevices");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRemoteQualifiedInRangeDevices:(id)a3
{
  objc_storeStrong((id *)&self->_remoteQualifiedInRangeDevices, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getRemoteQualifiedOutOfRangeDevices
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_remoteQualifiedOutOfRangeDevices;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot remoteQualifiedOutOfRangeDevices](self->_base, "remoteQualifiedOutOfRangeDevices");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRemoteQualifiedOutOfRangeDevices:(id)a3
{
  objc_storeStrong((id *)&self->_remoteQualifiedOutOfRangeDevices, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getRemoteDisqualifiedDevices
{
  NSArray *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_remoteDisqualifiedDevices;
  }
  else
  {
    -[AFAudioSessionCoordinationSnapshot remoteDisqualifiedDevices](self->_base, "remoteDisqualifiedDevices");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setRemoteDisqualifiedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDisqualifiedDevices, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisqualifiedDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedOutOfRangeDevices, 0);
  objc_storeStrong((id *)&self->_remoteQualifiedInRangeDevices, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_remotePendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_remoteActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localPendingAssertionContexts, 0);
  objc_storeStrong((id *)&self->_localActiveAssertionContexts, 0);
  objc_storeStrong((id *)&self->_currentOrUpNextDateInterval, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
