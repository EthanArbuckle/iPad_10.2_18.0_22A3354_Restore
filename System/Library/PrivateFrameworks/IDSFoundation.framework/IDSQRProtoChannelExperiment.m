@implementation IDSQRProtoChannelExperiment

- (int)experimentId
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_experimentId;
  else
    return 0;
}

- (void)setExperimentId:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_experimentId = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExperimentId
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)experimentIdAsString:(int)a3
{
  double v3;

  if (!a3)
    return CFSTR("TRANSPORT_LEVEL_ENCRYPTION_DISABLED");
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsExperimentId:(id)a3
{
  double v3;

  objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("TRANSPORT_LEVEL_ENCRYPTION_DISABLED"), v3);
  return 0;
}

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForTestValue(self, a2, a3, v3);
  *(_BYTE *)&self->_has |= 4u;
  self->_testValue = 1;
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
  objc_msgSend_clearOneofValuesForTestValue(self, v5, v6, v7);
  *(_BYTE *)&self->_has |= 4u;
  self->_testValue = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;

}

- (void)setInt32Value:(int)a3
{
  double v3;

  objc_msgSend_clearOneofValuesForTestValue(self, a2, *(uint64_t *)&a3, v3);
  *(_BYTE *)&self->_has |= 4u;
  self->_testValue = 3;
  *(_BYTE *)&self->_has |= 2u;
  self->_int32Value = a3;
}

- (void)setHasInt32Value:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInt32Value
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)testValue
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_testValue;
  else
    return 0;
}

- (void)setTestValue:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_testValue = a3;
}

- (void)setHasTestValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTestValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)testValueAsString:(int)a3
{
  double v3;

  if (a3 < 4)
    return *(&off_1E3C22408 + a3);
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

  *(_BYTE *)&self->_has &= ~4u;
  self->_testValue = 0;
  *(_BYTE *)&self->_has &= ~8u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  *(_BYTE *)&self->_has &= ~2u;
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
  v13.super_class = (Class)IDSQRProtoChannelExperiment;
  -[IDSQRProtoChannelExperiment description](&v13, sel_description);
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
  __CFString *v8;
  const char *v9;
  double v10;
  NSString *experimentName;
  void *v12;
  const char *v13;
  double v14;
  NSString *stringValue;
  char has;
  void *v17;
  const char *v18;
  double v19;
  uint64_t testValue;
  void *v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if (self->_experimentId)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_experimentId);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, CFSTR("experiment_id"));
    }
    else
    {
      v8 = CFSTR("TRANSPORT_LEVEL_ENCRYPTION_DISABLED");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("TRANSPORT_LEVEL_ENCRYPTION_DISABLED"), v7, CFSTR("experiment_id"));
    }

  }
  experimentName = self->_experimentName;
  if (experimentName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)experimentName, v7, CFSTR("experiment_name"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_BOOLValue, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, CFSTR("BOOL_value"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)stringValue, v7, CFSTR("string_value"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, self->_int32Value, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, v19, CFSTR("int32_value"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    testValue = self->_testValue;
    if (testValue >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_testValue);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *(&off_1E3C22408 + testValue);
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v21, v7, CFSTR("test_value"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return IDSQRProtoChannelExperimentReadFrom((uint64_t)self, (uint64_t)a3, v3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_experimentName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
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
  if ((has & 4) != 0)
  {
    v4[10] = self->_testValue;
    *((_BYTE *)v4 + 48) |= 4u;
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
  v4[2] = self->_experimentId;
  *((_BYTE *)v4 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 44) = self->_BOOLValue;
    *((_BYTE *)v4 + 48) |= 8u;
  }
LABEL_5:
  stringValue = self->_stringValue;
  v10 = v4;
  if (stringValue)
  {
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue, v6);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[6] = self->_int32Value;
    *((_BYTE *)v4 + 48) |= 2u;
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
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v12 + 40) = self->_testValue;
    *(_BYTE *)(v12 + 48) |= 4u;
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
  *(_DWORD *)(v12 + 8) = self->_experimentId;
  *(_BYTE *)(v12 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_BYTE *)(v12 + 44) = self->_BOOLValue;
    *(_BYTE *)(v12 + 48) |= 8u;
  }
LABEL_5:
  v17 = objc_msgSend_copyWithZone_(self->_stringValue, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 32);
  *(_QWORD *)(v15 + 32) = v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v15 + 24) = self->_int32Value;
    *(_BYTE *)(v15 + 48) |= 2u;
  }
  v21 = objc_msgSend_copyWithZone_(self->_experimentName, v19, (uint64_t)a3, v20);
  v22 = *(void **)(v15 + 16);
  *(_QWORD *)(v15 + 16) = v21;

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
    goto LABEL_30;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_testValue != *((_DWORD *)v4 + 10))
      goto LABEL_30;
  }
  else if ((v4[6] & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[6] & 1) == 0 || self->_experimentId != *((_DWORD *)v4 + 2))
      goto LABEL_30;
  }
  else if ((v4[6] & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[6] & 8) == 0)
      goto LABEL_30;
    if (self->_BOOLValue)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_30;
    }
  }
  else if ((v4[6] & 8) != 0)
  {
    goto LABEL_30;
  }
  stringValue = self->_stringValue;
  v12 = v4[4];
  if (!((unint64_t)stringValue | v12))
    goto LABEL_23;
  if (!objc_msgSend_isEqual_(stringValue, v8, v12, v9))
  {
LABEL_30:
    isEqual = 0;
    goto LABEL_31;
  }
  has = (char)self->_has;
LABEL_23:
  if ((has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_int32Value != *((_DWORD *)v4 + 6))
      goto LABEL_30;
  }
  else if ((v4[6] & 2) != 0)
  {
    goto LABEL_30;
  }
  experimentName = self->_experimentName;
  v14 = v4[2];
  if ((unint64_t)experimentName | v14)
    isEqual = objc_msgSend_isEqual_(experimentName, v8, v14, v9);
  else
    isEqual = 1;
LABEL_31:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 4) == 0)
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
  v5 = 2654435761 * self->_testValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_experimentId;
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_int32Value;
  else
    v12 = 0;
  return v6 ^ v5 ^ v7 ^ v12 ^ v8 ^ objc_msgSend_hash(self->_experimentName, v9, v10, v11);
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
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 4) != 0)
  {
    self->_testValue = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 48);
    if ((v7 & 1) == 0)
    {
LABEL_3:
      if ((v7 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_experimentId = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
LABEL_4:
    self->_BOOLValue = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  v8 = *((_QWORD *)v4 + 4);
  v10 = v4;
  if (v8)
  {
    objc_msgSend_setStringValue_(self, v5, v8, v6);
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    self->_int32Value = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  v9 = *((_QWORD *)v4 + 2);
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
