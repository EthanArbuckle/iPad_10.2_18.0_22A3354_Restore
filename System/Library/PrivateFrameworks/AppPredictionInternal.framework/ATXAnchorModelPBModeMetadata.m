@implementation ATXAnchorModelPBModeMetadata

- (BOOL)hasModeId
{
  return self->_modeId != 0;
}

- (void)setIsStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStart
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasModeHistory
{
  return self->_modeHistory != 0;
}

- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_relativeTimeSinceAnchorInSeconds = a3;
}

- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelativeTimeSinceAnchorInSeconds
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)ATXAnchorModelPBModeMetadata;
  -[ATXAnchorModelPBModeMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBModeMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *modeId;
  void *v6;
  ATXAnchorModelPBLaunchHistoryMetadata *modeHistory;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  modeId = self->_modeId;
  if (modeId)
    objc_msgSend(v3, "setObject:forKey:", modeId, CFSTR("modeId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("isStart"));

  }
  modeHistory = self->_modeHistory;
  if (modeHistory)
  {
    -[ATXAnchorModelPBLaunchHistoryMetadata dictionaryRepresentation](modeHistory, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("modeHistory"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_relativeTimeSinceAnchorInSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("relativeTimeSinceAnchorInSeconds"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBModeMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_modeId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_modeHistory)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_modeId)
  {
    objc_msgSend(v4, "setModeId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 28) = self->_isStart;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_modeHistory)
  {
    objc_msgSend(v5, "setModeHistory:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_relativeTimeSinceAnchorInSeconds;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_modeId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 28) = self->_isStart;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v8 = -[ATXAnchorModelPBLaunchHistoryMetadata copyWithZone:](self->_modeHistory, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_relativeTimeSinceAnchorInSeconds;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *modeId;
  char has;
  ATXAnchorModelPBLaunchHistoryMetadata *modeHistory;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_19;
    if (self->_isStart)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_19;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  modeHistory = self->_modeHistory;
  if (!((unint64_t)modeHistory | *((_QWORD *)v4 + 1)))
    goto LABEL_15;
  if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](modeHistory, "isEqual:"))
  {
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  has = (char)self->_has;
LABEL_15:
  v8 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_relativeTimeSinceAnchorInSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_modeId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_isStart;
  else
    v4 = 0;
  v5 = -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_modeHistory, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_relativeTimeSinceAnchorInSeconds;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXAnchorModelPBLaunchHistoryMetadata *modeHistory;
  uint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXAnchorModelPBModeMetadata setModeId:](self, "setModeId:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_isStart = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
  }
  modeHistory = self->_modeHistory;
  v6 = *((_QWORD *)v4 + 1);
  if (modeHistory)
  {
    if (!v6)
      goto LABEL_11;
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](modeHistory, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[ATXAnchorModelPBModeMetadata setModeHistory:](self, "setModeHistory:");
  }
  v4 = v7;
LABEL_11:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_relativeTimeSinceAnchorInSeconds = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)modeId
{
  return self->_modeId;
}

- (void)setModeId:(id)a3
{
  objc_storeStrong((id *)&self->_modeId, a3);
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (ATXAnchorModelPBLaunchHistoryMetadata)modeHistory
{
  return self->_modeHistory;
}

- (void)setModeHistory:(id)a3
{
  objc_storeStrong((id *)&self->_modeHistory, a3);
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeId, 0);
  objc_storeStrong((id *)&self->_modeHistory, 0);
}

@end
