@implementation MIPPlaylist

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setStoreId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasStoreId
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (int)type
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E5B628C0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Normal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Smart")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Genius")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Folder")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setHidden:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_hidden = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasHidden
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (BOOL)hasSmartPlaylistInfo
{
  return self->_smartPlaylistInfo != 0;
}

- (int)sortType
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_sortType;
  else
    return 0;
}

- (void)setSortType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_sortType = a3;
}

- (void)setHasSortType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSortType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)sortTypeAsString:(int)a3
{
  if (a3 < 0x4C)
    return off_1E5B628E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSortType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Name")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReleaseDate")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AddedDate")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayedDate")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SeriesName")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Physical")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shuffle")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TrackID")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaylistItemID")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BitRate")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Kind")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Date")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TrackNumber")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TotalSize")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TotalTime")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Year")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SampleRate")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Category")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Location")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StreamStatus")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Description")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Comment")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DateAdded")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EQPreset")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Composer")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NormVolume")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserPlayCount")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayDate")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscNumber")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TrackRating")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CompilationArtist")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CompilationGenre")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastArtist")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastAlbumArtistOrArtist")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastAlbum")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastGenre")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FastComposer")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Price")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Relevance")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PurchaseDate")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BeatsPerMinute")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Popularity")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Grouping")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SeasonNumber")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EpisodeID")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EpisodeSortID")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserSkipCount")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipDate")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumArtist")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumByArtistYear")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumByArtist")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumRating")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RentalExpirationDate")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ComposerAlbum")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CategoryAlbum")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GenreAlbum")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GenreName")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GeniusID")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PodcastCategory")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StorePersistentID")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Version")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UncompressedSize")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppKind")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserDisabled")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudDownload")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudMatchState")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudID")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudUserID")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudStatus")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudFlavorID")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudLibraryKind")) & 1) != 0)
  {
    v4 = 74;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Tags")))
  {
    v4 = 75;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setReversedSorting:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_reversedSorting = a3;
}

- (void)setHasReversedSorting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasReversedSorting
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasGeniusSeedTrackIdentifier
{
  return self->_geniusSeedTrackIdentifier != 0;
}

- (void)setDistinguishedKind:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_distinguishedKind = a3;
}

- (void)setHasDistinguishedKind:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDistinguishedKind
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasCloudGlobalId
{
  return self->_cloudGlobalId != 0;
}

- (void)setCloudIsSubscribed:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_cloudIsSubscribed = a3;
}

- (void)setHasCloudIsSubscribed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasCloudIsSubscribed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCloudIsCuratorPlaylist:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_cloudIsCuratorPlaylist = a3;
}

- (void)setHasCloudIsCuratorPlaylist:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasCloudIsCuratorPlaylist
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasExternalVendorIdentifier
{
  return self->_externalVendorIdentifier != 0;
}

- (BOOL)hasExternalVendorDisplayName
{
  return self->_externalVendorDisplayName != 0;
}

- (BOOL)hasExternalVendorTag
{
  return self->_externalVendorTag != 0;
}

- (void)setExternalVendorPlaylist:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_externalVendorPlaylist = a3;
}

- (void)setHasExternalVendorPlaylist:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasExternalVendorPlaylist
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
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
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCreationDateTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setModificationDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_modificationDateTime = a3;
}

- (void)setHasModificationDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasModificationDateTime
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setLastPlayedDateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_lastPlayedDateTime = a3;
}

- (void)setHasLastPlayedDateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasLastPlayedDateTime
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCloudIsSharingDisabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_cloudIsSharingDisabled = a3;
}

- (void)setHasCloudIsSharingDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasCloudIsSharingDisabled
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasCloudVersionHash
{
  return self->_cloudVersionHash != 0;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (void)setLikedState:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_likedState = a3;
}

- (void)setHasLikedState:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasLikedState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRemoteSourceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_remoteSourceType = a3;
}

- (void)setHasRemoteSourceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRemoteSourceType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setOwner:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_owner = a3;
}

- (void)setHasOwner:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOwner
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setEditable:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_editable = a3;
}

- (void)setHasEditable:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasEditable
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPlayCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_playCount = a3;
}

- (void)setHasPlayCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPlayCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setShared:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_shared = a3;
}

- (void)setHasShared:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasShared
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setVisible:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_visible = a3;
}

- (void)setHasVisible:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasVisible
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setAuthorStoreId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_authorStoreId = a3;
}

- (void)setHasAuthorStoreId:(BOOL)a3
{
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAuthorStoreId
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasAuthorDisplayName
{
  return self->_authorDisplayName != 0;
}

- (BOOL)hasAuthorStoreURL
{
  return self->_authorStoreURL != 0;
}

- (BOOL)hasAuthorHandle
{
  return self->_authorHandle != 0;
}

- (void)setMinRefreshInterval:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_minRefreshInterval = a3;
}

- (void)setHasMinRefreshInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasMinRefreshInterval
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCloudLastUpdateTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_cloudLastUpdateTime = a3;
}

- (void)setHasCloudLastUpdateTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasCloudLastUpdateTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSubscriberCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_subscriberCount = a3;
}

- (void)setHasSubscriberCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSubscriberCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSubscriberPlayCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_subscriberPlayCount = a3;
}

- (void)setHasSubscriberPlayCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSubscriberPlayCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSubscriberLikedCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_subscriberLikedCount = a3;
}

- (void)setHasSubscriberLikedCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSubscriberLikedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasSubscriberURL
{
  return self->_subscriberURL != 0;
}

- (BOOL)hasPlaylistDescription
{
  return self->_playlistDescription != 0;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (void)setSecondaryArtworkSourceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_secondaryArtworkSourceType = a3;
}

- (void)setHasSecondaryArtworkSourceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSecondaryArtworkSourceType
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasSecondaryArtworkId
{
  return self->_secondaryArtworkId != 0;
}

- (void)setPlaylistCategoryTypeMask:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_playlistCategoryTypeMask = a3;
}

- (void)setHasPlaylistCategoryTypeMask:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPlaylistCategoryTypeMask
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasPlaylistGroupingSortKey
{
  return self->_playlistGroupingSortKey != 0;
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_likedStateChangedDate = a3;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasLikedStateChangedDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTraits:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_traits = a3;
}

- (void)setHasTraits:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTraits
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasCoverArtworkRecipe
{
  return self->_coverArtworkRecipe != 0;
}

- (void)setIsCollaborative:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_isCollaborative = a3;
}

- (void)setHasIsCollaborative:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsCollaborative
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCollaborationMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_collaborationMode = a3;
}

- (void)setHasCollaborationMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCollaborationMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasCollaborationInvitationURL
{
  return self->_collaborationInvitationURL != 0;
}

- (void)setCollaborationInvitationURLExpirationDate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_collaborationInvitationURLExpirationDate = a3;
}

- (void)setHasCollaborationInvitationURLExpirationDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCollaborationInvitationURLExpirationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCollaborationJoinRequestPending:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_collaborationJoinRequestPending = a3;
}

- (void)setHasCollaborationJoinRequestPending:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasCollaborationJoinRequestPending
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCollaboratorStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_collaboratorStatus = a3;
}

- (void)setHasCollaboratorStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($043343F9A094FB3D6889D8E028CD7DF8)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCollaboratorStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearChildIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_childIdentifiers, "removeAllObjects");
}

- (void)addChildIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *childIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  childIdentifiers = self->_childIdentifiers;
  v8 = v4;
  if (!childIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_childIdentifiers;
    self->_childIdentifiers = v6;

    v4 = v8;
    childIdentifiers = self->_childIdentifiers;
  }
  -[NSMutableArray addObject:](childIdentifiers, "addObject:", v4);

}

- (unint64_t)childIdentifiersCount
{
  return -[NSMutableArray count](self->_childIdentifiers, "count");
}

- (id)childIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_childIdentifiers, "objectAtIndex:", a3);
}

- (void)clearItems
{
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
}

- (void)addItems:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  items = self->_items;
  v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_items;
    self->_items = v6;

    v4 = v8;
    items = self->_items;
  }
  -[NSMutableArray addObject:](items, "addObject:", v4);

}

- (unint64_t)itemsCount
{
  return -[NSMutableArray count](self->_items, "count");
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
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
  v8.super_class = (Class)MIPPlaylist;
  -[MIPPlaylist description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPPlaylist dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  void *v7;
  MIPSmartPlaylistInfo *smartPlaylistInfo;
  void *v9;
  $043343F9A094FB3D6889D8E028CD7DF8 v10;
  uint64_t sortType;
  __CFString *v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;
  void *v16;
  MIPMultiverseIdentifier *parentIdentifier;
  void *v18;
  MIPMultiverseIdentifier *geniusSeedTrackIdentifier;
  void *v20;
  void *v21;
  NSString *cloudGlobalId;
  $043343F9A094FB3D6889D8E028CD7DF8 v23;
  void *v24;
  void *v25;
  NSString *externalVendorIdentifier;
  NSString *externalVendorDisplayName;
  NSString *externalVendorTag;
  $043343F9A094FB3D6889D8E028CD7DF8 v29;
  void *v30;
  NSString *cloudVersionHash;
  NSString *artworkId;
  $043343F9A094FB3D6889D8E028CD7DF8 v33;
  void *v34;
  NSString *authorDisplayName;
  NSString *authorStoreURL;
  NSString *authorHandle;
  $043343F9A094FB3D6889D8E028CD7DF8 v38;
  void *v39;
  NSString *subscriberURL;
  NSString *playlistDescription;
  NSString *cloudUniversalLibraryId;
  void *v43;
  NSString *secondaryArtworkId;
  void *v45;
  NSString *playlistGroupingSortKey;
  $043343F9A094FB3D6889D8E028CD7DF8 v47;
  void *v48;
  void *v49;
  NSString *coverArtworkRecipe;
  $043343F9A094FB3D6889D8E028CD7DF8 v51;
  void *v52;
  void *v53;
  NSString *collaborationInvitationURL;
  $043343F9A094FB3D6889D8E028CD7DF8 v55;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  id v71;
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
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storeId);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("storeId"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  v14 = self->_type - 1;
  if (v14 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E5B628C0[v14];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("type"));

  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hidden"));

  }
LABEL_7:
  smartPlaylistInfo = self->_smartPlaylistInfo;
  if (smartPlaylistInfo)
  {
    -[MIPSmartPlaylistInfo dictionaryRepresentation](smartPlaylistInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("smartPlaylistInfo"));

  }
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    sortType = self->_sortType;
    if (sortType >= 0x4C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sortType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5B628E0[sortType];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("sortType"));

    v10 = self->_has;
  }
  if ((*(_QWORD *)&v10 & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reversedSorting);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("reversedSorting"));

  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier)
  {
    -[MIPMultiverseIdentifier dictionaryRepresentation](parentIdentifier, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("parentIdentifier"));

  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  if (geniusSeedTrackIdentifier)
  {
    -[MIPMultiverseIdentifier dictionaryRepresentation](geniusSeedTrackIdentifier, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("geniusSeedTrackIdentifier"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_distinguishedKind);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("distinguishedKind"));

  }
  cloudGlobalId = self->_cloudGlobalId;
  if (cloudGlobalId)
    objc_msgSend(v4, "setObject:forKey:", cloudGlobalId, CFSTR("cloudGlobalId"));
  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudIsSubscribed);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("cloudIsSubscribed"));

    v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudIsCuratorPlaylist);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("cloudIsCuratorPlaylist"));

  }
  externalVendorIdentifier = self->_externalVendorIdentifier;
  if (externalVendorIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalVendorIdentifier, CFSTR("externalVendorIdentifier"));
  externalVendorDisplayName = self->_externalVendorDisplayName;
  if (externalVendorDisplayName)
    objc_msgSend(v4, "setObject:forKey:", externalVendorDisplayName, CFSTR("externalVendorDisplayName"));
  externalVendorTag = self->_externalVendorTag;
  if (externalVendorTag)
    objc_msgSend(v4, "setObject:forKey:", externalVendorTag, CFSTR("externalVendorTag"));
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_externalVendorPlaylist);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("externalVendorPlaylist"));

    v29 = self->_has;
    if ((*(_BYTE *)&v29 & 8) == 0)
    {
LABEL_39:
      if ((*(_BYTE *)&v29 & 0x80) == 0)
        goto LABEL_40;
      goto LABEL_119;
    }
  }
  else if ((*(_BYTE *)&v29 & 8) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_creationDateTime);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("creationDateTime"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x80) == 0)
  {
LABEL_40:
    if ((*(_BYTE *)&v29 & 0x10) == 0)
      goto LABEL_41;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_modificationDateTime);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("modificationDateTime"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x10) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v29 & 0x1000000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_lastPlayedDateTime);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("lastPlayedDateTime"));

  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudIsSharingDisabled);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("cloudIsSharingDisabled"));

  }
LABEL_43:
  cloudVersionHash = self->_cloudVersionHash;
  if (cloudVersionHash)
    objc_msgSend(v4, "setObject:forKey:", cloudVersionHash, CFSTR("cloudVersionHash"));
  artworkId = self->_artworkId;
  if (artworkId)
    objc_msgSend(v4, "setObject:forKey:", artworkId, CFSTR("artworkId"));
  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_likedState);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("likedState"));

    v33 = self->_has;
    if ((*(_WORD *)&v33 & 0x8000) == 0)
    {
LABEL_49:
      if ((*(_DWORD *)&v33 & 0x80000000) == 0)
        goto LABEL_50;
      goto LABEL_124;
    }
  }
  else if ((*(_WORD *)&v33 & 0x8000) == 0)
  {
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_remoteSourceType);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("remoteSourceType"));

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v33 & 0x8000000) == 0)
      goto LABEL_51;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_owner);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("owner"));

  v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x8000000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v33 & 0x2000) == 0)
      goto LABEL_52;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_editable);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("editable"));

  v33 = self->_has;
  if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
LABEL_52:
    if ((*(_QWORD *)&v33 & 0x200000000) == 0)
      goto LABEL_53;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playCount);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("playCount"));

  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x200000000) == 0)
  {
LABEL_53:
    if ((*(_QWORD *)&v33 & 0x400000000) == 0)
      goto LABEL_54;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shared);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("shared"));

  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x400000000) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&v33 & 1) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_visible);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("visible"));

  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_authorStoreId);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("authorStoreId"));

  }
LABEL_56:
  authorDisplayName = self->_authorDisplayName;
  if (authorDisplayName)
    objc_msgSend(v4, "setObject:forKey:", authorDisplayName, CFSTR("authorDisplayName"));
  authorStoreURL = self->_authorStoreURL;
  if (authorStoreURL)
    objc_msgSend(v4, "setObject:forKey:", authorStoreURL, CFSTR("authorStoreURL"));
  authorHandle = self->_authorHandle;
  if (authorHandle)
    objc_msgSend(v4, "setObject:forKey:", authorHandle, CFSTR("authorHandle"));
  v38 = self->_has;
  if ((*(_BYTE *)&v38 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minRefreshInterval);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("minRefreshInterval"));

    v38 = self->_has;
    if ((*(_BYTE *)&v38 & 2) == 0)
    {
LABEL_64:
      if ((*(_DWORD *)&v38 & 0x40000) == 0)
        goto LABEL_65;
      goto LABEL_132;
    }
  }
  else if ((*(_BYTE *)&v38 & 2) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cloudLastUpdateTime);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("cloudLastUpdateTime"));

  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x40000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v38 & 0x100000) == 0)
      goto LABEL_66;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subscriberCount);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("subscriberCount"));

  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x100000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v38 & 0x80000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subscriberPlayCount);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("subscriberPlayCount"));

  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_67:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subscriberLikedCount);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("subscriberLikedCount"));

  }
LABEL_68:
  subscriberURL = self->_subscriberURL;
  if (subscriberURL)
    objc_msgSend(v4, "setObject:forKey:", subscriberURL, CFSTR("subscriberURL"));
  playlistDescription = self->_playlistDescription;
  if (playlistDescription)
    objc_msgSend(v4, "setObject:forKey:", playlistDescription, CFSTR("playlistDescription"));
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId)
    objc_msgSend(v4, "setObject:forKey:", cloudUniversalLibraryId, CFSTR("cloudUniversalLibraryId"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_secondaryArtworkSourceType);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("secondaryArtworkSourceType"));

  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if (secondaryArtworkId)
    objc_msgSend(v4, "setObject:forKey:", secondaryArtworkId, CFSTR("secondaryArtworkId"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_playlistCategoryTypeMask);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("playlistCategoryTypeMask"));

  }
  playlistGroupingSortKey = self->_playlistGroupingSortKey;
  if (playlistGroupingSortKey)
    objc_msgSend(v4, "setObject:forKey:", playlistGroupingSortKey, CFSTR("playlistGroupingSortKey"));
  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_likedStateChangedDate);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("likedStateChangedDate"));

    v47 = self->_has;
  }
  if ((*(_DWORD *)&v47 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_traits);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("traits"));

  }
  coverArtworkRecipe = self->_coverArtworkRecipe;
  if (coverArtworkRecipe)
    objc_msgSend(v4, "setObject:forKey:", coverArtworkRecipe, CFSTR("coverArtworkRecipe"));
  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCollaborative);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("isCollaborative"));

    v51 = self->_has;
  }
  if ((*(_WORD *)&v51 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_collaborationMode);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("collaborationMode"));

  }
  collaborationInvitationURL = self->_collaborationInvitationURL;
  if (collaborationInvitationURL)
    objc_msgSend(v4, "setObject:forKey:", collaborationInvitationURL, CFSTR("collaborationInvitationURL"));
  v55 = self->_has;
  if ((*(_BYTE *)&v55 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_collaborationInvitationURLExpirationDate);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("collaborationInvitationURLExpirationDate"));

    v55 = self->_has;
    if ((*(_DWORD *)&v55 & 0x4000000) == 0)
    {
LABEL_96:
      if ((*(_WORD *)&v55 & 0x400) == 0)
        goto LABEL_98;
      goto LABEL_97;
    }
  }
  else if ((*(_DWORD *)&v55 & 0x4000000) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_collaborationJoinRequestPending);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("collaborationJoinRequestPending"));

  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
LABEL_97:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_collaboratorStatus);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("collaboratorStatus"));

  }
LABEL_98:
  if (-[NSMutableArray count](self->_childIdentifiers, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_childIdentifiers, "count"));
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v58 = self->_childIdentifiers;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v95 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("childIdentifiers"));
  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v65 = self->_items;
    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v67; ++j)
        {
          if (*(_QWORD *)v91 != v68)
            objc_enumerationMutation(v65);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * j), "dictionaryRepresentation");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v70);

        }
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      }
      while (v67);
    }

    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("items"));
  }
  v71 = v4;

  return v71;
}

- (BOOL)readFrom:(id)a3
{
  return MIPPlaylistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  $043343F9A094FB3D6889D8E028CD7DF8 v6;
  $043343F9A094FB3D6889D8E028CD7DF8 v7;
  $043343F9A094FB3D6889D8E028CD7DF8 v8;
  $043343F9A094FB3D6889D8E028CD7DF8 v9;
  $043343F9A094FB3D6889D8E028CD7DF8 v10;
  $043343F9A094FB3D6889D8E028CD7DF8 v11;
  $043343F9A094FB3D6889D8E028CD7DF8 v12;
  $043343F9A094FB3D6889D8E028CD7DF8 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_smartPlaylistInfo)
    PBDataWriterWriteSubmessage();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
  }
  if ((*(_QWORD *)&v6 & 0x100000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_parentIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_geniusSeedTrackIdentifier)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_cloudGlobalId)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_externalVendorIdentifier)
    PBDataWriterWriteStringField();
  if (self->_externalVendorDisplayName)
    PBDataWriterWriteStringField();
  if (self->_externalVendorTag)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_has;
    if ((*(_BYTE *)&v8 & 8) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v8 & 0x80) == 0)
        goto LABEL_34;
      goto LABEL_112;
    }
  }
  else if ((*(_BYTE *)&v8 & 8) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteInt64Field();
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_113:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
LABEL_36:
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_cloudVersionHash)
    PBDataWriterWriteStringField();
  if (self->_artworkId)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x8000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v9 & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_117;
    }
  }
  else if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0)
      goto LABEL_45;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_46;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
      goto LABEL_47;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt32Field();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&v9 & 0x400000000) == 0)
      goto LABEL_48;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v9 & 1) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_121:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 1) != 0)
LABEL_49:
    PBDataWriterWriteInt64Field();
LABEL_50:
  if (self->_authorDisplayName)
    PBDataWriterWriteStringField();
  if (self->_authorStoreURL)
    PBDataWriterWriteStringField();
  if (self->_authorHandle)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 2) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v10 & 0x40000) == 0)
        goto LABEL_59;
      goto LABEL_125;
    }
  }
  else if ((*(_BYTE *)&v10 & 2) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteInt64Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_60;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt32Field();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_126:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
LABEL_61:
    PBDataWriterWriteInt32Field();
LABEL_62:
  if (self->_subscriberURL)
    PBDataWriterWriteStringField();
  if (self->_playlistDescription)
    PBDataWriterWriteStringField();
  if (self->_cloudUniversalLibraryId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_secondaryArtworkId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_playlistGroupingSortKey)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_coverArtworkRecipe)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_collaborationInvitationURL)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
    {
LABEL_90:
      if ((*(_WORD *)&v13 & 0x400) == 0)
        goto LABEL_92;
      goto LABEL_91;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
LABEL_91:
    PBDataWriterWriteInt32Field();
LABEL_92:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_childIdentifiers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self->_items;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (void)copyTo:(id)a3
{
  char *v4;
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  $043343F9A094FB3D6889D8E028CD7DF8 v6;
  $043343F9A094FB3D6889D8E028CD7DF8 v7;
  $043343F9A094FB3D6889D8E028CD7DF8 v8;
  $043343F9A094FB3D6889D8E028CD7DF8 v9;
  $043343F9A094FB3D6889D8E028CD7DF8 v10;
  $043343F9A094FB3D6889D8E028CD7DF8 v11;
  $043343F9A094FB3D6889D8E028CD7DF8 v12;
  $043343F9A094FB3D6889D8E028CD7DF8 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t j;
  void *v21;
  char *v22;

  v4 = (char *)a3;
  v22 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v22;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *((_QWORD *)v4 + 9) = self->_storeId;
    *(_QWORD *)(v4 + 340) |= 0x100uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x20000000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 81) = self->_type;
  *(_QWORD *)(v4 + 340) |= 0x400000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_6:
    v4[334] = self->_hidden;
    *(_QWORD *)(v4 + 340) |= 0x20000000uLL;
  }
LABEL_7:
  if (self->_smartPlaylistInfo)
  {
    objc_msgSend(v22, "setSmartPlaylistInfo:");
    v4 = v22;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 74) = self->_sortType;
    *(_QWORD *)(v4 + 340) |= 0x20000uLL;
    v6 = self->_has;
  }
  if ((*(_QWORD *)&v6 & 0x100000000) != 0)
  {
    v4[337] = self->_reversedSorting;
    *(_QWORD *)(v4 + 340) |= 0x100000000uLL;
  }
  if (self->_parentIdentifier)
  {
    objc_msgSend(v22, "setParentIdentifier:");
    v4 = v22;
  }
  if (self->_geniusSeedTrackIdentifier)
  {
    objc_msgSend(v22, "setGeniusSeedTrackIdentifier:");
    v4 = v22;
  }
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *((_DWORD *)v4 + 42) = self->_distinguishedKind;
    *(_QWORD *)(v4 + 340) |= 0x800uLL;
  }
  if (self->_cloudGlobalId)
  {
    objc_msgSend(v22, "setCloudGlobalId:");
    v4 = v22;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
    v4[330] = self->_cloudIsSubscribed;
    *(_QWORD *)(v4 + 340) |= 0x2000000uLL;
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    v4[328] = self->_cloudIsCuratorPlaylist;
    *(_QWORD *)(v4 + 340) |= 0x800000uLL;
  }
  if (self->_externalVendorIdentifier)
  {
    objc_msgSend(v22, "setExternalVendorIdentifier:");
    v4 = v22;
  }
  if (self->_externalVendorDisplayName)
  {
    objc_msgSend(v22, "setExternalVendorDisplayName:");
    v4 = v22;
  }
  if (self->_externalVendorTag)
  {
    objc_msgSend(v22, "setExternalVendorTag:");
    v4 = v22;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
    v4[333] = self->_externalVendorPlaylist;
    *(_QWORD *)(v4 + 340) |= 0x10000000uLL;
    v8 = self->_has;
    if ((*(_BYTE *)&v8 & 8) == 0)
    {
LABEL_33:
      if ((*(_BYTE *)&v8 & 0x80) == 0)
        goto LABEL_34;
      goto LABEL_106;
    }
  }
  else if ((*(_BYTE *)&v8 & 8) == 0)
  {
    goto LABEL_33;
  }
  *((_QWORD *)v4 + 4) = self->_creationDateTime;
  *(_QWORD *)(v4 + 340) |= 8uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_107;
  }
LABEL_106:
  *((_QWORD *)v4 + 8) = self->_modificationDateTime;
  *(_QWORD *)(v4 + 340) |= 0x80uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_107:
  *((_QWORD *)v4 + 5) = self->_lastPlayedDateTime;
  *(_QWORD *)(v4 + 340) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_36:
    v4[329] = self->_cloudIsSharingDisabled;
    *(_QWORD *)(v4 + 340) |= 0x1000000uLL;
  }
LABEL_37:
  if (self->_cloudVersionHash)
  {
    objc_msgSend(v22, "setCloudVersionHash:");
    v4 = v22;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v22, "setArtworkId:");
    v4 = v22;
  }
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 54) = self->_likedState;
    *(_QWORD *)(v4 + 340) |= 0x1000uLL;
    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x8000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v9 & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_111;
    }
  }
  else if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)v4 + 66) = self->_remoteSourceType;
  *(_QWORD *)(v4 + 340) |= 0x8000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0)
      goto LABEL_45;
    goto LABEL_112;
  }
LABEL_111:
  v4[336] = self->_owner;
  *(_QWORD *)(v4 + 340) |= 0x80000000uLL;
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_46;
    goto LABEL_113;
  }
LABEL_112:
  v4[332] = self->_editable;
  *(_QWORD *)(v4 + 340) |= 0x8000000uLL;
  v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_46:
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
      goto LABEL_47;
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v4 + 60) = self->_playCount;
  *(_QWORD *)(v4 + 340) |= 0x2000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
LABEL_47:
    if ((*(_QWORD *)&v9 & 0x400000000) == 0)
      goto LABEL_48;
    goto LABEL_115;
  }
LABEL_114:
  v4[338] = self->_shared;
  *(_QWORD *)(v4 + 340) |= 0x200000000uLL;
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v9 & 1) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_115:
  v4[339] = self->_visible;
  *(_QWORD *)(v4 + 340) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_49:
    *((_QWORD *)v4 + 1) = self->_authorStoreId;
    *(_QWORD *)(v4 + 340) |= 1uLL;
  }
LABEL_50:
  if (self->_authorDisplayName)
  {
    objc_msgSend(v22, "setAuthorDisplayName:");
    v4 = v22;
  }
  if (self->_authorStoreURL)
  {
    objc_msgSend(v22, "setAuthorStoreURL:");
    v4 = v22;
  }
  if (self->_authorHandle)
  {
    objc_msgSend(v22, "setAuthorHandle:");
    v4 = v22;
  }
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    *((_QWORD *)v4 + 7) = self->_minRefreshInterval;
    *(_QWORD *)(v4 + 340) |= 0x40uLL;
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 2) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v10 & 0x40000) == 0)
        goto LABEL_59;
      goto LABEL_119;
    }
  }
  else if ((*(_BYTE *)&v10 & 2) == 0)
  {
    goto LABEL_58;
  }
  *((_QWORD *)v4 + 2) = self->_cloudLastUpdateTime;
  *(_QWORD *)(v4 + 340) |= 2uLL;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_60;
    goto LABEL_120;
  }
LABEL_119:
  *((_DWORD *)v4 + 75) = self->_subscriberCount;
  *(_QWORD *)(v4 + 340) |= 0x40000uLL;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_120:
  *((_DWORD *)v4 + 77) = self->_subscriberPlayCount;
  *(_QWORD *)(v4 + 340) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_61:
    *((_DWORD *)v4 + 76) = self->_subscriberLikedCount;
    *(_QWORD *)(v4 + 340) |= 0x80000uLL;
  }
LABEL_62:
  if (self->_subscriberURL)
  {
    objc_msgSend(v22, "setSubscriberURL:");
    v4 = v22;
  }
  if (self->_playlistDescription)
  {
    objc_msgSend(v22, "setPlaylistDescription:");
    v4 = v22;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v22, "setCloudUniversalLibraryId:");
    v4 = v22;
  }
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *((_DWORD *)v4 + 70) = self->_secondaryArtworkSourceType;
    *(_QWORD *)(v4 + 340) |= 0x10000uLL;
  }
  if (self->_secondaryArtworkId)
  {
    objc_msgSend(v22, "setSecondaryArtworkId:");
    v4 = v22;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v4 + 61) = self->_playlistCategoryTypeMask;
    *(_QWORD *)(v4 + 340) |= 0x4000uLL;
  }
  if (self->_playlistGroupingSortKey)
  {
    objc_msgSend(v22, "setPlaylistGroupingSortKey:");
    v4 = v22;
  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = self->_likedStateChangedDate;
    *(_QWORD *)(v4 + 340) |= 0x20uLL;
    v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 80) = self->_traits;
    *(_QWORD *)(v4 + 340) |= 0x200000uLL;
  }
  if (self->_coverArtworkRecipe)
  {
    objc_msgSend(v22, "setCoverArtworkRecipe:");
    v4 = v22;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    v4[335] = self->_isCollaborative;
    *(_QWORD *)(v4 + 340) |= 0x40000000uLL;
    v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 38) = self->_collaborationMode;
    *(_QWORD *)(v4 + 340) |= 0x200uLL;
  }
  if (self->_collaborationInvitationURL)
  {
    objc_msgSend(v22, "setCollaborationInvitationURL:");
    v4 = v22;
  }
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 4) == 0)
  {
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
      goto LABEL_90;
LABEL_123:
    v4[331] = self->_collaborationJoinRequestPending;
    *(_QWORD *)(v4 + 340) |= 0x4000000uLL;
    if ((*(_QWORD *)&self->_has & 0x400) == 0)
      goto LABEL_92;
    goto LABEL_91;
  }
  *((_QWORD *)v4 + 3) = self->_collaborationInvitationURLExpirationDate;
  *(_QWORD *)(v4 + 340) |= 4uLL;
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
    goto LABEL_123;
LABEL_90:
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
LABEL_91:
    *((_DWORD *)v4 + 39) = self->_collaboratorStatus;
    *(_QWORD *)(v4 + 340) |= 0x400uLL;
  }
LABEL_92:
  if (-[MIPPlaylist childIdentifiersCount](self, "childIdentifiersCount"))
  {
    objc_msgSend(v22, "clearChildIdentifiers");
    v14 = -[MIPPlaylist childIdentifiersCount](self, "childIdentifiersCount");
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        -[MIPPlaylist childIdentifiersAtIndex:](self, "childIdentifiersAtIndex:", i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addChildIdentifiers:", v17);

      }
    }
  }
  if (-[MIPPlaylist itemsCount](self, "itemsCount"))
  {
    objc_msgSend(v22, "clearItems");
    v18 = -[MIPPlaylist itemsCount](self, "itemsCount");
    if (v18)
    {
      v19 = v18;
      for (j = 0; j != v19; ++j)
      {
        -[MIPPlaylist itemsAtIndex:](self, "itemsAtIndex:", j);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addItems:", v21);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  id v9;
  void *v10;
  $043343F9A094FB3D6889D8E028CD7DF8 v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  $043343F9A094FB3D6889D8E028CD7DF8 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  $043343F9A094FB3D6889D8E028CD7DF8 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  $043343F9A094FB3D6889D8E028CD7DF8 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  $043343F9A094FB3D6889D8E028CD7DF8 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  $043343F9A094FB3D6889D8E028CD7DF8 v48;
  uint64_t v49;
  void *v50;
  $043343F9A094FB3D6889D8E028CD7DF8 v51;
  uint64_t v52;
  void *v53;
  $043343F9A094FB3D6889D8E028CD7DF8 v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v6;

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_storeId;
    *(_QWORD *)(v5 + 340) |= 0x100uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000000) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 324) = self->_type;
  *(_QWORD *)(v5 + 340) |= 0x400000uLL;
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 334) = self->_hidden;
    *(_QWORD *)(v5 + 340) |= 0x20000000uLL;
  }
LABEL_5:
  v9 = -[MIPSmartPlaylistInfo copyWithZone:](self->_smartPlaylistInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v9;

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_sortType;
    *(_QWORD *)(v5 + 340) |= 0x20000uLL;
    v11 = self->_has;
  }
  if ((*(_QWORD *)&v11 & 0x100000000) != 0)
  {
    *(_BYTE *)(v5 + 337) = self->_reversedSorting;
    *(_QWORD *)(v5 + 340) |= 0x100000000uLL;
  }
  v12 = -[MIPMultiverseIdentifier copyWithZone:](self->_parentIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v12;

  v14 = -[MIPMultiverseIdentifier copyWithZone:](self->_geniusSeedTrackIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v14;

  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_distinguishedKind;
    *(_QWORD *)(v5 + 340) |= 0x800uLL;
  }
  v16 = -[NSString copyWithZone:](self->_cloudGlobalId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v16;

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 330) = self->_cloudIsSubscribed;
    *(_QWORD *)(v5 + 340) |= 0x2000000uLL;
    v18 = self->_has;
  }
  if ((*(_DWORD *)&v18 & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 328) = self->_cloudIsCuratorPlaylist;
    *(_QWORD *)(v5 + 340) |= 0x800000uLL;
  }
  v19 = -[NSString copyWithZone:](self->_externalVendorIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v19;

  v21 = -[NSString copyWithZone:](self->_externalVendorDisplayName, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v21;

  v23 = -[NSString copyWithZone:](self->_externalVendorTag, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v23;

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000000) != 0)
  {
    *(_BYTE *)(v5 + 333) = self->_externalVendorPlaylist;
    *(_QWORD *)(v5 + 340) |= 0x10000000uLL;
    v25 = self->_has;
    if ((*(_BYTE *)&v25 & 8) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v25 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v25 & 8) == 0)
  {
    goto LABEL_17;
  }
  *(_QWORD *)(v5 + 32) = self->_creationDateTime;
  *(_QWORD *)(v5 + 340) |= 8uLL;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v25 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_73;
  }
LABEL_72:
  *(_QWORD *)(v5 + 64) = self->_modificationDateTime;
  *(_QWORD *)(v5 + 340) |= 0x80uLL;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v25 & 0x1000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_73:
  *(_QWORD *)(v5 + 40) = self->_lastPlayedDateTime;
  *(_QWORD *)(v5 + 340) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
LABEL_20:
    *(_BYTE *)(v5 + 329) = self->_cloudIsSharingDisabled;
    *(_QWORD *)(v5 + 340) |= 0x1000000uLL;
  }
LABEL_21:
  v26 = -[NSString copyWithZone:](self->_cloudVersionHash, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v26;

  v28 = -[NSString copyWithZone:](self->_artworkId, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v28;

  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_likedState;
    *(_QWORD *)(v5 + 340) |= 0x1000uLL;
    v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x8000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v30 & 0x80000000) == 0)
        goto LABEL_24;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v30 & 0x8000) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 264) = self->_remoteSourceType;
  *(_QWORD *)(v5 + 340) |= 0x8000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v30 & 0x8000000) == 0)
      goto LABEL_25;
    goto LABEL_78;
  }
LABEL_77:
  *(_BYTE *)(v5 + 336) = self->_owner;
  *(_QWORD *)(v5 + 340) |= 0x80000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v30 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_79;
  }
LABEL_78:
  *(_BYTE *)(v5 + 332) = self->_editable;
  *(_QWORD *)(v5 + 340) |= 0x8000000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&v30 & 0x200000000) == 0)
      goto LABEL_27;
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 240) = self->_playCount;
  *(_QWORD *)(v5 + 340) |= 0x2000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_QWORD *)&v30 & 0x400000000) == 0)
      goto LABEL_28;
    goto LABEL_81;
  }
LABEL_80:
  *(_BYTE *)(v5 + 338) = self->_shared;
  *(_QWORD *)(v5 + 340) |= 0x200000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v30 & 1) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_81:
  *(_BYTE *)(v5 + 339) = self->_visible;
  *(_QWORD *)(v5 + 340) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
LABEL_29:
    *(_QWORD *)(v5 + 8) = self->_authorStoreId;
    *(_QWORD *)(v5 + 340) |= 1uLL;
  }
LABEL_30:
  v31 = -[NSString copyWithZone:](self->_authorDisplayName, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v31;

  v33 = -[NSString copyWithZone:](self->_authorStoreURL, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v33;

  v35 = -[NSString copyWithZone:](self->_authorHandle, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v35;

  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_minRefreshInterval;
    *(_QWORD *)(v5 + 340) |= 0x40uLL;
    v37 = self->_has;
    if ((*(_BYTE *)&v37 & 2) == 0)
    {
LABEL_32:
      if ((*(_DWORD *)&v37 & 0x40000) == 0)
        goto LABEL_33;
      goto LABEL_85;
    }
  }
  else if ((*(_BYTE *)&v37 & 2) == 0)
  {
    goto LABEL_32;
  }
  *(_QWORD *)(v5 + 16) = self->_cloudLastUpdateTime;
  *(_QWORD *)(v5 + 340) |= 2uLL;
  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x40000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v37 & 0x100000) == 0)
      goto LABEL_34;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 300) = self->_subscriberCount;
  *(_QWORD *)(v5 + 340) |= 0x40000uLL;
  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v37 & 0x80000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_86:
  *(_DWORD *)(v5 + 308) = self->_subscriberPlayCount;
  *(_QWORD *)(v5 + 340) |= 0x100000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v5 + 304) = self->_subscriberLikedCount;
    *(_QWORD *)(v5 + 340) |= 0x80000uLL;
  }
LABEL_36:
  v38 = -[NSString copyWithZone:](self->_subscriberURL, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v38;

  v40 = -[NSString copyWithZone:](self->_playlistDescription, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v40;

  v42 = -[NSString copyWithZone:](self->_cloudUniversalLibraryId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v42;

  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_DWORD *)(v5 + 280) = self->_secondaryArtworkSourceType;
    *(_QWORD *)(v5 + 340) |= 0x10000uLL;
  }
  v44 = -[NSString copyWithZone:](self->_secondaryArtworkId, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v44;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 244) = self->_playlistCategoryTypeMask;
    *(_QWORD *)(v5 + 340) |= 0x4000uLL;
  }
  v46 = -[NSString copyWithZone:](self->_playlistGroupingSortKey, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v46;

  v48 = self->_has;
  if ((*(_BYTE *)&v48 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_likedStateChangedDate;
    *(_QWORD *)(v5 + 340) |= 0x20uLL;
    v48 = self->_has;
  }
  if ((*(_DWORD *)&v48 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_traits;
    *(_QWORD *)(v5 + 340) |= 0x200000uLL;
  }
  v49 = -[NSString copyWithZone:](self->_coverArtworkRecipe, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v49;

  v51 = self->_has;
  if ((*(_DWORD *)&v51 & 0x40000000) != 0)
  {
    *(_BYTE *)(v5 + 335) = self->_isCollaborative;
    *(_QWORD *)(v5 + 340) |= 0x40000000uLL;
    v51 = self->_has;
  }
  if ((*(_WORD *)&v51 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_collaborationMode;
    *(_QWORD *)(v5 + 340) |= 0x200uLL;
  }
  v52 = -[NSString copyWithZone:](self->_collaborationInvitationURL, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v52;

  v54 = self->_has;
  if ((*(_BYTE *)&v54 & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_collaborationInvitationURLExpirationDate;
    *(_QWORD *)(v5 + 340) |= 4uLL;
    v54 = self->_has;
    if ((*(_DWORD *)&v54 & 0x4000000) == 0)
    {
LABEL_50:
      if ((*(_WORD *)&v54 & 0x400) == 0)
        goto LABEL_52;
      goto LABEL_51;
    }
  }
  else if ((*(_DWORD *)&v54 & 0x4000000) == 0)
  {
    goto LABEL_50;
  }
  *(_BYTE *)(v5 + 331) = self->_collaborationJoinRequestPending;
  *(_QWORD *)(v5 + 340) |= 0x4000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
LABEL_51:
    *(_DWORD *)(v5 + 156) = self->_collaboratorStatus;
    *(_QWORD *)(v5 + 340) |= 0x400uLL;
  }
LABEL_52:
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v55 = self->_childIdentifiers;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v74;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v59), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChildIdentifiers:", v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v57);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v61 = self->_items;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v70;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v65), "copyWithZone:", a3, (_QWORD)v69);
        objc_msgSend((id)v5, "addItems:", v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v63);
  }

  v67 = (id)v5;
  return v67;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *name;
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  uint64_t v7;
  MIPSmartPlaylistInfo *smartPlaylistInfo;
  MIPMultiverseIdentifier *parentIdentifier;
  MIPMultiverseIdentifier *geniusSeedTrackIdentifier;
  $043343F9A094FB3D6889D8E028CD7DF8 v11;
  uint64_t v12;
  NSString *cloudGlobalId;
  NSString *externalVendorIdentifier;
  NSString *externalVendorDisplayName;
  NSString *externalVendorTag;
  $043343F9A094FB3D6889D8E028CD7DF8 v17;
  uint64_t v18;
  NSString *cloudVersionHash;
  NSString *artworkId;
  $043343F9A094FB3D6889D8E028CD7DF8 v21;
  uint64_t v22;
  NSString *authorDisplayName;
  NSString *authorStoreURL;
  NSString *authorHandle;
  $043343F9A094FB3D6889D8E028CD7DF8 v26;
  uint64_t v27;
  NSString *subscriberURL;
  NSString *playlistDescription;
  NSString *cloudUniversalLibraryId;
  $043343F9A094FB3D6889D8E028CD7DF8 v31;
  uint64_t v32;
  NSString *secondaryArtworkId;
  NSString *playlistGroupingSortKey;
  NSString *coverArtworkRecipe;
  NSString *collaborationInvitationURL;
  NSMutableArray *childIdentifiers;
  NSMutableArray *items;
  char v39;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_263;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_263;
  }
  has = self->_has;
  v7 = *(_QWORD *)(v4 + 340);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_storeId != *((_QWORD *)v4 + 9))
      goto LABEL_263;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_type != *((_DWORD *)v4 + 81))
      goto LABEL_263;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0)
      goto LABEL_263;
    if (self->_hidden)
    {
      if (!v4[334])
        goto LABEL_263;
    }
    else if (v4[334])
    {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_263;
  }
  smartPlaylistInfo = self->_smartPlaylistInfo;
  if ((unint64_t)smartPlaylistInfo | *((_QWORD *)v4 + 36))
  {
    if (!-[MIPSmartPlaylistInfo isEqual:](smartPlaylistInfo, "isEqual:"))
      goto LABEL_263;
    has = self->_has;
    v7 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sortType != *((_DWORD *)v4 + 74))
      goto LABEL_263;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0)
      goto LABEL_263;
    if (self->_reversedSorting)
    {
      if (!v4[337])
        goto LABEL_263;
    }
    else if (v4[337])
    {
      goto LABEL_263;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_263;
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((_QWORD *)v4 + 29)
    && !-[MIPMultiverseIdentifier isEqual:](parentIdentifier, "isEqual:"))
  {
    goto LABEL_263;
  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  if ((unint64_t)geniusSeedTrackIdentifier | *((_QWORD *)v4 + 25))
  {
    if (!-[MIPMultiverseIdentifier isEqual:](geniusSeedTrackIdentifier, "isEqual:"))
      goto LABEL_263;
  }
  v11 = self->_has;
  v12 = *(_QWORD *)(v4 + 340);
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_distinguishedKind != *((_DWORD *)v4 + 42))
      goto LABEL_263;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_263;
  }
  cloudGlobalId = self->_cloudGlobalId;
  if ((unint64_t)cloudGlobalId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](cloudGlobalId, "isEqual:"))
      goto LABEL_263;
    v11 = self->_has;
    v12 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_DWORD *)&v11 & 0x2000000) != 0)
  {
    if ((v12 & 0x2000000) == 0)
      goto LABEL_263;
    if (self->_cloudIsSubscribed)
    {
      if (!v4[330])
        goto LABEL_263;
    }
    else if (v4[330])
    {
      goto LABEL_263;
    }
  }
  else if ((v12 & 0x2000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0)
      goto LABEL_263;
    if (self->_cloudIsCuratorPlaylist)
    {
      if (!v4[328])
        goto LABEL_263;
    }
    else if (v4[328])
    {
      goto LABEL_263;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_263;
  }
  externalVendorIdentifier = self->_externalVendorIdentifier;
  if ((unint64_t)externalVendorIdentifier | *((_QWORD *)v4 + 23)
    && !-[NSString isEqual:](externalVendorIdentifier, "isEqual:"))
  {
    goto LABEL_263;
  }
  externalVendorDisplayName = self->_externalVendorDisplayName;
  if ((unint64_t)externalVendorDisplayName | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](externalVendorDisplayName, "isEqual:"))
      goto LABEL_263;
  }
  externalVendorTag = self->_externalVendorTag;
  if ((unint64_t)externalVendorTag | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](externalVendorTag, "isEqual:"))
      goto LABEL_263;
  }
  v17 = self->_has;
  v18 = *(_QWORD *)(v4 + 340);
  if ((*(_DWORD *)&v17 & 0x10000000) != 0)
  {
    if ((v18 & 0x10000000) == 0)
      goto LABEL_263;
    if (self->_externalVendorPlaylist)
    {
      if (!v4[333])
        goto LABEL_263;
    }
    else if (v4[333])
    {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x10000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_BYTE *)&v17 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_creationDateTime != *((_QWORD *)v4 + 4))
      goto LABEL_263;
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_modificationDateTime != *((_QWORD *)v4 + 8))
      goto LABEL_263;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_BYTE *)&v17 & 0x10) != 0)
  {
    if ((v18 & 0x10) == 0 || self->_lastPlayedDateTime != *((_QWORD *)v4 + 5))
      goto LABEL_263;
  }
  else if ((v18 & 0x10) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
  {
    if ((v18 & 0x1000000) == 0)
      goto LABEL_263;
    if (self->_cloudIsSharingDisabled)
    {
      if (!v4[329])
        goto LABEL_263;
    }
    else if (v4[329])
    {
      goto LABEL_263;
    }
  }
  else if ((v18 & 0x1000000) != 0)
  {
    goto LABEL_263;
  }
  cloudVersionHash = self->_cloudVersionHash;
  if ((unint64_t)cloudVersionHash | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](cloudVersionHash, "isEqual:"))
  {
    goto LABEL_263;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:"))
      goto LABEL_263;
  }
  v21 = self->_has;
  v22 = *(_QWORD *)(v4 + 340);
  if ((*(_WORD *)&v21 & 0x1000) != 0)
  {
    if ((v22 & 0x1000) == 0 || self->_likedState != *((_DWORD *)v4 + 54))
      goto LABEL_263;
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_remoteSourceType != *((_DWORD *)v4 + 66))
      goto LABEL_263;
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    if ((v22 & 0x80000000) == 0)
      goto LABEL_263;
    if (self->_owner)
    {
      if (!v4[336])
        goto LABEL_263;
    }
    else if (v4[336])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x80000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v21 & 0x8000000) != 0)
  {
    if ((v22 & 0x8000000) == 0)
      goto LABEL_263;
    if (self->_editable)
    {
      if (!v4[332])
        goto LABEL_263;
    }
    else if (v4[332])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x8000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v21 & 0x2000) != 0)
  {
    if ((v22 & 0x2000) == 0 || self->_playCount != *((_DWORD *)v4 + 60))
      goto LABEL_263;
  }
  else if ((v22 & 0x2000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_QWORD *)&v21 & 0x200000000) != 0)
  {
    if ((v22 & 0x200000000) == 0)
      goto LABEL_263;
    if (self->_shared)
    {
      if (!v4[338])
        goto LABEL_263;
    }
    else if (v4[338])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x200000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_QWORD *)&v21 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0)
      goto LABEL_263;
    if (self->_visible)
    {
      if (!v4[339])
        goto LABEL_263;
    }
    else if (v4[339])
    {
      goto LABEL_263;
    }
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_authorStoreId != *((_QWORD *)v4 + 1))
      goto LABEL_263;
  }
  else if ((v22 & 1) != 0)
  {
    goto LABEL_263;
  }
  authorDisplayName = self->_authorDisplayName;
  if ((unint64_t)authorDisplayName | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](authorDisplayName, "isEqual:"))
  {
    goto LABEL_263;
  }
  authorStoreURL = self->_authorStoreURL;
  if ((unint64_t)authorStoreURL | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](authorStoreURL, "isEqual:"))
      goto LABEL_263;
  }
  authorHandle = self->_authorHandle;
  if ((unint64_t)authorHandle | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](authorHandle, "isEqual:"))
      goto LABEL_263;
  }
  v26 = self->_has;
  v27 = *(_QWORD *)(v4 + 340);
  if ((*(_BYTE *)&v26 & 0x40) != 0)
  {
    if ((v27 & 0x40) == 0 || self->_minRefreshInterval != *((_QWORD *)v4 + 7))
      goto LABEL_263;
  }
  else if ((v27 & 0x40) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_BYTE *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_cloudLastUpdateTime != *((_QWORD *)v4 + 2))
      goto LABEL_263;
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
    if ((v27 & 0x40000) == 0 || self->_subscriberCount != *((_DWORD *)v4 + 75))
      goto LABEL_263;
  }
  else if ((v27 & 0x40000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    if ((v27 & 0x100000) == 0 || self->_subscriberPlayCount != *((_DWORD *)v4 + 77))
      goto LABEL_263;
  }
  else if ((v27 & 0x100000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v26 & 0x80000) != 0)
  {
    if ((v27 & 0x80000) == 0 || self->_subscriberLikedCount != *((_DWORD *)v4 + 76))
      goto LABEL_263;
  }
  else if ((v27 & 0x80000) != 0)
  {
    goto LABEL_263;
  }
  subscriberURL = self->_subscriberURL;
  if ((unint64_t)subscriberURL | *((_QWORD *)v4 + 39)
    && !-[NSString isEqual:](subscriberURL, "isEqual:"))
  {
    goto LABEL_263;
  }
  playlistDescription = self->_playlistDescription;
  if ((unint64_t)playlistDescription | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](playlistDescription, "isEqual:"))
      goto LABEL_263;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
      goto LABEL_263;
  }
  v31 = self->_has;
  v32 = *(_QWORD *)(v4 + 340);
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
    if ((v32 & 0x10000) == 0 || self->_secondaryArtworkSourceType != *((_DWORD *)v4 + 70))
      goto LABEL_263;
  }
  else if ((v32 & 0x10000) != 0)
  {
    goto LABEL_263;
  }
  secondaryArtworkId = self->_secondaryArtworkId;
  if ((unint64_t)secondaryArtworkId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](secondaryArtworkId, "isEqual:"))
      goto LABEL_263;
    v31 = self->_has;
    v32 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    if ((v32 & 0x4000) == 0 || self->_playlistCategoryTypeMask != *((_DWORD *)v4 + 61))
      goto LABEL_263;
  }
  else if ((v32 & 0x4000) != 0)
  {
    goto LABEL_263;
  }
  playlistGroupingSortKey = self->_playlistGroupingSortKey;
  if ((unint64_t)playlistGroupingSortKey | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](playlistGroupingSortKey, "isEqual:"))
      goto LABEL_263;
    v31 = self->_has;
    v32 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_BYTE *)&v31 & 0x20) != 0)
  {
    if ((v32 & 0x20) == 0 || self->_likedStateChangedDate != *((_QWORD *)v4 + 6))
      goto LABEL_263;
  }
  else if ((v32 & 0x20) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    if ((v32 & 0x200000) == 0 || self->_traits != *((_DWORD *)v4 + 80))
      goto LABEL_263;
  }
  else if ((v32 & 0x200000) != 0)
  {
    goto LABEL_263;
  }
  coverArtworkRecipe = self->_coverArtworkRecipe;
  if ((unint64_t)coverArtworkRecipe | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](coverArtworkRecipe, "isEqual:"))
      goto LABEL_263;
    v31 = self->_has;
    v32 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
    if ((v32 & 0x40000000) == 0)
      goto LABEL_263;
    if (self->_isCollaborative)
    {
      if (!v4[335])
        goto LABEL_263;
    }
    else if (v4[335])
    {
      goto LABEL_263;
    }
  }
  else if ((v32 & 0x40000000) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_WORD *)&v31 & 0x200) != 0)
  {
    if ((v32 & 0x200) == 0 || self->_collaborationMode != *((_DWORD *)v4 + 38))
      goto LABEL_263;
  }
  else if ((v32 & 0x200) != 0)
  {
    goto LABEL_263;
  }
  collaborationInvitationURL = self->_collaborationInvitationURL;
  if ((unint64_t)collaborationInvitationURL | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](collaborationInvitationURL, "isEqual:"))
      goto LABEL_263;
    v31 = self->_has;
    v32 = *(_QWORD *)(v4 + 340);
  }
  if ((*(_BYTE *)&v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_collaborationInvitationURLExpirationDate != *((_QWORD *)v4 + 3))
      goto LABEL_263;
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_263;
  }
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
    if ((v32 & 0x4000000) != 0)
    {
      if (self->_collaborationJoinRequestPending)
      {
        if (!v4[331])
          goto LABEL_263;
        goto LABEL_254;
      }
      if (!v4[331])
        goto LABEL_254;
    }
LABEL_263:
    v39 = 0;
    goto LABEL_264;
  }
  if ((v32 & 0x4000000) != 0)
    goto LABEL_263;
LABEL_254:
  if ((*(_WORD *)&v31 & 0x400) != 0)
  {
    if ((v32 & 0x400) == 0 || self->_collaboratorStatus != *((_DWORD *)v4 + 39))
      goto LABEL_263;
  }
  else if ((v32 & 0x400) != 0)
  {
    goto LABEL_263;
  }
  childIdentifiers = self->_childIdentifiers;
  if ((unint64_t)childIdentifiers | *((_QWORD *)v4 + 14)
    && !-[NSMutableArray isEqual:](childIdentifiers, "isEqual:"))
  {
    goto LABEL_263;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 26))
    v39 = -[NSMutableArray isEqual:](items, "isEqual:");
  else
    v39 = 1;
LABEL_264:

  return v39;
}

- (unint64_t)hash
{
  $043343F9A094FB3D6889D8E028CD7DF8 has;
  $043343F9A094FB3D6889D8E028CD7DF8 v4;
  $043343F9A094FB3D6889D8E028CD7DF8 v5;
  $043343F9A094FB3D6889D8E028CD7DF8 v6;
  $043343F9A094FB3D6889D8E028CD7DF8 v7;
  $043343F9A094FB3D6889D8E028CD7DF8 v8;
  uint64_t v9;
  NSUInteger v10;
  $043343F9A094FB3D6889D8E028CD7DF8 v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  $043343F9A094FB3D6889D8E028CD7DF8 v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  $043343F9A094FB3D6889D8E028CD7DF8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v25;
  uint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;
  NSUInteger v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  uint64_t v56;
  uint64_t v57;
  NSUInteger v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSUInteger v68;

  v68 = -[NSString hash](self->_name, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
    v67 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_3;
LABEL_6:
    v66 = 0;
    if ((*(_DWORD *)&has & 0x20000000) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v67 = 2654435761 * self->_storeId;
  if ((*(_DWORD *)&has & 0x400000) == 0)
    goto LABEL_6;
LABEL_3:
  v66 = 2654435761 * self->_type;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_4:
    v65 = 2654435761 * self->_hidden;
    goto LABEL_8;
  }
LABEL_7:
  v65 = 0;
LABEL_8:
  v64 = -[MIPSmartPlaylistInfo hash](self->_smartPlaylistInfo, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    v63 = 2654435761 * self->_sortType;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
      goto LABEL_10;
  }
  else
  {
    v63 = 0;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
    {
LABEL_10:
      v62 = 2654435761 * self->_reversedSorting;
      goto LABEL_13;
    }
  }
  v62 = 0;
LABEL_13:
  v61 = -[MIPMultiverseIdentifier hash](self->_parentIdentifier, "hash");
  v60 = -[MIPMultiverseIdentifier hash](self->_geniusSeedTrackIdentifier, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    v59 = 2654435761 * self->_distinguishedKind;
  else
    v59 = 0;
  v58 = -[NSString hash](self->_cloudGlobalId, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
    v57 = 2654435761 * self->_cloudIsSubscribed;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
      goto LABEL_18;
  }
  else
  {
    v57 = 0;
    if ((*(_DWORD *)&v5 & 0x800000) != 0)
    {
LABEL_18:
      v56 = 2654435761 * self->_cloudIsCuratorPlaylist;
      goto LABEL_21;
    }
  }
  v56 = 0;
LABEL_21:
  v55 = -[NSString hash](self->_externalVendorIdentifier, "hash");
  v54 = -[NSString hash](self->_externalVendorDisplayName, "hash");
  v53 = -[NSString hash](self->_externalVendorTag, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
  {
    v52 = 2654435761 * self->_externalVendorPlaylist;
    if ((*(_BYTE *)&v6 & 8) != 0)
    {
LABEL_23:
      v51 = 2654435761 * self->_creationDateTime;
      if ((*(_BYTE *)&v6 & 0x80) != 0)
        goto LABEL_24;
      goto LABEL_29;
    }
  }
  else
  {
    v52 = 0;
    if ((*(_BYTE *)&v6 & 8) != 0)
      goto LABEL_23;
  }
  v51 = 0;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
LABEL_24:
    v50 = 2654435761 * self->_modificationDateTime;
    if ((*(_BYTE *)&v6 & 0x10) != 0)
      goto LABEL_25;
LABEL_30:
    v49 = 0;
    if ((*(_DWORD *)&v6 & 0x1000000) != 0)
      goto LABEL_26;
    goto LABEL_31;
  }
LABEL_29:
  v50 = 0;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
    goto LABEL_30;
LABEL_25:
  v49 = 2654435761 * self->_lastPlayedDateTime;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
LABEL_26:
    v48 = 2654435761 * self->_cloudIsSharingDisabled;
    goto LABEL_32;
  }
LABEL_31:
  v48 = 0;
LABEL_32:
  v47 = -[NSString hash](self->_cloudVersionHash, "hash");
  v46 = -[NSString hash](self->_artworkId, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) != 0)
  {
    v45 = 2654435761 * self->_likedState;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
    {
LABEL_34:
      v44 = 2654435761 * self->_remoteSourceType;
      if ((*(_DWORD *)&v7 & 0x80000000) != 0)
        goto LABEL_35;
      goto LABEL_43;
    }
  }
  else
  {
    v45 = 0;
    if ((*(_WORD *)&v7 & 0x8000) != 0)
      goto LABEL_34;
  }
  v44 = 0;
  if ((*(_DWORD *)&v7 & 0x80000000) != 0)
  {
LABEL_35:
    v43 = 2654435761 * self->_owner;
    if ((*(_DWORD *)&v7 & 0x8000000) != 0)
      goto LABEL_36;
    goto LABEL_44;
  }
LABEL_43:
  v43 = 0;
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
  {
LABEL_36:
    v42 = 2654435761 * self->_editable;
    if ((*(_WORD *)&v7 & 0x2000) != 0)
      goto LABEL_37;
    goto LABEL_45;
  }
LABEL_44:
  v42 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_37:
    v41 = 2654435761 * self->_playCount;
    if ((*(_QWORD *)&v7 & 0x200000000) != 0)
      goto LABEL_38;
    goto LABEL_46;
  }
LABEL_45:
  v41 = 0;
  if ((*(_QWORD *)&v7 & 0x200000000) != 0)
  {
LABEL_38:
    v40 = 2654435761 * self->_shared;
    if ((*(_QWORD *)&v7 & 0x400000000) != 0)
      goto LABEL_39;
LABEL_47:
    v39 = 0;
    if ((*(_BYTE *)&v7 & 1) != 0)
      goto LABEL_40;
    goto LABEL_48;
  }
LABEL_46:
  v40 = 0;
  if ((*(_QWORD *)&v7 & 0x400000000) == 0)
    goto LABEL_47;
LABEL_39:
  v39 = 2654435761 * self->_visible;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
LABEL_40:
    v38 = 2654435761 * self->_authorStoreId;
    goto LABEL_49;
  }
LABEL_48:
  v38 = 0;
LABEL_49:
  v37 = -[NSString hash](self->_authorDisplayName, "hash");
  v36 = -[NSString hash](self->_authorStoreURL, "hash");
  v35 = -[NSString hash](self->_authorHandle, "hash");
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x40) != 0)
  {
    v34 = 2654435761 * self->_minRefreshInterval;
    if ((*(_BYTE *)&v8 & 2) != 0)
    {
LABEL_51:
      v33 = 2654435761 * self->_cloudLastUpdateTime;
      if ((*(_DWORD *)&v8 & 0x40000) != 0)
        goto LABEL_52;
      goto LABEL_57;
    }
  }
  else
  {
    v34 = 0;
    if ((*(_BYTE *)&v8 & 2) != 0)
      goto LABEL_51;
  }
  v33 = 0;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
LABEL_52:
    v32 = 2654435761 * self->_subscriberCount;
    if ((*(_DWORD *)&v8 & 0x100000) != 0)
      goto LABEL_53;
LABEL_58:
    v31 = 0;
    if ((*(_DWORD *)&v8 & 0x80000) != 0)
      goto LABEL_54;
    goto LABEL_59;
  }
LABEL_57:
  v32 = 0;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
    goto LABEL_58;
LABEL_53:
  v31 = 2654435761 * self->_subscriberPlayCount;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
LABEL_54:
    v30 = 2654435761 * self->_subscriberLikedCount;
    goto LABEL_60;
  }
LABEL_59:
  v30 = 0;
LABEL_60:
  v29 = -[NSString hash](self->_subscriberURL, "hash");
  v28 = -[NSString hash](self->_playlistDescription, "hash");
  v27 = -[NSString hash](self->_cloudUniversalLibraryId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v26 = 2654435761 * self->_secondaryArtworkSourceType;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_secondaryArtworkId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v9 = 2654435761 * self->_playlistCategoryTypeMask;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_playlistGroupingSortKey, "hash");
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    v12 = 2654435761 * self->_likedStateChangedDate;
    if ((*(_DWORD *)&v11 & 0x200000) != 0)
      goto LABEL_68;
  }
  else
  {
    v12 = 0;
    if ((*(_DWORD *)&v11 & 0x200000) != 0)
    {
LABEL_68:
      v13 = 2654435761 * self->_traits;
      goto LABEL_71;
    }
  }
  v13 = 0;
LABEL_71:
  v14 = -[NSString hash](self->_coverArtworkRecipe, "hash");
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000000) != 0)
  {
    v16 = 2654435761 * self->_isCollaborative;
    if ((*(_WORD *)&v15 & 0x200) != 0)
      goto LABEL_73;
  }
  else
  {
    v16 = 0;
    if ((*(_WORD *)&v15 & 0x200) != 0)
    {
LABEL_73:
      v17 = 2654435761 * self->_collaborationMode;
      goto LABEL_76;
    }
  }
  v17 = 0;
LABEL_76:
  v18 = -[NSString hash](self->_collaborationInvitationURL, "hash");
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 4) == 0)
  {
    v20 = 0;
    if ((*(_DWORD *)&v19 & 0x4000000) != 0)
      goto LABEL_78;
LABEL_81:
    v21 = 0;
    if ((*(_WORD *)&v19 & 0x400) != 0)
      goto LABEL_79;
LABEL_82:
    v22 = 0;
    goto LABEL_83;
  }
  v20 = 2654435761 * self->_collaborationInvitationURLExpirationDate;
  if ((*(_DWORD *)&v19 & 0x4000000) == 0)
    goto LABEL_81;
LABEL_78:
  v21 = 2654435761 * self->_collaborationJoinRequestPending;
  if ((*(_WORD *)&v19 & 0x400) == 0)
    goto LABEL_82;
LABEL_79:
  v22 = 2654435761 * self->_collaboratorStatus;
LABEL_83:
  v23 = v67 ^ v68 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ -[NSMutableArray hash](self->_childIdentifiers, "hash");
  return v23 ^ -[NSMutableArray hash](self->_items, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  MIPSmartPlaylistInfo *smartPlaylistInfo;
  uint64_t v7;
  uint64_t v8;
  MIPMultiverseIdentifier *parentIdentifier;
  uint64_t v10;
  MIPMultiverseIdentifier *geniusSeedTrackIdentifier;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 28))
    -[MIPPlaylist setName:](self, "setName:");
  v5 = *(_QWORD *)(v4 + 340);
  if ((v5 & 0x100) != 0)
  {
    self->_storeId = *((_QWORD *)v4 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
    v5 = *(_QWORD *)(v4 + 340);
    if ((v5 & 0x400000) == 0)
    {
LABEL_5:
      if ((v5 & 0x20000000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_5;
  }
  self->_type = *((_DWORD *)v4 + 81);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  if ((*(_QWORD *)(v4 + 340) & 0x20000000) != 0)
  {
LABEL_6:
    self->_hidden = v4[334];
    *(_QWORD *)&self->_has |= 0x20000000uLL;
  }
LABEL_7:
  smartPlaylistInfo = self->_smartPlaylistInfo;
  v7 = *((_QWORD *)v4 + 36);
  if (smartPlaylistInfo)
  {
    if (v7)
      -[MIPSmartPlaylistInfo mergeFrom:](smartPlaylistInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[MIPPlaylist setSmartPlaylistInfo:](self, "setSmartPlaylistInfo:");
  }
  v8 = *(_QWORD *)(v4 + 340);
  if ((v8 & 0x20000) != 0)
  {
    self->_sortType = *((_DWORD *)v4 + 74);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v8 = *(_QWORD *)(v4 + 340);
  }
  if ((v8 & 0x100000000) != 0)
  {
    self->_reversedSorting = v4[337];
    *(_QWORD *)&self->_has |= 0x100000000uLL;
  }
  parentIdentifier = self->_parentIdentifier;
  v10 = *((_QWORD *)v4 + 29);
  if (parentIdentifier)
  {
    if (v10)
      -[MIPMultiverseIdentifier mergeFrom:](parentIdentifier, "mergeFrom:");
  }
  else if (v10)
  {
    -[MIPPlaylist setParentIdentifier:](self, "setParentIdentifier:");
  }
  geniusSeedTrackIdentifier = self->_geniusSeedTrackIdentifier;
  v12 = *((_QWORD *)v4 + 25);
  if (geniusSeedTrackIdentifier)
  {
    if (v12)
      -[MIPMultiverseIdentifier mergeFrom:](geniusSeedTrackIdentifier, "mergeFrom:");
  }
  else if (v12)
  {
    -[MIPPlaylist setGeniusSeedTrackIdentifier:](self, "setGeniusSeedTrackIdentifier:");
  }
  if ((v4[341] & 8) != 0)
  {
    self->_distinguishedKind = *((_DWORD *)v4 + 42);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
  if (*((_QWORD *)v4 + 15))
    -[MIPPlaylist setCloudGlobalId:](self, "setCloudGlobalId:");
  v13 = *(_QWORD *)(v4 + 340);
  if ((v13 & 0x2000000) != 0)
  {
    self->_cloudIsSubscribed = v4[330];
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v13 = *(_QWORD *)(v4 + 340);
  }
  if ((v13 & 0x800000) != 0)
  {
    self->_cloudIsCuratorPlaylist = v4[328];
    *(_QWORD *)&self->_has |= 0x800000uLL;
  }
  if (*((_QWORD *)v4 + 23))
    -[MIPPlaylist setExternalVendorIdentifier:](self, "setExternalVendorIdentifier:");
  if (*((_QWORD *)v4 + 22))
    -[MIPPlaylist setExternalVendorDisplayName:](self, "setExternalVendorDisplayName:");
  if (*((_QWORD *)v4 + 24))
    -[MIPPlaylist setExternalVendorTag:](self, "setExternalVendorTag:");
  v14 = *(_QWORD *)(v4 + 340);
  if ((v14 & 0x10000000) != 0)
  {
    self->_externalVendorPlaylist = v4[333];
    *(_QWORD *)&self->_has |= 0x10000000uLL;
    v14 = *(_QWORD *)(v4 + 340);
    if ((v14 & 8) == 0)
    {
LABEL_45:
      if ((v14 & 0x80) == 0)
        goto LABEL_46;
      goto LABEL_121;
    }
  }
  else if ((v14 & 8) == 0)
  {
    goto LABEL_45;
  }
  self->_creationDateTime = *((_QWORD *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v14 = *(_QWORD *)(v4 + 340);
  if ((v14 & 0x80) == 0)
  {
LABEL_46:
    if ((v14 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_122;
  }
LABEL_121:
  self->_modificationDateTime = *((_QWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v14 = *(_QWORD *)(v4 + 340);
  if ((v14 & 0x10) == 0)
  {
LABEL_47:
    if ((v14 & 0x1000000) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_122:
  self->_lastPlayedDateTime = *((_QWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 340) & 0x1000000) != 0)
  {
LABEL_48:
    self->_cloudIsSharingDisabled = v4[329];
    *(_QWORD *)&self->_has |= 0x1000000uLL;
  }
LABEL_49:
  if (*((_QWORD *)v4 + 17))
    -[MIPPlaylist setCloudVersionHash:](self, "setCloudVersionHash:");
  if (*((_QWORD *)v4 + 10))
    -[MIPPlaylist setArtworkId:](self, "setArtworkId:");
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x1000) != 0)
  {
    self->_likedState = *((_DWORD *)v4 + 54);
    *(_QWORD *)&self->_has |= 0x1000uLL;
    v15 = *(_QWORD *)(v4 + 340);
    if ((v15 & 0x8000) == 0)
    {
LABEL_55:
      if ((v15 & 0x80000000) == 0)
        goto LABEL_56;
      goto LABEL_126;
    }
  }
  else if ((v15 & 0x8000) == 0)
  {
    goto LABEL_55;
  }
  self->_remoteSourceType = *((_DWORD *)v4 + 66);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x80000000) == 0)
  {
LABEL_56:
    if ((v15 & 0x8000000) == 0)
      goto LABEL_57;
    goto LABEL_127;
  }
LABEL_126:
  self->_owner = v4[336];
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x8000000) == 0)
  {
LABEL_57:
    if ((v15 & 0x2000) == 0)
      goto LABEL_58;
    goto LABEL_128;
  }
LABEL_127:
  self->_editable = v4[332];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x2000) == 0)
  {
LABEL_58:
    if ((v15 & 0x200000000) == 0)
      goto LABEL_59;
    goto LABEL_129;
  }
LABEL_128:
  self->_playCount = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x200000000) == 0)
  {
LABEL_59:
    if ((v15 & 0x400000000) == 0)
      goto LABEL_60;
    goto LABEL_130;
  }
LABEL_129:
  self->_shared = v4[338];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v15 = *(_QWORD *)(v4 + 340);
  if ((v15 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v15 & 1) == 0)
      goto LABEL_62;
    goto LABEL_61;
  }
LABEL_130:
  self->_visible = v4[339];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  if ((*(_QWORD *)(v4 + 340) & 1) != 0)
  {
LABEL_61:
    self->_authorStoreId = *((_QWORD *)v4 + 1);
    *(_QWORD *)&self->_has |= 1uLL;
  }
LABEL_62:
  if (*((_QWORD *)v4 + 11))
    -[MIPPlaylist setAuthorDisplayName:](self, "setAuthorDisplayName:");
  if (*((_QWORD *)v4 + 13))
    -[MIPPlaylist setAuthorStoreURL:](self, "setAuthorStoreURL:");
  if (*((_QWORD *)v4 + 12))
    -[MIPPlaylist setAuthorHandle:](self, "setAuthorHandle:");
  v16 = *(_QWORD *)(v4 + 340);
  if ((v16 & 0x40) != 0)
  {
    self->_minRefreshInterval = *((_QWORD *)v4 + 7);
    *(_QWORD *)&self->_has |= 0x40uLL;
    v16 = *(_QWORD *)(v4 + 340);
    if ((v16 & 2) == 0)
    {
LABEL_70:
      if ((v16 & 0x40000) == 0)
        goto LABEL_71;
      goto LABEL_134;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_70;
  }
  self->_cloudLastUpdateTime = *((_QWORD *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v16 = *(_QWORD *)(v4 + 340);
  if ((v16 & 0x40000) == 0)
  {
LABEL_71:
    if ((v16 & 0x100000) == 0)
      goto LABEL_72;
    goto LABEL_135;
  }
LABEL_134:
  self->_subscriberCount = *((_DWORD *)v4 + 75);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v16 = *(_QWORD *)(v4 + 340);
  if ((v16 & 0x100000) == 0)
  {
LABEL_72:
    if ((v16 & 0x80000) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_135:
  self->_subscriberPlayCount = *((_DWORD *)v4 + 77);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  if ((*(_QWORD *)(v4 + 340) & 0x80000) != 0)
  {
LABEL_73:
    self->_subscriberLikedCount = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_has |= 0x80000uLL;
  }
LABEL_74:
  if (*((_QWORD *)v4 + 39))
    -[MIPPlaylist setSubscriberURL:](self, "setSubscriberURL:");
  if (*((_QWORD *)v4 + 31))
    -[MIPPlaylist setPlaylistDescription:](self, "setPlaylistDescription:");
  if (*((_QWORD *)v4 + 16))
    -[MIPPlaylist setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  if ((v4[342] & 1) != 0)
  {
    self->_secondaryArtworkSourceType = *((_DWORD *)v4 + 70);
    *(_QWORD *)&self->_has |= 0x10000uLL;
  }
  if (*((_QWORD *)v4 + 34))
    -[MIPPlaylist setSecondaryArtworkId:](self, "setSecondaryArtworkId:");
  if ((v4[341] & 0x40) != 0)
  {
    self->_playlistCategoryTypeMask = *((_DWORD *)v4 + 61);
    *(_QWORD *)&self->_has |= 0x4000uLL;
  }
  if (*((_QWORD *)v4 + 32))
    -[MIPPlaylist setPlaylistGroupingSortKey:](self, "setPlaylistGroupingSortKey:");
  v17 = *(_QWORD *)(v4 + 340);
  if ((v17 & 0x20) != 0)
  {
    self->_likedStateChangedDate = *((_QWORD *)v4 + 6);
    *(_QWORD *)&self->_has |= 0x20uLL;
    v17 = *(_QWORD *)(v4 + 340);
  }
  if ((v17 & 0x200000) != 0)
  {
    self->_traits = *((_DWORD *)v4 + 80);
    *(_QWORD *)&self->_has |= 0x200000uLL;
  }
  if (*((_QWORD *)v4 + 20))
    -[MIPPlaylist setCoverArtworkRecipe:](self, "setCoverArtworkRecipe:");
  v18 = *(_QWORD *)(v4 + 340);
  if ((v18 & 0x40000000) != 0)
  {
    self->_isCollaborative = v4[335];
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v18 = *(_QWORD *)(v4 + 340);
  }
  if ((v18 & 0x200) != 0)
  {
    self->_collaborationMode = *((_DWORD *)v4 + 38);
    *(_QWORD *)&self->_has |= 0x200uLL;
  }
  if (*((_QWORD *)v4 + 18))
    -[MIPPlaylist setCollaborationInvitationURL:](self, "setCollaborationInvitationURL:");
  v19 = *(_QWORD *)(v4 + 340);
  if ((v19 & 4) != 0)
  {
    self->_collaborationInvitationURLExpirationDate = *((_QWORD *)v4 + 3);
    *(_QWORD *)&self->_has |= 4uLL;
    v19 = *(_QWORD *)(v4 + 340);
    if ((v19 & 0x4000000) == 0)
    {
LABEL_102:
      if ((v19 & 0x400) == 0)
        goto LABEL_104;
      goto LABEL_103;
    }
  }
  else if ((v19 & 0x4000000) == 0)
  {
    goto LABEL_102;
  }
  self->_collaborationJoinRequestPending = v4[331];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  if ((*(_QWORD *)(v4 + 340) & 0x400) != 0)
  {
LABEL_103:
    self->_collaboratorStatus = *((_DWORD *)v4 + 39);
    *(_QWORD *)&self->_has |= 0x400uLL;
  }
LABEL_104:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = *((id *)v4 + 14);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        -[MIPPlaylist addChildIdentifiers:](self, "addChildIdentifiers:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v22);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = *((id *)v4 + 26);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[MIPPlaylist addItems:](self, "addItems:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v27);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (MIPSmartPlaylistInfo)smartPlaylistInfo
{
  return self->_smartPlaylistInfo;
}

- (void)setSmartPlaylistInfo:(id)a3
{
  objc_storeStrong((id *)&self->_smartPlaylistInfo, a3);
}

- (BOOL)reversedSorting
{
  return self->_reversedSorting;
}

- (MIPMultiverseIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_parentIdentifier, a3);
}

- (MIPMultiverseIdentifier)geniusSeedTrackIdentifier
{
  return self->_geniusSeedTrackIdentifier;
}

- (void)setGeniusSeedTrackIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_geniusSeedTrackIdentifier, a3);
}

- (int)distinguishedKind
{
  return self->_distinguishedKind;
}

- (NSString)cloudGlobalId
{
  return self->_cloudGlobalId;
}

- (void)setCloudGlobalId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudGlobalId, a3);
}

- (BOOL)cloudIsSubscribed
{
  return self->_cloudIsSubscribed;
}

- (BOOL)cloudIsCuratorPlaylist
{
  return self->_cloudIsCuratorPlaylist;
}

- (NSString)externalVendorIdentifier
{
  return self->_externalVendorIdentifier;
}

- (void)setExternalVendorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalVendorIdentifier, a3);
}

- (NSString)externalVendorDisplayName
{
  return self->_externalVendorDisplayName;
}

- (void)setExternalVendorDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_externalVendorDisplayName, a3);
}

- (NSString)externalVendorTag
{
  return self->_externalVendorTag;
}

- (void)setExternalVendorTag:(id)a3
{
  objc_storeStrong((id *)&self->_externalVendorTag, a3);
}

- (BOOL)externalVendorPlaylist
{
  return self->_externalVendorPlaylist;
}

- (int64_t)creationDateTime
{
  return self->_creationDateTime;
}

- (int64_t)modificationDateTime
{
  return self->_modificationDateTime;
}

- (int64_t)lastPlayedDateTime
{
  return self->_lastPlayedDateTime;
}

- (BOOL)cloudIsSharingDisabled
{
  return self->_cloudIsSharingDisabled;
}

- (NSString)cloudVersionHash
{
  return self->_cloudVersionHash;
}

- (void)setCloudVersionHash:(id)a3
{
  objc_storeStrong((id *)&self->_cloudVersionHash, a3);
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setArtworkId:(id)a3
{
  objc_storeStrong((id *)&self->_artworkId, a3);
}

- (int)likedState
{
  return self->_likedState;
}

- (int)remoteSourceType
{
  return self->_remoteSourceType;
}

- (BOOL)owner
{
  return self->_owner;
}

- (BOOL)editable
{
  return self->_editable;
}

- (int)playCount
{
  return self->_playCount;
}

- (BOOL)shared
{
  return self->_shared;
}

- (BOOL)visible
{
  return self->_visible;
}

- (int64_t)authorStoreId
{
  return self->_authorStoreId;
}

- (NSString)authorDisplayName
{
  return self->_authorDisplayName;
}

- (void)setAuthorDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_authorDisplayName, a3);
}

- (NSString)authorStoreURL
{
  return self->_authorStoreURL;
}

- (void)setAuthorStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_authorStoreURL, a3);
}

- (NSString)authorHandle
{
  return self->_authorHandle;
}

- (void)setAuthorHandle:(id)a3
{
  objc_storeStrong((id *)&self->_authorHandle, a3);
}

- (int64_t)minRefreshInterval
{
  return self->_minRefreshInterval;
}

- (int64_t)cloudLastUpdateTime
{
  return self->_cloudLastUpdateTime;
}

- (int)subscriberCount
{
  return self->_subscriberCount;
}

- (int)subscriberPlayCount
{
  return self->_subscriberPlayCount;
}

- (int)subscriberLikedCount
{
  return self->_subscriberLikedCount;
}

- (NSString)subscriberURL
{
  return self->_subscriberURL;
}

- (void)setSubscriberURL:(id)a3
{
  objc_storeStrong((id *)&self->_subscriberURL, a3);
}

- (NSString)playlistDescription
{
  return self->_playlistDescription;
}

- (void)setPlaylistDescription:(id)a3
{
  objc_storeStrong((id *)&self->_playlistDescription, a3);
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, a3);
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

- (int)playlistCategoryTypeMask
{
  return self->_playlistCategoryTypeMask;
}

- (NSString)playlistGroupingSortKey
{
  return self->_playlistGroupingSortKey;
}

- (void)setPlaylistGroupingSortKey:(id)a3
{
  objc_storeStrong((id *)&self->_playlistGroupingSortKey, a3);
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (int)traits
{
  return self->_traits;
}

- (NSString)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (void)setCoverArtworkRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_coverArtworkRecipe, a3);
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (int)collaborationMode
{
  return self->_collaborationMode;
}

- (NSString)collaborationInvitationURL
{
  return self->_collaborationInvitationURL;
}

- (void)setCollaborationInvitationURL:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationInvitationURL, a3);
}

- (int64_t)collaborationInvitationURLExpirationDate
{
  return self->_collaborationInvitationURLExpirationDate;
}

- (BOOL)collaborationJoinRequestPending
{
  return self->_collaborationJoinRequestPending;
}

- (int)collaboratorStatus
{
  return self->_collaboratorStatus;
}

- (NSMutableArray)childIdentifiers
{
  return self->_childIdentifiers;
}

- (void)setChildIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_childIdentifiers, a3);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberURL, 0);
  objc_storeStrong((id *)&self->_smartPlaylistInfo, 0);
  objc_storeStrong((id *)&self->_secondaryArtworkId, 0);
  objc_storeStrong((id *)&self->_playlistGroupingSortKey, 0);
  objc_storeStrong((id *)&self->_playlistDescription, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_geniusSeedTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVendorTag, 0);
  objc_storeStrong((id *)&self->_externalVendorIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVendorDisplayName, 0);
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_collaborationInvitationURL, 0);
  objc_storeStrong((id *)&self->_cloudVersionHash, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_cloudGlobalId, 0);
  objc_storeStrong((id *)&self->_childIdentifiers, 0);
  objc_storeStrong((id *)&self->_authorStoreURL, 0);
  objc_storeStrong((id *)&self->_authorHandle, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);
  objc_storeStrong((id *)&self->_artworkId, 0);
}

+ (Class)childIdentifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

@end
