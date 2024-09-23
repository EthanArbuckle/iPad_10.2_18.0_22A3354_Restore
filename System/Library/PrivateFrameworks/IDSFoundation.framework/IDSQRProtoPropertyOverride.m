@implementation IDSQRProtoPropertyOverride

- (int)propertyName
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_propertyName;
  else
    return 0;
}

- (void)setPropertyName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_propertyName = a3;
}

- (void)setHasPropertyName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPropertyName
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)propertyNameAsString:(int)a3
{
  double v3;

  if (a3 < 3)
    return *(&off_1E3C21048 + a3);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPropertyName:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("server_enforced_disconnection_timeout_seconds"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("multiway_participant_trust_guard_duration_in_millis"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("disconnect_participant_landing_on_old_instance_during_resign"), v10))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setBoolValue:(BOOL)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForPropertyValue(self, a2, a3, v3);
  *(_BYTE *)&self->_has |= 2u;
  self->_propertyValue = 1;
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
  double v7;
  NSString *stringValue;

  v4 = (NSString *)a3;
  objc_msgSend_clearOneofValuesForPropertyValue(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 2u;
  self->_propertyValue = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (void)setUint32Value:(unsigned int)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForPropertyValue(self, a2, *(uint64_t *)&a3, v3);
  *(_BYTE *)&self->_has |= 2u;
  self->_propertyValue = 3;
  *(_BYTE *)&self->_has |= 4u;
  self->_uint32Value = a3;
}

- (void)setHasUint32Value:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUint32Value
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)propertyValue
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_propertyValue;
  else
    return 0;
}

- (void)setPropertyValue:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_propertyValue = a3;
}

- (void)setHasPropertyValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPropertyValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)propertyValueAsString:(int)a3
{
  double v3;

  if (a3 < 4)
    return *(&off_1E3C21060 + a3);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPropertyValue:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET"), v5) & 1) != 0)
  {
    v8 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("BOOL_value"), v7) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("string_value"), v10) & 1) != 0)
  {
    v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("uint32_value"), v12))
  {
    v8 = 3;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForPropertyValue
{
  NSString *stringValue;

  *(_BYTE *)&self->_has &= ~2u;
  self->_propertyValue = 0;
  *(_BYTE *)&self->_has &= ~8u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  *(_BYTE *)&self->_has &= ~4u;
  self->_uint32Value = 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPropertyOverride;
  -[IDSQRProtoPropertyOverride description](&v13, sel_description);
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
  double v3;
  const char *v5;
  void *v6;
  double v7;
  char has;
  uint64_t propertyName;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  NSString *stringValue;
  char v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t propertyValue;
  void *v20;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    propertyName = self->_propertyName;
    if (propertyName >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_propertyName);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E3C21048 + propertyName);
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v10, v7, CFSTR("property_name"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_BOOLValue, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, v13, CFSTR("BOOL_value"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)stringValue, v7, CFSTR("string_value"));
  v15 = (char)self->_has;
  if ((v15 & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_uint32Value, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, v18, CFSTR("uint32_value"));

    v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    propertyValue = self->_propertyValue;
    if (propertyValue >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_propertyValue);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = *(&off_1E3C21060 + propertyValue);
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v20, v7, CFSTR("property_value"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IDSQRProtoPropertyOverrideReadFrom((uint64_t)self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  char has;
  NSString *stringValue;
  _DWORD *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_propertyValue;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_propertyName;
  *((_BYTE *)v4 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 28) = self->_BOOLValue;
    *((_BYTE *)v4 + 32) |= 8u;
  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue)
  {
    v9 = v4;
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue, v6);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[6] = self->_uint32Value;
    *((_BYTE *)v4 + 32) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = v12;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 12) = self->_propertyValue;
    *(_BYTE *)(v12 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v12 + 8) = self->_propertyName;
  *(_BYTE *)(v12 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_BYTE *)(v12 + 28) = self->_BOOLValue;
    *(_BYTE *)(v12 + 32) |= 8u;
  }
LABEL_5:
  v17 = objc_msgSend_copyWithZone_(self->_stringValue, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 16);
  *(_QWORD *)(v15 + 16) = v17;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v15 + 24) = self->_uint32Value;
    *(_BYTE *)(v15 + 32) |= 4u;
  }
  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  char has;
  NSString *stringValue;
  uint64_t v12;
  BOOL v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_propertyValue != *((_DWORD *)v4 + 3))
      goto LABEL_27;
  }
  else if ((v4[4] & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_propertyName != *((_DWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((v4[4] & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[4] & 8) == 0)
      goto LABEL_27;
    if (self->_BOOLValue)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_27;
    }
  }
  else if ((v4[4] & 8) != 0)
  {
    goto LABEL_27;
  }
  stringValue = self->_stringValue;
  v12 = v4[2];
  if (!((unint64_t)stringValue | v12))
    goto LABEL_23;
  if (!objc_msgSend_isEqual_(stringValue, v8, v12, v9))
  {
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  has = (char)self->_has;
LABEL_23:
  v13 = (v4[4] & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v4[4] & 4) == 0 || self->_uint32Value != *((_DWORD *)v4 + 6))
      goto LABEL_27;
    v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761 * self->_propertyValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_propertyName;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_BOOLValue;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = objc_msgSend_hash(self->_stringValue, a2, v2, v3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v9 = 2654435761 * self->_uint32Value;
  else
    v9 = 0;
  return v6 ^ v5 ^ v7 ^ v9 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_propertyValue = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 32);
    if ((v7 & 1) == 0)
    {
LABEL_3:
      if ((v7 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_propertyName = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
LABEL_4:
    self->_BOOLValue = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  v8 = *((_QWORD *)v4 + 2);
  if (v8)
  {
    v9 = v4;
    objc_msgSend_setStringValue_(self, v5, v8, v6);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    self->_uint32Value = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (unsigned)uint32Value
{
  return self->_uint32Value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
