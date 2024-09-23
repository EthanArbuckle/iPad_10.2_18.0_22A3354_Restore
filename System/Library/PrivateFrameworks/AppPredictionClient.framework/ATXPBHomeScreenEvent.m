@implementation ATXPBHomeScreenEvent

- (uint64_t)widgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (uint64_t)widgetSize
{
  if (result)
  {
    if ((*(_BYTE *)(result + 124) & 8) != 0)
      return *(unsigned int *)(result + 104);
    else
      return 1;
  }
  return result;
}

- (uint64_t)widgetKind
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (uint64_t)widgetBundleId
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)suggestionIds
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)stackLocation
{
  if (result)
  {
    if ((*(_BYTE *)(result + 124) & 4) != 0)
      return *(unsigned int *)(result + 76);
    else
      return 0;
  }
  return result;
}

- (uint64_t)stackKind
{
  if (result)
  {
    if ((*(_BYTE *)(result + 124) & 2) != 0)
      return *(unsigned int *)(result + 72);
    else
      return 0;
  }
  return result;
}

- (uint64_t)stackId
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)reason
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)metadata
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)intentDescription
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)eventTypeString
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
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
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)appBundleId
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setWidgetUniqueId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (uint64_t)setWidgetSize:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 124) |= 8u;
    *(_DWORD *)(result + 104) = a2;
  }
  return result;
}

- (void)setWidgetKind:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (void)setWidgetBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (void)setSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (uint64_t)setStackLocation:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 124) |= 4u;
    *(_DWORD *)(result + 76) = a2;
  }
  return result;
}

- (uint64_t)setStackKind:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 124) |= 2u;
    *(_DWORD *)(result + 72) = a2;
  }
  return result;
}

- (void)setStackId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)setReason:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setIntentDescription:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setEventTypeString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 124) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setAppBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_eventTypeString, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHomeScreenEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_eventTypeString)
    PBDataWriterWriteStringField();
  if (self->_reason)
    PBDataWriterWriteStringField();
  if (self->_blendingCacheId)
    PBDataWriterWriteStringField();
  if (self->_stackId)
    PBDataWriterWriteStringField();
  if (self->_widgetBundleId)
    PBDataWriterWriteStringField();
  if (self->_widgetKind)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_intentDescription)
    PBDataWriterWriteStringField();
  if (self->_widgetUniqueId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_suggestionIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_metadata)
    PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_34;
LABEL_38:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_38;
LABEL_34:
  if ((has & 0x10) != 0)
LABEL_35:
    PBDataWriterWriteBOOLField();
LABEL_36:

}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 124) = *(_BYTE *)(result + 124) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return *(_BYTE *)(result + 124) & 1;
  return result;
}

- (BOOL)hasEventTypeString
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (BOOL)hasReason
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (BOOL)hasBlendingCacheId
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (BOOL)hasStackId
{
  if (result)
    return *(_QWORD *)(result + 64) != 0;
  return result;
}

- (BOOL)hasWidgetBundleId
{
  if (result)
    return *(_QWORD *)(result + 88) != 0;
  return result;
}

- (BOOL)hasWidgetKind
{
  if (result)
    return *(_QWORD *)(result + 96) != 0;
  return result;
}

- (uint64_t)setHasWidgetSize:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 124) = *(_BYTE *)(result + 124) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasWidgetSize
{
  if (result)
    return (*(unsigned __int8 *)(result + 124) >> 3) & 1;
  return result;
}

- (__CFString)widgetSizeAsString:(void *)a1
{
  if (a1)
  {
    if ((a2 - 1) < 5)
      return off_1E4D5C660[(int)a2 - 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsWidgetSize:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TwoByTwo")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TwoByFour")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FourByFour")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SixByFour")) & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("FourByEight")))
    {
      v6 = 5;
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

- (BOOL)hasIntentDescription
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (BOOL)hasWidgetUniqueId
{
  if (result)
    return *(_QWORD *)(result + 112) != 0;
  return result;
}

- (uint64_t)clearSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "removeAllObjects");
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

- (uint64_t)suggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 80), "count");
  return result;
}

- (id)suggestionIdsAtIndex:(id *)a1
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
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (BOOL)hasAppBundleId
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)setHasStackKind:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 124) = *(_BYTE *)(result + 124) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasStackKind
{
  if (result)
    return (*(unsigned __int8 *)(result + 124) >> 1) & 1;
  return result;
}

- (__CFString)stackKindAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 8)
      return off_1E4D5C688[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsStackKind:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PinnedWidget")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SmartStack")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NonSmartStack")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RotatableSuggestibleStack")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NonRotatableSuggestibleStack")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RotatableNonSuggestibleStack")) & 1) != 0)
    {
      v6 = 6;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("NonRotatableNonSuggestibleStack")))
    {
      v6 = 7;
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

- (uint64_t)setHasStackLocation:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 124) = *(_BYTE *)(result + 124) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasStackLocation
{
  if (result)
    return (*(unsigned __int8 *)(result + 124) >> 2) & 1;
  return result;
}

- (__CFString)stackLocationAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 6)
      return off_1E4D5C6C8[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsStackLocation:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TodayPage")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenPage1")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenOtherPages")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenPage2")) & 1) != 0)
    {
      v6 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenPage3")))
    {
      v6 = 5;
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

- (uint64_t)setIsSuggestedWidget:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 124) |= 0x10u;
    *(_BYTE *)(result + 120) = a2;
  }
  return result;
}

- (uint64_t)setHasIsSuggestedWidget:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 124) = *(_BYTE *)(result + 124) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasIsSuggestedWidget
{
  if (result)
    return (*(unsigned __int8 *)(result + 124) >> 4) & 1;
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
  v8.super_class = (Class)ATXPBHomeScreenEvent;
  -[ATXPBHomeScreenEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *eventTypeString;
  NSString *reason;
  NSString *blendingCacheId;
  NSString *stackId;
  NSString *widgetBundleId;
  NSString *widgetKind;
  unsigned int v11;
  __CFString *v12;
  NSString *intentDescription;
  NSString *widgetUniqueId;
  NSMutableArray *suggestionIds;
  ATXPBHomeScreenEventMetadata *metadata;
  void *v17;
  NSString *appBundleId;
  char has;
  void *v20;
  uint64_t stackKind;
  __CFString *v23;
  uint64_t stackLocation;
  __CFString *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("date"));

  }
  eventTypeString = self->_eventTypeString;
  if (eventTypeString)
    objc_msgSend(v3, "setObject:forKey:", eventTypeString, CFSTR("eventTypeString"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKey:", reason, CFSTR("reason"));
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
    objc_msgSend(v3, "setObject:forKey:", blendingCacheId, CFSTR("blendingCacheId"));
  stackId = self->_stackId;
  if (stackId)
    objc_msgSend(v3, "setObject:forKey:", stackId, CFSTR("stackId"));
  widgetBundleId = self->_widgetBundleId;
  if (widgetBundleId)
    objc_msgSend(v3, "setObject:forKey:", widgetBundleId, CFSTR("widgetBundleId"));
  widgetKind = self->_widgetKind;
  if (widgetKind)
    objc_msgSend(v3, "setObject:forKey:", widgetKind, CFSTR("widgetKind"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v11 = self->_widgetSize - 1;
    if (v11 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetSize);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E4D5C660[v11];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("widgetSize"));

  }
  intentDescription = self->_intentDescription;
  if (intentDescription)
    objc_msgSend(v3, "setObject:forKey:", intentDescription, CFSTR("intentDescription"));
  widgetUniqueId = self->_widgetUniqueId;
  if (widgetUniqueId)
    objc_msgSend(v3, "setObject:forKey:", widgetUniqueId, CFSTR("widgetUniqueId"));
  suggestionIds = self->_suggestionIds;
  if (suggestionIds)
    objc_msgSend(v3, "setObject:forKey:", suggestionIds, CFSTR("suggestionIds"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[ATXPBHomeScreenEventMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("metadata"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_32;
LABEL_39:
    stackLocation = self->_stackLocation;
    if (stackLocation >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_stackLocation);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E4D5C6C8[stackLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("stackLocation"));

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_33;
    return v3;
  }
  stackKind = self->_stackKind;
  if (stackKind >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_stackKind);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E4D5C688[stackKind];
  }
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("stackKind"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_39;
LABEL_32:
  if ((has & 0x10) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSuggestedWidget);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("isSuggestedWidget"));

  }
  return v3;
}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id *v19;

  v3 = a2;
  if (!a1)
    goto LABEL_36;
  if ((*(_BYTE *)(a1 + 124) & 1) != 0)
  {
    v3[1] = *(id *)(a1 + 8);
    *((_BYTE *)v3 + 124) |= 1u;
  }
  v4 = *(void **)(a1 + 32);
  v19 = v3;
  if (v4)
  {
    -[ATXPBHomeScreenEvent setEventTypeString:]((uint64_t)v3, v4);
    v3 = v19;
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    -[ATXPBHomeScreenEvent setReason:]((uint64_t)v19, v5);
    v3 = v19;
  }
  v6 = *(void **)(a1 + 24);
  if (v6)
  {
    -[ATXPBHomeScreenEvent setBlendingCacheId:]((uint64_t)v19, v6);
    v3 = v19;
  }
  v7 = *(void **)(a1 + 64);
  if (v7)
  {
    -[ATXPBHomeScreenEvent setStackId:]((uint64_t)v19, v7);
    v3 = v19;
  }
  v8 = *(void **)(a1 + 88);
  if (v8)
  {
    -[ATXPBHomeScreenEvent setWidgetBundleId:]((uint64_t)v19, v8);
    v3 = v19;
  }
  v9 = *(void **)(a1 + 96);
  if (v9)
  {
    -[ATXPBHomeScreenEvent setWidgetKind:]((uint64_t)v19, v9);
    v3 = v19;
  }
  if ((*(_BYTE *)(a1 + 124) & 8) != 0)
  {
    *((_DWORD *)v3 + 26) = *(_DWORD *)(a1 + 104);
    *((_BYTE *)v3 + 124) |= 8u;
  }
  v10 = *(void **)(a1 + 40);
  if (v10)
    -[ATXPBHomeScreenEvent setIntentDescription:]((uint64_t)v19, v10);
  v11 = *(void **)(a1 + 112);
  if (v11)
    -[ATXPBHomeScreenEvent setWidgetUniqueId:]((uint64_t)v19, v11);
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    if (v19)
      objc_msgSend(v19[10], "removeAllObjects");
    v12 = objc_msgSend(*(id *)(a1 + 80), "count");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        -[ATXPBHomeScreenEvent suggestionIdsAtIndex:]((id *)a1, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBHomeScreenEvent addSuggestionIds:]((uint64_t)v19, v15);

      }
    }
  }
  v16 = *(void **)(a1 + 48);
  if (v16)
    -[ATXPBHomeScreenEvent setMetadata:]((uint64_t)v19, v16);
  v17 = *(void **)(a1 + 16);
  v3 = v19;
  if (v17)
  {
    -[ATXPBHomeScreenEvent setAppBundleId:]((uint64_t)v19, v17);
    v3 = v19;
  }
  v18 = *(_BYTE *)(a1 + 124);
  if ((v18 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 124) & 4) == 0)
      goto LABEL_34;
LABEL_38:
    *((_DWORD *)v3 + 19) = *(_DWORD *)(a1 + 76);
    *((_BYTE *)v3 + 124) |= 4u;
    if ((*(_BYTE *)(a1 + 124) & 0x10) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  *((_DWORD *)v3 + 18) = *(_DWORD *)(a1 + 72);
  *((_BYTE *)v3 + 124) |= 2u;
  v18 = *(_BYTE *)(a1 + 124);
  if ((v18 & 4) != 0)
    goto LABEL_38;
LABEL_34:
  if ((v18 & 0x10) != 0)
  {
LABEL_35:
    *((_BYTE *)v3 + 120) = *(_BYTE *)(a1 + 120);
    *((_BYTE *)v3 + 124) |= 0x10u;
  }
LABEL_36:

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char has;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 124) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_eventTypeString, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_blendingCacheId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_stackId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_widgetBundleId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v15;

  v17 = -[NSString copyWithZone:](self->_widgetKind, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v17;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_widgetSize;
    *(_BYTE *)(v6 + 124) |= 8u;
  }
  v19 = -[NSString copyWithZone:](self->_intentDescription, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v19;

  v21 = -[NSString copyWithZone:](self->_widgetUniqueId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v21;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = self->_suggestionIds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v35);
        -[ATXPBHomeScreenEvent addSuggestionIds:](v6, v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v25);
  }

  v29 = -[ATXPBHomeScreenEventMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v29;

  v31 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v31;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_14;
LABEL_18:
    *(_DWORD *)(v6 + 76) = self->_stackLocation;
    *(_BYTE *)(v6 + 124) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 72) = self->_stackKind;
  *(_BYTE *)(v6 + 124) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_18;
LABEL_14:
  if ((has & 0x10) != 0)
  {
LABEL_15:
    *(_BYTE *)(v6 + 120) = self->_isSuggestedWidget;
    *(_BYTE *)(v6 + 124) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventTypeString;
  NSString *reason;
  NSString *blendingCacheId;
  NSString *stackId;
  NSString *widgetBundleId;
  NSString *widgetKind;
  NSString *intentDescription;
  NSString *widgetUniqueId;
  NSMutableArray *suggestionIds;
  ATXPBHomeScreenEventMetadata *metadata;
  NSString *appBundleId;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    goto LABEL_46;
  }
  eventTypeString = self->_eventTypeString;
  if ((unint64_t)eventTypeString | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](eventTypeString, "isEqual:"))
  {
    goto LABEL_46;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](reason, "isEqual:"))
      goto LABEL_46;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](blendingCacheId, "isEqual:"))
      goto LABEL_46;
  }
  stackId = self->_stackId;
  if ((unint64_t)stackId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](stackId, "isEqual:"))
      goto LABEL_46;
  }
  widgetBundleId = self->_widgetBundleId;
  if ((unint64_t)widgetBundleId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](widgetBundleId, "isEqual:"))
      goto LABEL_46;
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 8) == 0 || self->_widgetSize != *((_DWORD *)v4 + 26))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 124) & 8) != 0)
  {
    goto LABEL_46;
  }
  intentDescription = self->_intentDescription;
  if ((unint64_t)intentDescription | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](intentDescription, "isEqual:"))
  {
    goto LABEL_46;
  }
  widgetUniqueId = self->_widgetUniqueId;
  if ((unint64_t)widgetUniqueId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](widgetUniqueId, "isEqual:"))
      goto LABEL_46;
  }
  suggestionIds = self->_suggestionIds;
  if ((unint64_t)suggestionIds | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](suggestionIds, "isEqual:"))
      goto LABEL_46;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 6))
  {
    if (!-[ATXPBHomeScreenEventMetadata isEqual:](metadata, "isEqual:"))
      goto LABEL_46;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 2) == 0 || self->_stackKind != *((_DWORD *)v4 + 18))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 124) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 4) == 0 || self->_stackLocation != *((_DWORD *)v4 + 19))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 124) & 4) != 0)
  {
    goto LABEL_46;
  }
  v16 = (*((_BYTE *)v4 + 124) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x10) == 0)
    {
LABEL_46:
      v16 = 0;
      goto LABEL_47;
    }
    if (self->_isSuggestedWidget)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_46;
    }
    v16 = 1;
  }
LABEL_47:

  return v16;
}

- (unint64_t)hash
{
  double date;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  unint64_t v27;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    date = self->_date;
    v4 = -date;
    if (date >= 0.0)
      v4 = self->_date;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v27 = v10;
  }
  else
  {
    v27 = 0;
  }
  v26 = -[NSString hash](self->_eventTypeString, "hash");
  v25 = -[NSString hash](self->_reason, "hash");
  v24 = -[NSString hash](self->_blendingCacheId, "hash");
  v23 = -[NSString hash](self->_stackId, "hash");
  v11 = -[NSString hash](self->_widgetBundleId, "hash");
  v12 = -[NSString hash](self->_widgetKind, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v13 = 2654435761 * self->_widgetSize;
  else
    v13 = 0;
  v14 = -[NSString hash](self->_intentDescription, "hash");
  v15 = -[NSString hash](self->_widgetUniqueId, "hash");
  v16 = -[NSMutableArray hash](self->_suggestionIds, "hash");
  v17 = -[ATXPBHomeScreenEventMetadata hash](self->_metadata, "hash");
  v18 = -[NSString hash](self->_appBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_15;
LABEL_18:
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_16;
LABEL_19:
    v21 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
  v19 = 2654435761 * self->_stackKind;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_18;
LABEL_15:
  v20 = 2654435761 * self->_stackLocation;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_19;
LABEL_16:
  v21 = 2654435761 * self->_isSuggestedWidget;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_40;
  if ((*((_BYTE *)v3 + 124) & 1) != 0)
  {
    *(_QWORD *)(a1 + 8) = v3[1];
    *(_BYTE *)(a1 + 124) |= 1u;
  }
  v5 = (void *)v3[4];
  if (v5)
    -[ATXPBHomeScreenEvent setEventTypeString:](a1, v5);
  v6 = (void *)*((_QWORD *)v4 + 7);
  if (v6)
    -[ATXPBHomeScreenEvent setReason:](a1, v6);
  v7 = (void *)*((_QWORD *)v4 + 3);
  if (v7)
    -[ATXPBHomeScreenEvent setBlendingCacheId:](a1, v7);
  v8 = (void *)*((_QWORD *)v4 + 8);
  if (v8)
    -[ATXPBHomeScreenEvent setStackId:](a1, v8);
  v9 = (void *)*((_QWORD *)v4 + 11);
  if (v9)
    -[ATXPBHomeScreenEvent setWidgetBundleId:](a1, v9);
  v10 = (void *)*((_QWORD *)v4 + 12);
  if (v10)
    -[ATXPBHomeScreenEvent setWidgetKind:](a1, v10);
  if ((*((_BYTE *)v4 + 124) & 8) != 0)
  {
    *(_DWORD *)(a1 + 104) = *((_DWORD *)v4 + 26);
    *(_BYTE *)(a1 + 124) |= 8u;
  }
  v11 = (void *)*((_QWORD *)v4 + 5);
  if (v11)
    -[ATXPBHomeScreenEvent setIntentDescription:](a1, v11);
  v12 = (void *)*((_QWORD *)v4 + 14);
  if (v12)
    -[ATXPBHomeScreenEvent setWidgetUniqueId:](a1, v12);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *((id *)v4 + 10);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        -[ATXPBHomeScreenEvent addSuggestionIds:](a1, *(void **)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v18 = *(_QWORD *)(a1 + 48);
  v19 = (void *)*((_QWORD *)v4 + 6);
  if (v18)
  {
    if (v19)
      -[ATXPBHomeScreenEventMetadata mergeFrom:](v18, v19);
  }
  else if (v19)
  {
    -[ATXPBHomeScreenEvent setMetadata:](a1, v19);
  }
  v20 = (void *)*((_QWORD *)v4 + 2);
  if (v20)
    -[ATXPBHomeScreenEvent setAppBundleId:](a1, v20);
  v21 = *((_BYTE *)v4 + 124);
  if ((v21 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 124) & 4) == 0)
      goto LABEL_38;
LABEL_42:
    *(_DWORD *)(a1 + 76) = *((_DWORD *)v4 + 19);
    *(_BYTE *)(a1 + 124) |= 4u;
    if ((*((_BYTE *)v4 + 124) & 0x10) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
  *(_DWORD *)(a1 + 72) = *((_DWORD *)v4 + 18);
  *(_BYTE *)(a1 + 124) |= 2u;
  v21 = *((_BYTE *)v4 + 124);
  if ((v21 & 4) != 0)
    goto LABEL_42;
LABEL_38:
  if ((v21 & 0x10) != 0)
  {
LABEL_39:
    *(_BYTE *)(a1 + 120) = *((_BYTE *)v4 + 120);
    *(_BYTE *)(a1 + 124) |= 0x10u;
  }
LABEL_40:

}

- (BOOL)isSuggestedWidget
{
  if (result)
    return *(_BYTE *)(result + 120) != 0;
  return result;
}

@end
