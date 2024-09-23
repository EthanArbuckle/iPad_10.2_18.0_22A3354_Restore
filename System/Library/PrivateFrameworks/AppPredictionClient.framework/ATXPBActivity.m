@implementation ATXPBActivity

- (uint64_t)setUiLocation:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 72) |= 2u;
    *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasUiLocation:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 72) = *(_BYTE *)(result + 72) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasUiLocation
{
  if (result)
    return (*(unsigned __int8 *)(result + 72) >> 1) & 1;
  return result;
}

- (uint64_t)type
{
  if (result)
  {
    if ((*(_BYTE *)(result + 72) & 4) != 0)
      return *(unsigned int *)(result + 64);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 72) |= 4u;
    *(_DWORD *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)setHasType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 72) = *(_BYTE *)(result + 72) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasType
{
  if (result)
    return (*(unsigned __int8 *)(result + 72) >> 2) & 1;
  return result;
}

- (__CFString)typeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xE)
      return off_1E4D5CEF0[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsType:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Home")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Working")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Exercising")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Bedtime")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Gaming")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Reading")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Traveling")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Learning")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Streaming")) & 1) != 0)
    {
      v6 = 10;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ScreenSharing")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ClassicDND")) & 1) != 0)
    {
      v6 = 12;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ScreenRecording")))
    {
      v6 = 13;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasModeUUID
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasSuggestionUUID
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (uint64_t)setOrigin:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 72) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasOrigin:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 72) = *(_BYTE *)(result + 72) & 0xFE | a2;
  return result;
}

- (uint64_t)hasOrigin
{
  if (result)
    return *(_BYTE *)(result + 72) & 1;
  return result;
}

- (BOOL)hasOriginBundleId
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (BOOL)hasOriginAnchorType
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (uint64_t)clearSerializedTriggers
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "removeAllObjects");
  return result;
}

- (void)addSerializedTriggers:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)serializedTriggersCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "count");
  return result;
}

- (id)serializedTriggersAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[6], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)setShouldSuggestTriggers:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 72) |= 8u;
    *(_BYTE *)(result + 68) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldSuggestTriggers:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 72) = *(_BYTE *)(result + 72) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasShouldSuggestTriggers
{
  if (result)
    return (*(unsigned __int8 *)(result + 72) >> 3) & 1;
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
  v8.super_class = (Class)ATXPBActivity;
  -[ATXPBActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivity dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t type;
  __CFString *v7;
  NSString *modeUUID;
  NSString *suggestionUUID;
  void *v10;
  NSString *originBundleId;
  NSString *originAnchorType;
  NSMutableArray *serializedTriggers;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uiLocation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uiLocation"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    type = self->_type;
    if (type >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E4D5CEF0[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  modeUUID = self->_modeUUID;
  if (modeUUID)
    objc_msgSend(v3, "setObject:forKey:", modeUUID, CFSTR("modeUUID"));
  suggestionUUID = self->_suggestionUUID;
  if (suggestionUUID)
    objc_msgSend(v3, "setObject:forKey:", suggestionUUID, CFSTR("suggestionUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_origin);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("origin"));

  }
  originBundleId = self->_originBundleId;
  if (originBundleId)
    objc_msgSend(v3, "setObject:forKey:", originBundleId, CFSTR("originBundleId"));
  originAnchorType = self->_originAnchorType;
  if (originAnchorType)
    objc_msgSend(v3, "setObject:forKey:", originAnchorType, CFSTR("originAnchorType"));
  serializedTriggers = self->_serializedTriggers;
  if (serializedTriggers)
    objc_msgSend(v3, "setObject:forKey:", serializedTriggers, CFSTR("serializedTriggers"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSuggestTriggers);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("shouldSuggestTriggers"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActivityReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_modeUUID)
    PBDataWriterWriteStringField();
  if (self->_suggestionUUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_originBundleId)
    PBDataWriterWriteStringField();
  if (self->_originAnchorType)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_serializedTriggers;
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
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();

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
  id *v13;

  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 72);
    if ((v4 & 2) != 0)
    {
      v3[2] = *(id *)(a1 + 16);
      *((_BYTE *)v3 + 72) |= 2u;
      v4 = *(_BYTE *)(a1 + 72);
    }
    if ((v4 & 4) != 0)
    {
      *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
      *((_BYTE *)v3 + 72) |= 4u;
    }
    v5 = *(void **)(a1 + 24);
    v13 = v3;
    if (v5)
    {
      -[ATXPBActivity setModeUUID:]((uint64_t)v3, v5);
      v3 = v13;
    }
    v6 = *(void **)(a1 + 56);
    if (v6)
    {
      -[ATXPBActivity setSuggestionUUID:]((uint64_t)v13, v6);
      v3 = v13;
    }
    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    {
      v3[1] = *(id *)(a1 + 8);
      *((_BYTE *)v3 + 72) |= 1u;
    }
    v7 = *(void **)(a1 + 40);
    if (v7)
      -[ATXPBActivity setOriginBundleId:]((uint64_t)v13, v7);
    v8 = *(void **)(a1 + 32);
    if (v8)
      -[ATXPBActivity setOriginAnchorType:]((uint64_t)v13, v8);
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      if (v13)
        objc_msgSend(v13[6], "removeAllObjects");
      v9 = objc_msgSend(*(id *)(a1 + 48), "count");
      if (v9)
      {
        v10 = v9;
        for (i = 0; i != v10; ++i)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBActivity addSerializedTriggers:]((uint64_t)v13, v12);

        }
      }
    }
    v3 = v13;
    if ((*(_BYTE *)(a1 + 72) & 8) != 0)
    {
      *((_BYTE *)v13 + 68) = *(_BYTE *)(a1 + 68);
      *((_BYTE *)v13 + 72) |= 8u;
    }
  }

}

- (void)setModeUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setSuggestionUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setOriginBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setOriginAnchorType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_uiLocation;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_modeUUID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_suggestionUUID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_origin;
    *(_BYTE *)(v6 + 72) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_originBundleId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_originAnchorType, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_serializedTriggers;
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
        -[ATXPBActivity addSerializedTriggers:](v6, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 68) = self->_shouldSuggestTriggers;
    *(_BYTE *)(v6 + 72) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *modeUUID;
  NSString *suggestionUUID;
  NSString *originBundleId;
  NSString *originAnchorType;
  NSMutableArray *serializedTriggers;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_uiLocation != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_type != *((_DWORD *)v4 + 16))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  modeUUID = self->_modeUUID;
  if ((unint64_t)modeUUID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](modeUUID, "isEqual:"))
    goto LABEL_29;
  suggestionUUID = self->_suggestionUUID;
  if ((unint64_t)suggestionUUID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](suggestionUUID, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_origin != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_29;
  }
  originBundleId = self->_originBundleId;
  if ((unint64_t)originBundleId | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](originBundleId, "isEqual:"))
  {
    goto LABEL_29;
  }
  originAnchorType = self->_originAnchorType;
  if ((unint64_t)originAnchorType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](originAnchorType, "isEqual:"))
      goto LABEL_29;
  }
  serializedTriggers = self->_serializedTriggers;
  if ((unint64_t)serializedTriggers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](serializedTriggers, "isEqual:"))
      goto LABEL_29;
  }
  v10 = (*((_BYTE *)v4 + 72) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0)
    {
LABEL_29:
      v10 = 0;
      goto LABEL_30;
    }
    if (self->_shouldSuggestTriggers)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_29;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_29;
    }
    v10 = 1;
  }
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_uiLocation;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_modeUUID, "hash");
  v6 = -[NSString hash](self->_suggestionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_origin;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_originBundleId, "hash");
  v9 = -[NSString hash](self->_originAnchorType, "hash");
  v10 = -[NSMutableArray hash](self->_serializedTriggers, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_shouldSuggestTriggers;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3[72];
    if ((v5 & 2) != 0)
    {
      *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
      *(_BYTE *)(a1 + 72) |= 2u;
      v5 = v3[72];
    }
    if ((v5 & 4) != 0)
    {
      *(_DWORD *)(a1 + 64) = *((_DWORD *)v3 + 16);
      *(_BYTE *)(a1 + 72) |= 4u;
    }
    v6 = (void *)*((_QWORD *)v3 + 3);
    if (v6)
      objc_storeStrong((id *)(a1 + 24), v6);
    v7 = (void *)*((_QWORD *)v4 + 7);
    if (v7)
      objc_storeStrong((id *)(a1 + 56), v7);
    if ((*((_BYTE *)v4 + 72) & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v4 + 1);
      *(_BYTE *)(a1 + 72) |= 1u;
    }
    v8 = (void *)*((_QWORD *)v4 + 5);
    if (v8)
      objc_storeStrong((id *)(a1 + 40), v8);
    v9 = (void *)*((_QWORD *)v4 + 4);
    if (v9)
      objc_storeStrong((id *)(a1 + 32), v9);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *((id *)v4 + 6);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[ATXPBActivity addSerializedTriggers:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

    if ((*((_BYTE *)v4 + 72) & 8) != 0)
    {
      *(_BYTE *)(a1 + 68) = *((_BYTE *)v4 + 68);
      *(_BYTE *)(a1 + 72) |= 8u;
    }
  }

}

- (uint64_t)uiLocation
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)modeUUID
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)suggestionUUID
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)origin
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)originBundleId
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)originAnchorType
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)serializedTriggers
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void)setSerializedTriggers:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (BOOL)shouldSuggestTriggers
{
  if (result)
    return *(_BYTE *)(result + 68) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

@end
