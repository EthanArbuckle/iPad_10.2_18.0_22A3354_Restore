@implementation ATXPBSpotlightEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 80) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 80) = *(_BYTE *)(result + 80) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return *(_BYTE *)(result + 80) & 1;
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 80) & 2) != 0)
      return *(unsigned int *)(result + 64);
    else
      return 1;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 80) |= 2u;
    *(_DWORD *)(result + 64) = a2;
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
    *(_BYTE *)(result + 80) = *(_BYTE *)(result + 80) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 80) >> 1) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if ((a2 - 1) < 8)
      return off_1E4D5BF28[(int)a2 - 1];
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ViewAppeared")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ViewDisappeared")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionsAppeared")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionTapped")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SuggestionDismissed")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ContextMenuDismissOnce")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ContextMenuNeverShowAgain")) & 1) != 0)
    {
      v6 = 7;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SearchResultTapped")))
    {
      v6 = 8;
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

- (BOOL)hasAppConsumerSubType
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (BOOL)hasActionConsumerSubType
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasAppBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (BOOL)hasActionBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)clearAppSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "removeAllObjects");
  return result;
}

- (void)addAppSuggestionIds:(uint64_t)a1
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

- (uint64_t)appSuggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "count");
  return result;
}

- (id)appSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearActionSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addActionSuggestionIds:(uint64_t)a1
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

- (uint64_t)actionSuggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)actionSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)hasMetadata
{
  if (result)
    return *(_QWORD *)(result + 72) != 0;
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
  v8.super_class = (Class)ATXPBSpotlightEvent;
  -[ATXPBSpotlightEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *appConsumerSubType;
  NSString *actionConsumerSubType;
  NSString *appBlendingCacheId;
  NSString *actionBlendingCacheId;
  NSMutableArray *appSuggestionIds;
  NSMutableArray *actionSuggestionIds;
  ATXPBSpotlightEventMetadata *metadata;
  void *v15;

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
    if (v6 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E4D5BF28[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));

  }
  appConsumerSubType = self->_appConsumerSubType;
  if (appConsumerSubType)
    objc_msgSend(v3, "setObject:forKey:", appConsumerSubType, CFSTR("appConsumerSubType"));
  actionConsumerSubType = self->_actionConsumerSubType;
  if (actionConsumerSubType)
    objc_msgSend(v3, "setObject:forKey:", actionConsumerSubType, CFSTR("actionConsumerSubType"));
  appBlendingCacheId = self->_appBlendingCacheId;
  if (appBlendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", appBlendingCacheId, CFSTR("appBlendingCacheId"));
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if (actionBlendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", actionBlendingCacheId, CFSTR("actionBlendingCacheId"));
  appSuggestionIds = self->_appSuggestionIds;
  if (appSuggestionIds)
    objc_msgSend(v3, "setObject:forKey:", appSuggestionIds, CFSTR("appSuggestionIds"));
  actionSuggestionIds = self->_actionSuggestionIds;
  if (actionSuggestionIds)
    objc_msgSend(v3, "setObject:forKey:", actionSuggestionIds, CFSTR("actionSuggestionIds"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[ATXPBSpotlightEventMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("metadata"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_appConsumerSubType)
    PBDataWriterWriteStringField();
  if (self->_actionConsumerSubType)
    PBDataWriterWriteStringField();
  if (self->_appBlendingCacheId)
    PBDataWriterWriteStringField();
  if (self->_actionBlendingCacheId)
    PBDataWriterWriteStringField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_appSuggestionIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_actionSuggestionIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (self->_metadata)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id *v18;

  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 80);
    if ((v4 & 1) != 0)
    {
      v3[1] = *(id *)(a1 + 8);
      *((_BYTE *)v3 + 80) |= 1u;
      v4 = *(_BYTE *)(a1 + 80);
    }
    if ((v4 & 2) != 0)
    {
      *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
      *((_BYTE *)v3 + 80) |= 2u;
    }
    v5 = *(void **)(a1 + 48);
    v18 = v3;
    if (v5)
      -[ATXPBSpotlightEvent setAppConsumerSubType:]((uint64_t)v3, v5);
    v6 = *(void **)(a1 + 24);
    if (v6)
      -[ATXPBSpotlightEvent setActionConsumerSubType:]((uint64_t)v18, v6);
    v7 = *(void **)(a1 + 40);
    if (v7)
      -[ATXPBSpotlightEvent setAppBlendingCacheId:]((uint64_t)v18, v7);
    v8 = *(void **)(a1 + 16);
    if (v8)
      -[ATXPBSpotlightEvent setActionBlendingCacheId:]((uint64_t)v18, v8);
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      if (v18)
        objc_msgSend(v18[7], "removeAllObjects");
      v9 = objc_msgSend(*(id *)(a1 + 56), "count");
      if (v9)
      {
        v10 = v9;
        for (i = 0; i != v10; ++i)
        {
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBSpotlightEvent addAppSuggestionIds:]((uint64_t)v18, v12);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      if (v18)
        objc_msgSend(v18[4], "removeAllObjects");
      v13 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v13)
      {
        v14 = v13;
        for (j = 0; j != v14; ++j)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", j);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBSpotlightEvent addActionSuggestionIds:]((uint64_t)v18, v16);

        }
      }
    }
    v17 = *(void **)(a1 + 72);
    v3 = v18;
    if (v17)
    {
      -[ATXPBSpotlightEvent setMetadata:]((uint64_t)v18, v17);
      v3 = v18;
    }
  }

}

- (void)setAppConsumerSubType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setActionConsumerSubType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setAppBlendingCacheId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setActionBlendingCacheId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 80) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_eventType;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_appConsumerSubType, "copyWithZone:", a3);
  v9 = (void *)v6[6];
  v6[6] = v8;

  v10 = -[NSString copyWithZone:](self->_actionConsumerSubType, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  v12 = -[NSString copyWithZone:](self->_appBlendingCacheId, "copyWithZone:", a3);
  v13 = (void *)v6[5];
  v6[5] = v12;

  v14 = -[NSString copyWithZone:](self->_actionBlendingCacheId, "copyWithZone:", a3);
  v15 = (void *)v6[2];
  v6[2] = v14;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_appSuggestionIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "copyWithZone:", a3);
        -[ATXPBSpotlightEvent addAppSuggestionIds:]((uint64_t)v6, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self->_actionSuggestionIds;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v31);
        -[ATXPBSpotlightEvent addActionSuggestionIds:]((uint64_t)v6, v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  v28 = -[ATXPBSpotlightEventMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v29 = (void *)v6[9];
  v6[9] = v28;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appConsumerSubType;
  NSString *actionConsumerSubType;
  NSString *appBlendingCacheId;
  NSString *actionBlendingCacheId;
  NSMutableArray *appSuggestionIds;
  NSMutableArray *actionSuggestionIds;
  ATXPBSpotlightEventMetadata *metadata;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 16))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_26;
  }
  appConsumerSubType = self->_appConsumerSubType;
  if ((unint64_t)appConsumerSubType | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](appConsumerSubType, "isEqual:"))
  {
    goto LABEL_26;
  }
  actionConsumerSubType = self->_actionConsumerSubType;
  if ((unint64_t)actionConsumerSubType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionConsumerSubType, "isEqual:"))
      goto LABEL_26;
  }
  appBlendingCacheId = self->_appBlendingCacheId;
  if ((unint64_t)appBlendingCacheId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](appBlendingCacheId, "isEqual:"))
      goto LABEL_26;
  }
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if ((unint64_t)actionBlendingCacheId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionBlendingCacheId, "isEqual:"))
      goto LABEL_26;
  }
  appSuggestionIds = self->_appSuggestionIds;
  if ((unint64_t)appSuggestionIds | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](appSuggestionIds, "isEqual:"))
      goto LABEL_26;
  }
  actionSuggestionIds = self->_actionSuggestionIds;
  if ((unint64_t)actionSuggestionIds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](actionSuggestionIds, "isEqual:"))
      goto LABEL_26;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 9))
    v12 = -[ATXPBSpotlightEventMetadata isEqual:](metadata, "isEqual:");
  else
    v12 = 1;
LABEL_27:

  return v12;
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
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;

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
  v10 = v9 ^ v4 ^ -[NSString hash](self->_appConsumerSubType, "hash");
  v11 = -[NSString hash](self->_actionConsumerSubType, "hash");
  v12 = v10 ^ v11 ^ -[NSString hash](self->_appBlendingCacheId, "hash");
  v13 = -[NSString hash](self->_actionBlendingCacheId, "hash");
  v14 = v13 ^ -[NSMutableArray hash](self->_appSuggestionIds, "hash");
  v15 = v12 ^ v14 ^ -[NSMutableArray hash](self->_actionSuggestionIds, "hash");
  return v15 ^ -[ATXPBSpotlightEventMetadata hash](self->_metadata, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
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
  if (a1)
  {
    v5 = v3[80];
    if ((v5 & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
      *(_BYTE *)(a1 + 80) |= 1u;
      v5 = v3[80];
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 64) = *((_DWORD *)v3 + 16);
      *(_BYTE *)(a1 + 80) |= 2u;
    }
    v6 = (void *)*((_QWORD *)v3 + 6);
    if (v6)
      objc_storeStrong((id *)(a1 + 48), v6);
    v7 = (void *)*((_QWORD *)v4 + 3);
    if (v7)
      objc_storeStrong((id *)(a1 + 24), v7);
    v8 = (void *)*((_QWORD *)v4 + 5);
    if (v8)
      objc_storeStrong((id *)(a1 + 40), v8);
    v9 = (void *)*((_QWORD *)v4 + 2);
    if (v9)
      objc_storeStrong((id *)(a1 + 16), v9);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = *((id *)v4 + 7);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          -[ATXPBSpotlightEvent addAppSuggestionIds:](a1, *(void **)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v12);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = *((id *)v4 + 4);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[ATXPBSpotlightEvent addActionSuggestionIds:](a1, *(void **)(*((_QWORD *)&v21 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }

    v20 = (void *)*((_QWORD *)v4 + 9);
    if (*(_QWORD *)(a1 + 72))
    {
      if (v20)
        -[ATXPBSpotlightEventMetadata mergeFrom:](*(_QWORD *)(a1 + 72), v20);
    }
    else if (v20)
    {
      objc_storeStrong((id *)(a1 + 72), v20);
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

- (uint64_t)appConsumerSubType
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)actionConsumerSubType
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)appBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)actionBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)appSuggestionIds
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)setAppSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)actionSuggestionIds
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setActionSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)metadata
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_appSuggestionIds, 0);
  objc_storeStrong((id *)&self->_appConsumerSubType, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_actionSuggestionIds, 0);
  objc_storeStrong((id *)&self->_actionConsumerSubType, 0);
  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
}

@end
