@implementation CKDPZoneSignedCryptoRequirements

- (int)version
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_version;
  else
    return 1;
}

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

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasSerializedRequirements
{
  return self->_serializedRequirements != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneSignedCryptoRequirements;
  -[CKDPZoneSignedCryptoRequirements description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSData *signature;
  NSData *serializedRequirements;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_version);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, CFSTR("version"));

  }
  signature = self->_signature;
  if (signature)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)signature, CFSTR("signature"));
  serializedRequirements = self->_serializedRequirements;
  if (serializedRequirements)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)serializedRequirements, CFSTR("serializedRequirements"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA82A8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_serializedRequirements)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSData *signature;
  NSData *serializedRequirements;
  _DWORD *v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  signature = self->_signature;
  v8 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    v4 = v8;
  }
  serializedRequirements = self->_serializedRequirements;
  if (serializedRequirements)
  {
    objc_msgSend_setSerializedRequirements_(v8, v5, (uint64_t)serializedRequirements);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_version;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_serializedRequirements, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *signature;
  uint64_t v9;
  NSData *serializedRequirements;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  signature = self->_signature;
  v9 = v4[2];
  if ((unint64_t)signature | v9 && !objc_msgSend_isEqual_(signature, v7, v9))
    goto LABEL_11;
  serializedRequirements = self->_serializedRequirements;
  v11 = v4[1];
  if ((unint64_t)serializedRequirements | v11)
    isEqual = objc_msgSend_isEqual_(serializedRequirements, v7, v11);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_version;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_signature, a2, v2) ^ v4;
  return v5 ^ objc_msgSend_hash(self->_serializedRequirements, v6, v7);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = *((_QWORD *)v4 + 2);
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    v4 = v8;
  }
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setSerializedRequirements_(self, v5, v7);
    v4 = v8;
  }

}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSData)serializedRequirements
{
  return self->_serializedRequirements;
}

- (void)setSerializedRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_serializedRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_serializedRequirements, 0);
}

@end
