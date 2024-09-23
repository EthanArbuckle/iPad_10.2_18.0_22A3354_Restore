@implementation CKDPZoneSaveResponse

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpired
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPZoneSaveResponse;
  -[CKDPZoneSaveResponse description](&v11, sel_description);
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
  CKDPZoneCapabilities *capabilities;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  CKDPDate *expirationTime;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  capabilities = self->_capabilities;
  if (capabilities)
  {
    objc_msgSend_dictionaryRepresentation(capabilities, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("capabilities"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_expired);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("expired"));

  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_dictionaryRepresentation(expirationTime, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("expirationTime"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC8A350((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPZoneCapabilities *capabilities;
  CKDPDate *expirationTime;
  _BYTE *v8;

  v4 = a3;
  capabilities = self->_capabilities;
  v8 = v4;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v4, v5, (uint64_t)capabilities);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_expired;
    v4[28] |= 1u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v8, v5, (uint64_t)expirationTime);
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
  v12 = objc_msgSend_copyWithZone_(self->_capabilities, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_expired;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v15 = objc_msgSend_copyWithZone_(self->_expirationTime, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPZoneCapabilities *capabilities;
  uint64_t v9;
  char isEqual;
  CKDPDate *expirationTime;
  uint64_t v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  capabilities = self->_capabilities;
  v9 = v4[1];
  if ((unint64_t)capabilities | v9)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v9))
      goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_expired)
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
  expirationTime = self->_expirationTime;
  v13 = v4[2];
  if ((unint64_t)expirationTime | v13)
    isEqual = objc_msgSend_isEqual_(expirationTime, v7, v13);
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

  v6 = objc_msgSend_hash(self->_capabilities, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_expired;
  else
    v7 = 0;
  return v7 ^ objc_msgSend_hash(self->_expirationTime, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPZoneCapabilities *capabilities;
  uint64_t v6;
  CKDPDate *expirationTime;
  uint64_t v8;
  id v9;

  v4 = a3;
  capabilities = self->_capabilities;
  v6 = *((_QWORD *)v4 + 1);
  v9 = v4;
  if (capabilities)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setCapabilities_(self, (const char *)v4, v6);
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_expired = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  expirationTime = self->_expirationTime;
  v8 = *((_QWORD *)v4 + 2);
  if (expirationTime)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v8);
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v8);
    goto LABEL_14;
  }

}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
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
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
