@implementation NPKProtoPassSyncStateChangeProcessed

- (void)setChangeAccepted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeAccepted = a3;
}

- (void)setHasChangeAccepted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeAccepted
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFullPassRequired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fullPassRequired = a3;
}

- (void)setHasFullPassRequired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFullPassRequired
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncStateChangeProcessed;
  -[NPKProtoPassSyncStateChangeProcessed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChangeProcessed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *acceptedChangeUUID;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  acceptedChangeUUID = self->_acceptedChangeUUID;
  if (acceptedChangeUUID)
    objc_msgSend(v3, "setObject:forKey:", acceptedChangeUUID, CFSTR("acceptedChangeUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_changeAccepted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("changeAccepted"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fullPassRequired);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("fullPassRequired"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateChangeProcessedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (!self->_acceptedChangeUUID)
    -[NPKProtoPassSyncStateChangeProcessed writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  char has;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setAcceptedChangeUUID:", self->_acceptedChangeUUID);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[16] = self->_changeAccepted;
    v5[20] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[17] = self->_fullPassRequired;
    v5[20] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_acceptedChangeUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_changeAccepted;
    *(_BYTE *)(v5 + 20) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_fullPassRequired;
    *(_BYTE *)(v5 + 20) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *acceptedChangeUUID;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  acceptedChangeUUID = self->_acceptedChangeUUID;
  if ((unint64_t)acceptedChangeUUID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](acceptedChangeUUID, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_14;
    if (self->_changeAccepted)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) != 0)
    {
      if (self->_fullPassRequired)
      {
        if (!*((_BYTE *)v4 + 17))
          goto LABEL_14;
      }
      else if (*((_BYTE *)v4 + 17))
      {
        goto LABEL_14;
      }
      v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_acceptedChangeUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_changeAccepted;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_fullPassRequired;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[NPKProtoPassSyncStateChangeProcessed setAcceptedChangeUUID:](self, "setAcceptedChangeUUID:");
    v4 = v6;
  }
  v5 = v4[20];
  if (v5)
  {
    self->_changeAccepted = v4[16];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[20];
  }
  if ((v5 & 2) != 0)
  {
    self->_fullPassRequired = v4[17];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)acceptedChangeUUID
{
  return self->_acceptedChangeUUID;
}

- (void)setAcceptedChangeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedChangeUUID, a3);
}

- (BOOL)changeAccepted
{
  return self->_changeAccepted;
}

- (BOOL)fullPassRequired
{
  return self->_fullPassRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedChangeUUID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateChangeProcessed writeTo:]", "NPKProtoPassSyncStateChangeProcessed.m", 120, "nil != self->_acceptedChangeUUID");
}

@end
