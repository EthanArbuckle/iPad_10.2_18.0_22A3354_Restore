@implementation MPAVItem

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPAVItem contentItemID](self, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (%@)"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (void)setLastChangeDirection:(int64_t)a3
{
  if (self->_lastChangeDirection != a3)
  {
    self->_lastChangeDirection = a3;
    -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
  }
}

- (void)_updateContentItemIncludingPlaybackState:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  int64_t v6;
  double Seconds;
  void *v8;
  double v9;
  _BOOL4 v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  int64_t quot;
  int64_t v17;
  _BYTE *v18;
  ldiv_t v19;
  uint64_t v20;
  const UInt8 *v21;
  __CFString *v22;
  MPNowPlayingContentItem **p_contentItem;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  MPNowPlayingContentItem **v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  MPNowPlayingContentItem *v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t v47;
  void *v48;
  MPNowPlayingInfoLyricsItem *v49;
  void *v50;
  MPNowPlayingInfoLyricsItem *v51;
  _BOOL8 v52;
  MPNowPlayingContentItem **v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[7];
  _QWORD v59[4];
  id v60;
  MPAVItem *v61;
  CMTime time;
  CMTime v63;
  char v64;
  _BYTE v65[7];
  _QWORD v66[2];

  v3 = a3;
  v66[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPAVItem persistentID](self, "persistentID");
  v6 = v5;
  if (v5 == -1)
  {
    v6 = -[MPAVItem storeSubscriptionAdamID](self, "storeSubscriptionAdamID");
    if (!v6)
      goto LABEL_5;
  }
  else if (!v5)
  {
LABEL_5:
    v6 = -[MPAVItem storeItemInt64ID](self, "storeItemInt64ID", v6);
    if (!v6)
      goto LABEL_7;
  }
  -[MPNowPlayingContentItem setLegacyUniqueID:](self->_contentItem, "setLegacyUniqueID:", v6);
LABEL_7:
  if (v3)
  {
    -[MPContentItem setPlayable:](self->_contentItem, "setPlayable:", 1);
    memset(&v63, 0, sizeof(v63));
    -[MPAVItem _playerItemDurationIfAvailable](self, "_playerItemDurationIfAvailable");
    Seconds = 0.0;
    if ((unsigned __int128)0 >> 96 == 1)
    {
      time = v63;
      Seconds = CMTimeGetSeconds(&time);
    }
    -[MPNowPlayingContentItem setDuration:](self->_contentItem, "setDuration:", Seconds);
    -[MPAVItem defaultPlaybackRate](self, "defaultPlaybackRate");
    -[MPNowPlayingContentItem setDefaultPlaybackRate:](self->_contentItem, "setDefaultPlaybackRate:");
    -[MPAVItem initialPlaybackStartTime](self, "initialPlaybackStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[MPNowPlayingContentItem setElapsedTime:](self->_contentItem, "setElapsedTime:");

    LODWORD(v9) = 0;
    -[MPNowPlayingContentItem setPlaybackRate:](self->_contentItem, "setPlaybackRate:", v9);
    v10 = -[MPAVItem isAssetLoaded](self, "isAssetLoaded");
    v11 = 0.0;
    if (v10)
      -[MPAVItem timeOfSeekableStart](self, "timeOfSeekableStart", 0.0);
    -[MPNowPlayingContentItem setStartTime:](self->_contentItem, "setStartTime:", v11);
  }
  -[MPNowPlayingContentItem setInTransition:](self->_contentItem, "setInTransition:", -[MPAVItem isInTransition](self, "isInTransition", v6));
  -[MPNowPlayingContentItem setStoreID:](self->_contentItem, "setStoreID:", -[MPAVItem storeItemInt64ID](self, "storeItemInt64ID"));
  -[MPNowPlayingContentItem setStoreAlbumID:](self->_contentItem, "setStoreAlbumID:", -[MPAVItem albumStoreID](self, "albumStoreID"));
  -[MPNowPlayingContentItem setStoreAlbumArtistID:](self->_contentItem, "setStoreAlbumArtistID:", -[MPAVItem storeAlbumArtistID](self, "storeAlbumArtistID"));
  -[MPNowPlayingContentItem setStoreArtistID:](self->_contentItem, "setStoreArtistID:", -[MPAVItem artistStoreID](self, "artistStoreID"));
  -[MPNowPlayingContentItem setStoreSubscriptionID:](self->_contentItem, "setStoreSubscriptionID:", -[MPAVItem storeSubscriptionAdamID](self, "storeSubscriptionAdamID"));
  -[MPNowPlayingContentItem setReportingAdamID:](self->_contentItem, "setReportingAdamID:", -[MPAVItem reportingAdamID](self, "reportingAdamID"));
  -[MPNowPlayingContentItem setLyricsAdamID:](self->_contentItem, "setLyricsAdamID:", -[MPAVItem lyricsAdamID](self, "lyricsAdamID"));
  -[MPAVItem mainTitle](self, "mainTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPContentItem setTitle:](self->_contentItem, "setTitle:", v12);

  -[MPAVItem album](self, "album");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E3163D10;
  -[MPNowPlayingContentItem setAlbumName:](self->_contentItem, "setAlbumName:", v15);

  quot = -[MPAVItem albumYear](self, "albumYear");
  v17 = quot;
  v18 = v65;
  do
  {
    v19 = ldiv(quot, 10);
    quot = v19.quot;
    if (v19.rem >= 0)
      LOBYTE(v20) = v19.rem;
    else
      v20 = -v19.rem;
    *(v18 - 2) = v20 + 48;
    v21 = v18 - 2;
    --v18;
  }
  while (v19.quot);
  if (v17 < 0)
  {
    *(v18 - 2) = 45;
    v21 = v18 - 2;
  }
  v22 = (__CFString *)CFStringCreateWithBytes(0, v21, &v64 - (char *)v21, 0x8000100u, 0);
  p_contentItem = &self->_contentItem;
  -[MPNowPlayingContentItem setAlbumYear:](self->_contentItem, "setAlbumYear:", v22);

  -[MPAVItem artist](self, "artist");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_1E3163D10;
  -[MPNowPlayingContentItem setTrackArtistName:](*p_contentItem, "setTrackArtistName:", v26);

  -[MPAVItem albumArtist](self, "albumArtist");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = &stru_1E3163D10;
  -[MPNowPlayingContentItem setAlbumArtistName:](*p_contentItem, "setAlbumArtistName:", v29);

  -[MPAVItem composer](self, "composer");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = (const __CFString *)v30;
  else
    v32 = &stru_1E3163D10;
  -[MPNowPlayingContentItem setComposerName:](*p_contentItem, "setComposerName:", v32);

  -[MPAVItem genre](self, "genre");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (const __CFString *)v33;
  else
    v35 = &stru_1E3163D10;
  -[MPNowPlayingContentItem setGenreName:](*p_contentItem, "setGenreName:", v35);

  -[MPNowPlayingContentItem setDiscNumber:](*p_contentItem, "setDiscNumber:", -[MPAVItem discNumber](self, "discNumber"));
  -[MPNowPlayingContentItem setTotalDiscCount:](*p_contentItem, "setTotalDiscCount:", -[MPAVItem discCount](self, "discCount"));
  -[MPNowPlayingContentItem setTrackNumber:](*p_contentItem, "setTrackNumber:", -[MPAVItem albumTrackNumber](self, "albumTrackNumber"));
  -[MPNowPlayingContentItem setTotalTrackCount:](*p_contentItem, "setTotalTrackCount:", -[MPAVItem albumTrackCount](self, "albumTrackCount"));
  -[MPNowPlayingContentItem setMediaType:](*p_contentItem, "setMediaType:", -[MPAVItem mediaType](self, "mediaType"));
  -[MPAVItem externalContentIdentifier](self, "externalContentIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItem setExternalContentIdentifier:](*p_contentItem, "setExternalContentIdentifier:", v36);

  -[MPContentItem setExplicitContent:](*p_contentItem, "setExplicitContent:", -[MPAVItem isExplicitTrack](self, "isExplicitTrack"));
  -[MPNowPlayingContentItem setAlwaysLiveItem:](*p_contentItem, "setAlwaysLiveItem:", -[MPAVItem isAlwaysLive](self, "isAlwaysLive"));
  -[MPAVItem modelPlayEvent](self, "modelPlayEvent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "itemType") == 4)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke;
    v59[3] = &unk_1E31635F8;
    v60 = v37;
    v61 = self;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v59);

  }
  else
  {
    -[MPNowPlayingContentItem setRadioStationName:](self->_contentItem, "setRadioStationName:", 0);
    -[MPNowPlayingContentItem setRadioStationStringIdentifier:](self->_contentItem, "setRadioStationStringIdentifier:", 0);
  }
  objc_msgSend(v37, "contentItemCollectionInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = &self->_contentItem;
  -[MPNowPlayingContentItem setCollectionInfo:](self->_contentItem, "setCollectionInfo:", v38);

  if (objc_msgSend((id)objc_opt_class(), "isPlaceholder"))
    v40 = 0;
  else
    v40 = 3;
  -[MPNowPlayingContentItem setLoading:](self->_contentItem, "setLoading:");
  if (-[MPAVItem isAlwaysLive](self, "isAlwaysLive"))
    v41 = v40 & 2;
  else
    v41 = v40;
  -[MPNowPlayingContentItem setEditingStyleFlags:](*v39, "setEditingStyleFlags:", v41);
  -[MPAVItem artworkCatalogForPlaybackTime:](self, "artworkCatalogForPlaybackTime:", 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *v39;
  if (v42)
  {
    -[MPNowPlayingContentItem setHasArtwork:](v43, "setHasArtwork:", 1);
    objc_msgSend(v42, "visualIdenticalityIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v44, "stringRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "length"))
        -[MPNowPlayingContentItem setArtworkIdentifier:](self->_contentItem, "setArtworkIdentifier:", v45);

    }
    if (objc_msgSend(v42, "hasExportableArtworkProperties"))
    {
      v66[0] = CFSTR("MRContentItemArtworkFormatStandard");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingContentItem setSupportedRemoteArtworkFormats:](self->_contentItem, "setSupportedRemoteArtworkFormats:", v46);

    }
    if (-[MPAVItem _shouldPublishArtworkURL](self, "_shouldPublishArtworkURL"))
    {
      v47 = self->_exportableArtworkRevision + 1;
      self->_exportableArtworkRevision = v47;
      v63.value = 0;
      *(_QWORD *)&v63.timescale = &v63;
      v63.epoch = 0x2020000000;
      v64 = 1;
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2;
      v58[3] = &unk_1E3153508;
      v58[5] = &v63;
      v58[6] = v47;
      v58[4] = self;
      objc_msgSend(v42, "requestExportableArtworkPropertiesWithCompletion:", v58);
      *(_BYTE *)(*(_QWORD *)&v63.timescale + 24) = 0;
      _Block_object_dispose(&v63, 8);
    }

  }
  else
  {
    -[MPNowPlayingContentItem setHasArtwork:](v43, "setHasArtwork:", 0);
    -[MPNowPlayingContentItem setArtworkIdentifier:](self->_contentItem, "setArtworkIdentifier:", 0);
  }
  -[MPAVItem libraryLyrics](self, "libraryLyrics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = [MPNowPlayingInfoLyricsItem alloc];
    -[MPAVItem libraryLyrics](self, "libraryLyrics");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[MPNowPlayingInfoLyricsItem initWithLyrics:userProvided:](v49, "initWithLyrics:userProvided:", v50, 1);
    -[MPNowPlayingContentItem setLyrics:](self->_contentItem, "setLyrics:", v51);

    v52 = 0;
  }
  else
  {
    -[MPNowPlayingContentItem setLyrics:](self->_contentItem, "setLyrics:", 0);
    v52 = -[MPAVItem hasStoreLyrics](self, "hasStoreLyrics");
  }
  v53 = &self->_contentItem;
  -[MPNowPlayingContentItem setHasLyrics:](self->_contentItem, "setHasLyrics:", v52);
  -[MPAVItem itemDescription](self, "itemDescription");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItem setHasDescription:](self->_contentItem, "setHasDescription:", v54 != 0);

  -[MPAVItem associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItem setAssociatedParticipantIdentifier:](self->_contentItem, "setAssociatedParticipantIdentifier:", v55);

  -[MPAVItem _updateAudioFormatInfoForContentItem:](self, "_updateAudioFormatInfoForContentItem:", self->_contentItem);
  -[MPAVItem _contentItemUserInfo](self, "_contentItemUserInfo");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItem setUserInfo:](self->_contentItem, "setUserInfo:", v56);

  -[MPAVItem _contentItemDeviceSpecificUserInfo](self, "_contentItemDeviceSpecificUserInfo");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItem setDeviceSpecificUserInfo:](*v53, "setDeviceSpecificUserInfo:", v57);

}

- (NSNumber)initialPlaybackStartTime
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MPAVItem initialPlaybackStartTimeOverride](self, "initialPlaybackStartTimeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MPAVItem playbackInfoStartTime](self, "playbackInfoStartTime");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSNumber *)v6;
}

- (NSNumber)initialPlaybackStartTimeOverride
{
  return self->_initialPlaybackStartTimeOverride;
}

- (NSNumber)playbackInfoStartTime
{
  void *v3;
  void *v4;

  -[MPAVItem playbackInfo](self, "playbackInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVItem _initialPlaybackStartTimeForPlaybackInfo:](self, "_initialPlaybackStartTimeForPlaybackInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSDictionary)playbackInfo
{
  return self->_playbackInfo;
}

- (id)_initialPlaybackStartTimeForPlaybackInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_NextPlayStartTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_StartTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
  }
  else
  {
    v9 = 0.0;
    if (!v5)
      goto LABEL_10;
  }
  if (v7 >= v9)
    v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_playerItemDurationIfAvailable
{
  int64_t v4;
  Float64 v5;
  uint64_t v6;

  if (BYTE6(self[4].var3))
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var3;
    v4 = *(_QWORD *)&self[6].var1;
  }
  else
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _durationFromExternalMetadataIfAvailable](self, "_durationFromExternalMetadataIfAvailable");
    if (v5 >= -2.22044605e-16)
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v5, 1000);
    v6 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E10];
    v4 = *(_QWORD *)(v6 + 16);
  }
  retstr->var3 = v4;
  return self;
}

- (double)_durationFromExternalMetadataIfAvailable
{
  double result;

  -[MPAVItem durationFromExternalMetadata](self, "durationFromExternalMetadata");
  if (result < 0.00000011920929)
    return NAN;
  return result;
}

- (unint64_t)mediaType
{
  return 0;
}

- (MPAVItem)init
{
  return -[MPAVItem initWithAsset:](self, "initWithAsset:", 0);
}

- (MPAVItem)initWithAsset:(id)a3
{
  void *v4;
  MPAVItem *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = -[MPAVItem initWithPlayerItem:](self, "initWithPlayerItem:", v4);

  return v5;
}

- (MPAVItem)initWithPlayerItem:(id)a3
{
  id v4;
  MPAVItem *v5;
  MPAVItem *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *assetQueue;
  uint64_t v9;
  AVAsset *asset;
  NSObject *v11;
  AVPlayerItem *avPlayerItem;
  void *v13;
  uint64_t v14;
  NSString *contentItemID;
  uint64_t v16;
  NSMutableSet *pendingContentItemUpdates;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  AVPlayerItem *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPAVItem;
  v5 = -[MPAVItem init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAVItem.assetQueue", 0);
    assetQueue = v6->_assetQueue;
    v6->_assetQueue = (OS_dispatch_queue *)v7;

    if (v4)
    {
      objc_msgSend(v4, "asset");
      v9 = objc_claimAutoreleasedReturnValue();
      asset = v6->_asset;
      v6->_asset = (AVAsset *)v9;

      -[MPAVItem setPlayerItem:](v6, "setPlayerItem:", v4);
      v6->_isAssetLoaded = 1;
      v6->_isPreloadedAsset = 1;
      v6->_didAttemptToLoadAsset = 1;
      -[MPAVItem _loadAssetProperties](v6, "_loadAssetProperties");
      v11 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        avPlayerItem = v6->_avPlayerItem;
        *(_DWORD *)buf = 138543362;
        v22 = avPlayerItem;
        _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "    AVPlayerItem: %{public}@", buf, 0xCu);
      }

    }
    v6->_defaultPlaybackRate = 1.0;
    *(int64x2_t *)&v6->_cachedDuration = vdupq_n_s64(0x7FF8000000000000uLL);
    *((_BYTE *)v6 + 108) = *((_BYTE *)v6 + 108) & 0xFC | 2;
    v6->_likedState = 0;
    v6->_type = 0;
    v6->_nowPlayingInfoQueueIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    contentItemID = v6->_contentItemID;
    v6->_contentItemID = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    pendingContentItemUpdates = v6->_pendingContentItemUpdates;
    v6->_pendingContentItemUpdates = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel__internalLikedStateDidChangeNotification_, CFSTR("_MPAVItemInternalLikedStateDidChangeNotification"), 0);

  }
  return v6;
}

uint64_t __23__MPAVItem_contentItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentItem");
}

- (NSString)itemDescription
{
  return 0;
}

- (unint64_t)discNumber
{
  return 0;
}

- (unint64_t)discCount
{
  return 0;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (void)_updateContentItem
{
  -[MPAVItem _updateContentItemIncludingPlaybackState:](self, "_updateContentItemIncludingPlaybackState:", 1);
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (BOOL)isAlwaysLive
{
  return 0;
}

- (int64_t)storeAlbumArtistID
{
  return 0;
}

- (int64_t)reportingAdamID
{
  return 0;
}

- (int64_t)lyricsAdamID
{
  return 0;
}

- (NSString)genre
{
  return 0;
}

- (NSString)externalContentIdentifier
{
  return self->_externalContentIdentifier;
}

- (NSString)composer
{
  return 0;
}

- (int64_t)artistStoreID
{
  return 0;
}

- (int64_t)albumYear
{
  return 0;
}

- (unint64_t)albumTrackNumber
{
  return 0;
}

- (unint64_t)albumTrackCount
{
  return 0;
}

- (int64_t)albumStoreID
{
  return self->_albumStoreID;
}

- (NSString)albumArtist
{
  return 0;
}

- (void)setPlaybackInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setIsHostingSharedSession:(BOOL)a3
{
  self->_isHostingSharedSession = a3;
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MPMediaLibraryPrivacyContext endAccessInterval](self->_privacyContext, "endAccessInterval");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_MPAVItemInternalLikedStateDidChangeNotification"), 0);
  -[MPAVItem _removeObservationsForAVPlayerItem:](self, "_removeObservationsForAVPlayerItem:", self->_avPlayerItem);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPAVItem;
  -[MPAVItem dealloc](&v4, sel_dealloc);
}

- (void)_removeObservationsForAVPlayerItem:(id)a3
{
  AVPlayerItemMetadataOutput *metadataOutput;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("duration"), CFSTR("MPAVItemDurationObservationContext"));
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("loadedTimeRanges"), CFSTR("MPAVItemLoadedTimeRangesObservationContext"));
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timebase"), CFSTR("MPAVItemTimebaseObservationContext"));
  if (self->_metadataOutput)
  {
    objc_msgSend(v5, "removeOutput:");
    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = 0;

  }
}

- (void)setQueueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifier, a3);
}

- (void)setModelPlayEvent:(id)a3
{
  objc_storeStrong((id *)&self->_modelPlayEvent, a3);
}

- (void)setContentItemID:(id)a3 queueSectionID:(id)a4 queueItemID:(id)a5
{
  id v8;
  NSString *contentItemID;
  id v10;
  NSString *v11;
  NSString *v12;
  MPNowPlayingContentItem *contentItem;
  NSString *v14;
  NSString *queueSectionID;
  NSString *v16;
  NSString *queueItemID;
  id v18;

  v18 = a3;
  v8 = a4;
  contentItemID = self->_contentItemID;
  v10 = a5;
  if (!-[NSString isEqualToString:](contentItemID, "isEqualToString:", v18))
  {
    v11 = (NSString *)objc_msgSend(v18, "copy");
    v12 = self->_contentItemID;
    self->_contentItemID = v11;

    contentItem = self->_contentItem;
    self->_contentItem = 0;

  }
  v14 = (NSString *)objc_msgSend(v8, "copy");
  queueSectionID = self->_queueSectionID;
  self->_queueSectionID = v14;

  v16 = (NSString *)objc_msgSend(v10, "copy");
  queueItemID = self->_queueItemID;
  self->_queueItemID = v16;

}

- (int64_t)type
{
  return self->_type;
}

- (id)artworkCatalogForPlaybackTime:(double)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  -[MPAVItem artworkCatalogBlock](self, "artworkCatalogBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, double))(v4 + 16))(v4, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setAutoPlayItem:(BOOL)a3
{
  if (self->_autoPlayItem != a3)
  {
    self->_autoPlayItem = a3;
    -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
  }
}

- (BOOL)isPlaceholder
{
  return objc_msgSend((id)objc_opt_class(), "isPlaceholder");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueItemID, 0);
  objc_storeStrong((id *)&self->_queueSectionID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_leaseStatus, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_rtcReportingServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastMetadataChangeTime, 0);
  objc_storeStrong((id *)&self->_initialPlaybackStartTimeOverride, 0);
  objc_storeStrong((id *)&self->_modelPlayEvent, 0);
  objc_storeStrong((id *)&self->_modelGenericObject, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_explicitBadge, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_externalContentIdentifier, 0);
  objc_storeStrong((id *)&self->_copyrightText, 0);
  objc_storeStrong((id *)&self->_closedCaptionTimeMarkers, 0);
  objc_storeStrong((id *)&self->_urlTimeMarkers, 0);
  objc_storeStrong((id *)&self->_artworkTimeMarkers, 0);
  objc_storeStrong((id *)&self->_chapterTimeMarkers, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_itemError, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_pendingContentItemUpdates, 0);
  objc_storeStrong((id *)&self->_adjunctErrors, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_privacyContext, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, 0);
  objc_destroyWeak((id *)&self->_feeder);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (NSString)queueSectionID
{
  return self->_queueSectionID;
}

- (NSString)queueItemID
{
  return self->_queueItemID;
}

void __61__MPAVItem__performContentItemUpdate_debounceWithIdentifier___block_invoke(uint64_t a1)
{
  MPNowPlayingContentItem *v2;
  MPNowPlayingContentItem *v3;
  void *v4;
  MPNowPlayingContentItem *v5;
  MPNowPlayingContentItem *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 112));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 112));
  }
  v2 = (MPNowPlayingContentItem *)*(id *)(*(_QWORD *)(a1 + 40) + 96);
  if (!v2)
  {
    v3 = [MPNowPlayingContentItem alloc];
    objc_msgSend(*(id *)(a1 + 40), "contentItemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MPContentItem initWithIdentifier:](v3, "initWithIdentifier:", v4);

    v2 = v5;
  }
  v6 = v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __41__MPAVItem_invalidateContentItemUserInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_contentItemUserInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v4);

}

- (BOOL)supportsFastForward
{
  void *v3;
  char v4;

  if (!-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
    return -[MPAVItem isAlwaysLive](self, "isAlwaysLive");
  -[MPAVItem playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canPlayFastForward");

  return v4;
}

- (BOOL)supportsRewind
{
  void *v3;
  char v4;

  if (!-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
    return 1;
  -[MPAVItem playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canPlayFastReverse");

  return v4;
}

- (id)_contentItemDeviceSpecificUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  if (-[MPAVItem persistentID](self, "persistentID") != -1 && -[MPAVItem persistentID](self, "persistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem persistentID](self, "persistentID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("pid"));

  }
  if (-[MPAVItem cloudID](self, "cloudID"))
  {
    *((_BYTE *)v55 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem cloudID](self, "cloudID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clid"));

  }
  -[MPAVItem cloudAlbumID](self, "cloudAlbumID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    *((_BYTE *)v55 + 24) = 1;
    -[MPAVItem cloudAlbumID](self, "cloudAlbumID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("claid"));

  }
  -[MPAVItem cloudUniversalLibraryID](self, "cloudUniversalLibraryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[MPAVItem cloudUniversalLibraryID](self, "cloudUniversalLibraryID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ulid"));

  }
  if (-[MPAVItem albumPersistentID](self, "albumPersistentID") != -1
    && -[MPAVItem albumPersistentID](self, "albumPersistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem albumPersistentID](self, "albumPersistentID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("apid"));

  }
  if (-[MPAVItem albumArtistPersistentID](self, "albumArtistPersistentID") != -1
    && -[MPAVItem albumArtistPersistentID](self, "albumArtistPersistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem albumArtistPersistentID](self, "albumArtistPersistentID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("aarpid"));

  }
  if (-[MPAVItem artistPersistentID](self, "artistPersistentID") != -1
    && -[MPAVItem artistPersistentID](self, "artistPersistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem artistPersistentID](self, "artistPersistentID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("arpid"));

  }
  if (-[MPAVItem genrePersistentID](self, "genrePersistentID") != -1
    && -[MPAVItem genrePersistentID](self, "genrePersistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem genrePersistentID](self, "genrePersistentID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("gpid"));

  }
  if (-[MPAVItem composerPersistentID](self, "composerPersistentID") != -1
    && -[MPAVItem composerPersistentID](self, "composerPersistentID"))
  {
    *((_BYTE *)v59 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPAVItem composerPersistentID](self, "composerPersistentID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("cpid"));

  }
  if (-[MPAVItem storePurchasedAdamID](self, "storePurchasedAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MPAVItem storePurchasedAdamID](self, "storePurchasedAdamID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("purID"));

  }
  -[MPAVItem libraryLyrics](self, "libraryLyrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hsLibLy"));
  -[MPAVItem modelGenericObject](self, "modelGenericObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 == 5)
  {
    -[MPAVItem modelGenericObject](self, "modelGenericObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "library");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "persistentID");

    if (v24)
    {
      *((_BYTE *)v59 + 24) = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("peid"));

    }
  }
  -[MPAVItem libraryLyrics](self, "libraryLyrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dataUsingEncoding:", 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    MSVGzipCompressData();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("lrcsGzpData"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("supART"));
  -[MPAVItem modelPlayEvent](self, "modelPlayEvent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVItem modelGenericObject](self, "modelGenericObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "flattenedGenericObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "anyObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "itemType") == 3)
  {
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __46__MPAVItem__contentItemDeviceSpecificUserInfo__block_invoke;
    v49 = &unk_1E3158C68;
    v50 = v29;
    v51 = v3;
    v52 = &v58;
    v53 = &v54;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", &v46);

  }
  if (*((_BYTE *)v59 + 24))
  {
    -[MPAVItem databaseID](self, "databaseID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("did"));

  }
  if (*((_BYTE *)v55 + 24))
  {
    -[MPAVItem personID](self, "personID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("prid"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v32, "isDisliked"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isDisliked"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v32, "isFavorite"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isFav"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v32, "isLibraryAdded"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("libAdded"));
      if (objc_msgSend(v29, "itemType") == 1)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("colLibAdded"));
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v32, "keepLocalEnableState"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("klEnable"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v32, "keepLocalManagedStatus"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("klStatus"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "localFileAsset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "isNonPurgeable"))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("nonPurge"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v37, "protectionType", v46, v47, v48, v49));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("procType"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "storeAsset");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v39, "endpointType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("endpt"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "userRating");
    if (v41 > 0.00000011921)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("rating"));

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "playbackPosition");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "shouldRememberBookmarkTime"))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("rembok"));

  }
  v44 = v3;

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v44;
}

- (MPModelGenericObject)modelGenericObject
{
  return self->_modelGenericObject;
}

- (id)_contentItemUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  MPAVItem *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1161;
  v51 = __Block_byref_object_dispose__1162;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  -[MPAVItem modelPlayEvent](self, "modelPlayEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "itemType") == 4)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __32__MPAVItem__contentItemUserInfo__block_invoke;
    v32[3] = &unk_1E3163018;
    v33 = v4;
    v36 = &v47;
    v37 = &v43;
    v38 = &v39;
    v34 = v3;
    v35 = self;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v32);

  }
  if (objc_msgSend(v4, "itemType") == 3)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __32__MPAVItem__contentItemUserInfo__block_invoke_2;
    v29[3] = &unk_1E31635F8;
    v30 = v4;
    v31 = v3;
    +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v29);

  }
  if (v44[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("raTy"));

  }
  if (v40[3])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("raSty"));

  }
  v7 = v48[5];
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("raAttrLbl"));
  if (objc_msgSend((id)objc_opt_class(), "isPlaceholder"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("phold"));
  if (-[MPAVItem _shouldPublishArtworkURL](self, "_shouldPublishArtworkURL"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("supART"));
  if (-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[MPAVItem timeOfSeekableEnd](self, "timeOfSeekableEnd");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endT"));

  }
  if (-[MPAVItem shouldShowComposer](self, "shouldShowComposer"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shComp"));
  if (-[MPAVItem hasStoreLyrics](self, "hasStoreLyrics"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hsStLy"));
  if (-[MPAVItem hasTimeSyncedLyrics](self, "hasTimeSyncedLyrics"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hsTSL"));
  -[MPAVItem containerUniqueID](self, "containerUniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("cntrUID"));
  -[MPAVItem storeFrontIdentifier](self, "storeFrontIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sfid"));
  -[MPAVItem modelGenericObject](self, "modelGenericObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flattenedGenericObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "storeAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isRedownloadable"))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("rdwn"));
    if (objc_msgSend(v15, "isSubscriptionRequired"))
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("subReq"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v14, "isLibraryAddEligible"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("libEligible"));
  -[MPAVItem explicitBadge](self, "explicitBadge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[MPAVItem explicitBadge](self, "explicitBadge");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ex"));

  }
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "includeContentItemDebugFields");

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[MPAVItem storeAccountID](self, "storeAccountID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("INTERNALONLY-%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("acid"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MPAVItem lastChangeDirection](self, "lastChangeDirection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("lcd"));

  if (-[MPAVItem isAutoPlayItem](self, "isAutoPlayItem"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("aPly"));
  if (-[MPAVItem isSharedListeningItem](self, "isSharedListeningItem"))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shLis"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_explicitContentState);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("eConSt"));

  }
  if (-[MPAVItem isArtistUploadedContent](self, "isArtistUploadedContent"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("arUp"));
  if (MSVDeviceOSIsInternalInstall() && self->_lastPlayPerformanceTime > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("mpp"));

  }
  v27 = v3;

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v27;
}

- (BOOL)isAssetLoaded
{
  return self->_assetLoaded;
}

- (MPModelPlayEvent)modelPlayEvent
{
  return self->_modelPlayEvent;
}

+ (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)_shouldPublishArtworkURL
{
  void *v3;
  BOOL v4;

  if ((MSVDeviceIsAudioAccessory() & 1) == 0 && !MSVDeviceIsAppleTV())
    return 0;
  -[MPAVItem artworkCatalogForPlaybackTime:](self, "artworkCatalogForPlaybackTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)lastChangeDirection
{
  return self->_lastChangeDirection;
}

- (BOOL)isSharedListeningItem
{
  return self->_sharedListeningItem;
}

- (BOOL)isAutoPlayItem
{
  return self->_autoPlayItem;
}

- (NSString)libraryLyrics
{
  return 0;
}

- (unint64_t)persistentID
{
  return -1;
}

- (BOOL)hasStoreLyrics
{
  return 0;
}

- (NSString)explicitBadge
{
  return self->_explicitBadge;
}

- (int64_t)storePurchasedAdamID
{
  return 0;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (BOOL)shouldShowComposer
{
  return 0;
}

- (BOOL)isArtistUploadedContent
{
  return 0;
}

- (BOOL)hasTimeSyncedLyrics
{
  return 0;
}

- (unint64_t)genrePersistentID
{
  return -1;
}

- (NSString)containerUniqueID
{
  return 0;
}

- (unint64_t)composerPersistentID
{
  return -1;
}

- (NSString)cloudUniversalLibraryID
{
  return 0;
}

- (unint64_t)cloudID
{
  return 0;
}

- (NSString)cloudAlbumID
{
  return 0;
}

- (unint64_t)artistPersistentID
{
  return -1;
}

- (unint64_t)albumPersistentID
{
  return -1;
}

- (unint64_t)albumArtistPersistentID
{
  return -1;
}

- (MPNowPlayingContentItem)contentItem
{
  MPNowPlayingContentItem *contentItem;
  MPNowPlayingContentItem *v4;
  void *v5;
  MPNowPlayingContentItem *v6;
  MPNowPlayingContentItem *v7;
  _QWORD v9[5];

  contentItem = self->_contentItem;
  if (!contentItem)
  {
    v4 = [MPNowPlayingContentItem alloc];
    -[MPAVItem contentItemID](self, "contentItemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPContentItem initWithIdentifier:](v4, "initWithIdentifier:", v5);
    v7 = self->_contentItem;
    self->_contentItem = v6;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __23__MPAVItem_contentItem__block_invoke;
    v9[3] = &unk_1E3163508;
    v9[4] = self;
    +[MPContentItem performSuppressingChangeNotifications:](MPContentItem, "performSuppressingChangeNotifications:", v9);
    -[MPContentItem postChangeNotificationImmediately:](self->_contentItem, "postChangeNotificationImmediately:", 0);
    contentItem = self->_contentItem;
  }
  return contentItem;
}

- (void)setFeeder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_feeder, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSNumber)lastMetadataChangeTime
{
  return self->_lastMetadataChangeTime;
}

- (BOOL)isStartItem
{
  return self->_isStartItem;
}

- (BOOL)usesBookmarking
{
  return 0;
}

- (BOOL)supportsRateChange
{
  return 1;
}

- (BOOL)stationAllowsItemLiking
{
  return 0;
}

- (void)setIsStartItem:(BOOL)a3
{
  self->_isStartItem = a3;
}

- (void)setInitialPlaybackStartTimeOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (BOOL)prefersSeekOverSkip
{
  return self->_prefersSeekOverSkip;
}

- (double)overlappedTransitionDuration
{
  return self->_overlappedTransitionDuration;
}

- (BOOL)isRadioItem
{
  return 0;
}

- (BOOL)isInOverlappedTransition
{
  return self->_inOverlappedTransition;
}

- (BOOL)didReachEnd
{
  return self->_didReachEnd;
}

- (int64_t)likedState
{
  int64_t result;

  result = self->_likedState;
  if (!result)
  {
    result = -[MPAVItem _persistedLikedState](self, "_persistedLikedState");
    self->_likedState = result;
  }
  return result;
}

- (BOOL)supportsRating
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[MPAVItem mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isInMyLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[MPAVItem mediaItem](self, "mediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeSagaID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  -[MPAVItem mediaItem](self, "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = 1;
  else
    v11 = v5;
  return v10 && v11;
}

- (double)durationIfAvailable
{
  double result;

  -[MPAVItem playbackMode](self, "playbackMode");
  if (self->_cachedDuration >= 0.00000011920929)
    return self->_cachedDuration;
  -[MPAVItem _durationFromExternalMetadataIfAvailable](self, "_durationFromExternalMetadataIfAvailable");
  return result;
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (double)_expectedStartTimeWithPlaybackInfo:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_StartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)setLastPlayPerformanceTime:(double)a3
{
  self->_lastPlayPerformanceTime = a3;
  if (MSVDeviceOSIsInternalInstall())
    -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
}

- (double)_expectedStopTimeWithPlaybackInfo:(id)a3
{
  void *v4;
  void *v5;
  double Seconds;
  double v7;
  CMTime v9[2];

  objc_msgSend(a3, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_EndTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
  }
  else
  {
    memset(&v9[1], 0, sizeof(CMTime));
    -[MPAVItem _playerItemDurationIfAvailable](self, "_playerItemDurationIfAvailable");
    if ((unsigned __int128)0 >> 96 == 1)
    {
      v9[0] = v9[1];
      Seconds = CMTimeGetSeconds(v9);
    }
    else
    {
      -[MPAVItem durationFromExternalMetadata](self, "durationFromExternalMetadata");
    }
  }
  v7 = Seconds;

  return v7;
}

- (void)invalidateContentItemUserInfo
{
  _QWORD v2[5];

  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __41__MPAVItem_invalidateContentItemUserInfo__block_invoke;
    v2[3] = &unk_1E3153558;
    v2[4] = self;
    -[MPAVItem _performContentItemUpdate:debounceWithIdentifier:](self, "_performContentItemUpdate:debounceWithIdentifier:", v2, CFSTR("userInfo"));
  }
}

- (void)_performContentItemUpdate:(id)a3 debounceWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_5;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_pendingContentItemUpdates, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_pendingContentItemUpdates, "addObject:", v7);
    os_unfair_lock_unlock(&self->_lock);
LABEL_5:
    v8 = v7;
    v9 = v6;
    msv_dispatch_on_main_queue();

    goto LABEL_6;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_6:

}

- (BOOL)isSupportedDefaultPlaybackSpeed:(int64_t)a3
{
  return a3 == 0;
}

- (MPAVItem)initWithURL:(id)a3
{
  void *v4;
  MPAVItem *v5;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPAVItem initWithAsset:](self, "initWithAsset:", v4);

  return v5;
}

- (MPAVItem)initWithURL:(id)a3 options:(id)a4
{
  void *v5;
  MPAVItem *v6;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPAVItem initWithAsset:](self, "initWithAsset:", v5);

  return v6;
}

- (BOOL)canUseLoadedAsset
{
  return 1;
}

- (void)disableItemReuse
{
  self->_canReusePlayerItem = 0;
}

- (void)_loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  qos_class_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *assetQueue;
  id v13;
  id v14;
  dispatch_block_t v15;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  qos_class_t v21;

  v6 = a3;
  v7 = a4;
  v8 = qos_class_self();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v19[3] = &unk_1E3153430;
  v21 = v8;
  v20 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x19403A810](v19);
  assetQueue = self->_assetQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_3;
  block[3] = &unk_1E3161780;
  v17 = v6;
  v18 = v11;
  block[4] = self;
  v13 = v6;
  v14 = v11;
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8, 0, block);
  dispatch_async(assetQueue, v15);

}

- (void)notePlaybackFinishedByHittingEnd
{
  self->_didReachEnd = 1;
}

- (AVAsset)asset
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1161;
  v8 = __Block_byref_object_dispose__1162;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVAsset *)v2;
}

- (AVPlayerItem)playerItem
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1161;
  v8 = __Block_byref_object_dispose__1162;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVPlayerItem *)v2;
}

- (void)setPlayerItem:(id)a3
{
  AVPlayerItem *v5;
  NSObject *v6;
  AVPlayerItem *avPlayerItem;
  _QWORD block[5];
  uint8_t buf[4];
  MPAVItem *v10;
  __int16 v11;
  AVPlayerItem *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (AVPlayerItem *)a3;
  if (self->_avPlayerItem != v5)
  {
    -[MPAVItem _removeObservationsForAVPlayerItem:](self, "_removeObservationsForAVPlayerItem:");
    objc_storeStrong((id *)&self->_avPlayerItem, a3);
    v6 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      avPlayerItem = self->_avPlayerItem;
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = avPlayerItem;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "MP->AV Asset Log Mapping: %{public}@ -> %{public}@", buf, 0x16u);
    }

    self->_canReusePlayerItem = 1;
    self->_hasValidPlayerItemDuration = 0;
    -[MPAVItem _addObservationsForAVPlayerItem:](self, "_addObservationsForAVPlayerItem:", self->_avPlayerItem);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__MPAVItem_setPlayerItem___block_invoke;
    block[3] = &unk_1E3163508;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (int64_t)status
{
  return -[AVPlayerItem status](self->_avPlayerItem, "status");
}

- (NSError)playbackError
{
  void *v3;
  void *v4;

  if (-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (NSNumber)bookmarkTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MPAVItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "rememberBookmarkTime"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "bookmarkTime");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (int)subtitleTrackID
{
  return 0;
}

- (double)durationInSeconds
{
  double result;
  void *v4;
  void *v5;
  CMTime time;

  result = self->_cachedDuration;
  if (result < 0.00000011920929)
  {
    -[MPAVItem asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&time, 0, sizeof(time));
    self->_cachedDuration = CMTimeGetSeconds(&time);

    return self->_cachedDuration;
  }
  return result;
}

- (id)path
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  __CFString *v7;

  -[MPAVItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MPAVItem asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E3163D10;
  }
  return v7;
}

- (id)url
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[MPAVItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MPAVItem asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (AVPlayerItemAccessLog)accessLog
{
  void *v2;
  void *v3;

  -[MPAVItem playerItem](self, "playerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayerItemAccessLog *)v3;
}

- (NSString)album
{
  return 0;
}

- (NSString)artist
{
  return 0;
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  return self == a3;
}

- (BOOL)isAssetURLValid
{
  return 1;
}

- (BOOL)isExplicitTrack
{
  return 0;
}

- (void)setExplicitBadge:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *explicitBadge;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_explicitBadge;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      explicitBadge = self->_explicitBadge;
      self->_explicitBadge = v6;

      -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
    }
  }

}

- (double)currentTimeDisplayOverride
{
  return 0.0;
}

- (BOOL)usesSubscriptionLease
{
  return 0;
}

- (BOOL)displayableTextLoaded
{
  void *v2;
  BOOL v3;

  if ((*((_BYTE *)self + 108) & 8) != 0)
    return 1;
  -[MPAVItem displayableText](self, "displayableText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (MPQueueFeeder)feeder
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_feeder);
  os_unfair_lock_unlock(p_lock);
  return (MPQueueFeeder *)WeakRetained;
}

- (NSString)lyrics
{
  void *v2;
  void *v3;

  if ((*((_BYTE *)self + 108) & 8) != 0)
  {
    -[MPAVItem asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lyrics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isInTransition
{
  return 0;
}

- (BOOL)isStreamable
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;

  v2 = *((_BYTE *)self + 108) & 3;
  if (v2 == 2)
  {
    -[MPAVItem path](self, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "compare:options:range:", CFSTR("https://"), 1, 0, objc_msgSend(CFSTR("https://"), "length")))
    {
      -[MPAVItem path](self, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "compare:options:range:", CFSTR("http://"), 1, 0, objc_msgSend(CFSTR("http://"), "length")))
      {
        -[MPAVItem path](self, "path");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "compare:options:range:", CFSTR("home-sharing://"), 1, 0, objc_msgSend(CFSTR("home-sharing://"), "length"));

        if (v7)
        {
          v8 = *((_BYTE *)self + 108) & 0xFC;
LABEL_9:
          *((_BYTE *)self + 108) = v8;
          v2 = v8 & 3;
          return v2 != 0;
        }
LABEL_8:
        v8 = *((_BYTE *)self + 108) & 0xFC | 1;
        goto LABEL_9;
      }

    }
    goto LABEL_8;
  }
  return v2 != 0;
}

- (int64_t)customAVEQPreset
{
  return 0;
}

- (BOOL)allowsEQ
{
  return -[MPAVItem type](self, "type") != 2;
}

- (NSString)mainTitle
{
  return 0;
}

- (CGSize)naturalSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  if (-[MPAVItem status](self, "status") == 1)
  {
    -[MPAVItem playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationSize");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v7 = 0x7FF8000000000000;
    v5 = 0x7FF8000000000000;
  }
  v8 = *(double *)&v5;
  v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, float))a4 + 2))(a4, a3);
}

- (CGSize)presentationSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[MPAVItem playerItem](self, "playerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[MPAVItem playerItem](self, "playerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "forwardPlaybackEndTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setLikedState:(int64_t)a3
{
  -[MPAVItem setLikedState:forUserIdentity:](self, "setLikedState:forUserIdentity:", a3, 0);
}

- (void)setLikedState:(int64_t)a3 forUserIdentity:(id)a4
{
  id v6;

  v6 = a4;
  if (-[MPAVItem likedState](self, "likedState") != a3)
  {
    self->_likedState = a3;
    -[MPAVItem _likedStateDidChange](self, "_likedStateDidChange");
    -[MPAVItem _handleUpdatedLikedState:forUserIdentity:completion:](self, "_handleUpdatedLikedState:forUserIdentity:completion:", a3, v6, &__block_literal_global_1177);
  }

}

- (void)setSoundCheckVolumeNormalization:(float)a3
{
  if (self->_soundCheckVolumeNormalization != a3)
  {
    self->_soundCheckVolumeNormalization = a3;
    -[MPAVItem _updateSoundCheckVolumeNormalizationForPlayerItem](self, "_updateSoundCheckVolumeNormalizationForPlayerItem");
  }
}

- (NSString)storeItemID
{
  __CFString *quot;
  __CFString *v3;
  char *v4;
  lldiv_t v5;
  uint64_t v6;
  const UInt8 *v7;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  quot = -[MPAVItem storeItemInt64ID](self, "storeItemInt64ID");
  if (quot)
  {
    v3 = quot;
    v4 = (char *)&v9 + 1;
    do
    {
      v5 = lldiv((uint64_t)quot, 10);
      quot = (__CFString *)v5.quot;
      if (v5.rem >= 0)
        LOBYTE(v6) = v5.rem;
      else
        v6 = -v5.rem;
      *(v4 - 2) = v6 + 48;
      v7 = (const UInt8 *)(v4 - 2);
      --v4;
    }
    while (v5.quot);
    if (((unint64_t)v3 & 0x8000000000000000) != 0)
    {
      *(v4 - 2) = 45;
      v7 = (const UInt8 *)(v4 - 2);
    }
    quot = (__CFString *)CFStringCreateWithBytes(0, v7, (char *)&v9 - (char *)v7, 0x8000100u, 0);
  }
  return (NSString *)quot;
}

- (NSArray)timedMetadataIfAvailable
{
  return 0;
}

- (int64_t)stationID
{
  return 0;
}

- (NSString)stationHash
{
  return (NSString *)&stru_1E3163D10;
}

- (NSString)stationName
{
  return (NSString *)&stru_1E3163D10;
}

- (NSString)stationStringID
{
  return (NSString *)&stru_1E3163D10;
}

- (int64_t)stationProviderID
{
  return 0;
}

- (id)_imageChapterTrackIDsForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  v5 = -[AVAsset statusOfValueForKey:error:](self->_asset, "statusOfValueForKey:error:", CFSTR("trackReferences"), 0);
  v6 = 0;
  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackReferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C89D60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v9 = *MEMORY[0x1E0C8A808];
      v10 = 1;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "trackWithTrackID:", objc_msgSend(v11, "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v9);

        if (v14)
          objc_msgSend(v6, "addObject:", v11);

        v10 += 2;
      }
      while (v10 < objc_msgSend(v8, "count"));
    }

  }
  return v6;
}

- (float)userRating
{
  return 0.0;
}

- (NSString)databaseID
{
  return 0;
}

- (NSString)personID
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[MPAVItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "duration");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (double)durationFromExternalMetadata
{
  return NAN;
}

- (BOOL)durationIsValid
{
  return 1;
}

- (double)playableDuration
{
  return self->_cachedPlayableDuration;
}

- (double)playableDurationIfAvailable
{
  return self->_cachedPlayableDuration;
}

- (OpaqueCMTimebase)timebase
{
  void *v3;
  OpaqueCMTimebase *v4;

  if (!-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
    return 0;
  -[MPAVItem playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (OpaqueCMTimebase *)objc_msgSend(v3, "timebase");

  return v4;
}

- (double)timeOfSeekableStart
{
  void *v2;
  double Seconds;
  CMTime v5;
  CMTime time;
  _OWORD v7[4];
  _BYTE v8[128];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MPAVItem _seekableTimeRanges](self, "_seekableTimeRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v7, 0, sizeof(v7));
  if (objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", v7, v8, 16))
  {
    if (**((_QWORD **)&v7[0] + 1))
      objc_msgSend(**((id **)&v7[0] + 1), "CMTimeRangeValue");
    else
      memset(&v5, 0, sizeof(v5));
    time = v5;
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    Seconds = 0.0;
  }

  return Seconds;
}

- (double)timeOfSeekableEnd
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double Seconds;
  CMTime v11;
  CMTimeRange range;
  CMTime v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MPAVItem _seekableTimeRanges](self, "_seekableTimeRanges");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        memset(&v13, 0, sizeof(v13));
        if (v8)
          objc_msgSend(v8, "CMTimeRangeValue");
        else
          memset(&range, 0, sizeof(range));
        CMTimeRangeGetEnd(&v13, &range);
        if ((v13.flags & 0x1D) == 1)
        {
          v11 = v13;
          Seconds = CMTimeGetSeconds(&v11);

          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }

  Seconds = self->_cachedDuration;
LABEL_14:

  return Seconds;
}

- (void)_internalLikedStateDidChangeNotification:(id)a3
{
  MPAVItem *v4;
  int v5;
  int64_t v6;
  MPAVItem *v7;

  objc_msgSend(a3, "object");
  v4 = (MPAVItem *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {
    v7 = v4;
    v5 = -[MPAVItem isEqual:](self, "isEqual:", v4);
    v4 = v7;
    if (v5)
    {
      v6 = -[MPAVItem likedState](v7, "likedState");
      v4 = v7;
      self->_likedState = v6;
    }
  }

}

- (void)_itemAttributeAvailableKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CMTime time;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lyrics")))
  {
    -[MPAVItem asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lyrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    *((_BYTE *)self + 108) |= 8u;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MPAVItemDisplayableTextAvailableNotification"), self, 0);

    }
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("duration")))
  {
    -[MPAVItem asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "duration");
    else
      memset(&time, 0, sizeof(time));
    self->_cachedDuration = CMTimeGetSeconds(&time);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MPAVItemDurationAvailableNotification"), self);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  MPAVItem *v22;
  _QWORD v23[4];
  __int128 v24;
  int64_t v25;
  __int128 v26;
  int64_t v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == CFSTR("MPAVItemLoadedTimeRangesObservationContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVItem _playableDurationForLoadedTimeRanges:](self, "_playableDurationForLoadedTimeRanges:", v14);

    -[MPAVItem _updateHasFinishedDownloading](self, "_updateHasFinishedDownloading");
  }
  else if (a6 == CFSTR("MPAVItemDurationObservationContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "CMTimeValue");
    }
    else
    {
      v26 = 0uLL;
      v27 = 0;
    }
    *(_OWORD *)&self->_playerItemDuration.value = v26;
    self->_playerItemDuration.epoch = v27;

    self->_hasValidPlayerItemDuration = 1;
    -[MPAVItem _updateHasFinishedDownloading](self, "_updateHasFinishedDownloading");
    v26 = 0uLL;
    v27 = 0;
    -[MPAVItem _playerItemDurationIfAvailable](self, "_playerItemDurationIfAvailable");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v23[3] = &__block_descriptor_56_e33_v16__0__MPNowPlayingContentItem_8l;
    v24 = v26;
    v25 = v27;
    -[MPAVItem _performContentItemUpdate:debounceWithIdentifier:](self, "_performContentItemUpdate:debounceWithIdentifier:", v23, CFSTR("duration"));
  }
  else if (a6 == CFSTR("MPAVItemTimebaseObservationContext"))
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v21 = &unk_1E3163508;
    v22 = self;
    msv_dispatch_on_main_queue();
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MPAVItem;
    -[MPAVItem observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_addObservationsForAVPlayerItem:(id)a3
{
  AVPlayerItemMetadataOutput *v4;
  AVPlayerItemMetadataOutput *metadataOutput;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("duration"), 3, CFSTR("MPAVItemDurationObservationContext"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("loadedTimeRanges"), 3, CFSTR("MPAVItemLoadedTimeRangesObservationContext"));
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("timebase"), 7, CFSTR("MPAVItemTimebaseObservationContext"));
  if (-[MPAVItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE371AA0))
  {
    v4 = (AVPlayerItemMetadataOutput *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B318]), "initWithIdentifiers:", 0);
    metadataOutput = self->_metadataOutput;
    self->_metadataOutput = v4;

    -[AVPlayerItemMetadataOutput setDelegate:queue:](self->_metadataOutput, "setDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    objc_msgSend(v6, "addOutput:", self->_metadataOutput);
  }

}

- (void)_likedStateDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_MPAVItemInternalLikedStateDidChangeNotification"), self);
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPAVItemLikedStateDidChangeNotification"), self);

}

- (id)_seekableTimeRanges
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *cachedSeekableTimeRanges;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (v3 - self->_seekableTimeRangesCacheTime > 0.2)
  {
    -[MPAVItem playerItem](self, "playerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seekableTimeRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    cachedSeekableTimeRanges = self->_cachedSeekableTimeRanges;
    self->_cachedSeekableTimeRanges = v7;

    self->_seekableTimeRangesCacheTime = v4;
  }
  return self->_cachedSeekableTimeRanges;
}

- (double)_playableDurationForLoadedTimeRanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Float64 Seconds;
  CMTimeRange v9;
  CMTime time;
  CMTimeRange v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    memset(&v11, 0, sizeof(v11));
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "CMTimeRangeValue");
    else
      memset(&v11, 0, sizeof(v11));

    v9 = v11;
    CMTimeRangeGetEnd(&time, &v9);
    Seconds = CMTimeGetSeconds(&time);
    self->_cachedPlayableDuration = Seconds;
  }
  else
  {
    self->_cachedPlayableDuration = NAN;
    Seconds = NAN;
  }

  return Seconds;
}

- (void)_loadAssetProperties
{
  AVAsset *asset;

  asset = self->_asset;
  if (asset)
    -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E31E57B8, 0);
}

- (void)_updateSoundCheckVolumeNormalizationForPlayerItem
{
  float v3;
  NSObject *v4;
  _BOOL4 v5;
  double v6;
  void *v7;
  double v8;
  double soundCheckVolumeNormalization;
  void *v10;
  int v11;
  MPAVItem *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    v3 = fabsf(self->_soundCheckVolumeNormalization);
    v4 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 <= 0.00000011921)
    {
      if (v5)
      {
        soundCheckVolumeNormalization = self->_soundCheckVolumeNormalization;
        -[MPAVItem playerItem](self, "playerItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = self;
        v13 = 2048;
        v14 = soundCheckVolumeNormalization;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring volume normalization %f on %{public}@", (uint8_t *)&v11, 0x20u);

      }
    }
    else
    {
      if (v5)
      {
        v6 = self->_soundCheckVolumeNormalization;
        -[MPAVItem playerItem](self, "playerItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = self;
        v13 = 2048;
        v14 = v6;
        v15 = 2114;
        v16 = v7;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting volume normalization to %f on %{public}@", (uint8_t *)&v11, 0x20u);

      }
      *(float *)&v8 = self->_soundCheckVolumeNormalization;
      -[AVPlayerItem setSoundCheckVolumeNormalization:](self->_avPlayerItem, "setSoundCheckVolumeNormalization:", v8);
    }
  }
}

- (void)_copyPlayerItem
{
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  if (!-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVItem.m"), 1114, CFSTR("Asset must be already loaded to copy player item"));

  }
  v5 = -[AVPlayerItem copy](self->_avPlayerItem, "copy");
  -[MPAVItem setPlayerItem:](self, "setPlayerItem:", v5);

}

- (void)_clearAssetNow
{
  NSObject *assetQueue;
  _QWORD block[5];

  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__MPAVItem__clearAssetNow__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync(assetQueue, block);
}

- (void)_pickupContentItemFrom:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;

  v11 = (id *)a3;
  -[MPAVItem contentItemID](self, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVItem contentItemID](self, "contentItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVItem.m"), 1131, CFSTR("fromItem contentItemID %@ does not match this item %@"), v9, v10);

  }
  objc_storeStrong((id *)&self->_contentItem, v11[12]);

}

- (void)setupEQPresetWithDefaultPreset:(int64_t)a3
{
  int64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[MPAVItem customAVEQPreset](self, "customAVEQPreset");
  if (!v5)
  {
    if (-[MPAVItem allowsEQ](self, "allowsEQ"))
      v5 = a3;
    else
      v5 = 0;
  }
  -[MPAVItem playerItem](self, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setEQPreset:", v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Setting item %{public}@ EQ to %d", (uint8_t *)&v9, 0x12u);

  }
}

- (void)setupWithPlaybackInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  Float64 v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  Float64 v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  __int128 v49;
  uint64_t v50;
  CMTime buf;
  _BOOL4 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v3 = objc_claimAutoreleasedReturnValue();
    -[MPAVItem playbackInfo](self, "playbackInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVItem initialPlaybackStartTimeOverride](self, "initialPlaybackStartTimeOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      v8 = v7;
    }
    else
    {
      -[MPAVItem _initialPlaybackStartTimeForPlaybackInfo:](self, "_initialPlaybackStartTimeForPlaybackInfo:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v8 = v10;

    }
    v49 = 0uLL;
    v50 = 0;
    if (v3)
      -[NSObject currentTime](v3, "currentTime");
    v11 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[MPAVItem initialPlaybackStartTimeOverride](self, "initialPlaybackStartTimeOverride");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138543874;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2048;
      *(Float64 *)((char *)&buf.flags + 2) = v8;
      HIWORD(buf.epoch) = 1024;
      v52 = v12 != 0;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Seeking to start time: %f [override: %{BOOL}u]", (uint8_t *)&buf, 0x1Cu);

    }
    CMTimeMakeWithSeconds(&v48, v8, 10000);
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v47 = buf;
    -[NSObject seekToTime:toleranceBefore:toleranceAfter:completionHandler:](v3, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v48, &buf, &v47, 0);
    objc_msgSend(v4, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_EndTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v16 = v15;
      v17 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2048;
        *(Float64 *)((char *)&buf.flags + 2) = v16;
        _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting forward playback end time to: %f", (uint8_t *)&buf, 0x16u);
      }

      CMTimeMakeWithSeconds(&v46, v16, 10000);
      v45 = v46;
      -[NSObject setForwardPlaybackEndTime:](v3, "setForwardPlaybackEndTime:", &v45);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_AudibleDRMGroupID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v18;
        _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting Audible DRM info: %{public}@", (uint8_t *)&buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v18, CFSTR("AudibleDRMInfoGroupID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject _setAudibleDRMInfo:](v3, "_setAudibleDRMInfo:", v20);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("AVItemPlaybackProperties_RampInDuration"));
    v21 = objc_claimAutoreleasedReturnValue();

    if (v21)
      v22 = (id)v21;
    objc_msgSend(v4, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_RampInDuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v23;

      v21 = (uint64_t)v24;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("AVItemPlaybackProperties_RampOutDuration"));
    v25 = objc_claimAutoreleasedReturnValue();

    if (v25)
      v26 = (id)v25;
    objc_msgSend(v4, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_RampOutDuration"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = v27;

      v29 = v21 != 0;
      v30 = 1;
      v25 = (uint64_t)v28;
    }
    else
    {
      v29 = v21 != 0;
      v30 = v25 != 0;
      if (!(v21 | v25))
      {
        v25 = 0;
LABEL_35:
        if ((*((_BYTE *)self + 108) & 4) == 0)
        {
          objc_initWeak((id *)&buf, self);
          -[MPAVItem asset](self, "asset");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", CFSTR("MPAVItemPlaybackProperties_LookForLyrics"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "BOOLValue");

          v37 = MEMORY[0x1E0C809B0];
          if (v36)
          {
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __33__MPAVItem_setupWithPlaybackInfo__block_invoke;
            v42[3] = &unk_1E3154778;
            objc_copyWeak(&v44, (id *)&buf);
            v43 = v34;
            objc_msgSend(v43, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E31E57D0, v42);

            objc_destroyWeak(&v44);
          }
          v39[0] = v37;
          v39[1] = 3221225472;
          v39[2] = __33__MPAVItem_setupWithPlaybackInfo__block_invoke_3;
          v39[3] = &unk_1E3154778;
          objc_copyWeak(&v41, (id *)&buf);
          v38 = v34;
          v40 = v38;
          objc_msgSend(v38, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E31E57E8, v39);
          *((_BYTE *)self + 108) |= 4u;

          objc_destroyWeak(&v41);
          objc_destroyWeak((id *)&buf);
        }

        goto LABEL_40;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v29)
      objc_msgSend(v31, "setObject:forKey:", v21, CFSTR("RampInOutInfoInDuration"));
    if (v30)
      objc_msgSend(v32, "setObject:forKey:", v25, CFSTR("RampInOutInfoOutDuration"));
    v33 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138543618;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2114;
      *(_QWORD *)((char *)&buf.flags + 2) = v27;
      _os_log_impl(&dword_193B9B000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting ramp in/out info: %{public}@", (uint8_t *)&buf, 0x16u);
    }

    -[NSObject _setRampInOutInfo:](v3, "_setRampInOutInfo:", v32);
    goto LABEL_35;
  }
  v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    LODWORD(buf.value) = 138543362;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_FAULT, "%{public}@: setupPlaybackInfo called without an asset loaded", (uint8_t *)&buf, 0xCu);
  }
LABEL_40:

}

- (void)_updateDurationSnapshotWithElapsedTime:(double)a3 playbackRate:(float)a4
{
  _QWORD v4[6];
  float v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__MPAVItem__updateDurationSnapshotWithElapsedTime_playbackRate___block_invoke;
  v4[3] = &unk_1E3153530;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  v5 = a4;
  -[MPAVItem _performContentItemUpdate:debounceWithIdentifier:](self, "_performContentItemUpdate:debounceWithIdentifier:", v4, CFSTR("durationSnapshot"));
}

- (int64_t)_persistedLikedState
{
  return 0;
}

- (void)_setCurrentPlaybackRate:(float)a3
{
  if (vabds_f32(self->_currentPlaybackRate, a3) > 0.00000011921)
  {
    self->_currentPlaybackRate = a3;
    -[MPAVItem _currentPlaybackRateDidChange:](self, "_currentPlaybackRateDidChange:");
  }
}

- (void)_setNeedsPersistedLikedStateUpdate
{
  int64_t likedState;
  int64_t v4;

  likedState = self->_likedState;
  self->_likedState = 0;
  if (likedState)
  {
    v4 = -[MPAVItem likedState](self, "likedState");
    if (likedState != v4)
    {
      self->_likedState = v4;
      -[MPAVItem _likedStateDidChange](self, "_likedStateDidChange");
    }
  }
}

- (void)setSharedListeningItem:(BOOL)a3
{
  if (self->_sharedListeningItem != a3)
  {
    self->_sharedListeningItem = a3;
    -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
  }
}

- (void)setExplicitContentState:(int64_t)a3
{
  if (self->_explicitContentState != a3)
  {
    self->_explicitContentState = a3;
    -[MPAVItem invalidateContentItemUserInfo](self, "invalidateContentItemUserInfo");
  }
}

- (void)invalidateContentItemDeviceSpecificUserInfo
{
  _QWORD v2[5];

  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __55__MPAVItem_invalidateContentItemDeviceSpecificUserInfo__block_invoke;
    v2[3] = &unk_1E3153558;
    v2[4] = self;
    -[MPAVItem _performContentItemUpdate:debounceWithIdentifier:](self, "_performContentItemUpdate:debounceWithIdentifier:", v2, CFSTR("deviceSpecificUserInfo"));
  }
}

- (void)invalidateContentItemAudioFormatInfo
{
  _QWORD v2[5];

  if (self->_contentItem)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __48__MPAVItem_invalidateContentItemAudioFormatInfo__block_invoke;
    v2[3] = &unk_1E3153558;
    v2[4] = self;
    -[MPAVItem _performContentItemUpdate:debounceWithIdentifier:](self, "_performContentItemUpdate:debounceWithIdentifier:", v2, CFSTR("audioFormatInfo"));
  }
}

- (void)reevaluateHasProtectedContent
{
  void *v3;
  uint64_t v4;

  if (!self->_hasLoadedHasProtectedContent && -[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "status");

    if (v4 == 1)
    {
      self->_hasLoadedHasProtectedContent = 1;
      self->_hasProtectedContent = -[AVAsset hasProtectedContent](self->_asset, "hasProtectedContent");
    }
  }
}

- (void)reevaluateType
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  unint64_t type;
  __CFString *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  __CFString *v24;
  NSObject *v25;
  unint64_t v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MPAVItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVItem _imageChapterTrackIDsForAsset:](self, "_imageChapterTrackIDsForAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasVideo");

    if (v6)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        type = self->_type;
        if (type >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown - %ld"), self->_type);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E31535A0[type];
        }
        *(_DWORD *)buf = 138543618;
        v39 = v9;
        v40 = 2114;
        v41 = CFSTR("Video");
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "Updating item type [hasVideo]: %{public}@ -> %{public}@", buf, 0x16u);

      }
      v10 = 2;
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      -[MPAVItem playerItem](self, "playerItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tracks");
      v7 = objc_claimAutoreleasedReturnValue();

      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v12)
      {
        v13 = v12;
        v10 = 0;
        v14 = *(_QWORD *)v34;
        v31 = *MEMORY[0x1E0C8A808];
        v32 = *MEMORY[0x1E0C8A7A0];
        v29 = *MEMORY[0x1E0C8A7F0];
        v30 = *MEMORY[0x1E0C8A7E0];
        v28 = *MEMORY[0x1E0C8A7B8];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v7);
            v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v16, "assetTrack");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "isEnabled"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(v17, "trackID"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v4, "containsObject:", v18);

              if ((v19 & 1) == 0)
              {
                v20 = v4;
                objc_msgSend(v17, "mediaType");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "isEqualToString:", v32))
                {
                  if (v10 <= 0)
                  {
                    v22 = os_log_create("com.apple.amp.mediaplayer", "Playback");
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      v23 = self->_type;
                      if (v23 >= 3)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown - %ld"), self->_type);
                        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v24 = off_1E31535A0[v23];
                      }
                      *(_DWORD *)buf = 138543618;
                      v39 = v24;
                      v40 = 2114;
                      v41 = CFSTR("Audio");
                      _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_DEFAULT, "Updating item type [tracks]: %{public}@ -> %{public}@", buf, 0x16u);

                    }
                  }
                  v10 = 1;
                }
                else if ((objc_msgSend(v21, "isEqualToString:", v31) & 1) != 0
                       || (objc_msgSend(v21, "isEqualToString:", v30) & 1) != 0
                       || (objc_msgSend(v21, "isEqualToString:", v29) & 1) != 0
                       || objc_msgSend(v21, "isEqualToString:", v28))
                {
                  v25 = os_log_create("com.apple.amp.mediaplayer", "Playback");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = self->_type;
                    if (v26 >= 3)
                    {
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown - %ld"), self->_type);
                      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v27 = off_1E31535A0[v26];
                    }
                    *(_DWORD *)buf = 138543618;
                    v39 = v27;
                    v40 = 2114;
                    v41 = CFSTR("Video");
                    _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_DEFAULT, "Updating item type [tracks]: %{public}@ -> %{public}@", buf, 0x16u);

                  }
                  v10 = 2;
                  v4 = v20;
                  goto LABEL_42;
                }

                v4 = v20;
              }
            }

          }
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v13)
            continue;
          break;
        }
      }
      else
      {
        v10 = 0;
      }
    }
LABEL_42:

  }
  else
  {
    v10 = 0;
  }
  -[MPAVItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("type"));
  self->_type = v10;
  -[MPAVItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("type"));

}

- (void)replacePlayerItemWithPlayerItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *assetQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MPAVItemPlayerItemWillChangeNotification"), self);

  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MPAVItem_replacePlayerItemWithPlayerItem___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(assetQueue, block);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPAVItemPlayerItemDidChangeNotification"), self);

  -[MPAVItem _updateSoundCheckVolumeNormalizationForPlayerItem](self, "_updateSoundCheckVolumeNormalizationForPlayerItem");
  -[MPAVItem updatePlayerItemMetadata](self, "updatePlayerItemMetadata");

}

- (void)resolvePlaybackError:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MPAVErrorResolverBlockHandler *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[MPAVItem feeder](self, "feeder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorResolverForItem:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[MPAVErrorResolverBlockHandler initWithErrorResolver:]([MPAVErrorResolverBlockHandler alloc], "initWithErrorResolver:", v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__MPAVItem_resolvePlaybackError_withCompletion___block_invoke;
    v11[3] = &unk_1E315F0A8;
    v12 = v7;
    -[MPAVErrorResolverBlockHandler setResolutionHandler:](v10, "setResolutionHandler:", v11);
    -[MPAVErrorResolverBlockHandler resolveError:](v10, "resolveError:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)_updateHasFinishedDownloading
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_hasFinishedDownloading && -[MPAVItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[MPAVItem playerItem](self, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v4, "URL"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isFileURL"),
          v5,
          v6))
    {
      self->_hasFinishedDownloading = 1;
    }
    else
    {
      v10 = 0uLL;
      v11 = 0;
      if (v3)
        objc_msgSend(v3, "duration");
      if (!self->_hasFinishedDownloading)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v8, v9[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("MPAVItemHasFinishedDownloadingDidChangeNotification"), self);

LABEL_10:
  }
}

- (void)_willBecomeActivePlayerItem
{
  self->_canReusePlayerItem = 0;
  self->_activeItem = 1;
}

- (void)_willResignActivePlayerItem
{
  self->_activeItem = 0;
}

- (id)analyticsContentType
{
  return CFSTR("unknown");
}

- (id)analyticsFormatType
{
  return &stru_1E3163D10;
}

- (BOOL)supportsVocalAttenuation
{
  return 0;
}

- (NSArray)adjunctErrors
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_adjunctErrors, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addAdjunctError:(id)a3
{
  NSMutableArray *adjunctErrors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAVItem.m"), 1968, CFSTR("Error must be nonnil"));

  }
  os_unfair_lock_lock(&self->_lock);
  adjunctErrors = self->_adjunctErrors;
  if (adjunctErrors)
  {
    -[NSMutableArray addObject:](adjunctErrors, "addObject:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_adjunctErrors;
    self->_adjunctErrors = v6;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)clearAdjunctErrors
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *adjunctErrors;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  adjunctErrors = self->_adjunctErrors;
  self->_adjunctErrors = 0;

  os_unfair_lock_unlock(p_lock);
}

- (float)_currentPlaybackRate
{
  return self->_currentPlaybackRate;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
}

- (void)setIsAssetLoaded:(BOOL)a3
{
  self->_isAssetLoaded = a3;
}

- (BOOL)isPreloadedAsset
{
  return self->_isPreloadedAsset;
}

- (float)soundCheckVolumeNormalization
{
  return self->_soundCheckVolumeNormalization;
}

- (MPAVItemObserver)observer
{
  return (MPAVItemObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (BOOL)didAttemptToLoadAsset
{
  return self->_didAttemptToLoadAsset;
}

- (BOOL)canReusePlayerItem
{
  return self->_canReusePlayerItem;
}

- (NSError)itemError
{
  return self->_itemError;
}

- (void)setItemError:(id)a3
{
  objc_storeStrong((id *)&self->_itemError, a3);
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSArray)chapterTimeMarkers
{
  return self->_chapterTimeMarkers;
}

- (NSArray)artworkTimeMarkers
{
  return self->_artworkTimeMarkers;
}

- (NSArray)urlTimeMarkers
{
  return self->_urlTimeMarkers;
}

- (NSArray)closedCaptionTimeMarkers
{
  return self->_closedCaptionTimeMarkers;
}

- (void)setClosedCaptionTimeMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_closedCaptionTimeMarkers, a3);
}

- (BOOL)useEmbeddedChapterData
{
  return self->_useEmbeddedChapterData;
}

- (NSString)copyrightText
{
  return self->_copyrightText;
}

- (BOOL)isLikedStateEnabled
{
  return self->_likedStateEnabled;
}

- (BOOL)supportsLikedState
{
  return self->_supportsLikedState;
}

- (int64_t)storeItemInt64ID
{
  return self->_storeItemInt64ID;
}

- (double)lastPlayPerformanceTime
{
  return self->_lastPlayPerformanceTime;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (BOOL)mediaItemNeedsLoading
{
  return self->_mediaItemNeedsLoading;
}

- (float)loudnessInfoVolumeNormalization
{
  return self->_loudnessInfoVolumeNormalization;
}

- (void)setLoudnessInfoVolumeNormalization:(float)a3
{
  self->_loudnessInfoVolumeNormalization = a3;
}

- (BOOL)hasProtectedContent
{
  return self->_hasProtectedContent;
}

- (int64_t)nowPlayingInfoQueueIndex
{
  return self->_nowPlayingInfoQueueIndex;
}

- (void)setNowPlayingInfoQueueIndex:(int64_t)a3
{
  self->_nowPlayingInfoQueueIndex = a3;
}

- (int64_t)nowPlayingInfoQueueCount
{
  return self->_nowPlayingInfoQueueCount;
}

- (void)setNowPlayingInfoQueueCount:(int64_t)a3
{
  self->_nowPlayingInfoQueueCount = a3;
}

- (BOOL)shouldPreventPlayback
{
  return self->_shouldPreventPlayback;
}

- (BOOL)isHostingSharedSession
{
  return self->_isHostingSharedSession;
}

- (void)setLastMetadataChangeTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)rtcReportingServiceIdentifier
{
  return self->_rtcReportingServiceIdentifier;
}

- (BOOL)allowsAirPlayFromCloud
{
  return self->_allowsAirPlayFromCloud;
}

- (BOOL)allowsExternalPlayback
{
  return self->_allowsExternalPlayback;
}

- (BOOL)requiresLoadedAssetForAirPlayProperties
{
  return self->_requiresLoadedAssetForAirPlayProperties;
}

- (BOOL)hasFinishedDownloading
{
  return self->_hasFinishedDownloading;
}

- (BOOL)hasPerformedErrorResolution
{
  return self->_hasPerformedErrorResolution;
}

- (void)setHasPerformedErrorResolution:(BOOL)a3
{
  self->_hasPerformedErrorResolution = a3;
}

- (BOOL)isActiveItem
{
  return self->_activeItem;
}

- (void)setActiveItem:(BOOL)a3
{
  self->_activeItem = a3;
}

- (BOOL)hasExternalDisplay
{
  return self->_externalDisplay;
}

- (void)setExternalDisplay:(BOOL)a3
{
  self->_externalDisplay = a3;
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (int64_t)leasePlaybackPreventionState
{
  return self->_leasePlaybackPreventionState;
}

- (ICMusicSubscriptionLeaseStatus)leaseStatus
{
  return self->_leaseStatus;
}

- (void)setInOverlappedTransition:(BOOL)a3
{
  self->_inOverlappedTransition = a3;
}

- (void)setOverlappedTransitionDuration:(double)a3
{
  self->_overlappedTransitionDuration = a3;
}

- (int64_t)explicitContentState
{
  return self->_explicitContentState;
}

- (BOOL)isConfiguredForVocalAttenuation
{
  return self->_configuredForVocalAttenuation;
}

- (void)setConfiguredForVocalAttenuation:(BOOL)a3
{
  self->_configuredForVocalAttenuation = a3;
}

uint64_t __48__MPAVItem_resolvePlaybackError_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t __44__MPAVItem_replacePlayerItemWithPlayerItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__MPAVItem_invalidateContentItemAudioFormatInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioFormatInfoForContentItem:", a2);
}

void __55__MPAVItem_invalidateContentItemDeviceSpecificUserInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_contentItemDeviceSpecificUserInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceSpecificUserInfo:", v4);

}

void __64__MPAVItem__updateDurationSnapshotWithElapsedTime_playbackRate___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setInTransition:", objc_msgSend(*(id *)(a1 + 32), "isInTransition"));
  objc_msgSend(v6, "setAlwaysLiveItem:", objc_msgSend(*(id *)(a1 + 32), "isAlwaysLive"));
  LODWORD(v3) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v6, "setElapsedTime:playbackRate:", *(double *)(a1 + 40), v3);
  objc_msgSend(*(id *)(a1 + 32), "defaultPlaybackRate");
  objc_msgSend(v6, "setDefaultPlaybackRate:");
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 202))
  {
    if ((objc_msgSend(*(id *)(v4 + 24), "isPlaybackBufferFull") & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isPlaybackLikelyToKeepUp") ^ 1;
  }
  else
  {
    v5 = 1;
  }
  objc_msgSend(v6, "setLoading:", v5);

}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v3);
}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isAssetLoaded")
    && objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("duration"), 0) == 2)
  {
    objc_msgSend(WeakRetained, "_itemAttributeAvailableKey:", CFSTR("duration"));
  }

}

void __33__MPAVItem_setupWithPlaybackInfo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isAssetLoaded")
    && objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("lyrics"), 0) == 2)
  {
    objc_msgSend(WeakRetained, "_itemAttributeAvailableKey:", CFSTR("lyrics"));
  }

}

void __46__MPAVItem__contentItemDeviceSpecificUserInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "playlist");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isLibraryAdded"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("colLibAdded"));
  objc_msgSend(v16, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "persistentID");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "library");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, CFSTR("ppid"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_msgSend(v16, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personalizedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cloudID");

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personalizedStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v14, "cloudID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, CFSTR("pclid"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __32__MPAVItem__contentItemUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "radioStation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributionLabel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v9, "type");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v9, "subtype");
  objc_msgSend(v9, "providerUniversalLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("raPUL"));

  objc_msgSend(v9, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, CFSTR("raBID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "stationProviderID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, CFSTR("raPrID"));

}

void __32__MPAVItem__contentItemUserInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "playlist");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCollaborative"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("piclb"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "collaboratorStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("pclbStatus"));

}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "radioStation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setRadioStationName:", v2);

  objc_msgSend(v6, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationStringID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setRadioStationStringIdentifier:", v5);
}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  _QWORD block[4];
  id v14;
  void (**v15)(_QWORD, _QWORD);
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Failed to get exportable URL with error: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_189;
    v16[3] = &unk_1E31534E0;
    v9 = a1[4];
    v18 = a1[6];
    v16[4] = v9;
    v10 = v5;
    v17 = v10;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v16);
    v12 = v11;
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      ((void (**)(_QWORD, id))v11)[2](v11, v10);
    }
    else
    {
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2_191;
      block[3] = &unk_1E3162560;
      v15 = v11;
      v14 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

void __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_189(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160))
  {
    objc_msgSend(*(id *)(a1 + 40), "resolvedURLString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "resolvedURLString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setArtworkURL:", v4);

    }
    objc_msgSend(*(id *)(a1 + 40), "artworkTemplateItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "artworkTemplateItems");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setArtworkURLTemplates:", v7);

    }
  }
}

uint64_t __53__MPAVItem__updateContentItemIncludingPlaybackState___block_invoke_2_191(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __26__MPAVItem__clearAssetNow__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    v3 = *(void **)(v1 + 8);
    *(_QWORD *)(v1 + 8) = 0;

    result = objc_msgSend(*(id *)(v2 + 32), "setPlayerItem:", 0);
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 202) = 0;
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 32) = 0;
  }
  return result;
}

void __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double Seconds;
  CMTime v5;

  v3 = a2;
  Seconds = 0.0;
  if ((*(_DWORD *)(a1 + 44) & 0x1D) == 1)
  {
    v5 = *(CMTime *)(a1 + 32);
    Seconds = CMTimeGetSeconds(&v5);
  }
  objc_msgSend(v3, "setDuration:", Seconds);

}

void __59__MPAVItem_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPAVItemTimebaseDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __26__MPAVItem_setPlayerItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasFinishedDownloading");
}

void __22__MPAVItem_playerItem__block_invoke(_QWORD *a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && !*(_BYTE *)(a1[4] + 202))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPAVItem.m"), 356, CFSTR("MPAVItem asset property is being used without prior loadAssetAndPlayerItem"));

  }
}

void __17__MPAVItem_asset__block_invoke(_QWORD *a1)
{
  id v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 8));
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && !*(_BYTE *)(a1[4] + 202))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPAVItem.m"), 346, CFSTR("MPAVItem asset property is being used without prior loadAssetAndPlayerItem"));

  }
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(*(unsigned int *)(a1 + 40), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
  block[3] = &unk_1E3161780;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_3(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "clearAdjunctErrors");
  v2 = MPProcessInfoSystemWallClockUptime();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 202) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 32))
    goto LABEL_7;
  v8 = *(id *)(v3 + 24);
  if (!v8
    || !objc_msgSend(*(id *)(a1 + 32), "canUseLoadedAsset")
    || (objc_msgSend(v8, "error"), (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v5 = (void *)v4, v6 = objc_msgSend(v8, "status"), v5, v6 == 2))
  {

    v3 = *(_QWORD *)(a1 + 32);
LABEL_7:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_4;
    v10[3] = &unk_1E3153458;
    v10[4] = v3;
    v12 = v2;
    v7 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend((id)v3, "loadAssetAndPlayerItemWithTask:completion:", v7, v10);

    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "canReusePlayerItem", v8) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_copyPlayerItem");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 40);
  v6 = v8;
  v7 = v5;
  msv_dispatch_async_on_queue();

}

uint64_t __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_5(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    v3 = v2[3];
    objc_msgSend(v2, "setIsAssetLoaded:", v3 != 0);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_loadAssetProperties");
      +[MPMediaLibraryPrivacyContext contextForDefaultClient](MPMediaLibraryPrivacyContext, "contextForDefaultClient");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 168);
      *(_QWORD *)(v5 + 168) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "beginAccessInterval");
    }
  }
  else
  {
    objc_msgSend(v2, "setIsAssetLoaded:", 0);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_6;
  v8[3] = &unk_1E3161620;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = *(_QWORD *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_6(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updatePlayerItemMetadata");
  objc_msgSend(*(id *)(a1 + 32), "_updateSoundCheckVolumeNormalizationForPlayerItem");
  v2 = MPProcessInfoSystemWallClockUptime();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v7 = CFSTR("MPAVItemUserInfoKeyLoadDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2 - *(double *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MPAVItemAssetIsLoadedNotification"), v4, v6);

}

uint64_t __55__MPAVItem__loadAssetAndPlayerItemWithTask_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)URLFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v3, "stringByRemovingPercentEncoding");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }
      v6 = v10;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)artworkCatalogBlock
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[MPAVItem mediaItem](self, "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MPAVItem_MPArtworkCatalog__artworkCatalogBlock__block_invoke;
  v6[3] = &unk_1E3153A20;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x19403A810](v6);

  return v4;
}

id __49__MPAVItem_MPArtworkCatalog__artworkCatalogBlock__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "chapters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5
    || (objc_msgSend(*(id *)(a1 + 32), "chapterOfType:atTime:", 2, a2),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "artworkCatalog"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkCatalog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
