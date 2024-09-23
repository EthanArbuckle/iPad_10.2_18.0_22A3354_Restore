@implementation ATXPBLockscreenEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 40) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 40) = *(_BYTE *)(result + 40) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return *(_BYTE *)(result + 40) & 1;
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 40) & 2) != 0)
      return *(unsigned int *)(result + 24);
    else
      return 1;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 40) |= 2u;
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 40) = *(_BYTE *)(result + 40) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 40) >> 1) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if ((a2 - 1) < 4)
      return off_1E4D5D4A8[(int)a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionsPushedToLockscreen")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionTappedByUser")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionClearedByUser")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionsRemovedFromLockscreen")))
    {
      v6 = 4;
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)clearSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addSuggestionIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)suggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)suggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
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
  v8.super_class = (Class)ATXPBLockscreenEvent;
  -[ATXPBLockscreenEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBLockscreenEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  unsigned int v6;
  __CFString *v7;
  NSString *blendingCacheId;
  NSMutableArray *suggestionIds;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("date"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = self->_eventType - 1;
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E4D5D4A8[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));

  }
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", blendingCacheId, CFSTR("blendingCacheId"));
  suggestionIds = self->_suggestionIds;
  if (suggestionIds)
    objc_msgSend(v3, "setObject:forKey:", suggestionIds, CFSTR("suggestionIds"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBLockscreenEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_blendingCacheId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_suggestionIds;
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(uint64_t)a1
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    v3 = *(_BYTE *)(a1 + 40);
    if ((v3 & 1) != 0)
    {
      *((_QWORD *)v9 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v9 + 40) |= 1u;
      v3 = *(_BYTE *)(a1 + 40);
    }
    if ((v3 & 2) != 0)
    {
      *((_DWORD *)v9 + 6) = *(_DWORD *)(a1 + 24);
      *((_BYTE *)v9 + 40) |= 2u;
    }
    v4 = *(void **)(a1 + 16);
    if (v4)
      -[ATXPBLockscreenEvent setBlendingCacheId:]((uint64_t)v9, v4);
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (v9)
        objc_msgSend(*((id *)v9 + 4), "removeAllObjects");
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v5)
      {
        v6 = v5;
        for (i = 0; i != v6; ++i)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBLockscreenEvent addSuggestionIds:]((uint64_t)v9, v8);

        }
      }
    }
  }

}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
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
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_blendingCacheId, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_suggestionIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        -[ATXPBLockscreenEvent addSuggestionIds:]((uint64_t)v6, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *blendingCacheId;
  NSMutableArray *suggestionIds;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_16;
  }
  suggestionIds = self->_suggestionIds;
  if ((unint64_t)suggestionIds | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](suggestionIds, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  NSUInteger v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
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
  if ((has & 2) != 0)
    v9 = 2654435761 * self->_eventType;
  else
    v9 = 0;
  v10 = v9 ^ v4 ^ -[NSString hash](self->_blendingCacheId, "hash");
  return v10 ^ -[NSMutableArray hash](self->_suggestionIds, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  char v5;
  id v6;
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
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *((_BYTE *)v3 + 40);
    if ((v5 & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 40) |= 1u;
      v5 = *((_BYTE *)v3 + 40);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(_BYTE *)(a1 + 40) |= 2u;
    }
    v6 = v3[2];
    if (v6)
      objc_storeStrong((id *)(a1 + 16), v6);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4[4];
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
          -[ATXPBLockscreenEvent addSuggestionIds:](a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (double)date
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)blendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)suggestionIds
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end
