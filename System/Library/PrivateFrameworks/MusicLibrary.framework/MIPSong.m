@implementation MIPSong

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasComposer
{
  return self->_composer != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (void)setDiscNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_discNumber = a3;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDiscNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTrackNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_trackNumber = a3;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTrackNumber
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setUserRating:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userRating = a3;
}

- (void)setHasUserRating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserRating
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setExcludeFromShuffle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_excludeFromShuffle = a3;
}

- (void)setHasExcludeFromShuffle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasExcludeFromShuffle
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setGeniusId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_geniusId = a3;
}

- (void)setHasGeniusId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGeniusId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAudioFormat:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_audioFormat = a3;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioFormat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_hasVideo = a3;
}

- (void)setHasHasVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasHasVideo
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (BOOL)hasPlaybackInfo
{
  return self->_playbackInfo != 0;
}

- (void)setLyricsChecksum:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lyricsChecksum = a3;
}

- (void)setHasLyricsChecksum:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLyricsChecksum
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasHlsPlaylistURL
{
  return self->_hlsPlaylistURL != 0;
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
  v8.super_class = (Class)MIPSong;
  -[MIPSong description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPSong dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MIPAlbum *album;
  void *v5;
  MIPArtist *artist;
  void *v7;
  MIPArtist *composer;
  void *v9;
  MIPGenre *genre;
  void *v11;
  char has;
  NSString *lyrics;
  MIPPlaybackInfo *playbackInfo;
  void *v15;
  void *v16;
  NSString *hlsPlaylistURL;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  album = self->_album;
  if (album)
  {
    -[MIPAlbum dictionaryRepresentation](album, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("album"));

  }
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("artist"));

  }
  composer = self->_composer;
  if (composer)
  {
    -[MIPArtist dictionaryRepresentation](composer, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("composer"));

  }
  genre = self->_genre;
  if (genre)
  {
    -[MIPGenre dictionaryRepresentation](genre, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("genre"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_discNumber);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("discNumber"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackNumber);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("trackNumber"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_userRating);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("userRating"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_excludeFromShuffle);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("excludeFromShuffle"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioFormat);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("audioFormat"));

    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_geniusId);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("geniusId"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVideo);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("hasVideo"));

LABEL_16:
  lyrics = self->_lyrics;
  if (lyrics)
    objc_msgSend(v3, "setObject:forKey:", lyrics, CFSTR("lyrics"));
  playbackInfo = self->_playbackInfo;
  if (playbackInfo)
  {
    -[MIPPlaybackInfo dictionaryRepresentation](playbackInfo, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("playbackInfo"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_lyricsChecksum);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("lyricsChecksum"));

  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if (hlsPlaylistURL)
    objc_msgSend(v3, "setObject:forKey:", hlsPlaylistURL, CFSTR("hlsPlaylistURL"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPSongReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_album)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_composer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
LABEL_30:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_31:
  PBDataWriterWriteBOOLField();
  v4 = v6;
LABEL_16:
  if (self->_lyrics)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_playbackInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_hlsPlaylistURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_album)
  {
    objc_msgSend(v4, "setAlbum:");
    v4 = v6;
  }
  if (self->_artist)
  {
    objc_msgSend(v6, "setArtist:");
    v4 = v6;
  }
  if (self->_composer)
  {
    objc_msgSend(v6, "setComposer:");
    v4 = v6;
  }
  if (self->_genre)
  {
    objc_msgSend(v6, "setGenre:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_discNumber;
    *((_BYTE *)v4 + 108) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 24) = self->_trackNumber;
  *((_BYTE *)v4 + 108) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 25) = self->_userRating;
  *((_BYTE *)v4 + 108) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)v4 + 104) = self->_excludeFromShuffle;
  *((_BYTE *)v4 + 108) |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
LABEL_30:
    *((_DWORD *)v4 + 8) = self->_audioFormat;
    *((_BYTE *)v4 + 108) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_29:
  *((_QWORD *)v4 + 1) = self->_geniusId;
  *((_BYTE *)v4 + 108) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_15:
  if ((has & 0x80) == 0)
    goto LABEL_16;
LABEL_31:
  *((_BYTE *)v4 + 105) = self->_hasVideo;
  *((_BYTE *)v4 + 108) |= 0x80u;
LABEL_16:
  if (self->_lyrics)
  {
    objc_msgSend(v6, "setLyrics:");
    v4 = v6;
  }
  if (self->_playbackInfo)
  {
    objc_msgSend(v6, "setPlaybackInfo:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_lyricsChecksum;
    *((_BYTE *)v4 + 108) |= 8u;
  }
  if (self->_hlsPlaylistURL)
  {
    objc_msgSend(v6, "setHlsPlaylistURL:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MIPAlbum copyWithZone:](self->_album, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[MIPArtist copyWithZone:](self->_composer, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[MIPGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_discNumber;
    *(_BYTE *)(v5 + 108) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_trackNumber;
  *(_BYTE *)(v5 + 108) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 100) = self->_userRating;
  *(_BYTE *)(v5 + 108) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_BYTE *)(v5 + 104) = self->_excludeFromShuffle;
  *(_BYTE *)(v5 + 108) |= 0x40u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_16:
    *(_DWORD *)(v5 + 32) = self->_audioFormat;
    *(_BYTE *)(v5 + 108) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_15:
  *(_QWORD *)(v5 + 8) = self->_geniusId;
  *(_BYTE *)(v5 + 108) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_16;
LABEL_7:
  if ((has & 0x80) == 0)
    goto LABEL_8;
LABEL_17:
  *(_BYTE *)(v5 + 105) = self->_hasVideo;
  *(_BYTE *)(v5 + 108) |= 0x80u;
LABEL_8:
  v15 = -[NSString copyWithZone:](self->_lyrics, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[MIPPlaybackInfo copyWithZone:](self->_playbackInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v17;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_lyricsChecksum;
    *(_BYTE *)(v5 + 108) |= 8u;
  }
  v19 = -[NSString copyWithZone:](self->_hlsPlaylistURL, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MIPAlbum *album;
  MIPArtist *artist;
  MIPArtist *composer;
  MIPGenre *genre;
  NSString *lyrics;
  MIPPlaybackInfo *playbackInfo;
  NSString *hlsPlaylistURL;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  album = self->_album;
  if ((unint64_t)album | *((_QWORD *)v4 + 2))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:"))
      goto LABEL_61;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 3))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_61;
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((_QWORD *)v4 + 5))
  {
    if (!-[MIPArtist isEqual:](composer, "isEqual:"))
      goto LABEL_61;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 7))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_discNumber != *((_DWORD *)v4 + 12))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_trackNumber != *((_DWORD *)v4 + 24))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x20) == 0 || self->_userRating != *((_DWORD *)v4 + 25))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x40) == 0)
      goto LABEL_61;
    if (self->_excludeFromShuffle)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 108) & 0x40) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_geniusId != *((_QWORD *)v4 + 1))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_audioFormat != *((_DWORD *)v4 + 8))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
      goto LABEL_45;
LABEL_61:
    v12 = 0;
    goto LABEL_62;
  }
  if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
    goto LABEL_61;
  if (self->_hasVideo)
  {
    if (!*((_BYTE *)v4 + 105))
      goto LABEL_61;
  }
  else if (*((_BYTE *)v4 + 105))
  {
    goto LABEL_61;
  }
LABEL_45:
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](lyrics, "isEqual:"))
    goto LABEL_61;
  playbackInfo = self->_playbackInfo;
  if ((unint64_t)playbackInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[MIPPlaybackInfo isEqual:](playbackInfo, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_lyricsChecksum != *((_DWORD *)v4 + 20))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_61;
  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if ((unint64_t)hlsPlaylistURL | *((_QWORD *)v4 + 8))
    v12 = -[NSString isEqual:](hlsPlaylistURL, "isEqual:");
  else
    v12 = 1;
LABEL_62:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v16 = -[MIPAlbum hash](self->_album, "hash");
  v15 = -[MIPArtist hash](self->_artist, "hash");
  v14 = -[MIPArtist hash](self->_composer, "hash");
  v17 = -[MIPGenre hash](self->_genre, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v13 = 2654435761 * self->_discNumber;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_trackNumber;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_userRating;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_excludeFromShuffle;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_geniusId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_audioFormat;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_hasVideo;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
LABEL_16:
  v9 = -[NSString hash](self->_lyrics, "hash");
  v10 = -[MIPPlaybackInfo hash](self->_playbackInfo, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_lyricsChecksum;
  else
    v11 = 0;
  return v15 ^ v16 ^ v14 ^ v17 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_hlsPlaylistURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MIPAlbum *album;
  uint64_t v6;
  MIPArtist *artist;
  uint64_t v8;
  MIPArtist *composer;
  uint64_t v10;
  MIPGenre *genre;
  uint64_t v12;
  char v13;
  MIPPlaybackInfo *playbackInfo;
  uint64_t v15;
  id v16;

  v4 = a3;
  album = self->_album;
  v6 = *((_QWORD *)v4 + 2);
  v16 = v4;
  if (album)
  {
    if (!v6)
      goto LABEL_7;
    -[MIPAlbum mergeFrom:](album, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MIPSong setAlbum:](self, "setAlbum:");
  }
  v4 = v16;
LABEL_7:
  artist = self->_artist;
  v8 = *((_QWORD *)v4 + 3);
  if (artist)
  {
    if (!v8)
      goto LABEL_13;
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[MIPSong setArtist:](self, "setArtist:");
  }
  v4 = v16;
LABEL_13:
  composer = self->_composer;
  v10 = *((_QWORD *)v4 + 5);
  if (composer)
  {
    if (!v10)
      goto LABEL_19;
    -[MIPArtist mergeFrom:](composer, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[MIPSong setComposer:](self, "setComposer:");
  }
  v4 = v16;
LABEL_19:
  genre = self->_genre;
  v12 = *((_QWORD *)v4 + 7);
  if (genre)
  {
    if (!v12)
      goto LABEL_25;
    -[MIPGenre mergeFrom:](genre, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[MIPSong setGenre:](self, "setGenre:");
  }
  v4 = v16;
LABEL_25:
  v13 = *((_BYTE *)v4 + 108);
  if ((v13 & 4) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v13 = *((_BYTE *)v4 + 108);
    if ((v13 & 0x10) == 0)
    {
LABEL_27:
      if ((v13 & 0x20) == 0)
        goto LABEL_28;
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_trackNumber = *((_DWORD *)v4 + 24);
  *(_BYTE *)&self->_has |= 0x10u;
  v13 = *((_BYTE *)v4 + 108);
  if ((v13 & 0x20) == 0)
  {
LABEL_28:
    if ((v13 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_40;
  }
LABEL_39:
  self->_userRating = *((_DWORD *)v4 + 25);
  *(_BYTE *)&self->_has |= 0x20u;
  v13 = *((_BYTE *)v4 + 108);
  if ((v13 & 0x40) == 0)
  {
LABEL_29:
    if ((v13 & 1) == 0)
      goto LABEL_30;
    goto LABEL_41;
  }
LABEL_40:
  self->_excludeFromShuffle = *((_BYTE *)v4 + 104);
  *(_BYTE *)&self->_has |= 0x40u;
  v13 = *((_BYTE *)v4 + 108);
  if ((v13 & 1) == 0)
  {
LABEL_30:
    if ((v13 & 2) == 0)
      goto LABEL_31;
LABEL_42:
    self->_audioFormat = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_43;
  }
LABEL_41:
  self->_geniusId = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v13 = *((_BYTE *)v4 + 108);
  if ((v13 & 2) != 0)
    goto LABEL_42;
LABEL_31:
  if ((v13 & 0x80) == 0)
    goto LABEL_32;
LABEL_43:
  self->_hasVideo = *((_BYTE *)v4 + 105);
  *(_BYTE *)&self->_has |= 0x80u;
LABEL_32:
  if (*((_QWORD *)v4 + 9))
  {
    -[MIPSong setLyrics:](self, "setLyrics:");
    v4 = v16;
  }
  playbackInfo = self->_playbackInfo;
  v15 = *((_QWORD *)v4 + 11);
  if (playbackInfo)
  {
    if (!v15)
      goto LABEL_47;
    -[MIPPlaybackInfo mergeFrom:](playbackInfo, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_47;
    -[MIPSong setPlaybackInfo:](self, "setPlaybackInfo:");
  }
  v4 = v16;
LABEL_47:
  if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    self->_lyricsChecksum = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[MIPSong setHlsPlaylistURL:](self, "setHlsPlaylistURL:");
    v4 = v16;
  }

}

- (MIPAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (MIPArtist)composer
{
  return self->_composer;
}

- (void)setComposer:(id)a3
{
  objc_storeStrong((id *)&self->_composer, a3);
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (int)discNumber
{
  return self->_discNumber;
}

- (int)trackNumber
{
  return self->_trackNumber;
}

- (int)userRating
{
  return self->_userRating;
}

- (BOOL)excludeFromShuffle
{
  return self->_excludeFromShuffle;
}

- (int64_t)geniusId
{
  return self->_geniusId;
}

- (int)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_storeStrong((id *)&self->_lyrics, a3);
}

- (MIPPlaybackInfo)playbackInfo
{
  return self->_playbackInfo;
}

- (void)setPlaybackInfo:(id)a3
{
  objc_storeStrong((id *)&self->_playbackInfo, a3);
}

- (int)lyricsChecksum
{
  return self->_lyricsChecksum;
}

- (NSString)hlsPlaylistURL
{
  return self->_hlsPlaylistURL;
}

- (void)setHlsPlaylistURL:(id)a3
{
  objc_storeStrong((id *)&self->_hlsPlaylistURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
