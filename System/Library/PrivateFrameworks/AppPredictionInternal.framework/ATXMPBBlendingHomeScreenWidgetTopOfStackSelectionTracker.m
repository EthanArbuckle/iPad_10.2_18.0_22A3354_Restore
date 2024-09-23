@implementation ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (int)selectionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_selectionType;
  else
    return 1;
}

- (void)setSelectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_selectionType = a3;
}

- (void)setHasSelectionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSelectionType
{
  return *(_BYTE *)&self->_has & 1;
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

- (BOOL)hasClientModelIdOfHighestRankingSuggestion
{
  return self->_clientModelIdOfHighestRankingSuggestion != 0;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (void)setWidgetsInStack:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widgetsInStack = a3;
}

- (void)setHasWidgetsInStack:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetsInStack
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasExecuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker;
  -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int selectionType;
  __CFString *v7;
  NSString *clientModelIdOfHighestRankingSuggestion;
  NSString *highestConfidenceCategory;
  void *v10;
  NSString *execuableTypeOfHighestRankingSuggestion;
  NSString *abGroup;
  NSString *clientModelABGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType)
    objc_msgSend(v3, "setObject:forKey:", layoutType, CFSTR("layoutType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    selectionType = self->_selectionType;
    if (selectionType == 1)
    {
      v7 = CFSTR("NPlusOne");
    }
    else if (selectionType == 2)
    {
      v7 = CFSTR("StackRotation");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_selectionType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("selectionType"));

  }
  clientModelIdOfHighestRankingSuggestion = self->_clientModelIdOfHighestRankingSuggestion;
  if (clientModelIdOfHighestRankingSuggestion)
    objc_msgSend(v4, "setObject:forKey:", clientModelIdOfHighestRankingSuggestion, CFSTR("clientModelIdOfHighestRankingSuggestion"));
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory)
    objc_msgSend(v4, "setObject:forKey:", highestConfidenceCategory, CFSTR("highestConfidenceCategory"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_widgetsInStack);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("widgetsInStack"));

  }
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if (execuableTypeOfHighestRankingSuggestion)
    objc_msgSend(v4, "setObject:forKey:", execuableTypeOfHighestRankingSuggestion, CFSTR("execuableTypeOfHighestRankingSuggestion"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup)
    objc_msgSend(v4, "setObject:forKey:", clientModelABGroup, CFSTR("clientModelABGroup"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelIdOfHighestRankingSuggestion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
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
    *((_DWORD *)v4 + 14) = self->_selectionType;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_clientModelIdOfHighestRankingSuggestion)
  {
    objc_msgSend(v5, "setClientModelIdOfHighestRankingSuggestion:");
    v4 = v5;
  }
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_widgetsInStack;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_execuableTypeOfHighestRankingSuggestion)
  {
    objc_msgSend(v5, "setExecuableTypeOfHighestRankingSuggestion:");
    v4 = v5;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v5, "setAbGroup:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_layoutType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_selectionType;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_clientModelIdOfHighestRankingSuggestion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_highestConfidenceCategory, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_widgetsInStack;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_execuableTypeOfHighestRankingSuggestion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  v16 = -[NSString copyWithZone:](self->_clientModelABGroup, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *layoutType;
  NSString *clientModelIdOfHighestRankingSuggestion;
  NSString *highestConfidenceCategory;
  NSString *execuableTypeOfHighestRankingSuggestion;
  NSString *abGroup;
  NSString *clientModelABGroup;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_selectionType != *((_DWORD *)v4 + 14))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  clientModelIdOfHighestRankingSuggestion = self->_clientModelIdOfHighestRankingSuggestion;
  if ((unint64_t)clientModelIdOfHighestRankingSuggestion | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](clientModelIdOfHighestRankingSuggestion, "isEqual:"))
  {
    goto LABEL_24;
  }
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if ((unint64_t)highestConfidenceCategory | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](highestConfidenceCategory, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_widgetsInStack != *((_DWORD *)v4 + 15))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_24;
  }
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if ((unint64_t)execuableTypeOfHighestRankingSuggestion | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](execuableTypeOfHighestRankingSuggestion, "isEqual:"))
  {
    goto LABEL_24;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_24;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((_QWORD *)v4 + 2))
    v11 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
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

  v3 = -[NSString hash](self->_layoutType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_selectionType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_clientModelIdOfHighestRankingSuggestion, "hash");
  v6 = -[NSString hash](self->_highestConfidenceCategory, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_widgetsInStack;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_execuableTypeOfHighestRankingSuggestion, "hash");
  v10 = v8 ^ v9 ^ -[NSString hash](self->_abGroup, "hash");
  return v10 ^ -[NSString hash](self->_clientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setLayoutType:](self, "setLayoutType:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_selectionType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setClientModelIdOfHighestRankingSuggestion:](self, "setClientModelIdOfHighestRankingSuggestion:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    self->_widgetsInStack = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setExecuableTypeOfHighestRankingSuggestion:](self, "setExecuableTypeOfHighestRankingSuggestion:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker setClientModelABGroup:](self, "setClientModelABGroup:");
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

- (NSString)clientModelIdOfHighestRankingSuggestion
{
  return self->_clientModelIdOfHighestRankingSuggestion;
}

- (void)setClientModelIdOfHighestRankingSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelIdOfHighestRankingSuggestion, a3);
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
  objc_storeStrong((id *)&self->_highestConfidenceCategory, a3);
}

- (unsigned)widgetsInStack
{
  return self->_widgetsInStack;
}

- (NSString)execuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion;
}

- (void)setExecuableTypeOfHighestRankingSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_execuableTypeOfHighestRankingSuggestion, a3);
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
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_execuableTypeOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_clientModelIdOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
