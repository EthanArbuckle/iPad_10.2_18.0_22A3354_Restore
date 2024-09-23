@implementation MusicKit_SoftLinking_MPModelRecentlyAddedKind

- (MusicKit_SoftLinking_MPModelRecentlyAddedKind)initWithIncludeOnlyDownloadedContent:(BOOL)a3
{
  id MPModelGenericObjectClass_1;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MusicKit_SoftLinking_MPModelRecentlyAddedKind *v14;
  MusicKit_SoftLinking_MPModelRecentlyAddedKind *v15;
  objc_super v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  MPModelGenericObjectClass_1 = getMPModelGenericObjectClass_1();
  getMPModelRelationshipGenericAlbum_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  +[MusicKit_SoftLinking_MPModelKind _defaultAlbumKind](MusicKit_SoftLinking_MPModelKind, "_defaultAlbumKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  getMPModelRelationshipGenericMovie_0();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  +[MusicKit_SoftLinking_MPModelKind _defaultMovieKind](MusicKit_SoftLinking_MPModelKind, "_defaultMovieKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  getMPModelRelationshipGenericPlaylist_0();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistKindExcludingEmpty](MusicKit_SoftLinking_MPModelKind, "_defaultPlaylistKindExcludingEmpty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  getMPModelRelationshipGenericTVSeason_0();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v10;
  +[MusicKit_SoftLinking_MPModelKind _defaultTVSeasonKind](MusicKit_SoftLinking_MPModelKind, "_defaultTVSeasonKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelGenericObjectClass_1, "kindWithRelationshipKinds:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPModelRecentlyAddedKind;
  v14 = -[MusicKit_SoftLinking_MPModelKind _initWithUnderlyingKind:](&v19, sel__initWithUnderlyingKind_, v13);
  v15 = v14;
  if (v14)
    v14->_includeOnlyDownloadedContent = a3;

  return v15;
}

- (BOOL)includeOnlyDownloadedContent
{
  return self->_includeOnlyDownloadedContent;
}

@end
