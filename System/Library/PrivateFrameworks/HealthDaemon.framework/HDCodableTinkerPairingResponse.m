@implementation HDCodableTinkerPairingResponse

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasSetupMetadata
{
  return self->_setupMetadata != 0;
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
  v8.super_class = (Class)HDCodableTinkerPairingResponse;
  -[HDCodableTinkerPairingResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerPairingResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HDCodableSharingSetupMetadata *setupMetadata;
  void *v7;
  HDCodableError *error;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  setupMetadata = self->_setupMetadata;
  if (setupMetadata)
  {
    -[HDCodableSharingSetupMetadata dictionaryRepresentation](setupMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("setupMetadata"));

  }
  error = self->_error;
  if (error)
  {
    -[HDCodableError dictionaryRepresentation](error, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("error"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerPairingResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_setupMetadata)
  {
    PBDataWriterWriteSubmessage();
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
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_setupMetadata)
  {
    objc_msgSend(v5, "setSetupMetadata:");
    v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HDCodableSharingSetupMetadata copyWithZone:](self->_setupMetadata, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[HDCodableError copyWithZone:](self->_error, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  HDCodableSharingSetupMetadata *setupMetadata;
  HDCodableError *error;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:"))
    && ((setupMetadata = self->_setupMetadata, !((unint64_t)setupMetadata | v4[3]))
     || -[HDCodableSharingSetupMetadata isEqual:](setupMetadata, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1])
      v8 = -[HDCodableError isEqual:](error, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  v4 = -[HDCodableSharingSetupMetadata hash](self->_setupMetadata, "hash") ^ v3;
  return v4 ^ -[HDCodableError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSharingSetupMetadata *setupMetadata;
  uint64_t v6;
  HDCodableError *error;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[HDCodableTinkerPairingResponse setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v9;
  }
  setupMetadata = self->_setupMetadata;
  v6 = v4[3];
  if (setupMetadata)
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableSharingSetupMetadata mergeFrom:](setupMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableTinkerPairingResponse setSetupMetadata:](self, "setSetupMetadata:");
  }
  v4 = v9;
LABEL_9:
  error = self->_error;
  v8 = v4[1];
  if (error)
  {
    if (v8)
    {
      -[HDCodableError mergeFrom:](error, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableTinkerPairingResponse setError:](self, "setError:");
    goto LABEL_14;
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

- (HDCodableSharingSetupMetadata)setupMetadata
{
  return self->_setupMetadata;
}

- (void)setSetupMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_setupMetadata, a3);
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
  objc_storeStrong((id *)&self->_setupMetadata, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
