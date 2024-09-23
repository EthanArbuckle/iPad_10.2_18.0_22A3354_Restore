@implementation CKDPQuerySort

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (int)order
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_order;
  else
    return 1;
}

- (void)setOrder:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)orderAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ascending");
  if (a3 == 2)
  {
    v3 = CFSTR("descending");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOrder:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("ascending")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("descending")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
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
  v11.super_class = (Class)CKDPQuerySort;
  -[CKDPQuerySort description](&v11, sel_description);
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
  int order;
  __CFString *v11;
  const char *v12;
  CKDPLocationCoordinate *coordinate;
  void *v14;
  const char *v15;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fieldName = self->_fieldName;
  if (fieldName)
  {
    objc_msgSend_dictionaryRepresentation(fieldName, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("fieldName"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    order = self->_order;
    if (order == 1)
    {
      v11 = CFSTR("ascending");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("ascending"), CFSTR("order"));
    }
    else if (order == 2)
    {
      v11 = CFSTR("descending");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("descending"), CFSTR("order"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_order);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("order"));
    }

  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    objc_msgSend_dictionaryRepresentation(coordinate, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("coordinate"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA3CCE4((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPRecordFieldIdentifier *fieldName;
  CKDPLocationCoordinate *coordinate;
  id v8;

  v4 = a3;
  fieldName = self->_fieldName;
  v8 = v4;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v4, v5, (uint64_t)fieldName);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_order;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    objc_msgSend_setCoordinate_(v8, v5, (uint64_t)coordinate);
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
  v12 = objc_msgSend_copyWithZone_(self->_fieldName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_order;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  v15 = objc_msgSend_copyWithZone_(self->_coordinate, v14, (uint64_t)a3);
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
  CKDPRecordFieldIdentifier *fieldName;
  uint64_t v9;
  CKDPLocationCoordinate *coordinate;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  fieldName = self->_fieldName;
  v9 = v4[2];
  if ((unint64_t)fieldName | v9)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_order != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  coordinate = self->_coordinate;
  v11 = v4[1];
  if ((unint64_t)coordinate | v11)
    isEqual = objc_msgSend_isEqual_(coordinate, v7, v11);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend_hash(self->_fieldName, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_order;
  else
    v7 = 0;
  return v7 ^ objc_msgSend_hash(self->_coordinate, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordFieldIdentifier *fieldName;
  uint64_t v6;
  CKDPLocationCoordinate *coordinate;
  uint64_t v8;
  id v9;

  v4 = a3;
  fieldName = self->_fieldName;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
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
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_order = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  coordinate = self->_coordinate;
  v8 = *((_QWORD *)v4 + 1);
  if (coordinate)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(coordinate, (const char *)v4, v8);
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setCoordinate_(self, (const char *)v4, v8);
    goto LABEL_14;
  }

}

- (CKDPRecordFieldIdentifier)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (CKDPLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
