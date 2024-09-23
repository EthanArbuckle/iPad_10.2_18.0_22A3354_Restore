@implementation NPKProtoCatalogChangedRequest

- (void)setResyncID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resyncID = a3;
}

- (void)setHasResyncID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResyncID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLastKnownResyncID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastKnownResyncID = a3;
}

- (void)setHasLastKnownResyncID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastKnownResyncID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSyncID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_syncID = a3;
}

- (void)setHasSyncID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasWatchCatalog
{
  return self->_watchCatalog != 0;
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
  v8.super_class = (Class)NPKProtoCatalogChangedRequest;
  -[NPKProtoCatalogChangedRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCatalogChangedRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoCatalog *companionCatalog;
  void *v5;
  char has;
  void *v7;
  NPKProtoCatalog *watchCatalog;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  companionCatalog = self->_companionCatalog;
  if (companionCatalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](companionCatalog, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("companionCatalog"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resyncID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("resyncID"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastKnownResyncID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lastKnownResyncID"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("syncID"));

  }
LABEL_7:
  watchCatalog = self->_watchCatalog;
  if (watchCatalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](watchCatalog, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("watchCatalog"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCatalogChangedRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_companionCatalog)
    -[NPKProtoCatalogChangedRequest writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v7;
  }
  if (self->_watchCatalog)
  {
    PBDataWriterWriteSubmessage();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setCompanionCatalog:", self->_companionCatalog);
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_resyncID;
    *((_BYTE *)v6 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 4) = self->_lastKnownResyncID;
  *((_BYTE *)v6 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_syncID;
    *((_BYTE *)v6 + 40) |= 4u;
  }
LABEL_5:
  if (self->_watchCatalog)
  {
    objc_msgSend(v6, "setWatchCatalog:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoCatalog copyWithZone:](self->_companionCatalog, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(_BYTE *)(v5 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_resyncID;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_syncID;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v9 = -[NPKProtoCatalog copyWithZone:](self->_watchCatalog, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoCatalog *companionCatalog;
  NPKProtoCatalog *watchCatalog;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  companionCatalog = self->_companionCatalog;
  if ((unint64_t)companionCatalog | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](companionCatalog, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  watchCatalog = self->_watchCatalog;
  if ((unint64_t)watchCatalog | *((_QWORD *)v4 + 4))
    v7 = -[NPKProtoCatalog isEqual:](watchCatalog, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NPKProtoCatalog hash](self->_companionCatalog, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NPKProtoCatalog hash](self->_watchCatalog, "hash");
  }
  v4 = 2654435761 * self->_resyncID;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_lastKnownResyncID;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NPKProtoCatalog hash](self->_watchCatalog, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoCatalog *companionCatalog;
  uint64_t v6;
  char v7;
  NPKProtoCatalog *watchCatalog;
  uint64_t v9;
  id v10;

  v4 = a3;
  companionCatalog = self->_companionCatalog;
  v6 = *((_QWORD *)v4 + 1);
  v10 = v4;
  if (companionCatalog)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoCatalog mergeFrom:](companionCatalog, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoCatalogChangedRequest setCompanionCatalog:](self, "setCompanionCatalog:");
  }
  v4 = v10;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_lastKnownResyncID = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_10:
    self->_syncID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  watchCatalog = self->_watchCatalog;
  v9 = *((_QWORD *)v4 + 4);
  if (watchCatalog)
  {
    if (v9)
    {
      -[NPKProtoCatalog mergeFrom:](watchCatalog, "mergeFrom:");
LABEL_19:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[NPKProtoCatalogChangedRequest setWatchCatalog:](self, "setWatchCatalog:");
    goto LABEL_19;
  }

}

- (NPKProtoCatalog)companionCatalog
{
  return self->_companionCatalog;
}

- (void)setCompanionCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_companionCatalog, a3);
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (unsigned)lastKnownResyncID
{
  return self->_lastKnownResyncID;
}

- (unsigned)syncID
{
  return self->_syncID;
}

- (NPKProtoCatalog)watchCatalog
{
  return self->_watchCatalog;
}

- (void)setWatchCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_watchCatalog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchCatalog, 0);
  objc_storeStrong((id *)&self->_companionCatalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCatalogChangedRequest writeTo:]", "NPKProtoCatalogChangedRequest.m", 185, "self->_companionCatalog != nil");
}

@end
