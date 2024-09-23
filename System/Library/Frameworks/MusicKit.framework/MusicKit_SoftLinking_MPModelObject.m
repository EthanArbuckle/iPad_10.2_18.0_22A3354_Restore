@implementation MusicKit_SoftLinking_MPModelObject

- (MusicKit_SoftLinking_MPModelObject)initWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5
{
  id v8;
  id v9;
  MusicKit_SoftLinking_MPModelObject *v10;
  uint64_t v11;
  MPModelObject *underlyingModelObject;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelObject;
  v10 = -[MusicKit_SoftLinking_MPModelObject init](&v14, sel_init);
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_createUnderlyingModelObjectWithIdentifierSet:modelObjectType:storageDictionary:", v8, a4, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    underlyingModelObject = v10->_underlyingModelObject;
    v10->_underlyingModelObject = (MPModelObject *)v11;

    v10->_modelObjectType = a4;
  }

  return v10;
}

- (MusicKit_SoftLinking_MPModelObject)initWithUnderlyingModelObject:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPModelObject *v6;
  MusicKit_SoftLinking_MPModelObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelObject;
  v6 = -[MusicKit_SoftLinking_MPModelObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingModelObject, a3);

  return v7;
}

- (MPModelObject)_underlyingModelObject
{
  return self->_underlyingModelObject;
}

- (NSDictionary)storageDictionary
{
  return (NSDictionary *)-[MPModelObject valueForKey:](self->_underlyingModelObject, "valueForKey:", CFSTR("_storage"));
}

- (MusicKit_SoftLinking_MPIdentifierSet)legacyIdentifierSet
{
  return (MusicKit_SoftLinking_MPIdentifierSet *)-[MPModelObject identifiers](self->_underlyingModelObject, "identifiers");
}

- (int64_t)libraryRemovalSupportedOptions
{
  if (-[MPModelObject libraryRemovalSupportedOptions](self->_underlyingModelObject, "libraryRemovalSupportedOptions") == 2)
    return 2;
  else
    return 1;
}

- (id)underlyingObject
{
  return self->_underlyingModelObject;
}

+ (id)_createUnderlyingModelObjectWithIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 storageDictionary:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t MPModelCuratorClass;
  void *v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  switch(a4)
  {
    case 0:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelAlbumClass_softClass;
      v27 = getMPModelAlbumClass_softClass;
      if (getMPModelAlbumClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelAlbumClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelAlbumClass_block_invoke((uint64_t)&v19);
      break;
    case 1:
    case 5:
    case 6:
    case 7:
    case 22:
      MPModelCuratorClass = (uint64_t)getMPModelCuratorClass();
      goto LABEL_43;
    case 2:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelArtistClass_softClass;
      v27 = getMPModelArtistClass_softClass;
      if (getMPModelArtistClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelArtistClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelArtistClass_block_invoke((uint64_t)&v19);
      break;
    case 3:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelComposerClass_softClass;
      v27 = getMPModelComposerClass_softClass;
      if (getMPModelComposerClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelComposerClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelComposerClass_block_invoke((uint64_t)&v19);
      break;
    case 4:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelCreditsArtistClass_softClass;
      v27 = getMPModelCreditsArtistClass_softClass;
      if (getMPModelCreditsArtistClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelCreditsArtistClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelCreditsArtistClass_block_invoke((uint64_t)&v19);
      break;
    case 8:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelFileAssetClass_softClass;
      v27 = getMPModelFileAssetClass_softClass;
      if (getMPModelFileAssetClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelFileAssetClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelFileAssetClass_block_invoke((uint64_t)&v19);
      break;
    case 9:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelGenreClass_softClass;
      v27 = getMPModelGenreClass_softClass;
      if (getMPModelGenreClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelGenreClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelGenreClass_block_invoke((uint64_t)&v19);
      break;
    case 10:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelHomeSharingAssetClass_softClass;
      v27 = getMPModelHomeSharingAssetClass_softClass;
      if (getMPModelHomeSharingAssetClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelHomeSharingAssetClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelHomeSharingAssetClass_block_invoke((uint64_t)&v19);
      break;
    case 11:
    case 23:
      MPModelCuratorClass = (uint64_t)getMPModelGenericObjectClass_0();
      goto LABEL_43;
    case 12:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelLyricsClass_softClass;
      v27 = getMPModelLyricsClass_softClass;
      if (getMPModelLyricsClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelLyricsClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelLyricsClass_block_invoke((uint64_t)&v19);
      break;
    case 13:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelMovieClass_softClass;
      v27 = getMPModelMovieClass_softClass;
      if (getMPModelMovieClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelMovieClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelMovieClass_block_invoke((uint64_t)&v19);
      break;
    case 14:
    case 26:
    case 30:
    case 34:
    case 35:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelSongClass_softClass;
      v27 = getMPModelSongClass_softClass;
      if (getMPModelSongClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelSongClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelSongClass_block_invoke((uint64_t)&v19);
      break;
    case 15:
    case 19:
    case 20:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelPlaylistClass_softClass;
      v27 = getMPModelPlaylistClass_softClass;
      if (getMPModelPlaylistClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelPlaylistClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelPlaylistClass_block_invoke((uint64_t)&v19);
      break;
    case 16:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelPlaylistAuthorClass_softClass;
      v27 = getMPModelPlaylistAuthorClass_softClass;
      if (getMPModelPlaylistAuthorClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelPlaylistAuthorClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelPlaylistAuthorClass_block_invoke((uint64_t)&v19);
      break;
    case 17:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelPlaylistEntryClass_softClass_0;
      v27 = getMPModelPlaylistEntryClass_softClass_0;
      if (getMPModelPlaylistEntryClass_softClass_0)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelPlaylistEntryClass_block_invoke_0;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelPlaylistEntryClass_block_invoke_0((uint64_t)&v19);
      break;
    case 18:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelPlaylistEntryReactionClass_softClass;
      v27 = getMPModelPlaylistEntryReactionClass_softClass;
      if (getMPModelPlaylistEntryReactionClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelPlaylistEntryReactionClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelPlaylistEntryReactionClass_block_invoke((uint64_t)&v19);
      break;
    case 21:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelPlaybackPositionClass_softClass;
      v27 = getMPModelPlaybackPositionClass_softClass;
      if (getMPModelPlaybackPositionClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelPlaybackPositionClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelPlaybackPositionClass_block_invoke((uint64_t)&v19);
      break;
    case 24:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelRecordLabelClass_softClass;
      v27 = getMPModelRecordLabelClass_softClass;
      if (getMPModelRecordLabelClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelRecordLabelClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelRecordLabelClass_block_invoke((uint64_t)&v19);
      break;
    case 25:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelSocialPersonClass_softClass;
      v27 = getMPModelSocialPersonClass_softClass;
      if (getMPModelSocialPersonClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelSocialPersonClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelSocialPersonClass_block_invoke((uint64_t)&v19);
      break;
    case 27:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelRadioStationClass_softClass;
      v27 = getMPModelRadioStationClass_softClass;
      if (getMPModelRadioStationClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelRadioStationClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelRadioStationClass_block_invoke((uint64_t)&v19);
      break;
    case 28:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelStoreAssetClass_softClass;
      v27 = getMPModelStoreAssetClass_softClass;
      if (getMPModelStoreAssetClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelStoreAssetClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelStoreAssetClass_block_invoke((uint64_t)&v19);
      break;
    case 29:
      MPModelCuratorClass = objc_opt_class();
LABEL_43:
      v12 = (objc_class *)MPModelCuratorClass;
      goto LABEL_52;
    case 31:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelTVEpisodeClass_softClass;
      v27 = getMPModelTVEpisodeClass_softClass;
      if (getMPModelTVEpisodeClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelTVEpisodeClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelTVEpisodeClass_block_invoke((uint64_t)&v19);
      break;
    case 32:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelTVSeasonClass_softClass;
      v27 = getMPModelTVSeasonClass_softClass;
      if (getMPModelTVSeasonClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelTVSeasonClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelTVSeasonClass_block_invoke((uint64_t)&v19);
      break;
    case 33:
      v24 = 0;
      v25 = &v24;
      v26 = 0x2050000000;
      v11 = (void *)getMPModelTVShowClass_softClass;
      v27 = getMPModelTVShowClass_softClass;
      if (getMPModelTVShowClass_softClass)
        goto LABEL_51;
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getMPModelTVShowClass_block_invoke;
      v22 = &unk_24CD1CC68;
      v23 = &v24;
      __getMPModelTVShowClass_block_invoke((uint64_t)&v19);
      break;
    default:
      v12 = 0;
      goto LABEL_52;
  }
  v11 = (void *)v25[3];
LABEL_51:
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v24, 8);
LABEL_52:
  v13 = [v12 alloc];
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __118__MusicKit_SoftLinking_MPModelObject__createUnderlyingModelObjectWithIdentifierSet_modelObjectType_storageDictionary___block_invoke;
  v17[3] = &unk_24CD1D400;
  v18 = v8;
  v14 = v8;
  v15 = (void *)objc_msgSend(v13, "initWithIdentifiers:block:", v7, v17);

  return v15;
}

+ (int64_t)keepLocalEnabledStateForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5)
    return a3 + 1;
  else
    return 1;
}

+ (int64_t)rawValueForKeepLocalEnabledState:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
    return 0;
  else
    return a3 - 1;
}

+ (int64_t)keepLocalManagedStatusForRawValue:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 6)
    return 0;
  else
    return qword_212061080[a3 + 1];
}

+ (int64_t)rawValueForKeepLocalManagedStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_2120610B8[a3 - 1];
}

+ (unint64_t)keepLocalManagedStatusReasonsForRawValue:(int64_t)a3
{
  return a3 & 0x7F;
}

+ (int64_t)rawValueForKeepLocalManagedStatusReasons:(unint64_t)a3
{
  return a3 & 0x7F;
}

- (BOOL)isEqual:(id)a3
{
  MusicKit_SoftLinking_MPModelObject *v4;
  MPModelObject *underlyingModelObject;
  void *v6;
  char v7;

  v4 = (MusicKit_SoftLinking_MPModelObject *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[MusicKit_SoftLinking_MPModelObject isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    underlyingModelObject = self->_underlyingModelObject;
    -[MusicKit_SoftLinking_MPModelObject _underlyingModelObject](v4, "_underlyingModelObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPModelObject isEqual:](underlyingModelObject, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[MPModelObject hash](self->_underlyingModelObject, "hash");
}

+ (id)archivedDataWithUnderlyingModelObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)unarchiveUnderlyingModelObjectWithData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD1620];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)getMPModelObjectClass_softClass_1;
  v15 = getMPModelObjectClass_softClass_1;
  if (!getMPModelObjectClass_softClass_1)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getMPModelObjectClass_block_invoke_1;
    v11[3] = &unk_24CD1CC68;
    v11[4] = &v12;
    __getMPModelObjectClass_block_invoke_1((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v8, v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)modelObjectType
{
  return self->_modelObjectType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingModelObject, 0);
}

@end
