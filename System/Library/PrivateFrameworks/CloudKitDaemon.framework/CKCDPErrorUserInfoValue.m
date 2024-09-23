@implementation CKCDPErrorUserInfoValue

- (void)setDoubleValue:(double)a3
{
  uint64_t v3;

  objc_msgSend_clearOneofValuesForValue(self, a2, v3);
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 1;
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setInt64Value:(int64_t)a3
{
  objc_msgSend_clearOneofValuesForValue(self, a2, a3);
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 2;
  *(_BYTE *)&self->_has |= 2u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInt64Value
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBoolValue:(BOOL)a3
{
  objc_msgSend_clearOneofValuesForValue(self, a2, a3);
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 3;
  *(_BYTE *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  objc_msgSend_clearOneofValuesForValue(self, v5, v6);
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 4;
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setBytesValue:(id)a3
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  NSData *bytesValue;

  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForValue(self, v5, v6);
  *(_BYTE *)&self->_has |= 4u;
  self->_value = 5;
  bytesValue = self->_bytesValue;
  self->_bytesValue = v4;

}

- (int)value
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_value;
  else
    return 0;
}

- (void)setValue:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)valueAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7836AA8[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsValue:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("doubleValue")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("int64Value")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("BOOLValue")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("stringValue")) & 1) != 0)
  {
    v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("bytesValue")))
  {
    v6 = 5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForValue
{
  NSString *stringValue;
  NSData *bytesValue;

  *(_BYTE *)&self->_has &= ~4u;
  self->_value = 0;
  *(_BYTE *)&self->_has &= ~1u;
  self->_doubleValue = 0.0;
  *(_BYTE *)&self->_has &= ~2u;
  self->_int64Value = 0;
  *(_BYTE *)&self->_has &= ~8u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  bytesValue = self->_bytesValue;
  self->_bytesValue = 0;

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
  v11.super_class = (Class)CKCDPErrorUserInfoValue;
  -[CKCDPErrorUserInfoValue description](&v11, sel_description);
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
  char has;
  void *v8;
  const char *v9;
  NSString *stringValue;
  NSData *bytesValue;
  uint64_t value;
  __CFString *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, v5, self->_doubleValue);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("doubleValue"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_int64Value);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("int64Value"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_BOOLValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("BOOLValue"));

  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)stringValue, CFSTR("stringValue"));
  bytesValue = self->_bytesValue;
  if (bytesValue)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)bytesValue, CFSTR("bytesValue"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    value = self->_value;
    if (value >= 6)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_value);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E7836AA8[value];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v13, CFSTR("value"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBD4AB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bytesValue)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  char has;
  NSString *stringValue;
  NSData *bytesValue;
  _DWORD *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_value;
    *((_BYTE *)v4 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *((_QWORD *)v4 + 2) = self->_int64Value;
  *((_BYTE *)v4 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_BYTE *)v4 + 44) = self->_BOOLValue;
    *((_BYTE *)v4 + 48) |= 8u;
  }
LABEL_6:
  stringValue = self->_stringValue;
  v9 = v4;
  if (stringValue)
  {
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue);
    v4 = v9;
  }
  bytesValue = self->_bytesValue;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v9, v5, (uint64_t)bytesValue);
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
  _QWORD *v12;
  char has;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_value;
    *(_BYTE *)(v10 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v10 + 16) = self->_int64Value;
      *(_BYTE *)(v10 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v10 + 8) = self->_doubleValue;
  *(_BYTE *)(v10 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v10 + 44) = self->_BOOLValue;
    *(_BYTE *)(v10 + 48) |= 8u;
  }
LABEL_6:
  v14 = objc_msgSend_copyWithZone_(self->_stringValue, v11, (uint64_t)a3);
  v15 = (void *)v12[4];
  v12[4] = v14;

  v17 = objc_msgSend_copyWithZone_(self->_bytesValue, v16, (uint64_t)a3);
  v18 = (void *)v12[3];
  v12[3] = v17;

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
  NSData *bytesValue;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_value != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((v4[6] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[6] & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((v4[6] & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_int64Value != v4[2])
      goto LABEL_29;
  }
  else if ((v4[6] & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[6] & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_29;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_25;
    }
LABEL_29:
    isEqual = 0;
    goto LABEL_30;
  }
  if ((v4[6] & 8) != 0)
    goto LABEL_29;
LABEL_25:
  stringValue = self->_stringValue;
  v9 = v4[4];
  if ((unint64_t)stringValue | v9 && !objc_msgSend_isEqual_(stringValue, v7, v9))
    goto LABEL_29;
  bytesValue = self->_bytesValue;
  v11 = v4[3];
  if ((unint64_t)bytesValue | v11)
    isEqual = objc_msgSend_isEqual_(bytesValue, v7, v11);
  else
    isEqual = 1;
LABEL_30:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  char has;
  uint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = 2654435761 * self->_value;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  doubleValue = self->_doubleValue;
  v7 = -doubleValue;
  if (doubleValue >= 0.0)
    v7 = self->_doubleValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    v11 = 2654435761 * self->_int64Value;
    if ((has & 8) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_BOOLValue;
LABEL_16:
  v13 = v10 ^ v5 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
  return v13 ^ objc_msgSend_hash(self->_bytesValue, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 4) != 0)
  {
    self->_value = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_doubleValue = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  self->_int64Value = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
LABEL_5:
    self->_BOOLValue = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  v7 = *((_QWORD *)v4 + 4);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setStringValue_(self, v5, v7);
    v4 = v9;
  }
  v8 = *((_QWORD *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setBytesValue_(self, v5, v8);
    v4 = v9;
  }

}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

@end
