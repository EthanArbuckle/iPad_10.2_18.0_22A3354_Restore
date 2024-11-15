@implementation CKDPFieldCryptoFeatureSet

- (int)minimumSchemaVersion
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_minimumSchemaVersion;
  else
    return 1;
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMmcsVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mmcsVersion = a3;
}

- (void)setHasMmcsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMmcsVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEncryptedFieldContextType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_encryptedFieldContextType = a3;
}

- (void)setHasEncryptedFieldContextType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEncryptedFieldContextType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAssetKeyEncryptionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetKeyEncryptionType = a3;
}

- (void)setHasAssetKeyEncryptionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetKeyEncryptionType
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPFieldCryptoFeatureSet;
  -[CKDPFieldCryptoFeatureSet description](&v11, sel_description);
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
  char has;
  void *v7;
  const char *v8;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_minimumSchemaVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("minimumSchemaVersion"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_encryptedFieldContextType);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, CFSTR("encryptedFieldContextType"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_mmcsVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, CFSTR("mmcsVersion"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_assetKeyEncryptionType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("assetKeyEncryptionType"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB62908((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_minimumSchemaVersion;
    *((_BYTE *)v4 + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v4[3] = self->_encryptedFieldContextType;
      *((_BYTE *)v4 + 24) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_mmcsVersion;
  *((_BYTE *)v4 + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    v4[2] = self->_assetKeyEncryptionType;
    *((_BYTE *)v4 + 24) |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id result;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  result = (id)objc_msgSend_init(v7, v8, v9);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_minimumSchemaVersion;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_mmcsVersion;
  *((_BYTE *)result + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_encryptedFieldContextType;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = self->_assetKeyEncryptionType;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_mmcsVersion != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_encryptedFieldContextType != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  v7 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_assetKeyEncryptionType != *((_DWORD *)v4 + 2))
      goto LABEL_21;
    v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_minimumSchemaVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_mmcsVersion;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_encryptedFieldContextType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_assetKeyEncryptionType;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_minimumSchemaVersion = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_encryptedFieldContextType = *((_DWORD *)v4 + 3);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 24) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mmcsVersion = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    self->_assetKeyEncryptionType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:

}

- (int)mmcsVersion
{
  return self->_mmcsVersion;
}

- (int)encryptedFieldContextType
{
  return self->_encryptedFieldContextType;
}

- (int)assetKeyEncryptionType
{
  return self->_assetKeyEncryptionType;
}

@end
