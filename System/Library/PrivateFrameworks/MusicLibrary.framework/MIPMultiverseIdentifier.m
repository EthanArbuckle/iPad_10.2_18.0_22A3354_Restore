@implementation MIPMultiverseIdentifier

- (int)mediaObjectType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_mediaObjectType;
  else
    return 1;
}

- (void)setMediaObjectType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_mediaObjectType = a3;
}

- (void)setHasMediaObjectType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMediaObjectType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)mediaObjectTypeAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E5B63658[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediaObjectType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Composer")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Series")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaItem")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumArtist")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)mediaType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_mediaType;
  else
    return 1;
}

- (void)setMediaType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMediaType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xD)
    return off_1E5B63698[a3 - 1];
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

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setAccountId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountId
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStoreId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStoreId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSagaId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sagaId = a3;
}

- (void)setHasSagaId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSagaId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPurchaseHistoryId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_purchaseHistoryId = a3;
}

- (void)setHasPurchaseHistoryId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPurchaseHistoryId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (BOOL)hasCloudLibraryId
{
  return self->_cloudLibraryId != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MIPMultiverseIdentifier;
  -[MIPMultiverseIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPMultiverseIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  NSString *name;
  char v10;
  void *v11;
  NSString *cloudUniversalLibraryId;
  NSString *cloudLibraryId;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = self->_mediaObjectType - 1;
    if (v5 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaObjectType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5B63658[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mediaObjectType"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v7 = self->_mediaType - 1;
    if (v7 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5B63698[v7];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mediaType"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_accountId);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("accountId"));

    v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_15:
      if ((v10 & 4) == 0)
        goto LABEL_16;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storeId);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("storeId"));

  v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_16:
    if ((v10 & 2) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sagaId);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("sagaId"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_purchaseHistoryId);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("purchaseHistoryId"));

  }
LABEL_18:
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId)
    objc_msgSend(v3, "setObject:forKey:", cloudUniversalLibraryId, CFSTR("cloudUniversalLibraryId"));
  cloudLibraryId = self->_cloudLibraryId;
  if (cloudLibraryId)
    objc_msgSend(v3, "setObject:forKey:", cloudLibraryId, CFSTR("cloudLibraryId"));
  if (-[NSMutableArray count](self->_libraryIdentifiers, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = self->_libraryIdentifiers;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("libraryIdentifiers"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPMultiverseIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_10;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_11:
    PBDataWriterWriteInt64Field();
LABEL_12:
  if (self->_cloudUniversalLibraryId)
    PBDataWriterWriteStringField();
  if (self->_cloudLibraryId)
    PBDataWriterWriteStringField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_libraryIdentifiers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  _DWORD *v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[16] = self->_mediaObjectType;
    *((_BYTE *)v4 + 80) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v4[17] = self->_mediaType;
    *((_BYTE *)v4 + 80) |= 0x20u;
  }
  v11 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v11;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_accountId;
    *((_BYTE *)v4 + 80) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 4) = self->_storeId;
  *((_BYTE *)v4 + 80) |= 8u;
  v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  *((_QWORD *)v4 + 3) = self->_sagaId;
  *((_BYTE *)v4 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 2) = self->_purchaseHistoryId;
    *((_BYTE *)v4 + 80) |= 2u;
  }
LABEL_12:
  if (self->_cloudUniversalLibraryId)
    objc_msgSend(v11, "setCloudUniversalLibraryId:");
  if (self->_cloudLibraryId)
    objc_msgSend(v11, "setCloudLibraryId:");
  if (-[MIPMultiverseIdentifier libraryIdentifiersCount](self, "libraryIdentifiersCount"))
  {
    objc_msgSend(v11, "clearLibraryIdentifiers");
    v7 = -[MIPMultiverseIdentifier libraryIdentifiersCount](self, "libraryIdentifiersCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[MIPMultiverseIdentifier libraryIdentifiersAtIndex:](self, "libraryIdentifiersAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addLibraryIdentifiers:", v10);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_mediaObjectType;
    *(_BYTE *)(v5 + 80) |= 0x10u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_mediaType;
    *(_BYTE *)(v5 + 80) |= 0x20u;
  }
  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_accountId;
    *(_BYTE *)(v6 + 80) |= 1u;
    v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 4) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 32) = self->_storeId;
  *(_BYTE *)(v6 + 80) |= 8u;
  v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_8:
    if ((v10 & 2) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_20:
  *(_QWORD *)(v6 + 24) = self->_sagaId;
  *(_BYTE *)(v6 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 16) = self->_purchaseHistoryId;
    *(_BYTE *)(v6 + 80) |= 2u;
  }
LABEL_10:
  v11 = -[NSString copyWithZone:](self->_cloudUniversalLibraryId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_cloudLibraryId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_libraryIdentifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v6, "addLibraryIdentifiers:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *name;
  NSString *cloudUniversalLibraryId;
  NSString *cloudLibraryId;
  NSMutableArray *libraryIdentifiers;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 80);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_mediaObjectType != *((_DWORD *)v4 + 16))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x20) == 0 || self->_mediaType != *((_DWORD *)v4 + 17))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_41:
      v11 = 0;
      goto LABEL_42;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_accountId != *((_QWORD *)v4 + 1))
      goto LABEL_41;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_storeId != *((_QWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sagaId != *((_QWORD *)v4 + 3))
      goto LABEL_41;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_purchaseHistoryId != *((_QWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_41;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
  {
    goto LABEL_41;
  }
  cloudLibraryId = self->_cloudLibraryId;
  if ((unint64_t)cloudLibraryId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](cloudLibraryId, "isEqual:"))
      goto LABEL_41;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((_QWORD *)v4 + 7))
    v11 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  else
    v11 = 1;
LABEL_42:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_mediaObjectType;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_mediaType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_accountId;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_storeId;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_9;
LABEL_13:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_10;
LABEL_14:
      v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_9:
  v8 = 2654435761 * self->_sagaId;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_10:
  v9 = 2654435761 * self->_purchaseHistoryId;
LABEL_15:
  v10 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
  v11 = -[NSString hash](self->_cloudUniversalLibraryId, "hash");
  v12 = v10 ^ v11 ^ -[NSString hash](self->_cloudLibraryId, "hash");
  return v12 ^ -[NSMutableArray hash](self->_libraryIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  char v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (int *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 80);
  if ((v6 & 0x10) != 0)
  {
    self->_mediaObjectType = v4[16];
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_mediaType = v4[17];
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 9))
    -[MIPMultiverseIdentifier setName:](self, "setName:");
  v7 = *((_BYTE *)v5 + 80);
  if ((v7 & 1) != 0)
  {
    self->_accountId = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v5 + 80);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_26;
    }
  }
  else if ((v5[20] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_storeId = *((_QWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v7 = *((_BYTE *)v5 + 80);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_26:
  self->_sagaId = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((v5[20] & 2) != 0)
  {
LABEL_11:
    self->_purchaseHistoryId = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_12:
  if (*((_QWORD *)v5 + 6))
    -[MIPMultiverseIdentifier setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  if (*((_QWORD *)v5 + 5))
    -[MIPMultiverseIdentifier setCloudLibraryId:](self, "setCloudLibraryId:");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[MIPMultiverseIdentifier addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
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

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (int64_t)sagaId
{
  return self->_sagaId;
}

- (int64_t)purchaseHistoryId
{
  return self->_purchaseHistoryId;
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, a3);
}

- (NSString)cloudLibraryId
{
  return self->_cloudLibraryId;
}

- (void)setCloudLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudLibraryId, a3);
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setLibraryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_libraryIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_cloudLibraryId, 0);
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
