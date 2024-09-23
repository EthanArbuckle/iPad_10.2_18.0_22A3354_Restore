@implementation MusicKit_SoftLinking_MPModelTVEpisodeKind

- (MusicKit_SoftLinking_MPModelTVEpisodeKind)init
{
  void *v3;
  MusicKit_SoftLinking_MPModelTVEpisodeKind *v4;
  objc_super v6;

  +[MusicKit_SoftLinking_MPModelKind _defaultTVEpisodeKind](MusicKit_SoftLinking_MPModelKind, "_defaultTVEpisodeKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelTVEpisodeKind;
  v4 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v6, sel__initWithUnderlyingKind_, v3);

  return v4;
}

@end
