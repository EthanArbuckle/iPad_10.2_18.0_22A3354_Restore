@implementation MPCModelGenericAVItem

- (unint64_t)artistPersistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "show");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v10 = *MEMORY[0x24BDDBA98];
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "persistentID");

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v10;
}

- (unint64_t)albumPersistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v10 = *MEMORY[0x24BDDBA98];
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "album");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "persistentID");

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v10;
}

- (unint64_t)albumArtistPersistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "album");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "library");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "persistentID");

  }
  else
  {
    v9 = *MEMORY[0x24BDDBA98];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v9;
}

- (id)artworkCatalogBlock
{
  void *v3;
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v5 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v5)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v7 = (void *)v6;
LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke;
  v12[3] = &unk_24CAB15F8;
  v13 = v7;
  v14 = v3;
  v8 = v3;
  v9 = v7;
  v10 = _Block_copy(v12);

  return v10;
}

- (id)_modelPlaybackPosition
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "playbackPosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem mainTitle](self, "mainTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)mainTitle
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (BOOL)isAlwaysLive
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDDC928];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __37__MPCModelGenericAVItem_isAlwaysLive__block_invoke;
    v11[3] = &unk_24CABAB68;
    v13 = &v14;
    v12 = v3;
    objc_msgSend(v5, "performWithoutEnforcement:", v11);

  }
  if (-[MPCModelGenericAVItem isRadioStreamPlayback](self, "isRadioStreamPlayback"))
    v6 = *((_BYTE *)v15 + 24) == 0;
  else
    v6 = 0;
  if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPCModelGenericAVItem playerItem](self, "playerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "status") == 1)
    {
      -[MPCModelGenericAVItem _playerItemDurationIfAvailable](self, "_playerItemDurationIfAvailable");
      v6 = (v10 & 0x1D) != 1;
    }

  }
  _Block_object_dispose(&v14, 8);
  return v6;
}

- (id)_radioStation
{
  void *v2;
  void *v3;

  -[MPCModelGenericAVItem modelPlayEvent](self, "modelPlayEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "itemType") == 4)
  {
    objc_msgSend(v2, "radioStation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isRadioStreamPlayback
{
  return self->_radioStreamPlayback;
}

- (id)modelGenericObject
{
  os_unfair_lock_s *p_genericObjectLock;
  MPModelGenericObject *v4;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = self->_metadataGenericObject;
  os_unfair_lock_unlock(p_genericObjectLock);
  return v4;
}

- (void)setSiriInitiated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 896);
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  self->_prioritizeStartupOverQuality = a3;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void)setAssetCacheProvider:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheProvider, a3);
}

- (MPCModelGenericAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MPCModelGenericAVItem *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *accessQueue;
  uint64_t v18;
  MPModelGenericObject *flattenedGenericObject;
  uint64_t v20;
  MPModelGenericObject *flattenedMetadataGenericObject;
  uint64_t v22;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  uint64_t v24;
  ICStoreRequestContext *storeRequestContext;
  ICContentKeySession *contentKeySession;
  void *v27;
  uint64_t v28;
  void *v29;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MPCModelGenericAVItem;
  v15 = -[MPCModelGenericAVItem init](&v31, sel_init);
  if (v15)
  {
    v16 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v15->_accessQueue;
    v15->_accessQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_genericObject, a3);
    v15->_genericObjectLock._os_unfair_lock_opaque = 0;
    -[MPModelGenericObject flattenedGenericObject](v15->_genericObject, "flattenedGenericObject");
    v18 = objc_claimAutoreleasedReturnValue();
    flattenedGenericObject = v15->_flattenedGenericObject;
    v15->_flattenedGenericObject = (MPModelGenericObject *)v18;

    objc_storeStrong((id *)&v15->_metadataGenericObject, v15->_genericObject);
    -[MPModelGenericObject flattenedGenericObject](v15->_metadataGenericObject, "flattenedGenericObject");
    v20 = objc_claimAutoreleasedReturnValue();
    flattenedMetadataGenericObject = v15->_flattenedMetadataGenericObject;
    v15->_flattenedMetadataGenericObject = (MPModelGenericObject *)v20;

    v22 = objc_msgSend(v13, "copy");
    playbackRequestEnvironment = v15->_playbackRequestEnvironment;
    v15->_playbackRequestEnvironment = (MPCPlaybackRequestEnvironment *)v22;

    -[MPCPlaybackRequestEnvironment _createStoreRequestContext](v15->_playbackRequestEnvironment, "_createStoreRequestContext");
    v24 = objc_claimAutoreleasedReturnValue();
    storeRequestContext = v15->_storeRequestContext;
    v15->_storeRequestContext = (ICStoreRequestContext *)v24;

    objc_storeStrong((id *)&v15->_itemProperties, a4);
    contentKeySession = v15->_contentKeySession;
    v15->_contentKeySession = 0;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x24BDDBAA0];
    objc_msgSend(MEMORY[0x24BDDC720], "sharedController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v15, sel__contentTasteControllerDidChangeNotification_, v28, v29);

    v15->_didSetupContentTasteObservation = 1;
    objc_msgSend(v27, "addObserver:selector:name:object:", v15, sel__ageVerificationStateDidChangeNotification_, *MEMORY[0x24BEC84C8], 0);
    objc_storeStrong((id *)&v15->_identityPropertySet, a6);

  }
  return v15;
}

- (unint64_t)persistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  unint64_t v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)storeAccountID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[MPCModelGenericAVItemUserIdentityPropertySet delegatedIdentityProperties](self->_identityPropertySet, "delegatedIdentityProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MPCModelGenericAVItemUserIdentityPropertySet identityProperties](self->_identityPropertySet, "identityProperties");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)storeFrontIdentifier
{
  void *v2;
  void *v3;

  -[MPCModelGenericAVItemUserIdentityPropertySet identityProperties](self->_identityPropertySet, "identityProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storefrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)genre
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genre");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (unint64_t)genrePersistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genre");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "persistentID");

  }
  else
  {
    v8 = *MEMORY[0x24BDDBA98];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (id)artist
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "show");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (id)explicitBadge
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  if (!-[MPCModelGenericAVItem isExplicitTrack](self, "isExplicitTrack"))
    return 0;
  -[ICStoreRequestContext identity](self->_storeRequestContext, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ageVerificationStateForUserIdentity:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "treatment");
  v11 = CFSTR("🅴");
  if (v10)
    v11 = 0;
  if (v10 == 1)
    v6 = CFSTR("⓳");
  else
    v6 = v11;

  return (id)v6;
}

- (BOOL)isExplicitTrack
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  char IsRestricted;
  BOOL v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = MPModelMovieIsRestricted();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = MPModelTVEpisodeIsRestricted();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = objc_msgSend(v5, "isExplicitSong");
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v7 = IsRestricted;

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (BOOL)isArtistUploadedContent
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  char v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isArtistUploadedContent");

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (id)playbackInfo
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  MPCModelGenericAVItem *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v31.receiver = self;
  v31.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem playbackInfo](&v31, sel_playbackInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem _startTime](self, "_startTime");
  v6 = v5;
  -[MPCModelGenericAVItem _stopTime](self, "_stopTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDDB9D0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDDB9D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = *MEMORY[0x24BDDB9D8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDDB9D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = 1;
  else
    v12 = v6 <= 0.00000011920929;
  if (!v12)
  {
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "engineID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v15;
      v34 = 2114;
      v35 = self;
      v36 = 2048;
      v37 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using start time: %f", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, v10);
    goto LABEL_9;
  }
LABEL_10:
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v17 = v16;
    if (v16 > 0.00000011920929)
    {
      -[MPCModelGenericAVItem durationFromExternalMetadata](self, "durationFromExternalMetadata");
      if (v17 < v18)
      {
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "engineID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v33 = v21;
          v34 = 2114;
          v35 = self;
          v36 = 2048;
          v37 = v6;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using stop time: %f", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x24BDDB9C0]);

      }
    }
  }
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDB9C8]);
  objc_msgSend(v4, "objectForKey:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    goto LABEL_17;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDDB9D8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    if (-[MPCModelGenericAVItem usesBookmarking](self, "usesBookmarking"))
    {
      -[MPCModelGenericAVItem _bookmarkTime](self, "_bookmarkTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v23, "doubleValue");
    if (v23)
    {
      v27 = v26;
      if (v26 > 0.00000011920929)
      {
        objc_msgSend(v3, "setObject:forKey:", v23, v8);
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v28, "engineID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v33 = v30;
          v34 = 2114;
          v35 = self;
          v36 = 2048;
          v37 = v27;
          _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using bookmark start time: %f", buf, 0x20u);

        }
      }
    }
LABEL_17:

  }
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (BOOL)usesBookmarking
{
  void *v3;
  char v4;

  if (self->_radioPlayback)
    return 0;
  -[MPCModelGenericAVItem _modelPlaybackPosition](self, "_modelPlaybackPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldRememberBookmarkTime");

  return v4;
}

- (id)_stopTime
{
  void *v2;
  void *v3;

  -[MPCModelGenericAVItem _modelPlaybackPosition](self, "_modelPlaybackPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)_startTime
{
  void *v2;
  double v3;
  double v4;

  -[MPCModelGenericAVItem _modelPlaybackPosition](self, "_modelPlaybackPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTime");
  v4 = v3;

  return v4;
}

- (BOOL)supportsVocalAttenuation
{
  MPModelGenericObject *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  MPCModelGenericAVItem *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!MSVDeviceSupportsVocalAttenuation())
    return 0;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v3 = self->_flattenedGenericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](v3, "type") == 1
    && !-[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive")
    && !-[MPCModelGenericAVItem isRadioStreamPlayback](self, "isRadioStreamPlayback")
    && !-[MPCModelGenericAVItem hasVideo](self, "hasVideo"))
  {
    -[MPModelGenericObject song](v3, "song");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "supportsExtendedLyricsAttribute") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "shouldBypassVocalAttenuationSupportFlag") & 1) != 0)
      {
        objc_msgSend(v6, "lyrics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasTimeSyncedLyrics");

        if (v9)
        {
          _MPCLogCategoryPlayback();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            v12 = 138543618;
            v13 = self;
            v14 = 1024;
            v15 = objc_msgSend(v6, "supportsExtendedLyricsAttribute");
            _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_INFO, "%{public}@ - [AP] - Overriding vocal attenuation support: %{BOOL}u -> YES [bypassing server flag for time synced lyrics song]", (uint8_t *)&v12, 0x12u);
          }

          v4 = 1;
LABEL_20:

          goto LABEL_7;
        }
      }
      else
      {

      }
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 1024;
      v15 = objc_msgSend(v6, "supportsExtendedLyricsAttribute");
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_INFO, "%{public}@ - [AP] - Supports vocal attenuation: %{BOOL}u", (uint8_t *)&v12, 0x12u);
    }

    v4 = objc_msgSend(v6, "supportsExtendedLyricsAttribute");
    goto LABEL_20;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)hasVideo
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  MPModelGenericObject *flattenedGenericObject;
  void *v6;
  char v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  flattenedGenericObject = self->_flattenedGenericObject;
  if (v4 == 1)
  {
    -[MPModelGenericObject song](flattenedGenericObject, "song");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasVideo");

  }
  else
  {
    v7 = -[MPModelGenericObject type](flattenedGenericObject, "type") == 6
      || -[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 9;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (unint64_t)mediaType
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  int v6;
  unint64_t v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      v7 = 256;
      break;
    case 6:
      v7 = 512;
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasVideo");

      if (v6)
        v7 = 2048;
      else
        v7 = 1;
      break;
    default:
      v7 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (int64_t)type
{
  int64_t v3;
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  v3 = -[MPCModelGenericAVItem type](&v8, sel_type);
  if (!v3)
  {
    p_genericObjectLock = &self->_genericObjectLock;
    os_unfair_lock_lock(&self->_genericObjectLock);
    v5 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
    if (v5 == 9 || v5 == 6)
    {
      v3 = 2;
    }
    else if (v5 == 1)
    {
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "hasVideo"))
        v3 = 2;
      else
        v3 = 1;

    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_unlock(p_genericObjectLock);
  }
  return v3;
}

- (NSData)trackInfoData
{
  NSDictionary *trackInfo;
  void *v4;
  id v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSDictionary *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  MPCModelGenericAVItem *v16;
  __int16 v17;
  NSDictionary *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  trackInfo = self->_trackInfo;
  if (trackInfo)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", trackInfo, 100, 0, &v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "engineID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self->_trackInfo;
        *(_DWORD *)buf = 138544130;
        v14 = v9;
        v15 = 2114;
        v16 = self;
        v17 = 2114;
        v18 = v10;
        v19 = 2114;
        v20 = v5;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ - Unable to report track information [serialization error] - track-info=%{public}@ - error=%{public}@", buf, 0x2Au);

      }
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSData *)v4;
}

- (BOOL)isLikedStateEnabled
{
  return 1;
}

- (BOOL)prefersSeekOverSkip
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDDC928];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__MPCModelGenericAVItem_prefersSeekOverSkip__block_invoke;
    v8[3] = &unk_24CABAB68;
    v10 = &v11;
    v9 = v3;
    objc_msgSend(v5, "performWithoutEnforcement:", v8);

  }
  if (*((_BYTE *)v12 + 24))
    v6 = 1;
  else
    v6 = -[MPCModelGenericAVItem usesBookmarking](self, "usesBookmarking");

  _Block_object_dispose(&v11, 8);
  return v6;
}

id __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__755;
  v13 = __Block_byref_object_dispose__756;
  objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)v10[5];
  if (!v2)
  {
    v3 = (void *)MEMORY[0x24BDDC928];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke_2;
    v6[3] = &unk_24CABAB68;
    v8 = &v9;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v3, "performWithoutEnforcement:", v6);

    v2 = (void *)v10[5];
  }
  v4 = v2;
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)mediaItem
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_genericObjectLock;

  v3 = -[MPCModelGenericAVItem persistentID](self, "persistentID");
  if (v3)
  {
    v4 = v3;
    -[MPCModelGenericAVItem mediaLibrary](self, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemWithPersistentID:verifyExistence:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    p_genericObjectLock = &self->_genericObjectLock;
    os_unfair_lock_lock(&self->_genericObjectLock);
    objc_msgSend(MEMORY[0x24BDDC7B8], "itemFromModelObject:", self->_metadataGenericObject);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_genericObjectLock);
  }
  return v6;
}

- (MPMediaLibrary)mediaLibrary
{
  void *v3;
  void *v4;
  MPMediaLibrary *mediaLibrary;
  MPMediaLibrary *v6;
  MPMediaLibrary *v7;

  -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
  {
    v6 = mediaLibrary;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibraryWithUserIdentity:", v4);
    v6 = (MPMediaLibrary *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_storeRequestContext
{
  ICStoreRequestContext *storeRequestContext;
  ICStoreRequestContext *v3;
  id v4;
  void *v5;

  storeRequestContext = self->_storeRequestContext;
  if (storeRequestContext)
  {
    v3 = storeRequestContext;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BEC89F8]);
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (ICStoreRequestContext *)objc_msgSend(v4, "initWithIdentity:", v5);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ICMusicSubscriptionLeaseSession *v9;
  dispatch_time_t v10;
  ICMusicSubscriptionLeaseSession *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  ICURLRequest *hlsDownloadURLRequest;
  void *v17;
  NSURL *tempFileURLToCleanup;
  char v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSURL *v24;
  objc_super v25;
  id v26;
  _QWORD block[4];
  ICMusicSubscriptionLeaseSession *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  MPCModelGenericAVItem *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_timedMetadataResponse)
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDC3F8]);
  if (self->_didSetupContentTasteObservation)
  {
    v5 = *MEMORY[0x24BDDBAA0];
    objc_msgSend(MEMORY[0x24BDDC720], "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

  }
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEC84C8], 0);
  if (-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset"))
  {
    v7 = *MEMORY[0x24BDDC540];
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, v7, v8);

  }
  if (self->_subscriptionLeaseSession)
  {
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEC85E0]);
    if (self->_shouldAutomaticallyRefreshSubscriptionLease)
    {
      v9 = self->_subscriptionLeaseSession;
      v10 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__MPCModelGenericAVItem_dealloc__block_invoke;
      block[3] = &unk_24CABA2D0;
      v28 = v9;
      v11 = v9;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

    }
  }
  if (self->_suzeLeaseSession)
  {
    if (self->_isAutomaticallyRefreshingSuzeLeaseSession)
    {
      self->_isAutomaticallyRefreshingSuzeLeaseSession = 0;
      -[MPCSuzeLeaseSession endAutomaticallyRefreshingLease](self->_suzeLeaseSession, "endAutomaticallyRefreshingLease");
    }
    +[MPCSuzeLeaseSessionController sharedController](MPCSuzeLeaseSessionController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification"), v12);
    objc_msgSend(v12, "stopLeaseSession:completion:", self->_suzeLeaseSession, 0);

  }
  if (self->_hlsDownloadURLSession && self->_hlsDownloadURLRequest)
  {
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "engineID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      hlsDownloadURLRequest = self->_hlsDownloadURLRequest;
      *(_DWORD *)buf = 138543874;
      v30 = v15;
      v31 = 2114;
      v32 = self;
      v33 = 2114;
      v34 = hlsDownloadURLRequest;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Cancelling download request [dealloc] - request:%{public}@", buf, 0x20u);

    }
    -[ICAVAssetDownloadURLSession cancelRequest:](self->_hlsDownloadURLSession, "cancelRequest:", self->_hlsDownloadURLRequest);
  }
  if (self->_tempFileURLToCleanup)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    tempFileURLToCleanup = self->_tempFileURLToCleanup;
    v26 = 0;
    v19 = objc_msgSend(v17, "removeItemAtURL:error:", tempFileURLToCleanup, &v26);
    v20 = v26;

    if ((v19 & 1) == 0)
    {
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v21, "engineID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = self->_tempFileURLToCleanup;
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        v31 = 2114;
        v32 = self;
        v33 = 2114;
        v34 = v24;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to clean up downloaded asset %{public}@", buf, 0x20u);

      }
    }

  }
  v25.receiver = self;
  v25.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem dealloc](&v25, sel_dealloc);
}

- (BOOL)isHLSAsset
{
  return self->_hlsAsset;
}

- (BOOL)isRadioPlayback
{
  return self->_radioPlayback;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (void)setEventStream:(id)a3
{
  objc_storeWeak((id *)&self->_eventStream, a3);
}

- (BOOL)shouldShowComposer
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  char v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldShowComposer");

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (id)composer
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (unint64_t)composerPersistentID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "persistentID");

  }
  else
  {
    v8 = *MEMORY[0x24BDDBA98];
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (BOOL)shouldReportPlayEventsToStore
{
  char v2;
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (self->_radioPlayback)
    return 1;
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v5 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  switch(v5)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedGenericObject, "movie");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedGenericObject, "tvEpisode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      v9 = 0;
      goto LABEL_11;
  }
  v7 = v6;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v8, "personalizedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cloudID");

  if (v11)
    v2 = objc_msgSend(v9, "shouldReportPlayEvents");
  else
    v2 = objc_msgSend(v9, "endpointType") == 3;

  return v2;
}

- (id)containerUniqueID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_genericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (id)databaseID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)cloudAlbumID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personalizedStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudAlbumID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v9;
}

- (unint64_t)cloudID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  unint64_t v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cloudID");

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (BOOL)hasTimeSyncedLyrics
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  char v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lyrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasTimeSyncedLyrics");

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (int64_t)lyricsAdamID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lyricsAdamID");

  if (-[MPCModelGenericAVItem hasStoreLyrics](self, "hasStoreLyrics"))
  {
    if (!v9)
    {
      v9 = -[MPCModelGenericAVItem reportingAdamID](self, "reportingAdamID");
      if (!v9)
        v9 = -[MPCModelGenericAVItem storeSubscriptionAdamID](self, "storeSubscriptionAdamID");
    }
  }

  return v9;
}

- (BOOL)hasStoreLyrics
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  char v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lyrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasStoreLyrics");

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)libraryLyrics
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lyrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (id)cloudUniversalLibraryID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalCloudLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (int64_t)reportingAdamID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "reportingAdamID");

  return v9;
}

- (int64_t)storeAlbumArtistID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "album");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "adamID");

  return v9;
}

- (int64_t)albumStoreID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "album");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v8, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "adamID");

  if (!v10)
  {
    objc_msgSend(v8, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "purchasedAdamID");

    if (!v10)
    {
      objc_msgSend(v8, "universalStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "subscriptionAdamID");

    }
  }

  return v10;
}

- (int64_t)storeSubscriptionAdamID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "subscriptionAdamID");

  return v9;
}

- (int64_t)storePurchasedAdamID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  int64_t v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "purchasedAdamID");

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (int64_t)storeItemInt64ID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v7, "universalStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "adamID");

  if (!v9)
  {
    objc_msgSend(v7, "universalStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "purchasedAdamID");

    if (!v9)
    {
      objc_msgSend(v7, "universalStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "subscriptionAdamID");

    }
  }

  return v9;
}

- (int64_t)artistStoreID
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "show");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v8, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "adamID");

  if (!v10)
  {
    objc_msgSend(v8, "universalStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "purchasedAdamID");

    if (!v10)
    {
      objc_msgSend(v8, "universalStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "subscriptionAdamID");

    }
  }

  return v10;
}

- (unint64_t)albumTrackNumber
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  unint64_t v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "trackNumber");

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (unint64_t)albumTrackCount
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  unint64_t v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "trackCount");

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (int64_t)albumYear
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  int64_t v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "album");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "year");

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (double)durationFromExternalMetadata
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 9)
  {
    -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = 0.0;
  if (v4 == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = v6;
    objc_msgSend(v6, "duration");
    v5 = v8;

  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_audioAssetTypeSelector, 0);
  objc_storeStrong((id *)&self->_previousQueueItemID, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_availableSortedFormats, 0);
  objc_storeStrong((id *)&self->_alternateFormats, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong((id *)&self->_siriInitiated, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_jingleTimedMetadata, 0);
  objc_storeStrong((id *)&self->_genericObject, 0);
  objc_storeStrong((id *)&self->_assetCacheProvider, 0);
  objc_storeStrong((id *)&self->_preferredAudioAssetTypeSelection, 0);
  objc_storeStrong((id *)&self->_audioFormatsDictionary, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_deferredLeaseAcquisitionTask, 0);
  objc_storeStrong((id *)&self->_tempFileURLToCleanup, 0);
  objc_storeStrong((id *)&self->_hlsDownloadURLRequest, 0);
  objc_storeStrong((id *)&self->_hlsDownloadURLSession, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_streamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_storeRequestContext, 0);
  objc_storeStrong((id *)&self->_hlsStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_timedMetadataOperationQueue, 0);
  objc_storeStrong((id *)&self->_timedMetadataResponse, 0);
  objc_storeStrong((id *)&self->_timedMetadataRequest, 0);
  objc_storeStrong((id *)&self->_identityPropertiesLoader, 0);
  objc_storeStrong((id *)&self->_itemProperties, 0);
  objc_storeStrong((id *)&self->_metadataGenericObject, 0);
  objc_storeStrong((id *)&self->_flattenedMetadataGenericObject, 0);
  objc_storeStrong((id *)&self->_flattenedGenericObject, 0);
  objc_storeStrong((id *)&self->_currentGlobalTimedMetadataGroups, 0);
  objc_storeStrong(&self->_firstBecomeActivePlayerItemBlock, 0);
  objc_storeStrong((id *)&self->_suzeLeaseSession, 0);
  objc_storeStrong((id *)&self->_subscriptionPlaybackInformationLoadQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionPlaybackInformation, 0);
  objc_storeStrong((id *)&self->_subscriptionLeaseSession, 0);
  objc_storeStrong((id *)&self->_subscriptionLeaseSessionLoadQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)album
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "album");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (void)_updateAudioFormatInfoForContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPCPlayerAudioFormat *preferredFormat;
  void *v21;
  MPCPlayerAudioFormat *activeFormat;
  void *v23;
  MPCPlayerAudioRoute *audioRoute;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[3];
  _QWORD v29[3];
  void *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  void *v33;
  uint8_t buf[4];
  MPCModelGenericAVItem *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem _updateAudioFormatInfoForContentItem:](&v27, sel__updateAudioFormatInfoForContentItem_, v4);
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSongTraits:", objc_msgSend(v5, "traits"));

  }
  os_unfair_lock_unlock(&self->_genericObjectLock);
  -[MPCModelGenericAVItem modelPlayEvent](self, "modelPlayEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "itemType");
  if (v7 == 3)
  {
    objc_msgSend(v6, "playlist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasLoadedValueForKey:", *MEMORY[0x24BDDBF60]))
    {
      objc_msgSend(v4, "setPlaylistTraits:", objc_msgSend(v8, "traits"));
      goto LABEL_16;
    }
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_FAULT, "%{public}@: Uninitialized MPModelPropertyPlaylistTraits properties - playlist=%{public}@.", buf, 0x16u);
    }

    v28[0] = CFSTR("playEvent");
    objc_msgSend(v6, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v16;
    v28[1] = CFSTR("item");
    -[MPCModelGenericAVItem description](self, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v17;
    v28[2] = CFSTR("playlist");
    objc_msgSend(v8, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE65C38], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("ModelBug"), CFSTR("playlist.traits=nil"), &stru_24CABB5D0, v14, 0);
LABEL_15:

    goto LABEL_16;
  }
  if (v7 != 1)
    goto LABEL_17;
  objc_msgSend(v6, "album");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hasLoadedValueForKey:", *MEMORY[0x24BDDBDA8]))
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_FAULT, "%{public}@: Uninitialized MPModelPropertyAlbumTraits - album=%{public}@.", buf, 0x16u);
    }

    v31[0] = CFSTR("playEvent");
    objc_msgSend(v6, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    v31[1] = CFSTR("item");
    -[MPCModelGenericAVItem description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v11;
    v31[2] = CFSTR("album");
    objc_msgSend(v8, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE65C38], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x24BE65AB0], CFSTR("Bug"), CFSTR("ModelBug"), CFSTR("album.traits=nil"), &stru_24CABB5D0, v14, 0);
    goto LABEL_15;
  }
  objc_msgSend(v4, "setAlbumTraits:", objc_msgSend(v8, "traits"));
LABEL_16:

LABEL_17:
  preferredFormat = self->_preferredFormat;
  if (preferredFormat)
  {
    -[MPCPlayerAudioFormat nowPlayingAudioFormat](preferredFormat, "nowPlayingAudioFormat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredFormat:", v21);

  }
  activeFormat = self->_activeFormat;
  if (activeFormat)
  {
    -[MPCPlayerAudioFormat nowPlayingAudioFormat](activeFormat, "nowPlayingAudioFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveFormat:", v23);

    objc_msgSend(v4, "setActiveFormatJustification:", self->_activeFormatJustification);
  }
  audioRoute = self->_audioRoute;
  if (audioRoute)
  {
    -[MPCPlayerAudioRoute nowPlayingAudioRoute](audioRoute, "nowPlayingAudioRoute");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudioRoute:", v25);

  }
  objc_msgSend(v4, "setFormatTierPreference:", -[MPCModelGenericAVItem _audioFormatPreference](self, "_audioFormatPreference"));
  if (-[NSArray count](self->_alternateFormats, "count"))
  {
    -[NSArray msv_map:](self->_alternateFormats, "msv_map:", &__block_literal_global_325);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlternativeFormats:", v26);

  }
}

- (unint64_t)_audioFormatPreference
{
  return -[MPCAudioAssetTypeSelector audioFormatPreference](self->_audioAssetTypeSelector, "audioFormatPreference");
}

- (id)externalContentIdentifier
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  BOOL v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  os_unfair_lock_unlock(p_genericObjectLock);
  v5 = v4 == 9 || v4 == 6;
  if (v5 && -[MPCModelGenericAVItem usesBookmarking](self, "usesBookmarking"))
  {
    v6 = -[MPCModelGenericAVItem storeItemInt64ID](self, "storeItemInt64ID");
    if (v6 || (v6 = -[MPCModelGenericAVItem storeSubscriptionAdamID](self, "storeSubscriptionAdamID")) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lli"), v6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)_persistedLikedState
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  switch(v4)
  {
    case 1:
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[MPModelGenericObject movie](self->_flattenedMetadataGenericObject, "movie");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      os_unfair_lock_unlock(p_genericObjectLock);
      return 0;
  }
  v6 = (void *)v5;
  os_unfair_lock_unlock(p_genericObjectLock);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDDC720], "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tasteTypeForModel:", v6);
    v8 = MPMediaContentTasteTasteTypeToMPMediaEntityLikedState();

    return v8;
  }
  return 0;
}

- (id)albumArtist
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type");
  if (v4 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedMetadataGenericObject, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "season");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "show");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "album");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artist");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_7:
  os_unfair_lock_unlock(p_genericObjectLock);
  return v9;
}

- (BOOL)allowsEQ
{
  return 1;
}

- (void)applyVolumeNormalizationWithSoundCheckEnabled:(BOOL)a3
{
  _BOOL4 v3;
  float v5;
  void *v6;
  float v7;
  double v8;
  double v9;

  v3 = a3;
  if (!-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded")
    || !-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset")
    || -[MPCModelGenericAVItem loadedAudioAssetType](self, "loadedAudioAssetType") <= 2)
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    v5 = 0.0;
    if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
    {
      -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "volumeNormalization");
      v5 = v7;

    }
    os_unfair_lock_unlock(&self->_genericObjectLock);
    if (v3)
      *(float *)&v8 = v5;
    else
      *(float *)&v8 = 0.0;
    -[MPCModelGenericAVItem setSoundCheckVolumeNormalization:](self, "setSoundCheckVolumeNormalization:", v8);
    *(float *)&v9 = v5;
    -[MPCModelGenericAVItem setLoudnessInfoVolumeNormalization:](self, "setLoudnessInfoVolumeNormalization:", v9);
  }
}

- (id)artworkTimeMarkers
{
  return 0;
}

- (id)chapterTimeMarkers
{
  return 0;
}

- (id)copyrightText
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "copyrightText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v5;
}

- (BOOL)isAssetURLValid
{
  return 1;
}

- (BOOL)isStreamable
{
  return 1;
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  MPCModelGenericAVItem *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (MPCModelGenericAVItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (-[MPCModelGenericAVItem itemError](self, "itemError"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      -[MPCModelGenericAVItem queueIdentifier](self, "queueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelGenericAVItem queueIdentifier](v4, "queueIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v7 = 0;
      if (v9 && v10)
        v7 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (ICUserIdentity)playbackRequestUserIdentity
{
  return -[MPCPlaybackRequestEnvironment userIdentity](self->_playbackRequestEnvironment, "userIdentity");
}

- (id)_delegatedUserIdentityProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  uint8_t buf[4];
  MPCModelGenericAVItem *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegatedIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[MPCModelGenericAVItemUserIdentityPropertySet delegatedIdentityProperties](self->_identityPropertySet, "delegatedIdentityProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  if (!v9)
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Missing DSID in delegated identity properties - skipping playback", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 16, CFSTR("%@: Missing DSID in delegated identity properties - skipping playback"), self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_7;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isDelegated") & 1) == 0)
  {

LABEL_5:
    v7 = 0;
  }
  v10 = 0;
  if (a3)
LABEL_7:
    *a3 = objc_retainAutorelease(v10);
LABEL_8:

  return v7;
}

- (BOOL)_prefersHighQualityContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  MPCModelGenericAVItem *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "networkType");

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lastKnownNetworkType");

  LODWORD(v5) = -[MPCModelGenericAVItem hasVideo](self, "hasVideo");
  v7 = (void *)objc_opt_class();
  if ((_DWORD)v5)
    v8 = objc_msgSend(v7, "_prefersHighQualityVideoContentForNetworkType:", v6);
  else
    v8 = objc_msgSend(v7, "_prefersHighQualityAudioContentForNetworkType:", v6);
  v9 = v8;
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544386;
    v13 = CFSTR(" not");
    v16 = v12;
    if (v9)
      v13 = &stru_24CABB5D0;
    v17 = 2114;
    v18 = self;
    v19 = 2048;
    v20 = v4;
    v21 = 2048;
    v22 = v6;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Based on network type of %li and last known network type of %li, we are%{public}@ preferring high quality content.", (uint8_t *)&v15, 0x34u);

  }
  return v9;
}

- (int64_t)playerItemType
{
  return 0;
}

- (id)_assetLoadPropertiesWithUserIdentityProperties:(id)a3 delegatedUserIdentityProperties:(id)a4 subscriptionPlaybackInfo:(id)a5
{
  id v7;
  MPCModelPlaybackAssetCacheProviding *v8;
  _BOOL4 radioPlayback;
  id v10;
  MPModelGenericObject *v11;
  MPModelGenericObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  __CFString *v29;
  void *v30;
  MPCModelGenericAVItemAssetLoadProperties *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  MPModelGenericObject *v37;
  MPCModelPlaybackAssetCacheProviding *v38;
  _BOOL4 v39;
  void *v40;
  MPModelGenericObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  MPCModelGenericAVItem *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = self->_assetCacheProvider;
  radioPlayback = self->_radioPlayback;
  v10 = a3;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v11 = self->_genericObject;
  v12 = self->_flattenedGenericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  v42 = -[MPCModelGenericAVItem hasVideo](self, "hasVideo");
  -[MPCModelGenericAVItem audioAssetTypeSelector](self, "audioAssetTypeSelector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredAudioAssetTypeForItem:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MPModelGenericObject type](v12, "type");
  v40 = v10;
  v41 = v12;
  v39 = radioPlayback;
  switch(v15)
  {
    case 9:
      -[MPModelGenericObject movie](v12, "movie");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v16 = v23;
      objc_msgSend(v23, "localFileAsset");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storeAsset");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v18 = 0;
      v22 = 0;
LABEL_15:
      v44 = (void *)v17;

      goto LABEL_17;
    case 6:
      -[MPModelGenericObject tvEpisode](v12, "tvEpisode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1:
      -[MPModelGenericObject song](v12, "song");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "homeSharingAsset");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localFileAsset");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storeAsset");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "type");
      v19 = MSVDeviceIsAudioAccessory() & v42;
      v20 = 3;
      if (v18 != 1)
        v20 = v18 == 0;
      if ((unint64_t)(v18 - 2) >= 4)
        v21 = v20;
      else
        v21 = 2;
      if ((v19 & 1) != 0)
        v22 = 3;
      else
        v22 = v21;
      goto LABEL_15;
  }
  v18 = 0;
  v22 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v46 = 0;
LABEL_17:
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v11;
    v38 = v8;
    objc_msgSend(v24, "engineID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    v27 = v7;
    if ((unint64_t)(v18 - 1) > 4)
      v28 = CFSTR("Unspecified");
    else
      v28 = off_24CAB19C0[v18 - 1];
    v29 = off_24CAB19A0[v22];
    -[MPCModelGenericAVItem audioAssetTypeSelector](self, "audioAssetTypeSelector");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v48 = v26;
    v49 = 2114;
    v50 = self;
    v51 = 2114;
    v52 = v28;
    v53 = 2114;
    v54 = v29;
    v55 = 2114;
    v56 = v30;
    v57 = 2114;
    v58 = v43;
    v59 = 2114;
    v60 = v44;
    _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] Creating assetLoadProperties - %{public}@: Preferred audio: %{public}@ - HLSContentPolicy: %{public}@ - Selector: %{public}@, fileAsset=%{public}@, storeAsset=%{public}@", buf, 0x48u);

    v7 = v27;
    v11 = v37;
    v8 = v38;
    v14 = v36;
  }

  v31 = objc_alloc_init(MPCModelGenericAVItemAssetLoadProperties);
  -[MPCModelGenericAVItemAssetLoadProperties setPreferredAudioAssetType:](v31, "setPreferredAudioAssetType:", v18);
  -[MPCModelGenericAVItemAssetLoadProperties setAudioAssetTypeSelection:](v31, "setAudioAssetTypeSelection:", v14);
  -[MPCModelGenericAVItemAssetLoadProperties setHLSContentPolicy:](v31, "setHLSContentPolicy:", v22);
  -[MPCModelGenericAVItemAssetLoadProperties setPrefersVideoContent:](v31, "setPrefersVideoContent:", v42);
  -[MPCModelGenericAVItemAssetLoadProperties setAssetCacheProvider:](v31, "setAssetCacheProvider:", v8);
  -[MPCModelGenericAVItemAssetLoadProperties setFileAsset:](v31, "setFileAsset:", v43);
  -[MPCModelGenericAVItemAssetLoadProperties setGenericObject:](v31, "setGenericObject:", v11);
  -[MPCModelGenericAVItemAssetLoadProperties setItemIdentifiers:](v31, "setItemIdentifiers:", v45);
  -[MPCModelGenericAVItemAssetLoadProperties setPrefersHighQualityContent:](v31, "setPrefersHighQualityContent:", -[MPCModelGenericAVItem _prefersHighQualityContent](self, "_prefersHighQualityContent"));
  -[MPCModelGenericAVItemAssetLoadProperties setRadioPlayback:](v31, "setRadioPlayback:", v39);
  -[MPCModelGenericAVItemAssetLoadProperties setStoreAsset:](v31, "setStoreAsset:", v44);
  -[MPCModelGenericAVItemAssetLoadProperties setHomeSharingAsset:](v31, "setHomeSharingAsset:", v46);
  objc_msgSend(v40, "DSID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadProperties setAccountID:](v31, "setAccountID:", objc_msgSend(v32, "unsignedLongLongValue"));

  objc_msgSend(v40, "storefrontIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCModelGenericAVItemAssetLoadProperties setStorefrontID:](v31, "setStorefrontID:", v33);
  if (v7)
  {
    objc_msgSend(v7, "DSID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItemAssetLoadProperties setDelegatedAccountID:](v31, "setDelegatedAccountID:", objc_msgSend(v34, "unsignedLongLongValue"));

  }
  -[MPCModelGenericAVItemAssetLoadProperties setSupportsVocalAttenuation:](v31, "setSupportsVocalAttenuation:", -[MPCModelGenericAVItem supportsVocalAttenuation](self, "supportsVocalAttenuation"));

  return v31;
}

- (int64_t)_suzeLeaseMediaType
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  int v6;
  int64_t v7;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  switch(v4)
  {
    case 9:
      v7 = 2;
      break;
    case 6:
      v7 = 7;
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasVideo");

      if (v6)
        v7 = 6;
      else
        v7 = 1;
      break;
    default:
      v7 = 1;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v7;
}

- (id)_iTunesStorePurchasedMediaKind
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  switch(v4)
  {
    case 9:
      v10 = CFSTR("movie");
      break;
    case 6:
      v10 = CFSTR("tvshow");
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isArtistUploadedContent");
      v7 = objc_msgSend(v5, "hasVideo");
      v8 = CFSTR("uploadedaudio");
      if (v7)
        v8 = CFSTR("uploadedvideo");
      v9 = CFSTR("musicvideo");
      if (!v7)
        v9 = CFSTR("music");
      if (v6)
        v10 = v8;
      else
        v10 = v9;

      break;
    default:
      v10 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return (id)v10;
}

- (MPGaplessInfo)gaplessInfo
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  if (-[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gaplessInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return (MPGaplessInfo *)v5;
}

- (id)_loudnessInfoMediaKind
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  id *v9;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  switch(v4)
  {
    case 9:
      v9 = (id *)MEMORY[0x24BE0AA98];
LABEL_9:
      v8 = *v9;
      break;
    case 6:
      v9 = (id *)MEMORY[0x24BE0AAB8];
      goto LABEL_9;
    case 1:
      -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasVideo");
      v7 = (id *)MEMORY[0x24BE0AAA0];
      if (v6)
        v7 = (id *)MEMORY[0x24BE0AAA8];
      v8 = *v7;

      break;
    default:
      v8 = 0;
      break;
  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v8;
}

- (float)_volumeAdjustment
{
  os_unfair_lock_s *p_genericObjectLock;
  float v4;
  void *v5;
  float v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = 1.0;
  if (-[MPModelGenericObject type](self->_flattenedGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volumeAdjustment");
    v4 = v6;

  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v4;
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(void *, uint64_t);
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  double v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  int v34;
  dispatch_semaphore_t v35;
  void *v36;
  id v37;
  dispatch_time_t v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  const __CFString *v48;
  unint64_t v49;
  const __CFString *v50;
  unint64_t v51;
  const __CFString *v52;
  MPCAssetLoadPropertiesLocalFileEvaluator *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  MPCModelGenericAVItemLocalFileLoadOperation *v58;
  NSObject *v59;
  void *v60;
  int v61;
  NSObject *v62;
  NSObject *v63;
  dispatch_semaphore_t v64;
  dispatch_time_t v65;
  NSObject *v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  NSObject *v71;
  NSObject *v72;
  int v73;
  NSObject *v74;
  NSObject *v75;
  MPCModelGenericAVItemHomeSharingLoadOperation *v76;
  dispatch_semaphore_t v77;
  NSObject *v78;
  dispatch_time_t v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  int v86;
  NSObject *v87;
  NSObject *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void *v94;
  id v95;
  id v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  NSObject *v104;
  int v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v110;
  int v111;
  int v112;
  NSObject *v113;
  NSObject *v114;
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v115;
  unsigned int v116;
  uint64_t v117;
  dispatch_semaphore_t v118;
  NSObject *v119;
  dispatch_time_t v120;
  NSObject *v121;
  void *v122;
  NSObject *v123;
  NSObject *v124;
  dispatch_semaphore_t v125;
  NSObject *v126;
  dispatch_time_t v127;
  NSObject *v128;
  void *v129;
  const char *v130;
  NSObject *p_super;
  uint32_t v132;
  void *v133;
  id v134;
  NSObject *v135;
  NSObject *v136;
  int v137;
  id v138;
  NSObject *v139;
  NSObject *v140;
  int v141;
  id v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  MPCModelGenericAVItemLocalFileLoadOperation *v146;
  dispatch_semaphore_t v147;
  NSObject *v148;
  dispatch_time_t v149;
  NSObject *v150;
  void *v151;
  NSObject *v152;
  NSObject *v153;
  int v154;
  BOOL v155;
  id v156;
  void *v157;
  void *v158;
  NSObject *v159;
  void *v160;
  int v161;
  __CFString *v162;
  int v163;
  BOOL v164;
  char IsAudioAccessory;
  char v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  id v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  _QWORD *v179;
  void *v180;
  NSObject *v181;
  void *v182;
  char v183;
  char v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  void *v202;
  void *v203;
  void *v204;
  NSObject *v205;
  void *v206;
  void *v207;
  NSObject *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  NSObject *v212;
  void *v213;
  NSObject *v214;
  NSObject *v215;
  uint64_t v216;
  dispatch_semaphore_t v217;
  void *v218;
  NSObject *v219;
  dispatch_time_t v220;
  NSObject *v221;
  void *v222;
  NSObject *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  int v228;
  int v229;
  void *v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  NSObject *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  _BOOL4 v241;
  int v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  uint64_t v250;
  char v251;
  char v252;
  void *v253;
  void *v254;
  BOOL v255;
  void *v256;
  void *v257;
  NSObject *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  NSObject *v263;
  void *v264;
  uint64_t v265;
  void *v266;
  void *v267;
  NSObject *v268;
  MPCModelGenericAVItem *v269;
  id v270;
  dispatch_group_t v271;
  uint64_t (*v272)(uint64_t, uint64_t);
  void *v273;
  NSObject *v274;
  MPCModelGenericAVItem *v275;
  MPCModelGenericAVItemSubscriptionAssetLoadOperation *v276;
  NSObject *v277;
  int v278;
  NSObject *v279;
  NSObject *v280;
  NSObject *v281;
  void *v282;
  id v283;
  NSObject *v284;
  NSObject *v285;
  int v286;
  void *v287;
  void *v288;
  int v289;
  BOOL v290;
  void *v291;
  NSObject *v292;
  void *v293;
  NSObject *v294;
  NSObject *v295;
  NSObject *v296;
  NSObject *v297;
  int v298;
  id *v299;
  NSObject *v300;
  NSObject *v301;
  uint64_t v302;
  double v303;
  void *v304;
  void *v305;
  void *v306;
  uint64_t v307;
  int v308;
  __CFString *v309;
  __CFString *v310;
  void *v311;
  int v312;
  uint64_t v313;
  id v314;
  void *v315;
  id firstBecomeActivePlayerItemBlock;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  MPCAudioAssetTypeSelection *v321;
  MPCAudioAssetTypeSelection *preferredAudioAssetTypeSelection;
  BOOL v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  int v330;
  void *v331;
  uint64_t v332;
  void *v333;
  id v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  id v340;
  void *v341;
  double v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  NSObject *v350;
  NSObject *v351;
  int v352;
  void *v353;
  void *v354;
  NSObject *v355;
  void *v356;
  NSObject *v357;
  NSObject *v358;
  dispatch_semaphore_t v359;
  void *v360;
  NSObject *v361;
  dispatch_time_t v362;
  NSObject *v363;
  MPCModelGenericAVItem *v364;
  void *v365;
  void *v366;
  NSObject *v367;
  id v368;
  MPCModelGenericAVItem *v369;
  NSObject *v370;
  NSObject *v371;
  int v372;
  uint64_t (*v373)(uint64_t, uint64_t);
  uint64_t (*v374)(uint64_t, uint64_t);
  void *v375;
  NSObject *v376;
  void *v377;
  uint64_t (*v378)(uint64_t, uint64_t);
  uint64_t v379;
  void *v380;
  void *v381;
  void *v382;
  uint64_t (*v383)(uint64_t, uint64_t);
  uint64_t v384;
  void *v385;
  id v386;
  void *v387;
  void *v388;
  id v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t i;
  uint64_t v393;
  void *v394;
  void *v395;
  uint64_t v396;
  void *v397;
  __CFString *v398;
  __CFString *v399;
  NSObject *v400;
  NSObject *v401;
  id v402;
  uint64_t v403;
  uint64_t v404;
  int v405;
  void *v406;
  NSObject *v407;
  void *v408;
  NSObject *v409;
  NSObject *v410;
  int v411;
  void *v412;
  void *v413;
  NSObject *v414;
  NSObject *v415;
  void *v416;
  int v417;
  void *v418;
  NSObject *v419;
  void *v420;
  void *v421;
  dispatch_semaphore_t v422;
  id v423;
  void *v424;
  NSObject *v425;
  NSObject *v426;
  uint64_t v427;
  void *v428;
  id v429;
  dispatch_time_t v430;
  void *v431;
  NSObject *v432;
  MPCModelGenericAVItem *v433;
  uint64_t v434;
  void *v435;
  NSObject *v436;
  NSObject *v437;
  int v438;
  void *v439;
  uint64_t v440;
  void *v441;
  char v442;
  int v443;
  int v444;
  BOOL v445;
  void *v446;
  id v447;
  int v448;
  void *v449;
  void *v450;
  _BOOL4 v451;
  void *v452;
  void *v453;
  uint64_t (*v454)(uint64_t, uint64_t);
  __CFString *v455;
  void *v456;
  void *v457;
  uint64_t (*v458)(uint64_t, uint64_t);
  uint64_t (*obj)(uint64_t, uint64_t);
  id obja;
  uint64_t (*objb)(uint64_t, uint64_t);
  void *v462;
  NSObject *v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  id v468;
  uint64_t (*v469)(uint64_t, uint64_t);
  int v470;
  uint64_t v471;
  void *v472;
  id v473;
  void *v474;
  MPCAssetLoadPropertiesLocalFileEvaluator *v475;
  void *v476;
  void *v477;
  id v478;
  void *v479;
  BOOL v480;
  void *v481;
  void *v482;
  void (**v483)(void);
  _BOOL4 v484;
  id v485;
  void *v486;
  void *v487;
  void *v488;
  dispatch_semaphore_t dsema;
  void *v490;
  void *v491;
  id v493;
  uint64_t (*v494)(uint64_t, uint64_t);
  void *v495;
  void *v496;
  void *v497;
  unint64_t v498;
  id v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  os_signpost_id_t spid;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  _QWORD block[5];
  _QWORD v510[5];
  NSObject *v511;
  _BYTE *v512;
  _BYTE *v513;
  _QWORD v514[4];
  id v515;
  id v516;
  uint64_t (*v517)(uint64_t, uint64_t);
  id v518;
  id v519;
  NSObject *v520;
  id v521;
  _BYTE *v522;
  _BYTE *v523;
  _BYTE *v524;
  id v525[3];
  char v526;
  _QWORD v527[5];
  NSObject *v528;
  _BYTE *v529;
  _BYTE *v530;
  BOOL v531;
  id v532;
  id v533;
  _QWORD v534[5];
  NSObject *v535;
  _BYTE *v536;
  _QWORD v537[5];
  NSObject *v538;
  _BYTE *v539;
  id v540;
  _QWORD v541[4];
  NSObject *v542;
  _BYTE *v543;
  _BYTE *v544;
  _QWORD v545[5];
  NSObject *v546;
  _BYTE *v547;
  _BYTE *v548;
  _QWORD v549[5];
  NSObject *v550;
  _BYTE *v551;
  _BYTE *v552;
  id v553;
  _QWORD v554[4];
  NSObject *v555;
  _BYTE *v556;
  _BYTE *v557;
  _QWORD v558[4];
  NSObject *v559;
  _BYTE *v560;
  _BYTE *v561;
  _QWORD v562[5];
  id v563;
  _QWORD *v564;
  uint64_t *v565;
  uint64_t *v566;
  os_signpost_id_t v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t *v574;
  uint64_t v575;
  uint64_t (*v576)(uint64_t, uint64_t);
  void (*v577)(uint64_t);
  id v578;
  _QWORD v579[3];
  char v580;
  uint64_t v581;
  uint64_t *v582;
  uint64_t v583;
  uint64_t (*v584)(uint64_t, uint64_t);
  void (*v585)(uint64_t);
  id v586;
  _QWORD v587[5];
  id v588;
  dispatch_semaphore_t v589;
  uint64_t *v590;
  uint64_t v591;
  uint64_t *v592;
  uint64_t v593;
  uint64_t (*v594)(uint64_t, uint64_t);
  void (*v595)(uint64_t);
  id v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  uint64_t v601;
  id v602;
  _QWORD v603[4];
  id v604;
  uint64_t *v605;
  uint64_t v606;
  uint64_t *v607;
  uint64_t v608;
  uint64_t (*v609)(uint64_t, uint64_t);
  void (*v610)(uint64_t);
  id v611;
  _QWORD aBlock[4];
  id v613;
  id v614;
  id v615;
  _QWORD v616[5];
  id v617;
  uint8_t v618[128];
  uint8_t v619[4];
  int v620;
  uint8_t v621[4];
  MPCModelGenericAVItem *v622;
  __int16 v623;
  MPCModelGenericAVItem *v624;
  __int16 v625;
  id v626;
  _BYTE v627[24];
  uint64_t (*v628)(uint64_t, uint64_t);
  void (*v629)(uint64_t);
  id v630;
  uint64_t v631;
  void *v632;
  _BYTE v633[24];
  uint64_t (*v634)(uint64_t, uint64_t);
  __int128 v635;
  _BYTE buf[24];
  uint64_t (*v637)(uint64_t, uint64_t);
  _BYTE v638[22];
  _BYTE v639[10];
  uint64_t v640;
  __int16 v641;
  uint64_t v642;
  __int16 v643;
  uint64_t v644;
  __int16 v645;
  uint64_t v646;
  uint64_t v647;

  v647 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BE65C40]);
  v616[0] = MEMORY[0x24BDAC760];
  v616[1] = 3221225472;
  v616[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v616[3] = &unk_24CAB9830;
  v9 = v7;
  v617 = v9;
  v616[4] = self;
  v10 = (void *)objc_msgSend(v8, "initWithDeallocHandler:", v616);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
  aBlock[3] = &unk_24CAB1130;
  v11 = v6;
  v613 = v11;
  v12 = v10;
  v614 = v12;
  v13 = v9;
  v615 = v13;
  v14 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "engineID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Starting asset load...", buf, 0x16u);

  }
  +[MPCAVItemTrace traceIntervalWithName:item:beginEvent:endEvent:](MPCAVItemTrace, "traceIntervalWithName:item:beginEvent:endEvent:", CFSTR("MPTRACE_PLAYBACK_STORE_ITEM_ASSET_LOAD"), self, 731643968, 731643972);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  spid = os_signpost_id_make_with_pointer(v18, self);

  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v20 = v19;
  v498 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAsset", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCContentAgeRequirementManager sharedManager](MPCContentAgeRequirementManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isItemAuthorized:shouldAskForAuthorization:", self, 1);

  if ((v22 & 1) != 0)
  {
    v606 = 0;
    v607 = &v606;
    v608 = 0x3032000000;
    v609 = __Block_byref_object_copy__755;
    v610 = __Block_byref_object_dispose__756;
    v611 = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v603[0] = MEMORY[0x24BDAC760];
    v603[1] = 3221225472;
    v603[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_66;
    v603[3] = &unk_24CAB7130;
    v605 = &v606;
    v499 = v23;
    v604 = v499;
    v496 = _Block_copy(v603);
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delayAssetLoadDuration");
    v501 = (void *)objc_claimAutoreleasedReturnValue();

    if (v501)
    {
      v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v501, "doubleValue");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Delaying asset load: %g", buf, 0x16u);
      }

      objc_msgSend(v501, "doubleValue");
      usleep((v27 * 1000000.0));
    }
    -[MPCModelGenericAVItemUserIdentityPropertySet identityProperties](self->_identityPropertySet, "identityProperties");
    v497 = (void *)objc_claimAutoreleasedReturnValue();
    v602 = 0;
    -[MPCModelGenericAVItem _delegatedUserIdentityProperties:](self, "_delegatedUserIdentityProperties:", &v602);
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v602;
    v491 = v28;
    if (v28)
    {
      -[MPCModelGenericAVItem setItemError:](self, "setItemError:", v28);
      v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        -[MPCModelGenericAVItem itemError](self, "itemError");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v30;
        _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Returning asset load early with error: %{public}@", buf, 0x16u);

      }
      goto LABEL_493;
    }
    v484 = -[MPCModelGenericAVItem _allowsStreamingPlayback](self, "_allowsStreamingPlayback");
    v601 = 0;
    v600 = 0u;
    v599 = 0u;
    v598 = 0u;
    v597 = 0u;
    -[MPCModelGenericAVItem _timeoutValues](self, "_timeoutValues");
    -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
    v490 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem _iTunesStorePurchasedMediaKind](self, "_iTunesStorePurchasedMediaKind");
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem _loudnessInfoMediaKind](self, "_loudnessInfoMediaKind");
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem _volumeAdjustment](self, "_volumeAdjustment");
    v34 = v33;
    v480 = self->_radioPlayback && self->_subscriptionRequired || v500;
    v591 = 0;
    v592 = &v591;
    v593 = 0x3032000000;
    v594 = __Block_byref_object_copy__755;
    v595 = __Block_byref_object_dispose__756;
    v596 = 0;
    v35 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v587[0] = MEMORY[0x24BDAC760];
    v587[1] = 3221225472;
    v587[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_69;
    v587[3] = &unk_24CAB1158;
    v587[4] = self;
    v37 = v499;
    v588 = v37;
    v590 = &v591;
    dsema = v35;
    v589 = dsema;
    objc_msgSend(v36, "getBagAndURLMetricsForRequestContext:forceRefetch:withCompletionHandler:", v490, 0, v587);

    v38 = dispatch_time(0, 1000000000 * v601);
    if (dispatch_semaphore_wait(dsema, v38))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out loading url bag"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v39);

      v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_210BD8000, v40, OS_LOG_TYPE_ERROR, "[AL][Bag Loading] - %{public}@: loadAssetAndPlayerItem - Timed out loading url bag.", buf, 0xCu);
      }
    }
    else
    {
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject engineID](v40, "engineID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = self;
        _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Bag Loading] - %{public}@: loadAssetAndPlayerItem - Finished loading url bag.", buf, 0x16u);

      }
    }

    if ((v14[2](v14, 1107) & 1) != 0)
    {
LABEL_492:

      _Block_object_dispose(&v591, 8);
LABEL_493:

      _Block_object_dispose(&v606, 8);
      goto LABEL_494;
    }
    v581 = 0;
    v582 = &v581;
    v583 = 0x3032000000;
    v584 = __Block_byref_object_copy__755;
    v585 = __Block_byref_object_dispose__756;
    v586 = 0;
    v579[0] = 0;
    v579[1] = v579;
    v579[2] = 0x2020000000;
    v580 = 0;
    v573 = 0;
    v574 = &v573;
    v575 = 0x3032000000;
    v576 = __Block_byref_object_copy__755;
    v577 = __Block_byref_object_dispose__756;
    v578 = 0;
    v562[0] = MEMORY[0x24BDAC760];
    v562[1] = 3221225472;
    v562[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_75;
    v562[3] = &unk_24CAB11A8;
    v564 = v579;
    v562[4] = self;
    v567 = spid;
    v572 = v601;
    v570 = v599;
    v571 = v600;
    v568 = v597;
    v569 = v598;
    v565 = &v573;
    v566 = &v581;
    v473 = v37;
    v563 = v473;
    v483 = (void (**)(void))_Block_copy(v562);
    if ((v14[2](v14, 1145) & 1) != 0)
    {
LABEL_491:

      _Block_object_dispose(&v573, 8);
      _Block_object_dispose(v579, 8);
      _Block_object_dispose(&v581, 8);

      goto LABEL_492;
    }
    v43 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v43, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v43, "setName:", CFSTR("com.apple.MediaPlayer.MPCModelGenericAVItem.assetLoadOperationQueue"));
    objc_msgSend(v43, "setQualityOfService:", 25);
    -[MPCModelGenericAVItem _assetLoadPropertiesWithUserIdentityProperties:delegatedUserIdentityProperties:subscriptionPlaybackInfo:](self, "_assetLoadPropertiesWithUserIdentityProperties:delegatedUserIdentityProperties:subscriptionPlaybackInfo:", v497, v500, v582[5]);
    v474 = v43;
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v486, "storeAsset");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = objc_msgSend(v44, "endpointType");

    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v45, "engineID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v486, "prefersVideoContent"))
        v48 = CFSTR("video");
      else
        v48 = CFSTR("audio");
      v49 = objc_msgSend(v486, "preferredAudioAssetType") - 1;
      if (v49 > 4)
        v50 = CFSTR("Unspecified");
      else
        v50 = off_24CAB19C0[v49];
      v51 = objc_msgSend(v486, "HLSContentPolicy");
      if (v51 > 3)
        v52 = CFSTR("Unspecified");
      else
        v52 = off_24CAB19A0[v51];
      *(_DWORD *)buf = 138545155;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v637 = (uint64_t (*)(uint64_t, uint64_t))v48;
      *(_WORD *)v638 = 2113;
      *(_QWORD *)&v638[2] = v50;
      *(_WORD *)&v638[10] = 1024;
      *(_DWORD *)&v638[12] = v500 != 0;
      *(_WORD *)&v638[16] = 1024;
      *(_DWORD *)&v638[18] = v484;
      *(_WORD *)v639 = 2114;
      *(_QWORD *)&v639[2] = v52;
      LOWORD(v640) = 1024;
      *(_DWORD *)((char *)&v640 + 2) = v471;
      _os_log_impl(&dword_210BD8000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset is %{public}@ - Preferred audio: %{private}@, isDelegatedPlayback=%{BOOL}u, allowsStreamingPlayback=%{BOOL}u, HLSContentPolicy=%{public}@}, endpointType=%d", buf, 0x46u);

    }
    v53 = [MPCAssetLoadPropertiesLocalFileEvaluator alloc];
    -[MPCModelGenericAVItem audioAssetTypeSelector](self, "audioAssetTypeSelector");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "playbackEngine");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v475 = -[MPCAssetLoadPropertiesLocalFileEvaluator initWithPlaybackEngine:](v53, "initWithPlaybackEngine:", v55);

    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = objc_msgSend(v56, "disableAssetCaching");
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssetLoadPropertiesLocalFileEvaluator evaluateAssetLoadProperties:allowingCachedAssets:defaults:](v475, "evaluateAssetLoadProperties:allowingCachedAssets:defaults:", v486, v55 ^ 1, v57);
    v482 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v482, "status") == 1
      && (!objc_msgSend(v482, "fileMatchesRequiredQuality") || objc_msgSend(v482, "recommendation") == 2))
    {
      *((_QWORD *)&v598 + 1) = 5;
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v58 = (MPCModelGenericAVItemLocalFileLoadOperation *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        -[MPCModelGenericAVItemLocalFileLoadOperation engineID](v58, "engineID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545666;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        v637 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)&v597 + 1);
        *(_WORD *)v638 = 2048;
        *(_QWORD *)&v638[2] = v597;
        *(_WORD *)&v638[10] = 2048;
        *(_QWORD *)&v638[12] = v598;
        *(_WORD *)&v638[20] = 2048;
        *(_QWORD *)v639 = *((_QWORD *)&v598 + 1);
        *(_WORD *)&v639[8] = 2048;
        v640 = v599;
        v641 = 2048;
        v642 = *((_QWORD *)&v599 + 1);
        v643 = 2048;
        v644 = v600;
        v645 = 2048;
        v646 = *((_QWORD *)&v600 + 1);
        _os_log_impl(&dword_210BD8000, v59, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@ - Overriding timeout values for cloud streaming [Bypassing local file and attempting streaming]: Local file=%lds - subscription lease session=%lds - home sharing=%lds - cloud streaming=%lds - cloud redownload=%lds - fairplay status=%lds - fairplay lease=%lds - suze lease=%lds", buf, 0x66u);

      }
      v476 = 0;
      v61 = 1;
LABEL_66:

LABEL_67:
      if ((v14[2](v14, 1232) & 1) != 0)
        goto LABEL_490;
      if (v500 || ((objc_msgSend(v476, "hasValidAsset") | !v484) & 1) != 0)
      {
LABEL_86:
        if ((v14[2](v14, 1267) & 1) != 0)
          goto LABEL_490;
        if ((objc_msgSend(v476, "hasValidAsset") & 1) == 0
          && (objc_msgSend(v486, "isRadioPlayback") & v484) == 1)
        {
          _MPCLogCategoryAnalytics();
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = v87;
          if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_210BD8000, v88, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetAssetInfoCacheRequest", ", buf, 2u);
          }

          v89 = objc_alloc_init(MEMORY[0x24BDDCC18]);
          objc_msgSend(v89, "setAccountID:", objc_msgSend(v486, "accountID"));
          objc_msgSend(v89, "setDelegatedAccountID:", objc_msgSend(v486, "delegatedAccountID"));
          objc_msgSend(v89, "setRequestType:", 3);
          objc_msgSend(v486, "itemIdentifiers");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "universalStore");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setStoreRadioAdamID:", objc_msgSend(v91, "adamID"));

          objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "cachedResponseForRequest:", v89);
          v93 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          v456 = v92;
          obj = v93;
          if (v93)
          {
            v553 = 0;
            +[MPCModelGenericAVItemAssetLoadResult assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:](MPCModelGenericAVItemAssetLoadResult, "assetLoadResultWithStoreAssetPlaybackResponse:assetLoadProperties:source:error:", v93, v486, 3, &v553);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v553;
            v96 = v94;

            v93 = (uint64_t (*)(uint64_t, uint64_t))v96;
          }
          else
          {
            v95 = 0;
          }
          v469 = v93;
          v462 = v95;
          if (objc_msgSend(v93, "hasValidAsset"))
          {
            v454 = v469;

            (*((void (**)(void *, _QWORD))v496 + 2))(v496, 0);
            -[MPCModelGenericAVItem eventStream](self, "eventStream");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            _MPCLogCategoryPlayback();
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v97, "engineID");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v99;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2114;
              v637 = obj;
              _os_log_impl(&dword_210BD8000, v98, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using existing Radio cached playback response: %{public}@", buf, 0x20u);

            }
            v476 = v454;
          }
          else
          {
            -[MPCModelGenericAVItem eventStream](self, "eventStream");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            _MPCLogCategoryPlayback();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v100, "engineID");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v102;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = self;
              _os_log_impl(&dword_210BD8000, v101, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: No cached Radio playback response found.", buf, 0x16u);

            }
            if (v462)
              (*((void (**)(void))v496 + 2))();
          }
          _MPCLogCategoryAnalytics();
          v103 = objc_claimAutoreleasedReturnValue();
          v104 = v103;
          if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
          {
            v105 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
            *(_DWORD *)buf = 67240192;
            *(_DWORD *)&buf[4] = v105;
            _os_signpost_emit_with_name_impl(&dword_210BD8000, v104, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetAssetInfoCacheRequest", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 8u);
          }

        }
        if (((objc_msgSend(v476, "hasValidAsset") | !v484) & 1) != 0)
          goto LABEL_158;
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCLogCategoryPlayback();
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v106, "engineID");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v108;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = self;
          _os_log_impl(&dword_210BD8000, v107, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: No local file of appropriate quality, using cloud streaming.", buf, 0x16u);

        }
        if (v471 == 3 || v500 != 0)
        {
          v483[2]();
          objc_msgSend(v486, "storeAsset");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend(v110, "isSubscriptionRequired");

          v112 = objc_msgSend((id)v582[5], "hasPlaybackCapability");
          if (((v111 ^ 1 | v112) & 1) != 0)
          {
            _MPCLogCategoryAnalytics();
            v113 = objc_claimAutoreleasedReturnValue();
            v114 = v113;
            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v114, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetSubscriptionAssetLoadOperation", ", buf, 2u);
            }

            v115 = objc_alloc_init(MPCModelGenericAVItemSubscriptionAssetLoadOperation);
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setAssetLoadProperties:](v115, "setAssetLoadProperties:", v486);
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setRequestContext:](v115, "setRequestContext:", v490);
            v116 = (v112 | v111) & ~objc_msgSend((id)v582[5], "shouldUseAccountLessStreaming");
            if (v116)
              v117 = 1;
            else
              v117 = 2;
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setOperationType:](v115, "setOperationType:", v117);
            if ((v116 & 1) != 0)
              -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setSubscriptionLeaseSession:](v115, "setSubscriptionLeaseSession:", v574[5]);
            v118 = dispatch_semaphore_create(0);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v637 = __Block_byref_object_copy__755;
            *(_QWORD *)v638 = __Block_byref_object_dispose__756;
            *(_QWORD *)&v638[8] = 0;
            *(_QWORD *)v633 = 0;
            *(_QWORD *)&v633[8] = v633;
            *(_QWORD *)&v633[16] = 0x3032000000;
            v634 = __Block_byref_object_copy__755;
            *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
            *((_QWORD *)&v635 + 1) = 0;
            v549[0] = MEMORY[0x24BDAC760];
            v549[1] = 3221225472;
            v549[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_103;
            v549[3] = &unk_24CAB11F8;
            v552 = v633;
            v551 = buf;
            v549[4] = self;
            v119 = v118;
            v550 = v119;
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setResponseHandler:](v115, "setResponseHandler:", v549);
            objc_msgSend(v474, "addOperation:", v115);
            v120 = dispatch_time(0, 1000000000 * *((_QWORD *)&v598 + 1));
            if (dispatch_semaphore_wait(v119, v120))
            {
              -[MPCModelGenericAVItemSubscriptionAssetLoadOperation cancel](v115, "cancel");
              _MPCLogCategoryPlayback();
              v121 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v627 = 138543618;
                *(_QWORD *)&v627[4] = self;
                *(_WORD *)&v627[12] = 2048;
                *(_QWORD *)&v627[14] = *((_QWORD *)&v598 + 1);
                _os_log_impl(&dword_210BD8000, v121, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load subscription asset [request aborted after %lds].", v627, 0x16u);
              }

              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out while attempting to load subscription asset"));
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(void *, void *))v496 + 2))(v496, v122);

              if (v61)
                objc_msgSend(v474, "setMaxConcurrentOperationCount:", 2);
            }
            else
            {
              v138 = *(id *)(*(_QWORD *)&buf[8] + 40);

              (*((void (**)(void *, _QWORD))v496 + 2))(v496, *(_QWORD *)(*(_QWORD *)&v633[8] + 40));
              v476 = v138;
            }
            _MPCLogCategoryAnalytics();
            v139 = objc_claimAutoreleasedReturnValue();
            v140 = v139;
            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
            {
              v141 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
              *(_DWORD *)v627 = 67240192;
              *(_DWORD *)&v627[4] = v141;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v140, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetSubscriptionAssetLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
            }

            _Block_object_dispose(v633, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_157;
          }
          if (v582[5])
          {
            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 17, CFSTR("Missing subscription for playback"));
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(void *, void *))v496 + 2))(v496, v133);

            _MPCLogCategoryPlayback();
            v115 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v115->super.super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = self;
              v130 = "[AL] - %{public}@: Subscription is required, and the user does not have subscription playback capab"
                     "ility, setting error to subscription required.";
LABEL_145:
              p_super = &v115->super.super.super;
              v132 = 12;
              goto LABEL_146;
            }
          }
          else
          {
            _MPCLogCategoryPlayback();
            v115 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v115->super.super.super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = self;
              v130 = "[AL] - %{public}@: Subscription is required, and we failed to load the subscription status.";
              goto LABEL_145;
            }
          }
        }
        else
        {
          if ((unint64_t)(v471 - 1) <= 1)
          {
            _MPCLogCategoryAnalytics();
            v123 = objc_claimAutoreleasedReturnValue();
            v124 = v123;
            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v123))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v124, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetMediaRedownloadOperation", ", buf, 2u);
            }

            v115 = objc_alloc_init(MPCModelGenericAVItemMediaRedownloadOperation);
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setAssetLoadProperties:](v115, "setAssetLoadProperties:", v486);
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setRequestContext:](v115, "setRequestContext:", v490);
            v125 = dispatch_semaphore_create(0);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v637 = __Block_byref_object_copy__755;
            *(_QWORD *)v638 = __Block_byref_object_dispose__756;
            *(_QWORD *)&v638[8] = 0;
            *(_QWORD *)v633 = 0;
            *(_QWORD *)&v633[8] = v633;
            *(_QWORD *)&v633[16] = 0x3032000000;
            v634 = __Block_byref_object_copy__755;
            *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
            *((_QWORD *)&v635 + 1) = 0;
            v545[0] = MEMORY[0x24BDAC760];
            v545[1] = 3221225472;
            v545[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_108;
            v545[3] = &unk_24CAB11F8;
            v548 = v633;
            v547 = buf;
            v545[4] = self;
            v126 = v125;
            v546 = v126;
            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setResponseHandler:](v115, "setResponseHandler:", v545);
            objc_msgSend(v474, "addOperation:", v115);
            v127 = dispatch_time(0, 1000000000 * v599);
            if (dispatch_semaphore_wait(v126, v127))
            {
              -[MPCModelGenericAVItemSubscriptionAssetLoadOperation cancel](v115, "cancel");
              _MPCLogCategoryPlayback();
              v128 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v627 = 138543618;
                *(_QWORD *)&v627[4] = self;
                *(_WORD *)&v627[12] = 2048;
                *(_QWORD *)&v627[14] = v599;
                _os_log_impl(&dword_210BD8000, v128, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load media redownload asset [request aborted after %lds].", v627, 0x16u);
              }

              objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out while attempting to load media redownload asset"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(void *, void *))v496 + 2))(v496, v129);

            }
            else
            {
              v134 = *(id *)(*(_QWORD *)&buf[8] + 40);

              (*((void (**)(void *, _QWORD))v496 + 2))(v496, *(_QWORD *)(*(_QWORD *)&v633[8] + 40));
              v476 = v134;
            }
            _MPCLogCategoryAnalytics();
            v135 = objc_claimAutoreleasedReturnValue();
            v136 = v135;
            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
            {
              v137 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
              *(_DWORD *)v627 = 67240192;
              *(_DWORD *)&v627[4] = v137;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v136, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetMediaRedownloadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
            }

            _Block_object_dispose(v633, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_157;
          }
          _MPCLogCategoryPlayback();
          v115 = (MPCModelGenericAVItemSubscriptionAssetLoadOperation *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v115->super.super.super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v471;
            v130 = "[AL] - %{public}@: No valid endpoint type (%ld), skipping streaming redownload.";
            p_super = &v115->super.super.super;
            v132 = 22;
LABEL_146:
            _os_log_impl(&dword_210BD8000, p_super, OS_LOG_TYPE_ERROR, v130, buf, v132);
          }
        }
LABEL_157:

LABEL_158:
        if ((v14[2](v14, 1404) & 1) == 0)
        {
          if ((objc_msgSend(v476, "hasValidAsset") & 1) != 0)
          {
            v142 = v476;
          }
          else
          {
            _MPCLogCategoryPlayback();
            v143 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = self;
              _os_log_impl(&dword_210BD8000, v143, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Attempting to load lower quality local file", buf, 0xCu);
            }

            _MPCLogCategoryAnalytics();
            v144 = objc_claimAutoreleasedReturnValue();
            v145 = v144;
            if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v144))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v145, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLowQualityFileLoadOperation", ", buf, 2u);
            }

            v146 = -[MPCModelGenericAVItemLocalFileLoadOperation initWithEvaluation:properties:]([MPCModelGenericAVItemLocalFileLoadOperation alloc], "initWithEvaluation:properties:", v482, v486);
            -[MPCModelGenericAVItemLocalFileLoadOperation setRequirePreferredAssetQuality:](v146, "setRequirePreferredAssetQuality:", 0);
            v147 = dispatch_semaphore_create(0);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v637 = __Block_byref_object_copy__755;
            *(_QWORD *)v638 = __Block_byref_object_dispose__756;
            *(_QWORD *)&v638[8] = 0;
            *(_QWORD *)v633 = 0;
            *(_QWORD *)&v633[8] = v633;
            *(_QWORD *)&v633[16] = 0x3032000000;
            v634 = __Block_byref_object_copy__755;
            *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
            *((_QWORD *)&v635 + 1) = 0;
            v541[0] = MEMORY[0x24BDAC760];
            v541[1] = 3221225472;
            v541[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_111;
            v541[3] = &unk_24CAB11D0;
            v543 = buf;
            v544 = v633;
            v148 = v147;
            v542 = v148;
            -[MPCModelGenericAVItemLocalFileLoadOperation setResponseHandler:](v146, "setResponseHandler:", v541);
            objc_msgSend(v474, "addOperation:", v146);
            v149 = dispatch_time(0, 1000000000 * *((_QWORD *)&v597 + 1));
            if (dispatch_semaphore_wait(v148, v149))
            {
              -[MPAsyncOperation cancel](v146, "cancel");
              _MPCLogCategoryPlayback();
              v150 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v627 = 138543618;
                *(_QWORD *)&v627[4] = self;
                *(_WORD *)&v627[12] = 2048;
                *(_QWORD *)&v627[14] = *((_QWORD *)&v597 + 1);
                _os_log_impl(&dword_210BD8000, v150, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load low quality local file [request aborted after %lds].", v627, 0x16u);
              }

              if (!v607[5])
              {
                objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out while attempting to load low quality local file"));
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(void *, void *))v496 + 2))(v496, v151);

              }
              v142 = v476;
            }
            else
            {
              v142 = *(id *)(*(_QWORD *)&buf[8] + 40);

              if ((objc_msgSend(v142, "hasValidAsset") & 1) == 0 && !v607[5])
                (*((void (**)(void *, _QWORD))v496 + 2))(v496, *(_QWORD *)(*(_QWORD *)&v633[8] + 40));
            }
            _MPCLogCategoryAnalytics();
            v152 = objc_claimAutoreleasedReturnValue();
            v153 = v152;
            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v152))
            {
              v154 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
              *(_DWORD *)v627 = 67240192;
              *(_DWORD *)&v627[4] = v154;
              _os_signpost_emit_with_name_impl(&dword_210BD8000, v153, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLowQualityFileLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
            }

            _Block_object_dispose(v633, 8);
            _Block_object_dispose(buf, 8);

          }
          if ((v14[2](v14, 1440) & 1) != 0)
          {
            v476 = v142;
            goto LABEL_490;
          }
          -[MPCModelGenericAVItem _decorateAssetLoadResult:withURLBag:](self, "_decorateAssetLoadResult:withURLBag:", v142, v592[5]);
          v476 = (void *)objc_claimAutoreleasedReturnValue();

          v540 = 0;
          v155 = -[MPCModelGenericAVItem _isAssetLoadResultValidForPlayback:error:](self, "_isAssetLoadResultValidForPlayback:error:", v476, &v540);
          v156 = v540;
          v157 = v156;
          if (!v155)
          {
            if (v156)
              (*((void (**)(void *, id))v496 + 2))(v496, v156);

            goto LABEL_462;
          }
          -[MPCModelGenericAVItem eventStream](self, "eventStream");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v453 = v157;
          _MPCLogCategoryPlayback();
          v159 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v158, "engineID");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v160;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2114;
            v637 = (uint64_t (*)(uint64_t, uint64_t))v476;
            _os_log_impl(&dword_210BD8000, v159, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Ready to process asset load result: %{public}@", buf, 0x20u);

          }
          v161 = objc_msgSend(v476, "isHLSAsset");
          v162 = CFSTR("CRABS");
          if (v161)
            v162 = CFSTR("HLS");
          v455 = v162;
          if (v480)
          {
            v163 = 1;
          }
          else
          {
            v164 = objc_msgSend(v476, "assetProtectionType") == 2 || v471 == 3;
            v163 = v164;
          }
          v451 = v163;
          v485 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          IsAudioAccessory = MSVDeviceIsAudioAccessory();
          if ((v471 & 0xFFFFFFFFFFFFFFFDLL) == 1)
            v166 = IsAudioAccessory;
          else
            v166 = 1;
          if ((v166 & 1) == 0)
            objc_msgSend(v485, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB2178]);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v637 = __Block_byref_object_copy__755;
          *(_QWORD *)v638 = __Block_byref_object_dispose__756;
          objc_msgSend(v476, "purchaseBundleDictionary");
          *(_QWORD *)&v638[8] = objc_claimAutoreleasedReturnValue();
          v167 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          if (v167)
            objc_msgSend(v485, "setObject:forKey:", v167, *MEMORY[0x24BDB21D0]);
          objc_msgSend(v476, "protectedContentSupportStorageFileURL");
          v168 = objc_claimAutoreleasedReturnValue();
          if (v168)
            objc_msgSend(v485, "setObject:forKey:", v168, *MEMORY[0x24BDB21C8]);
          v452 = (void *)v168;
          v470 = objc_msgSend(v476, "isHLSAsset");
          self->_hlsAsset = v470;
          v448 = objc_msgSend(v476, "isCloudStreamingAsset");
          if (!v448)
          {
            if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            {
LABEL_229:
              v481 = 0;
              goto LABEL_265;
            }
LABEL_225:
            v183 = objc_msgSend(v476, "isHomeSharingAsset");
            if (v500)
              v184 = 1;
            else
              v184 = v183;
            if ((v184 & 1) != 0)
              goto LABEL_229;
            if (v471 == 1)
            {
              objc_msgSend(v486, "itemIdentifiers");
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v190, "universalStore");
              v191 = (void *)objc_claimAutoreleasedReturnValue();
              v192 = objc_msgSend(v191, "purchasedAdamID");

              if (v192)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v192);
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                v189 = CFSTR("purchaseHistory");
LABEL_236:
                if (v188)
                {
                  v481 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
                  objc_msgSend(v481, "setObject:forKey:", v188, *MEMORY[0x24BDB2220]);
                  objc_msgSend(v481, "setObject:forKey:", v189, *MEMORY[0x24BDB2238]);
                  objc_msgSend(v486, "storeAsset");
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v193, "redownloadParameters");
                  v194 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v194)
                    objc_msgSend(v481, "setObject:forKey:", v194, *MEMORY[0x24BDB2210]);
                  if (v487)
                    objc_msgSend(v481, "setObject:forKey:", v487, *MEMORY[0x24BDB2230]);
                  objc_msgSend(v490, "userAgent");
                  v195 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v195)
                    objc_msgSend(v481, "setObject:forKey:", v195, *MEMORY[0x24BDB2240]);
                  objc_msgSend(v486, "storeAsset");
                  v196 = (void *)objc_claimAutoreleasedReturnValue();
                  v197 = objc_msgSend(v196, "accountIdentifier");

                  if (v197)
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v197);
                  else
                    objc_msgSend(v497, "DSID");
                  v198 = (id)objc_claimAutoreleasedReturnValue();

                  if (v198)
                    objc_msgSend(v481, "setObject:forKey:", v198, *MEMORY[0x24BDB2208]);

                  goto LABEL_251;
                }
LABEL_246:
                v481 = 0;
LABEL_251:
                if (v470)
                {
                  objc_msgSend(v476, "alternateHLSPlaylistURL");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  v200 = v199;
                  if (v199)
                  {
                    v201 = v199;
                  }
                  else
                  {
                    objc_msgSend(v476, "assetURL");
                    v201 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  objc_msgSend(v201, "absoluteString");
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v202, "length"))
                  {
                    v203 = v481;
                    if (!v481)
                      v203 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
                    v481 = v203;
                    objc_msgSend(v203, "setObject:forKey:", v202, *MEMORY[0x24BDB2218]);
                  }

                }
                if (v481)
                {
                  -[MPCModelGenericAVItem eventStream](self, "eventStream");
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  _MPCLogCategoryPlayback();
                  v205 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v204, "engineID");
                    v206 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v633 = 138543874;
                    *(_QWORD *)&v633[4] = v206;
                    *(_WORD *)&v633[12] = 2114;
                    *(_QWORD *)&v633[14] = self;
                    *(_WORD *)&v633[22] = 2114;
                    v634 = (uint64_t (*)(uint64_t, uint64_t))v481;
                    _os_log_impl(&dword_210BD8000, v205, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using iTunes Store Content Info: %{public}@", v633, 0x20u);

                  }
                  objc_msgSend(v485, "setObject:forKey:", v481, *MEMORY[0x24BDB2228]);
                }

LABEL_265:
                if ((v470 & 1) != 0)
                  goto LABEL_291;
                -[MPCModelGenericAVItem eventStream](self, "eventStream");
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                _MPCLogCategoryPlayback();
                v208 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v208, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v207, "engineID");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v633 = 138543618;
                  *(_QWORD *)&v633[4] = v209;
                  *(_WORD *)&v633[12] = 2114;
                  *(_QWORD *)&v633[14] = self;
                  _os_log_impl(&dword_210BD8000, v208, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Non HLS Asset - Reloading playback keys if required", v633, 0x16u);

                }
                if (self->_radioPlayback && !self->_subscriptionRequired)
                {
                  -[MPCModelGenericAVItem eventStream](self, "eventStream");
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  _MPCLogCategoryPlayback();
                  v223 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v222, "engineID");
                    v225 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v633 = 138543618;
                    *(_QWORD *)&v633[4] = v225;
                    *(_WORD *)&v633[12] = 2114;
                    *(_QWORD *)&v633[14] = self;
                    _os_log_impl(&dword_210BD8000, v223, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Radio station does not require a subscription, skipping subscription key check.", v633, 0x16u);

                  }
                }
                else
                {
                  v210 = objc_msgSend(v476, "assetProtectionType");
                  if (v210 == 2)
                  {
                    if (v451)
                    {
                      v483[2]();
                      if (v574[5])
                      {
                        -[MPCModelGenericAVItem eventStream](self, "eventStream");
                        v211 = (void *)objc_claimAutoreleasedReturnValue();
                        _MPCLogCategoryPlayback();
                        v212 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v211, "engineID");
                          v213 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v633 = 138543618;
                          *(_QWORD *)&v633[4] = v213;
                          *(_WORD *)&v633[12] = 2114;
                          *(_QWORD *)&v633[14] = self;
                          _os_log_impl(&dword_210BD8000, v212, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Reloading FairPlay key status to ensure the latest value is known...", v633, 0x16u);

                        }
                        _MPCLogCategoryAnalytics();
                        v214 = objc_claimAutoreleasedReturnValue();
                        v215 = v214;
                        if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v214))
                        {
                          v216 = -[__CFString UTF8String](objc_retainAutorelease(v455), "UTF8String");
                          *(_DWORD *)v633 = 136446210;
                          *(_QWORD *)&v633[4] = v216;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v215, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLoadFairPlayKeyStatus", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v633, 0xCu);
                        }

                        *(_QWORD *)v633 = 0;
                        *(_QWORD *)&v633[8] = v633;
                        *(_QWORD *)&v633[16] = 0x3032000000;
                        v634 = __Block_byref_object_copy__755;
                        *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
                        *((_QWORD *)&v635 + 1) = 0;
                        v217 = dispatch_semaphore_create(0);
                        v218 = (void *)v574[5];
                        v537[0] = MEMORY[0x24BDAC760];
                        v537[1] = 3221225472;
                        v537[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_130;
                        v537[3] = &unk_24CAB1220;
                        v537[4] = self;
                        v539 = v633;
                        v219 = v217;
                        v538 = v219;
                        objc_msgSend(v218, "reloadFairPlayKeyStatusWithCompletionHandler:", v537);
                        v220 = dispatch_time(0, 1000000000 * *((_QWORD *)&v599 + 1));
                        v463 = v219;
                        if (dispatch_semaphore_wait(v219, v220))
                        {
                          _MPCLogCategoryPlayback();
                          v221 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v627 = 138543618;
                            *(_QWORD *)&v627[4] = self;
                            *(_WORD *)&v627[12] = 2048;
                            *(_QWORD *)&v627[14] = *((_QWORD *)&v599 + 1);
                            _os_log_impl(&dword_210BD8000, v221, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out reloading FairPlay key status; using the last known status [request aborted after %lds].",
                              v627,
                              0x16u);
                          }

                          objc_msgSend((id)v574[5], "leaseStatus");
                          v478 = (id)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v478 = *(id *)(*(_QWORD *)&v633[8] + 40);
                        }
                        _MPCLogCategoryAnalytics();
                        v409 = objc_claimAutoreleasedReturnValue();
                        v410 = v409;
                        if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v409))
                        {
                          v411 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                          *(_DWORD *)v627 = 67240192;
                          *(_DWORD *)&v627[4] = v411;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v410, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLoadFairPlayKeyStatus", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
                        }

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v478, "hasOnlinePlaybackKeys"));
                        v412 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v412, CFSTR("item-asset-has-online-keys"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v478, "hasOfflinePlaybackKeys"));
                        v413 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v413, CFSTR("item-asset-has-offline-keys"));

                        if ((objc_msgSend(v478, "hasOnlinePlaybackKeys") & 1) != 0
                          || (objc_msgSend(v476, "onlineSubscriptionKeysRequired") & 1) == 0
                          && objc_msgSend(v478, "hasOfflinePlaybackKeys"))
                        {
                          -[MPCModelGenericAVItem eventStream](self, "eventStream");
                          v414 = objc_claimAutoreleasedReturnValue();
                          _MPCLogCategoryPlayback();
                          v415 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v415, OS_LOG_TYPE_DEFAULT))
                          {
                            -[NSObject engineID](v414, "engineID");
                            v416 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v627 = 138543874;
                            *(_QWORD *)&v627[4] = v416;
                            *(_WORD *)&v627[12] = 2114;
                            *(_QWORD *)&v627[14] = self;
                            *(_WORD *)&v627[22] = 2114;
                            v628 = (uint64_t (*)(uint64_t, uint64_t))v478;
                            _os_log_impl(&dword_210BD8000, v415, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Already have playback keys from lease status: %{public}@, no need to do another request.", v627, 0x20u);

                          }
                          v417 = 1;
                        }
                        else
                        {
                          if (objc_msgSend(v476, "onlineSubscriptionKeysRequired"))
                          {
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v418 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v419 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v419, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v418, "engineID");
                              v420 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v627 = 138543618;
                              *(_QWORD *)&v627[4] = v420;
                              *(_WORD *)&v627[12] = 2114;
                              *(_QWORD *)&v627[14] = self;
                              _os_log_impl(&dword_210BD8000, v419, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Requesting playback keys because the asset requires online keys", v627, 0x16u);

                            }
                          }
                          else
                          {
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v418 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v419 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v419, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v418, "engineID");
                              v421 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v627 = 138543874;
                              *(_QWORD *)&v627[4] = v421;
                              *(_WORD *)&v627[12] = 2114;
                              *(_QWORD *)&v627[14] = self;
                              *(_WORD *)&v627[22] = 2114;
                              v628 = (uint64_t (*)(uint64_t, uint64_t))v478;
                              _os_log_impl(&dword_210BD8000, v419, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Requesting playback keys because the lease status indicates none available: %{public}@", v627, 0x20u);

                            }
                          }

                          v422 = dispatch_semaphore_create(0);
                          v423 = objc_alloc(MEMORY[0x24BEC8898]);
                          objc_msgSend((id)v574[5], "requestContext");
                          v424 = (void *)objc_claimAutoreleasedReturnValue();
                          v415 = objc_msgSend(v423, "initWithRequestContext:", v424);

                          _MPCLogCategoryAnalytics();
                          v425 = objc_claimAutoreleasedReturnValue();
                          v426 = v425;
                          if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v425))
                          {
                            v427 = -[__CFString UTF8String](objc_retainAutorelease(v455), "UTF8String");
                            *(_DWORD *)v627 = 136446210;
                            *(_QWORD *)&v627[4] = v427;
                            _os_signpost_emit_with_name_impl(&dword_210BD8000, v426, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLeaseSessionPlaybackRequest", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v627, 0xCu);
                          }

                          *(_QWORD *)v627 = 0;
                          *(_QWORD *)&v627[8] = v627;
                          *(_QWORD *)&v627[16] = 0x3032000000;
                          v628 = __Block_byref_object_copy__755;
                          v629 = __Block_byref_object_dispose__756;
                          v630 = 0;
                          v428 = (void *)v574[5];
                          v534[0] = MEMORY[0x24BDAC760];
                          v534[1] = 3221225472;
                          v534[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_133;
                          v534[3] = &unk_24CAB1248;
                          v534[4] = self;
                          v536 = v627;
                          v414 = v422;
                          v535 = v414;
                          v429 = (id)objc_msgSend(v428, "performPlaybackRequest:completionHandler:", v415, v534);
                          v430 = dispatch_time(0, 1000000000 * v600);
                          if (dispatch_semaphore_wait(v414, v430))
                          {
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v431 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v432 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v431, "engineID");
                              v433 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v621 = 138543874;
                              v622 = v433;
                              v623 = 2114;
                              v624 = self;
                              v625 = 2048;
                              v626 = (id)v600;
                              _os_log_impl(&dword_210BD8000, v432, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out while attempting to acquire lease for playback keys [request aborted after %lds].", v621, 0x20u);

                            }
                            objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Subscription lease request timed out"));
                            v434 = objc_claimAutoreleasedReturnValue();
                            v435 = *(void **)(*(_QWORD *)&v627[8] + 40);
                            *(_QWORD *)(*(_QWORD *)&v627[8] + 40) = v434;

                          }
                          _MPCLogCategoryAnalytics();
                          v436 = objc_claimAutoreleasedReturnValue();
                          v437 = v436;
                          if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v436))
                          {
                            v438 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                            *(_DWORD *)v621 = 67240192;
                            LODWORD(v622) = v438;
                            _os_signpost_emit_with_name_impl(&dword_210BD8000, v437, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLeaseSessionPlaybackRequest", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v621, 8u);
                          }

                          if (*(_QWORD *)(*(_QWORD *)&v627[8] + 40))
                          {
                            (*((void (**)(void))v496 + 2))();
                            v417 = 0;
                          }
                          else
                          {
                            v417 = 1;
                          }

                          _Block_object_dispose(v627, 8);
                        }

                        _Block_object_dispose(v633, 8);
                        if (!v417)
                        {
                          v229 = 2;
                          v228 = 1;
LABEL_460:

                          _Block_object_dispose(buf, 8);
                          if ((v229 | 2) != 2)
                            goto LABEL_490;
                          if (!v228)
                          {
LABEL_480:
                            if (objc_msgSend(v12, "disarm"))
                            {
                              v393 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BDDCD10]);
                              -[MPCModelGenericAVItem itemError](self, "itemError");
                              v394 = (void *)objc_claimAutoreleasedReturnValue();
                              (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, v393, v394);

                            }
                            -[MPCModelGenericAVItem itemError](self, "itemError");
                            v395 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v395, "msv_analyticSignature");
                            v396 = objc_claimAutoreleasedReturnValue();
                            v397 = (void *)v396;
                            v398 = CFSTR("OK");
                            if (v396)
                              v398 = (__CFString *)v396;
                            v399 = v398;

                            _MPCLogCategoryAnalytics();
                            v400 = objc_claimAutoreleasedReturnValue();
                            v401 = v400;
                            if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v400))
                            {
                              -[MPCModelGenericAVItem analyticsContentType](self, "analyticsContentType");
                              v402 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                              v403 = objc_msgSend(v402, "UTF8String");
                              v404 = -[__CFString UTF8String](objc_retainAutorelease(v399), "UTF8String");
                              v405 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                              *(_DWORD *)buf = 136446722;
                              *(_QWORD *)&buf[4] = v403;
                              *(_WORD *)&buf[12] = 2082;
                              *(_QWORD *)&buf[14] = v404;
                              *(_WORD *)&buf[22] = 1026;
                              LODWORD(v637) = v405;
                              _os_signpost_emit_with_name_impl(&dword_210BD8000, v401, OS_SIGNPOST_INTERVAL_END, spid, "LoadAsset", " enableTelemetry=YES contentType=%{public, signpost.telemetry:string1, name=contentType}s result=%{public, signpost.telemetry:string2, name=result}s isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 0x1Cu);

                            }
                            objc_msgSend(v502, "endInterval");
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v406 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v407 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v407, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v406, "engineID");
                              v408 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              *(_QWORD *)&buf[4] = v408;
                              *(_WORD *)&buf[12] = 2114;
                              *(_QWORD *)&buf[14] = self;
                              _os_log_impl(&dword_210BD8000, v407, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset load finished.", buf, 0x16u);

                            }
                            goto LABEL_490;
                          }
LABEL_462:
                          v373 = (uint64_t (*)(uint64_t, uint64_t))(id)v607[5];
                          if (v373)
                          {
                            v374 = v373;
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v375 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v376 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
                            {
                              objc_msgSend(v375, "engineID");
                              v377 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543874;
                              *(_QWORD *)&buf[4] = v377;
                              *(_WORD *)&buf[12] = 2114;
                              *(_QWORD *)&buf[14] = self;
                              *(_WORD *)&buf[22] = 2114;
                              v637 = v374;
                              _os_log_impl(&dword_210BD8000, v376, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset loading failed with error: %{public}@", buf, 0x20u);

                            }
                            v378 = v374;
                            v379 = *MEMORY[0x24BDD1398];
                            v494 = v378;
                            do
                            {
                              objc_msgSend(v378, "userInfo");
                              v380 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v380, "objectForKey:", CFSTR("MPCErrorUserInfoKeyStoreDialogDictionary"));
                              v381 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend(v378, "userInfo");
                              v382 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v382, "objectForKey:", v379);
                              v383 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

                              if (!v383)
                                break;
                              v378 = v383;
                            }
                            while (!v381);

                            v384 = (uint64_t)v494;
                            if (objc_msgSend(v381, "count"))
                            {
                              objc_msgSend(v494, "userInfo");
                              v385 = (void *)objc_claimAutoreleasedReturnValue();
                              v386 = (id)objc_msgSend(v385, "mutableCopy");

                              if (!v386)
                                v386 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                              objc_msgSend(v386, "setObject:forKey:", v381, *MEMORY[0x24BDDBA28]);
                              v387 = (void *)MEMORY[0x24BDD1540];
                              objc_msgSend(v494, "domain");
                              v388 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v387, "errorWithDomain:code:userInfo:", v388, objc_msgSend(v494, "code"), v386);
                              v384 = objc_claimAutoreleasedReturnValue();

                            }
                            -[MPCModelGenericAVItem setItemError:](self, "setItemError:", v384);
                            v507 = 0u;
                            v508 = 0u;
                            v505 = 0u;
                            v506 = 0u;
                            v389 = v473;
                            v390 = objc_msgSend(v389, "countByEnumeratingWithState:objects:count:", &v505, v618, 16);
                            v495 = (void *)v384;
                            if (v390)
                            {
                              v391 = *(_QWORD *)v506;
                              do
                              {
                                for (i = 0; i != v390; ++i)
                                {
                                  if (*(_QWORD *)v506 != v391)
                                    objc_enumerationMutation(v389);
                                  -[MPCModelGenericAVItem addAdjunctError:](self, "addAdjunctError:", *(_QWORD *)(*((_QWORD *)&v505 + 1) + 8 * i));
                                }
                                v390 = objc_msgSend(v389, "countByEnumeratingWithState:objects:count:", &v505, v618, 16);
                              }
                              while (v390);
                            }

                          }
                          goto LABEL_480;
                        }
LABEL_291:
                        if ((v14[2](v14, 1705) & 1) != 0)
                        {
                          v228 = 0;
                          v229 = 1;
                          goto LABEL_460;
                        }
                        if (objc_msgSend(v476, "hasValidAsset")
                          && (objc_msgSend(v476, "isDownloadedAsset") & 1) == 0)
                        {
                          objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
                          v230 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v230, "rewrittenAssetInfo");
                          v231 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v231)
                          {
                            objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("assetType"));
                            v232 = (void *)objc_claimAutoreleasedReturnValue();
                            v233 = objc_msgSend(v476, "audioAssetType");
                            if (v233 == objc_msgSend(v232, "integerValue"))
                            {
                              objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("assetURL"));
                              v464 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("keyCertURL"));
                              obja = (id)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("keyServerURL"));
                              v457 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("isStoreKeyServer"));
                              v234 = (void *)objc_claimAutoreleasedReturnValue();
                              v442 = objc_msgSend(v234, "BOOLValue");

                              -[MPCModelGenericAVItem eventStream](self, "eventStream");
                              v235 = (void *)objc_claimAutoreleasedReturnValue();
                              _MPCLogCategoryPlayback();
                              v236 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend(v235, "engineID");
                                v237 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)v633 = 138544130;
                                *(_QWORD *)&v633[4] = v237;
                                *(_WORD *)&v633[12] = 2114;
                                *(_QWORD *)&v633[14] = self;
                                *(_WORD *)&v633[22] = 2114;
                                v634 = (uint64_t (*)(uint64_t, uint64_t))v476;
                                LOWORD(v635) = 2114;
                                *(_QWORD *)((char *)&v635 + 2) = v231;
                                _os_log_impl(&dword_210BD8000, v236, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Original asset %{public}@ is rewritten by defaults with %{public}@", v633, 0x2Au);

                              }
                              if (v464)
                              {
                                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v464);
                                v238 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v476, "setAssetURL:", v238);

                              }
                              if (obja)
                              {
                                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", obja);
                                v239 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v476, "setStreamingKeyCertificateURL:", v239);

                              }
                              if (v457)
                              {
                                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v457);
                                v240 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v476, "setStreamingKeyServerURL:", v240);

                              }
                            }
                            else
                            {
                              v442 = 1;
                            }

                          }
                          else
                          {
                            v442 = 1;
                          }

                        }
                        else
                        {
                          v442 = 1;
                        }
                        objc_msgSend(v476, "assetURL");
                        v479 = (void *)objc_claimAutoreleasedReturnValue();
                        v465 = (void *)objc_msgSend(v476, "assetQualityType");
                        v441 = (void *)objc_msgSend(v476, "assetProtectionType");
                        if (v500)
                        {
                          v241 = 0;
                          v242 = 0;
                        }
                        else
                        {
                          if (objc_msgSend(v476, "allowsAssetCaching")
                            && (objc_msgSend(v479, "isFileURL") & 1) == 0
                            && (objc_msgSend(v482, "recommendation") == 1 || objc_msgSend(v482, "recommendation") == 3))
                          {
                            objc_msgSend(v486, "assetCacheProvider");
                            v287 = (void *)objc_claimAutoreleasedReturnValue();
                            v242 = objc_msgSend(v287, "isUnderDailyCacheAssetDownloadLimit");

                            if ((v242 & v470) == 1)
                            {
                              objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
                              v288 = (void *)objc_claimAutoreleasedReturnValue();
                              v289 = objc_msgSend(v288, "disableHLSAssetCaching");

                              v242 = v289 ^ 1;
                            }
                          }
                          else
                          {
                            v242 = 0;
                          }
                          if ((objc_msgSend(v479, "isFileURL") & 1) != 0 || objc_msgSend(v482, "recommendation") != 2)
                          {
                            v241 = 0;
                          }
                          else
                          {
                            objc_msgSend(v486, "assetCacheProvider");
                            v243 = (void *)objc_claimAutoreleasedReturnValue();
                            v241 = v243 != 0;

                          }
                        }
                        v444 = v242;
                        if ((v242 & 1) != 0 || v241)
                        {
                          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                          v244 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v244, "UUIDString");
                          v245 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v245, "lowercaseString");
                          v246 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v486, "assetCacheProvider");
                          v247 = (void *)objc_claimAutoreleasedReturnValue();
                          v533 = 0;
                          v532 = 0;
                          objc_msgSend(v476, "assetPathExtension");
                          v248 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v247, "getPlaybackAssetDestinationURL:sharedCacheURL:purgeable:purchaseBundleDestinationURL:assetQualityType:fileName:pathExtension:", &v533, 0, !v241, &v532, v465, v246, v248);
                          v458 = (uint64_t (*)(uint64_t, uint64_t))v533;
                          v447 = v532;

                          if (!v458)
                          {
                            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                            v439 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v439, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItem.m"), 1774, CFSTR("Asset download destination URL can't be nil"));

                          }
                          objc_msgSend(v485, "setObject:forKey:");

                        }
                        else
                        {
                          if ((objc_msgSend(v479, "isFileURL") & 1) == 0 && (objc_msgSend(v476, "isHLSAsset") & 1) == 0)
                            objc_msgSend(v485, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB2200]);
                          v458 = 0;
                          v447 = 0;
                        }
                        objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
                        v249 = (void *)objc_claimAutoreleasedReturnValue();
                        v250 = objc_msgSend(v249, "preferredMusicLowBandwidthResolution");
                        v445 = v250 > 0;

                        v251 = objc_msgSend(v479, "isFileURL");
                        if (v250 > 0)
                          v252 = 1;
                        else
                          v252 = v251;
                        if ((v252 & 1) == 0)
                          objc_msgSend(v485, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDB2108]);
                        v493 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                        -[MPCModelGenericAVItem _rtcReportingServiceIdentifierWithAssetURL:](self, "_rtcReportingServiceIdentifierWithAssetURL:", v479);
                        v253 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v253)
                        {
                          objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, v253);
                          objc_msgSend(v493, "setObject:forKey:", v253, *MEMORY[0x24BDB2138]);
                        }
                        v446 = v253;
                        -[MPCModelGenericAVItem _rtcReportingMediaIdentifierWithAssetLoadProperties:](self, "_rtcReportingMediaIdentifierWithAssetLoadProperties:", v486);
                        v450 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v493, "setObject:forKey:", v450, *MEMORY[0x24BDB2128]);
                        objc_msgSend(v493, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB2140]);
                        objc_msgSend(v486, "storefrontID");
                        v254 = (void *)objc_claimAutoreleasedReturnValue();
                        v255 = v254 == 0;

                        if (!v255)
                        {
                          objc_msgSend(v486, "storefrontID");
                          v256 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v493, "setObject:forKey:", v256, CFSTR("StorefrontID"));

                        }
                        objc_msgSend(v485, "setObject:forKey:", v493, *MEMORY[0x24BDB2130]);
                        objc_msgSend(v485, "setObject:forKeyedSubscript:", &unk_24CB16860, *MEMORY[0x24BDB21F0]);
                        objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v479, v485);
                        objb = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                        -[MPCModelGenericAVItem eventStream](self, "eventStream");
                        v257 = (void *)objc_claimAutoreleasedReturnValue();
                        _MPCLogCategoryPlayback();
                        v258 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v257, "engineID");
                          v259 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v633 = 138544130;
                          *(_QWORD *)&v633[4] = v259;
                          *(_WORD *)&v633[12] = 2114;
                          *(_QWORD *)&v633[14] = self;
                          *(_WORD *)&v633[22] = 2114;
                          v634 = objb;
                          LOWORD(v635) = 2114;
                          *(_QWORD *)((char *)&v635 + 2) = v485;
                          _os_log_impl(&dword_210BD8000, v258, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: AVURLAsset %{public}@ - options: %{public}@", v633, 0x2Au);

                        }
                        if (!objb)
                          goto LABEL_459;
                        +[MPCPlaybackPerformanceController sharedController](MPCPlaybackPerformanceController, "sharedController");
                        v260 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v260, "markCDNConnectionWarmed");

                        if ((objc_msgSend(v479, "isFileURL") & 1) == 0)
                        {
                          v261 = (void *)v592[5];
                          if (v261)
                            objc_msgSend(objb, "setIsExternalContent:", objc_msgSend(v261, "isTrustedHostForURL:", v479) ^ 1);
                        }
                        if ((objc_msgSend(v476, "isHLSAsset") & 1) != 0)
                        {
                          if (!objc_msgSend(v476, "isHLSAsset"))
                            goto LABEL_392;
                          LOBYTE(v440) = v442;
                          -[MPCModelGenericAVItem _prepareAssetForHLSPlayback:loadResult:destinationURL:storeRequestContext:urlBag:identityProperties:isStoreKeyServer:](self, "_prepareAssetForHLSPlayback:loadResult:destinationURL:storeRequestContext:urlBag:identityProperties:isStoreKeyServer:", objb, v476, v458, v490, v592[5], v497, v440);
                          if ((v444 & 1) != 0)
                          {
                            if (!v458)
                              goto LABEL_392;
                          }
                          else
                          {
                            if (v458)
                              v290 = v241;
                            else
                              v290 = 0;
                            if (!v290)
                              goto LABEL_392;
                          }
                          -[MPCModelGenericAVItem eventStream](self, "eventStream");
                          v291 = (void *)objc_claimAutoreleasedReturnValue();
                          _MPCLogCategoryPlayback();
                          v292 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
                          {
                            objc_msgSend(v291, "engineID");
                            v293 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v633 = 138543874;
                            *(_QWORD *)&v633[4] = v293;
                            *(_WORD *)&v633[12] = 2114;
                            *(_QWORD *)&v633[14] = self;
                            *(_WORD *)&v633[22] = 2114;
                            v634 = v458;
                            _os_log_impl(&dword_210BD8000, v292, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Initiating download to destination file %{public}@", v633, 0x20u);

                          }
                          _MPCLogCategoryAnalytics();
                          v294 = objc_claimAutoreleasedReturnValue();
                          v295 = v294;
                          if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v294))
                          {
                            *(_WORD *)v633 = 0;
                            _os_signpost_emit_with_name_impl(&dword_210BD8000, v295, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetHLSAssetDownload", ", v633, 2u);
                          }

                          -[MPCModelGenericAVItem _downloadHLSAssetWhilePlaying:assetLoadProperties:assetLoadResult:destinationURL:sharedCacheURL:storeRequestContext:urlBag:fileUpgradeRecommendation:](self, "_downloadHLSAssetWhilePlaying:assetLoadProperties:assetLoadResult:destinationURL:sharedCacheURL:storeRequestContext:urlBag:fileUpgradeRecommendation:", objb, v486, v476, v458, 0, v490, v592[5], objc_msgSend(v482, "recommendation"));
                          _MPCLogCategoryAnalytics();
                          v296 = objc_claimAutoreleasedReturnValue();
                          v297 = v296;
                          if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v296))
                          {
                            v298 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                            *(_DWORD *)v633 = 67240192;
                            *(_DWORD *)&v633[4] = v298;
                            _os_signpost_emit_with_name_impl(&dword_210BD8000, v297, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetHLSAssetDownload", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v633, 8u);
                          }

                        }
                        else
                        {
                          -[MPCModelGenericAVItem eventStream](self, "eventStream");
                          v262 = (void *)objc_claimAutoreleasedReturnValue();
                          _MPCLogCategoryPlayback();
                          v263 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
                          {
                            objc_msgSend(v262, "engineID");
                            v264 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v633 = 138543618;
                            *(_QWORD *)&v633[4] = v264;
                            *(_WORD *)&v633[12] = 2114;
                            *(_QWORD *)&v633[14] = self;
                            _os_log_impl(&dword_210BD8000, v263, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Initiating full online key retrieval [Non HLS Asset]", v633, 0x16u);

                          }
                          objc_msgSend(v485, "objectForKey:", *MEMORY[0x24BDB21D0]);
                          v265 = objc_claimAutoreleasedReturnValue();
                          v266 = *(void **)(*(_QWORD *)&buf[8] + 40);
                          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v265;

                          *(_QWORD *)v633 = 0;
                          *(_QWORD *)&v633[8] = v633;
                          *(_QWORD *)&v633[16] = 0x3032000000;
                          v634 = __Block_byref_object_copy__755;
                          *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
                          *((_QWORD *)&v635 + 1) = 0;
                          *(_QWORD *)v627 = 0;
                          *(_QWORD *)&v627[8] = v627;
                          *(_QWORD *)&v627[16] = 0x3032000000;
                          v628 = __Block_byref_object_copy__755;
                          v629 = __Block_byref_object_dispose__756;
                          v630 = 0;
                          v443 = objc_msgSend(v476, "onlineSubscriptionKeysRequired");
                          -[MPCModelGenericAVItem eventStream](self, "eventStream");
                          v267 = (void *)objc_claimAutoreleasedReturnValue();
                          _MPCLogCategoryPlayback_Oversize();
                          v268 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                          {
                            objc_msgSend(v267, "engineID");
                            v269 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
                            MPCPlaybackEngineEventPayloadJSONFromPayload(*(void **)(*(_QWORD *)&buf[8] + 40));
                            v270 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v621 = 138543874;
                            v622 = v269;
                            v623 = 2114;
                            v624 = self;
                            v625 = 2114;
                            v626 = v270;
                            _os_log_impl(&dword_210BD8000, v268, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using purchase bundle: %{public}@", v621, 0x20u);

                          }
                          if (v458)
                            v271 = dispatch_group_create();
                          else
                            v271 = 0;
                          v272 = v458;
                          if (v443)
                          {
                            -[MPCModelGenericAVItem eventStream](self, "eventStream");
                            v273 = (void *)objc_claimAutoreleasedReturnValue();
                            _MPCLogCategoryPlayback();
                            v274 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v273, "engineID");
                              v275 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)v621 = 138543618;
                              v622 = v275;
                              v623 = 2114;
                              v624 = self;
                              _os_log_impl(&dword_210BD8000, v274, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Attempting to load full subscription asset [first asset requires online keys]", v621, 0x16u);

                            }
                            objc_msgSend(v486, "setFollowUp:", 1);
                            v276 = objc_alloc_init(MPCModelGenericAVItemSubscriptionAssetLoadOperation);
                            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setAssetLoadProperties:](v276, "setAssetLoadProperties:", v486);
                            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setRequestContext:](v276, "setRequestContext:", v490);
                            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setOperationType:](v276, "setOperationType:", 1);
                            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setSubscriptionLeaseSession:](v276, "setSubscriptionLeaseSession:", v574[5]);
                            v527[0] = MEMORY[0x24BDAC760];
                            v527[1] = 3221225472;
                            v527[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_163;
                            v527[3] = &unk_24CAB1270;
                            v530 = v627;
                            v529 = v633;
                            v527[4] = self;
                            v531 = v458 != 0;
                            v277 = v271;
                            v528 = v277;
                            -[MPCModelGenericAVItemSubscriptionAssetLoadOperation setResponseHandler:](v276, "setResponseHandler:", v527);
                            if (v458)
                              dispatch_group_enter(v277);
                            objc_msgSend(v474, "addOperation:", v276);

                            v272 = v458;
                          }
                          v164 = v272 == 0;
                          v278 = v444;
                          if (v164)
                            v278 = 0;
                          if (v278 == 1)
                          {
                            _MPCLogCategoryPlayback();
                            v279 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v621 = 138543362;
                              v622 = self;
                              _os_log_impl(&dword_210BD8000, v279, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: [Asset caching: CRABS] Initiating caching", v621, 0xCu);
                            }

                            _MPCLogCategoryAnalytics();
                            v280 = objc_claimAutoreleasedReturnValue();
                            v281 = v280;
                            if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v280))
                            {
                              *(_WORD *)v621 = 0;
                              _os_signpost_emit_with_name_impl(&dword_210BD8000, v281, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetCRABSAssetDownload", ", v621, 2u);
                            }

                            objc_msgSend(objb, "downloadDestinationURL");
                            v282 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_initWeak((id *)v621, self);
                            v514[0] = MEMORY[0x24BDAC760];
                            v514[1] = 3221225472;
                            v514[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_166;
                            v514[3] = &unk_24CAB1328;
                            objc_copyWeak(v525, (id *)v621);
                            v515 = v486;
                            v283 = v282;
                            v516 = v283;
                            v517 = v458;
                            v518 = 0;
                            v526 = v443;
                            v519 = v447;
                            v520 = v271;
                            v522 = v627;
                            v523 = v633;
                            v521 = v479;
                            v524 = buf;
                            v525[1] = v465;
                            v525[2] = v441;
                            objc_msgSend(objb, "mpc_addDownloadCompletionHandler:", v514);
                            _MPCLogCategoryAnalytics();
                            v284 = objc_claimAutoreleasedReturnValue();
                            v285 = v284;
                            if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v284))
                            {
                              v286 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                              *(_DWORD *)v619 = 67240192;
                              v620 = v286;
                              _os_signpost_emit_with_name_impl(&dword_210BD8000, v285, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetCRABSAssetDownload", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v619, 8u);
                            }

                            objc_destroyWeak(v525);
                            objc_destroyWeak((id *)v621);

                          }
                          _Block_object_dispose(v627, 8);

                          _Block_object_dispose(v633, 8);
                        }
LABEL_392:
                        v299 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BDDCD08]);
                        objc_storeStrong(v299, objb);
                        _MPCLogCategoryAnalytics();
                        v300 = objc_claimAutoreleasedReturnValue();
                        v301 = v300;
                        if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v300))
                        {
                          v302 = -[__CFString UTF8String](objc_retainAutorelease(v455), "UTF8String");
                          *(_DWORD *)v633 = 136446210;
                          *(_QWORD *)&v633[4] = v302;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v301, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetCreateAVPlayerItem", "contentType=%{public, signpost.telemetry:string1, name=contentType}s", v633, 0xCu);
                        }

                        objc_msgSend(MEMORY[0x24BDB2618], "playerItemWithAsset:", *v299);
                        v466 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(v303) = v34;
                        objc_msgSend(v466, "setVolumeAdjustment:", v303);
                        if (v488)
                          objc_msgSend(v466, "setMediaKind:", v488);
                        objc_msgSend(v466, "setAudioTimePitchAlgorithm:", *MEMORY[0x24BDB1A00]);
                        if (v448 && (objc_msgSend(v486, "prefersVideoContent") & 1) == 0)
                          objc_msgSend(v466, "setPlaybackLikelyToKeepUpTrigger:", 1);
                        if (v470)
                        {
                          objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
                          v304 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v304, "registerObserver:", self);

                          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
                          v305 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
                          v306 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v305, "addObserver:selector:name:object:", self, sel__allowsHighQualityMusicStreamingOnCellularDidChangeNotification_, *MEMORY[0x24BDDC540], v306);

                          if (objc_msgSend(v486, "prefersVideoContent"))
                            v307 = 2;
                          else
                            v307 = 1;
                          -[MPCModelGenericAVItem _applyPreferredPeakBitRateToPlayerItem:withItemType:](self, "_applyPreferredPeakBitRateToPlayerItem:withItemType:", v466, v307);
                        }
                        if (objc_msgSend(v486, "prefersVideoContent")
                          && objc_msgSend(v476, "isHLSAsset"))
                        {
                          objc_msgSend(v466, "setAllowedAudioSpatializationFormats:", 7);
                        }
                        v308 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                        v309 = CFSTR("FollowingItem");
                        if (v308)
                          v309 = CFSTR("StartItem");
                        v310 = v309;
                        -[MPCModelGenericAVItem isSiriInitiated](self, "isSiriInitiated");
                        v311 = (void *)objc_claimAutoreleasedReturnValue();
                        v312 = objc_msgSend(v311, "BOOLValue");

                        if (v312)
                        {
                          -[__CFString stringByAppendingString:](v310, "stringByAppendingString:", CFSTR("-Siri"));
                          v313 = objc_claimAutoreleasedReturnValue();

                          v314 = (id)v313;
                        }
                        else
                        {
                          v314 = v310;
                        }
                        v449 = v314;
                        objc_msgSend(v466, "setReportingCategory:");
                        -[MPCModelGenericAVItem setPlayerItem:](self, "setPlayerItem:", v466);
                        objc_msgSend(v476, "willBecomeActivePlayerItemHandler");
                        v315 = (void *)objc_claimAutoreleasedReturnValue();
                        firstBecomeActivePlayerItemBlock = self->_firstBecomeActivePlayerItemBlock;
                        self->_firstBecomeActivePlayerItemBlock = v315;

                        objc_msgSend(v476, "alternateHLSKeyCertificateURL");
                        v317 = (void *)objc_claimAutoreleasedReturnValue();
                        v318 = v317;
                        if (!v317)
                        {
                          objc_msgSend(v476, "streamingKeyCertificateURL");
                          v318 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_storeStrong((id *)&self->_streamingKeyCertificateURL, v318);
                        if (!v317)

                        objc_msgSend(v476, "alternateHLSKeyServerURL");
                        v319 = (void *)objc_claimAutoreleasedReturnValue();
                        v320 = v319;
                        if (!v319)
                        {
                          objc_msgSend(v476, "streamingKeyServerURL");
                          v320 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_storeStrong((id *)&self->_streamingKeyServerURL, v320);
                        if (!v319)

                        self->_isiTunesStoreStream = objc_msgSend(v476, "isiTunesStoreStream");
                        objc_msgSend(v486, "audioAssetTypeSelection");
                        v321 = (MPCAudioAssetTypeSelection *)objc_claimAutoreleasedReturnValue();
                        preferredAudioAssetTypeSelection = self->_preferredAudioAssetTypeSelection;
                        self->_preferredAudioAssetTypeSelection = v321;

                        self->_preferredAudioAssetType = objc_msgSend(v486, "preferredAudioAssetType");
                        self->_loadedAudioAssetType = objc_msgSend(v476, "audioAssetType");
                        self->_downloadedAsset = objc_msgSend(v476, "isDownloadedAsset");
                        if (v481)
                          v323 = 1;
                        else
                          v323 = -[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset");
                        self->_allowsAirPlayFromCloud = v323;
                        self->_isMusicCellularStreamingAllowed = v445;
                        self->_isSubscriptionPolicyContent = v451;
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v471);
                        v324 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v324, CFSTR("item-asset-endpoint-type"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v500 != 0);
                        v325 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v325, CFSTR("item-asset-is-delegated-playback"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v451);
                        v326 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v326, CFSTR("item-asset-is-subscription-content"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v476, "source"));
                        v327 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v327, CFSTR("item-asset-source"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v476, "assetProtectionType"));
                        v328 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v328, CFSTR("item-asset-protection-type"));

                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v479, CFSTR("item-asset-url"));
                        objc_msgSend(v476, "assetURL");
                        v329 = (void *)objc_claimAutoreleasedReturnValue();
                        v330 = objc_msgSend(v329, "isFileURL");

                        if (v330)
                        {
                          v331 = (void *)MEMORY[0x24BDD16E0];
                          if (objc_msgSend(v476, "isDownloadedAsset"))
                            v332 = 3;
                          else
                            v332 = 1;
                          objc_msgSend(v331, "numberWithInteger:", v332);
                          v333 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v503, "setObject:forKeyedSubscript:", v333, CFSTR("item-asset-location"));

                          objc_msgSend(v476, "assetURL");
                          v334 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                          v335 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v334, "path");
                          v336 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v335, "attributesOfItemAtPath:error:", v336, 0);
                          v337 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v337, "fileModificationDate");
                          v338 = (void *)objc_claimAutoreleasedReturnValue();
                          v339 = v338;
                          if (v338)
                          {
                            v340 = v338;
                          }
                          else
                          {
                            objc_msgSend(v337, "fileCreationDate");
                            v340 = (id)objc_claimAutoreleasedReturnValue();

                          }
                          if (v340)
                          {
                            v341 = (void *)MEMORY[0x24BDD16E0];
                            objc_msgSend(v340, "timeIntervalSinceNow");
                            objc_msgSend(v341, "numberWithDouble:", -v342);
                            v343 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v503, "setObject:forKeyedSubscript:", v343, CFSTR("item-asset-cache-age"));

                          }
                        }
                        else
                        {
                          objc_msgSend(v503, "setObject:forKeyedSubscript:", &unk_24CB16878, CFSTR("item-asset-location"));
                        }
                        objc_msgSend(v466, "mpc_playerItemIdentifier");
                        v344 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v344, CFSTR("player-item-identifier"));

                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v476, "audioAssetType"));
                        v345 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v345, CFSTR("item-asset-type"));

                        +[MPCPlaybackPerformanceController sharedController](MPCPlaybackPerformanceController, "sharedController");
                        v346 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v346, "experimentID");
                        v347 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v347, CFSTR("experiment-id"));

                        objc_msgSend(v346, "treatmentID");
                        v348 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v348, CFSTR("experiment-treatment-id"));

                        objc_msgSend(v346, "deploymentID");
                        v349 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v503, "setObject:forKeyedSubscript:", v349, CFSTR("experiment-deployment-id"));

                        -[MPCModelGenericAVItem _emitAudioAssetTypeSelection:assetLoadInfo:](self, "_emitAudioAssetTypeSelection:assetLoadInfo:", self->_preferredAudioAssetTypeSelection, v503);
                        _MPCLogCategoryAnalytics();
                        v350 = objc_claimAutoreleasedReturnValue();
                        v351 = v350;
                        if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v350))
                        {
                          v352 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                          *(_DWORD *)v633 = 67240192;
                          *(_DWORD *)&v633[4] = v352;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v351, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetCreateAVPlayerItem", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v633, 8u);
                        }

                        objc_msgSend(v476, "suzeLeaseID");
                        v353 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v353)
                          goto LABEL_458;
                        -[MPCModelGenericAVItem eventStream](self, "eventStream");
                        v354 = (void *)objc_claimAutoreleasedReturnValue();
                        _MPCLogCategoryPlayback();
                        v355 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v355, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v354, "engineID");
                          v356 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v633 = 138543618;
                          *(_QWORD *)&v633[4] = v356;
                          *(_WORD *)&v633[12] = 2114;
                          *(_QWORD *)&v633[14] = self;
                          _os_log_impl(&dword_210BD8000, v355, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Starting Suze lease session...", v633, 0x16u);

                        }
                        _MPCLogCategoryAnalytics();
                        v357 = objc_claimAutoreleasedReturnValue();
                        v358 = v357;
                        if (v498 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v357))
                        {
                          *(_WORD *)v633 = 0;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v358, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetSuzeLeaseSession", ", v633, 2u);
                        }

                        *(_QWORD *)v633 = 0;
                        *(_QWORD *)&v633[8] = v633;
                        *(_QWORD *)&v633[16] = 0x3032000000;
                        v634 = __Block_byref_object_copy__755;
                        *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
                        *((_QWORD *)&v635 + 1) = 0;
                        *(_QWORD *)v627 = 0;
                        *(_QWORD *)&v627[8] = v627;
                        *(_QWORD *)&v627[16] = 0x3032000000;
                        v628 = __Block_byref_object_copy__755;
                        v629 = __Block_byref_object_dispose__756;
                        v630 = 0;
                        v359 = dispatch_semaphore_create(0);
                        v472 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A20]), "initWithRequestContext:leaseID:mediaType:", v490, v353, -[MPCModelGenericAVItem _suzeLeaseMediaType](self, "_suzeLeaseMediaType"));
                        +[MPCSuzeLeaseSessionController sharedController](MPCSuzeLeaseSessionController, "sharedController");
                        v360 = (void *)objc_claimAutoreleasedReturnValue();
                        v510[0] = MEMORY[0x24BDAC760];
                        v510[1] = 3221225472;
                        v510[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_201;
                        v510[3] = &unk_24CAB1350;
                        v512 = v627;
                        v513 = v633;
                        v510[4] = self;
                        v361 = v359;
                        v511 = v361;
                        objc_msgSend(v360, "startLeaseSessionWithConfiguration:completion:", v472, v510);
                        v362 = dispatch_time(0, 1000000000 * *((_QWORD *)&v600 + 1));
                        if (dispatch_semaphore_wait(v361, v362))
                        {
                          _MPCLogCategoryPlayback();
                          v363 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR))
                          {
                            v364 = *(MPCModelGenericAVItem **)(*(_QWORD *)&v633[8] + 40);
                            *(_DWORD *)v621 = 138543874;
                            v622 = self;
                            v623 = 2114;
                            v624 = v364;
                            v625 = 2048;
                            v626 = (id)*((_QWORD *)&v600 + 1);
                            _os_log_impl(&dword_210BD8000, v363, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out creating Suze lease session: %{public}@ [request aborted after %lds].", v621, 0x20u);
                          }
                        }
                        else
                        {
                          v365 = *(void **)(*(_QWORD *)&v627[8] + 40);
                          if (v365)
                          {
                            objc_storeStrong((id *)&self->_suzeLeaseSession, v365);
                            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
                            v366 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v366, "addObserver:selector:name:object:", self, sel__suzeLeaseSessionRenewDidFailNotification_, CFSTR("MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification"), v360);

                            v367 = MEMORY[0x24BDAC9B8];
                            v368 = MEMORY[0x24BDAC9B8];
                            block[0] = MEMORY[0x24BDAC760];
                            block[1] = 3221225472;
                            block[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_205;
                            block[3] = &unk_24CABA2D0;
                            block[4] = self;
                            dispatch_async(v367, block);

                            goto LABEL_454;
                          }
                          _MPCLogCategoryPlayback();
                          v363 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR))
                          {
                            v369 = *(MPCModelGenericAVItem **)(*(_QWORD *)&v633[8] + 40);
                            *(_DWORD *)v621 = 138543618;
                            v622 = self;
                            v623 = 2114;
                            v624 = v369;
                            _os_log_impl(&dword_210BD8000, v363, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed to create suze lease with error: %{public}@.", v621, 0x16u);
                          }
                        }

LABEL_454:
                        _MPCLogCategoryAnalytics();
                        v370 = objc_claimAutoreleasedReturnValue();
                        v371 = v370;
                        if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v370))
                        {
                          v372 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
                          *(_DWORD *)v621 = 67240192;
                          LODWORD(v622) = v372;
                          _os_signpost_emit_with_name_impl(&dword_210BD8000, v371, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetSuzeLeaseSession", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v621, 8u);
                        }

                        _Block_object_dispose(v627, 8);
                        _Block_object_dispose(v633, 8);

LABEL_458:
LABEL_459:

                        v228 = 0;
                        v229 = 0;
                        goto LABEL_460;
                      }
                      -[MPCModelGenericAVItem eventStream](self, "eventStream");
                      v222 = (void *)objc_claimAutoreleasedReturnValue();
                      _MPCLogCategoryPlayback();
                      v223 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v222, "engineID");
                        v227 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v633 = 138543618;
                        *(_QWORD *)&v633[4] = v227;
                        *(_WORD *)&v633[12] = 2114;
                        *(_QWORD *)&v633[14] = self;
                        _os_log_impl(&dword_210BD8000, v223, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Lease session invalid, skipping key loading.", v633, 0x16u);

                      }
                    }
                    else
                    {
                      -[MPCModelGenericAVItem eventStream](self, "eventStream");
                      v222 = (void *)objc_claimAutoreleasedReturnValue();
                      _MPCLogCategoryPlayback();
                      v223 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v222, "engineID");
                        v226 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v633 = 138543618;
                        *(_QWORD *)&v633[4] = v226;
                        *(_WORD *)&v633[12] = 2114;
                        *(_QWORD *)&v633[14] = self;
                        _os_log_impl(&dword_210BD8000, v223, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not subscription content, skipping playback key check.", v633, 0x16u);

                      }
                    }
                  }
                  else
                  {
                    -[MPCModelGenericAVItem eventStream](self, "eventStream");
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    _MPCLogCategoryPlayback();
                    v223 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v222, "engineID");
                      v224 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v633 = 138543874;
                      *(_QWORD *)&v633[4] = v224;
                      *(_WORD *)&v633[12] = 2114;
                      *(_QWORD *)&v633[14] = self;
                      *(_WORD *)&v633[22] = 2048;
                      v634 = (uint64_t (*)(uint64_t, uint64_t))v210;
                      _os_log_impl(&dword_210BD8000, v223, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Protection type is %li, skipping subscription key check.", v633, 0x20u);

                    }
                  }
                }

                goto LABEL_291;
              }
            }
            else if (v471 == 2)
            {
              objc_msgSend(v486, "itemIdentifiers");
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v185, "personalizedStore");
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              v187 = objc_msgSend(v186, "cloudID");

              if (v187)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v187);
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                v189 = CFSTR("match");
                goto LABEL_236;
              }
            }
            v188 = 0;
            goto LABEL_246;
          }
          objc_msgSend(v490, "userAgent");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v169)
          {
LABEL_216:
            if ((v470 & 1) != 0)
            {
              v179 = (_QWORD *)MEMORY[0x24BDB2198];
            }
            else
            {
              if (self->_radioStreamPlayback)
                goto LABEL_224;
              if (CFPreferencesGetAppBooleanValue(CFSTR("DisableOptimizeAccessForLinearMoviePlayback"), CFSTR("com.apple.mobileipod"), 0))
              {
                -[MPCModelGenericAVItem eventStream](self, "eventStream");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                _MPCLogCategoryPlayback();
                v181 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v180, "engineID");
                  v182 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v633 = 138543618;
                  *(_QWORD *)&v633[4] = v182;
                  *(_WORD *)&v633[12] = 2114;
                  *(_QWORD *)&v633[14] = self;
                  _os_log_impl(&dword_210BD8000, v181, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: not enabling AVURLAssetOptimizeAccessForLinearMoviePlaybackKey because its disabled in settings", v633, 0x16u);

                }
                goto LABEL_224;
              }
              v179 = (_QWORD *)MEMORY[0x24BDB21A8];
            }
            objc_msgSend(v485, "setObject:forKey:", MEMORY[0x24BDBD1C8], *v179);
LABEL_224:

            goto LABEL_225;
          }
          v170 = (void *)v592[5];
          objc_msgSend(v476, "assetURL");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v170, "isTrustedHostForURL:", v171) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            v173 = objc_msgSend(v172, "isROSDevice");

            if (!v173)
            {
LABEL_215:
              v631 = *MEMORY[0x24BEC85B0];
              v632 = v169;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v632, &v631, 1);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v485, "setObject:forKey:", v178, *MEMORY[0x24BDB2188]);

              goto LABEL_216;
            }
          }
          else
          {

          }
          v174 = objc_alloc(MEMORY[0x24BEC8980]);
          objc_msgSend(v490, "clientInfo");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = (void *)objc_msgSend(v174, "initWithClientInfo:", v175);
          objc_msgSend(v176, "userAgent");
          v177 = objc_claimAutoreleasedReturnValue();

          v169 = (void *)v177;
          if (!v177)
            goto LABEL_216;
          goto LABEL_215;
        }
LABEL_490:

        goto LABEL_491;
      }
      _MPCLogCategoryAnalytics();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v75, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetHomeSharingLoadOperation", ", buf, 2u);
      }

      v76 = objc_alloc_init(MPCModelGenericAVItemHomeSharingLoadOperation);
      -[MPCModelGenericAVItemHomeSharingLoadOperation setAssetLoadProperties:](v76, "setAssetLoadProperties:", v486);
      v77 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v637 = __Block_byref_object_copy__755;
      *(_QWORD *)v638 = __Block_byref_object_dispose__756;
      *(_QWORD *)&v638[8] = 0;
      *(_QWORD *)v633 = 0;
      *(_QWORD *)&v633[8] = v633;
      *(_QWORD *)&v633[16] = 0x3032000000;
      v634 = __Block_byref_object_copy__755;
      *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
      *((_QWORD *)&v635 + 1) = 0;
      v554[0] = MEMORY[0x24BDAC760];
      v554[1] = 3221225472;
      v554[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_94;
      v554[3] = &unk_24CAB11D0;
      v556 = buf;
      v557 = v633;
      v78 = v77;
      v555 = v78;
      -[MPCModelGenericAVItemHomeSharingLoadOperation setResponseHandler:](v76, "setResponseHandler:", v554);
      objc_msgSend(v474, "addOperation:", v76);
      v79 = dispatch_time(0, 1000000000 * v598);
      if (dispatch_semaphore_wait(v78, v79))
      {
        -[MPAsyncOperation cancel](v76, "cancel");
        _MPCLogCategoryPlayback();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v627 = 138543618;
          *(_QWORD *)&v627[4] = self;
          *(_WORD *)&v627[12] = 2048;
          *(_QWORD *)&v627[14] = v598;
          _os_log_impl(&dword_210BD8000, v80, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load home sharing asset [request aborted after %lds].", v627, 0x16u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out while attempting to load home sharing asset"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *))v496 + 2))(v496, v81);
      }
      else
      {
        v468 = *(id *)(*(_QWORD *)&buf[8] + 40);

        (*((void (**)(void *, _QWORD))v496 + 2))(v496, *(_QWORD *)(*(_QWORD *)&v633[8] + 40));
        if (!v468)
        {
          v476 = 0;
LABEL_82:
          _MPCLogCategoryAnalytics();
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = v84;
          if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
          {
            v86 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
            *(_DWORD *)v627 = 67240192;
            *(_DWORD *)&v627[4] = v86;
            _os_signpost_emit_with_name_impl(&dword_210BD8000, v85, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetHomeSharingLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
          }

          _Block_object_dispose(v633, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_86;
        }
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCLogCategoryPlayback();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v81, "engineID");
          v83 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v627 = 138543618;
          *(_QWORD *)&v627[4] = v83;
          *(_WORD *)&v627[12] = 2114;
          *(_QWORD *)&v627[14] = self;
          v477 = (void *)v83;
          _os_log_impl(&dword_210BD8000, v82, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using home sharing asset.", v627, 0x16u);

        }
        v476 = v468;
      }

      goto LABEL_82;
    }
    if (v500)
    {
      v61 = 0;
      v476 = 0;
      goto LABEL_67;
    }
    _MPCLogCategoryAnalytics();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = v62;
    if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v63, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LoadAssetLocalFileLoadOperation", ", buf, 2u);
    }

    v58 = -[MPCModelGenericAVItemLocalFileLoadOperation initWithEvaluation:properties:]([MPCModelGenericAVItemLocalFileLoadOperation alloc], "initWithEvaluation:properties:", v482, v486);
    -[MPCModelGenericAVItemLocalFileLoadOperation setRequirePreferredAssetQuality:](v58, "setRequirePreferredAssetQuality:", 1);
    v64 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v637 = __Block_byref_object_copy__755;
    *(_QWORD *)v638 = __Block_byref_object_dispose__756;
    *(_QWORD *)&v638[8] = 0;
    *(_QWORD *)v633 = 0;
    *(_QWORD *)&v633[8] = v633;
    *(_QWORD *)&v633[16] = 0x3032000000;
    v634 = __Block_byref_object_copy__755;
    *(_QWORD *)&v635 = __Block_byref_object_dispose__756;
    *((_QWORD *)&v635 + 1) = 0;
    v558[0] = MEMORY[0x24BDAC760];
    v558[1] = 3221225472;
    v558[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_89;
    v558[3] = &unk_24CAB11D0;
    v560 = buf;
    v561 = v633;
    v59 = v64;
    v559 = v59;
    -[MPCModelGenericAVItemLocalFileLoadOperation setResponseHandler:](v58, "setResponseHandler:", v558);
    objc_msgSend(v474, "addOperation:", v58);
    v65 = dispatch_time(0, 1000000000 * *((_QWORD *)&v597 + 1));
    if (dispatch_semaphore_wait(v59, v65))
    {
      -[MPAsyncOperation cancel](v58, "cancel");
      _MPCLogCategoryPlayback();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v627 = 138543618;
        *(_QWORD *)&v627[4] = self;
        *(_WORD *)&v627[12] = 2048;
        *(_QWORD *)&v627[14] = *((_QWORD *)&v597 + 1);
        _os_log_impl(&dword_210BD8000, v66, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Timed out while attempting to load local file of specified quality [request aborted after %lds].", v627, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out while attempting to load local file of specified quality"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v496 + 2))(v496, v67);
      v476 = 0;
    }
    else
    {
      v68 = *(id *)(*(_QWORD *)&buf[8] + 40);
      (*((void (**)(void *, _QWORD))v496 + 2))(v496, *(_QWORD *)(*(_QWORD *)&v633[8] + 40));
      v476 = v68;
      if (!v68)
      {
        v476 = 0;
LABEL_62:
        _MPCLogCategoryAnalytics();
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = v71;
        if (v498 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
        {
          v73 = -[MPCModelGenericAVItem isStartItem](self, "isStartItem");
          *(_DWORD *)v627 = 67240192;
          *(_DWORD *)&v627[4] = v73;
          _os_signpost_emit_with_name_impl(&dword_210BD8000, v72, OS_SIGNPOST_INTERVAL_END, spid, "LoadAssetLocalFileLoadOperation", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v627, 8u);
        }

        _Block_object_dispose(v633, 8);
        _Block_object_dispose(buf, 8);

        v61 = 0;
        goto LABEL_66;
      }
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v67, "engineID");
        v467 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "assetURL");
        v70 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v627 = 138543874;
        *(_QWORD *)&v627[4] = v467;
        *(_WORD *)&v627[12] = 2114;
        *(_QWORD *)&v627[14] = self;
        *(_WORD *)&v627[22] = 2114;
        v628 = v70;
        _os_log_impl(&dword_210BD8000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Using local file asset at path: %{public}@.", v627, 0x20u);

      }
    }

    goto LABEL_62;
  }
  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[MPCModelGenericAVItem itemError](self, "itemError");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v32;
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Returning asset load early with error: %{public}@", buf, 0x16u);

  }
LABEL_494:

}

- (id)_decorateAssetLoadResult:(id)a3 withURLBag:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  os_log_t v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  MPCModelGenericAVItem *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7 && ((objc_msgSend(v6, "isHLSAsset") & 1) != 0 || objc_msgSend(v6, "audioAssetType") > 1))
  {
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v37 = 0;
    -[MPCModelGenericAVItem _getHLSServerDataForLoadResults:bag:keyCertificateURL:keyServerURL:keyServerAdamID:keyServerProtocolType:](self, "_getHLSServerDataForLoadResults:bag:keyCertificateURL:keyServerURL:keyServerAdamID:keyServerProtocolType:", v6, v7, &v38, &v37, &v36, &v39);
    v8 = v38;
    v9 = v37;
    v10 = v36;
    objc_msgSend(v6, "streamingKeyCertificateURL");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == v8)
    {

    }
    else
    {
      v13 = objc_msgSend(v11, "isEqual:", v8);

      if (!v13)
        goto LABEL_12;
    }
    objc_msgSend(v6, "streamingKeyServerURL");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 == v9)
    {

    }
    else
    {
      v17 = -[NSObject isEqual:](v15, "isEqual:", v9);

      if ((v17 & 1) == 0)
      {

LABEL_12:
        goto LABEL_16;
      }
    }
    objc_msgSend(v6, "streamingKeyAdamID");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18 == v10)
    {

LABEL_30:
      goto LABEL_31;
    }
    v19 = v18;
    v20 = objc_msgSend(v18, "isEqual:", v10);

    if ((v20 & 1) != 0)
    {
LABEL_31:
      v34 = v6;

      goto LABEL_32;
    }
LABEL_16:
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "engineID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v23;
      v42 = 2114;
      v43 = self;
      v44 = 2114;
      v45 = v6;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Non-decorated asset load results for HLS playback: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v6, "streamingKeyCertificateURL");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (id)v24;
    else
      v26 = v8;
    objc_msgSend(v6, "setStreamingKeyCertificateURL:", v26);

    objc_msgSend(v6, "streamingKeyServerURL");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (id)v27;
    else
      v29 = v9;
    objc_msgSend(v6, "setStreamingKeyServerURL:", v29);

    objc_msgSend(v6, "streamingKeyAdamID");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
      v32 = (id)v30;
    else
      v32 = v10;
    objc_msgSend(v6, "setStreamingKeyAdamID:", v32);

    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "engineID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v33;
      v42 = 2114;
      v43 = self;
      v44 = 2114;
      v45 = v6;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Decorated asset load results for HLS playback: %{public}@", buf, 0x20u);

    }
    goto LABEL_30;
  }
  v14 = v6;
LABEL_32:

  return v6;
}

- (BOOL)_isAssetLoadResultValidForPlayback:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "hasValidAsset"))
  {
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isHLSAsset"))
  {
    if (objc_msgSend(v5, "audioAssetType") >= 2)
    {
      objc_msgSend(v5, "streamingKeyServerURL");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6
        || (v7 = (void *)v6,
            objc_msgSend(v5, "streamingKeyCertificateURL"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v7,
            !v8))
      {
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v5, "streamingKeyServerURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(v10, "addObject:", CFSTR("key server URL"));
        objc_msgSend(v5, "streamingKeyCertificateURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v10, "addObject:", CFSTR("key certificate URL"));
        v13 = (void *)MEMORY[0x24BDD1540];
        v19 = *MEMORY[0x24BDD0FC8];
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" - "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Missing key URLs: %@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 65, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (void)_prepareAssetForHLSPlayback:(id)a3 loadResult:(id)a4 destinationURL:(id)a5 storeRequestContext:(id)a6 urlBag:(id)a7 identityProperties:(id)a8 isStoreKeyServer:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  MPCModelGenericAVItem *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  ICContentKeySession *v45;
  ICContentKeySession *contentKeySession;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  MPCModelGenericAVItem *v57;
  void *v58;
  void *v59;
  void *v60;
  int IsWatch;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  MPCModelGenericAVItem *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  MPCModelGenericAVItem *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  MPCModelGenericAVItem *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  uint8_t buf[4];
  MPCModelGenericAVItem *v92;
  __int16 v93;
  MPCModelGenericAVItem *v94;
  __int16 v95;
  _BYTE v96[14];
  __int16 v97;
  int v98;
  _QWORD v99[5];

  v99[3] = *MEMORY[0x24BDAC8D0];
  v89 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = objc_msgSend(v14, "source");
  v19 = v18;
  v88 = v15;
  if (v15 || v18 == 1)
  {
    objc_msgSend(v14, "assetURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isFileURL") & 1) != 0)
    {
      objc_msgSend(v14, "assetURL");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v15;
    }
    v23 = v22;

    if (v23)
    {
      v24 = objc_alloc(MEMORY[0x24BEC87C8]);
      objc_msgSend(v23, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "initWithPath:", v25);

      v20 = (id)v26;
    }
    else
    {
      v20 = objc_alloc_init(MEMORY[0x24BEC8860]);
    }

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v14, "keyServerProtocolType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27 == (void *)*MEMORY[0x24BDDC5F0])
    v29 = 1;
  else
    v29 = objc_msgSend(v27, "isEqual:");

  objc_msgSend(v14, "streamingKeyCertificateURL");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "streamingKeyServerURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "streamingKeyAdamID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v32;
  if (v31 && v30)
  {
    v86 = v17;
    v33 = v29;
    v34 = v32;
    v84 = v20;
    v85 = v16;
    if (!objc_msgSend(v32, "longLongValue"))
    {
      v79 = v33;
      v80 = v31;
      v81 = v30;
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v35, "engineID");
        v37 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v92 = v37;
        v93 = 2114;
        v94 = self;
        v95 = 2114;
        *(_QWORD *)v96 = v14;
        _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Unexpected nil keyServerAdamID found in HLS loadResult: %{public}@", buf, 0x20u);

      }
      v38 = (void *)MEMORY[0x24BE65C38];
      v39 = *MEMORY[0x24BE65AB0];
      -[MPCModelGenericAVItem description](self, "description");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = v40;
      objc_msgSend(v14, "description");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v41;
      objc_msgSend(v89, "URL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v99[2] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v39, CFSTR("Bug"), CFSTR("KeyServerBug"), CFSTR("keyServerAdamID==nil"), 0, v44, 0);

      v20 = v84;
      v16 = v85;
      v31 = v80;
      v30 = v81;
      v34 = v87;
      v33 = v79;
    }
    v45 = (ICContentKeySession *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8798]), "initWithRequestContext:keyStore:delegate:", v16, v20, self);
    contentKeySession = self->_contentKeySession;
    self->_contentKeySession = v45;

    -[ICContentKeySession setAdamID:](self->_contentKeySession, "setAdamID:", v34);
    -[ICContentKeySession setKeyServerURL:](self->_contentKeySession, "setKeyServerURL:", v31);
    -[ICContentKeySession setKeyCertificateURL:](self->_contentKeySession, "setKeyCertificateURL:", v30);
    if (a9)
      v47 = v33;
    else
      v47 = 0;
    -[ICContentKeySession setKeyServerProtocolType:](self->_contentKeySession, "setKeyServerProtocolType:", v47);
    -[ICContentKeySession setAllowFallbackToStreamingKeys:](self->_contentKeySession, "setAllowFallbackToStreamingKeys:", 1);
    -[ICContentKeySession setIsStoreKeyServer:](self->_contentKeySession, "setIsStoreKeyServer:", a9);
    if (v19 != 1)
    {
      IsWatch = MSVDeviceIsWatch();
      if (!v88 || !(_DWORD)v33)
        goto LABEL_48;
      v83 = a9;
LABEL_40:
      if ((IsWatch & 1) == 0)
      {
        v82 = v30;
        objc_msgSend(MEMORY[0x24BEC8888], "sharedController");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "DSID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = 0;
        objc_msgSend(v67, "getKeyStatusForAccountUniqueIdentifier:error:", objc_msgSend(v68, "longLongValue"), &v90);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v90;

        if (v70)
        {
          v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v70, "msv_description");
            v72 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = self;
            v93 = 2114;
            v94 = v72;
            _os_log_impl(&dword_210BD8000, v71, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Failed to fetch FairPlayKeyStatus for offline key determination error=%{public}@", buf, 0x16u);

          }
        }
        if (-[NSObject hasOfflinePlaybackKeys](v69, "hasOfflinePlaybackKeys") && v83)
        {
          -[ICContentKeySession setRequestOfflineKeys:](self->_contentKeySession, "setRequestOfflineKeys:", 1);
        }
        else
        {
          -[MPCModelGenericAVItem eventStream](self, "eventStream");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v76, "engineID");
            v78 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v78;
            v93 = 2114;
            v94 = self;
            _os_log_impl(&dword_210BD8000, v77, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not requesting offline keys because Fairplay does not have offline subscription keys", buf, 0x16u);

          }
        }
        v30 = v82;
LABEL_54:

        -[ICContentKeySession addAsset:shouldPreloadKeys:waitForKeyIdentifiers:](self->_contentKeySession, "addAsset:shouldPreloadKeys:waitForKeyIdentifiers:", v89, 1, 0);
        v16 = v85;
        v17 = v86;
        v20 = v84;
        goto LABEL_55;
      }
LABEL_48:
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v69 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v70, "engineID");
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = v33;
        v75 = (void *)v73;
        *(_DWORD *)buf = 138544386;
        v92 = (MPCModelGenericAVItem *)v73;
        v93 = 2114;
        v94 = self;
        v95 = 1024;
        *(_DWORD *)v96 = v88 != 0;
        *(_WORD *)&v96[4] = 2048;
        *(_QWORD *)&v96[6] = v74;
        v97 = 1024;
        v98 = IsWatch ^ 1;
        _os_log_impl(&dword_210BD8000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Not requesting offline keys because its not supported. assetCanBeCached=%{BOOL}u, keyServerProtocolType=%ld, deviceSupportsOfflineHLS=%{BOOL}u", buf, 0x2Cu);

      }
      goto LABEL_54;
    }
    v83 = a9;
    objc_msgSend(v14, "streamingKeyCertificateURL");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v49 = v30;
    v50 = v30;
    if (v30 != v48)
    {
      v51 = v48;
      v52 = v33;
      v53 = objc_msgSend(v30, "isEqual:", v48);

      if ((v53 & 1) != 0)
      {
        v33 = v52;
LABEL_38:

LABEL_39:
        IsWatch = MSVDeviceIsWatch();
        if (!v33)
          goto LABEL_48;
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isRemoteServerLikelyReachable");

      v33 = v52;
      if (!v63)
        goto LABEL_39;
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v64, "engineID");
        v66 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        v93 = 2114;
        v94 = self;
        _os_log_impl(&dword_210BD8000, v65, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Forcing a refresh of the hls keys due to a certificate mismatch", buf, 0x16u);

        v33 = v52;
      }

      -[ICContentKeySession setBypassCache:](self->_contentKeySession, "setBypassCache:", 1);
      -[MPCModelGenericAVItem mediaItem](self, "mediaItem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "absoluteString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setValue:forProperty:", v49, *MEMORY[0x24BDDBB90]);
    }

    v51 = v50;
    goto LABEL_38;
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v54, "engineID");
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = self;
    v58 = v31;
    v59 = v30;
    v60 = (void *)v56;
    *(_DWORD *)buf = 138543618;
    v92 = (MPCModelGenericAVItem *)v56;
    v93 = 2114;
    v94 = v57;
    _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: HLS content without proper URLs: not setting-up a content key session", buf, 0x16u);

    v30 = v59;
    v31 = v58;
  }

LABEL_55:
}

- (void)_downloadHLSAssetWhilePlaying:(id)a3 assetLoadProperties:(id)a4 assetLoadResult:(id)a5 destinationURL:(id)a6 sharedCacheURL:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  id v28;
  ICAVAssetDownloadURLSession *v29;
  ICAVAssetDownloadURLSession *hlsDownloadURLSession;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  BOOL v36;
  uint8_t buf[4];
  MPCModelGenericAVItem *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "preferredMusicLowBandwidthResolution");

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("com.apple.MediaPlayer.MPCModelGenericAVItem.streaming_playback."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v26 = v23 > 0;
  if (v23 <= 0)
    objc_msgSend(v24, "appendString:", CFSTR("wifi."));
  objc_msgSend(v25, "appendString:", CFSTR("av"));
  objc_msgSend(MEMORY[0x24BEC8A50], "sharedSessionManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __174__MPCModelGenericAVItem__downloadHLSAssetWhilePlaying_assetLoadProperties_assetLoadResult_destinationURL_sharedCacheURL_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke;
  v34[3] = &unk_24CAB1378;
  v28 = v25;
  v35 = v28;
  v36 = v26;
  objc_msgSend(v27, "sessionWithIdentifier:creationBlock:", v28, v34);
  v29 = (ICAVAssetDownloadURLSession *)objc_claimAutoreleasedReturnValue();
  hlsDownloadURLSession = self->_hlsDownloadURLSession;
  self->_hlsDownloadURLSession = v29;

  if (self->_hlsDownloadURLSession)
  {
    v31 = v33;
    -[MPCModelGenericAVItem _downloadHLSAsset:destinationURL:sharedCacheURL:assetLoadProperties:loadResult:storeRequestContext:urlBag:fileUpgradeRecommendation:](self, "_downloadHLSAsset:destinationURL:sharedCacheURL:assetLoadProperties:loadResult:storeRequestContext:urlBag:fileUpgradeRecommendation:", v33, v18, v19, v16, v17, v20, v21, a10);
  }
  else
  {
    v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v31 = v33;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v38 = self;
      _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: HLS] Failed to create download url session for HLS asset", buf, 0xCu);
    }

  }
}

- (void)_getHLSServerDataForLoadResults:(id)a3 bag:(id)a4 keyCertificateURL:(id *)a5 keyServerURL:(id *)a6 keyServerAdamID:(id *)a7 keyServerProtocolType:(int64_t *)a8
{
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  int64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;

  v33 = a3;
  v14 = a4;
  objc_msgSend(v14, "enhancedAudioConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "keyServerProtocolType");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (id)*MEMORY[0x24BDDC5F0];
  if (v16 == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = objc_msgSend(v16, "isEqual:", v17);

    if (!v19)
    {
      objc_msgSend(v14, "urlForBagKey:", *MEMORY[0x24BEC86F8]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
LABEL_12:
      *a5 = v20;
      goto LABEL_13;
    }
  }
  objc_msgSend(v15, "certificateURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v15, "certificateURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = 1;
    goto LABEL_12;
  }
  v23 = *MEMORY[0x24BEC86F8];
  objc_msgSend(v14, "urlForBagKey:", *MEMORY[0x24BEC86F8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v14, "urlForBagKey:", v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v33, "streamingKeyCertificateURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v33, "streamingKeyCertificateURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v21 = 1;
LABEL_13:
  objc_msgSend(v33, "streamingKeyServerURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    *a6 = objc_retainAutorelease(v26);
  }
  else
  {
    objc_msgSend(v15, "keyServerURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      *a6 = objc_retainAutorelease(v28);
    }
    else
    {
      objc_msgSend(v14, "urlForBagKey:", *MEMORY[0x24BEC8700]);
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v30;

    }
  }

  objc_msgSend(v33, "streamingKeyAdamID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "longLongValue"))
    objc_msgSend(v33, "streamingKeyAdamID");
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[MPCModelGenericAVItem _keyServerAdamID](self, "_keyServerAdamID"));
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a7 = v32;

  *a8 = v21;
}

- (id)_hlsDownloadOptionsDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  int v22;
  MPCModelGenericAVItem *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preferredMusicLowBandwidthResolution") > 0;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDB1918]);

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCModelGenericAVItem _prefersHighQualityContent](self, "_prefersHighQualityContent"))
    v10 = objc_msgSend(v9, "preferredMusicHighBandwidthResolution");
  else
    v10 = objc_msgSend(v9, "preferredMusicLowBandwidthResolution");
  v11 = v10;
  v12 = objc_msgSend(v4, "preferredAudioAssetType");
  if ((unint64_t)(v12 - 4) < 2)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB1948]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_QWORD *)MEMORY[0x24BDB1928];
    goto LABEL_9;
  }
  if (v12 == 3)
  {
    v15 = *MEMORY[0x24BDB1930];
    v16 = MEMORY[0x24BDBD1C8];
    goto LABEL_11;
  }
  if (v12 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000 * v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_QWORD *)MEMORY[0x24BDB1938];
LABEL_9:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *v14);

    v15 = *MEMORY[0x24BDB1930];
    v16 = MEMORY[0x24BDBD1C0];
LABEL_11:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);
    goto LABEL_12;
  }
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend(v4, "preferredAudioAssetType");
    if ((unint64_t)(v20 - 1) > 4)
      v21 = CFSTR("Unspecified");
    else
      v21 = off_24CAB19C0[v20 - 1];
    v22 = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v21;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: HLS] Attempting to cache asset of type %{public}@ using HLS caching logic", (uint8_t *)&v22, 0x16u);
  }

LABEL_12:
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

- (id)_createOrUpdateDatabaseEntry:(id)a3 loadResult:(id)a4 urlBag:(id)a5 destinationURL:(id)a6 purgeable:(BOOL)a7
{
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  MPCModelGenericAVItem *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id location;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;

  v12 = a3;
  v13 = a4;
  v34 = a5;
  v36 = a6;
  v14 = objc_msgSend(v12, "preferredAudioAssetType") - 3;
  if (v14 > 2)
    v15 = 0;
  else
    v15 = qword_210ED91F8[v14];
  v35 = objc_msgSend(v13, "assetQualityType");
  v16 = objc_msgSend(v13, "assetProtectionType");
  objc_msgSend(v13, "streamingKeyCertificateURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "streamingKeyServerURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItem.m"), 2436, CFSTR("Unexpected nil keyServerURL"));

  }
  v38 = v12;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItem.m"), 2437, CFSTR("Unexpected nil keyCertificateURL"));

  }
  v19 = objc_alloc(MEMORY[0x24BDDC878]);
  v20 = self;
  v21 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC880], "identityKind");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithSource:modelKind:block:", CFSTR("ModelGenericAVItem"), v22, &__block_literal_global_243);
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_2;
  v42[3] = &unk_24CAB13C0;
  v42[4] = v20;
  v47 = v15;
  v24 = v36;
  v43 = v24;
  v48 = v35;
  v49 = v16;
  v50 = a7;
  v25 = v18;
  v44 = v25;
  v26 = v13;
  v45 = v26;
  v27 = v17;
  v46 = v27;
  v28 = (void *)objc_msgSend(v19, "initWithIdentifiers:block:", v23, v42);

  objc_initWeak(&location, v20);
  objc_msgSend(v38, "assetCacheProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "genericObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_244;
  v39[3] = &unk_24CAB13E8;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v29, "setPlaybackAssetCacheFileAsset:forGenericObject:withCompletionHandler:", v28, v30, v39);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v28;
}

- (void)_downloadHLSAsset:(id)a3 destinationURL:(id)a4 sharedCacheURL:(id)a5 assetLoadProperties:(id)a6 loadResult:(id)a7 storeRequestContext:(id)a8 urlBag:(id)a9 fileUpgradeRecommendation:(int64_t)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  ICURLRequest *v20;
  ICURLRequest *hlsDownloadURLRequest;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  ICAVAssetDownloadURLSession *hlsDownloadURLSession;
  ICURLRequest *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61[2];
  BOOL v62;
  _QWORD v63[4];
  id v64;
  id location;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  MPCModelGenericAVItem *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v39 = a4;
  v40 = a5;
  v17 = a6;
  v38 = a7;
  v43 = a8;
  v37 = a9;
  v18 = (void *)MEMORY[0x24BDD16B0];
  v45 = v16;
  objc_msgSend(v16, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestWithURL:", v19);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setTimeoutInterval:", 3600.0);
  v20 = (ICURLRequest *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8A48]), "initWithURLRequest:requestContext:", v44, v43);
  hlsDownloadURLRequest = self->_hlsDownloadURLRequest;
  self->_hlsDownloadURLRequest = v20;

  -[MPCModelGenericAVItem _hlsDownloadOptionsDictionary:](self, "_hlsDownloadOptionsDictionary:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "downloadDestinationURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v23 = objc_alloc(MEMORY[0x24BE65C40]);
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke;
  v63[3] = &unk_24CABA2F8;
  v36 = &v64;
  objc_copyWeak(&v64, &location);
  v24 = (void *)objc_msgSend(v23, "initWithDeallocHandler:", v63);
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v25, "engineID", &v64);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v67 = v27;
    v68 = 2114;
    v69 = self;
    v70 = 2114;
    v71 = v22;
    _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Asset download starting. url:%{public}@", buf, 0x20u);

  }
  objc_storeStrong((id *)&self->_tempFileURLToCleanup, v22);
  hlsDownloadURLSession = self->_hlsDownloadURLSession;
  v29 = self->_hlsDownloadURLRequest;
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_247;
  v53[3] = &unk_24CAB1438;
  v30 = v24;
  v54 = v30;
  v62 = a10 != 2;
  v41 = v17;
  v55 = v41;
  v31 = v22;
  v56 = v31;
  objc_copyWeak(v61, &location);
  v61[1] = (id)a10;
  v32 = v39;
  v57 = v32;
  v33 = v40;
  v58 = v33;
  v34 = v38;
  v59 = v34;
  v35 = v37;
  v60 = v35;
  -[ICAVAssetDownloadURLSession enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:](hlsDownloadURLSession, "enqueueAggregateAssetDownloadRequest:toDestination:withAVURLAsset:options:completionHandler:", v29, v31, v45, v42, v53);
  if (a10 == 1 && objc_msgSend(v31, "isEqual:", v32))
  {
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_255;
    v46[3] = &unk_24CAB35B8;
    v47 = v45;
    objc_copyWeak(&v52, &location);
    v48 = v41;
    v49 = v34;
    v50 = v35;
    v51 = v32;
    objc_msgSend(v47, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24CB17320, v46);

    objc_destroyWeak(&v52);
  }

  objc_destroyWeak(v61);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);

}

- (void)_checkDownloadErrorAndValidityOfDownloadedHLSAsset:(id)a3 downloadLocationURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  _BYTE location[12];
  __int16 v29;
  MPCModelGenericAVItem *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = v8 == 0;
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEC8580]);

    if (v12)
    {
      v13 = objc_msgSend(v8, "code");
      if ((unint64_t)(v13 + 7004) < 2 || v13 == -7100)
        *((_BYTE *)v25 + 24) = 1;
    }
  }
  if (*((_BYTE *)v25 + 24))
  {
    objc_initWeak((id *)location, self);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v9, 0);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __107__MPCModelGenericAVItem__checkDownloadErrorAndValidityOfDownloadedHLSAsset_downloadLocationURL_completion___block_invoke;
    v19[3] = &unk_24CAB1460;
    objc_copyWeak(&v23, (id *)location);
    v21 = v10;
    v15 = v14;
    v20 = v15;
    v22 = &v24;
    objc_msgSend(v15, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24CB17338, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "engineID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v18;
      v29 = 2114;
      v30 = self;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Clearing cached asset file [fatal download error]. Error=%{public}@", location, 0x20u);

    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }
  _Block_object_dispose(&v24, 8);

}

- (BOOL)_linkAssetIfNeededAtURL:(id)a3 toDestinationURL:(id)a4 shareCacheURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  char v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  MPCModelGenericAVItem *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "isEqual:", v9))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeItemAtURL:error:](v12, "removeItemAtURL:error:", v9, 0);
    v25 = 0;
    v14 = -[NSObject linkItemAtURL:toURL:error:](v12, "linkItemAtURL:toURL:error:", v8, v9, &v25);
    v11 = v25;
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "engineID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v18;
        v28 = 2114;
        v29 = self;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v9;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ and linked to destination URL: %{public}@", buf, 0x2Au);

      }
      if (!v10 || (objc_msgSend(v8, "isEqual:", v10) & 1) != 0)
        goto LABEL_9;
      -[NSObject removeItemAtURL:error:](v12, "removeItemAtURL:error:", v10, 0);
      v24 = v11;
      v22 = -[NSObject linkItemAtURL:toURL:error:](v12, "linkItemAtURL:toURL:error:", v8, v10, &v24);
      v20 = v24;

      if ((v22 & 1) != 0)
      {
        LOBYTE(v14) = 1;
        goto LABEL_14;
      }
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "engineID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v27 = v23;
        v28 = 2114;
        v29 = self;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v10;
        v34 = 2114;
        v35 = v20;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ but failed to link to shared cache URL: %{public}@ error: %{public}@", buf, 0x34u);

      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "engineID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v27 = v19;
        v28 = 2114;
        v29 = self;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v9;
        v34 = 2114;
        v35 = v11;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: Asset downloaded to %{public}@ but failed to link to destination URL: %{public}@ error: %{public}@", buf, 0x34u);

      }
      v20 = v11;
    }

LABEL_14:
    v11 = v20;
    goto LABEL_15;
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "engineID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v13;
    v28 = 2114;
    v29 = self;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: Asset downloaded to destination URL: %{public}@", buf, 0x20u);

  }
LABEL_9:
  LOBYTE(v14) = 1;
LABEL_15:

  return v14;
}

- (id)audioFormatForStableVariantID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[MPCModelGenericAVItem audioFormatsDictionary](self, "audioFormatsDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)updateAudioFormatsDictionary:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *alternateFormats;
  BOOL v13;

  v4 = (NSDictionary *)a3;
  v5 = self->_audioFormatsDictionary;
  if (v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = v5;
  v7 = -[NSDictionary isEqual:](v4, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  -[MPCModelGenericAVItem setAudioFormatsDictionary:](self, "setAudioFormatsDictionary:", v4);
  -[MPCModelGenericAVItem audioFormatsDictionary](self, "audioFormatsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_261);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem setAvailableSortedFormats:](self, "setAvailableSortedFormats:", v10);

  -[MPCModelGenericAVItem availableSortedFormats](self, "availableSortedFormats");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  alternateFormats = self->_alternateFormats;
  self->_alternateFormats = v11;

  -[MPCModelGenericAVItem invalidateContentItemAudioFormatInfo](self, "invalidateContentItemAudioFormatInfo");
  v13 = 1;
LABEL_6:

  return v13;
}

- (BOOL)updatePreferredFormat:(id)a3
{
  MPCPlayerAudioFormat *v5;
  MPCPlayerAudioFormat *v6;
  MPCPlayerAudioFormat *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  MPCPlayerAudioFormat *preferredFormat;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  MPCModelGenericAVItem *v18;
  __int16 v19;
  MPCPlayerAudioFormat *v20;
  __int16 v21;
  MPCPlayerAudioFormat *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (MPCPlayerAudioFormat *)a3;
  v6 = self->_preferredFormat;
  if (v6 == v5)
  {

    goto LABEL_7;
  }
  v7 = v6;
  v8 = -[MPCPlayerAudioFormat isEqual:](v5, "isEqual:", v6);

  if (v8)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "engineID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    preferredFormat = self->_preferredFormat;
    v15 = 138544130;
    v16 = v11;
    v17 = 2114;
    v18 = self;
    v19 = 2114;
    v20 = preferredFormat;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: [AF] - Updating preferred audio format: %{public}@ -> %{public}@", (uint8_t *)&v15, 0x2Au);

  }
  objc_storeStrong((id *)&self->_preferredFormat, a3);
  -[MPCModelGenericAVItem _emitAudioFormatChangeEvent](self, "_emitAudioFormatChangeEvent");
  -[MPCModelGenericAVItem invalidateContentItemAudioFormatInfo](self, "invalidateContentItemAudioFormatInfo");
  v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)updateActiveFormat:(id)a3 justification:(int64_t)a4
{
  MPCPlayerAudioFormat *v7;
  MPCPlayerAudioFormat *v8;
  MPCPlayerAudioFormat *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  MPCPlayerAudioFormat *activeFormat;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  MPCModelGenericAVItem *v20;
  __int16 v21;
  MPCPlayerAudioFormat *v22;
  __int16 v23;
  MPCPlayerAudioFormat *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = (MPCPlayerAudioFormat *)a3;
  if (!v7)
    goto LABEL_8;
  v8 = self->_activeFormat;
  if (v8 == v7)
  {

    goto LABEL_8;
  }
  v9 = v8;
  v10 = -[MPCPlayerAudioFormat isEqual:](v7, "isEqual:", v8);

  if (v10)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "engineID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    activeFormat = self->_activeFormat;
    v17 = 138544386;
    v18 = v13;
    v19 = 2114;
    v20 = self;
    v21 = 2114;
    v22 = activeFormat;
    v23 = 2114;
    v24 = v7;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: [AF] - Updating active audio format: %{public}@ -> %{public}@ - Justification: %ld", (uint8_t *)&v17, 0x34u);

  }
  objc_storeStrong((id *)&self->_activeFormat, a3);
  -[MPCModelGenericAVItem _updateActiveFormatJustification:](self, "_updateActiveFormatJustification:", a4);
  -[MPCModelGenericAVItem _emitAudioFormatChangeEvent](self, "_emitAudioFormatChangeEvent");
  -[MPCModelGenericAVItem invalidateContentItemAudioFormatInfo](self, "invalidateContentItemAudioFormatInfo");
  v15 = 1;
LABEL_9:

  return v15;
}

- (void)setAudioRoute:(id)a3
{
  MPCPlayerAudioRoute *v5;
  MPCPlayerAudioRoute *v6;
  BOOL v7;
  MPCPlayerAudioRoute *v8;

  v8 = (MPCPlayerAudioRoute *)a3;
  v5 = self->_audioRoute;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[MPCPlayerAudioRoute isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_audioRoute, a3);
      -[MPCModelGenericAVItem invalidateContentItemAudioFormatInfo](self, "invalidateContentItemAudioFormatInfo");
    }
  }

}

- (void)configureAVPlayerItemWithAudioFormat:(id)a3 forceSpatial:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPCModelGenericAVItem playerItem](self, "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mpc_setupWithPlayerAudioFormat:forceSpatial:downloadedAsset:", v7, v4, -[MPCModelGenericAVItem isDownloadedAsset](self, "isDownloadedAsset"));

  }
}

- (void)_updateActiveFormatJustification:(int64_t)a3
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int64_t v9;

  -[MPCModelGenericAVItem activeFormat](self, "activeFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem preferredFormat](self, "preferredFormat");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {

    v9 = 100;
  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if (v8)
      v9 = 100;
    else
      v9 = a3;
  }
  -[MPCModelGenericAVItem setActiveFormatJustification:](self, "setActiveFormatJustification:", v9);
}

- (void)_emitAudioFormatChangeEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[3];
  _QWORD v23[5];

  v23[3] = *MEMORY[0x24BDAC8D0];
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("queue-section-id");
  -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v22[1] = CFSTR("queue-item-id");
  -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("item-audio-format-metadata");
  v20[0] = CFSTR("active-format");
  -[MPCModelGenericAVItem activeFormat](self, "activeFormat");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v3;
  v20[1] = CFSTR("active-format-justification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MPCModelGenericAVItem activeFormatJustification](self, "activeFormatJustification", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v5;
  v20[2] = CFSTR("target-format");
  -[MPCModelGenericAVItem preferredFormat](self, "preferredFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v7;
  v20[3] = CFSTR("preferred-tiers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MPCModelGenericAVItem _audioFormatPreference](self, "_audioFormatPreference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  v20[4] = CFSTR("alternate-formats");
  -[MPCModelGenericAVItem alternateFormats](self, "alternateFormats");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = MEMORY[0x24BDBD1A8];
  if (v9)
    v11 = v9;
  v21[4] = v11;
  v20[5] = CFSTR("route");
  -[MPCModelGenericAVItem audioRoute](self, "audioRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[5] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emitEventType:payload:", CFSTR("audio-format-changed"), v15);

  if (!v12)
  if (!v6)

  if (!v4)
}

- (void)_emitAudioAssetTypeSelection:(id)a3 assetLoadInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("queue-section-id");
  -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v20[1] = CFSTR("queue-item-id");
  -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v21[2] = v7;
  v20[2] = CFSTR("asset-load-info");
  v20[3] = CFSTR("item-audio-asset-type-selection-metadata");
  v17 = v7;
  v18[0] = CFSTR("audio-asset-type-selection-explanation");
  objc_msgSend(v6, "explanation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = CFSTR("audio-asset-type-selection-justification");
  v19[0] = v12;
  objc_msgSend(v6, "justification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitEventType:payload:", CFSTR("asset-selection"), v16);

  if (!v13)
  if (!v11)

}

- (void)_emitNetworkOperationWithPerformanceMetrics:(id)a3 operationType:(int64_t)a4 reason:(id)a5 blocksPlayback:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v6 = a6;
  v19[6] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "isNotEmpty"))
  {
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("queue-section-id");
    -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v18[1] = CFSTR("queue-item-id");
    -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v14;
    v18[2] = CFSTR("network-operation-type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v15;
    v19[3] = v11;
    v18[3] = CFSTR("network-operation-reason");
    v18[4] = CFSTR("blocks-playback");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[5] = CFSTR("network-metrics");
    v19[4] = v16;
    v19[5] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "emitEventType:payload:", CFSTR("network-operation"), v17);

  }
}

- (id)personID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  void *v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_genericObjectLock);
  return v6;
}

- (void)notePlaybackFinishedByHittingEnd
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem notePlaybackFinishedByHittingEnd](&v3, sel_notePlaybackFinishedByHittingEnd);
  if (self->_hlsDownloadURLRequest)
    -[MPCModelGenericAVItem _addToDownloadCompletionPendingItems](self, "_addToDownloadCompletionPendingItems");
}

- (id)playbackError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 isMusicCellularStreamingAllowed;
  void *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  MPCModelGenericAVItem *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem playbackError](&v23, sel_playbackError);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1009);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "networkType");

      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "engineID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        isMusicCellularStreamingAllowed = self->_isMusicCellularStreamingAllowed;
        *(_DWORD *)buf = 138544130;
        v27 = v9;
        v28 = 2114;
        v29 = self;
        v30 = 2048;
        v31 = v6;
        v32 = 1024;
        v33 = isMusicCellularStreamingAllowed;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Player item has not connected to internet error, current network type is %li, cellular allowed is %{BOOL}u", buf, 0x26u);

      }
      if (self->_isMusicCellularStreamingAllowed || !ICEnvironmentNetworkTypeIsCellular())
      {
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "engineID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v16;
          v28 = 2114;
          v29 = self;
          v30 = 2114;
          v31 = (uint64_t)v3;
          _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Transforming error network unavailable instead of original: %{public}@", buf, 0x20u);

        }
        v14 = CFSTR("Network Unavailable");
        v15 = 11;
      }
      else
      {
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "engineID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v13;
          v28 = 2114;
          v29 = self;
          v30 = 2114;
          v31 = (uint64_t)v3;
          _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Transforming error to cellular restricted error instead of original: %{public}@", buf, 0x20u);

        }
        v14 = CFSTR("Cellular Restricted");
        v15 = 10;
      }

      v24[0] = CFSTR("ICEnvironmentNetworkType");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("isMusicCellularStreamingAllowed");
      v25[0] = v17;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMusicCellularStreamingAllowed);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), v15, v19, CFSTR("playback request failed with reason: %@"), v14);
      v20 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v20;
    }
  }
  v21 = v3;

  return v21;
}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  float v10;
  _BOOL4 lastPreparedForNonZeroRate;
  uint64_t v12;
  id v13;
  void (**v14)(void *, uint64_t, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  MPCDeferrableTask *deferredLeaseAcquisitionTask;
  _QWORD v19[5];
  void (**v20)(void *, uint64_t, _QWORD);
  _QWORD aBlock[5];
  id v22;
  float v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  MPCModelGenericAVItem *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v9;
    v27 = 2114;
    v28 = self;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Preparing for rate: %f.", buf, 0x20u);

  }
  v10 = fabsf(a3);
  lastPreparedForNonZeroRate = self->_lastPreparedForNonZeroRate;
  self->_lastPreparedForNonZeroRate = v10 > 0.00000011921;
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke;
  aBlock[3] = &unk_24CAB14C8;
  aBlock[4] = self;
  v24 = v10 > 0.00000011921;
  v13 = v6;
  v22 = v13;
  v23 = a3;
  v14 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  if (v10 <= 0.00000011921)
  {
    deferredLeaseAcquisitionTask = self->_deferredLeaseAcquisitionTask;
    self->_deferredLeaseAcquisitionTask = 0;

LABEL_11:
    v14[2](v14, 1, 0);
    goto LABEL_12;
  }
  if (lastPreparedForNonZeroRate
    || !-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded")
    || !self->_isSubscriptionPolicyContent)
  {
    goto LABEL_11;
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "engineID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    v27 = 2114;
    v28 = self;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Getting subscription lease session", buf, 0x16u);

  }
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_278;
  v19[3] = &unk_24CAB17F8;
  v19[4] = self;
  v20 = v14;
  -[MPCModelGenericAVItem _getUnverifiedSubscriptionLeaseSessionWithCompletion:](self, "_getUnverifiedSubscriptionLeaseSessionWithCompletion:", v19);

LABEL_12:
}

- (void)_prepareLeaseWithShouldRequireLeaseAcquisition:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke;
  v8[3] = &unk_24CAB1518;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[MPCModelGenericAVItem _getSubscriptionLeasePropertiesWithCompletion:](self, "_getSubscriptionLeasePropertiesWithCompletion:", v8);

}

- (void)setRating:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  if (-[MPCModelGenericAVItem supportsRating](self, "supportsRating"))
  {
    -[MPCModelGenericAVItem mediaItem](self, "mediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = a3 * 5.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forProperty:withCompletionBlock:", v7, *MEMORY[0x24BDDBC78], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", *MEMORY[0x24BDDB9E0], self, 0);

  }
}

- (int64_t)stationID
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stationID");

  return v5;
}

- (id)stationHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stationName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__755;
  v15 = __Block_byref_object_dispose__756;
  v16 = 0;
  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDDC928];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__MPCModelGenericAVItem_stationName__block_invoke;
    v8[3] = &unk_24CABAB68;
    v10 = &v11;
    v9 = v2;
    objc_msgSend(v4, "performWithoutEnforcement:", v8);

  }
  v5 = (__CFString *)v12[5];
  if (!v5)
    v5 = &stru_24CABB5D0;
  v6 = v5;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)stationStringID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationStringID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)stationProviderID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_trackInfo, "objectForKey:", CFSTR("stream-provider-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportsRating
{
  unint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[MPCModelGenericAVItem persistentID](self, "persistentID");
  -[MPCModelGenericAVItem cloudUniversalLibraryID](self, "cloudUniversalLibraryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !v4 || -[MPModelGenericObject type](self->_flattenedGenericObject, "type") != 1)
    return 0;
  -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLibraryAdded");

  return v6;
}

- (BOOL)supportsLikedState
{
  return 1;
}

- (void)setupWithPlaybackInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  void *v14;
  uint8_t buf[4];
  MPCModelGenericAVItem *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded") & 1) != 0)
  {
    if (*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BDDCD08]))
    {
      v13.receiver = self;
      v13.super_class = (Class)MPCModelGenericAVItem;
      -[MPCModelGenericAVItem setupWithPlaybackInfo](&v13, sel_setupWithPlaybackInfo);
      return;
    }
    v9 = (void *)MEMORY[0x24BE65C38];
    v10 = *MEMORY[0x24BE65AB0];
    -[MPCModelGenericAVItem description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v10, CFSTR("Bug"), CFSTR("AssetLoadingBug"), CFSTR("setupWithPlaybackInfo._asset==nil"), &stru_24CABB5D0, v12, 0);

    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      v8 = "%{public}@: setupWithPlaybackInfo called without an asset loaded and isAssetLoaded is TRUE";
      goto LABEL_8;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x24BE65C38];
    v4 = *MEMORY[0x24BE65AB0];
    -[MPCModelGenericAVItem description](self, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v4, CFSTR("Bug"), CFSTR("AssetLoadingBug"), CFSTR("setupWithPlaybackInfo.isAssetLoaded==NO"), &stru_24CABB5D0, v6, 0);

    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      v8 = "%{public}@: setupWithPlaybackInfo called without an asset loaded";
LABEL_8:
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_FAULT, v8, buf, 0xCu);
    }
  }

}

- (id)urlTimeMarkers
{
  return 0;
}

- (BOOL)useEmbeddedChapterData
{
  return 0;
}

- (float)userRating
{
  os_unfair_lock_s *p_genericObjectLock;
  float v4;
  void *v5;
  float v6;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = 0.0;
  if (-[MPModelGenericObject type](self->_flattenedMetadataGenericObject, "type") == 1)
  {
    -[MPModelGenericObject song](self->_flattenedMetadataGenericObject, "song");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userRating");
    v4 = v6;

  }
  os_unfair_lock_unlock(p_genericObjectLock);
  return v4;
}

- (BOOL)canUseLoadedAsset
{
  void *v3;
  void *v5;
  char v6;

  -[MPCModelGenericAVItem itemError](self, "itemError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  if (!-[MPCModelGenericAVItem isExplicitTrack](self, "isExplicitTrack"))
    return 1;
  +[MPCContentAgeRequirementManager sharedManager](MPCContentAgeRequirementManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemAuthorized:", self);

  return v6;
}

- (BOOL)allowsAirPlayFromCloud
{
  return self->_allowsAirPlayFromCloud;
}

- (BOOL)allowsExternalPlayback
{
  return 1;
}

- (BOOL)requiresLoadedAssetForAirPlayProperties
{
  return 1;
}

- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  MPCModelPlaybackAssetCacheProviding *assetCacheProvider;
  MPModelGenericObject *genericObject;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  MPCModelGenericAVItem *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  os_log_t loga;
  NSObject *log;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  MPCModelGenericAVItem *v54;
  __int16 v55;
  MPCModelGenericAVItem *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCModelGenericAVItem mediaItem](self, "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "isHomeSharingLibrary"))
  {
    objc_msgSend(v10, "errorResolverForItem:", self);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6A8]), "initWithErrorResolver:", v11);
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke;
      v51[3] = &unk_24CAB2988;
      v52 = v7;
      objc_msgSend(v12, "setResolutionHandler:", v51);
      objc_msgSend(v12, "resolveError:", v6);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    goto LABEL_10;
  }
  v13 = +[MPCModelGenericAVItem _unwrapPlaybackError:](MPCModelGenericAVItem, "_unwrapPlaybackError:", v6);
  if (!v13)
    goto LABEL_39;
  v14 = v13;
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    if (v14 > 5)
      v16 = CFSTR("Unknown");
    else
      v16 = off_24CAB19E8[v14 - 1];
    *(_DWORD *)buf = 138543874;
    v54 = self;
    v55 = 2114;
    v56 = (MPCModelGenericAVItem *)v16;
    v57 = 2114;
    v58 = v6;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unwrapped playback error with type=%{public}@ error=%{public}@.", buf, 0x20u);
  }

  if (v14 != 5)
  {
    if (v14 == 1 && self->_isSubscriptionPolicyContent)
    {
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_329;
      v46[3] = &unk_24CAB15A8;
      v46[4] = self;
      v47 = v7;
      -[MPCModelGenericAVItem _getSubscriptionLeasePropertiesWithCompletion:](self, "_getSubscriptionLeasePropertiesWithCompletion:", v46);

      goto LABEL_40;
    }
    if (v14 == 4)
    {
      v27 = *MEMORY[0x24BDDBB68];
      v28 = *MEMORY[0x24BDDBB88];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDDBB68], *MEMORY[0x24BDDBB88], 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valuesForProperties:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "objectForKey:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKey:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "length") && objc_msgSend(v32, "longLongValue"))
      {
        -[MPCModelGenericAVItem eventStream](self, "eventStream");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCLogCategoryPlayback();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v42, "engineID");
          loga = (os_log_t)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = (MPCModelGenericAVItem *)loga;
          v55 = 2114;
          v56 = self;
          _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Purging cached content key(s) for invalid user error.", buf, 0x16u);

        }
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC87C8]), "initWithPath:", v31);
        objc_msgSend(v43, "removeAllKeys");
        v34 = (MPCModelGenericAVItem *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          _MPCLogCategoryPlayback();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v54 = self;
            v55 = 2114;
            v56 = v34;
            _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cached hls keys. err=%{public}@.", buf, 0x16u);
          }

        }
      }
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      goto LABEL_49;
    }
    if (v14 != 3)
      goto LABEL_39;
    os_unfair_lock_lock(&self->_genericObjectLock);
    v25 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
    switch(v25)
    {
      case 9:
        -[MPModelGenericObject movie](self->_flattenedGenericObject, "movie");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        -[MPModelGenericObject tvEpisode](self->_flattenedGenericObject, "tvEpisode");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v30 = 0;
        goto LABEL_45;
    }
    v35 = v26;
    objc_msgSend(v26, "storeAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_45:
    os_unfair_lock_unlock(&self->_genericObjectLock);
    v36 = objc_msgSend(v30, "accountIdentifier");
    v37 = (void *)MEMORY[0x24BEC8A58];
    if (v36)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "specificAccountWithDSID:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89F8]), "initWithIdentity:", v31);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8760]), "initWithRequestContext:", v32);
    objc_msgSend(v39, "setReason:", *MEMORY[0x24BEC84D0]);
    objc_msgSend(v39, "setQualityOfService:", 25);
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_3;
    v44[3] = &unk_24CAB15D0;
    v44[4] = self;
    v45 = v7;
    objc_msgSend(v39, "performWithResponseHandler:", v44);

LABEL_49:
    goto LABEL_40;
  }
  if (-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset")
    || !-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    goto LABEL_39;
  }
  -[MPCModelGenericAVItem asset](self, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_39;
  }
  -[MPCModelGenericAVItem asset](self, "asset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isFileURL");

  if (!v20)
  {
LABEL_39:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    goto LABEL_40;
  }
  -[MPCModelGenericAVItem asset](self, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  assetCacheProvider = self->_assetCacheProvider;
  genericObject = self->_genericObject;
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_328;
  v48[3] = &unk_24CAB9CA8;
  v48[4] = self;
  v49 = v22;
  v50 = v7;
  v11 = v22;
  -[MPCModelPlaybackAssetCacheProviding clearPlaybackAssetCacheFileAssetForGenericObject:withCompletionHandler:](assetCacheProvider, "clearPlaybackAssetCacheFileAssetForGenericObject:withCompletionHandler:", genericObject, v48);

LABEL_10:
LABEL_40:

}

- (BOOL)shouldPreventPlayback
{
  return self->_leasePlaybackPreventionState != 0;
}

- (BOOL)usesSubscriptionLease
{
  os_unfair_lock_s *p_genericObjectLock;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v4 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  switch(v4)
  {
    case 9:
      -[MPModelGenericObject movie](self->_flattenedGenericObject, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[MPModelGenericObject tvEpisode](self->_flattenedGenericObject, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "storeAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  os_unfair_lock_unlock(p_genericObjectLock);
  v8 = objc_msgSend(v7, "endpointType") == 3;

  return v8;
}

- (void)_currentPlaybackRateDidChange:(float)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem _currentPlaybackRateDidChange:](&v4, sel__currentPlaybackRateDidChange_);
  -[MPCModelGenericAVItem _updateAutomaticSubscriptionLeaseRefresh](self, "_updateAutomaticSubscriptionLeaseRefresh");
}

- (void)_handleUpdatedLikedState:(int64_t)a3 forUserIdentity:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  os_unfair_lock_s *p_genericObjectLock;
  id v11;
  MPModelGenericObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  if (a3 == 3)
    v9 = 2;
  else
    v9 = a3 == 2;
  p_genericObjectLock = &self->_genericObjectLock;
  v11 = a4;
  os_unfair_lock_lock(&self->_genericObjectLock);
  v12 = self->_metadataGenericObject;
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(MEMORY[0x24BDDC720], "controllerWithUserIdentity:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke;
  v15[3] = &unk_24CAB9A98;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v13, "setTasteType:forModel:withCompletionHandler:", v9, v12, v15);

}

- (void)_willBecomeActivePlayerItem
{
  void (**v3)(_QWORD);
  id firstBecomeActivePlayerItemBlock;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem _willBecomeActivePlayerItem](&v5, sel__willBecomeActivePlayerItem);
  v3 = (void (**)(_QWORD))objc_msgSend(self->_firstBecomeActivePlayerItemBlock, "copy");
  firstBecomeActivePlayerItemBlock = self->_firstBecomeActivePlayerItemBlock;
  self->_firstBecomeActivePlayerItemBlock = 0;

  if (v3)
    v3[2](v3);

}

- (void)_willResignActivePlayerItem
{
  MPCSuzeLeaseSession *suzeLeaseSession;
  MPCSuzeLeaseSession *v4;
  void *v5;
  void *v6;
  MPCSuzeLeaseSession *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCModelGenericAVItem;
  -[MPCModelGenericAVItem _willResignActivePlayerItem](&v8, sel__willResignActivePlayerItem);
  suzeLeaseSession = self->_suzeLeaseSession;
  if (suzeLeaseSession)
  {
    if (self->_isAutomaticallyRefreshingSuzeLeaseSession)
    {
      self->_isAutomaticallyRefreshingSuzeLeaseSession = 0;
      -[MPCSuzeLeaseSession endAutomaticallyRefreshingLease](self->_suzeLeaseSession, "endAutomaticallyRefreshingLease");
      suzeLeaseSession = self->_suzeLeaseSession;
    }
    v4 = suzeLeaseSession;
    +[MPCSuzeLeaseSessionController sharedController](MPCSuzeLeaseSessionController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("MPCSuzeLeaseSessionControllerLeaseSessionRenewDidFailNotification"), v5);

    v7 = self->_suzeLeaseSession;
    self->_suzeLeaseSession = 0;

    objc_msgSend(v5, "stopLeaseSession:completion:", v4, 0);
  }
}

- (void)_didResignActivePlayerItem
{
  void *v3;
  NSData *jingleTimedMetadata;
  NSString *hlsStreamIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset")
    || -[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive"))
  {
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_didReceiveHLSTimedMetadata)
    {
      jingleTimedMetadata = self->_jingleTimedMetadata;
      self->_jingleTimedMetadata = 0;

      v15 = CFSTR("item-stream-id");
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      v6 = hlsStreamIdentifier;
      if (!hlsStreamIdentifier)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "emitEventType:payload:", CFSTR("item-hls-timed-metadata-end"), v7);

      if (!hlsStreamIdentifier)
    }
    v13[0] = CFSTR("queue-section-id");
    -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v13[1] = CFSTR("item-end-item-id");
    -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    v13[2] = CFSTR("item-stream-id");
    v10 = self->_hlsStreamIdentifier;
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emitEventType:payload:", CFSTR("item-hls-stream-end"), v12);

    if (!v10)
  }
}

- (void)_didBecomeActivePlayerItem
{
  NSString *v3;
  NSString *hlsStreamIdentifier;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  if (-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset")
    || -[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive"))
  {
    if (!self->_hlsStreamIdentifier)
    {
      MSVNanoIDCreateTaggedPointer();
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      self->_hlsStreamIdentifier = v3;

    }
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = CFSTR("queue-section-id");
    -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v11[1] = CFSTR("item-start-item-id");
    -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hlsStreamIdentifier;
    v12[1] = v7;
    v12[2] = v8;
    v11[2] = CFSTR("item-stream-id");
    v11[3] = CFSTR("container-indeterminate-duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emitEventType:payload:", CFSTR("item-hls-stream-begin"), v10);

  }
}

- (int64_t)_keyServerAdamID
{
  os_unfair_lock_s *p_genericObjectLock;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  MPCModelGenericAVItem *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_genericObjectLock = &self->_genericObjectLock;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject identifiers](self->_flattenedMetadataGenericObject, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_genericObjectLock);
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assetAdamID");

  if (!v6)
  {
    objc_msgSend(v4, "universalStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "subscriptionAdamID");

    if (!v6)
    {
      objc_msgSend(v4, "universalStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "adamID");

      if (!v6)
      {
        objc_msgSend(v4, "universalStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "reportingAdamID");

      }
    }
  }
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v12;
    v16 = 2114;
    v17 = self;
    v18 = 2048;
    v19 = v6;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@ Using adamID %lld for key server requests from identifier set %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  return v6;
}

- (unint64_t)mpcReporting_itemType
{
  objc_super v4;

  if (-[MPCModelGenericAVItem isRadioStreamPlayback](self, "isRadioStreamPlayback"))
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)MPCModelGenericAVItem;
  return -[MPAVItem mpcReporting_itemType](&v4, sel_mpcReporting_itemType);
}

- (id)mpcReporting_identityPropertiesLoader
{
  MPCReportingIdentityPropertiesLoading *identityPropertiesLoader;
  MPCReportingPlaybackEnvironmentPropertiesLoader *v4;
  MPCReportingIdentityPropertiesLoading *v5;

  identityPropertiesLoader = self->_identityPropertiesLoader;
  if (!identityPropertiesLoader)
  {
    v4 = -[MPCReportingPlaybackEnvironmentPropertiesLoader initWithPlaybackRequestEnvironment:]([MPCReportingPlaybackEnvironmentPropertiesLoader alloc], "initWithPlaybackRequestEnvironment:", self->_playbackRequestEnvironment);
    v5 = self->_identityPropertiesLoader;
    self->_identityPropertiesLoader = (MPCReportingIdentityPropertiesLoading *)v4;

    identityPropertiesLoader = self->_identityPropertiesLoader;
  }
  return identityPropertiesLoader;
}

- (id)mpcReporting_requestingBundleIdentifier
{
  return -[MPCPlaybackRequestEnvironment requestingBundleIdentifier](self->_playbackRequestEnvironment, "requestingBundleIdentifier");
}

- (id)mpcReporting_requestingBundleVersion
{
  return -[MPCPlaybackRequestEnvironment requestingBundleVersion](self->_playbackRequestEnvironment, "requestingBundleVersion");
}

- (id)rtcReportingServiceIdentifier
{
  NSString *v3;

  if (!-[MPCModelGenericAVItem didAttemptToLoadAsset](self, "didAttemptToLoadAsset")
    || (v3 = self->_rtcReportingServiceIdentifier) == 0)
  {
    -[MPCModelGenericAVItem _rtcReportingServiceIdentifierWithAssetURL:](self, "_rtcReportingServiceIdentifierWithAssetURL:", 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  _BOOL4 radioPlayback;
  _BOOL4 isiTunesStoreStream;
  BOOL v10;
  int v11;
  NSURL *streamingKeyServerURL;
  NSURL *streamingKeyCertificateURL;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  MPCModelGenericAVItem *v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35[4];
  BOOL v36;
  char v37;
  id location;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  NSURL *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  NSURL *v50;

  v6 = a3;
  v7 = a4;
  if (ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest())
  {
    radioPlayback = self->_radioPlayback;
    if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
      isiTunesStoreStream = self->_isiTunesStoreStream;
    else
      isiTunesStoreStream = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__755;
    v49 = __Block_byref_object_dispose__756;
    v11 = -[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded");
    streamingKeyServerURL = 0;
    if (v11)
      streamingKeyServerURL = self->_streamingKeyServerURL;
    v50 = streamingKeyServerURL;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__755;
    v43 = __Block_byref_object_dispose__756;
    if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
      streamingKeyCertificateURL = self->_streamingKeyCertificateURL;
    else
      streamingKeyCertificateURL = 0;
    v44 = streamingKeyCertificateURL;
    if (v46[5])
    {
      v14 = !radioPlayback && isiTunesStoreStream;
      if (!v14 && !v40[5])
      {
LABEL_29:
        v10 = 0;
LABEL_32:
        _Block_object_dispose(&v39, 8);

        _Block_object_dispose(&v45, 8);
        goto LABEL_33;
      }
    }
    else
    {
      v10 = 0;
      if (radioPlayback || !isiTunesStoreStream)
        goto LABEL_32;
    }
    if ((-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded") & 1) != 0)
    {
      -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MPProcessInfoSystemWallClockUptime();
      v17 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = 1;
      else
        v18 = 2;
      objc_initWeak(&location, self);
      v19 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
      aBlock[3] = &unk_24CAB1670;
      v20 = v15;
      v30 = v20;
      v36 = isiTunesStoreStream;
      v33 = &v39;
      v34 = &v45;
      v35[1] = (id)v18;
      v35[2] = 0;
      v37 = 0;
      v31 = v7;
      v32 = self;
      v35[3] = v17;
      objc_copyWeak(v35, &location);
      v21 = _Block_copy(aBlock);
      v22 = v21;
      if (radioPlayback || !isiTunesStoreStream || v40[5] && v46[5])
      {
        (*((void (**)(void *))v21 + 2))(v21);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v19;
        v25[1] = 3221225472;
        v25[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_4;
        v25[3] = &unk_24CAB1698;
        v27 = &v45;
        v28 = &v39;
        v26 = v22;
        objc_msgSend(v23, "getBagForRequestContext:withCompletionHandler:", v20, v25);

      }
      objc_destroyWeak(v35);

      objc_destroyWeak(&location);
      v10 = 1;
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  v10 = 0;
LABEL_33:

  return v10;
}

- (void)metadataOutput:(id)a3 didOutputTimedMetadataGroups:(id)a4 fromPlayerItemTrack:(id)a5
{
  id v8;
  NSArray *v9;
  id v10;
  void *v11;
  NSString *hlsStreamIdentifier;
  void *v13;
  void *v14;
  NSArray *currentGlobalTimedMetadataGroups;
  NSArray *v16;
  NSArray *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSArray *)a4;
  v10 = a5;
  if (!v10)
  {
    if (!self->_didReceiveHLSTimedMetadata)
    {
      self->_didReceiveHLSTimedMetadata = 1;
      -[MPCModelGenericAVItem eventStream](self, "eventStream");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("item-stream-id");
      hlsStreamIdentifier = self->_hlsStreamIdentifier;
      v13 = hlsStreamIdentifier;
      if (!hlsStreamIdentifier)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "emitEventType:payload:", CFSTR("item-hls-timed-metadata-begin"), v14);

      if (!hlsStreamIdentifier)
    }
    currentGlobalTimedMetadataGroups = self->_currentGlobalTimedMetadataGroups;
    if (currentGlobalTimedMetadataGroups != v9
      && (-[NSArray isEqual:](currentGlobalTimedMetadataGroups, "isEqual:", v9) & 1) == 0)
    {
      v16 = (NSArray *)-[NSArray copy](v9, "copy");
      v17 = self->_currentGlobalTimedMetadataGroups;
      self->_currentGlobalTimedMetadataGroups = v16;

      -[MPCModelGenericAVItem _reloadTimedMetadataRequest](self, "_reloadTimedMetadataRequest");
      -[MPCModelGenericAVItem _updateJingleTimedMetadata](self, "_updateJingleTimedMetadata");
    }
  }

}

- (void)_reloadTimedMetadataRequest
{
  void *v3;
  void *v4;
  void *v5;
  MPModelGenericObject *genericObject;
  BOOL v7;
  MPCModelGenericAVItemTimedMetadataRequest *timedMetadataRequest;
  MPCModelGenericAVItemTimedMetadataResponse *timedMetadataResponse;
  void *v10;
  MPModelGenericObject *v11;
  MPCModelGenericAVItemTimedMetadataRequest *v12;
  NSArray *currentGlobalTimedMetadataGroups;
  void *v14;
  MPCModelGenericAVItemTimedMetadataRequest *v15;
  MPModelGenericObject *v16;
  void *v17;
  NSOperationQueue *timedMetadataOperationQueue;
  NSOperationQueue *v19;
  NSOperationQueue *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  MPCModelGenericAVItem *v25;
  MPModelGenericObject *v26;
  id v27;
  CMTime time;

  if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded")
    && !-[MPCModelGenericAVItem isAlwaysLive](self, "isAlwaysLive"))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BDDCD10]);
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(v4, "numberWithDouble:", fmax(CMTimeGetSeconds(&time), 0.0));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  os_unfair_lock_lock(&self->_genericObjectLock);
  genericObject = self->_genericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (self->_currentGlobalTimedMetadataGroups)
    v7 = genericObject == 0;
  else
    v7 = 1;
  if (v7)
  {
    timedMetadataRequest = self->_timedMetadataRequest;
    self->_timedMetadataRequest = 0;

    timedMetadataResponse = self->_timedMetadataResponse;
    self->_timedMetadataResponse = 0;

    os_unfair_lock_lock(&self->_genericObjectLock);
    v11 = self->_genericObject;
    v16 = self->_metadataGenericObject;
    os_unfair_lock_unlock(&self->_genericObjectLock);
    if (v16 == v11)
    {
      v16 = v11;
    }
    else
    {
      os_unfair_lock_lock(&self->_genericObjectLock);
      objc_storeStrong((id *)&self->_metadataGenericObject, self->_genericObject);
      objc_storeStrong((id *)&self->_flattenedMetadataGenericObject, self->_flattenedGenericObject);
      os_unfair_lock_unlock(&self->_genericObjectLock);
      -[MPCModelGenericAVItem _invalidateContentItemForTimedMetadataChangesChangingRevisionID:](self, "_invalidateContentItemForTimedMetadataChangesChangingRevisionID:", 1);
      -[MPCModelGenericAVItem setLastMetadataChangeTime:](self, "setLastMetadataChangeTime:", v3);
      -[MPCModelGenericAVItem observer](self, "observer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didSignificantlyChangeItem:", self);

      -[MPCModelGenericAVItem _setNeedsPersistedLikedStateUpdate](self, "_setNeedsPersistedLikedStateUpdate");
      -[MPCModelGenericAVItem _postInvalidationNotifications](self, "_postInvalidationNotifications");
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    v11 = self->_genericObject;
    os_unfair_lock_unlock(&self->_genericObjectLock);
    v12 = [MPCModelGenericAVItemTimedMetadataRequest alloc];
    currentGlobalTimedMetadataGroups = self->_currentGlobalTimedMetadataGroups;
    -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MPCModelGenericAVItemTimedMetadataRequest initWithGenericObject:timedMetadataGroups:storeRequestContext:](v12, "initWithGenericObject:timedMetadataGroups:storeRequestContext:", v11, currentGlobalTimedMetadataGroups, v14);

    -[MPCModelGenericAVItemTimedMetadataRequest setPreviousResponse:](v15, "setPreviousResponse:", self->_timedMetadataResponse);
    -[MPCModelGenericAVItemTimedMetadataRequest setItemProperties:](v15, "setItemProperties:", self->_itemProperties);
    objc_storeStrong((id *)&self->_timedMetadataRequest, v15);
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke;
    v24 = &unk_24CAB16C0;
    v25 = self;
    v16 = v15;
    v26 = v16;
    v27 = v3;
    v17 = (void *)-[MPModelGenericObject newOperationWithResponseHandler:](v16, "newOperationWithResponseHandler:", &v21);
    timedMetadataOperationQueue = self->_timedMetadataOperationQueue;
    if (!timedMetadataOperationQueue)
    {
      v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      v20 = self->_timedMetadataOperationQueue;
      self->_timedMetadataOperationQueue = v19;

      -[NSOperationQueue setName:](self->_timedMetadataOperationQueue, "setName:", CFSTR("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.timedMetadataOperationQueue"), v21, v22, v23, v24, v25, v26);
      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_timedMetadataOperationQueue, "setMaxConcurrentOperationCount:", 1);
      -[NSOperationQueue setQualityOfService:](self->_timedMetadataOperationQueue, "setQualityOfService:", 25);
      timedMetadataOperationQueue = self->_timedMetadataOperationQueue;
    }
    -[NSOperationQueue addOperation:](timedMetadataOperationQueue, "addOperation:", v17, v21, v22, v23, v24, v25);

  }
}

- (void)nowPlayingInfoCenter:(id)a3 lyricsForContentItem:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  os_unfair_lock_lock(&self->_genericObjectLock);
  -[MPModelGenericObject anyObject](self->_flattenedMetadataGenericObject, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_genericObjectLock);
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "length"))
  {
    v11 = v9;
    v12 = objc_alloc_init(MEMORY[0x24BDDCC68]);
    objc_msgSend(v12, "setSong:", v11);
    v13 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v13, "setQualityOfService:", 25);
    objc_msgSend(v13, "setName:", CFSTR("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.LyricsOperationQueue"));
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __78__MPCModelGenericAVItem_nowPlayingInfoCenter_lyricsForContentItem_completion___block_invoke;
    v21 = &unk_24CAB16E8;
    v22 = v13;
    v23 = v10;
    v24 = v11;
    v25 = v7;
    v14 = v11;
    v15 = v13;
    v16 = (void *)objc_msgSend(v12, "newOperationWithResponseHandler:", &v18);
    objc_msgSend(v15, "addOperation:", v16, v18, v19, v20, v21);

  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v10;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "Unable to provide lyrics for contentItemID %{public}@, modelObject: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 1, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v12);
  }

}

- (void)setGenericObject:(id)a3
{
  MPModelGenericObject **p_genericObject;
  MPModelGenericObject *v6;
  MPModelGenericObject *v7;
  MPModelGenericObject *flattenedGenericObject;
  MPModelGenericObject *v9;
  MPModelGenericObject *flattenedMetadataGenericObject;
  MPModelGenericObject *v11;

  v11 = (MPModelGenericObject *)a3;
  os_unfair_lock_lock(&self->_genericObjectLock);
  p_genericObject = &self->_genericObject;
  v6 = self->_genericObject;
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (v6 != v11)
  {
    os_unfair_lock_lock(&self->_genericObjectLock);
    objc_storeStrong((id *)&self->_genericObject, a3);
    -[MPModelGenericObject flattenedGenericObject](*p_genericObject, "flattenedGenericObject");
    v7 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();
    flattenedGenericObject = self->_flattenedGenericObject;
    self->_flattenedGenericObject = v7;

    objc_storeStrong((id *)&self->_metadataGenericObject, *p_genericObject);
    -[MPModelGenericObject flattenedGenericObject](self->_metadataGenericObject, "flattenedGenericObject");
    v9 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();
    flattenedMetadataGenericObject = self->_flattenedMetadataGenericObject;
    self->_flattenedMetadataGenericObject = v9;

    os_unfair_lock_unlock(&self->_genericObjectLock);
    -[MPCModelGenericAVItem _reloadTimedMetadataRequest](self, "_reloadTimedMetadataRequest");
    -[MPCModelGenericAVItem _setNeedsPersistedLikedStateUpdate](self, "_setNeedsPersistedLikedStateUpdate");
    -[MPCModelGenericAVItem invalidateContentItemDeviceSpecificUserInfo](self, "invalidateContentItemDeviceSpecificUserInfo");
    -[MPCModelGenericAVItem _postInvalidationNotifications](self, "_postInvalidationNotifications");
  }

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__MPCModelGenericAVItem_environmentMonitorDidChangeNetworkType___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_allowsHighQualityMusicStreamingOnCellularDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__MPCModelGenericAVItem__allowsHighQualityMusicStreamingOnCellularDidChangeNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_ageVerificationStateDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__MPCModelGenericAVItem__ageVerificationStateDidChangeNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_contentTasteControllerDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__MPCModelGenericAVItem__contentTasteControllerDidChangeNotification___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_subscriptionLeaseStatusDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__MPCModelGenericAVItem__subscriptionLeaseStatusDidChangeNotification___block_invoke;
    v6[3] = &unk_24CABA1D0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

- (void)_suzeLeaseSessionRenewDidFailNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  id v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MPCSuzeLeaseControllerUserInfoKeyError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MPCSuzeLeaseControllerUserInfoKeySession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__MPCModelGenericAVItem__suzeLeaseSessionRenewDidFailNotification___block_invoke;
    block[3] = &unk_24CABAA28;
    block[4] = self;
    v9 = v6;
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_timedMetadataResponseDidInvalidateNotification:(id)a3
{
  msv_dispatch_on_main_queue();
}

- ($C4B24A06E922887A36692F481211F72A)_timeoutValues
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  int64_t v9;
  NSObject *v10;
  $C4B24A06E922887A36692F481211F72A *result;
  int v12;
  MPCModelGenericAVItem *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&retstr->var0 = _MPCAssetLoadingTimeoutDefault;
  *(_OWORD *)&retstr->var2 = unk_210ED91C0;
  *(_OWORD *)&retstr->var4 = xmmword_210ED91D0;
  *(_OWORD *)&retstr->var6 = unk_210ED91E0;
  retstr->var8 = 10;
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRemoteServerLikelyReachable");

  objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWatch");

  if ((v6 & 1) != 0)
  {
    v9 = 20;
  }
  else
  {
    if (v8)
      v9 = 5;
    else
      v9 = 1;
    retstr->var0 = v9;
    retstr->var3 = v9;
    retstr->var4 = v9;
    retstr->var6 = v9;
    retstr->var7 = v9;
    retstr->var8 = 1;
  }
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138545666;
    v13 = self;
    v14 = 1024;
    v15 = v6;
    v16 = 2048;
    v17 = 10;
    v18 = 2048;
    v19 = v9;
    v20 = 2048;
    v21 = 10;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = v9;
    v26 = 2048;
    v27 = 2;
    v28 = 2048;
    v29 = v9;
    v30 = 2048;
    v31 = v9;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_INFO, "[AL] - %{public}@ - Timeout values [Network likely reachable: %{BOOL}u]: Local file=%lds - subscription lease session=%lds - home sharing=%lds - cloud streaming=%lds - cloud redownload=%lds - fairplay status=%lds - fairplay lease=%lds - suze lease=%lds", (uint8_t *)&v12, 0x62u);
  }

  return result;
}

- (BOOL)_allowsStreamingPlayback
{
  return 1;
}

- (void)_applyLoudnessInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  MPCModelGenericAVItem *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded")
    && -[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset")
    && -[MPCModelGenericAVItem loadedAudioAssetType](self, "loadedAudioAssetType") >= 3)
  {
    -[MPCModelGenericAVItem modelPlayEvent](self, "modelPlayEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "itemType");

    if (v4 != 1)
      return;
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "engineID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelGenericAVItem playerItem](self, "playerItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v7;
      v24 = 2114;
      v25 = self;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Enabling album loudness on player item %{public}@", (uint8_t *)&v22, 0x20u);

    }
    v30 = *MEMORY[0x24BE0AA70];
    v31[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem playerItem](self, "playerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLoudnessInfo:", v9);
  }
  else
  {
    if (!-[MPCModelGenericAVItem isAssetLoaded](self, "isAssetLoaded"))
      return;
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MPCModelGenericAVItem playerItem](self, "playerItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BE0AA78]);
    -[MPCModelGenericAVItem loudnessInfoVolumeNormalization](self, "loudnessInfoVolumeNormalization");
    v13 = v12;
    -[MPCModelGenericAVItem modelPlayEvent](self, "modelPlayEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "itemType");

    if (v15 == 1)
    {
      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE0AA70]);
    }
    else if (fabsf(v13) > 0.00000011921)
    {
      *(float *)&v16 = __exp10f(v13 / 20.0);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v17, *MEMORY[0x24BE0AA80]);

    }
    -[MPCModelGenericAVItem playerItem](self, "playerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "engineID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v21;
      v24 = 2114;
      v25 = self;
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v18;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Setting loudness info %{public}@ on player item %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    objc_msgSend(v18, "setLoudnessInfo:", v9);

  }
}

- (void)_applyPreferredPeakBitRateToPlayerItem:(id)a3 withItemType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  int IsCellular;
  double v22;
  double v23;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  MPCModelGenericAVItem *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;
  CGSize v42;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lastKnownNetworkType");

  v9 = (void *)objc_opt_class();
  if (a4 != 2)
  {
    v13 = objc_msgSend(v9, "_prefersHighQualityAudioContentForNetworkType:", v8);
    if (v13)
      v14 = 0.0;
    else
      v14 = 102400.0;
    objc_msgSend(v6, "preferredPeakBitRate");
    if (vabdd_f64(v14, v15) <= 2.22044605e-16)
      goto LABEL_29;
    objc_msgSend(v6, "setPreferredPeakBitRate:", v14);
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    objc_msgSend(v16, "engineID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("Unknown");
    if (v8 > 99)
    {
      if (v8 > 1000)
      {
        switch(v8)
        {
          case 1001:
            v20 = CFSTR("Bridged WiFi");
            break;
          case 2000:
            v20 = CFSTR("Wired Ethernet");
            break;
          case 3000:
            v20 = CFSTR("Other");
            break;
        }
        goto LABEL_12;
      }
      if (v8 != 100)
      {
        if (v8 == 500)
        {
          v20 = CFSTR("Bluetooth");
        }
        else if (v8 == 1000)
        {
          v20 = CFSTR("WiFi");
        }
        goto LABEL_12;
      }
    }
    else if ((unint64_t)(v8 - 1) >= 8)
    {
LABEL_12:
      v29 = 138544642;
      v30 = v18;
      v31 = 2114;
      v32 = self;
      v33 = 2048;
      v34 = v14;
      v35 = 2114;
      v36 = v20;
      v37 = 2048;
      v38 = v8;
      v39 = 1024;
      v40 = v13;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Set preferredPeakBitRate=%f lastKnownNetwork=%{public}@ (%ld) prefersHighQualityContent=%{BOOL}u", (uint8_t *)&v29, 0x3Au);

      goto LABEL_28;
    }
    v20 = CFSTR("Cellular");
    goto LABEL_12;
  }
  v10 = objc_msgSend(v9, "_prefersHighQualityVideoContentForNetworkType:", v8);
  if ((v10 & 1) != 0)
  {
    v12 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (IsCellular)
      v11 = 432.0;
    else
      v11 = 576.0;
    if (IsCellular)
      v12 = 768.0;
    else
      v12 = 1024.0;
  }
  objc_msgSend(v6, "preferredMaximumResolution");
  if (v12 != v23 || v11 != v22)
  {
    objc_msgSend(v6, "setPreferredMaximumResolution:", v12, v11);
    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "engineID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42.width = v12;
      v42.height = v11;
      NSStringFromCGSize(v42);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = CFSTR("Unknown");
      if (v8 > 99)
      {
        if (v8 > 1000)
        {
          switch(v8)
          {
            case 1001:
              v28 = CFSTR("Bridged WiFi");
              break;
            case 2000:
              v28 = CFSTR("Wired Ethernet");
              break;
            case 3000:
              v28 = CFSTR("Other");
              break;
          }
          goto LABEL_27;
        }
        if (v8 != 100)
        {
          if (v8 == 500)
          {
            v28 = CFSTR("Bluetooth");
          }
          else if (v8 == 1000)
          {
            v28 = CFSTR("WiFi");
          }
          goto LABEL_27;
        }
      }
      else if ((unint64_t)(v8 - 1) >= 8)
      {
LABEL_27:
        v29 = 138544642;
        v30 = (uint64_t)v25;
        v31 = 2114;
        v32 = self;
        v33 = 2114;
        v34 = *(double *)&v26;
        v35 = 2114;
        v36 = v28;
        v37 = 2048;
        v38 = v8;
        v39 = 1024;
        v40 = v10;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Set preferredMaximumResolution=%{public}@ lastKnownNetwork=%{public}@ (%ld) prefersHighQualityContent=%{BOOL}u", (uint8_t *)&v29, 0x3Au);

        goto LABEL_28;
      }
      v28 = CFSTR("Cellular");
      goto LABEL_27;
    }
LABEL_28:

  }
LABEL_29:

}

- (id)_bookmarkTime
{
  void *v2;
  double v3;
  double v4;
  void *v5;

  -[MPCModelGenericAVItem _modelPlaybackPosition](self, "_modelPlaybackPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkTime");
  v4 = v3;

  if (v4 <= 0.00000011920929)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_getSubscriptionStatusWithStoreRequestContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, void *, _QWORD);

  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v5, "delegatedIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "identity");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountForUserIdentity:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "subscriptionStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v6[2](v6, v13, 0);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC88C8]), "initWithStoreRequestContext:", v5);
    objc_msgSend(v14, "setShouldIgnoreCache:", 0);
    objc_msgSend(v14, "setAllowsFallbackToExpiredStatus:", 1);
    objc_msgSend(v14, "setAllowsFallbackToStatusNeedingReload:", 1);
    objc_msgSend(MEMORY[0x24BEC88B8], "sharedStatusController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__MPCModelGenericAVItem__getSubscriptionStatusWithStoreRequestContext_completion___block_invoke;
    v16[3] = &unk_24CAB1730;
    v17 = v6;
    objc_msgSend(v15, "performSubscriptionStatusRequest:withCompletionHandler:", v14, v16);

  }
}

- (void)_getSubscriptionLeasePropertiesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  NSObject *accessQueue;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD block[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  if (-[MPCModelGenericAVItem _allowsStreamingPlayback](self, "_allowsStreamingPlayback"))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__755;
    v34 = __Block_byref_object_dispose__756;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__755;
    v28 = __Block_byref_object_dispose__756;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__755;
    v22 = __Block_byref_object_dispose__756;
    accessQueue = self->_accessQueue;
    v23 = 0;
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke;
    block[3] = &unk_24CAB1758;
    block[4] = self;
    block[5] = &v30;
    block[6] = &v36;
    block[7] = &v24;
    block[8] = &v18;
    dispatch_barrier_sync(accessQueue, block);
    if (*((_BYTE *)v37 + 24))
    {
      v4[2](v4, v31[5], v25[5]);
    }
    else
    {
      -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19[5];
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_2;
      v10[3] = &unk_24CAB1848;
      v13 = &v18;
      v10[4] = self;
      v14 = &v30;
      v15 = &v36;
      v16 = &v24;
      v11 = v7;
      v12 = v4;
      v9 = v7;
      dispatch_async(v8, v10);

    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v4[2](v4, 0, 0);
  }

}

- (void)_getUnverifiedSubscriptionLeaseSessionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *accessQueue;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  void (**v12)(id, _QWORD);
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD block[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v4 = (void (**)(id, _QWORD))a3;
  if (-[MPCModelGenericAVItem _allowsStreamingPlayback](self, "_allowsStreamingPlayback"))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__755;
    v27 = __Block_byref_object_dispose__756;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__755;
    v21 = __Block_byref_object_dispose__756;
    v22 = 0;
    accessQueue = self->_accessQueue;
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke;
    block[3] = &unk_24CAB1F58;
    block[4] = self;
    block[5] = &v23;
    block[6] = &v29;
    block[7] = &v17;
    dispatch_barrier_sync(accessQueue, block);
    if (*((_BYTE *)v30 + 24))
    {
      v4[2](v4, v24[5]);
    }
    else
    {
      -[MPCModelGenericAVItem _storeRequestContext](self, "_storeRequestContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v18[5];
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_2;
      v10[3] = &unk_24CAB18C0;
      v13 = &v17;
      v10[4] = self;
      v14 = &v23;
      v15 = &v29;
      v11 = v7;
      v12 = v4;
      v9 = v7;
      dispatch_async(v8, v10);

    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)_invalidateContentItemForTimedMetadataChangesChangingRevisionID:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    -[MPCModelGenericAVItem queueItemID](self, "queueItemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setPreviousQueueItemID:](self, "setPreviousQueueItemID:", v4);

    -[MPCModelGenericAVItem contentItemID](self, "contentItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem queueSectionID](self, "queueSectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MSVNanoIDCreateTaggedPointer();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setContentItemID:queueSectionID:queueItemID:](self, "setContentItemID:queueSectionID:queueItemID:", v5, v6, v7);

  }
  -[MPCModelGenericAVItem _updateContentItemIncludingPlaybackState:](self, "_updateContentItemIncludingPlaybackState:", 0);
}

- (void)_postInvalidationNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB990], self);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB9A0], self);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB9A8], self);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB9F8], self);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB9B8], self);
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BDDB998], self);
  -[MPCModelGenericAVItem updatePlayerItemMetadata](self, "updatePlayerItemMetadata");

}

- (id)_rtcReportingMediaIdentifierWithAssetLoadProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(a3, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:](MPCRTCEventConsumer, "rtcIdentifiersFromUniversalIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCModelGenericAVItem _radioStation](self, "_radioStation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "type") == 8)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v8, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "radio");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCRTCEventConsumer rtcIdentifiersFromRadioIdentifiers:](MPCRTCEventConsumer, "rtcIdentifiersFromRadioIdentifiers:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v8, "type") == 4)
    {
      +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:](MPCRTCEventConsumer, "rtcIdentifiersFromUniversalIdentifiers:", 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
    }
  }
  else
  {
    v9 = 0;
  }
  +[MPCRTCEventConsumer identifierStringFromItemIdentifiers:radioIdentifiers:](MPCRTCEventConsumer, "identifierStringFromItemIdentifiers:radioIdentifiers:", v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_rtcReportingServiceIdentifierWithAssetURL:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  unint64_t v17;
  void *v18;
  int v19;

  v4 = a3;
  if (self->_radioPlayback)
  {
    if (-[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset"))
      v5 = CFSTR("tilt.stream-track");
    else
      v5 = CFSTR("tilt.track");
    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_genericObjectLock);
  v6 = -[MPModelGenericObject type](self->_flattenedGenericObject, "type");
  if (v6 == 9)
  {
    -[MPModelGenericObject movie](self->_flattenedGenericObject, "movie");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v7 = (void *)v8;
    v5 = &stru_24CABB5D0;
    goto LABEL_14;
  }
  if (v6 == 6)
  {
    -[MPModelGenericObject tvEpisode](self->_flattenedGenericObject, "tvEpisode");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v5 = &stru_24CABB5D0;
  if (v6 != 1)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_16;
  }
  -[MPModelGenericObject song](self->_flattenedGenericObject, "song");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isArtistUploadedContent"))
    v5 = CFSTR("uploaded-content");
LABEL_14:
  objc_msgSend(v7, "storeAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localFileAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  os_unfair_lock_unlock(&self->_genericObjectLock);
  if (!-[__CFString length](v5, "length"))
  {
    if (objc_msgSend(v9, "isRedownloadable"))
    {
      v17 = objc_msgSend(v9, "endpointType") - 1;
      if (v17 < 3)
        v5 = off_24CAB1A10[v17];
    }
    else
    {
      objc_msgSend(v10, "filePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        v19 = objc_msgSend(v10, "isNonPurgeable");

        if (v19)
          v5 = CFSTR("synced");
      }
      else
      {

      }
    }
  }
  v11 = -[__CFString length](v5, "length");
  if (v4 && v11 && (objc_msgSend(v4, "isFileURL") & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR(".cloud"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  +[MPCRTCEventConsumer playerServiceNameWithPlayerID:](MPCRTCEventConsumer, "playerServiceNameWithPlayerID:", self->_playerID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[__CFString length](v5, "length");
  v14 = CFSTR("unknown");
  if (v13)
    v14 = v5;
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(".%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_storeUbiquitousIdentifier
{
  void *v2;
  void *v3;

  -[MPCModelGenericAVItem _modelPlaybackPosition](self, "_modelPlaybackPosition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeUbiquitousIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateAutomaticSubscriptionLeaseRefresh
{
  _QWORD v2[5];

  if (self->_isSubscriptionPolicyContent)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke;
    v2[3] = &unk_24CAB18E8;
    v2[4] = self;
    -[MPCModelGenericAVItem _getSubscriptionLeasePropertiesWithCompletion:](self, "_getSubscriptionLeasePropertiesWithCompletion:", v2);
  }
}

- (void)_updateJingleTimedMetadata
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSData *v19;
  void *v20;
  NSData *v21;
  char v22;
  MPCModelGenericAVItem *v23;
  NSArray *obj;
  uint64_t v25;
  uint64_t v26;
  NSData *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = self;
  obj = self->_currentGlobalTimedMetadataGroups;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v26)
  {
    v27 = 0;
    v25 = *(_QWORD *)v34;
    v2 = *MEMORY[0x24BDB1E40];
    v3 = *MEMORY[0x24BDB1DD0];
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v5, "items", v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v7)
        {
          v8 = v7;
          v28 = i;
          v9 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v30 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              objc_msgSend(v11, "keySpace");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqualToString:", v2);

              if (v13)
              {
                objc_msgSend(v11, "key");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqual:", v3);

                if (v15)
                {
                  objc_msgSend(v11, "extraAttributes");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "objectForKey:", CFSTR("info"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v17, "isEqual:", CFSTR("com.apple.radio.ping.jingle")))
                  {
                    objc_msgSend(v11, "dataValue");
                    v18 = objc_claimAutoreleasedReturnValue();

                    v27 = (NSData *)v18;
                    goto LABEL_19;
                  }

                }
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v8)
              continue;
            break;
          }
LABEL_19:
          i = v28;
        }

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v26);
  }
  else
  {
    v27 = 0;
  }

  v19 = v23->_jingleTimedMetadata;
  v20 = v27;
  if (v19 == v27)
    goto LABEL_27;
  v21 = v19;
  v22 = -[NSData isEqual:](v19, "isEqual:", v27);

  if ((v22 & 1) == 0)
  {
    objc_storeStrong((id *)&v23->_jingleTimedMetadata, v27);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("MPCAVItemReportingJingleTimedMetadataDidChangeNotification"), v23);
LABEL_27:

  }
}

- (void)_updatePreventionStatusWithLeaseSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  MPCDeferrableTask *deferredLeaseAcquisitionTask;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  ICMusicSubscriptionLeaseStatus *v16;
  ICMusicSubscriptionLeaseStatus *leaseStatus;
  void *v18;
  NSObject *v19;
  void *v20;
  int64_t leasePlaybackPreventionState;
  ICMusicSubscriptionLeaseStatus *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  MPCModelGenericAVItem *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  ICMusicSubscriptionLeaseStatus *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_subscriptionLeaseRequestCount >= 1)
  {
    self->_didDeferPreventionStatusUpdate = 1;
    goto LABEL_22;
  }
  objc_msgSend(v4, "leaseStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leaseStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v9;
    v26 = 2114;
    v27 = self;
    v28 = 2114;
    v29 = (int64_t)v10;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: _updatePreventionStatusWithLeaseSession - updating prevention status - lease status: %{public}@", (uint8_t *)&v24, 0x20u);

  }
  if ((objc_msgSend(v6, "hasInflightLeaseAcquisition") & 1) != 0
    || (deferredLeaseAcquisitionTask = self->_deferredLeaseAcquisitionTask) != 0
    && !-[MPCDeferrableTask isFinished](deferredLeaseAcquisitionTask, "isFinished"))
  {
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v12 = objc_msgSend(v6, "leaseState");
  if (v12 != 2)
  {
    v14 = v12;
    if (objc_msgSend(v6, "shouldPlaybackRequireOnlineKeys"))
    {
      if (v14)
      {
        if (objc_msgSend(v6, "hasOnlinePlaybackKeys"))
          v13 = 0;
        else
          v13 = 3;
      }
      else
      {
        v13 = 2;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = 1;
LABEL_16:
  if (self->_leasePlaybackPreventionState != v13)
  {
    v15 = -[MPCModelGenericAVItem shouldPreventPlayback](self, "shouldPreventPlayback");
    self->_leasePlaybackPreventionState = v13;
    v16 = (ICMusicSubscriptionLeaseStatus *)objc_msgSend(v6, "copy");
    leaseStatus = self->_leaseStatus;
    self->_leaseStatus = v16;

    -[MPCModelGenericAVItem eventStream](self, "eventStream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "engineID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      leasePlaybackPreventionState = self->_leasePlaybackPreventionState;
      v22 = self->_leaseStatus;
      v24 = 138544130;
      v25 = v20;
      v26 = 2114;
      v27 = self;
      v28 = 2048;
      v29 = leasePlaybackPreventionState;
      v30 = 2114;
      v31 = v22;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: _updatePreventionStatusWithLeaseSession - Lease playback prevention state did change to: %li [status: %{public}@", (uint8_t *)&v24, 0x2Au);

    }
    if (v15 != -[MPCModelGenericAVItem shouldPreventPlayback](self, "shouldPreventPlayback"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:", *MEMORY[0x24BDDB9F0], self);

    }
  }

LABEL_22:
}

- (id)analyticsContentType
{
  __CFString *v3;

  v3 = CFSTR("CRABS");
  if (-[MPCModelGenericAVItem loadedAudioAssetType](self, "loadedAudioAssetType") >= 2
    && -[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset"))
  {
    v3 = CFSTR("HLS");
  }
  return v3;
}

- (id)analyticsFormatType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v14;

  -[MPCModelGenericAVItem activeFormat](self, "activeFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MPCModelGenericAVItem preferredFormat](self, "preferredFormat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = bswap32(objc_msgSend(v6, "codec"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), v7, BYTE1(v7), BYTE2(v7), HIBYTE(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "bitrate") >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%ldkbps,%ld"), v10, objc_msgSend(v6, "bitrate") / 1000, (unsigned __int16)objc_msgSend(v6, "channelLayout"));
LABEL_8:
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "sampleRate") >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%ldkhz,%ld"), v10, objc_msgSend(v6, "sampleRate") / 1000, objc_msgSend(v6, "bitDepth"));
    goto LABEL_8;
  }
  v14 = &stru_24CABB5D0;
  if (v10)
    v14 = v10;
  v11 = v14;
LABEL_9:
  v12 = v11;

  return v12;
}

- (void)pauseContentKeySession
{
  ICContentKeySession *contentKeySession;

  contentKeySession = self->_contentKeySession;
  if (contentKeySession)
    -[ICContentKeySession pauseAutomaticKeyRenewal](contentKeySession, "pauseAutomaticKeyRenewal");
}

- (void)resumeContentKeySession
{
  ICContentKeySession *contentKeySession;

  contentKeySession = self->_contentKeySession;
  if (contentKeySession)
    -[ICContentKeySession resumeAutomaticKeyRenewal](contentKeySession, "resumeAutomaticKeyRenewal");
}

- (void)_addToDownloadCompletionPendingItems
{
  id obj;

  +[MPCModelGenericAVItem _downloadCompletionPendingItems](MPCModelGenericAVItem, "_downloadCompletionPendingItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(obj, "addObject:", self);
  objc_sync_exit(obj);

}

- (void)_removeFromDownloadCompletionPendingItems
{
  id obj;

  +[MPCModelGenericAVItem _downloadCompletionPendingItems](MPCModelGenericAVItem, "_downloadCompletionPendingItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(obj, "removeObject:", self);
  objc_sync_exit(obj);

}

- (void)reevaluateType
{
  id v4;
  objc_super v5;

  if ((unint64_t)(self->_loadedAudioAssetType - 3) > 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)MPCModelGenericAVItem;
    -[MPCModelGenericAVItem reevaluateType](&v5, sel_reevaluateType);
  }
  else if (-[MPCModelGenericAVItem type](self, "type") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCModelGenericAVItem.m"), 5274, CFSTR("Unexpected item type for loaded enhanced audio"));

  }
}

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v14 = CFSTR("keyIdentifier");
    v15[0] = a4;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = a6;
    v11 = a4;
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "msv_errorWithDomain:code:underlyingError:userInfo:debugDescription:", CFSTR("MPCError"), 71, v10, v12, CFSTR("Failed to delivery SKD key"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPCModelGenericAVItem addAdjunctError:](self, "addAdjunctError:", v13);
  }
}

- (void)setChapters:(id)a3
{
  NSArray *v4;
  NSArray *chapters;
  NSArray *v6;
  uint64_t v7;

  v4 = (NSArray *)a3;
  -[MPCModelGenericAVItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("chapters"));
  chapters = self->_chapters;
  self->_chapters = v4;
  v6 = v4;

  v7 = -[NSArray count](v6, "count");
  objc_msgSend(*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BDDCD18]), "setNumberOfChildren:", v7);

  -[MPCModelGenericAVItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("chapters"));
}

- (id)chapterAt:(double)a3
{
  void *v3;
  void *v4;

  -[MPCModelGenericAVItem _chapterDataAt:](self, "_chapterDataAt:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ChapterDataItemKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextChapterAfter:(double)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[MPCModelGenericAVItem _chapterDataAt:](self, "_chapterDataAt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ChapterDataIndexKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v6 = objc_msgSend(v5, "integerValue"),
        -[MPCModelGenericAVItem chapters](self, "chapters"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count") - 1,
        v7,
        v6 < v8))
  {
    -[MPCModelGenericAVItem chapters](self, "chapters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v6 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)previousChapterBefore:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[MPCModelGenericAVItem _chapterDataAt:](self, "_chapterDataAt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ChapterDataIndexKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0 && (v6 = objc_msgSend(v5, "integerValue"), v7 = v6 - 1, v6 >= 1))
  {
    -[MPCModelGenericAVItem chapters](self, "chapters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_chapterDataAt:(double)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[MPCModelGenericAVItem chapters](self, "chapters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__755;
    v20 = __Block_byref_object_dispose__756;
    v21 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = -1;
    -[MPCModelGenericAVItem chapters](self, "chapters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__MPCModelGenericAVItem__chapterDataAt___block_invoke;
    v11[3] = &unk_24CAB1930;
    *(double *)&v11[6] = a3;
    v11[4] = &v16;
    v11[5] = &v12;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    if (!v17[5] || v13[3] < 0)
    {
      v8 = 0;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17[5], CFSTR("ChapterDataItemKey"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13[3]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ChapterDataIndexKey"));

    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)playbackMode
{
  return -[MPCModelGenericAVItem isHLSAsset](self, "isHLSAsset");
}

- (void)resetPlaybackStartTimeForReuse
{
  -[MPCModelGenericAVItem setInitialPlaybackStartTimeOverride:](self, "setInitialPlaybackStartTimeOverride:", 0);
}

- (int64_t)leasePlaybackPreventionState
{
  return self->_leasePlaybackPreventionState;
}

- (id)leaseStatus
{
  return self->_leaseStatus;
}

- (NSDictionary)audioFormatsDictionary
{
  return self->_audioFormatsDictionary;
}

- (void)setAudioFormatsDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (int64_t)preferredAudioAssetType
{
  return self->_preferredAudioAssetType;
}

- (MPCAudioAssetTypeSelection)preferredAudioAssetTypeSelection
{
  return self->_preferredAudioAssetTypeSelection;
}

- (MPCModelPlaybackAssetCacheProviding)assetCacheProvider
{
  return self->_assetCacheProvider;
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->_equivalencySourceAdamID = a3;
}

- (MPModelGenericObject)genericObject
{
  return self->_genericObject;
}

- (NSData)jingleTimedMetadata
{
  return self->_jingleTimedMetadata;
}

- (NSNumber)isSiriInitiated
{
  return self->_siriInitiated;
}

- (void)setRadioPlayback:(BOOL)a3
{
  self->_radioPlayback = a3;
}

- (void)setRadioStreamPlayback:(BOOL)a3
{
  self->_radioStreamPlayback = a3;
}

- (BOOL)isSubscriptionRequired
{
  return self->_subscriptionRequired;
}

- (void)setSubscriptionRequired:(BOOL)a3
{
  self->_subscriptionRequired = a3;
}

- (MPCPlaybackRequestEnvironment)playbackRequestEnvironment
{
  return self->_playbackRequestEnvironment;
}

- (int64_t)stationItemLikedState
{
  return self->_stationItemLikedState;
}

- (void)setStationItemLikedState:(int64_t)a3
{
  self->_stationItemLikedState = a3;
}

- (NSDictionary)trackInfo
{
  return self->_trackInfo;
}

- (void)setTrackInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trackInfo, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return (MPCPlaybackEngineEventStream *)objc_loadWeakRetained((id *)&self->_eventStream);
}

- (MPCPlayerAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (void)setPreferredFormat:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFormat, a3);
}

- (MPCPlayerAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (void)setActiveFormat:(id)a3
{
  objc_storeStrong((id *)&self->_activeFormat, a3);
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (void)setActiveFormatJustification:(int64_t)a3
{
  self->_activeFormatJustification = a3;
}

- (NSArray)alternateFormats
{
  return self->_alternateFormats;
}

- (void)setAlternateFormats:(id)a3
{
  objc_storeStrong((id *)&self->_alternateFormats, a3);
}

- (NSArray)availableSortedFormats
{
  return self->_availableSortedFormats;
}

- (void)setAvailableSortedFormats:(id)a3
{
  objc_storeStrong((id *)&self->_availableSortedFormats, a3);
}

- (MPCPlayerAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (NSString)previousQueueItemID
{
  return self->_previousQueueItemID;
}

- (void)setPreviousQueueItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (MPCAudioAssetTypeSelector)audioAssetTypeSelector
{
  return self->_audioAssetTypeSelector;
}

- (void)setAudioAssetTypeSelector:(id)a3
{
  objc_storeStrong((id *)&self->_audioAssetTypeSelector, a3);
}

- (int64_t)loadedAudioAssetType
{
  return self->_loadedAudioAssetType;
}

- (BOOL)isDownloadedAsset
{
  return self->_downloadedAsset;
}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (NSArray)chapters
{
  return self->_chapters;
}

void __40__MPCModelGenericAVItem__chapterDataAt___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "startTime");
  if (v8 <= *(double *)(a1 + 48))
  {
    objc_msgSend(v12, "startTime");
    v10 = v9;
    objc_msgSend(v12, "duration");
    if (v10 + v11 > *(double *)(a1 + 48))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

void __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a2;
  v7 = a3;
  v5 = v4;
  v6 = v7;
  msv_dispatch_on_main_queue();

}

void __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_2(id *a1)
{
  float v2;
  int v3;
  _BYTE *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(a1[4], "_currentPlaybackRate");
  v3 = v2 > 0.00000011921
    && objc_msgSend(a1[4], "isAssetLoaded")
    && objc_msgSend(a1[5], "shouldUseLease")
    && a1[6] != 0;
  v4 = a1[4];
  if (v4[576] != v3)
  {
    v4[576] = v3;
    if (objc_msgSend(a1[4], "isAssetLoaded"))
    {
      if (*((_BYTE *)a1[4] + 576))
      {
        objc_msgSend(a1[6], "beginAutomaticallyRefreshingLease");
      }
      else
      {
        v5 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_3;
        block[3] = &unk_24CABA2D0;
        v7 = a1[6];
        dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

      }
    }
  }
}

uint64_t __65__MPCModelGenericAVItem__updateAutomaticSubscriptionLeaseRefresh__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endAutomaticallyRefreshingLease");
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 544));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 529);
  v2 = *(void **)(a1[4] + 536);
  if (!v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseSessionLoadQueue", v3);
    v5 = a1[4];
    v6 = *(void **)(v5 + 536);
    *(_QWORD *)(v5 + 536) = v4;

    v2 = *(void **)(a1[4] + 536);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v2);
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  NSObject *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t v24;
  _QWORD block[5];
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseLoadCalloutQueue", v2);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 520);
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_3;
  block[3] = &unk_24CABA108;
  block[4] = v4;
  v26 = *(_OWORD *)(a1 + 64);
  dispatch_sync(v5, block);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_4;
    v22[3] = &unk_24CAB1870;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 64);
    v23 = v7;
    v24 = v8;
    dispatch_async(v3, v22);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v9 = v23;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Loading subscription lease session...", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_390;
    v18[3] = &unk_24CAB1898;
    v15 = *(_QWORD *)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v3;
    v16 = *(id *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v20 = v16;
    v21 = v17;
    objc_msgSend(v14, "getLeaseSessionWithRequestContext:completionHandler:", v15, v18);

    v9 = v19;
  }

}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_3(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 544));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 529);
}

uint64_t __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_390(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v7, "engineID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v5;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Finished loading subscription lease session: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Failed to load subscription lease session with error: %{public}@", buf, 0x16u);
    }
  }

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(v12 + 520);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_391;
  block[3] = &unk_24CAB3110;
  block[1] = 3221225472;
  block[4] = v12;
  v19 = v5;
  v20 = v13;
  v15 = *(id *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v21 = v15;
  v22 = v16;
  v17 = v5;
  dispatch_barrier_async(v14, block);

}

void __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_391(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 529) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 544), *(id *)(a1 + 40));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[68])
  {
    objc_msgSend(v2, "eventStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 544);
      *(_DWORD *)buf = 138543874;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getUnverifiedSubscriptionLeaseSessionWithCompletion - Posting ICMusicSubscriptionLeaseSessionLeaseStatusDidChangeNotification: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__subscriptionLeaseStatusDidChangeNotification_, *MEMORY[0x24BEC85E0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_394;
  v10[3] = &unk_24CAB9830;
  v9 = *(NSObject **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  dispatch_async(v9, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

uint64_t __78__MPCModelGenericAVItem__getUnverifiedSubscriptionLeaseSessionWithCompletion___block_invoke_394(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 544));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 552);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 560));
  v2 = *(void **)(a1[4] + 568);
  if (!v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseSessionLoadQueue", v3);
    v5 = a1[4];
    v6 = *(void **)(v5 + 568);
    *(_QWORD *)(v5 + 568) = v4;

    v2 = *(void **)(a1[4] + 568);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v2);
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  NSObject *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD block[5];
  __int128 v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.subscriptionLeaseLoadCalloutQueue", v2);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 520);
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_3;
  block[3] = &unk_24CAB1F58;
  v32 = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  block[4] = v4;
  v33 = v7;
  dispatch_sync(v5, block);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_4;
    v27[3] = &unk_24CAB1780;
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 64);
    v28 = v8;
    v29 = v9;
    v30 = *(_QWORD *)(a1 + 80);
    dispatch_async(v3, v27);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v10 = v28;
  }
  else
  {
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_5;
    aBlock[3] = &unk_24CAB17D0;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v24 = v3;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v25 = v11;
    v26 = v12;
    v13 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Loading subscription status...", buf, 0x16u);

    }
    v19 = *(void **)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_385;
    v21[3] = &unk_24CAB1820;
    v21[4] = v19;
    v22 = v13;
    v20 = v13;
    objc_msgSend(v19, "_getSubscriptionStatusWithStoreRequestContext:completion:", v18, v21);

    v10 = v24;
  }

}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_3(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 544));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 552);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 560));
}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 520);
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_6;
  v13[3] = &unk_24CAB17A8;
  v13[1] = 3221225472;
  v13[4] = v7;
  v14 = v6;
  v15 = v8;
  v10 = *(id *)(a1 + 48);
  v16 = v5;
  v17 = v10;
  v18 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  dispatch_barrier_async(v9, v13);

}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_385(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCCB0]), "initWithICSubscriptionStatus:", v5);
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v5;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Finished loading subscription status: %{public}@", buf, 0x20u);

    }
    v12 = objc_msgSend(v7, "shouldUseLease");
    v13 = *(void **)(a1 + 32);
    if (v12)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_387;
      v20[3] = &unk_24CAB17F8;
      v22 = *(id *)(a1 + 40);
      v21 = v7;
      objc_msgSend(v13, "_getUnverifiedSubscriptionLeaseSessionWithCompletion:", v20);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "eventStream");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "engineID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v19;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Skipping subscription lease load since the subscription status indicated it shouldn't be used", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v24 = v15;
      v25 = 2114;
      v26 = 0;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[Lease] - %{public}@: getSubscriptionLeasePropertiesWithCompletion - Finished loading subscription status: %{public}@ with error: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_387(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 552) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 560), *(id *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_7;
  block[3] = &unk_24CAB98A8;
  v6 = *(id *)(a1 + 64);
  v4 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

uint64_t __71__MPCModelGenericAVItem__getSubscriptionLeasePropertiesWithCompletion___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __82__MPCModelGenericAVItem__getSubscriptionStatusWithStoreRequestContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "subscriptionStatus");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __73__MPCModelGenericAVItem__timedMetadataResponseDidInvalidateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTimedMetadataRequest");
}

void __67__MPCModelGenericAVItem__suzeLeaseSessionRenewDidFailNotification___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[75] == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "itemError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(*(id *)(a1 + 32), "setItemError:", *(_QWORD *)(a1 + 48));
  }
}

uint64_t __71__MPCModelGenericAVItem__subscriptionLeaseStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreventionStatusWithLeaseSession:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__MPCModelGenericAVItem__contentTasteControllerDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsPersistedLikedStateUpdate");
}

void __68__MPCModelGenericAVItem__ageVerificationStateDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "explicitBadge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExplicitBadge:", v2);

}

void __89__MPCModelGenericAVItem__allowsHighQualityMusicStreamingOnCellularDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isAssetLoaded"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "playerItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_applyPreferredPeakBitRateToPlayerItem:withItemType:", v3, objc_msgSend(*(id *)(a1 + 32), "type"));

  }
}

void __64__MPCModelGenericAVItem_environmentMonitorDidChangeNetworkType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isAssetLoaded"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "playerItem");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_applyPreferredPeakBitRateToPlayerItem:withItemType:", v3, objc_msgSend(*(id *)(a1 + 32), "type"));

  }
}

void __78__MPCModelGenericAVItem_nowPlayingInfoCenter_lyricsForContentItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (v6
    || (objc_msgSend(v5, "lyrics"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "text"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v18 = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "No lyrics available. Error: %{public}@, modelObject: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v10 = 0;
  }
  else
  {
    v22 = CFSTR("ids");
    objc_msgSend(v5, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCAE0]), "initWithIdentifier:userInfo:", *(_QWORD *)(a1 + 40), v8);
    v15 = objc_alloc(MEMORY[0x24BDDCAD8]);
    objc_msgSend(v5, "lyrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v15, "initWithLyrics:userProvided:token:", v17, 0, v14);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  msv_dispatch_on_main_queue();

}

void __52__MPCModelGenericAVItem__reloadTimedMetadataRequest__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 672) == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 680))
    {
      objc_msgSend(v2, "removeObserver:name:object:");
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v4 + 680), *(id *)(a1 + 48));
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 680))
    {
      objc_msgSend(v3, "addObserver:selector:name:object:");
      v5 = *(_QWORD *)(a1 + 32);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 784));
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 872);
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 648);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 784));
    objc_msgSend(*(id *)(a1 + 48), "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstItem");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v12 = v11;

    v13 = v12;
    if (v7 == v13)
    {

    }
    else
    {
      v14 = v7;
      v15 = objc_msgSend(v14, "isEqual:", v13);

      if ((v15 & 1) == 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 784));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "identifiers");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 648), v11);
        objc_msgSend(v13, "flattenedGenericObject");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 640);
        *(_QWORD *)(v18 + 640) = v17;

        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 784));
        v20 = objc_msgSend(*(id *)(a1 + 48), "isFirstResponse");
        objc_msgSend(*(id *)(a1 + 32), "_invalidateContentItemForTimedMetadataChangesChangingRevisionID:", v20);
        if ((_DWORD)v20)
        {
          objc_msgSend(*(id *)(a1 + 32), "setLastMetadataChangeTime:", *(_QWORD *)(a1 + 56));
          objc_msgSend(*(id *)(a1 + 32), "observer");
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "didSignificantlyChangeItem:", *(_QWORD *)(a1 + 32));
        }
        else
        {
          objc_msgSend(v13, "flattenedGenericObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = v23;
          if (v16 == v21)
          {

          }
          else
          {
            v24 = objc_msgSend(v16, "isEqual:", v21);

            if ((v24 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "eventStream");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33[0] = CFSTR("queue-section-id");
              objc_msgSend(*(id *)(a1 + 32), "queueSectionID");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v34[0] = v31;
              v33[1] = CFSTR("queue-item-id");
              objc_msgSend(*(id *)(a1 + 32), "queueItemID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v34[1] = v30;
              v33[2] = CFSTR("item-kind");
              objc_msgSend(v21, "modelKind");
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v25;
              if (!v25)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v25 = objc_claimAutoreleasedReturnValue();
              }
              v29 = (void *)v25;
              v34[2] = v25;
              v33[3] = CFSTR("item-ids");
              v27 = v21;
              if (!v21)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v34[3] = v27;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "emitEventType:payload:", CFSTR("item-update"), v28);

              if (!v21)
              if (!v26)

            }
          }
        }

        objc_msgSend(*(id *)(a1 + 32), "_setNeedsPersistedLikedStateUpdate");
        objc_msgSend(*(id *)(a1 + 32), "_postInvalidationNotifications");

      }
    }

  }
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8990]), "initWithRequestContext:resourceLoadingRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setShouldIncludeDeviceGUID:", *(unsigned __int8 *)(a1 + 104));
  objc_msgSend(v3, "setCertificateURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(v3, "setKeyServerURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(v3, "setLeaseActionType:", *(_QWORD *)(a1 + 80));
  if (*(_BYTE *)(a1 + 104))
    v4 = *(_QWORD *)(a1 + 32) != 0;
  else
    v4 = 0;
  objc_msgSend(v3, "setITunesStoreRequest:", v4);
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend(v3, "setRentalID:");
    objc_msgSend(v3, "setSkippedRentalCheckout:", *(_BYTE *)(a1 + 105) == 0);
  }
  objc_msgSend(*(id *)(a1 + 48), "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("queue-section-id");
  objc_msgSend(*(id *)(a1 + 48), "queueSectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v16[1] = CFSTR("queue-item-id");
  objc_msgSend(*(id *)(a1 + 48), "queueItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("asset-skd");
  objc_msgSend(v3, "contentURI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEventType:payload:", CFSTR("item-key-request-begin"), v10);

  if (!v8)
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
  v12[3] = &unk_24CAB1648;
  v12[4] = *(_QWORD *)(a1 + 48);
  v11 = v2;
  v13 = v11;
  v15[1] = *(id *)(a1 + 96);
  v14 = *(id *)(a1 + 40);
  objc_copyWeak(v15, (id *)(a1 + 72));
  objc_msgSend(v3, "performWithResponseHandler:", v12);
  objc_destroyWeak(v15);

}

uint64_t __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *MEMORY[0x24BEC8700];
  v4 = a2;
  objc_msgSend(v4, "urlForBagKey:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v4, "urlForBagKey:", *MEMORY[0x24BEC86F8]);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id *v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = CFSTR("queue-section-id");
  objc_msgSend(*(id *)(a1 + 32), "queueSectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  v31[1] = CFSTR("queue-item-id");
  objc_msgSend(*(id *)(a1 + 32), "queueItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v9;
  v31[2] = CFSTR("key-request-error");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emitEventType:payload:", CFSTR("item-key-request-end"), v11);

  if (!v6)
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDBCED8]);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *MEMORY[0x24BDDBA20];
  v16 = *MEMORY[0x24BDDBA10];
  v17 = (void *)MEMORY[0x24BDD16E0];
  MPProcessInfoSystemWallClockUptime();
  objc_msgSend(v17, "numberWithDouble:", v18 - *(double *)(a1 + 64));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v14, v15, v12, v16, v19, *MEMORY[0x24BDDBA08], 0);

  if (v6)
    objc_msgSend(v20, "setObject:forKey:", v6, *MEMORY[0x24BDDBA18]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
  block[3] = &unk_24CAB1620;
  v26 = v5;
  v27 = *(id *)(a1 + 48);
  v28 = v6;
  v21 = (id *)(a1 + 56);
  v22 = v6;
  v23 = v5;
  objc_copyWeak(&v30, v21);
  v29 = v20;
  v24 = v20;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v30);
}

void __80__MPCModelGenericAVItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "finishAssetResourceLoadingRequest:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x24BDDB9E8], WeakRetained, *(_QWORD *)(a1 + 56));

  }
}

void __44__MPCModelGenericAVItem_artworkCatalogBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke_2;
    v5[3] = &unk_24CAB9830;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __77__MPCModelGenericAVItem__handleUpdatedLikedState_forUserIdentity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 2)
      v3 = 1;
    else
      v3 = 2 * (a2 == 1);
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  }
  return result;
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_328(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v3;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to clear file asset error=%{public}@.", buf, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v16 = 0;
    v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v16);
    v9 = v16;

    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = a1[4];
        v13 = (void *)a1[5];
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2114;
        v20 = v13;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cleared cached asset from the library and removed local file at %{public}@.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = a1[4];
      v15 = (void *)a1[5];
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove unauthorized content at %{public}@ error=%{public}@.", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = objc_msgSend(a3, "shouldUseLease");
  if (v5 && v6)
  {
    v7 = objc_alloc(MEMORY[0x24BEC8898]);
    objc_msgSend(v5, "requestContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithRequestContext:", v8);

    objc_msgSend(v9, "setShouldPreventLeaseAcquisition:", 1);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2;
    v14[3] = &unk_24CAB4C90;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v15 = v5;
    v11 = (id)objc_msgSend(v15, "performPlaybackRequest:completionHandler:", v9, v14);

  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_336;
    v12[3] = &unk_24CAB9720;
    v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
    v9 = v13;
  }

}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_4;
  v11[3] = &unk_24CAB7B40;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(a1 + 40);
      v11 = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Finished authorize machine request for error resolution with error: %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventStream");
    v2 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v2, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished authorize machine request successfully.", (uint8_t *)&v11, 0x16u);

    }
  }

  if (*(_QWORD *)(a1 + 48))
    v8 = *(_QWORD *)(a1 + 32) == 0;
  else
    v8 = 0;
  v9 = v8;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v9);
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[2];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = a3;
  objc_msgSend(v7, "errorForICError:response:", a4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v8, 4, CFSTR("Resolving error"), objc_msgSend(a1[4], "isStartItem"));

  if (v9)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Subscription lease request failed [error during resolution] - error=%{public}@.", buf, 0x16u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_332;
    block[3] = &unk_24CAB9830;
    v12 = &v25;
    v25 = a1[6];
    v24 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v13 = v24;
  }
  else
  {
    objc_msgSend(a1[4], "eventStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1[4];
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished sending subscription lease request for error resolution", buf, 0x16u);

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_333;
    v20[3] = &unk_24CAB98A8;
    v12 = (id *)v21;
    v18 = a1[5];
    v19 = a1[4];
    v21[0] = v18;
    v21[1] = v19;
    v22 = a1[6];
    dispatch_async(MEMORY[0x24BDAC9B8], v20);
    v13 = v22;
  }

}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_336(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_332(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_333(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_334;
  v2[3] = &unk_24CAB1580;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "reloadFairPlayKeyStatusWithCompletionHandler:", v2);

}

void __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_2_334(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Finished reloading FairPlayKey status - error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v7, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-%{public}@: Finished reloading FairPlayKey status", buf, 0x16u);

    }
  }

  v15 = *(id *)(a1 + 40);
  v14 = v5;
  v12 = v6;
  v13 = v5;
  msv_dispatch_on_main_queue();

}

uint64_t __61__MPCModelGenericAVItem_resolvePlaybackError_withCompletion___block_invoke_335(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if ((objc_msgSend(*(id *)(a1 + 32), "hasOnlinePlaybackKeys") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "hasOfflinePlaybackKeys");
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));
}

uint64_t __62__MPCModelGenericAVItem__updateAudioFormatInfoForContentItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nowPlayingAudioFormat");
}

void __36__MPCModelGenericAVItem_stationName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (objc_msgSend(a3, "shouldUseLease"))
  {
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    msv_dispatch_on_main_queue();

    v6 = v13;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [Subscription lease not required]", buf, 0x16u);

  }
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = v11;
    msv_dispatch_on_main_queue();
    v6 = v12;
    goto LABEL_7;
  }
LABEL_8:

}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 584);
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "engineID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Sending subscription lease request", buf, 0x16u);

  }
  v6 = objc_alloc(MEMORY[0x24BEC8898]);
  objc_msgSend(*(id *)(a1 + 40), "requestContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRequestContext:", v7);

  objc_msgSend(v8, "setShouldRequireLeaseAcquisition:", *(unsigned __int8 *)(a1 + 56));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_287;
  v11[3] = &unk_24CAB4C90;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v13 = *(id *)(a1 + 48);
  v10 = (id)objc_msgSend(v12, "performPlaybackRequest:completionHandler:", v8, v11);

}

uint64_t __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_291(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_287(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = a3;
  objc_msgSend(v8, "errorForICError:response:", a4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "code") == -7600)
  {
    objc_msgSend(a1[4], "eventStream");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_9;
  }
  if (!v10)
  {
    objc_msgSend(a1[4], "eventStream");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      -[NSObject engineID](v11, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1[4];
      objc_msgSend(a1[5], "leaseStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v16;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v7;
      v31 = 2114;
      v32 = v18;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Finished subscription lease request for rate preparation with response: %{public}@ - status: %{public}@", buf, 0x2Au);

    }
LABEL_9:

    goto LABEL_10;
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = a1[4];
    objc_msgSend(a1[5], "leaseStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "msv_description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v13;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[LeaseRatePreparation] - %{public}@: Finished subscription lease request for rate preparation with response: %{public}@ - status: %{public}@ error=%{public}@", buf, 0x2Au);

  }
LABEL_10:

  v24 = a1[6];
  v21 = v7;
  v22 = v10;
  v23 = a1[5];
  v19 = v10;
  v20 = v7;
  msv_dispatch_on_main_queue();
  objc_msgSend(a1[4], "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v9, 4, CFSTR("Prepare for rate"), a1[6] != 0);

}

_BYTE *__90__MPCModelGenericAVItem__prepareLeaseWithShouldRequireLeaseAcquisition_completionHandler___block_invoke_288(_QWORD *a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  _BYTE *result;

  --*(_QWORD *)(a1[4] + 584);
  v2 = a1[8];
  if (v2)
  {
    if (a1[5])
      v3 = a1[6] == 0;
    else
      v3 = 0;
    v4 = v3;
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
  }
  result = (_BYTE *)a1[4];
  if (result[592])
    return (_BYTE *)objc_msgSend(result, "_updatePreventionStatusWithLeaseSession:", a1[7]);
  return result;
}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  double v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5
    || (a2 & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "itemError"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if (!a2)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setItemError:", v5);
    if (!a2)
      goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 52))
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 760);
      if (v8)
      {
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2;
        v15[3] = &unk_24CAB9720;
        v16 = v7;
        objc_msgSend(v8, "waitForKeyRenewalsWithCompletionHandler:", v15);

        goto LABEL_12;
      }
    }
  }
LABEL_10:
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(float *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    v21 = 2048;
    v22 = v14;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Finished preparing for rate: %f.", buf, 0x20u);

  }
}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_278(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MPCNonZeroEffectiveRateTask *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  int v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "leaseStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 **)(a1 + 32);
    v7 = v6[577];
    if (objc_msgSend(v6, "isDownloadedAsset"))
      v8 = objc_msgSend(v5, "hasOfflinePlaybackKeys");
    else
      v8 = 0;
    if (v7)
      v13 = v8 ^ 1;
    else
      v13 = 0;
    if (objc_msgSend(v5, "shouldPlaybackRequireOnlineKeys"))
      v14 = objc_msgSend(v5, "hasOnlinePlaybackKeys") ^ 1;
    else
      v14 = 0;
    if ((objc_msgSend(v5, "hasOnlinePlaybackKeys") & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v5, "hasOfflinePlaybackKeys") ^ 1;
    if ((v13 & (v14 | v15)) == 1)
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 800);
      *(_QWORD *)(v16 + 800) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_prepareLeaseWithShouldRequireLeaseAcquisition:completionHandler:", 0, *(_QWORD *)(a1 + 40));
      goto LABEL_29;
    }
    v36 = v13;
    if ((v8 & 1) != 0)
      goto LABEL_20;
    objc_msgSend(v4, "leaseExpirationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceNow");
    if (v28 <= 60.0)
    {

    }
    else
    {
      v29 = objc_msgSend(*(id *)(a1 + 32), "isHLSAsset");

      if ((v29 & 1) == 0)
      {
LABEL_20:
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "contentItemID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("leaseAcquisition:%@"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = [MPCNonZeroEffectiveRateTask alloc];
        objc_msgSend(*(id *)(a1 + 32), "playerItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = MEMORY[0x24BDAC9B8];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2_282;
        v39[3] = &unk_24CAB7860;
        objc_copyWeak(&v40, (id *)buf);
        v24 = -[MPCNonZeroEffectiveRateTask initWithPlayerItem:identifier:timeout:queue:block:](v21, "initWithPlayerItem:identifier:timeout:queue:block:", v22, v20, MEMORY[0x24BDAC9B8], v39, 15.0);
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 800);
        *(_QWORD *)(v25 + 800) = v24;

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
LABEL_26:
        objc_msgSend(*(id *)(a1 + 32), "eventStream");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v32, "engineID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544642;
          v42 = v34;
          v43 = 2114;
          v44 = v35;
          v45 = 1024;
          v46 = v36;
          v47 = 1024;
          v48 = v8;
          v49 = 1024;
          v50 = v14;
          v51 = 1024;
          v52 = v15;
          _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [Playback keys not required] - someKeysAreRequired:%{BOOL}u - isDownloadedAndHasOfflineKeys: %{BOOL}u - requiresOnlineKeys: %{BOOL}u - hasNeitherOnlineNorOfflineKeys: %{BOOL}u", buf, 0x2Eu);

        }
        v38 = *(id *)(a1 + 40);
        msv_dispatch_on_main_queue();

        goto LABEL_29;
      }
    }
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(void **)(v30 + 800);
    *(_QWORD *)(v30 + 800) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_prepareLeaseWithShouldRequireLeaseAcquisition:completionHandler:", 1, 0);
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "engineID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    v43 = 2114;
    v44 = v12;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[LeaseRatePreparation] - %{public}@: Early completion [No subscription lease session available]", buf, 0x16u);

  }
  v37 = *(id *)(a1 + 40);
  msv_dispatch_on_main_queue();
  v5 = v37;
LABEL_29:

}

void __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2_282(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_prepareLeaseWithShouldRequireLeaseAcquisition:completionHandler:", 1, 0);

  }
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_284(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_285(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__MPCModelGenericAVItem_prepareForRate_completionHandler___block_invoke_2()
{
  return msv_dispatch_on_main_queue();
}

uint64_t __44__MPCModelGenericAVItem_prefersSeekOverSkip__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  if (result == 4)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "subtype");
    v3 = result == 1;
  }
  else
  {
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __54__MPCModelGenericAVItem_updateAudioFormatsDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "tier");
  if (v6 <= objc_msgSend(v5, "tier"))
  {
    v8 = objc_msgSend(v4, "tier");
    if (v8 >= objc_msgSend(v5, "tier"))
    {
      v9 = objc_msgSend(v4, "tier");
      if (v9 != objc_msgSend(v5, "tier"))
        goto LABEL_10;
      v10 = objc_msgSend(v4, "tier");
      v11 = objc_msgSend(v4, "bitrate");
      v12 = objc_msgSend(v5, "bitrate");
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v13 = objc_msgSend(v4, "bitDepth");
        v11 = objc_msgSend(v4, "sampleRate") * v13;
        v14 = objc_msgSend(v5, "bitDepth");
        v12 = objc_msgSend(v5, "sampleRate") * v14;
      }
      if (v11 > v12)
        goto LABEL_2;
      if (v11 >= v12)
      {
LABEL_10:
        v7 = 0;
        goto LABEL_11;
      }
    }
    v7 = 1;
    goto LABEL_11;
  }
LABEL_2:
  v7 = -1;
LABEL_11:

  return v7;
}

void __107__MPCModelGenericAVItem__checkDownloadErrorAndValidityOfDownloadedHLSAsset_downloadLocationURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v11 = 0;
    v4 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), &v11);
    v5 = v11;
    v6 = v5;
    if (v4 == 3 || v5 != 0)
    {
      objc_msgSend(WeakRetained, "eventStream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "engineID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v13 = v10;
        v14 = 2114;
        v15 = WeakRetained;
        v16 = 2114;
        v17 = v6;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Clearing cached asset [asset is corrupted]. Error=%{public}@", buf, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeFromDownloadCompletionPendingItems");

}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_247(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _QWORD *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetCacheProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didCacheNewAssetToDestinationURL:", *(_QWORD *)(a1 + 48));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "eventStream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v33 = v10;
      v34 = 2114;
      v35 = v7;
      v36 = 2114;
      v37 = v11;
      v38 = 2114;
      v39 = v4;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Asset download complete. url:%{public}@ err=%{public}@", buf, 0x2Au);

    }
    v12 = (void *)v7[97];
    v7[97] = 0;

    v13 = (void *)v7[96];
    v7[96] = 0;

    objc_msgSend(v7, "_removeFromDownloadCompletionPendingItems");
    v14 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_248;
    v21[3] = &unk_24CAB1410;
    v15 = (id *)&v22;
    v16 = v7;
    v22 = v16;
    v23 = *(id *)(a1 + 48);
    v24 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 96);
    v26 = v17;
    v29 = v18;
    v27 = *(id *)(a1 + 72);
    v28 = *(id *)(a1 + 80);
    objc_msgSend(v16, "_checkDownloadErrorAndValidityOfDownloadedHLSAsset:downloadLocationURL:completion:", v4, v14, v21);

    v19 = v23;
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 96) == 1 && objc_msgSend(*(id *)(a1 + 48), "isEqual:", *(_QWORD *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetCacheProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "genericObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_2;
    v30[3] = &unk_24CAB6D88;
    v15 = &v31;
    v31 = *(id *)(a1 + 48);
    objc_msgSend(v19, "clearPlaybackAssetCacheFileAssetForGenericObject:withCompletionHandler:", v20, v30);

LABEL_7:
  }

}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_255(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "duration");
    if (v7 >= 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      v4 = WeakRetained;
      if (WeakRetained)
      {
        v5 = (id)objc_msgSend(WeakRetained, "_createOrUpdateDatabaseEntry:loadResult:urlBag:destinationURL:purgeable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1);
        if (objc_msgSend(*(id *)(a1 + 64), "isEqual:", v4[99]))
        {
          v6 = (void *)v4[99];
          v4[99] = 0;

        }
      }

    }
  }
}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v3;
      v6 = "[AL] - NIL: [Asset caching: HLS] Asset download cancelled - Failed to clear cache properties. err=%{public}@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_210BD8000, v7, v8, v6, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    v6 = "[AL] - NIL: [Asset caching: HLS] Asset download cancelled - Cleared cache properties. url:%{public}@";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_248(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (a2
    && objc_msgSend(*(id *)(a1 + 32), "_linkAssetIfNeededAtURL:toDestinationURL:shareCacheURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 792)))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 792);
      *(_QWORD *)(v3 + 792) = 0;

    }
    objc_msgSend(*(id *)(a1 + 64), "fileAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "_createOrUpdateDatabaseEntry:loadResult:urlBag:destinationURL:purgeable:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88) != 2);
    if (!objc_msgSend(v6, "length") || (objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v11 = objc_msgSend(v10, "removeItemAtURL:error:", v9, &v27);
    v12 = v27;

    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "engineID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v29 = v16;
        v30 = 2114;
        v31 = v17;
        v32 = 2114;
        v33 = v9;
        v18 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Removed previous file at URL: %{public}@";
        v19 = v15;
        v20 = OS_LOG_TYPE_DEFAULT;
        v21 = 32;
LABEL_15:
        _os_log_impl(&dword_210BD8000, v19, v20, v18, buf, v21);

      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v29 = v16;
      v30 = 2114;
      v31 = v24;
      v32 = 2114;
      v33 = v9;
      v34 = 2114;
      v35 = v12;
      v18 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to remove previous file at URL: %{public}@ error: %{public}@.";
      v19 = v15;
      v20 = OS_LOG_TYPE_ERROR;
      v21 = 42;
      goto LABEL_15;
    }

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 64), "assetCacheProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "genericObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_249;
  v25[3] = &unk_24CAB6D88;
  v26 = *(id *)(a1 + 32);
  objc_msgSend(v22, "clearPlaybackAssetCacheFileAssetForGenericObject:withCompletionHandler:", v23, v25);

  v6 = v26;
LABEL_18:

}

void __157__MPCModelGenericAVItem__downloadHLSAsset_destinationURL_sharedCacheURL_assetLoadProperties_loadResult_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke_249(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to clear cache properties. err=%{public}@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    goto LABEL_19;
  objc_msgSend(v5, "engineID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adm"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    if ((v9 & 2) == 0)
    {
LABEL_4:
      if ((v9 & 4) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lossless"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  if ((v9 & 4) == 0)
  {
LABEL_5:
    if ((v9 & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("high-res lossless"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v15);

  if ((v9 & 8) == 0)
  {
LABEL_6:
    if ((v9 & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("atmos"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

    if ((v9 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("spatial"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  if ((v9 & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v9 & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("surround"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
LABEL_9:
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("None");
  }

  v22 = 138543874;
  v23 = v7;
  v24 = 2114;
  v25 = v8;
  v26 = 2114;
  v27 = v12;
  _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Setting cache properties of HLS asset with traits: %{public}@", (uint8_t *)&v22, 0x20u);

LABEL_19:
  objc_msgSend(*(id *)(a1 + 40), "relativePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilePath:", v18);

  objc_msgSend(v4, "setQualityType:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setNonPurgeable:", *(_BYTE *)(a1 + 96) == 0);
  objc_msgSend(v4, "setProtectionType:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setTraits:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 48), "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHLSKeyServerURL:", v19);

  objc_msgSend(*(id *)(a1 + 56), "keyServerProtocolType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHLSKeyServerProtocol:", v20);

  objc_msgSend(*(id *)(a1 + 64), "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHLSKeyCertificateURL:", v21);

}

void __97__MPCModelGenericAVItem__createOrUpdateDatabaseEntry_loadResult_urlBag_destinationURL_purgeable___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "eventStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "engineID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v9;
        v16 = 2114;
        v17 = v5;
        v18 = 2114;
        v19 = v3;
        v10 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Failed to update cache provider properties for HLS as"
              "set. err=%{public}@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 32;
LABEL_7:
        _os_log_impl(&dword_210BD8000, v11, v12, v10, (uint8_t *)&v14, v13);

      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "engineID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v5;
      v10 = "[%{public}@]-[AL] - %{public}@: [Asset caching: HLS] Succeeded to update cache provider properties for HLS asset";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
      goto LABEL_7;
    }

  }
}

id __174__MPCModelGenericAVItem__downloadHLSAssetWhilePlaying_assetLoadProperties_assetLoadResult_destinationURL_sharedCacheURL_storeRequestContext_urlBag_fileUpgradeRecommendation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1858], "backgroundSessionConfigurationWithIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsCellularAccess:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v2, "setDiscretionary:", 0);
  objc_msgSend(v2, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v2, "setHTTPShouldSetCookies:", 0);
  objc_msgSend(v2, "setHTTPShouldUsePipelining:", 1);
  objc_msgSend(v2, "setRequestCachePolicy:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8748]), "initWithConfiguration:", v2);

  return v3;
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = a1 + 32;
  v1 = *(char **)(a1 + 32);
  v2 = *(_QWORD *)(v3 + 8);
  v4 = *(_QWORD *)&v1[*MEMORY[0x24BDDCD10]];
  objc_msgSend(v1, "itemError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);

}

uint64_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "disarm");
    if ((_DWORD)result)
    {
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 28, CFSTR("Asset load task cancelled at line %ld"), a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

      return 1;
    }
  }
  return result;
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(*(_QWORD *)(v4 + 8) + 40);
  if (v5)
    v6 = v5 == v3;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v5, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCError"), 24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD *)(a1 + 40);
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(v4 + 8) + 40));
      v4 = *(_QWORD *)(a1 + 40);
    }
  }
  v8 = *(_QWORD *)(v4 + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_69(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "[AL][Bag Loading] - %{public}@: Failed to load the bag. err=%{public}@.", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v8, 0, CFSTR("Loading asset"), objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_75(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  dispatch_semaphore_t v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  int v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;
  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      -[NSObject engineID](v3, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Loading subscription lease properties.", buf, 0x16u);

    }
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 72);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoadAssetGetSubscriptionLeaseProperties", ", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v13 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__755;
    v43 = __Block_byref_object_dispose__756;
    v44 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__755;
    v35 = __Block_byref_object_dispose__756;
    v36 = 0;
    v14 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_76;
    v27[3] = &unk_24CAB1180;
    v29 = &v31;
    v30 = buf;
    v3 = v13;
    v28 = v3;
    objc_msgSend(v14, "_getSubscriptionLeasePropertiesWithCompletion:", v27);
    v15 = dispatch_time(0, 1000000000 * *(_QWORD *)(a1 + 80));
    if (dispatch_semaphore_wait(v3, v15))
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Timed out loading subscription lease properties"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(a1 + 32);
        *(_DWORD *)v37 = 138543362;
        v38 = v19;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Timed out loading subscription lease properties.", v37, 0xCu);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (id)v32[5]);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)&buf[8] + 40));
      objc_msgSend(*(id *)(a1 + 32), "eventStream");
      v18 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject engineID](v18, "engineID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v37 = 138543618;
        v38 = v21;
        v39 = 2114;
        v40 = v22;
        _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished loading subscription lease properties.", v37, 0x16u);

      }
    }

    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v24 = v23;
    v25 = *(_QWORD *)(a1 + 72);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = objc_msgSend(*(id *)(a1 + 32), "isStartItem");
      *(_DWORD *)v37 = 67240192;
      LODWORD(v38) = v26;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v24, OS_SIGNPOST_INTERVAL_END, v25, "LoadAssetGetSubscriptionLeaseProperties", " enableTelemetry=YES isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", v37, 8u);
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v5)
    {
      -[NSObject engineID](v3, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Subscription lease properties already loaded.", buf, 0x16u);

    }
  }

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_103(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v15 = v7;
  v11 = a3;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 2, CFSTR("Loading asset"), objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_108(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v15 = v7;
  v11 = a3;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 3, CFSTR("Loading asset"), objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v5;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished reload of FairPlay key status: %{public}@ with error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v7, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 32);
      v15 = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished reload of FairPlay key status: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_133(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v9, 4, CFSTR("Loading asset"), objc_msgSend(v7, "isStartItem"));

  objc_msgSend(MEMORY[0x24BDD1540], "errorForICError:response:", v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "eventStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "engineID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL][Lease] - %{public}@: loadAssetAndPlayerItem - Finished subscription lease request for playback keys with error: %{public}@.", (uint8_t *)&v20, 0x20u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_163(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v10 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Full subscription asset loading completed [first asset requires online keys]", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v10, 2, CFSTR("Loading full subscription asset [first asset requires online keys]"), 0);
  if (*(_BYTE *)(a1 + 64))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_166(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  char v32;
  char v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 32), "assetCacheProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didCacheNewAssetToDestinationURL:", *(_QWORD *)(a1 + 40));

  if (!a2
    || !objc_msgSend(WeakRetained, "_linkAssetIfNeededAtURL:toDestinationURL:shareCacheURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = WeakRetained;
      v36 = 2114;
      v37 = v5;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Asset download completed with error: %{public}@", buf, 0x16u);
    }
    v17 = 0;
    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "eventStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "engineID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v10;
    v36 = 2114;
    v37 = WeakRetained;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Asset download completed successfully.", buf, 0x16u);

  }
  if (*(_BYTE *)(a1 + 136) && *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(WeakRetained, "eventStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v35 = v13;
      v36 = 2114;
      v37 = WeakRetained;
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Writing placeholder purchase bundle at path: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", &unk_24CB17258, 200, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      -[NSObject writeToURL:options:error:](v15, "writeToURL:options:error:", *(_QWORD *)(a1 + 64), 0, 0);
    v17 = 1;
LABEL_15:

    goto LABEL_16;
  }
  v17 = 1;
LABEL_16:
  if (_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueueOnceToken != -1)
    dispatch_once(&_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueueOnceToken, &__block_literal_global_943);
  v18 = _MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_173;
  v22[3] = &unk_24CAB1300;
  v32 = v17;
  v33 = *(_BYTE *)(a1 + 136);
  v29 = *(_OWORD *)(a1 + 88);
  v19 = *(NSObject **)(a1 + 72);
  v20 = *(id *)(a1 + 80);
  v30 = *(_QWORD *)(a1 + 104);
  v23 = v20;
  v24 = WeakRetained;
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 48);
  v31 = *(_OWORD *)(a1 + 120);
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 40);
  v21 = WeakRetained;
  dispatch_group_notify(v19, v18, v22);

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_201(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v15 = v7;
  v11 = a3;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_emitNetworkOperationWithPerformanceMetrics:operationType:reason:blocksPlayback:", v11, 5, CFSTR("Loading asset"), objc_msgSend(*(id *)(a1 + 32), "isStartItem"));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_205(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 608) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "beginAutomaticallyRefreshingLease");
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_173(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v34;
  const __CFString *v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint32_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  _BOOL4 v49;
  NSObject *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  char v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  const __CFString *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  NSObject *v71;
  id v72;
  __int128 v73;
  char v74;
  uint8_t buf[4];
  NSObject *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  NSObject *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 120))
  {
    if (!*(_BYTE *)(a1 + 121))
    {
LABEL_29:
      if (!*(_QWORD *)(a1 + 48) || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
      {
        v54 = 0;
LABEL_42:
        v59 = objc_alloc(MEMORY[0x24BDDC878]);
        v60 = objc_alloc(MEMORY[0x24BDDC758]);
        objc_msgSend(MEMORY[0x24BDDC880], "identityKind");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v60, "initWithSource:modelKind:block:", CFSTR("ModelGenericAVItem"), v61, &__block_literal_global_185);
        v63 = MEMORY[0x24BDAC760];
        v70[0] = MEMORY[0x24BDAC760];
        v70[1] = 3221225472;
        v70[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_186;
        v70[3] = &unk_24CAB12D8;
        v71 = *(id *)(a1 + 56);
        v73 = *(_OWORD *)(a1 + 104);
        v74 = v54;
        v72 = *(id *)(a1 + 48);
        v64 = (void *)objc_msgSend(v59, "initWithIdentifiers:block:", v62, v70);

        dispatch_suspend((dispatch_object_t)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue);
        objc_msgSend(*(id *)(a1 + 64), "assetCacheProvider");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "genericObject");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v63;
        v68[1] = 3221225472;
        v68[2] = __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_3;
        v68[3] = &unk_24CAB6D88;
        v69 = *(id *)(a1 + 40);
        objc_msgSend(v65, "setPlaybackAssetCacheFileAsset:forGenericObject:withCompletionHandler:", v64, v66, v68);

        v10 = v71;
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "fileExistsAtPath:", v45);

      objc_msgSend(*(id *)(a1 + 40), "eventStream");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
      if (v46)
      {
        if (v49)
        {
          objc_msgSend(v47, "engineID");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = *(const __CFString **)(a1 + 40);
          v52 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v76 = v50;
          v77 = 2114;
          v78 = v51;
          v79 = 2114;
          v80 = v52;
          _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Writing purchase bundle at path: %{public}@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), 200, 0, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v53;
        if (v53)
        {
          v54 = objc_msgSend(v53, "writeToURL:options:error:", *(_QWORD *)(a1 + 48), 0, 0);
LABEL_41:

          goto LABEL_42;
        }
      }
      else
      {
        if (v49)
        {
          objc_msgSend(v47, "engineID");
          v55 = objc_claimAutoreleasedReturnValue();
          v57 = *(NSObject **)(a1 + 48);
          v56 = *(void **)(a1 + 56);
          v58 = *(const __CFString **)(a1 + 40);
          *(_DWORD *)buf = 138544130;
          v76 = v55;
          v77 = 2114;
          v78 = v58;
          v79 = 2114;
          v80 = v56;
          v81 = 2114;
          v82 = v57;
          _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Not writing purchase bundle [asset no longer on disk] assetPath = %{public}@ purchaseBundlePath = %{public}@", buf, 0x2Au);

        }
      }
      v54 = 0;
      goto LABEL_41;
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v3 = *(void **)(v2 + 40);
      *(_QWORD *)(v2 + 40) = 0;

      v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = *(NSObject **)(a1 + 40);
        v6 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v76 = v5;
        v77 = 2114;
        v78 = v6;
        _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Failed to load full subscription asset: %{public}@.", buf, 0x16u);
      }
      goto LABEL_28;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "assetURL");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject host](v4, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    -[NSObject path](v4, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (v20)
      v24 = v23 == 0;
    else
      v24 = 1;
    if (v24)
    {
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;

      objc_msgSend(*(id *)(a1 + 32), "host");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject host](v4, "host");
      v32 = objc_claimAutoreleasedReturnValue();
      if ((v23 & 1) != 0)
      {
        v27 = CFSTR("host mismatch");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "path");
        v41 = objc_claimAutoreleasedReturnValue();

        -[NSObject path](v4, "path");
        v42 = objc_claimAutoreleasedReturnValue();

        v27 = CFSTR("path mismatch");
        v32 = v42;
        v31 = (void *)v41;
      }
      v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      v43 = *(NSObject **)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v76 = v43;
      v77 = 2114;
      v78 = v27;
      v79 = 2114;
      v80 = v31;
      v81 = 2114;
      v82 = v32;
      v37 = "[AL] - %{public}@: [Asset caching: CRABS] Ignoring full subscription asset purchase bundle [%{public}@] expe"
            "cted=%{public}@ loaded=%{public}@";
      v38 = v34;
      v39 = OS_LOG_TYPE_ERROR;
      v40 = 42;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "purchaseBundleDictionary");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

      objc_msgSend(*(id *)(a1 + 40), "eventStream");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      objc_msgSend(v31, "engineID");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(const __CFString **)(a1 + 40);
      v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v76 = v34;
      v77 = 2114;
      v78 = v35;
      v79 = 2112;
      v80 = v36;
      v37 = "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Loaded full subscription asset, updated purchaseBundle = %@";
      v38 = v32;
      v39 = OS_LOG_TYPE_DEFAULT;
      v40 = 32;
    }
    _os_log_impl(&dword_210BD8000, v38, v39, v37, buf, v40);
LABEL_26:

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 72);
  v67 = 0;
  v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v67);
  v10 = v67;

  if (v9)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(NSObject **)(a1 + 40);
      v13 = *(const __CFString **)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      v76 = v12;
      v77 = 2114;
      v78 = v13;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: [Asset caching: CRABS] Removed incomplete download at URL: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "eventStream");
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[NSObject engineID](v11, "engineID");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(const __CFString **)(a1 + 40);
      v17 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138544130;
      v76 = v15;
      v77 = 2114;
      v78 = v16;
      v79 = 2114;
      v80 = v17;
      v81 = 2114;
      v82 = v10;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-[AL] - %{public}@: [Asset caching: CRABS] Failed to remove incomplete downloaded file at URL: %{public}@ error: %{public}@.", buf, 0x2Au);

    }
  }

LABEL_43:
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2_186(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relativePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilePath:", v3);

  objc_msgSend(v5, "setQualityType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setNonPurgeable:", 0);
  objc_msgSend(v5, "setProtectionType:", *(_QWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "relativePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPurchaseBundleFilePath:", v4);

  }
  else
  {
    objc_msgSend(v5, "setPurchaseBundleFilePath:", 0);
  }
  objc_msgSend(v5, "setTraits:", 0);
  objc_msgSend(v5, "setHLSKeyServerURL:", &stru_24CABB5D0);
  objc_msgSend(v5, "setHLSKeyServerProtocol:", &stru_24CABB5D0);
  objc_msgSend(v5, "setHLSKeyCertificateURL:", &stru_24CABB5D0);

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      v7 = "[AL] - %{public}@: [Asset caching: CRABS] Error caching file asset: %{public}@.";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_210BD8000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    v7 = "[AL] - %{public}@: [Asset caching: CRABS] Finished caching file asset.";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

  dispatch_resume((dispatch_object_t)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue);
}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_171()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.sCompletionSerialQueue", v2);
  v1 = (void *)_MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue;
  _MPCModeliTunesStoreContentPurchasedMediaKindSong_block_invoke_sCompletionSerialQueue = (uint64_t)v0;

}

void __67__MPCModelGenericAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __37__MPCModelGenericAVItem_isAlwaysLive__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  if (result == 4)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "subtype");
    v3 = result == 1;
  }
  else
  {
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __32__MPCModelGenericAVItem_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endAutomaticallyRefreshingLease");
}

+ (int64_t)_unwrapPlaybackError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BDD1100]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if ((unint64_t)(v5 + 49999) >> 6 <= 0x7C)
  {
    if ((unint64_t)(v5 + 42597) < 0xE)
    {
      v6 = *((_QWORD *)&unk_210ED9210 + v5 + 42597);
      goto LABEL_16;
    }
LABEL_15:
    v6 = 3;
    goto LABEL_16;
  }
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:", *MEMORY[0x24BDB1C58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code");

  if (v8 == -11835)
  {
    v6 = 5;
    goto LABEL_16;
  }
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:", CFSTR("CoreMediaErrorDomain"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "code");

  if (v6 <= -42813)
  {
    if (v6 == -42829)
    {
      v6 = 1;
      goto LABEL_16;
    }
    if (v6 == -42828 || v6 == -42814)
    {
      v6 = 2;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (v6 == -42812)
    goto LABEL_15;
  if (v6 == -42004)
  {
    v6 = 4;
    goto LABEL_16;
  }
  if (v6)
LABEL_14:
    v6 = 0;
LABEL_16:

  return v6;
}

+ (BOOL)_prefersHighQualityAudioContentForNetworkType:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  if (CFPreferencesGetAppBooleanValue(CFSTR("AlwaysUse64kbpsQuality"), CFSTR("com.apple.mobileipod"), 0))
    return 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("AlwaysUse256kbpsQuality"), CFSTR("com.apple.mobileipod"), 0))
  {
    if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) == 0)
    {
      if ((ICEnvironmentNetworkTypeIsWired() & 1) != 0)
        return 1;
      if (ICEnvironmentNetworkTypeIsWiFi())
      {
        objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isNetworkConstrained");

        if ((v6 & 1) == 0)
          return 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "preferredMusicLowBandwidthResolution") >= 256)
        {

          if (a3 <= 2)
            return 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isCurrentNetworkLinkExpensive");

          if (a3 < 3 || (v9 & 1) != 0)
            return 0;
        }
        objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isNetworkConstrained");

        if (!v11)
          return 1;
      }
    }
    return 0;
  }
  return 1;
}

+ (BOOL)_prefersHighQualityVideoContentForNetworkType:(int64_t)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;

  if ((ICEnvironmentNetworkTypeIsBluetooth() & 1) != 0)
    return 0;
  if ((ICEnvironmentNetworkTypeIsWiFi() & 1) != 0 || ICEnvironmentNetworkTypeIsWired())
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preferredVideoHighBandwidthResolution");
LABEL_6:
    v4 = v6 == 1000000;

    return v4;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "preferredVideoLowBandwidthResolution");

  v4 = 0;
  if (a3 >= 3 && v9 >= 1)
  {
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCurrentNetworkLinkExpensive");

    if (!v11)
      return 1;
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preferredVideoLowBandwidthResolution");
    goto LABEL_6;
  }
  return v4;
}

+ (id)_utilitySerialQueue
{
  if (_utilitySerialQueue_onceToken != -1)
    dispatch_once(&_utilitySerialQueue_onceToken, &__block_literal_global_376);
  return (id)_utilitySerialQueue_utilitySerialQueue;
}

+ (id)_downloadCompletionPendingItems
{
  if (_downloadCompletionPendingItems_onceToken != -1)
    dispatch_once(&_downloadCompletionPendingItems_onceToken, &__block_literal_global_424);
  return (id)_downloadCompletionPendingItems_items;
}

+ (BOOL)automaticallyNotifiesObserversOfChapters
{
  return 0;
}

void __56__MPCModelGenericAVItem__downloadCompletionPendingItems__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_downloadCompletionPendingItems_items;
  _downloadCompletionPendingItems_items = v0;

}

uint64_t __44__MPCModelGenericAVItem__utilitySerialQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)_utilitySerialQueue_utilitySerialQueue;
  _utilitySerialQueue_utilitySerialQueue = (uint64_t)v0;

  objc_msgSend((id)_utilitySerialQueue_utilitySerialQueue, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend((id)_utilitySerialQueue_utilitySerialQueue, "setQualityOfService:", 17);
  return objc_msgSend((id)_utilitySerialQueue_utilitySerialQueue, "setName:", CFSTR("com.apple.MediaPlaybackCore.MPCModelGenericAVItem.utilitySerialQueue"));
}

@end
