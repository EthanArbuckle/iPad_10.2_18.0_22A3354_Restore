@implementation MIPAlbum

- (void)setStoreId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStoreId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasSortName
{
  return self->_sortName != 0;
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)setNumTracks:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numTracks = a3;
}

- (void)setHasNumTracks:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumTracks
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumDiscs:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numDiscs = a3;
}

- (void)setHasNumDiscs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumDiscs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
}

- (void)setUserRating:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_userRating = a3;
}

- (void)setHasUserRating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserRating
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCompilation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_compilation = a3;
}

- (void)setHasCompilation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasCompilation
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPersistentId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_persistentId = a3;
}

- (void)setHasPersistentId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPersistentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCloudId
{
  return self->_cloudId != 0;
}

- (void)setLikedState:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_likedState = a3;
}

- (void)setHasLikedState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLikedState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLikedStateChangedDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_likedStateChangedDate = a3;
}

- (void)setHasLikedStateChangedDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLikedStateChangedDate
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)MIPAlbum;
  -[MIPAlbum description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPAlbum dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sortName;
  MIPArtist *artist;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSString *artworkId;
  char v13;
  void *v14;
  NSString *cloudId;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_storeId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("storeId"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  sortName = self->_sortName;
  if (sortName)
    objc_msgSend(v3, "setObject:forKey:", sortName, CFSTR("sortName"));
  artist = self->_artist;
  if (artist)
  {
    -[MIPArtist dictionaryRepresentation](artist, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("artist"));

  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numTracks);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numTracks"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numDiscs);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("numDiscs"));

  }
  artworkId = self->_artworkId;
  if (artworkId)
    objc_msgSend(v3, "setObject:forKey:", artworkId, CFSTR("artworkId"));
  v13 = (char)self->_has;
  if ((v13 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_userRating);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("userRating"));

    v13 = (char)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_17:
      if ((v13 & 2) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compilation);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("compilation"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentId);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("persistentId"));

  }
LABEL_19:
  cloudId = self->_cloudId;
  if (cloudId)
    objc_msgSend(v3, "setObject:forKey:", cloudId, CFSTR("cloudId"));
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_likedState);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("likedState"));

    v16 = (char)self->_has;
  }
  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_likedStateChangedDate);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("likedStateChangedDate"));

  }
  if (-[NSMutableArray count](self->_libraryIdentifiers, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = self->_libraryIdentifiers;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("libraryIdentifiers"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPAlbumReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  char v7;
  NSMutableArray *v8;
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
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_sortName)
    PBDataWriterWriteStringField();
  if (self->_artist)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_artworkId)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 2) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_18:
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_cloudId)
    PBDataWriterWriteStringField();
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
    PBDataWriterWriteInt64Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_libraryIdentifiers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD *v12;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[3] = self->_storeId;
    *((_BYTE *)v4 + 104) |= 4u;
  }
  v12 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v12;
  }
  if (self->_sortName)
  {
    objc_msgSend(v12, "setSortName:");
    v4 = v12;
  }
  if (self->_artist)
  {
    objc_msgSend(v12, "setArtist:");
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_numTracks;
    *((_BYTE *)v4 + 104) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_numDiscs;
    *((_BYTE *)v4 + 104) |= 0x10u;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v12, "setArtworkId:");
    v4 = v12;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_userRating;
    *((_BYTE *)v4 + 104) |= 0x40u;
    v6 = (char)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 2) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v4 + 100) = self->_compilation;
  *((_BYTE *)v4 + 104) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_18:
    v4[2] = self->_persistentId;
    *((_BYTE *)v4 + 104) |= 2u;
  }
LABEL_19:
  if (self->_cloudId)
  {
    objc_msgSend(v12, "setCloudId:");
    v4 = v12;
  }
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_likedState;
    *((_BYTE *)v4 + 104) |= 8u;
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
  {
    v4[1] = self->_likedStateChangedDate;
    *((_BYTE *)v4 + 104) |= 1u;
  }
  if (-[MIPAlbum libraryIdentifiersCount](self, "libraryIdentifiersCount"))
  {
    objc_msgSend(v12, "clearLibraryIdentifiers");
    v8 = -[MIPAlbum libraryIdentifiersCount](self, "libraryIdentifiersCount");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[MIPAlbum libraryIdentifiersAtIndex:](self, "libraryIdentifiersAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addLibraryIdentifiers:", v11);

      }
    }
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
  id v11;
  void *v12;
  char has;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_storeId;
    *(_BYTE *)(v5 + 104) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v7;

  v9 = -[NSString copyWithZone:](self->_sortName, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  v11 = -[MIPArtist copyWithZone:](self->_artist, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_numTracks;
    *(_BYTE *)(v6 + 104) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_numDiscs;
    *(_BYTE *)(v6 + 104) |= 0x10u;
  }
  v14 = -[NSString copyWithZone:](self->_artworkId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v14;

  v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_userRating;
    *(_BYTE *)(v6 + 104) |= 0x40u;
    v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_9:
      if ((v16 & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *(_BYTE *)(v6 + 100) = self->_compilation;
  *(_BYTE *)(v6 + 104) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    *(_QWORD *)(v6 + 16) = self->_persistentId;
    *(_BYTE *)(v6 + 104) |= 2u;
  }
LABEL_11:
  v17 = -[NSString copyWithZone:](self->_cloudId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v17;

  v19 = (char)self->_has;
  if ((v19 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_likedState;
    *(_BYTE *)(v6 + 104) |= 8u;
    v19 = (char)self->_has;
  }
  if ((v19 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_likedStateChangedDate;
    *(_BYTE *)(v6 + 104) |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_libraryIdentifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v6, "addLibraryIdentifiers:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *sortName;
  MIPArtist *artist;
  char has;
  char v9;
  NSString *artworkId;
  NSString *cloudId;
  NSMutableArray *libraryIdentifiers;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_storeId != *((_QWORD *)v4 + 3))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_59;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_59;
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](sortName, "isEqual:"))
      goto LABEL_59;
  }
  artist = self->_artist;
  if ((unint64_t)artist | *((_QWORD *)v4 + 4))
  {
    if (!-[MIPArtist isEqual:](artist, "isEqual:"))
      goto LABEL_59;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 104);
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x20) == 0 || self->_numTracks != *((_DWORD *)v4 + 21))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) == 0 || self->_numDiscs != *((_DWORD *)v4 + 20))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:"))
      goto LABEL_59;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 104);
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_userRating != *((_DWORD *)v4 + 24))
      goto LABEL_59;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if (has < 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_59;
    if (self->_compilation)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_59;
    }
  }
  else if (v9 < 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_persistentId != *((_QWORD *)v4 + 2))
      goto LABEL_59;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_59;
  }
  cloudId = self->_cloudId;
  if ((unint64_t)cloudId | *((_QWORD *)v4 + 6))
  {
    if (-[NSString isEqual:](cloudId, "isEqual:"))
    {
      has = (char)self->_has;
      v9 = *((_BYTE *)v4 + 104);
      goto LABEL_45;
    }
LABEL_59:
    v13 = 0;
    goto LABEL_60;
  }
LABEL_45:
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_likedState != *((_DWORD *)v4 + 16))
      goto LABEL_59;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_likedStateChangedDate != *((_QWORD *)v4 + 1))
      goto LABEL_59;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_59;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((_QWORD *)v4 + 7))
    v13 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  else
    v13 = 1;
LABEL_60:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_storeId;
  else
    v19 = 0;
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_sortName, "hash");
  v5 = -[MIPArtist hash](self->_artist, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v6 = 2654435761 * self->_numTracks;
  else
    v6 = 0;
  v20 = v6;
  v7 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v8 = 2654435761 * self->_numDiscs;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_artworkId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v10 = 2654435761 * self->_userRating;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_12;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      v11 = 2654435761 * self->_compilation;
      goto LABEL_15;
    }
  }
  v11 = 0;
LABEL_15:
  v12 = v10;
  v13 = v9;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v14 = 2654435761 * self->_persistentId;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_cloudId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v16 = 2654435761 * self->_likedState;
  else
    v16 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v17 = 2654435761 * self->_likedStateChangedDate;
  else
    v17 = 0;
  return v3 ^ v19 ^ v4 ^ v7 ^ v20 ^ v8 ^ v13 ^ v12 ^ v11 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSMutableArray hash](self->_libraryIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  MIPArtist *artist;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[13] & 4) != 0)
  {
    self->_storeId = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (v4[9])
    -[MIPAlbum setName:](self, "setName:");
  if (*((_QWORD *)v5 + 11))
    -[MIPAlbum setSortName:](self, "setSortName:");
  artist = self->_artist;
  v7 = *((_QWORD *)v5 + 4);
  if (artist)
  {
    if (v7)
      -[MIPArtist mergeFrom:](artist, "mergeFrom:");
  }
  else if (v7)
  {
    -[MIPAlbum setArtist:](self, "setArtist:");
  }
  v8 = *((_BYTE *)v5 + 104);
  if ((v8 & 0x20) != 0)
  {
    self->_numTracks = *((_DWORD *)v5 + 21);
    *(_BYTE *)&self->_has |= 0x20u;
    v8 = *((_BYTE *)v5 + 104);
  }
  if ((v8 & 0x10) != 0)
  {
    self->_numDiscs = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 5))
    -[MIPAlbum setArtworkId:](self, "setArtworkId:");
  v9 = *((_BYTE *)v5 + 104);
  if ((v9 & 0x40) != 0)
  {
    self->_userRating = *((_DWORD *)v5 + 24);
    *(_BYTE *)&self->_has |= 0x40u;
    v9 = *((_BYTE *)v5 + 104);
    if ((v9 & 0x80) == 0)
    {
LABEL_20:
      if ((v9 & 2) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v5 + 104) & 0x80) == 0)
  {
    goto LABEL_20;
  }
  self->_compilation = *((_BYTE *)v5 + 100);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)v5 + 104) & 2) != 0)
  {
LABEL_21:
    self->_persistentId = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_22:
  if (*((_QWORD *)v5 + 6))
    -[MIPAlbum setCloudId:](self, "setCloudId:");
  v10 = *((_BYTE *)v5 + 104);
  if ((v10 & 8) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 8u;
    v10 = *((_BYTE *)v5 + 104);
  }
  if ((v10 & 1) != 0)
  {
    self->_likedStateChangedDate = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[MIPAlbum addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (int64_t)storeId
{
  return self->_storeId;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)sortName
{
  return self->_sortName;
}

- (void)setSortName:(id)a3
{
  objc_storeStrong((id *)&self->_sortName, a3);
}

- (MIPArtist)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (int)numTracks
{
  return self->_numTracks;
}

- (int)numDiscs
{
  return self->_numDiscs;
}

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setArtworkId:(id)a3
{
  objc_storeStrong((id *)&self->_artworkId, a3);
}

- (int)userRating
{
  return self->_userRating;
}

- (BOOL)compilation
{
  return self->_compilation;
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (NSString)cloudId
{
  return self->_cloudId;
}

- (void)setCloudId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudId, a3);
}

- (int)likedState
{
  return self->_likedState;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudId, 0);
  objc_storeStrong((id *)&self->_artworkId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
