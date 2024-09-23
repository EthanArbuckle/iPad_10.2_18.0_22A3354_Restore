@implementation MIPTVShow

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasSeries
{
  return self->_series != 0;
}

- (void)setSeasonNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_seasonNumber = a3;
}

- (void)setHasSeasonNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSeasonNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEpisodeId
{
  return self->_episodeId != 0;
}

- (BOOL)hasEpisodeSortId
{
  return self->_episodeSortId != 0;
}

- (void)setVideoQuality:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_videoQuality = a3;
}

- (void)setHasVideoQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVideoQuality
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNetworkName
{
  return self->_networkName != 0;
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
  v8.super_class = (Class)MIPTVShow;
  -[MIPTVShow description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPTVShow dictionaryRepresentation](self, "dictionaryRepresentation");
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
  MIPSeries *series;
  void *v7;
  void *v8;
  NSString *episodeId;
  NSString *episodeSortId;
  void *v11;
  NSString *networkName;
  MIPGenre *genre;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("artist"));

  }
  series = self->_series;
  if (series)
  {
    -[MIPSeries dictionaryRepresentation](series, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("series"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_seasonNumber);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("seasonNumber"));

  }
  episodeId = self->_episodeId;
  if (episodeId)
    objc_msgSend(v3, "setObject:forKey:", episodeId, CFSTR("episodeId"));
  episodeSortId = self->_episodeSortId;
  if (episodeSortId)
    objc_msgSend(v3, "setObject:forKey:", episodeSortId, CFSTR("episodeSortId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_videoQuality);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("videoQuality"));

  }
  networkName = self->_networkName;
  if (networkName)
    objc_msgSend(v3, "setObject:forKey:", networkName, CFSTR("networkName"));
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
  return MIPTVShowReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_series)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_episodeId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_episodeSortId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_networkName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_artist)
  {
    objc_msgSend(v4, "setArtist:");
    v4 = v5;
  }
  if (self->_series)
  {
    objc_msgSend(v5, "setSeries:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_seasonNumber;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  if (self->_episodeId)
  {
    objc_msgSend(v5, "setEpisodeId:");
    v4 = v5;
  }
  if (self->_episodeSortId)
  {
    objc_msgSend(v5, "setEpisodeSortId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_videoQuality;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_networkName)
  {
    objc_msgSend(v5, "setNetworkName:");
    v4 = v5;
  }
  if (self->_genre)
  {
    objc_msgSend(v5, "setGenre:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[MIPSeries copyWithZone:](self->_series, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_seasonNumber;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_episodeId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_episodeSortId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_videoQuality;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v14 = -[NSString copyWithZone:](self->_networkName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[MIPGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MIPArtist *artist;
  MIPSeries *series;
  NSString *episodeId;
  NSString *episodeSortId;
  NSString *networkName;
  MIPGenre *genre;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 1))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_24;
  }
  series = self->_series;
  if ((unint64_t)series | *((_QWORD *)v4 + 7))
  {
    if (!-[MIPSeries isEqual:](series, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_seasonNumber != *((_DWORD *)v4 + 12))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  episodeId = self->_episodeId;
  if ((unint64_t)episodeId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](episodeId, "isEqual:"))
    goto LABEL_24;
  episodeSortId = self->_episodeSortId;
  if ((unint64_t)episodeSortId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](episodeSortId, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_videoQuality != *((_DWORD *)v4 + 16))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_24;
  }
  networkName = self->_networkName;
  if ((unint64_t)networkName | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](networkName, "isEqual:"))
  {
    goto LABEL_24;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 4))
    v11 = -[MIPGenre isEqual:](genre, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[MIPArtist hash](self->_artist, "hash");
  v4 = -[MIPSeries hash](self->_series, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_seasonNumber;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_episodeId, "hash");
  v7 = -[NSString hash](self->_episodeSortId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_videoQuality;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_networkName, "hash");
  return v9 ^ -[MIPGenre hash](self->_genre, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MIPArtist *artist;
  uint64_t v6;
  MIPSeries *series;
  uint64_t v8;
  MIPGenre *genre;
  uint64_t v10;
  id v11;

  v4 = a3;
  artist = self->_artist;
  v6 = *((_QWORD *)v4 + 1);
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
    -[MIPTVShow setArtist:](self, "setArtist:");
  }
  v4 = v11;
LABEL_7:
  series = self->_series;
  v8 = *((_QWORD *)v4 + 7);
  if (series)
  {
    if (!v8)
      goto LABEL_13;
    -[MIPSeries mergeFrom:](series, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[MIPTVShow setSeries:](self, "setSeries:");
  }
  v4 = v11;
LABEL_13:
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_seasonNumber = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[MIPTVShow setEpisodeId:](self, "setEpisodeId:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[MIPTVShow setEpisodeSortId:](self, "setEpisodeSortId:");
    v4 = v11;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_videoQuality = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[MIPTVShow setNetworkName:](self, "setNetworkName:");
    v4 = v11;
  }
  genre = self->_genre;
  v10 = *((_QWORD *)v4 + 4);
  if (genre)
  {
    if (v10)
    {
      -[MIPGenre mergeFrom:](genre, "mergeFrom:");
LABEL_28:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[MIPTVShow setGenre:](self, "setGenre:");
    goto LABEL_28;
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

- (MIPSeries)series
{
  return self->_series;
}

- (void)setSeries:(id)a3
{
  objc_storeStrong((id *)&self->_series, a3);
}

- (int)seasonNumber
{
  return self->_seasonNumber;
}

- (NSString)episodeId
{
  return self->_episodeId;
}

- (void)setEpisodeId:(id)a3
{
  objc_storeStrong((id *)&self->_episodeId, a3);
}

- (NSString)episodeSortId
{
  return self->_episodeSortId;
}

- (void)setEpisodeSortId:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSortId, a3);
}

- (int)videoQuality
{
  return self->_videoQuality;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
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
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_episodeSortId, 0);
  objc_storeStrong((id *)&self->_episodeId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
