@implementation CKCDPCodeServiceRequestDatabaseOwner

- (void)setNumericValue:(unint64_t)a3
{
  objc_msgSend_clearOneofValuesForIdentifier(self, a2, a3);
  *(_BYTE *)&self->_has |= 2u;
  self->_identifier = 1;
  *(_BYTE *)&self->_has |= 1u;
  self->_numericValue = a3;
}

- (void)setHasNumericValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumericValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setStringValue:(id)a3
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  NSString *stringValue;

  v4 = (NSString *)a3;
  objc_msgSend_clearOneofValuesForIdentifier(self, v5, v6);
  *(_BYTE *)&self->_has |= 2u;
  self->_identifier = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (int)identifier
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_identifier;
  else
    return 0;
}

- (void)setIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)identifierAsString:(int)a3
{
  if (a3 < 3)
    return off_1E78385C0[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIdentifier:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("numericValue")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("stringValue")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForIdentifier
{
  NSString *stringValue;

  *(_BYTE *)&self->_has &= ~2u;
  self->_identifier = 0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_numericValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

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
  v11.super_class = (Class)CKCDPCodeServiceRequestDatabaseOwner;
  -[CKCDPCodeServiceRequestDatabaseOwner description](&v11, sel_description);
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
  void *v5;
  void *v6;
  const char *v7;
  NSString *stringValue;
  uint64_t identifier;
  __CFString *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v4, self->_numericValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, CFSTR("numericValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, CFSTR("stringValue"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    identifier = self->_identifier;
    if (identifier >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_identifier);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E78385C0[identifier];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v10, CFSTR("Identifier"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC59D3C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  char has;
  NSString *stringValue;
  _DWORD *v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_identifier;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_numericValue;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  stringValue = self->_stringValue;
  if (stringValue)
  {
    v8 = v4;
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue);
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
  _QWORD *v12;
  char has;
  uint64_t v14;
  void *v15;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_identifier;
    *(_BYTE *)(v10 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_numericValue;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  v14 = objc_msgSend_copyWithZone_(self->_stringValue, v11, (uint64_t)a3);
  v15 = (void *)v12[3];
  v12[3] = v14;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *stringValue;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_identifier != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((v4[4] & 2) != 0)
  {
LABEL_14:
    isEqual = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_numericValue != v4[1])
      goto LABEL_14;
  }
  else if ((v4[4] & 1) != 0)
  {
    goto LABEL_14;
  }
  stringValue = self->_stringValue;
  v9 = v4[3];
  if ((unint64_t)stringValue | v9)
    isEqual = objc_msgSend_isEqual_(stringValue, v7, v9);
  else
    isEqual = 1;
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_identifier;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_numericValue;
  return v4 ^ v3 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  char v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((v6 & 1) != 0)
  {
    self->_numericValue = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    v8 = v4;
    objc_msgSend_setStringValue_(self, v5, v7);
    v4 = v8;
  }

}

- (unint64_t)numericValue
{
  return self->_numericValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
