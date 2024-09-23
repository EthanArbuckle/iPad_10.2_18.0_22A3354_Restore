@implementation _MRContentItemMetadataProtobuf

- (void)setUserInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoData, a3);
}

- (void)setTrackNumber:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_trackNumber = a3;
}

- (void)setTrackArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_trackArtistName, a3);
}

- (void)setTotalTrackCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_totalTrackCount = a3;
}

- (void)setTotalDiscCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_totalDiscCount = a3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setStartTime:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_startTime = a3;
}

- (void)setSongTraits:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_songTraits = a3;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void)setSeriesName:(id)a3
{
  objc_storeStrong((id *)&self->_seriesName, a3);
}

- (void)setSeasonNumber:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_seasonNumber = a3;
}

- (void)setReportingAdamID:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_reportingAdamID = a3;
}

- (void)setReleaseDate:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_releaseDate = a3;
}

- (void)setRadioStationType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_radioStationType = a3;
}

- (void)setRadioStationString:(id)a3
{
  objc_storeStrong((id *)&self->_radioStationString, a3);
}

- (void)setRadioStationName:(id)a3
{
  objc_storeStrong((id *)&self->_radioStationName, a3);
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_radioStationIdentifier = a3;
}

- (void)setPurchaseInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseInfoData, a3);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (void)setPreferredFormat:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFormat, a3);
}

- (void)setPlaylistType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_playlistType = a3;
}

- (void)setPlaylistTraits:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_playlistTraits = a3;
}

- (void)setPlaybackRate:(float)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_playbackRate = a3;
}

- (void)setPlaybackProgress:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_playbackProgress = a3;
}

- (void)setPlayCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_playCount = a3;
}

- (void)setParticipantName:(id)a3
{
  objc_storeStrong((id *)&self->_participantName, a3);
}

- (void)setParticipantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_participantIdentifier, a3);
}

- (void)setNumberOfSections:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_numberOfSections = a3;
}

- (void)setNowPlayingInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingInfoData, a3);
}

- (void)setMediaType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_mediaType = a3;
}

- (void)setMediaSubType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_mediaSubType = a3;
}

- (void)setLyricsURL:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsURL, a3);
}

- (void)setLyricsAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_lyricsAvailable = a3;
}

- (void)setLyricsAdamID:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_lyricsAdamID = a3;
}

- (void)setLocalizedDurationString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDurationString, a3);
}

- (void)setLocalizedContentRating:(id)a3
{
  objc_storeStrong((id *)&self->_localizedContentRating, a3);
}

- (void)setLegacyUniqueIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_legacyUniqueIdentifier = a3;
}

- (void)setLanguageOptionsAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_languageOptionsAvailable = a3;
}

- (void)setIsStreamingContent:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_isStreamingContent = a3;
}

- (void)setIsSteerable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_isSteerable = a3;
}

- (void)setIsSharable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_isSharable = a3;
}

- (void)setIsResolvableParticipant:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_isResolvableParticipant = a3;
}

- (void)setIsPlayable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_isPlayable = a3;
}

- (void)setIsLoading:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_isLoading = a3;
}

- (void)setIsLiked:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_isLiked = a3;
}

- (void)setIsInWishList:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_isInWishList = a3;
}

- (void)setIsExplicitItem:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_isExplicitItem = a3;
}

- (void)setIsCurrentlyPlaying:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_isCurrentlyPlaying = a3;
}

- (void)setIsContainer:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_isContainer = a3;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_isAlwaysLive = a3;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_isAdvertisement = a3;
}

- (void)setInfoAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_infoAvailable = a3;
}

- (void)setInferredTimestamp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_inferredTimestamp = a3;
}

- (void)setITunesStoreSubscriptionIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_iTunesStoreSubscriptionIdentifier = a3;
}

- (void)setITunesStoreIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_iTunesStoreIdentifier = a3;
}

- (void)setITunesStoreArtistIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_iTunesStoreArtistIdentifier = a3;
}

- (void)setITunesStoreAlbumIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_iTunesStoreAlbumIdentifier = a3;
}

- (void)setITunesStoreAlbumArtistIdentifier:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_iTunesStoreAlbumArtistIdentifier = a3;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (void)setHasTotalTrackCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (void)setHasTotalDiscCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (void)setHasStartTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setHasSongTraits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (void)setHasReportingAdamID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setHasReleaseDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setHasRadioStationType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setHasPlaylistType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (void)setHasPlaylistTraits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setHasPlaybackProgress:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setHasNumberOfSections:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setHasMediaSubType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)setHasLyricsAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasLyricsAdamID:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (void)setHasLegacyUniqueIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (void)setHasLanguageOptionsAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsStreamingContent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsSteerable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsSharable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsResolvableParticipant:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsPlayable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsLoading:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsLiked:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsInWishList:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsExplicitItem:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsCurrentlyPlaying:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsContainer:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (void)setHasIsAlwaysLive:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (void)setHasIsAdvertisement:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (void)setHasInfoAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (void)setHasInferredTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setHasITunesStoreSubscriptionIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (void)setHasITunesStoreIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setHasITunesStoreArtistIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setHasITunesStoreAlbumIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (void)setHasITunesStoreAlbumArtistIdentifier:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setHasFormatTierPreference:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (void)setHasEpisodeType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setHasEpisodeNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setHasElapsedTimeTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setHasElapsedTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setHasEditingStyleFlags:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setHasDuration:(BOOL)a3
{
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setHasDownloadState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)setHasDownloadProgress:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setHasDiscNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)setHasDefaultPlaybackRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)setHasChapterCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (void)setHasArtworkDataWidthDeprecated:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setHasArtworkDataHeightDeprecated:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)setHasArtworkAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (void)setHasAlbumTraits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (void)setHasActiveFormatJustification:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (void)setFormatTierPreference:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_formatTierPreference = a3;
}

- (void)setEpisodeType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_episodeType = a3;
}

- (void)setEpisodeNumber:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_episodeNumber = a3;
}

- (void)setElapsedTimeTimestamp:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_elapsedTimeTimestamp = a3;
}

- (void)setElapsedTime:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_elapsedTime = a3;
}

- (void)setEditingStyleFlags:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_editingStyleFlags = a3;
}

- (void)setDurationStringLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_durationStringLocalizationKey, a3);
}

- (void)setDuration:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_duration = a3;
}

- (void)setDownloadState:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_downloadState = a3;
}

- (void)setDownloadProgress:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_downloadProgress = a3;
}

- (void)setDiscNumber:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_discNumber = a3;
}

- (void)setDirectorName:(id)a3
{
  objc_storeStrong((id *)&self->_directorName, a3);
}

- (void)setDeviceSpecificUserInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSpecificUserInfoData, a3);
}

- (void)setDefaultPlaybackRate:(float)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_defaultPlaybackRate = a3;
}

- (void)setCurrentPlaybackDateData:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlaybackDateData, a3);
}

- (void)setContentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contentIdentifier, a3);
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

- (void)setCollectionInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_collectionInfoData, a3);
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIdentifier, a3);
}

- (void)setClassicalWork:(id)a3
{
  objc_storeStrong((id *)&self->_classicalWork, a3);
}

- (void)setChapterCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_chapterCount = a3;
}

- (void)setBrandIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_brandIdentifier, a3);
}

- (void)setAudioRoute:(id)a3
{
  objc_storeStrong((id *)&self->_audioRoute, a3);
}

- (void)setAssetURLString:(id)a3
{
  objc_storeStrong((id *)&self->_assetURLString, a3);
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (void)setArtworkMIMEType:(id)a3
{
  objc_storeStrong((id *)&self->_artworkMIMEType, a3);
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_artworkIdentifier, a3);
}

- (void)setArtworkFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkFileURL, a3);
}

- (void)setArtworkDataWidthDeprecated:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_artworkDataWidthDeprecated = a3;
}

- (void)setArtworkDataHeightDeprecated:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_artworkDataHeightDeprecated = a3;
}

- (void)setArtworkAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_artworkAvailable = a3;
}

- (void)setAppMetricsData:(id)a3
{
  objc_storeStrong((id *)&self->_appMetricsData, a3);
}

- (void)setAlbumYear:(id)a3
{
  objc_storeStrong((id *)&self->_albumYear, a3);
}

- (void)setAlbumTraits:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_albumTraits = a3;
}

- (void)setAlbumName:(id)a3
{
  objc_storeStrong((id *)&self->_albumName, a3);
}

- (void)setAlbumArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_albumArtistName, a3);
}

- (void)setActiveFormatJustification:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_activeFormatJustification = a3;
}

- (void)setActiveFormat:(id)a3
{
  objc_storeStrong((id *)&self->_activeFormat, a3);
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (int)trackNumber
{
  return self->_trackNumber;
}

- (NSString)trackArtistName
{
  return self->_trackArtistName;
}

- (int)totalTrackCount
{
  return self->_totalTrackCount;
}

- (int)totalDiscCount
{
  return self->_totalDiscCount;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)songTraits
{
  if ((*((_BYTE *)&self->_has + 4) & 0x40) != 0)
    return self->_songTraits;
  else
    return 0;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (int)seasonNumber
{
  return self->_seasonNumber;
}

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int)radioStationType
{
  return self->_radioStationType;
}

- (NSString)radioStationString
{
  return self->_radioStationString;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (NSData)purchaseInfoData
{
  return self->_purchaseInfoData;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (int)playlistType
{
  return self->_playlistType;
}

- (int)playlistTraits
{
  if ((*((_BYTE *)&self->_has + 4) & 4) != 0)
    return self->_playlistTraits;
  else
    return 0;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (int)playCount
{
  return self->_playCount;
}

- (int)numberOfSections
{
  return self->_numberOfSections;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaSubType
{
  return self->_mediaSubType;
}

- (BOOL)lyricsAvailable
{
  return self->_lyricsAvailable;
}

- (int64_t)lyricsAdamID
{
  return self->_lyricsAdamID;
}

- (NSString)localizedDurationString
{
  return self->_localizedDurationString;
}

- (NSString)localizedContentRating
{
  return self->_localizedContentRating;
}

- (int64_t)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (BOOL)languageOptionsAvailable
{
  return self->_languageOptionsAvailable;
}

- (BOOL)isStreamingContent
{
  return self->_isStreamingContent;
}

- (BOOL)isSteerable
{
  return self->_isSteerable;
}

- (BOOL)isSharable
{
  return self->_isSharable;
}

- (BOOL)isResolvableParticipant
{
  return self->_isResolvableParticipant;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (BOOL)isLiked
{
  return self->_isLiked;
}

- (BOOL)isInWishList
{
  return self->_isInWishList;
}

- (BOOL)isExplicitItem
{
  return self->_isExplicitItem;
}

- (BOOL)isCurrentlyPlaying
{
  return self->_isCurrentlyPlaying;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (BOOL)infoAvailable
{
  return self->_infoAvailable;
}

- (double)inferredTimestamp
{
  return self->_inferredTimestamp;
}

- (int64_t)iTunesStoreSubscriptionIdentifier
{
  return self->_iTunesStoreSubscriptionIdentifier;
}

- (int64_t)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (int64_t)iTunesStoreArtistIdentifier
{
  return self->_iTunesStoreArtistIdentifier;
}

- (int64_t)iTunesStoreAlbumIdentifier
{
  return self->_iTunesStoreAlbumIdentifier;
}

- (int64_t)iTunesStoreAlbumArtistIdentifier
{
  return self->_iTunesStoreAlbumArtistIdentifier;
}

- (BOOL)hasUserInfoData
{
  return self->_userInfoData != 0;
}

- (BOOL)hasTrackNumber
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (BOOL)hasTotalTrackCount
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (BOOL)hasTotalDiscCount
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (BOOL)hasStartTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSongTraits
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasSeasonNumber
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (BOOL)hasReportingAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasReleaseDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasRadioStationType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (BOOL)hasRadioStationIdentifier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPreferredFormat
{
  return self->_preferredFormat != 0;
}

- (BOOL)hasPlaylistType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (BOOL)hasPlaylistTraits
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (BOOL)hasPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (BOOL)hasPlaybackProgress
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (BOOL)hasPlayCount
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (BOOL)hasParticipantName
{
  return self->_participantName != 0;
}

- (BOOL)hasParticipantIdentifier
{
  return self->_participantIdentifier != 0;
}

- (BOOL)hasNumberOfSections
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (BOOL)hasNowPlayingInfoData
{
  return self->_nowPlayingInfoData != 0;
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasMediaSubType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasLyricsURL
{
  return self->_lyricsURL != 0;
}

- (BOOL)hasLyricsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (BOOL)hasLyricsAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasLegacyUniqueIdentifier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasLanguageOptionsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (BOOL)hasIsStreamingContent
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (BOOL)hasIsSteerable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (BOOL)hasIsSharable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (BOOL)hasIsResolvableParticipant
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (BOOL)hasIsPlayable
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (BOOL)hasIsLoading
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (BOOL)hasIsLiked
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (BOOL)hasIsInWishList
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (BOOL)hasIsExplicitItem
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (BOOL)hasIsCurrentlyPlaying
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (BOOL)hasIsContainer
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (BOOL)hasIsAlwaysLive
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (BOOL)hasIsAdvertisement
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (BOOL)hasInfoAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (BOOL)hasInferredTimestamp
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasITunesStoreSubscriptionIdentifier
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasITunesStoreIdentifier
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasITunesStoreArtistIdentifier
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasITunesStoreAlbumIdentifier
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasITunesStoreAlbumArtistIdentifier
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasFormatTierPreference
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (BOOL)hasEpisodeType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasEpisodeNumber
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (BOOL)hasElapsedTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasElapsedTimeTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasEditingStyleFlags
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasDuration
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDownloadState
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasDownloadProgress
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasDiscNumber
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasDeviceSpecificUserInfoData
{
  return self->_deviceSpecificUserInfoData != 0;
}

- (BOOL)hasDefaultPlaybackRate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCurrentPlaybackDateData
{
  return self->_currentPlaybackDateData != 0;
}

- (BOOL)hasCollectionInfoData
{
  return self->_collectionInfoData != 0;
}

- (BOOL)hasChapterCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasAudioRoute
{
  return self->_audioRoute != 0;
}

- (BOOL)hasAssetURLString
{
  return self->_assetURLString != 0;
}

- (BOOL)hasArtworkURL
{
  return self->_artworkURL != 0;
}

- (BOOL)hasArtworkURLTemplatesData
{
  return self->_artworkURLTemplatesData != 0;
}

- (BOOL)hasArtworkFileURL
{
  return self->_artworkFileURL != 0;
}

- (BOOL)hasArtworkDataWidthDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasArtworkDataHeightDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasArtworkAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (BOOL)hasAppMetricsData
{
  return self->_appMetricsData != 0;
}

- (BOOL)hasAlternativeFormats
{
  return self->_hasAlternativeFormats;
}

- (BOOL)hasAlbumTraits
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasActiveFormat
{
  return self->_activeFormat != 0;
}

- (BOOL)hasActiveFormatJustification
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (NSString)genre
{
  return self->_genre;
}

- (int)formatTierPreference
{
  if ((*((_BYTE *)&self->_has + 3) & 8) != 0)
    return self->_formatTierPreference;
  else
    return 1;
}

- (int)episodeType
{
  return self->_episodeType;
}

- (int)episodeNumber
{
  return self->_episodeNumber;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)elapsedTimeTimestamp
{
  return self->_elapsedTimeTimestamp;
}

- (int)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)durationStringLocalizationKey
{
  return self->_durationStringLocalizationKey;
}

- (int)downloadState
{
  return self->_downloadState;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (int)discNumber
{
  return self->_discNumber;
}

- (NSString)directorName
{
  return self->_directorName;
}

- (NSData)deviceSpecificUserInfoData
{
  return self->_deviceSpecificUserInfoData;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)composer
{
  return self->_composer;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSString)classicalWork
{
  return self->_classicalWork;
}

- (int)chapterCount
{
  return self->_chapterCount;
}

- (NSString)brandIdentifier
{
  return self->_brandIdentifier;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (int)artworkDataWidthDeprecated
{
  return self->_artworkDataWidthDeprecated;
}

- (int)artworkDataHeightDeprecated
{
  return self->_artworkDataHeightDeprecated;
}

- (BOOL)artworkAvailable
{
  return self->_artworkAvailable;
}

- (NSString)albumYear
{
  return self->_albumYear;
}

- (int)albumTraits
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_albumTraits;
  else
    return 0;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)albumArtistName
{
  return self->_albumArtistName;
}

- (int)activeFormatJustification
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_activeFormatJustification;
  else
    return 0;
}

- (NSData)collectionInfoData
{
  return self->_collectionInfoData;
}

- (double)releaseDate
{
  return self->_releaseDate;
}

- (NSData)nowPlayingInfoData
{
  return self->_nowPlayingInfoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong((id *)&self->_trackArtistName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_radioStationString, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_purchaseInfoData, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoData, 0);
  objc_storeStrong((id *)&self->_lyricsURL, 0);
  objc_storeStrong((id *)&self->_localizedDurationString, 0);
  objc_storeStrong((id *)&self->_localizedContentRating, 0);
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_durationStringLocalizationKey, 0);
  objc_storeStrong((id *)&self->_directorName, 0);
  objc_storeStrong((id *)&self->_deviceSpecificUserInfoData, 0);
  objc_storeStrong((id *)&self->_currentPlaybackDateData, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_collectionInfoData, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_classicalWork, 0);
  objc_storeStrong((id *)&self->_brandIdentifier, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_assetURLString, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplatesData, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkFileURL, 0);
  objc_storeStrong((id *)&self->_appMetricsData, 0);
  objc_storeStrong((id *)&self->_alternativeFormats, 0);
  objc_storeStrong((id *)&self->_albumYear, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_albumArtistName, 0);
  objc_storeStrong((id *)&self->_activeFormat, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  $39A7635802529FA34AF0E2292B825163 has;
  $39A7635802529FA34AF0E2292B825163 v6;
  $39A7635802529FA34AF0E2292B825163 v7;
  $39A7635802529FA34AF0E2292B825163 v8;
  $39A7635802529FA34AF0E2292B825163 v9;
  $39A7635802529FA34AF0E2292B825163 v10;
  $39A7635802529FA34AF0E2292B825163 v11;
  $39A7635802529FA34AF0E2292B825163 v12;
  $39A7635802529FA34AF0E2292B825163 v13;
  $39A7635802529FA34AF0E2292B825163 v14;
  $39A7635802529FA34AF0E2292B825163 v15;
  $39A7635802529FA34AF0E2292B825163 v16;
  $39A7635802529FA34AF0E2292B825163 v17;
  $39A7635802529FA34AF0E2292B825163 v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $39A7635802529FA34AF0E2292B825163 v24;
  $39A7635802529FA34AF0E2292B825163 v25;
  $39A7635802529FA34AF0E2292B825163 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(_QWORD *)&has & 0x100000000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
LABEL_8:
    PBDataWriterWriteFloatField();
LABEL_9:
  if (self->_albumName)
    PBDataWriterWriteStringField();
  if (self->_trackArtistName)
    PBDataWriterWriteStringField();
  if (self->_albumArtistName)
    PBDataWriterWriteStringField();
  if (self->_directorName)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_187;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_188:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 1) != 0)
LABEL_22:
    PBDataWriterWriteDoubleField();
LABEL_23:
  if (self->_localizedContentRating)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x4000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_has;
    if ((*(_QWORD *)&v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
        goto LABEL_28;
      goto LABEL_192;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
      goto LABEL_29;
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&v7 & 0x200000000000) == 0)
      goto LABEL_30;
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v7 & 0x2000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_34;
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
      goto LABEL_35;
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v7 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_199:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x2000000000000) != 0)
LABEL_36:
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_collectionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_profileIdentifier)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_artworkMIMEType)
    PBDataWriterWriteStringField();
  if (self->_assetURLString)
    PBDataWriterWriteStringField();
  if (self->_composer)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v8 = self->_has;
  }
  if ((*(_BYTE *)&v8 & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_genre)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x800000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = self->_has;
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v9 & 0x80000) == 0)
        goto LABEL_58;
      goto LABEL_203;
    }
  }
  else if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteFloatField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
      goto LABEL_59;
    goto LABEL_204;
  }
LABEL_203:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
      goto LABEL_60;
    goto LABEL_205;
  }
LABEL_204:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_205:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
LABEL_61:
    PBDataWriterWriteInt32Field();
LABEL_62:
  if (self->_contentIdentifier)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x200000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(_QWORD *)&v10 & 0x10000000000000) == 0)
        goto LABEL_67;
      goto LABEL_209;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  PBDataWriterWriteBOOLField();
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_209:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
LABEL_68:
    PBDataWriterWriteInt64Field();
LABEL_69:
  if (self->_radioStationName)
    PBDataWriterWriteStringField();
  if (self->_radioStationString)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_75:
      if ((*(_BYTE *)&v11 & 0x20) == 0)
        goto LABEL_76;
      goto LABEL_213;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt64Field();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) == 0)
  {
LABEL_76:
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_213:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
LABEL_77:
    PBDataWriterWriteInt64Field();
LABEL_78:
  if (self->_purchaseInfoData)
    PBDataWriterWriteDataField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    PBDataWriterWriteFloatField();
    v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v12 & 0x400000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
LABEL_83:
    PBDataWriterWriteFloatField();
LABEL_84:
  if (self->_appMetricsData)
    PBDataWriterWriteDataField();
  if (self->_seriesName)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_nowPlayingInfoData)
    PBDataWriterWriteDataField();
  if (self->_userInfoData)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_artworkURL)
    PBDataWriterWriteStringField();
  if (self->_lyricsURL)
    PBDataWriterWriteStringField();
  if (self->_deviceSpecificUserInfoData)
    PBDataWriterWriteDataField();
  if (self->_collectionInfoData)
    PBDataWriterWriteDataField();
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v14 = self->_has;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_serviceIdentifier)
    PBDataWriterWriteStringField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_currentPlaybackDateData)
    PBDataWriterWriteDataField();
  if (self->_artworkIdentifier)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 6) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_artworkURLTemplatesData)
    PBDataWriterWriteDataField();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    v16 = self->_has;
  }
  if ((*(_DWORD *)&v16 & 0x4000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_artworkFileURL)
    PBDataWriterWriteStringField();
  if (self->_brandIdentifier)
    PBDataWriterWriteStringField();
  if (self->_localizedDurationString)
    PBDataWriterWriteStringField();
  if (self->_albumYear)
    PBDataWriterWriteStringField();
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x4000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(_QWORD *)&v17 & 0x400000000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x400000000) != 0)
LABEL_139:
    PBDataWriterWriteInt32Field();
LABEL_140:
  if (self->_preferredFormat)
    PBDataWriterWriteSubmessage();
  if (self->_activeFormat)
    PBDataWriterWriteSubmessage();
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x8000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_audioRoute)
    PBDataWriterWriteSubmessage();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self->_alternativeFormats;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v21);
  }

  v24 = self->_has;
  if ((*(_QWORD *)&v24 & 0x400000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v24 = self->_has;
  }
  if ((*(_QWORD *)&v24 & 0x100000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_participantName)
    PBDataWriterWriteStringField();
  if (self->_participantIdentifier)
    PBDataWriterWriteStringField();
  if (self->_classicalWork)
    PBDataWriterWriteStringField();
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_169:
      if ((*(_BYTE *)&v25 & 8) == 0)
        goto LABEL_171;
      goto LABEL_170;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_169;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 8) != 0)
LABEL_170:
    PBDataWriterWriteInt64Field();
LABEL_171:
  if (self->_durationStringLocalizationKey)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 7) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_internationalStandardRecordingCode)
    PBDataWriterWriteStringField();
  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x8000000000000) == 0)
  {
    if ((*(_QWORD *)&v26 & 0x80000000000) == 0)
      goto LABEL_179;
LABEL_225:
    PBDataWriterWriteBOOLField();
    if ((*(_QWORD *)&self->_has & 0x4000000000000000) == 0)
      goto LABEL_181;
    goto LABEL_180;
  }
  PBDataWriterWriteBOOLField();
  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x80000000000) != 0)
    goto LABEL_225;
LABEL_179:
  if ((*(_QWORD *)&v26 & 0x4000000000000000) != 0)
LABEL_180:
    PBDataWriterWriteBOOLField();
LABEL_181:

}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasAlbumName
{
  return self->_albumName != 0;
}

- (BOOL)hasTrackArtistName
{
  return self->_trackArtistName != 0;
}

- (BOOL)hasAlbumArtistName
{
  return self->_albumArtistName != 0;
}

- (BOOL)hasDirectorName
{
  return self->_directorName != 0;
}

- (BOOL)hasLocalizedContentRating
{
  return self->_localizedContentRating != 0;
}

- (BOOL)hasCollectionIdentifier
{
  return self->_collectionIdentifier != 0;
}

- (BOOL)hasProfileIdentifier
{
  return self->_profileIdentifier != 0;
}

- (BOOL)hasArtworkMIMEType
{
  return self->_artworkMIMEType != 0;
}

- (BOOL)hasComposer
{
  return self->_composer != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasContentIdentifier
{
  return self->_contentIdentifier != 0;
}

- (BOOL)hasRadioStationName
{
  return self->_radioStationName != 0;
}

- (BOOL)hasRadioStationString
{
  return self->_radioStationString != 0;
}

- (BOOL)hasPurchaseInfoData
{
  return self->_purchaseInfoData != 0;
}

- (BOOL)hasSeriesName
{
  return self->_seriesName != 0;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
}

- (BOOL)hasBrandIdentifier
{
  return self->_brandIdentifier != 0;
}

- (BOOL)hasLocalizedDurationString
{
  return self->_localizedDurationString != 0;
}

- (BOOL)hasAlbumYear
{
  return self->_albumYear != 0;
}

- (id)songTraitsAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("None");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("AppleDigitalMaster");
      return v3;
    case 2:
      return CFSTR("Loseless");
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_8;
    case 4:
      return CFSTR("HighResolutionLossless");
    case 8:
      return CFSTR("Spatial");
    default:
      if (a3 == 16)
        return CFSTR("Atmos");
      if (a3 == 32)
        return CFSTR("Surround");
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsSongTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleDigitalMaster")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Loseless")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighResolutionLossless")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Spatial")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Atmos")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Surround")))
  {
    v4 = 32;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)albumTraitsAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("None");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("AppleDigitalMaster");
      return v3;
    case 2:
      return CFSTR("Loseless");
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_8;
    case 4:
      return CFSTR("HighResolutionLossless");
    case 8:
      return CFSTR("Spatial");
    default:
      if (a3 == 16)
        return CFSTR("Atmos");
      if (a3 == 32)
        return CFSTR("Surround");
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsAlbumTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleDigitalMaster")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Loseless")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighResolutionLossless")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Spatial")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Atmos")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Surround")))
  {
    v4 = 32;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)playlistTraitsAsString:(int)a3
{
  __CFString *v3;

  if (a3 <= 15)
  {
    if (!a3)
      return CFSTR("None");
    if (a3 == 8)
      return CFSTR("Spatial");
    goto LABEL_14;
  }
  if (a3 == 16)
    return CFSTR("Atmos");
  if (a3 == 32)
    return CFSTR("Surround");
  if (a3 != 256)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("Sing");
  return v3;
}

- (int)StringAsPlaylistTraits:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Spatial")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Atmos")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Surround")) & 1) != 0)
  {
    v4 = 32;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Sing")))
  {
    v4 = 256;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)activeFormatJustificationAsString:(int)a3
{
  __CFString *v3;

  if (a3 <= 100)
  {
    switch(a3)
    {
      case 0:
        return CFSTR("Unknown");
      case 1:
        return CFSTR("Unavailable");
      case 100:
        return CFSTR("UserPreference");
    }
    goto LABEL_18;
  }
  if (a3 > 500)
  {
    if (a3 == 501)
      return CFSTR("RouteUnknownCompatibility");
    if (a3 == 1000)
      return CFSTR("BandwidthInsufficient");
    goto LABEL_18;
  }
  if (a3 == 101)
    return CFSTR("UserDownload");
  if (a3 != 500)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("RouteIncompatible");
  return v3;
}

- (int)StringAsActiveFormatJustification:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unavailable")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserPreference")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserDownload")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RouteIncompatible")) & 1) != 0)
  {
    v4 = 500;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RouteUnknownCompatibility")) & 1) != 0)
  {
    v4 = 501;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BandwidthInsufficient")))
  {
    v4 = 1000;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)formatTierPreferenceAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("LowBandwidthStereo");
  switch(a3)
  {
    case 1:
      return v3;
    case 2:
      v3 = CFSTR("HighQualityStereo");
      return v3;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 4:
      return CFSTR("Lossless");
    case 8:
      return CFSTR("HighResolutionLossless");
    default:
      if (a3 == 16)
        return CFSTR("Spatial");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsFormatTierPreference:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LowBandwidthStereo")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighQualityStereo")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Lossless")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighResolutionLossless")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Spatial")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)clearAlternativeFormats
{
  -[NSMutableArray removeAllObjects](self->_alternativeFormats, "removeAllObjects");
}

- (void)addAlternativeFormats:(id)a3
{
  id v4;
  NSMutableArray *alternativeFormats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  alternativeFormats = self->_alternativeFormats;
  v8 = v4;
  if (!alternativeFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_alternativeFormats;
    self->_alternativeFormats = v6;

    v4 = v8;
    alternativeFormats = self->_alternativeFormats;
  }
  -[NSMutableArray addObject:](alternativeFormats, "addObject:", v4);

}

- (unint64_t)alternativeFormatsCount
{
  return -[NSMutableArray count](self->_alternativeFormats, "count");
}

- (id)alternativeFormatsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_alternativeFormats, "objectAtIndex:", a3);
}

+ (Class)alternativeFormatsType
{
  return (Class)objc_opt_class();
}

- (void)setHasAlternativeFormats:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_hasAlternativeFormats = a3;
}

- (void)setHasHasAlternativeFormats:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHasAlternativeFormats
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (BOOL)hasClassicalWork
{
  return self->_classicalWork != 0;
}

- (BOOL)hasDurationStringLocalizationKey
{
  return self->_durationStringLocalizationKey != 0;
}

- (BOOL)hasInternationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode != 0;
}

- (void)setIsInTransition:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_isInTransition = a3;
}

- (void)setHasIsInTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsInTransition
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setExcludeFromSuggestions:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_excludeFromSuggestions = a3;
}

- (void)setHasExcludeFromSuggestions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasExcludeFromSuggestions
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setTranscriptAlignmentsAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_transcriptAlignmentsAvailable = a3;
}

- (void)setHasTranscriptAlignmentsAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($39A7635802529FA34AF0E2292B825163)(*(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTranscriptAlignmentsAvailable
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRContentItemMetadataProtobuf;
  -[_MRContentItemMetadataProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRContentItemMetadataProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *title;
  NSString *subtitle;
  $39A7635802529FA34AF0E2292B825163 has;
  void *v9;
  NSString *albumName;
  NSString *trackArtistName;
  NSString *albumArtistName;
  NSString *directorName;
  $39A7635802529FA34AF0E2292B825163 v14;
  void *v15;
  NSString *localizedContentRating;
  $39A7635802529FA34AF0E2292B825163 v17;
  void *v18;
  NSString *collectionIdentifier;
  NSString *profileIdentifier;
  void *v21;
  NSString *artworkMIMEType;
  NSString *assetURLString;
  NSString *composer;
  $39A7635802529FA34AF0E2292B825163 v25;
  void *v26;
  void *v27;
  NSString *genre;
  $39A7635802529FA34AF0E2292B825163 v29;
  void *v30;
  NSString *contentIdentifier;
  $39A7635802529FA34AF0E2292B825163 v32;
  void *v33;
  NSString *radioStationName;
  NSString *radioStationString;
  $39A7635802529FA34AF0E2292B825163 v36;
  void *v37;
  NSData *purchaseInfoData;
  $39A7635802529FA34AF0E2292B825163 v39;
  void *v40;
  NSData *appMetricsData;
  NSString *seriesName;
  $39A7635802529FA34AF0E2292B825163 v43;
  void *v44;
  void *v45;
  NSData *nowPlayingInfoData;
  NSData *userInfoData;
  void *v48;
  NSString *artworkURL;
  NSString *lyricsURL;
  NSData *deviceSpecificUserInfoData;
  NSData *collectionInfoData;
  $39A7635802529FA34AF0E2292B825163 v53;
  void *v54;
  void *v55;
  NSString *serviceIdentifier;
  $39A7635802529FA34AF0E2292B825163 v57;
  void *v58;
  void *v59;
  NSData *currentPlaybackDateData;
  NSString *artworkIdentifier;
  void *v62;
  NSData *artworkURLTemplatesData;
  $39A7635802529FA34AF0E2292B825163 v64;
  void *v65;
  void *v66;
  NSString *artworkFileURL;
  NSString *brandIdentifier;
  NSString *localizedDurationString;
  NSString *albumYear;
  $39A7635802529FA34AF0E2292B825163 v71;
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
  int songTraits;
  __CFString *v102;
  int albumTraits;
  __CFString *v104;
  int playlistTraits;
  __CFString *v106;
  _MRAudioFormatProtobuf *preferredFormat;
  void *v108;
  _MRAudioFormatProtobuf *activeFormat;
  void *v110;
  $39A7635802529FA34AF0E2292B825163 v111;
  int activeFormatJustification;
  __CFString *v113;
  int formatTierPreference;
  __CFString *v115;
  _MRAudioRouteProtobuf *audioRoute;
  void *v117;
  void *v118;
  NSMutableArray *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t i;
  void *v124;
  $39A7635802529FA34AF0E2292B825163 v125;
  void *v126;
  void *v127;
  NSString *participantName;
  NSString *participantIdentifier;
  NSString *classicalWork;
  $39A7635802529FA34AF0E2292B825163 v131;
  void *v132;
  NSString *durationStringLocalizationKey;
  void *v134;
  NSString *internationalStandardRecordingCode;
  $39A7635802529FA34AF0E2292B825163 v136;
  void *v137;
  id v138;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v5, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isContainer);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v72, CFSTR("isContainer"));

    has = self->_has;
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(_QWORD *)&has & 0x100000000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPlayable);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v73, CFSTR("isPlayable"));

  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
  {
LABEL_8:
    *(float *)&v4 = self->_playbackProgress;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("playbackProgress"));

  }
LABEL_9:
  albumName = self->_albumName;
  if (albumName)
    objc_msgSend(v5, "setObject:forKey:", albumName, CFSTR("albumName"));
  trackArtistName = self->_trackArtistName;
  if (trackArtistName)
    objc_msgSend(v5, "setObject:forKey:", trackArtistName, CFSTR("trackArtistName"));
  albumArtistName = self->_albumArtistName;
  if (albumArtistName)
    objc_msgSend(v5, "setObject:forKey:", albumArtistName, CFSTR("albumArtistName"));
  directorName = self->_directorName;
  if (directorName)
    objc_msgSend(v5, "setObject:forKey:", directorName, CFSTR("directorName"));
  v14 = self->_has;
  if ((*(_QWORD *)&v14 & 0x2000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_seasonNumber);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v74, CFSTR("seasonNumber"));

    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v14 & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_145;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_episodeNumber);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v75, CFSTR("episodeNumber"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_releaseDate);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v76, CFSTR("releaseDate"));

  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v14 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playCount);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v77, CFSTR("playCount"));

  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("duration"));

  }
LABEL_23:
  localizedContentRating = self->_localizedContentRating;
  if (localizedContentRating)
    objc_msgSend(v5, "setObject:forKey:", localizedContentRating, CFSTR("localizedContentRating"));
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x4000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExplicitItem);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v78, CFSTR("isExplicitItem"));

    v17 = self->_has;
    if ((*(_QWORD *)&v17 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(_QWORD *)&v17 & 0x1000000000) == 0)
        goto LABEL_28;
      goto LABEL_150;
    }
  }
  else if ((*(_QWORD *)&v17 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playlistType);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v79, CFSTR("playlistType"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&v17 & 0x40000000000) == 0)
      goto LABEL_29;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_radioStationType);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v80, CFSTR("radioStationType"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&v17 & 0x200000000000) == 0)
      goto LABEL_30;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_artworkAvailable);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v81, CFSTR("artworkAvailable"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&v17 & 0x1000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_infoAvailable);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v82, CFSTR("infoAvailable"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v17 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_languageOptionsAvailable);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v83, CFSTR("languageOptionsAvailable"));

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v17 & 0x2000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfSections);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v84, CFSTR("numberOfSections"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0)
      goto LABEL_34;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lyricsAvailable);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v85, CFSTR("lyricsAvailable"));

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v17 & 0x800000000000000) == 0)
      goto LABEL_35;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_editingStyleFlags);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v86, CFSTR("editingStyleFlags"));

  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v17 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStreamingContent);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v87, CFSTR("isStreamingContent"));

  if ((*(_QWORD *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCurrentlyPlaying);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("isCurrentlyPlaying"));

  }
LABEL_37:
  collectionIdentifier = self->_collectionIdentifier;
  if (collectionIdentifier)
    objc_msgSend(v5, "setObject:forKey:", collectionIdentifier, CFSTR("collectionIdentifier"));
  profileIdentifier = self->_profileIdentifier;
  if (profileIdentifier)
    objc_msgSend(v5, "setObject:forKey:", profileIdentifier, CFSTR("profileIdentifier"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("startTime"));

  }
  artworkMIMEType = self->_artworkMIMEType;
  if (artworkMIMEType)
    objc_msgSend(v5, "setObject:forKey:", artworkMIMEType, CFSTR("artworkMIMEType"));
  assetURLString = self->_assetURLString;
  if (assetURLString)
    objc_msgSend(v5, "setObject:forKey:", assetURLString, CFSTR("assetURLString"));
  composer = self->_composer;
  if (composer)
    objc_msgSend(v5, "setObject:forKey:", composer, CFSTR("composer"));
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_discNumber);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("discNumber"));

    v25 = self->_has;
  }
  if ((*(_BYTE *)&v25 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_elapsedTime);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("elapsedTime"));

  }
  genre = self->_genre;
  if (genre)
    objc_msgSend(v5, "setObject:forKey:", genre, CFSTR("genre"));
  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x800000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAlwaysLive);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v88, CFSTR("isAlwaysLive"));

    v29 = self->_has;
    if ((*(_QWORD *)&v29 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v29 & 0x80000) == 0)
        goto LABEL_58;
      goto LABEL_161;
    }
  }
  else if ((*(_QWORD *)&v29 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  *(float *)&v4 = self->_playbackRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v89, CFSTR("playbackRate"));

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v29 & 0x8000000000) == 0)
      goto LABEL_59;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_chapterCount);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v90, CFSTR("chapterCount"));

  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(_QWORD *)&v29 & 0x10000000000) == 0)
      goto LABEL_60;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalDiscCount);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v91, CFSTR("totalDiscCount"));

  v29 = self->_has;
  if ((*(_QWORD *)&v29 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v29 & 0x20000000000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalTrackCount);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v92, CFSTR("totalTrackCount"));

  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
  {
LABEL_61:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackNumber);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("trackNumber"));

  }
LABEL_62:
  contentIdentifier = self->_contentIdentifier;
  if (contentIdentifier)
    objc_msgSend(v5, "setObject:forKey:", contentIdentifier, CFSTR("contentIdentifier"));
  v32 = self->_has;
  if ((*(_QWORD *)&v32 & 0x200000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSharable);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v93, CFSTR("isSharable"));

    v32 = self->_has;
    if ((*(_QWORD *)&v32 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(_QWORD *)&v32 & 0x10000000000000) == 0)
        goto LABEL_67;
      goto LABEL_167;
    }
  }
  else if ((*(_QWORD *)&v32 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLiked);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v94, CFSTR("isLiked"));

  v32 = self->_has;
  if ((*(_QWORD *)&v32 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v32 & 0x800) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInWishList);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v95, CFSTR("isInWishList"));

  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_68:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_radioStationIdentifier);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("radioStationIdentifier"));

  }
LABEL_69:
  radioStationName = self->_radioStationName;
  if (radioStationName)
    objc_msgSend(v5, "setObject:forKey:", radioStationName, CFSTR("radioStationName"));
  radioStationString = self->_radioStationString;
  if (radioStationString)
    objc_msgSend(v5, "setObject:forKey:", radioStationString, CFSTR("radioStationString"));
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_iTunesStoreIdentifier);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v96, CFSTR("iTunesStoreIdentifier"));

    v36 = self->_has;
    if ((*(_BYTE *)&v36 & 0x80) == 0)
    {
LABEL_75:
      if ((*(_BYTE *)&v36 & 0x20) == 0)
        goto LABEL_76;
      goto LABEL_171;
    }
  }
  else if ((*(_BYTE *)&v36 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_iTunesStoreSubscriptionIdentifier);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v97, CFSTR("iTunesStoreSubscriptionIdentifier"));

  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x20) == 0)
  {
LABEL_76:
    if ((*(_BYTE *)&v36 & 0x10) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_iTunesStoreArtistIdentifier);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v98, CFSTR("iTunesStoreArtistIdentifier"));

  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_77:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_iTunesStoreAlbumIdentifier);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("iTunesStoreAlbumIdentifier"));

  }
LABEL_78:
  purchaseInfoData = self->_purchaseInfoData;
  if (purchaseInfoData)
    objc_msgSend(v5, "setObject:forKey:", purchaseInfoData, CFSTR("purchaseInfoData"));
  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x100000) != 0)
  {
    *(float *)&v4 = self->_defaultPlaybackRate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v99, CFSTR("defaultPlaybackRate"));

    v39 = self->_has;
    if ((*(_DWORD *)&v39 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v39 & 0x400000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v39 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_downloadState);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v100, CFSTR("downloadState"));

  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_83:
    *(float *)&v4 = self->_downloadProgress;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v40, CFSTR("downloadProgress"));

  }
LABEL_84:
  appMetricsData = self->_appMetricsData;
  if (appMetricsData)
    objc_msgSend(v5, "setObject:forKey:", appMetricsData, CFSTR("appMetricsData"));
  seriesName = self->_seriesName;
  if (seriesName)
    objc_msgSend(v5, "setObject:forKey:", seriesName, CFSTR("seriesName"));
  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mediaType);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v44, CFSTR("mediaType"));

    v43 = self->_has;
  }
  if ((*(_DWORD *)&v43 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mediaSubType);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v45, CFSTR("mediaSubType"));

  }
  nowPlayingInfoData = self->_nowPlayingInfoData;
  if (nowPlayingInfoData)
    objc_msgSend(v5, "setObject:forKey:", nowPlayingInfoData, CFSTR("nowPlayingInfoData"));
  userInfoData = self->_userInfoData;
  if (userInfoData)
    objc_msgSend(v5, "setObject:forKey:", userInfoData, CFSTR("userInfoData"));
  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSteerable);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("isSteerable"));

  }
  artworkURL = self->_artworkURL;
  if (artworkURL)
    objc_msgSend(v5, "setObject:forKey:", artworkURL, CFSTR("artworkURL"));
  lyricsURL = self->_lyricsURL;
  if (lyricsURL)
    objc_msgSend(v5, "setObject:forKey:", lyricsURL, CFSTR("lyricsURL"));
  deviceSpecificUserInfoData = self->_deviceSpecificUserInfoData;
  if (deviceSpecificUserInfoData)
    objc_msgSend(v5, "setObject:forKey:", deviceSpecificUserInfoData, CFSTR("deviceSpecificUserInfoData"));
  collectionInfoData = self->_collectionInfoData;
  if (collectionInfoData)
    objc_msgSend(v5, "setObject:forKey:", collectionInfoData, CFSTR("collectionInfoData"));
  v53 = self->_has;
  if ((*(_BYTE *)&v53 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_elapsedTimeTimestamp);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v54, CFSTR("elapsedTimeTimestamp"));

    v53 = self->_has;
  }
  if ((*(_WORD *)&v53 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inferredTimestamp);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v55, CFSTR("inferredTimestamp"));

  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
    objc_msgSend(v5, "setObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_artworkDataWidthDeprecated);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v58, CFSTR("artworkDataWidthDeprecated"));

    v57 = self->_has;
  }
  if ((*(_DWORD *)&v57 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_artworkDataHeightDeprecated);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v59, CFSTR("artworkDataHeightDeprecated"));

  }
  currentPlaybackDateData = self->_currentPlaybackDateData;
  if (currentPlaybackDateData)
    objc_msgSend(v5, "setObject:forKey:", currentPlaybackDateData, CFSTR("currentPlaybackDateData"));
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier)
    objc_msgSend(v5, "setObject:forKey:", artworkIdentifier, CFSTR("artworkIdentifier"));
  if ((*((_BYTE *)&self->_has + 6) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLoading);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v62, CFSTR("isLoading"));

  }
  artworkURLTemplatesData = self->_artworkURLTemplatesData;
  if (artworkURLTemplatesData)
    objc_msgSend(v5, "setObject:forKey:", artworkURLTemplatesData, CFSTR("artworkURLTemplatesData"));
  v64 = self->_has;
  if ((*(_WORD *)&v64 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_legacyUniqueIdentifier);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v65, CFSTR("legacyUniqueIdentifier"));

    v64 = self->_has;
  }
  if ((*(_DWORD *)&v64 & 0x4000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_episodeType);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v66, CFSTR("episodeType"));

  }
  artworkFileURL = self->_artworkFileURL;
  if (artworkFileURL)
    objc_msgSend(v5, "setObject:forKey:", artworkFileURL, CFSTR("artworkFileURL"));
  brandIdentifier = self->_brandIdentifier;
  if (brandIdentifier)
    objc_msgSend(v5, "setObject:forKey:", brandIdentifier, CFSTR("brandIdentifier"));
  localizedDurationString = self->_localizedDurationString;
  if (localizedDurationString)
    objc_msgSend(v5, "setObject:forKey:", localizedDurationString, CFSTR("localizedDurationString"));
  albumYear = self->_albumYear;
  if (albumYear)
    objc_msgSend(v5, "setObject:forKey:", albumYear, CFSTR("albumYear"));
  v71 = self->_has;
  if ((*(_QWORD *)&v71 & 0x4000000000) != 0)
  {
    songTraits = self->_songTraits;
    v102 = CFSTR("None");
    switch(songTraits)
    {
      case 0:
        break;
      case 1:
        v102 = CFSTR("AppleDigitalMaster");
        break;
      case 2:
        v102 = CFSTR("Loseless");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_181;
      case 4:
        v102 = CFSTR("HighResolutionLossless");
        break;
      case 8:
        v102 = CFSTR("Spatial");
        break;
      default:
        if (songTraits == 16)
        {
          v102 = CFSTR("Atmos");
        }
        else if (songTraits == 32)
        {
          v102 = CFSTR("Surround");
        }
        else
        {
LABEL_181:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_songTraits);
          v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v5, "setObject:forKey:", v102, CFSTR("songTraits"));

    v71 = self->_has;
    if ((*(_DWORD *)&v71 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(_QWORD *)&v71 & 0x400000000) == 0)
        goto LABEL_211;
LABEL_198:
      playlistTraits = self->_playlistTraits;
      if (playlistTraits <= 15)
      {
        if (!playlistTraits)
        {
          v106 = CFSTR("None");
          goto LABEL_210;
        }
        if (playlistTraits == 8)
        {
          v106 = CFSTR("Spatial");
          goto LABEL_210;
        }
      }
      else
      {
        switch(playlistTraits)
        {
          case 16:
            v106 = CFSTR("Atmos");
            goto LABEL_210;
          case 32:
            v106 = CFSTR("Surround");
            goto LABEL_210;
          case 256:
            v106 = CFSTR("Sing");
LABEL_210:
            objc_msgSend(v5, "setObject:forKey:", v106, CFSTR("playlistTraits"));

            goto LABEL_211;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playlistTraits);
      v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_210;
    }
  }
  else if ((*(_DWORD *)&v71 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  albumTraits = self->_albumTraits;
  v104 = CFSTR("None");
  switch(albumTraits)
  {
    case 0:
      break;
    case 1:
      v104 = CFSTR("AppleDigitalMaster");
      break;
    case 2:
      v104 = CFSTR("Loseless");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_192;
    case 4:
      v104 = CFSTR("HighResolutionLossless");
      break;
    case 8:
      v104 = CFSTR("Spatial");
      break;
    default:
      if (albumTraits == 16)
      {
        v104 = CFSTR("Atmos");
      }
      else if (albumTraits == 32)
      {
        v104 = CFSTR("Surround");
      }
      else
      {
LABEL_192:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_albumTraits);
        v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  objc_msgSend(v5, "setObject:forKey:", v104, CFSTR("albumTraits"));

  if ((*(_QWORD *)&self->_has & 0x400000000) != 0)
    goto LABEL_198;
LABEL_211:
  preferredFormat = self->_preferredFormat;
  if (preferredFormat)
  {
    -[_MRAudioFormatProtobuf dictionaryRepresentation](preferredFormat, "dictionaryRepresentation");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v108, CFSTR("preferredFormat"));

  }
  activeFormat = self->_activeFormat;
  if (activeFormat)
  {
    -[_MRAudioFormatProtobuf dictionaryRepresentation](activeFormat, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v110, CFSTR("activeFormat"));

  }
  v111 = self->_has;
  if ((*(_WORD *)&v111 & 0x8000) != 0)
  {
    activeFormatJustification = self->_activeFormatJustification;
    if (activeFormatJustification <= 100)
    {
      switch(activeFormatJustification)
      {
        case 0:
          v113 = CFSTR("Unknown");
          goto LABEL_233;
        case 1:
          v113 = CFSTR("Unavailable");
          goto LABEL_233;
        case 100:
          v113 = CFSTR("UserPreference");
          goto LABEL_233;
      }
    }
    else if (activeFormatJustification > 500)
    {
      if (activeFormatJustification == 501)
      {
        v113 = CFSTR("RouteUnknownCompatibility");
        goto LABEL_233;
      }
      if (activeFormatJustification == 1000)
      {
        v113 = CFSTR("BandwidthInsufficient");
        goto LABEL_233;
      }
    }
    else
    {
      if (activeFormatJustification == 101)
      {
        v113 = CFSTR("UserDownload");
        goto LABEL_233;
      }
      if (activeFormatJustification == 500)
      {
        v113 = CFSTR("RouteIncompatible");
LABEL_233:
        objc_msgSend(v5, "setObject:forKey:", v113, CFSTR("activeFormatJustification"));

        v111 = self->_has;
        goto LABEL_234;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activeFormatJustification);
    v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_233;
  }
LABEL_234:
  if ((*(_DWORD *)&v111 & 0x8000000) != 0)
  {
    formatTierPreference = self->_formatTierPreference;
    v115 = CFSTR("LowBandwidthStereo");
    switch(formatTierPreference)
    {
      case 1:
        break;
      case 2:
        v115 = CFSTR("HighQualityStereo");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_239;
      case 4:
        v115 = CFSTR("Lossless");
        break;
      case 8:
        v115 = CFSTR("HighResolutionLossless");
        break;
      default:
        if (formatTierPreference == 16)
        {
          v115 = CFSTR("Spatial");
        }
        else
        {
LABEL_239:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_formatTierPreference);
          v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v5, "setObject:forKey:", v115, CFSTR("formatTierPreference"));

  }
  audioRoute = self->_audioRoute;
  if (audioRoute)
  {
    -[_MRAudioRouteProtobuf dictionaryRepresentation](audioRoute, "dictionaryRepresentation");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v117, CFSTR("audioRoute"));

  }
  if (-[NSMutableArray count](self->_alternativeFormats, "count"))
  {
    v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_alternativeFormats, "count"));
    v144 = 0u;
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v119 = self->_alternativeFormats;
    v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v145;
      do
      {
        for (i = 0; i != v121; ++i)
        {
          if (*(_QWORD *)v145 != v122)
            objc_enumerationMutation(v119);
          objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * i), "dictionaryRepresentation");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "addObject:", v124);

        }
        v121 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v119, "countByEnumeratingWithState:objects:count:", &v144, v148, 16);
      }
      while (v121);
    }

    objc_msgSend(v5, "setObject:forKey:", v118, CFSTR("alternativeFormats"));
  }
  v125 = self->_has;
  if ((*(_QWORD *)&v125 & 0x400000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAdvertisement);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v126, CFSTR("isAdvertisement"));

    v125 = self->_has;
  }
  if ((*(_QWORD *)&v125 & 0x100000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAlternativeFormats);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v127, CFSTR("hasAlternativeFormats"));

  }
  participantName = self->_participantName;
  if (participantName)
    objc_msgSend(v5, "setObject:forKey:", participantName, CFSTR("participantName"));
  participantIdentifier = self->_participantIdentifier;
  if (participantIdentifier)
    objc_msgSend(v5, "setObject:forKey:", participantIdentifier, CFSTR("participantIdentifier"));
  classicalWork = self->_classicalWork;
  if (classicalWork)
    objc_msgSend(v5, "setObject:forKey:", classicalWork, CFSTR("classicalWork"));
  v131 = self->_has;
  if ((*(_WORD *)&v131 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportingAdamID);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v140, CFSTR("reportingAdamID"));

    v131 = self->_has;
    if ((*(_WORD *)&v131 & 0x400) == 0)
    {
LABEL_266:
      if ((*(_BYTE *)&v131 & 8) == 0)
        goto LABEL_268;
      goto LABEL_267;
    }
  }
  else if ((*(_WORD *)&v131 & 0x400) == 0)
  {
    goto LABEL_266;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lyricsAdamID);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v141, CFSTR("lyricsAdamID"));

  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_267:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_iTunesStoreAlbumArtistIdentifier);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v132, CFSTR("iTunesStoreAlbumArtistIdentifier"));

  }
LABEL_268:
  durationStringLocalizationKey = self->_durationStringLocalizationKey;
  if (durationStringLocalizationKey)
    objc_msgSend(v5, "setObject:forKey:", durationStringLocalizationKey, CFSTR("durationStringLocalizationKey"));
  if ((*((_BYTE *)&self->_has + 7) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isResolvableParticipant);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v134, CFSTR("isResolvableParticipant"));

  }
  internationalStandardRecordingCode = self->_internationalStandardRecordingCode;
  if (internationalStandardRecordingCode)
    objc_msgSend(v5, "setObject:forKey:", internationalStandardRecordingCode, CFSTR("internationalStandardRecordingCode"));
  v136 = self->_has;
  if ((*(_QWORD *)&v136 & 0x8000000000000) == 0)
  {
    if ((*(_QWORD *)&v136 & 0x80000000000) == 0)
      goto LABEL_276;
LABEL_283:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_excludeFromSuggestions);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v143, CFSTR("excludeFromSuggestions"));

    if ((*(_QWORD *)&self->_has & 0x4000000000000000) == 0)
      goto LABEL_278;
    goto LABEL_277;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInTransition);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v142, CFSTR("isInTransition"));

  v136 = self->_has;
  if ((*(_QWORD *)&v136 & 0x80000000000) != 0)
    goto LABEL_283;
LABEL_276:
  if ((*(_QWORD *)&v136 & 0x4000000000000000) != 0)
  {
LABEL_277:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_transcriptAlignmentsAvailable);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v137, CFSTR("transcriptAlignmentsAvailable"));

  }
LABEL_278:
  v138 = v5;

  return v138;
}

- (BOOL)readFrom:(id)a3
{
  return _MRContentItemMetadataProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  $39A7635802529FA34AF0E2292B825163 has;
  $39A7635802529FA34AF0E2292B825163 v6;
  $39A7635802529FA34AF0E2292B825163 v7;
  $39A7635802529FA34AF0E2292B825163 v8;
  $39A7635802529FA34AF0E2292B825163 v9;
  $39A7635802529FA34AF0E2292B825163 v10;
  $39A7635802529FA34AF0E2292B825163 v11;
  $39A7635802529FA34AF0E2292B825163 v12;
  $39A7635802529FA34AF0E2292B825163 v13;
  $39A7635802529FA34AF0E2292B825163 v14;
  $39A7635802529FA34AF0E2292B825163 v15;
  $39A7635802529FA34AF0E2292B825163 v16;
  $39A7635802529FA34AF0E2292B825163 v17;
  $39A7635802529FA34AF0E2292B825163 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  $39A7635802529FA34AF0E2292B825163 v23;
  _QWORD *v24;
  $39A7635802529FA34AF0E2292B825163 v25;
  $39A7635802529FA34AF0E2292B825163 v26;
  id v27;

  v4 = a3;
  v27 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v27;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v27, "setSubtitle:");
    v4 = v27;
  }
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *((_BYTE *)v4 + 614) = self->_isContainer;
    *((_QWORD *)v4 + 79) |= 0x1000000000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((*(_QWORD *)&has & 0x100000000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 621) = self->_isPlayable;
  *((_QWORD *)v4 + 79) |= 0x80000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 117) = LODWORD(self->_playbackProgress);
    *((_QWORD *)v4 + 79) |= 0x100000000uLL;
  }
LABEL_9:
  if (self->_albumName)
  {
    objc_msgSend(v27, "setAlbumName:");
    v4 = v27;
  }
  if (self->_trackArtistName)
  {
    objc_msgSend(v27, "setTrackArtistName:");
    v4 = v27;
  }
  if (self->_albumArtistName)
  {
    objc_msgSend(v27, "setAlbumArtistName:");
    v4 = v27;
  }
  if (self->_directorName)
  {
    objc_msgSend(v27, "setDirectorName:");
    v4 = v27;
  }
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000) != 0)
  {
    *((_DWORD *)v4 + 133) = self->_seasonNumber;
    *((_QWORD *)v4 + 79) |= 0x2000000000uLL;
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_184;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 93) = self->_episodeNumber;
  *((_QWORD *)v4 + 79) |= 0x2000000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_185;
  }
LABEL_184:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_releaseDate;
  *((_QWORD *)v4 + 79) |= 0x1000uLL;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_185:
  *((_DWORD *)v4 + 116) = self->_playCount;
  *((_QWORD *)v4 + 79) |= 0x80000000uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_22:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_duration;
    *((_QWORD *)v4 + 79) |= 1uLL;
  }
LABEL_23:
  if (self->_localizedContentRating)
  {
    objc_msgSend(v27, "setLocalizedContentRating:");
    v4 = v27;
  }
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x4000000000000) != 0)
  {
    *((_BYTE *)v4 + 616) = self->_isExplicitItem;
    *((_QWORD *)v4 + 79) |= 0x4000000000000uLL;
    v7 = self->_has;
    if ((*(_QWORD *)&v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
        goto LABEL_28;
      goto LABEL_189;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)v4 + 120) = self->_playlistType;
  *((_QWORD *)v4 + 79) |= 0x800000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
      goto LABEL_29;
    goto LABEL_190;
  }
LABEL_189:
  *((_DWORD *)v4 + 132) = self->_radioStationType;
  *((_QWORD *)v4 + 79) |= 0x1000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((*(_QWORD *)&v7 & 0x200000000000) == 0)
      goto LABEL_30;
    goto LABEL_191;
  }
LABEL_190:
  *((_BYTE *)v4 + 608) = self->_artworkAvailable;
  *((_QWORD *)v4 + 79) |= 0x40000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_192;
  }
LABEL_191:
  *((_BYTE *)v4 + 611) = self->_infoAvailable;
  *((_QWORD *)v4 + 79) |= 0x200000000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_193;
  }
LABEL_192:
  *((_BYTE *)v4 + 626) = self->_languageOptionsAvailable;
  *((_QWORD *)v4 + 79) |= 0x1000000000000000uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v7 & 0x2000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_194;
  }
LABEL_193:
  *((_DWORD *)v4 + 110) = self->_numberOfSections;
  *((_QWORD *)v4 + 79) |= 0x40000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_34;
    goto LABEL_195;
  }
LABEL_194:
  *((_BYTE *)v4 + 627) = self->_lyricsAvailable;
  *((_QWORD *)v4 + 79) |= 0x2000000000000000uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
      goto LABEL_35;
    goto LABEL_196;
  }
LABEL_195:
  *((_DWORD *)v4 + 92) = self->_editingStyleFlags;
  *((_QWORD *)v4 + 79) |= 0x1000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((*(_QWORD *)&v7 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_196:
  *((_BYTE *)v4 + 625) = self->_isStreamingContent;
  *((_QWORD *)v4 + 79) |= 0x800000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_36:
    *((_BYTE *)v4 + 615) = self->_isCurrentlyPlaying;
    *((_QWORD *)v4 + 79) |= 0x2000000000000uLL;
  }
LABEL_37:
  if (self->_collectionIdentifier)
  {
    objc_msgSend(v27, "setCollectionIdentifier:");
    v4 = v27;
  }
  if (self->_profileIdentifier)
  {
    objc_msgSend(v27, "setProfileIdentifier:");
    v4 = v27;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_startTime;
    *((_QWORD *)v4 + 79) |= 0x4000uLL;
  }
  if (self->_artworkMIMEType)
  {
    objc_msgSend(v27, "setArtworkMIMEType:");
    v4 = v27;
  }
  if (self->_assetURLString)
  {
    objc_msgSend(v27, "setAssetURLString:");
    v4 = v27;
  }
  if (self->_composer)
  {
    objc_msgSend(v27, "setComposer:");
    v4 = v27;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 86) = self->_discNumber;
    *((_QWORD *)v4 + 79) |= 0x200000uLL;
    v8 = self->_has;
  }
  if ((*(_BYTE *)&v8 & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_elapsedTime;
    *((_QWORD *)v4 + 79) |= 2uLL;
  }
  if (self->_genre)
  {
    objc_msgSend(v27, "setGenre:");
    v4 = v27;
  }
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x800000000000) != 0)
  {
    *((_BYTE *)v4 + 613) = self->_isAlwaysLive;
    *((_QWORD *)v4 + 79) |= 0x800000000000uLL;
    v9 = self->_has;
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((*(_DWORD *)&v9 & 0x80000) == 0)
        goto LABEL_58;
      goto LABEL_200;
    }
  }
  else if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  *((_DWORD *)v4 + 118) = LODWORD(self->_playbackRate);
  *((_QWORD *)v4 + 79) |= 0x200000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
      goto LABEL_59;
    goto LABEL_201;
  }
LABEL_200:
  *((_DWORD *)v4 + 66) = self->_chapterCount;
  *((_QWORD *)v4 + 79) |= 0x80000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
      goto LABEL_60;
    goto LABEL_202;
  }
LABEL_201:
  *((_DWORD *)v4 + 144) = self->_totalDiscCount;
  *((_QWORD *)v4 + 79) |= 0x8000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_202:
  *((_DWORD *)v4 + 145) = self->_totalTrackCount;
  *((_QWORD *)v4 + 79) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
  {
LABEL_61:
    *((_DWORD *)v4 + 148) = self->_trackNumber;
    *((_QWORD *)v4 + 79) |= 0x20000000000uLL;
  }
LABEL_62:
  if (self->_contentIdentifier)
  {
    objc_msgSend(v27, "setContentIdentifier:");
    v4 = v27;
  }
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x200000000000000) != 0)
  {
    *((_BYTE *)v4 + 623) = self->_isSharable;
    *((_QWORD *)v4 + 79) |= 0x200000000000000uLL;
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((*(_QWORD *)&v10 & 0x10000000000000) == 0)
        goto LABEL_67;
      goto LABEL_206;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  *((_BYTE *)v4 + 619) = self->_isLiked;
  *((_QWORD *)v4 + 79) |= 0x20000000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_206:
  *((_BYTE *)v4 + 618) = self->_isInWishList;
  *((_QWORD *)v4 + 79) |= 0x10000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_68:
    *((_QWORD *)v4 + 12) = self->_radioStationIdentifier;
    *((_QWORD *)v4 + 79) |= 0x800uLL;
  }
LABEL_69:
  if (self->_radioStationName)
  {
    objc_msgSend(v27, "setRadioStationName:");
    v4 = v27;
  }
  if (self->_radioStationString)
  {
    objc_msgSend(v27, "setRadioStationString:");
    v4 = v27;
  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    *((_QWORD *)v4 + 7) = self->_iTunesStoreIdentifier;
    *((_QWORD *)v4 + 79) |= 0x40uLL;
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_75:
      if ((*(_BYTE *)&v11 & 0x20) == 0)
        goto LABEL_76;
      goto LABEL_210;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  *((_QWORD *)v4 + 8) = self->_iTunesStoreSubscriptionIdentifier;
  *((_QWORD *)v4 + 79) |= 0x80uLL;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) == 0)
  {
LABEL_76:
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_210:
  *((_QWORD *)v4 + 6) = self->_iTunesStoreArtistIdentifier;
  *((_QWORD *)v4 + 79) |= 0x20uLL;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_77:
    *((_QWORD *)v4 + 5) = self->_iTunesStoreAlbumIdentifier;
    *((_QWORD *)v4 + 79) |= 0x10uLL;
  }
LABEL_78:
  if (self->_purchaseInfoData)
  {
    objc_msgSend(v27, "setPurchaseInfoData:");
    v4 = v27;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    *((_DWORD *)v4 + 80) = LODWORD(self->_defaultPlaybackRate);
    *((_QWORD *)v4 + 79) |= 0x100000uLL;
    v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v12 & 0x400000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  *((_DWORD *)v4 + 88) = self->_downloadState;
  *((_QWORD *)v4 + 79) |= 0x800000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_83:
    *((_DWORD *)v4 + 87) = LODWORD(self->_downloadProgress);
    *((_QWORD *)v4 + 79) |= 0x400000uLL;
  }
LABEL_84:
  if (self->_appMetricsData)
  {
    objc_msgSend(v27, "setAppMetricsData:");
    v4 = v27;
  }
  if (self->_seriesName)
  {
    objc_msgSend(v27, "setSeriesName:");
    v4 = v27;
  }
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
    *((_DWORD *)v4 + 107) = self->_mediaType;
    *((_QWORD *)v4 + 79) |= 0x20000000uLL;
    v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x10000000) != 0)
  {
    *((_DWORD *)v4 + 106) = self->_mediaSubType;
    *((_QWORD *)v4 + 79) |= 0x10000000uLL;
  }
  if (self->_nowPlayingInfoData)
  {
    objc_msgSend(v27, "setNowPlayingInfoData:");
    v4 = v27;
  }
  if (self->_userInfoData)
  {
    objc_msgSend(v27, "setUserInfoData:");
    v4 = v27;
  }
  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
  {
    *((_BYTE *)v4 + 624) = self->_isSteerable;
    *((_QWORD *)v4 + 79) |= 0x400000000000000uLL;
  }
  if (self->_artworkURL)
  {
    objc_msgSend(v27, "setArtworkURL:");
    v4 = v27;
  }
  if (self->_lyricsURL)
  {
    objc_msgSend(v27, "setLyricsURL:");
    v4 = v27;
  }
  if (self->_deviceSpecificUserInfoData)
  {
    objc_msgSend(v27, "setDeviceSpecificUserInfoData:");
    v4 = v27;
  }
  if (self->_collectionInfoData)
  {
    objc_msgSend(v27, "setCollectionInfoData:");
    v4 = v27;
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_elapsedTimeTimestamp;
    *((_QWORD *)v4 + 79) |= 4uLL;
    v14 = self->_has;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_inferredTimestamp;
    *((_QWORD *)v4 + 79) |= 0x100uLL;
  }
  if (self->_serviceIdentifier)
  {
    objc_msgSend(v27, "setServiceIdentifier:");
    v4 = v27;
  }
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *((_DWORD *)v4 + 49) = self->_artworkDataWidthDeprecated;
    *((_QWORD *)v4 + 79) |= 0x40000uLL;
    v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 48) = self->_artworkDataHeightDeprecated;
    *((_QWORD *)v4 + 79) |= 0x20000uLL;
  }
  if (self->_currentPlaybackDateData)
  {
    objc_msgSend(v27, "setCurrentPlaybackDateData:");
    v4 = v27;
  }
  if (self->_artworkIdentifier)
  {
    objc_msgSend(v27, "setArtworkIdentifier:");
    v4 = v27;
  }
  if ((*((_BYTE *)&self->_has + 6) & 0x40) != 0)
  {
    *((_BYTE *)v4 + 620) = self->_isLoading;
    *((_QWORD *)v4 + 79) |= 0x40000000000000uLL;
  }
  if (self->_artworkURLTemplatesData)
  {
    objc_msgSend(v27, "setArtworkURLTemplatesData:");
    v4 = v27;
  }
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    *((_QWORD *)v4 + 10) = self->_legacyUniqueIdentifier;
    *((_QWORD *)v4 + 79) |= 0x200uLL;
    v16 = self->_has;
  }
  if ((*(_DWORD *)&v16 & 0x4000000) != 0)
  {
    *((_DWORD *)v4 + 94) = self->_episodeType;
    *((_QWORD *)v4 + 79) |= 0x4000000uLL;
  }
  if (self->_artworkFileURL)
  {
    objc_msgSend(v27, "setArtworkFileURL:");
    v4 = v27;
  }
  if (self->_brandIdentifier)
  {
    objc_msgSend(v27, "setBrandIdentifier:");
    v4 = v27;
  }
  if (self->_localizedDurationString)
  {
    objc_msgSend(v27, "setLocalizedDurationString:");
    v4 = v27;
  }
  if (self->_albumYear)
  {
    objc_msgSend(v27, "setAlbumYear:");
    v4 = v27;
  }
  v17 = self->_has;
  if ((*(_QWORD *)&v17 & 0x4000000000) != 0)
  {
    *((_DWORD *)v4 + 138) = self->_songTraits;
    *((_QWORD *)v4 + 79) |= 0x4000000000uLL;
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((*(_QWORD *)&v17 & 0x400000000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  *((_DWORD *)v4 + 40) = self->_albumTraits;
  *((_QWORD *)v4 + 79) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000000) != 0)
  {
LABEL_139:
    *((_DWORD *)v4 + 119) = self->_playlistTraits;
    *((_QWORD *)v4 + 79) |= 0x400000000uLL;
  }
LABEL_140:
  if (self->_preferredFormat)
  {
    objc_msgSend(v27, "setPreferredFormat:");
    v4 = v27;
  }
  if (self->_activeFormat)
  {
    objc_msgSend(v27, "setActiveFormat:");
    v4 = v27;
  }
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_activeFormatJustification;
    *((_QWORD *)v4 + 79) |= 0x8000uLL;
    v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x8000000) != 0)
  {
    *((_DWORD *)v4 + 95) = self->_formatTierPreference;
    *((_QWORD *)v4 + 79) |= 0x8000000uLL;
  }
  if (self->_audioRoute)
    objc_msgSend(v27, "setAudioRoute:");
  if (-[_MRContentItemMetadataProtobuf alternativeFormatsCount](self, "alternativeFormatsCount"))
  {
    objc_msgSend(v27, "clearAlternativeFormats");
    v19 = -[_MRContentItemMetadataProtobuf alternativeFormatsCount](self, "alternativeFormatsCount");
    if (v19)
    {
      v20 = v19;
      for (i = 0; i != v20; ++i)
      {
        -[_MRContentItemMetadataProtobuf alternativeFormatsAtIndex:](self, "alternativeFormatsAtIndex:", i);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addAlternativeFormats:", v22);

      }
    }
  }
  v23 = self->_has;
  v24 = v27;
  if ((*(_QWORD *)&v23 & 0x400000000000) != 0)
  {
    *((_BYTE *)v27 + 612) = self->_isAdvertisement;
    *((_QWORD *)v27 + 79) |= 0x400000000000uLL;
    v23 = self->_has;
  }
  if ((*(_QWORD *)&v23 & 0x100000000000) != 0)
  {
    *((_BYTE *)v27 + 610) = self->_hasAlternativeFormats;
    *((_QWORD *)v27 + 79) |= 0x100000000000uLL;
  }
  if (self->_participantName)
  {
    objc_msgSend(v27, "setParticipantName:");
    v24 = v27;
  }
  if (self->_participantIdentifier)
  {
    objc_msgSend(v27, "setParticipantIdentifier:");
    v24 = v27;
  }
  if (self->_classicalWork)
  {
    objc_msgSend(v27, "setClassicalWork:");
    v24 = v27;
  }
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) != 0)
  {
    v24[14] = self->_reportingAdamID;
    v24[79] |= 0x2000uLL;
    v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_166:
      if ((*(_BYTE *)&v25 & 8) == 0)
        goto LABEL_168;
      goto LABEL_167;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_166;
  }
  v24[11] = self->_lyricsAdamID;
  v24[79] |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_167:
    v24[4] = self->_iTunesStoreAlbumArtistIdentifier;
    v24[79] |= 8uLL;
  }
LABEL_168:
  if (self->_durationStringLocalizationKey)
  {
    objc_msgSend(v27, "setDurationStringLocalizationKey:");
    v24 = v27;
  }
  if ((*((_BYTE *)&self->_has + 7) & 1) != 0)
  {
    *((_BYTE *)v24 + 622) = self->_isResolvableParticipant;
    v24[79] |= 0x100000000000000uLL;
  }
  if (self->_internationalStandardRecordingCode)
  {
    objc_msgSend(v27, "setInternationalStandardRecordingCode:");
    v24 = v27;
  }
  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x8000000000000) == 0)
  {
    if ((*(_QWORD *)&v26 & 0x80000000000) == 0)
      goto LABEL_176;
LABEL_222:
    *((_BYTE *)v24 + 609) = self->_excludeFromSuggestions;
    v24[79] |= 0x80000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x4000000000000000) == 0)
      goto LABEL_178;
    goto LABEL_177;
  }
  *((_BYTE *)v24 + 617) = self->_isInTransition;
  v24[79] |= 0x8000000000000uLL;
  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x80000000000) != 0)
    goto LABEL_222;
LABEL_176:
  if ((*(_QWORD *)&v26 & 0x4000000000000000) != 0)
  {
LABEL_177:
    *((_BYTE *)v24 + 628) = self->_transcriptAlignmentsAvailable;
    v24[79] |= 0x4000000000000000uLL;
  }
LABEL_178:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $39A7635802529FA34AF0E2292B825163 has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  $39A7635802529FA34AF0E2292B825163 v19;
  uint64_t v20;
  void *v21;
  $39A7635802529FA34AF0E2292B825163 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  $39A7635802529FA34AF0E2292B825163 v33;
  uint64_t v34;
  void *v35;
  $39A7635802529FA34AF0E2292B825163 v36;
  uint64_t v37;
  void *v38;
  $39A7635802529FA34AF0E2292B825163 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  $39A7635802529FA34AF0E2292B825163 v44;
  uint64_t v45;
  void *v46;
  $39A7635802529FA34AF0E2292B825163 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  $39A7635802529FA34AF0E2292B825163 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  $39A7635802529FA34AF0E2292B825163 v65;
  uint64_t v66;
  void *v67;
  $39A7635802529FA34AF0E2292B825163 v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  $39A7635802529FA34AF0E2292B825163 v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  $39A7635802529FA34AF0E2292B825163 v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  $39A7635802529FA34AF0E2292B825163 v89;
  id v90;
  void *v91;
  NSMutableArray *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  $39A7635802529FA34AF0E2292B825163 v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  $39A7635802529FA34AF0E2292B825163 v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  $39A7635802529FA34AF0E2292B825163 v110;
  id v111;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 568);
  *(_QWORD *)(v5 + 568) = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 560);
  *(_QWORD *)(v5 + 560) = v8;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *(_BYTE *)(v5 + 614) = self->_isContainer;
    *(_QWORD *)(v5 + 632) |= 0x1000000000000uLL;
    has = self->_has;
    if ((*(_QWORD *)&has & 0x80000000000000) == 0)
    {
LABEL_3:
      if ((*(_QWORD *)&has & 0x100000000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_QWORD *)&has & 0x80000000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 621) = self->_isPlayable;
  *(_QWORD *)(v5 + 632) |= 0x80000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
  {
LABEL_4:
    *(float *)(v5 + 468) = self->_playbackProgress;
    *(_QWORD *)(v5 + 632) |= 0x100000000uLL;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v11;

  v13 = -[NSString copyWithZone:](self->_trackArtistName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 584);
  *(_QWORD *)(v5 + 584) = v13;

  v15 = -[NSString copyWithZone:](self->_albumArtistName, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v15;

  v17 = -[NSString copyWithZone:](self->_directorName, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v17;

  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x2000000000) != 0)
  {
    *(_DWORD *)(v5 + 532) = self->_seasonNumber;
    *(_QWORD *)(v5 + 632) |= 0x2000000000uLL;
    v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x2000000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v19 & 0x1000) == 0)
        goto LABEL_8;
      goto LABEL_105;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x2000000) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 372) = self->_episodeNumber;
  *(_QWORD *)(v5 + 632) |= 0x2000000uLL;
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&v19 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_106;
  }
LABEL_105:
  *(double *)(v5 + 104) = self->_releaseDate;
  *(_QWORD *)(v5 + 632) |= 0x1000uLL;
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x80000000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v19 & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_106:
  *(_DWORD *)(v5 + 464) = self->_playCount;
  *(_QWORD *)(v5 + 632) |= 0x80000000uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_10:
    *(double *)(v5 + 8) = self->_duration;
    *(_QWORD *)(v5 + 632) |= 1uLL;
  }
LABEL_11:
  v20 = -[NSString copyWithZone:](self->_localizedContentRating, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v20;

  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x4000000000000) != 0)
  {
    *(_BYTE *)(v5 + 616) = self->_isExplicitItem;
    *(_QWORD *)(v5 + 632) |= 0x4000000000000uLL;
    v22 = self->_has;
    if ((*(_QWORD *)&v22 & 0x800000000) == 0)
    {
LABEL_13:
      if ((*(_QWORD *)&v22 & 0x1000000000) == 0)
        goto LABEL_14;
      goto LABEL_110;
    }
  }
  else if ((*(_QWORD *)&v22 & 0x800000000) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v5 + 480) = self->_playlistType;
  *(_QWORD *)(v5 + 632) |= 0x800000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x1000000000) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&v22 & 0x40000000000) == 0)
      goto LABEL_15;
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v5 + 528) = self->_radioStationType;
  *(_QWORD *)(v5 + 632) |= 0x1000000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x40000000000) == 0)
  {
LABEL_15:
    if ((*(_QWORD *)&v22 & 0x200000000000) == 0)
      goto LABEL_16;
    goto LABEL_112;
  }
LABEL_111:
  *(_BYTE *)(v5 + 608) = self->_artworkAvailable;
  *(_QWORD *)(v5 + 632) |= 0x40000000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x200000000000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&v22 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_113;
  }
LABEL_112:
  *(_BYTE *)(v5 + 611) = self->_infoAvailable;
  *(_QWORD *)(v5 + 632) |= 0x200000000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v22 & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_114;
  }
LABEL_113:
  *(_BYTE *)(v5 + 626) = self->_languageOptionsAvailable;
  *(_QWORD *)(v5 + 632) |= 0x1000000000000000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x40000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&v22 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v5 + 440) = self->_numberOfSections;
  *(_QWORD *)(v5 + 632) |= 0x40000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v22 & 0x1000000) == 0)
      goto LABEL_20;
    goto LABEL_116;
  }
LABEL_115:
  *(_BYTE *)(v5 + 627) = self->_lyricsAvailable;
  *(_QWORD *)(v5 + 632) |= 0x2000000000000000uLL;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v22 & 0x800000000000000) == 0)
      goto LABEL_21;
    goto LABEL_117;
  }
LABEL_116:
  *(_DWORD *)(v5 + 368) = self->_editingStyleFlags;
  *(_QWORD *)(v5 + 632) |= 0x1000000uLL;
  v22 = self->_has;
  if ((*(_QWORD *)&v22 & 0x800000000000000) == 0)
  {
LABEL_21:
    if ((*(_QWORD *)&v22 & 0x2000000000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_117:
  *(_BYTE *)(v5 + 625) = self->_isStreamingContent;
  *(_QWORD *)(v5 + 632) |= 0x800000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000000) != 0)
  {
LABEL_22:
    *(_BYTE *)(v5 + 615) = self->_isCurrentlyPlaying;
    *(_QWORD *)(v5 + 632) |= 0x2000000000000uLL;
  }
LABEL_23:
  v23 = -[NSString copyWithZone:](self->_collectionIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v23;

  v25 = -[NSString copyWithZone:](self->_profileIdentifier, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 496);
  *(_QWORD *)(v5 + 496) = v25;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(double *)(v5 + 120) = self->_startTime;
    *(_QWORD *)(v5 + 632) |= 0x4000uLL;
  }
  v27 = -[NSString copyWithZone:](self->_artworkMIMEType, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v27;

  v29 = -[NSString copyWithZone:](self->_assetURLString, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v29;

  v31 = -[NSString copyWithZone:](self->_composer, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v31;

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 344) = self->_discNumber;
    *(_QWORD *)(v5 + 632) |= 0x200000uLL;
    v33 = self->_has;
  }
  if ((*(_BYTE *)&v33 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_elapsedTime;
    *(_QWORD *)(v5 + 632) |= 2uLL;
  }
  v34 = -[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v34;

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x800000000000) != 0)
  {
    *(_BYTE *)(v5 + 613) = self->_isAlwaysLive;
    *(_QWORD *)(v5 + 632) |= 0x800000000000uLL;
    v36 = self->_has;
    if ((*(_QWORD *)&v36 & 0x200000000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v36 & 0x80000) == 0)
        goto LABEL_32;
      goto LABEL_121;
    }
  }
  else if ((*(_QWORD *)&v36 & 0x200000000) == 0)
  {
    goto LABEL_31;
  }
  *(float *)(v5 + 472) = self->_playbackRate;
  *(_QWORD *)(v5 + 632) |= 0x200000000uLL;
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v36 & 0x8000000000) == 0)
      goto LABEL_33;
    goto LABEL_122;
  }
LABEL_121:
  *(_DWORD *)(v5 + 264) = self->_chapterCount;
  *(_QWORD *)(v5 + 632) |= 0x80000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x8000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
      goto LABEL_34;
    goto LABEL_123;
  }
LABEL_122:
  *(_DWORD *)(v5 + 576) = self->_totalDiscCount;
  *(_QWORD *)(v5 + 632) |= 0x8000000000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v36 & 0x20000000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_123:
  *(_DWORD *)(v5 + 580) = self->_totalTrackCount;
  *(_QWORD *)(v5 + 632) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v5 + 592) = self->_trackNumber;
    *(_QWORD *)(v5 + 632) |= 0x20000000000uLL;
  }
LABEL_36:
  v37 = -[NSString copyWithZone:](self->_contentIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v37;

  v39 = self->_has;
  if ((*(_QWORD *)&v39 & 0x200000000000000) != 0)
  {
    *(_BYTE *)(v5 + 623) = self->_isSharable;
    *(_QWORD *)(v5 + 632) |= 0x200000000000000uLL;
    v39 = self->_has;
    if ((*(_QWORD *)&v39 & 0x20000000000000) == 0)
    {
LABEL_38:
      if ((*(_QWORD *)&v39 & 0x10000000000000) == 0)
        goto LABEL_39;
      goto LABEL_127;
    }
  }
  else if ((*(_QWORD *)&v39 & 0x20000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(_BYTE *)(v5 + 619) = self->_isLiked;
  *(_QWORD *)(v5 + 632) |= 0x20000000000000uLL;
  v39 = self->_has;
  if ((*(_QWORD *)&v39 & 0x10000000000000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v39 & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_127:
  *(_BYTE *)(v5 + 618) = self->_isInWishList;
  *(_QWORD *)(v5 + 632) |= 0x10000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_40:
    *(_QWORD *)(v5 + 96) = self->_radioStationIdentifier;
    *(_QWORD *)(v5 + 632) |= 0x800uLL;
  }
LABEL_41:
  v40 = -[NSString copyWithZone:](self->_radioStationName, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 512);
  *(_QWORD *)(v5 + 512) = v40;

  v42 = -[NSString copyWithZone:](self->_radioStationString, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 520);
  *(_QWORD *)(v5 + 520) = v42;

  v44 = self->_has;
  if ((*(_BYTE *)&v44 & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_iTunesStoreIdentifier;
    *(_QWORD *)(v5 + 632) |= 0x40uLL;
    v44 = self->_has;
    if ((*(_BYTE *)&v44 & 0x80) == 0)
    {
LABEL_43:
      if ((*(_BYTE *)&v44 & 0x20) == 0)
        goto LABEL_44;
      goto LABEL_131;
    }
  }
  else if ((*(_BYTE *)&v44 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  *(_QWORD *)(v5 + 64) = self->_iTunesStoreSubscriptionIdentifier;
  *(_QWORD *)(v5 + 632) |= 0x80uLL;
  v44 = self->_has;
  if ((*(_BYTE *)&v44 & 0x20) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v44 & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_131:
  *(_QWORD *)(v5 + 48) = self->_iTunesStoreArtistIdentifier;
  *(_QWORD *)(v5 + 632) |= 0x20uLL;
  if ((*(_QWORD *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    *(_QWORD *)(v5 + 40) = self->_iTunesStoreAlbumIdentifier;
    *(_QWORD *)(v5 + 632) |= 0x10uLL;
  }
LABEL_46:
  v45 = -[NSData copyWithZone:](self->_purchaseInfoData, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 504);
  *(_QWORD *)(v5 + 504) = v45;

  v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x100000) != 0)
  {
    *(float *)(v5 + 320) = self->_defaultPlaybackRate;
    *(_QWORD *)(v5 + 632) |= 0x100000uLL;
    v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x800000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v47 & 0x400000) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x800000) == 0)
  {
    goto LABEL_48;
  }
  *(_DWORD *)(v5 + 352) = self->_downloadState;
  *(_QWORD *)(v5 + 632) |= 0x800000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_49:
    *(float *)(v5 + 348) = self->_downloadProgress;
    *(_QWORD *)(v5 + 632) |= 0x400000uLL;
  }
LABEL_50:
  v48 = -[NSData copyWithZone:](self->_appMetricsData, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v48;

  v50 = -[NSString copyWithZone:](self->_seriesName, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 536);
  *(_QWORD *)(v5 + 536) = v50;

  v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 428) = self->_mediaType;
    *(_QWORD *)(v5 + 632) |= 0x20000000uLL;
    v52 = self->_has;
  }
  if ((*(_DWORD *)&v52 & 0x10000000) != 0)
  {
    *(_DWORD *)(v5 + 424) = self->_mediaSubType;
    *(_QWORD *)(v5 + 632) |= 0x10000000uLL;
  }
  v53 = -[NSData copyWithZone:](self->_nowPlayingInfoData, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v53;

  v55 = -[NSData copyWithZone:](self->_userInfoData, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 600);
  *(_QWORD *)(v5 + 600) = v55;

  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
  {
    *(_BYTE *)(v5 + 624) = self->_isSteerable;
    *(_QWORD *)(v5 + 632) |= 0x400000000000000uLL;
  }
  v57 = -[NSString copyWithZone:](self->_artworkURL, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v57;

  v59 = -[NSString copyWithZone:](self->_lyricsURL, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v59;

  v61 = -[NSData copyWithZone:](self->_deviceSpecificUserInfoData, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v61;

  v63 = -[NSData copyWithZone:](self->_collectionInfoData, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v63;

  v65 = self->_has;
  if ((*(_BYTE *)&v65 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_elapsedTimeTimestamp;
    *(_QWORD *)(v5 + 632) |= 4uLL;
    v65 = self->_has;
  }
  if ((*(_WORD *)&v65 & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_inferredTimestamp;
    *(_QWORD *)(v5 + 632) |= 0x100uLL;
  }
  v66 = -[NSString copyWithZone:](self->_serviceIdentifier, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 544);
  *(_QWORD *)(v5 + 544) = v66;

  v68 = self->_has;
  if ((*(_DWORD *)&v68 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_artworkDataWidthDeprecated;
    *(_QWORD *)(v5 + 632) |= 0x40000uLL;
    v68 = self->_has;
  }
  if ((*(_DWORD *)&v68 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_artworkDataHeightDeprecated;
    *(_QWORD *)(v5 + 632) |= 0x20000uLL;
  }
  v69 = -[NSData copyWithZone:](self->_currentPlaybackDateData, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v69;

  v71 = -[NSString copyWithZone:](self->_artworkIdentifier, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v71;

  if ((*((_BYTE *)&self->_has + 6) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 620) = self->_isLoading;
    *(_QWORD *)(v5 + 632) |= 0x40000000000000uLL;
  }
  v73 = -[NSData copyWithZone:](self->_artworkURLTemplatesData, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v73;

  v75 = self->_has;
  if ((*(_WORD *)&v75 & 0x200) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_legacyUniqueIdentifier;
    *(_QWORD *)(v5 + 632) |= 0x200uLL;
    v75 = self->_has;
  }
  if ((*(_DWORD *)&v75 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 376) = self->_episodeType;
    *(_QWORD *)(v5 + 632) |= 0x4000000uLL;
  }
  v76 = -[NSString copyWithZone:](self->_artworkFileURL, "copyWithZone:", a3);
  v77 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v76;

  v78 = -[NSString copyWithZone:](self->_brandIdentifier, "copyWithZone:", a3);
  v79 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v78;

  v80 = -[NSString copyWithZone:](self->_localizedDurationString, "copyWithZone:", a3);
  v81 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v80;

  v82 = -[NSString copyWithZone:](self->_albumYear, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v82;

  v84 = self->_has;
  if ((*(_QWORD *)&v84 & 0x4000000000) != 0)
  {
    *(_DWORD *)(v5 + 552) = self->_songTraits;
    *(_QWORD *)(v5 + 632) |= 0x4000000000uLL;
    v84 = self->_has;
    if ((*(_DWORD *)&v84 & 0x10000) == 0)
    {
LABEL_72:
      if ((*(_QWORD *)&v84 & 0x400000000) == 0)
        goto LABEL_74;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v84 & 0x10000) == 0)
  {
    goto LABEL_72;
  }
  *(_DWORD *)(v5 + 160) = self->_albumTraits;
  *(_QWORD *)(v5 + 632) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000000) != 0)
  {
LABEL_73:
    *(_DWORD *)(v5 + 476) = self->_playlistTraits;
    *(_QWORD *)(v5 + 632) |= 0x400000000uLL;
  }
LABEL_74:
  v85 = -[_MRAudioFormatProtobuf copyWithZone:](self->_preferredFormat, "copyWithZone:", a3);
  v86 = *(void **)(v5 + 488);
  *(_QWORD *)(v5 + 488) = v85;

  v87 = -[_MRAudioFormatProtobuf copyWithZone:](self->_activeFormat, "copyWithZone:", a3);
  v88 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v87;

  v89 = self->_has;
  if ((*(_WORD *)&v89 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_activeFormatJustification;
    *(_QWORD *)(v5 + 632) |= 0x8000uLL;
    v89 = self->_has;
  }
  if ((*(_DWORD *)&v89 & 0x8000000) != 0)
  {
    *(_DWORD *)(v5 + 380) = self->_formatTierPreference;
    *(_QWORD *)(v5 + 632) |= 0x8000000uLL;
  }
  v90 = -[_MRAudioRouteProtobuf copyWithZone:](self->_audioRoute, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v90;

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v92 = self->_alternativeFormats;
  v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v114;
    do
    {
      v96 = 0;
      do
      {
        if (*(_QWORD *)v114 != v95)
          objc_enumerationMutation(v92);
        v97 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * v96), "copyWithZone:", a3, (_QWORD)v113);
        objc_msgSend((id)v5, "addAlternativeFormats:", v97);

        ++v96;
      }
      while (v94 != v96);
      v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
    }
    while (v94);
  }

  v98 = self->_has;
  if ((*(_QWORD *)&v98 & 0x400000000000) != 0)
  {
    *(_BYTE *)(v5 + 612) = self->_isAdvertisement;
    *(_QWORD *)(v5 + 632) |= 0x400000000000uLL;
    v98 = self->_has;
  }
  if ((*(_QWORD *)&v98 & 0x100000000000) != 0)
  {
    *(_BYTE *)(v5 + 610) = self->_hasAlternativeFormats;
    *(_QWORD *)(v5 + 632) |= 0x100000000000uLL;
  }
  v99 = -[NSString copyWithZone:](self->_participantName, "copyWithZone:", a3, (_QWORD)v113);
  v100 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v99;

  v101 = -[NSString copyWithZone:](self->_participantIdentifier, "copyWithZone:", a3);
  v102 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v101;

  v103 = -[NSString copyWithZone:](self->_classicalWork, "copyWithZone:", a3);
  v104 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v103;

  v105 = self->_has;
  if ((*(_WORD *)&v105 & 0x2000) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_reportingAdamID;
    *(_QWORD *)(v5 + 632) |= 0x2000uLL;
    v105 = self->_has;
    if ((*(_WORD *)&v105 & 0x400) == 0)
    {
LABEL_91:
      if ((*(_BYTE *)&v105 & 8) == 0)
        goto LABEL_93;
      goto LABEL_92;
    }
  }
  else if ((*(_WORD *)&v105 & 0x400) == 0)
  {
    goto LABEL_91;
  }
  *(_QWORD *)(v5 + 88) = self->_lyricsAdamID;
  *(_QWORD *)(v5 + 632) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 8) != 0)
  {
LABEL_92:
    *(_QWORD *)(v5 + 32) = self->_iTunesStoreAlbumArtistIdentifier;
    *(_QWORD *)(v5 + 632) |= 8uLL;
  }
LABEL_93:
  v106 = -[NSString copyWithZone:](self->_durationStringLocalizationKey, "copyWithZone:", a3);
  v107 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v106;

  if ((*((_BYTE *)&self->_has + 7) & 1) != 0)
  {
    *(_BYTE *)(v5 + 622) = self->_isResolvableParticipant;
    *(_QWORD *)(v5 + 632) |= 0x100000000000000uLL;
  }
  v108 = -[NSString copyWithZone:](self->_internationalStandardRecordingCode, "copyWithZone:", a3);
  v109 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v108;

  v110 = self->_has;
  if ((*(_QWORD *)&v110 & 0x8000000000000) == 0)
  {
    if ((*(_QWORD *)&v110 & 0x80000000000) == 0)
      goto LABEL_97;
LABEL_143:
    *(_BYTE *)(v5 + 609) = self->_excludeFromSuggestions;
    *(_QWORD *)(v5 + 632) |= 0x80000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x4000000000000000) == 0)
      goto LABEL_99;
    goto LABEL_98;
  }
  *(_BYTE *)(v5 + 617) = self->_isInTransition;
  *(_QWORD *)(v5 + 632) |= 0x8000000000000uLL;
  v110 = self->_has;
  if ((*(_QWORD *)&v110 & 0x80000000000) != 0)
    goto LABEL_143;
LABEL_97:
  if ((*(_QWORD *)&v110 & 0x4000000000000000) != 0)
  {
LABEL_98:
    *(_BYTE *)(v5 + 628) = self->_transcriptAlignmentsAvailable;
    *(_QWORD *)(v5 + 632) |= 0x4000000000000000uLL;
  }
LABEL_99:
  v111 = (id)v5;

  return v111;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *subtitle;
  $39A7635802529FA34AF0E2292B825163 has;
  uint64_t v8;
  NSString *albumName;
  NSString *trackArtistName;
  NSString *albumArtistName;
  NSString *directorName;
  $39A7635802529FA34AF0E2292B825163 v13;
  uint64_t v14;
  NSString *localizedContentRating;
  uint64_t v16;
  NSString *collectionIdentifier;
  NSString *profileIdentifier;
  uint64_t v19;
  NSString *artworkMIMEType;
  NSString *assetURLString;
  NSString *composer;
  $39A7635802529FA34AF0E2292B825163 v23;
  uint64_t v24;
  NSString *genre;
  uint64_t v26;
  NSString *contentIdentifier;
  uint64_t v28;
  NSString *radioStationName;
  NSString *radioStationString;
  $39A7635802529FA34AF0E2292B825163 v31;
  uint64_t v32;
  NSData *purchaseInfoData;
  uint64_t v34;
  NSData *appMetricsData;
  NSString *seriesName;
  $39A7635802529FA34AF0E2292B825163 v37;
  uint64_t v38;
  NSData *nowPlayingInfoData;
  NSData *userInfoData;
  uint64_t v41;
  NSString *artworkURL;
  NSString *lyricsURL;
  NSData *deviceSpecificUserInfoData;
  NSData *collectionInfoData;
  $39A7635802529FA34AF0E2292B825163 v46;
  uint64_t v47;
  NSString *serviceIdentifier;
  uint64_t v49;
  NSData *currentPlaybackDateData;
  NSString *artworkIdentifier;
  $39A7635802529FA34AF0E2292B825163 v52;
  uint64_t v53;
  NSData *artworkURLTemplatesData;
  uint64_t v55;
  NSString *artworkFileURL;
  NSString *brandIdentifier;
  NSString *localizedDurationString;
  NSString *albumYear;
  $39A7635802529FA34AF0E2292B825163 v60;
  uint64_t v61;
  _MRAudioFormatProtobuf *preferredFormat;
  _MRAudioFormatProtobuf *activeFormat;
  $39A7635802529FA34AF0E2292B825163 v64;
  uint64_t v65;
  _MRAudioRouteProtobuf *audioRoute;
  NSMutableArray *alternativeFormats;
  $39A7635802529FA34AF0E2292B825163 v68;
  uint64_t v69;
  NSString *participantName;
  NSString *participantIdentifier;
  NSString *classicalWork;
  $39A7635802529FA34AF0E2292B825163 v73;
  uint64_t v74;
  NSString *durationStringLocalizationKey;
  uint64_t v76;
  NSString *internationalStandardRecordingCode;
  uint64_t v78;
  BOOL v79;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_469;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 71))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_469;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 70))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_469;
  }
  has = self->_has;
  v8 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_469;
    if (self->_isContainer)
    {
      if (!*((_BYTE *)v4 + 614))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 614))
    {
      goto LABEL_469;
    }
  }
  else if ((v8 & 0x1000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&has & 0x80000000000000) != 0)
  {
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_469;
    if (self->_isPlayable)
    {
      if (!*((_BYTE *)v4 + 621))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 621))
    {
      goto LABEL_469;
    }
  }
  else if ((v8 & 0x80000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_playbackProgress != *((float *)v4 + 117))
      goto LABEL_469;
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_469;
  }
  albumName = self->_albumName;
  if ((unint64_t)albumName | *((_QWORD *)v4 + 19) && !-[NSString isEqual:](albumName, "isEqual:"))
    goto LABEL_469;
  trackArtistName = self->_trackArtistName;
  if ((unint64_t)trackArtistName | *((_QWORD *)v4 + 73))
  {
    if (!-[NSString isEqual:](trackArtistName, "isEqual:"))
      goto LABEL_469;
  }
  albumArtistName = self->_albumArtistName;
  if ((unint64_t)albumArtistName | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](albumArtistName, "isEqual:"))
      goto LABEL_469;
  }
  directorName = self->_directorName;
  if ((unint64_t)directorName | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](directorName, "isEqual:"))
      goto LABEL_469;
  }
  v13 = self->_has;
  v14 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v13 & 0x2000000000) != 0)
  {
    if ((v14 & 0x2000000000) == 0 || self->_seasonNumber != *((_DWORD *)v4 + 133))
      goto LABEL_469;
  }
  else if ((v14 & 0x2000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
    if ((v14 & 0x2000000) == 0 || self->_episodeNumber != *((_DWORD *)v4 + 93))
      goto LABEL_469;
  }
  else if ((v14 & 0x2000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_releaseDate != *((double *)v4 + 13))
      goto LABEL_469;
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x80000000) != 0)
  {
    if ((v14 & 0x80000000) == 0 || self->_playCount != *((_DWORD *)v4 + 116))
      goto LABEL_469;
  }
  else if ((v14 & 0x80000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_469;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_469;
  }
  localizedContentRating = self->_localizedContentRating;
  if ((unint64_t)localizedContentRating | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](localizedContentRating, "isEqual:"))
      goto LABEL_469;
    v13 = self->_has;
  }
  v16 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v13 & 0x4000000000000) != 0)
  {
    if ((v16 & 0x4000000000000) == 0)
      goto LABEL_469;
    if (self->_isExplicitItem)
    {
      if (!*((_BYTE *)v4 + 616))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 616))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x4000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x800000000) != 0)
  {
    if ((v16 & 0x800000000) == 0 || self->_playlistType != *((_DWORD *)v4 + 120))
      goto LABEL_469;
  }
  else if ((v16 & 0x800000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x1000000000) != 0)
  {
    if ((v16 & 0x1000000000) == 0 || self->_radioStationType != *((_DWORD *)v4 + 132))
      goto LABEL_469;
  }
  else if ((v16 & 0x1000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x40000000000) != 0)
  {
    if ((v16 & 0x40000000000) == 0)
      goto LABEL_469;
    if (self->_artworkAvailable)
    {
      if (!*((_BYTE *)v4 + 608))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 608))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x40000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x200000000000) != 0)
  {
    if ((v16 & 0x200000000000) == 0)
      goto LABEL_469;
    if (self->_infoAvailable)
    {
      if (!*((_BYTE *)v4 + 611))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 611))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x200000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x1000000000000000) != 0)
  {
    if ((v16 & 0x1000000000000000) == 0)
      goto LABEL_469;
    if (self->_languageOptionsAvailable)
    {
      if (!*((_BYTE *)v4 + 626))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 626))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x1000000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x40000000) != 0)
  {
    if ((v16 & 0x40000000) == 0 || self->_numberOfSections != *((_DWORD *)v4 + 110))
      goto LABEL_469;
  }
  else if ((v16 & 0x40000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x2000000000000000) != 0)
  {
    if ((v16 & 0x2000000000000000) == 0)
      goto LABEL_469;
    if (self->_lyricsAvailable)
    {
      if (!*((_BYTE *)v4 + 627))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 627))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x2000000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_editingStyleFlags != *((_DWORD *)v4 + 92))
      goto LABEL_469;
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x800000000000000) != 0)
  {
    if ((v16 & 0x800000000000000) == 0)
      goto LABEL_469;
    if (self->_isStreamingContent)
    {
      if (!*((_BYTE *)v4 + 625))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 625))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x800000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v13 & 0x2000000000000) != 0)
  {
    if ((v16 & 0x2000000000000) == 0)
      goto LABEL_469;
    if (self->_isCurrentlyPlaying)
    {
      if (!*((_BYTE *)v4 + 615))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 615))
    {
      goto LABEL_469;
    }
  }
  else if ((v16 & 0x2000000000000) != 0)
  {
    goto LABEL_469;
  }
  collectionIdentifier = self->_collectionIdentifier;
  if ((unint64_t)collectionIdentifier | *((_QWORD *)v4 + 35)
    && !-[NSString isEqual:](collectionIdentifier, "isEqual:"))
  {
    goto LABEL_469;
  }
  profileIdentifier = self->_profileIdentifier;
  if ((unint64_t)profileIdentifier | *((_QWORD *)v4 + 62))
  {
    if (!-[NSString isEqual:](profileIdentifier, "isEqual:"))
      goto LABEL_469;
  }
  v19 = *((_QWORD *)v4 + 79);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v19 & 0x4000) == 0 || self->_startTime != *((double *)v4 + 15))
      goto LABEL_469;
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_469;
  }
  artworkMIMEType = self->_artworkMIMEType;
  if ((unint64_t)artworkMIMEType | *((_QWORD *)v4 + 27)
    && !-[NSString isEqual:](artworkMIMEType, "isEqual:"))
  {
    goto LABEL_469;
  }
  assetURLString = self->_assetURLString;
  if ((unint64_t)assetURLString | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](assetURLString, "isEqual:"))
      goto LABEL_469;
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](composer, "isEqual:"))
      goto LABEL_469;
  }
  v23 = self->_has;
  v24 = *((_QWORD *)v4 + 79);
  if ((*(_DWORD *)&v23 & 0x200000) != 0)
  {
    if ((v24 & 0x200000) == 0 || self->_discNumber != *((_DWORD *)v4 + 86))
      goto LABEL_469;
  }
  else if ((v24 & 0x200000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_elapsedTime != *((double *)v4 + 2))
      goto LABEL_469;
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_469;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](genre, "isEqual:"))
      goto LABEL_469;
    v23 = self->_has;
  }
  v26 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v23 & 0x800000000000) != 0)
  {
    if ((v26 & 0x800000000000) == 0)
      goto LABEL_469;
    if (self->_isAlwaysLive)
    {
      if (!*((_BYTE *)v4 + 613))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 613))
    {
      goto LABEL_469;
    }
  }
  else if ((v26 & 0x800000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x200000000) != 0)
  {
    if ((v26 & 0x200000000) == 0 || self->_playbackRate != *((float *)v4 + 118))
      goto LABEL_469;
  }
  else if ((v26 & 0x200000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    if ((v26 & 0x80000) == 0 || self->_chapterCount != *((_DWORD *)v4 + 66))
      goto LABEL_469;
  }
  else if ((v26 & 0x80000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x8000000000) != 0)
  {
    if ((v26 & 0x8000000000) == 0 || self->_totalDiscCount != *((_DWORD *)v4 + 144))
      goto LABEL_469;
  }
  else if ((v26 & 0x8000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x10000000000) != 0)
  {
    if ((v26 & 0x10000000000) == 0 || self->_totalTrackCount != *((_DWORD *)v4 + 145))
      goto LABEL_469;
  }
  else if ((v26 & 0x10000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x20000000000) != 0)
  {
    if ((v26 & 0x20000000000) == 0 || self->_trackNumber != *((_DWORD *)v4 + 148))
      goto LABEL_469;
  }
  else if ((v26 & 0x20000000000) != 0)
  {
    goto LABEL_469;
  }
  contentIdentifier = self->_contentIdentifier;
  if ((unint64_t)contentIdentifier | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](contentIdentifier, "isEqual:"))
      goto LABEL_469;
    v23 = self->_has;
  }
  v28 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v23 & 0x200000000000000) != 0)
  {
    if ((v28 & 0x200000000000000) == 0)
      goto LABEL_469;
    if (self->_isSharable)
    {
      if (!*((_BYTE *)v4 + 623))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 623))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x200000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x20000000000000) != 0)
  {
    if ((v28 & 0x20000000000000) == 0)
      goto LABEL_469;
    if (self->_isLiked)
    {
      if (!*((_BYTE *)v4 + 619))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 619))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x20000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v23 & 0x10000000000000) != 0)
  {
    if ((v28 & 0x10000000000000) == 0)
      goto LABEL_469;
    if (self->_isInWishList)
    {
      if (!*((_BYTE *)v4 + 618))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 618))
    {
      goto LABEL_469;
    }
  }
  else if ((v28 & 0x10000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v23 & 0x800) != 0)
  {
    if ((v28 & 0x800) == 0 || self->_radioStationIdentifier != *((_QWORD *)v4 + 12))
      goto LABEL_469;
  }
  else if ((v28 & 0x800) != 0)
  {
    goto LABEL_469;
  }
  radioStationName = self->_radioStationName;
  if ((unint64_t)radioStationName | *((_QWORD *)v4 + 64)
    && !-[NSString isEqual:](radioStationName, "isEqual:"))
  {
    goto LABEL_469;
  }
  radioStationString = self->_radioStationString;
  if ((unint64_t)radioStationString | *((_QWORD *)v4 + 65))
  {
    if (!-[NSString isEqual:](radioStationString, "isEqual:"))
      goto LABEL_469;
  }
  v31 = self->_has;
  v32 = *((_QWORD *)v4 + 79);
  if ((*(_BYTE *)&v31 & 0x40) != 0)
  {
    if ((v32 & 0x40) == 0 || self->_iTunesStoreIdentifier != *((_QWORD *)v4 + 7))
      goto LABEL_469;
  }
  else if ((v32 & 0x40) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v31 & 0x80) != 0)
  {
    if ((v32 & 0x80) == 0 || self->_iTunesStoreSubscriptionIdentifier != *((_QWORD *)v4 + 8))
      goto LABEL_469;
  }
  else if ((v32 & 0x80) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v31 & 0x20) != 0)
  {
    if ((v32 & 0x20) == 0 || self->_iTunesStoreArtistIdentifier != *((_QWORD *)v4 + 6))
      goto LABEL_469;
  }
  else if ((v32 & 0x20) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v31 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_iTunesStoreAlbumIdentifier != *((_QWORD *)v4 + 5))
      goto LABEL_469;
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_469;
  }
  purchaseInfoData = self->_purchaseInfoData;
  if ((unint64_t)purchaseInfoData | *((_QWORD *)v4 + 63))
  {
    if (!-[NSData isEqual:](purchaseInfoData, "isEqual:"))
      goto LABEL_469;
    v31 = self->_has;
  }
  v34 = *((_QWORD *)v4 + 79);
  if ((*(_DWORD *)&v31 & 0x100000) != 0)
  {
    if ((v34 & 0x100000) == 0 || self->_defaultPlaybackRate != *((float *)v4 + 80))
      goto LABEL_469;
  }
  else if ((v34 & 0x100000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    if ((v34 & 0x800000) == 0 || self->_downloadState != *((_DWORD *)v4 + 88))
      goto LABEL_469;
  }
  else if ((v34 & 0x800000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
    if ((v34 & 0x400000) == 0 || self->_downloadProgress != *((float *)v4 + 87))
      goto LABEL_469;
  }
  else if ((v34 & 0x400000) != 0)
  {
    goto LABEL_469;
  }
  appMetricsData = self->_appMetricsData;
  if ((unint64_t)appMetricsData | *((_QWORD *)v4 + 23)
    && !-[NSData isEqual:](appMetricsData, "isEqual:"))
  {
    goto LABEL_469;
  }
  seriesName = self->_seriesName;
  if ((unint64_t)seriesName | *((_QWORD *)v4 + 67))
  {
    if (!-[NSString isEqual:](seriesName, "isEqual:"))
      goto LABEL_469;
  }
  v37 = self->_has;
  v38 = *((_QWORD *)v4 + 79);
  if ((*(_DWORD *)&v37 & 0x20000000) != 0)
  {
    if ((v38 & 0x20000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 107))
      goto LABEL_469;
  }
  else if ((v38 & 0x20000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v37 & 0x10000000) != 0)
  {
    if ((v38 & 0x10000000) == 0 || self->_mediaSubType != *((_DWORD *)v4 + 106))
      goto LABEL_469;
  }
  else if ((v38 & 0x10000000) != 0)
  {
    goto LABEL_469;
  }
  nowPlayingInfoData = self->_nowPlayingInfoData;
  if ((unint64_t)nowPlayingInfoData | *((_QWORD *)v4 + 54)
    && !-[NSData isEqual:](nowPlayingInfoData, "isEqual:"))
  {
    goto LABEL_469;
  }
  userInfoData = self->_userInfoData;
  if ((unint64_t)userInfoData | *((_QWORD *)v4 + 75))
  {
    if (!-[NSData isEqual:](userInfoData, "isEqual:"))
      goto LABEL_469;
  }
  v41 = *((_QWORD *)v4 + 79);
  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
  {
    if ((v41 & 0x400000000000000) == 0)
      goto LABEL_469;
    if (self->_isSteerable)
    {
      if (!*((_BYTE *)v4 + 624))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 624))
    {
      goto LABEL_469;
    }
  }
  else if ((v41 & 0x400000000000000) != 0)
  {
    goto LABEL_469;
  }
  artworkURL = self->_artworkURL;
  if ((unint64_t)artworkURL | *((_QWORD *)v4 + 28)
    && !-[NSString isEqual:](artworkURL, "isEqual:"))
  {
    goto LABEL_469;
  }
  lyricsURL = self->_lyricsURL;
  if ((unint64_t)lyricsURL | *((_QWORD *)v4 + 52))
  {
    if (!-[NSString isEqual:](lyricsURL, "isEqual:"))
      goto LABEL_469;
  }
  deviceSpecificUserInfoData = self->_deviceSpecificUserInfoData;
  if ((unint64_t)deviceSpecificUserInfoData | *((_QWORD *)v4 + 41))
  {
    if (!-[NSData isEqual:](deviceSpecificUserInfoData, "isEqual:"))
      goto LABEL_469;
  }
  collectionInfoData = self->_collectionInfoData;
  if ((unint64_t)collectionInfoData | *((_QWORD *)v4 + 36))
  {
    if (!-[NSData isEqual:](collectionInfoData, "isEqual:"))
      goto LABEL_469;
  }
  v46 = self->_has;
  v47 = *((_QWORD *)v4 + 79);
  if ((*(_BYTE *)&v46 & 4) != 0)
  {
    if ((v47 & 4) == 0 || self->_elapsedTimeTimestamp != *((double *)v4 + 3))
      goto LABEL_469;
  }
  else if ((v47 & 4) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v46 & 0x100) != 0)
  {
    if ((v47 & 0x100) == 0 || self->_inferredTimestamp != *((double *)v4 + 9))
      goto LABEL_469;
  }
  else if ((v47 & 0x100) != 0)
  {
    goto LABEL_469;
  }
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((_QWORD *)v4 + 68))
  {
    if (!-[NSString isEqual:](serviceIdentifier, "isEqual:"))
      goto LABEL_469;
    v46 = self->_has;
  }
  v49 = *((_QWORD *)v4 + 79);
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    if ((v49 & 0x40000) == 0 || self->_artworkDataWidthDeprecated != *((_DWORD *)v4 + 49))
      goto LABEL_469;
  }
  else if ((v49 & 0x40000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v46 & 0x20000) != 0)
  {
    if ((v49 & 0x20000) == 0 || self->_artworkDataHeightDeprecated != *((_DWORD *)v4 + 48))
      goto LABEL_469;
  }
  else if ((v49 & 0x20000) != 0)
  {
    goto LABEL_469;
  }
  currentPlaybackDateData = self->_currentPlaybackDateData;
  if ((unint64_t)currentPlaybackDateData | *((_QWORD *)v4 + 39)
    && !-[NSData isEqual:](currentPlaybackDateData, "isEqual:"))
  {
    goto LABEL_469;
  }
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](artworkIdentifier, "isEqual:"))
      goto LABEL_469;
  }
  v52 = self->_has;
  v53 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v52 & 0x40000000000000) != 0)
  {
    if ((v53 & 0x40000000000000) == 0)
      goto LABEL_469;
    if (self->_isLoading)
    {
      if (!*((_BYTE *)v4 + 620))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 620))
    {
      goto LABEL_469;
    }
  }
  else if ((v53 & 0x40000000000000) != 0)
  {
    goto LABEL_469;
  }
  artworkURLTemplatesData = self->_artworkURLTemplatesData;
  if ((unint64_t)artworkURLTemplatesData | *((_QWORD *)v4 + 29))
  {
    if (!-[NSData isEqual:](artworkURLTemplatesData, "isEqual:"))
      goto LABEL_469;
    v52 = self->_has;
  }
  v55 = *((_QWORD *)v4 + 79);
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    if ((v55 & 0x200) == 0 || self->_legacyUniqueIdentifier != *((_QWORD *)v4 + 10))
      goto LABEL_469;
  }
  else if ((v55 & 0x200) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v52 & 0x4000000) != 0)
  {
    if ((v55 & 0x4000000) == 0 || self->_episodeType != *((_DWORD *)v4 + 94))
      goto LABEL_469;
  }
  else if ((v55 & 0x4000000) != 0)
  {
    goto LABEL_469;
  }
  artworkFileURL = self->_artworkFileURL;
  if ((unint64_t)artworkFileURL | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](artworkFileURL, "isEqual:"))
  {
    goto LABEL_469;
  }
  brandIdentifier = self->_brandIdentifier;
  if ((unint64_t)brandIdentifier | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](brandIdentifier, "isEqual:"))
      goto LABEL_469;
  }
  localizedDurationString = self->_localizedDurationString;
  if ((unint64_t)localizedDurationString | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](localizedDurationString, "isEqual:"))
      goto LABEL_469;
  }
  albumYear = self->_albumYear;
  if ((unint64_t)albumYear | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](albumYear, "isEqual:"))
      goto LABEL_469;
  }
  v60 = self->_has;
  v61 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v60 & 0x4000000000) != 0)
  {
    if ((v61 & 0x4000000000) == 0 || self->_songTraits != *((_DWORD *)v4 + 138))
      goto LABEL_469;
  }
  else if ((v61 & 0x4000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v60 & 0x10000) != 0)
  {
    if ((v61 & 0x10000) == 0 || self->_albumTraits != *((_DWORD *)v4 + 40))
      goto LABEL_469;
  }
  else if ((v61 & 0x10000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v60 & 0x400000000) != 0)
  {
    if ((v61 & 0x400000000) == 0 || self->_playlistTraits != *((_DWORD *)v4 + 119))
      goto LABEL_469;
  }
  else if ((v61 & 0x400000000) != 0)
  {
    goto LABEL_469;
  }
  preferredFormat = self->_preferredFormat;
  if ((unint64_t)preferredFormat | *((_QWORD *)v4 + 61)
    && !-[_MRAudioFormatProtobuf isEqual:](preferredFormat, "isEqual:"))
  {
    goto LABEL_469;
  }
  activeFormat = self->_activeFormat;
  if ((unint64_t)activeFormat | *((_QWORD *)v4 + 16))
  {
    if (!-[_MRAudioFormatProtobuf isEqual:](activeFormat, "isEqual:"))
      goto LABEL_469;
  }
  v64 = self->_has;
  v65 = *((_QWORD *)v4 + 79);
  if ((*(_WORD *)&v64 & 0x8000) != 0)
  {
    if ((v65 & 0x8000) == 0 || self->_activeFormatJustification != *((_DWORD *)v4 + 34))
      goto LABEL_469;
  }
  else if ((v65 & 0x8000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_DWORD *)&v64 & 0x8000000) != 0)
  {
    if ((v65 & 0x8000000) == 0 || self->_formatTierPreference != *((_DWORD *)v4 + 95))
      goto LABEL_469;
  }
  else if ((v65 & 0x8000000) != 0)
  {
    goto LABEL_469;
  }
  audioRoute = self->_audioRoute;
  if ((unint64_t)audioRoute | *((_QWORD *)v4 + 31) && !-[_MRAudioRouteProtobuf isEqual:](audioRoute, "isEqual:"))
    goto LABEL_469;
  alternativeFormats = self->_alternativeFormats;
  if ((unint64_t)alternativeFormats | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](alternativeFormats, "isEqual:"))
      goto LABEL_469;
  }
  v68 = self->_has;
  v69 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v68 & 0x400000000000) != 0)
  {
    if ((v69 & 0x400000000000) == 0)
      goto LABEL_469;
    if (self->_isAdvertisement)
    {
      if (!*((_BYTE *)v4 + 612))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 612))
    {
      goto LABEL_469;
    }
  }
  else if ((v69 & 0x400000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v68 & 0x100000000000) != 0)
  {
    if ((v69 & 0x100000000000) == 0)
      goto LABEL_469;
    if (self->_hasAlternativeFormats)
    {
      if (!*((_BYTE *)v4 + 610))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 610))
    {
      goto LABEL_469;
    }
  }
  else if ((v69 & 0x100000000000) != 0)
  {
    goto LABEL_469;
  }
  participantName = self->_participantName;
  if ((unint64_t)participantName | *((_QWORD *)v4 + 57)
    && !-[NSString isEqual:](participantName, "isEqual:"))
  {
    goto LABEL_469;
  }
  participantIdentifier = self->_participantIdentifier;
  if ((unint64_t)participantIdentifier | *((_QWORD *)v4 + 56))
  {
    if (!-[NSString isEqual:](participantIdentifier, "isEqual:"))
      goto LABEL_469;
  }
  classicalWork = self->_classicalWork;
  if ((unint64_t)classicalWork | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](classicalWork, "isEqual:"))
      goto LABEL_469;
  }
  v73 = self->_has;
  v74 = *((_QWORD *)v4 + 79);
  if ((*(_WORD *)&v73 & 0x2000) != 0)
  {
    if ((v74 & 0x2000) == 0 || self->_reportingAdamID != *((_QWORD *)v4 + 14))
      goto LABEL_469;
  }
  else if ((v74 & 0x2000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_WORD *)&v73 & 0x400) != 0)
  {
    if ((v74 & 0x400) == 0 || self->_lyricsAdamID != *((_QWORD *)v4 + 11))
      goto LABEL_469;
  }
  else if ((v74 & 0x400) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_BYTE *)&v73 & 8) != 0)
  {
    if ((v74 & 8) == 0 || self->_iTunesStoreAlbumArtistIdentifier != *((_QWORD *)v4 + 4))
      goto LABEL_469;
  }
  else if ((v74 & 8) != 0)
  {
    goto LABEL_469;
  }
  durationStringLocalizationKey = self->_durationStringLocalizationKey;
  if ((unint64_t)durationStringLocalizationKey | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](durationStringLocalizationKey, "isEqual:"))
      goto LABEL_469;
    v73 = self->_has;
  }
  v76 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v73 & 0x100000000000000) != 0)
  {
    if ((v76 & 0x100000000000000) == 0)
      goto LABEL_469;
    if (self->_isResolvableParticipant)
    {
      if (!*((_BYTE *)v4 + 622))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 622))
    {
      goto LABEL_469;
    }
  }
  else if ((v76 & 0x100000000000000) != 0)
  {
    goto LABEL_469;
  }
  internationalStandardRecordingCode = self->_internationalStandardRecordingCode;
  if ((unint64_t)internationalStandardRecordingCode | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](internationalStandardRecordingCode, "isEqual:"))
      goto LABEL_469;
    v73 = self->_has;
  }
  v78 = *((_QWORD *)v4 + 79);
  if ((*(_QWORD *)&v73 & 0x8000000000000) != 0)
  {
    if ((v78 & 0x8000000000000) == 0)
      goto LABEL_469;
    if (self->_isInTransition)
    {
      if (!*((_BYTE *)v4 + 617))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 617))
    {
      goto LABEL_469;
    }
  }
  else if ((v78 & 0x8000000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v73 & 0x80000000000) != 0)
  {
    if ((v78 & 0x80000000000) == 0)
      goto LABEL_469;
    if (self->_excludeFromSuggestions)
    {
      if (!*((_BYTE *)v4 + 609))
        goto LABEL_469;
    }
    else if (*((_BYTE *)v4 + 609))
    {
      goto LABEL_469;
    }
  }
  else if ((v78 & 0x80000000000) != 0)
  {
    goto LABEL_469;
  }
  if ((*(_QWORD *)&v73 & 0x4000000000000000) != 0)
  {
    if ((v78 & 0x4000000000000000) != 0)
    {
      if (self->_transcriptAlignmentsAvailable)
      {
        if (!*((_BYTE *)v4 + 628))
          goto LABEL_469;
      }
      else if (*((_BYTE *)v4 + 628))
      {
        goto LABEL_469;
      }
      v79 = 1;
      goto LABEL_470;
    }
LABEL_469:
    v79 = 0;
    goto LABEL_470;
  }
  v79 = (v78 & 0x4000000000000000) == 0;
LABEL_470:

  return v79;
}

- (unint64_t)hash
{
  $39A7635802529FA34AF0E2292B825163 has;
  float playbackProgress;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  $39A7635802529FA34AF0E2292B825163 v9;
  double releaseDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double duration;
  double v17;
  long double v18;
  double v19;
  $39A7635802529FA34AF0E2292B825163 v20;
  unint64_t v21;
  double startTime;
  double v23;
  long double v24;
  double v25;
  $39A7635802529FA34AF0E2292B825163 v26;
  double elapsedTime;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  $39A7635802529FA34AF0E2292B825163 v32;
  float playbackRate;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  $39A7635802529FA34AF0E2292B825163 v38;
  $39A7635802529FA34AF0E2292B825163 v39;
  $39A7635802529FA34AF0E2292B825163 v40;
  unint64_t v41;
  float defaultPlaybackRate;
  float v43;
  float v44;
  float v45;
  unint64_t v46;
  float downloadProgress;
  float v48;
  float v49;
  float v50;
  $39A7635802529FA34AF0E2292B825163 v51;
  $39A7635802529FA34AF0E2292B825163 v52;
  unint64_t v53;
  double elapsedTimeTimestamp;
  double v55;
  long double v56;
  double v57;
  unint64_t v58;
  double inferredTimestamp;
  double v60;
  long double v61;
  double v62;
  $39A7635802529FA34AF0E2292B825163 v63;
  $39A7635802529FA34AF0E2292B825163 v64;
  $39A7635802529FA34AF0E2292B825163 v65;
  $39A7635802529FA34AF0E2292B825163 v66;
  $39A7635802529FA34AF0E2292B825163 v67;
  NSUInteger v68;
  NSUInteger v69;
  $39A7635802529FA34AF0E2292B825163 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSUInteger v74;
  uint64_t v75;
  NSUInteger v76;
  $39A7635802529FA34AF0E2292B825163 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSUInteger v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSUInteger v94;
  NSUInteger v95;
  NSUInteger v96;
  NSUInteger v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSUInteger v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSUInteger v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSUInteger v111;
  NSUInteger v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSUInteger v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSUInteger v128;
  NSUInteger v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSUInteger v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  NSUInteger v141;
  unint64_t v142;
  uint64_t v143;
  NSUInteger v144;
  NSUInteger v145;
  NSUInteger v146;
  unint64_t v147;
  NSUInteger v148;
  NSUInteger v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSUInteger v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  NSUInteger v167;
  NSUInteger v168;
  NSUInteger v169;
  NSUInteger v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  NSUInteger v174;
  NSUInteger v175;

  v175 = -[NSString hash](self->_title, "hash");
  v174 = -[NSString hash](self->_subtitle, "hash");
  has = self->_has;
  if ((*(_QWORD *)&has & 0x1000000000000) == 0)
  {
    v173 = 0;
    if ((*(_QWORD *)&has & 0x80000000000000) != 0)
      goto LABEL_3;
LABEL_9:
    v172 = 0;
    if ((*(_QWORD *)&has & 0x100000000) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v173 = 2654435761 * self->_isContainer;
  if ((*(_QWORD *)&has & 0x80000000000000) == 0)
    goto LABEL_9;
LABEL_3:
  v172 = 2654435761 * self->_isPlayable;
  if ((*(_QWORD *)&has & 0x100000000) == 0)
    goto LABEL_10;
LABEL_4:
  playbackProgress = self->_playbackProgress;
  v5 = -playbackProgress;
  if (playbackProgress >= 0.0)
    v5 = self->_playbackProgress;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_13:
  v171 = v8;
  v170 = -[NSString hash](self->_albumName, "hash");
  v169 = -[NSString hash](self->_trackArtistName, "hash");
  v168 = -[NSString hash](self->_albumArtistName, "hash");
  v167 = -[NSString hash](self->_directorName, "hash");
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x2000000000) == 0)
  {
    v166 = 0;
    if ((*(_DWORD *)&v9 & 0x2000000) != 0)
      goto LABEL_15;
LABEL_21:
    v165 = 0;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_16;
LABEL_22:
    v14 = 0;
    goto LABEL_25;
  }
  v166 = 2654435761 * self->_seasonNumber;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
    goto LABEL_21;
LABEL_15:
  v165 = 2654435761 * self->_episodeNumber;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
    goto LABEL_22;
LABEL_16:
  releaseDate = self->_releaseDate;
  v11 = -releaseDate;
  if (releaseDate >= 0.0)
    v11 = self->_releaseDate;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_25:
  if ((*(_DWORD *)&v9 & 0x80000000) != 0)
    v163 = 2654435761 * self->_playCount;
  else
    v163 = 0;
  v164 = v14;
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    duration = self->_duration;
    v17 = -duration;
    if (duration >= 0.0)
      v17 = self->_duration;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v162 = v15;
  v161 = -[NSString hash](self->_localizedContentRating, "hash");
  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x4000000000000) != 0)
  {
    v160 = 2654435761 * self->_isExplicitItem;
    if ((*(_QWORD *)&v20 & 0x800000000) != 0)
    {
LABEL_38:
      v159 = 2654435761 * self->_playlistType;
      if ((*(_QWORD *)&v20 & 0x1000000000) != 0)
        goto LABEL_39;
      goto LABEL_50;
    }
  }
  else
  {
    v160 = 0;
    if ((*(_QWORD *)&v20 & 0x800000000) != 0)
      goto LABEL_38;
  }
  v159 = 0;
  if ((*(_QWORD *)&v20 & 0x1000000000) != 0)
  {
LABEL_39:
    v158 = 2654435761 * self->_radioStationType;
    if ((*(_QWORD *)&v20 & 0x40000000000) != 0)
      goto LABEL_40;
    goto LABEL_51;
  }
LABEL_50:
  v158 = 0;
  if ((*(_QWORD *)&v20 & 0x40000000000) != 0)
  {
LABEL_40:
    v157 = 2654435761 * self->_artworkAvailable;
    if ((*(_QWORD *)&v20 & 0x200000000000) != 0)
      goto LABEL_41;
    goto LABEL_52;
  }
LABEL_51:
  v157 = 0;
  if ((*(_QWORD *)&v20 & 0x200000000000) != 0)
  {
LABEL_41:
    v156 = 2654435761 * self->_infoAvailable;
    if ((*(_QWORD *)&v20 & 0x1000000000000000) != 0)
      goto LABEL_42;
    goto LABEL_53;
  }
LABEL_52:
  v156 = 0;
  if ((*(_QWORD *)&v20 & 0x1000000000000000) != 0)
  {
LABEL_42:
    v155 = 2654435761 * self->_languageOptionsAvailable;
    if ((*(_DWORD *)&v20 & 0x40000000) != 0)
      goto LABEL_43;
    goto LABEL_54;
  }
LABEL_53:
  v155 = 0;
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
LABEL_43:
    v154 = 2654435761 * self->_numberOfSections;
    if ((*(_QWORD *)&v20 & 0x2000000000000000) != 0)
      goto LABEL_44;
    goto LABEL_55;
  }
LABEL_54:
  v154 = 0;
  if ((*(_QWORD *)&v20 & 0x2000000000000000) != 0)
  {
LABEL_44:
    v153 = 2654435761 * self->_lyricsAvailable;
    if ((*(_DWORD *)&v20 & 0x1000000) != 0)
      goto LABEL_45;
    goto LABEL_56;
  }
LABEL_55:
  v153 = 0;
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
LABEL_45:
    v152 = 2654435761 * self->_editingStyleFlags;
    if ((*(_QWORD *)&v20 & 0x800000000000000) != 0)
      goto LABEL_46;
LABEL_57:
    v151 = 0;
    if ((*(_QWORD *)&v20 & 0x2000000000000) != 0)
      goto LABEL_47;
    goto LABEL_58;
  }
LABEL_56:
  v152 = 0;
  if ((*(_QWORD *)&v20 & 0x800000000000000) == 0)
    goto LABEL_57;
LABEL_46:
  v151 = 2654435761 * self->_isStreamingContent;
  if ((*(_QWORD *)&v20 & 0x2000000000000) != 0)
  {
LABEL_47:
    v150 = 2654435761 * self->_isCurrentlyPlaying;
    goto LABEL_59;
  }
LABEL_58:
  v150 = 0;
LABEL_59:
  v149 = -[NSString hash](self->_collectionIdentifier, "hash");
  v148 = -[NSString hash](self->_profileIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    startTime = self->_startTime;
    v23 = -startTime;
    if (startTime >= 0.0)
      v23 = self->_startTime;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  v147 = v21;
  v146 = -[NSString hash](self->_artworkMIMEType, "hash");
  v145 = -[NSString hash](self->_assetURLString, "hash");
  v144 = -[NSString hash](self->_composer, "hash");
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x200000) != 0)
  {
    v143 = 2654435761 * self->_discNumber;
    if ((*(_BYTE *)&v26 & 2) != 0)
      goto LABEL_69;
LABEL_74:
    v31 = 0;
    goto LABEL_77;
  }
  v143 = 0;
  if ((*(_BYTE *)&v26 & 2) == 0)
    goto LABEL_74;
LABEL_69:
  elapsedTime = self->_elapsedTime;
  v28 = -elapsedTime;
  if (elapsedTime >= 0.0)
    v28 = self->_elapsedTime;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_77:
  v142 = v31;
  v141 = -[NSString hash](self->_genre, "hash");
  v32 = self->_has;
  if ((*(_QWORD *)&v32 & 0x800000000000) != 0)
  {
    v140 = 2654435761 * self->_isAlwaysLive;
    if ((*(_QWORD *)&v32 & 0x200000000) != 0)
      goto LABEL_79;
LABEL_84:
    v37 = 0;
    goto LABEL_87;
  }
  v140 = 0;
  if ((*(_QWORD *)&v32 & 0x200000000) == 0)
    goto LABEL_84;
LABEL_79:
  playbackRate = self->_playbackRate;
  v34 = -playbackRate;
  if (playbackRate >= 0.0)
    v34 = self->_playbackRate;
  v35 = floorf(v34 + 0.5);
  v36 = (float)(v34 - v35) * 1.8447e19;
  v37 = 2654435761u * (unint64_t)fmodf(v35, 1.8447e19);
  if (v36 >= 0.0)
  {
    if (v36 > 0.0)
      v37 += (unint64_t)v36;
  }
  else
  {
    v37 -= (unint64_t)fabsf(v36);
  }
LABEL_87:
  if ((*(_DWORD *)&v32 & 0x80000) == 0)
  {
    v138 = 0;
    if ((*(_QWORD *)&v32 & 0x8000000000) != 0)
      goto LABEL_89;
LABEL_92:
    v137 = 0;
    if ((*(_QWORD *)&v32 & 0x10000000000) != 0)
      goto LABEL_90;
    goto LABEL_93;
  }
  v138 = 2654435761 * self->_chapterCount;
  if ((*(_QWORD *)&v32 & 0x8000000000) == 0)
    goto LABEL_92;
LABEL_89:
  v137 = 2654435761 * self->_totalDiscCount;
  if ((*(_QWORD *)&v32 & 0x10000000000) != 0)
  {
LABEL_90:
    v136 = 2654435761 * self->_totalTrackCount;
    goto LABEL_94;
  }
LABEL_93:
  v136 = 0;
LABEL_94:
  v139 = v37;
  if ((*(_QWORD *)&v32 & 0x20000000000) != 0)
    v135 = 2654435761 * self->_trackNumber;
  else
    v135 = 0;
  v134 = -[NSString hash](self->_contentIdentifier, "hash");
  v38 = self->_has;
  if ((*(_QWORD *)&v38 & 0x200000000000000) != 0)
  {
    v133 = 2654435761 * self->_isSharable;
    if ((*(_QWORD *)&v38 & 0x20000000000000) != 0)
    {
LABEL_99:
      v132 = 2654435761 * self->_isLiked;
      if ((*(_QWORD *)&v38 & 0x10000000000000) != 0)
        goto LABEL_100;
LABEL_104:
      v131 = 0;
      if ((*(_WORD *)&v38 & 0x800) != 0)
        goto LABEL_101;
      goto LABEL_105;
    }
  }
  else
  {
    v133 = 0;
    if ((*(_QWORD *)&v38 & 0x20000000000000) != 0)
      goto LABEL_99;
  }
  v132 = 0;
  if ((*(_QWORD *)&v38 & 0x10000000000000) == 0)
    goto LABEL_104;
LABEL_100:
  v131 = 2654435761 * self->_isInWishList;
  if ((*(_WORD *)&v38 & 0x800) != 0)
  {
LABEL_101:
    v130 = 2654435761 * self->_radioStationIdentifier;
    goto LABEL_106;
  }
LABEL_105:
  v130 = 0;
LABEL_106:
  v129 = -[NSString hash](self->_radioStationName, "hash");
  v128 = -[NSString hash](self->_radioStationString, "hash");
  v39 = self->_has;
  if ((*(_BYTE *)&v39 & 0x40) != 0)
  {
    v127 = 2654435761 * self->_iTunesStoreIdentifier;
    if ((*(_BYTE *)&v39 & 0x80) != 0)
    {
LABEL_108:
      v126 = 2654435761 * self->_iTunesStoreSubscriptionIdentifier;
      if ((*(_BYTE *)&v39 & 0x20) != 0)
        goto LABEL_109;
LABEL_113:
      v125 = 0;
      if ((*(_BYTE *)&v39 & 0x10) != 0)
        goto LABEL_110;
      goto LABEL_114;
    }
  }
  else
  {
    v127 = 0;
    if ((*(_BYTE *)&v39 & 0x80) != 0)
      goto LABEL_108;
  }
  v126 = 0;
  if ((*(_BYTE *)&v39 & 0x20) == 0)
    goto LABEL_113;
LABEL_109:
  v125 = 2654435761 * self->_iTunesStoreArtistIdentifier;
  if ((*(_BYTE *)&v39 & 0x10) != 0)
  {
LABEL_110:
    v124 = 2654435761 * self->_iTunesStoreAlbumIdentifier;
    goto LABEL_115;
  }
LABEL_114:
  v124 = 0;
LABEL_115:
  v123 = -[NSData hash](self->_purchaseInfoData, "hash");
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x100000) != 0)
  {
    defaultPlaybackRate = self->_defaultPlaybackRate;
    v43 = -defaultPlaybackRate;
    if (defaultPlaybackRate >= 0.0)
      v43 = self->_defaultPlaybackRate;
    v44 = floorf(v43 + 0.5);
    v45 = (float)(v43 - v44) * 1.8447e19;
    v41 = 2654435761u * (unint64_t)fmodf(v44, 1.8447e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v41 += (unint64_t)v45;
    }
    else
    {
      v41 -= (unint64_t)fabsf(v45);
    }
  }
  else
  {
    v41 = 0;
  }
  if ((*(_DWORD *)&v40 & 0x800000) != 0)
    v121 = 2654435761 * self->_downloadState;
  else
    v121 = 0;
  v122 = v41;
  if ((*(_DWORD *)&v40 & 0x400000) != 0)
  {
    downloadProgress = self->_downloadProgress;
    v48 = -downloadProgress;
    if (downloadProgress >= 0.0)
      v48 = self->_downloadProgress;
    v49 = floorf(v48 + 0.5);
    v50 = (float)(v48 - v49) * 1.8447e19;
    v46 = 2654435761u * (unint64_t)fmodf(v49, 1.8447e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabsf(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  v120 = v46;
  v119 = -[NSData hash](self->_appMetricsData, "hash");
  v118 = -[NSString hash](self->_seriesName, "hash");
  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x20000000) != 0)
  {
    v117 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&v51 & 0x10000000) != 0)
      goto LABEL_136;
  }
  else
  {
    v117 = 0;
    if ((*(_DWORD *)&v51 & 0x10000000) != 0)
    {
LABEL_136:
      v116 = 2654435761 * self->_mediaSubType;
      goto LABEL_139;
    }
  }
  v116 = 0;
LABEL_139:
  v115 = -[NSData hash](self->_nowPlayingInfoData, "hash");
  v114 = -[NSData hash](self->_userInfoData, "hash");
  if ((*((_BYTE *)&self->_has + 7) & 4) != 0)
    v113 = 2654435761 * self->_isSteerable;
  else
    v113 = 0;
  v112 = -[NSString hash](self->_artworkURL, "hash");
  v111 = -[NSString hash](self->_lyricsURL, "hash");
  v110 = -[NSData hash](self->_deviceSpecificUserInfoData, "hash");
  v109 = -[NSData hash](self->_collectionInfoData, "hash");
  v52 = self->_has;
  if ((*(_BYTE *)&v52 & 4) != 0)
  {
    elapsedTimeTimestamp = self->_elapsedTimeTimestamp;
    v55 = -elapsedTimeTimestamp;
    if (elapsedTimeTimestamp >= 0.0)
      v55 = self->_elapsedTimeTimestamp;
    v56 = floor(v55 + 0.5);
    v57 = (v55 - v56) * 1.84467441e19;
    v53 = 2654435761u * (unint64_t)fmod(v56, 1.84467441e19);
    if (v57 >= 0.0)
    {
      if (v57 > 0.0)
        v53 += (unint64_t)v57;
    }
    else
    {
      v53 -= (unint64_t)fabs(v57);
    }
  }
  else
  {
    v53 = 0;
  }
  v108 = v53;
  if ((*(_WORD *)&v52 & 0x100) != 0)
  {
    inferredTimestamp = self->_inferredTimestamp;
    v60 = -inferredTimestamp;
    if (inferredTimestamp >= 0.0)
      v60 = self->_inferredTimestamp;
    v61 = floor(v60 + 0.5);
    v62 = (v60 - v61) * 1.84467441e19;
    v58 = 2654435761u * (unint64_t)fmod(v61, 1.84467441e19);
    if (v62 >= 0.0)
    {
      if (v62 > 0.0)
        v58 += (unint64_t)v62;
    }
    else
    {
      v58 -= (unint64_t)fabs(v62);
    }
  }
  else
  {
    v58 = 0;
  }
  v107 = v58;
  v106 = -[NSString hash](self->_serviceIdentifier, "hash");
  v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x40000) != 0)
  {
    v105 = 2654435761 * self->_artworkDataWidthDeprecated;
    if ((*(_DWORD *)&v63 & 0x20000) != 0)
      goto LABEL_160;
  }
  else
  {
    v105 = 0;
    if ((*(_DWORD *)&v63 & 0x20000) != 0)
    {
LABEL_160:
      v104 = 2654435761 * self->_artworkDataHeightDeprecated;
      goto LABEL_163;
    }
  }
  v104 = 0;
LABEL_163:
  v103 = -[NSData hash](self->_currentPlaybackDateData, "hash");
  v102 = -[NSString hash](self->_artworkIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 6) & 0x40) != 0)
    v101 = 2654435761 * self->_isLoading;
  else
    v101 = 0;
  v100 = -[NSData hash](self->_artworkURLTemplatesData, "hash");
  v64 = self->_has;
  if ((*(_WORD *)&v64 & 0x200) != 0)
  {
    v99 = 2654435761 * self->_legacyUniqueIdentifier;
    if ((*(_DWORD *)&v64 & 0x4000000) != 0)
      goto LABEL_168;
  }
  else
  {
    v99 = 0;
    if ((*(_DWORD *)&v64 & 0x4000000) != 0)
    {
LABEL_168:
      v98 = 2654435761 * self->_episodeType;
      goto LABEL_171;
    }
  }
  v98 = 0;
LABEL_171:
  v97 = -[NSString hash](self->_artworkFileURL, "hash");
  v96 = -[NSString hash](self->_brandIdentifier, "hash");
  v95 = -[NSString hash](self->_localizedDurationString, "hash");
  v94 = -[NSString hash](self->_albumYear, "hash");
  v65 = self->_has;
  if ((*(_QWORD *)&v65 & 0x4000000000) == 0)
  {
    v93 = 0;
    if ((*(_DWORD *)&v65 & 0x10000) != 0)
      goto LABEL_173;
LABEL_176:
    v92 = 0;
    if ((*(_QWORD *)&v65 & 0x400000000) != 0)
      goto LABEL_174;
    goto LABEL_177;
  }
  v93 = 2654435761 * self->_songTraits;
  if ((*(_DWORD *)&v65 & 0x10000) == 0)
    goto LABEL_176;
LABEL_173:
  v92 = 2654435761 * self->_albumTraits;
  if ((*(_QWORD *)&v65 & 0x400000000) != 0)
  {
LABEL_174:
    v91 = 2654435761 * self->_playlistTraits;
    goto LABEL_178;
  }
LABEL_177:
  v91 = 0;
LABEL_178:
  v90 = -[_MRAudioFormatProtobuf hash](self->_preferredFormat, "hash");
  v89 = -[_MRAudioFormatProtobuf hash](self->_activeFormat, "hash");
  v66 = self->_has;
  if ((*(_WORD *)&v66 & 0x8000) != 0)
  {
    v88 = 2654435761 * self->_activeFormatJustification;
    if ((*(_DWORD *)&v66 & 0x8000000) != 0)
      goto LABEL_180;
  }
  else
  {
    v88 = 0;
    if ((*(_DWORD *)&v66 & 0x8000000) != 0)
    {
LABEL_180:
      v87 = 2654435761 * self->_formatTierPreference;
      goto LABEL_183;
    }
  }
  v87 = 0;
LABEL_183:
  v86 = -[_MRAudioRouteProtobuf hash](self->_audioRoute, "hash");
  v85 = -[NSMutableArray hash](self->_alternativeFormats, "hash");
  v67 = self->_has;
  if ((*(_QWORD *)&v67 & 0x400000000000) != 0)
  {
    v84 = 2654435761 * self->_isAdvertisement;
    if ((*(_QWORD *)&v67 & 0x100000000000) != 0)
      goto LABEL_185;
  }
  else
  {
    v84 = 0;
    if ((*(_QWORD *)&v67 & 0x100000000000) != 0)
    {
LABEL_185:
      v83 = 2654435761 * self->_hasAlternativeFormats;
      goto LABEL_188;
    }
  }
  v83 = 0;
LABEL_188:
  v82 = -[NSString hash](self->_participantName, "hash");
  v68 = -[NSString hash](self->_participantIdentifier, "hash");
  v69 = -[NSString hash](self->_classicalWork, "hash");
  v70 = self->_has;
  if ((*(_WORD *)&v70 & 0x2000) == 0)
  {
    v71 = 0;
    if ((*(_WORD *)&v70 & 0x400) != 0)
      goto LABEL_190;
LABEL_193:
    v72 = 0;
    if ((*(_BYTE *)&v70 & 8) != 0)
      goto LABEL_191;
    goto LABEL_194;
  }
  v71 = 2654435761 * self->_reportingAdamID;
  if ((*(_WORD *)&v70 & 0x400) == 0)
    goto LABEL_193;
LABEL_190:
  v72 = 2654435761 * self->_lyricsAdamID;
  if ((*(_BYTE *)&v70 & 8) != 0)
  {
LABEL_191:
    v73 = 2654435761 * self->_iTunesStoreAlbumArtistIdentifier;
    goto LABEL_195;
  }
LABEL_194:
  v73 = 0;
LABEL_195:
  v74 = -[NSString hash](self->_durationStringLocalizationKey, "hash");
  if ((*((_BYTE *)&self->_has + 7) & 1) != 0)
    v75 = 2654435761 * self->_isResolvableParticipant;
  else
    v75 = 0;
  v76 = -[NSString hash](self->_internationalStandardRecordingCode, "hash");
  v77 = self->_has;
  if ((*(_QWORD *)&v77 & 0x8000000000000) == 0)
  {
    v78 = 0;
    if ((*(_QWORD *)&v77 & 0x80000000000) != 0)
      goto LABEL_200;
LABEL_203:
    v79 = 0;
    if ((*(_QWORD *)&v77 & 0x4000000000000000) != 0)
      goto LABEL_201;
LABEL_204:
    v80 = 0;
    return v174 ^ v175 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v80;
  }
  v78 = 2654435761 * self->_isInTransition;
  if ((*(_QWORD *)&v77 & 0x80000000000) == 0)
    goto LABEL_203;
LABEL_200:
  v79 = 2654435761 * self->_excludeFromSuggestions;
  if ((*(_QWORD *)&v77 & 0x4000000000000000) == 0)
    goto LABEL_204;
LABEL_201:
  v80 = 2654435761 * self->_transcriptAlignmentsAvailable;
  return v174 ^ v175 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v80;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _MRAudioFormatProtobuf *preferredFormat;
  uint64_t v19;
  _MRAudioFormatProtobuf *activeFormat;
  uint64_t v21;
  uint64_t v22;
  _MRAudioRouteProtobuf *audioRoute;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 71))
    -[_MRContentItemMetadataProtobuf setTitle:](self, "setTitle:");
  if (*((_QWORD *)v4 + 70))
    -[_MRContentItemMetadataProtobuf setSubtitle:](self, "setSubtitle:");
  v5 = *((_QWORD *)v4 + 79);
  if ((v5 & 0x1000000000000) != 0)
  {
    self->_isContainer = *((_BYTE *)v4 + 614);
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
    v5 = *((_QWORD *)v4 + 79);
    if ((v5 & 0x80000000000000) == 0)
    {
LABEL_7:
      if ((v5 & 0x100000000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v5 & 0x80000000000000) == 0)
  {
    goto LABEL_7;
  }
  self->_isPlayable = *((_BYTE *)v4 + 621);
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x100000000) != 0)
  {
LABEL_8:
    self->_playbackProgress = *((float *)v4 + 117);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 19))
    -[_MRContentItemMetadataProtobuf setAlbumName:](self, "setAlbumName:");
  if (*((_QWORD *)v4 + 73))
    -[_MRContentItemMetadataProtobuf setTrackArtistName:](self, "setTrackArtistName:");
  if (*((_QWORD *)v4 + 18))
    -[_MRContentItemMetadataProtobuf setAlbumArtistName:](self, "setAlbumArtistName:");
  if (*((_QWORD *)v4 + 42))
    -[_MRContentItemMetadataProtobuf setDirectorName:](self, "setDirectorName:");
  v6 = *((_QWORD *)v4 + 79);
  if ((v6 & 0x2000000000) != 0)
  {
    self->_seasonNumber = *((_DWORD *)v4 + 133);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
    v6 = *((_QWORD *)v4 + 79);
    if ((v6 & 0x2000000) == 0)
    {
LABEL_19:
      if ((v6 & 0x1000) == 0)
        goto LABEL_20;
      goto LABEL_148;
    }
  }
  else if ((v6 & 0x2000000) == 0)
  {
    goto LABEL_19;
  }
  self->_episodeNumber = *((_DWORD *)v4 + 93);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = *((_QWORD *)v4 + 79);
  if ((v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_149;
  }
LABEL_148:
  self->_releaseDate = *((double *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = *((_QWORD *)v4 + 79);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_149:
  self->_playCount = *((_DWORD *)v4 + 116);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  if ((*((_QWORD *)v4 + 79) & 1) != 0)
  {
LABEL_22:
    self->_duration = *((double *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 50))
    -[_MRContentItemMetadataProtobuf setLocalizedContentRating:](self, "setLocalizedContentRating:");
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x4000000000000) != 0)
  {
    self->_isExplicitItem = *((_BYTE *)v4 + 616);
    *(_QWORD *)&self->_has |= 0x4000000000000uLL;
    v7 = *((_QWORD *)v4 + 79);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_27:
      if ((v7 & 0x1000000000) == 0)
        goto LABEL_28;
      goto LABEL_153;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_27;
  }
  self->_playlistType = *((_DWORD *)v4 + 120);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_29;
    goto LABEL_154;
  }
LABEL_153:
  self->_radioStationType = *((_DWORD *)v4 + 132);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_29:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_30;
    goto LABEL_155;
  }
LABEL_154:
  self->_artworkAvailable = *((_BYTE *)v4 + 608);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_30:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_31;
    goto LABEL_156;
  }
LABEL_155:
  self->_infoAvailable = *((_BYTE *)v4 + 611);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x1000000000000000) == 0)
  {
LABEL_31:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_32;
    goto LABEL_157;
  }
LABEL_156:
  self->_languageOptionsAvailable = *((_BYTE *)v4 + 626);
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_32:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_33;
    goto LABEL_158;
  }
LABEL_157:
  self->_numberOfSections = *((_DWORD *)v4 + 110);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_33:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_34;
    goto LABEL_159;
  }
LABEL_158:
  self->_lyricsAvailable = *((_BYTE *)v4 + 627);
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_34:
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_35;
    goto LABEL_160;
  }
LABEL_159:
  self->_editingStyleFlags = *((_DWORD *)v4 + 92);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v7 = *((_QWORD *)v4 + 79);
  if ((v7 & 0x800000000000000) == 0)
  {
LABEL_35:
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_160:
  self->_isStreamingContent = *((_BYTE *)v4 + 625);
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x2000000000000) != 0)
  {
LABEL_36:
    self->_isCurrentlyPlaying = *((_BYTE *)v4 + 615);
    *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  }
LABEL_37:
  if (*((_QWORD *)v4 + 35))
    -[_MRContentItemMetadataProtobuf setCollectionIdentifier:](self, "setCollectionIdentifier:");
  if (*((_QWORD *)v4 + 62))
    -[_MRContentItemMetadataProtobuf setProfileIdentifier:](self, "setProfileIdentifier:");
  if ((*((_BYTE *)v4 + 633) & 0x40) != 0)
  {
    self->_startTime = *((double *)v4 + 15);
    *(_QWORD *)&self->_has |= 0x4000uLL;
  }
  if (*((_QWORD *)v4 + 27))
    -[_MRContentItemMetadataProtobuf setArtworkMIMEType:](self, "setArtworkMIMEType:");
  if (*((_QWORD *)v4 + 30))
    -[_MRContentItemMetadataProtobuf setAssetURLString:](self, "setAssetURLString:");
  if (*((_QWORD *)v4 + 37))
    -[_MRContentItemMetadataProtobuf setComposer:](self, "setComposer:");
  v8 = *((_QWORD *)v4 + 79);
  if ((v8 & 0x200000) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 86);
    *(_QWORD *)&self->_has |= 0x200000uLL;
    v8 = *((_QWORD *)v4 + 79);
  }
  if ((v8 & 2) != 0)
  {
    self->_elapsedTime = *((double *)v4 + 2);
    *(_QWORD *)&self->_has |= 2uLL;
  }
  if (*((_QWORD *)v4 + 48))
    -[_MRContentItemMetadataProtobuf setGenre:](self, "setGenre:");
  v9 = *((_QWORD *)v4 + 79);
  if ((v9 & 0x800000000000) != 0)
  {
    self->_isAlwaysLive = *((_BYTE *)v4 + 613);
    *(_QWORD *)&self->_has |= 0x800000000000uLL;
    v9 = *((_QWORD *)v4 + 79);
    if ((v9 & 0x200000000) == 0)
    {
LABEL_57:
      if ((v9 & 0x80000) == 0)
        goto LABEL_58;
      goto LABEL_164;
    }
  }
  else if ((v9 & 0x200000000) == 0)
  {
    goto LABEL_57;
  }
  self->_playbackRate = *((float *)v4 + 118);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v9 = *((_QWORD *)v4 + 79);
  if ((v9 & 0x80000) == 0)
  {
LABEL_58:
    if ((v9 & 0x8000000000) == 0)
      goto LABEL_59;
    goto LABEL_165;
  }
LABEL_164:
  self->_chapterCount = *((_DWORD *)v4 + 66);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v9 = *((_QWORD *)v4 + 79);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_59:
    if ((v9 & 0x10000000000) == 0)
      goto LABEL_60;
    goto LABEL_166;
  }
LABEL_165:
  self->_totalDiscCount = *((_DWORD *)v4 + 144);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v9 = *((_QWORD *)v4 + 79);
  if ((v9 & 0x10000000000) == 0)
  {
LABEL_60:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_166:
  self->_totalTrackCount = *((_DWORD *)v4 + 145);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x20000000000) != 0)
  {
LABEL_61:
    self->_trackNumber = *((_DWORD *)v4 + 148);
    *(_QWORD *)&self->_has |= 0x20000000000uLL;
  }
LABEL_62:
  if (*((_QWORD *)v4 + 38))
    -[_MRContentItemMetadataProtobuf setContentIdentifier:](self, "setContentIdentifier:");
  v10 = *((_QWORD *)v4 + 79);
  if ((v10 & 0x200000000000000) != 0)
  {
    self->_isSharable = *((_BYTE *)v4 + 623);
    *(_QWORD *)&self->_has |= 0x200000000000000uLL;
    v10 = *((_QWORD *)v4 + 79);
    if ((v10 & 0x20000000000000) == 0)
    {
LABEL_66:
      if ((v10 & 0x10000000000000) == 0)
        goto LABEL_67;
      goto LABEL_170;
    }
  }
  else if ((v10 & 0x20000000000000) == 0)
  {
    goto LABEL_66;
  }
  self->_isLiked = *((_BYTE *)v4 + 619);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v10 = *((_QWORD *)v4 + 79);
  if ((v10 & 0x10000000000000) == 0)
  {
LABEL_67:
    if ((v10 & 0x800) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_170:
  self->_isInWishList = *((_BYTE *)v4 + 618);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x800) != 0)
  {
LABEL_68:
    self->_radioStationIdentifier = *((_QWORD *)v4 + 12);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
LABEL_69:
  if (*((_QWORD *)v4 + 64))
    -[_MRContentItemMetadataProtobuf setRadioStationName:](self, "setRadioStationName:");
  if (*((_QWORD *)v4 + 65))
    -[_MRContentItemMetadataProtobuf setRadioStationString:](self, "setRadioStationString:");
  v11 = *((_QWORD *)v4 + 79);
  if ((v11 & 0x40) != 0)
  {
    self->_iTunesStoreIdentifier = *((_QWORD *)v4 + 7);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v11 = *((_QWORD *)v4 + 79);
    if ((v11 & 0x80) == 0)
    {
LABEL_75:
      if ((v11 & 0x20) == 0)
        goto LABEL_76;
      goto LABEL_174;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_75;
  }
  self->_iTunesStoreSubscriptionIdentifier = *((_QWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v11 = *((_QWORD *)v4 + 79);
  if ((v11 & 0x20) == 0)
  {
LABEL_76:
    if ((v11 & 0x10) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_174:
  self->_iTunesStoreArtistIdentifier = *((_QWORD *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  if ((*((_QWORD *)v4 + 79) & 0x10) != 0)
  {
LABEL_77:
    self->_iTunesStoreAlbumIdentifier = *((_QWORD *)v4 + 5);
    *(_QWORD *)&self->_has |= 0x10uLL;
  }
LABEL_78:
  if (*((_QWORD *)v4 + 63))
    -[_MRContentItemMetadataProtobuf setPurchaseInfoData:](self, "setPurchaseInfoData:");
  v12 = *((_QWORD *)v4 + 79);
  if ((v12 & 0x100000) != 0)
  {
    self->_defaultPlaybackRate = *((float *)v4 + 80);
    *(_QWORD *)&self->_has |= 0x100000uLL;
    v12 = *((_QWORD *)v4 + 79);
    if ((v12 & 0x800000) == 0)
    {
LABEL_82:
      if ((v12 & 0x400000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((v12 & 0x800000) == 0)
  {
    goto LABEL_82;
  }
  self->_downloadState = *((_DWORD *)v4 + 88);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x400000) != 0)
  {
LABEL_83:
    self->_downloadProgress = *((float *)v4 + 87);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_84:
  if (*((_QWORD *)v4 + 23))
    -[_MRContentItemMetadataProtobuf setAppMetricsData:](self, "setAppMetricsData:");
  if (*((_QWORD *)v4 + 67))
    -[_MRContentItemMetadataProtobuf setSeriesName:](self, "setSeriesName:");
  v13 = *((_QWORD *)v4 + 79);
  if ((v13 & 0x20000000) != 0)
  {
    self->_mediaType = *((_DWORD *)v4 + 107);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v13 = *((_QWORD *)v4 + 79);
  }
  if ((v13 & 0x10000000) != 0)
  {
    self->_mediaSubType = *((_DWORD *)v4 + 106);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
  if (*((_QWORD *)v4 + 54))
    -[_MRContentItemMetadataProtobuf setNowPlayingInfoData:](self, "setNowPlayingInfoData:");
  if (*((_QWORD *)v4 + 75))
    -[_MRContentItemMetadataProtobuf setUserInfoData:](self, "setUserInfoData:");
  if ((*((_BYTE *)v4 + 639) & 4) != 0)
  {
    self->_isSteerable = *((_BYTE *)v4 + 624);
    *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  }
  if (*((_QWORD *)v4 + 28))
    -[_MRContentItemMetadataProtobuf setArtworkURL:](self, "setArtworkURL:");
  if (*((_QWORD *)v4 + 52))
    -[_MRContentItemMetadataProtobuf setLyricsURL:](self, "setLyricsURL:");
  if (*((_QWORD *)v4 + 41))
    -[_MRContentItemMetadataProtobuf setDeviceSpecificUserInfoData:](self, "setDeviceSpecificUserInfoData:");
  if (*((_QWORD *)v4 + 36))
    -[_MRContentItemMetadataProtobuf setCollectionInfoData:](self, "setCollectionInfoData:");
  v14 = *((_QWORD *)v4 + 79);
  if ((v14 & 4) != 0)
  {
    self->_elapsedTimeTimestamp = *((double *)v4 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
    v14 = *((_QWORD *)v4 + 79);
  }
  if ((v14 & 0x100) != 0)
  {
    self->_inferredTimestamp = *((double *)v4 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 68))
    -[_MRContentItemMetadataProtobuf setServiceIdentifier:](self, "setServiceIdentifier:");
  v15 = *((_QWORD *)v4 + 79);
  if ((v15 & 0x40000) != 0)
  {
    self->_artworkDataWidthDeprecated = *((_DWORD *)v4 + 49);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v15 = *((_QWORD *)v4 + 79);
  }
  if ((v15 & 0x20000) != 0)
  {
    self->_artworkDataHeightDeprecated = *((_DWORD *)v4 + 48);
    *(_QWORD *)&self->_has |= 0x20000uLL;
  }
  if (*((_QWORD *)v4 + 39))
    -[_MRContentItemMetadataProtobuf setCurrentPlaybackDateData:](self, "setCurrentPlaybackDateData:");
  if (*((_QWORD *)v4 + 26))
    -[_MRContentItemMetadataProtobuf setArtworkIdentifier:](self, "setArtworkIdentifier:");
  if ((*((_BYTE *)v4 + 638) & 0x40) != 0)
  {
    self->_isLoading = *((_BYTE *)v4 + 620);
    *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  }
  if (*((_QWORD *)v4 + 29))
    -[_MRContentItemMetadataProtobuf setArtworkURLTemplatesData:](self, "setArtworkURLTemplatesData:");
  v16 = *((_QWORD *)v4 + 79);
  if ((v16 & 0x200) != 0)
  {
    self->_legacyUniqueIdentifier = *((_QWORD *)v4 + 10);
    *(_QWORD *)&self->_has |= 0x200uLL;
    v16 = *((_QWORD *)v4 + 79);
  }
  if ((v16 & 0x4000000) != 0)
  {
    self->_episodeType = *((_DWORD *)v4 + 94);
    *(_QWORD *)&self->_has |= 0x4000000uLL;
  }
  if (*((_QWORD *)v4 + 25))
    -[_MRContentItemMetadataProtobuf setArtworkFileURL:](self, "setArtworkFileURL:");
  if (*((_QWORD *)v4 + 32))
    -[_MRContentItemMetadataProtobuf setBrandIdentifier:](self, "setBrandIdentifier:");
  if (*((_QWORD *)v4 + 51))
    -[_MRContentItemMetadataProtobuf setLocalizedDurationString:](self, "setLocalizedDurationString:");
  if (*((_QWORD *)v4 + 21))
    -[_MRContentItemMetadataProtobuf setAlbumYear:](self, "setAlbumYear:");
  v17 = *((_QWORD *)v4 + 79);
  if ((v17 & 0x4000000000) != 0)
  {
    self->_songTraits = *((_DWORD *)v4 + 138);
    *(_QWORD *)&self->_has |= 0x4000000000uLL;
    v17 = *((_QWORD *)v4 + 79);
    if ((v17 & 0x10000) == 0)
    {
LABEL_138:
      if ((v17 & 0x400000000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((v17 & 0x10000) == 0)
  {
    goto LABEL_138;
  }
  self->_albumTraits = *((_DWORD *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  if ((*((_QWORD *)v4 + 79) & 0x400000000) != 0)
  {
LABEL_139:
    self->_playlistTraits = *((_DWORD *)v4 + 119);
    *(_QWORD *)&self->_has |= 0x400000000uLL;
  }
LABEL_140:
  preferredFormat = self->_preferredFormat;
  v19 = *((_QWORD *)v4 + 61);
  if (preferredFormat)
  {
    if (v19)
      -[_MRAudioFormatProtobuf mergeFrom:](preferredFormat, "mergeFrom:");
  }
  else if (v19)
  {
    -[_MRContentItemMetadataProtobuf setPreferredFormat:](self, "setPreferredFormat:");
  }
  activeFormat = self->_activeFormat;
  v21 = *((_QWORD *)v4 + 16);
  if (activeFormat)
  {
    if (v21)
      -[_MRAudioFormatProtobuf mergeFrom:](activeFormat, "mergeFrom:");
  }
  else if (v21)
  {
    -[_MRContentItemMetadataProtobuf setActiveFormat:](self, "setActiveFormat:");
  }
  v22 = *((_QWORD *)v4 + 79);
  if ((v22 & 0x8000) != 0)
  {
    self->_activeFormatJustification = *((_DWORD *)v4 + 34);
    *(_QWORD *)&self->_has |= 0x8000uLL;
    v22 = *((_QWORD *)v4 + 79);
  }
  if ((v22 & 0x8000000) != 0)
  {
    self->_formatTierPreference = *((_DWORD *)v4 + 95);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
  }
  audioRoute = self->_audioRoute;
  v24 = *((_QWORD *)v4 + 31);
  if (audioRoute)
  {
    if (v24)
      -[_MRAudioRouteProtobuf mergeFrom:](audioRoute, "mergeFrom:");
  }
  else if (v24)
  {
    -[_MRContentItemMetadataProtobuf setAudioRoute:](self, "setAudioRoute:");
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = *((id *)v4 + 22);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        -[_MRContentItemMetadataProtobuf addAlternativeFormats:](self, "addAlternativeFormats:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), (_QWORD)v33);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v27);
  }

  v30 = *((_QWORD *)v4 + 79);
  if ((v30 & 0x400000000000) != 0)
  {
    self->_isAdvertisement = *((_BYTE *)v4 + 612);
    *(_QWORD *)&self->_has |= 0x400000000000uLL;
    v30 = *((_QWORD *)v4 + 79);
  }
  if ((v30 & 0x100000000000) != 0)
  {
    self->_hasAlternativeFormats = *((_BYTE *)v4 + 610);
    *(_QWORD *)&self->_has |= 0x100000000000uLL;
  }
  if (*((_QWORD *)v4 + 57))
    -[_MRContentItemMetadataProtobuf setParticipantName:](self, "setParticipantName:");
  if (*((_QWORD *)v4 + 56))
    -[_MRContentItemMetadataProtobuf setParticipantIdentifier:](self, "setParticipantIdentifier:");
  if (*((_QWORD *)v4 + 34))
    -[_MRContentItemMetadataProtobuf setClassicalWork:](self, "setClassicalWork:");
  v31 = *((_QWORD *)v4 + 79);
  if ((v31 & 0x2000) != 0)
  {
    self->_reportingAdamID = *((_QWORD *)v4 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
    v31 = *((_QWORD *)v4 + 79);
    if ((v31 & 0x400) == 0)
    {
LABEL_217:
      if ((v31 & 8) == 0)
        goto LABEL_219;
      goto LABEL_218;
    }
  }
  else if ((v31 & 0x400) == 0)
  {
    goto LABEL_217;
  }
  self->_lyricsAdamID = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  if ((*((_QWORD *)v4 + 79) & 8) != 0)
  {
LABEL_218:
    self->_iTunesStoreAlbumArtistIdentifier = *((_QWORD *)v4 + 4);
    *(_QWORD *)&self->_has |= 8uLL;
  }
LABEL_219:
  if (*((_QWORD *)v4 + 45))
    -[_MRContentItemMetadataProtobuf setDurationStringLocalizationKey:](self, "setDurationStringLocalizationKey:");
  if ((*((_BYTE *)v4 + 639) & 1) != 0)
  {
    self->_isResolvableParticipant = *((_BYTE *)v4 + 622);
    *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  }
  if (*((_QWORD *)v4 + 49))
    -[_MRContentItemMetadataProtobuf setInternationalStandardRecordingCode:](self, "setInternationalStandardRecordingCode:");
  v32 = *((_QWORD *)v4 + 79);
  if ((v32 & 0x8000000000000) == 0)
  {
    if ((v32 & 0x80000000000) == 0)
      goto LABEL_227;
LABEL_234:
    self->_excludeFromSuggestions = *((_BYTE *)v4 + 609);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
    if ((*((_QWORD *)v4 + 79) & 0x4000000000000000) == 0)
      goto LABEL_229;
    goto LABEL_228;
  }
  self->_isInTransition = *((_BYTE *)v4 + 617);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v32 = *((_QWORD *)v4 + 79);
  if ((v32 & 0x80000000000) != 0)
    goto LABEL_234;
LABEL_227:
  if ((v32 & 0x4000000000000000) != 0)
  {
LABEL_228:
    self->_transcriptAlignmentsAvailable = *((_BYTE *)v4 + 628);
    *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  }
LABEL_229:

}

- (NSString)assetURLString
{
  return self->_assetURLString;
}

- (NSData)appMetricsData
{
  return self->_appMetricsData;
}

- (NSString)artworkURL
{
  return self->_artworkURL;
}

- (NSString)lyricsURL
{
  return self->_lyricsURL;
}

- (NSData)currentPlaybackDateData
{
  return self->_currentPlaybackDateData;
}

- (NSData)artworkURLTemplatesData
{
  return self->_artworkURLTemplatesData;
}

- (void)setArtworkURLTemplatesData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURLTemplatesData, a3);
}

- (NSString)artworkFileURL
{
  return self->_artworkFileURL;
}

- (_MRAudioFormatProtobuf)preferredFormat
{
  return self->_preferredFormat;
}

- (_MRAudioFormatProtobuf)activeFormat
{
  return self->_activeFormat;
}

- (_MRAudioRouteProtobuf)audioRoute
{
  return self->_audioRoute;
}

- (NSMutableArray)alternativeFormats
{
  return self->_alternativeFormats;
}

- (void)setAlternativeFormats:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeFormats, a3);
}

- (NSString)participantName
{
  return self->_participantName;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (NSString)internationalStandardRecordingCode
{
  return self->_internationalStandardRecordingCode;
}

- (void)setInternationalStandardRecordingCode:(id)a3
{
  objc_storeStrong((id *)&self->_internationalStandardRecordingCode, a3);
}

- (BOOL)isInTransition
{
  return self->_isInTransition;
}

- (BOOL)excludeFromSuggestions
{
  return self->_excludeFromSuggestions;
}

- (BOOL)transcriptAlignmentsAvailable
{
  return self->_transcriptAlignmentsAvailable;
}

@end
