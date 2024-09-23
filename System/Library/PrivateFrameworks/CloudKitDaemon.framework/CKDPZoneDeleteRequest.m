@implementation CKDPZoneDeleteRequest

+ (id)options
{
  if (qword_1ED700900 != -1)
    dispatch_once(&qword_1ED700900, &unk_1E7832290);
  return (id)qword_1ED7008F8;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (void)setUserPurge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_userPurge = a3;
}

- (void)setHasUserPurge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserPurge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate != 0;
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
  v11.super_class = (Class)CKDPZoneDeleteRequest;
  -[CKDPZoneDeleteRequest description](&v11, sel_description);
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
  void *v10;
  const char *v11;
  CKDPDate *lastMissingManateeIdentityErrorDate;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("zoneIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_userPurge);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("userPurge"));

  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  if (lastMissingManateeIdentityErrorDate)
  {
    objc_msgSend_dictionaryRepresentation(lastMissingManateeIdentityErrorDate, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("lastMissingManateeIdentityErrorDate"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA95E28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_lastMissingManateeIdentityErrorDate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 10;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  CKDPDate *lastMissingManateeIdentityErrorDate;
  _BYTE *v8;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v8 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_userPurge;
    v4[28] |= 1u;
  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  if (lastMissingManateeIdentityErrorDate)
  {
    objc_msgSend_setLastMissingManateeIdentityErrorDate_(v8, v5, (uint64_t)lastMissingManateeIdentityErrorDate);
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
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_userPurge;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v15 = objc_msgSend_copyWithZone_(self->_lastMissingManateeIdentityErrorDate, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

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
  char isEqual;
  CKDPDate *lastMissingManateeIdentityErrorDate;
  uint64_t v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  zoneIdentifier = self->_zoneIdentifier;
  v9 = v4[2];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_userPurge)
      {
        if (*((_BYTE *)v4 + 24))
          goto LABEL_14;
      }
      else if (!*((_BYTE *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    isEqual = 0;
    goto LABEL_9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_8;
LABEL_14:
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  v13 = v4[1];
  if ((unint64_t)lastMissingManateeIdentityErrorDate | v13)
    isEqual = objc_msgSend_isEqual_(lastMissingManateeIdentityErrorDate, v7, v13);
  else
    isEqual = 1;
LABEL_9:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_userPurge;
  else
    v7 = 0;
  return v7 ^ objc_msgSend_hash(self->_lastMissingManateeIdentityErrorDate, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v6;
  CKDPDate *lastMissingManateeIdentityErrorDate;
  uint64_t v8;
  id v9;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
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
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_userPurge = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  v8 = *((_QWORD *)v4 + 1);
  if (lastMissingManateeIdentityErrorDate)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(lastMissingManateeIdentityErrorDate, (const char *)v4, v8);
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setLastMissingManateeIdentityErrorDate_(self, (const char *)v4, v8);
    goto LABEL_14;
  }

}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (BOOL)userPurge
{
  return self->_userPurge;
}

- (CKDPDate)lastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate;
}

- (void)setLastMissingManateeIdentityErrorDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, 0);
}

@end
