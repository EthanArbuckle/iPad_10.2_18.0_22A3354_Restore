@implementation CKDPRecordRetrieveRequestRetrieveAssetURL

- (BOOL)hasAssetFields
{
  return self->_assetFields != 0;
}

- (void)setRequestedTTL:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestedTTL = a3;
}

- (void)setHasRequestedTTL:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestedTTL
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  switch(a3)
  {
    case 1:
      return CFSTR("publishedURL");
    case 4:
      return CFSTR("chunkInfoUrl");
    case 2:
      v3 = CFSTR("streamingURL");
      break;
    default:
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("publishedURL")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("streamingURL")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("chunkInfoUrl")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
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
  v11.super_class = (Class)CKDPRecordRetrieveRequestRetrieveAssetURL;
  -[CKDPRecordRetrieveRequestRetrieveAssetURL description](&v11, sel_description);
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
  CKDPRequestedFields *assetFields;
  void *v8;
  const char *v9;
  char has;
  void *v11;
  const char *v12;
  int type;
  __CFString *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  assetFields = self->_assetFields;
  if (assetFields)
  {
    objc_msgSend_dictionaryRepresentation(assetFields, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("assetFields"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_requestedTTL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("requestedTTL"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    type = self->_type;
    switch(type)
    {
      case 1:
        v14 = CFSTR("publishedURL");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("publishedURL"), CFSTR("type"));
        break;
      case 4:
        v14 = CFSTR("chunkInfoUrl");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("chunkInfoUrl"), CFSTR("type"));
        break;
      case 2:
        v14 = CFSTR("streamingURL");
        objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("streamingURL"), CFSTR("type"));
        break;
      default:
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("type"));
        break;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAEE720((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_assetFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRequestedFields *assetFields;
  char has;
  id v8;

  v4 = a3;
  assetFields = self->_assetFields;
  if (assetFields)
  {
    v8 = v4;
    objc_msgSend_setAssetFields_(v4, v5, (uint64_t)assetFields);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_requestedTTL;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((_BYTE *)v4 + 28) |= 2u;
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
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_assetFields, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_requestedTTL;
    *(_BYTE *)(v10 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_type;
    *(_BYTE *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRequestedFields *assetFields;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  assetFields = self->_assetFields;
  v9 = v4[2];
  if ((unint64_t)assetFields | v9)
  {
    if (!objc_msgSend_isEqual_(assetFields, v7, v9))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_requestedTTL != v4[1])
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v10 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v10 = 1;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_assetFields, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_requestedTTL;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_type;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRequestedFields *assetFields;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  assetFields = self->_assetFields;
  v6 = *((_QWORD *)v4 + 2);
  if (assetFields)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    objc_msgSend_mergeFrom_(assetFields, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    objc_msgSend_setAssetFields_(self, (const char *)v4, v6);
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 1) != 0)
  {
    self->_requestedTTL = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (CKDPRequestedFields)assetFields
{
  return self->_assetFields;
}

- (void)setAssetFields:(id)a3
{
  objc_storeStrong((id *)&self->_assetFields, a3);
}

- (int64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFields, 0);
}

@end
