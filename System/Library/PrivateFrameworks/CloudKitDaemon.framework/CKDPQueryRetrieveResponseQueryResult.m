@implementation CKDPQueryRetrieveResponseQueryResult

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("idAndEtag");
  if (a3 == 2)
  {
    v3 = CFSTR("fullRecord");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("idAndEtag")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("fullRecord")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasRecord
{
  return self->_record != 0;
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
  v11.super_class = (Class)CKDPQueryRetrieveResponseQueryResult;
  -[CKDPQueryRetrieveResponseQueryResult description](&v11, sel_description);
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
  CKDPRecordIdentifier *identifier;
  void *v8;
  const char *v9;
  NSString *etag;
  int type;
  __CFString *v12;
  const char *v13;
  CKDPRecord *record;
  void *v15;
  const char *v16;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, CFSTR("etag"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    type = self->_type;
    if (type == 1)
    {
      v12 = CFSTR("idAndEtag");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("idAndEtag"), CFSTR("type"));
    }
    else if (type == 2)
    {
      v12 = CFSTR("fullRecord");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("fullRecord"), CFSTR("type"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("type"));
    }

  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_dictionaryRepresentation(record, v4, (uint64_t)etag);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("record"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC005F0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_record)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordIdentifier *identifier;
  NSString *etag;
  CKDPRecord *record;
  id v9;

  v4 = a3;
  identifier = self->_identifier;
  v9 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    v4 = v9;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v9, v5, (uint64_t)etag);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_setRecord_(v9, v5, (uint64_t)record);
    v4 = v9;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_type;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  v18 = objc_msgSend_copyWithZone_(self->_record, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *identifier;
  uint64_t v9;
  NSString *etag;
  uint64_t v11;
  CKDPRecord *record;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  identifier = self->_identifier;
  v9 = v4[2];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9))
      goto LABEL_13;
  }
  etag = self->_etag;
  v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  record = self->_record;
  v13 = v4[3];
  if ((unint64_t)record | v13)
    isEqual = objc_msgSend_isEqual_(record, v7, v13);
  else
    isEqual = 1;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  v7 = objc_msgSend_hash(self->_etag, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_type;
  else
    v10 = 0;
  return v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_record, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordIdentifier *identifier;
  uint64_t v6;
  uint64_t v7;
  CKDPRecord *record;
  uint64_t v9;
  id v10;

  v4 = a3;
  identifier = self->_identifier;
  v6 = *((_QWORD *)v4 + 2);
  v10 = v4;
  if (identifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v10;
LABEL_7:
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  record = self->_record;
  v9 = *((_QWORD *)v4 + 3);
  if (record)
  {
    if (v9)
    {
      objc_msgSend_mergeFrom_(record, (const char *)v4, v9);
LABEL_16:
      v4 = v10;
    }
  }
  else if (v9)
  {
    objc_msgSend_setRecord_(self, (const char *)v4, v9);
    goto LABEL_16;
  }

}

- (CKDPRecordIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
