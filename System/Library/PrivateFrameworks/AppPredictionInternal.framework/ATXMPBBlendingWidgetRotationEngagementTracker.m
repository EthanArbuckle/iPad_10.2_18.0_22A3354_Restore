@implementation ATXMPBBlendingWidgetRotationEngagementTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_engagementType;
  else
    return 1;
}

- (void)setEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E82DFF68[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSeen")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shown")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserRotate")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dwell")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tapped")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AddedToStack")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedRotationDismissOnce")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedRotationNeverShowAgain")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (int)selectionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_selectionType;
  else
    return 1;
}

- (void)setSelectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_selectionType = a3;
}

- (void)setHasSelectionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSelectionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)selectionTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NPlusOne");
  if (a3 == 2)
  {
    v3 = CFSTR("StackRotation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSelectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NPlusOne")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("StackRotation")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (int)stackLocation
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_stackLocation;
  else
    return 0;
}

- (void)setStackLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_stackLocation = a3;
}

- (void)setHasStackLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStackLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)stackLocationAsString:(int)a3
{
  if (a3 < 6)
    return off_1E82DFFA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStackLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TodayPage")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenPage1")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenOtherPages")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenPage2")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeScreenPage3")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingWidgetRotationEngagementTracker;
  -[ATXMPBBlendingWidgetRotationEngagementTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingWidgetRotationEngagementTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *layoutType;
  unsigned int v6;
  __CFString *v7;
  NSString *clientModelId;
  NSString *widgetIdentifier;
  int selectionType;
  __CFString *v11;
  NSString *highestConfidenceCategory;
  NSString *executableType;
  NSString *abGroup;
  uint64_t stackLocation;
  __CFString *v16;
  NSString *clientModelABGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType)
    objc_msgSend(v3, "setObject:forKey:", layoutType, CFSTR("layoutType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = self->_engagementType - 1;
    if (v6 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E82DFF68[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("engagementType"));

  }
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier)
    objc_msgSend(v4, "setObject:forKey:", widgetIdentifier, CFSTR("widgetIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    selectionType = self->_selectionType;
    if (selectionType == 1)
    {
      v11 = CFSTR("NPlusOne");
    }
    else if (selectionType == 2)
    {
      v11 = CFSTR("StackRotation");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_selectionType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("selectionType"));

  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory)
    objc_msgSend(v4, "setObject:forKey:", highestConfidenceCategory, CFSTR("highestConfidenceCategory"));
  executableType = self->_executableType;
  if (executableType)
    objc_msgSend(v4, "setObject:forKey:", executableType, CFSTR("executableType"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    stackLocation = self->_stackLocation;
    if (stackLocation >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_stackLocation);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E82DFFA8[stackLocation];
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("stackLocation"));

  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup)
    objc_msgSend(v4, "setObject:forKey:", clientModelABGroup, CFSTR("clientModelABGroup"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingWidgetRotationEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_layoutType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_layoutType)
  {
    objc_msgSend(v4, "setLayoutType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_engagementType;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v5, "setClientModelId:");
    v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    objc_msgSend(v5, "setWidgetIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_selectionType;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_stackLocation;
    *((_BYTE *)v4 + 80) |= 4u;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v5, "setClientModelABGroup:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_layoutType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_engagementType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_widgetIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_selectionType;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_highestConfidenceCategory, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_executableType, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v16;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_stackLocation;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  v18 = -[NSString copyWithZone:](self->_clientModelABGroup, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *layoutType;
  NSString *clientModelId;
  NSString *widgetIdentifier;
  NSString *highestConfidenceCategory;
  NSString *executableType;
  NSString *abGroup;
  NSString *clientModelABGroup;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 8))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_31;
  }
  widgetIdentifier = self->_widgetIdentifier;
  if ((unint64_t)widgetIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](widgetIdentifier, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_selectionType != *((_DWORD *)v4 + 16))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_31;
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if ((unint64_t)highestConfidenceCategory | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](highestConfidenceCategory, "isEqual:"))
  {
    goto LABEL_31;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:"))
      goto LABEL_31;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_stackLocation != *((_DWORD *)v4 + 17))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_31;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((_QWORD *)v4 + 2))
    v12 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  else
    v12 = 1;
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_layoutType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_engagementType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_clientModelId, "hash");
  v6 = -[NSString hash](self->_widgetIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_selectionType;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_highestConfidenceCategory, "hash");
  v9 = -[NSString hash](self->_executableType, "hash");
  v10 = -[NSString hash](self->_abGroup, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_stackLocation;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSString hash](self->_clientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setLayoutType:](self, "setLayoutType:");
    v4 = v5;
  }
  if ((v4[20] & 1) != 0)
  {
    self->_engagementType = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setClientModelId:](self, "setClientModelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setWidgetIdentifier:](self, "setWidgetIdentifier:");
    v4 = v5;
  }
  if ((v4[20] & 2) != 0)
  {
    self->_selectionType = v4[16];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setExecutableType:](self, "setExecutableType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }
  if ((v4[20] & 4) != 0)
  {
    self->_stackLocation = v4[17];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingWidgetRotationEngagementTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    v4 = v5;
  }

}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
  objc_storeStrong((id *)&self->_layoutType, a3);
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifier, a3);
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
  objc_storeStrong((id *)&self->_highestConfidenceCategory, a3);
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
  objc_storeStrong((id *)&self->_executableType, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelABGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
