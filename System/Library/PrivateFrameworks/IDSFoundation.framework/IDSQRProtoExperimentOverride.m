@implementation IDSQRProtoExperimentOverride

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

- (void)setValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v13.super_class = (Class)IDSQRProtoExperimentOverride;
  -[IDSQRProtoExperimentOverride description](&v13, sel_description);
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_value, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, CFSTR("value"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoExperimentOverrideReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  NSString *experimentName;
  _DWORD *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_experimentId;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 24) = self->_value;
    *((_BYTE *)v4 + 28) |= 2u;
  }
  experimentName = self->_experimentName;
  if (experimentName)
  {
    v9 = v4;
    objc_msgSend_setExperimentName_(v4, v5, (uint64_t)experimentName, v6);
    v4 = v9;
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
  _QWORD *v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_experimentId;
    *(_BYTE *)(v12 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v12 + 24) = self->_value;
    *(_BYTE *)(v12 + 28) |= 2u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_experimentName, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[2];
  v15[2] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  char isEqual;
  NSString *experimentName;
  uint64_t v13;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_experimentId != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  if ((*((_BYTE *)v4 + 28) & 2) == 0)
    goto LABEL_11;
  if (!self->_value)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_17;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_11;
LABEL_17:
  experimentName = self->_experimentName;
  v13 = v4[2];
  if ((unint64_t)experimentName | v13)
    isEqual = objc_msgSend_isEqual_(experimentName, v8, v13, v9);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_experimentId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v5 ^ v4 ^ objc_msgSend_hash(self->_experimentName, a2, v2, v3);
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_value;
  return v5 ^ v4 ^ objc_msgSend_hash(self->_experimentName, a2, v2, v3);
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
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 1) != 0)
  {
    self->_experimentId = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_value = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = *((_QWORD *)v4 + 2);
  if (v8)
  {
    v9 = v4;
    objc_msgSend_setExperimentName_(self, v5, v8, v6);
    v4 = v9;
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

- (BOOL)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentName, 0);
}

@end
