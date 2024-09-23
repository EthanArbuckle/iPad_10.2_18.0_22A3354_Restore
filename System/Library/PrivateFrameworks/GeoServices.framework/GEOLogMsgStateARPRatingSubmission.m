@implementation GEOLogMsgStateARPRatingSubmission

- (GEOLogMsgStateARPRatingSubmission)init
{
  GEOLogMsgStateARPRatingSubmission *v2;
  GEOLogMsgStateARPRatingSubmission *v3;
  GEOLogMsgStateARPRatingSubmission *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  v2 = -[GEOLogMsgStateARPRatingSubmission init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateARPRatingSubmission)initWithData:(id)a3
{
  GEOLogMsgStateARPRatingSubmission *v3;
  GEOLogMsgStateARPRatingSubmission *v4;
  GEOLogMsgStateARPRatingSubmission *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  v3 = -[GEOLogMsgStateARPRatingSubmission initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginTarget
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateARPRatingSubmissionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginTarget_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginTarget
{
  -[GEOLogMsgStateARPRatingSubmission _readOriginTarget]((uint64_t)self);
  return self->_originTarget != 0;
}

- (NSString)originTarget
{
  -[GEOLogMsgStateARPRatingSubmission _readOriginTarget]((uint64_t)self);
  return self->_originTarget;
}

- (void)setOriginTarget:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_originTarget, a3);
}

- (BOOL)isFromRecommendationCard
{
  return self->_isFromRecommendationCard;
}

- (void)setIsFromRecommendationCard:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_isFromRecommendationCard = a3;
}

- (void)setHasIsFromRecommendationCard:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsFromRecommendationCard
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isFromMapsSuggesions
{
  return self->_isFromMapsSuggesions;
}

- (void)setIsFromMapsSuggesions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_isFromMapsSuggesions = a3;
}

- (void)setHasIsFromMapsSuggesions:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasIsFromMapsSuggesions
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isPlacecardInlineSubmission
{
  return self->_isPlacecardInlineSubmission;
}

- (void)setIsPlacecardInlineSubmission:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_isPlacecardInlineSubmission = a3;
}

- (void)setHasIsPlacecardInlineSubmission:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsPlacecardInlineSubmission
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateARPRatingSubmissionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRatings_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)ratings
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  return self->_ratings;
}

- (void)setRatings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ratings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  ratings = self->_ratings;
  self->_ratings = v4;

}

- (void)clearRatings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_ratings, "removeAllObjects");
}

- (void)addRatings:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  -[GEOLogMsgStateARPRatingSubmission _addNoFlagsRatings:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsRatings:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)ratingsCount
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  return -[NSMutableArray count](self->_ratings, "count");
}

- (id)ratingsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStateARPRatingSubmission _readRatings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_ratings, "objectAtIndex:", a3);
}

+ (Class)ratingsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLogMsgStateARPRatingSubmission;
  -[GEOLogMsgStateARPRatingSubmission description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateARPRatingSubmission dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateARPRatingSubmission _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "originTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("originTarget");
    else
      v6 = CFSTR("origin_target");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 48);
  if ((v7 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) == 0)
      goto LABEL_9;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("isFromMapsSuggesions");
    else
      v22 = CFSTR("is_from_maps_suggesions");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
      goto LABEL_14;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("isFromRecommendationCard");
  else
    v20 = CFSTR("is_from_recommendation_card");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v7 = *(_BYTE *)(a1 + 48);
  if ((v7 & 1) != 0)
    goto LABEL_31;
LABEL_9:
  if ((v7 & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 46));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isPlacecardInlineSubmission");
    else
      v9 = CFSTR("is_placecard_inline_submission");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_14:
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = *(id *)(a1 + 24);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17, (_QWORD)v23);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ratings"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateARPRatingSubmission _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateARPRatingSubmission)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateARPRatingSubmission *)-[GEOLogMsgStateARPRatingSubmission _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  GEOARPRating *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originTarget");
      else
        v6 = CFSTR("origin_target");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setOriginTarget:", v8);

      }
      if (a3)
        v9 = CFSTR("isFromRecommendationCard");
      else
        v9 = CFSTR("is_from_recommendation_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsFromRecommendationCard:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("isFromMapsSuggesions");
      else
        v11 = CFSTR("is_from_maps_suggesions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsFromMapsSuggesions:", objc_msgSend(v12, "BOOLValue"));

      if (a3)
        v13 = CFSTR("isPlacecardInlineSubmission");
      else
        v13 = CFSTR("is_placecard_inline_submission");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsPlacecardInlineSubmission:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ratings"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v26 = v15;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = [GEOARPRating alloc];
                if ((a3 & 1) != 0)
                  v23 = -[GEOARPRating initWithJSON:](v22, "initWithJSON:", v21);
                else
                  v23 = -[GEOARPRating initWithDictionary:](v22, "initWithDictionary:", v21);
                v24 = (void *)v23;
                objc_msgSend(a1, "addRatings:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v18);
        }

        v15 = v26;
      }

    }
  }

  return a1;
}

- (GEOLogMsgStateARPRatingSubmission)initWithJSON:(id)a3
{
  return (GEOLogMsgStateARPRatingSubmission *)-[GEOLogMsgStateARPRatingSubmission _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_5480;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5481;
    GEOLogMsgStateARPRatingSubmissionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStateARPRatingSubmissionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateARPRatingSubmissionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateARPRatingSubmissionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
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
    if ((*(_BYTE *)&self->_flags & 0x38) == 0)
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
      goto LABEL_21;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateARPRatingSubmission readAll:](self, "readAll:", 0);
  if (self->_originTarget)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_18;
LABEL_7:
  if ((flags & 4) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_ratings;
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

LABEL_21:
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOLogMsgStateARPRatingSubmission readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 8) = self->_readerMarkPos;
  *((_DWORD *)v9 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originTarget)
    objc_msgSend(v9, "setOriginTarget:");
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
LABEL_13:
    *((_BYTE *)v9 + 44) = self->_isFromMapsSuggesions;
    *((_BYTE *)v9 + 48) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_BYTE *)v9 + 45) = self->_isFromRecommendationCard;
  *((_BYTE *)v9 + 48) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_5:
  if ((flags & 4) != 0)
  {
LABEL_6:
    *((_BYTE *)v9 + 46) = self->_isPlacecardInlineSubmission;
    *((_BYTE *)v9 + 48) |= 4u;
  }
LABEL_7:
  if (-[GEOLogMsgStateARPRatingSubmission ratingsCount](self, "ratingsCount"))
  {
    objc_msgSend(v9, "clearRatings");
    v5 = -[GEOLogMsgStateARPRatingSubmission ratingsCount](self, "ratingsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgStateARPRatingSubmission ratingsAtIndex:](self, "ratingsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRatings:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  char flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgStateARPRatingSubmissionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateARPRatingSubmission readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_originTarget, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 45) = self->_isFromRecommendationCard;
    *(_BYTE *)(v5 + 48) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 44) = self->_isFromMapsSuggesions;
  *(_BYTE *)(v5 + 48) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 46) = self->_isPlacecardInlineSubmission;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_9:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_ratings;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addRatings:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *originTarget;
  char v6;
  NSMutableArray *ratings;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOLogMsgStateARPRatingSubmission readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  originTarget = self->_originTarget;
  if ((unint64_t)originTarget | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](originTarget, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_24;
    if (self->_isFromRecommendationCard)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0)
      goto LABEL_24;
    if (self->_isFromMapsSuggesions)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0)
      goto LABEL_30;
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 48) & 4) == 0)
    goto LABEL_24;
  if (!self->_isPlacecardInlineSubmission)
  {
    if (!*((_BYTE *)v4 + 46))
      goto LABEL_30;
    goto LABEL_24;
  }
  if (!*((_BYTE *)v4 + 46))
    goto LABEL_24;
LABEL_30:
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((_QWORD *)v4 + 3))
    v6 = -[NSMutableArray isEqual:](ratings, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgStateARPRatingSubmission readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_originTarget, "hash");
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_ratings, "hash");
  }
  v4 = 2654435761 * self->_isFromRecommendationCard;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_isFromMapsSuggesions;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_isPlacecardInlineSubmission;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_ratings, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
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
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 2))
    -[GEOLogMsgStateARPRatingSubmission setOriginTarget:](self, "setOriginTarget:");
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_isFromRecommendationCard = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_isFromMapsSuggesions = *((_BYTE *)v4 + 44);
  *(_BYTE *)&self->_flags |= 1u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_6:
    self->_isPlacecardInlineSubmission = *((_BYTE *)v4 + 46);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_7:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[GEOLogMsgStateARPRatingSubmission addRatings:](self, "addRatings:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_originTarget, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
