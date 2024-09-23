@implementation NGMPBP256Key

- (BOOL)hasKeychainTag
{
  return self->_keychainTag != 0;
}

- (id)keystoreAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_24C4BF0F0[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeystore:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Software")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SecKey")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CTKTokenOID")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasKeyData
{
  return self->_keyData != 0;
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
  v8.super_class = (Class)NGMPBP256Key;
  -[NGMPBP256Key description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBP256Key dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *keychainTag;
  unsigned int v6;
  __CFString *v7;
  NSData *keyData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  keychainTag = self->_keychainTag;
  if (keychainTag)
    objc_msgSend(v3, "setObject:forKey:", keychainTag, CFSTR("keychainTag"));
  v6 = self->_keystore - 1;
  if (v6 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_keystore);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24C4BF0F0[v6];
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("keystore"));

  keyData = self->_keyData;
  if (keyData)
    objc_msgSend(v4, "setObject:forKey:", keyData, CFSTR("keyData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBP256KeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_keychainTag)
    PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_keyData)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v5 = v4;
  if (self->_keychainTag)
  {
    objc_msgSend(v4, "setKeychainTag:");
    v4 = v5;
  }
  v4[6] = self->_keystore;
  if (self->_keyData)
  {
    objc_msgSend(v5, "setKeyData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_keychainTag, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 24) = self->_keystore;
  v8 = -[NSData copyWithZone:](self->_keyData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *keychainTag;
  NSData *keyData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((keychainTag = self->_keychainTag, !((unint64_t)keychainTag | v4[2]))
     || -[NSString isEqual:](keychainTag, "isEqual:"))
    && self->_keystore == *((_DWORD *)v4 + 6))
  {
    keyData = self->_keyData;
    if ((unint64_t)keyData | v4[1])
      v7 = -[NSData isEqual:](keyData, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_keychainTag, "hash");
  v4 = 2654435761 * self->_keystore;
  return v4 ^ v3 ^ -[NSData hash](self->_keyData, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NGMPBP256Key setKeychainTag:](self, "setKeychainTag:");
    v4 = v5;
  }
  self->_keystore = v4[6];
  if (*((_QWORD *)v4 + 1))
  {
    -[NGMPBP256Key setKeyData:](self, "setKeyData:");
    v4 = v5;
  }

}

- (NSString)keychainTag
{
  return self->_keychainTag;
}

- (void)setKeychainTag:(id)a3
{
  objc_storeStrong((id *)&self->_keychainTag, a3);
}

- (int)keystore
{
  return self->_keystore;
}

- (void)setKeystore:(int)a3
{
  self->_keystore = a3;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainTag, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end
