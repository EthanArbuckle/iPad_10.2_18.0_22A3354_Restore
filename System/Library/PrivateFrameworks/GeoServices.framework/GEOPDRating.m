@implementation GEOPDRating

+ (id)ratingForPlaceData:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  +[GEOPDRating ratingListForPlaceData:type:](GEOPDRating, "ratingListForPlaceData:type:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if ((_DWORD)v4 == 3)
    {
      +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        -[GEOPDResultSnippet _readPriceRange](v9);
        if (*(_QWORD *)(v10 + 72))
        {
          -[GEOPDResultSnippet priceRange]((id *)v10);
          v8 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
      }

    }
    v8 = 0;
    goto LABEL_9;
  }
  v8 = v7;
LABEL_9:

  return v8;
}

+ (id)ratingListForPlaceData:(id)a3 type:(int)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  int v16;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __60__GEOPDRating_PlaceDataExtras__ratingListForPlaceData_type___block_invoke;
  v14 = &unk_1E1C09790;
  v16 = a4;
  v15 = v7;
  v8 = v7;
  objc_msgSend(v6, "enumerateValidComponentValuesOfType:usingBlock:", 6, &v11);

  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);
  return v9;
}

void __60__GEOPDRating_PlaceDataExtras__ratingListForPlaceData_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  id *v8;

  v8 = a2;
  -[GEOPDComponentValue rating](v8);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (*(_BYTE *)(v3 + 48) & 8) != 0)
    v4 = *(_DWORD *)(v3 + 44);
  else
    v4 = 0;
  v5 = *(_DWORD *)(a1 + 40);

  if (v4 == v5)
  {
    v6 = *(void **)(a1 + 32);
    -[GEOPDComponentValue rating](v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (id)displayTitle
{
  void *v2;
  void *v3;

  -[GEOPDRating appleRatingCategorys]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a1 + 16);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "clearUnknownFields:", 1, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)appleRatingCategorys
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)addAppleRatingCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
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
  v8.super_class = (Class)GEOPDRating;
  -[GEOPDRating description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRating dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRating _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 8) != 0)
  {
    v6 = *(int *)(a1 + 44);
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C0C060[v6];
    }
    if (a2)
      v8 = CFSTR("ratingType");
    else
      v8 = CFSTR("rating_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 48);
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_12;
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("maxScore");
    else
      v29 = CFSTR("max_score");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
      goto LABEL_17;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("score"));

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 1) != 0)
    goto LABEL_38;
LABEL_12:
  if ((v5 & 4) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("numRatingsUsedForScore");
    else
      v10 = CFSTR("num_ratings_used_for_score");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
LABEL_17:
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = *(id *)(a1 + 16);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("appleRatingCategory");
    else
      v19 = CFSTR("apple_rating_category");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __41__GEOPDRating__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v24 = v23;
      v31 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v30);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRating _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOPDRating__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  GEOLocalizedString *v27;
  GEOLocalizedString *v28;
  GEOLocalizedString *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_51;
  if (a3)
    v7 = CFSTR("ratingType");
  else
    v7 = CFSTR("rating_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("USER_RATING")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("QUALITY_RATING")) & 1) != 0)
    {
      v10 = 2;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PRICE_RANGE")) & 1) != 0)
    {
      v10 = 3;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("APPLE_RATING")))
    {
      v10 = 4;
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v8, "intValue");
LABEL_20:
    *(_BYTE *)(v6 + 48) |= 8u;
    *(_DWORD *)(v6 + 44) = v10;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    *(_BYTE *)(v6 + 48) |= 2u;
    *(_QWORD *)(v6 + 32) = v12;
  }

  if (a3)
    v13 = CFSTR("maxScore");
  else
    v13 = CFSTR("max_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "doubleValue");
    *(_BYTE *)(v6 + 48) |= 1u;
    *(_QWORD *)(v6 + 24) = v15;
  }

  if (a3)
    v16 = CFSTR("numRatingsUsedForScore");
  else
    v16 = CFSTR("num_ratings_used_for_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(v17, "intValue");
    *(_BYTE *)(v6 + 48) |= 4u;
    *(_DWORD *)(v6 + 40) = v18;
  }

  if (a3)
    v19 = CFSTR("appleRatingCategory");
  else
    v19 = CFSTR("apple_rating_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v5;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = [GEOLocalizedString alloc];
            if ((a3 & 1) != 0)
              v28 = -[GEOLocalizedString initWithJSON:](v27, "initWithJSON:", v26);
            else
              v28 = -[GEOLocalizedString initWithDictionary:](v27, "initWithDictionary:", v26);
            v29 = v28;
            -[GEOPDRating addAppleRatingCategory:](v6, v28);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    v5 = v31;
  }

LABEL_51:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRatingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
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
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_appleRatingCategorys;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_ratingType;
    *(_BYTE *)(v5 + 48) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 32) = self->_score;
  *(_BYTE *)(v5 + 48) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  *(double *)(v5 + 24) = self->_maxScore;
  *(_BYTE *)(v5 + 48) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 40) = self->_numRatingsUsedForScore;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_appleRatingCategorys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        -[GEOPDRating addAppleRatingCategory:]((uint64_t)v6, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *appleRatingCategorys;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_ratingType != *((_DWORD *)v4 + 11))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_score != *((double *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_maxScore != *((double *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_numRatingsUsedForScore != *((_DWORD *)v4 + 10))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  appleRatingCategorys = self->_appleRatingCategorys;
  if ((unint64_t)appleRatingCategorys | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](appleRatingCategorys, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double maxScore;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_ratingType;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  score = self->_score;
  v6 = -score;
  if (score >= 0.0)
    v6 = self->_score;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 1) != 0)
  {
    maxScore = self->_maxScore;
    v12 = -maxScore;
    if (maxScore >= 0.0)
      v12 = self->_maxScore;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((flags & 4) != 0)
    v15 = 2654435761 * self->_numRatingsUsedForScore;
  else
    v15 = 0;
  return v9 ^ v4 ^ v10 ^ v15 ^ -[NSMutableArray hash](self->_appleRatingCategorys, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleRatingCategorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
