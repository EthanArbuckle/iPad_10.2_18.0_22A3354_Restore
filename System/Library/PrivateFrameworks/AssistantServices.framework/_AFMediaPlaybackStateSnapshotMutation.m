@implementation _AFMediaPlaybackStateSnapshotMutation

- (_AFMediaPlaybackStateSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFMediaPlaybackStateSnapshotMutation *v6;
  _AFMediaPlaybackStateSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMediaPlaybackStateSnapshotMutation;
  v6 = -[_AFMediaPlaybackStateSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (int64_t)getPlaybackState
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_playbackState;
  else
    return -[AFMediaPlaybackStateSnapshot playbackState](self->_base, "playbackState");
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getNowPlayingTimestamp
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_nowPlayingTimestamp;
  }
  else
  {
    -[AFMediaPlaybackStateSnapshot nowPlayingTimestamp](self->_base, "nowPlayingTimestamp");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setNowPlayingTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingTimestamp, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getMediaType
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_mediaType;
  }
  else
  {
    -[AFMediaPlaybackStateSnapshot mediaType](self->_base, "mediaType");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getGroupIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_groupIdentifier;
  }
  else
  {
    -[AFMediaPlaybackStateSnapshot groupIdentifier](self->_base, "groupIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (BOOL)getIsProxyGroupPlayer
{
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
    return self->_isProxyGroupPlayer;
  else
    return -[AFMediaPlaybackStateSnapshot isProxyGroupPlayer](self->_base, "isProxyGroupPlayer");
}

- (void)setIsProxyGroupPlayer:(BOOL)a3
{
  self->_isProxyGroupPlayer = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_nowPlayingTimestamp, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
