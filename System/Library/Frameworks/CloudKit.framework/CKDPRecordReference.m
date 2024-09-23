@implementation CKDPRecordReference

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
  uint64_t v3;

  if ((a3 - 1) < 3)
    return off_1E1F61CE8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("owning"), v5) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("weak"), v7) & 1) != 0)
  {
    v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("validating"), v10))
  {
    v8 = 3;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordReference;
  -[CKDPRecordReference description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  CKDPRecordIdentifier *recordIdentifier;
  void *v12;
  const char *v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = self->_type - 1;
    if (v9 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_type);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1F61CE8[v9];
    }
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)v10, (uint64_t)CFSTR("type"));

  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, (uint64_t)CFSTR("recordIdentifier"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;
  CKDPRecordIdentifier *recordIdentifier;
  _DWORD *v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_type;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v8 = v4;
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier, v6);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 16) = self->_type;
    *(_BYTE *)(v12 + 20) |= 1u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[1];
  v15[1] = v16;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  recordIdentifier = self->_recordIdentifier;
  v11 = v4[1];
  if ((unint64_t)recordIdentifier | v11)
    isEqual = objc_msgSend_isEqual_(recordIdentifier, v8, v11, v9);
  else
    isEqual = 1;
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  return objc_msgSend_hash(self->_recordIdentifier, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v6 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_type = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  v8 = v6[1];
  if (recordIdentifier)
  {
    if (v8)
    {
      v9 = v6;
      objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v6, v8, v5);
LABEL_8:
      v6 = v9;
    }
  }
  else if (v8)
  {
    v9 = v6;
    objc_msgSend_setRecordIdentifier_(self, (const char *)v6, v8, v5);
    goto LABEL_8;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end
