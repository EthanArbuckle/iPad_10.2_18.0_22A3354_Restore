@implementation MIPAudiobook

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
  *(_BYTE *)&self->_has |= 2u;
  self->_discNumber = a3;
}

- (void)setHasDiscNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDiscNumber
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTrackNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trackNumber = a3;
}

- (void)setHasTrackNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrackNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUserRating:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userRating = a3;
}

- (void)setHasUserRating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserRating
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setExcludeFromShuffle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_excludeFromShuffle = a3;
}

- (void)setHasExcludeFromShuffle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasExcludeFromShuffle
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAudioFormat:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_audioFormat = a3;
}

- (void)setHasAudioFormat:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioFormat
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasVideo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_hasVideo = a3;
}

- (void)setHasHasVideo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasHasVideo
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasPlaybackInfo
{
  return self->_playbackInfo != 0;
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
  v8.super_class = (Class)MIPAudiobook;
  -[MIPAudiobook description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAudiobook dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v13;
  MIPPlaybackInfo *playbackInfo;
  void *v15;
  NSString *hlsPlaylistURL;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

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
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_discNumber);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("discNumber"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trackNumber);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("trackNumber"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_userRating);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("userRating"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_excludeFromShuffle);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("excludeFromShuffle"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_audioFormat);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("audioFormat"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasVideo);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("hasVideo"));

  }
LABEL_16:
  playbackInfo = self->_playbackInfo;
  if (playbackInfo)
  {
    -[MIPPlaybackInfo dictionaryRepresentation](playbackInfo, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("playbackInfo"));

  }
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if (hlsPlaylistURL)
    objc_msgSend(v3, "setObject:forKey:", hlsPlaylistURL, CFSTR("hlsPlaylistURL"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPAudiobookReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_16:
  if (self->_playbackInfo)
  {
    PBDataWriterWriteSubmessage();
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
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_discNumber;
    *((_BYTE *)v4 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 18) = self->_trackNumber;
  *((_BYTE *)v4 + 84) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 19) = self->_userRating;
  *((_BYTE *)v4 + 84) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  *((_BYTE *)v4 + 80) = self->_excludeFromShuffle;
  *((_BYTE *)v4 + 84) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_25:
  *((_DWORD *)v4 + 6) = self->_audioFormat;
  *((_BYTE *)v4 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *((_BYTE *)v4 + 81) = self->_hasVideo;
    *((_BYTE *)v4 + 84) |= 0x20u;
  }
LABEL_16:
  if (self->_playbackInfo)
  {
    objc_msgSend(v6, "setPlaybackInfo:");
    v4 = v6;
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
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MIPAlbum copyWithZone:](self->_album, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[MIPArtist copyWithZone:](self->_composer, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[MIPGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_discNumber;
    *(_BYTE *)(v5 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_trackNumber;
  *(_BYTE *)(v5 + 84) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 76) = self->_userRating;
  *(_BYTE *)(v5 + 84) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
LABEL_13:
    *(_DWORD *)(v5 + 24) = self->_audioFormat;
    *(_BYTE *)(v5 + 84) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(_BYTE *)(v5 + 80) = self->_excludeFromShuffle;
  *(_BYTE *)(v5 + 84) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 81) = self->_hasVideo;
    *(_BYTE *)(v5 + 84) |= 0x20u;
  }
LABEL_8:
  v15 = -[MIPPlaybackInfo copyWithZone:](self->_playbackInfo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = -[NSString copyWithZone:](self->_hlsPlaylistURL, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MIPAlbum *album;
  MIPArtist *artist;
  MIPArtist *composer;
  MIPGenre *genre;
  MIPPlaybackInfo *playbackInfo;
  NSString *hlsPlaylistURL;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  album = self->_album;
  if ((unint64_t)album | *((_QWORD *)v4 + 1))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:"))
      goto LABEL_50;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 2))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_50;
  }
  composer = self->_composer;
  if ((unint64_t)composer | *((_QWORD *)v4 + 4))
  {
    if (!-[MIPArtist isEqual:](composer, "isEqual:"))
      goto LABEL_50;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 6))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:"))
      goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_discNumber != *((_DWORD *)v4 + 10))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_trackNumber != *((_DWORD *)v4 + 18))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) == 0 || self->_userRating != *((_DWORD *)v4 + 19))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 84) & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x10) == 0)
      goto LABEL_50;
    if (self->_excludeFromShuffle)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_50;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_audioFormat != *((_DWORD *)v4 + 6))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
    {
      if (self->_hasVideo)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_50;
        goto LABEL_46;
      }
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_46;
    }
LABEL_50:
    v11 = 0;
    goto LABEL_51;
  }
  if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
    goto LABEL_50;
LABEL_46:
  playbackInfo = self->_playbackInfo;
  if ((unint64_t)playbackInfo | *((_QWORD *)v4 + 8) && !-[MIPPlaybackInfo isEqual:](playbackInfo, "isEqual:"))
    goto LABEL_50;
  hlsPlaylistURL = self->_hlsPlaylistURL;
  if ((unint64_t)hlsPlaylistURL | *((_QWORD *)v4 + 7))
    v11 = -[NSString isEqual:](hlsPlaylistURL, "isEqual:");
  else
    v11 = 1;
LABEL_51:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v3 = -[MIPAlbum hash](self->_album, "hash");
  v4 = -[MIPArtist hash](self->_artist, "hash");
  v5 = -[MIPArtist hash](self->_composer, "hash");
  v6 = -[MIPGenre hash](self->_genre, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_discNumber;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_trackNumber;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_userRating;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v10 = 2654435761 * self->_excludeFromShuffle;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v11 = 2654435761 * self->_audioFormat;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v12 = 2654435761 * self->_hasVideo;
LABEL_14:
  v13 = v4 ^ v3 ^ v5 ^ v6;
  v14 = v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[MIPPlaybackInfo hash](self->_playbackInfo, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_hlsPlaylistURL, "hash");
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
  v6 = *((_QWORD *)v4 + 1);
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
    -[MIPAudiobook setAlbum:](self, "setAlbum:");
  }
  v4 = v16;
LABEL_7:
  artist = self->_artist;
  v8 = *((_QWORD *)v4 + 2);
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
    -[MIPAudiobook setArtist:](self, "setArtist:");
  }
  v4 = v16;
LABEL_13:
  composer = self->_composer;
  v10 = *((_QWORD *)v4 + 4);
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
    -[MIPAudiobook setComposer:](self, "setComposer:");
  }
  v4 = v16;
LABEL_19:
  genre = self->_genre;
  v12 = *((_QWORD *)v4 + 6);
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
    -[MIPAudiobook setGenre:](self, "setGenre:");
  }
  v4 = v16;
LABEL_25:
  v13 = *((_BYTE *)v4 + 84);
  if ((v13 & 2) != 0)
  {
    self->_discNumber = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v13 = *((_BYTE *)v4 + 84);
    if ((v13 & 4) == 0)
    {
LABEL_27:
      if ((v13 & 8) == 0)
        goto LABEL_28;
      goto LABEL_37;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_trackNumber = *((_DWORD *)v4 + 18);
  *(_BYTE *)&self->_has |= 4u;
  v13 = *((_BYTE *)v4 + 84);
  if ((v13 & 8) == 0)
  {
LABEL_28:
    if ((v13 & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_38;
  }
LABEL_37:
  self->_userRating = *((_DWORD *)v4 + 19);
  *(_BYTE *)&self->_has |= 8u;
  v13 = *((_BYTE *)v4 + 84);
  if ((v13 & 0x10) == 0)
  {
LABEL_29:
    if ((v13 & 1) == 0)
      goto LABEL_30;
    goto LABEL_39;
  }
LABEL_38:
  self->_excludeFromShuffle = *((_BYTE *)v4 + 80);
  *(_BYTE *)&self->_has |= 0x10u;
  v13 = *((_BYTE *)v4 + 84);
  if ((v13 & 1) == 0)
  {
LABEL_30:
    if ((v13 & 0x20) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_39:
  self->_audioFormat = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
  {
LABEL_31:
    self->_hasVideo = *((_BYTE *)v4 + 81);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_32:
  playbackInfo = self->_playbackInfo;
  v15 = *((_QWORD *)v4 + 8);
  if (playbackInfo)
  {
    if (!v15)
      goto LABEL_44;
    -[MIPPlaybackInfo mergeFrom:](playbackInfo, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_44;
    -[MIPAudiobook setPlaybackInfo:](self, "setPlaybackInfo:");
  }
  v4 = v16;
LABEL_44:
  if (*((_QWORD *)v4 + 7))
  {
    -[MIPAudiobook setHlsPlaylistURL:](self, "setHlsPlaylistURL:");
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

- (int)audioFormat
{
  return self->_audioFormat;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (MIPPlaybackInfo)playbackInfo
{
  return self->_playbackInfo;
}

- (void)setPlaybackInfo:(id)a3
{
  objc_storeStrong((id *)&self->_playbackInfo, a3);
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
  objc_storeStrong((id *)&self->_hlsPlaylistURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_composer, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
