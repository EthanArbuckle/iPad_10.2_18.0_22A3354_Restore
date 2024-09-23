@implementation CKDPSignedZoneUsage

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

- (BOOL)hasZoneUsage
{
  return self->_zoneUsage != 0;
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
  v11.super_class = (Class)CKDPSignedZoneUsage;
  -[CKDPSignedZoneUsage description](&v11, sel_description);
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
  NSData *zoneUsage;

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
  zoneUsage = self->_zoneUsage;
  if (zoneUsage)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)zoneUsage, CFSTR("zoneUsage"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC07930((uint64_t)self, (uint64_t)a3);
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
  if (self->_zoneUsage)
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
  NSData *zoneUsage;
  _DWORD *v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  signature = self->_signature;
  v8 = v4;
  if (signature)
  {
    objc_msgSend_setSignature_(v4, v5, (uint64_t)signature);
    v4 = v8;
  }
  zoneUsage = self->_zoneUsage;
  if (zoneUsage)
  {
    objc_msgSend_setZoneUsage_(v8, v5, (uint64_t)zoneUsage);
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
    *(_DWORD *)(v10 + 16) = self->_version;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_signature, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_zoneUsage, v15, (uint64_t)a3);
  v17 = (void *)v12[3];
  v12[3] = v16;

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
  NSData *zoneUsage;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  signature = self->_signature;
  v9 = v4[1];
  if ((unint64_t)signature | v9 && !objc_msgSend_isEqual_(signature, v7, v9))
    goto LABEL_11;
  zoneUsage = self->_zoneUsage;
  v11 = v4[3];
  if ((unint64_t)zoneUsage | v11)
    isEqual = objc_msgSend_isEqual_(zoneUsage, v7, v11);
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
  return v5 ^ objc_msgSend_hash(self->_zoneUsage, v6, v7);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = *((_QWORD *)v4 + 1);
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setSignature_(self, v5, v6);
    v4 = v8;
  }
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setZoneUsage_(self, v5, v7);
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

- (NSData)zoneUsage
{
  return self->_zoneUsage;
}

- (void)setZoneUsage:(id)a3
{
  objc_storeStrong((id *)&self->_zoneUsage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUsage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
