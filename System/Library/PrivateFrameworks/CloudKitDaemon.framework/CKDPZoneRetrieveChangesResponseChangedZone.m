@implementation CKDPZoneRetrieveChangesResponseChangedZone

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasChangeType
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)changeType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_changeType;
  else
    return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfo, 0);
}

- (void)setChangeType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)changeTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("updated");
  if (a3 == 2)
  {
    v3 = CFSTR("deleted");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("updated")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("deleted")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (int)deleteType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_deleteType;
  else
    return 1;
}

- (void)setDeleteType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deleteType = a3;
}

- (void)setHasDeleteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleteType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)deleteTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7835D18[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeleteType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("normal")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("userPurged")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("userDidResetEncryptedData")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setIsAnonymous:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAnonymous = a3;
}

- (void)setHasIsAnonymous:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAnonymous
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAnonymousZoneInfo
{
  return self->_anonymousZoneInfo != 0;
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
  v11.super_class = (Class)CKDPZoneRetrieveChangesResponseChangedZone;
  -[CKDPZoneRetrieveChangesResponseChangedZone description](&v11, sel_description);
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
  uint64_t v5;
  void *v6;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v8;
  const char *v9;
  char has;
  int changeType;
  __CFString *v12;
  const char *v13;
  unsigned int v14;
  __CFString *v15;
  CKDPZoneCapabilities *capabilities;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  CKDPAnonymousZoneInfo *anonymousZoneInfo;
  void *v22;
  const char *v23;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("zoneIdentifier"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    changeType = self->_changeType;
    if (changeType == 1)
    {
      v12 = CFSTR("updated");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("updated"), CFSTR("changeType"));
    }
    else if (changeType == 2)
    {
      v12 = CFSTR("deleted");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("deleted"), CFSTR("changeType"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_changeType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("changeType"));
    }

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v14 = self->_deleteType - 1;
    if (v14 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_deleteType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E7835D18[v14];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v15, CFSTR("deleteType"));

  }
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_dictionaryRepresentation(capabilities, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("capabilities"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isAnonymous);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("isAnonymous"));

  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  if (anonymousZoneInfo)
  {
    objc_msgSend_dictionaryRepresentation(anonymousZoneInfo, v4, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, CFSTR("anonymousZoneInfo"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BE9C7090((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_anonymousZoneInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  char has;
  CKDPZoneCapabilities *capabilities;
  CKDPAnonymousZoneInfo *anonymousZoneInfo;
  id v10;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v10 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_deleteType;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v10, v5, (uint64_t)capabilities);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_isAnonymous;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  if (anonymousZoneInfo)
  {
    objc_msgSend_setAnonymousZoneInfo_(v10, v5, (uint64_t)anonymousZoneInfo);
    v4 = v10;
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
  void *v13;
  const char *v14;
  char has;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_changeType;
    *(_BYTE *)(v10 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 28) = self->_deleteType;
    *(_BYTE *)(v10 + 44) |= 2u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_capabilities, v14, (uint64_t)a3);
  v17 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v16;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_isAnonymous;
    *(_BYTE *)(v10 + 44) |= 4u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfo, v18, (uint64_t)a3);
  v20 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v9;
  char has;
  char v11;
  CKDPZoneCapabilities *capabilities;
  uint64_t v13;
  char isEqual;
  CKDPAnonymousZoneInfo *anonymousZoneInfo;
  uint64_t v17;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  zoneIdentifier = self->_zoneIdentifier;
  v9 = v4[4];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9))
      goto LABEL_21;
  }
  has = (char)self->_has;
  v11 = *((_BYTE *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_deleteType != *((_DWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  capabilities = self->_capabilities;
  v13 = v4[2];
  if ((unint64_t)capabilities | v13)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v13))
      goto LABEL_21;
    has = (char)self->_has;
    v11 = *((_BYTE *)v4 + 44);
  }
  if ((has & 4) == 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_27;
LABEL_21:
    isEqual = 0;
    goto LABEL_22;
  }
  if ((v11 & 4) == 0)
    goto LABEL_21;
  if (!self->_isAnonymous)
  {
    if (!*((_BYTE *)v4 + 40))
      goto LABEL_27;
    goto LABEL_21;
  }
  if (!*((_BYTE *)v4 + 40))
    goto LABEL_21;
LABEL_27:
  anonymousZoneInfo = self->_anonymousZoneInfo;
  v17 = v4[1];
  if ((unint64_t)anonymousZoneInfo | v17)
    isEqual = objc_msgSend_isEqual_(anonymousZoneInfo, v7, v17);
  else
    isEqual = 1;
LABEL_22:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_changeType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_deleteType;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v9 = objc_msgSend_hash(self->_capabilities, v4, v5);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_isAnonymous;
  else
    v12 = 0;
  return v7 ^ v6 ^ v8 ^ v9 ^ v12 ^ objc_msgSend_hash(self->_anonymousZoneInfo, v10, v11);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v6;
  char v7;
  CKDPZoneCapabilities *capabilities;
  uint64_t v9;
  CKDPAnonymousZoneInfo *anonymousZoneInfo;
  uint64_t v11;
  id v12;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v6 = *((_QWORD *)v4 + 4);
  v12 = v4;
  if (zoneIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v12;
LABEL_7:
  v7 = *((_BYTE *)v4 + 44);
  if ((v7 & 1) != 0)
  {
    self->_changeType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 44);
  }
  if ((v7 & 2) != 0)
  {
    self->_deleteType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
  }
  capabilities = self->_capabilities;
  v9 = *((_QWORD *)v4 + 2);
  if (capabilities)
  {
    if (!v9)
      goto LABEL_17;
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    objc_msgSend_setCapabilities_(self, (const char *)v4, v9);
  }
  v4 = v12;
LABEL_17:
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    self->_isAnonymous = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 4u;
  }
  anonymousZoneInfo = self->_anonymousZoneInfo;
  v11 = *((_QWORD *)v4 + 1);
  if (anonymousZoneInfo)
  {
    if (v11)
    {
      objc_msgSend_mergeFrom_(anonymousZoneInfo, (const char *)v4, v11);
LABEL_24:
      v4 = v12;
    }
  }
  else if (v11)
  {
    objc_msgSend_setAnonymousZoneInfo_(self, (const char *)v4, v11);
    goto LABEL_24;
  }

}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BOOL)isAnonymous
{
  return self->_isAnonymous;
}

- (CKDPAnonymousZoneInfo)anonymousZoneInfo
{
  return self->_anonymousZoneInfo;
}

- (void)setAnonymousZoneInfo:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousZoneInfo, a3);
}

@end
