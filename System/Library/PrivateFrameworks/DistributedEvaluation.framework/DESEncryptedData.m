@implementation DESEncryptedData

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEncryptedKey
{
  return self->_encryptedKey != 0;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
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
  v8.super_class = (Class)DESEncryptedData;
  -[DESEncryptedData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESEncryptedData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *data;
  NSData *encryptedKey;
  NSString *algorithm;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  data = self->_data;
  if (data)
    objc_msgSend(v3, "setObject:forKey:", data, CFSTR("data"));
  encryptedKey = self->_encryptedKey;
  if (encryptedKey)
    objc_msgSend(v3, "setObject:forKey:", encryptedKey, CFSTR("encryptedKey"));
  algorithm = self->_algorithm;
  if (algorithm)
    objc_msgSend(v3, "setObject:forKey:", algorithm, CFSTR("algorithm"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESEncryptedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (!self->_data)
    -[DESEncryptedData writeTo:].cold.1();
  PBDataWriterWriteDataField();
  if (self->_encryptedKey)
    PBDataWriterWriteDataField();
  if (self->_algorithm)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  id v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_version;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  objc_msgSend(v4, "setData:", self->_data);
  if (self->_encryptedKey)
    objc_msgSend(v5, "setEncryptedKey:");
  if (self->_algorithm)
    objc_msgSend(v5, "setAlgorithm:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSData copyWithZone:](self->_encryptedKey, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_algorithm, "copyWithZone:", a3);
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *data;
  NSData *encryptedKey;
  NSString *algorithm;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  data = self->_data;
  if ((unint64_t)data | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](data, "isEqual:"))
    goto LABEL_13;
  encryptedKey = self->_encryptedKey;
  if ((unint64_t)encryptedKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptedKey, "isEqual:"))
      goto LABEL_13;
  }
  algorithm = self->_algorithm;
  if ((unint64_t)algorithm | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](algorithm, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_data, "hash") ^ v3;
  v5 = -[NSData hash](self->_encryptedKey, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_algorithm, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_version = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[DESEncryptedData setData:](self, "setData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[DESEncryptedData setEncryptedKey:](self, "setEncryptedKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[DESEncryptedData setAlgorithm:](self, "setAlgorithm:");
    v4 = v5;
  }

}

- (int)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedKey, a3);
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_algorithm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[DESEncryptedData writeTo:]", "DESEncryptedData.m", 133, "nil != self->_data");
}

@end
