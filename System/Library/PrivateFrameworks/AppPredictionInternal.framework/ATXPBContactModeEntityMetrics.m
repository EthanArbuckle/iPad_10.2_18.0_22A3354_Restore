@implementation ATXPBContactModeEntityMetrics

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setNumUniqueOutgoingInteractionRecipients:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numUniqueOutgoingInteractionRecipients = a3;
}

- (void)setHasNumUniqueOutgoingInteractionRecipients:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumUniqueOutgoingInteractionRecipients
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumUniqueIncomingInteractionSenders:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numUniqueIncomingInteractionSenders = a3;
}

- (void)setHasNumUniqueIncomingInteractionSenders:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumUniqueIncomingInteractionSenders
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActivityState
{
  return self->_activityState != 0;
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
  v8.super_class = (Class)ATXPBContactModeEntityMetrics;
  -[ATXPBContactModeEntityMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBContactModeEntityMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  char has;
  void *v7;
  void *v8;
  NSString *activityState;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numUniqueOutgoingInteractionRecipients);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numUniqueOutgoingInteractionRecipients"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numUniqueIncomingInteractionSenders);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numUniqueIncomingInteractionSenders"));

  }
  activityState = self->_activityState;
  if (activityState)
    objc_msgSend(v4, "setObject:forKey:", activityState, CFSTR("activityState"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContactModeEntityMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_bundleId)
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
  if (self->_activityState)
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
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_numUniqueOutgoingInteractionRecipients;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_numUniqueIncomingInteractionSenders;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_activityState)
  {
    objc_msgSend(v6, "setActivityState:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_numUniqueOutgoingInteractionRecipients;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_numUniqueIncomingInteractionSenders;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_activityState, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *activityState;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_numUniqueOutgoingInteractionRecipients != *((_DWORD *)v4 + 7))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_numUniqueIncomingInteractionSenders != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_16;
  }
  activityState = self->_activityState;
  if ((unint64_t)activityState | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](activityState, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_numUniqueOutgoingInteractionRecipients;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_activityState, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_numUniqueIncomingInteractionSenders;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_activityState, "hash");
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
    -[ATXPBContactModeEntityMetrics setBundleId:](self, "setBundleId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_numUniqueOutgoingInteractionRecipients = v4[7];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_numUniqueIncomingInteractionSenders = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXPBContactModeEntityMetrics setActivityState:](self, "setActivityState:");
    v4 = v6;
  }

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (unsigned)numUniqueOutgoingInteractionRecipients
{
  return self->_numUniqueOutgoingInteractionRecipients;
}

- (unsigned)numUniqueIncomingInteractionSenders
{
  return self->_numUniqueIncomingInteractionSenders;
}

- (NSString)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(id)a3
{
  objc_storeStrong((id *)&self->_activityState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activityState, 0);
}

@end
