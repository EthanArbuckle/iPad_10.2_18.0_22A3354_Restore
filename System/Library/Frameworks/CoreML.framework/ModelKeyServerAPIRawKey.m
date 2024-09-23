@implementation ModelKeyServerAPIRawKey

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (BOOL)hasEncryptionIv
{
  return self->_encryptionIv != 0;
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
  v8.super_class = (Class)ModelKeyServerAPIRawKey;
  -[ModelKeyServerAPIRawKey description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ModelKeyServerAPIRawKey dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *encryptionIv;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey)
    objc_msgSend(v3, "setObject:forKey:", encryptionKey, CFSTR("encryption_key"));
  encryptionIv = self->_encryptionIv;
  if (encryptionIv)
    objc_msgSend(v4, "setObject:forKey:", encryptionIv, CFSTR("encryption_iv"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIRawKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptionIv)
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
  if (self->_encryptionKey)
  {
    objc_msgSend(v4, "setEncryptionKey:");
    v4 = v5;
  }
  if (self->_encryptionIv)
  {
    objc_msgSend(v5, "setEncryptionIv:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_encryptionKey, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_encryptionIv, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *encryptionKey;
  NSData *encryptionIv;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[2]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    encryptionIv = self->_encryptionIv;
    if ((unint64_t)encryptionIv | v4[1])
      v7 = -[NSData isEqual:](encryptionIv, "isEqual:");
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
  return -[NSData hash](self->_encryptionIv, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[ModelKeyServerAPIRawKey setEncryptionKey:](self, "setEncryptionKey:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[ModelKeyServerAPIRawKey setEncryptionIv:](self, "setEncryptionIv:");
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

- (NSData)encryptionIv
{
  return self->_encryptionIv;
}

- (void)setEncryptionIv:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionIv, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_encryptionIv, 0);
}

@end
