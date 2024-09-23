@implementation CKDPZoneRetrieveResponseZoneSummary

- (BOOL)hasTargetZone
{
  return self->_targetZone != 0;
}

- (BOOL)hasCurrentServerContinuationToken
{
  return self->_currentServerContinuationToken != 0;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
}

- (void)setDeviceCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deviceCount = a3;
}

- (void)setHasDeviceCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAssetQuotaUsage:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetQuotaUsage = a3;
}

- (void)setHasAssetQuotaUsage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetQuotaUsage
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMetadataQuotaUsage:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_metadataQuotaUsage = a3;
}

- (void)setHasMetadataQuotaUsage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMetadataQuotaUsage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setZoneishPcsNeedsRolled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_zoneishPcsNeedsRolled = a3;
}

- (void)setHasZoneishPcsNeedsRolled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasZoneishPcsNeedsRolled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setZoneKeyRollAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_zoneKeyRollAllowed = a3;
}

- (void)setHasZoneKeyRollAllowed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasZoneKeyRollAllowed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasZonePcsModificationTime
{
  return self->_zonePcsModificationTime != 0;
}

- (BOOL)hasZonePcsModificationDevice
{
  return self->_zonePcsModificationDevice != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpired
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
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
  v11.super_class = (Class)CKDPZoneRetrieveResponseZoneSummary;
  -[CKDPZoneRetrieveResponseZoneSummary description](&v11, sel_description);
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
  CKDPZone *targetZone;
  void *v8;
  const char *v9;
  NSData *currentServerContinuationToken;
  NSData *clientChangeToken;
  char has;
  void *v13;
  const char *v14;
  CKDPZoneCapabilities *capabilities;
  void *v16;
  const char *v17;
  char v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  CKDPDate *zonePcsModificationTime;
  void *v24;
  const char *v25;
  NSString *zonePcsModificationDevice;
  void *v27;
  const char *v28;
  CKDPDate *expirationTime;
  void *v30;
  const char *v31;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  targetZone = self->_targetZone;
  if (targetZone)
  {
    objc_msgSend_dictionaryRepresentation(targetZone, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("targetZone"));

  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  if (currentServerContinuationToken)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)currentServerContinuationToken, CFSTR("currentServerContinuationToken"));
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)clientChangeToken, CFSTR("clientChangeToken"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_deviceCount);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, CFSTR("deviceCount"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_assetQuotaUsage);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, CFSTR("assetQuotaUsage"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_metadataQuotaUsage);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("metadataQuotaUsage"));

  }
LABEL_11:
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_dictionaryRepresentation(capabilities, v4, (uint64_t)clientChangeToken);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("capabilities"));

  }
  v18 = (char)self->_has;
  if ((v18 & 0x20) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_zoneishPcsNeedsRolled);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("zoneishPcsNeedsRolled"));

    v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_zoneKeyRollAllowed);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v22, (uint64_t)v21, CFSTR("zoneKeyRollAllowed"));

  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  if (zonePcsModificationTime)
  {
    objc_msgSend_dictionaryRepresentation(zonePcsModificationTime, v4, (uint64_t)clientChangeToken);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("zonePcsModificationTime"));

  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  if (zonePcsModificationDevice)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)zonePcsModificationDevice, CFSTR("zonePcsModificationDevice"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_expired);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v27, CFSTR("expired"));

  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_dictionaryRepresentation(expirationTime, v4, (uint64_t)zonePcsModificationDevice);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, CFSTR("expirationTime"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAC1F8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_targetZone)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_currentServerContinuationToken)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_clientChangeToken)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_11:
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_zonePcsModificationTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_zonePcsModificationDevice)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPZone *targetZone;
  NSData *currentServerContinuationToken;
  NSData *clientChangeToken;
  char has;
  CKDPZoneCapabilities *capabilities;
  char v11;
  CKDPDate *zonePcsModificationTime;
  NSString *zonePcsModificationDevice;
  CKDPDate *expirationTime;
  id v15;

  v4 = a3;
  targetZone = self->_targetZone;
  v15 = v4;
  if (targetZone)
  {
    objc_msgSend_setTargetZone_(v4, v5, (uint64_t)targetZone);
    v4 = v15;
  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  if (currentServerContinuationToken)
  {
    objc_msgSend_setCurrentServerContinuationToken_(v15, v5, (uint64_t)currentServerContinuationToken);
    v4 = v15;
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
  {
    objc_msgSend_setClientChangeToken_(v15, v5, (uint64_t)clientChangeToken);
    v4 = v15;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_deviceCount;
    *((_BYTE *)v4 + 92) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 1) = self->_assetQuotaUsage;
  *((_BYTE *)v4 + 92) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 2) = self->_metadataQuotaUsage;
    *((_BYTE *)v4 + 92) |= 2u;
  }
LABEL_11:
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v15, v5, (uint64_t)capabilities);
    v4 = v15;
  }
  v11 = (char)self->_has;
  if ((v11 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 90) = self->_zoneishPcsNeedsRolled;
    *((_BYTE *)v4 + 92) |= 0x20u;
    v11 = (char)self->_has;
  }
  if ((v11 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 89) = self->_zoneKeyRollAllowed;
    *((_BYTE *)v4 + 92) |= 0x10u;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  if (zonePcsModificationTime)
  {
    objc_msgSend_setZonePcsModificationTime_(v15, v5, (uint64_t)zonePcsModificationTime);
    v4 = v15;
  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  if (zonePcsModificationDevice)
  {
    objc_msgSend_setZonePcsModificationDevice_(v15, v5, (uint64_t)zonePcsModificationDevice);
    v4 = v15;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_expired;
    *((_BYTE *)v4 + 92) |= 8u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v15, v5, (uint64_t)expirationTime);
    v4 = v15;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char has;
  uint64_t v22;
  void *v23;
  const char *v24;
  char v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_targetZone, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_currentServerContinuationToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v18;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_deviceCount;
    *(_BYTE *)(v10 + 92) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v10 + 8) = self->_assetQuotaUsage;
  *(_BYTE *)(v10 + 92) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_QWORD *)(v10 + 16) = self->_metadataQuotaUsage;
    *(_BYTE *)(v10 + 92) |= 2u;
  }
LABEL_5:
  v22 = objc_msgSend_copyWithZone_(self->_capabilities, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v22;

  v25 = (char)self->_has;
  if ((v25 & 0x20) != 0)
  {
    *(_BYTE *)(v10 + 90) = self->_zoneishPcsNeedsRolled;
    *(_BYTE *)(v10 + 92) |= 0x20u;
    v25 = (char)self->_has;
  }
  if ((v25 & 0x10) != 0)
  {
    *(_BYTE *)(v10 + 89) = self->_zoneKeyRollAllowed;
    *(_BYTE *)(v10 + 92) |= 0x10u;
  }
  v26 = objc_msgSend_copyWithZone_(self->_zonePcsModificationTime, v24, (uint64_t)a3);
  v27 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v26;

  v29 = objc_msgSend_copyWithZone_(self->_zonePcsModificationDevice, v28, (uint64_t)a3);
  v30 = *(void **)(v10 + 72);
  *(_QWORD *)(v10 + 72) = v29;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v10 + 88) = self->_expired;
    *(_BYTE *)(v10 + 92) |= 8u;
  }
  v32 = objc_msgSend_copyWithZone_(self->_expirationTime, v31, (uint64_t)a3);
  v33 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v32;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPZone *targetZone;
  uint64_t v9;
  NSData *currentServerContinuationToken;
  uint64_t v11;
  NSData *clientChangeToken;
  uint64_t v13;
  char has;
  char v15;
  CKDPZoneCapabilities *capabilities;
  uint64_t v17;
  CKDPDate *zonePcsModificationTime;
  uint64_t v19;
  NSString *zonePcsModificationDevice;
  uint64_t v21;
  char isEqual;
  CKDPDate *expirationTime;
  uint64_t v25;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_50;
  targetZone = self->_targetZone;
  v9 = v4[8];
  if ((unint64_t)targetZone | v9)
  {
    if (!objc_msgSend_isEqual_(targetZone, v7, v9))
      goto LABEL_50;
  }
  currentServerContinuationToken = self->_currentServerContinuationToken;
  v11 = v4[5];
  if ((unint64_t)currentServerContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(currentServerContinuationToken, v7, v11))
      goto LABEL_50;
  }
  clientChangeToken = self->_clientChangeToken;
  v13 = v4[4];
  if ((unint64_t)clientChangeToken | v13)
  {
    if (!objc_msgSend_isEqual_(clientChangeToken, v7, v13))
      goto LABEL_50;
  }
  has = (char)self->_has;
  v15 = *((_BYTE *)v4 + 92);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_deviceCount != *((_DWORD *)v4 + 12))
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_assetQuotaUsage != v4[1])
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_metadataQuotaUsage != v4[2])
      goto LABEL_50;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_50;
  }
  capabilities = self->_capabilities;
  v17 = v4[3];
  if ((unint64_t)capabilities | v17)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v17))
      goto LABEL_50;
    has = (char)self->_has;
    v15 = *((_BYTE *)v4 + 92);
  }
  if ((has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0)
      goto LABEL_50;
    if (self->_zoneishPcsNeedsRolled)
    {
      if (!*((_BYTE *)v4 + 90))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0)
      goto LABEL_50;
    if (self->_zoneKeyRollAllowed)
    {
      if (!*((_BYTE *)v4 + 89))
        goto LABEL_50;
    }
    else if (*((_BYTE *)v4 + 89))
    {
      goto LABEL_50;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_50;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  v19 = v4[10];
  if ((unint64_t)zonePcsModificationTime | v19
    && !objc_msgSend_isEqual_(zonePcsModificationTime, v7, v19))
  {
    goto LABEL_50;
  }
  zonePcsModificationDevice = self->_zonePcsModificationDevice;
  v21 = v4[9];
  if ((unint64_t)zonePcsModificationDevice | v21)
  {
    if (!objc_msgSend_isEqual_(zonePcsModificationDevice, v7, v21))
      goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0)
      goto LABEL_56;
LABEL_50:
    isEqual = 0;
    goto LABEL_51;
  }
  if ((*((_BYTE *)v4 + 92) & 8) == 0)
    goto LABEL_50;
  if (!self->_expired)
  {
    if (!*((_BYTE *)v4 + 88))
      goto LABEL_56;
    goto LABEL_50;
  }
  if (!*((_BYTE *)v4 + 88))
    goto LABEL_50;
LABEL_56:
  expirationTime = self->_expirationTime;
  v25 = v4[7];
  if ((unint64_t)expirationTime | v25)
    isEqual = objc_msgSend_isEqual_(expirationTime, v7, v25);
  else
    isEqual = 1;
LABEL_51:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = objc_msgSend_hash(self->_targetZone, a2, v2);
  v28 = objc_msgSend_hash(self->_currentServerContinuationToken, v4, v5);
  v27 = objc_msgSend_hash(self->_clientChangeToken, v6, v7);
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v25 = 2654435761 * self->_deviceCount;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v10 = 2654435761 * self->_assetQuotaUsage;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v11 = 2654435761 * self->_metadataQuotaUsage;
    goto LABEL_8;
  }
LABEL_7:
  v11 = 0;
LABEL_8:
  v14 = objc_msgSend_hash(self->_capabilities, v8, v9, v25);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v15 = 2654435761 * self->_zoneishPcsNeedsRolled;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_10:
      v16 = 2654435761 * self->_zoneKeyRollAllowed;
      goto LABEL_13;
    }
  }
  v16 = 0;
LABEL_13:
  v17 = objc_msgSend_hash(self->_zonePcsModificationTime, v12, v13);
  v20 = objc_msgSend_hash(self->_zonePcsModificationDevice, v18, v19);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v23 = 2654435761 * self->_expired;
  else
    v23 = 0;
  return v28 ^ v29 ^ v27 ^ v26 ^ v10 ^ v11 ^ v14 ^ v15 ^ v16 ^ v17 ^ v20 ^ v23 ^ objc_msgSend_hash(self->_expirationTime, v21, v22);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPZone *targetZone;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CKDPZoneCapabilities *capabilities;
  uint64_t v11;
  char v12;
  CKDPDate *zonePcsModificationTime;
  uint64_t v14;
  uint64_t v15;
  CKDPDate *expirationTime;
  uint64_t v17;
  id v18;

  v4 = a3;
  targetZone = self->_targetZone;
  v6 = *((_QWORD *)v4 + 8);
  v18 = v4;
  if (targetZone)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(targetZone, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setTargetZone_(self, (const char *)v4, v6);
  }
  v4 = v18;
LABEL_7:
  v7 = *((_QWORD *)v4 + 5);
  if (v7)
  {
    objc_msgSend_setCurrentServerContinuationToken_(self, (const char *)v4, v7);
    v4 = v18;
  }
  v8 = *((_QWORD *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setClientChangeToken_(self, (const char *)v4, v8);
    v4 = v18;
  }
  v9 = *((_BYTE *)v4 + 92);
  if ((v9 & 4) != 0)
  {
    self->_deviceCount = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v9 = *((_BYTE *)v4 + 92);
    if ((v9 & 1) == 0)
    {
LABEL_13:
      if ((v9 & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_assetQuotaUsage = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
LABEL_14:
    self->_metadataQuotaUsage = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_15:
  capabilities = self->_capabilities;
  v11 = *((_QWORD *)v4 + 3);
  if (capabilities)
  {
    if (!v11)
      goto LABEL_24;
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_24;
    objc_msgSend_setCapabilities_(self, (const char *)v4, v11);
  }
  v4 = v18;
LABEL_24:
  v12 = *((_BYTE *)v4 + 92);
  if ((v12 & 0x20) != 0)
  {
    self->_zoneishPcsNeedsRolled = *((_BYTE *)v4 + 90);
    *(_BYTE *)&self->_has |= 0x20u;
    v12 = *((_BYTE *)v4 + 92);
  }
  if ((v12 & 0x10) != 0)
  {
    self->_zoneKeyRollAllowed = *((_BYTE *)v4 + 89);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  zonePcsModificationTime = self->_zonePcsModificationTime;
  v14 = *((_QWORD *)v4 + 10);
  if (zonePcsModificationTime)
  {
    if (!v14)
      goto LABEL_34;
    objc_msgSend_mergeFrom_(zonePcsModificationTime, (const char *)v4, v14);
  }
  else
  {
    if (!v14)
      goto LABEL_34;
    objc_msgSend_setZonePcsModificationTime_(self, (const char *)v4, v14);
  }
  v4 = v18;
LABEL_34:
  v15 = *((_QWORD *)v4 + 9);
  if (v15)
  {
    objc_msgSend_setZonePcsModificationDevice_(self, (const char *)v4, v15);
    v4 = v18;
  }
  if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    self->_expired = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 8u;
  }
  expirationTime = self->_expirationTime;
  v17 = *((_QWORD *)v4 + 7);
  if (expirationTime)
  {
    if (v17)
    {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v17);
LABEL_43:
      v4 = v18;
    }
  }
  else if (v17)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v17);
    goto LABEL_43;
  }

}

- (CKDPZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
  objc_storeStrong((id *)&self->_targetZone, a3);
}

- (NSData)currentServerContinuationToken
{
  return self->_currentServerContinuationToken;
}

- (void)setCurrentServerContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentServerContinuationToken, a3);
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (void)setClientChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_clientChangeToken, a3);
}

- (int)deviceCount
{
  return self->_deviceCount;
}

- (int64_t)assetQuotaUsage
{
  return self->_assetQuotaUsage;
}

- (int64_t)metadataQuotaUsage
{
  return self->_metadataQuotaUsage;
}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BOOL)zoneishPcsNeedsRolled
{
  return self->_zoneishPcsNeedsRolled;
}

- (BOOL)zoneKeyRollAllowed
{
  return self->_zoneKeyRollAllowed;
}

- (CKDPDate)zonePcsModificationTime
{
  return self->_zonePcsModificationTime;
}

- (void)setZonePcsModificationTime:(id)a3
{
  objc_storeStrong((id *)&self->_zonePcsModificationTime, a3);
}

- (NSString)zonePcsModificationDevice
{
  return self->_zonePcsModificationDevice;
}

- (void)setZonePcsModificationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_zonePcsModificationDevice, a3);
}

- (BOOL)expired
{
  return self->_expired;
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonePcsModificationTime, 0);
  objc_storeStrong((id *)&self->_zonePcsModificationDevice, 0);
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_currentServerContinuationToken, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
