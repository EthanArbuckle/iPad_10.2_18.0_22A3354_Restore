@implementation MPMediaItem

- (id)artworkCatalog
{
  return -[MPMediaItem _artworkCatalogWithArtworkType:](self, "_artworkCatalogWithArtworkType:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MPMediaEntityPersistentID v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[MPMediaEntity persistentID](self, "persistentID"))
  {
    v5 = -[MPMediaEntity persistentID](self, "persistentID");
    v6 = v5 == objc_msgSend(v4, "persistentID");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaItem;
    v6 = -[MPMediaEntity isEqual:](&v8, sel_isEqual_, v4);
  }

  return v6;
}

+ (BOOL)canFilterByProperty:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v5 = (const __CFDictionary *)__filterableDictionary_13418;
  if (!__filterableDictionary_13418)
  {
    objc_msgSend(a1, "_createFilterableDictionary");
    v5 = (const __CFDictionary *)__filterableDictionary_13418;
  }
  if ((CFDictionaryGetValue(v5, (const void *)objc_msgSend(v4, "hash")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MPMediaItem;
    v6 = objc_msgSendSuper2(&v8, sel_canFilterByProperty_, v4);
  }

  return v6;
}

+ (NSString)persistentIDPropertyForGroupingType:(MPMediaGrouping)groupingType
{
  __CFString *v3;
  __CFString *v4;

  switch(groupingType)
  {
    case 1:
    case 10:
    case 11:
    case 12:
    case 13:
    case 17:
      v3 = CFSTR("albumPID");
      break;
    case 2:
    case 8:
      v3 = CFSTR("artistPID");
      break;
    case 3:
    case 14:
    case 18:
      v3 = CFSTR("albumArtistPID");
      break;
    case 4:
    case 15:
    case 19:
    case 21:
      v3 = CFSTR("composerPID");
      break;
    case 5:
    case 16:
    case 20:
      v3 = CFSTR("genrePID");
      break;
    case 6:
      v3 = CFSTR("playlistPersistentID");
      v4 = CFSTR("playlistPersistentID");
      break;
    case 7:
      v3 = CFSTR("podcastPID");
      break;
    case 9:
      v3 = CFSTR("seasonNumber");
      break;
    default:
      v3 = CFSTR("persistentID");
      break;
  }
  return (NSString *)v3;
}

+ (void)_createFilterableDictionary
{
  const void *__dst[189];
  void *keys[44];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  if (!__filterableDictionary_13418)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v4 = 0u;
    v5 = 0u;
    keys[0] = (void *)objc_msgSend(CFSTR("persistentID"), "hash");
    keys[1] = (void *)objc_msgSend(CFSTR("globalID"), "hash");
    keys[2] = (void *)objc_msgSend(CFSTR("mediaType"), "hash");
    keys[3] = (void *)objc_msgSend(CFSTR("title"), "hash");
    keys[4] = (void *)objc_msgSend(CFSTR("albumTitle"), "hash");
    keys[5] = (void *)objc_msgSend(CFSTR("artist"), "hash");
    keys[6] = (void *)objc_msgSend(CFSTR("albumArtist"), "hash");
    keys[7] = (void *)objc_msgSend(CFSTR("genre"), "hash");
    keys[8] = (void *)objc_msgSend(CFSTR("composer"), "hash");
    keys[9] = (void *)objc_msgSend(CFSTR("playbackDuration"), "hash");
    keys[10] = (void *)objc_msgSend(CFSTR("albumTrackNumber"), "hash");
    keys[11] = (void *)objc_msgSend(CFSTR("albumTrackCount"), "hash");
    keys[12] = (void *)objc_msgSend(CFSTR("chosenByAutoFill"), "hash");
    keys[13] = (void *)objc_msgSend(CFSTR("discNumber"), "hash");
    keys[14] = (void *)objc_msgSend(CFSTR("discCount"), "hash");
    keys[15] = (void *)objc_msgSend(CFSTR("artwork"), "hash");
    keys[16] = (void *)objc_msgSend(CFSTR("lyrics"), "hash");
    keys[17] = (void *)objc_msgSend(CFSTR("isCompilation"), "hash");
    keys[18] = (void *)objc_msgSend(CFSTR("year"), "hash");
    keys[19] = (void *)objc_msgSend(CFSTR("releaseDate"), "hash");
    keys[20] = (void *)objc_msgSend(CFSTR("beatsPerMinute"), "hash");
    keys[21] = (void *)objc_msgSend(CFSTR("comments"), "hash");
    keys[22] = (void *)objc_msgSend(CFSTR("storeItemAdamID"), "hash");
    keys[23] = (void *)objc_msgSend(CFSTR("storeAccountID"), "hash");
    keys[24] = (void *)objc_msgSend(CFSTR("storeDownloaderAccountID"), "hash");
    keys[25] = (void *)objc_msgSend(CFSTR("storeFamilyAccountID"), "hash");
    keys[26] = (void *)objc_msgSend(CFSTR("storePlaylistAdamID"), "hash");
    keys[27] = (void *)objc_msgSend(CFSTR("storeArtistAdamID"), "hash");
    keys[28] = (void *)objc_msgSend(CFSTR("storeAlbumArtistAdamID"), "hash");
    keys[29] = (void *)objc_msgSend(CFSTR("storeComposerAdamID"), "hash");
    keys[30] = (void *)objc_msgSend(CFSTR("storeGenreAdamID"), "hash");
    keys[31] = (void *)objc_msgSend(CFSTR("storeRentalID"), "hash");
    keys[32] = (void *)objc_msgSend(CFSTR("isRental"), "hash");
    keys[33] = (void *)objc_msgSend(CFSTR("isITunesU"), "hash");
    keys[34] = (void *)objc_msgSend(CFSTR("isAudible"), "hash");
    keys[35] = (void *)objc_msgSend(CFSTR("isMusicVideo"), "hash");
    keys[36] = (void *)objc_msgSend(CFSTR("isHD"), "hash");
    keys[37] = (void *)objc_msgSend(CFSTR("contentRating"), "hash");
    keys[38] = (void *)objc_msgSend(CFSTR("copyright"), "hash");
    keys[39] = (void *)objc_msgSend(CFSTR("includeInShuffle"), "hash");
    keys[40] = (void *)objc_msgSend(CFSTR("descriptionInfo"), "hash");
    keys[41] = (void *)objc_msgSend(CFSTR("shortDescriptionInfo"), "hash");
    keys[42] = (void *)objc_msgSend(CFSTR("movieInfo"), "hash");
    keys[43] = (void *)objc_msgSend(CFSTR("podcastTitle"), "hash");
    *(_QWORD *)&v4 = objc_msgSend(CFSTR("seriesName"), "hash");
    *((_QWORD *)&v4 + 1) = objc_msgSend(CFSTR("seasonNumber"), "hash");
    *(_QWORD *)&v5 = objc_msgSend(CFSTR("seasonName"), "hash");
    *((_QWORD *)&v5 + 1) = objc_msgSend(CFSTR("episodeNumber"), "hash");
    *(_QWORD *)&v6 = objc_msgSend(CFSTR("showSortType"), "hash");
    *((_QWORD *)&v6 + 1) = objc_msgSend(CFSTR("episodeType"), "hash");
    *(_QWORD *)&v7 = objc_msgSend(CFSTR("episodeTypeDisplayName"), "hash");
    *((_QWORD *)&v7 + 1) = objc_msgSend(CFSTR("episodeSubSortOrder"), "hash");
    *(_QWORD *)&v8 = objc_msgSend(CFSTR("isMusicShow"), "hash");
    *((_QWORD *)&v8 + 1) = objc_msgSend(CFSTR("collectionDescription"), "hash");
    *(_QWORD *)&v9 = objc_msgSend(CFSTR("playCount"), "hash");
    *((_QWORD *)&v9 + 1) = objc_msgSend(CFSTR("skipCount"), "hash");
    *(_QWORD *)&v10 = objc_msgSend(CFSTR("rating"), "hash");
    *((_QWORD *)&v10 + 1) = objc_msgSend(CFSTR("lastPlayedDate"), "hash");
    *(_QWORD *)&v11 = objc_msgSend(CFSTR("userGrouping"), "hash");
    *((_QWORD *)&v11 + 1) = objc_msgSend(CFSTR("sortTitle"), "hash");
    *(_QWORD *)&v12 = objc_msgSend(CFSTR("sortArtist"), "hash");
    *((_QWORD *)&v12 + 1) = objc_msgSend(CFSTR("sortAlbumTitle"), "hash");
    *(_QWORD *)&v13 = objc_msgSend(CFSTR("sortAlbumArtist"), "hash");
    *((_QWORD *)&v13 + 1) = objc_msgSend(CFSTR("sortComposer"), "hash");
    v14 = objc_msgSend(CFSTR("filePath"), "hash");
    v15 = objc_msgSend(CFSTR("locationFileName"), "hash");
    v16 = objc_msgSend(CFSTR("assetURL"), "hash");
    v17 = objc_msgSend(CFSTR("hasAvailableItemArtwork"), "hash");
    v18 = objc_msgSend(CFSTR("chapters"), "hash");
    v19 = objc_msgSend(CFSTR("chapterArtworkTimes"), "hash");
    v20 = objc_msgSend(CFSTR("hasBeenPlayed"), "hash");
    v21 = objc_msgSend(CFSTR("bookmarkTime"), "hash");
    v22 = objc_msgSend(CFSTR("rememberBookmarkTime"), "hash");
    v23 = objc_msgSend(CFSTR("isDemoRental"), "hash");
    v24 = objc_msgSend(CFSTR("rentalDuration"), "hash");
    v25 = objc_msgSend(CFSTR("rentalPlaybackDuration"), "hash");
    v26 = objc_msgSend(CFSTR("rentalPlaybackStartTime"), "hash");
    v27 = objc_msgSend(CFSTR("rentalStartTime"), "hash");
    v28 = objc_msgSend(CFSTR("rentalExpirationDate"), "hash");
    v29 = objc_msgSend(CFSTR("rentalWindowEndDate"), "hash");
    v30 = objc_msgSend(CFSTR("artistPID"), "hash");
    v31 = objc_msgSend(CFSTR("albumArtistPID"), "hash");
    v32 = objc_msgSend(CFSTR("albumPID"), "hash");
    v33 = objc_msgSend(CFSTR("composerPID"), "hash");
    v34 = objc_msgSend(CFSTR("genrePID"), "hash");
    v35 = objc_msgSend(CFSTR("podcastPID"), "hash");
    v36 = objc_msgSend(CFSTR("isOTAPurchased"), "hash");
    v37 = objc_msgSend(CFSTR("isStreamingQuality"), "hash");
    v38 = objc_msgSend(CFSTR("isTemporaryCloudDownload"), "hash");
    v39 = objc_msgSend(CFSTR("startTime"), "hash");
    v40 = objc_msgSend(CFSTR("stopTime"), "hash");
    v41 = objc_msgSend(CFSTR("durationInSamples"), "hash");
    v42 = objc_msgSend(CFSTR("gaplessHeuristicInfo"), "hash");
    v43 = objc_msgSend(CFSTR("gaplessEncodingDelay"), "hash");
    v44 = objc_msgSend(CFSTR("gaplessEncodingDrain"), "hash");
    v45 = objc_msgSend(CFSTR("gaplessLastFrameResync"), "hash");
    v46 = objc_msgSend(CFSTR("volumeNormalization"), "hash");
    v47 = objc_msgSend(CFSTR("volumeAdjustment"), "hash");
    v48 = objc_msgSend(CFSTR("fileSize"), "hash");
    v49 = objc_msgSend(CFSTR("podcastURL"), "hash");
    v50 = objc_msgSend(CFSTR("podcastGUID"), "hash");
    v51 = objc_msgSend(CFSTR("eqPreset"), "hash");
    v52 = objc_msgSend(CFSTR("audioTrackID"), "hash");
    v53 = objc_msgSend(CFSTR("hasAlternateAudio"), "hash");
    v54 = objc_msgSend(CFSTR("hasSubtitles"), "hash");
    v55 = objc_msgSend(CFSTR("needsRestore"), "hash");
    v56 = objc_msgSend(CFSTR("storeCloudStatus"), "hash");
    v57 = objc_msgSend(CFSTR("storeRedownloadParameters"), "hash");
    v58 = objc_msgSend(CFSTR("downloadIdentifier"), "hash");
    v59 = objc_msgSend(CFSTR("storeSagaID"), "hash");
    v60 = objc_msgSend(CFSTR("storeBookmarkIdentifier"), "hash");
    v61 = objc_msgSend(CFSTR("storeBookmarkTimestamp"), "hash");
    v62 = objc_msgSend(CFSTR("storeBookmarkEntityRevision"), "hash");
    v63 = objc_msgSend(CFSTR("isCloudItem"), "hash");
    v64 = objc_msgSend(CFSTR("dateAccessed"), "hash");
    v65 = objc_msgSend(CFSTR("isStoreRedownloadable"), "hash");
    v66 = objc_msgSend(CFSTR("likedState"), "hash");
    v67 = objc_msgSend(CFSTR("purchaseHistoryID"), "hash");
    v68 = objc_msgSend(CFSTR("isHidden"), "hash");
    v69 = objc_msgSend(CFSTR("isLocal"), "hash");
    v70 = objc_msgSend(CFSTR("isPendingSync"), "hash");
    v71 = objc_msgSend(CFSTR("isDeprotected"), "hash");
    v72 = objc_msgSend(CFSTR("dateAdded"), "hash");
    v73 = objc_msgSend(CFSTR("storeDatePurchased"), "hash");
    v74 = objc_msgSend(CFSTR("isPlayable"), "hash");
    v75 = objc_msgSend(CFSTR("isMatchAudio"), "hash");
    v76 = objc_msgSend(CFSTR("isNonLibraryOwnedSubscriptionContent"), "hash");
    v77 = objc_msgSend(CFSTR("significantAmountHasBeenPlayed"), "hash");
    v78 = objc_msgSend(CFSTR("albumKeepLocal"), "hash");
    v79 = objc_msgSend(CFSTR("artistKeepLocal"), "hash");
    v80 = objc_msgSend(CFSTR("albumArtistKeepLocal"), "hash");
    v81 = objc_msgSend(CFSTR("genreKeepLocal"), "hash");
    v82 = objc_msgSend(CFSTR("storeExtrasURL"), "hash");
    v83 = objc_msgSend(CFSTR("storeNeedsReporting"), "hash");
    v84 = objc_msgSend(CFSTR("subscriptionStoreItemAdamID"), "hash");
    v85 = objc_msgSend(CFSTR("storePlaybackEndpointType"), "hash");
    v86 = objc_msgSend(CFSTR("storeAssetProtectionType"), "hash");
    v87 = objc_msgSend(CFSTR("radioStationID"), "hash");
    v88 = objc_msgSend(CFSTR("advertisementUniqueID"), "hash");
    v89 = objc_msgSend(CFSTR("advertisementType"), "hash");
    v90 = objc_msgSend(CFSTR("isArtistUploadedContent"), "hash");
    v91 = objc_msgSend(CFSTR("cloudIsInMyLibrary"), "hash");
    v92 = objc_msgSend(CFSTR("cloudUniversalLibraryID"), "hash");
    v93 = objc_msgSend(CFSTR("albumArtistCloudUniversalLibraryID"), "hash");
    v94 = objc_msgSend(CFSTR("syncID"), "hash");
    v95 = objc_msgSend(CFSTR("entityRevision"), "hash");
    v96 = objc_msgSend(CFSTR("hasNonPurgeableAsset"), "hash");
    v97 = objc_msgSend(CFSTR("remoteLocationId"), "hash");
    v98 = objc_msgSend(CFSTR("isInMyLibrary"), "hash");
    v99 = objc_msgSend(CFSTR("storeCloudAssetAvailable"), "hash");
    v100 = objc_msgSend(CFSTR("hasProtectedAsset"), "hash");
    v101 = objc_msgSend(CFSTR("hasAppleMusicDRM"), "hash");
    v102 = objc_msgSend(CFSTR("isExplicit"), "hash");
    v103 = objc_msgSend(CFSTR("classicalWork"), "hash");
    v104 = objc_msgSend(CFSTR("classicalMovement"), "hash");
    v105 = objc_msgSend(CFSTR("classicalMovementCount"), "hash");
    v106 = objc_msgSend(CFSTR("classicalMovementNumber"), "hash");
    v107 = objc_msgSend(CFSTR("hasHLSVideo"), "hash");
    v108 = objc_msgSend(CFSTR("storeCloudAlbumID"), "hash");
    v109 = objc_msgSend(CFSTR("storeLyricsAvailable"), "hash");
    v110 = objc_msgSend(CFSTR("timeSyncedLyricsAvailable"), "hash");
    v111 = objc_msgSend(CFSTR("audioTrackLocale"), "hash");
    v112 = objc_msgSend(CFSTR("isPremium"), "hash");
    v113 = objc_msgSend(CFSTR("colorCapability"), "hash");
    v114 = objc_msgSend(CFSTR("hlsColorCapability"), "hash");
    v115 = objc_msgSend(CFSTR("videoQuality"), "hash");
    v116 = objc_msgSend(CFSTR("hlsVideoQuality"), "hash");
    v117 = objc_msgSend(CFSTR("hlsPlaylistURL"), "hash");
    v118 = objc_msgSend(CFSTR("audioCapability"), "hash");
    v119 = objc_msgSend(CFSTR("hlsAudioCapability"), "hash");
    v120 = objc_msgSend(CFSTR("containerItemPID"), "hash");
    v121 = objc_msgSend(CFSTR("dateDownloaded"), "hash");
    v122 = objc_msgSend(CFSTR("bitRate"), "hash");
    v123 = objc_msgSend(CFSTR("needsRestore"), "hash");
    v124 = objc_msgSend(CFSTR("isLocal"), "hash");
    v125 = objc_msgSend(CFSTR("keepLocalStatus"), "hash");
    v126 = objc_msgSend(CFSTR("keepLocalStatusReason"), "hash");
    v127 = objc_msgSend(CFSTR("keepLocalConstraints"), "hash");
    v128 = objc_msgSend(CFSTR("isPreorder"), "hash");
    v129 = objc_msgSend(CFSTR("hlsAssetTraits"), "hash");
    v130 = objc_msgSend(CFSTR("hlsKeyServerURL"), "hash");
    v131 = objc_msgSend(CFSTR("hlsKeyServerProtocol"), "hash");
    v132 = objc_msgSend(CFSTR("hlsKeyCertificateURL"), "hash");
    v133 = objc_msgSend(CFSTR("reportingStoreItemAdamID"), "hash");
    v134 = objc_msgSend(CFSTR("assetStoreItemAdamID"), "hash");
    v135 = objc_msgSend(CFSTR("booklets"), "hash");
    v136 = objc_msgSend(CFSTR("assetStoreExtendedPlaybackAttribute"), "hash");
    v137 = objc_msgSend(CFSTR("storeExtendedLyricsAttribute"), "hash");
    v138 = objc_msgSend(CFSTR("storeCanonicalID"), "hash");
    memcpy(__dst, &unk_193F09CA8, sizeof(__dst));
    __filterableDictionary_13418 = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, __dst, 189, 0, 0);
  }
}

- (id)_artworkCatalogWithArtworkType:(int64_t)a3
{
  __CFString **v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  MPArtworkCatalog *v11;
  MPMediaLibraryArtworkRequest *v12;
  void *v13;
  MPMediaLibraryArtworkRequest *v14;
  MPArtworkCatalog *v15;
  void *v16;
  void *v17;
  MPArtworkCatalog *v18;
  void *v19;
  void *v20;
  __int16 v22;

  v22 = 0;
  if (a3 == 1)
  {
    v5 = _MPMediaItemPropertyFetchableArtworkSource;
    v6 = CFSTR("fetchableItemArtworkToken");
    v7 = CFSTR("availableItemArtworkToken");
  }
  else
  {
    if (a3 != 2)
    {
      v8 = 0;
      v10 = 0;
      v9 = 0;
      goto LABEL_11;
    }
    v5 = &_MPMediaItemPropertyFetchableScreenshotSource;
    v6 = CFSTR("fetchableItemScreenshotToken");
    v7 = CFSTR("availableItemScreenshotToken");
  }
  -[MPMediaEntity cachedValueForProperty:isCached:](self, "cachedValueForProperty:isCached:", v7, (char *)&v22 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaEntity cachedValueForProperty:isCached:](self, "cachedValueForProperty:isCached:", v6, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaEntity cachedValueForProperty:isCached:](self, "cachedValueForProperty:isCached:", *v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (HIBYTE(v22) && (_BYTE)v22 && !objc_msgSend(v8, "length") && !objc_msgSend(v9, "length"))
  {
    v11 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v12 = [MPMediaLibraryArtworkRequest alloc];
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v12, "initWithLibrary:identifier:entityType:artworkType:", v13, -[MPMediaEntity persistentID](self, "persistentID"), 0, a3);

  -[MPMediaLibraryArtworkRequest setAvailableArtworkToken:](v14, "setAvailableArtworkToken:", v8);
  -[MPMediaLibraryArtworkRequest setFetchableArtworkToken:](v14, "setFetchableArtworkToken:", v9);
  -[MPMediaLibraryArtworkRequest setFetchableArtworkSource:](v14, "setFetchableArtworkSource:", v10);
  v15 = [MPArtworkCatalog alloc];
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "artworkDataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPArtworkCatalog initWithToken:dataSource:](v15, "initWithToken:dataSource:", v14, v17);

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "artworkDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v20, "areRepresentationsAvailableForCatalog:", v18);

  v11 = 0;
  if ((_DWORD)v17)
    v11 = v18;

LABEL_14:
  return v11;
}

- (MPMediaType)mediaType
{
  void *v2;
  MPMediaType v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("mediaType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)screenshotArtworkCatalog
{
  return -[MPMediaItem _artworkCatalogWithArtworkType:](self, "_artworkCatalogWithArtworkType:", 2);
}

+ (id)artworkCatalogCacheProperties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("availableItemArtworkToken"), CFSTR("fetchableItemArtworkToken"), CFSTR("fetchableItemArtworkSource"), CFSTR("mediaType"), 0);
}

+ (id)screenshotArtworkCatalogCacheProperties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("availableItemScreenshotToken"), CFSTR("fetchableItemScreenshotToken"), CFSTR("fetchableItemScreenshotSource"), CFSTR("mediaType"), 0);
}

- (MPMediaItem)initWithPersistentID:(unint64_t)a3
{
  void *v5;
  MPMediaItem *v6;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemWithPersistentID:", a3);
  v6 = (MPMediaItem *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPMediaItem)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  MPMediaQuery *v9;
  void *v10;
  MPMediaQuery *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MPMediaQuery *v16;
  void *v17;
  void *v18;
  MPMediaItem *v19;
  MPMediaItem *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MPMediaQuery *v28;
  void *v29;
  MPMediaQuery *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  MPMediaItem *i;
  void *v37;
  void *v38;
  void *v39;
  MPMediaQuery *v40;
  void *v41;
  MPMediaQuery *v42;
  void *v43;
  void *v44;
  MPMediaItem *v45;
  id v47;
  id v48;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasSagaId") && objc_msgSend(v5, "sagaId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "sagaId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, CFSTR("storeSagaID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [MPMediaQuery alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MPMediaQuery initWithFilterPredicates:library:](v9, "initWithFilterPredicates:library:", v10, v6);

    -[MPMediaQuery items](v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
LABEL_8:
      objc_msgSend(v12, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v18;
      v20 = v19;
      goto LABEL_30;
    }

  }
  if (objc_msgSend(v5, "hasCloudUniversalLibraryId"))
  {
    objc_msgSend(v5, "cloudUniversalLibraryId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      objc_msgSend(v5, "cloudUniversalLibraryId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v15, CFSTR("cloudUniversalLibraryID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = [MPMediaQuery alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MPMediaQuery initWithFilterPredicates:library:](v16, "initWithFilterPredicates:library:", v17, v6);

      -[MPMediaQuery items](v11, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
        goto LABEL_8;

    }
  }
  if (objc_msgSend(v5, "hasStoreId") && objc_msgSend(v5, "storeId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "storeId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v21, CFSTR("storeItemAdamID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v22;
    v23 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "storeId"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v24, CFSTR("subscriptionStoreItemAdamID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = [MPMediaQuery alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MPMediaQuery initWithFilterPredicates:library:](v28, "initWithFilterPredicates:library:", v29, v6);

    -[MPMediaQuery items](v30, "items");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v32;
      v20 = v19;
      v5 = v23;
      goto LABEL_30;
    }

    v5 = v23;
  }
  v50 = v6;
  objc_msgSend(v50, "uniqueIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v5, "libraryIdentifiers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (MPMediaItem *)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v20)
  {
    v47 = v6;
    v48 = v5;
    v35 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v20; i = (MPMediaItem *)((char *)i + 1))
      {
        if (*(_QWORD *)v53 != v35)
          objc_enumerationMutation(v34);
        v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v51 = 0;
        v51 = objc_msgSend(v37, "libraryId");
        objc_msgSend(v37, "libraryName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "length") && objc_msgSend(v38, "isEqualToString:", v33))
        {
          +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:count:shouldContain:](MPMediaPersistentIDsPredicate, "predicateWithPersistentIDs:count:shouldContain:", &v51, 8, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = [MPMediaQuery alloc];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[MPMediaQuery initWithFilterPredicates:library:](v40, "initWithFilterPredicates:library:", v41, v50);

          -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v42, "setShouldIncludeNonLibraryEntities:", 1);
          -[MPMediaQuery items](v42, "items");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "count"))
          {
            objc_msgSend(v43, "firstObject");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = v44;
            v19 = v45;

            v20 = v45;
            v6 = v47;
            v5 = v48;
            goto LABEL_29;
          }

        }
      }
      v20 = (MPMediaItem *)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v20)
        continue;
      break;
    }
    v6 = v47;
    v5 = v48;
  }
  v19 = self;
LABEL_29:

LABEL_30:
  return v20;
}

- (unint64_t)hash
{
  MPMediaEntityPersistentID v2;

  v2 = -[MPMediaEntity persistentID](self, "persistentID");
  return v2 ^ HIDWORD(v2);
}

- (MPMediaItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPMediaItem *v6;

  v4 = a3;
  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeItemWithCoder:", v4);
  v6 = (MPMediaItem *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 440, CFSTR("Subclass %@ must implement -%@ defined in %@."), v7, v8, CFSTR("[MPMediaItem class]"));

  }
}

- (id)valueForProperty:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "_isValidItemProperty:", v5);

  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
    if (v7 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 464, CFSTR("Subclass %@ must implement -%@ defined in %@."), v11, v12, CFSTR("[MPMediaItem class]"));

    }
  }
  return 0;
}

- (id)valuesForProperties:(id)a3
{
  uint64_t v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v5 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v5 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 469, CFSTR("Subclass %@ must implement -%@ defined in %@."), v9, v10, CFSTR("[MPMediaItem class]"));

  }
  return 0;
}

- (BOOL)existsInLibrary
{
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 480, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPMediaItem class]"));

  }
  return 1;
}

- (void)populateLocationPropertiesWithPath:(id)a3
{
  -[MPMediaItem populateLocationPropertiesWithPath:assetProtectionType:](self, "populateLocationPropertiesWithPath:assetProtectionType:", a3, 0);
}

- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "populateLocationPropertiesOfItem:withPath:assetProtectionType:", self, v6, a4);

  -[MPMediaEntity invalidateCachedProperties](self, "invalidateCachedProperties");
}

- (void)populateLocationPropertiesWithPath:(id)a3 assetProtectionType:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "populateLocationPropertiesOfItem:withPath:assetProtectionType:completionBlock:", self, v9, a4, v8);

  -[MPMediaEntity invalidateCachedProperties](self, "invalidateCachedProperties");
}

- (void)clearLocationProperties
{
  void *v3;

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearLocationPropertiesOfItem:", self);

  -[MPMediaEntity invalidateCachedProperties](self, "invalidateCachedProperties");
}

- (id)multiverseIdentifier
{
  void *v3;
  void *v4;

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiverseIdentifierForTrackWithPersistentID:", -[MPMediaEntity persistentID](self, "persistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)chapters
{
  return (NSArray *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("chapters"));
}

- (NSString)albumArtist
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumArtist"));
}

- (NSString)effectiveAlbumArtist
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumArtist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("artist"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (MPMediaEntityPersistentID)albumPersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (MPMediaEntityPersistentID)albumArtistPersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumArtistPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (NSString)albumTitle
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumTitle"));
}

- (NSUInteger)albumTrackCount
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumTrackCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSString)artist
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("artist"));
}

- (MPMediaEntityPersistentID)artistPersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("artistPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (MPMediaItemArtwork)artwork
{
  return (MPMediaItemArtwork *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("artwork"));
}

- (NSURL)assetURL
{
  return (NSURL *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("assetURL"));
}

- (NSUInteger)beatsPerMinute
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("beatsPerMinute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSTimeInterval)bookmarkTime
{
  void *v2;
  double v3;
  double v4;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("bookmarkTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (NSDate)dateAdded
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("dateAdded"));
}

- (NSString)comments
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("comments"));
}

- (NSString)composer
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("composer"));
}

- (MPMediaEntityPersistentID)composerPersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("composerPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (NSString)genre
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("genre"));
}

- (MPMediaEntityPersistentID)genrePersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("genrePID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (BOOL)isRental
{
  void *v4;
  char v5;

  if (isRental___onceToken != -1)
    dispatch_once(&isRental___onceToken, &__block_literal_global_463);
  if (isRental___alwaysReturnNO)
    return 0;
  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isRental"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isITunesU
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isITunesU"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isCompilation
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isCompilation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isCloudItem
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isCloudItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasProtectedAsset
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("hasProtectedAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSTimeInterval)playbackDuration
{
  void *v2;
  double v3;
  double v4;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("playbackDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)startTime
{
  void *v2;
  double v3;
  double v4;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("startTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)stopTime
{
  void *v2;
  double v3;
  double v4;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("stopTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)effectiveStopTime
{
  double result;

  -[MPMediaItem stopTime](self, "stopTime");
  if (result == 0.0)
    -[MPMediaItem playbackDuration](self, "playbackDuration");
  return result;
}

- (NSString)podcastTitle
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("podcastTitle"));
}

- (MPMediaEntityPersistentID)podcastPersistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("podcastPID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (NSUInteger)rating
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("rating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setRating:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("rating"), 0);

}

- (NSDate)releaseDate
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("releaseDate"));
}

- (NSString)title
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("title"));
}

- (unint64_t)year
{
  void *v2;
  unint64_t v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("year"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)predicateForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MPMediaItem valueForProperty:](self, "valueForProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUInteger)playCount
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("playCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setPlayCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("playCount"), 0);

}

- (unint64_t)playCountSinceSync
{
  void *v2;
  unint64_t v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("playCountSinceSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setPlayCountSinceSync:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("playCountSinceSync"), 0);

}

- (NSDate)lastPlayedDate
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("lastPlayedDate"));
}

- (void)setLastPlayedDate:(id)a3
{
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", a3, CFSTR("lastPlayedDate"), 0);
}

- (NSDate)dateAccessed
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("dateAccessed"));
}

- (void)setDateAccessed:(id)a3
{
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", a3, CFSTR("dateAccessed"), 0);
}

- (NSUInteger)skipCount
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("skipCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setSkipCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("skipCount"), 0);

}

- (unint64_t)skipCountSinceSync
{
  void *v2;
  unint64_t v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("skipCountSinceSync"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setSkipCountSinceSync:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("skipCountSinceSync"), 0);

}

- (NSDate)lastSkippedDate
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("lastSkippedDate"));
}

- (void)setLastSkippedDate:(id)a3
{
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", a3, CFSTR("lastSkippedDate"), 0);
}

- (BOOL)hasBeenPlayed
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("hasBeenPlayed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v4, CFSTR("hasBeenPlayed"), 0);

}

- (NSString)playbackStoreID
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("playbackStoreID"));
}

- (BOOL)rememberBookmarkTime
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("rememberBookmarkTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSUInteger)albumTrackNumber
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("albumTrackNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSUInteger)discNumber
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("discNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSUInteger)discCount
{
  void *v2;
  NSUInteger v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("discCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)isExplicitItem
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isExplicit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)lyrics
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("lyrics"));
}

- (NSString)userGrouping
{
  return (NSString *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("userGrouping"));
}

- (id)chaptersOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("chapters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "chapterType", (_QWORD)v15) == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)chapterOfType:(int64_t)a3 atIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("chapters"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "chapterType", (_QWORD)v15) == a3)
        {
          if (v9 == a4)
          {
            v13 = v12;
            goto LABEL_13;
          }
          ++v9;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)chapterOfType:(int64_t)a3 atTime:(double)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MPMediaItem chaptersOfType:](self, "chaptersOfType:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "playbackTime", (_QWORD)v15);
        if (v10 <= a4)
        {
          objc_msgSend(v9, "playbackTime");
          v12 = v11;
          objc_msgSend(v9, "playbackDuration");
          if (v12 + v13 > a4)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (unint64_t)countOfChaptersOfType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("chapters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "chapterType") == a3)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)gaplessHeuristicInfo:(unsigned int *)a3 durationInSamples:(unint64_t *)a4 lastPacketsResync:(unint64_t *)a5 encodingDelay:(unsigned int *)a6 encodingDrain:(unsigned int *)a7
{
  void *v14;
  _QWORD v15[9];

  if (!a7 || !a3 || !a4 || !a5 || !a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItem.m"), 1337, CFSTR("invalid parameter"));

  }
  if (gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____once != -1)
    dispatch_once(&gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____once, &__block_literal_global_471);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke_2;
  v15[3] = &__block_descriptor_72_e25_v32__0__NSString_8_16_B24l;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a6;
  v15[7] = a7;
  v15[8] = a5;
  -[MPMediaEntity enumerateValuesForProperties:usingBlock:](self, "enumerateValuesForProperties:usingBlock:", gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties, v15);
}

- (BOOL)isUsableAsRepresentativeItem
{
  return 1;
}

- (NSDate)dateDownloaded
{
  return (NSDate *)-[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("dateDownloaded"));
}

- (BOOL)isPreorder
{
  void *v2;
  char v3;

  -[MPMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("isPreorder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  int v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("gaplessHeuristicInfo")))
  {
    v6 = objc_msgSend(v5, "unsignedIntValue");
    v7 = (_DWORD *)a1[4];
LABEL_10:
    *v7 = v6;
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("durationInSamples")))
  {
    v8 = objc_msgSend(v5, "unsignedLongLongValue");
    v9 = (uint64_t *)a1[5];
  }
  else
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("gaplessEncodingDelay")))
    {
      v6 = objc_msgSend(v5, "unsignedIntValue");
      v7 = (_DWORD *)a1[6];
      goto LABEL_10;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("gaplessEncodingDrain")))
    {
      v6 = objc_msgSend(v5, "unsignedIntValue");
      v7 = (_DWORD *)a1[7];
      goto LABEL_10;
    }
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("gaplessLastFrameResync")))
      goto LABEL_11;
    v8 = objc_msgSend(v5, "unsignedLongLongValue");
    v9 = (uint64_t *)a1[8];
  }
  *v9 = v8;
LABEL_11:

}

void __100__MPMediaItem_gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("gaplessHeuristicInfo"), CFSTR("durationInSamples"), CFSTR("gaplessEncodingDelay"), CFSTR("gaplessEncodingDrain"), CFSTR("gaplessLastFrameResync"), 0);
  v1 = (void *)gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties;
  gaplessHeuristicInfo_durationInSamples_lastPacketsResync_encodingDelay_encodingDrain____properties = v0;

}

void __23__MPMediaItem_isRental__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  isRental___alwaysReturnNO = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Music"));
  if ((isRental___alwaysReturnNO & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.LegacyMusic"));
  isRental___alwaysReturnNO = v1;

}

+ (id)itemFromModelObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  MPModelObjectMediaItem *v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "persistentID");

    if (!v7)
      goto LABEL_8;
    objc_msgSend(v4, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "library");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "databaseID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;

    objc_msgSend(v15, "itemWithPersistentID:", v7);
    v14 = (MPModelObjectMediaItem *)objc_claimAutoreleasedReturnValue();

    if (!v14)
LABEL_8:
      v14 = -[MPModelObjectMediaItem initWithModelObject:]([MPModelObjectMediaItem alloc], "initWithModelObject:", v4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)itemFromSong:(id)a3
{
  void *v3;
  void *v4;

  +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaItem itemFromModelObject:](MPMediaItem, "itemFromModelObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ULIDPropertyForGroupingType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v5;

  v3 = CFSTR("cloudUniversalLibraryID");
  switch(a3)
  {
    case 1:
    case 10:
    case 11:
    case 12:
    case 13:
    case 17:
      v3 = CFSTR("storeCloudAlbumID");
      break;
    case 3:
      v3 = CFSTR("albumArtistCloudUniversalLibraryID");
      break;
    case 6:
      v3 = CFSTR("cloudPlaylistUniversalLibraryID");
      v5 = CFSTR("cloudPlaylistUniversalLibraryID");
      break;
    case 7:
      v3 = CFSTR("podcastPID");
      break;
    default:
      return v3;
  }
  return v3;
}

+ (NSString)titlePropertyForGroupingType:(MPMediaGrouping)groupingType
{
  if ((unint64_t)(groupingType - 1) > 0x14)
    return (NSString *)CFSTR("title");
  else
    return &off_1E3155CF0[groupingType - 1]->isa;
}

+ (id)fallbackTitlePropertyForGroupingType:(int64_t)a3
{
  if (a3 == 8)
    return CFSTR("artist");
  else
    return CFSTR("title");
}

+ (id)dynamicProperties
{
  if (dynamicProperties_sOnce != -1)
    dispatch_once(&dynamicProperties_sOnce, &__block_literal_global_13420);
  return (id)dynamicProperties_sProperties;
}

+ (BOOL)_isValidItemProperty:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  BOOL v6;

  v4 = a3;
  v5 = (const __CFDictionary *)__filterableDictionary_13418;
  if (!__filterableDictionary_13418)
  {
    objc_msgSend(a1, "_createFilterableDictionary");
    v5 = (const __CFDictionary *)__filterableDictionary_13418;
  }
  v6 = CFDictionaryContainsKey(v5, (const void *)objc_msgSend(v4, "hash")) != 0;

  return v6;
}

void __32__MPMediaItem_dynamicProperties__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("bookmarkTime");
  v2[1] = CFSTR("hasBeenPlayed");
  v2[2] = CFSTR("lastPlayedDate");
  v2[3] = CFSTR("lastSkippedDate");
  v2[4] = CFSTR("playCount");
  v2[5] = CFSTR("playCountSinceSync");
  v2[6] = CFSTR("rating");
  v2[7] = CFSTR("skipCount");
  v2[8] = CFSTR("skipCountSinceSync");
  v2[9] = CFSTR("dateAccessed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dynamicProperties_sProperties;
  dynamicProperties_sProperties = v0;

}

- (BOOL)MPSD_isDownloadInProgress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "MPSD_mediaItemPropertiesForDownloadability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem valuesForProperties:](self, "valuesForProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadForMediaItem:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "isFinished") ^ 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("isPendingSync"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "BOOLValue");

  }
  return v7;
}

+ (id)MPSD_mediaItemPropertiesForDownloadability
{
  if (MPSD_mediaItemPropertiesForDownloadability_onceToken != -1)
    dispatch_once(&MPSD_mediaItemPropertiesForDownloadability_onceToken, &__block_literal_global_50395);
  return (id)MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability;
}

void __83__MPMediaItem_MPStoreDownloadAdditions__MPSD_mediaItemPropertiesForDownloadability__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("isLocal"), CFSTR("isPendingSync"), CFSTR("isTemporaryCloudDownload"), CFSTR("isStoreRedownloadable"), CFSTR("storeItemAdamID"), 0);
  v1 = (void *)MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability;
  MPSD_mediaItemPropertiesForDownloadability_sMediaItemPropertiesForDownloadability = v0;

}

@end
