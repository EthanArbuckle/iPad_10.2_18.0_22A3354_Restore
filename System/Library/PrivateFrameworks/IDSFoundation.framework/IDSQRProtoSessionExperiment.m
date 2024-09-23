@implementation IDSQRProtoSessionExperiment

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForTestValue(self, a2, a3, v3);
  *(_BYTE *)&self->_has |= 2u;
  self->_testValue = 1;
  *(_BYTE *)&self->_has |= 4u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  objc_msgSend_clearOneofValuesForTestValue(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 2u;
  self->_testValue = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (void)setInt32Value:(int)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForTestValue(self, a2, *(uint64_t *)&a3, v3);
  *(_BYTE *)&self->_has |= 2u;
  self->_testValue = 3;
  *(_BYTE *)&self->_has |= 1u;
  self->_int32Value = a3;
}

- (void)setHasInt32Value:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInt32Value
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)testValue
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_testValue;
  else
    return 0;
}

- (void)setTestValue:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_testValue = a3;
}

- (void)setHasTestValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)testValueAsString:(int)a3
{
  double v3;

  if (a3 < 4)
    return off_1E3C1F970[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTestValue:(id)a3
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
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("int32_value"), v12))
  {
    v8 = 3;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForTestValue
{
  NSString *stringValue;

  *(_BYTE *)&self->_has &= ~2u;
  self->_testValue = 0;
  *(_BYTE *)&self->_has &= ~4u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  *(_BYTE *)&self->_has &= ~1u;
  self->_int32Value = 0;
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
  v13.super_class = (Class)IDSQRProtoSessionExperiment;
  -[IDSQRProtoSessionExperiment description](&v13, sel_description);
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
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSString *experimentName;
  void *v10;
  const char *v11;
  double v12;
  NSString *stringValue;
  char has;
  void *v15;
  const char *v16;
  double v17;
  uint64_t testValue;
  __CFString *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  experimentName = self->_experimentName;
  if (experimentName)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)experimentName, v7, CFSTR("experiment_name"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v6, self->_BOOLValue, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, CFSTR("BOOL_value"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)stringValue, v7, CFSTR("string_value"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v6, self->_int32Value, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, v17, CFSTR("int32_value"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    testValue = self->_testValue;
    if (testValue >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_testValue);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E3C1F970[testValue];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v19, v7, CFSTR("test_value"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IDSQRProtoSessionExperimentReadFrom((uint64_t)self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_experimentName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  char has;
  NSString *stringValue;
  NSString *experimentName;
  _DWORD *v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_testValue;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_BOOLValue;
    *((_BYTE *)v4 + 40) |= 4u;
  }
  stringValue = self->_stringValue;
  v10 = v4;
  if (stringValue)
  {
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue, v6);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_int32Value;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  experimentName = self->_experimentName;
  if (experimentName)
  {
    objc_msgSend_setExperimentName_(v10, v5, (uint64_t)experimentName, v6);
    v4 = v10;
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
  const char *v19;
  double v20;
  uint64_t v21;
  void *v22;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = v12;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 32) = self->_testValue;
    *(_BYTE *)(v12 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v12 + 36) = self->_BOOLValue;
    *(_BYTE *)(v12 + 40) |= 4u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_stringValue, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v17;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v15 + 16) = self->_int32Value;
    *(_BYTE *)(v15 + 40) |= 1u;
  }
  v21 = objc_msgSend_copyWithZone_(self->_experimentName, v19, (uint64_t)a3, v20);
  v22 = *(void **)(v15 + 8);
  *(_QWORD *)(v15 + 8) = v21;

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
  NSString *experimentName;
  uint64_t v14;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_25;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((v4[5] & 2) == 0 || self->_testValue != *((_DWORD *)v4 + 8))
      goto LABEL_25;
  }
  else if ((v4[5] & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[5] & 4) == 0)
      goto LABEL_25;
    if (self->_BOOLValue)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_25;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_25;
    }
  }
  else if ((v4[5] & 4) != 0)
  {
    goto LABEL_25;
  }
  stringValue = self->_stringValue;
  v12 = v4[3];
  if (!((unint64_t)stringValue | v12))
    goto LABEL_18;
  if (!objc_msgSend_isEqual_(stringValue, v8, v12, v9))
  {
LABEL_25:
    isEqual = 0;
    goto LABEL_26;
  }
  has = (char)self->_has;
LABEL_18:
  if ((has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_int32Value != *((_DWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((v4[5] & 1) != 0)
  {
    goto LABEL_25;
  }
  experimentName = self->_experimentName;
  v14 = v4[1];
  if ((unint64_t)experimentName | v14)
    isEqual = objc_msgSend_isEqual_(experimentName, v8, v14, v9);
  else
    isEqual = 1;
LABEL_26:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_testValue;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_BOOLValue;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend_hash(self->_stringValue, a2, v2, v3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_int32Value;
  else
    v11 = 0;
  return v6 ^ v5 ^ v11 ^ v7 ^ objc_msgSend_hash(self->_experimentName, v8, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_testValue = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 40);
  }
  if ((v7 & 4) != 0)
  {
    self->_BOOLValue = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }
  v8 = *((_QWORD *)v4 + 3);
  v10 = v4;
  if (v8)
  {
    objc_msgSend_setStringValue_(self, v5, v8, v6);
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_int32Value = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = *((_QWORD *)v4 + 1);
  if (v9)
  {
    objc_msgSend_setExperimentName_(self, v5, v9, v6);
    v4 = v10;
  }

}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
  objc_storeStrong((id *)&self->_experimentName, a3);
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int)int32Value
{
  return self->_int32Value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
}

@end
