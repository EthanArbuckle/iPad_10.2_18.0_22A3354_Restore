@implementation NPKProtoUpdatePassRequest

- (BOOL)hasLibraryHash
{
  return self->_libraryHash != 0;
}

- (BOOL)hasPreviousManifestHash
{
  return self->_previousManifestHash != 0;
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
  v8.super_class = (Class)NPKProtoUpdatePassRequest;
  -[NPKProtoUpdatePassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoUpdatePassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoPass *pass;
  void *v5;
  NPKProtoHash *libraryHash;
  void *v7;
  NSData *previousManifestHash;
  void *v9;
  NPKProtoCatalog *catalog;
  void *v11;
  char has;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  if (pass)
  {
    -[NPKProtoPass dictionaryRepresentation](pass, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pass"));

  }
  libraryHash = self->_libraryHash;
  if (libraryHash)
  {
    -[NPKProtoHash dictionaryRepresentation](libraryHash, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("libraryHash"));

  }
  previousManifestHash = self->_previousManifestHash;
  if (previousManifestHash)
    objc_msgSend(v3, "setObject:forKey:", previousManifestHash, CFSTR("previousManifestHash"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_resyncID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("resyncID"));

  }
  catalog = self->_catalog;
  if (catalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](catalog, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("catalog"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastKnownResyncID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("lastKnownResyncID"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_syncID);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("syncID"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoUpdatePassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  id v7;

  v4 = a3;
  if (!self->_pass)
    -[NPKProtoUpdatePassRequest writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_libraryHash)
    PBDataWriterWriteSubmessage();
  if (self->_previousManifestHash)
    PBDataWriterWriteDataField();
  v5 = v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v7;
  }
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
  objc_msgSend(v6, "setPass:", self->_pass);
  if (self->_libraryHash)
    objc_msgSend(v6, "setLibraryHash:");
  if (self->_previousManifestHash)
    objc_msgSend(v6, "setPreviousManifestHash:");
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_resyncID;
    *((_BYTE *)v6 + 56) |= 2u;
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
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[13] = self->_syncID;
    *((_BYTE *)v4 + 56) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoPass copyWithZone:](self->_pass, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NPKProtoHash copyWithZone:](self->_libraryHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_previousManifestHash, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_resyncID;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v12 = -[NPKProtoCatalog copyWithZone:](self->_catalog, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_lastKnownResyncID;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_syncID;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoPass *pass;
  NPKProtoHash *libraryHash;
  NSData *previousManifestHash;
  char has;
  NPKProtoCatalog *catalog;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  pass = self->_pass;
  if ((unint64_t)pass | *((_QWORD *)v4 + 4))
  {
    if (!-[NPKProtoPass isEqual:](pass, "isEqual:"))
      goto LABEL_25;
  }
  libraryHash = self->_libraryHash;
  if ((unint64_t)libraryHash | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoHash isEqual:](libraryHash, "isEqual:"))
      goto LABEL_25;
  }
  previousManifestHash = self->_previousManifestHash;
  if ((unint64_t)previousManifestHash | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](previousManifestHash, "isEqual:"))
      goto LABEL_25;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_resyncID != *((_DWORD *)v4 + 12))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_25;
  }
  catalog = self->_catalog;
  if ((unint64_t)catalog | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoCatalog isEqual:](catalog, "isEqual:"))
    {
LABEL_25:
      v10 = 0;
      goto LABEL_26;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_lastKnownResyncID != *((_DWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_25;
  }
  v10 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_syncID != *((_DWORD *)v4 + 13))
      goto LABEL_25;
    v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NPKProtoPass hash](self->_pass, "hash");
  v4 = -[NPKProtoHash hash](self->_libraryHash, "hash");
  v5 = -[NSData hash](self->_previousManifestHash, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_resyncID;
  else
    v6 = 0;
  v7 = -[NPKProtoCatalog hash](self->_catalog, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_lastKnownResyncID;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 2654435761 * self->_syncID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoPass *pass;
  uint64_t v6;
  NPKProtoHash *libraryHash;
  uint64_t v8;
  NPKProtoCatalog *catalog;
  uint64_t v10;
  char v11;
  id v12;

  v4 = a3;
  pass = self->_pass;
  v6 = *((_QWORD *)v4 + 4);
  v12 = v4;
  if (pass)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoUpdatePassRequest setPass:](self, "setPass:");
  }
  v4 = v12;
LABEL_7:
  libraryHash = self->_libraryHash;
  v8 = *((_QWORD *)v4 + 3);
  if (libraryHash)
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoHash mergeFrom:](libraryHash, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NPKProtoUpdatePassRequest setLibraryHash:](self, "setLibraryHash:");
  }
  v4 = v12;
LABEL_13:
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoUpdatePassRequest setPreviousManifestHash:](self, "setPreviousManifestHash:");
    v4 = v12;
  }
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_resyncID = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  catalog = self->_catalog;
  v10 = *((_QWORD *)v4 + 1);
  if (catalog)
  {
    if (!v10)
      goto LABEL_23;
    -[NPKProtoCatalog mergeFrom:](catalog, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[NPKProtoUpdatePassRequest setCatalog:](self, "setCatalog:");
  }
  v4 = v12;
LABEL_23:
  v11 = *((_BYTE *)v4 + 56);
  if ((v11 & 1) != 0)
  {
    self->_lastKnownResyncID = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v11 = *((_BYTE *)v4 + 56);
  }
  if ((v11 & 4) != 0)
  {
    self->_syncID = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NPKProtoHash)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
  objc_storeStrong((id *)&self->_libraryHash, a3);
}

- (NSData)previousManifestHash
{
  return self->_previousManifestHash;
}

- (void)setPreviousManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_previousManifestHash, a3);
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
  objc_storeStrong((id *)&self->_previousManifestHash, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoUpdatePassRequest writeTo:]", "NPKProtoUpdatePassRequest.m", 229, "self->_pass != nil");
}

@end
