@implementation ATXAnchorModelPBActionUUIDMetadata

- (void)setActionUUID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionUUID = a3;
}

- (void)setHasActionUUID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionUUID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSlotHash:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_slotHash = a3;
}

- (void)setHasSlotHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSlotHash
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setParamCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_paramCount = a3;
}

- (void)setHasParamCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParamCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasActionUUIDLaunchHistory
{
  return self->_actionUUIDLaunchHistory != 0;
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
  v8.super_class = (Class)ATXAnchorModelPBActionUUIDMetadata;
  -[ATXAnchorModelPBActionUUIDMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBActionUUIDMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
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
  ATXAnchorModelPBLaunchHistoryMetadata *actionUUIDLaunchHistory;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_actionUUID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("actionUUID"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_slotHash);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("slotHash"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_paramCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paramCount"));

  }
LABEL_5:
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  if (actionUUIDLaunchHistory)
  {
    -[ATXAnchorModelPBLaunchHistoryMetadata dictionaryRepresentation](actionUUIDLaunchHistory, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("actionUUIDLaunchHistory"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBActionUUIDMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_actionUUIDLaunchHistory)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_actionUUID;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_slotHash;
  *((_BYTE *)v4 + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 8) = self->_paramCount;
    *((_BYTE *)v4 + 36) |= 4u;
  }
LABEL_5:
  if (self->_actionUUIDLaunchHistory)
  {
    v6 = v4;
    objc_msgSend(v4, "setActionUUIDLaunchHistory:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_slotHash;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_actionUUID;
  *(_BYTE *)(v5 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_paramCount;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_5:
  v8 = -[ATXAnchorModelPBLaunchHistoryMetadata copyWithZone:](self->_actionUUIDLaunchHistory, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXAnchorModelPBLaunchHistoryMetadata *actionUUIDLaunchHistory;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_actionUUID != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_slotHash != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_paramCount != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  if ((unint64_t)actionUUIDLaunchHistory | *((_QWORD *)v4 + 3))
    v6 = -[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionUUIDLaunchHistory, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_actionUUIDLaunchHistory, "hash");
  }
  v2 = 2654435761 * self->_actionUUID;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_slotHash;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_paramCount;
  return v3 ^ v2 ^ v4 ^ -[ATXAnchorModelPBLaunchHistoryMetadata hash](self->_actionUUIDLaunchHistory, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  ATXAnchorModelPBLaunchHistoryMetadata *actionUUIDLaunchHistory;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 1) != 0)
  {
    self->_actionUUID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_slotHash = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_4:
    self->_paramCount = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  actionUUIDLaunchHistory = self->_actionUUIDLaunchHistory;
  v8 = v5[3];
  if (actionUUIDLaunchHistory)
  {
    if (v8)
    {
      v9 = v5;
      -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionUUIDLaunchHistory, "mergeFrom:");
LABEL_13:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[ATXAnchorModelPBActionUUIDMetadata setActionUUIDLaunchHistory:](self, "setActionUUIDLaunchHistory:");
    goto LABEL_13;
  }

}

- (int64_t)actionUUID
{
  return self->_actionUUID;
}

- (int64_t)slotHash
{
  return self->_slotHash;
}

- (unsigned)paramCount
{
  return self->_paramCount;
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionUUIDLaunchHistory
{
  return self->_actionUUIDLaunchHistory;
}

- (void)setActionUUIDLaunchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_actionUUIDLaunchHistory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionUUIDLaunchHistory, 0);
}

@end
