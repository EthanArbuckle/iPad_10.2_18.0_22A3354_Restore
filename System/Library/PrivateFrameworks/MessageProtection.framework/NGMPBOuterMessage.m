@implementation NGMPBOuterMessage

- (BOOL)hasEncryptedPayload
{
  return self->_encryptedPayload != 0;
}

- (BOOL)hasEphemeralPubKey
{
  return self->_ephemeralPubKey != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasTetraMessage
{
  return self->_tetraMessage != 0;
}

- (BOOL)hasKeyValidator
{
  return self->_keyValidator != 0;
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
  v8.super_class = (Class)NGMPBOuterMessage;
  -[NGMPBOuterMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBOuterMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptedPayload;
  NSData *ephemeralPubKey;
  NSData *signature;
  NSData *tetraMessage;
  NSData *keyValidator;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encryptedPayload = self->_encryptedPayload;
  if (encryptedPayload)
    objc_msgSend(v3, "setObject:forKey:", encryptedPayload, CFSTR("encryptedPayload"));
  ephemeralPubKey = self->_ephemeralPubKey;
  if (ephemeralPubKey)
    objc_msgSend(v4, "setObject:forKey:", ephemeralPubKey, CFSTR("ephemeralPubKey"));
  signature = self->_signature;
  if (signature)
    objc_msgSend(v4, "setObject:forKey:", signature, CFSTR("signature"));
  tetraMessage = self->_tetraMessage;
  if (tetraMessage)
    objc_msgSend(v4, "setObject:forKey:", tetraMessage, CFSTR("tetraMessage"));
  keyValidator = self->_keyValidator;
  if (keyValidator)
    objc_msgSend(v4, "setObject:forKey:", keyValidator, CFSTR("keyValidator"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBOuterMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptedPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_ephemeralPubKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_tetraMessage)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_keyValidator)
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
  if (self->_encryptedPayload)
  {
    objc_msgSend(v4, "setEncryptedPayload:");
    v4 = v5;
  }
  if (self->_ephemeralPubKey)
  {
    objc_msgSend(v5, "setEphemeralPubKey:");
    v4 = v5;
  }
  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    v4 = v5;
  }
  if (self->_tetraMessage)
  {
    objc_msgSend(v5, "setTetraMessage:");
    v4 = v5;
  }
  if (self->_keyValidator)
  {
    objc_msgSend(v5, "setKeyValidator:");
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
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encryptedPayload, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_ephemeralPubKey, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSData copyWithZone:](self->_tetraMessage, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSData copyWithZone:](self->_keyValidator, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *encryptedPayload;
  NSData *ephemeralPubKey;
  NSData *signature;
  NSData *tetraMessage;
  NSData *keyValidator;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((encryptedPayload = self->_encryptedPayload, !((unint64_t)encryptedPayload | v4[1]))
     || -[NSData isEqual:](encryptedPayload, "isEqual:"))
    && ((ephemeralPubKey = self->_ephemeralPubKey, !((unint64_t)ephemeralPubKey | v4[2]))
     || -[NSData isEqual:](ephemeralPubKey, "isEqual:"))
    && ((signature = self->_signature, !((unint64_t)signature | v4[4]))
     || -[NSData isEqual:](signature, "isEqual:"))
    && ((tetraMessage = self->_tetraMessage, !((unint64_t)tetraMessage | v4[5]))
     || -[NSData isEqual:](tetraMessage, "isEqual:")))
  {
    keyValidator = self->_keyValidator;
    if ((unint64_t)keyValidator | v4[3])
      v10 = -[NSData isEqual:](keyValidator, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_encryptedPayload, "hash");
  v4 = -[NSData hash](self->_ephemeralPubKey, "hash") ^ v3;
  v5 = -[NSData hash](self->_signature, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_tetraMessage, "hash");
  return v6 ^ -[NSData hash](self->_keyValidator, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NGMPBOuterMessage setEncryptedPayload:](self, "setEncryptedPayload:");
  if (v4[2])
    -[NGMPBOuterMessage setEphemeralPubKey:](self, "setEphemeralPubKey:");
  if (v4[4])
    -[NGMPBOuterMessage setSignature:](self, "setSignature:");
  if (v4[5])
    -[NGMPBOuterMessage setTetraMessage:](self, "setTetraMessage:");
  if (v4[3])
    -[NGMPBOuterMessage setKeyValidator:](self, "setKeyValidator:");

}

- (NSData)encryptedPayload
{
  return self->_encryptedPayload;
}

- (void)setEncryptedPayload:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPayload, a3);
}

- (NSData)ephemeralPubKey
{
  return self->_ephemeralPubKey;
}

- (void)setEphemeralPubKey:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralPubKey, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSData)tetraMessage
{
  return self->_tetraMessage;
}

- (void)setTetraMessage:(id)a3
{
  objc_storeStrong((id *)&self->_tetraMessage, a3);
}

- (NSData)keyValidator
{
  return self->_keyValidator;
}

- (void)setKeyValidator:(id)a3
{
  objc_storeStrong((id *)&self->_keyValidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraMessage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_keyValidator, 0);
  objc_storeStrong((id *)&self->_ephemeralPubKey, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
}

@end
