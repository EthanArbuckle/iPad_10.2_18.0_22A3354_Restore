@implementation NPKProtoPassSyncReconciledStateUnrecognized

- (BOOL)hasUnrecognizedReconciledStateHash
{
  return self->_unrecognizedReconciledStateHash != 0;
}

- (BOOL)hasLibraryPassSyncState
{
  return self->_libraryPassSyncState != 0;
}

- (void)setUnrecognizedReconciledStateVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_unrecognizedReconciledStateVersion = a3;
}

- (void)setHasUnrecognizedReconciledStateVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnrecognizedReconciledStateVersion
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncReconciledStateUnrecognized;
  -[NPKProtoPassSyncReconciledStateUnrecognized description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncReconciledStateUnrecognized dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *unrecognizedReconciledStateHash;
  NPKProtoPassSyncState *libraryPassSyncState;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  unrecognizedReconciledStateHash = self->_unrecognizedReconciledStateHash;
  if (unrecognizedReconciledStateHash)
    objc_msgSend(v3, "setObject:forKey:", unrecognizedReconciledStateHash, CFSTR("unrecognizedReconciledStateHash"));
  libraryPassSyncState = self->_libraryPassSyncState;
  if (libraryPassSyncState)
  {
    -[NPKProtoPassSyncState dictionaryRepresentation](libraryPassSyncState, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("libraryPassSyncState"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_unrecognizedReconciledStateVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("unrecognizedReconciledStateVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncReconciledStateUnrecognizedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_unrecognizedReconciledStateHash)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_libraryPassSyncState)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_unrecognizedReconciledStateHash)
  {
    objc_msgSend(v4, "setUnrecognizedReconciledStateHash:");
    v4 = v5;
  }
  if (self->_libraryPassSyncState)
  {
    objc_msgSend(v5, "setLibraryPassSyncState:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_unrecognizedReconciledStateVersion;
    *((_BYTE *)v4 + 28) |= 1u;
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
  v6 = -[NSData copyWithZone:](self->_unrecognizedReconciledStateHash, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NPKProtoPassSyncState copyWithZone:](self->_libraryPassSyncState, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_unrecognizedReconciledStateVersion;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *unrecognizedReconciledStateHash;
  NPKProtoPassSyncState *libraryPassSyncState;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  unrecognizedReconciledStateHash = self->_unrecognizedReconciledStateHash;
  if ((unint64_t)unrecognizedReconciledStateHash | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](unrecognizedReconciledStateHash, "isEqual:"))
      goto LABEL_10;
  }
  libraryPassSyncState = self->_libraryPassSyncState;
  if ((unint64_t)libraryPassSyncState | *((_QWORD *)v4 + 1))
  {
    if (!-[NPKProtoPassSyncState isEqual:](libraryPassSyncState, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_unrecognizedReconciledStateVersion == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_unrecognizedReconciledStateHash, "hash");
  v4 = -[NPKProtoPassSyncState hash](self->_libraryPassSyncState, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_unrecognizedReconciledStateVersion;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  NPKProtoPassSyncState *libraryPassSyncState;
  uint64_t v6;
  unsigned int *v7;

  v4 = (unsigned int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoPassSyncReconciledStateUnrecognized setUnrecognizedReconciledStateHash:](self, "setUnrecognizedReconciledStateHash:");
    v4 = v7;
  }
  libraryPassSyncState = self->_libraryPassSyncState;
  v6 = *((_QWORD *)v4 + 1);
  if (libraryPassSyncState)
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoPassSyncState mergeFrom:](libraryPassSyncState, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoPassSyncReconciledStateUnrecognized setLibraryPassSyncState:](self, "setLibraryPassSyncState:");
  }
  v4 = v7;
LABEL_9:
  if ((v4[7] & 1) != 0)
  {
    self->_unrecognizedReconciledStateVersion = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)unrecognizedReconciledStateHash
{
  return self->_unrecognizedReconciledStateHash;
}

- (void)setUnrecognizedReconciledStateHash:(id)a3
{
  objc_storeStrong((id *)&self->_unrecognizedReconciledStateHash, a3);
}

- (NPKProtoPassSyncState)libraryPassSyncState
{
  return self->_libraryPassSyncState;
}

- (void)setLibraryPassSyncState:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPassSyncState, a3);
}

- (unsigned)unrecognizedReconciledStateVersion
{
  return self->_unrecognizedReconciledStateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unrecognizedReconciledStateHash, 0);
  objc_storeStrong((id *)&self->_libraryPassSyncState, 0);
}

@end
