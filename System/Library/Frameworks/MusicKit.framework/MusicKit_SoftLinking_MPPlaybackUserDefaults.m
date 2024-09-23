@implementation MusicKit_SoftLinking_MPPlaybackUserDefaults

+ (MusicKit_SoftLinking_MPPlaybackUserDefaults)standardUserDefaults
{
  if (standardUserDefaults_sOnceToken != -1)
    dispatch_once(&standardUserDefaults_sOnceToken, &__block_literal_global_7);
  return (MusicKit_SoftLinking_MPPlaybackUserDefaults *)(id)standardUserDefaults_sStandardUserDefaults;
}

- (id)_initWithUnderlyingPlaybackUserDefaults:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPPlaybackUserDefaults *v6;
  MusicKit_SoftLinking_MPPlaybackUserDefaults *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPPlaybackUserDefaults;
  v6 = -[MusicKit_SoftLinking_MPPlaybackUserDefaults init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingPlaybackUserDefaults, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handlePreferredResolutionsDidChangeNotification_, v9, v7->_underlyingPlaybackUserDefaults);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingPlaybackUserDefaults);

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPPlaybackUserDefaults;
  -[MusicKit_SoftLinking_MPPlaybackUserDefaults dealloc](&v5, sel_dealloc);
}

- (int64_t)preferredMusicLowBandwidthResolution
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;

  v2 = -[MPPlaybackUserDefaults preferredMusicLowBandwidthResolution](self->_underlyingPlaybackUserDefaults, "preferredMusicLowBandwidthResolution");
  v3 = 4;
  if (v2 != 192000)
    v3 = 0;
  if (v2 == 48000)
    v4 = 3;
  else
    v4 = v3;
  v5 = 1;
  v6 = 2;
  if (v2 != 256)
    v6 = 0;
  if (v2 != 64)
    v5 = v6;
  if (v2 <= 47999)
    return v5;
  else
    return v4;
}

- (int64_t)preferredVideoLowBandwidthResolution
{
  uint64_t v2;

  v2 = -[MPPlaybackUserDefaults preferredVideoLowBandwidthResolution](self->_underlyingPlaybackUserDefaults, "preferredVideoLowBandwidthResolution");
  if (v2 == 1000000)
    return 2;
  else
    return v2 == 1000;
}

- (BOOL)isPrivateListeningEnabled
{
  void *v2;
  char v3;

  -[MPPlaybackUserDefaults isPrivateListeningEnabled](self->_underlyingPlaybackUserDefaults, "isPrivateListeningEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)prefersSpatialAudio
{
  return -[MPPlaybackUserDefaults prefersSpatialAudio](self->_underlyingPlaybackUserDefaults, "prefersSpatialAudio");
}

- (void)setPrefersSpatialAudio:(BOOL)a3
{
  -[MPPlaybackUserDefaults setPrefersSpatialAudio:](self->_underlyingPlaybackUserDefaults, "setPrefersSpatialAudio:", a3);
}

- (BOOL)prefersSpatialDownloads
{
  return -[MPPlaybackUserDefaults prefersSpatialDownloads](self->_underlyingPlaybackUserDefaults, "prefersSpatialDownloads");
}

- (void)setPrefersSpatialDownloads:(BOOL)a3
{
  -[MPPlaybackUserDefaults setPrefersSpatialDownloads:](self->_underlyingPlaybackUserDefaults, "setPrefersSpatialDownloads:", a3);
}

- (BOOL)isCrossFadeEnabled
{
  return -[MPPlaybackUserDefaults isCrossFadeEnabled](self->_underlyingPlaybackUserDefaults, "isCrossFadeEnabled");
}

- (double)crossFadeDuration
{
  double result;

  -[MPPlaybackUserDefaults crossFadeDuration](self->_underlyingPlaybackUserDefaults, "crossFadeDuration");
  return result;
}

+ (NSString)preferredResolutionsDidChangeNotification
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification");
}

- (void)_handlePreferredResolutionsDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPPlaybackUserDefaultsPreferredResolutionsDidChangeNotification"), self, v6);
}

- (void)setCrossFadeEnabled:(BOOL)a3
{
  self->_crossFadeEnabled = a3;
}

- (void)setCrossFadeDuration:(double)a3
{
  self->_crossFadeDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaybackUserDefaults, 0);
}

@end
