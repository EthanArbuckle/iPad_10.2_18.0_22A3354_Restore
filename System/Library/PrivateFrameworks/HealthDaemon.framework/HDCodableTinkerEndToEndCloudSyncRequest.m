@implementation HDCodableTinkerEndToEndCloudSyncRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
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
  v8.super_class = (Class)HDCodableTinkerEndToEndCloudSyncRequest;
  -[HDCodableTinkerEndToEndCloudSyncRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerEndToEndCloudSyncRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerEndToEndCloudSyncRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_requestIdentifier)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *requestIdentifier;

  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(a3, "setRequestIdentifier:", requestIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    requestIdentifier = self->_requestIdentifier;
    if ((unint64_t)requestIdentifier | v4[1])
      v6 = -[NSString isEqual:](requestIdentifier, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_requestIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[HDCodableTinkerEndToEndCloudSyncRequest setRequestIdentifier:](self, "setRequestIdentifier:");
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
