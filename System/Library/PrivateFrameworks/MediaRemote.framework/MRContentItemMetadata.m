@implementation MRContentItemMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeFormats, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_albumYear, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplates, 0);
  objc_storeStrong((id *)&self->_artworkFileURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_durationStringLocalizationKey, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_lyricsURL, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_radioStationString, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedContentRating, 0);
  objc_storeStrong((id *)&self->_directorName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);
  objc_storeStrong((id *)&self->_trackArtistName, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_classicalWork, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_storeStrong((id *)&self->_deviceSpecificUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_appMetrics, 0);
  objc_storeStrong((id *)&self->_purchaseInfoData, 0);
}

- (id)protobufWithEncoding:(int64_t)a3
{
  _MRContentItemMetadataProtobuf *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;

  v5 = objc_alloc_init(_MRContentItemMetadataProtobuf);
  -[_MRContentItemMetadataProtobuf setIsContainer:](v5, "setIsContainer:", -[MRContentItemMetadata isContainer](self, "isContainer"));
  -[_MRContentItemMetadataProtobuf setHasIsContainer:](v5, "setHasIsContainer:", -[MRContentItemMetadata hasContainer](self, "hasContainer"));
  -[_MRContentItemMetadataProtobuf setIsPlayable:](v5, "setIsPlayable:", -[MRContentItemMetadata isPlayable](self, "isPlayable"));
  -[_MRContentItemMetadataProtobuf setHasIsPlayable:](v5, "setHasIsPlayable:", -[MRContentItemMetadata hasPlayable](self, "hasPlayable"));
  -[_MRContentItemMetadataProtobuf setIsExplicitItem:](v5, "setIsExplicitItem:", -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"));
  -[_MRContentItemMetadataProtobuf setHasIsExplicitItem:](v5, "setHasIsExplicitItem:", -[MRContentItemMetadata hasExplicitItem](self, "hasExplicitItem"));
  -[_MRContentItemMetadataProtobuf setIsStreamingContent:](v5, "setIsStreamingContent:", -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"));
  -[_MRContentItemMetadataProtobuf setHasIsStreamingContent:](v5, "setHasIsStreamingContent:", -[MRContentItemMetadata hasStreamingContent](self, "hasStreamingContent"));
  -[_MRContentItemMetadataProtobuf setIsCurrentlyPlaying:](v5, "setIsCurrentlyPlaying:", -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"));
  -[_MRContentItemMetadataProtobuf setHasIsCurrentlyPlaying:](v5, "setHasIsCurrentlyPlaying:", -[MRContentItemMetadata hasCurrentlyPlaying](self, "hasCurrentlyPlaying"));
  -[_MRContentItemMetadataProtobuf setIsAlwaysLive:](v5, "setIsAlwaysLive:", -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"));
  -[_MRContentItemMetadataProtobuf setHasIsAlwaysLive:](v5, "setHasIsAlwaysLive:", -[MRContentItemMetadata hasAlwaysLive](self, "hasAlwaysLive"));
  -[_MRContentItemMetadataProtobuf setIsSharable:](v5, "setIsSharable:", -[MRContentItemMetadata isSharable](self, "isSharable"));
  -[_MRContentItemMetadataProtobuf setHasIsSharable:](v5, "setHasIsSharable:", -[MRContentItemMetadata hasSharable](self, "hasSharable"));
  -[_MRContentItemMetadataProtobuf setIsLiked:](v5, "setIsLiked:", -[MRContentItemMetadata isLiked](self, "isLiked"));
  -[_MRContentItemMetadataProtobuf setHasIsLiked:](v5, "setHasIsLiked:", -[MRContentItemMetadata hasLiked](self, "hasLiked"));
  -[_MRContentItemMetadataProtobuf setIsInWishList:](v5, "setIsInWishList:", -[MRContentItemMetadata isInWishList](self, "isInWishList"));
  -[_MRContentItemMetadataProtobuf setHasIsInWishList:](v5, "setHasIsInWishList:", -[MRContentItemMetadata hasInWishList](self, "hasInWishList"));
  -[_MRContentItemMetadataProtobuf setIsAdvertisement:](v5, "setIsAdvertisement:", -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"));
  -[_MRContentItemMetadataProtobuf setHasIsAdvertisement:](v5, "setHasIsAdvertisement:", -[MRContentItemMetadata hasAdvertisement](self, "hasAdvertisement"));
  -[_MRContentItemMetadataProtobuf setIsSteerable:](v5, "setIsSteerable:", -[MRContentItemMetadata isSteerable](self, "isSteerable"));
  -[_MRContentItemMetadataProtobuf setHasIsSteerable:](v5, "setHasIsSteerable:", -[MRContentItemMetadata hasSteerable](self, "hasSteerable"));
  -[_MRContentItemMetadataProtobuf setIsLoading:](v5, "setIsLoading:", -[MRContentItemMetadata isLoading](self, "isLoading"));
  -[_MRContentItemMetadataProtobuf setHasIsLoading:](v5, "setHasIsLoading:", -[MRContentItemMetadata hasLoading](self, "hasLoading"));
  -[_MRContentItemMetadataProtobuf setIsInTransition:](v5, "setIsInTransition:", -[MRContentItemMetadata isInTransition](self, "isInTransition"));
  -[_MRContentItemMetadataProtobuf setHasIsInTransition:](v5, "setHasIsInTransition:", -[MRContentItemMetadata hasInTransition](self, "hasInTransition"));
  -[_MRContentItemMetadataProtobuf setArtworkAvailable:](v5, "setArtworkAvailable:", -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"));
  -[_MRContentItemMetadataProtobuf setHasArtworkAvailable:](v5, "setHasArtworkAvailable:", -[MRContentItemMetadata hasArtworkAvailable](self, "hasArtworkAvailable"));
  -[_MRContentItemMetadataProtobuf setInfoAvailable:](v5, "setInfoAvailable:", -[MRContentItemMetadata infoAvailable](self, "infoAvailable"));
  -[_MRContentItemMetadataProtobuf setHasInfoAvailable:](v5, "setHasInfoAvailable:", -[MRContentItemMetadata hasInfoAvailable](self, "hasInfoAvailable"));
  -[_MRContentItemMetadataProtobuf setLanguageOptionsAvailable:](v5, "setLanguageOptionsAvailable:", -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"));
  -[_MRContentItemMetadataProtobuf setHasLanguageOptionsAvailable:](v5, "setHasLanguageOptionsAvailable:", -[MRContentItemMetadata hasLanguageOptionsAvailable](self, "hasLanguageOptionsAvailable"));
  -[_MRContentItemMetadataProtobuf setLyricsAvailable:](v5, "setLyricsAvailable:", -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"));
  -[_MRContentItemMetadataProtobuf setHasLyricsAvailable:](v5, "setHasLyricsAvailable:", -[MRContentItemMetadata hasLyricsAvailable](self, "hasLyricsAvailable"));
  -[MRContentItemMetadata playbackProgress](self, "playbackProgress");
  -[_MRContentItemMetadataProtobuf setPlaybackProgress:](v5, "setPlaybackProgress:");
  -[_MRContentItemMetadataProtobuf setHasPlaybackProgress:](v5, "setHasPlaybackProgress:", -[MRContentItemMetadata hasPlaybackProgress](self, "hasPlaybackProgress"));
  -[MRContentItemMetadata playbackRate](self, "playbackRate");
  -[_MRContentItemMetadataProtobuf setPlaybackRate:](v5, "setPlaybackRate:");
  -[_MRContentItemMetadataProtobuf setHasPlaybackRate:](v5, "setHasPlaybackRate:", -[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"));
  -[MRContentItemMetadata defaultPlaybackRate](self, "defaultPlaybackRate");
  -[_MRContentItemMetadataProtobuf setDefaultPlaybackRate:](v5, "setDefaultPlaybackRate:");
  -[_MRContentItemMetadataProtobuf setHasDefaultPlaybackRate:](v5, "setHasDefaultPlaybackRate:", -[MRContentItemMetadata hasDefaultPlaybackRate](self, "hasDefaultPlaybackRate"));
  -[MRContentItemMetadata downloadProgress](self, "downloadProgress");
  -[_MRContentItemMetadataProtobuf setDownloadProgress:](v5, "setDownloadProgress:");
  -[_MRContentItemMetadataProtobuf setHasDownloadProgress:](v5, "setHasDownloadProgress:", -[MRContentItemMetadata hasDownloadProgress](self, "hasDownloadProgress"));
  -[_MRContentItemMetadataProtobuf setPlaylistType:](v5, "setPlaylistType:", -[MRContentItemMetadata playlistType](self, "playlistType"));
  -[_MRContentItemMetadataProtobuf setHasPlaylistType:](v5, "setHasPlaylistType:", -[MRContentItemMetadata hasPlaylistType](self, "hasPlaylistType"));
  -[_MRContentItemMetadataProtobuf setRadioStationType:](v5, "setRadioStationType:", -[MRContentItemMetadata radioStationType](self, "radioStationType"));
  -[_MRContentItemMetadataProtobuf setHasRadioStationType:](v5, "setHasRadioStationType:", -[MRContentItemMetadata hasRadioStationType](self, "hasRadioStationType"));
  -[_MRContentItemMetadataProtobuf setEditingStyleFlags:](v5, "setEditingStyleFlags:", -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"));
  -[_MRContentItemMetadataProtobuf setHasEditingStyleFlags:](v5, "setHasEditingStyleFlags:", -[MRContentItemMetadata hasEditingStyleFlags](self, "hasEditingStyleFlags"));
  -[_MRContentItemMetadataProtobuf setMediaType:](v5, "setMediaType:", -[MRContentItemMetadata mediaType](self, "mediaType"));
  -[_MRContentItemMetadataProtobuf setHasMediaType:](v5, "setHasMediaType:", -[MRContentItemMetadata hasMediaType](self, "hasMediaType"));
  -[_MRContentItemMetadataProtobuf setMediaSubType:](v5, "setMediaSubType:", -[MRContentItemMetadata mediaSubType](self, "mediaSubType"));
  -[_MRContentItemMetadataProtobuf setHasMediaSubType:](v5, "setHasMediaSubType:", -[MRContentItemMetadata hasMediaSubType](self, "hasMediaSubType"));
  -[_MRContentItemMetadataProtobuf setEpisodeType:](v5, "setEpisodeType:", -[MRContentItemMetadata episodeType](self, "episodeType"));
  -[_MRContentItemMetadataProtobuf setHasEpisodeType:](v5, "setHasEpisodeType:", -[MRContentItemMetadata hasEpisodeType](self, "hasEpisodeType"));
  -[_MRContentItemMetadataProtobuf setPlayCount:](v5, "setPlayCount:", -[MRContentItemMetadata playCount](self, "playCount"));
  -[_MRContentItemMetadataProtobuf setHasPlayCount:](v5, "setHasPlayCount:", -[MRContentItemMetadata hasPlayCount](self, "hasPlayCount"));
  -[_MRContentItemMetadataProtobuf setNumberOfSections:](v5, "setNumberOfSections:", -[MRContentItemMetadata numberOfSections](self, "numberOfSections"));
  -[_MRContentItemMetadataProtobuf setHasNumberOfSections:](v5, "setHasNumberOfSections:", -[MRContentItemMetadata hasNumberOfSections](self, "hasNumberOfSections"));
  -[_MRContentItemMetadataProtobuf setChapterCount:](v5, "setChapterCount:", -[MRContentItemMetadata chapterCount](self, "chapterCount"));
  -[_MRContentItemMetadataProtobuf setHasChapterCount:](v5, "setHasChapterCount:", -[MRContentItemMetadata hasChapterCount](self, "hasChapterCount"));
  -[_MRContentItemMetadataProtobuf setTotalDiscCount:](v5, "setTotalDiscCount:", -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"));
  -[_MRContentItemMetadataProtobuf setHasTotalDiscCount:](v5, "setHasTotalDiscCount:", -[MRContentItemMetadata hasTotalDiscCount](self, "hasTotalDiscCount"));
  -[_MRContentItemMetadataProtobuf setTotalTrackCount:](v5, "setTotalTrackCount:", -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"));
  -[_MRContentItemMetadataProtobuf setHasTotalTrackCount:](v5, "setHasTotalTrackCount:", -[MRContentItemMetadata hasTotalTrackCount](self, "hasTotalTrackCount"));
  -[_MRContentItemMetadataProtobuf setDownloadState:](v5, "setDownloadState:", -[MRContentItemMetadata downloadState](self, "downloadState"));
  -[_MRContentItemMetadataProtobuf setHasDownloadState:](v5, "setHasDownloadState:", -[MRContentItemMetadata hasDownloadState](self, "hasDownloadState"));
  -[_MRContentItemMetadataProtobuf setArtworkDataWidthDeprecated:](v5, "setArtworkDataWidthDeprecated:", -[MRContentItemMetadata artworkDataWidthDeprecated](self, "artworkDataWidthDeprecated"));
  -[_MRContentItemMetadataProtobuf setHasArtworkDataWidthDeprecated:](v5, "setHasArtworkDataWidthDeprecated:", -[MRContentItemMetadata hasArtworkDataWidthDeprecated](self, "hasArtworkDataWidthDeprecated"));
  -[_MRContentItemMetadataProtobuf setArtworkDataHeightDeprecated:](v5, "setArtworkDataHeightDeprecated:", -[MRContentItemMetadata artworkDataHeightDeprecated](self, "artworkDataHeightDeprecated"));
  -[_MRContentItemMetadataProtobuf setHasArtworkDataHeightDeprecated:](v5, "setHasArtworkDataHeightDeprecated:", -[MRContentItemMetadata hasArtworkDataHeightDeprecated](self, "hasArtworkDataHeightDeprecated"));
  -[MRContentItemMetadata duration](self, "duration");
  -[_MRContentItemMetadataProtobuf setDuration:](v5, "setDuration:");
  -[_MRContentItemMetadataProtobuf setHasDuration:](v5, "setHasDuration:", -[MRContentItemMetadata hasDuration](self, "hasDuration"));
  -[MRContentItemMetadata startTime](self, "startTime");
  -[_MRContentItemMetadataProtobuf setStartTime:](v5, "setStartTime:");
  -[_MRContentItemMetadataProtobuf setHasStartTime:](v5, "setHasStartTime:", -[MRContentItemMetadata hasStartTime](self, "hasStartTime"));
  -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
  -[_MRContentItemMetadataProtobuf setElapsedTime:](v5, "setElapsedTime:");
  -[_MRContentItemMetadataProtobuf setHasElapsedTime:](v5, "setHasElapsedTime:", -[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"));
  -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
  -[_MRContentItemMetadataProtobuf setElapsedTimeTimestamp:](v5, "setElapsedTimeTimestamp:");
  -[_MRContentItemMetadataProtobuf setHasElapsedTimeTimestamp:](v5, "setHasElapsedTimeTimestamp:", -[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"));
  -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
  -[_MRContentItemMetadataProtobuf setInferredTimestamp:](v5, "setInferredTimestamp:");
  -[_MRContentItemMetadataProtobuf setHasInferredTimestamp:](v5, "setHasInferredTimestamp:", -[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"));
  -[_MRContentItemMetadataProtobuf setSeasonNumber:](v5, "setSeasonNumber:", -[MRContentItemMetadata seasonNumber](self, "seasonNumber"));
  -[_MRContentItemMetadataProtobuf setHasSeasonNumber:](v5, "setHasSeasonNumber:", -[MRContentItemMetadata hasSeasonNumber](self, "hasSeasonNumber"));
  -[_MRContentItemMetadataProtobuf setEpisodeNumber:](v5, "setEpisodeNumber:", -[MRContentItemMetadata episodeNumber](self, "episodeNumber"));
  -[_MRContentItemMetadataProtobuf setHasEpisodeNumber:](v5, "setHasEpisodeNumber:", -[MRContentItemMetadata hasEpisodeNumber](self, "hasEpisodeNumber"));
  -[MRContentItemMetadata releaseDate](self, "releaseDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  -[_MRContentItemMetadataProtobuf setReleaseDate:](v5, "setReleaseDate:");

  -[MRContentItemMetadata releaseDate](self, "releaseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setHasReleaseDate:](v5, "setHasReleaseDate:", v7 != 0);

  -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setCurrentPlaybackDateData:](v5, "setCurrentPlaybackDateData:", v10);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setCurrentPlaybackDateData:](v5, "setCurrentPlaybackDateData:", 0);
  }

  -[_MRContentItemMetadataProtobuf setDiscNumber:](v5, "setDiscNumber:", -[MRContentItemMetadata discNumber](self, "discNumber"));
  -[_MRContentItemMetadataProtobuf setHasDiscNumber:](v5, "setHasDiscNumber:", -[MRContentItemMetadata hasDiscNumber](self, "hasDiscNumber"));
  -[_MRContentItemMetadataProtobuf setTrackNumber:](v5, "setTrackNumber:", -[MRContentItemMetadata trackNumber](self, "trackNumber"));
  -[_MRContentItemMetadataProtobuf setHasTrackNumber:](v5, "setHasTrackNumber:", -[MRContentItemMetadata hasTrackNumber](self, "hasTrackNumber"));
  -[_MRContentItemMetadataProtobuf setRadioStationIdentifier:](v5, "setRadioStationIdentifier:", -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasRadioStationIdentifier:](v5, "setHasRadioStationIdentifier:", -[MRContentItemMetadata hasRadioStationIdentifier](self, "hasRadioStationIdentifier"));
  -[_MRContentItemMetadataProtobuf setITunesStoreIdentifier:](v5, "setITunesStoreIdentifier:", -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasITunesStoreIdentifier:](v5, "setHasITunesStoreIdentifier:", -[MRContentItemMetadata hasITunesStoreIdentifier](self, "hasITunesStoreIdentifier"));
  -[_MRContentItemMetadataProtobuf setITunesStoreSubscriptionIdentifier:](v5, "setITunesStoreSubscriptionIdentifier:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasITunesStoreSubscriptionIdentifier:](v5, "setHasITunesStoreSubscriptionIdentifier:", -[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](self, "hasITunesStoreSubscriptionIdentifier"));
  -[_MRContentItemMetadataProtobuf setITunesStoreArtistIdentifier:](v5, "setITunesStoreArtistIdentifier:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasITunesStoreArtistIdentifier:](v5, "setHasITunesStoreArtistIdentifier:", -[MRContentItemMetadata hasITunesStoreArtistIdentifier](self, "hasITunesStoreArtistIdentifier"));
  -[_MRContentItemMetadataProtobuf setITunesStoreAlbumIdentifier:](v5, "setITunesStoreAlbumIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasITunesStoreAlbumIdentifier:](v5, "setHasITunesStoreAlbumIdentifier:", -[MRContentItemMetadata hasITunesStoreAlbumIdentifier](self, "hasITunesStoreAlbumIdentifier"));
  -[_MRContentItemMetadataProtobuf setLegacyUniqueIdentifier:](v5, "setLegacyUniqueIdentifier:", -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasLegacyUniqueIdentifier:](v5, "setHasLegacyUniqueIdentifier:", -[MRContentItemMetadata hasLegacyUniqueIdentifier](self, "hasLegacyUniqueIdentifier"));
  -[MRContentItemMetadata classicalWork](self, "classicalWork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setClassicalWork:](v5, "setClassicalWork:", v11);

  -[MRContentItemMetadata appMetrics](self, "appMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MRContentItemMetadata appMetrics](self, "appMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setAppMetricsData:](v5, "setAppMetricsData:", v14);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setAppMetricsData:](v5, "setAppMetricsData:", 0);
  }

  -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v16, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setNowPlayingInfoData:](v5, "setNowPlayingInfoData:", v17);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setNowPlayingInfoData:](v5, "setNowPlayingInfoData:", 0);
  }

  -[MRContentItemMetadata userInfo](self, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[MRContentItemMetadata userInfo](self, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v19, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setUserInfoData:](v5, "setUserInfoData:", v20);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setUserInfoData:](v5, "setUserInfoData:", 0);
  }

  -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v22, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setDeviceSpecificUserInfoData:](v5, "setDeviceSpecificUserInfoData:", v23);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setDeviceSpecificUserInfoData:](v5, "setDeviceSpecificUserInfoData:", 0);
  }

  -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v25, a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setCollectionInfoData:](v5, "setCollectionInfoData:", v26);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setCollectionInfoData:](v5, "setCollectionInfoData:", 0);
  }

  -[MRContentItemMetadata purchaseInfoData](self, "purchaseInfoData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[_MRContentItemMetadataProtobuf setPurchaseInfoData:](v5, "setPurchaseInfoData:", v28);

  -[MRContentItemMetadata title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[_MRContentItemMetadataProtobuf setTitle:](v5, "setTitle:", v30);

  -[MRContentItemMetadata subtitle](self, "subtitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[_MRContentItemMetadataProtobuf setSubtitle:](v5, "setSubtitle:", v32);

  -[MRContentItemMetadata albumName](self, "albumName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[_MRContentItemMetadataProtobuf setAlbumName:](v5, "setAlbumName:", v34);

  -[MRContentItemMetadata trackArtistName](self, "trackArtistName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  -[_MRContentItemMetadataProtobuf setTrackArtistName:](v5, "setTrackArtistName:", v36);

  -[MRContentItemMetadata albumArtistName](self, "albumArtistName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  -[_MRContentItemMetadataProtobuf setAlbumArtistName:](v5, "setAlbumArtistName:", v38);

  -[MRContentItemMetadata directorName](self, "directorName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  -[_MRContentItemMetadataProtobuf setDirectorName:](v5, "setDirectorName:", v40);

  -[MRContentItemMetadata localizedContentRating](self, "localizedContentRating");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  -[_MRContentItemMetadataProtobuf setLocalizedContentRating:](v5, "setLocalizedContentRating:", v42);

  -[MRContentItemMetadata collectionIdentifier](self, "collectionIdentifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  -[_MRContentItemMetadataProtobuf setCollectionIdentifier:](v5, "setCollectionIdentifier:", v44);

  -[MRContentItemMetadata profileIdentifier](self, "profileIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  -[_MRContentItemMetadataProtobuf setProfileIdentifier:](v5, "setProfileIdentifier:", v46);

  -[MRContentItemMetadata assetURL](self, "assetURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "absoluteString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setAssetURLString:](v5, "setAssetURLString:", v48);

  -[MRContentItemMetadata composer](self, "composer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  -[_MRContentItemMetadataProtobuf setComposer:](v5, "setComposer:", v50);

  -[MRContentItemMetadata genre](self, "genre");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  -[_MRContentItemMetadataProtobuf setGenre:](v5, "setGenre:", v52);

  -[MRContentItemMetadata contentIdentifier](self, "contentIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  -[_MRContentItemMetadataProtobuf setContentIdentifier:](v5, "setContentIdentifier:", v54);

  -[MRContentItemMetadata radioStationName](self, "radioStationName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  -[_MRContentItemMetadataProtobuf setRadioStationName:](v5, "setRadioStationName:", v56);

  -[MRContentItemMetadata radioStationString](self, "radioStationString");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  -[_MRContentItemMetadataProtobuf setRadioStationString:](v5, "setRadioStationString:", v58);

  -[MRContentItemMetadata seriesName](self, "seriesName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copy");
  -[_MRContentItemMetadataProtobuf setSeriesName:](v5, "setSeriesName:", v60);

  -[MRContentItemMetadata lyricsURL](self, "lyricsURL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "absoluteString");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setLyricsURL:](v5, "setLyricsURL:", v62);

  -[MRContentItemMetadata serviceIdentifier](self, "serviceIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copy");
  -[_MRContentItemMetadataProtobuf setServiceIdentifier:](v5, "setServiceIdentifier:", v64);

  -[MRContentItemMetadata brandIdentifier](self, "brandIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copy");
  -[_MRContentItemMetadataProtobuf setBrandIdentifier:](v5, "setBrandIdentifier:", v66);

  -[MRContentItemMetadata localizedDurationString](self, "localizedDurationString");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "copy");
  -[_MRContentItemMetadataProtobuf setLocalizedDurationString:](v5, "setLocalizedDurationString:", v68);

  -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "copy");
  -[_MRContentItemMetadataProtobuf setDurationStringLocalizationKey:](v5, "setDurationStringLocalizationKey:", v70);

  -[MRContentItemMetadata artworkIdentifier](self, "artworkIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");
  -[_MRContentItemMetadataProtobuf setArtworkIdentifier:](v5, "setArtworkIdentifier:", v72);

  -[MRContentItemMetadata artworkMIMEType](self, "artworkMIMEType");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copy");
  -[_MRContentItemMetadataProtobuf setArtworkMIMEType:](v5, "setArtworkMIMEType:", v74);

  -[MRContentItemMetadata artworkURL](self, "artworkURL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "absoluteString");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setArtworkURL:](v5, "setArtworkURL:", v76);

  -[MRContentItemMetadata artworkFileURL](self, "artworkFileURL");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "absoluteString");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf setArtworkFileURL:](v5, "setArtworkFileURL:", v78);

  -[MRContentItemMetadata albumYear](self, "albumYear");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v79, "copy");
  -[_MRContentItemMetadataProtobuf setAlbumYear:](v5, "setAlbumYear:", v80);

  -[MRContentItemMetadata internationalStandardRecordingCode](self, "internationalStandardRecordingCode");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "copy");
  -[_MRContentItemMetadataProtobuf setInternationalStandardRecordingCode:](v5, "setInternationalStandardRecordingCode:", v82);

  -[MRContentItemMetadata participantName](self, "participantName");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "copy");
  -[_MRContentItemMetadataProtobuf setParticipantName:](v5, "setParticipantName:", v84);

  -[MRContentItemMetadata participantIdentifier](self, "participantIdentifier");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v85, "copy");
  -[_MRContentItemMetadataProtobuf setParticipantIdentifier:](v5, "setParticipantIdentifier:", v86);

  -[_MRContentItemMetadataProtobuf setIsResolvableParticipant:](v5, "setIsResolvableParticipant:", -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"));
  -[_MRContentItemMetadataProtobuf setHasIsResolvableParticipant:](v5, "setHasIsResolvableParticipant:", -[MRContentItemMetadata hasIsResolvableParticipant](self, "hasIsResolvableParticipant"));
  -[_MRContentItemMetadataProtobuf setExcludeFromSuggestions:](v5, "setExcludeFromSuggestions:", -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"));
  -[_MRContentItemMetadataProtobuf setHasExcludeFromSuggestions:](v5, "setHasExcludeFromSuggestions:", -[MRContentItemMetadata hasExcludeFromSuggestions](self, "hasExcludeFromSuggestions"));
  -[_MRContentItemMetadataProtobuf setSongTraits:](v5, "setSongTraits:", -[MRContentItemMetadata songTraits](self, "songTraits"));
  -[_MRContentItemMetadataProtobuf setHasSongTraits:](v5, "setHasSongTraits:", -[MRContentItemMetadata hasSongTraits](self, "hasSongTraits"));
  -[_MRContentItemMetadataProtobuf setAlbumTraits:](v5, "setAlbumTraits:", -[MRContentItemMetadata albumTraits](self, "albumTraits"));
  -[_MRContentItemMetadataProtobuf setHasAlbumTraits:](v5, "setHasAlbumTraits:", -[MRContentItemMetadata hasAlbumTraits](self, "hasAlbumTraits"));
  -[_MRContentItemMetadataProtobuf setPlaylistTraits:](v5, "setPlaylistTraits:", -[MRContentItemMetadata playlistTraits](self, "playlistTraits"));
  -[_MRContentItemMetadataProtobuf setHasPlaylistTraits:](v5, "setHasPlaylistTraits:", -[MRContentItemMetadata hasPlaylistTraits](self, "hasPlaylistTraits"));
  -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "protobuf");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setPreferredFormat:](v5, "setPreferredFormat:", v89);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setPreferredFormat:](v5, "setPreferredFormat:", 0);
  }

  -[MRContentItemMetadata activeFormat](self, "activeFormat");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    -[MRContentItemMetadata activeFormat](self, "activeFormat");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "protobuf");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setActiveFormat:](v5, "setActiveFormat:", v92);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setActiveFormat:](v5, "setActiveFormat:", 0);
  }

  -[_MRContentItemMetadataProtobuf setActiveFormatJustification:](v5, "setActiveFormatJustification:", -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"));
  -[_MRContentItemMetadataProtobuf setHasActiveFormatJustification:](v5, "setHasActiveFormatJustification:", -[MRContentItemMetadata hasActiveFormatJustification](self, "hasActiveFormatJustification"));
  -[_MRContentItemMetadataProtobuf setFormatTierPreference:](v5, "setFormatTierPreference:", -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"));
  -[_MRContentItemMetadataProtobuf setHasFormatTierPreference:](v5, "setHasFormatTierPreference:", -[MRContentItemMetadata hasFormatTierPreference](self, "hasFormatTierPreference"));
  -[MRContentItemMetadata audioRoute](self, "audioRoute");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    -[MRContentItemMetadata audioRoute](self, "audioRoute");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "protobuf");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setAudioRoute:](v5, "setAudioRoute:", v95);

  }
  else
  {
    -[_MRContentItemMetadataProtobuf setAudioRoute:](v5, "setAudioRoute:", 0);
  }

  -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    -[_MRContentItemMetadataProtobuf setHasAlternativeFormats:](v5, "setHasAlternativeFormats:", 1);
    -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "msv_map:", &__block_literal_global_6_0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (void *)objc_msgSend(v98, "mutableCopy");
    -[_MRContentItemMetadataProtobuf setAlternativeFormats:](v5, "setAlternativeFormats:", v99);

  }
  -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "count");

  if (v101)
  {
    -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    MREncodeObjectWithEncoding(v102, a3);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRContentItemMetadataProtobuf setArtworkURLTemplatesData:](v5, "setArtworkURLTemplatesData:", v103);

  }
  -[_MRContentItemMetadataProtobuf setReportingAdamID:](v5, "setReportingAdamID:", -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"));
  -[_MRContentItemMetadataProtobuf setHasReportingAdamID:](v5, "setHasReportingAdamID:", -[MRContentItemMetadata hasReportingAdamID](self, "hasReportingAdamID"));
  -[_MRContentItemMetadataProtobuf setLyricsAdamID:](v5, "setLyricsAdamID:", -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"));
  -[_MRContentItemMetadataProtobuf setHasLyricsAdamID:](v5, "setHasLyricsAdamID:", -[MRContentItemMetadata hasLyricsAdamID](self, "hasLyricsAdamID"));
  -[_MRContentItemMetadataProtobuf setITunesStoreAlbumArtistIdentifier:](v5, "setITunesStoreAlbumArtistIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"));
  -[_MRContentItemMetadataProtobuf setHasITunesStoreAlbumArtistIdentifier:](v5, "setHasITunesStoreAlbumArtistIdentifier:", -[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](self, "hasITunesStoreAlbumArtistIdentifier"));
  -[_MRContentItemMetadataProtobuf setTranscriptAlignmentsAvailable:](v5, "setTranscriptAlignmentsAvailable:", -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"));
  -[_MRContentItemMetadataProtobuf setHasTranscriptAlignmentsAvailable:](v5, "setHasTranscriptAlignmentsAvailable:", -[MRContentItemMetadata hasTranscriptAlignmentsAvailable](self, "hasTranscriptAlignmentsAvailable"));
  return v5;
}

- (void)mergeFrom:(id)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSURL *v89;
  NSURL *assetURL;
  void *v91;
  NSDictionary *v92;
  NSDictionary *userInfo;
  void *v94;
  NSDictionary *v95;
  NSDictionary *appMetrics;
  void *v97;
  NSDictionary *v98;
  NSDictionary *nowPlayingInfo;
  void *v100;
  NSDictionary *v101;
  NSDictionary *collectionInfo;
  void *v103;
  NSDate *v104;
  NSDate *currentPlaybackDate;
  void *v106;
  NSDictionary *v107;
  NSDictionary *deviceSpecificUserInfo;
  void *v109;
  NSArray *v110;
  NSArray *artworkURLTemplates;
  void *v112;
  void *v113;
  MRContentItemMetadata *v114;

  v114 = (MRContentItemMetadata *)a3;
  if (self != v114)
  {
    if (-[MRContentItemMetadata hasContainer](v114, "hasContainer"))
      -[MRContentItemMetadata setContainer:](self, "setContainer:", -[MRContentItemMetadata isContainer](v114, "isContainer"));
    if (-[MRContentItemMetadata hasPlayable](v114, "hasPlayable"))
      -[MRContentItemMetadata setPlayable:](self, "setPlayable:", -[MRContentItemMetadata isPlayable](v114, "isPlayable"));
    if (-[MRContentItemMetadata hasExplicitItem](v114, "hasExplicitItem"))
      -[MRContentItemMetadata setExplicitItem:](self, "setExplicitItem:", -[MRContentItemMetadata isExplicitItem](v114, "isExplicitItem"));
    if (-[MRContentItemMetadata hasStreamingContent](v114, "hasStreamingContent"))
      -[MRContentItemMetadata setStreamingContent:](self, "setStreamingContent:", -[MRContentItemMetadata isStreamingContent](v114, "isStreamingContent"));
    if (-[MRContentItemMetadata hasCurrentlyPlaying](v114, "hasCurrentlyPlaying"))
      -[MRContentItemMetadata setCurrentlyPlaying:](self, "setCurrentlyPlaying:", -[MRContentItemMetadata isCurrentlyPlaying](v114, "isCurrentlyPlaying"));
    if (-[MRContentItemMetadata hasAlwaysLive](v114, "hasAlwaysLive"))
      -[MRContentItemMetadata setAlwaysLive:](self, "setAlwaysLive:", -[MRContentItemMetadata isAlwaysLive](v114, "isAlwaysLive"));
    if (-[MRContentItemMetadata hasSharable](v114, "hasSharable"))
      -[MRContentItemMetadata setSharable:](self, "setSharable:", -[MRContentItemMetadata isSharable](v114, "isSharable"));
    if (-[MRContentItemMetadata hasLiked](v114, "hasLiked"))
      -[MRContentItemMetadata setLiked:](self, "setLiked:", -[MRContentItemMetadata isLiked](v114, "isLiked"));
    if (-[MRContentItemMetadata hasInWishList](v114, "hasInWishList"))
      -[MRContentItemMetadata setInWishList:](self, "setInWishList:", -[MRContentItemMetadata isInWishList](v114, "isInWishList"));
    if (-[MRContentItemMetadata hasAdvertisement](v114, "hasAdvertisement"))
      -[MRContentItemMetadata setAdvertisement:](self, "setAdvertisement:", -[MRContentItemMetadata isAdvertisement](v114, "isAdvertisement"));
    if (-[MRContentItemMetadata hasSteerable](v114, "hasSteerable"))
      -[MRContentItemMetadata setSteerable:](self, "setSteerable:", -[MRContentItemMetadata isSteerable](v114, "isSteerable"));
    if (-[MRContentItemMetadata hasLoading](v114, "hasLoading"))
      -[MRContentItemMetadata setLoading:](self, "setLoading:", -[MRContentItemMetadata isLoading](v114, "isLoading"));
    if (-[MRContentItemMetadata hasInTransition](v114, "hasInTransition"))
      -[MRContentItemMetadata setInTransition:](self, "setInTransition:", -[MRContentItemMetadata isInTransition](v114, "isInTransition"));
    if (-[MRContentItemMetadata hasArtworkAvailable](v114, "hasArtworkAvailable"))
      -[MRContentItemMetadata setArtworkAvailable:](self, "setArtworkAvailable:", -[MRContentItemMetadata artworkAvailable](v114, "artworkAvailable"));
    if (-[MRContentItemMetadata hasInfoAvailable](v114, "hasInfoAvailable"))
      -[MRContentItemMetadata setInfoAvailable:](self, "setInfoAvailable:", -[MRContentItemMetadata infoAvailable](v114, "infoAvailable"));
    if (-[MRContentItemMetadata hasTranscriptAlignmentsAvailable](v114, "hasTranscriptAlignmentsAvailable"))
      -[MRContentItemMetadata setTranscriptAlignmentsAvailable:](self, "setTranscriptAlignmentsAvailable:", -[MRContentItemMetadata transcriptAlignmentsAvailable](v114, "transcriptAlignmentsAvailable"));
    if (-[MRContentItemMetadata hasLanguageOptionsAvailable](v114, "hasLanguageOptionsAvailable"))
      -[MRContentItemMetadata setLanguageOptionsAvailable:](self, "setLanguageOptionsAvailable:", -[MRContentItemMetadata languageOptionsAvailable](v114, "languageOptionsAvailable"));
    if (-[MRContentItemMetadata hasLyricsAvailable](v114, "hasLyricsAvailable"))
      -[MRContentItemMetadata setLyricsAvailable:](self, "setLyricsAvailable:", -[MRContentItemMetadata lyricsAvailable](v114, "lyricsAvailable"));
    if (-[MRContentItemMetadata hasPlaybackProgress](v114, "hasPlaybackProgress"))
    {
      -[MRContentItemMetadata playbackProgress](v114, "playbackProgress");
      -[MRContentItemMetadata setPlaybackProgress:](self, "setPlaybackProgress:");
    }
    if (-[MRContentItemMetadata hasPlaybackRate](v114, "hasPlaybackRate"))
    {
      -[MRContentItemMetadata playbackRate](v114, "playbackRate");
      -[MRContentItemMetadata setPlaybackRate:](self, "setPlaybackRate:");
    }
    if (-[MRContentItemMetadata hasDefaultPlaybackRate](v114, "hasDefaultPlaybackRate"))
    {
      -[MRContentItemMetadata defaultPlaybackRate](v114, "defaultPlaybackRate");
      -[MRContentItemMetadata setDefaultPlaybackRate:](self, "setDefaultPlaybackRate:");
    }
    if (-[MRContentItemMetadata hasDownloadProgress](v114, "hasDownloadProgress"))
    {
      -[MRContentItemMetadata downloadProgress](v114, "downloadProgress");
      -[MRContentItemMetadata setDownloadProgress:](self, "setDownloadProgress:");
    }
    if (-[MRContentItemMetadata hasPlaylistType](v114, "hasPlaylistType"))
      -[MRContentItemMetadata setPlaylistType:](self, "setPlaylistType:", -[MRContentItemMetadata playlistType](v114, "playlistType"));
    if (-[MRContentItemMetadata hasRadioStationType](v114, "hasRadioStationType"))
      -[MRContentItemMetadata setRadioStationType:](self, "setRadioStationType:", -[MRContentItemMetadata radioStationType](v114, "radioStationType"));
    if (-[MRContentItemMetadata hasEditingStyleFlags](v114, "hasEditingStyleFlags"))
      -[MRContentItemMetadata setEditingStyleFlags:](self, "setEditingStyleFlags:", -[MRContentItemMetadata editingStyleFlags](v114, "editingStyleFlags"));
    if (-[MRContentItemMetadata hasMediaType](v114, "hasMediaType"))
      -[MRContentItemMetadata setMediaType:](self, "setMediaType:", -[MRContentItemMetadata mediaType](v114, "mediaType"));
    if (-[MRContentItemMetadata hasMediaSubType](v114, "hasMediaSubType"))
      -[MRContentItemMetadata setMediaSubType:](self, "setMediaSubType:", -[MRContentItemMetadata mediaSubType](v114, "mediaSubType"));
    if (-[MRContentItemMetadata hasEpisodeType](v114, "hasEpisodeType"))
      -[MRContentItemMetadata setEpisodeType:](self, "setEpisodeType:", -[MRContentItemMetadata episodeType](v114, "episodeType"));
    if (-[MRContentItemMetadata hasPlayCount](v114, "hasPlayCount"))
      -[MRContentItemMetadata setPlayCount:](self, "setPlayCount:", -[MRContentItemMetadata playCount](v114, "playCount"));
    if (-[MRContentItemMetadata hasNumberOfSections](v114, "hasNumberOfSections"))
      -[MRContentItemMetadata setNumberOfSections:](self, "setNumberOfSections:", -[MRContentItemMetadata numberOfSections](v114, "numberOfSections"));
    if (-[MRContentItemMetadata hasChapterCount](v114, "hasChapterCount"))
      -[MRContentItemMetadata setChapterCount:](self, "setChapterCount:", -[MRContentItemMetadata chapterCount](v114, "chapterCount"));
    if (-[MRContentItemMetadata hasTotalDiscCount](v114, "hasTotalDiscCount"))
      -[MRContentItemMetadata setTotalDiscCount:](self, "setTotalDiscCount:", -[MRContentItemMetadata totalDiscCount](v114, "totalDiscCount"));
    if (-[MRContentItemMetadata hasTotalTrackCount](v114, "hasTotalTrackCount"))
      -[MRContentItemMetadata setTotalTrackCount:](self, "setTotalTrackCount:", -[MRContentItemMetadata totalTrackCount](v114, "totalTrackCount"));
    if (-[MRContentItemMetadata hasDownloadState](v114, "hasDownloadState"))
      -[MRContentItemMetadata setDownloadState:](self, "setDownloadState:", -[MRContentItemMetadata downloadState](v114, "downloadState"));
    if (-[MRContentItemMetadata hasArtworkDataWidthDeprecated](v114, "hasArtworkDataWidthDeprecated"))
      -[MRContentItemMetadata setArtworkDataWidthDeprecated:](self, "setArtworkDataWidthDeprecated:", -[MRContentItemMetadata artworkDataWidthDeprecated](v114, "artworkDataWidthDeprecated"));
    if (-[MRContentItemMetadata hasArtworkDataHeightDeprecated](v114, "hasArtworkDataHeightDeprecated"))
      -[MRContentItemMetadata setArtworkDataHeightDeprecated:](self, "setArtworkDataHeightDeprecated:", -[MRContentItemMetadata artworkDataHeightDeprecated](v114, "artworkDataHeightDeprecated"));
    if (-[MRContentItemMetadata hasDuration](v114, "hasDuration"))
    {
      -[MRContentItemMetadata duration](v114, "duration");
      -[MRContentItemMetadata setDuration:](self, "setDuration:");
    }
    if (-[MRContentItemMetadata hasStartTime](v114, "hasStartTime"))
    {
      -[MRContentItemMetadata startTime](v114, "startTime");
      -[MRContentItemMetadata setStartTime:](self, "setStartTime:");
    }
    if (-[MRContentItemMetadata hasElapsedTime](v114, "hasElapsedTime"))
    {
      -[MRContentItemMetadata elapsedTime](v114, "elapsedTime");
      -[MRContentItemMetadata setElapsedTime:](self, "setElapsedTime:");
    }
    if (-[MRContentItemMetadata hasElapsedTimeTimestamp](v114, "hasElapsedTimeTimestamp"))
    {
      -[MRContentItemMetadata elapsedTimeTimestamp](v114, "elapsedTimeTimestamp");
      -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");
    }
    if (-[MRContentItemMetadata hasInferredTimestamp](v114, "hasInferredTimestamp"))
    {
      -[MRContentItemMetadata inferredTimestamp](v114, "inferredTimestamp");
      -[MRContentItemMetadata setInferredTimestamp:](self, "setInferredTimestamp:");
    }
    if (-[MRContentItemMetadata hasSeasonNumber](v114, "hasSeasonNumber"))
      -[MRContentItemMetadata setSeasonNumber:](self, "setSeasonNumber:", -[MRContentItemMetadata seasonNumber](v114, "seasonNumber"));
    if (-[MRContentItemMetadata hasEpisodeNumber](v114, "hasEpisodeNumber"))
      -[MRContentItemMetadata setEpisodeNumber:](self, "setEpisodeNumber:", -[MRContentItemMetadata episodeNumber](v114, "episodeNumber"));
    if (-[MRContentItemMetadata hasDiscNumber](v114, "hasDiscNumber"))
      -[MRContentItemMetadata setDiscNumber:](self, "setDiscNumber:", -[MRContentItemMetadata discNumber](v114, "discNumber"));
    if (-[MRContentItemMetadata hasTrackNumber](v114, "hasTrackNumber"))
      -[MRContentItemMetadata setTrackNumber:](self, "setTrackNumber:", -[MRContentItemMetadata trackNumber](v114, "trackNumber"));
    if (-[MRContentItemMetadata hasRadioStationIdentifier](v114, "hasRadioStationIdentifier"))
      -[MRContentItemMetadata setRadioStationIdentifier:](self, "setRadioStationIdentifier:", -[MRContentItemMetadata radioStationIdentifier](v114, "radioStationIdentifier"));
    if (-[MRContentItemMetadata hasITunesStoreIdentifier](v114, "hasITunesStoreIdentifier"))
      -[MRContentItemMetadata setITunesStoreIdentifier:](self, "setITunesStoreIdentifier:", -[MRContentItemMetadata iTunesStoreIdentifier](v114, "iTunesStoreIdentifier"));
    if (-[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](v114, "hasITunesStoreSubscriptionIdentifier"))
      -[MRContentItemMetadata setITunesStoreSubscriptionIdentifier:](self, "setITunesStoreSubscriptionIdentifier:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](v114, "iTunesStoreSubscriptionIdentifier"));
    if (-[MRContentItemMetadata hasITunesStoreArtistIdentifier](v114, "hasITunesStoreArtistIdentifier"))
      -[MRContentItemMetadata setITunesStoreArtistIdentifier:](self, "setITunesStoreArtistIdentifier:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](v114, "iTunesStoreArtistIdentifier"));
    if (-[MRContentItemMetadata hasITunesStoreAlbumIdentifier](v114, "hasITunesStoreAlbumIdentifier"))
      -[MRContentItemMetadata setITunesStoreAlbumIdentifier:](self, "setITunesStoreAlbumIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](v114, "iTunesStoreAlbumIdentifier"));
    if (-[MRContentItemMetadata hasLegacyUniqueIdentifier](v114, "hasLegacyUniqueIdentifier"))
      -[MRContentItemMetadata setLegacyUniqueIdentifier:](self, "setLegacyUniqueIdentifier:", -[MRContentItemMetadata legacyUniqueIdentifier](v114, "legacyUniqueIdentifier"));
    if (-[MRContentItemMetadata hasSongTraits](v114, "hasSongTraits"))
      -[MRContentItemMetadata setSongTraits:](self, "setSongTraits:", -[MRContentItemMetadata songTraits](v114, "songTraits"));
    if (-[MRContentItemMetadata hasAlbumTraits](v114, "hasAlbumTraits"))
      -[MRContentItemMetadata setAlbumTraits:](self, "setAlbumTraits:", -[MRContentItemMetadata albumTraits](v114, "albumTraits"));
    if (-[MRContentItemMetadata hasPlaylistTraits](v114, "hasPlaylistTraits"))
      -[MRContentItemMetadata setPlaylistTraits:](self, "setPlaylistTraits:", -[MRContentItemMetadata playlistTraits](v114, "playlistTraits"));
    if (-[MRContentItemMetadata hasActiveFormatJustification](v114, "hasActiveFormatJustification"))
      -[MRContentItemMetadata setActiveFormatJustification:](self, "setActiveFormatJustification:", -[MRContentItemMetadata activeFormatJustification](v114, "activeFormatJustification"));
    if (-[MRContentItemMetadata hasFormatTierPreference](v114, "hasFormatTierPreference"))
      -[MRContentItemMetadata setFormatTierPreference:](self, "setFormatTierPreference:", -[MRContentItemMetadata formatTierPreference](v114, "formatTierPreference"));
    -[MRContentItemMetadata purchaseInfoData](v114, "purchaseInfoData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[MRContentItemMetadata purchaseInfoData](v114, "purchaseInfoData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setPurchaseInfoData:](self, "setPurchaseInfoData:", v5);

    }
    -[MRContentItemMetadata appMetrics](v114, "appMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MRContentItemMetadata appMetrics](v114, "appMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAppMetrics:](self, "setAppMetrics:", v7);

    }
    -[MRContentItemMetadata nowPlayingInfo](v114, "nowPlayingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MRContentItemMetadata nowPlayingInfo](v114, "nowPlayingInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setNowPlayingInfo:](self, "setNowPlayingInfo:", v9);

    }
    -[MRContentItemMetadata userInfo](v114, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[MRContentItemMetadata userInfo](v114, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setUserInfo:](self, "setUserInfo:", v11);

    }
    -[MRContentItemMetadata deviceSpecificUserInfo](v114, "deviceSpecificUserInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MRContentItemMetadata deviceSpecificUserInfo](v114, "deviceSpecificUserInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setDeviceSpecificUserInfo:](self, "setDeviceSpecificUserInfo:", v13);

    }
    -[MRContentItemMetadata collectionInfo](v114, "collectionInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[MRContentItemMetadata collectionInfo](v114, "collectionInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setCollectionInfo:](self, "setCollectionInfo:", v15);

    }
    -[MRContentItemMetadata releaseDate](v114, "releaseDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MRContentItemMetadata releaseDate](v114, "releaseDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setReleaseDate:](self, "setReleaseDate:", v17);

    }
    -[MRContentItemMetadata currentPlaybackDate](v114, "currentPlaybackDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MRContentItemMetadata currentPlaybackDate](v114, "currentPlaybackDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setCurrentPlaybackDate:](self, "setCurrentPlaybackDate:", v19);

    }
    -[MRContentItemMetadata title](v114, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[MRContentItemMetadata title](v114, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setTitle:](self, "setTitle:", v21);

    }
    -[MRContentItemMetadata subtitle](v114, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[MRContentItemMetadata subtitle](v114, "subtitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setSubtitle:](self, "setSubtitle:", v23);

    }
    -[MRContentItemMetadata classicalWork](v114, "classicalWork");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[MRContentItemMetadata classicalWork](v114, "classicalWork");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setClassicalWork:](self, "setClassicalWork:", v25);

    }
    -[MRContentItemMetadata albumName](v114, "albumName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[MRContentItemMetadata albumName](v114, "albumName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAlbumName:](self, "setAlbumName:", v27);

    }
    -[MRContentItemMetadata trackArtistName](v114, "trackArtistName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[MRContentItemMetadata trackArtistName](v114, "trackArtistName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setTrackArtistName:](self, "setTrackArtistName:", v29);

    }
    -[MRContentItemMetadata albumArtistName](v114, "albumArtistName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[MRContentItemMetadata albumArtistName](v114, "albumArtistName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAlbumArtistName:](self, "setAlbumArtistName:", v31);

    }
    -[MRContentItemMetadata directorName](v114, "directorName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[MRContentItemMetadata directorName](v114, "directorName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setDirectorName:](self, "setDirectorName:", v33);

    }
    -[MRContentItemMetadata localizedContentRating](v114, "localizedContentRating");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[MRContentItemMetadata localizedContentRating](v114, "localizedContentRating");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setLocalizedContentRating:](self, "setLocalizedContentRating:", v35);

    }
    -[MRContentItemMetadata collectionIdentifier](v114, "collectionIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[MRContentItemMetadata collectionIdentifier](v114, "collectionIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setCollectionIdentifier:](self, "setCollectionIdentifier:", v37);

    }
    -[MRContentItemMetadata profileIdentifier](v114, "profileIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[MRContentItemMetadata profileIdentifier](v114, "profileIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setProfileIdentifier:](self, "setProfileIdentifier:", v39);

    }
    -[MRContentItemMetadata assetURL](v114, "assetURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      -[MRContentItemMetadata assetURL](v114, "assetURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAssetURL:](self, "setAssetURL:", v41);

    }
    -[MRContentItemMetadata composer](v114, "composer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      -[MRContentItemMetadata composer](v114, "composer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setComposer:](self, "setComposer:", v43);

    }
    -[MRContentItemMetadata genre](v114, "genre");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[MRContentItemMetadata genre](v114, "genre");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setGenre:](self, "setGenre:", v45);

    }
    -[MRContentItemMetadata contentIdentifier](v114, "contentIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      -[MRContentItemMetadata contentIdentifier](v114, "contentIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setContentIdentifier:](self, "setContentIdentifier:", v47);

    }
    -[MRContentItemMetadata radioStationName](v114, "radioStationName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      -[MRContentItemMetadata radioStationName](v114, "radioStationName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setRadioStationName:](self, "setRadioStationName:", v49);

    }
    -[MRContentItemMetadata radioStationString](v114, "radioStationString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[MRContentItemMetadata radioStationString](v114, "radioStationString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setRadioStationString:](self, "setRadioStationString:", v51);

    }
    -[MRContentItemMetadata seriesName](v114, "seriesName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[MRContentItemMetadata seriesName](v114, "seriesName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setSeriesName:](self, "setSeriesName:", v53);

    }
    -[MRContentItemMetadata lyricsURL](v114, "lyricsURL");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      -[MRContentItemMetadata lyricsURL](v114, "lyricsURL");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setLyricsURL:](self, "setLyricsURL:", v55);

    }
    -[MRContentItemMetadata serviceIdentifier](v114, "serviceIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      -[MRContentItemMetadata serviceIdentifier](v114, "serviceIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setServiceIdentifier:](self, "setServiceIdentifier:", v57);

    }
    -[MRContentItemMetadata brandIdentifier](v114, "brandIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      -[MRContentItemMetadata brandIdentifier](v114, "brandIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setBrandIdentifier:](self, "setBrandIdentifier:", v59);

    }
    -[MRContentItemMetadata localizedDurationString](v114, "localizedDurationString");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      -[MRContentItemMetadata localizedDurationString](v114, "localizedDurationString");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setLocalizedDurationString:](self, "setLocalizedDurationString:", v61);

    }
    -[MRContentItemMetadata durationStringLocalizationKey](v114, "durationStringLocalizationKey");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      -[MRContentItemMetadata durationStringLocalizationKey](v114, "durationStringLocalizationKey");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setDurationStringLocalizationKey:](self, "setDurationStringLocalizationKey:", v63);

    }
    -[MRContentItemMetadata artworkIdentifier](v114, "artworkIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[MRContentItemMetadata artworkIdentifier](v114, "artworkIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setArtworkIdentifier:](self, "setArtworkIdentifier:", v65);

    }
    -[MRContentItemMetadata artworkMIMEType](v114, "artworkMIMEType");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      -[MRContentItemMetadata artworkMIMEType](v114, "artworkMIMEType");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setArtworkMIMEType:](self, "setArtworkMIMEType:", v67);

    }
    -[MRContentItemMetadata artworkURL](v114, "artworkURL");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      -[MRContentItemMetadata artworkURL](v114, "artworkURL");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setArtworkURL:](self, "setArtworkURL:", v69);

    }
    -[MRContentItemMetadata artworkFileURL](v114, "artworkFileURL");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      -[MRContentItemMetadata artworkFileURL](v114, "artworkFileURL");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setArtworkFileURL:](self, "setArtworkFileURL:", v71);

    }
    -[MRContentItemMetadata artworkURLTemplates](v114, "artworkURLTemplates");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      -[MRContentItemMetadata artworkURLTemplates](v114, "artworkURLTemplates");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setArtworkURLTemplates:](self, "setArtworkURLTemplates:", v73);

    }
    -[MRContentItemMetadata albumYear](v114, "albumYear");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      -[MRContentItemMetadata albumYear](v114, "albumYear");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAlbumYear:](self, "setAlbumYear:", v75);

    }
    -[MRContentItemMetadata preferredFormat](v114, "preferredFormat");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      -[MRContentItemMetadata preferredFormat](v114, "preferredFormat");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setPreferredFormat:](self, "setPreferredFormat:", v77);

    }
    -[MRContentItemMetadata activeFormat](v114, "activeFormat");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      -[MRContentItemMetadata activeFormat](v114, "activeFormat");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setActiveFormat:](self, "setActiveFormat:", v79);

    }
    -[MRContentItemMetadata audioRoute](v114, "audioRoute");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      -[MRContentItemMetadata audioRoute](v114, "audioRoute");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAudioRoute:](self, "setAudioRoute:", v81);

    }
    -[MRContentItemMetadata alternativeFormats](v114, "alternativeFormats");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      -[MRContentItemMetadata alternativeFormats](v114, "alternativeFormats");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setAlternativeFormats:](self, "setAlternativeFormats:", v83);

    }
    -[MRContentItemMetadata participantName](v114, "participantName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      -[MRContentItemMetadata participantName](v114, "participantName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setParticipantName:](self, "setParticipantName:", v85);

    }
    -[MRContentItemMetadata participantIdentifier](v114, "participantIdentifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      -[MRContentItemMetadata participantIdentifier](v114, "participantIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setParticipantIdentifier:](self, "setParticipantIdentifier:", v87);

    }
    if (-[MRContentItemMetadata hasIsResolvableParticipant](v114, "hasIsResolvableParticipant"))
      -[MRContentItemMetadata setIsResolvableParticipant:](self, "setIsResolvableParticipant:", -[MRContentItemMetadata isResolvableParticipant](v114, "isResolvableParticipant"));
    if (-[MRContentItemMetadata hasExcludeFromSuggestions](v114, "hasExcludeFromSuggestions"))
      -[MRContentItemMetadata setExcludeFromSuggestions:](self, "setExcludeFromSuggestions:", -[MRContentItemMetadata excludeFromSuggestions](v114, "excludeFromSuggestions"));
    -[MRContentItemMetadata assetURL](v114, "assetURL");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (v88)
    {
      -[MRContentItemMetadata assetURL](v114, "assetURL");
      v89 = (NSURL *)objc_claimAutoreleasedReturnValue();
      assetURL = self->_assetURL;
      self->_assetURL = v89;

    }
    -[MRContentItemMetadata userInfo](v114, "userInfo");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      -[MRContentItemMetadata userInfo](v114, "userInfo");
      v92 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      userInfo = self->_userInfo;
      self->_userInfo = v92;

    }
    -[MRContentItemMetadata appMetrics](v114, "appMetrics");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (v94)
    {
      -[MRContentItemMetadata appMetrics](v114, "appMetrics");
      v95 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      appMetrics = self->_appMetrics;
      self->_appMetrics = v95;

    }
    -[MRContentItemMetadata nowPlayingInfo](v114, "nowPlayingInfo");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      -[MRContentItemMetadata nowPlayingInfo](v114, "nowPlayingInfo");
      v98 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      nowPlayingInfo = self->_nowPlayingInfo;
      self->_nowPlayingInfo = v98;

    }
    -[MRContentItemMetadata collectionInfo](v114, "collectionInfo");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      -[MRContentItemMetadata collectionInfo](v114, "collectionInfo");
      v101 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      collectionInfo = self->_collectionInfo;
      self->_collectionInfo = v101;

    }
    -[MRContentItemMetadata currentPlaybackDate](v114, "currentPlaybackDate");
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      -[MRContentItemMetadata currentPlaybackDate](v114, "currentPlaybackDate");
      v104 = (NSDate *)objc_claimAutoreleasedReturnValue();
      currentPlaybackDate = self->_currentPlaybackDate;
      self->_currentPlaybackDate = v104;

    }
    -[MRContentItemMetadata deviceSpecificUserInfo](v114, "deviceSpecificUserInfo");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      -[MRContentItemMetadata deviceSpecificUserInfo](v114, "deviceSpecificUserInfo");
      v107 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      deviceSpecificUserInfo = self->_deviceSpecificUserInfo;
      self->_deviceSpecificUserInfo = v107;

    }
    -[MRContentItemMetadata artworkURLTemplates](v114, "artworkURLTemplates");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      -[MRContentItemMetadata artworkURLTemplates](v114, "artworkURLTemplates");
      v110 = (NSArray *)objc_claimAutoreleasedReturnValue();
      artworkURLTemplates = self->_artworkURLTemplates;
      self->_artworkURLTemplates = v110;

    }
    if (-[MRContentItemMetadata hasReportingAdamID](v114, "hasReportingAdamID"))
      -[MRContentItemMetadata setReportingAdamID:](self, "setReportingAdamID:", -[MRContentItemMetadata reportingAdamID](v114, "reportingAdamID"));
    if (-[MRContentItemMetadata hasLyricsAdamID](v114, "hasLyricsAdamID"))
      -[MRContentItemMetadata setLyricsAdamID:](self, "setLyricsAdamID:", -[MRContentItemMetadata lyricsAdamID](v114, "lyricsAdamID"));
    if (-[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](v114, "hasITunesStoreAlbumArtistIdentifier"))
      -[MRContentItemMetadata setITunesStoreAlbumArtistIdentifier:](self, "setITunesStoreAlbumArtistIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](v114, "iTunesStoreAlbumArtistIdentifier"));
    -[MRContentItemMetadata internationalStandardRecordingCode](v114, "internationalStandardRecordingCode");
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      -[MRContentItemMetadata internationalStandardRecordingCode](v114, "internationalStandardRecordingCode");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRContentItemMetadata setInternationalStandardRecordingCode:](self, "setInternationalStandardRecordingCode:", v113);

    }
  }

}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDictionary)collectionInfo
{
  return self->_collectionInfo;
}

- (NSDictionary)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (NSDate)currentPlaybackDate
{
  return self->_currentPlaybackDate;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (NSDictionary)appMetrics
{
  return self->_appMetrics;
}

- (NSArray)artworkURLTemplates
{
  return self->_artworkURLTemplates;
}

- (NSDictionary)deviceSpecificUserInfo
{
  return self->_deviceSpecificUserInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[MRContentItemMetadata hasContainer](self, "hasContainer"))
    objc_msgSend(v5, "setContainer:", -[MRContentItemMetadata isContainer](self, "isContainer"));
  if (-[MRContentItemMetadata hasPlayable](self, "hasPlayable"))
    objc_msgSend(v5, "setPlayable:", -[MRContentItemMetadata isPlayable](self, "isPlayable"));
  if (-[MRContentItemMetadata hasExplicitItem](self, "hasExplicitItem"))
    objc_msgSend(v5, "setExplicitItem:", -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"));
  if (-[MRContentItemMetadata hasStreamingContent](self, "hasStreamingContent"))
    objc_msgSend(v5, "setStreamingContent:", -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"));
  if (-[MRContentItemMetadata hasCurrentlyPlaying](self, "hasCurrentlyPlaying"))
    objc_msgSend(v5, "setCurrentlyPlaying:", -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"));
  if (-[MRContentItemMetadata hasAlwaysLive](self, "hasAlwaysLive"))
    objc_msgSend(v5, "setAlwaysLive:", -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"));
  if (-[MRContentItemMetadata hasSharable](self, "hasSharable"))
    objc_msgSend(v5, "setSharable:", -[MRContentItemMetadata isSharable](self, "isSharable"));
  if (-[MRContentItemMetadata hasLiked](self, "hasLiked"))
    objc_msgSend(v5, "setLiked:", -[MRContentItemMetadata isLiked](self, "isLiked"));
  if (-[MRContentItemMetadata hasInWishList](self, "hasInWishList"))
    objc_msgSend(v5, "setInWishList:", -[MRContentItemMetadata isInWishList](self, "isInWishList"));
  if (-[MRContentItemMetadata hasAdvertisement](self, "hasAdvertisement"))
    objc_msgSend(v5, "setAdvertisement:", -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"));
  if (-[MRContentItemMetadata hasSteerable](self, "hasSteerable"))
    objc_msgSend(v5, "setSteerable:", -[MRContentItemMetadata isSteerable](self, "isSteerable"));
  if (-[MRContentItemMetadata hasLoading](self, "hasLoading"))
    objc_msgSend(v5, "setLoading:", -[MRContentItemMetadata isLoading](self, "isLoading"));
  if (-[MRContentItemMetadata hasInTransition](self, "hasInTransition"))
    objc_msgSend(v5, "setInTransition:", -[MRContentItemMetadata isInTransition](self, "isInTransition"));
  if (-[MRContentItemMetadata hasArtworkAvailable](self, "hasArtworkAvailable"))
    objc_msgSend(v5, "setArtworkAvailable:", -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"));
  if (-[MRContentItemMetadata hasInfoAvailable](self, "hasInfoAvailable"))
    objc_msgSend(v5, "setInfoAvailable:", -[MRContentItemMetadata infoAvailable](self, "infoAvailable"));
  if (-[MRContentItemMetadata hasTranscriptAlignmentsAvailable](self, "hasTranscriptAlignmentsAvailable"))
    objc_msgSend(v5, "setTranscriptAlignmentsAvailable:", -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"));
  if (-[MRContentItemMetadata hasLanguageOptionsAvailable](self, "hasLanguageOptionsAvailable"))
    objc_msgSend(v5, "setLanguageOptionsAvailable:", -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"));
  if (-[MRContentItemMetadata hasLyricsAvailable](self, "hasLyricsAvailable"))
    objc_msgSend(v5, "setLyricsAvailable:", -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"));
  if (-[MRContentItemMetadata hasPlaybackProgress](self, "hasPlaybackProgress"))
  {
    -[MRContentItemMetadata playbackProgress](self, "playbackProgress");
    objc_msgSend(v5, "setPlaybackProgress:");
  }
  if (-[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
  {
    -[MRContentItemMetadata playbackRate](self, "playbackRate");
    objc_msgSend(v5, "setPlaybackRate:");
  }
  if (-[MRContentItemMetadata hasDefaultPlaybackRate](self, "hasDefaultPlaybackRate"))
  {
    -[MRContentItemMetadata defaultPlaybackRate](self, "defaultPlaybackRate");
    objc_msgSend(v5, "setDefaultPlaybackRate:");
  }
  if (-[MRContentItemMetadata hasDownloadProgress](self, "hasDownloadProgress"))
  {
    -[MRContentItemMetadata downloadProgress](self, "downloadProgress");
    objc_msgSend(v5, "setDownloadProgress:");
  }
  if (-[MRContentItemMetadata hasPlaylistType](self, "hasPlaylistType"))
    objc_msgSend(v5, "setPlaylistType:", -[MRContentItemMetadata playlistType](self, "playlistType"));
  if (-[MRContentItemMetadata hasRadioStationType](self, "hasRadioStationType"))
    objc_msgSend(v5, "setRadioStationType:", -[MRContentItemMetadata radioStationType](self, "radioStationType"));
  if (-[MRContentItemMetadata hasEditingStyleFlags](self, "hasEditingStyleFlags"))
    objc_msgSend(v5, "setEditingStyleFlags:", -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"));
  if (-[MRContentItemMetadata hasMediaType](self, "hasMediaType"))
    objc_msgSend(v5, "setMediaType:", -[MRContentItemMetadata mediaType](self, "mediaType"));
  if (-[MRContentItemMetadata hasMediaSubType](self, "hasMediaSubType"))
    objc_msgSend(v5, "setMediaSubType:", -[MRContentItemMetadata mediaSubType](self, "mediaSubType"));
  if (-[MRContentItemMetadata hasEpisodeType](self, "hasEpisodeType"))
    objc_msgSend(v5, "setEpisodeType:", -[MRContentItemMetadata episodeType](self, "episodeType"));
  if (-[MRContentItemMetadata hasPlayCount](self, "hasPlayCount"))
    objc_msgSend(v5, "setPlayCount:", -[MRContentItemMetadata playCount](self, "playCount"));
  if (-[MRContentItemMetadata hasNumberOfSections](self, "hasNumberOfSections"))
    objc_msgSend(v5, "setNumberOfSections:", -[MRContentItemMetadata numberOfSections](self, "numberOfSections"));
  if (-[MRContentItemMetadata hasChapterCount](self, "hasChapterCount"))
    objc_msgSend(v5, "setChapterCount:", -[MRContentItemMetadata chapterCount](self, "chapterCount"));
  if (-[MRContentItemMetadata hasTotalDiscCount](self, "hasTotalDiscCount"))
    objc_msgSend(v5, "setTotalDiscCount:", -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"));
  if (-[MRContentItemMetadata hasTotalTrackCount](self, "hasTotalTrackCount"))
    objc_msgSend(v5, "setTotalTrackCount:", -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"));
  if (-[MRContentItemMetadata hasDownloadState](self, "hasDownloadState"))
    objc_msgSend(v5, "setDownloadState:", -[MRContentItemMetadata downloadState](self, "downloadState"));
  if (-[MRContentItemMetadata hasArtworkDataWidthDeprecated](self, "hasArtworkDataWidthDeprecated"))
    objc_msgSend(v5, "setArtworkDataWidthDeprecated:", -[MRContentItemMetadata artworkDataWidthDeprecated](self, "artworkDataWidthDeprecated"));
  if (-[MRContentItemMetadata hasArtworkDataHeightDeprecated](self, "hasArtworkDataHeightDeprecated"))
    objc_msgSend(v5, "setArtworkDataHeightDeprecated:", -[MRContentItemMetadata artworkDataHeightDeprecated](self, "artworkDataHeightDeprecated"));
  if (-[MRContentItemMetadata hasDuration](self, "hasDuration"))
  {
    -[MRContentItemMetadata duration](self, "duration");
    objc_msgSend(v5, "setDuration:");
  }
  if (-[MRContentItemMetadata hasStartTime](self, "hasStartTime"))
  {
    -[MRContentItemMetadata startTime](self, "startTime");
    objc_msgSend(v5, "setStartTime:");
  }
  if (-[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
  {
    -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
    objc_msgSend(v5, "setElapsedTime:");
  }
  if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
  {
    -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
    objc_msgSend(v5, "setElapsedTimeTimestamp:");
  }
  if (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
  {
    -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
    objc_msgSend(v5, "setInferredTimestamp:");
  }
  if (-[MRContentItemMetadata hasSeasonNumber](self, "hasSeasonNumber"))
    objc_msgSend(v5, "setSeasonNumber:", -[MRContentItemMetadata seasonNumber](self, "seasonNumber"));
  if (-[MRContentItemMetadata hasEpisodeNumber](self, "hasEpisodeNumber"))
    objc_msgSend(v5, "setEpisodeNumber:", -[MRContentItemMetadata episodeNumber](self, "episodeNumber"));
  if (-[MRContentItemMetadata hasDiscNumber](self, "hasDiscNumber"))
    objc_msgSend(v5, "setDiscNumber:", -[MRContentItemMetadata discNumber](self, "discNumber"));
  if (-[MRContentItemMetadata hasTrackNumber](self, "hasTrackNumber"))
    objc_msgSend(v5, "setTrackNumber:", -[MRContentItemMetadata trackNumber](self, "trackNumber"));
  if (-[MRContentItemMetadata hasRadioStationIdentifier](self, "hasRadioStationIdentifier"))
    objc_msgSend(v5, "setRadioStationIdentifier:", -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"));
  if (-[MRContentItemMetadata hasITunesStoreIdentifier](self, "hasITunesStoreIdentifier"))
    objc_msgSend(v5, "setITunesStoreIdentifier:", -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"));
  if (-[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](self, "hasITunesStoreSubscriptionIdentifier"))
    objc_msgSend(v5, "setITunesStoreSubscriptionIdentifier:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"));
  if (-[MRContentItemMetadata hasITunesStoreArtistIdentifier](self, "hasITunesStoreArtistIdentifier"))
    objc_msgSend(v5, "setITunesStoreArtistIdentifier:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"));
  if (-[MRContentItemMetadata hasITunesStoreAlbumIdentifier](self, "hasITunesStoreAlbumIdentifier"))
    objc_msgSend(v5, "setITunesStoreAlbumIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"));
  if (-[MRContentItemMetadata hasLegacyUniqueIdentifier](self, "hasLegacyUniqueIdentifier"))
    objc_msgSend(v5, "setLegacyUniqueIdentifier:", -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"));
  if (-[MRContentItemMetadata hasSongTraits](self, "hasSongTraits"))
    objc_msgSend(v5, "setSongTraits:", -[MRContentItemMetadata songTraits](self, "songTraits"));
  if (-[MRContentItemMetadata hasAlbumTraits](self, "hasAlbumTraits"))
    objc_msgSend(v5, "setAlbumTraits:", -[MRContentItemMetadata albumTraits](self, "albumTraits"));
  if (-[MRContentItemMetadata hasPlaylistTraits](self, "hasPlaylistTraits"))
    objc_msgSend(v5, "setPlaylistTraits:", -[MRContentItemMetadata playlistTraits](self, "playlistTraits"));
  if (-[MRContentItemMetadata hasActiveFormatJustification](self, "hasActiveFormatJustification"))
    objc_msgSend(v5, "setActiveFormatJustification:", -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"));
  if (-[MRContentItemMetadata hasFormatTierPreference](self, "hasFormatTierPreference"))
    objc_msgSend(v5, "setFormatTierPreference:", -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"));
  -[MRContentItemMetadata purchaseInfoData](self, "purchaseInfoData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPurchaseInfoData:", v7);

  -[MRContentItemMetadata appMetrics](self, "appMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAppMetrics:", v9);

  -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setNowPlayingInfo:", v11);

  -[MRContentItemMetadata userInfo](self, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setUserInfo:", v13);

  -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeviceSpecificUserInfo:", v15);

  -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setCollectionInfo:", v17);

  -[MRContentItemMetadata releaseDate](self, "releaseDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setReleaseDate:", v19);

  -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentPlaybackDate:", v21);

  -[MRContentItemMetadata title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setTitle:", v23);

  -[MRContentItemMetadata subtitle](self, "subtitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setSubtitle:", v25);

  -[MRContentItemMetadata classicalWork](self, "classicalWork");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v5, "setClassicalWork:", v27);

  -[MRContentItemMetadata albumName](self, "albumName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlbumName:", v29);

  -[MRContentItemMetadata trackArtistName](self, "trackArtistName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v5, "setTrackArtistName:", v31);

  -[MRContentItemMetadata albumArtistName](self, "albumArtistName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlbumArtistName:", v33);

  -[MRContentItemMetadata directorName](self, "directorName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
  objc_msgSend(v5, "setDirectorName:", v35);

  -[MRContentItemMetadata localizedContentRating](self, "localizedContentRating");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalizedContentRating:", v37);

  -[MRContentItemMetadata collectionIdentifier](self, "collectionIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v38, "copyWithZone:", a3);
  objc_msgSend(v5, "setCollectionIdentifier:", v39);

  -[MRContentItemMetadata profileIdentifier](self, "profileIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copyWithZone:", a3);
  objc_msgSend(v5, "setProfileIdentifier:", v41);

  -[MRContentItemMetadata assetURL](self, "assetURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssetURL:", v43);

  -[MRContentItemMetadata composer](self, "composer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copyWithZone:", a3);
  objc_msgSend(v5, "setComposer:", v45);

  -[MRContentItemMetadata genre](self, "genre");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copyWithZone:", a3);
  objc_msgSend(v5, "setGenre:", v47);

  -[MRContentItemMetadata contentIdentifier](self, "contentIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "copyWithZone:", a3);
  objc_msgSend(v5, "setContentIdentifier:", v49);

  -[MRContentItemMetadata radioStationName](self, "radioStationName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "copyWithZone:", a3);
  objc_msgSend(v5, "setRadioStationName:", v51);

  -[MRContentItemMetadata radioStationString](self, "radioStationString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "copyWithZone:", a3);
  objc_msgSend(v5, "setRadioStationString:", v53);

  -[MRContentItemMetadata seriesName](self, "seriesName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v54, "copyWithZone:", a3);
  objc_msgSend(v5, "setSeriesName:", v55);

  -[MRContentItemMetadata lyricsURL](self, "lyricsURL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v56, "copyWithZone:", a3);
  objc_msgSend(v5, "setLyricsURL:", v57);

  -[MRContentItemMetadata serviceIdentifier](self, "serviceIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v58, "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceIdentifier:", v59);

  -[MRContentItemMetadata brandIdentifier](self, "brandIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v60, "copyWithZone:", a3);
  objc_msgSend(v5, "setBrandIdentifier:", v61);

  -[MRContentItemMetadata localizedDurationString](self, "localizedDurationString");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend(v62, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalizedDurationString:", v63);

  -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v64, "copyWithZone:", a3);
  objc_msgSend(v5, "setDurationStringLocalizationKey:", v65);

  -[MRContentItemMetadata artworkIdentifier](self, "artworkIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v66, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworkIdentifier:", v67);

  -[MRContentItemMetadata artworkMIMEType](self, "artworkMIMEType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v68, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworkMIMEType:", v69);

  -[MRContentItemMetadata artworkURL](self, "artworkURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v70, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworkURL:", v71);

  -[MRContentItemMetadata artworkFileURL](self, "artworkFileURL");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v72, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworkFileURL:", v73);

  -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = (void *)objc_msgSend(v74, "copyWithZone:", a3);
  objc_msgSend(v5, "setArtworkURLTemplates:", v75);

  -[MRContentItemMetadata albumYear](self, "albumYear");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v76, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlbumYear:", v77);

  -[MRContentItemMetadata participantName](self, "participantName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v78, "copyWithZone:", a3);
  objc_msgSend(v5, "setParticipantName:", v79);

  -[MRContentItemMetadata participantIdentifier](self, "participantIdentifier");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(v80, "copyWithZone:", a3);
  objc_msgSend(v5, "setParticipantIdentifier:", v81);

  if (-[MRContentItemMetadata hasIsResolvableParticipant](self, "hasIsResolvableParticipant"))
    objc_msgSend(v5, "setIsResolvableParticipant:", -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"));
  if (-[MRContentItemMetadata hasExcludeFromSuggestions](self, "hasExcludeFromSuggestions"))
    objc_msgSend(v5, "setExcludeFromSuggestions:", -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"));
  -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v82, "copyWithZone:", a3);
  objc_msgSend(v5, "setPreferredFormat:", v83);

  -[MRContentItemMetadata activeFormat](self, "activeFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v84, "copyWithZone:", a3);
  objc_msgSend(v5, "setActiveFormat:", v85);

  -[MRContentItemMetadata audioRoute](self, "audioRoute");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v86, "copyWithZone:", a3);
  objc_msgSend(v5, "setAudioRoute:", v87);

  -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v89 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v89, "initWithArray:copyItems:", v90, 1);
    objc_msgSend(v5, "setAlternativeFormats:", v91);

  }
  else
  {
    objc_msgSend(v5, "setAlternativeFormats:", 0);
  }

  -[MRContentItemMetadata internationalStandardRecordingCode](self, "internationalStandardRecordingCode");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)objc_msgSend(v92, "copyWithZone:", a3);
  objc_msgSend(v5, "setInternationalStandardRecordingCode:", v93);

  if (-[MRContentItemMetadata hasReportingAdamID](self, "hasReportingAdamID"))
    objc_msgSend(v5, "setReportingAdamID:", -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"));
  if (-[MRContentItemMetadata hasLyricsAdamID](self, "hasLyricsAdamID"))
    objc_msgSend(v5, "setLyricsAdamID:", -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"));
  if (-[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](self, "hasITunesStoreAlbumArtistIdentifier"))
    objc_msgSend(v5, "setITunesStoreAlbumArtistIdentifier:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"));
  v94 = v5;

  return v94;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasElapsedTimeTimestamp
{
  return self->_hasElapsedTimeTimestamp;
}

- (BOOL)hasElapsedTime
{
  return self->_hasElapsedTime;
}

- (BOOL)hasInferredTimestamp
{
  return self->_hasInferredTimestamp;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (BOOL)hasPlaybackRate
{
  return self->_hasPlaybackRate;
}

- (NSString)trackArtistName
{
  return self->_trackArtistName;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (NSString)albumArtistName
{
  return self->_albumArtistName;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (BOOL)hasStartTime
{
  return self->_hasStartTime;
}

- (NSString)composer
{
  return self->_composer;
}

- (NSString)albumYear
{
  return self->_albumYear;
}

- (NSString)genre
{
  return self->_genre;
}

- (MRContentItemMetadataAudioFormat)activeFormat
{
  return self->_activeFormat;
}

- (MRContentItemMetadataAudioFormat)preferredFormat
{
  return self->_preferredFormat;
}

- (MRContentItemMetadataAudioRoute)audioRoute
{
  return self->_audioRoute;
}

- (NSArray)alternativeFormats
{
  return self->_alternativeFormats;
}

- (NSString)localizedDurationString
{
  void *v3;
  void *v4;
  NSString *v5;

  -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MRLocalizedString(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_localizedDurationString;
  }
  return v5;
}

- (NSString)durationStringLocalizationKey
{
  return self->_durationStringLocalizationKey;
}

- (BOOL)hasRadioStationIdentifier
{
  return self->_hasRadioStationIdentifier;
}

- (BOOL)hasAlwaysLive
{
  return self->_hasAlwaysLive;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (BOOL)hasDefaultPlaybackRate
{
  return self->_hasDefaultPlaybackRate;
}

- (BOOL)hasTrackNumber
{
  return self->_hasTrackNumber;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (BOOL)hasLegacyUniqueIdentifier
{
  return self->_hasLegacyUniqueIdentifier;
}

- (BOOL)hasITunesStoreArtistIdentifier
{
  return self->_hasITunesStoreArtistIdentifier;
}

- (BOOL)hasMediaSubType
{
  return self->_hasMediaSubType;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (BOOL)hasTotalTrackCount
{
  return self->_hasTotalTrackCount;
}

- (BOOL)hasTotalDiscCount
{
  return self->_hasTotalDiscCount;
}

- (BOOL)hasSteerable
{
  return self->_hasSteerable;
}

- (BOOL)hasSharable
{
  return self->_hasSharable;
}

- (BOOL)hasPlaybackProgress
{
  return self->_hasPlaybackProgress;
}

- (BOOL)hasLiked
{
  return self->_hasLiked;
}

- (BOOL)hasInWishList
{
  return self->_hasInWishList;
}

- (BOOL)hasITunesStoreSubscriptionIdentifier
{
  return self->_hasITunesStoreSubscriptionIdentifier;
}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_hasITunesStoreIdentifier;
}

- (BOOL)hasITunesStoreAlbumIdentifier
{
  return self->_hasITunesStoreAlbumIdentifier;
}

- (BOOL)hasExplicitItem
{
  return self->_hasExplicitItem;
}

- (BOOL)hasDownloadState
{
  return self->_hasDownloadState;
}

- (BOOL)hasDownloadProgress
{
  return self->_hasDownloadProgress;
}

- (BOOL)hasDiscNumber
{
  return self->_hasDiscNumber;
}

- (BOOL)hasAdvertisement
{
  return self->_hasAdvertisement;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSData)purchaseInfoData
{
  return self->_purchaseInfoData;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (BOOL)hasLoading
{
  return self->_hasLoading;
}

- (NSString)radioStationString
{
  return self->_radioStationString;
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (BOOL)hasReportingAdamID
{
  return self->_hasReportingAdamID;
}

- (BOOL)hasPlayable
{
  return self->_hasPlayable;
}

- (BOOL)hasLyricsAdamID
{
  return self->_hasLyricsAdamID;
}

- (BOOL)hasIsResolvableParticipant
{
  return self->_hasIsResolvableParticipant;
}

- (BOOL)hasITunesStoreAlbumArtistIdentifier
{
  return self->_hasITunesStoreAlbumArtistIdentifier;
}

- (NSURL)artworkFileURL
{
  return self->_artworkFileURL;
}

- (BOOL)hasEditingStyleFlags
{
  return self->_hasEditingStyleFlags;
}

- (BOOL)hasArtworkAvailable
{
  return self->_hasArtworkAvailable;
}

- (BOOL)hasStreamingContent
{
  return self->_hasStreamingContent;
}

- (BOOL)hasSongTraits
{
  return self->_hasSongTraits;
}

- (BOOL)hasSeasonNumber
{
  return self->_hasSeasonNumber;
}

- (BOOL)hasRadioStationType
{
  return self->_hasRadioStationType;
}

- (BOOL)hasPlaylistType
{
  return self->_hasPlaylistType;
}

- (BOOL)hasPlaylistTraits
{
  return self->_hasPlaylistTraits;
}

- (BOOL)hasPlayCount
{
  return self->_hasPlayCount;
}

- (BOOL)hasNumberOfSections
{
  return self->_hasNumberOfSections;
}

- (BOOL)hasLyricsAvailable
{
  return self->_hasLyricsAvailable;
}

- (BOOL)hasLanguageOptionsAvailable
{
  return self->_hasLanguageOptionsAvailable;
}

- (BOOL)hasInfoAvailable
{
  return self->_hasInfoAvailable;
}

- (BOOL)hasFormatTierPreference
{
  return self->_hasFormatTierPreference;
}

- (BOOL)hasEpisodeType
{
  return self->_hasEpisodeType;
}

- (BOOL)hasEpisodeNumber
{
  return self->_hasEpisodeNumber;
}

- (BOOL)hasCurrentlyPlaying
{
  return self->_hasCurrentlyPlaying;
}

- (BOOL)hasContainer
{
  return self->_hasContainer;
}

- (BOOL)hasChapterCount
{
  return self->_hasChapterCount;
}

- (BOOL)hasAlbumTraits
{
  return self->_hasAlbumTraits;
}

- (BOOL)hasActiveFormatJustification
{
  return self->_hasActiveFormatJustification;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (NSURL)lyricsURL
{
  return self->_lyricsURL;
}

- (NSString)localizedContentRating
{
  return self->_localizedContentRating;
}

- (NSString)directorName
{
  return self->_directorName;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (BOOL)hasArtworkDataWidthDeprecated
{
  return self->_hasArtworkDataWidthDeprecated;
}

- (BOOL)hasArtworkDataHeightDeprecated
{
  return self->_hasArtworkDataHeightDeprecated;
}

- (NSString)classicalWork
{
  return self->_classicalWork;
}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (void)setTrackArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void)setDeviceSpecificUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void)setAlbumArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (double)elapsedTimeTimestamp
{
  return self->_elapsedTimeTimestamp;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (int64_t)mediaSubType
{
  return self->_mediaSubType;
}

- (void)setAlbumYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void)setComposer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void)setCollectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (BOOL)isPlayable
{
  return self->_playable;
}

- (void)setNowPlayingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (double)duration
{
  return self->_duration;
}

- (void)setPreferredFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (void)setParticipantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void)setParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (void)setAudioRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (void)setArtworkURLTemplates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void)setArtworkFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (void)setAlternativeFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 744);
}

- (void)setActiveFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void)setSeriesName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setRadioStationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void)setRadioStationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void)setPurchaseInfoData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void)setLyricsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void)setLocalizedDurationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void)setLocalizedContentRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setDurationStringLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void)setDirectorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void)setCurrentPlaybackDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void)setClassicalWork:(id)a3
{
  objc_storeStrong((id *)&self->_classicalWork, a3);
}

- (void)setBrandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setArtworkMIMEType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (void)setAppMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setPlayable:(BOOL)a3
{
  self->_playable = a3;
  self->_hasPlayable = 1;
}

- (void)setElapsedTime:(double)a3
{
  id v4;

  self->_elapsedTime = a3;
  self->_hasElapsedTime = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");

}

- (void)setPlaybackRate:(float)a3
{
  id v4;

  self->_playbackRate = a3;
  self->_hasPlaybackRate = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[MRContentItemMetadata setElapsedTimeTimestamp:](self, "setElapsedTimeTimestamp:");

}

- (void)setElapsedTimeTimestamp:(double)a3
{
  self->_elapsedTimeTimestamp = a3;
  self->_hasElapsedTimeTimestamp = 1;
}

- (int64_t)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (BOOL)artworkAvailable
{
  return self->_artworkAvailable;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
  self->_hasMediaType = 1;
}

- (void)setMediaSubType:(int64_t)a3
{
  self->_mediaSubType = a3;
  self->_hasMediaSubType = 1;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  self->_hasDuration = 1;
}

- (void)setArtworkAvailable:(BOOL)a3
{
  self->_artworkAvailable = a3;
  self->_hasArtworkAvailable = 1;
}

- (void)setLegacyUniqueIdentifier:(int64_t)a3
{
  self->_legacyUniqueIdentifier = a3;
  self->_hasLegacyUniqueIdentifier = 1;
}

- (int64_t)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (int64_t)iTunesStoreAlbumIdentifier
{
  return self->_iTunesStoreAlbumIdentifier;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (int64_t)episodeType
{
  return self->_episodeType;
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (BOOL)isStreamingContent
{
  return self->_streamingContent;
}

- (BOOL)isAlwaysLive
{
  return self->_alwaysLive;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setDefaultPlaybackRate:(float)a3
{
  self->_defaultPlaybackRate = a3;
  self->_hasDefaultPlaybackRate = 1;
}

- (void)setInfoAvailable:(BOOL)a3
{
  self->_infoAvailable = a3;
  self->_hasInfoAvailable = 1;
}

- (void)setEpisodeType:(int64_t)a3
{
  self->_episodeType = a3;
  self->_hasEpisodeType = 1;
}

- (void)setStreamingContent:(BOOL)a3
{
  self->_streamingContent = a3;
  self->_hasStreamingContent = 1;
}

- (void)setITunesStoreIdentifier:(int64_t)a3
{
  self->_iTunesStoreIdentifier = a3;
  self->_hasITunesStoreIdentifier = 1;
}

- (void)setITunesStoreAlbumIdentifier:(int64_t)a3
{
  self->_iTunesStoreAlbumIdentifier = a3;
  self->_hasITunesStoreAlbumIdentifier = 1;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
  self->_hasLoading = 1;
}

- (void)setAlwaysLive:(BOOL)a3
{
  self->_alwaysLive = a3;
  self->_hasAlwaysLive = 1;
}

- (int64_t)iTunesStoreArtistIdentifier
{
  return self->_iTunesStoreArtistIdentifier;
}

- (int64_t)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (int64_t)trackNumber
{
  return self->_trackNumber;
}

- (int64_t)iTunesStoreAlbumArtistIdentifier
{
  return self->_iTunesStoreAlbumArtistIdentifier;
}

- (void)setTrackNumber:(int64_t)a3
{
  self->_trackNumber = a3;
  self->_hasTrackNumber = 1;
}

- (void)setITunesStoreArtistIdentifier:(int64_t)a3
{
  self->_iTunesStoreArtistIdentifier = a3;
  self->_hasITunesStoreArtistIdentifier = 1;
}

- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3
{
  self->_iTunesStoreAlbumArtistIdentifier = a3;
  self->_hasITunesStoreAlbumArtistIdentifier = 1;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  self->_editingStyleFlags = a3;
  self->_hasEditingStyleFlags = 1;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (int64_t)iTunesStoreSubscriptionIdentifier
{
  return self->_iTunesStoreSubscriptionIdentifier;
}

- (BOOL)isExplicitItem
{
  return self->_explicitItem;
}

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

- (double)inferredTimestamp
{
  return self->_inferredTimestamp;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (unint64_t)songTraits
{
  return self->_songTraits;
}

- (unint64_t)formatTierPreference
{
  return self->_formatTierPreference;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (BOOL)isContainer
{
  return self->_container;
}

- (int64_t)activeFormatJustification
{
  return self->_activeFormatJustification;
}

- (void)setInferredTimestamp:(double)a3
{
  self->_inferredTimestamp = a3;
  self->_hasInferredTimestamp = 1;
}

- (int64_t)totalDiscCount
{
  return self->_totalDiscCount;
}

- (BOOL)lyricsAvailable
{
  return self->_lyricsAvailable;
}

- (int64_t)discNumber
{
  return self->_discNumber;
}

- (BOOL)languageOptionsAvailable
{
  return self->_languageOptionsAvailable;
}

- (int64_t)radioStationType
{
  return self->_radioStationType;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (int64_t)playlistType
{
  return self->_playlistType;
}

- (unint64_t)playlistTraits
{
  return self->_playlistTraits;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)isSteerable
{
  return self->_steerable;
}

- (BOOL)isSharable
{
  return self->_sharable;
}

- (BOOL)isResolvableParticipant
{
  return self->_isResolvableParticipant;
}

- (BOOL)isLiked
{
  return self->_liked;
}

- (BOOL)isInWishList
{
  return self->_inWishList;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_currentlyPlaying;
}

- (BOOL)isAdvertisement
{
  return self->_advertisement;
}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (int64_t)chapterCount
{
  return self->_chapterCount;
}

- (int64_t)artworkDataWidthDeprecated
{
  return self->_artworkDataWidthDeprecated;
}

- (int64_t)artworkDataHeightDeprecated
{
  return self->_artworkDataHeightDeprecated;
}

- (unint64_t)albumTraits
{
  return self->_albumTraits;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  id v128;
  void *v129;
  double v130;
  void *v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  NSDictionary *v147;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRContentItemMetadata hasContainer](self, "hasContainer"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isContainer](self, "isContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("container"));

  }
  if (-[MRContentItemMetadata hasPlayable](self, "hasPlayable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isPlayable](self, "isPlayable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("playable"));

  }
  if (-[MRContentItemMetadata hasExplicitItem](self, "hasExplicitItem"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("explicitItem"));

  }
  if (-[MRContentItemMetadata hasStreamingContent](self, "hasStreamingContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("streamingContent"));

  }
  if (-[MRContentItemMetadata hasCurrentlyPlaying](self, "hasCurrentlyPlaying"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("currentlyPlaying"));

  }
  if (-[MRContentItemMetadata hasAlwaysLive](self, "hasAlwaysLive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("alwaysLive"));

  }
  if (-[MRContentItemMetadata hasSharable](self, "hasSharable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isSharable](self, "isSharable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("sharable"));

  }
  if (-[MRContentItemMetadata hasLiked](self, "hasLiked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isLiked](self, "isLiked"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("liked"));

  }
  if (-[MRContentItemMetadata hasInWishList](self, "hasInWishList"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isInWishList](self, "isInWishList"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("inWishList"));

  }
  if (-[MRContentItemMetadata hasAdvertisement](self, "hasAdvertisement"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("advertisement"));

  }
  if (-[MRContentItemMetadata hasSteerable](self, "hasSteerable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isSteerable](self, "isSteerable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("steerable"));

  }
  if (-[MRContentItemMetadata hasLoading](self, "hasLoading"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isLoading](self, "isLoading"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("loading"));

  }
  if (-[MRContentItemMetadata hasInTransition](self, "hasInTransition"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isInTransition](self, "isInTransition"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("inTransition"));

  }
  if (-[MRContentItemMetadata hasArtworkAvailable](self, "hasArtworkAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("artworkAvailable"));

  }
  if (-[MRContentItemMetadata hasInfoAvailable](self, "hasInfoAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata infoAvailable](self, "infoAvailable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("infoAvailable"));

  }
  if (-[MRContentItemMetadata hasTranscriptAlignmentsAvailable](self, "hasTranscriptAlignmentsAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("transcriptAlignmentsAvailable"));

  }
  if (-[MRContentItemMetadata hasLanguageOptionsAvailable](self, "hasLanguageOptionsAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("languageOptionsAvailable"));

  }
  if (-[MRContentItemMetadata hasLyricsAvailable](self, "hasLyricsAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("lyricsAvailable"));

  }
  if (-[MRContentItemMetadata hasPlaybackProgress](self, "hasPlaybackProgress"))
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata playbackProgress](self, "playbackProgress");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("playbackProgress"));

  }
  if (-[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata playbackRate](self, "playbackRate");
    objc_msgSend(v24, "numberWithFloat:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("playbackRate"));

  }
  if (-[MRContentItemMetadata hasDefaultPlaybackRate](self, "hasDefaultPlaybackRate"))
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata defaultPlaybackRate](self, "defaultPlaybackRate");
    objc_msgSend(v26, "numberWithFloat:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("defaultPlaybackRate"));

  }
  if (-[MRContentItemMetadata hasDownloadProgress](self, "hasDownloadProgress"))
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata downloadProgress](self, "downloadProgress");
    objc_msgSend(v28, "numberWithFloat:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("downloadProgress"));

  }
  if (-[MRContentItemMetadata hasPlaylistType](self, "hasPlaylistType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata playlistType](self, "playlistType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("playlistType"));

  }
  if (-[MRContentItemMetadata hasRadioStationType](self, "hasRadioStationType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata radioStationType](self, "radioStationType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("radioStationType"));

  }
  if (-[MRContentItemMetadata hasEditingStyleFlags](self, "hasEditingStyleFlags"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("editingStyleFlags"));

  }
  if (-[MRContentItemMetadata hasMediaType](self, "hasMediaType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata mediaType](self, "mediaType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("mediaType"));

  }
  if (-[MRContentItemMetadata hasMediaSubType](self, "hasMediaSubType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata mediaSubType](self, "mediaSubType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("mediaSubType"));

  }
  if (-[MRContentItemMetadata hasEpisodeType](self, "hasEpisodeType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata episodeType](self, "episodeType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("episodeType"));

  }
  if (-[MRContentItemMetadata hasPlayCount](self, "hasPlayCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata playCount](self, "playCount"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("playCount"));

  }
  if (-[MRContentItemMetadata hasNumberOfSections](self, "hasNumberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata numberOfSections](self, "numberOfSections"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("numberOfSections"));

  }
  if (-[MRContentItemMetadata hasChapterCount](self, "hasChapterCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata chapterCount](self, "chapterCount"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("chapterCount"));

  }
  if (-[MRContentItemMetadata hasTotalDiscCount](self, "hasTotalDiscCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("totalDiscCount"));

  }
  if (-[MRContentItemMetadata hasTotalTrackCount](self, "hasTotalTrackCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("totalTrackCount"));

  }
  if (-[MRContentItemMetadata hasDownloadState](self, "hasDownloadState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata downloadState](self, "downloadState"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("downloadState"));

  }
  if (-[MRContentItemMetadata hasDuration](self, "hasDuration"))
  {
    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata duration](self, "duration");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("duration"));

  }
  if (-[MRContentItemMetadata hasStartTime](self, "hasStartTime"))
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata startTime](self, "startTime");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("startTime"));

  }
  if (-[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
  {
    v46 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
    objc_msgSend(v46, "numberWithDouble:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("elapsedTime"));

  }
  if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
  {
    v48 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
    objc_msgSend(v48, "numberWithDouble:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("elapsedTimeTimestamp"));

  }
  if (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
  {
    v50 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
    objc_msgSend(v50, "numberWithDouble:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("inferredTimestamp"));

  }
  if (-[MRContentItemMetadata hasSeasonNumber](self, "hasSeasonNumber"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata seasonNumber](self, "seasonNumber"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("seasonNumber"));

  }
  if (-[MRContentItemMetadata hasEpisodeNumber](self, "hasEpisodeNumber"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata episodeNumber](self, "episodeNumber"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("episodeNumber"));

  }
  if (-[MRContentItemMetadata hasDiscNumber](self, "hasDiscNumber"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata discNumber](self, "discNumber"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("discNumber"));

  }
  if (-[MRContentItemMetadata hasTrackNumber](self, "hasTrackNumber"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata trackNumber](self, "trackNumber"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("trackNumber"));

  }
  if (-[MRContentItemMetadata hasRadioStationIdentifier](self, "hasRadioStationIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("radioStationIdentifier"));

  }
  if (-[MRContentItemMetadata hasITunesStoreIdentifier](self, "hasITunesStoreIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("iTunesStoreIdentifier"));

  }
  if (-[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](self, "hasITunesStoreSubscriptionIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("iTunesStoreSubscriptionIdentifier"));

  }
  if (-[MRContentItemMetadata hasITunesStoreArtistIdentifier](self, "hasITunesStoreArtistIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("iTunesStoreArtistIdentifier"));

  }
  if (-[MRContentItemMetadata hasITunesStoreAlbumIdentifier](self, "hasITunesStoreAlbumIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("iTunesStoreAlbumIdentifier"));

  }
  if (-[MRContentItemMetadata hasLegacyUniqueIdentifier](self, "hasLegacyUniqueIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("legacyUniqueIdentifier"));

  }
  if (-[MRContentItemMetadata hasSongTraits](self, "hasSongTraits"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRContentItemMetadata songTraits](self, "songTraits"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("songTraits"));

  }
  if (-[MRContentItemMetadata hasAlbumTraits](self, "hasAlbumTraits"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRContentItemMetadata albumTraits](self, "albumTraits"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("albumTraits"));

  }
  if (-[MRContentItemMetadata hasPlaylistTraits](self, "hasPlaylistTraits"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRContentItemMetadata playlistTraits](self, "playlistTraits"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("playlistTraits"));

  }
  if (-[MRContentItemMetadata hasActiveFormatJustification](self, "hasActiveFormatJustification"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("activeFormatJustification"));

  }
  if (-[MRContentItemMetadata hasFormatTierPreference](self, "hasFormatTierPreference"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("formatTierPreference"));

  }
  -[MRContentItemMetadata purchaseInfoData](self, "purchaseInfoData");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("purchaseInfoData"));

  -[MRContentItemMetadata appMetrics](self, "appMetrics");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("appMetrics"));

  -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("nowPlayingInfo"));

  -[MRContentItemMetadata userInfo](self, "userInfo");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("userInfo"));

  -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("deviceSpecificUserInfo"));

  -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("collectionInfo"));

  -[MRContentItemMetadata releaseDate](self, "releaseDate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("releaseDate"));

  -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v74, CFSTR("currentPlaybackDate"));

  -[MRContentItemMetadata title](self, "title");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("title"));

  -[MRContentItemMetadata subtitle](self, "subtitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("subtitle"));

  -[MRContentItemMetadata albumName](self, "albumName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v77, CFSTR("albumName"));

  -[MRContentItemMetadata trackArtistName](self, "trackArtistName");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("trackArtistName"));

  -[MRContentItemMetadata albumArtistName](self, "albumArtistName");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("albumArtistName"));

  -[MRContentItemMetadata directorName](self, "directorName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("directorName"));

  -[MRContentItemMetadata localizedContentRating](self, "localizedContentRating");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("localizedContentRating"));

  -[MRContentItemMetadata collectionIdentifier](self, "collectionIdentifier");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("collectionIdentifier"));

  -[MRContentItemMetadata profileIdentifier](self, "profileIdentifier");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("profileIdentifier"));

  -[MRContentItemMetadata assetURL](self, "assetURL");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("assetURL"));

  -[MRContentItemMetadata composer](self, "composer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v85, CFSTR("composer"));

  -[MRContentItemMetadata genre](self, "genre");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v86, CFSTR("genre"));

  -[MRContentItemMetadata contentIdentifier](self, "contentIdentifier");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("contentIdentifier"));

  -[MRContentItemMetadata radioStationName](self, "radioStationName");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("radioStationName"));

  -[MRContentItemMetadata radioStationString](self, "radioStationString");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("radioStationString"));

  -[MRContentItemMetadata seriesName](self, "seriesName");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("seriesName"));

  -[MRContentItemMetadata lyricsURL](self, "lyricsURL");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("lyricsURL"));

  -[MRContentItemMetadata serviceIdentifier](self, "serviceIdentifier");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v92, CFSTR("serviceIdentifier"));

  -[MRContentItemMetadata brandIdentifier](self, "brandIdentifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("brandIdentifier"));

  -[MRContentItemMetadata localizedDurationString](self, "localizedDurationString");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("localizedDurationString"));

  -[MRContentItemMetadata artworkIdentifier](self, "artworkIdentifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("artworkIdentifier"));

  -[MRContentItemMetadata artworkMIMEType](self, "artworkMIMEType");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("artworkMIMEType"));

  -[MRContentItemMetadata artworkURL](self, "artworkURL");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("artworkURL"));

  -[MRContentItemMetadata artworkFileURL](self, "artworkFileURL");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("artworkFileURL"));

  -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("artworkURLTemplates"));

  -[MRContentItemMetadata albumYear](self, "albumYear");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("albumYear"));

  -[MRContentItemMetadata participantName](self, "participantName");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("participantName"));

  -[MRContentItemMetadata participantIdentifier](self, "participantIdentifier");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("participantIdentifier"));

  -[MRContentItemMetadata internationalStandardRecordingCode](self, "internationalStandardRecordingCode");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("internationalStandardRecordingCode"));

  if (-[MRContentItemMetadata hasIsResolvableParticipant](self, "hasIsResolvableParticipant"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("isResolvableParticipant"));

  }
  if (-[MRContentItemMetadata hasExcludeFromSuggestions](self, "hasExcludeFromSuggestions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("excludeFromSuggestions"));

  }
  -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "dictionaryRepresentation");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("preferredFormat"));

  }
  -[MRContentItemMetadata activeFormat](self, "activeFormat");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    -[MRContentItemMetadata activeFormat](self, "activeFormat");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "dictionaryRepresentation");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v111, CFSTR("activeFormat"));

  }
  -[MRContentItemMetadata audioRoute](self, "audioRoute");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    -[MRContentItemMetadata audioRoute](self, "audioRoute");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "dictionaryRepresentation");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v114, CFSTR("audioRoute"));

  }
  -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "msv_map:", &__block_literal_global_207);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("alternativeFormats"));

  }
  if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
  {
    v118 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
    v119 = (void *)objc_msgSend(v118, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v119, CFSTR("elapsedTimeTimestamp"));

  }
  if (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
  {
    v120 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
    v121 = (void *)objc_msgSend(v120, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v121, CFSTR("inferredTimestamp"));

  }
  if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp")
    || -[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
  {
    if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
      -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
    else
      -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
    v123 = v122;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "timeIntervalSinceReferenceDate");
    v126 = v125 - v123;

    v127 = (void *)MRCreateDurationStringRepresentation(v126);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v127, CFSTR("custom: delta"));

  }
  if (-[MRContentItemMetadata hasStartTime](self, "hasStartTime"))
  {
    v128 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[MRContentItemMetadata startTime](self, "startTime");
    v129 = (void *)objc_msgSend(v128, "initWithTimeIntervalSinceReferenceDate:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v129, CFSTR("startTime"));

  }
  if (-[MRContentItemMetadata hasDuration](self, "hasDuration"))
  {
    -[MRContentItemMetadata duration](self, "duration");
    v131 = (void *)MRCreateDurationStringRepresentation(v130);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v131, CFSTR("duration"));

  }
  if (-[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
  {
    -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
    v133 = (void *)MRCreateDurationStringRepresentation(v132);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v133, CFSTR("elapsedTime"));

  }
  if (-[MRContentItemMetadata hasDuration](self, "hasDuration")
    && -[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
  {
    -[MRContentItemMetadata duration](self, "duration");
    v135 = v134;
    -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
    v137 = (void *)MRCreateDurationStringRepresentation(v135 - v136);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v137, CFSTR("custom: remainingTime"));

  }
  if (-[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime")
    && (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp")
     || -[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp")))
  {
    -[MRContentItemMetadata calculatedPlaybackPosition](self, "calculatedPlaybackPosition");
    v139 = (void *)MRCreateDurationStringRepresentation(v138);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v139, CFSTR("custom: calculatedElapsedTime"));

  }
  if (-[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
  {
    v140 = (void *)MEMORY[0x1E0CB37E8];
    -[MRContentItemMetadata playbackRate](self, "playbackRate");
    objc_msgSend(v140, "numberWithFloat:");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v141, CFSTR("__playbackRate"));

  }
  -[MRContentItemMetadata title](self, "title");
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    -[MRContentItemMetadata title](self, "title");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v143, CFSTR("__title"));

  }
  if (-[MRContentItemMetadata hasReportingAdamID](self, "hasReportingAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v144, CFSTR("reportingAdamID"));

  }
  if (-[MRContentItemMetadata hasLyricsAdamID](self, "hasLyricsAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v145, CFSTR("lyricsAdamID"));

  }
  if (-[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](self, "hasITunesStoreAlbumArtistIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v146, CFSTR("iTunesStoreAlbumArtistIdentifier"));

  }
  v147 = (NSDictionary *)v3;

  return v147;
}

- (MRContentItemMetadata)initWithProtobuf:(id)a3
{
  id v4;
  MRContentItemMetadata *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSString *classicalWork;
  void *v17;
  uint64_t v18;
  NSDate *releaseDate;
  MRContentItemMetadata *v20;
  void *v21;
  uint64_t v22;
  NSDate *currentPlaybackDate;
  void *v24;
  uint64_t v25;
  NSDictionary *appMetrics;
  void *v27;
  uint64_t v28;
  NSDictionary *nowPlayingInfo;
  void *v30;
  uint64_t v31;
  NSDictionary *userInfo;
  void *v33;
  uint64_t v34;
  NSDictionary *deviceSpecificUserInfo;
  void *v36;
  uint64_t v37;
  NSDictionary *collectionInfo;
  void *v39;
  uint64_t v40;
  NSData *purchaseInfoData;
  void *v42;
  uint64_t v43;
  NSString *title;
  void *v45;
  uint64_t v46;
  NSString *subtitle;
  void *v48;
  uint64_t v49;
  NSString *albumName;
  void *v51;
  uint64_t v52;
  NSString *trackArtistName;
  void *v54;
  uint64_t v55;
  NSString *albumArtistName;
  void *v57;
  uint64_t v58;
  NSString *directorName;
  void *v60;
  uint64_t v61;
  NSString *localizedContentRating;
  void *v63;
  uint64_t v64;
  NSString *collectionIdentifier;
  void *v66;
  uint64_t v67;
  NSString *profileIdentifier;
  void *v69;
  uint64_t v70;
  NSString *composer;
  void *v72;
  uint64_t v73;
  NSString *genre;
  void *v75;
  uint64_t v76;
  NSString *contentIdentifier;
  void *v78;
  uint64_t v79;
  NSString *radioStationName;
  void *v81;
  uint64_t v82;
  NSString *radioStationString;
  void *v84;
  uint64_t v85;
  NSString *seriesName;
  id v87;
  void *v88;
  uint64_t v89;
  NSURL *lyricsURL;
  void *v91;
  uint64_t v92;
  NSString *serviceIdentifier;
  void *v94;
  uint64_t v95;
  NSString *brandIdentifier;
  void *v97;
  uint64_t v98;
  NSString *localizedDurationString;
  void *v100;
  uint64_t v101;
  NSString *durationStringLocalizationKey;
  void *v103;
  uint64_t v104;
  NSString *artworkIdentifier;
  void *v106;
  uint64_t v107;
  NSString *artworkMIMEType;
  void *v109;
  uint64_t v110;
  NSString *albumYear;
  id v112;
  void *v113;
  uint64_t v114;
  NSURL *assetURL;
  id v116;
  void *v117;
  uint64_t v118;
  NSURL *artworkURL;
  id v120;
  void *v121;
  uint64_t v122;
  NSURL *artworkFileURL;
  void *v124;
  uint64_t v125;
  NSString *internationalStandardRecordingCode;
  uint64_t v127;
  NSString *participantName;
  uint64_t v129;
  NSString *participantIdentifier;
  MRContentItemMetadataAudioFormat *v131;
  void *v132;
  uint64_t v133;
  MRContentItemMetadataAudioFormat *preferredFormat;
  MRContentItemMetadataAudioFormat *v135;
  void *v136;
  uint64_t v137;
  MRContentItemMetadataAudioFormat *activeFormat;
  MRContentItemMetadataAudioRoute *v139;
  void *v140;
  uint64_t v141;
  MRContentItemMetadataAudioRoute *audioRoute;
  void *v143;
  uint64_t v144;
  NSArray *alternativeFormats;
  void *v146;
  uint64_t v147;
  NSArray *artworkURLTemplates;
  objc_super v150;

  v4 = a3;
  if (v4)
  {
    v150.receiver = self;
    v150.super_class = (Class)MRContentItemMetadata;
    v5 = -[MRContentItemMetadata init](&v150, sel_init);
    if (v5)
    {
      v5->_container = objc_msgSend(v4, "isContainer");
      v5->_hasContainer = objc_msgSend(v4, "hasIsContainer");
      v5->_playable = objc_msgSend(v4, "isPlayable");
      v5->_hasPlayable = objc_msgSend(v4, "hasIsPlayable");
      v5->_explicitItem = objc_msgSend(v4, "isExplicitItem");
      v5->_hasExplicitItem = objc_msgSend(v4, "hasIsExplicitItem");
      v5->_streamingContent = objc_msgSend(v4, "isStreamingContent");
      v5->_hasStreamingContent = objc_msgSend(v4, "hasIsStreamingContent");
      v5->_currentlyPlaying = objc_msgSend(v4, "isCurrentlyPlaying");
      v5->_hasCurrentlyPlaying = objc_msgSend(v4, "hasIsCurrentlyPlaying");
      v5->_alwaysLive = objc_msgSend(v4, "isAlwaysLive");
      v5->_hasAlwaysLive = objc_msgSend(v4, "hasIsAlwaysLive");
      v5->_sharable = objc_msgSend(v4, "isSharable");
      v5->_hasSharable = objc_msgSend(v4, "hasIsSharable");
      v5->_liked = objc_msgSend(v4, "isLiked");
      v5->_hasLiked = objc_msgSend(v4, "hasIsLiked");
      v5->_inWishList = objc_msgSend(v4, "isInWishList");
      v5->_hasInWishList = objc_msgSend(v4, "hasIsInWishList");
      v5->_advertisement = objc_msgSend(v4, "isAdvertisement");
      v5->_hasAdvertisement = objc_msgSend(v4, "hasIsAdvertisement");
      v5->_steerable = objc_msgSend(v4, "isSteerable");
      v5->_hasSteerable = objc_msgSend(v4, "hasIsSteerable");
      v5->_loading = objc_msgSend(v4, "isLoading");
      v5->_hasLoading = objc_msgSend(v4, "hasIsLoading");
      v5->_inTransition = objc_msgSend(v4, "isInTransition");
      v5->_hasInTransition = objc_msgSend(v4, "hasIsInTransition");
      v5->_artworkAvailable = objc_msgSend(v4, "artworkAvailable");
      v5->_hasArtworkAvailable = objc_msgSend(v4, "hasArtworkAvailable");
      v5->_infoAvailable = objc_msgSend(v4, "infoAvailable");
      v5->_hasInfoAvailable = objc_msgSend(v4, "hasInfoAvailable");
      v5->_transcriptAlignmentsAvailable = objc_msgSend(v4, "transcriptAlignmentsAvailable");
      v5->_hasTranscriptAlignmentsAvailable = objc_msgSend(v4, "hasTranscriptAlignmentsAvailable");
      v5->_languageOptionsAvailable = objc_msgSend(v4, "languageOptionsAvailable");
      v5->_hasLanguageOptionsAvailable = objc_msgSend(v4, "hasLanguageOptionsAvailable");
      v5->_lyricsAvailable = objc_msgSend(v4, "lyricsAvailable");
      v5->_hasLyricsAvailable = objc_msgSend(v4, "hasLyricsAvailable");
      objc_msgSend(v4, "playbackProgress");
      v5->_playbackProgress = v6;
      v5->_hasPlaybackProgress = objc_msgSend(v4, "hasPlaybackProgress");
      objc_msgSend(v4, "playbackRate");
      v5->_playbackRate = v7;
      v5->_hasPlaybackRate = objc_msgSend(v4, "hasPlaybackRate");
      objc_msgSend(v4, "defaultPlaybackRate");
      v5->_defaultPlaybackRate = v8;
      v5->_hasDefaultPlaybackRate = objc_msgSend(v4, "hasDefaultPlaybackRate");
      objc_msgSend(v4, "downloadProgress");
      v5->_downloadProgress = v9;
      v5->_hasDownloadProgress = objc_msgSend(v4, "hasDownloadProgress");
      v5->_playlistType = (int)objc_msgSend(v4, "playlistType");
      v5->_hasPlaylistType = objc_msgSend(v4, "hasPlaylistType");
      v5->_radioStationType = (int)objc_msgSend(v4, "radioStationType");
      v5->_hasRadioStationType = objc_msgSend(v4, "hasRadioStationType");
      v5->_editingStyleFlags = (int)objc_msgSend(v4, "editingStyleFlags");
      v5->_hasEditingStyleFlags = objc_msgSend(v4, "hasEditingStyleFlags");
      v5->_mediaType = (int)objc_msgSend(v4, "mediaType");
      v5->_hasMediaType = objc_msgSend(v4, "hasMediaType");
      v5->_mediaSubType = (int)objc_msgSend(v4, "mediaSubType");
      v5->_hasMediaSubType = objc_msgSend(v4, "hasMediaSubType");
      v5->_episodeType = (int)objc_msgSend(v4, "episodeType");
      v5->_hasEpisodeType = objc_msgSend(v4, "hasEpisodeType");
      v5->_playCount = (int)objc_msgSend(v4, "playCount");
      v5->_hasPlayCount = objc_msgSend(v4, "hasPlayCount");
      v5->_numberOfSections = (int)objc_msgSend(v4, "numberOfSections");
      v5->_hasNumberOfSections = objc_msgSend(v4, "hasNumberOfSections");
      v5->_chapterCount = (int)objc_msgSend(v4, "chapterCount");
      v5->_hasChapterCount = objc_msgSend(v4, "hasChapterCount");
      v5->_totalDiscCount = (int)objc_msgSend(v4, "totalDiscCount");
      v5->_hasTotalDiscCount = objc_msgSend(v4, "hasTotalDiscCount");
      v5->_totalTrackCount = (int)objc_msgSend(v4, "totalTrackCount");
      v5->_hasTotalTrackCount = objc_msgSend(v4, "hasTotalTrackCount");
      v5->_downloadState = (int)objc_msgSend(v4, "downloadState");
      v5->_hasDownloadState = objc_msgSend(v4, "hasDownloadState");
      v5->_artworkDataWidthDeprecated = (int)objc_msgSend(v4, "artworkDataWidthDeprecated");
      v5->_hasArtworkDataWidthDeprecated = objc_msgSend(v4, "hasArtworkDataWidthDeprecated");
      v5->_artworkDataHeightDeprecated = (int)objc_msgSend(v4, "artworkDataHeightDeprecated");
      v5->_hasArtworkDataHeightDeprecated = objc_msgSend(v4, "hasArtworkDataHeightDeprecated");
      objc_msgSend(v4, "duration");
      v5->_duration = v10;
      v5->_hasDuration = objc_msgSend(v4, "hasDuration");
      objc_msgSend(v4, "startTime");
      v5->_startTime = v11;
      v5->_hasStartTime = objc_msgSend(v4, "hasStartTime");
      objc_msgSend(v4, "elapsedTime");
      v5->_elapsedTime = v12;
      v5->_hasElapsedTime = objc_msgSend(v4, "hasElapsedTime");
      objc_msgSend(v4, "elapsedTimeTimestamp");
      v5->_elapsedTimeTimestamp = v13;
      v5->_hasElapsedTimeTimestamp = objc_msgSend(v4, "hasElapsedTimeTimestamp");
      objc_msgSend(v4, "inferredTimestamp");
      v5->_inferredTimestamp = v14;
      v5->_hasInferredTimestamp = objc_msgSend(v4, "hasInferredTimestamp");
      v5->_seasonNumber = (int)objc_msgSend(v4, "seasonNumber");
      v5->_hasSeasonNumber = objc_msgSend(v4, "hasSeasonNumber");
      v5->_episodeNumber = (int)objc_msgSend(v4, "episodeNumber");
      v5->_hasEpisodeNumber = objc_msgSend(v4, "hasEpisodeNumber");
      v5->_discNumber = (int)objc_msgSend(v4, "discNumber");
      v5->_hasDiscNumber = objc_msgSend(v4, "hasDiscNumber");
      v5->_trackNumber = (int)objc_msgSend(v4, "trackNumber");
      v5->_hasTrackNumber = objc_msgSend(v4, "hasTrackNumber");
      v5->_radioStationIdentifier = objc_msgSend(v4, "radioStationIdentifier");
      v5->_hasRadioStationIdentifier = objc_msgSend(v4, "hasRadioStationIdentifier");
      v5->_iTunesStoreIdentifier = objc_msgSend(v4, "iTunesStoreIdentifier");
      v5->_hasITunesStoreIdentifier = objc_msgSend(v4, "hasITunesStoreIdentifier");
      v5->_iTunesStoreSubscriptionIdentifier = objc_msgSend(v4, "iTunesStoreSubscriptionIdentifier");
      v5->_hasITunesStoreSubscriptionIdentifier = objc_msgSend(v4, "hasITunesStoreSubscriptionIdentifier");
      v5->_iTunesStoreArtistIdentifier = objc_msgSend(v4, "iTunesStoreArtistIdentifier");
      v5->_hasITunesStoreArtistIdentifier = objc_msgSend(v4, "hasITunesStoreArtistIdentifier");
      v5->_iTunesStoreAlbumIdentifier = objc_msgSend(v4, "iTunesStoreAlbumIdentifier");
      v5->_hasITunesStoreAlbumIdentifier = objc_msgSend(v4, "hasITunesStoreAlbumIdentifier");
      v5->_legacyUniqueIdentifier = objc_msgSend(v4, "legacyUniqueIdentifier");
      v5->_hasLegacyUniqueIdentifier = objc_msgSend(v4, "hasLegacyUniqueIdentifier");
      objc_msgSend(v4, "classicalWork");
      v15 = objc_claimAutoreleasedReturnValue();
      classicalWork = v5->_classicalWork;
      v5->_classicalWork = (NSString *)v15;

      if ((objc_msgSend(v4, "hasReleaseDate") & 1) != 0)
      {
        v17 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "releaseDate");
        objc_msgSend(v17, "dateWithTimeIntervalSince1970:");
        v18 = objc_claimAutoreleasedReturnValue();
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = (NSDate *)v18;
      }
      else
      {
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = 0;
      }

      if ((objc_msgSend(v4, "hasCurrentPlaybackDateData") & 1) != 0)
      {
        objc_msgSend(v4, "currentPlaybackDateData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v21, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        currentPlaybackDate = v5->_currentPlaybackDate;
        v5->_currentPlaybackDate = (NSDate *)v22;

      }
      else
      {
        v21 = v5->_currentPlaybackDate;
        v5->_currentPlaybackDate = 0;
      }

      if ((objc_msgSend(v4, "hasAppMetricsData") & 1) != 0)
      {
        objc_msgSend(v4, "appMetricsData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v24, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        appMetrics = v5->_appMetrics;
        v5->_appMetrics = (NSDictionary *)v25;

      }
      else
      {
        v24 = v5->_appMetrics;
        v5->_appMetrics = 0;
      }

      if ((objc_msgSend(v4, "hasNowPlayingInfoData") & 1) != 0)
      {
        objc_msgSend(v4, "nowPlayingInfoData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v27, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        nowPlayingInfo = v5->_nowPlayingInfo;
        v5->_nowPlayingInfo = (NSDictionary *)v28;

      }
      else
      {
        v27 = v5->_nowPlayingInfo;
        v5->_nowPlayingInfo = 0;
      }

      if ((objc_msgSend(v4, "hasUserInfoData") & 1) != 0)
      {
        objc_msgSend(v4, "userInfoData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v30, 0);
        v31 = objc_claimAutoreleasedReturnValue();
        userInfo = v5->_userInfo;
        v5->_userInfo = (NSDictionary *)v31;

      }
      else
      {
        v30 = v5->_userInfo;
        v5->_userInfo = 0;
      }

      if ((objc_msgSend(v4, "hasDeviceSpecificUserInfoData") & 1) != 0)
      {
        objc_msgSend(v4, "deviceSpecificUserInfoData");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v33, 0);
        v34 = objc_claimAutoreleasedReturnValue();
        deviceSpecificUserInfo = v5->_deviceSpecificUserInfo;
        v5->_deviceSpecificUserInfo = (NSDictionary *)v34;

      }
      else
      {
        v33 = v5->_deviceSpecificUserInfo;
        v5->_deviceSpecificUserInfo = 0;
      }

      if ((objc_msgSend(v4, "hasCollectionInfoData") & 1) != 0)
      {
        objc_msgSend(v4, "collectionInfoData");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v36, 0);
        v37 = objc_claimAutoreleasedReturnValue();
        collectionInfo = v5->_collectionInfo;
        v5->_collectionInfo = (NSDictionary *)v37;

      }
      else
      {
        v36 = v5->_collectionInfo;
        v5->_collectionInfo = 0;
      }

      objc_msgSend(v4, "purchaseInfoData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "copy");
      purchaseInfoData = v5->_purchaseInfoData;
      v5->_purchaseInfoData = (NSData *)v40;

      objc_msgSend(v4, "title");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v43;

      objc_msgSend(v4, "subtitle");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "copy");
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v46;

      objc_msgSend(v4, "albumName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "copy");
      albumName = v5->_albumName;
      v5->_albumName = (NSString *)v49;

      objc_msgSend(v4, "trackArtistName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "copy");
      trackArtistName = v5->_trackArtistName;
      v5->_trackArtistName = (NSString *)v52;

      objc_msgSend(v4, "albumArtistName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "copy");
      albumArtistName = v5->_albumArtistName;
      v5->_albumArtistName = (NSString *)v55;

      objc_msgSend(v4, "directorName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "copy");
      directorName = v5->_directorName;
      v5->_directorName = (NSString *)v58;

      objc_msgSend(v4, "localizedContentRating");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "copy");
      localizedContentRating = v5->_localizedContentRating;
      v5->_localizedContentRating = (NSString *)v61;

      objc_msgSend(v4, "collectionIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "copy");
      collectionIdentifier = v5->_collectionIdentifier;
      v5->_collectionIdentifier = (NSString *)v64;

      objc_msgSend(v4, "profileIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "copy");
      profileIdentifier = v5->_profileIdentifier;
      v5->_profileIdentifier = (NSString *)v67;

      objc_msgSend(v4, "composer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "copy");
      composer = v5->_composer;
      v5->_composer = (NSString *)v70;

      objc_msgSend(v4, "genre");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "copy");
      genre = v5->_genre;
      v5->_genre = (NSString *)v73;

      objc_msgSend(v4, "contentIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "copy");
      contentIdentifier = v5->_contentIdentifier;
      v5->_contentIdentifier = (NSString *)v76;

      objc_msgSend(v4, "radioStationName");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "copy");
      radioStationName = v5->_radioStationName;
      v5->_radioStationName = (NSString *)v79;

      objc_msgSend(v4, "radioStationString");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "copy");
      radioStationString = v5->_radioStationString;
      v5->_radioStationString = (NSString *)v82;

      objc_msgSend(v4, "seriesName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "copy");
      seriesName = v5->_seriesName;
      v5->_seriesName = (NSString *)v85;

      if ((objc_msgSend(v4, "hasLyricsURL") & 1) != 0)
      {
        v87 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "lyricsURL");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v87, "initWithString:", v88);
        lyricsURL = v5->_lyricsURL;
        v5->_lyricsURL = (NSURL *)v89;

      }
      else
      {
        v88 = v5->_lyricsURL;
        v5->_lyricsURL = 0;
      }

      objc_msgSend(v4, "serviceIdentifier");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "copy");
      serviceIdentifier = v5->_serviceIdentifier;
      v5->_serviceIdentifier = (NSString *)v92;

      objc_msgSend(v4, "brandIdentifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "copy");
      brandIdentifier = v5->_brandIdentifier;
      v5->_brandIdentifier = (NSString *)v95;

      objc_msgSend(v4, "localizedDurationString");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "copy");
      localizedDurationString = v5->_localizedDurationString;
      v5->_localizedDurationString = (NSString *)v98;

      objc_msgSend(v4, "durationStringLocalizationKey");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = objc_msgSend(v100, "copy");
      durationStringLocalizationKey = v5->_durationStringLocalizationKey;
      v5->_durationStringLocalizationKey = (NSString *)v101;

      objc_msgSend(v4, "artworkIdentifier");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v103, "copy");
      artworkIdentifier = v5->_artworkIdentifier;
      v5->_artworkIdentifier = (NSString *)v104;

      objc_msgSend(v4, "artworkMIMEType");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v106, "copy");
      artworkMIMEType = v5->_artworkMIMEType;
      v5->_artworkMIMEType = (NSString *)v107;

      objc_msgSend(v4, "albumYear");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v109, "copy");
      albumYear = v5->_albumYear;
      v5->_albumYear = (NSString *)v110;

      if ((objc_msgSend(v4, "hasAssetURLString") & 1) != 0)
      {
        v112 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "assetURLString");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v112, "initWithString:", v113);
        assetURL = v5->_assetURL;
        v5->_assetURL = (NSURL *)v114;

      }
      else
      {
        v113 = v5->_assetURL;
        v5->_assetURL = 0;
      }

      if ((objc_msgSend(v4, "hasArtworkURL") & 1) != 0)
      {
        v116 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "artworkURL");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v116, "initWithString:", v117);
        artworkURL = v5->_artworkURL;
        v5->_artworkURL = (NSURL *)v118;

      }
      else
      {
        v117 = v5->_artworkURL;
        v5->_artworkURL = 0;
      }

      if ((objc_msgSend(v4, "hasArtworkFileURL") & 1) != 0)
      {
        v120 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v4, "artworkFileURL");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v120, "initWithString:", v121);
        artworkFileURL = v5->_artworkFileURL;
        v5->_artworkFileURL = (NSURL *)v122;

      }
      else
      {
        v121 = v5->_artworkFileURL;
        v5->_artworkFileURL = 0;
      }

      objc_msgSend(v4, "internationalStandardRecordingCode");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "copy");
      internationalStandardRecordingCode = v5->_internationalStandardRecordingCode;
      v5->_internationalStandardRecordingCode = (NSString *)v125;

      if ((objc_msgSend(v4, "hasParticipantName") & 1) != 0)
      {
        objc_msgSend(v4, "participantName");
        v127 = objc_claimAutoreleasedReturnValue();
        participantName = v5->_participantName;
        v5->_participantName = (NSString *)v127;
      }
      else
      {
        participantName = v5->_participantName;
        v5->_participantName = 0;
      }

      if ((objc_msgSend(v4, "hasParticipantIdentifier") & 1) != 0)
      {
        objc_msgSend(v4, "participantIdentifier");
        v129 = objc_claimAutoreleasedReturnValue();
        participantIdentifier = v5->_participantIdentifier;
        v5->_participantIdentifier = (NSString *)v129;
      }
      else
      {
        participantIdentifier = v5->_participantIdentifier;
        v5->_participantIdentifier = 0;
      }

      v5->_isResolvableParticipant = objc_msgSend(v4, "isResolvableParticipant");
      v5->_hasIsResolvableParticipant = objc_msgSend(v4, "hasIsResolvableParticipant");
      v5->_excludeFromSuggestions = objc_msgSend(v4, "excludeFromSuggestions");
      v5->_hasExcludeFromSuggestions = objc_msgSend(v4, "hasExcludeFromSuggestions");
      v5->_songTraits = (int)objc_msgSend(v4, "songTraits");
      v5->_hasSongTraits = objc_msgSend(v4, "hasSongTraits");
      v5->_albumTraits = (int)objc_msgSend(v4, "albumTraits");
      v5->_hasAlbumTraits = objc_msgSend(v4, "hasAlbumTraits");
      v5->_playlistTraits = (int)objc_msgSend(v4, "playlistTraits");
      v5->_hasPlaylistTraits = objc_msgSend(v4, "hasPlaylistTraits");
      if ((objc_msgSend(v4, "hasPreferredFormat") & 1) != 0)
      {
        v131 = [MRContentItemMetadataAudioFormat alloc];
        objc_msgSend(v4, "preferredFormat");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = -[MRContentItemMetadataAudioFormat initWithProtobuf:](v131, "initWithProtobuf:", v132);
        preferredFormat = v5->_preferredFormat;
        v5->_preferredFormat = (MRContentItemMetadataAudioFormat *)v133;

      }
      else
      {
        v132 = v5->_preferredFormat;
        v5->_preferredFormat = 0;
      }

      if ((objc_msgSend(v4, "hasActiveFormat") & 1) != 0)
      {
        v135 = [MRContentItemMetadataAudioFormat alloc];
        objc_msgSend(v4, "activeFormat");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = -[MRContentItemMetadataAudioFormat initWithProtobuf:](v135, "initWithProtobuf:", v136);
        activeFormat = v5->_activeFormat;
        v5->_activeFormat = (MRContentItemMetadataAudioFormat *)v137;

      }
      else
      {
        v136 = v5->_activeFormat;
        v5->_activeFormat = 0;
      }

      v5->_activeFormatJustification = (int)objc_msgSend(v4, "activeFormatJustification");
      v5->_hasActiveFormatJustification = objc_msgSend(v4, "hasActiveFormatJustification");
      v5->_formatTierPreference = (int)objc_msgSend(v4, "formatTierPreference");
      v5->_hasFormatTierPreference = objc_msgSend(v4, "hasFormatTierPreference");
      if ((objc_msgSend(v4, "hasAudioRoute") & 1) != 0)
      {
        v139 = [MRContentItemMetadataAudioRoute alloc];
        objc_msgSend(v4, "audioRoute");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = -[MRContentItemMetadataAudioRoute initWithProtobuf:](v139, "initWithProtobuf:", v140);
        audioRoute = v5->_audioRoute;
        v5->_audioRoute = (MRContentItemMetadataAudioRoute *)v141;

      }
      else
      {
        v140 = v5->_audioRoute;
        v5->_audioRoute = 0;
      }

      if ((objc_msgSend(v4, "hasAlternativeFormats") & 1) != 0)
      {
        objc_msgSend(v4, "alternativeFormats");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "msv_map:", &__block_literal_global_12);
        v144 = objc_claimAutoreleasedReturnValue();
        alternativeFormats = v5->_alternativeFormats;
        v5->_alternativeFormats = (NSArray *)v144;

      }
      else
      {
        v143 = v5->_alternativeFormats;
        v5->_alternativeFormats = 0;
      }

      if (objc_msgSend(v4, "hasArtworkURLTemplatesData"))
      {
        objc_msgSend(v4, "artworkURLTemplatesData");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        MRDecodeObjectWithEncoding(v146, 0);
        v147 = objc_claimAutoreleasedReturnValue();
        artworkURLTemplates = v5->_artworkURLTemplates;
        v5->_artworkURLTemplates = (NSArray *)v147;

      }
      v5->_reportingAdamID = objc_msgSend(v4, "reportingAdamID");
      v5->_hasReportingAdamID = objc_msgSend(v4, "hasReportingAdamID");
      v5->_lyricsAdamID = objc_msgSend(v4, "lyricsAdamID");
      v5->_hasLyricsAdamID = objc_msgSend(v4, "hasLyricsAdamID");
      v5->_iTunesStoreAlbumArtistIdentifier = objc_msgSend(v4, "iTunesStoreAlbumArtistIdentifier");
      v5->_hasITunesStoreAlbumArtistIdentifier = objc_msgSend(v4, "hasITunesStoreAlbumArtistIdentifier");
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int64_t)totalTrackCount
{
  return self->_totalTrackCount;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)calculatedPlaybackPosition
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata calculatedPlaybackPositionFromDate:](self, "calculatedPlaybackPositionFromDate:", v3);
  v5 = v4;

  return v5;
}

- (double)calculatedPlaybackPositionFromDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  if (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp")
    || (v5 = 0.0, -[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp")))
  {
    if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
      -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
    else
      -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
    v7 = v6;
    v8 = 1.0;
    if (-[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
    {
      -[MRContentItemMetadata playbackRate](self, "playbackRate");
      v8 = v9;
    }
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v11 = v10 - v7;
    -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
    v5 = v12 + v11 * v8;
  }

  return v5;
}

- (void)setHasInferredTimestamp:(BOOL)a3
{
  self->_hasInferredTimestamp = a3;
}

- (void)setHasElapsedTimeTimestamp:(BOOL)a3
{
  self->_hasElapsedTimeTimestamp = a3;
}

- (void)setHasElapsedTime:(BOOL)a3
{
  self->_hasElapsedTime = a3;
}

- (BOOL)isEqual:(id)a3
{
  MRContentItemMetadata *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  float v42;
  float v43;
  float v44;
  _BOOL4 v45;
  float v46;
  float v47;
  float v48;
  _BOOL4 v49;
  float v50;
  float v51;
  float v52;
  _BOOL4 v53;
  float v54;
  float v55;
  float v56;
  _BOOL4 v57;
  uint64_t v58;
  _BOOL4 v59;
  uint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  _BOOL4 v65;
  uint64_t v66;
  _BOOL4 v67;
  uint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  _BOOL4 v71;
  uint64_t v72;
  _BOOL4 v73;
  uint64_t v74;
  _BOOL4 v75;
  uint64_t v76;
  _BOOL4 v77;
  uint64_t v78;
  _BOOL4 v79;
  uint64_t v80;
  _BOOL4 v81;
  uint64_t v82;
  _BOOL4 v83;
  uint64_t v84;
  _BOOL4 v85;
  double v86;
  double v87;
  double v88;
  _BOOL4 v89;
  double v90;
  double v91;
  double v92;
  _BOOL4 v93;
  double v94;
  double v95;
  double v96;
  _BOOL4 v97;
  double v98;
  double v99;
  double v100;
  _BOOL4 v101;
  double v102;
  double v103;
  double v104;
  _BOOL4 v105;
  uint64_t v106;
  _BOOL4 v107;
  uint64_t v108;
  _BOOL4 v109;
  uint64_t v110;
  _BOOL4 v111;
  uint64_t v112;
  _BOOL4 v113;
  uint64_t v114;
  _BOOL4 v115;
  uint64_t v116;
  _BOOL4 v117;
  uint64_t v118;
  _BOOL4 v119;
  uint64_t v120;
  _BOOL4 v121;
  uint64_t v122;
  _BOOL4 v123;
  uint64_t v124;
  _BOOL4 v125;
  uint64_t v126;
  _BOOL4 v127;
  uint64_t v128;
  _BOOL4 v129;
  uint64_t v130;
  _BOOL4 v131;
  uint64_t v132;
  _BOOL4 v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  int v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  uint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  int v194;
  void *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  void *v199;
  int v200;
  void *v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  void *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  int v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  int v218;
  void *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  int v224;
  void *v225;
  uint64_t v226;
  void *v227;
  void *v228;
  void *v229;
  int v230;
  void *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  int v236;
  void *v237;
  uint64_t v238;
  void *v239;
  void *v240;
  void *v241;
  int v242;
  void *v243;
  uint64_t v244;
  void *v245;
  void *v246;
  void *v247;
  int v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  int v254;
  void *v255;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  int v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  void *v265;
  int v266;
  void *v267;
  uint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  int v272;
  void *v273;
  uint64_t v274;
  void *v275;
  void *v276;
  void *v277;
  int v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  void *v283;
  int v284;
  void *v285;
  uint64_t v286;
  void *v287;
  void *v288;
  void *v289;
  int v290;
  void *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  int v296;
  void *v297;
  uint64_t v298;
  void *v299;
  void *v300;
  void *v301;
  int v302;
  void *v303;
  uint64_t v304;
  void *v305;
  void *v306;
  void *v307;
  int v308;
  void *v309;
  uint64_t v310;
  void *v311;
  void *v312;
  void *v313;
  int v314;
  void *v315;
  uint64_t v316;
  void *v317;
  void *v318;
  void *v319;
  int v320;
  void *v321;
  uint64_t v322;
  void *v323;
  void *v324;
  void *v325;
  int v326;
  void *v327;
  uint64_t v328;
  void *v329;
  void *v330;
  void *v331;
  int v332;
  void *v333;
  uint64_t v334;
  void *v335;
  void *v336;
  void *v337;
  int v338;
  void *v339;
  uint64_t v340;
  void *v341;
  void *v342;
  void *v343;
  int v344;
  void *v345;
  uint64_t v346;
  void *v347;
  void *v348;
  void *v349;
  int v350;
  void *v351;
  uint64_t v352;
  void *v353;
  void *v354;
  void *v355;
  int v356;
  void *v357;
  uint64_t v358;
  void *v359;
  void *v360;
  void *v361;
  int v362;
  void *v363;
  uint64_t v364;
  void *v365;
  void *v366;
  void *v367;
  int v368;
  _BOOL4 v369;
  _BOOL4 v370;
  _BOOL4 v371;
  _BOOL4 v372;
  void *v373;
  uint64_t v374;
  void *v375;
  void *v376;
  void *v377;
  int v378;
  void *v379;
  uint64_t v380;
  void *v381;
  void *v382;
  void *v383;
  int v384;
  void *v385;
  uint64_t v386;
  void *v387;
  void *v388;
  void *v389;
  int v390;
  void *v391;
  uint64_t v392;
  void *v393;
  void *v394;
  void *v395;
  int v396;
  _BOOL4 v397;
  uint64_t v398;
  _BOOL4 v399;
  uint64_t v400;
  _BOOL4 v401;
  uint64_t v402;
  BOOL v403;

  v4 = (MRContentItemMetadata *)a3;
  if (v4 == self)
    goto LABEL_409;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_410;
  v5 = -[MRContentItemMetadata hasContainer](v4, "hasContainer");
  if (v5 != -[MRContentItemMetadata hasContainer](self, "hasContainer"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasContainer](v4, "hasContainer"))
  {
    if (-[MRContentItemMetadata hasContainer](self, "hasContainer"))
    {
      v6 = -[MRContentItemMetadata isContainer](v4, "isContainer");
      if (v6 != -[MRContentItemMetadata isContainer](self, "isContainer"))
        goto LABEL_410;
    }
  }
  v7 = -[MRContentItemMetadata hasPlayable](v4, "hasPlayable");
  if (v7 != -[MRContentItemMetadata hasPlayable](self, "hasPlayable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlayable](v4, "hasPlayable"))
  {
    if (-[MRContentItemMetadata hasPlayable](self, "hasPlayable"))
    {
      v8 = -[MRContentItemMetadata isPlayable](v4, "isPlayable");
      if (v8 != -[MRContentItemMetadata isPlayable](self, "isPlayable"))
        goto LABEL_410;
    }
  }
  v9 = -[MRContentItemMetadata hasExplicitItem](v4, "hasExplicitItem");
  if (v9 != -[MRContentItemMetadata hasExplicitItem](self, "hasExplicitItem"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasExplicitItem](v4, "hasExplicitItem"))
  {
    if (-[MRContentItemMetadata hasExplicitItem](self, "hasExplicitItem"))
    {
      v10 = -[MRContentItemMetadata isExplicitItem](v4, "isExplicitItem");
      if (v10 != -[MRContentItemMetadata isExplicitItem](self, "isExplicitItem"))
        goto LABEL_410;
    }
  }
  v11 = -[MRContentItemMetadata hasStreamingContent](v4, "hasStreamingContent");
  if (v11 != -[MRContentItemMetadata hasStreamingContent](self, "hasStreamingContent"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasStreamingContent](v4, "hasStreamingContent"))
  {
    if (-[MRContentItemMetadata hasStreamingContent](self, "hasStreamingContent"))
    {
      v12 = -[MRContentItemMetadata isStreamingContent](v4, "isStreamingContent");
      if (v12 != -[MRContentItemMetadata isStreamingContent](self, "isStreamingContent"))
        goto LABEL_410;
    }
  }
  v13 = -[MRContentItemMetadata hasCurrentlyPlaying](v4, "hasCurrentlyPlaying");
  if (v13 != -[MRContentItemMetadata hasCurrentlyPlaying](self, "hasCurrentlyPlaying"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasCurrentlyPlaying](v4, "hasCurrentlyPlaying"))
  {
    if (-[MRContentItemMetadata hasCurrentlyPlaying](self, "hasCurrentlyPlaying"))
    {
      v14 = -[MRContentItemMetadata isCurrentlyPlaying](v4, "isCurrentlyPlaying");
      if (v14 != -[MRContentItemMetadata isCurrentlyPlaying](self, "isCurrentlyPlaying"))
        goto LABEL_410;
    }
  }
  v15 = -[MRContentItemMetadata hasAlwaysLive](v4, "hasAlwaysLive");
  if (v15 != -[MRContentItemMetadata hasAlwaysLive](self, "hasAlwaysLive"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasAlwaysLive](v4, "hasAlwaysLive"))
  {
    if (-[MRContentItemMetadata hasAlwaysLive](self, "hasAlwaysLive"))
    {
      v16 = -[MRContentItemMetadata isAlwaysLive](v4, "isAlwaysLive");
      if (v16 != -[MRContentItemMetadata isAlwaysLive](self, "isAlwaysLive"))
        goto LABEL_410;
    }
  }
  v17 = -[MRContentItemMetadata hasSharable](v4, "hasSharable");
  if (v17 != -[MRContentItemMetadata hasSharable](self, "hasSharable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasSharable](v4, "hasSharable"))
  {
    if (-[MRContentItemMetadata hasSharable](self, "hasSharable"))
    {
      v18 = -[MRContentItemMetadata isSharable](v4, "isSharable");
      if (v18 != -[MRContentItemMetadata isSharable](self, "isSharable"))
        goto LABEL_410;
    }
  }
  v19 = -[MRContentItemMetadata hasLiked](v4, "hasLiked");
  if (v19 != -[MRContentItemMetadata hasLiked](self, "hasLiked"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasLiked](v4, "hasLiked"))
  {
    if (-[MRContentItemMetadata hasLiked](self, "hasLiked"))
    {
      v20 = -[MRContentItemMetadata isLiked](v4, "isLiked");
      if (v20 != -[MRContentItemMetadata isLiked](self, "isLiked"))
        goto LABEL_410;
    }
  }
  v21 = -[MRContentItemMetadata hasInWishList](v4, "hasInWishList");
  if (v21 != -[MRContentItemMetadata hasInWishList](self, "hasInWishList"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasInWishList](v4, "hasInWishList"))
  {
    if (-[MRContentItemMetadata hasInWishList](self, "hasInWishList"))
    {
      v22 = -[MRContentItemMetadata isInWishList](v4, "isInWishList");
      if (v22 != -[MRContentItemMetadata isInWishList](self, "isInWishList"))
        goto LABEL_410;
    }
  }
  v23 = -[MRContentItemMetadata hasAdvertisement](v4, "hasAdvertisement");
  if (v23 != -[MRContentItemMetadata hasAdvertisement](self, "hasAdvertisement"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasAdvertisement](v4, "hasAdvertisement"))
  {
    if (-[MRContentItemMetadata hasAdvertisement](self, "hasAdvertisement"))
    {
      v24 = -[MRContentItemMetadata isAdvertisement](v4, "isAdvertisement");
      if (v24 != -[MRContentItemMetadata isAdvertisement](self, "isAdvertisement"))
        goto LABEL_410;
    }
  }
  v25 = -[MRContentItemMetadata hasSteerable](v4, "hasSteerable");
  if (v25 != -[MRContentItemMetadata hasSteerable](self, "hasSteerable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasSteerable](v4, "hasSteerable"))
  {
    if (-[MRContentItemMetadata hasSteerable](self, "hasSteerable"))
    {
      v26 = -[MRContentItemMetadata isSteerable](v4, "isSteerable");
      if (v26 != -[MRContentItemMetadata isSteerable](self, "isSteerable"))
        goto LABEL_410;
    }
  }
  v27 = -[MRContentItemMetadata hasLoading](v4, "hasLoading");
  if (v27 != -[MRContentItemMetadata hasLoading](self, "hasLoading"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasLoading](v4, "hasLoading"))
  {
    if (-[MRContentItemMetadata hasLoading](self, "hasLoading"))
    {
      v28 = -[MRContentItemMetadata isLoading](v4, "isLoading");
      if (v28 != -[MRContentItemMetadata isLoading](self, "isLoading"))
        goto LABEL_410;
    }
  }
  v29 = -[MRContentItemMetadata hasInTransition](v4, "hasInTransition");
  if (v29 != -[MRContentItemMetadata hasInTransition](self, "hasInTransition"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasInTransition](v4, "hasInTransition"))
  {
    if (-[MRContentItemMetadata hasInTransition](self, "hasInTransition"))
    {
      v30 = -[MRContentItemMetadata isInTransition](v4, "isInTransition");
      if (v30 != -[MRContentItemMetadata isInTransition](self, "isInTransition"))
        goto LABEL_410;
    }
  }
  v31 = -[MRContentItemMetadata hasArtworkAvailable](v4, "hasArtworkAvailable");
  if (v31 != -[MRContentItemMetadata hasArtworkAvailable](self, "hasArtworkAvailable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasArtworkAvailable](v4, "hasArtworkAvailable"))
  {
    if (-[MRContentItemMetadata hasArtworkAvailable](self, "hasArtworkAvailable"))
    {
      v32 = -[MRContentItemMetadata artworkAvailable](v4, "artworkAvailable");
      if (v32 != -[MRContentItemMetadata artworkAvailable](self, "artworkAvailable"))
        goto LABEL_410;
    }
  }
  v33 = -[MRContentItemMetadata hasInfoAvailable](v4, "hasInfoAvailable");
  if (v33 != -[MRContentItemMetadata hasInfoAvailable](self, "hasInfoAvailable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasInfoAvailable](v4, "hasInfoAvailable"))
  {
    if (-[MRContentItemMetadata hasInfoAvailable](self, "hasInfoAvailable"))
    {
      v34 = -[MRContentItemMetadata infoAvailable](v4, "infoAvailable");
      if (v34 != -[MRContentItemMetadata infoAvailable](self, "infoAvailable"))
        goto LABEL_410;
    }
  }
  v35 = -[MRContentItemMetadata hasTranscriptAlignmentsAvailable](v4, "hasTranscriptAlignmentsAvailable");
  if (v35 != -[MRContentItemMetadata hasTranscriptAlignmentsAvailable](self, "hasTranscriptAlignmentsAvailable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasTranscriptAlignmentsAvailable](v4, "hasTranscriptAlignmentsAvailable"))
  {
    if (-[MRContentItemMetadata hasTranscriptAlignmentsAvailable](self, "hasTranscriptAlignmentsAvailable"))
    {
      v36 = -[MRContentItemMetadata transcriptAlignmentsAvailable](v4, "transcriptAlignmentsAvailable");
      if (v36 != -[MRContentItemMetadata transcriptAlignmentsAvailable](self, "transcriptAlignmentsAvailable"))
        goto LABEL_410;
    }
  }
  v37 = -[MRContentItemMetadata hasLanguageOptionsAvailable](v4, "hasLanguageOptionsAvailable");
  if (v37 != -[MRContentItemMetadata hasLanguageOptionsAvailable](self, "hasLanguageOptionsAvailable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasLanguageOptionsAvailable](v4, "hasLanguageOptionsAvailable"))
  {
    if (-[MRContentItemMetadata hasLanguageOptionsAvailable](self, "hasLanguageOptionsAvailable"))
    {
      v38 = -[MRContentItemMetadata languageOptionsAvailable](v4, "languageOptionsAvailable");
      if (v38 != -[MRContentItemMetadata languageOptionsAvailable](self, "languageOptionsAvailable"))
        goto LABEL_410;
    }
  }
  v39 = -[MRContentItemMetadata hasLyricsAvailable](v4, "hasLyricsAvailable");
  if (v39 != -[MRContentItemMetadata hasLyricsAvailable](self, "hasLyricsAvailable"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasLyricsAvailable](v4, "hasLyricsAvailable"))
  {
    if (-[MRContentItemMetadata hasLyricsAvailable](self, "hasLyricsAvailable"))
    {
      v40 = -[MRContentItemMetadata lyricsAvailable](v4, "lyricsAvailable");
      if (v40 != -[MRContentItemMetadata lyricsAvailable](self, "lyricsAvailable"))
        goto LABEL_410;
    }
  }
  v41 = -[MRContentItemMetadata hasPlaybackProgress](v4, "hasPlaybackProgress");
  if (v41 != -[MRContentItemMetadata hasPlaybackProgress](self, "hasPlaybackProgress"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlaybackProgress](v4, "hasPlaybackProgress"))
  {
    if (-[MRContentItemMetadata hasPlaybackProgress](self, "hasPlaybackProgress"))
    {
      -[MRContentItemMetadata playbackProgress](v4, "playbackProgress");
      v43 = v42;
      -[MRContentItemMetadata playbackProgress](self, "playbackProgress");
      if (v43 != v44)
        goto LABEL_410;
    }
  }
  v45 = -[MRContentItemMetadata hasPlaybackRate](v4, "hasPlaybackRate");
  if (v45 != -[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlaybackRate](v4, "hasPlaybackRate"))
  {
    if (-[MRContentItemMetadata hasPlaybackRate](self, "hasPlaybackRate"))
    {
      -[MRContentItemMetadata playbackRate](v4, "playbackRate");
      v47 = v46;
      -[MRContentItemMetadata playbackRate](self, "playbackRate");
      if (v47 != v48)
        goto LABEL_410;
    }
  }
  v49 = -[MRContentItemMetadata hasDefaultPlaybackRate](v4, "hasDefaultPlaybackRate");
  if (v49 != -[MRContentItemMetadata hasDefaultPlaybackRate](self, "hasDefaultPlaybackRate"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasDefaultPlaybackRate](v4, "hasDefaultPlaybackRate"))
  {
    if (-[MRContentItemMetadata hasDefaultPlaybackRate](self, "hasDefaultPlaybackRate"))
    {
      -[MRContentItemMetadata defaultPlaybackRate](v4, "defaultPlaybackRate");
      v51 = v50;
      -[MRContentItemMetadata defaultPlaybackRate](self, "defaultPlaybackRate");
      if (v51 != v52)
        goto LABEL_410;
    }
  }
  v53 = -[MRContentItemMetadata hasDownloadProgress](v4, "hasDownloadProgress");
  if (v53 != -[MRContentItemMetadata hasDownloadProgress](self, "hasDownloadProgress"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasDownloadProgress](v4, "hasDownloadProgress"))
  {
    if (-[MRContentItemMetadata hasDownloadProgress](self, "hasDownloadProgress"))
    {
      -[MRContentItemMetadata downloadProgress](v4, "downloadProgress");
      v55 = v54;
      -[MRContentItemMetadata downloadProgress](self, "downloadProgress");
      if (v55 != v56)
        goto LABEL_410;
    }
  }
  v57 = -[MRContentItemMetadata hasPlaylistType](v4, "hasPlaylistType");
  if (v57 != -[MRContentItemMetadata hasPlaylistType](self, "hasPlaylistType"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlaylistType](v4, "hasPlaylistType"))
  {
    if (-[MRContentItemMetadata hasPlaylistType](self, "hasPlaylistType"))
    {
      v58 = -[MRContentItemMetadata playlistType](v4, "playlistType");
      if (v58 != -[MRContentItemMetadata playlistType](self, "playlistType"))
        goto LABEL_410;
    }
  }
  v59 = -[MRContentItemMetadata hasRadioStationType](v4, "hasRadioStationType");
  if (v59 != -[MRContentItemMetadata hasRadioStationType](self, "hasRadioStationType"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasRadioStationType](v4, "hasRadioStationType"))
  {
    if (-[MRContentItemMetadata hasRadioStationType](self, "hasRadioStationType"))
    {
      v60 = -[MRContentItemMetadata radioStationType](v4, "radioStationType");
      if (v60 != -[MRContentItemMetadata radioStationType](self, "radioStationType"))
        goto LABEL_410;
    }
  }
  v61 = -[MRContentItemMetadata hasEditingStyleFlags](v4, "hasEditingStyleFlags");
  if (v61 != -[MRContentItemMetadata hasEditingStyleFlags](self, "hasEditingStyleFlags"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasEditingStyleFlags](v4, "hasEditingStyleFlags"))
  {
    if (-[MRContentItemMetadata hasEditingStyleFlags](self, "hasEditingStyleFlags"))
    {
      v62 = -[MRContentItemMetadata editingStyleFlags](v4, "editingStyleFlags");
      if (v62 != -[MRContentItemMetadata editingStyleFlags](self, "editingStyleFlags"))
        goto LABEL_410;
    }
  }
  v63 = -[MRContentItemMetadata hasMediaType](v4, "hasMediaType");
  if (v63 != -[MRContentItemMetadata hasMediaType](self, "hasMediaType"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasMediaType](v4, "hasMediaType"))
  {
    if (-[MRContentItemMetadata hasMediaType](self, "hasMediaType"))
    {
      v64 = -[MRContentItemMetadata mediaType](v4, "mediaType");
      if (v64 != -[MRContentItemMetadata mediaType](self, "mediaType"))
        goto LABEL_410;
    }
  }
  v65 = -[MRContentItemMetadata hasMediaSubType](v4, "hasMediaSubType");
  if (v65 != -[MRContentItemMetadata hasMediaSubType](self, "hasMediaSubType"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasMediaSubType](v4, "hasMediaSubType"))
  {
    if (-[MRContentItemMetadata hasMediaSubType](self, "hasMediaSubType"))
    {
      v66 = -[MRContentItemMetadata mediaSubType](v4, "mediaSubType");
      if (v66 != -[MRContentItemMetadata mediaSubType](self, "mediaSubType"))
        goto LABEL_410;
    }
  }
  v67 = -[MRContentItemMetadata hasEpisodeType](v4, "hasEpisodeType");
  if (v67 != -[MRContentItemMetadata hasEpisodeType](self, "hasEpisodeType"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasEpisodeType](v4, "hasEpisodeType"))
  {
    if (-[MRContentItemMetadata hasEpisodeType](self, "hasEpisodeType"))
    {
      v68 = -[MRContentItemMetadata episodeType](v4, "episodeType");
      if (v68 != -[MRContentItemMetadata episodeType](self, "episodeType"))
        goto LABEL_410;
    }
  }
  v69 = -[MRContentItemMetadata hasPlayCount](v4, "hasPlayCount");
  if (v69 != -[MRContentItemMetadata hasPlayCount](self, "hasPlayCount"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlayCount](v4, "hasPlayCount"))
  {
    if (-[MRContentItemMetadata hasPlayCount](self, "hasPlayCount"))
    {
      v70 = -[MRContentItemMetadata playCount](v4, "playCount");
      if (v70 != -[MRContentItemMetadata playCount](self, "playCount"))
        goto LABEL_410;
    }
  }
  v71 = -[MRContentItemMetadata hasNumberOfSections](v4, "hasNumberOfSections");
  if (v71 != -[MRContentItemMetadata hasNumberOfSections](self, "hasNumberOfSections"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasNumberOfSections](v4, "hasNumberOfSections"))
  {
    if (-[MRContentItemMetadata hasNumberOfSections](self, "hasNumberOfSections"))
    {
      v72 = -[MRContentItemMetadata numberOfSections](v4, "numberOfSections");
      if (v72 != -[MRContentItemMetadata numberOfSections](self, "numberOfSections"))
        goto LABEL_410;
    }
  }
  v73 = -[MRContentItemMetadata hasChapterCount](v4, "hasChapterCount");
  if (v73 != -[MRContentItemMetadata hasChapterCount](self, "hasChapterCount"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasChapterCount](v4, "hasChapterCount"))
  {
    if (-[MRContentItemMetadata hasChapterCount](self, "hasChapterCount"))
    {
      v74 = -[MRContentItemMetadata chapterCount](v4, "chapterCount");
      if (v74 != -[MRContentItemMetadata chapterCount](self, "chapterCount"))
        goto LABEL_410;
    }
  }
  v75 = -[MRContentItemMetadata hasTotalDiscCount](v4, "hasTotalDiscCount");
  if (v75 != -[MRContentItemMetadata hasTotalDiscCount](self, "hasTotalDiscCount"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasTotalDiscCount](v4, "hasTotalDiscCount"))
  {
    if (-[MRContentItemMetadata hasTotalDiscCount](self, "hasTotalDiscCount"))
    {
      v76 = -[MRContentItemMetadata totalDiscCount](v4, "totalDiscCount");
      if (v76 != -[MRContentItemMetadata totalDiscCount](self, "totalDiscCount"))
        goto LABEL_410;
    }
  }
  v77 = -[MRContentItemMetadata hasTotalTrackCount](v4, "hasTotalTrackCount");
  if (v77 != -[MRContentItemMetadata hasTotalTrackCount](self, "hasTotalTrackCount"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasTotalTrackCount](v4, "hasTotalTrackCount"))
  {
    if (-[MRContentItemMetadata hasTotalTrackCount](self, "hasTotalTrackCount"))
    {
      v78 = -[MRContentItemMetadata totalTrackCount](v4, "totalTrackCount");
      if (v78 != -[MRContentItemMetadata totalTrackCount](self, "totalTrackCount"))
        goto LABEL_410;
    }
  }
  v79 = -[MRContentItemMetadata hasDownloadState](v4, "hasDownloadState");
  if (v79 != -[MRContentItemMetadata hasDownloadState](self, "hasDownloadState"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasDownloadState](v4, "hasDownloadState"))
  {
    if (-[MRContentItemMetadata hasDownloadState](self, "hasDownloadState"))
    {
      v80 = -[MRContentItemMetadata downloadState](v4, "downloadState");
      if (v80 != -[MRContentItemMetadata downloadState](self, "downloadState"))
        goto LABEL_410;
    }
  }
  v81 = -[MRContentItemMetadata hasArtworkDataWidthDeprecated](v4, "hasArtworkDataWidthDeprecated");
  if (v81 != -[MRContentItemMetadata hasArtworkDataWidthDeprecated](self, "hasArtworkDataWidthDeprecated"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasArtworkDataWidthDeprecated](v4, "hasArtworkDataWidthDeprecated"))
  {
    if (-[MRContentItemMetadata hasArtworkDataWidthDeprecated](self, "hasArtworkDataWidthDeprecated"))
    {
      v82 = -[MRContentItemMetadata artworkDataWidthDeprecated](v4, "artworkDataWidthDeprecated");
      if (v82 != -[MRContentItemMetadata artworkDataWidthDeprecated](self, "artworkDataWidthDeprecated"))
        goto LABEL_410;
    }
  }
  v83 = -[MRContentItemMetadata hasArtworkDataHeightDeprecated](v4, "hasArtworkDataHeightDeprecated");
  if (v83 != -[MRContentItemMetadata hasArtworkDataHeightDeprecated](self, "hasArtworkDataHeightDeprecated"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasArtworkDataHeightDeprecated](v4, "hasArtworkDataHeightDeprecated"))
  {
    if (-[MRContentItemMetadata hasArtworkDataHeightDeprecated](self, "hasArtworkDataHeightDeprecated"))
    {
      v84 = -[MRContentItemMetadata artworkDataHeightDeprecated](v4, "artworkDataHeightDeprecated");
      if (v84 != -[MRContentItemMetadata artworkDataHeightDeprecated](self, "artworkDataHeightDeprecated"))
        goto LABEL_410;
    }
  }
  v85 = -[MRContentItemMetadata hasDuration](v4, "hasDuration");
  if (v85 != -[MRContentItemMetadata hasDuration](self, "hasDuration"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasDuration](v4, "hasDuration"))
  {
    if (-[MRContentItemMetadata hasDuration](self, "hasDuration"))
    {
      -[MRContentItemMetadata duration](v4, "duration");
      v87 = v86;
      -[MRContentItemMetadata duration](self, "duration");
      if (v87 != v88)
        goto LABEL_410;
    }
  }
  v89 = -[MRContentItemMetadata hasStartTime](v4, "hasStartTime");
  if (v89 != -[MRContentItemMetadata hasStartTime](self, "hasStartTime"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasStartTime](v4, "hasStartTime"))
  {
    if (-[MRContentItemMetadata hasStartTime](self, "hasStartTime"))
    {
      -[MRContentItemMetadata startTime](v4, "startTime");
      v91 = v90;
      -[MRContentItemMetadata startTime](self, "startTime");
      if (v91 != v92)
        goto LABEL_410;
    }
  }
  v93 = -[MRContentItemMetadata hasElapsedTime](v4, "hasElapsedTime");
  if (v93 != -[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasElapsedTime](v4, "hasElapsedTime"))
  {
    if (-[MRContentItemMetadata hasElapsedTime](self, "hasElapsedTime"))
    {
      -[MRContentItemMetadata elapsedTime](v4, "elapsedTime");
      v95 = v94;
      -[MRContentItemMetadata elapsedTime](self, "elapsedTime");
      if (v95 != v96)
        goto LABEL_410;
    }
  }
  v97 = -[MRContentItemMetadata hasElapsedTimeTimestamp](v4, "hasElapsedTimeTimestamp");
  if (v97 != -[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasElapsedTimeTimestamp](v4, "hasElapsedTimeTimestamp"))
  {
    if (-[MRContentItemMetadata hasElapsedTimeTimestamp](self, "hasElapsedTimeTimestamp"))
    {
      -[MRContentItemMetadata elapsedTimeTimestamp](v4, "elapsedTimeTimestamp");
      v99 = v98;
      -[MRContentItemMetadata elapsedTimeTimestamp](self, "elapsedTimeTimestamp");
      if (v99 != v100)
        goto LABEL_410;
    }
  }
  v101 = -[MRContentItemMetadata hasInferredTimestamp](v4, "hasInferredTimestamp");
  if (v101 != -[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasInferredTimestamp](v4, "hasInferredTimestamp"))
  {
    if (-[MRContentItemMetadata hasInferredTimestamp](self, "hasInferredTimestamp"))
    {
      -[MRContentItemMetadata inferredTimestamp](v4, "inferredTimestamp");
      v103 = v102;
      -[MRContentItemMetadata inferredTimestamp](self, "inferredTimestamp");
      if (v103 != v104)
        goto LABEL_410;
    }
  }
  v105 = -[MRContentItemMetadata hasSeasonNumber](v4, "hasSeasonNumber");
  if (v105 != -[MRContentItemMetadata hasSeasonNumber](self, "hasSeasonNumber"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasSeasonNumber](v4, "hasSeasonNumber"))
  {
    if (-[MRContentItemMetadata hasSeasonNumber](self, "hasSeasonNumber"))
    {
      v106 = -[MRContentItemMetadata seasonNumber](v4, "seasonNumber");
      if (v106 != -[MRContentItemMetadata seasonNumber](self, "seasonNumber"))
        goto LABEL_410;
    }
  }
  v107 = -[MRContentItemMetadata hasEpisodeNumber](v4, "hasEpisodeNumber");
  if (v107 != -[MRContentItemMetadata hasEpisodeNumber](self, "hasEpisodeNumber"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasEpisodeNumber](v4, "hasEpisodeNumber"))
  {
    if (-[MRContentItemMetadata hasEpisodeNumber](self, "hasEpisodeNumber"))
    {
      v108 = -[MRContentItemMetadata episodeNumber](v4, "episodeNumber");
      if (v108 != -[MRContentItemMetadata episodeNumber](self, "episodeNumber"))
        goto LABEL_410;
    }
  }
  v109 = -[MRContentItemMetadata hasDiscNumber](v4, "hasDiscNumber");
  if (v109 != -[MRContentItemMetadata hasDiscNumber](self, "hasDiscNumber"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasDiscNumber](v4, "hasDiscNumber"))
  {
    if (-[MRContentItemMetadata hasDiscNumber](self, "hasDiscNumber"))
    {
      v110 = -[MRContentItemMetadata discNumber](v4, "discNumber");
      if (v110 != -[MRContentItemMetadata discNumber](self, "discNumber"))
        goto LABEL_410;
    }
  }
  v111 = -[MRContentItemMetadata hasTrackNumber](v4, "hasTrackNumber");
  if (v111 != -[MRContentItemMetadata hasTrackNumber](self, "hasTrackNumber"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasTrackNumber](v4, "hasTrackNumber"))
  {
    if (-[MRContentItemMetadata hasTrackNumber](self, "hasTrackNumber"))
    {
      v112 = -[MRContentItemMetadata trackNumber](v4, "trackNumber");
      if (v112 != -[MRContentItemMetadata trackNumber](self, "trackNumber"))
        goto LABEL_410;
    }
  }
  v113 = -[MRContentItemMetadata hasRadioStationIdentifier](v4, "hasRadioStationIdentifier");
  if (v113 != -[MRContentItemMetadata hasRadioStationIdentifier](self, "hasRadioStationIdentifier"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasRadioStationIdentifier](v4, "hasRadioStationIdentifier"))
  {
    if (-[MRContentItemMetadata hasRadioStationIdentifier](self, "hasRadioStationIdentifier"))
    {
      v114 = -[MRContentItemMetadata radioStationIdentifier](v4, "radioStationIdentifier");
      if (v114 != -[MRContentItemMetadata radioStationIdentifier](self, "radioStationIdentifier"))
        goto LABEL_410;
    }
  }
  v115 = -[MRContentItemMetadata hasITunesStoreIdentifier](v4, "hasITunesStoreIdentifier");
  if (v115 != -[MRContentItemMetadata hasITunesStoreIdentifier](self, "hasITunesStoreIdentifier"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasITunesStoreIdentifier](v4, "hasITunesStoreIdentifier"))
  {
    if (-[MRContentItemMetadata hasITunesStoreIdentifier](self, "hasITunesStoreIdentifier"))
    {
      v116 = -[MRContentItemMetadata iTunesStoreIdentifier](v4, "iTunesStoreIdentifier");
      if (v116 != -[MRContentItemMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier"))
        goto LABEL_410;
    }
  }
  v117 = -[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](v4, "hasITunesStoreSubscriptionIdentifier");
  if (v117 != -[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](self, "hasITunesStoreSubscriptionIdentifier"))goto LABEL_410;
  if (-[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](v4, "hasITunesStoreSubscriptionIdentifier"))
  {
    if (-[MRContentItemMetadata hasITunesStoreSubscriptionIdentifier](self, "hasITunesStoreSubscriptionIdentifier"))
    {
      v118 = -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](v4, "iTunesStoreSubscriptionIdentifier");
      if (v118 != -[MRContentItemMetadata iTunesStoreSubscriptionIdentifier](self, "iTunesStoreSubscriptionIdentifier"))
        goto LABEL_410;
    }
  }
  v119 = -[MRContentItemMetadata hasITunesStoreArtistIdentifier](v4, "hasITunesStoreArtistIdentifier");
  if (v119 != -[MRContentItemMetadata hasITunesStoreArtistIdentifier](self, "hasITunesStoreArtistIdentifier"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasITunesStoreArtistIdentifier](v4, "hasITunesStoreArtistIdentifier"))
  {
    if (-[MRContentItemMetadata hasITunesStoreArtistIdentifier](self, "hasITunesStoreArtistIdentifier"))
    {
      v120 = -[MRContentItemMetadata iTunesStoreArtistIdentifier](v4, "iTunesStoreArtistIdentifier");
      if (v120 != -[MRContentItemMetadata iTunesStoreArtistIdentifier](self, "iTunesStoreArtistIdentifier"))
        goto LABEL_410;
    }
  }
  v121 = -[MRContentItemMetadata hasITunesStoreAlbumIdentifier](v4, "hasITunesStoreAlbumIdentifier");
  if (v121 != -[MRContentItemMetadata hasITunesStoreAlbumIdentifier](self, "hasITunesStoreAlbumIdentifier"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasITunesStoreAlbumIdentifier](v4, "hasITunesStoreAlbumIdentifier"))
  {
    if (-[MRContentItemMetadata hasITunesStoreAlbumIdentifier](self, "hasITunesStoreAlbumIdentifier"))
    {
      v122 = -[MRContentItemMetadata iTunesStoreAlbumIdentifier](v4, "iTunesStoreAlbumIdentifier");
      if (v122 != -[MRContentItemMetadata iTunesStoreAlbumIdentifier](self, "iTunesStoreAlbumIdentifier"))
        goto LABEL_410;
    }
  }
  v123 = -[MRContentItemMetadata hasLegacyUniqueIdentifier](v4, "hasLegacyUniqueIdentifier");
  if (v123 != -[MRContentItemMetadata hasLegacyUniqueIdentifier](self, "hasLegacyUniqueIdentifier"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasLegacyUniqueIdentifier](v4, "hasLegacyUniqueIdentifier"))
  {
    if (-[MRContentItemMetadata hasLegacyUniqueIdentifier](self, "hasLegacyUniqueIdentifier"))
    {
      v124 = -[MRContentItemMetadata legacyUniqueIdentifier](v4, "legacyUniqueIdentifier");
      if (v124 != -[MRContentItemMetadata legacyUniqueIdentifier](self, "legacyUniqueIdentifier"))
        goto LABEL_410;
    }
  }
  v125 = -[MRContentItemMetadata hasSongTraits](v4, "hasSongTraits");
  if (v125 != -[MRContentItemMetadata hasSongTraits](self, "hasSongTraits"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasSongTraits](v4, "hasSongTraits"))
  {
    if (-[MRContentItemMetadata hasSongTraits](self, "hasSongTraits"))
    {
      v126 = -[MRContentItemMetadata songTraits](v4, "songTraits");
      if (v126 != -[MRContentItemMetadata songTraits](self, "songTraits"))
        goto LABEL_410;
    }
  }
  v127 = -[MRContentItemMetadata hasAlbumTraits](v4, "hasAlbumTraits");
  if (v127 != -[MRContentItemMetadata hasAlbumTraits](self, "hasAlbumTraits"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasAlbumTraits](v4, "hasAlbumTraits"))
  {
    if (-[MRContentItemMetadata hasAlbumTraits](self, "hasAlbumTraits"))
    {
      v128 = -[MRContentItemMetadata albumTraits](v4, "albumTraits");
      if (v128 != -[MRContentItemMetadata albumTraits](self, "albumTraits"))
        goto LABEL_410;
    }
  }
  v129 = -[MRContentItemMetadata hasPlaylistTraits](v4, "hasPlaylistTraits");
  if (v129 != -[MRContentItemMetadata hasPlaylistTraits](self, "hasPlaylistTraits"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasPlaylistTraits](v4, "hasPlaylistTraits"))
  {
    if (-[MRContentItemMetadata hasPlaylistTraits](self, "hasPlaylistTraits"))
    {
      v130 = -[MRContentItemMetadata playlistTraits](v4, "playlistTraits");
      if (v130 != -[MRContentItemMetadata playlistTraits](self, "playlistTraits"))
        goto LABEL_410;
    }
  }
  v131 = -[MRContentItemMetadata hasActiveFormatJustification](v4, "hasActiveFormatJustification");
  if (v131 != -[MRContentItemMetadata hasActiveFormatJustification](self, "hasActiveFormatJustification"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasActiveFormatJustification](v4, "hasActiveFormatJustification"))
  {
    if (-[MRContentItemMetadata hasActiveFormatJustification](self, "hasActiveFormatJustification"))
    {
      v132 = -[MRContentItemMetadata activeFormatJustification](v4, "activeFormatJustification");
      if (v132 != -[MRContentItemMetadata activeFormatJustification](self, "activeFormatJustification"))
        goto LABEL_410;
    }
  }
  v133 = -[MRContentItemMetadata hasFormatTierPreference](v4, "hasFormatTierPreference");
  if (v133 != -[MRContentItemMetadata hasFormatTierPreference](self, "hasFormatTierPreference"))
    goto LABEL_410;
  if (-[MRContentItemMetadata hasFormatTierPreference](v4, "hasFormatTierPreference"))
  {
    if (-[MRContentItemMetadata hasFormatTierPreference](self, "hasFormatTierPreference"))
    {
      v134 = -[MRContentItemMetadata formatTierPreference](v4, "formatTierPreference");
      if (v134 != -[MRContentItemMetadata formatTierPreference](self, "formatTierPreference"))
        goto LABEL_410;
    }
  }
  -[MRContentItemMetadata purchaseInfoData](v4, "purchaseInfoData");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata purchaseInfoData](self, "purchaseInfoData");
  v136 = objc_claimAutoreleasedReturnValue();
  if (v135 == (void *)v136)
  {

  }
  else
  {
    v137 = (void *)v136;
    -[MRContentItemMetadata purchaseInfoData](v4, "purchaseInfoData");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata purchaseInfoData](self, "purchaseInfoData");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v138, "isEqualToData:", v139);

    if (!v140)
      goto LABEL_410;
  }
  -[MRContentItemMetadata appMetrics](v4, "appMetrics");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata appMetrics](self, "appMetrics");
  v142 = objc_claimAutoreleasedReturnValue();
  if (v141 == (void *)v142)
  {

  }
  else
  {
    v143 = (void *)v142;
    -[MRContentItemMetadata appMetrics](v4, "appMetrics");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata appMetrics](self, "appMetrics");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v144, "isEqualToDictionary:", v145);

    if (!v146)
      goto LABEL_410;
  }
  -[MRContentItemMetadata nowPlayingInfo](v4, "nowPlayingInfo");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
  v148 = objc_claimAutoreleasedReturnValue();
  if (v147 == (void *)v148)
  {

  }
  else
  {
    v149 = (void *)v148;
    -[MRContentItemMetadata nowPlayingInfo](v4, "nowPlayingInfo");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata nowPlayingInfo](self, "nowPlayingInfo");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "isEqualToDictionary:", v151);

    if (!v152)
      goto LABEL_410;
  }
  -[MRContentItemMetadata userInfo](v4, "userInfo");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata userInfo](self, "userInfo");
  v154 = objc_claimAutoreleasedReturnValue();
  if (v153 == (void *)v154)
  {

  }
  else
  {
    v155 = (void *)v154;
    -[MRContentItemMetadata userInfo](v4, "userInfo");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata userInfo](self, "userInfo");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v156, "isEqualToDictionary:", v157);

    if (!v158)
      goto LABEL_410;
  }
  -[MRContentItemMetadata deviceSpecificUserInfo](v4, "deviceSpecificUserInfo");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
  v160 = objc_claimAutoreleasedReturnValue();
  if (v159 == (void *)v160)
  {

  }
  else
  {
    v161 = (void *)v160;
    -[MRContentItemMetadata deviceSpecificUserInfo](v4, "deviceSpecificUserInfo");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata deviceSpecificUserInfo](self, "deviceSpecificUserInfo");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v162, "isEqualToDictionary:", v163);

    if (!v164)
      goto LABEL_410;
  }
  -[MRContentItemMetadata collectionInfo](v4, "collectionInfo");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
  v166 = objc_claimAutoreleasedReturnValue();
  if (v165 == (void *)v166)
  {

  }
  else
  {
    v167 = (void *)v166;
    -[MRContentItemMetadata collectionInfo](v4, "collectionInfo");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata collectionInfo](self, "collectionInfo");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v168, "isEqualToDictionary:", v169);

    if (!v170)
      goto LABEL_410;
  }
  -[MRContentItemMetadata releaseDate](v4, "releaseDate");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata releaseDate](self, "releaseDate");
  v172 = objc_claimAutoreleasedReturnValue();
  if (v171 == (void *)v172)
  {

  }
  else
  {
    v173 = (void *)v172;
    -[MRContentItemMetadata releaseDate](v4, "releaseDate");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata releaseDate](self, "releaseDate");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v174, "isEqualToDate:", v175);

    if (!v176)
      goto LABEL_410;
  }
  -[MRContentItemMetadata currentPlaybackDate](v4, "currentPlaybackDate");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
  v178 = objc_claimAutoreleasedReturnValue();
  if (v177 == (void *)v178)
  {

  }
  else
  {
    v179 = (void *)v178;
    -[MRContentItemMetadata currentPlaybackDate](v4, "currentPlaybackDate");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata currentPlaybackDate](self, "currentPlaybackDate");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_msgSend(v180, "isEqualToDate:", v181);

    if (!v182)
      goto LABEL_410;
  }
  -[MRContentItemMetadata title](v4, "title");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata title](self, "title");
  v184 = objc_claimAutoreleasedReturnValue();
  if (v183 == (void *)v184)
  {

  }
  else
  {
    v185 = (void *)v184;
    -[MRContentItemMetadata title](v4, "title");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata title](self, "title");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = objc_msgSend(v186, "isEqualToString:", v187);

    if (!v188)
      goto LABEL_410;
  }
  -[MRContentItemMetadata subtitle](v4, "subtitle");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata subtitle](self, "subtitle");
  v190 = objc_claimAutoreleasedReturnValue();
  if (v189 == (void *)v190)
  {

  }
  else
  {
    v191 = (void *)v190;
    -[MRContentItemMetadata subtitle](v4, "subtitle");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata subtitle](self, "subtitle");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = objc_msgSend(v192, "isEqualToString:", v193);

    if (!v194)
      goto LABEL_410;
  }
  -[MRContentItemMetadata classicalWork](v4, "classicalWork");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata classicalWork](self, "classicalWork");
  v196 = objc_claimAutoreleasedReturnValue();
  if (v195 == (void *)v196)
  {

  }
  else
  {
    v197 = (void *)v196;
    -[MRContentItemMetadata classicalWork](v4, "classicalWork");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata classicalWork](self, "classicalWork");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend(v198, "isEqualToString:", v199);

    if (!v200)
      goto LABEL_410;
  }
  -[MRContentItemMetadata albumName](v4, "albumName");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata albumName](self, "albumName");
  v202 = objc_claimAutoreleasedReturnValue();
  if (v201 == (void *)v202)
  {

  }
  else
  {
    v203 = (void *)v202;
    -[MRContentItemMetadata albumName](v4, "albumName");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata albumName](self, "albumName");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v204, "isEqualToString:", v205);

    if (!v206)
      goto LABEL_410;
  }
  -[MRContentItemMetadata trackArtistName](v4, "trackArtistName");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata trackArtistName](self, "trackArtistName");
  v208 = objc_claimAutoreleasedReturnValue();
  if (v207 == (void *)v208)
  {

  }
  else
  {
    v209 = (void *)v208;
    -[MRContentItemMetadata trackArtistName](v4, "trackArtistName");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata trackArtistName](self, "trackArtistName");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_msgSend(v210, "isEqualToString:", v211);

    if (!v212)
      goto LABEL_410;
  }
  -[MRContentItemMetadata albumArtistName](v4, "albumArtistName");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata albumArtistName](self, "albumArtistName");
  v214 = objc_claimAutoreleasedReturnValue();
  if (v213 == (void *)v214)
  {

  }
  else
  {
    v215 = (void *)v214;
    -[MRContentItemMetadata albumArtistName](v4, "albumArtistName");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata albumArtistName](self, "albumArtistName");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_msgSend(v216, "isEqualToString:", v217);

    if (!v218)
      goto LABEL_410;
  }
  -[MRContentItemMetadata directorName](v4, "directorName");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata directorName](self, "directorName");
  v220 = objc_claimAutoreleasedReturnValue();
  if (v219 == (void *)v220)
  {

  }
  else
  {
    v221 = (void *)v220;
    -[MRContentItemMetadata directorName](v4, "directorName");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata directorName](self, "directorName");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v222, "isEqualToString:", v223);

    if (!v224)
      goto LABEL_410;
  }
  -[MRContentItemMetadata localizedContentRating](v4, "localizedContentRating");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata localizedContentRating](self, "localizedContentRating");
  v226 = objc_claimAutoreleasedReturnValue();
  if (v225 == (void *)v226)
  {

  }
  else
  {
    v227 = (void *)v226;
    -[MRContentItemMetadata localizedContentRating](v4, "localizedContentRating");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata localizedContentRating](self, "localizedContentRating");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = objc_msgSend(v228, "isEqualToString:", v229);

    if (!v230)
      goto LABEL_410;
  }
  -[MRContentItemMetadata collectionIdentifier](v4, "collectionIdentifier");
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata collectionIdentifier](self, "collectionIdentifier");
  v232 = objc_claimAutoreleasedReturnValue();
  if (v231 == (void *)v232)
  {

  }
  else
  {
    v233 = (void *)v232;
    -[MRContentItemMetadata collectionIdentifier](v4, "collectionIdentifier");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata collectionIdentifier](self, "collectionIdentifier");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v234, "isEqualToString:", v235);

    if (!v236)
      goto LABEL_410;
  }
  -[MRContentItemMetadata profileIdentifier](v4, "profileIdentifier");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata profileIdentifier](self, "profileIdentifier");
  v238 = objc_claimAutoreleasedReturnValue();
  if (v237 == (void *)v238)
  {

  }
  else
  {
    v239 = (void *)v238;
    -[MRContentItemMetadata profileIdentifier](v4, "profileIdentifier");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata profileIdentifier](self, "profileIdentifier");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v240, "isEqualToString:", v241);

    if (!v242)
      goto LABEL_410;
  }
  -[MRContentItemMetadata assetURL](v4, "assetURL");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata assetURL](self, "assetURL");
  v244 = objc_claimAutoreleasedReturnValue();
  if (v243 == (void *)v244)
  {

  }
  else
  {
    v245 = (void *)v244;
    -[MRContentItemMetadata assetURL](v4, "assetURL");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata assetURL](self, "assetURL");
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = objc_msgSend(v246, "isEqual:", v247);

    if (!v248)
      goto LABEL_410;
  }
  -[MRContentItemMetadata composer](v4, "composer");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata composer](self, "composer");
  v250 = objc_claimAutoreleasedReturnValue();
  if (v249 == (void *)v250)
  {

  }
  else
  {
    v251 = (void *)v250;
    -[MRContentItemMetadata composer](v4, "composer");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata composer](self, "composer");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = objc_msgSend(v252, "isEqualToString:", v253);

    if (!v254)
      goto LABEL_410;
  }
  -[MRContentItemMetadata genre](v4, "genre");
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata genre](self, "genre");
  v256 = objc_claimAutoreleasedReturnValue();
  if (v255 == (void *)v256)
  {

  }
  else
  {
    v257 = (void *)v256;
    -[MRContentItemMetadata genre](v4, "genre");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata genre](self, "genre");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = objc_msgSend(v258, "isEqualToString:", v259);

    if (!v260)
      goto LABEL_410;
  }
  -[MRContentItemMetadata contentIdentifier](v4, "contentIdentifier");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata contentIdentifier](self, "contentIdentifier");
  v262 = objc_claimAutoreleasedReturnValue();
  if (v261 == (void *)v262)
  {

  }
  else
  {
    v263 = (void *)v262;
    -[MRContentItemMetadata contentIdentifier](v4, "contentIdentifier");
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata contentIdentifier](self, "contentIdentifier");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    v266 = objc_msgSend(v264, "isEqualToString:", v265);

    if (!v266)
      goto LABEL_410;
  }
  -[MRContentItemMetadata internationalStandardRecordingCode](v4, "internationalStandardRecordingCode");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata internationalStandardRecordingCode](self, "internationalStandardRecordingCode");
  v268 = objc_claimAutoreleasedReturnValue();
  if (v267 == (void *)v268)
  {

  }
  else
  {
    v269 = (void *)v268;
    -[MRContentItemMetadata internationalStandardRecordingCode](v4, "internationalStandardRecordingCode");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata internationalStandardRecordingCode](self, "internationalStandardRecordingCode");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v270, "isEqualToString:", v271);

    if (!v272)
      goto LABEL_410;
  }
  -[MRContentItemMetadata radioStationName](v4, "radioStationName");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata radioStationName](self, "radioStationName");
  v274 = objc_claimAutoreleasedReturnValue();
  if (v273 == (void *)v274)
  {

  }
  else
  {
    v275 = (void *)v274;
    -[MRContentItemMetadata radioStationName](v4, "radioStationName");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata radioStationName](self, "radioStationName");
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    v278 = objc_msgSend(v276, "isEqualToString:", v277);

    if (!v278)
      goto LABEL_410;
  }
  -[MRContentItemMetadata radioStationString](v4, "radioStationString");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata radioStationString](self, "radioStationString");
  v280 = objc_claimAutoreleasedReturnValue();
  if (v279 == (void *)v280)
  {

  }
  else
  {
    v281 = (void *)v280;
    -[MRContentItemMetadata radioStationString](v4, "radioStationString");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata radioStationString](self, "radioStationString");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = objc_msgSend(v282, "isEqualToString:", v283);

    if (!v284)
      goto LABEL_410;
  }
  -[MRContentItemMetadata seriesName](v4, "seriesName");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata seriesName](self, "seriesName");
  v286 = objc_claimAutoreleasedReturnValue();
  if (v285 == (void *)v286)
  {

  }
  else
  {
    v287 = (void *)v286;
    -[MRContentItemMetadata seriesName](v4, "seriesName");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata seriesName](self, "seriesName");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v290 = objc_msgSend(v288, "isEqualToString:", v289);

    if (!v290)
      goto LABEL_410;
  }
  -[MRContentItemMetadata lyricsURL](v4, "lyricsURL");
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata lyricsURL](self, "lyricsURL");
  v292 = objc_claimAutoreleasedReturnValue();
  if (v291 == (void *)v292)
  {

  }
  else
  {
    v293 = (void *)v292;
    -[MRContentItemMetadata lyricsURL](v4, "lyricsURL");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata lyricsURL](self, "lyricsURL");
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = objc_msgSend(v294, "isEqual:", v295);

    if (!v296)
      goto LABEL_410;
  }
  -[MRContentItemMetadata serviceIdentifier](v4, "serviceIdentifier");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata serviceIdentifier](self, "serviceIdentifier");
  v298 = objc_claimAutoreleasedReturnValue();
  if (v297 == (void *)v298)
  {

  }
  else
  {
    v299 = (void *)v298;
    -[MRContentItemMetadata serviceIdentifier](v4, "serviceIdentifier");
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata serviceIdentifier](self, "serviceIdentifier");
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v302 = objc_msgSend(v300, "isEqualToString:", v301);

    if (!v302)
      goto LABEL_410;
  }
  -[MRContentItemMetadata brandIdentifier](v4, "brandIdentifier");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata brandIdentifier](self, "brandIdentifier");
  v304 = objc_claimAutoreleasedReturnValue();
  if (v303 == (void *)v304)
  {

  }
  else
  {
    v305 = (void *)v304;
    -[MRContentItemMetadata brandIdentifier](v4, "brandIdentifier");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata brandIdentifier](self, "brandIdentifier");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    v308 = objc_msgSend(v306, "isEqualToString:", v307);

    if (!v308)
      goto LABEL_410;
  }
  -[MRContentItemMetadata durationStringLocalizationKey](v4, "durationStringLocalizationKey");
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
  v310 = objc_claimAutoreleasedReturnValue();
  if (v309 == (void *)v310)
  {

  }
  else
  {
    v311 = (void *)v310;
    -[MRContentItemMetadata durationStringLocalizationKey](v4, "durationStringLocalizationKey");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata durationStringLocalizationKey](self, "durationStringLocalizationKey");
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    v314 = objc_msgSend(v312, "isEqualToString:", v313);

    if (!v314)
      goto LABEL_410;
  }
  -[MRContentItemMetadata localizedDurationString](v4, "localizedDurationString");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata localizedDurationString](self, "localizedDurationString");
  v316 = objc_claimAutoreleasedReturnValue();
  if (v315 == (void *)v316)
  {

  }
  else
  {
    v317 = (void *)v316;
    -[MRContentItemMetadata localizedDurationString](v4, "localizedDurationString");
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata localizedDurationString](self, "localizedDurationString");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    v320 = objc_msgSend(v318, "isEqualToString:", v319);

    if (!v320)
      goto LABEL_410;
  }
  -[MRContentItemMetadata artworkIdentifier](v4, "artworkIdentifier");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata artworkIdentifier](self, "artworkIdentifier");
  v322 = objc_claimAutoreleasedReturnValue();
  if (v321 == (void *)v322)
  {

  }
  else
  {
    v323 = (void *)v322;
    -[MRContentItemMetadata artworkIdentifier](v4, "artworkIdentifier");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata artworkIdentifier](self, "artworkIdentifier");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = objc_msgSend(v324, "isEqualToString:", v325);

    if (!v326)
      goto LABEL_410;
  }
  -[MRContentItemMetadata artworkMIMEType](v4, "artworkMIMEType");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata artworkMIMEType](self, "artworkMIMEType");
  v328 = objc_claimAutoreleasedReturnValue();
  if (v327 == (void *)v328)
  {

  }
  else
  {
    v329 = (void *)v328;
    -[MRContentItemMetadata artworkMIMEType](v4, "artworkMIMEType");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata artworkMIMEType](self, "artworkMIMEType");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v332 = objc_msgSend(v330, "isEqualToString:", v331);

    if (!v332)
      goto LABEL_410;
  }
  -[MRContentItemMetadata artworkURL](v4, "artworkURL");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata artworkURL](self, "artworkURL");
  v334 = objc_claimAutoreleasedReturnValue();
  if (v333 == (void *)v334)
  {

  }
  else
  {
    v335 = (void *)v334;
    -[MRContentItemMetadata artworkURL](v4, "artworkURL");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata artworkURL](self, "artworkURL");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    v338 = objc_msgSend(v336, "isEqual:", v337);

    if (!v338)
      goto LABEL_410;
  }
  -[MRContentItemMetadata artworkFileURL](v4, "artworkFileURL");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata artworkFileURL](self, "artworkFileURL");
  v340 = objc_claimAutoreleasedReturnValue();
  if (v339 == (void *)v340)
  {

  }
  else
  {
    v341 = (void *)v340;
    -[MRContentItemMetadata artworkFileURL](v4, "artworkFileURL");
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata artworkFileURL](self, "artworkFileURL");
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    v344 = objc_msgSend(v342, "isEqual:", v343);

    if (!v344)
      goto LABEL_410;
  }
  -[MRContentItemMetadata artworkURLTemplates](v4, "artworkURLTemplates");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
  v346 = objc_claimAutoreleasedReturnValue();
  if (v345 == (void *)v346)
  {

  }
  else
  {
    v347 = (void *)v346;
    -[MRContentItemMetadata artworkURLTemplates](v4, "artworkURLTemplates");
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata artworkURLTemplates](self, "artworkURLTemplates");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    v350 = objc_msgSend(v348, "isEqualToArray:", v349);

    if (!v350)
      goto LABEL_410;
  }
  -[MRContentItemMetadata albumYear](v4, "albumYear");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata albumYear](self, "albumYear");
  v352 = objc_claimAutoreleasedReturnValue();
  if (v351 == (void *)v352)
  {

  }
  else
  {
    v353 = (void *)v352;
    -[MRContentItemMetadata albumYear](v4, "albumYear");
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata albumYear](self, "albumYear");
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    v356 = objc_msgSend(v354, "isEqualToString:", v355);

    if (!v356)
      goto LABEL_410;
  }
  -[MRContentItemMetadata participantName](v4, "participantName");
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata participantName](self, "participantName");
  v358 = objc_claimAutoreleasedReturnValue();
  if (v357 == (void *)v358)
  {

  }
  else
  {
    v359 = (void *)v358;
    -[MRContentItemMetadata participantName](v4, "participantName");
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata participantName](self, "participantName");
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    v362 = objc_msgSend(v360, "isEqualToString:", v361);

    if (!v362)
      goto LABEL_410;
  }
  -[MRContentItemMetadata participantIdentifier](v4, "participantIdentifier");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata participantIdentifier](self, "participantIdentifier");
  v364 = objc_claimAutoreleasedReturnValue();
  if (v363 == (void *)v364)
  {

  }
  else
  {
    v365 = (void *)v364;
    -[MRContentItemMetadata participantIdentifier](v4, "participantIdentifier");
    v366 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata participantIdentifier](self, "participantIdentifier");
    v367 = (void *)objc_claimAutoreleasedReturnValue();
    v368 = objc_msgSend(v366, "isEqualToString:", v367);

    if (!v368)
      goto LABEL_410;
  }
  v369 = -[MRContentItemMetadata hasIsResolvableParticipant](v4, "hasIsResolvableParticipant");
  if (v369 != -[MRContentItemMetadata hasIsResolvableParticipant](self, "hasIsResolvableParticipant"))
  {
    v370 = -[MRContentItemMetadata isResolvableParticipant](v4, "isResolvableParticipant");
    if (v370 != -[MRContentItemMetadata isResolvableParticipant](self, "isResolvableParticipant"))
      goto LABEL_410;
  }
  v371 = -[MRContentItemMetadata hasExcludeFromSuggestions](v4, "hasExcludeFromSuggestions");
  if (v371 != -[MRContentItemMetadata hasExcludeFromSuggestions](self, "hasExcludeFromSuggestions"))
  {
    v372 = -[MRContentItemMetadata excludeFromSuggestions](v4, "excludeFromSuggestions");
    if (v372 != -[MRContentItemMetadata excludeFromSuggestions](self, "excludeFromSuggestions"))
      goto LABEL_410;
  }
  -[MRContentItemMetadata preferredFormat](v4, "preferredFormat");
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
  v374 = objc_claimAutoreleasedReturnValue();
  if (v373 == (void *)v374)
  {

  }
  else
  {
    v375 = (void *)v374;
    -[MRContentItemMetadata preferredFormat](v4, "preferredFormat");
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata preferredFormat](self, "preferredFormat");
    v377 = (void *)objc_claimAutoreleasedReturnValue();
    v378 = objc_msgSend(v376, "isEqual:", v377);

    if (!v378)
      goto LABEL_410;
  }
  -[MRContentItemMetadata activeFormat](v4, "activeFormat");
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata activeFormat](self, "activeFormat");
  v380 = objc_claimAutoreleasedReturnValue();
  if (v379 == (void *)v380)
  {

  }
  else
  {
    v381 = (void *)v380;
    -[MRContentItemMetadata activeFormat](v4, "activeFormat");
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata activeFormat](self, "activeFormat");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    v384 = objc_msgSend(v382, "isEqual:", v383);

    if (!v384)
      goto LABEL_410;
  }
  -[MRContentItemMetadata audioRoute](v4, "audioRoute");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata audioRoute](self, "audioRoute");
  v386 = objc_claimAutoreleasedReturnValue();
  if (v385 == (void *)v386)
  {

  }
  else
  {
    v387 = (void *)v386;
    -[MRContentItemMetadata audioRoute](v4, "audioRoute");
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRContentItemMetadata audioRoute](self, "audioRoute");
    v389 = (void *)objc_claimAutoreleasedReturnValue();
    v390 = objc_msgSend(v388, "isEqual:", v389);

    if (!v390)
      goto LABEL_410;
  }
  -[MRContentItemMetadata alternativeFormats](v4, "alternativeFormats");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
  v392 = objc_claimAutoreleasedReturnValue();
  if (v391 == (void *)v392)
  {

    goto LABEL_403;
  }
  v393 = (void *)v392;
  -[MRContentItemMetadata alternativeFormats](v4, "alternativeFormats");
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRContentItemMetadata alternativeFormats](self, "alternativeFormats");
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v396 = objc_msgSend(v394, "isEqual:", v395);

  if (!v396)
  {
LABEL_410:
    v403 = 0;
    goto LABEL_411;
  }
LABEL_403:
  v397 = -[MRContentItemMetadata hasReportingAdamID](v4, "hasReportingAdamID");
  if (v397 != -[MRContentItemMetadata hasReportingAdamID](self, "hasReportingAdamID"))
  {
    v398 = -[MRContentItemMetadata reportingAdamID](v4, "reportingAdamID");
    if (v398 != -[MRContentItemMetadata reportingAdamID](self, "reportingAdamID"))
      goto LABEL_410;
  }
  v399 = -[MRContentItemMetadata hasLyricsAdamID](v4, "hasLyricsAdamID");
  if (v399 != -[MRContentItemMetadata hasLyricsAdamID](self, "hasLyricsAdamID"))
  {
    v400 = -[MRContentItemMetadata lyricsAdamID](v4, "lyricsAdamID");
    if (v400 != -[MRContentItemMetadata lyricsAdamID](self, "lyricsAdamID"))
      goto LABEL_410;
  }
  v401 = -[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](v4, "hasITunesStoreAlbumArtistIdentifier");
  if (v401 != -[MRContentItemMetadata hasITunesStoreAlbumArtistIdentifier](self, "hasITunesStoreAlbumArtistIdentifier"))
  {
    v402 = -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](v4, "iTunesStoreAlbumArtistIdentifier");
    if (v402 != -[MRContentItemMetadata iTunesStoreAlbumArtistIdentifier](self, "iTunesStoreAlbumArtistIdentifier"))
      goto LABEL_410;
  }
LABEL_409:
  v403 = 1;
LABEL_411:

  return v403;
}

MRContentItemMetadataAudioFormat *__42__MRContentItemMetadata_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRContentItemMetadataAudioFormat *v3;

  v2 = a2;
  v3 = -[MRContentItemMetadataAudioFormat initWithProtobuf:]([MRContentItemMetadataAudioFormat alloc], "initWithProtobuf:", v2);

  return v3;
}

- (MRContentItemMetadata)initWithData:(id)a3
{
  id v4;
  _MRContentItemMetadataProtobuf *v5;
  MRContentItemMetadata *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRContentItemMetadataProtobuf initWithData:]([_MRContentItemMetadataProtobuf alloc], "initWithData:", v4);

    self = -[MRContentItemMetadata initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __46__MRContentItemMetadata_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRContentItemMetadata protobufWithEncoding:](self, "protobufWithEncoding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)hasLoadingPlaceholderTitle
{
  void *v2;
  char v3;

  -[MRContentItemMetadata title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("LOADING_AUDIO_LABEL"));

  return v3;
}

- (NSString)localizedTitle
{
  if (-[MRContentItemMetadata hasLoadingPlaceholderTitle](self, "hasLoadingPlaceholderTitle"))
    MRLocalizedString(CFSTR("LOADING_AUDIO_LABEL"));
  else
    -[MRContentItemMetadata title](self, "title");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setContainer:(BOOL)a3
{
  self->_container = a3;
  self->_hasContainer = 1;
}

- (void)setExplicitItem:(BOOL)a3
{
  self->_explicitItem = a3;
  self->_hasExplicitItem = 1;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
  self->_hasCurrentlyPlaying = 1;
}

- (void)setSharable:(BOOL)a3
{
  self->_sharable = a3;
  self->_hasSharable = 1;
}

- (void)setLiked:(BOOL)a3
{
  self->_liked = a3;
  self->_hasLiked = 1;
}

- (void)setInWishList:(BOOL)a3
{
  self->_inWishList = a3;
  self->_hasInWishList = 1;
}

- (void)setAdvertisement:(BOOL)a3
{
  self->_advertisement = a3;
  self->_hasAdvertisement = 1;
}

- (void)setSteerable:(BOOL)a3
{
  self->_steerable = a3;
  self->_hasSteerable = 1;
}

- (void)setInTransition:(BOOL)a3
{
  self->_inTransition = a3;
  self->_hasInTransition = 1;
}

- (void)setTranscriptAlignmentsAvailable:(BOOL)a3
{
  self->_transcriptAlignmentsAvailable = a3;
  self->_hasTranscriptAlignmentsAvailable = 1;
}

- (void)setLanguageOptionsAvailable:(BOOL)a3
{
  self->_languageOptionsAvailable = a3;
  self->_hasLanguageOptionsAvailable = 1;
}

- (void)setLyricsAvailable:(BOOL)a3
{
  self->_lyricsAvailable = a3;
  self->_hasLyricsAvailable = 1;
}

- (void)setPlaybackProgress:(float)a3
{
  self->_playbackProgress = a3;
  self->_hasPlaybackProgress = 1;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
  self->_hasDownloadProgress = 1;
}

- (void)setPlaylistType:(int64_t)a3
{
  self->_playlistType = a3;
  self->_hasPlaylistType = 1;
}

- (void)setRadioStationType:(int64_t)a3
{
  self->_radioStationType = a3;
  self->_hasRadioStationType = 1;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
  self->_hasPlayCount = 1;
}

- (void)setNumberOfSections:(int64_t)a3
{
  self->_numberOfSections = a3;
  self->_hasNumberOfSections = 1;
}

- (void)setChapterCount:(int64_t)a3
{
  self->_chapterCount = a3;
  self->_hasChapterCount = 1;
}

- (void)setTotalDiscCount:(int64_t)a3
{
  self->_totalDiscCount = a3;
  self->_hasTotalDiscCount = 1;
}

- (void)setTotalTrackCount:(int64_t)a3
{
  self->_totalTrackCount = a3;
  self->_hasTotalTrackCount = 1;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
  self->_hasDownloadState = 1;
}

- (void)setArtworkDataWidthDeprecated:(int64_t)a3
{
  self->_artworkDataWidthDeprecated = a3;
  self->_hasArtworkDataWidthDeprecated = 1;
}

- (void)setArtworkDataHeightDeprecated:(int64_t)a3
{
  self->_artworkDataHeightDeprecated = a3;
  self->_hasArtworkDataHeightDeprecated = 1;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
  self->_hasStartTime = 1;
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
  self->_hasSeasonNumber = 1;
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
  self->_hasEpisodeNumber = 1;
}

- (void)setDiscNumber:(int64_t)a3
{
  self->_discNumber = a3;
  self->_hasDiscNumber = 1;
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  self->_radioStationIdentifier = a3;
  self->_hasRadioStationIdentifier = 1;
}

- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3
{
  self->_iTunesStoreSubscriptionIdentifier = a3;
  self->_hasITunesStoreSubscriptionIdentifier = 1;
}

- (void)setSongTraits:(unint64_t)a3
{
  self->_songTraits = a3;
  self->_hasSongTraits = 1;
}

- (void)setAlbumTraits:(unint64_t)a3
{
  self->_albumTraits = a3;
  self->_hasAlbumTraits = 1;
}

- (void)setPlaylistTraits:(unint64_t)a3
{
  self->_playlistTraits = a3;
  self->_hasPlaylistTraits = 1;
}

- (void)setActiveFormatJustification:(int64_t)a3
{
  self->_activeFormatJustification = a3;
  self->_hasActiveFormatJustification = 1;
}

- (void)setFormatTierPreference:(unint64_t)a3
{
  self->_formatTierPreference = a3;
  self->_hasFormatTierPreference = 1;
}

- (void)setReportingAdamID:(int64_t)a3
{
  self->_reportingAdamID = a3;
  self->_hasReportingAdamID = 1;
}

- (void)setLyricsAdamID:(int64_t)a3
{
  self->_lyricsAdamID = a3;
  self->_hasLyricsAdamID = 1;
}

- (void)setIsResolvableParticipant:(BOOL)a3
{
  self->_isResolvableParticipant = a3;
  self->_hasIsResolvableParticipant = 1;
}

- (void)setExcludeFromSuggestions:(BOOL)a3
{
  self->_excludeFromSuggestions = a3;
  self->_hasExcludeFromSuggestions = 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRContentItemMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

uint64_t __49__MRContentItemMetadata_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)setHasContainer:(BOOL)a3
{
  self->_hasContainer = a3;
}

- (void)setHasPlayable:(BOOL)a3
{
  self->_hasPlayable = a3;
}

- (void)setHasExplicitItem:(BOOL)a3
{
  self->_hasExplicitItem = a3;
}

- (void)setHasStreamingContent:(BOOL)a3
{
  self->_hasStreamingContent = a3;
}

- (void)setHasCurrentlyPlaying:(BOOL)a3
{
  self->_hasCurrentlyPlaying = a3;
}

- (void)setHasAlwaysLive:(BOOL)a3
{
  self->_hasAlwaysLive = a3;
}

- (void)setHasSharable:(BOOL)a3
{
  self->_hasSharable = a3;
}

- (void)setHasLiked:(BOOL)a3
{
  self->_hasLiked = a3;
}

- (void)setHasInWishList:(BOOL)a3
{
  self->_hasInWishList = a3;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  self->_hasAdvertisement = a3;
}

- (void)setHasSteerable:(BOOL)a3
{
  self->_hasSteerable = a3;
}

- (void)setHasLoading:(BOOL)a3
{
  self->_hasLoading = a3;
}

- (BOOL)isInTransition
{
  return self->_inTransition;
}

- (BOOL)hasInTransition
{
  return self->_hasInTransition;
}

- (void)setHasInTransition:(BOOL)a3
{
  self->_hasInTransition = a3;
}

- (void)setHasArtworkAvailable:(BOOL)a3
{
  self->_hasArtworkAvailable = a3;
}

- (void)setHasInfoAvailable:(BOOL)a3
{
  self->_hasInfoAvailable = a3;
}

- (BOOL)transcriptAlignmentsAvailable
{
  return self->_transcriptAlignmentsAvailable;
}

- (BOOL)hasTranscriptAlignmentsAvailable
{
  return self->_hasTranscriptAlignmentsAvailable;
}

- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3
{
  self->_hasTranscriptAlignmentsAvailable = a3;
}

- (void)setHasLanguageOptionsAvailable:(BOOL)a3
{
  self->_hasLanguageOptionsAvailable = a3;
}

- (void)setHasLyricsAvailable:(BOOL)a3
{
  self->_hasLyricsAvailable = a3;
}

- (void)setHasPlaybackProgress:(BOOL)a3
{
  self->_hasPlaybackProgress = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  self->_hasPlaybackRate = a3;
}

- (void)setHasDefaultPlaybackRate:(BOOL)a3
{
  self->_hasDefaultPlaybackRate = a3;
}

- (void)setHasDownloadProgress:(BOOL)a3
{
  self->_hasDownloadProgress = a3;
}

- (void)setHasPlaylistType:(BOOL)a3
{
  self->_hasPlaylistType = a3;
}

- (void)setHasRadioStationType:(BOOL)a3
{
  self->_hasRadioStationType = a3;
}

- (void)setHasEditingStyleFlags:(BOOL)a3
{
  self->_hasEditingStyleFlags = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (void)setHasMediaSubType:(BOOL)a3
{
  self->_hasMediaSubType = a3;
}

- (void)setHasEpisodeType:(BOOL)a3
{
  self->_hasEpisodeType = a3;
}

- (void)setHasPlayCount:(BOOL)a3
{
  self->_hasPlayCount = a3;
}

- (void)setHasNumberOfSections:(BOOL)a3
{
  self->_hasNumberOfSections = a3;
}

- (void)setHasChapterCount:(BOOL)a3
{
  self->_hasChapterCount = a3;
}

- (void)setHasTotalDiscCount:(BOOL)a3
{
  self->_hasTotalDiscCount = a3;
}

- (void)setHasTotalTrackCount:(BOOL)a3
{
  self->_hasTotalTrackCount = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  self->_hasDownloadState = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  self->_hasStartTime = a3;
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  self->_hasSeasonNumber = a3;
}

- (void)setHasEpisodeNumber:(BOOL)a3
{
  self->_hasEpisodeNumber = a3;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  self->_hasDiscNumber = a3;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  self->_hasTrackNumber = a3;
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  self->_hasRadioStationIdentifier = a3;
}

- (void)setHasITunesStoreIdentifier:(BOOL)a3
{
  self->_hasITunesStoreIdentifier = a3;
}

- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3
{
  self->_hasITunesStoreSubscriptionIdentifier = a3;
}

- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3
{
  self->_hasITunesStoreArtistIdentifier = a3;
}

- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3
{
  self->_hasITunesStoreAlbumIdentifier = a3;
}

- (void)setHasLegacyUniqueIdentifier:(BOOL)a3
{
  self->_hasLegacyUniqueIdentifier = a3;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (void)setInternationalStandardRecordingCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BOOL)hasExcludeFromSuggestions
{
  return self->_hasExcludeFromSuggestions;
}

- (BOOL)excludeFromSuggestions
{
  return self->_excludeFromSuggestions;
}

- (void)setHasReportingAdamID:(BOOL)a3
{
  self->_hasReportingAdamID = a3;
}

- (void)setHasLyricsAdamID:(BOOL)a3
{
  self->_hasLyricsAdamID = a3;
}

- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3
{
  self->_hasITunesStoreAlbumArtistIdentifier = a3;
}

- (void)setHasSongTraits:(BOOL)a3
{
  self->_hasSongTraits = a3;
}

- (void)setHasAlbumTraits:(BOOL)a3
{
  self->_hasAlbumTraits = a3;
}

- (void)setHasPlaylistTraits:(BOOL)a3
{
  self->_hasPlaylistTraits = a3;
}

- (void)setHasActiveFormatJustification:(BOOL)a3
{
  self->_hasActiveFormatJustification = a3;
}

- (void)setHasFormatTierPreference:(BOOL)a3
{
  self->_hasFormatTierPreference = a3;
}

@end
