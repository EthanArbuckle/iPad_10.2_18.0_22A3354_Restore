@implementation NGMPBLegacyKey

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NGMPBLegacyKey;
  -[NGMPBLegacyKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBLegacyKey dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptionKey;
  NSData *signingKey;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey)
    objc_msgSend(v3, "setObject:forKey:", encryptionKey, CFSTR("encryptionKey"));
  signingKey = self->_signingKey;
  if (signingKey)
    objc_msgSend(v4, "setObject:forKey:", signingKey, CFSTR("signingKey"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBLegacyKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_encryptionKey)
    -[NGMPBLegacyKey writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteDataField();
  if (!self->_signingKey)
    -[NGMPBLegacyKey writeTo:].cold.2();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *encryptionKey;
  id v5;

  encryptionKey = self->_encryptionKey;
  v5 = a3;
  objc_msgSend(v5, "setEncryptionKey:", encryptionKey);
  objc_msgSend(v5, "setSigningKey:", self->_signingKey);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encryptionKey, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_signingKey, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *encryptionKey;
  NSData *signingKey;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[1]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    signingKey = self->_signingKey;
    if ((unint64_t)signingKey | v4[2])
      v7 = -[NSData isEqual:](signingKey, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_encryptionKey, "hash");
  return -[NSData hash](self->_signingKey, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NGMPBLegacyKey setEncryptionKey:](self, "setEncryptionKey:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NGMPBLegacyKey setSigningKey:](self, "setSigningKey:");
    v4 = v5;
  }

}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBLegacyKey writeTo:]", "NGMPBLegacyKey.m", 83, "nil != self->_encryptionKey");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NGMPBLegacyKey writeTo:]", "NGMPBLegacyKey.m", 88, "nil != self->_signingKey");
}

@end
