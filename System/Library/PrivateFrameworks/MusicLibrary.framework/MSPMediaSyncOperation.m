@implementation MSPMediaSyncOperation

- (int)operationType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_operationType;
  else
    return 1;
}

- (void)setOperationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationType = a3;
}

- (void)setHasOperationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E5B63620[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOperationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Delete")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasMultiverseId
{
  return self->_multiverseId != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (BOOL)hasAlbum
{
  return self->_album != 0;
}

- (BOOL)hasGenre
{
  return self->_genre != 0;
}

- (BOOL)hasSeries
{
  return self->_series != 0;
}

- (BOOL)hasMediaItem
{
  return self->_mediaItem != 0;
}

- (BOOL)hasPlaylist
{
  return self->_playlist != 0;
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
  v8.super_class = (Class)MSPMediaSyncOperation;
  -[MSPMediaSyncOperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  MIPMultiverseIdentifier *multiverseId;
  void *v7;
  MIPArtist *artist;
  void *v9;
  MIPAlbum *album;
  void *v11;
  MIPGenre *genre;
  void *v13;
  MIPSeries *series;
  void *v15;
  MIPMediaItem *mediaItem;
  void *v17;
  MIPPlaylist *playlist;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_operationType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_operationType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5B63620[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("operationType"));

  }
  multiverseId = self->_multiverseId;
  if (multiverseId)
  {
    -[MIPMultiverseIdentifier dictionaryRepresentation](multiverseId, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("multiverseId"));

  }
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("artist"));

  }
  album = self->_album;
  if (album)
  {
    -[MIPAlbum dictionaryRepresentation](album, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("album"));

  }
  genre = self->_genre;
  if (genre)
  {
    -[MIPGenre dictionaryRepresentation](genre, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("genre"));

  }
  series = self->_series;
  if (series)
  {
    -[MIPSeries dictionaryRepresentation](series, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("series"));

  }
  mediaItem = self->_mediaItem;
  if (mediaItem)
  {
    -[MIPMediaItem dictionaryRepresentation](mediaItem, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("mediaItem"));

  }
  playlist = self->_playlist;
  if (playlist)
  {
    -[MIPPlaylist dictionaryRepresentation](playlist, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("playlist"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPMediaSyncOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_multiverseId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_artist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_album)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_genre)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_series)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playlist)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_operationType;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  v5 = v4;
  if (self->_multiverseId)
  {
    objc_msgSend(v4, "setMultiverseId:");
    v4 = v5;
  }
  if (self->_artist)
  {
    objc_msgSend(v5, "setArtist:");
    v4 = v5;
  }
  if (self->_album)
  {
    objc_msgSend(v5, "setAlbum:");
    v4 = v5;
  }
  if (self->_genre)
  {
    objc_msgSend(v5, "setGenre:");
    v4 = v5;
  }
  if (self->_series)
  {
    objc_msgSend(v5, "setSeries:");
    v4 = v5;
  }
  if (self->_mediaItem)
  {
    objc_msgSend(v5, "setMediaItem:");
    v4 = v5;
  }
  if (self->_playlist)
  {
    objc_msgSend(v5, "setPlaylist:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_operationType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v7 = -[MIPMultiverseIdentifier copyWithZone:](self->_multiverseId, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[MIPAlbum copyWithZone:](self->_album, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  v13 = -[MIPGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  v15 = -[MIPSeries copyWithZone:](self->_series, "copyWithZone:", a3);
  v16 = (void *)v6[8];
  v6[8] = v15;

  v17 = -[MIPMediaItem copyWithZone:](self->_mediaItem, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  v19 = -[MIPPlaylist copyWithZone:](self->_playlist, "copyWithZone:", a3);
  v20 = (void *)v6[7];
  v6[7] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MIPMultiverseIdentifier *multiverseId;
  MIPArtist *artist;
  MIPAlbum *album;
  MIPGenre *genre;
  MIPSeries *series;
  MIPMediaItem *mediaItem;
  MIPPlaylist *playlist;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_operationType != *((_DWORD *)v4 + 12))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  multiverseId = self->_multiverseId;
  if ((unint64_t)multiverseId | *((_QWORD *)v4 + 5)
    && !-[MIPMultiverseIdentifier isEqual:](multiverseId, "isEqual:"))
  {
    goto LABEL_21;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 2))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_21;
  }
  album = self->_album;
  if ((unint64_t)album | *((_QWORD *)v4 + 1))
  {
    if (!-[MIPAlbum isEqual:](album, "isEqual:"))
      goto LABEL_21;
  }
  genre = self->_genre;
  if ((unint64_t)genre | *((_QWORD *)v4 + 3))
  {
    if (!-[MIPGenre isEqual:](genre, "isEqual:"))
      goto LABEL_21;
  }
  series = self->_series;
  if ((unint64_t)series | *((_QWORD *)v4 + 8))
  {
    if (!-[MIPSeries isEqual:](series, "isEqual:"))
      goto LABEL_21;
  }
  mediaItem = self->_mediaItem;
  if ((unint64_t)mediaItem | *((_QWORD *)v4 + 4))
  {
    if (!-[MIPMediaItem isEqual:](mediaItem, "isEqual:"))
      goto LABEL_21;
  }
  playlist = self->_playlist;
  if ((unint64_t)playlist | *((_QWORD *)v4 + 7))
    v12 = -[MIPPlaylist isEqual:](playlist, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_operationType;
  else
    v3 = 0;
  v4 = -[MIPMultiverseIdentifier hash](self->_multiverseId, "hash") ^ v3;
  v5 = -[MIPArtist hash](self->_artist, "hash");
  v6 = v4 ^ v5 ^ -[MIPAlbum hash](self->_album, "hash");
  v7 = -[MIPGenre hash](self->_genre, "hash");
  v8 = v7 ^ -[MIPSeries hash](self->_series, "hash");
  v9 = v6 ^ v8 ^ -[MIPMediaItem hash](self->_mediaItem, "hash");
  return v9 ^ -[MIPPlaylist hash](self->_playlist, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  MIPMultiverseIdentifier *multiverseId;
  uint64_t v7;
  MIPArtist *artist;
  uint64_t v9;
  MIPAlbum *album;
  uint64_t v11;
  MIPGenre *genre;
  uint64_t v13;
  MIPSeries *series;
  uint64_t v15;
  MIPMediaItem *mediaItem;
  uint64_t v17;
  MIPPlaylist *playlist;
  uint64_t v19;
  _QWORD *v20;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_operationType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  multiverseId = self->_multiverseId;
  v7 = v5[5];
  v20 = v5;
  if (multiverseId)
  {
    if (!v7)
      goto LABEL_9;
    -[MIPMultiverseIdentifier mergeFrom:](multiverseId, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[MSPMediaSyncOperation setMultiverseId:](self, "setMultiverseId:");
  }
  v5 = v20;
LABEL_9:
  artist = self->_artist;
  v9 = v5[2];
  if (artist)
  {
    if (!v9)
      goto LABEL_15;
    -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[MSPMediaSyncOperation setArtist:](self, "setArtist:");
  }
  v5 = v20;
LABEL_15:
  album = self->_album;
  v11 = v5[1];
  if (album)
  {
    if (!v11)
      goto LABEL_21;
    -[MIPAlbum mergeFrom:](album, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[MSPMediaSyncOperation setAlbum:](self, "setAlbum:");
  }
  v5 = v20;
LABEL_21:
  genre = self->_genre;
  v13 = v5[3];
  if (genre)
  {
    if (!v13)
      goto LABEL_27;
    -[MIPGenre mergeFrom:](genre, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[MSPMediaSyncOperation setGenre:](self, "setGenre:");
  }
  v5 = v20;
LABEL_27:
  series = self->_series;
  v15 = v5[8];
  if (series)
  {
    if (!v15)
      goto LABEL_33;
    -[MIPSeries mergeFrom:](series, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[MSPMediaSyncOperation setSeries:](self, "setSeries:");
  }
  v5 = v20;
LABEL_33:
  mediaItem = self->_mediaItem;
  v17 = v5[4];
  if (mediaItem)
  {
    if (!v17)
      goto LABEL_39;
    -[MIPMediaItem mergeFrom:](mediaItem, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_39;
    -[MSPMediaSyncOperation setMediaItem:](self, "setMediaItem:");
  }
  v5 = v20;
LABEL_39:
  playlist = self->_playlist;
  v19 = v5[7];
  if (playlist)
  {
    if (v19)
    {
      -[MIPPlaylist mergeFrom:](playlist, "mergeFrom:");
LABEL_44:
      v5 = v20;
    }
  }
  else if (v19)
  {
    -[MSPMediaSyncOperation setPlaylist:](self, "setPlaylist:");
    goto LABEL_44;
  }

}

- (MIPMultiverseIdentifier)multiverseId
{
  return self->_multiverseId;
}

- (void)setMultiverseId:(id)a3
{
  objc_storeStrong((id *)&self->_multiverseId, a3);
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (MIPAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (MIPGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (MIPSeries)series
{
  return self->_series;
}

- (void)setSeries:(id)a3
{
  objc_storeStrong((id *)&self->_series, a3);
}

- (MIPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (MIPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_multiverseId, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
