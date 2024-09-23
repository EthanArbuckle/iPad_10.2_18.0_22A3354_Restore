@implementation HDCodableTinkerEndToEndCloudSyncResponse

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HDCodableTinkerEndToEndCloudSyncResponse;
  -[HDCodableTinkerEndToEndCloudSyncResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerEndToEndCloudSyncResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestIdentifier;
  void *v6;
  HDCodableError *error;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_success);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("success"));

  }
  error = self->_error;
  if (error)
  {
    -[HDCodableError dictionaryRepresentation](error, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("error"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerEndToEndCloudSyncResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_success;
    v4[28] |= 1u;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
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
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_success;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[HDCodableError copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestIdentifier;
  char v6;
  HDCodableError *error;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:"))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_success)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v6 = -[HDCodableError isEqual:](error, "isEqual:");
  else
    v6 = 1;
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_success;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[HDCodableError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  HDCodableError *error;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableTinkerEndToEndCloudSyncResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v7;
  }
  if (v4[28])
  {
    self->_success = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  error = self->_error;
  v6 = *((_QWORD *)v4 + 1);
  if (error)
  {
    if (v6)
    {
      -[HDCodableError mergeFrom:](error, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HDCodableTinkerEndToEndCloudSyncResponse setError:](self, "setError:");
    goto LABEL_10;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (BOOL)success
{
  return self->_success;
}

- (HDCodableError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
