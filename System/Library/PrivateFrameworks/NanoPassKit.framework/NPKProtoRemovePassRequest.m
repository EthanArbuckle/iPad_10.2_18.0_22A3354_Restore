@implementation NPKProtoRemovePassRequest

- (BOOL)hasLibraryHash
{
  return self->_libraryHash != 0;
}

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

- (BOOL)hasCatalog
{
  return self->_catalog != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemovePassRequest;
  -[NPKProtoRemovePassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemovePassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *passID;
  NPKProtoHash *libraryHash;
  void *v7;
  void *v8;
  NPKProtoCatalog *catalog;
  void *v10;
  char has;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  passID = self->_passID;
  if (passID)
    objc_msgSend(v3, "setObject:forKey:", passID, CFSTR("passID"));
  libraryHash = self->_libraryHash;
  if (libraryHash)
  {
    -[NPKProtoHash dictionaryRepresentation](libraryHash, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("libraryHash"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resyncID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("resyncID"));

  }
  catalog = self->_catalog;
  if (catalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](catalog, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("catalog"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastKnownResyncID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("lastKnownResyncID"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("syncID"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemovePassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  id v7;

  v4 = a3;
  if (!self->_passID)
    -[NPKProtoRemovePassRequest writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_libraryHash)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v5 = v7;
  if (self->_catalog)
  {
    PBDataWriterWriteSubmessage();
    v5 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setPassID:", self->_passID);
  if (self->_libraryHash)
    objc_msgSend(v6, "setLibraryHash:");
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_resyncID;
    *((_BYTE *)v6 + 48) |= 2u;
  }
  if (self->_catalog)
  {
    objc_msgSend(v6, "setCatalog:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_lastKnownResyncID;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[11] = self->_syncID;
    *((_BYTE *)v4 + 48) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_passID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NPKProtoHash copyWithZone:](self->_libraryHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_resyncID;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v10 = -[NPKProtoCatalog copyWithZone:](self->_catalog, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_syncID;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *passID;
  NPKProtoHash *libraryHash;
  char has;
  NPKProtoCatalog *catalog;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  passID = self->_passID;
  if ((unint64_t)passID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](passID, "isEqual:"))
      goto LABEL_23;
  }
  libraryHash = self->_libraryHash;
  if ((unint64_t)libraryHash | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoHash isEqual:](libraryHash, "isEqual:"))
      goto LABEL_23;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 10))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  catalog = self->_catalog;
  if ((unint64_t)catalog | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](catalog, "isEqual:"))
    {
LABEL_23:
      v9 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_23;
  }
  v9 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 11))
      goto LABEL_23;
    v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_passID, "hash");
  v4 = -[NPKProtoHash hash](self->_libraryHash, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_resyncID;
  else
    v5 = 0;
  v6 = -[NPKProtoCatalog hash](self->_catalog, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_lastKnownResyncID;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  NPKProtoHash *libraryHash;
  uint64_t v6;
  NPKProtoCatalog *catalog;
  uint64_t v8;
  char v9;
  unsigned int *v10;

  v4 = (unsigned int *)a3;
  v10 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoRemovePassRequest setPassID:](self, "setPassID:");
    v4 = v10;
  }
  libraryHash = self->_libraryHash;
  v6 = *((_QWORD *)v4 + 3);
  if (libraryHash)
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoHash mergeFrom:](libraryHash, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoRemovePassRequest setLibraryHash:](self, "setLibraryHash:");
  }
  v4 = v10;
LABEL_9:
  if ((v4[12] & 2) != 0)
  {
    self->_resyncID = v4[10];
    *(_BYTE *)&self->_has |= 2u;
  }
  catalog = self->_catalog;
  v8 = *((_QWORD *)v4 + 1);
  if (catalog)
  {
    if (!v8)
      goto LABEL_17;
    -[NPKProtoCatalog mergeFrom:](catalog, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[NPKProtoRemovePassRequest setCatalog:](self, "setCatalog:");
  }
  v4 = v10;
LABEL_17:
  v9 = *((_BYTE *)v4 + 48);
  if ((v9 & 1) != 0)
  {
    self->_lastKnownResyncID = v4[4];
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v4 + 48);
  }
  if ((v9 & 4) != 0)
  {
    self->_syncID = v4[11];
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
  objc_storeStrong((id *)&self->_passID, a3);
}

- (NPKProtoHash)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
  objc_storeStrong((id *)&self->_libraryHash, a3);
}

- (unsigned)resyncID
{
  return self->_resyncID;
}

- (NPKProtoCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_catalog, a3);
}

- (unsigned)lastKnownResyncID
{
  return self->_lastKnownResyncID;
}

- (unsigned)syncID
{
  return self->_syncID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passID, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemovePassRequest writeTo:]", "NPKProtoRemovePassRequest.m", 201, "nil != self->_passID");
}

@end
