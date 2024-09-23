@implementation BMPBNowPlayingEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)playbackState
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_playbackState;
  else
    return 0;
}

- (void)setPlaybackState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPlaybackState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)playbackStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E26483F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaybackState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Playing")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Paused")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stopped")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Interrupted")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Seeking")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setElapsed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_elapsed = a3;
}

- (void)setHasElapsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasElapsed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (BOOL)hasITunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier != 0;
}

- (BOOL)hasITunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier != 0;
}

- (void)setIsAirPlayVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isAirPlayVideo = a3;
}

- (void)setHasIsAirPlayVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsAirPlayVideo
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)clearOutputDevices
{
  -[NSMutableArray removeAllObjects](self->_outputDevices, "removeAllObjects");
}

- (void)addOutputDevices:(id)a3
{
  id v4;
  NSMutableArray *outputDevices;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  outputDevices = self->_outputDevices;
  v8 = v4;
  if (!outputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_outputDevices;
    self->_outputDevices = v6;

    v4 = v8;
    outputDevices = self->_outputDevices;
  }
  -[NSMutableArray addObject:](outputDevices, "addObject:", v4);

}

- (unint64_t)outputDevicesCount
{
  return -[NSMutableArray count](self->_outputDevices, "count");
}

- (id)outputDevicesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_outputDevices, "objectAtIndex:", a3);
}

+ (Class)outputDevicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasITunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier != 0;
}

- (BOOL)hasITunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier != 0;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)setIsRemoteControl:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isRemoteControl = a3;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsRemoteControl
{
  return *(_BYTE *)&self->_has >> 7;
}

- (int)itemMediaType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_itemMediaType;
  else
    return 0;
}

- (void)setItemMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_itemMediaType = a3;
}

- (void)setHasItemMediaType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasItemMediaType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)itemMediaTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2648428[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsItemMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Video")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)itemMediaSubtype
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_itemMediaSubtype;
  else
    return 0;
}

- (void)setItemMediaSubtype:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_itemMediaSubtype = a3;
}

- (void)setHasItemMediaSubtype:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasItemMediaSubtype
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)itemMediaSubtypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E2648440[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsItemMediaSubtype:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVShow")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audiobook")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITunesU")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeMedia")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)BMPBNowPlayingEvent;
  -[BMPBNowPlayingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBNowPlayingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueId;
  char has;
  void *v7;
  uint64_t playbackState;
  __CFString *v9;
  NSString *album;
  NSString *artist;
  void *v12;
  NSString *genre;
  NSString *title;
  void *v15;
  NSString *mediaType;
  NSString *iTunesStoreIdentifier;
  NSString *iTunesSubscriptionIdentifier;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSString *bundleId;
  NSString *iTunesArtistIdentifier;
  NSString *iTunesAlbumIdentifier;
  NSString *groupIdentifier;
  $56AC58F426FB8D41CCD147728CED693B v31;
  void *v32;
  uint64_t itemMediaType;
  __CFString *v34;
  uint64_t itemMediaSubtype;
  __CFString *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    playbackState = self->_playbackState;
    if (playbackState >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_playbackState);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E26483F8[playbackState];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("playbackState"));

  }
  album = self->_album;
  if (album)
    objc_msgSend(v4, "setObject:forKey:", album, CFSTR("album"));
  artist = self->_artist;
  if (artist)
    objc_msgSend(v4, "setObject:forKey:", artist, CFSTR("artist"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("duration"));

  }
  genre = self->_genre;
  if (genre)
    objc_msgSend(v4, "setObject:forKey:", genre, CFSTR("genre"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_elapsed);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("elapsed"));

  }
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v4, "setObject:forKey:", mediaType, CFSTR("mediaType"));
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  if (iTunesStoreIdentifier)
    objc_msgSend(v4, "setObject:forKey:", iTunesStoreIdentifier, CFSTR("iTunesStoreIdentifier"));
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  if (iTunesSubscriptionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", iTunesSubscriptionIdentifier, CFSTR("iTunesSubscriptionIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAirPlayVideo);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("isAirPlayVideo"));

  }
  if (-[NSMutableArray count](self->_outputDevices, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_outputDevices, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v21 = self->_outputDevices;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("outputDevices"));
  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  if (iTunesArtistIdentifier)
    objc_msgSend(v4, "setObject:forKey:", iTunesArtistIdentifier, CFSTR("iTunesArtistIdentifier"));
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  if (iTunesAlbumIdentifier)
    objc_msgSend(v4, "setObject:forKey:", iTunesAlbumIdentifier, CFSTR("iTunesAlbumIdentifier"));
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemoteControl);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("isRemoteControl"));

    *(_BYTE *)&v31 = self->_has;
    if ((*(_BYTE *)&v31 & 0x10) == 0)
    {
LABEL_49:
      if ((*(_BYTE *)&v31 & 8) == 0)
        return v4;
      goto LABEL_56;
    }
  }
  else if ((*(_BYTE *)&v31 & 0x10) == 0)
  {
    goto LABEL_49;
  }
  itemMediaType = self->_itemMediaType;
  if (itemMediaType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_itemMediaType);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E2648428[itemMediaType];
  }
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("itemMediaType"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_56:
    itemMediaSubtype = self->_itemMediaSubtype;
    if (itemMediaSubtype >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_itemMediaSubtype);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E2648440[itemMediaSubtype];
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("itemMediaSubtype"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNowPlayingEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $56AC58F426FB8D41CCD147728CED693B v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_album)
    PBDataWriterWriteStringField();
  if (self->_artist)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_genre)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_mediaType)
    PBDataWriterWriteStringField();
  if (self->_iTunesStoreIdentifier)
    PBDataWriterWriteStringField();
  if (self->_iTunesSubscriptionIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_outputDevices;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (self->_bundleId)
    PBDataWriterWriteStringField();
  if (self->_iTunesArtistIdentifier)
    PBDataWriterWriteStringField();
  if (self->_iTunesAlbumIdentifier)
    PBDataWriterWriteStringField();
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  PBDataWriterWriteBOOLField();
  *(_BYTE *)&v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
LABEL_44:
    PBDataWriterWriteInt32Field();
    *(_BYTE *)&v11 = self->_has;
  }
LABEL_45:
  if ((*(_BYTE *)&v11 & 8) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE *v10;
  $56AC58F426FB8D41CCD147728CED693B v11;
  _BYTE *v12;

  v4 = a3;
  v12 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    v4[148] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_playbackState;
    v4[148] |= 0x20u;
  }
  if (self->_album)
  {
    objc_msgSend(v12, "setAlbum:");
    v4 = v12;
  }
  if (self->_artist)
  {
    objc_msgSend(v12, "setArtist:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_duration;
    v4[148] |= 2u;
  }
  if (self->_genre)
  {
    objc_msgSend(v12, "setGenre:");
    v4 = v12;
  }
  if (self->_title)
  {
    objc_msgSend(v12, "setTitle:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_elapsed;
    v4[148] |= 4u;
  }
  if (self->_mediaType)
    objc_msgSend(v12, "setMediaType:");
  if (self->_iTunesStoreIdentifier)
    objc_msgSend(v12, "setITunesStoreIdentifier:");
  if (self->_iTunesSubscriptionIdentifier)
    objc_msgSend(v12, "setITunesSubscriptionIdentifier:");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v12[144] = self->_isAirPlayVideo;
    v12[148] |= 0x40u;
  }
  if (-[BMPBNowPlayingEvent outputDevicesCount](self, "outputDevicesCount"))
  {
    objc_msgSend(v12, "clearOutputDevices");
    v6 = -[BMPBNowPlayingEvent outputDevicesCount](self, "outputDevicesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BMPBNowPlayingEvent outputDevicesAtIndex:](self, "outputDevicesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addOutputDevices:", v9);

      }
    }
  }
  if (self->_bundleId)
    objc_msgSend(v12, "setBundleId:");
  v10 = v12;
  if (self->_iTunesArtistIdentifier)
  {
    objc_msgSend(v12, "setITunesArtistIdentifier:");
    v10 = v12;
  }
  if (self->_iTunesAlbumIdentifier)
  {
    objc_msgSend(v12, "setITunesAlbumIdentifier:");
    v10 = v12;
  }
  if (self->_groupIdentifier)
  {
    objc_msgSend(v12, "setGroupIdentifier:");
    v10 = v12;
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  v10[145] = self->_isRemoteControl;
  v10[148] |= 0x80u;
  *(_BYTE *)&v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
LABEL_41:
    *((_DWORD *)v10 + 25) = self->_itemMediaType;
    v10[148] |= 0x10u;
    *(_BYTE *)&v11 = self->_has;
  }
LABEL_42:
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    *((_DWORD *)v10 + 24) = self->_itemMediaSubtype;
    v10[148] |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  $56AC58F426FB8D41CCD147728CED693B v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 148) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_playbackState;
    *(_BYTE *)(v5 + 148) |= 0x20u;
  }
  v9 = -[NSString copyWithZone:](self->_album, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_artist, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_duration;
    *(_BYTE *)(v5 + 148) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v15;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_elapsed;
    *(_BYTE *)(v5 + 148) |= 4u;
  }
  v17 = -[NSString copyWithZone:](self->_mediaType, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v17;

  v19 = -[NSString copyWithZone:](self->_iTunesStoreIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v19;

  v21 = -[NSString copyWithZone:](self->_iTunesSubscriptionIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v21;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_isAirPlayVideo;
    *(_BYTE *)(v5 + 148) |= 0x40u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = self->_outputDevices;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v39);
        objc_msgSend((id)v5, "addOutputDevices:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v25);
  }

  v29 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v29;

  v31 = -[NSString copyWithZone:](self->_iTunesArtistIdentifier, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v31;

  v33 = -[NSString copyWithZone:](self->_iTunesAlbumIdentifier, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v33;

  v35 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v35;

  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v37 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  *(_BYTE *)(v5 + 145) = self->_isRemoteControl;
  *(_BYTE *)(v5 + 148) |= 0x80u;
  *(_BYTE *)&v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x10) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 100) = self->_itemMediaType;
    *(_BYTE *)(v5 + 148) |= 0x10u;
    *(_BYTE *)&v37 = self->_has;
  }
LABEL_21:
  if ((*(_BYTE *)&v37 & 8) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_itemMediaSubtype;
    *(_BYTE *)(v5 + 148) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *album;
  NSString *artist;
  NSString *genre;
  NSString *title;
  NSString *mediaType;
  NSString *iTunesStoreIdentifier;
  NSString *iTunesSubscriptionIdentifier;
  NSMutableArray *outputDevices;
  NSString *bundleId;
  NSString *iTunesArtistIdentifier;
  NSString *iTunesAlbumIdentifier;
  NSString *groupIdentifier;
  $56AC58F426FB8D41CCD147728CED693B has;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_73;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_73;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_73;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_73;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x20) == 0 || self->_playbackState != *((_DWORD *)v4 + 30))
      goto LABEL_73;
  }
  else if ((*((_BYTE *)v4 + 148) & 0x20) != 0)
  {
    goto LABEL_73;
  }
  album = self->_album;
  if ((unint64_t)album | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](album, "isEqual:"))
    goto LABEL_73;
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](artist, "isEqual:"))
      goto LABEL_73;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 10))
      goto LABEL_73;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_73;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](genre, "isEqual:"))
    goto LABEL_73;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_73;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0 || self->_elapsed != *((_DWORD *)v4 + 11))
      goto LABEL_73;
  }
  else if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    goto LABEL_73;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](mediaType, "isEqual:"))
    goto LABEL_73;
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  if ((unint64_t)iTunesStoreIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](iTunesStoreIdentifier, "isEqual:"))
      goto LABEL_73;
  }
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  if ((unint64_t)iTunesSubscriptionIdentifier | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](iTunesSubscriptionIdentifier, "isEqual:"))
      goto LABEL_73;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x40) == 0)
      goto LABEL_73;
    if (self->_isAirPlayVideo)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_73;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_73;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x40) != 0)
  {
    goto LABEL_73;
  }
  outputDevices = self->_outputDevices;
  if ((unint64_t)outputDevices | *((_QWORD *)v4 + 14)
    && !-[NSMutableArray isEqual:](outputDevices, "isEqual:"))
  {
    goto LABEL_73;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_73;
  }
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  if ((unint64_t)iTunesArtistIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](iTunesArtistIdentifier, "isEqual:"))
      goto LABEL_73;
  }
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  if ((unint64_t)iTunesAlbumIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](iTunesAlbumIdentifier, "isEqual:"))
      goto LABEL_73;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:"))
      goto LABEL_73;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x80) == 0)
      goto LABEL_58;
LABEL_73:
    v19 = 0;
    goto LABEL_74;
  }
  if ((*((_BYTE *)v4 + 148) & 0x80) == 0)
    goto LABEL_73;
  if (self->_isRemoteControl)
  {
    if (!*((_BYTE *)v4 + 145))
      goto LABEL_73;
  }
  else if (*((_BYTE *)v4 + 145))
  {
    goto LABEL_73;
  }
LABEL_58:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x10) == 0 || self->_itemMediaType != *((_DWORD *)v4 + 25))
      goto LABEL_73;
  }
  else if ((*((_BYTE *)v4 + 148) & 0x10) != 0)
  {
    goto LABEL_73;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 8) == 0 || self->_itemMediaSubtype != *((_DWORD *)v4 + 24))
      goto LABEL_73;
    v19 = 1;
  }
  else
  {
    v19 = (*((_BYTE *)v4 + 148) & 8) == 0;
  }
LABEL_74:

  return v19;
}

- (unint64_t)hash
{
  char has;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  unint64_t v29;
  NSUInteger v30;

  v30 = -[NSString hash](self->_uniqueId, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v8 += (unint64_t)v7;
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
    v29 = v8;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v29 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v28 = 2654435761 * self->_playbackState;
      goto LABEL_12;
    }
  }
  v28 = 0;
LABEL_12:
  v27 = -[NSString hash](self->_album, "hash");
  v26 = -[NSString hash](self->_artist, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v25 = 2654435761 * self->_duration;
  else
    v25 = 0;
  v24 = -[NSString hash](self->_genre, "hash");
  v23 = -[NSString hash](self->_title, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v22 = 2654435761 * self->_elapsed;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_mediaType, "hash");
  v9 = -[NSString hash](self->_iTunesStoreIdentifier, "hash");
  v10 = -[NSString hash](self->_iTunesSubscriptionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v11 = 2654435761 * self->_isAirPlayVideo;
  else
    v11 = 0;
  v12 = -[NSMutableArray hash](self->_outputDevices, "hash");
  v13 = -[NSString hash](self->_bundleId, "hash");
  v14 = -[NSString hash](self->_iTunesArtistIdentifier, "hash");
  v15 = -[NSString hash](self->_iTunesAlbumIdentifier, "hash");
  v16 = -[NSString hash](self->_groupIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    v17 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_23;
LABEL_26:
    v18 = 2654435761 * self->_itemMediaType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_24;
LABEL_27:
    v19 = 0;
    return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  v17 = 2654435761 * self->_isRemoteControl;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    goto LABEL_26;
LABEL_23:
  v18 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_27;
LABEL_24:
  v19 = 2654435761 * self->_itemMediaSubtype;
  return v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 17))
    -[BMPBNowPlayingEvent setUniqueId:](self, "setUniqueId:");
  v5 = v4[148];
  if ((v5 & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[148];
  }
  if ((v5 & 0x20) != 0)
  {
    self->_playbackState = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 2))
    -[BMPBNowPlayingEvent setAlbum:](self, "setAlbum:");
  if (*((_QWORD *)v4 + 3))
    -[BMPBNowPlayingEvent setArtist:](self, "setArtist:");
  if ((v4[148] & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[BMPBNowPlayingEvent setGenre:](self, "setGenre:");
  if (*((_QWORD *)v4 + 16))
    -[BMPBNowPlayingEvent setTitle:](self, "setTitle:");
  if ((v4[148] & 4) != 0)
  {
    self->_elapsed = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 13))
    -[BMPBNowPlayingEvent setMediaType:](self, "setMediaType:");
  if (*((_QWORD *)v4 + 10))
    -[BMPBNowPlayingEvent setITunesStoreIdentifier:](self, "setITunesStoreIdentifier:");
  if (*((_QWORD *)v4 + 11))
    -[BMPBNowPlayingEvent setITunesSubscriptionIdentifier:](self, "setITunesSubscriptionIdentifier:");
  if ((v4[148] & 0x40) != 0)
  {
    self->_isAirPlayVideo = v4[144];
    *(_BYTE *)&self->_has |= 0x40u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 14);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[BMPBNowPlayingEvent addOutputDevices:](self, "addOutputDevices:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 4))
    -[BMPBNowPlayingEvent setBundleId:](self, "setBundleId:");
  if (*((_QWORD *)v4 + 9))
    -[BMPBNowPlayingEvent setITunesArtistIdentifier:](self, "setITunesArtistIdentifier:");
  if (*((_QWORD *)v4 + 8))
    -[BMPBNowPlayingEvent setITunesAlbumIdentifier:](self, "setITunesAlbumIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[BMPBNowPlayingEvent setGroupIdentifier:](self, "setGroupIdentifier:");
  v11 = v4[148];
  if ((v11 & 0x80000000) == 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  self->_isRemoteControl = v4[145];
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v11) = v4[148];
  if ((v11 & 0x10) != 0)
  {
LABEL_44:
    self->_itemMediaType = *((_DWORD *)v4 + 25);
    *(_BYTE *)&self->_has |= 0x10u;
    LOBYTE(v11) = v4[148];
  }
LABEL_45:
  if ((v11 & 8) != 0)
  {
    self->_itemMediaSubtype = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, a3);
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (void)setITunesSubscriptionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, a3);
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (NSMutableArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setOutputDevices:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevices, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (void)setITunesArtistIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, a3);
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (void)setITunesAlbumIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
