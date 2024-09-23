@implementation MTRContentLauncherClusterPlaybackPreferencesStruct

- (MTRContentLauncherClusterPlaybackPreferencesStruct)init
{
  MTRContentLauncherClusterPlaybackPreferencesStruct *v2;
  MTRContentLauncherClusterPlaybackPreferencesStruct *v3;
  NSNumber *playbackPosition;
  uint64_t v5;
  MTRContentLauncherClusterTrackPreferenceStruct *textTrack;
  NSArray *audioTracks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRContentLauncherClusterPlaybackPreferencesStruct;
  v2 = -[MTRContentLauncherClusterPlaybackPreferencesStruct init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    playbackPosition = v2->_playbackPosition;
    v2->_playbackPosition = (NSNumber *)&unk_250591B18;

    v5 = objc_opt_new();
    textTrack = v3->_textTrack;
    v3->_textTrack = (MTRContentLauncherClusterTrackPreferenceStruct *)v5;

    audioTracks = v3->_audioTracks;
    v3->_audioTracks = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterPlaybackPreferencesStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRContentLauncherClusterPlaybackPreferencesStruct);
  objc_msgSend_playbackPosition(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPlaybackPosition_(v4, v8, (uint64_t)v7);

  objc_msgSend_textTrack(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTextTrack_(v4, v12, (uint64_t)v11);

  objc_msgSend_audioTracks(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioTracks_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: playbackPosition:%@; textTrack:%@; audioTracks:%@; >"),
    v5,
    self->_playbackPosition,
    self->_textTrack,
    self->_audioTracks);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)playbackPosition
{
  return self->_playbackPosition;
}

- (void)setPlaybackPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MTRContentLauncherClusterTrackPreferenceStruct)textTrack
{
  return self->_textTrack;
}

- (void)setTextTrack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)audioTracks
{
  return self->_audioTracks;
}

- (void)setAudioTracks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTracks, 0);
  objc_storeStrong((id *)&self->_textTrack, 0);
  objc_storeStrong((id *)&self->_playbackPosition, 0);
}

@end
