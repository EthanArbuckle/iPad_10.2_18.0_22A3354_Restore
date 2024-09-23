@implementation ATXMPBBlendingClientModelHomeScreenLayoutTracker

- (BOOL)hasLayoutType
{
  return self->_layoutType != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setNumSuggestionsForClientModelInLayout:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numSuggestionsForClientModelInLayout = a3;
}

- (void)setHasNumSuggestionsForClientModelInLayout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumSuggestionsForClientModelInLayout
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
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
  v8.super_class = (Class)ATXMPBBlendingClientModelHomeScreenLayoutTracker;
  -[ATXMPBBlendingClientModelHomeScreenLayoutTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingClientModelHomeScreenLayoutTracker dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *clientModelId;
  void *v7;
  NSString *consumerSubType;
  NSString *abGroup;
  NSString *clientModelABGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  layoutType = self->_layoutType;
  if (layoutType)
    objc_msgSend(v3, "setObject:forKey:", layoutType, CFSTR("layoutType"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v4, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numSuggestionsForClientModelInLayout);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numSuggestionsForClientModelInLayout"));

  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
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
  return ATXMPBBlendingClientModelHomeScreenLayoutTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_consumerSubType)
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
  if (self->_clientModelId)
  {
    objc_msgSend(v5, "setClientModelId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_numSuggestionsForClientModelInLayout;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_layoutType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_numSuggestionsForClientModelInLayout;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  v14 = -[NSString copyWithZone:](self->_clientModelABGroup, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *layoutType;
  NSString *clientModelId;
  NSString *consumerSubType;
  NSString *abGroup;
  NSString *clientModelABGroup;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  layoutType = self->_layoutType;
  if ((unint64_t)layoutType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](layoutType, "isEqual:"))
      goto LABEL_17;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_numSuggestionsForClientModelInLayout != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_17;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_17;
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((_QWORD *)v4 + 2))
    v10 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_layoutType, "hash");
  v4 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_numSuggestionsForClientModelInLayout;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_consumerSubType, "hash");
  v7 = -[NSString hash](self->_abGroup, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_clientModelABGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setLayoutType:](self, "setLayoutType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setClientModelId:](self, "setClientModelId:");
    v4 = v5;
  }
  if ((v4[13] & 1) != 0)
  {
    self->_numSuggestionsForClientModelInLayout = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setAbGroup:](self, "setAbGroup:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelHomeScreenLayoutTracker setClientModelABGroup:](self, "setClientModelABGroup:");
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

- (unsigned)numSuggestionsForClientModelInLayout
{
  return self->_numSuggestionsForClientModelInLayout;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
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
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
