@implementation _MRNowPlayingInfoProtobuf

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setElapsedTime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_elapsedTime = a3;
}

- (void)setHasElapsedTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasElapsedTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPlaybackRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_playbackRate = a3;
}

- (void)setHasPlaybackRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaybackRate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)repeatMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_repeatMode;
  else
    return 0;
}

- (void)setRepeatMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRepeatMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CD290[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("One")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("All")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)shuffleMode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_shuffleMode;
  else
    return 0;
}

- (void)setShuffleMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CD2B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Albums")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Songs")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setUniqueIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasUniqueIdentifier
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsExplicitTrack:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isExplicitTrack = a3;
}

- (void)setHasIsExplicitTrack:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsExplicitTrack
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsMusicApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isMusicApp = a3;
}

- (void)setHasIsMusicApp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsMusicApp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRadioStationIdentifier:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_radioStationIdentifier = a3;
}

- (void)setHasRadioStationIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRadioStationIdentifier
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasRadioStationHash
{
  return self->_radioStationHash != 0;
}

- (BOOL)hasRadioStationName
{
  return self->_radioStationName != 0;
}

- (BOOL)hasArtworkDataDigest
{
  return self->_artworkDataDigest != 0;
}

- (void)setIsAlwaysLive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isAlwaysLive = a3;
}

- (void)setHasIsAlwaysLive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAlwaysLive
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsAdvertisement:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isAdvertisement = a3;
}

- (void)setHasIsAdvertisement:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsAdvertisement
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsInTransition:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isInTransition = a3;
}

- (void)setHasIsInTransition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsInTransition
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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
  v8.super_class = (Class)_MRNowPlayingInfoProtobuf;
  -[_MRNowPlayingInfoProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRNowPlayingInfoProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *album;
  NSString *artist;
  __int16 has;
  void *v9;
  NSString *title;
  __int16 v11;
  void *v12;
  NSString *radioStationHash;
  NSString *radioStationName;
  NSData *artworkDataDigest;
  __int16 v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t repeatMode;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t shuffleMode;
  __CFString *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  album = self->_album;
  if (album)
    objc_msgSend(v3, "setObject:forKey:", album, CFSTR("album"));
  artist = self->_artist;
  if (artist)
    objc_msgSend(v5, "setObject:forKey:", artist, CFSTR("artist"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("duration"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_elapsedTime);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("elapsedTime"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&v4 = self->_playbackRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("playbackRate"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_33:
  repeatMode = self->_repeatMode;
  if (repeatMode >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_repeatMode);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E30CD290[repeatMode];
  }
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("repeatMode"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_44:
  shuffleMode = self->_shuffleMode;
  if (shuffleMode >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_shuffleMode);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_1E30CD2B0[shuffleMode];
  }
  objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("shuffleMode"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
LABEL_12:
  title = self->_title;
  if (title)
    objc_msgSend(v5, "setObject:forKey:", title, CFSTR("title"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uniqueIdentifier);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("uniqueIdentifier"));

    v11 = (__int16)self->_has;
    if ((v11 & 0x400) == 0)
    {
LABEL_16:
      if ((v11 & 0x1000) == 0)
        goto LABEL_17;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExplicitTrack);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("isExplicitTrack"));

  v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_17:
    if ((v11 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMusicApp);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("isMusicApp"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_radioStationIdentifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("radioStationIdentifier"));

  }
LABEL_19:
  radioStationHash = self->_radioStationHash;
  if (radioStationHash)
    objc_msgSend(v5, "setObject:forKey:", radioStationHash, CFSTR("radioStationHash"));
  radioStationName = self->_radioStationName;
  if (radioStationName)
    objc_msgSend(v5, "setObject:forKey:", radioStationName, CFSTR("radioStationName"));
  artworkDataDigest = self->_artworkDataDigest;
  if (artworkDataDigest)
    objc_msgSend(v5, "setObject:forKey:", artworkDataDigest, CFSTR("artworkDataDigest"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_27;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAdvertisement);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("isAdvertisement"));

    if ((*(_WORD *)&self->_has & 0x800) == 0)
      return v5;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAlwaysLive);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("isAlwaysLive"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
    goto LABEL_40;
LABEL_27:
  if ((v16 & 0x800) != 0)
  {
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInTransition);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("isInTransition"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_album)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_artist)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
LABEL_12:
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0)
        goto LABEL_17;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
LABEL_19:
  if (self->_radioStationHash)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_radioStationName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_artworkDataDigest)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_27;
LABEL_41:
    PBDataWriterWriteBOOLField();
    v4 = v8;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
    goto LABEL_41;
LABEL_27:
  if ((v7 & 0x800) != 0)
  {
LABEL_28:
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
LABEL_29:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_album)
  {
    objc_msgSend(v4, "setAlbum:");
    v4 = v8;
  }
  if (self->_artist)
  {
    objc_msgSend(v8, "setArtist:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_duration;
    *((_WORD *)v4 + 60) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_elapsedTime;
  *((_WORD *)v4 + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 18) = LODWORD(self->_playbackRate);
  *((_WORD *)v4 + 60) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 24) = self->_repeatMode;
  *((_WORD *)v4 + 60) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_34:
  *((_DWORD *)v4 + 25) = self->_shuffleMode;
  *((_WORD *)v4 + 60) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_timestamp;
    *((_WORD *)v4 + 60) |= 8u;
  }
LABEL_12:
  if (self->_title)
  {
    objc_msgSend(v8, "setTitle:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = self->_uniqueIdentifier;
    *((_WORD *)v4 + 60) |= 0x10u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0)
        goto LABEL_17;
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((_BYTE *)v4 + 114) = self->_isExplicitTrack;
  *((_WORD *)v4 + 60) |= 0x400u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_38:
  *((_BYTE *)v4 + 116) = self->_isMusicApp;
  *((_WORD *)v4 + 60) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_18:
    *((_QWORD *)v4 + 3) = self->_radioStationIdentifier;
    *((_WORD *)v4 + 60) |= 4u;
  }
LABEL_19:
  if (self->_radioStationHash)
  {
    objc_msgSend(v8, "setRadioStationHash:");
    v4 = v8;
  }
  if (self->_radioStationName)
  {
    objc_msgSend(v8, "setRadioStationName:");
    v4 = v8;
  }
  if (self->_artworkDataDigest)
  {
    objc_msgSend(v8, "setArtworkDataDigest:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_27;
LABEL_41:
    *((_BYTE *)v4 + 112) = self->_isAdvertisement;
    *((_WORD *)v4 + 60) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  *((_BYTE *)v4 + 113) = self->_isAlwaysLive;
  *((_WORD *)v4 + 60) |= 0x200u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
    goto LABEL_41;
LABEL_27:
  if ((v7 & 0x800) != 0)
  {
LABEL_28:
    *((_BYTE *)v4 + 115) = self->_isInTransition;
    *((_WORD *)v4 + 60) |= 0x800u;
  }
LABEL_29:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 has;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int16 v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_album, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_artist, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_WORD *)(v5 + 120) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_elapsedTime;
  *(_WORD *)(v5 + 120) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *(float *)(v5 + 72) = self->_playbackRate;
  *(_WORD *)(v5 + 120) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 96) = self->_repeatMode;
  *(_WORD *)(v5 + 120) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_22:
  *(_DWORD *)(v5 + 100) = self->_shuffleMode;
  *(_WORD *)(v5 + 120) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(double *)(v5 + 32) = self->_timestamp;
    *(_WORD *)(v5 + 120) |= 8u;
  }
LABEL_8:
  v11 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_uniqueIdentifier;
    *(_WORD *)(v5 + 120) |= 0x10u;
    v13 = (__int16)self->_has;
    if ((v13 & 0x400) == 0)
    {
LABEL_10:
      if ((v13 & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 114) = self->_isExplicitTrack;
  *(_WORD *)(v5 + 120) |= 0x400u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_11:
    if ((v13 & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  *(_BYTE *)(v5 + 116) = self->_isMusicApp;
  *(_WORD *)(v5 + 120) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 24) = self->_radioStationIdentifier;
    *(_WORD *)(v5 + 120) |= 4u;
  }
LABEL_13:
  v14 = -[NSString copyWithZone:](self->_radioStationHash, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v16 = -[NSString copyWithZone:](self->_radioStationName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  v18 = -[NSData copyWithZone:](self->_artworkDataDigest, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = (__int16)self->_has;
  if ((v20 & 0x200) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_15;
LABEL_29:
    *(_BYTE *)(v5 + 112) = self->_isAdvertisement;
    *(_WORD *)(v5 + 120) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x800) == 0)
      return (id)v5;
    goto LABEL_16;
  }
  *(_BYTE *)(v5 + 113) = self->_isAlwaysLive;
  *(_WORD *)(v5 + 120) |= 0x200u;
  v20 = (__int16)self->_has;
  if ((v20 & 0x100) != 0)
    goto LABEL_29;
LABEL_15:
  if ((v20 & 0x800) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 115) = self->_isInTransition;
    *(_WORD *)(v5 + 120) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *album;
  NSString *artist;
  __int16 has;
  __int16 v8;
  NSString *title;
  __int16 v10;
  NSString *radioStationHash;
  NSString *radioStationName;
  NSData *artworkDataDigest;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_90;
  album = self->_album;
  if ((unint64_t)album | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](album, "isEqual:"))
      goto LABEL_90;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](artist, "isEqual:"))
      goto LABEL_90;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 60);
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_90;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_elapsedTime != *((double *)v4 + 2))
      goto LABEL_90;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_playbackRate != *((float *)v4 + 18))
      goto LABEL_90;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_repeatMode != *((_DWORD *)v4 + 24))
      goto LABEL_90;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 25))
      goto LABEL_90;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_timestamp != *((double *)v4 + 4))
      goto LABEL_90;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_90;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_90;
    has = (__int16)self->_has;
  }
  v10 = *((_WORD *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_uniqueIdentifier != *((_QWORD *)v4 + 5))
      goto LABEL_90;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x400) == 0)
      goto LABEL_90;
    if (self->_isExplicitTrack)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x1000) == 0)
      goto LABEL_90;
    if (self->_isMusicApp)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x1000) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_radioStationIdentifier != *((_QWORD *)v4 + 3))
      goto LABEL_90;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_90;
  }
  radioStationHash = self->_radioStationHash;
  if ((unint64_t)radioStationHash | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](radioStationHash, "isEqual:"))
  {
    goto LABEL_90;
  }
  radioStationName = self->_radioStationName;
  if ((unint64_t)radioStationName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](radioStationName, "isEqual:"))
      goto LABEL_90;
  }
  artworkDataDigest = self->_artworkDataDigest;
  if ((unint64_t)artworkDataDigest | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](artworkDataDigest, "isEqual:"))
      goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x200) == 0)
      goto LABEL_90;
    if (self->_isAlwaysLive)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x100) == 0)
      goto LABEL_90;
    if (self->_isAdvertisement)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x800) != 0)
    {
      if (self->_isInTransition)
      {
        if (!*((_BYTE *)v4 + 115))
          goto LABEL_90;
      }
      else if (*((_BYTE *)v4 + 115))
      {
        goto LABEL_90;
      }
      v14 = 1;
      goto LABEL_91;
    }
LABEL_90:
    v14 = 0;
    goto LABEL_91;
  }
  v14 = (*((_WORD *)v4 + 60) & 0x800) == 0;
LABEL_91:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double duration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double elapsedTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float playbackRate;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  double timestamp;
  double v21;
  long double v22;
  double v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  NSUInteger v42;
  NSUInteger v43;

  v43 = -[NSString hash](self->_album, "hash");
  v42 = -[NSString hash](self->_artist, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    duration = self->_duration;
    v6 = -duration;
    if (duration >= 0.0)
      v6 = self->_duration;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    elapsedTime = self->_elapsedTime;
    v11 = -elapsedTime;
    if (elapsedTime >= 0.0)
      v11 = self->_elapsedTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x20) != 0)
  {
    playbackRate = self->_playbackRate;
    v16 = -playbackRate;
    if (playbackRate >= 0.0)
      v16 = self->_playbackRate;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x40) != 0)
  {
    v39 = 2654435761 * self->_repeatMode;
    if ((has & 0x80) != 0)
      goto LABEL_27;
  }
  else
  {
    v39 = 0;
    if ((has & 0x80) != 0)
    {
LABEL_27:
      v38 = 2654435761 * self->_shuffleMode;
      goto LABEL_30;
    }
  }
  v38 = 0;
LABEL_30:
  v40 = v14;
  v41 = v4;
  if ((has & 8) != 0)
  {
    timestamp = self->_timestamp;
    v21 = -timestamp;
    if (timestamp >= 0.0)
      v21 = self->_timestamp;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v37 = -[NSString hash](self->_title, "hash");
  v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0)
  {
    v35 = 2654435761u * self->_uniqueIdentifier;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_40:
      v25 = 2654435761 * self->_isExplicitTrack;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_41;
LABEL_45:
      v26 = 0;
      if ((v24 & 4) != 0)
        goto LABEL_42;
      goto LABEL_46;
    }
  }
  else
  {
    v35 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_40;
  }
  v25 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_45;
LABEL_41:
  v26 = 2654435761 * self->_isMusicApp;
  if ((v24 & 4) != 0)
  {
LABEL_42:
    v27 = 2654435761 * self->_radioStationIdentifier;
    goto LABEL_47;
  }
LABEL_46:
  v27 = 0;
LABEL_47:
  v28 = -[NSString hash](self->_radioStationHash, "hash", v35);
  v29 = -[NSString hash](self->_radioStationName, "hash");
  v30 = -[NSData hash](self->_artworkDataDigest, "hash");
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    v31 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_49;
LABEL_52:
    v32 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_50;
LABEL_53:
    v33 = 0;
    return v42 ^ v43 ^ v41 ^ v9 ^ v40 ^ v39 ^ v38 ^ v19 ^ v37 ^ v36 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
  }
  v31 = 2654435761 * self->_isAlwaysLive;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_52;
LABEL_49:
  v32 = 2654435761 * self->_isAdvertisement;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_53;
LABEL_50:
  v33 = 2654435761 * self->_isInTransition;
  return v42 ^ v43 ^ v41 ^ v9 ^ v40 ^ v39 ^ v38 ^ v19 ^ v37 ^ v36 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[_MRNowPlayingInfoProtobuf setAlbum:](self, "setAlbum:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[_MRNowPlayingInfoProtobuf setArtist:](self, "setArtist:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 60);
  if ((v5 & 1) != 0)
  {
    self->_duration = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_elapsedTime = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  self->_playbackRate = *((float *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  self->_repeatMode = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 60);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_34:
  self->_shuffleMode = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 60) & 8) != 0)
  {
LABEL_11:
    self->_timestamp = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 13))
  {
    -[_MRNowPlayingInfoProtobuf setTitle:](self, "setTitle:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_uniqueIdentifier = *((_QWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)v4 + 60);
    if ((v6 & 0x400) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0)
        goto LABEL_17;
      goto LABEL_38;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) == 0)
  {
    goto LABEL_16;
  }
  self->_isExplicitTrack = *((_BYTE *)v4 + 114);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 60);
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_38:
  self->_isMusicApp = *((_BYTE *)v4 + 116);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 60) & 4) != 0)
  {
LABEL_18:
    self->_radioStationIdentifier = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 10))
  {
    -[_MRNowPlayingInfoProtobuf setRadioStationHash:](self, "setRadioStationHash:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[_MRNowPlayingInfoProtobuf setRadioStationName:](self, "setRadioStationName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[_MRNowPlayingInfoProtobuf setArtworkDataDigest:](self, "setArtworkDataDigest:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 60);
  if ((v7 & 0x200) == 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x100) == 0)
      goto LABEL_27;
LABEL_41:
    self->_isAdvertisement = *((_BYTE *)v4 + 112);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v4 + 60) & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  self->_isAlwaysLive = *((_BYTE *)v4 + 113);
  *(_WORD *)&self->_has |= 0x200u;
  v7 = *((_WORD *)v4 + 60);
  if ((v7 & 0x100) != 0)
    goto LABEL_41;
LABEL_27:
  if ((v7 & 0x800) != 0)
  {
LABEL_28:
    self->_isInTransition = *((_BYTE *)v4 + 115);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_29:

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

- (double)duration
{
  return self->_duration;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isExplicitTrack
{
  return self->_isExplicitTrack;
}

- (BOOL)isMusicApp
{
  return self->_isMusicApp;
}

- (int64_t)radioStationIdentifier
{
  return self->_radioStationIdentifier;
}

- (NSString)radioStationHash
{
  return self->_radioStationHash;
}

- (void)setRadioStationHash:(id)a3
{
  objc_storeStrong((id *)&self->_radioStationHash, a3);
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (void)setRadioStationName:(id)a3
{
  objc_storeStrong((id *)&self->_radioStationName, a3);
}

- (NSData)artworkDataDigest
{
  return self->_artworkDataDigest;
}

- (void)setArtworkDataDigest:(id)a3
{
  objc_storeStrong((id *)&self->_artworkDataDigest, a3);
}

- (BOOL)isAlwaysLive
{
  return self->_isAlwaysLive;
}

- (BOOL)isAdvertisement
{
  return self->_isAdvertisement;
}

- (BOOL)isInTransition
{
  return self->_isInTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_radioStationName, 0);
  objc_storeStrong((id *)&self->_radioStationHash, 0);
  objc_storeStrong((id *)&self->_artworkDataDigest, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
