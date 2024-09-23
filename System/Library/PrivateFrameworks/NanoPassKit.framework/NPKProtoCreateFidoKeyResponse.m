@implementation NPKProtoCreateFidoKeyResponse

- (BOOL)hasFidoKey
{
  return self->_fidoKey != 0;
}

- (BOOL)hasFidoAttestation
{
  return self->_fidoAttestation != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasKeyHash
{
  return self->_keyHash != 0;
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
  v8.super_class = (Class)NPKProtoCreateFidoKeyResponse;
  -[NPKProtoCreateFidoKeyResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCreateFidoKeyResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *fidoKey;
  NSData *fidoAttestation;
  NSData *errorData;
  NSData *keyHash;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fidoKey = self->_fidoKey;
  if (fidoKey)
    objc_msgSend(v3, "setObject:forKey:", fidoKey, CFSTR("fidoKey"));
  fidoAttestation = self->_fidoAttestation;
  if (fidoAttestation)
    objc_msgSend(v4, "setObject:forKey:", fidoAttestation, CFSTR("fidoAttestation"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  keyHash = self->_keyHash;
  if (keyHash)
    objc_msgSend(v4, "setObject:forKey:", keyHash, CFSTR("keyHash"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateFidoKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fidoKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_fidoAttestation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_keyHash)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fidoKey)
  {
    objc_msgSend(v4, "setFidoKey:");
    v4 = v5;
  }
  if (self->_fidoAttestation)
  {
    objc_msgSend(v5, "setFidoAttestation:");
    v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    v4 = v5;
  }
  if (self->_keyHash)
  {
    objc_msgSend(v5, "setKeyHash:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_fidoKey, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSData copyWithZone:](self->_fidoAttestation, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSData copyWithZone:](self->_keyHash, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *fidoKey;
  NSData *fidoAttestation;
  NSData *errorData;
  NSData *keyHash;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((fidoKey = self->_fidoKey, !((unint64_t)fidoKey | v4[3]))
     || -[NSData isEqual:](fidoKey, "isEqual:"))
    && ((fidoAttestation = self->_fidoAttestation, !((unint64_t)fidoAttestation | v4[2]))
     || -[NSData isEqual:](fidoAttestation, "isEqual:"))
    && ((errorData = self->_errorData, !((unint64_t)errorData | v4[1]))
     || -[NSData isEqual:](errorData, "isEqual:")))
  {
    keyHash = self->_keyHash;
    if ((unint64_t)keyHash | v4[4])
      v9 = -[NSData isEqual:](keyHash, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_fidoKey, "hash");
  v4 = -[NSData hash](self->_fidoAttestation, "hash") ^ v3;
  v5 = -[NSData hash](self->_errorData, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_keyHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NPKProtoCreateFidoKeyResponse setFidoKey:](self, "setFidoKey:");
  if (v4[2])
    -[NPKProtoCreateFidoKeyResponse setFidoAttestation:](self, "setFidoAttestation:");
  if (v4[1])
    -[NPKProtoCreateFidoKeyResponse setErrorData:](self, "setErrorData:");
  if (v4[4])
    -[NPKProtoCreateFidoKeyResponse setKeyHash:](self, "setKeyHash:");

}

- (NSData)fidoKey
{
  return self->_fidoKey;
}

- (void)setFidoKey:(id)a3
{
  objc_storeStrong((id *)&self->_fidoKey, a3);
}

- (NSData)fidoAttestation
{
  return self->_fidoAttestation;
}

- (void)setFidoAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_fidoAttestation, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
  objc_storeStrong((id *)&self->_keyHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_fidoKey, 0);
  objc_storeStrong((id *)&self->_fidoAttestation, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
