@implementation CKDPQueryFilter

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setFieldValue:(id)a3
{
  objc_storeStrong((id *)&self->_fieldValue, a3);
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_fieldValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bounds)
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

- (CKDPRecordFieldIdentifier)fieldName
{
  return self->_fieldName;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (BOOL)hasFieldValue
{
  return self->_fieldValue != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
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
  if ((a3 - 1) < 0x15)
    return off_1E7833900[a3 - 1];
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
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("equals")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("notEquals")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("in")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("notIn")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("lessThan")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("lessThanOrEquals")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("greaterThan")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("greaterThanOrEquals")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("near")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("containsAllTokens")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("containsAnyTokens")) & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("listContains")) & 1) != 0)
  {
    v6 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("listNotContains")) & 1) != 0)
  {
    v6 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("listContainsAny")) & 1) != 0)
  {
    v6 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("listNotContainsAny")) & 1) != 0)
  {
    v6 = 15;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v20, (uint64_t)CFSTR("beginsWith")) & 1) != 0)
  {
    v6 = 16;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("notBeginsWith")) & 1) != 0)
  {
    v6 = 17;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v22, (uint64_t)CFSTR("listMemberBeginsWith")) & 1) != 0)
  {
    v6 = 18;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("notListMemberBeginsWith")) & 1) != 0)
  {
    v6 = 19;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v24, (uint64_t)CFSTR("listContainsAll")) & 1) != 0)
  {
    v6 = 20;
  }
  else if (objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("listNotContainsAll")))
  {
    v6 = 21;
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
  v11.super_class = (Class)CKDPQueryFilter;
  -[CKDPQueryFilter description](&v11, sel_description);
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
  CKDPRecordFieldIdentifier *fieldName;
  void *v8;
  const char *v9;
  CKDPRecordFieldValue *fieldValue;
  void *v11;
  const char *v12;
  CKDPLocationBound *bounds;
  void *v14;
  const char *v15;
  unsigned int v16;
  __CFString *v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fieldName = self->_fieldName;
  if (fieldName)
  {
    objc_msgSend_dictionaryRepresentation(fieldName, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("fieldName"));

  }
  fieldValue = self->_fieldValue;
  if (fieldValue)
  {
    objc_msgSend_dictionaryRepresentation(fieldValue, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("fieldValue"));

  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_dictionaryRepresentation(bounds, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("bounds"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16 = self->_type - 1;
    if (v16 >= 0x15)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E7833900[v16];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v17, CFSTR("type"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB0E11C((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordFieldIdentifier *fieldName;
  CKDPRecordFieldValue *fieldValue;
  CKDPLocationBound *bounds;
  id v9;

  v4 = a3;
  fieldName = self->_fieldName;
  v9 = v4;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v4, v5, (uint64_t)fieldName);
    v4 = v9;
  }
  fieldValue = self->_fieldValue;
  if (fieldValue)
  {
    objc_msgSend_setFieldValue_(v9, v5, (uint64_t)fieldValue);
    v4 = v9;
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_setBounds_(v9, v5, (uint64_t)bounds);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((_BYTE *)v4 + 36) |= 1u;
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
  v12 = objc_msgSend_copyWithZone_(self->_fieldName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fieldValue, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_bounds, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_type;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordFieldIdentifier *fieldName;
  uint64_t v9;
  CKDPRecordFieldValue *fieldValue;
  uint64_t v11;
  CKDPLocationBound *bounds;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  fieldName = self->_fieldName;
  v9 = v4[2];
  if ((unint64_t)fieldName | v9)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v9))
      goto LABEL_12;
  }
  fieldValue = self->_fieldValue;
  v11 = v4[3];
  if ((unint64_t)fieldValue | v11)
  {
    if (!objc_msgSend_isEqual_(fieldValue, v7, v11))
      goto LABEL_12;
  }
  bounds = self->_bounds;
  v13 = v4[1];
  if ((unint64_t)bounds | v13)
  {
    if (!objc_msgSend_isEqual_(bounds, v7, v13))
      goto LABEL_12;
  }
  v14 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_type == *((_DWORD *)v4 + 8))
    {
      v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
  }
LABEL_13:

  return v14;
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
  uint64_t v11;

  v4 = objc_msgSend_hash(self->_fieldName, a2, v2);
  v7 = objc_msgSend_hash(self->_fieldValue, v5, v6);
  v10 = objc_msgSend_hash(self->_bounds, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_type;
  else
    v11 = 0;
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordFieldIdentifier *fieldName;
  uint64_t v6;
  CKDPRecordFieldValue *fieldValue;
  uint64_t v8;
  CKDPLocationBound *bounds;
  uint64_t v10;
  id v11;

  v4 = a3;
  fieldName = self->_fieldName;
  v6 = *((_QWORD *)v4 + 2);
  v11 = v4;
  if (fieldName)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(fieldName, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setFieldName_(self, (const char *)v4, v6);
  }
  v4 = v11;
LABEL_7:
  fieldValue = self->_fieldValue;
  v8 = *((_QWORD *)v4 + 3);
  if (fieldValue)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(fieldValue, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setFieldValue_(self, (const char *)v4, v8);
  }
  v4 = v11;
LABEL_13:
  bounds = self->_bounds;
  v10 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_mergeFrom_(bounds, (const char *)v4, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_setBounds_(self, (const char *)v4, v10);
  }
  v4 = v11;
LABEL_19:
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (CKDPRecordFieldValue)fieldValue
{
  return self->_fieldValue;
}

- (CKDPLocationBound)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

@end
