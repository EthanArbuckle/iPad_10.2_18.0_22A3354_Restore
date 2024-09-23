@implementation ATXMPBBlendingLayerRefreshTracker

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setInterarrivalTime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interarrivalTime = a3;
}

- (void)setHasInterarrivalTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterarrivalTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setComputationTime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_computationTime = a3;
}

- (void)setHasComputationTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComputationTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
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
  v8.super_class = (Class)ATXMPBBlendingLayerRefreshTracker;
  -[ATXMPBBlendingLayerRefreshTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBBlendingLayerRefreshTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientModelId;
  char has;
  void *v7;
  void *v8;
  NSString *abGroup;
  NSString *consumerSubType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v3, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_interarrivalTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("interarrivalTime"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_computationTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("computationTime"));

  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingLayerRefreshTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_interarrivalTime;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_computationTime;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    v4 = v6;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v6, "setConsumerSubType:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_interarrivalTime;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_computationTime;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v9;

  v11 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientModelId;
  NSString *abGroup;
  NSString *consumerSubType;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_interarrivalTime != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_computationTime != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](abGroup, "isEqual:"))
    goto LABEL_18;
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](consumerSubType, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_interarrivalTime;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_computationTime;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_abGroup, "hash");
  return v6 ^ -[NSString hash](self->_consumerSubType, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  unsigned int *v6;

  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBBlendingLayerRefreshTracker setClientModelId:](self, "setClientModelId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_interarrivalTime = v4[10];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_computationTime = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBBlendingLayerRefreshTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBBlendingLayerRefreshTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v6;
  }

}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (unsigned)interarrivalTime
{
  return self->_interarrivalTime;
}

- (unsigned)computationTime
{
  return self->_computationTime;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
