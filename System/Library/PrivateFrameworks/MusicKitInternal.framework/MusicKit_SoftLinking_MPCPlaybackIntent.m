@implementation MusicKit_SoftLinking_MPCPlaybackIntent

- (MusicKit_SoftLinking_MPCPlaybackIntent)init
{
  MusicKit_SoftLinking_MPCPlaybackIntent *v2;
  id v3;
  MPCPlaybackIntent *underlyingPlaybackIntent;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v2 = -[MusicKit_SoftLinking_MPCPlaybackIntent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init((Class)getMPCPlaybackIntentClass());
    objc_msgSend(v3, "setTracklistSource:", 3);
    underlyingPlaybackIntent = v2->_underlyingPlaybackIntent;
    v2->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v3;

  }
  return v2;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStoreIDs:(id)a3 startIdentifierSet:(id)a4
{
  id v6;
  id v7;
  MusicKit_SoftLinking_MPCPlaybackIntent *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  MPCPlaybackIntent *v15;
  MPCPlaybackIntent *underlyingPlaybackIntent;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v8 = -[MusicKit_SoftLinking_MPCPlaybackIntent init](&v18, sel_init);
  if (v8)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v9 = (void *)getMPCModelStorePlaybackItemsRequestClass_softClass_0;
    v27 = getMPCModelStorePlaybackItemsRequestClass_softClass_0;
    if (!getMPCModelStorePlaybackItemsRequestClass_softClass_0)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getMPCModelStorePlaybackItemsRequestClass_block_invoke_0;
      v22 = &unk_1E9C05688;
      v23 = &v24;
      __getMPCModelStorePlaybackItemsRequestClass_block_invoke_0((uint64_t)&v19);
      v9 = (void *)v25[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v24, 8);
    v11 = objc_alloc_init(v10);
    objc_msgSend(v11, "setStoreIDs:", v6);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v12 = (void *)getMPCModelPlaybackIntentTracklistTokenClass_softClass;
    v27 = getMPCModelPlaybackIntentTracklistTokenClass_softClass;
    if (!getMPCModelPlaybackIntentTracklistTokenClass_softClass)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke;
      v22 = &unk_1E9C05688;
      v23 = &v24;
      __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke((uint64_t)&v19);
      v12 = (void *)v25[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v24, 8);
    v14 = objc_alloc_init(v13);
    objc_msgSend(v14, "setRequest:", v11);
    if (v7)
      objc_msgSend(v14, "setStartItemIdentifiers:", v7);
    v15 = (MPCPlaybackIntent *)objc_alloc_init((Class)getMPCPlaybackIntentClass());
    underlyingPlaybackIntent = v8->_underlyingPlaybackIntent;
    v8->_underlyingPlaybackIntent = v15;

    -[MPCPlaybackIntent setTracklistToken:](v8->_underlyingPlaybackIntent, "setTracklistToken:", v14);
    -[MPCPlaybackIntent setTracklistSource:](v8->_underlyingPlaybackIntent, "setTracklistSource:", 3);

  }
  return v8;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyLibraryRequest:(id)a3 allowedIdentifiers:(id)a4 startIdentifierSet:(id)a5 onlyLibraryContent:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  MusicKit_SoftLinking_MPCPlaybackIntent *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  MPCPlaybackIntent *underlyingPlaybackIntent;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v13 = -[MusicKit_SoftLinking_MPCPlaybackIntent init](&v23, sel_init);
  if (v13)
  {
    v14 = v10;
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v14, "allowedItemIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (!v16)
      {
        objc_msgSend(v11, "msv_map:", &__block_literal_global_13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAllowedItemIdentifiers:", v17);

      }
    }
    objc_msgSend(v14, "allowedItemIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 >= 2)
    {
      objc_msgSend(v14, "setItemSortDescriptors:", 0);
      objc_msgSend(v14, "setSortUsingAllowedItemIdentifiers:", 1);
    }
    if (!a6)
      objc_msgSend(v14, "setFilteringOptions:", 4);
    objc_msgSend(v14, "playbackIntentWithStartItemIdentifiers:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    underlyingPlaybackIntent = v13->_underlyingPlaybackIntent;
    v13->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v20;

  }
  return v13;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithLegacyModelStationSeeding:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPCPlaybackIntent *v5;
  void *v6;
  id v7;
  uint64_t v8;
  MPCPlaybackIntent *v9;
  MPCPlaybackIntent *underlyingPlaybackIntent;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v5 = -[MusicKit_SoftLinking_MPCPlaybackIntent init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_underlyingModelObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getMPModelAlbumClass_0();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromAlbum:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getMPModelArtistClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromArtist:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        getMPModelSongClass();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v6;
          objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromSong:", v7);
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          getMPModelRadioStationClass();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_11:

            goto LABEL_12;
          }
          v7 = v6;
          objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentWithStation:", v7);
          v8 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v9 = (MPCPlaybackIntent *)v8;

    underlyingPlaybackIntent = v5->_underlyingPlaybackIntent;
    v5->_underlyingPlaybackIntent = v9;

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (MusicKit_SoftLinking_MPCPlaybackIntent)initWithStationSeedingIdentifierSet:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPCPlaybackIntent *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  MPCPlaybackIntent *underlyingPlaybackIntent;
  MusicKit_SoftLinking_MPCPlaybackIntent *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MusicKit_SoftLinking_MPCPlaybackIntent;
  v5 = -[MusicKit_SoftLinking_MPCPlaybackIntent init](&v36, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "modelKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v9 = (void *)getMPModelAlbumKindClass_softClass_0;
    v45 = getMPModelAlbumKindClass_softClass_0;
    if (!getMPModelAlbumKindClass_softClass_0)
    {
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __getMPModelAlbumKindClass_block_invoke_0;
      v40 = &unk_1E9C05688;
      v41 = &v42;
      __getMPModelAlbumKindClass_block_invoke_0((uint64_t)&v37);
      v9 = (void *)v43[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v10, "identityKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqual:", v11);

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc((Class)getMPModelAlbumClass_0()), "initWithIdentifiers:block:", v6, &__block_literal_global_5);
      objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromAlbum:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "modelKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identityKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v17 = (void *)getMPModelArtistKindClass_softClass;
      v45 = getMPModelArtistKindClass_softClass;
      if (!getMPModelArtistKindClass_softClass)
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = __getMPModelArtistKindClass_block_invoke;
        v40 = &unk_1E9C05688;
        v41 = &v42;
        __getMPModelArtistKindClass_block_invoke((uint64_t)&v37);
        v17 = (void *)v43[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v42, 8);
      objc_msgSend(v18, "identityKind");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "isEqual:", v19);

      if (v20)
      {
        v13 = (void *)objc_msgSend(objc_alloc((Class)getMPModelArtistClass()), "initWithIdentifiers:block:", v6, &__block_literal_global_6_0);
        objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromArtist:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "modelKind");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identityKind");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v23 = (void *)getMPModelSongKindClass_softClass;
        v45 = getMPModelSongKindClass_softClass;
        if (!getMPModelSongKindClass_softClass)
        {
          v37 = MEMORY[0x1E0C809B0];
          v38 = 3221225472;
          v39 = __getMPModelSongKindClass_block_invoke;
          v40 = &unk_1E9C05688;
          v41 = &v42;
          __getMPModelSongKindClass_block_invoke((uint64_t)&v37);
          v23 = (void *)v43[3];
        }
        v24 = objc_retainAutorelease(v23);
        _Block_object_dispose(&v42, 8);
        objc_msgSend(v24, "identityKind");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "isEqual:", v25);

        if (v26)
        {
          v13 = (void *)objc_msgSend(objc_alloc((Class)getMPModelSongClass()), "initWithIdentifiers:block:", v6, &__block_literal_global_7_0);
          objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentFromSong:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "modelKind");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identityKind");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          v43 = &v42;
          v44 = 0x2050000000;
          v29 = (void *)getMPModelRadioStationKindClass_softClass;
          v45 = getMPModelRadioStationKindClass_softClass;
          if (!getMPModelRadioStationKindClass_softClass)
          {
            v37 = MEMORY[0x1E0C809B0];
            v38 = 3221225472;
            v39 = __getMPModelRadioStationKindClass_block_invoke;
            v40 = &unk_1E9C05688;
            v41 = &v42;
            __getMPModelRadioStationKindClass_block_invoke((uint64_t)&v37);
            v29 = (void *)v43[3];
          }
          v30 = objc_retainAutorelease(v29);
          _Block_object_dispose(&v42, 8);
          objc_msgSend(v30, "identityKind");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v28, "isEqual:", v31);

          if (!v32)
          {

            v34 = 0;
            goto LABEL_20;
          }
          v13 = (void *)objc_msgSend(objc_alloc((Class)getMPModelRadioStationClass()), "initWithIdentifiers:block:", v6, &__block_literal_global_8);
          objc_msgSend(getMPCPlaybackIntentClass(), "radioPlaybackIntentWithStation:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    underlyingPlaybackIntent = v5->_underlyingPlaybackIntent;
    v5->_underlyingPlaybackIntent = (MPCPlaybackIntent *)v14;

  }
  v34 = v5;
LABEL_20:

  return v34;
}

+ (MusicKit_SoftLinking_MPCPlaybackIntent)emptyPlaybackIntent
{
  return objc_alloc_init(MusicKit_SoftLinking_MPCPlaybackIntent);
}

- (id)rawPlaybackIntent
{
  return self->_underlyingPlaybackIntent;
}

- (id)_underlyingPlaybackIntent
{
  return self->_underlyingPlaybackIntent;
}

- (NSString)playActivityFeatureName
{
  return (NSString *)-[MPCPlaybackIntent playActivityFeatureName](self->_underlyingPlaybackIntent, "playActivityFeatureName");
}

- (void)setPlayActivityFeatureName:(id)a3
{
  -[MPCPlaybackIntent setPlayActivityFeatureName:](self->_underlyingPlaybackIntent, "setPlayActivityFeatureName:", a3);
}

- (NSData)playActivityRecommendationData
{
  return (NSData *)-[MPCPlaybackIntent playActivityRecommendationData](self->_underlyingPlaybackIntent, "playActivityRecommendationData");
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  -[MPCPlaybackIntent setPlayActivityRecommendationData:](self->_underlyingPlaybackIntent, "setPlayActivityRecommendationData:", a3);
}

- (int64_t)repeatMode
{
  unint64_t v2;

  v2 = -[MPCPlaybackIntent repeatMode](self->_underlyingPlaybackIntent, "repeatMode");
  if (v2 > 2)
    return -1;
  else
    return qword_1D76A10C0[v2];
}

- (void)setRepeatMode:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)a3 > 2)
    v3 = -1;
  else
    v3 = qword_1D76A10C0[a3];
  -[MPCPlaybackIntent setRepeatMode:](self->_underlyingPlaybackIntent, "setRepeatMode:", v3);
}

- (int64_t)shuffleMode
{
  int64_t result;

  result = -[MPCPlaybackIntent shuffleMode](self->_underlyingPlaybackIntent, "shuffleMode");
  if ((unint64_t)result >= 3)
    return -1;
  return result;
}

- (void)setShuffleMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    a3 = -1;
  -[MPCPlaybackIntent setShuffleMode:](self->_underlyingPlaybackIntent, "setShuffleMode:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaybackIntent, 0);
}

@end
