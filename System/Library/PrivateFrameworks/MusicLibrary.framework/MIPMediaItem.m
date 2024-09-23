@implementation MIPMediaItem

- (int)mediaType
{
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    return self->_mediaType;
  else
    return 1;
}

- (void)setMediaType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (id)mediaTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xD)
    return off_1E5B65DA0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Song")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVShow")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceMemo")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VideoPodcast")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MusicVideo")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioBook")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DigitalBooklet")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITunesUAudio")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITunesUVideo")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeVideo")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MusicQuiz")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSortTitle
{
  return self->_sortTitle != 0;
}

- (void)setReleaseDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_releaseDateTime = a3;
}

- (void)setHasReleaseDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasReleaseDateTime
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCreationDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_creationDateTime = a3;
}

- (void)setHasCreationDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCreationDateTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setModificationDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_modificationDateTime = a3;
}

- (void)setHasModificationDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasModificationDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setFileSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasFileSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setContentRating:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_contentRating = a3;
}

- (void)setHasContentRating:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasContentRating
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setExplicitContent:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_explicitContent = a3;
}

- (void)setHasExplicitContent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (BOOL)hasShortDescription
{
  return self->_shortDescription != 0;
}

- (BOOL)hasLongDescription
{
  return self->_longDescription != 0;
}

- (BOOL)hasCopyright
{
  return self->_copyright != 0;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (void)setYear:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_year = a3;
}

- (void)setHasYear:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasYear
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setContentRatingLevel:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_contentRatingLevel = a3;
}

- (void)setHasContentRatingLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasContentRatingLevel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (void)setFileKind:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_fileKind = a3;
}

- (void)setHasFileKind:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasFileKind
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setFamilyAccountId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_familyAccountId = a3;
}

- (void)setHasFamilyAccountId:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasFamilyAccountId
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDrmVersionsCode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_drmVersionsCode = a3;
}

- (void)setHasDrmVersionsCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasDrmVersionsCode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setDrmPlatformIdCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_drmPlatformIdCode = a3;
}

- (void)setHasDrmPlatformIdCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDrmPlatformIdCode
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDrmKey1IdCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_drmKey1IdCode = a3;
}

- (void)setHasDrmKey1IdCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDrmKey1IdCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDrmKey2IdCode:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_drmKey2IdCode = a3;
}

- (void)setHasDrmKey2IdCode:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDrmKey2IdCode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasChapterMetadataUrl
{
  return self->_chapterMetadataUrl != 0;
}

- (BOOL)hasStoreAssetFlavor
{
  return self->_storeAssetFlavor != 0;
}

- (BOOL)hasExtrasUrl
{
  return self->_extrasUrl != 0;
}

- (void)setPurchaseDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_purchaseDateTime = a3;
}

- (void)setHasPurchaseDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPurchaseDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCloudStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_cloudStatus = a3;
}

- (void)setHasCloudStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasCloudStatus
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPlayCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_playCount = a3;
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasPlayCount
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setPlayCountDelta:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_playCountDelta = a3;
}

- (void)setHasPlayCountDelta:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasPlayCountDelta
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setLastPlayedDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_lastPlayedDateTime = a3;
}

- (void)setHasLastPlayedDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasLastPlayedDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSkipCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_skipCount = a3;
}

- (void)setHasSkipCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasSkipCount
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setSkipCountDelta:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_skipCountDelta = a3;
}

- (void)setHasSkipCountDelta:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSkipCountDelta
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setLastSkippedDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_lastSkippedDateTime = a3;
}

- (void)setHasLastSkippedDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasLastSkippedDateTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRememberBookmark:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_rememberBookmark = a3;
}

- (void)setHasRememberBookmark:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasRememberBookmark
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setBookmarkTimeMilliseconds:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_bookmarkTimeMilliseconds = a3;
}

- (void)setHasBookmarkTimeMilliseconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBookmarkTimeMilliseconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHidden:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setStorePlaylistId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_storePlaylistId = a3;
}

- (void)setHasStorePlaylistId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasStorePlaylistId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasLocalAsset:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_hasLocalAsset = a3;
}

- (void)setHasHasLocalAsset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHasLocalAsset
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (BOOL)hasGrouping
{
  return self->_grouping != 0;
}

- (void)setLikedState:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_likedState = a3;
}

- (void)setHasLikedState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasLikedState
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setNeedsReporting:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_needsReporting = a3;
}

- (void)setHasNeedsReporting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasNeedsReporting
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setLikedStateChanged:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_likedStateChanged = a3;
}

- (void)setHasLikedStateChanged:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasLikedStateChanged
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setIsInUsersLibrary:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_isInUsersLibrary = a3;
}

- (void)setHasIsInUsersLibrary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsInUsersLibrary
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setCloudAssetAvailable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_cloudAssetAvailable = a3;
}

- (void)setHasCloudAssetAvailable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasCloudAssetAvailable
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setStoreProtectionType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_storeProtectionType = a3;
}

- (void)setHasStoreProtectionType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasStoreProtectionType
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setUserDisabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_userDisabled = a3;
}

- (void)setHasUserDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserDisabled
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setCloudPlaybackEndpointType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_cloudPlaybackEndpointType = a3;
}

- (void)setHasCloudPlaybackEndpointType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasCloudPlaybackEndpointType
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPlaybackEndpointType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_playbackEndpointType = a3;
}

- (void)setHasPlaybackEndpointType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasPlaybackEndpointType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setCloudMatchedStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_cloudMatchedStatus = a3;
}

- (void)setHasCloudMatchedStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasCloudMatchedStatus
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setInUsersCloudLibrary:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_inUsersCloudLibrary = a3;
}

- (void)setHasInUsersCloudLibrary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasInUsersCloudLibrary
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setSecondaryArtworkSourceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_secondaryArtworkSourceType = a3;
}

- (void)setHasSecondaryArtworkSourceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSecondaryArtworkSourceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (BOOL)hasSecondaryArtworkId
{
  return self->_secondaryArtworkId != 0;
}

- (void)setHasChapterData:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_hasChapterData = a3;
}

- (void)setHasHasChapterData:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasHasChapterData
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (BOOL)hasFlattenedChapterData
{
  return self->_flattenedChapterData != 0;
}

- (void)setIsPreorder:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_isPreorder = a3;
}

- (void)setHasIsPreorder:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsPreorder
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_likedStateChangedDate = a3;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasLikedStateChangedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)clearLibraryIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_libraryIdentifiers, "removeAllObjects");
}

- (void)addLibraryIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *libraryIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  libraryIdentifiers = self->_libraryIdentifiers;
  v8 = v4;
  if (!libraryIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_libraryIdentifiers;
    self->_libraryIdentifiers = v6;

    v4 = v8;
    libraryIdentifiers = self->_libraryIdentifiers;
  }
  -[NSMutableArray addObject:](libraryIdentifiers, "addObject:", v4);

}

- (unint64_t)libraryIdentifiersCount
{
  return -[NSMutableArray count](self->_libraryIdentifiers, "count");
}

- (id)libraryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_libraryIdentifiers, "objectAtIndex:", a3);
}

- (void)setStoreId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasStoreId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setStorefrontId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_storefrontId = a3;
}

- (void)setHasStorefrontId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasStorefrontId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAccountId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAccountId
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPurchaseHistoryId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_purchaseHistoryId = a3;
}

- (void)setHasPurchaseHistoryId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasPurchaseHistoryId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPurchaseHistoryToken:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_purchaseHistoryToken = a3;
}

- (void)setHasPurchaseHistoryToken:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasPurchaseHistoryToken
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (BOOL)hasPurchaseHistoryRedownloadParams
{
  return self->_purchaseHistoryRedownloadParams != 0;
}

- (void)setSagaId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_sagaId = a3;
}

- (void)setHasSagaId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSagaId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasSagaRedownloadParams
{
  return self->_sagaRedownloadParams != 0;
}

- (BOOL)hasStoreXID
{
  return self->_storeXID != 0;
}

- (void)setSubscriptionStoreItemId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_subscriptionStoreItemId = a3;
}

- (void)setHasSubscriptionStoreItemId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSubscriptionStoreItemId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (void)setReportingStoreItemId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_reportingStoreItemId = a3;
}

- (void)setHasReportingStoreItemId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasReportingStoreItemId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAssetStoreItemId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_assetStoreItemId = a3;
}

- (void)setHasAssetStoreItemId:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($20C9AD10F7A062A4D81634BCAF627925)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAssetStoreItemId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSong
{
  return self->_song != 0;
}

- (BOOL)hasMovie
{
  return self->_movie != 0;
}

- (BOOL)hasTvShow
{
  return self->_tvShow != 0;
}

- (BOOL)hasPodcast
{
  return self->_podcast != 0;
}

- (BOOL)hasAudiobook
{
  return self->_audiobook != 0;
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
  v8.super_class = (Class)MIPMediaItem;
  -[MIPMediaItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMediaItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *title;
  NSString *sortTitle;
  $20C9AD10F7A062A4D81634BCAF627925 has;
  void *v9;
  NSString *shortDescription;
  NSString *longDescription;
  NSString *copyright;
  NSString *artworkId;
  $20C9AD10F7A062A4D81634BCAF627925 v14;
  void *v15;
  void *v16;
  NSString *comment;
  $20C9AD10F7A062A4D81634BCAF627925 v18;
  void *v19;
  NSString *chapterMetadataUrl;
  NSString *storeAssetFlavor;
  NSString *extrasUrl;
  $20C9AD10F7A062A4D81634BCAF627925 v23;
  void *v24;
  NSString *grouping;
  $20C9AD10F7A062A4D81634BCAF627925 v26;
  void *v27;
  NSString *secondaryArtworkId;
  void *v29;
  NSData *flattenedChapterData;
  $20C9AD10F7A062A4D81634BCAF627925 v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  $20C9AD10F7A062A4D81634BCAF627925 v41;
  void *v42;
  NSString *purchaseHistoryRedownloadParams;
  void *v44;
  NSString *sagaRedownloadParams;
  NSString *storeXID;
  void *v47;
  NSString *cloudUniversalLibraryId;
  $20C9AD10F7A062A4D81634BCAF627925 v49;
  void *v50;
  void *v51;
  MIPSong *song;
  void *v53;
  MIPMovie *movie;
  void *v55;
  MIPTVShow *tvShow;
  void *v57;
  MIPPodcast *podcast;
  void *v59;
  MIPAudiobook *audiobook;
  void *v61;
  id v62;
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
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    v4 = self->_mediaType - 1;
    if (v4 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5B65DA0[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mediaType"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  sortTitle = self->_sortTitle;
  if (sortTitle)
    objc_msgSend(v3, "setObject:forKey:", sortTitle, CFSTR("sortTitle"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_releaseDateTime);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("releaseDateTime"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_13;
      goto LABEL_128;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_creationDateTime);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("creationDateTime"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_modificationDateTime);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("modificationDateTime"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_fileSize);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("fileSize"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_16;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_duration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("duration"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_contentRating);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("contentRating"));

  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_explicitContent);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("explicitContent"));

  }
LABEL_18:
  shortDescription = self->_shortDescription;
  if (shortDescription)
    objc_msgSend(v3, "setObject:forKey:", shortDescription, CFSTR("shortDescription"));
  longDescription = self->_longDescription;
  if (longDescription)
    objc_msgSend(v3, "setObject:forKey:", longDescription, CFSTR("longDescription"));
  copyright = self->_copyright;
  if (copyright)
    objc_msgSend(v3, "setObject:forKey:", copyright, CFSTR("copyright"));
  artworkId = self->_artworkId;
  if (artworkId)
    objc_msgSend(v3, "setObject:forKey:", artworkId, CFSTR("artworkId"));
  v14 = self->_has;
  if ((*(_QWORD *)&v14 & 0x10000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_year);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("year"));

    v14 = self->_has;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_contentRatingLevel);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("contentRatingLevel"));

  }
  comment = self->_comment;
  if (comment)
    objc_msgSend(v3, "setObject:forKey:", comment, CFSTR("comment"));
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_fileKind);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("fileKind"));

    v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x100) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v18 & 0x10000000) == 0)
        goto LABEL_35;
      goto LABEL_135;
    }
  }
  else if ((*(_WORD *)&v18 & 0x100) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_familyAccountId);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("familyAccountId"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000000) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v18 & 0x40) == 0)
      goto LABEL_36;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_drmVersionsCode);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("drmVersionsCode"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x40) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v18 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_drmPlatformIdCode);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("drmPlatformIdCode"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&v18 & 0x20) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_drmKey1IdCode);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("drmKey1IdCode"));

  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_drmKey2IdCode);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("drmKey2IdCode"));

  }
LABEL_39:
  chapterMetadataUrl = self->_chapterMetadataUrl;
  if (chapterMetadataUrl)
    objc_msgSend(v3, "setObject:forKey:", chapterMetadataUrl, CFSTR("chapterMetadataUrl"));
  storeAssetFlavor = self->_storeAssetFlavor;
  if (storeAssetFlavor)
    objc_msgSend(v3, "setObject:forKey:", storeAssetFlavor, CFSTR("storeAssetFlavor"));
  extrasUrl = self->_extrasUrl;
  if (extrasUrl)
    objc_msgSend(v3, "setObject:forKey:", extrasUrl, CFSTR("extrasUrl"));
  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_purchaseDateTime);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("purchaseDateTime"));

    v23 = self->_has;
    if ((*(_DWORD *)&v23 & 0x2000000) == 0)
    {
LABEL_47:
      if ((*(_QWORD *)&v23 & 0x100000000) == 0)
        goto LABEL_48;
      goto LABEL_141;
    }
  }
  else if ((*(_DWORD *)&v23 & 0x2000000) == 0)
  {
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cloudStatus);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("cloudStatus"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&v23 & 0x200000000) == 0)
      goto LABEL_49;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playCount);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("playCount"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x200000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v23 & 0x400) == 0)
      goto LABEL_50;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playCountDelta);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("playCountDelta"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x400) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&v23 & 0x2000000000) == 0)
      goto LABEL_51;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastPlayedDateTime);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("lastPlayedDateTime"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x2000000000) == 0)
  {
LABEL_51:
    if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
      goto LABEL_52;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_skipCount);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("skipCount"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v23 & 0x800) == 0)
      goto LABEL_53;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_skipCountDelta);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("skipCountDelta"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) == 0)
  {
LABEL_53:
    if ((*(_QWORD *)&v23 & 0x8000000000000) == 0)
      goto LABEL_54;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastSkippedDateTime);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("lastSkippedDateTime"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x8000000000000) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&v23 & 4) == 0)
      goto LABEL_55;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rememberBookmark);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("rememberBookmark"));

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 4) == 0)
  {
LABEL_55:
    if ((*(_QWORD *)&v23 & 0x200000000000) == 0)
      goto LABEL_56;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bookmarkTimeMilliseconds);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("bookmarkTimeMilliseconds"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x200000000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v23 & 0x100000) == 0)
      goto LABEL_57;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("hidden"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x100000) == 0)
  {
LABEL_57:
    if ((*(_QWORD *)&v23 & 0x100000000000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storePlaylistId);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("storePlaylistId"));

  if ((*(_QWORD *)&self->_has & 0x100000000000) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasLocalAsset);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("hasLocalAsset"));

  }
LABEL_59:
  grouping = self->_grouping;
  if (grouping)
    objc_msgSend(v3, "setObject:forKey:", grouping, CFSTR("grouping"));
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_likedState);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("likedState"));

    v26 = self->_has;
    if ((*(_QWORD *)&v26 & 0x4000000000000) == 0)
    {
LABEL_63:
      if ((*(_QWORD *)&v26 & 0x2000000000000) == 0)
        goto LABEL_64;
      goto LABEL_154;
    }
  }
  else if ((*(_QWORD *)&v26 & 0x4000000000000) == 0)
  {
    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsReporting);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("needsReporting"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x2000000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v26 & 0x800000000000) == 0)
      goto LABEL_65;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_likedStateChanged);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("likedStateChanged"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x800000000000) == 0)
  {
LABEL_65:
    if ((*(_QWORD *)&v26 & 0x20000000000) == 0)
      goto LABEL_66;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInUsersLibrary);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("isInUsersLibrary"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((*(_QWORD *)&v26 & 0x8000000000) == 0)
      goto LABEL_67;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudAssetAvailable);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("cloudAssetAvailable"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x8000000000) == 0)
  {
LABEL_67:
    if ((*(_QWORD *)&v26 & 0x10000000000000) == 0)
      goto LABEL_68;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_storeProtectionType);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("storeProtectionType"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x10000000000000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v26 & 0x1000000) == 0)
      goto LABEL_69;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userDisabled);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("userDisabled"));

  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x1000000) == 0)
  {
LABEL_69:
    if ((*(_QWORD *)&v26 & 0x400000000) == 0)
      goto LABEL_70;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cloudPlaybackEndpointType);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("cloudPlaybackEndpointType"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v26 & 0x800000) == 0)
      goto LABEL_71;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playbackEndpointType);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("playbackEndpointType"));

  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x800000) == 0)
  {
LABEL_71:
    if ((*(_QWORD *)&v26 & 0x400000000000) == 0)
      goto LABEL_72;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cloudMatchedStatus);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("cloudMatchedStatus"));

  v26 = self->_has;
  if ((*(_QWORD *)&v26 & 0x400000000000) == 0)
  {
LABEL_72:
    if ((*(_QWORD *)&v26 & 0x1000000000) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inUsersCloudLibrary);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("inUsersCloudLibrary"));

  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
  {
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_secondaryArtworkSourceType);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("secondaryArtworkSourceType"));

  }
LABEL_74:
  secondaryArtworkId = self->_secondaryArtworkId;
  if (secondaryArtworkId)
    objc_msgSend(v3, "setObject:forKey:", secondaryArtworkId, CFSTR("secondaryArtworkId"));
  if ((*((_BYTE *)&self->_has + 5) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasChapterData);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("hasChapterData"));

  }
  flattenedChapterData = self->_flattenedChapterData;
  if (flattenedChapterData)
    objc_msgSend(v3, "setObject:forKey:", flattenedChapterData, CFSTR("flattenedChapterData"));
  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x1000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPreorder);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isPreorder"));

    v31 = self->_has;
  }
  if ((*(_WORD *)&v31 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_likedStateChangedDate);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("likedStateChangedDate"));

  }
  if (-[NSMutableArray count](self->_libraryIdentifiers, "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v35 = self->_libraryIdentifiers;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v103 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i), "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
      }
      while (v37);
    }

    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("libraryIdentifiers"));
  }
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storeId);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("storeId"));

    v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x200000) == 0)
    {
LABEL_95:
      if ((*(_BYTE *)&v41 & 1) == 0)
        goto LABEL_96;
      goto LABEL_166;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x200000) == 0)
  {
    goto LABEL_95;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storefrontId);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("storefrontId"));

  v41 = self->_has;
  if ((*(_BYTE *)&v41 & 1) == 0)
  {
LABEL_96:
    if ((*(_WORD *)&v41 & 0x8000) == 0)
      goto LABEL_97;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accountId);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("accountId"));

  v41 = self->_has;
  if ((*(_WORD *)&v41 & 0x8000) == 0)
  {
LABEL_97:
    if ((*(_QWORD *)&v41 & 0x800000000) == 0)
      goto LABEL_99;
    goto LABEL_98;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_purchaseHistoryId);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("purchaseHistoryId"));

  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
  {
LABEL_98:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_purchaseHistoryToken);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("purchaseHistoryToken"));

  }
LABEL_99:
  purchaseHistoryRedownloadParams = self->_purchaseHistoryRedownloadParams;
  if (purchaseHistoryRedownloadParams)
    objc_msgSend(v3, "setObject:forKey:", purchaseHistoryRedownloadParams, CFSTR("purchaseHistoryRedownloadParams"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sagaId);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("sagaId"));

  }
  sagaRedownloadParams = self->_sagaRedownloadParams;
  if (sagaRedownloadParams)
    objc_msgSend(v3, "setObject:forKey:", sagaRedownloadParams, CFSTR("sagaRedownloadParams"));
  storeXID = self->_storeXID;
  if (storeXID)
    objc_msgSend(v3, "setObject:forKey:", storeXID, CFSTR("storeXID"));
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_subscriptionStoreItemId);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("subscriptionStoreItemId"));

  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId)
    objc_msgSend(v3, "setObject:forKey:", cloudUniversalLibraryId, CFSTR("cloudUniversalLibraryId"));
  v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reportingStoreItemId);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("reportingStoreItemId"));

    v49 = self->_has;
  }
  if ((*(_BYTE *)&v49 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_assetStoreItemId);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("assetStoreItemId"));

  }
  song = self->_song;
  if (song)
  {
    -[MIPSong dictionaryRepresentation](song, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("song"));

  }
  movie = self->_movie;
  if (movie)
  {
    -[MIPMovie dictionaryRepresentation](movie, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("movie"));

  }
  tvShow = self->_tvShow;
  if (tvShow)
  {
    -[MIPTVShow dictionaryRepresentation](tvShow, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("tvShow"));

  }
  podcast = self->_podcast;
  if (podcast)
  {
    -[MIPPodcast dictionaryRepresentation](podcast, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("podcast"));

  }
  audiobook = self->_audiobook;
  if (audiobook)
  {
    -[MIPAudiobook dictionaryRepresentation](audiobook, "dictionaryRepresentation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("audiobook"));

  }
  v62 = v3;

  return v62;
}

- (BOOL)readFrom:(id)a3
{
  return MIPMediaItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $20C9AD10F7A062A4D81634BCAF627925 has;
  $20C9AD10F7A062A4D81634BCAF627925 v6;
  $20C9AD10F7A062A4D81634BCAF627925 v7;
  $20C9AD10F7A062A4D81634BCAF627925 v8;
  $20C9AD10F7A062A4D81634BCAF627925 v9;
  $20C9AD10F7A062A4D81634BCAF627925 v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $20C9AD10F7A062A4D81634BCAF627925 v16;
  $20C9AD10F7A062A4D81634BCAF627925 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_sortTitle)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_123;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_13;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_shortDescription)
    PBDataWriterWriteStringField();
  if (self->_longDescription)
    PBDataWriterWriteStringField();
  if (self->_copyright)
    PBDataWriterWriteStringField();
  if (self->_artworkId)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x10000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_comment)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x100) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v7 & 0x10000000) == 0)
        goto LABEL_32;
      goto LABEL_130;
    }
  }
  else if ((*(_WORD *)&v7 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_132:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
LABEL_35:
    PBDataWriterWriteInt64Field();
LABEL_36:
  if (self->_chapterMetadataUrl)
    PBDataWriterWriteStringField();
  if (self->_storeAssetFlavor)
    PBDataWriterWriteStringField();
  if (self->_extrasUrl)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
    {
LABEL_44:
      if ((*(_QWORD *)&v8 & 0x100000000) == 0)
        goto LABEL_45;
      goto LABEL_136;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteInt32Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v8 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt32Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt32Field();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
      goto LABEL_48;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
      goto LABEL_49;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_50;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt32Field();
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&v8 & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_52;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
      goto LABEL_53;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v8 & 0x100000000000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_145:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x100000000000) != 0)
LABEL_55:
    PBDataWriterWriteBOOLField();
LABEL_56:
  if (self->_grouping)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_has;
    if ((*(_QWORD *)&v9 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((*(_QWORD *)&v9 & 0x2000000000000) == 0)
        goto LABEL_61;
      goto LABEL_149;
    }
  }
  else if ((*(_QWORD *)&v9 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((*(_QWORD *)&v9 & 0x800000000000) == 0)
      goto LABEL_62;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
      goto LABEL_63;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
      goto LABEL_64;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v9 & 0x10000000000000) == 0)
      goto LABEL_65;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(_QWORD *)&v9 & 0x400000000) == 0)
      goto LABEL_67;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_68;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_68:
    if ((*(_QWORD *)&v9 & 0x400000000000) == 0)
      goto LABEL_69;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((*(_QWORD *)&v9 & 0x1000000000) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_157:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
LABEL_70:
    PBDataWriterWriteInt32Field();
LABEL_71:
  if (self->_secondaryArtworkId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 5) & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_flattenedChapterData)
    PBDataWriterWriteDataField();
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x1000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
    PBDataWriterWriteInt64Field();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_libraryIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
    {
LABEL_90:
      if ((*(_BYTE *)&v16 & 1) == 0)
        goto LABEL_91;
      goto LABEL_161;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt64Field();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 1) == 0)
  {
LABEL_91:
    if ((*(_WORD *)&v16 & 0x8000) == 0)
      goto LABEL_92;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
LABEL_92:
    if ((*(_QWORD *)&v16 & 0x800000000) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
LABEL_93:
    PBDataWriterWriteInt32Field();
LABEL_94:
  if (self->_purchaseHistoryRedownloadParams)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_sagaRedownloadParams)
    PBDataWriterWriteStringField();
  if (self->_storeXID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_cloudUniversalLibraryId)
    PBDataWriterWriteStringField();
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v17 = self->_has;
  }
  if ((*(_BYTE *)&v17 & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_song)
    PBDataWriterWriteSubmessage();
  if (self->_movie)
    PBDataWriterWriteSubmessage();
  if (self->_tvShow)
    PBDataWriterWriteSubmessage();
  if (self->_podcast)
    PBDataWriterWriteSubmessage();
  if (self->_audiobook)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $20C9AD10F7A062A4D81634BCAF627925 has;
  $20C9AD10F7A062A4D81634BCAF627925 v6;
  $20C9AD10F7A062A4D81634BCAF627925 v7;
  $20C9AD10F7A062A4D81634BCAF627925 v8;
  $20C9AD10F7A062A4D81634BCAF627925 v9;
  $20C9AD10F7A062A4D81634BCAF627925 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  $20C9AD10F7A062A4D81634BCAF627925 v15;
  _QWORD *v16;
  $20C9AD10F7A062A4D81634BCAF627925 v17;
  _DWORD *v18;

  v4 = a3;
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    v4[82] = self->_mediaType;
    *((_QWORD *)v4 + 62) |= 0x80000000uLL;
  }
  v18 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v18;
  }
  if (self->_sortTitle)
  {
    objc_msgSend(v18, "setSortTitle:");
    v4 = v18;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((_QWORD *)v4 + 17) = self->_releaseDateTime;
    *((_QWORD *)v4 + 62) |= 0x10000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_120;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 4) = self->_creationDateTime;
  *((_QWORD *)v4 + 62) |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_121;
  }
LABEL_120:
  *((_QWORD *)v4 + 14) = self->_modificationDateTime;
  *((_QWORD *)v4 + 62) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_122;
  }
LABEL_121:
  *((_QWORD *)v4 + 10) = self->_fileSize;
  *((_QWORD *)v4 + 62) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_13;
    goto LABEL_123;
  }
LABEL_122:
  *((_QWORD *)v4 + 8) = self->_duration;
  *((_QWORD *)v4 + 62) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_123:
  v4[62] = self->_contentRating;
  *((_QWORD *)v4 + 62) |= 0x4000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_14:
    *((_BYTE *)v4 + 485) = self->_explicitContent;
    *((_QWORD *)v4 + 62) |= 0x40000000000uLL;
  }
LABEL_15:
  if (self->_shortDescription)
  {
    objc_msgSend(v18, "setShortDescription:");
    v4 = v18;
  }
  if (self->_longDescription)
  {
    objc_msgSend(v18, "setLongDescription:");
    v4 = v18;
  }
  if (self->_copyright)
  {
    objc_msgSend(v18, "setCopyright:");
    v4 = v18;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v18, "setArtworkId:");
    v4 = v18;
  }
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x10000000000) != 0)
  {
    v4[120] = self->_year;
    *((_QWORD *)v4 + 62) |= 0x10000000000uLL;
    v6 = self->_has;
  }
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    v4[63] = self->_contentRatingLevel;
    *((_QWORD *)v4 + 62) |= 0x8000000uLL;
  }
  if (self->_comment)
  {
    objc_msgSend(v18, "setComment:");
    v4 = v18;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    v4[70] = self->_fileKind;
    *((_QWORD *)v4 + 62) |= 0x20000000uLL;
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x100) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v7 & 0x10000000) == 0)
        goto LABEL_32;
      goto LABEL_127;
    }
  }
  else if ((*(_WORD *)&v7 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  *((_QWORD *)v4 + 9) = self->_familyAccountId;
  *((_QWORD *)v4 + 62) |= 0x100uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_128;
  }
LABEL_127:
  v4[66] = self->_drmVersionsCode;
  *((_QWORD *)v4 + 62) |= 0x10000000uLL;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_129;
  }
LABEL_128:
  *((_QWORD *)v4 + 7) = self->_drmPlatformIdCode;
  *((_QWORD *)v4 + 62) |= 0x40uLL;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_129:
  *((_QWORD *)v4 + 5) = self->_drmKey1IdCode;
  *((_QWORD *)v4 + 62) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_35:
    *((_QWORD *)v4 + 6) = self->_drmKey2IdCode;
    *((_QWORD *)v4 + 62) |= 0x20uLL;
  }
LABEL_36:
  if (self->_chapterMetadataUrl)
  {
    objc_msgSend(v18, "setChapterMetadataUrl:");
    v4 = v18;
  }
  if (self->_storeAssetFlavor)
  {
    objc_msgSend(v18, "setStoreAssetFlavor:");
    v4 = v18;
  }
  if (self->_extrasUrl)
  {
    objc_msgSend(v18, "setExtrasUrl:");
    v4 = v18;
  }
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) != 0)
  {
    *((_QWORD *)v4 + 15) = self->_purchaseDateTime;
    *((_QWORD *)v4 + 62) |= 0x4000uLL;
    v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
    {
LABEL_44:
      if ((*(_QWORD *)&v8 & 0x100000000) == 0)
        goto LABEL_45;
      goto LABEL_133;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  v4[56] = self->_cloudStatus;
  *((_QWORD *)v4 + 62) |= 0x2000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000) == 0)
  {
LABEL_45:
    if ((*(_QWORD *)&v8 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_134;
  }
LABEL_133:
  v4[86] = self->_playCount;
  *((_QWORD *)v4 + 62) |= 0x100000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_135;
  }
LABEL_134:
  v4[87] = self->_playCountDelta;
  *((_QWORD *)v4 + 62) |= 0x200000000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
      goto LABEL_48;
    goto LABEL_136;
  }
LABEL_135:
  *((_QWORD *)v4 + 11) = self->_lastPlayedDateTime;
  *((_QWORD *)v4 + 62) |= 0x400uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
      goto LABEL_49;
    goto LABEL_137;
  }
LABEL_136:
  v4[104] = self->_skipCount;
  *((_QWORD *)v4 + 62) |= 0x2000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_50;
    goto LABEL_138;
  }
LABEL_137:
  v4[105] = self->_skipCountDelta;
  *((_QWORD *)v4 + 62) |= 0x4000000000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&v8 & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_139;
  }
LABEL_138:
  *((_QWORD *)v4 + 12) = self->_lastSkippedDateTime;
  *((_QWORD *)v4 + 62) |= 0x800uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_52;
    goto LABEL_140;
  }
LABEL_139:
  *((_BYTE *)v4 + 494) = self->_rememberBookmark;
  *((_QWORD *)v4 + 62) |= 0x8000000000000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
      goto LABEL_53;
    goto LABEL_141;
  }
LABEL_140:
  *((_QWORD *)v4 + 3) = self->_bookmarkTimeMilliseconds;
  *((_QWORD *)v4 + 62) |= 4uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_142;
  }
LABEL_141:
  *((_BYTE *)v4 + 488) = self->_hidden;
  *((_QWORD *)v4 + 62) |= 0x200000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v8 & 0x100000000000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_142:
  *((_QWORD *)v4 + 21) = self->_storePlaylistId;
  *((_QWORD *)v4 + 62) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000000) != 0)
  {
LABEL_55:
    *((_BYTE *)v4 + 487) = self->_hasLocalAsset;
    *((_QWORD *)v4 + 62) |= 0x100000000000uLL;
  }
LABEL_56:
  if (self->_grouping)
  {
    objc_msgSend(v18, "setGrouping:");
    v4 = v18;
  }
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000000) != 0)
  {
    v4[78] = self->_likedState;
    *((_QWORD *)v4 + 62) |= 0x40000000uLL;
    v9 = self->_has;
    if ((*(_QWORD *)&v9 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((*(_QWORD *)&v9 & 0x2000000000000) == 0)
        goto LABEL_61;
      goto LABEL_146;
    }
  }
  else if ((*(_QWORD *)&v9 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  *((_BYTE *)v4 + 493) = self->_needsReporting;
  *((_QWORD *)v4 + 62) |= 0x4000000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((*(_QWORD *)&v9 & 0x800000000000) == 0)
      goto LABEL_62;
    goto LABEL_147;
  }
LABEL_146:
  *((_BYTE *)v4 + 492) = self->_likedStateChanged;
  *((_QWORD *)v4 + 62) |= 0x2000000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
      goto LABEL_63;
    goto LABEL_148;
  }
LABEL_147:
  *((_BYTE *)v4 + 490) = self->_isInUsersLibrary;
  *((_QWORD *)v4 + 62) |= 0x800000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
      goto LABEL_64;
    goto LABEL_149;
  }
LABEL_148:
  *((_BYTE *)v4 + 484) = self->_cloudAssetAvailable;
  *((_QWORD *)v4 + 62) |= 0x20000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v9 & 0x10000000000000) == 0)
      goto LABEL_65;
    goto LABEL_150;
  }
LABEL_149:
  v4[112] = self->_storeProtectionType;
  *((_QWORD *)v4 + 62) |= 0x8000000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_151;
  }
LABEL_150:
  *((_BYTE *)v4 + 495) = self->_userDisabled;
  *((_QWORD *)v4 + 62) |= 0x10000000000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(_QWORD *)&v9 & 0x400000000) == 0)
      goto LABEL_67;
    goto LABEL_152;
  }
LABEL_151:
  v4[55] = self->_cloudPlaybackEndpointType;
  *((_QWORD *)v4 + 62) |= 0x1000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_68;
    goto LABEL_153;
  }
LABEL_152:
  v4[88] = self->_playbackEndpointType;
  *((_QWORD *)v4 + 62) |= 0x400000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_68:
    if ((*(_QWORD *)&v9 & 0x400000000000) == 0)
      goto LABEL_69;
    goto LABEL_154;
  }
LABEL_153:
  v4[54] = self->_cloudMatchedStatus;
  *((_QWORD *)v4 + 62) |= 0x800000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((*(_QWORD *)&v9 & 0x1000000000) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_154:
  *((_BYTE *)v4 + 489) = self->_inUsersCloudLibrary;
  *((_QWORD *)v4 + 62) |= 0x400000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
  {
LABEL_70:
    v4[100] = self->_secondaryArtworkSourceType;
    *((_QWORD *)v4 + 62) |= 0x1000000000uLL;
  }
LABEL_71:
  if (self->_secondaryArtworkId)
  {
    objc_msgSend(v18, "setSecondaryArtworkId:");
    v4 = v18;
  }
  if ((*((_BYTE *)&self->_has + 5) & 8) != 0)
  {
    *((_BYTE *)v4 + 486) = self->_hasChapterData;
    *((_QWORD *)v4 + 62) |= 0x80000000000uLL;
  }
  if (self->_flattenedChapterData)
  {
    objc_msgSend(v18, "setFlattenedChapterData:");
    v4 = v18;
  }
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x1000000000000) != 0)
  {
    *((_BYTE *)v4 + 491) = self->_isPreorder;
    *((_QWORD *)v4 + 62) |= 0x1000000000000uLL;
    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    *((_QWORD *)v4 + 13) = self->_likedStateChangedDate;
    *((_QWORD *)v4 + 62) |= 0x1000uLL;
  }
  if (-[MIPMediaItem libraryIdentifiersCount](self, "libraryIdentifiersCount"))
  {
    objc_msgSend(v18, "clearLibraryIdentifiers");
    v11 = -[MIPMediaItem libraryIdentifiersCount](self, "libraryIdentifiersCount");
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        -[MIPMediaItem libraryIdentifiersAtIndex:](self, "libraryIdentifiersAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addLibraryIdentifiers:", v14);

      }
    }
  }
  v15 = self->_has;
  v16 = v18;
  if ((*(_DWORD *)&v15 & 0x80000) != 0)
  {
    *((_QWORD *)v18 + 20) = self->_storeId;
    *((_QWORD *)v18 + 62) |= 0x80000uLL;
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x200000) == 0)
    {
LABEL_87:
      if ((*(_BYTE *)&v15 & 1) == 0)
        goto LABEL_88;
      goto LABEL_158;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    goto LABEL_87;
  }
  *((_QWORD *)v18 + 22) = self->_storefrontId;
  *((_QWORD *)v18 + 62) |= 0x200000uLL;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 1) == 0)
  {
LABEL_88:
    if ((*(_WORD *)&v15 & 0x8000) == 0)
      goto LABEL_89;
    goto LABEL_159;
  }
LABEL_158:
  *((_QWORD *)v18 + 1) = self->_accountId;
  *((_QWORD *)v18 + 62) |= 1uLL;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x8000) == 0)
  {
LABEL_89:
    if ((*(_QWORD *)&v15 & 0x800000000) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_159:
  *((_QWORD *)v18 + 16) = self->_purchaseHistoryId;
  *((_QWORD *)v18 + 62) |= 0x8000uLL;
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
  {
LABEL_90:
    v18[94] = self->_purchaseHistoryToken;
    *((_QWORD *)v18 + 62) |= 0x800000000uLL;
  }
LABEL_91:
  if (self->_purchaseHistoryRedownloadParams)
  {
    objc_msgSend(v18, "setPurchaseHistoryRedownloadParams:");
    v16 = v18;
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    v16[19] = self->_sagaId;
    v16[62] |= 0x40000uLL;
  }
  if (self->_sagaRedownloadParams)
  {
    objc_msgSend(v18, "setSagaRedownloadParams:");
    v16 = v18;
  }
  if (self->_storeXID)
  {
    objc_msgSend(v18, "setStoreXID:");
    v16 = v18;
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    v16[23] = self->_subscriptionStoreItemId;
    v16[62] |= 0x400000uLL;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v18, "setCloudUniversalLibraryId:");
    v16 = v18;
  }
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    v16[18] = self->_reportingStoreItemId;
    v16[62] |= 0x20000uLL;
    v17 = self->_has;
  }
  if ((*(_BYTE *)&v17 & 2) != 0)
  {
    v16[2] = self->_assetStoreItemId;
    v16[62] |= 2uLL;
  }
  if (self->_song)
  {
    objc_msgSend(v18, "setSong:");
    v16 = v18;
  }
  if (self->_movie)
  {
    objc_msgSend(v18, "setMovie:");
    v16 = v18;
  }
  if (self->_tvShow)
  {
    objc_msgSend(v18, "setTvShow:");
    v16 = v18;
  }
  if (self->_podcast)
  {
    objc_msgSend(v18, "setPodcast:");
    v16 = v18;
  }
  if (self->_audiobook)
  {
    objc_msgSend(v18, "setAudiobook:");
    v16 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  $20C9AD10F7A062A4D81634BCAF627925 has;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  $20C9AD10F7A062A4D81634BCAF627925 v20;
  uint64_t v21;
  void *v22;
  $20C9AD10F7A062A4D81634BCAF627925 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  $20C9AD10F7A062A4D81634BCAF627925 v30;
  uint64_t v31;
  void *v32;
  $20C9AD10F7A062A4D81634BCAF627925 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  $20C9AD10F7A062A4D81634BCAF627925 v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  $20C9AD10F7A062A4D81634BCAF627925 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  $20C9AD10F7A062A4D81634BCAF627925 v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_mediaType;
    *(_QWORD *)(v5 + 496) |= 0x80000000uLL;
  }
  v7 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 464);
  *(_QWORD *)(v6 + 464) = v7;

  v9 = -[NSString copyWithZone:](self->_sortTitle, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 432);
  *(_QWORD *)(v6 + 432) = v9;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(_QWORD *)(v6 + 136) = self->_releaseDateTime;
    *(_QWORD *)(v6 + 496) |= 0x10000uLL;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_6;
      goto LABEL_79;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 32) = self->_creationDateTime;
  *(_QWORD *)(v6 + 496) |= 8uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_80;
  }
LABEL_79:
  *(_QWORD *)(v6 + 112) = self->_modificationDateTime;
  *(_QWORD *)(v6 + 496) |= 0x2000uLL;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_81;
  }
LABEL_80:
  *(_QWORD *)(v6 + 80) = self->_fileSize;
  *(_QWORD *)(v6 + 496) |= 0x200uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_9;
    goto LABEL_82;
  }
LABEL_81:
  *(_QWORD *)(v6 + 64) = self->_duration;
  *(_QWORD *)(v6 + 496) |= 0x80uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&has & 0x40000000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_82:
  *(_DWORD *)(v6 + 248) = self->_contentRating;
  *(_QWORD *)(v6 + 496) |= 0x4000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_10:
    *(_BYTE *)(v6 + 485) = self->_explicitContent;
    *(_QWORD *)(v6 + 496) |= 0x40000000000uLL;
  }
LABEL_11:
  v12 = -[NSString copyWithZone:](self->_shortDescription, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v12;

  v14 = -[NSString copyWithZone:](self->_longDescription, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v14;

  v16 = -[NSString copyWithZone:](self->_copyright, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v16;

  v18 = -[NSString copyWithZone:](self->_artworkId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v18;

  v20 = self->_has;
  if ((*(_QWORD *)&v20 & 0x10000000000) != 0)
  {
    *(_DWORD *)(v6 + 480) = self->_year;
    *(_QWORD *)(v6 + 496) |= 0x10000000000uLL;
    v20 = self->_has;
  }
  if ((*(_DWORD *)&v20 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 252) = self->_contentRatingLevel;
    *(_QWORD *)(v6 + 496) |= 0x8000000uLL;
  }
  v21 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v21;

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x20000000) != 0)
  {
    *(_DWORD *)(v6 + 280) = self->_fileKind;
    *(_QWORD *)(v6 + 496) |= 0x20000000uLL;
    v23 = self->_has;
    if ((*(_WORD *)&v23 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v23 & 0x10000000) == 0)
        goto LABEL_18;
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&v23 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  *(_QWORD *)(v6 + 72) = self->_familyAccountId;
  *(_QWORD *)(v6 + 496) |= 0x100uLL;
  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v23 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 264) = self->_drmVersionsCode;
  *(_QWORD *)(v6 + 496) |= 0x10000000uLL;
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 0x40) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v23 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_88;
  }
LABEL_87:
  *(_QWORD *)(v6 + 56) = self->_drmPlatformIdCode;
  *(_QWORD *)(v6 + 496) |= 0x40uLL;
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v23 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_88:
  *(_QWORD *)(v6 + 40) = self->_drmKey1IdCode;
  *(_QWORD *)(v6 + 496) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
  {
LABEL_21:
    *(_QWORD *)(v6 + 48) = self->_drmKey2IdCode;
    *(_QWORD *)(v6 + 496) |= 0x20uLL;
  }
LABEL_22:
  v24 = -[NSString copyWithZone:](self->_chapterMetadataUrl, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v24;

  v26 = -[NSString copyWithZone:](self->_storeAssetFlavor, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 440);
  *(_QWORD *)(v6 + 440) = v26;

  v28 = -[NSString copyWithZone:](self->_extrasUrl, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v28;

  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
    *(_QWORD *)(v6 + 120) = self->_purchaseDateTime;
    *(_QWORD *)(v6 + 496) |= 0x4000uLL;
    v30 = self->_has;
    if ((*(_DWORD *)&v30 & 0x2000000) == 0)
    {
LABEL_24:
      if ((*(_QWORD *)&v30 & 0x100000000) == 0)
        goto LABEL_25;
      goto LABEL_92;
    }
  }
  else if ((*(_DWORD *)&v30 & 0x2000000) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v6 + 224) = self->_cloudStatus;
  *(_QWORD *)(v6 + 496) |= 0x2000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x100000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&v30 & 0x200000000) == 0)
      goto LABEL_26;
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v6 + 344) = self->_playCount;
  *(_QWORD *)(v6 + 496) |= 0x100000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v30 & 0x400) == 0)
      goto LABEL_27;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 348) = self->_playCountDelta;
  *(_QWORD *)(v6 + 496) |= 0x200000000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x400) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&v30 & 0x2000000000) == 0)
      goto LABEL_28;
    goto LABEL_95;
  }
LABEL_94:
  *(_QWORD *)(v6 + 88) = self->_lastPlayedDateTime;
  *(_QWORD *)(v6 + 496) |= 0x400uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x2000000000) == 0)
  {
LABEL_28:
    if ((*(_QWORD *)&v30 & 0x4000000000) == 0)
      goto LABEL_29;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 416) = self->_skipCount;
  *(_QWORD *)(v6 + 496) |= 0x2000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v30 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 420) = self->_skipCountDelta;
  *(_QWORD *)(v6 + 496) |= 0x4000000000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x800) == 0)
  {
LABEL_30:
    if ((*(_QWORD *)&v30 & 0x8000000000000) == 0)
      goto LABEL_31;
    goto LABEL_98;
  }
LABEL_97:
  *(_QWORD *)(v6 + 96) = self->_lastSkippedDateTime;
  *(_QWORD *)(v6 + 496) |= 0x800uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((*(_BYTE *)&v30 & 4) == 0)
      goto LABEL_32;
    goto LABEL_99;
  }
LABEL_98:
  *(_BYTE *)(v6 + 494) = self->_rememberBookmark;
  *(_QWORD *)(v6 + 496) |= 0x8000000000000uLL;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 4) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v30 & 0x200000000000) == 0)
      goto LABEL_33;
    goto LABEL_100;
  }
LABEL_99:
  *(_QWORD *)(v6 + 24) = self->_bookmarkTimeMilliseconds;
  *(_QWORD *)(v6 + 496) |= 4uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x200000000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v30 & 0x100000) == 0)
      goto LABEL_34;
    goto LABEL_101;
  }
LABEL_100:
  *(_BYTE *)(v6 + 488) = self->_hidden;
  *(_QWORD *)(v6 + 496) |= 0x200000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v30 & 0x100000000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_101:
  *(_QWORD *)(v6 + 168) = self->_storePlaylistId;
  *(_QWORD *)(v6 + 496) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000000) != 0)
  {
LABEL_35:
    *(_BYTE *)(v6 + 487) = self->_hasLocalAsset;
    *(_QWORD *)(v6 + 496) |= 0x100000000000uLL;
  }
LABEL_36:
  v31 = -[NSString copyWithZone:](self->_grouping, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v31;

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000000) != 0)
  {
    *(_DWORD *)(v6 + 312) = self->_likedState;
    *(_QWORD *)(v6 + 496) |= 0x40000000uLL;
    v33 = self->_has;
    if ((*(_QWORD *)&v33 & 0x4000000000000) == 0)
    {
LABEL_38:
      if ((*(_QWORD *)&v33 & 0x2000000000000) == 0)
        goto LABEL_39;
      goto LABEL_105;
    }
  }
  else if ((*(_QWORD *)&v33 & 0x4000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(_BYTE *)(v6 + 493) = self->_needsReporting;
  *(_QWORD *)(v6 + 496) |= 0x4000000000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_QWORD *)&v33 & 0x800000000000) == 0)
      goto LABEL_40;
    goto LABEL_106;
  }
LABEL_105:
  *(_BYTE *)(v6 + 492) = self->_likedStateChanged;
  *(_QWORD *)(v6 + 496) |= 0x2000000000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x800000000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&v33 & 0x20000000000) == 0)
      goto LABEL_41;
    goto LABEL_107;
  }
LABEL_106:
  *(_BYTE *)(v6 + 490) = self->_isInUsersLibrary;
  *(_QWORD *)(v6 + 496) |= 0x800000000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x20000000000) == 0)
  {
LABEL_41:
    if ((*(_QWORD *)&v33 & 0x8000000000) == 0)
      goto LABEL_42;
    goto LABEL_108;
  }
LABEL_107:
  *(_BYTE *)(v6 + 484) = self->_cloudAssetAvailable;
  *(_QWORD *)(v6 + 496) |= 0x20000000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x8000000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v33 & 0x10000000000000) == 0)
      goto LABEL_43;
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v6 + 448) = self->_storeProtectionType;
  *(_QWORD *)(v6 + 496) |= 0x8000000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x10000000000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v33 & 0x1000000) == 0)
      goto LABEL_44;
    goto LABEL_110;
  }
LABEL_109:
  *(_BYTE *)(v6 + 495) = self->_userDisabled;
  *(_QWORD *)(v6 + 496) |= 0x10000000000000uLL;
  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x1000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&v33 & 0x400000000) == 0)
      goto LABEL_45;
    goto LABEL_111;
  }
LABEL_110:
  *(_DWORD *)(v6 + 220) = self->_cloudPlaybackEndpointType;
  *(_QWORD *)(v6 + 496) |= 0x1000000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x400000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v33 & 0x800000) == 0)
      goto LABEL_46;
    goto LABEL_112;
  }
LABEL_111:
  *(_DWORD *)(v6 + 352) = self->_playbackEndpointType;
  *(_QWORD *)(v6 + 496) |= 0x400000000uLL;
  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v33 & 0x400000000000) == 0)
      goto LABEL_47;
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(v6 + 216) = self->_cloudMatchedStatus;
  *(_QWORD *)(v6 + 496) |= 0x800000uLL;
  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x400000000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&v33 & 0x1000000000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_113:
  *(_BYTE *)(v6 + 489) = self->_inUsersCloudLibrary;
  *(_QWORD *)(v6 + 496) |= 0x400000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
  {
LABEL_48:
    *(_DWORD *)(v6 + 400) = self->_secondaryArtworkSourceType;
    *(_QWORD *)(v6 + 496) |= 0x1000000000uLL;
  }
LABEL_49:
  v34 = -[NSString copyWithZone:](self->_secondaryArtworkId, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v34;

  if ((*((_BYTE *)&self->_has + 5) & 8) != 0)
  {
    *(_BYTE *)(v6 + 486) = self->_hasChapterData;
    *(_QWORD *)(v6 + 496) |= 0x80000000000uLL;
  }
  v36 = -[NSData copyWithZone:](self->_flattenedChapterData, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v36;

  v38 = self->_has;
  if ((*(_QWORD *)&v38 & 0x1000000000000) != 0)
  {
    *(_BYTE *)(v6 + 491) = self->_isPreorder;
    *(_QWORD *)(v6 + 496) |= 0x1000000000000uLL;
    v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x1000) != 0)
  {
    *(_QWORD *)(v6 + 104) = self->_likedStateChangedDate;
    *(_QWORD *)(v6 + 496) |= 0x1000uLL;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v39 = self->_libraryIdentifiers;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v68;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v68 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v43), "copyWithZone:", a3, (_QWORD)v67);
        objc_msgSend((id)v6, "addLibraryIdentifiers:", v44);

        ++v43;
      }
      while (v41 != v43);
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v41);
  }

  v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x80000) != 0)
  {
    *(_QWORD *)(v6 + 160) = self->_storeId;
    *(_QWORD *)(v6 + 496) |= 0x80000uLL;
    v45 = self->_has;
    if ((*(_DWORD *)&v45 & 0x200000) == 0)
    {
LABEL_64:
      if ((*(_BYTE *)&v45 & 1) == 0)
        goto LABEL_65;
      goto LABEL_117;
    }
  }
  else if ((*(_DWORD *)&v45 & 0x200000) == 0)
  {
    goto LABEL_64;
  }
  *(_QWORD *)(v6 + 176) = self->_storefrontId;
  *(_QWORD *)(v6 + 496) |= 0x200000uLL;
  v45 = self->_has;
  if ((*(_BYTE *)&v45 & 1) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&v45 & 0x8000) == 0)
      goto LABEL_66;
    goto LABEL_118;
  }
LABEL_117:
  *(_QWORD *)(v6 + 8) = self->_accountId;
  *(_QWORD *)(v6 + 496) |= 1uLL;
  v45 = self->_has;
  if ((*(_WORD *)&v45 & 0x8000) == 0)
  {
LABEL_66:
    if ((*(_QWORD *)&v45 & 0x800000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_118:
  *(_QWORD *)(v6 + 128) = self->_purchaseHistoryId;
  *(_QWORD *)(v6 + 496) |= 0x8000uLL;
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
  {
LABEL_67:
    *(_DWORD *)(v6 + 376) = self->_purchaseHistoryToken;
    *(_QWORD *)(v6 + 496) |= 0x800000000uLL;
  }
LABEL_68:
  v46 = -[NSString copyWithZone:](self->_purchaseHistoryRedownloadParams, "copyWithZone:", a3, (_QWORD)v67);
  v47 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v46;

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(_QWORD *)(v6 + 152) = self->_sagaId;
    *(_QWORD *)(v6 + 496) |= 0x40000uLL;
  }
  v48 = -[NSString copyWithZone:](self->_sagaRedownloadParams, "copyWithZone:", a3);
  v49 = *(void **)(v6 + 384);
  *(_QWORD *)(v6 + 384) = v48;

  v50 = -[NSString copyWithZone:](self->_storeXID, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 456);
  *(_QWORD *)(v6 + 456) = v50;

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *(_QWORD *)(v6 + 184) = self->_subscriptionStoreItemId;
    *(_QWORD *)(v6 + 496) |= 0x400000uLL;
  }
  v52 = -[NSString copyWithZone:](self->_cloudUniversalLibraryId, "copyWithZone:", a3);
  v53 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v52;

  v54 = self->_has;
  if ((*(_DWORD *)&v54 & 0x20000) != 0)
  {
    *(_QWORD *)(v6 + 144) = self->_reportingStoreItemId;
    *(_QWORD *)(v6 + 496) |= 0x20000uLL;
    v54 = self->_has;
  }
  if ((*(_BYTE *)&v54 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_assetStoreItemId;
    *(_QWORD *)(v6 + 496) |= 2uLL;
  }
  v55 = -[MIPSong copyWithZone:](self->_song, "copyWithZone:", a3);
  v56 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v55;

  v57 = -[MIPMovie copyWithZone:](self->_movie, "copyWithZone:", a3);
  v58 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = v57;

  v59 = -[MIPTVShow copyWithZone:](self->_tvShow, "copyWithZone:", a3);
  v60 = *(void **)(v6 + 472);
  *(_QWORD *)(v6 + 472) = v59;

  v61 = -[MIPPodcast copyWithZone:](self->_podcast, "copyWithZone:", a3);
  v62 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v61;

  v63 = -[MIPAudiobook copyWithZone:](self->_audiobook, "copyWithZone:", a3);
  v64 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v63;

  v65 = (id)v6;
  return v65;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *title;
  NSString *sortTitle;
  $20C9AD10F7A062A4D81634BCAF627925 has;
  uint64_t v9;
  NSString *shortDescription;
  NSString *longDescription;
  NSString *copyright;
  NSString *artworkId;
  $20C9AD10F7A062A4D81634BCAF627925 v14;
  uint64_t v15;
  NSString *comment;
  NSString *chapterMetadataUrl;
  NSString *storeAssetFlavor;
  NSString *extrasUrl;
  $20C9AD10F7A062A4D81634BCAF627925 v20;
  uint64_t v21;
  NSString *grouping;
  NSString *secondaryArtworkId;
  NSData *flattenedChapterData;
  NSMutableArray *libraryIdentifiers;
  NSString *purchaseHistoryRedownloadParams;
  NSString *sagaRedownloadParams;
  NSString *storeXID;
  $20C9AD10F7A062A4D81634BCAF627925 v29;
  uint64_t v30;
  NSString *cloudUniversalLibraryId;
  MIPSong *song;
  MIPMovie *movie;
  MIPTVShow *tvShow;
  MIPPodcast *podcast;
  MIPAudiobook *audiobook;
  char v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_356;
  v5 = *((_QWORD *)v4 + 62);
  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
  {
    if ((v5 & 0x80000000) == 0 || self->_mediaType != *((_DWORD *)v4 + 82))
      goto LABEL_356;
  }
  else if ((v5 & 0x80000000) != 0)
  {
    goto LABEL_356;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 58) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_356;
  sortTitle = self->_sortTitle;
  if ((unint64_t)sortTitle | *((_QWORD *)v4 + 54))
  {
    if (!-[NSString isEqual:](sortTitle, "isEqual:"))
      goto LABEL_356;
  }
  has = self->_has;
  v9 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_releaseDateTime != *((_QWORD *)v4 + 17))
      goto LABEL_356;
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_creationDateTime != *((_QWORD *)v4 + 4))
      goto LABEL_356;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_modificationDateTime != *((_QWORD *)v4 + 14))
      goto LABEL_356;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_fileSize != *((_QWORD *)v4 + 10))
      goto LABEL_356;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_duration != *((_QWORD *)v4 + 8))
      goto LABEL_356;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_contentRating != *((_DWORD *)v4 + 62))
      goto LABEL_356;
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v9 & 0x40000000000) == 0)
      goto LABEL_356;
    if (self->_explicitContent)
    {
      if (!*((_BYTE *)v4 + 485))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 485))
    {
      goto LABEL_356;
    }
  }
  else if ((v9 & 0x40000000000) != 0)
  {
    goto LABEL_356;
  }
  shortDescription = self->_shortDescription;
  if ((unint64_t)shortDescription | *((_QWORD *)v4 + 51)
    && !-[NSString isEqual:](shortDescription, "isEqual:"))
  {
    goto LABEL_356;
  }
  longDescription = self->_longDescription;
  if ((unint64_t)longDescription | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](longDescription, "isEqual:"))
      goto LABEL_356;
  }
  copyright = self->_copyright;
  if ((unint64_t)copyright | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](copyright, "isEqual:"))
      goto LABEL_356;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:"))
      goto LABEL_356;
  }
  v14 = self->_has;
  v15 = *((_QWORD *)v4 + 62);
  if ((*(_QWORD *)&v14 & 0x10000000000) != 0)
  {
    if ((v15 & 0x10000000000) == 0 || self->_year != *((_DWORD *)v4 + 120))
      goto LABEL_356;
  }
  else if ((v15 & 0x10000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0 || self->_contentRatingLevel != *((_DWORD *)v4 + 63))
      goto LABEL_356;
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_356;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](comment, "isEqual:"))
      goto LABEL_356;
    v14 = self->_has;
    v15 = *((_QWORD *)v4 + 62);
  }
  if ((*(_DWORD *)&v14 & 0x20000000) != 0)
  {
    if ((v15 & 0x20000000) == 0 || self->_fileKind != *((_DWORD *)v4 + 70))
      goto LABEL_356;
  }
  else if ((v15 & 0x20000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_familyAccountId != *((_QWORD *)v4 + 9))
      goto LABEL_356;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0 || self->_drmVersionsCode != *((_DWORD *)v4 + 66))
      goto LABEL_356;
  }
  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_drmPlatformIdCode != *((_QWORD *)v4 + 7))
      goto LABEL_356;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_drmKey1IdCode != *((_QWORD *)v4 + 5))
      goto LABEL_356;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_drmKey2IdCode != *((_QWORD *)v4 + 6))
      goto LABEL_356;
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_356;
  }
  chapterMetadataUrl = self->_chapterMetadataUrl;
  if ((unint64_t)chapterMetadataUrl | *((_QWORD *)v4 + 26)
    && !-[NSString isEqual:](chapterMetadataUrl, "isEqual:"))
  {
    goto LABEL_356;
  }
  storeAssetFlavor = self->_storeAssetFlavor;
  if ((unint64_t)storeAssetFlavor | *((_QWORD *)v4 + 55))
  {
    if (!-[NSString isEqual:](storeAssetFlavor, "isEqual:"))
      goto LABEL_356;
  }
  extrasUrl = self->_extrasUrl;
  if ((unint64_t)extrasUrl | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](extrasUrl, "isEqual:"))
      goto LABEL_356;
  }
  v20 = self->_has;
  v21 = *((_QWORD *)v4 + 62);
  if ((*(_WORD *)&v20 & 0x4000) != 0)
  {
    if ((v21 & 0x4000) == 0 || self->_purchaseDateTime != *((_QWORD *)v4 + 15))
      goto LABEL_356;
  }
  else if ((v21 & 0x4000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x2000000) != 0)
  {
    if ((v21 & 0x2000000) == 0 || self->_cloudStatus != *((_DWORD *)v4 + 56))
      goto LABEL_356;
  }
  else if ((v21 & 0x2000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x100000000) != 0)
  {
    if ((v21 & 0x100000000) == 0 || self->_playCount != *((_DWORD *)v4 + 86))
      goto LABEL_356;
  }
  else if ((v21 & 0x100000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x200000000) != 0)
  {
    if ((v21 & 0x200000000) == 0 || self->_playCountDelta != *((_DWORD *)v4 + 87))
      goto LABEL_356;
  }
  else if ((v21 & 0x200000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x400) != 0)
  {
    if ((v21 & 0x400) == 0 || self->_lastPlayedDateTime != *((_QWORD *)v4 + 11))
      goto LABEL_356;
  }
  else if ((v21 & 0x400) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x2000000000) != 0)
  {
    if ((v21 & 0x2000000000) == 0 || self->_skipCount != *((_DWORD *)v4 + 104))
      goto LABEL_356;
  }
  else if ((v21 & 0x2000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x4000000000) != 0)
  {
    if ((v21 & 0x4000000000) == 0 || self->_skipCountDelta != *((_DWORD *)v4 + 105))
      goto LABEL_356;
  }
  else if ((v21 & 0x4000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x800) != 0)
  {
    if ((v21 & 0x800) == 0 || self->_lastSkippedDateTime != *((_QWORD *)v4 + 12))
      goto LABEL_356;
  }
  else if ((v21 & 0x800) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x8000000000000) != 0)
  {
    if ((v21 & 0x8000000000000) == 0)
      goto LABEL_356;
    if (self->_rememberBookmark)
    {
      if (!*((_BYTE *)v4 + 494))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 494))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x8000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v20 & 4) != 0)
  {
    if ((v21 & 4) == 0 || self->_bookmarkTimeMilliseconds != *((_QWORD *)v4 + 3))
      goto LABEL_356;
  }
  else if ((v21 & 4) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x200000000000) != 0)
  {
    if ((v21 & 0x200000000000) == 0)
      goto LABEL_356;
    if (self->_hidden)
    {
      if (!*((_BYTE *)v4 + 488))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 488))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x200000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x100000) != 0)
  {
    if ((v21 & 0x100000) == 0 || self->_storePlaylistId != *((_QWORD *)v4 + 21))
      goto LABEL_356;
  }
  else if ((v21 & 0x100000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x100000000000) != 0)
  {
    if ((v21 & 0x100000000000) == 0)
      goto LABEL_356;
    if (self->_hasLocalAsset)
    {
      if (!*((_BYTE *)v4 + 487))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 487))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x100000000000) != 0)
  {
    goto LABEL_356;
  }
  grouping = self->_grouping;
  if ((unint64_t)grouping | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](grouping, "isEqual:"))
      goto LABEL_356;
    v20 = self->_has;
    v21 = *((_QWORD *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x40000000) != 0)
  {
    if ((v21 & 0x40000000) == 0 || self->_likedState != *((_DWORD *)v4 + 78))
      goto LABEL_356;
  }
  else if ((v21 & 0x40000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x4000000000000) != 0)
  {
    if ((v21 & 0x4000000000000) == 0)
      goto LABEL_356;
    if (self->_needsReporting)
    {
      if (!*((_BYTE *)v4 + 493))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 493))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x4000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x2000000000000) != 0)
  {
    if ((v21 & 0x2000000000000) == 0)
      goto LABEL_356;
    if (self->_likedStateChanged)
    {
      if (!*((_BYTE *)v4 + 492))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 492))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x2000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x800000000000) != 0)
  {
    if ((v21 & 0x800000000000) == 0)
      goto LABEL_356;
    if (self->_isInUsersLibrary)
    {
      if (!*((_BYTE *)v4 + 490))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 490))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x800000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x20000000000) != 0)
  {
    if ((v21 & 0x20000000000) == 0)
      goto LABEL_356;
    if (self->_cloudAssetAvailable)
    {
      if (!*((_BYTE *)v4 + 484))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 484))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x20000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0 || self->_storeProtectionType != *((_DWORD *)v4 + 112))
      goto LABEL_356;
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x10000000000000) != 0)
  {
    if ((v21 & 0x10000000000000) == 0)
      goto LABEL_356;
    if (self->_userDisabled)
    {
      if (!*((_BYTE *)v4 + 495))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 495))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x10000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x1000000) != 0)
  {
    if ((v21 & 0x1000000) == 0 || self->_cloudPlaybackEndpointType != *((_DWORD *)v4 + 55))
      goto LABEL_356;
  }
  else if ((v21 & 0x1000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x400000000) != 0)
  {
    if ((v21 & 0x400000000) == 0 || self->_playbackEndpointType != *((_DWORD *)v4 + 88))
      goto LABEL_356;
  }
  else if ((v21 & 0x400000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x800000) != 0)
  {
    if ((v21 & 0x800000) == 0 || self->_cloudMatchedStatus != *((_DWORD *)v4 + 54))
      goto LABEL_356;
  }
  else if ((v21 & 0x800000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x400000000000) != 0)
  {
    if ((v21 & 0x400000000000) == 0)
      goto LABEL_356;
    if (self->_inUsersCloudLibrary)
    {
      if (!*((_BYTE *)v4 + 489))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 489))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x400000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x1000000000) != 0)
  {
    if ((v21 & 0x1000000000) == 0 || self->_secondaryArtworkSourceType != *((_DWORD *)v4 + 100))
      goto LABEL_356;
  }
  else if ((v21 & 0x1000000000) != 0)
  {
    goto LABEL_356;
  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if ((unint64_t)secondaryArtworkId | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](secondaryArtworkId, "isEqual:"))
      goto LABEL_356;
    v20 = self->_has;
    v21 = *((_QWORD *)v4 + 62);
  }
  if ((*(_QWORD *)&v20 & 0x80000000000) != 0)
  {
    if ((v21 & 0x80000000000) == 0)
      goto LABEL_356;
    if (self->_hasChapterData)
    {
      if (!*((_BYTE *)v4 + 486))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 486))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x80000000000) != 0)
  {
    goto LABEL_356;
  }
  flattenedChapterData = self->_flattenedChapterData;
  if ((unint64_t)flattenedChapterData | *((_QWORD *)v4 + 36))
  {
    if (!-[NSData isEqual:](flattenedChapterData, "isEqual:"))
      goto LABEL_356;
    v20 = self->_has;
    v21 = *((_QWORD *)v4 + 62);
  }
  if ((*(_QWORD *)&v20 & 0x1000000000000) != 0)
  {
    if ((v21 & 0x1000000000000) == 0)
      goto LABEL_356;
    if (self->_isPreorder)
    {
      if (!*((_BYTE *)v4 + 491))
        goto LABEL_356;
    }
    else if (*((_BYTE *)v4 + 491))
    {
      goto LABEL_356;
    }
  }
  else if ((v21 & 0x1000000000000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x1000) != 0)
  {
    if ((v21 & 0x1000) == 0 || self->_likedStateChangedDate != *((_QWORD *)v4 + 13))
      goto LABEL_356;
  }
  else if ((v21 & 0x1000) != 0)
  {
    goto LABEL_356;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((_QWORD *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:"))
      goto LABEL_356;
    v20 = self->_has;
    v21 = *((_QWORD *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    if ((v21 & 0x80000) == 0 || self->_storeId != *((_QWORD *)v4 + 20))
      goto LABEL_356;
  }
  else if ((v21 & 0x80000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_DWORD *)&v20 & 0x200000) != 0)
  {
    if ((v21 & 0x200000) == 0 || self->_storefrontId != *((_QWORD *)v4 + 22))
      goto LABEL_356;
  }
  else if ((v21 & 0x200000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v20 & 1) != 0)
  {
    if ((v21 & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_356;
  }
  else if ((v21 & 1) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_WORD *)&v20 & 0x8000) != 0)
  {
    if ((v21 & 0x8000) == 0 || self->_purchaseHistoryId != *((_QWORD *)v4 + 16))
      goto LABEL_356;
  }
  else if ((v21 & 0x8000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_QWORD *)&v20 & 0x800000000) != 0)
  {
    if ((v21 & 0x800000000) == 0 || self->_purchaseHistoryToken != *((_DWORD *)v4 + 94))
      goto LABEL_356;
  }
  else if ((v21 & 0x800000000) != 0)
  {
    goto LABEL_356;
  }
  purchaseHistoryRedownloadParams = self->_purchaseHistoryRedownloadParams;
  if ((unint64_t)purchaseHistoryRedownloadParams | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](purchaseHistoryRedownloadParams, "isEqual:"))
      goto LABEL_356;
    v20 = self->_has;
    v21 = *((_QWORD *)v4 + 62);
  }
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    if ((v21 & 0x40000) == 0 || self->_sagaId != *((_QWORD *)v4 + 19))
      goto LABEL_356;
  }
  else if ((v21 & 0x40000) != 0)
  {
    goto LABEL_356;
  }
  sagaRedownloadParams = self->_sagaRedownloadParams;
  if ((unint64_t)sagaRedownloadParams | *((_QWORD *)v4 + 48)
    && !-[NSString isEqual:](sagaRedownloadParams, "isEqual:"))
  {
    goto LABEL_356;
  }
  storeXID = self->_storeXID;
  if ((unint64_t)storeXID | *((_QWORD *)v4 + 57))
  {
    if (!-[NSString isEqual:](storeXID, "isEqual:"))
      goto LABEL_356;
  }
  v29 = self->_has;
  v30 = *((_QWORD *)v4 + 62);
  if ((*(_DWORD *)&v29 & 0x400000) != 0)
  {
    if ((v30 & 0x400000) == 0 || self->_subscriptionStoreItemId != *((_QWORD *)v4 + 23))
      goto LABEL_356;
  }
  else if ((v30 & 0x400000) != 0)
  {
    goto LABEL_356;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
      goto LABEL_356;
    v29 = self->_has;
    v30 = *((_QWORD *)v4 + 62);
  }
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0 || self->_reportingStoreItemId != *((_QWORD *)v4 + 18))
      goto LABEL_356;
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_356;
  }
  if ((*(_BYTE *)&v29 & 2) == 0)
  {
    if ((v30 & 2) == 0)
      goto LABEL_346;
LABEL_356:
    v37 = 0;
    goto LABEL_357;
  }
  if ((v30 & 2) == 0 || self->_assetStoreItemId != *((_QWORD *)v4 + 2))
    goto LABEL_356;
LABEL_346:
  song = self->_song;
  if ((unint64_t)song | *((_QWORD *)v4 + 53) && !-[MIPSong isEqual:](song, "isEqual:"))
    goto LABEL_356;
  movie = self->_movie;
  if ((unint64_t)movie | *((_QWORD *)v4 + 42))
  {
    if (!-[MIPMovie isEqual:](movie, "isEqual:"))
      goto LABEL_356;
  }
  tvShow = self->_tvShow;
  if ((unint64_t)tvShow | *((_QWORD *)v4 + 59))
  {
    if (!-[MIPTVShow isEqual:](tvShow, "isEqual:"))
      goto LABEL_356;
  }
  podcast = self->_podcast;
  if ((unint64_t)podcast | *((_QWORD *)v4 + 45))
  {
    if (!-[MIPPodcast isEqual:](podcast, "isEqual:"))
      goto LABEL_356;
  }
  audiobook = self->_audiobook;
  if ((unint64_t)audiobook | *((_QWORD *)v4 + 25))
    v37 = -[MIPAudiobook isEqual:](audiobook, "isEqual:");
  else
    v37 = 1;
LABEL_357:

  return v37;
}

- (unint64_t)hash
{
  $20C9AD10F7A062A4D81634BCAF627925 has;
  $20C9AD10F7A062A4D81634BCAF627925 v4;
  $20C9AD10F7A062A4D81634BCAF627925 v5;
  $20C9AD10F7A062A4D81634BCAF627925 v6;
  $20C9AD10F7A062A4D81634BCAF627925 v7;
  $20C9AD10F7A062A4D81634BCAF627925 v8;
  $20C9AD10F7A062A4D81634BCAF627925 v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  $20C9AD10F7A062A4D81634BCAF627925 v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
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
  NSUInteger v49;
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
  NSUInteger v63;
  NSUInteger v64;
  NSUInteger v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSUInteger v72;
  uint64_t v73;
  uint64_t v74;
  NSUInteger v75;
  NSUInteger v76;
  NSUInteger v77;
  NSUInteger v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  NSUInteger v87;
  uint64_t v88;

  if ((*((_BYTE *)&self->_has + 3) & 0x80) != 0)
    v88 = 2654435761 * self->_mediaType;
  else
    v88 = 0;
  v87 = -[NSString hash](self->_title, "hash");
  v86 = -[NSString hash](self->_sortTitle, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v85 = 2654435761 * self->_releaseDateTime;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_6:
      v84 = 2654435761 * self->_creationDateTime;
      if ((*(_WORD *)&has & 0x2000) != 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else
  {
    v85 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
  }
  v84 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_7:
    v83 = 2654435761 * self->_modificationDateTime;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  v83 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    v82 = 2654435761 * self->_fileSize;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v82 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_9:
    v81 = 2654435761 * self->_duration;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_10;
LABEL_17:
    v80 = 0;
    if ((*(_QWORD *)&has & 0x40000000000) != 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_16:
  v81 = 0;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
    goto LABEL_17;
LABEL_10:
  v80 = 2654435761 * self->_contentRating;
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
LABEL_11:
    v79 = 2654435761 * self->_explicitContent;
    goto LABEL_19;
  }
LABEL_18:
  v79 = 0;
LABEL_19:
  v78 = -[NSString hash](self->_shortDescription, "hash");
  v77 = -[NSString hash](self->_longDescription, "hash");
  v76 = -[NSString hash](self->_copyright, "hash");
  v75 = -[NSString hash](self->_artworkId, "hash");
  v4 = self->_has;
  if ((*(_QWORD *)&v4 & 0x10000000000) != 0)
  {
    v74 = 2654435761 * self->_year;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0)
      goto LABEL_21;
  }
  else
  {
    v74 = 0;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0)
    {
LABEL_21:
      v73 = 2654435761 * self->_contentRatingLevel;
      goto LABEL_24;
    }
  }
  v73 = 0;
LABEL_24:
  v72 = -[NSString hash](self->_comment, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) != 0)
  {
    v71 = 2654435761 * self->_fileKind;
    if ((*(_WORD *)&v5 & 0x100) != 0)
    {
LABEL_26:
      v70 = 2654435761 * self->_familyAccountId;
      if ((*(_DWORD *)&v5 & 0x10000000) != 0)
        goto LABEL_27;
      goto LABEL_33;
    }
  }
  else
  {
    v71 = 0;
    if ((*(_WORD *)&v5 & 0x100) != 0)
      goto LABEL_26;
  }
  v70 = 0;
  if ((*(_DWORD *)&v5 & 0x10000000) != 0)
  {
LABEL_27:
    v69 = 2654435761 * self->_drmVersionsCode;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
      goto LABEL_28;
    goto LABEL_34;
  }
LABEL_33:
  v69 = 0;
  if ((*(_BYTE *)&v5 & 0x40) != 0)
  {
LABEL_28:
    v68 = 2654435761 * self->_drmPlatformIdCode;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_29;
LABEL_35:
    v67 = 0;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_30;
    goto LABEL_36;
  }
LABEL_34:
  v68 = 0;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
    goto LABEL_35;
LABEL_29:
  v67 = 2654435761 * self->_drmKey1IdCode;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
LABEL_30:
    v66 = 2654435761 * self->_drmKey2IdCode;
    goto LABEL_37;
  }
LABEL_36:
  v66 = 0;
LABEL_37:
  v65 = -[NSString hash](self->_chapterMetadataUrl, "hash");
  v64 = -[NSString hash](self->_storeAssetFlavor, "hash");
  v63 = -[NSString hash](self->_extrasUrl, "hash");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    v62 = 2654435761 * self->_purchaseDateTime;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0)
    {
LABEL_39:
      v61 = 2654435761 * self->_cloudStatus;
      if ((*(_QWORD *)&v6 & 0x100000000) != 0)
        goto LABEL_40;
      goto LABEL_53;
    }
  }
  else
  {
    v62 = 0;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0)
      goto LABEL_39;
  }
  v61 = 0;
  if ((*(_QWORD *)&v6 & 0x100000000) != 0)
  {
LABEL_40:
    v60 = 2654435761 * self->_playCount;
    if ((*(_QWORD *)&v6 & 0x200000000) != 0)
      goto LABEL_41;
    goto LABEL_54;
  }
LABEL_53:
  v60 = 0;
  if ((*(_QWORD *)&v6 & 0x200000000) != 0)
  {
LABEL_41:
    v59 = 2654435761 * self->_playCountDelta;
    if ((*(_WORD *)&v6 & 0x400) != 0)
      goto LABEL_42;
    goto LABEL_55;
  }
LABEL_54:
  v59 = 0;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
LABEL_42:
    v58 = 2654435761 * self->_lastPlayedDateTime;
    if ((*(_QWORD *)&v6 & 0x2000000000) != 0)
      goto LABEL_43;
    goto LABEL_56;
  }
LABEL_55:
  v58 = 0;
  if ((*(_QWORD *)&v6 & 0x2000000000) != 0)
  {
LABEL_43:
    v57 = 2654435761 * self->_skipCount;
    if ((*(_QWORD *)&v6 & 0x4000000000) != 0)
      goto LABEL_44;
    goto LABEL_57;
  }
LABEL_56:
  v57 = 0;
  if ((*(_QWORD *)&v6 & 0x4000000000) != 0)
  {
LABEL_44:
    v56 = 2654435761 * self->_skipCountDelta;
    if ((*(_WORD *)&v6 & 0x800) != 0)
      goto LABEL_45;
    goto LABEL_58;
  }
LABEL_57:
  v56 = 0;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_45:
    v55 = 2654435761 * self->_lastSkippedDateTime;
    if ((*(_QWORD *)&v6 & 0x8000000000000) != 0)
      goto LABEL_46;
    goto LABEL_59;
  }
LABEL_58:
  v55 = 0;
  if ((*(_QWORD *)&v6 & 0x8000000000000) != 0)
  {
LABEL_46:
    v54 = 2654435761 * self->_rememberBookmark;
    if ((*(_BYTE *)&v6 & 4) != 0)
      goto LABEL_47;
    goto LABEL_60;
  }
LABEL_59:
  v54 = 0;
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
LABEL_47:
    v53 = 2654435761 * self->_bookmarkTimeMilliseconds;
    if ((*(_QWORD *)&v6 & 0x200000000000) != 0)
      goto LABEL_48;
    goto LABEL_61;
  }
LABEL_60:
  v53 = 0;
  if ((*(_QWORD *)&v6 & 0x200000000000) != 0)
  {
LABEL_48:
    v52 = 2654435761 * self->_hidden;
    if ((*(_DWORD *)&v6 & 0x100000) != 0)
      goto LABEL_49;
LABEL_62:
    v51 = 0;
    if ((*(_QWORD *)&v6 & 0x100000000000) != 0)
      goto LABEL_50;
    goto LABEL_63;
  }
LABEL_61:
  v52 = 0;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
    goto LABEL_62;
LABEL_49:
  v51 = 2654435761 * self->_storePlaylistId;
  if ((*(_QWORD *)&v6 & 0x100000000000) != 0)
  {
LABEL_50:
    v50 = 2654435761 * self->_hasLocalAsset;
    goto LABEL_64;
  }
LABEL_63:
  v50 = 0;
LABEL_64:
  v49 = -[NSString hash](self->_grouping, "hash");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    v48 = 2654435761 * self->_likedState;
    if ((*(_QWORD *)&v7 & 0x4000000000000) != 0)
    {
LABEL_66:
      v47 = 2654435761 * self->_needsReporting;
      if ((*(_QWORD *)&v7 & 0x2000000000000) != 0)
        goto LABEL_67;
      goto LABEL_79;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_QWORD *)&v7 & 0x4000000000000) != 0)
      goto LABEL_66;
  }
  v47 = 0;
  if ((*(_QWORD *)&v7 & 0x2000000000000) != 0)
  {
LABEL_67:
    v46 = 2654435761 * self->_likedStateChanged;
    if ((*(_QWORD *)&v7 & 0x800000000000) != 0)
      goto LABEL_68;
    goto LABEL_80;
  }
LABEL_79:
  v46 = 0;
  if ((*(_QWORD *)&v7 & 0x800000000000) != 0)
  {
LABEL_68:
    v45 = 2654435761 * self->_isInUsersLibrary;
    if ((*(_QWORD *)&v7 & 0x20000000000) != 0)
      goto LABEL_69;
    goto LABEL_81;
  }
LABEL_80:
  v45 = 0;
  if ((*(_QWORD *)&v7 & 0x20000000000) != 0)
  {
LABEL_69:
    v44 = 2654435761 * self->_cloudAssetAvailable;
    if ((*(_QWORD *)&v7 & 0x8000000000) != 0)
      goto LABEL_70;
    goto LABEL_82;
  }
LABEL_81:
  v44 = 0;
  if ((*(_QWORD *)&v7 & 0x8000000000) != 0)
  {
LABEL_70:
    v43 = 2654435761 * self->_storeProtectionType;
    if ((*(_QWORD *)&v7 & 0x10000000000000) != 0)
      goto LABEL_71;
    goto LABEL_83;
  }
LABEL_82:
  v43 = 0;
  if ((*(_QWORD *)&v7 & 0x10000000000000) != 0)
  {
LABEL_71:
    v42 = 2654435761 * self->_userDisabled;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
      goto LABEL_72;
    goto LABEL_84;
  }
LABEL_83:
  v42 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
  {
LABEL_72:
    v41 = 2654435761 * self->_cloudPlaybackEndpointType;
    if ((*(_QWORD *)&v7 & 0x400000000) != 0)
      goto LABEL_73;
    goto LABEL_85;
  }
LABEL_84:
  v41 = 0;
  if ((*(_QWORD *)&v7 & 0x400000000) != 0)
  {
LABEL_73:
    v40 = 2654435761 * self->_playbackEndpointType;
    if ((*(_DWORD *)&v7 & 0x800000) != 0)
      goto LABEL_74;
    goto LABEL_86;
  }
LABEL_85:
  v40 = 0;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
LABEL_74:
    v39 = 2654435761 * self->_cloudMatchedStatus;
    if ((*(_QWORD *)&v7 & 0x400000000000) != 0)
      goto LABEL_75;
LABEL_87:
    v38 = 0;
    if ((*(_QWORD *)&v7 & 0x1000000000) != 0)
      goto LABEL_76;
    goto LABEL_88;
  }
LABEL_86:
  v39 = 0;
  if ((*(_QWORD *)&v7 & 0x400000000000) == 0)
    goto LABEL_87;
LABEL_75:
  v38 = 2654435761 * self->_inUsersCloudLibrary;
  if ((*(_QWORD *)&v7 & 0x1000000000) != 0)
  {
LABEL_76:
    v37 = 2654435761 * self->_secondaryArtworkSourceType;
    goto LABEL_89;
  }
LABEL_88:
  v37 = 0;
LABEL_89:
  v36 = -[NSString hash](self->_secondaryArtworkId, "hash");
  if ((*((_BYTE *)&self->_has + 5) & 8) != 0)
    v35 = 2654435761 * self->_hasChapterData;
  else
    v35 = 0;
  v34 = -[NSData hash](self->_flattenedChapterData, "hash");
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x1000000000000) != 0)
  {
    v33 = 2654435761 * self->_isPreorder;
    if ((*(_WORD *)&v8 & 0x1000) != 0)
      goto LABEL_94;
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&v8 & 0x1000) != 0)
    {
LABEL_94:
      v32 = 2654435761 * self->_likedStateChangedDate;
      goto LABEL_97;
    }
  }
  v32 = 0;
LABEL_97:
  v31 = -[NSMutableArray hash](self->_libraryIdentifiers, "hash");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    v30 = 2654435761 * self->_storeId;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
    {
LABEL_99:
      v29 = 2654435761 * self->_storefrontId;
      if ((*(_BYTE *)&v9 & 1) != 0)
        goto LABEL_100;
      goto LABEL_105;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
      goto LABEL_99;
  }
  v29 = 0;
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
LABEL_100:
    v27 = 2654435761 * self->_accountId;
    if ((*(_WORD *)&v9 & 0x8000) != 0)
      goto LABEL_101;
LABEL_106:
    v10 = 0;
    if ((*(_QWORD *)&v9 & 0x800000000) != 0)
      goto LABEL_102;
    goto LABEL_107;
  }
LABEL_105:
  v27 = 0;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
    goto LABEL_106;
LABEL_101:
  v10 = 2654435761 * self->_purchaseHistoryId;
  if ((*(_QWORD *)&v9 & 0x800000000) != 0)
  {
LABEL_102:
    v11 = 2654435761 * self->_purchaseHistoryToken;
    goto LABEL_108;
  }
LABEL_107:
  v11 = 0;
LABEL_108:
  v12 = -[NSString hash](self->_purchaseHistoryRedownloadParams, "hash", v27);
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v13 = 2654435761 * self->_sagaId;
  else
    v13 = 0;
  v14 = -[NSString hash](self->_sagaRedownloadParams, "hash");
  v15 = -[NSString hash](self->_storeXID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    v16 = 2654435761 * self->_subscriptionStoreItemId;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_cloudUniversalLibraryId, "hash");
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    v19 = 2654435761 * self->_reportingStoreItemId;
    if ((*(_BYTE *)&v18 & 2) != 0)
      goto LABEL_116;
LABEL_118:
    v20 = 0;
    goto LABEL_119;
  }
  v19 = 0;
  if ((*(_BYTE *)&v18 & 2) == 0)
    goto LABEL_118;
LABEL_116:
  v20 = 2654435761 * self->_assetStoreItemId;
LABEL_119:
  v21 = v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20;
  v22 = -[MIPSong hash](self->_song, "hash");
  v23 = v22 ^ -[MIPMovie hash](self->_movie, "hash");
  v24 = v23 ^ -[MIPTVShow hash](self->_tvShow, "hash");
  v25 = v24 ^ -[MIPPodcast hash](self->_podcast, "hash");
  return v21 ^ v25 ^ -[MIPAudiobook hash](self->_audiobook, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  MIPSong *song;
  uint64_t v20;
  MIPMovie *movie;
  uint64_t v22;
  MIPTVShow *tvShow;
  uint64_t v24;
  MIPPodcast *podcast;
  uint64_t v26;
  MIPAudiobook *audiobook;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 499) & 0x80) != 0)
  {
    self->_mediaType = v4[82];
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
  if (*((_QWORD *)v4 + 58))
    -[MIPMediaItem setTitle:](self, "setTitle:");
  if (*((_QWORD *)v5 + 54))
    -[MIPMediaItem setSortTitle:](self, "setSortTitle:");
  v6 = *((_QWORD *)v5 + 62);
  if ((v6 & 0x10000) != 0)
  {
    self->_releaseDateTime = *((_QWORD *)v5 + 17);
    *(_QWORD *)&self->_has |= 0x10000uLL;
    v6 = *((_QWORD *)v5 + 62);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_115;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_creationDateTime = *((_QWORD *)v5 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = *((_QWORD *)v5 + 62);
  if ((v6 & 0x2000) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_116;
  }
LABEL_115:
  self->_modificationDateTime = *((_QWORD *)v5 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v6 = *((_QWORD *)v5 + 62);
  if ((v6 & 0x200) == 0)
  {
LABEL_11:
    if ((v6 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_117;
  }
LABEL_116:
  self->_fileSize = *((_QWORD *)v5 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v6 = *((_QWORD *)v5 + 62);
  if ((v6 & 0x80) == 0)
  {
LABEL_12:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_13;
    goto LABEL_118;
  }
LABEL_117:
  self->_duration = *((_QWORD *)v5 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v6 = *((_QWORD *)v5 + 62);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_13:
    if ((v6 & 0x40000000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_118:
  self->_contentRating = *((_DWORD *)v5 + 62);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  if ((*((_QWORD *)v5 + 62) & 0x40000000000) != 0)
  {
LABEL_14:
    self->_explicitContent = *((_BYTE *)v5 + 485);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
  }
LABEL_15:
  if (*((_QWORD *)v5 + 51))
    -[MIPMediaItem setShortDescription:](self, "setShortDescription:");
  if (*((_QWORD *)v5 + 40))
    -[MIPMediaItem setLongDescription:](self, "setLongDescription:");
  if (*((_QWORD *)v5 + 32))
    -[MIPMediaItem setCopyright:](self, "setCopyright:");
  if (*((_QWORD *)v5 + 24))
    -[MIPMediaItem setArtworkId:](self, "setArtworkId:");
  v7 = *((_QWORD *)v5 + 62);
  if ((v7 & 0x10000000000) != 0)
  {
    self->_year = *((_DWORD *)v5 + 120);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
    v7 = *((_QWORD *)v5 + 62);
  }
  if ((v7 & 0x8000000) != 0)
  {
    self->_contentRatingLevel = *((_DWORD *)v5 + 63);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
  }
  if (*((_QWORD *)v5 + 30))
    -[MIPMediaItem setComment:](self, "setComment:");
  v8 = *((_QWORD *)v5 + 62);
  if ((v8 & 0x20000000) != 0)
  {
    self->_fileKind = *((_DWORD *)v5 + 70);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v8 = *((_QWORD *)v5 + 62);
    if ((v8 & 0x100) == 0)
    {
LABEL_31:
      if ((v8 & 0x10000000) == 0)
        goto LABEL_32;
      goto LABEL_122;
    }
  }
  else if ((v8 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  self->_familyAccountId = *((_QWORD *)v5 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v8 = *((_QWORD *)v5 + 62);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_123;
  }
LABEL_122:
  self->_drmVersionsCode = *((_DWORD *)v5 + 66);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v8 = *((_QWORD *)v5 + 62);
  if ((v8 & 0x40) == 0)
  {
LABEL_33:
    if ((v8 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_124;
  }
LABEL_123:
  self->_drmPlatformIdCode = *((_QWORD *)v5 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v8 = *((_QWORD *)v5 + 62);
  if ((v8 & 0x10) == 0)
  {
LABEL_34:
    if ((v8 & 0x20) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_124:
  self->_drmKey1IdCode = *((_QWORD *)v5 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  if ((*((_QWORD *)v5 + 62) & 0x20) != 0)
  {
LABEL_35:
    self->_drmKey2IdCode = *((_QWORD *)v5 + 6);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }
LABEL_36:
  if (*((_QWORD *)v5 + 26))
    -[MIPMediaItem setChapterMetadataUrl:](self, "setChapterMetadataUrl:");
  if (*((_QWORD *)v5 + 55))
    -[MIPMediaItem setStoreAssetFlavor:](self, "setStoreAssetFlavor:");
  if (*((_QWORD *)v5 + 34))
    -[MIPMediaItem setExtrasUrl:](self, "setExtrasUrl:");
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x4000) != 0)
  {
    self->_purchaseDateTime = *((_QWORD *)v5 + 15);
    *(_QWORD *)&self->_has |= 0x4000uLL;
    v9 = *((_QWORD *)v5 + 62);
    if ((v9 & 0x2000000) == 0)
    {
LABEL_44:
      if ((v9 & 0x100000000) == 0)
        goto LABEL_45;
      goto LABEL_128;
    }
  }
  else if ((v9 & 0x2000000) == 0)
  {
    goto LABEL_44;
  }
  self->_cloudStatus = *((_DWORD *)v5 + 56);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_45:
    if ((v9 & 0x200000000) == 0)
      goto LABEL_46;
    goto LABEL_129;
  }
LABEL_128:
  self->_playCount = *((_DWORD *)v5 + 86);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_46:
    if ((v9 & 0x400) == 0)
      goto LABEL_47;
    goto LABEL_130;
  }
LABEL_129:
  self->_playCountDelta = *((_DWORD *)v5 + 87);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x400) == 0)
  {
LABEL_47:
    if ((v9 & 0x2000000000) == 0)
      goto LABEL_48;
    goto LABEL_131;
  }
LABEL_130:
  self->_lastPlayedDateTime = *((_QWORD *)v5 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x2000000000) == 0)
  {
LABEL_48:
    if ((v9 & 0x4000000000) == 0)
      goto LABEL_49;
    goto LABEL_132;
  }
LABEL_131:
  self->_skipCount = *((_DWORD *)v5 + 104);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_49:
    if ((v9 & 0x800) == 0)
      goto LABEL_50;
    goto LABEL_133;
  }
LABEL_132:
  self->_skipCountDelta = *((_DWORD *)v5 + 105);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x800) == 0)
  {
LABEL_50:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_51;
    goto LABEL_134;
  }
LABEL_133:
  self->_lastSkippedDateTime = *((_QWORD *)v5 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v9 & 4) == 0)
      goto LABEL_52;
    goto LABEL_135;
  }
LABEL_134:
  self->_rememberBookmark = *((_BYTE *)v5 + 494);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 4) == 0)
  {
LABEL_52:
    if ((v9 & 0x200000000000) == 0)
      goto LABEL_53;
    goto LABEL_136;
  }
LABEL_135:
  self->_bookmarkTimeMilliseconds = *((_QWORD *)v5 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_53:
    if ((v9 & 0x100000) == 0)
      goto LABEL_54;
    goto LABEL_137;
  }
LABEL_136:
  self->_hidden = *((_BYTE *)v5 + 488);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v9 = *((_QWORD *)v5 + 62);
  if ((v9 & 0x100000) == 0)
  {
LABEL_54:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_137:
  self->_storePlaylistId = *((_QWORD *)v5 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  if ((*((_QWORD *)v5 + 62) & 0x100000000000) != 0)
  {
LABEL_55:
    self->_hasLocalAsset = *((_BYTE *)v5 + 487);
    *(_QWORD *)&self->_has |= 0x100000000000uLL;
  }
LABEL_56:
  if (*((_QWORD *)v5 + 37))
    -[MIPMediaItem setGrouping:](self, "setGrouping:");
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x40000000) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 78);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v10 = *((_QWORD *)v5 + 62);
    if ((v10 & 0x4000000000000) == 0)
    {
LABEL_60:
      if ((v10 & 0x2000000000000) == 0)
        goto LABEL_61;
      goto LABEL_141;
    }
  }
  else if ((v10 & 0x4000000000000) == 0)
  {
    goto LABEL_60;
  }
  self->_needsReporting = *((_BYTE *)v5 + 493);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x800000000000) == 0)
      goto LABEL_62;
    goto LABEL_142;
  }
LABEL_141:
  self->_likedStateChanged = *((_BYTE *)v5 + 492);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x800000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x20000000000) == 0)
      goto LABEL_63;
    goto LABEL_143;
  }
LABEL_142:
  self->_isInUsersLibrary = *((_BYTE *)v5 + 490);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x20000000000) == 0)
  {
LABEL_63:
    if ((v10 & 0x8000000000) == 0)
      goto LABEL_64;
    goto LABEL_144;
  }
LABEL_143:
  self->_cloudAssetAvailable = *((_BYTE *)v5 + 484);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((v10 & 0x10000000000000) == 0)
      goto LABEL_65;
    goto LABEL_145;
  }
LABEL_144:
  self->_storeProtectionType = *((_DWORD *)v5 + 112);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x10000000000000) == 0)
  {
LABEL_65:
    if ((v10 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_146;
  }
LABEL_145:
  self->_userDisabled = *((_BYTE *)v5 + 495);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v10 & 0x400000000) == 0)
      goto LABEL_67;
    goto LABEL_147;
  }
LABEL_146:
  self->_cloudPlaybackEndpointType = *((_DWORD *)v5 + 55);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x400000000) == 0)
  {
LABEL_67:
    if ((v10 & 0x800000) == 0)
      goto LABEL_68;
    goto LABEL_148;
  }
LABEL_147:
  self->_playbackEndpointType = *((_DWORD *)v5 + 88);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x800000) == 0)
  {
LABEL_68:
    if ((v10 & 0x400000000000) == 0)
      goto LABEL_69;
    goto LABEL_149;
  }
LABEL_148:
  self->_cloudMatchedStatus = *((_DWORD *)v5 + 54);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v10 = *((_QWORD *)v5 + 62);
  if ((v10 & 0x400000000000) == 0)
  {
LABEL_69:
    if ((v10 & 0x1000000000) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_149:
  self->_inUsersCloudLibrary = *((_BYTE *)v5 + 489);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  if ((*((_QWORD *)v5 + 62) & 0x1000000000) != 0)
  {
LABEL_70:
    self->_secondaryArtworkSourceType = *((_DWORD *)v5 + 100);
    *(_QWORD *)&self->_has |= 0x1000000000uLL;
  }
LABEL_71:
  if (*((_QWORD *)v5 + 49))
    -[MIPMediaItem setSecondaryArtworkId:](self, "setSecondaryArtworkId:");
  if ((*((_BYTE *)v5 + 501) & 8) != 0)
  {
    self->_hasChapterData = *((_BYTE *)v5 + 486);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
  }
  if (*((_QWORD *)v5 + 36))
    -[MIPMediaItem setFlattenedChapterData:](self, "setFlattenedChapterData:");
  v11 = *((_QWORD *)v5 + 62);
  if ((v11 & 0x1000000000000) != 0)
  {
    self->_isPreorder = *((_BYTE *)v5 + 491);
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
    v11 = *((_QWORD *)v5 + 62);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_likedStateChangedDate = *((_QWORD *)v5 + 13);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = *((id *)v5 + 38);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        -[MIPMediaItem addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (_QWORD)v29);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  v17 = *((_QWORD *)v5 + 62);
  if ((v17 & 0x80000) != 0)
  {
    self->_storeId = *((_QWORD *)v5 + 20);
    *(_QWORD *)&self->_has |= 0x80000uLL;
    v17 = *((_QWORD *)v5 + 62);
    if ((v17 & 0x200000) == 0)
    {
LABEL_90:
      if ((v17 & 1) == 0)
        goto LABEL_91;
      goto LABEL_153;
    }
  }
  else if ((v17 & 0x200000) == 0)
  {
    goto LABEL_90;
  }
  self->_storefrontId = *((_QWORD *)v5 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v17 = *((_QWORD *)v5 + 62);
  if ((v17 & 1) == 0)
  {
LABEL_91:
    if ((v17 & 0x8000) == 0)
      goto LABEL_92;
    goto LABEL_154;
  }
LABEL_153:
  self->_accountId = *((_QWORD *)v5 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v17 = *((_QWORD *)v5 + 62);
  if ((v17 & 0x8000) == 0)
  {
LABEL_92:
    if ((v17 & 0x800000000) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_154:
  self->_purchaseHistoryId = *((_QWORD *)v5 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  if ((*((_QWORD *)v5 + 62) & 0x800000000) != 0)
  {
LABEL_93:
    self->_purchaseHistoryToken = *((_DWORD *)v5 + 94);
    *(_QWORD *)&self->_has |= 0x800000000uLL;
  }
LABEL_94:
  if (*((_QWORD *)v5 + 46))
    -[MIPMediaItem setPurchaseHistoryRedownloadParams:](self, "setPurchaseHistoryRedownloadParams:");
  if ((*((_BYTE *)v5 + 498) & 4) != 0)
  {
    self->_sagaId = *((_QWORD *)v5 + 19);
    *(_QWORD *)&self->_has |= 0x40000uLL;
  }
  if (*((_QWORD *)v5 + 48))
    -[MIPMediaItem setSagaRedownloadParams:](self, "setSagaRedownloadParams:");
  if (*((_QWORD *)v5 + 57))
    -[MIPMediaItem setStoreXID:](self, "setStoreXID:");
  if ((*((_BYTE *)v5 + 498) & 0x40) != 0)
  {
    self->_subscriptionStoreItemId = *((_QWORD *)v5 + 23);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
  if (*((_QWORD *)v5 + 29))
    -[MIPMediaItem setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  v18 = *((_QWORD *)v5 + 62);
  if ((v18 & 0x20000) != 0)
  {
    self->_reportingStoreItemId = *((_QWORD *)v5 + 18);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v18 = *((_QWORD *)v5 + 62);
  }
  if ((v18 & 2) != 0)
  {
    self->_assetStoreItemId = *((_QWORD *)v5 + 2);
    *(_QWORD *)&self->_has |= 2uLL;
  }
  song = self->_song;
  v20 = *((_QWORD *)v5 + 53);
  if (song)
  {
    if (v20)
      -[MIPSong mergeFrom:](song, "mergeFrom:");
  }
  else if (v20)
  {
    -[MIPMediaItem setSong:](self, "setSong:");
  }
  movie = self->_movie;
  v22 = *((_QWORD *)v5 + 42);
  if (movie)
  {
    if (v22)
      -[MIPMovie mergeFrom:](movie, "mergeFrom:");
  }
  else if (v22)
  {
    -[MIPMediaItem setMovie:](self, "setMovie:");
  }
  tvShow = self->_tvShow;
  v24 = *((_QWORD *)v5 + 59);
  if (tvShow)
  {
    if (v24)
      -[MIPTVShow mergeFrom:](tvShow, "mergeFrom:");
  }
  else if (v24)
  {
    -[MIPMediaItem setTvShow:](self, "setTvShow:");
  }
  podcast = self->_podcast;
  v26 = *((_QWORD *)v5 + 45);
  if (podcast)
  {
    if (v26)
      -[MIPPodcast mergeFrom:](podcast, "mergeFrom:");
  }
  else if (v26)
  {
    -[MIPMediaItem setPodcast:](self, "setPodcast:");
  }
  audiobook = self->_audiobook;
  v28 = *((_QWORD *)v5 + 25);
  if (audiobook)
  {
    if (v28)
      -[MIPAudiobook mergeFrom:](audiobook, "mergeFrom:");
  }
  else if (v28)
  {
    -[MIPMediaItem setAudiobook:](self, "setAudiobook:");
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)sortTitle
{
  return self->_sortTitle;
}

- (void)setSortTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sortTitle, a3);
}

- (int64_t)releaseDateTime
{
  return self->_releaseDateTime;
}

- (int64_t)creationDateTime
{
  return self->_creationDateTime;
}

- (int64_t)modificationDateTime
{
  return self->_modificationDateTime;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int)contentRating
{
  return self->_contentRating;
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)setShortDescription:(id)a3
{
  objc_storeStrong((id *)&self->_shortDescription, a3);
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
  objc_storeStrong((id *)&self->_longDescription, a3);
}

- (NSString)copyright
{
  return self->_copyright;
}

- (void)setCopyright:(id)a3
{
  objc_storeStrong((id *)&self->_copyright, a3);
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setArtworkId:(id)a3
{
  objc_storeStrong((id *)&self->_artworkId, a3);
}

- (int)year
{
  return self->_year;
}

- (int)contentRatingLevel
{
  return self->_contentRatingLevel;
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->_comment, a3);
}

- (int)fileKind
{
  return self->_fileKind;
}

- (int64_t)familyAccountId
{
  return self->_familyAccountId;
}

- (int)drmVersionsCode
{
  return self->_drmVersionsCode;
}

- (int64_t)drmPlatformIdCode
{
  return self->_drmPlatformIdCode;
}

- (int64_t)drmKey1IdCode
{
  return self->_drmKey1IdCode;
}

- (int64_t)drmKey2IdCode
{
  return self->_drmKey2IdCode;
}

- (NSString)chapterMetadataUrl
{
  return self->_chapterMetadataUrl;
}

- (void)setChapterMetadataUrl:(id)a3
{
  objc_storeStrong((id *)&self->_chapterMetadataUrl, a3);
}

- (NSString)storeAssetFlavor
{
  return self->_storeAssetFlavor;
}

- (void)setStoreAssetFlavor:(id)a3
{
  objc_storeStrong((id *)&self->_storeAssetFlavor, a3);
}

- (NSString)extrasUrl
{
  return self->_extrasUrl;
}

- (void)setExtrasUrl:(id)a3
{
  objc_storeStrong((id *)&self->_extrasUrl, a3);
}

- (int64_t)purchaseDateTime
{
  return self->_purchaseDateTime;
}

- (int)cloudStatus
{
  return self->_cloudStatus;
}

- (int)playCount
{
  return self->_playCount;
}

- (int)playCountDelta
{
  return self->_playCountDelta;
}

- (int64_t)lastPlayedDateTime
{
  return self->_lastPlayedDateTime;
}

- (int)skipCount
{
  return self->_skipCount;
}

- (int)skipCountDelta
{
  return self->_skipCountDelta;
}

- (int64_t)lastSkippedDateTime
{
  return self->_lastSkippedDateTime;
}

- (BOOL)rememberBookmark
{
  return self->_rememberBookmark;
}

- (int64_t)bookmarkTimeMilliseconds
{
  return self->_bookmarkTimeMilliseconds;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (int64_t)storePlaylistId
{
  return self->_storePlaylistId;
}

- (BOOL)hasLocalAsset
{
  return self->_hasLocalAsset;
}

- (NSString)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
  objc_storeStrong((id *)&self->_grouping, a3);
}

- (int)likedState
{
  return self->_likedState;
}

- (BOOL)needsReporting
{
  return self->_needsReporting;
}

- (BOOL)likedStateChanged
{
  return self->_likedStateChanged;
}

- (BOOL)isInUsersLibrary
{
  return self->_isInUsersLibrary;
}

- (BOOL)cloudAssetAvailable
{
  return self->_cloudAssetAvailable;
}

- (int)storeProtectionType
{
  return self->_storeProtectionType;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (int)cloudPlaybackEndpointType
{
  return self->_cloudPlaybackEndpointType;
}

- (int)playbackEndpointType
{
  return self->_playbackEndpointType;
}

- (int)cloudMatchedStatus
{
  return self->_cloudMatchedStatus;
}

- (BOOL)inUsersCloudLibrary
{
  return self->_inUsersCloudLibrary;
}

- (int)secondaryArtworkSourceType
{
  return self->_secondaryArtworkSourceType;
}

- (NSString)secondaryArtworkId
{
  return self->_secondaryArtworkId;
}

- (void)setSecondaryArtworkId:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryArtworkId, a3);
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (NSData)flattenedChapterData
{
  return self->_flattenedChapterData;
}

- (void)setFlattenedChapterData:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedChapterData, a3);
}

- (BOOL)isPreorder
{
  return self->_isPreorder;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setLibraryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_libraryIdentifiers, a3);
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (int64_t)storefrontId
{
  return self->_storefrontId;
}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)purchaseHistoryId
{
  return self->_purchaseHistoryId;
}

- (int)purchaseHistoryToken
{
  return self->_purchaseHistoryToken;
}

- (NSString)purchaseHistoryRedownloadParams
{
  return self->_purchaseHistoryRedownloadParams;
}

- (void)setPurchaseHistoryRedownloadParams:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseHistoryRedownloadParams, a3);
}

- (int64_t)sagaId
{
  return self->_sagaId;
}

- (NSString)sagaRedownloadParams
{
  return self->_sagaRedownloadParams;
}

- (void)setSagaRedownloadParams:(id)a3
{
  objc_storeStrong((id *)&self->_sagaRedownloadParams, a3);
}

- (NSString)storeXID
{
  return self->_storeXID;
}

- (void)setStoreXID:(id)a3
{
  objc_storeStrong((id *)&self->_storeXID, a3);
}

- (int64_t)subscriptionStoreItemId
{
  return self->_subscriptionStoreItemId;
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, a3);
}

- (int64_t)reportingStoreItemId
{
  return self->_reportingStoreItemId;
}

- (int64_t)assetStoreItemId
{
  return self->_assetStoreItemId;
}

- (MIPSong)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
  objc_storeStrong((id *)&self->_song, a3);
}

- (MIPMovie)movie
{
  return self->_movie;
}

- (void)setMovie:(id)a3
{
  objc_storeStrong((id *)&self->_movie, a3);
}

- (MIPTVShow)tvShow
{
  return self->_tvShow;
}

- (void)setTvShow:(id)a3
{
  objc_storeStrong((id *)&self->_tvShow, a3);
}

- (MIPPodcast)podcast
{
  return self->_podcast;
}

- (void)setPodcast:(id)a3
{
  objc_storeStrong((id *)&self->_podcast, a3);
}

- (MIPAudiobook)audiobook
{
  return self->_audiobook;
}

- (void)setAudiobook:(id)a3
{
  objc_storeStrong((id *)&self->_audiobook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvShow, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeXID, 0);
  objc_storeStrong((id *)&self->_storeAssetFlavor, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_secondaryArtworkId, 0);
  objc_storeStrong((id *)&self->_sagaRedownloadParams, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryRedownloadParams, 0);
  objc_storeStrong((id *)&self->_podcast, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_flattenedChapterData, 0);
  objc_storeStrong((id *)&self->_extrasUrl, 0);
  objc_storeStrong((id *)&self->_copyright, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_chapterMetadataUrl, 0);
  objc_storeStrong((id *)&self->_audiobook, 0);
  objc_storeStrong((id *)&self->_artworkId, 0);
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
