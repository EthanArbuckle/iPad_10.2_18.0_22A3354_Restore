@implementation ATXMPBBlendingLayoutSelectionTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasHighestConfidenceCategory
{
  return self->_highestConfidenceCategory != 0;
}

- (BOOL)hasHighestRankingClientModelId
{
  return self->_highestRankingClientModelId != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasExecuableTypeOfHighestRankingSuggestion
{
  return self->_execuableTypeOfHighestRankingSuggestion != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasHighestRankingClientModelABGroup
{
  return self->_highestRankingClientModelABGroup != 0;
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
  v8.super_class = (Class)ATXMPBBlendingLayoutSelectionTracker;
  -[ATXMPBBlendingLayoutSelectionTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingLayoutSelectionTracker dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *highestConfidenceCategory;
  NSString *highestRankingClientModelId;
  NSString *consumerSubType;
  NSString *execuableTypeOfHighestRankingSuggestion;
  NSString *abGroup;
  NSString *highestRankingClientModelABGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType)
    objc_msgSend(v3, "setObject:forKey:", layoutType, CFSTR("layoutType"));
  highestConfidenceCategory = self->_highestConfidenceCategory;
  if (highestConfidenceCategory)
    objc_msgSend(v4, "setObject:forKey:", highestConfidenceCategory, CFSTR("highestConfidenceCategory"));
  highestRankingClientModelId = self->_highestRankingClientModelId;
  if (highestRankingClientModelId)
    objc_msgSend(v4, "setObject:forKey:", highestRankingClientModelId, CFSTR("highestRankingClientModelId"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion;
  if (execuableTypeOfHighestRankingSuggestion)
    objc_msgSend(v4, "setObject:forKey:", execuableTypeOfHighestRankingSuggestion, CFSTR("execuableTypeOfHighestRankingSuggestion"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  highestRankingClientModelABGroup = self->_highestRankingClientModelABGroup;
  if (highestRankingClientModelABGroup)
    objc_msgSend(v4, "setObject:forKey:", highestRankingClientModelABGroup, CFSTR("highestRankingClientModelABGroup"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingLayoutSelectionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_highestConfidenceCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_highestRankingClientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
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
  if (self->_highestRankingClientModelABGroup)
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
  if (self->_highestConfidenceCategory)
  {
    objc_msgSend(v5, "setHighestConfidenceCategory:");
    v4 = v5;
  }
  if (self->_highestRankingClientModelId)
  {
    objc_msgSend(v5, "setHighestRankingClientModelId:");
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    v4 = v5;
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
  if (self->_highestRankingClientModelABGroup)
  {
    objc_msgSend(v5, "setHighestRankingClientModelABGroup:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_layoutType, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_highestConfidenceCategory, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_highestRankingClientModelId, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSString copyWithZone:](self->_execuableTypeOfHighestRankingSuggestion, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  v16 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v18 = -[NSString copyWithZone:](self->_highestRankingClientModelABGroup, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *layoutType;
  NSString *highestConfidenceCategory;
  NSString *highestRankingClientModelId;
  NSString *consumerSubType;
  NSString *execuableTypeOfHighestRankingSuggestion;
  NSString *abGroup;
  NSString *highestRankingClientModelABGroup;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((layoutType = self->_layoutType, !((unint64_t)layoutType | v4[7]))
     || -[NSString isEqual:](layoutType, "isEqual:"))
    && ((highestConfidenceCategory = self->_highestConfidenceCategory,
         !((unint64_t)highestConfidenceCategory | v4[4]))
     || -[NSString isEqual:](highestConfidenceCategory, "isEqual:"))
    && ((highestRankingClientModelId = self->_highestRankingClientModelId,
         !((unint64_t)highestRankingClientModelId | v4[6]))
     || -[NSString isEqual:](highestRankingClientModelId, "isEqual:"))
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[2]))
     || -[NSString isEqual:](consumerSubType, "isEqual:"))
    && ((execuableTypeOfHighestRankingSuggestion = self->_execuableTypeOfHighestRankingSuggestion,
         !((unint64_t)execuableTypeOfHighestRankingSuggestion | v4[3]))
     || -[NSString isEqual:](execuableTypeOfHighestRankingSuggestion, "isEqual:"))
    && ((abGroup = self->_abGroup, !((unint64_t)abGroup | v4[1]))
     || -[NSString isEqual:](abGroup, "isEqual:")))
  {
    highestRankingClientModelABGroup = self->_highestRankingClientModelABGroup;
    if ((unint64_t)highestRankingClientModelABGroup | v4[5])
      v12 = -[NSString isEqual:](highestRankingClientModelABGroup, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_layoutType, "hash");
  v4 = -[NSString hash](self->_highestConfidenceCategory, "hash") ^ v3;
  v5 = -[NSString hash](self->_highestRankingClientModelId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_consumerSubType, "hash");
  v7 = -[NSString hash](self->_execuableTypeOfHighestRankingSuggestion, "hash");
  v8 = v7 ^ -[NSString hash](self->_abGroup, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_highestRankingClientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[7])
    -[ATXMPBBlendingLayoutSelectionTracker setLayoutType:](self, "setLayoutType:");
  if (v4[4])
    -[ATXMPBBlendingLayoutSelectionTracker setHighestConfidenceCategory:](self, "setHighestConfidenceCategory:");
  if (v4[6])
    -[ATXMPBBlendingLayoutSelectionTracker setHighestRankingClientModelId:](self, "setHighestRankingClientModelId:");
  if (v4[2])
    -[ATXMPBBlendingLayoutSelectionTracker setConsumerSubType:](self, "setConsumerSubType:");
  if (v4[3])
    -[ATXMPBBlendingLayoutSelectionTracker setExecuableTypeOfHighestRankingSuggestion:](self, "setExecuableTypeOfHighestRankingSuggestion:");
  if (v4[1])
    -[ATXMPBBlendingLayoutSelectionTracker setAbGroup:](self, "setAbGroup:");
  if (v4[5])
    -[ATXMPBBlendingLayoutSelectionTracker setHighestRankingClientModelABGroup:](self, "setHighestRankingClientModelABGroup:");

}

- (NSString)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(id)a3
{
  objc_storeStrong((id *)&self->_layoutType, a3);
}

- (NSString)highestConfidenceCategory
{
  return self->_highestConfidenceCategory;
}

- (void)setHighestConfidenceCategory:(id)a3
{
  objc_storeStrong((id *)&self->_highestConfidenceCategory, a3);
}

- (NSString)highestRankingClientModelId
{
  return self->_highestRankingClientModelId;
}

- (void)setHighestRankingClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_highestRankingClientModelId, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
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

- (NSString)highestRankingClientModelABGroup
{
  return self->_highestRankingClientModelABGroup;
}

- (void)setHighestRankingClientModelABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_highestRankingClientModelABGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutType, 0);
  objc_storeStrong((id *)&self->_highestRankingClientModelId, 0);
  objc_storeStrong((id *)&self->_highestRankingClientModelABGroup, 0);
  objc_storeStrong((id *)&self->_highestConfidenceCategory, 0);
  objc_storeStrong((id *)&self->_execuableTypeOfHighestRankingSuggestion, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
