@implementation MIPMovie

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setVideoQuality:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoQuality = a3;
}

- (void)setHasVideoQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVideoQuality
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRental:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_rental = a3;
}

- (void)setHasRental:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasRental
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasChapterData:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_hasChapterData = a3;
}

- (void)setHasHasChapterData:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasHasChapterData
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasExtendedContentName
{
  return self->_extendedContentName != 0;
}

- (BOOL)hasMovieInfo
{
  return self->_movieInfo != 0;
}

- (void)setHasAlternateAudio:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_hasAlternateAudio = a3;
}

- (void)setHasHasAlternateAudio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHasAlternateAudio
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasSubtitles:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_hasSubtitles = a3;
}

- (void)setHasHasSubtitles:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasHasSubtitles
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAudioLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_audioLanguage = a3;
}

- (void)setHasAudioLanguage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAudioLanguage
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAudioTrackIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_audioTrackIndex = a3;
}

- (void)setHasAudioTrackIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAudioTrackIndex
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAudioTrackId:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_audioTrackId = a3;
}

- (void)setHasAudioTrackId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAudioTrackId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSubtitleLanguage:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subtitleLanguage = a3;
}

- (void)setHasSubtitleLanguage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubtitleLanguage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSubtitleTrackIndex:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subtitleTrackIndex = a3;
}

- (void)setHasSubtitleTrackIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubtitleTrackIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRentalDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rentalDuration = a3;
}

- (void)setHasRentalDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRentalDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRentalPlaybackDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rentalPlaybackDuration = a3;
}

- (void)setHasRentalPlaybackDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRentalPlaybackDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRentalPlaybackStartedDateTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rentalPlaybackStartedDateTime = a3;
}

- (void)setHasRentalPlaybackStartedDateTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRentalPlaybackStartedDateTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRentalStartedDateTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rentalStartedDateTime = a3;
}

- (void)setHasRentalStartedDateTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRentalStartedDateTime
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasFlattenedChapterData
{
  return self->_flattenedChapterData != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
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
  v8.super_class = (Class)MIPMovie;
  -[MIPMovie description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMovie dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MIPArtist *artist;
  void *v5;
  __int16 has;
  void *v7;
  NSString *extendedContentName;
  NSString *movieInfo;
  __int16 v10;
  void *v11;
  NSData *flattenedChapterData;
  MIPGenre *genre;
  void *v14;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("artist"));

  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_videoQuality);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("videoQuality"));

    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rental);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rental"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasChapterData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("hasChapterData"));

  }
LABEL_7:
  extendedContentName = self->_extendedContentName;
  if (extendedContentName)
    objc_msgSend(v3, "setObject:forKey:", extendedContentName, CFSTR("extendedContentName"));
  movieInfo = self->_movieInfo;
  if (movieInfo)
    objc_msgSend(v3, "setObject:forKey:", movieInfo, CFSTR("movieInfo"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAlternateAudio);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("hasAlternateAudio"));

    v10 = (__int16)self->_has;
    if ((v10 & 0x1000) == 0)
    {
LABEL_13:
      if ((v10 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasSubtitles);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("hasSubtitles"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_14:
    if ((v10 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioLanguage);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("audioLanguage"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_15:
    if ((v10 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioTrackIndex);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("audioTrackIndex"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_16:
    if ((v10 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioTrackId);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("audioTrackId"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
LABEL_17:
    if ((v10 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subtitleLanguage);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("subtitleLanguage"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_18:
    if ((v10 & 1) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_subtitleTrackIndex);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("subtitleTrackIndex"));

  v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_19:
    if ((v10 & 2) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rentalDuration);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("rentalDuration"));

  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_20:
    if ((v10 & 4) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rentalPlaybackDuration);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("rentalPlaybackDuration"));

  v10 = (__int16)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_21:
    if ((v10 & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rentalPlaybackStartedDateTime);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("rentalPlaybackStartedDateTime"));

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rentalStartedDateTime);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rentalStartedDateTime"));

  }
LABEL_23:
  flattenedChapterData = self->_flattenedChapterData;
  if (flattenedChapterData)
    objc_msgSend(v3, "setObject:forKey:", flattenedChapterData, CFSTR("flattenedChapterData"));
  genre = self->_genre;
  if (genre)
  {
    -[MIPGenre dictionaryRepresentation](genre, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("genre"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPMovieReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_7:
  if (self->_extendedContentName)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_movieInfo)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 0x1000) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 2) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_23:
  if (self->_flattenedChapterData)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_artist)
  {
    objc_msgSend(v4, "setArtist:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_videoQuality;
    *((_WORD *)v4 + 56) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 111) = self->_rental;
  *((_WORD *)v4 + 56) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 109) = self->_hasChapterData;
    *((_WORD *)v4 + 56) |= 0x800u;
  }
LABEL_7:
  if (self->_extendedContentName)
  {
    objc_msgSend(v7, "setExtendedContentName:");
    v4 = v7;
  }
  if (self->_movieInfo)
  {
    objc_msgSend(v7, "setMovieInfo:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 108) = self->_hasAlternateAudio;
    *((_WORD *)v4 + 56) |= 0x400u;
    v6 = (__int16)self->_has;
    if ((v6 & 0x1000) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v4 + 110) = self->_hasSubtitles;
  *((_WORD *)v4 + 56) |= 0x1000u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 12) = self->_audioLanguage;
  *((_WORD *)v4 + 56) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 14) = self->_audioTrackIndex;
  *((_WORD *)v4 + 56) |= 0x40u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 13) = self->_audioTrackId;
  *((_WORD *)v4 + 56) |= 0x20u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 24) = self->_subtitleLanguage;
  *((_WORD *)v4 + 56) |= 0x80u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 1) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 25) = self->_subtitleTrackIndex;
  *((_WORD *)v4 + 56) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_19:
    if ((v6 & 2) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 1) = self->_rentalDuration;
  *((_WORD *)v4 + 56) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)v4 + 2) = self->_rentalPlaybackDuration;
  *((_WORD *)v4 + 56) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 8) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_40:
  *((_QWORD *)v4 + 3) = self->_rentalPlaybackStartedDateTime;
  *((_WORD *)v4 + 56) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_22:
    *((_QWORD *)v4 + 4) = self->_rentalStartedDateTime;
    *((_WORD *)v4 + 56) |= 8u;
  }
LABEL_23:
  if (self->_flattenedChapterData)
  {
    objc_msgSend(v7, "setFlattenedChapterData:");
    v4 = v7;
  }
  if (self->_genre)
  {
    objc_msgSend(v7, "setGenre:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_videoQuality;
    *(_WORD *)(v5 + 112) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 111) = self->_rental;
  *(_WORD *)(v5 + 112) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 109) = self->_hasChapterData;
    *(_WORD *)(v5 + 112) |= 0x800u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_extendedContentName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_movieInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_hasAlternateAudio;
    *(_WORD *)(v5 + 112) |= 0x400u;
    v13 = (__int16)self->_has;
    if ((v13 & 0x1000) == 0)
    {
LABEL_7:
      if ((v13 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 110) = self->_hasSubtitles;
  *(_WORD *)(v5 + 112) |= 0x1000u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_8:
    if ((v13 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 48) = self->_audioLanguage;
  *(_WORD *)(v5 + 112) |= 0x10u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_9:
    if ((v13 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 56) = self->_audioTrackIndex;
  *(_WORD *)(v5 + 112) |= 0x40u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_10:
    if ((v13 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 52) = self->_audioTrackId;
  *(_WORD *)(v5 + 112) |= 0x20u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_11:
    if ((v13 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 96) = self->_subtitleLanguage;
  *(_WORD *)(v5 + 112) |= 0x80u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) == 0)
  {
LABEL_12:
    if ((v13 & 1) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 100) = self->_subtitleTrackIndex;
  *(_WORD *)(v5 + 112) |= 0x100u;
  v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_13:
    if ((v13 & 2) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v5 + 8) = self->_rentalDuration;
  *(_WORD *)(v5 + 112) |= 1u;
  v13 = (__int16)self->_has;
  if ((v13 & 2) == 0)
  {
LABEL_14:
    if ((v13 & 4) == 0)
      goto LABEL_15;
LABEL_30:
    *(_QWORD *)(v5 + 24) = self->_rentalPlaybackStartedDateTime;
    *(_WORD *)(v5 + 112) |= 4u;
    if ((*(_WORD *)&self->_has & 8) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  *(_QWORD *)(v5 + 16) = self->_rentalPlaybackDuration;
  *(_WORD *)(v5 + 112) |= 2u;
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
    goto LABEL_30;
LABEL_15:
  if ((v13 & 8) != 0)
  {
LABEL_16:
    *(_QWORD *)(v5 + 32) = self->_rentalStartedDateTime;
    *(_WORD *)(v5 + 112) |= 8u;
  }
LABEL_17:
  v14 = -[NSData copyWithZone:](self->_flattenedChapterData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[MIPGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MIPArtist *artist;
  NSString *extendedContentName;
  NSString *movieInfo;
  __int16 has;
  __int16 v9;
  NSData *flattenedChapterData;
  MIPGenre *genre;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_94;
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 5))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_videoQuality != *((_DWORD *)v4 + 26))
      goto LABEL_94;
  }
  else if ((*((_WORD *)v4 + 56) & 0x200) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0)
      goto LABEL_94;
    if (self->_rental)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_94;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0)
      goto LABEL_94;
    if (self->_hasChapterData)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_94;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_94;
  }
  extendedContentName = self->_extendedContentName;
  if ((unint64_t)extendedContentName | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](extendedContentName, "isEqual:"))
  {
    goto LABEL_94;
  }
  movieInfo = self->_movieInfo;
  if ((unint64_t)movieInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](movieInfo, "isEqual:"))
      goto LABEL_94;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 56);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0)
      goto LABEL_94;
    if (self->_hasAlternateAudio)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_94;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_94;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
    {
      if (self->_hasSubtitles)
      {
        if (!*((_BYTE *)v4 + 110))
          goto LABEL_94;
        goto LABEL_45;
      }
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_45;
    }
LABEL_94:
    v12 = 0;
    goto LABEL_95;
  }
  if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
    goto LABEL_94;
LABEL_45:
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_audioLanguage != *((_DWORD *)v4 + 12))
      goto LABEL_94;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_audioTrackIndex != *((_DWORD *)v4 + 14))
      goto LABEL_94;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_audioTrackId != *((_DWORD *)v4 + 13))
      goto LABEL_94;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_subtitleLanguage != *((_DWORD *)v4 + 24))
      goto LABEL_94;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_94;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_subtitleTrackIndex != *((_DWORD *)v4 + 25))
      goto LABEL_94;
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_rentalDuration != *((_QWORD *)v4 + 1))
      goto LABEL_94;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_rentalPlaybackDuration != *((_QWORD *)v4 + 2))
      goto LABEL_94;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_rentalPlaybackStartedDateTime != *((_QWORD *)v4 + 3))
      goto LABEL_94;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_94;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_rentalStartedDateTime != *((_QWORD *)v4 + 4))
      goto LABEL_94;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_94;
  }
  flattenedChapterData = self->_flattenedChapterData;
  if ((unint64_t)flattenedChapterData | *((_QWORD *)v4 + 9)
    && !-[NSData isEqual:](flattenedChapterData, "isEqual:"))
  {
    goto LABEL_94;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 10))
    v12 = -[MIPGenre isEqual:](genre, "isEqual:");
  else
    v12 = 1;
LABEL_95:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  __int16 has;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v3 = -[MIPArtist hash](self->_artist, "hash");
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_videoQuality;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_rental;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_hasChapterData;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSString hash](self->_extendedContentName, "hash");
  v8 = -[NSString hash](self->_movieInfo, "hash");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v10 = 2654435761 * self->_hasAlternateAudio;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_10:
      v11 = 2654435761 * self->_hasSubtitles;
      if ((has & 0x10) != 0)
        goto LABEL_11;
      goto LABEL_22;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_10;
  }
  v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_audioLanguage;
    if ((has & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_audioTrackIndex;
    if ((has & 0x20) != 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  v13 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_audioTrackId;
    if ((has & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_subtitleLanguage;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_26;
  }
LABEL_25:
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_subtitleTrackIndex;
    if ((has & 1) != 0)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  v16 = 0;
  if ((has & 1) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_rentalDuration;
    if ((has & 2) != 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_27:
  v17 = 0;
  if ((has & 2) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_rentalPlaybackDuration;
    if ((has & 4) != 0)
      goto LABEL_18;
LABEL_29:
    v19 = 0;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
LABEL_28:
  v18 = 0;
  if ((has & 4) == 0)
    goto LABEL_29;
LABEL_18:
  v19 = 2654435761 * self->_rentalPlaybackStartedDateTime;
  if ((has & 8) == 0)
    goto LABEL_30;
LABEL_19:
  v20 = 2654435761 * self->_rentalStartedDateTime;
LABEL_31:
  v21 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11;
  v22 = v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NSData hash](self->_flattenedChapterData, "hash");
  return v21 ^ v22 ^ -[MIPGenre hash](self->_genre, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MIPArtist *artist;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  MIPGenre *genre;
  uint64_t v10;
  id v11;

  v4 = a3;
  artist = self->_artist;
  v6 = *((_QWORD *)v4 + 5);
  v11 = v4;
  if (artist)
  {
    if (!v6)
      goto LABEL_7;
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MIPMovie setArtist:](self, "setArtist:");
  }
  v4 = v11;
LABEL_7:
  v7 = *((_WORD *)v4 + 56);
  if ((v7 & 0x200) != 0)
  {
    self->_videoQuality = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)v4 + 56);
    if ((v7 & 0x2000) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) == 0)
  {
    goto LABEL_9;
  }
  self->_rental = *((_BYTE *)v4 + 111);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
LABEL_10:
    self->_hasChapterData = *((_BYTE *)v4 + 109);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 8))
  {
    -[MIPMovie setExtendedContentName:](self, "setExtendedContentName:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[MIPMovie setMovieInfo:](self, "setMovieInfo:");
    v4 = v11;
  }
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x400) != 0)
  {
    self->_hasAlternateAudio = *((_BYTE *)v4 + 108);
    *(_WORD *)&self->_has |= 0x400u;
    v8 = *((_WORD *)v4 + 56);
    if ((v8 & 0x1000) == 0)
    {
LABEL_17:
      if ((v8 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x1000) == 0)
  {
    goto LABEL_17;
  }
  self->_hasSubtitles = *((_BYTE *)v4 + 110);
  *(_WORD *)&self->_has |= 0x1000u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x10) == 0)
  {
LABEL_18:
    if ((v8 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_38;
  }
LABEL_37:
  self->_audioLanguage = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_19:
    if ((v8 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_38:
  self->_audioTrackIndex = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x20) == 0)
  {
LABEL_20:
    if ((v8 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_40;
  }
LABEL_39:
  self->_audioTrackId = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x80) == 0)
  {
LABEL_21:
    if ((v8 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_41;
  }
LABEL_40:
  self->_subtitleLanguage = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x80u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 0x100) == 0)
  {
LABEL_22:
    if ((v8 & 1) == 0)
      goto LABEL_23;
    goto LABEL_42;
  }
LABEL_41:
  self->_subtitleTrackIndex = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x100u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 1) == 0)
  {
LABEL_23:
    if ((v8 & 2) == 0)
      goto LABEL_24;
    goto LABEL_43;
  }
LABEL_42:
  self->_rentalDuration = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 2) == 0)
  {
LABEL_24:
    if ((v8 & 4) == 0)
      goto LABEL_25;
    goto LABEL_44;
  }
LABEL_43:
  self->_rentalPlaybackDuration = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v8 = *((_WORD *)v4 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_25:
    if ((v8 & 8) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_44:
  self->_rentalPlaybackStartedDateTime = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 56) & 8) != 0)
  {
LABEL_26:
    self->_rentalStartedDateTime = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_27:
  if (*((_QWORD *)v4 + 9))
  {
    -[MIPMovie setFlattenedChapterData:](self, "setFlattenedChapterData:");
    v4 = v11;
  }
  genre = self->_genre;
  v10 = *((_QWORD *)v4 + 10);
  if (genre)
  {
    if (v10)
    {
      -[MIPGenre mergeFrom:](genre, "mergeFrom:");
LABEL_48:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[MIPMovie setGenre:](self, "setGenre:");
    goto LABEL_48;
  }

}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (int)videoQuality
{
  return self->_videoQuality;
}

- (BOOL)rental
{
  return self->_rental;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (NSString)extendedContentName
{
  return self->_extendedContentName;
}

- (void)setExtendedContentName:(id)a3
{
  objc_storeStrong((id *)&self->_extendedContentName, a3);
}

- (NSString)movieInfo
{
  return self->_movieInfo;
}

- (void)setMovieInfo:(id)a3
{
  objc_storeStrong((id *)&self->_movieInfo, a3);
}

- (BOOL)hasAlternateAudio
{
  return self->_hasAlternateAudio;
}

- (BOOL)hasSubtitles
{
  return self->_hasSubtitles;
}

- (int)audioLanguage
{
  return self->_audioLanguage;
}

- (int)audioTrackIndex
{
  return self->_audioTrackIndex;
}

- (int)audioTrackId
{
  return self->_audioTrackId;
}

- (int)subtitleLanguage
{
  return self->_subtitleLanguage;
}

- (int)subtitleTrackIndex
{
  return self->_subtitleTrackIndex;
}

- (int64_t)rentalDuration
{
  return self->_rentalDuration;
}

- (int64_t)rentalPlaybackDuration
{
  return self->_rentalPlaybackDuration;
}

- (int64_t)rentalPlaybackStartedDateTime
{
  return self->_rentalPlaybackStartedDateTime;
}

- (int64_t)rentalStartedDateTime
{
  return self->_rentalStartedDateTime;
}

- (NSData)flattenedChapterData
{
  return self->_flattenedChapterData;
}

- (void)setFlattenedChapterData:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedChapterData, a3);
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieInfo, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_flattenedChapterData, 0);
  objc_storeStrong((id *)&self->_extendedContentName, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
