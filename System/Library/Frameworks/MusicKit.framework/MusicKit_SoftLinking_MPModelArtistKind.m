@implementation MusicKit_SoftLinking_MPModelArtistKind

- (MusicKit_SoftLinking_MPModelArtistKind)init
{
  void *v3;
  MusicKit_SoftLinking_MPModelArtistKind *v4;
  objc_super v6;

  +[MusicKit_SoftLinking_MPModelKind _defaultArtistKind](MusicKit_SoftLinking_MPModelKind, "_defaultArtistKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelArtistKind;
  v4 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v6, sel__initWithUnderlyingKind_, v3);

  return v4;
}

- (MusicKit_SoftLinking_MPModelArtistKind)initWithAlbumKind:(id)a3
{
  id v4;
  id MPModelArtistClass;
  void *v6;
  void *v7;
  MusicKit_SoftLinking_MPModelArtistKind *v8;
  objc_super v10;

  v4 = a3;
  MPModelArtistClass = getMPModelArtistClass();
  objc_msgSend(v4, "_underlyingKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MPModelArtistClass, "kindWithAlbumKind:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)MusicKit_SoftLinking_MPModelArtistKind;
  v8 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v10, sel__initWithUnderlyingKind_, v7);

  return v8;
}

- (MusicKit_SoftLinking_MPModelAlbumKind)albumKind
{
  return self->_albumKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumKind, 0);
}

@end
