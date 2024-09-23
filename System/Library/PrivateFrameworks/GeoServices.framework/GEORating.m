@implementation GEORating

- (GEORating)init
{
  GEORating *v2;
  GEORating *v3;
  GEORating *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORating;
  v2 = -[GEORating init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORating)initWithData:(id)a3
{
  GEORating *v3;
  GEORating *v4;
  GEORating *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORating;
  v3 = -[GEORating initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addReview:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEORatingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReviews_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEORating _addNoFlagsReview:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 92) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 92) |= 0x200u;
  }
}

- (void)_addNoFlagsReview:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEORating;
  -[GEORating description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORating dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORating _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEORating readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 92);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("score"));

    v5 = *(_WORD *)(a1 + 92);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("maxScore"));

    v5 = *(_WORD *)(a1 + 92);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 84));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numberOfRatings"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEORatingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProvider_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v11 = *(id *)(a1 + 40);
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("provider"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEORatingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readURL_tags_2614);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v14 = *(id *)(a1 + 24);
  if (v14)
  {
    if (a2)
      v15 = CFSTR("uRL");
    else
      v15 = CFSTR("URL");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("review"));
  }
  if ((*(_WORD *)(a1 + 92) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 88));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("numberOfReviews"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEORatingReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRatingCategoryId_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v26 = *(id *)(a1 + 48);
  if (v26)
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("ratingCategoryId"));

  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __39__GEORating__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

    }
    else
    {
      v32 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORating _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2630;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2631;
      GEORatingReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEORatingCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __39__GEORating__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (BOOL)readFrom:(id)a3
{
  return GEORatingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3E0) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v12);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_27;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORating readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_5;
LABEL_24:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_24;
LABEL_5:
  if ((flags & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_provider)
    PBDataWriterWriteStringField();
  if (self->_uRL)
    PBDataWriterWriteStringField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_reviews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_ratingCategoryId)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_27:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  PBUnknownFields *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORatingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORating readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_7;
LABEL_21:
    *(double *)(v5 + 32) = self->_maxScore;
    *(_WORD *)(v5 + 92) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(double *)(v5 + 64) = self->_score;
  *(_WORD *)(v5 + 92) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_21;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 84) = self->_numberOfRatings;
    *(_WORD *)(v5 + 92) |= 4u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_reviews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        -[GEORating addReview:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_numberOfReviews;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  v19 = -[NSString copyWithZone:](self->_ratingCategoryId, "copyWithZone:", a3, (_QWORD)v23);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *provider;
  NSString *uRL;
  NSMutableArray *reviews;
  __int16 v10;
  NSString *ratingCategoryId;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEORating readAll:]((uint64_t)self, 1);
  -[GEORating readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_score != *((double *)v4 + 8))
      goto LABEL_30;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_30:
    v12 = 0;
    goto LABEL_31;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_maxScore != *((double *)v4 + 4))
      goto LABEL_30;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfRatings != *((_DWORD *)v4 + 21))
      goto LABEL_30;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_30;
  }
  provider = self->_provider;
  if ((unint64_t)provider | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](provider, "isEqual:"))
    goto LABEL_30;
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:"))
      goto LABEL_30;
  }
  reviews = self->_reviews;
  if ((unint64_t)reviews | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](reviews, "isEqual:"))
      goto LABEL_30;
  }
  v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_numberOfReviews != *((_DWORD *)v4 + 22))
      goto LABEL_30;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_30;
  }
  ratingCategoryId = self->_ratingCategoryId;
  if ((unint64_t)ratingCategoryId | *((_QWORD *)v4 + 6))
    v12 = -[NSString isEqual:](ratingCategoryId, "isEqual:");
  else
    v12 = 1;
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double maxScore;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;

  -[GEORating readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    score = self->_score;
    v6 = -score;
    if (score >= 0.0)
      v6 = self->_score;
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
  if ((flags & 1) != 0)
  {
    maxScore = self->_maxScore;
    v11 = -maxScore;
    if (maxScore >= 0.0)
      v11 = self->_maxScore;
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
  if ((flags & 4) != 0)
    v14 = 2654435761 * self->_numberOfRatings;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_provider, "hash");
  v16 = -[NSString hash](self->_uRL, "hash");
  v17 = -[NSMutableArray hash](self->_reviews, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v18 = 2654435761 * self->_numberOfReviews;
  else
    v18 = 0;
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSString hash](self->_ratingCategoryId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviews, 0);
  objc_storeStrong((id *)&self->_ratingCategoryId, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEORating)initWithSampleSizeForUserRatingScore:(unsigned int)a3 normalizedUserRatingScore:(float)a4
{
  GEORating *v6;
  GEORating *v7;
  GEORating *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEORating;
  v6 = -[GEORating init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 8u;
    v6->_numberOfReviews = a3;
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 2u;
    v6->_score = a4;
    *(_WORD *)&v6->_flags |= 0x200u;
    *(_WORD *)&v6->_flags |= 1u;
    v6->_maxScore = 100.0;
    v8 = v6;
  }

  return v7;
}

@end
