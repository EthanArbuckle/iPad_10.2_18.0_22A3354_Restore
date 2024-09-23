@implementation ATXPBAppDirectoryEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 8u;
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 3) & 1;
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 0x10u;
    *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 4) & 1;
  return result;
}

- (uint64_t)setCategoryID:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 2u;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasCategoryID:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasCategoryID
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 1) & 1;
  return result;
}

- (uint64_t)setCategoryIndex:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 4u;
    *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasCategoryIndex:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasCategoryIndex
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 2) & 1;
  return result;
}

- (BOOL)hasBundleId
{
  if (result)
    return *(_QWORD *)(result + 72) != 0;
  return result;
}

- (uint64_t)setBundleIndex:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasBundleIndex:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xFE | a2;
  return result;
}

- (uint64_t)hasBundleIndex
{
  if (result)
    return *(_BYTE *)(result + 104) & 1;
  return result;
}

- (uint64_t)setSearchQueryLength:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 0x20u;
    *(_QWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchQueryLength:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 32;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasSearchQueryLength
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 5) & 1;
  return result;
}

- (uint64_t)setSearchTab:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 104) |= 0x40u;
    *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchTab:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 64;
    else
      v2 = 0;
    *(_BYTE *)(result + 104) = *(_BYTE *)(result + 104) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasSearchTab
{
  if (result)
    return (*(unsigned __int8 *)(result + 104) >> 6) & 1;
  return result;
}

- (BOOL)hasBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 64) != 0;
  return result;
}

- (uint64_t)clearShownSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 96), "removeAllObjects");
  return result;
}

- (void)addShownSuggestionIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)shownSuggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 96), "count");
  return result;
}

- (id)shownSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[12], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearEngagedSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "removeAllObjects");
  return result;
}

- (void)addEngagedSuggestionIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)engagedSuggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "count");
  return result;
}

- (id)engagedSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[10], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)hasMetadata
{
  if (result)
    return *(_QWORD *)(result + 88) != 0;
  return result;
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
  v8.super_class = (Class)ATXPBAppDirectoryEvent;
  -[ATXPBAppDirectoryEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBAppDirectoryEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *bundleId;
  char v7;
  void *v8;
  NSString *blendingCacheId;
  NSMutableArray *shownSuggestionIds;
  NSMutableArray *engagedSuggestionIds;
  ATXPBAppDirectoryEventMetadata *metadata;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("date"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_eventType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("eventType"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_categoryID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("categoryID"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_categoryIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("categoryIndex"));

  }
LABEL_6:
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  v7 = (char)self->_has;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bundleIndex);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("bundleIndex"));

    v7 = (char)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_10:
      if ((v7 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_searchQueryLength);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("searchQueryLength"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_searchTab);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("searchTab"));

  }
LABEL_12:
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", blendingCacheId, CFSTR("blendingCacheId"));
  shownSuggestionIds = self->_shownSuggestionIds;
  if (shownSuggestionIds)
    objc_msgSend(v3, "setObject:forKey:", shownSuggestionIds, CFSTR("shownSuggestionIds"));
  engagedSuggestionIds = self->_engagedSuggestionIds;
  if (engagedSuggestionIds)
    objc_msgSend(v3, "setObject:forKey:", engagedSuggestionIds, CFSTR("engagedSuggestionIds"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[ATXPBAppDirectoryEventMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppDirectoryEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_11:
    PBDataWriterWriteUint64Field();
LABEL_12:
  if (self->_blendingCacheId)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_shownSuggestionIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_engagedSuggestionIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

  if (self->_metadata)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id *v17;

  v3 = a2;
  if (!a1)
    goto LABEL_29;
  v4 = *(_BYTE *)(a1 + 104);
  if ((v4 & 8) != 0)
  {
    v3[4] = *(id *)(a1 + 32);
    *((_BYTE *)v3 + 104) |= 8u;
    v4 = *(_BYTE *)(a1 + 104);
    if ((v4 & 0x10) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)(a1 + 104) & 0x10) == 0)
  {
    goto LABEL_4;
  }
  v3[5] = *(id *)(a1 + 40);
  *((_BYTE *)v3 + 104) |= 0x10u;
  v4 = *(_BYTE *)(a1 + 104);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_32:
  v3[2] = *(id *)(a1 + 16);
  *((_BYTE *)v3 + 104) |= 2u;
  if ((*(_BYTE *)(a1 + 104) & 4) != 0)
  {
LABEL_6:
    v3[3] = *(id *)(a1 + 24);
    *((_BYTE *)v3 + 104) |= 4u;
  }
LABEL_7:
  v5 = *(void **)(a1 + 72);
  v17 = v3;
  if (v5)
  {
    -[ATXPBAppDirectoryEvent setBundleId:]((uint64_t)v3, v5);
    v3 = v17;
  }
  v6 = *(_BYTE *)(a1 + 104);
  if ((v6 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 104) & 0x20) == 0)
      goto LABEL_11;
LABEL_35:
    v3[6] = *(id *)(a1 + 48);
    *((_BYTE *)v3 + 104) |= 0x20u;
    if ((*(_BYTE *)(a1 + 104) & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v3[1] = *(id *)(a1 + 8);
  *((_BYTE *)v3 + 104) |= 1u;
  v6 = *(_BYTE *)(a1 + 104);
  if ((v6 & 0x20) != 0)
    goto LABEL_35;
LABEL_11:
  if ((v6 & 0x40) != 0)
  {
LABEL_12:
    v3[7] = *(id *)(a1 + 56);
    *((_BYTE *)v3 + 104) |= 0x40u;
  }
LABEL_13:
  v7 = *(void **)(a1 + 64);
  if (v7)
    -[ATXPBAppDirectoryEvent setBlendingCacheId:]((uint64_t)v17, v7);
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    if (v17)
      objc_msgSend(v17[12], "removeAllObjects");
    v8 = objc_msgSend(*(id *)(a1 + 96), "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        -[ATXPBAppDirectoryEvent shownSuggestionIdsAtIndex:]((id *)a1, i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:]((uint64_t)v17, v11);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    if (v17)
      objc_msgSend(v17[10], "removeAllObjects");
    v12 = objc_msgSend(*(id *)(a1 + 80), "count");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
      {
        -[ATXPBAppDirectoryEvent engagedSuggestionIdsAtIndex:]((id *)a1, j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:]((uint64_t)v17, v15);

      }
    }
  }
  v16 = *(void **)(a1 + 88);
  v3 = v17;
  if (v16)
  {
    -[ATXPBAppDirectoryEvent setMetadata:]((uint64_t)v17, v16);
    v3 = v17;
  }
LABEL_29:

}

- (void)setBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_date;
    *(_BYTE *)(v5 + 104) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_eventType;
  *(_BYTE *)(v5 + 104) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  *(_QWORD *)(v5 + 16) = self->_categoryID;
  *(_BYTE *)(v5 + 104) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 24) = self->_categoryIndex;
    *(_BYTE *)(v5 + 104) |= 4u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_bundleIndex;
    *(_BYTE *)(v6 + 104) |= 1u;
    v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_8:
      if ((v10 & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 48) = self->_searchQueryLength;
  *(_BYTE *)(v6 + 104) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 56) = self->_searchTab;
    *(_BYTE *)(v6 + 104) |= 0x40u;
  }
LABEL_10:
  v11 = -[NSString copyWithZone:](self->_blendingCacheId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v11;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_shownSuggestionIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:](v6, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v15);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = self->_engagedSuggestionIds;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](v6, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  v25 = -[ATXPBAppDirectoryEventMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *bundleId;
  NSString *blendingCacheId;
  NSMutableArray *shownSuggestionIds;
  NSMutableArray *engagedSuggestionIds;
  ATXPBAppDirectoryEventMetadata *metadata;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_date != *((double *)v4 + 4))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) == 0 || self->_eventType != *((_QWORD *)v4 + 5))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_categoryID != *((_QWORD *)v4 + 2))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_categoryIndex != *((_QWORD *)v4 + 3))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_48;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
    {
LABEL_48:
      v11 = 0;
      goto LABEL_49;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_bundleIndex != *((_QWORD *)v4 + 1))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x20) == 0 || self->_searchQueryLength != *((_QWORD *)v4 + 6))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x40) == 0 || self->_searchTab != *((_QWORD *)v4 + 7))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 104) & 0x40) != 0)
  {
    goto LABEL_48;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_48;
  }
  shownSuggestionIds = self->_shownSuggestionIds;
  if ((unint64_t)shownSuggestionIds | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](shownSuggestionIds, "isEqual:"))
      goto LABEL_48;
  }
  engagedSuggestionIds = self->_engagedSuggestionIds;
  if ((unint64_t)engagedSuggestionIds | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](engagedSuggestionIds, "isEqual:"))
      goto LABEL_48;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 11))
    v11 = -[ATXPBAppDirectoryEventMetadata isEqual:](metadata, "isEqual:");
  else
    v11 = 1;
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    date = self->_date;
    v6 = -date;
    if (date >= 0.0)
      v6 = self->_date;
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
  if ((has & 0x10) == 0)
  {
    v9 = 0;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((has & 4) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v9 = 2654435761u * self->_eventType;
  if ((has & 2) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761u * self->_categoryID;
  if ((has & 4) != 0)
  {
LABEL_12:
    v11 = 2654435761u * self->_categoryIndex;
    goto LABEL_16;
  }
LABEL_15:
  v11 = 0;
LABEL_16:
  v12 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_18;
LABEL_21:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_19;
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v13 = 2654435761u * self->_bundleIndex;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_21;
LABEL_18:
  v14 = 2654435761u * self->_searchQueryLength;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_22;
LABEL_19:
  v15 = 2654435761u * self->_searchTab;
LABEL_23:
  v16 = v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v12;
  v17 = -[NSString hash](self->_blendingCacheId, "hash");
  v18 = v16 ^ v17 ^ -[NSMutableArray hash](self->_shownSuggestionIds, "hash");
  v19 = -[NSMutableArray hash](self->_engagedSuggestionIds, "hash");
  return v18 ^ v19 ^ -[ATXPBAppDirectoryEventMetadata hash](self->_metadata, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  id v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  _BYTE *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_41;
  v5 = v3[104];
  if ((v5 & 8) != 0)
  {
    *(_QWORD *)(a1 + 32) = *((_QWORD *)v3 + 4);
    *(_BYTE *)(a1 + 104) |= 8u;
    v5 = v3[104];
    if ((v5 & 0x10) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_34;
    }
  }
  else if ((v3[104] & 0x10) == 0)
  {
    goto LABEL_4;
  }
  *(_QWORD *)(a1 + 40) = *((_QWORD *)v3 + 5);
  *(_BYTE *)(a1 + 104) |= 0x10u;
  v5 = v3[104];
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_34:
  *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
  *(_BYTE *)(a1 + 104) |= 2u;
  if ((v3[104] & 4) != 0)
  {
LABEL_6:
    *(_QWORD *)(a1 + 24) = *((_QWORD *)v3 + 3);
    *(_BYTE *)(a1 + 104) |= 4u;
  }
LABEL_7:
  v6 = (void *)*((_QWORD *)v3 + 9);
  if (v6)
    -[ATXPBAppDirectoryEvent setBundleId:](a1, v6);
  v7 = *((_BYTE *)v4 + 104);
  if ((v7 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x20) == 0)
      goto LABEL_11;
LABEL_37:
    *(_QWORD *)(a1 + 48) = *((_QWORD *)v4 + 6);
    *(_BYTE *)(a1 + 104) |= 0x20u;
    if ((*((_BYTE *)v4 + 104) & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *(_QWORD *)(a1 + 8) = *((_QWORD *)v4 + 1);
  *(_BYTE *)(a1 + 104) |= 1u;
  v7 = *((_BYTE *)v4 + 104);
  if ((v7 & 0x20) != 0)
    goto LABEL_37;
LABEL_11:
  if ((v7 & 0x40) != 0)
  {
LABEL_12:
    *(_QWORD *)(a1 + 56) = *((_QWORD *)v4 + 7);
    *(_BYTE *)(a1 + 104) |= 0x40u;
  }
LABEL_13:
  v8 = (void *)*((_QWORD *)v4 + 8);
  if (v8)
    -[ATXPBAppDirectoryEvent setBlendingCacheId:](a1, v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = *((id *)v4 + 12);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:](a1, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = *((id *)v4 + 10);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](a1, *(void **)(*((_QWORD *)&v21 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  v19 = *(_BYTE **)(a1 + 88);
  v20 = (void *)*((_QWORD *)v4 + 11);
  if (v19)
  {
    if (v20)
      -[ATXPBAppDirectoryEventMetadata mergeFrom:](v19, v20);
  }
  else if (v20)
  {
    -[ATXPBAppDirectoryEvent setMetadata:](a1, v20);
  }
LABEL_41:

}

- (double)date
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (uint64_t)eventType
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)categoryID
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)categoryIndex
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)bundleId
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)bundleIndex
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)searchQueryLength
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)searchTab
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)blendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)shownSuggestionIds
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (void)setShownSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (uint64_t)engagedSuggestionIds
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (void)setEngagedSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (uint64_t)metadata
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownSuggestionIds, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_engagedSuggestionIds, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end
