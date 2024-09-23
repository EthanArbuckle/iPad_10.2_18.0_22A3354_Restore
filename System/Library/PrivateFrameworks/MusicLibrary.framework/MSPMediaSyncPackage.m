@implementation MSPMediaSyncPackage

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E5B63540[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Header")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SyncOperation")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)lastPackage
{
  return (*(_BYTE *)&self->_has & 2) != 0 && self->_lastPackage;
}

- (void)setLastPackage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastPackage = a3;
}

- (void)setHasLastPackage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastPackage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasSyncOperation
{
  return self->_syncOperation != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
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
  v8.super_class = (Class)MSPMediaSyncPackage;
  -[MSPMediaSyncPackage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncPackage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  MSPMediaSyncHeader *header;
  void *v9;
  MSPMediaSyncOperation *syncOperation;
  void *v11;
  MSPMediaSyncError *error;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = self->_type - 1;
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5B63540[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastPackage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lastPackage"));

  }
  header = self->_header;
  if (header)
  {
    -[MSPMediaSyncHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("header"));

  }
  syncOperation = self->_syncOperation;
  if (syncOperation)
  {
    -[MSPMediaSyncOperation dictionaryRepresentation](syncOperation, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("syncOperation"));

  }
  error = self->_error;
  if (error)
  {
    -[MSPMediaSyncError dictionaryRepresentation](error, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("error"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPMediaSyncPackageReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_syncOperation)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_lastPackage;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  v6 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    v4 = v6;
  }
  if (self->_syncOperation)
  {
    objc_msgSend(v6, "setSyncOperation:");
    v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
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
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 36) = self->_lastPackage;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[MSPMediaSyncHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[MSPMediaSyncOperation copyWithZone:](self->_syncOperation, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  v12 = -[MSPMediaSyncError copyWithZone:](self->_error, "copyWithZone:", a3);
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MSPMediaSyncHeader *header;
  MSPMediaSyncOperation *syncOperation;
  MSPMediaSyncError *error;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) != 0)
    {
      if (self->_lastPackage)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_21;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_15;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
    goto LABEL_21;
LABEL_15:
  header = self->_header;
  if ((unint64_t)header | *((_QWORD *)v4 + 2) && !-[MSPMediaSyncHeader isEqual:](header, "isEqual:"))
    goto LABEL_21;
  syncOperation = self->_syncOperation;
  if ((unint64_t)syncOperation | *((_QWORD *)v4 + 3))
  {
    if (!-[MSPMediaSyncOperation isEqual:](syncOperation, "isEqual:"))
      goto LABEL_21;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v8 = -[MSPMediaSyncError isEqual:](error, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_lastPackage;
LABEL_6:
  v5 = v4 ^ v3 ^ -[MSPMediaSyncHeader hash](self->_header, "hash");
  v6 = -[MSPMediaSyncOperation hash](self->_syncOperation, "hash");
  return v5 ^ v6 ^ -[MSPMediaSyncError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  MSPMediaSyncHeader *header;
  uint64_t v8;
  MSPMediaSyncOperation *syncOperation;
  uint64_t v10;
  MSPMediaSyncError *error;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 40);
  if ((v6 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((v6 & 2) != 0)
  {
    self->_lastPackage = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 2u;
  }
  header = self->_header;
  v8 = v5[2];
  v13 = v5;
  if (header)
  {
    if (!v8)
      goto LABEL_11;
    -[MSPMediaSyncHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[MSPMediaSyncPackage setHeader:](self, "setHeader:");
  }
  v5 = v13;
LABEL_11:
  syncOperation = self->_syncOperation;
  v10 = v5[3];
  if (syncOperation)
  {
    if (!v10)
      goto LABEL_17;
    -[MSPMediaSyncOperation mergeFrom:](syncOperation, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    -[MSPMediaSyncPackage setSyncOperation:](self, "setSyncOperation:");
  }
  v5 = v13;
LABEL_17:
  error = self->_error;
  v12 = v5[1];
  if (error)
  {
    if (v12)
    {
      -[MSPMediaSyncError mergeFrom:](error, "mergeFrom:");
LABEL_22:
      v5 = v13;
    }
  }
  else if (v12)
  {
    -[MSPMediaSyncPackage setError:](self, "setError:");
    goto LABEL_22;
  }

}

- (MSPMediaSyncHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (MSPMediaSyncOperation)syncOperation
{
  return self->_syncOperation;
}

- (void)setSyncOperation:(id)a3
{
  objc_storeStrong((id *)&self->_syncOperation, a3);
}

- (MSPMediaSyncError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
