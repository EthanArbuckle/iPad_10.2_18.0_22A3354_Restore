@implementation HDCodableClinicalGateway

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableClinicalGateway;
  -[HDCodableClinicalGateway description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalGateway dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *rawContent;
  HDCodableMessageVersion *messageVersion;
  void *v7;
  HDCodableSyncIdentity *syncIdentity;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  rawContent = self->_rawContent;
  if (rawContent)
    objc_msgSend(v3, "setObject:forKey:", rawContent, CFSTR("rawContent"));
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("messageVersion"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalGatewayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_rawContent)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_syncIdentity)
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
  if (self->_rawContent)
  {
    objc_msgSend(v4, "setRawContent:");
    v4 = v5;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
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
  v6 = -[NSData copyWithZone:](self->_rawContent, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *rawContent;
  HDCodableMessageVersion *messageVersion;
  HDCodableSyncIdentity *syncIdentity;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((rawContent = self->_rawContent, !((unint64_t)rawContent | v4[2]))
     || -[NSData isEqual:](rawContent, "isEqual:"))
    && ((messageVersion = self->_messageVersion, !((unint64_t)messageVersion | v4[1]))
     || -[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[3])
      v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
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
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSData hash](self->_rawContent, "hash");
  v4 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash") ^ v3;
  return v4 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableMessageVersion *messageVersion;
  uint64_t v6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[HDCodableClinicalGateway setRawContent:](self, "setRawContent:");
    v4 = v9;
  }
  messageVersion = self->_messageVersion;
  v6 = v4[1];
  if (messageVersion)
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableClinicalGateway setMessageVersion:](self, "setMessageVersion:");
  }
  v4 = v9;
LABEL_9:
  syncIdentity = self->_syncIdentity;
  v8 = v4[3];
  if (syncIdentity)
  {
    if (v8)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableClinicalGateway setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_14;
  }

}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
  objc_storeStrong((id *)&self->_rawContent, a3);
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
}

@end
