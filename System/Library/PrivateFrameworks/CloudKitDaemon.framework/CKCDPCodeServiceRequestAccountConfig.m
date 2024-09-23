@implementation CKCDPCodeServiceRequestAccountConfig

- (void)setCorporateSharingEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_corporateSharingEnabled = a3;
}

- (void)setHasCorporateSharingEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCorporateSharingEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLastWebActivityUTCMills:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastWebActivityUTCMills = a3;
}

- (void)setHasLastWebActivityUTCMills:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastWebActivityUTCMills
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setPhotosWebAccessTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_photosWebAccessTimestamp = a3;
}

- (void)setHasPhotosWebAccessTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhotosWebAccessTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAccountFlags:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accountFlags = a3;
}

- (void)setHasAccountFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountFlags
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
  v11.super_class = (Class)CKCDPCodeServiceRequestAccountConfig;
  -[CKCDPCodeServiceRequestAccountConfig description](&v11, sel_description);
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
  void *v9;
  const char *v10;
  NSString *countryCode;
  char v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_corporateSharingEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("corporateSharingEnabled"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_lastWebActivityUTCMills);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, CFSTR("lastWebActivityUTCMills"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)countryCode, CFSTR("countryCode"));
  v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_photosWebAccessTimestamp);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, CFSTR("photosWebAccessTimestamp"));

    v12 = (char)self->_has;
  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v4, self->_accountFlags);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, CFSTR("accountFlags"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAB4228((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  char has;
  NSString *countryCode;
  char v8;
  _BYTE *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[40] = self->_corporateSharingEnabled;
    v4[44] |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_lastWebActivityUTCMills;
    v4[44] |= 2u;
  }
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v9 = v4;
    objc_msgSend_setCountryCode_(v4, v5, (uint64_t)countryCode);
    v4 = v9;
  }
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_photosWebAccessTimestamp;
    v4[44] |= 4u;
    v8 = (char)self->_has;
  }
  if ((v8 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_accountFlags;
    v4[44] |= 1u;
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
  uint64_t v12;
  char has;
  uint64_t v14;
  void *v15;
  char v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_corporateSharingEnabled;
    *(_BYTE *)(v10 + 44) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v10 + 16) = self->_lastWebActivityUTCMills;
    *(_BYTE *)(v10 + 44) |= 2u;
  }
  v14 = objc_msgSend_copyWithZone_(self->_countryCode, v11, (uint64_t)a3);
  v15 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v14;

  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    *(_QWORD *)(v12 + 24) = self->_photosWebAccessTimestamp;
    *(_BYTE *)(v12 + 44) |= 4u;
    v16 = (char)self->_has;
  }
  if ((v16 & 1) != 0)
  {
    *(_QWORD *)(v12 + 8) = self->_accountFlags;
    *(_BYTE *)(v12 + 44) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char has;
  char v9;
  NSString *countryCode;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_27;
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 44);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_27;
    if (self->_corporateSharingEnabled)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_lastWebActivityUTCMills != v4[2])
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  countryCode = self->_countryCode;
  v11 = v4[4];
  if ((unint64_t)countryCode | v11)
  {
    if (objc_msgSend_isEqual_(countryCode, v7, v11))
    {
      has = (char)self->_has;
      v9 = *((_BYTE *)v4 + 44);
      goto LABEL_18;
    }
LABEL_27:
    v12 = 0;
    goto LABEL_28;
  }
LABEL_18:
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_photosWebAccessTimestamp != v4[3])
      goto LABEL_27;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_27;
  }
  v12 = (v9 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_accountFlags != v4[1])
      goto LABEL_27;
    v12 = 1;
  }
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_corporateSharingEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_lastWebActivityUTCMills;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = objc_msgSend_hash(self->_countryCode, a2, v2);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v7 = 2654435761 * self->_photosWebAccessTimestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v5 ^ v4 ^ v7 ^ v8 ^ v6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761u * self->_accountFlags;
  return v5 ^ v4 ^ v7 ^ v8 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 8) != 0)
  {
    self->_corporateSharingEnabled = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((v6 & 2) != 0)
  {
    self->_lastWebActivityUTCMills = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = *((_QWORD *)v4 + 4);
  if (v7)
  {
    v9 = v4;
    objc_msgSend_setCountryCode_(self, v5, v7);
    v4 = v9;
  }
  v8 = *((_BYTE *)v4 + 44);
  if ((v8 & 4) != 0)
  {
    self->_photosWebAccessTimestamp = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)v4 + 44);
  }
  if ((v8 & 1) != 0)
  {
    self->_accountFlags = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)corporateSharingEnabled
{
  return self->_corporateSharingEnabled;
}

- (int64_t)lastWebActivityUTCMills
{
  return self->_lastWebActivityUTCMills;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int64_t)photosWebAccessTimestamp
{
  return self->_photosWebAccessTimestamp;
}

- (unint64_t)accountFlags
{
  return self->_accountFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
