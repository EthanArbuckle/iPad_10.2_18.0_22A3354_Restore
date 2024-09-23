@implementation _AFAudioPlaybackRequestMutation

- (_AFAudioPlaybackRequestMutation)initWithBase:(id)a3
{
  id v5;
  _AFAudioPlaybackRequestMutation *v6;
  _AFAudioPlaybackRequestMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFAudioPlaybackRequestMutation;
  v6 = -[_AFAudioPlaybackRequestMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getItemURL
{
  NSURL *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_itemURL;
  }
  else
  {
    -[AFAudioPlaybackRequest itemURL](self->_base, "itemURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getItemData
{
  NSData *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_itemData;
  }
  else
  {
    -[AFAudioPlaybackRequest itemData](self->_base, "itemData");
    v2 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setItemData:(id)a3
{
  objc_storeStrong((id *)&self->_itemData, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getNumberOfLoops
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_numberOfLoops;
  else
    return -[AFAudioPlaybackRequest numberOfLoops](self->_base, "numberOfLoops");
}

- (void)setNumberOfLoops:(int64_t)a3
{
  self->_numberOfLoops = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (float)getVolume
{
  float result;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_volume;
  -[AFAudioPlaybackRequest volume](self->_base, "volume");
  return result;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (double)getFadeInDuration
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_fadeInDuration;
  -[AFAudioPlaybackRequest fadeInDuration](self->_base, "fadeInDuration");
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (double)getFadeOutDuration
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_fadeOutDuration;
  -[AFAudioPlaybackRequest fadeOutDuration](self->_base, "fadeOutDuration");
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getUserInfo
{
  NSDictionary *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    -[AFAudioPlaybackRequest userInfo](self->_base, "userInfo");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getHapticLibraryKey
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_hapticLibraryKey;
  }
  else
  {
    -[AFAudioPlaybackRequest hapticLibraryKey](self->_base, "hapticLibraryKey");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setHapticLibraryKey:(id)a3
{
  objc_storeStrong((id *)&self->_hapticLibraryKey, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getUUID
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_UUID;
  }
  else
  {
    -[AFAudioPlaybackRequest UUID](self->_base, "UUID");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_hapticLibraryKey, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
