@implementation CKDPZoneZoneReference

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (int)referenceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_referenceType;
  else
    return 0;
}

- (void)setReferenceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_referenceType = a3;
}

- (void)setHasReferenceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReferenceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)referenceTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E7836740[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReferenceType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("validating")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("owning")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("weak")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  v11.super_class = (Class)CKDPZoneZoneReference;
  -[CKDPZoneZoneReference description](&v11, sel_description);
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
  uint64_t referenceType;
  __CFString *v11;

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
    referenceType = self->_referenceType;
    if (referenceType >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_referenceType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E7836740[referenceType];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v11, CFSTR("referenceType"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBC5F7C((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  id v7;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v7 = v4;
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_referenceType;
    *((_BYTE *)v4 + 24) |= 1u;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_referenceType;
    *(_BYTE *)(v10 + 24) |= 1u;
  }
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
  BOOL v10;

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
  v10 = (v4[3] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[3] & 1) != 0 && self->_referenceType == *((_DWORD *)v4 + 2))
    {
      v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_referenceType;
  else
    v5 = 0;
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v6;
  id v7;

  v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v6 = *((_QWORD *)v4 + 2);
  if (zoneIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_referenceType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
}

@end
