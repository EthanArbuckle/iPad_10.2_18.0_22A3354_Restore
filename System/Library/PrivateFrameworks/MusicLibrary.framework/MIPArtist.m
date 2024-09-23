@implementation MIPArtist

- (void)setStoreId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_storeId = a3;
}

- (void)setHasStoreId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStoreId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasSortName
{
  return self->_sortName != 0;
}

- (BOOL)hasArtworkId
{
  return self->_artworkId != 0;
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

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (void)setLikedState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_likedState = a3;
}

- (void)setHasLikedState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLikedState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (void)setSortOrder:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sortOrder = a3;
}

- (void)setHasSortOrder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSortOrder
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSortOrderSection:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sortOrderSection = a3;
}

- (void)setHasSortOrderSection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSortOrderSection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)MIPArtist;
  -[MIPArtist description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPArtist dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *artworkId;
  void *v8;
  NSString *cloudUniversalLibraryId;
  char has;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
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
  artworkId = self->_artworkId;
  if (artworkId)
    objc_msgSend(v3, "setObject:forKey:", artworkId, CFSTR("artworkId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentId);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("persistentId"));

  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId)
    objc_msgSend(v3, "setObject:forKey:", cloudUniversalLibraryId, CFSTR("cloudUniversalLibraryId"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_likedState);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("likedState"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_likedStateChangedDate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("likedStateChangedDate"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sortOrder);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sortOrder"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sortOrderSection);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("sortOrderSection"));

  }
LABEL_18:
  if (-[NSMutableArray count](self->_libraryIdentifiers, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = self->_libraryIdentifiers;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("libraryIdentifiers"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPArtistReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_sortName)
    PBDataWriterWriteStringField();
  if (self->_artworkId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_cloudUniversalLibraryId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_16;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_17:
    PBDataWriterWriteInt64Field();
LABEL_18:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_libraryIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_storeId;
    *((_BYTE *)v4 + 96) |= 0x10u;
  }
  v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v10;
  }
  if (self->_sortName)
  {
    objc_msgSend(v10, "setSortName:");
    v4 = v10;
  }
  if (self->_artworkId)
  {
    objc_msgSend(v10, "setArtworkId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_persistentId;
    *((_BYTE *)v4 + 96) |= 2u;
  }
  if (self->_cloudUniversalLibraryId)
  {
    objc_msgSend(v10, "setCloudUniversalLibraryId:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_likedState;
    *((_BYTE *)v4 + 96) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_15:
      if ((has & 4) == 0)
        goto LABEL_16;
LABEL_25:
      v4[3] = self->_sortOrder;
      *((_BYTE *)v4 + 96) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  v4[1] = self->_likedStateChangedDate;
  *((_BYTE *)v4 + 96) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_25;
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_17:
    v4[4] = self->_sortOrderSection;
    *((_BYTE *)v4 + 96) |= 8u;
  }
LABEL_18:
  if (-[MIPArtist libraryIdentifiersCount](self, "libraryIdentifiersCount"))
  {
    objc_msgSend(v10, "clearLibraryIdentifiers");
    v6 = -[MIPArtist libraryIdentifiersCount](self, "libraryIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[MIPArtist libraryIdentifiersAtIndex:](self, "libraryIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addLibraryIdentifiers:", v9);

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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char has;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_storeId;
    *(_BYTE *)(v5 + 96) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v7;

  v9 = -[NSString copyWithZone:](self->_sortName, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_artworkId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_persistentId;
    *(_BYTE *)(v6 + 96) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_cloudUniversalLibraryId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v13;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_likedState;
    *(_BYTE *)(v6 + 96) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 8) = self->_likedStateChangedDate;
  *(_BYTE *)(v6 + 96) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_20:
  *(_QWORD *)(v6 + 24) = self->_sortOrder;
  *(_BYTE *)(v6 + 96) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 32) = self->_sortOrderSection;
    *(_BYTE *)(v6 + 96) |= 8u;
  }
LABEL_10:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_libraryIdentifiers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend((id)v6, "addLibraryIdentifiers:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *sortName;
  NSString *artworkId;
  char has;
  char v9;
  NSString *cloudUniversalLibraryId;
  NSMutableArray *libraryIdentifiers;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 0x10) == 0 || self->_storeId != *((_QWORD *)v4 + 5))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 96) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_43;
  sortName = self->_sortName;
  if ((unint64_t)sortName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](sortName, "isEqual:"))
      goto LABEL_43;
  }
  artworkId = self->_artworkId;
  if ((unint64_t)artworkId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](artworkId, "isEqual:"))
      goto LABEL_43;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 96);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_persistentId != *((_QWORD *)v4 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_43;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
    {
LABEL_43:
      v12 = 0;
      goto LABEL_44;
    }
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 96);
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_likedState != *((_DWORD *)v4 + 18))
      goto LABEL_43;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_likedStateChangedDate != *((_QWORD *)v4 + 1))
      goto LABEL_43;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_sortOrder != *((_QWORD *)v4 + 3))
      goto LABEL_43;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_sortOrderSection != *((_QWORD *)v4 + 4))
      goto LABEL_43;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_43;
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((_QWORD *)v4 + 8))
    v12 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  else
    v12 = 1;
LABEL_44:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_storeId;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSString hash](self->_sortName, "hash");
  v6 = -[NSString hash](self->_artworkId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_persistentId;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_cloudUniversalLibraryId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v9 = 2654435761 * self->_likedState;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_9:
      v10 = 2654435761 * self->_likedStateChangedDate;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_10;
LABEL_14:
      v11 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_11;
LABEL_15:
      v12 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_libraryIdentifiers, "hash");
    }
  }
  else
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_9;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_10:
  v11 = 2654435761 * self->_sortOrder;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_11:
  v12 = 2654435761 * self->_sortOrderSection;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_libraryIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  char v6;
  id v7;
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
  v5 = v4;
  if ((v4[12] & 0x10) != 0)
  {
    self->_storeId = v4[5];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (v4[10])
    -[MIPArtist setName:](self, "setName:");
  if (*((_QWORD *)v5 + 11))
    -[MIPArtist setSortName:](self, "setSortName:");
  if (*((_QWORD *)v5 + 6))
    -[MIPArtist setArtworkId:](self, "setArtworkId:");
  if ((*((_BYTE *)v5 + 96) & 2) != 0)
  {
    self->_persistentId = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 7))
    -[MIPArtist setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  v6 = *((_BYTE *)v5 + 96);
  if ((v6 & 0x20) != 0)
  {
    self->_likedState = *((_DWORD *)v5 + 18);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v5 + 96);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 4) == 0)
        goto LABEL_16;
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v5 + 96) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_likedStateChangedDate = *((_QWORD *)v5 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v5 + 96);
  if ((v6 & 4) == 0)
  {
LABEL_16:
    if ((v6 & 8) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_28:
  self->_sortOrder = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v5 + 96) & 8) != 0)
  {
LABEL_17:
    self->_sortOrderSection = *((_QWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_18:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[MIPArtist addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
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

- (NSString)artworkId
{
  return self->_artworkId;
}

- (void)setArtworkId:(id)a3
{
  objc_storeStrong((id *)&self->_artworkId, a3);
}

- (int64_t)persistentId
{
  return self->_persistentId;
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, a3);
}

- (int)likedState
{
  return self->_likedState;
}

- (int64_t)likedStateChangedDate
{
  return self->_likedStateChangedDate;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (int64_t)sortOrderSection
{
  return self->_sortOrderSection;
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
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);
  objc_storeStrong((id *)&self->_artworkId, 0);
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
