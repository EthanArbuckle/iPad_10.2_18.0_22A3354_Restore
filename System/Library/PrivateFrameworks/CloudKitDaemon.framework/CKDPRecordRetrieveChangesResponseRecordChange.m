@implementation CKDPRecordRetrieveChangesResponseRecordChange

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
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
  if ((a3 - 1) < 3)
    return off_1E7834440[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("idAndEtag")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("fullRecord")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("recordDeleted")))
  {
    v6 = 3;
  }
  else
  {
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseRecordChange;
  -[CKDPRecordRetrieveChangesResponseRecordChange description](&v11, sel_description);
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
  CKDPRecordIdentifier *recordIdentifier;
  void *v8;
  const char *v9;
  NSString *etag;
  CKDPRecordType *recordType;
  void *v12;
  const char *v13;
  unsigned int v14;
  __CFString *v15;
  CKDPRecord *record;
  void *v17;
  const char *v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("recordIdentifier"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, CFSTR("etag"));
  recordType = self->_recordType;
  if (recordType)
  {
    objc_msgSend_dictionaryRepresentation(recordType, v4, (uint64_t)etag);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("recordType"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v14 = self->_type - 1;
    if (v14 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E7834440[v14];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v15, CFSTR("type"));

  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_dictionaryRepresentation(record, v4, (uint64_t)etag);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("record"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB34DE4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recordType)
  {
    PBDataWriterWriteSubmessage();
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
  CKDPRecordIdentifier *recordIdentifier;
  NSString *etag;
  CKDPRecordType *recordType;
  CKDPRecord *record;
  id v10;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v10 = v4;
  if (recordIdentifier)
  {
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier);
    v4 = v10;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v10, v5, (uint64_t)etag);
    v4 = v10;
  }
  recordType = self->_recordType;
  if (recordType)
  {
    objc_msgSend_setRecordType_(v10, v5, (uint64_t)recordType);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_type;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  record = self->_record;
  if (record)
  {
    objc_msgSend_setRecord_(v10, v5, (uint64_t)record);
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_recordType, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_type;
    *(_BYTE *)(v10 + 44) |= 1u;
  }
  v21 = objc_msgSend_copyWithZone_(self->_record, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v21;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v9;
  NSString *etag;
  uint64_t v11;
  CKDPRecordType *recordType;
  uint64_t v13;
  CKDPRecord *record;
  uint64_t v15;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_15;
  recordIdentifier = self->_recordIdentifier;
  v9 = v4[3];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9))
      goto LABEL_15;
  }
  etag = self->_etag;
  v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11))
      goto LABEL_15;
  }
  recordType = self->_recordType;
  v13 = v4[4];
  if ((unint64_t)recordType | v13)
  {
    if (!objc_msgSend_isEqual_(recordType, v7, v13))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    isEqual = 0;
    goto LABEL_16;
  }
  record = self->_record;
  v15 = v4[2];
  if ((unint64_t)record | v15)
    isEqual = objc_msgSend_isEqual_(record, v7, v15);
  else
    isEqual = 1;
LABEL_16:

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_etag, v5, v6);
  v10 = objc_msgSend_hash(self->_recordType, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_type;
  else
    v13 = 0;
  return v7 ^ v4 ^ v10 ^ v13 ^ objc_msgSend_hash(self->_record, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v6;
  uint64_t v7;
  CKDPRecordType *recordType;
  uint64_t v9;
  CKDPRecord *record;
  uint64_t v11;
  id v12;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v6 = *((_QWORD *)v4 + 3);
  v12 = v4;
  if (recordIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setRecordIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v12;
LABEL_7:
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    v4 = v12;
  }
  recordType = self->_recordType;
  v9 = *((_QWORD *)v4 + 4);
  if (recordType)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(recordType, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setRecordType_(self, (const char *)v4, v9);
  }
  v4 = v12;
LABEL_15:
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  record = self->_record;
  v11 = *((_QWORD *)v4 + 2);
  if (record)
  {
    if (v11)
    {
      objc_msgSend_mergeFrom_(record, (const char *)v4, v11);
LABEL_22:
      v4 = v12;
    }
  }
  else if (v11)
  {
    objc_msgSend_setRecord_(self, (const char *)v4, v11);
    goto LABEL_22;
  }

}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPRecordType)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
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
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
