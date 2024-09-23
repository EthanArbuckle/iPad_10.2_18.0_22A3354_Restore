@implementation MusicKit_SoftLinking_MPModelKind

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingKind, 0);
}

- (id)_initWithUnderlyingKind:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPModelKind *v6;
  MusicKit_SoftLinking_MPModelKind *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelKind;
  v6 = -[MusicKit_SoftLinking_MPModelKind init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingKind, a3);

  return v7;
}

+ (id)_defaultPlaylistEntryKindForTracks
{
  id MPModelPlaylistEntryClass;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  objc_msgSend(a1, "_defaultSongKindForTracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistEntryClass, "kindWithKinds:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_songKindForVariants:(unint64_t)a3
{
  return (id)objc_msgSend(getMPModelSongClass(), "kindWithVariants:", a3);
}

+ (id)_defaultSongKindForTracks
{
  return (id)objc_msgSend(a1, "_songKindForVariants:", 3);
}

- (MPModelKind)_underlyingKind
{
  return self->_underlyingKind;
}

+ (id)_sanitizeKind:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id MPModelAlbumClass;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  id MPModelPlaylistClass;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  Class (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v3 = a3;
  if (_sanitizeKind__sOnceToken != -1)
    dispatch_once(&_sanitizeKind__sOnceToken, &__block_literal_global_10);
  v4 = v3;
  v5 = v4;
  v6 = v4;
  if (_sanitizeKind__isNanoMusicProcess)
  {
    objc_msgSend(v4, "identityKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getMPModelSongKindClass(), "identityKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      +[MusicKit_SoftLinking_MPModelKind _sanitizeSongKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeSongKind:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v10;
LABEL_7:

LABEL_13:
      goto LABEL_14;
    }
    v44 = 0;
    v45 = &v44;
    v46 = 0x2050000000;
    v11 = (void *)getMPModelAlbumKindClass_softClass_0;
    v47 = getMPModelAlbumKindClass_softClass_0;
    if (!getMPModelAlbumKindClass_softClass_0)
    {
      v39 = MEMORY[0x24BDAC760];
      v40 = 3221225472;
      v41 = __getMPModelAlbumKindClass_block_invoke_0;
      v42 = &unk_24CD1CC68;
      v43 = &v44;
      __getMPModelAlbumKindClass_block_invoke_0((uint64_t)&v39);
      v11 = (void *)v45[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v44, 8);
    objc_msgSend(v12, "identityKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "isEqual:", v13);

    if (v14)
    {
      v15 = v5;
      objc_msgSend(v15, "songKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MusicKit_SoftLinking_MPModelKind _sanitizeSongKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeSongKind:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      MPModelAlbumClass = getMPModelAlbumClass();
      v19 = objc_msgSend(v15, "variants");
      v20 = objc_msgSend(v15, "options");

      objc_msgSend(MPModelAlbumClass, "kindWithVariants:songKind:options:", v19, v17, v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
      v45 = &v44;
      v46 = 0x2050000000;
      v23 = (void *)getMPModelPlaylistEntryKindClass_softClass;
      v47 = getMPModelPlaylistEntryKindClass_softClass;
      if (!getMPModelPlaylistEntryKindClass_softClass)
      {
        v39 = MEMORY[0x24BDAC760];
        v40 = 3221225472;
        v41 = __getMPModelPlaylistEntryKindClass_block_invoke;
        v42 = &unk_24CD1CC68;
        v43 = &v44;
        __getMPModelPlaylistEntryKindClass_block_invoke((uint64_t)&v39);
        v23 = (void *)v45[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v44, 8);
      objc_msgSend(v24, "identityKind");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "isEqual:", v25);

      if (v26)
      {
        +[MusicKit_SoftLinking_MPModelKind _sanitizePlaylistEntryKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizePlaylistEntryKind:", v5);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      objc_msgSend(getMPModelPlaylistKindClass(), "identityKind");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v7, "isEqual:", v27);

      if (!v28)
      {
        v44 = 0;
        v45 = &v44;
        v46 = 0x2050000000;
        v33 = (void *)getMPModelGenericObjectKindClass_softClass;
        v47 = getMPModelGenericObjectKindClass_softClass;
        if (!getMPModelGenericObjectKindClass_softClass)
        {
          v39 = MEMORY[0x24BDAC760];
          v40 = 3221225472;
          v41 = __getMPModelGenericObjectKindClass_block_invoke;
          v42 = &unk_24CD1CC68;
          v43 = &v44;
          __getMPModelGenericObjectKindClass_block_invoke((uint64_t)&v39);
          v33 = (void *)v45[3];
        }
        v34 = objc_retainAutorelease(v33);
        _Block_object_dispose(&v44, 8);
        objc_msgSend(v34, "identityKind");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v7, "isEqual:", v35);

        v6 = v5;
        if (!v36)
          goto LABEL_13;
        objc_msgSend(v5, "relationshipKinds");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "msv_mapKeysAndValues:", &__block_literal_global_9);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(getMPModelGenericObjectClass_1(), "kindWithRelationshipKinds:", v38);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
      v15 = v5;
      objc_msgSend(v15, "playlistEntryKind");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[MusicKit_SoftLinking_MPModelKind _sanitizePlaylistEntryKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizePlaylistEntryKind:", v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      MPModelPlaylistClass = getMPModelPlaylistClass();
      v31 = objc_msgSend(v15, "variants");
      v32 = objc_msgSend(v15, "options");

      objc_msgSend(MPModelPlaylistClass, "kindWithVariants:playlistEntryKind:options:", v31, v17, v32);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v21;

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (int64_t)modelObjectType
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int64_t v7;

  -[MPModelKind identityKind](self->_underlyingKind, "identityKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getMPModelPlaylistKindClass(), "identityKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if (!v5)
    return 15;
  v6 = -[MPModelKind variants](self->_underlyingKind, "variants");
  v7 = 20;
  if ((v6 & 8) == 0)
    v7 = 15;
  if (v6 == 8)
    return 19;
  else
    return v7;
}

+ (id)_modelKindForModelObjectType:(int64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  v4 = 0;
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_defaultAlbumKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 1:
      v5 = a1;
      v6 = 1;
      goto LABEL_22;
    case 2:
      objc_msgSend(a1, "_defaultArtistKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 3:
      objc_msgSend(a1, "_defaultComposerKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 4:
      objc_msgSend(a1, "_defaultCreditArtistKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 5:
      v5 = a1;
      v6 = 8;
      goto LABEL_22;
    case 6:
      v5 = a1;
      v6 = 2;
      goto LABEL_22;
    case 7:
      v5 = a1;
      v6 = 32;
      goto LABEL_22;
    case 8:
      objc_msgSend(a1, "_defaultFileAssetKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 9:
      objc_msgSend(a1, "_defaultGenreKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 12:
      objc_msgSend(a1, "_defaultLyricsKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 13:
      objc_msgSend(a1, "_defaultMovieKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 14:
      v7 = a1;
      v8 = 2;
      goto LABEL_34;
    case 15:
      objc_msgSend(a1, "_defaultPlaylistKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 16:
      objc_msgSend(a1, "_defaultPlaylistAuthorKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 17:
      objc_msgSend(a1, "_defaultPlaylistEntryKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 18:
      objc_msgSend(a1, "_defaultPlaylistEntryReactionKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 19:
      objc_msgSend(a1, "_defaultPlaylistFolderKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 20:
      objc_msgSend(a1, "_defaultPlaylistFolderItemKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 22:
      v5 = a1;
      v6 = 4;
LABEL_22:
      objc_msgSend(v5, "_curatorKindForVariants:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 23:
      objc_msgSend(a1, "_defaultRecentlyAddedObjectKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 24:
      objc_msgSend(a1, "_defaultRecordLabelKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 25:
      objc_msgSend(a1, "_defaultSocialPersonKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 26:
      v7 = a1;
      v8 = 1;
      goto LABEL_34;
    case 27:
      objc_msgSend(a1, "_defaultRadioStationKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 30:
      v7 = a1;
      v8 = 3;
      goto LABEL_34;
    case 31:
      objc_msgSend(a1, "_defaultTVEpisodeKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 32:
      objc_msgSend(a1, "_defaultTVSeasonKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 33:
      objc_msgSend(a1, "_defaultTVShowKind");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 34:
      v7 = a1;
      v8 = 4;
      goto LABEL_34;
    case 35:
      v7 = a1;
      v8 = 6;
LABEL_34:
      objc_msgSend(v7, "_songKindForVariants:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v4;
  }
  return v4;
}

+ (id)_defaultAlbumKind
{
  id MPModelAlbumClass;
  void *v4;
  void *v5;

  MPModelAlbumClass = getMPModelAlbumClass();
  objc_msgSend(a1, "_defaultSongKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelAlbumClass, "kindWithSongKind:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultAlbumKindForTracks
{
  id MPModelAlbumClass;
  void *v4;
  void *v5;

  MPModelAlbumClass = getMPModelAlbumClass();
  objc_msgSend(a1, "_defaultSongKindForTracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelAlbumClass, "kindWithSongKind:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultArtistKind
{
  id MPModelArtistClass;
  void *v4;
  void *v5;

  MPModelArtistClass = getMPModelArtistClass();
  objc_msgSend(a1, "_defaultAlbumKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelArtistClass, "kindWithAlbumKind:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultComposerKind
{
  void *v3;
  id v4;
  id MPModelAlbumClass;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getMPModelComposerClass_softClass_0;
  v14 = getMPModelComposerClass_softClass_0;
  if (!getMPModelComposerClass_softClass_0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getMPModelComposerClass_block_invoke_0;
    v10[3] = &unk_24CD1CC68;
    v10[4] = &v11;
    __getMPModelComposerClass_block_invoke_0((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  MPModelAlbumClass = getMPModelAlbumClass();
  objc_msgSend(a1, "_defaultSongKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelAlbumClass, "kindWithVariants:songKind:options:", 3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kindWithAlbumKind:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_defaultCreditArtistKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelCreditsArtistClass_softClass_0;
  v9 = getMPModelCreditsArtistClass_softClass_0;
  if (!getMPModelCreditsArtistClass_softClass_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelCreditsArtistClass_block_invoke_0;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelCreditsArtistClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultCuratorKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelCuratorActualKindClass_softClass;
  v9 = getMPModelCuratorActualKindClass_softClass;
  if (!getMPModelCuratorActualKindClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelCuratorActualKindClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelCuratorActualKindClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultFileAssetKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelFileAssetClass_softClass_0;
  v9 = getMPModelFileAssetClass_softClass_0;
  if (!getMPModelFileAssetClass_softClass_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelFileAssetClass_block_invoke_0;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelFileAssetClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultRecentlyAddedObjectKind
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
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  MPModelGenericObjectClass_1 = getMPModelGenericObjectClass_1();
  getMPModelRelationshipGenericAlbum_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(a1, "_defaultAlbumKindForTracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  getMPModelRelationshipGenericMovie_0();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(a1, "_defaultMovieKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  getMPModelRelationshipGenericPlaylist_0();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(a1, "_defaultPlaylistKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  getMPModelRelationshipGenericTVSeason_0();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(a1, "_defaultTVSeasonKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelGenericObjectClass_1, "kindWithRelationshipKinds:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_defaultGenreKind
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMPModelGenreClass_softClass_0;
  v12 = getMPModelGenreClass_softClass_0;
  if (!getMPModelGenreClass_softClass_0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMPModelGenreClass_block_invoke_0;
    v8[3] = &unk_24CD1CC68;
    v8[4] = &v9;
    __getMPModelGenreClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(a1, "_defaultAlbumKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kindWithAlbumKind:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultLyricsKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelLyricsClass_softClass_0;
  v9 = getMPModelLyricsClass_softClass_0;
  if (!getMPModelLyricsClass_softClass_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelLyricsClass_block_invoke_0;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelLyricsClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultMovieKind
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_msgSend(a1, "shouldShowAllExtendedVideoContent");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getMPModelMovieClass_softClass_0;
  v11 = getMPModelMovieClass_softClass_0;
  if (!getMPModelMovieClass_softClass_0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMPModelMovieClass_block_invoke_0;
    v7[3] = &unk_24CD1CC68;
    v7[4] = &v8;
    __getMPModelMovieClass_block_invoke_0((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  if (v2)
    v4 = 3;
  else
    v4 = 2;
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "kindWithVariants:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultPlaylistKind
{
  id MPModelPlaylistClass;
  void *v4;
  void *v5;

  MPModelPlaylistClass = getMPModelPlaylistClass();
  objc_msgSend(a1, "_defaultPlaylistEntryKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistClass, "kindWithVariants:playlistEntryKind:options:", 215, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultPlaylistKindExcludingEmpty
{
  id MPModelPlaylistClass;
  void *v4;
  void *v5;

  MPModelPlaylistClass = getMPModelPlaylistClass();
  objc_msgSend(a1, "_defaultPlaylistEntryKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistClass, "kindWithVariants:playlistEntryKind:options:", 215, v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultPlaylistAuthorKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelPlaylistAuthorKindClass_softClass;
  v9 = getMPModelPlaylistAuthorKindClass_softClass;
  if (!getMPModelPlaylistAuthorKindClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelPlaylistAuthorKindClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelPlaylistAuthorKindClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultPlaylistEntryKind
{
  id MPModelPlaylistEntryClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  objc_msgSend(a1, "_defaultSongKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultTVEpisodeKind", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(a1, "_defaultMovieKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistEntryClass, "kindWithKinds:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_defaultPlaylistEntryReactionKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelPlaylistEntryReactionKindClass_softClass;
  v9 = getMPModelPlaylistEntryReactionKindClass_softClass;
  if (!getMPModelPlaylistEntryReactionKindClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelPlaylistEntryReactionKindClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelPlaylistEntryReactionKindClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultPlaylistEntryKindForSongs
{
  id MPModelPlaylistEntryClass;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  objc_msgSend(a1, "_songKindForVariants:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistEntryClass, "kindWithKinds:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultPlaylistEntryKindForMusicVideos
{
  id MPModelPlaylistEntryClass;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  MPModelPlaylistEntryClass = getMPModelPlaylistEntryClass();
  objc_msgSend(a1, "_songKindForVariants:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistEntryClass, "kindWithKinds:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultPlaylistFolderKind
{
  id MPModelPlaylistClass;
  void *v4;
  void *v5;

  MPModelPlaylistClass = getMPModelPlaylistClass();
  objc_msgSend(a1, "_defaultPlaylistEntryKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistClass, "kindWithVariants:playlistEntryKind:options:", 8, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultPlaylistFolderItemKind
{
  id MPModelPlaylistClass;
  void *v4;
  void *v5;

  MPModelPlaylistClass = getMPModelPlaylistClass();
  objc_msgSend(a1, "_defaultPlaylistEntryKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPModelPlaylistClass, "kindWithVariants:playlistEntryKind:options:", 95, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_defaultRadioStationKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelRadioStationKindClass_softClass_0;
  v9 = getMPModelRadioStationKindClass_softClass_0;
  if (!getMPModelRadioStationKindClass_softClass_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelRadioStationKindClass_block_invoke_0;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelRadioStationKindClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultRecordLabelKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelRecordLabelKindClass_softClass;
  v9 = getMPModelRecordLabelKindClass_softClass;
  if (!getMPModelRecordLabelKindClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelRecordLabelKindClass_block_invoke;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelRecordLabelKindClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "identityKind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultSocialPersonKind
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPModelSocialPersonClass_softClass_0;
  v9 = getMPModelSocialPersonClass_softClass_0;
  if (!getMPModelSocialPersonClass_softClass_0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPModelSocialPersonClass_block_invoke_0;
    v5[3] = &unk_24CD1CC68;
    v5[4] = &v6;
    __getMPModelSocialPersonClass_block_invoke_0((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "kind");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultSongKind
{
  return (id)objc_msgSend(a1, "_songKindForVariants:", 7);
}

+ (id)_defaultSongKindForAudioOnly
{
  return (id)objc_msgSend(a1, "_songKindForVariants:", 1);
}

+ (id)_defaultTVEpisodeKind
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = objc_msgSend(a1, "shouldShowAllExtendedVideoContent");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getMPModelTVEpisodeClass_softClass_0;
  v11 = getMPModelTVEpisodeClass_softClass_0;
  if (!getMPModelTVEpisodeClass_softClass_0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMPModelTVEpisodeClass_block_invoke_0;
    v7[3] = &unk_24CD1CC68;
    v7[4] = &v8;
    __getMPModelTVEpisodeClass_block_invoke_0((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  if (v2)
    v4 = 3;
  else
    v4 = 2;
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "kindWithVariants:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultTVSeasonKind
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMPModelTVSeasonClass_softClass_0;
  v12 = getMPModelTVSeasonClass_softClass_0;
  if (!getMPModelTVSeasonClass_softClass_0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMPModelTVSeasonClass_block_invoke_0;
    v8[3] = &unk_24CD1CC68;
    v8[4] = &v9;
    __getMPModelTVSeasonClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(a1, "_defaultTVEpisodeKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kindWithEpisodeKind:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_defaultTVShowKind
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMPModelTVShowClass_softClass_0;
  v12 = getMPModelTVShowClass_softClass_0;
  if (!getMPModelTVShowClass_softClass_0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMPModelTVShowClass_block_invoke_0;
    v8[3] = &unk_24CD1CC68;
    v8[4] = &v9;
    __getMPModelTVShowClass_block_invoke_0((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(a1, "_defaultTVSeasonKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kindWithSeasonKind:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)playlistEntryKindWithKinds:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getMPModelPlaylistEntryClass(), "kindWithKinds:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_curatorKindForVariants:(unint64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getMPModelCuratorClass_softClass_0;
  v11 = getMPModelCuratorClass_softClass_0;
  if (!getMPModelCuratorClass_softClass_0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMPModelCuratorClass_block_invoke_0;
    v7[3] = &unk_24CD1CC68;
    v7[4] = &v8;
    __getMPModelCuratorClass_block_invoke_0((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "kindWithVariants:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_songKindForVariants:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(getMPModelSongClass(), "kindWithVariants:options:", a3, a4);
}

+ (BOOL)shouldShowAllExtendedVideoContent
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("showAllTVShows"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)_sanitizeSongKind:(id)a3
{
  id v3;
  unint64_t v4;
  id MPModelSongClass;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "variants") & 0xFFFFFFFFFFFFFFFDLL;
  MPModelSongClass = getMPModelSongClass();
  v6 = objc_msgSend(v3, "options");

  return (id)objc_msgSend(MPModelSongClass, "kindWithVariants:options:", v4, v6);
}

+ (id)_sanitizePlaylistEntryKind:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "kinds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_map:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(getMPModelPlaylistEntryClass(), "kindWithKinds:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
