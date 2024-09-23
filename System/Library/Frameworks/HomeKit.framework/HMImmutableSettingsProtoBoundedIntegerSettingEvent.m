@implementation HMImmutableSettingsProtoBoundedIntegerSettingEvent

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setMinValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minValue = a3;
}

- (void)setHasMinValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaxValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxValue = a3;
}

- (void)setHasMaxValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStepValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_stepValue = a3;
}

- (void)setHasStepValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStepValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoBoundedIntegerSettingEvent;
  -[HMImmutableSettingsProtoBoundedIntegerSettingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoBoundedIntegerSettingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMImmutableSettingsProtoIntegerValueEvent *value;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    -[HMImmutableSettingsProtoIntegerValueEvent dictionaryRepresentation](value, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_maxValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("maxValue"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("minValue"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stepValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("stepValue"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoBoundedIntegerSettingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_value)
  {
    v6 = v4;
    objc_msgSend(v4, "setValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 1) = self->_maxValue;
    *((_BYTE *)v4 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 2) = self->_minValue;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = self->_stepValue;
    *((_BYTE *)v4 + 40) |= 4u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HMImmutableSettingsProtoIntegerValueEvent copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_maxValue;
    *(_BYTE *)(v5 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_minValue;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_stepValue;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMImmutableSettingsProtoIntegerValueEvent *value;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 4))
  {
    if (!-[HMImmutableSettingsProtoIntegerValueEvent isEqual:](value, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_minValue != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_maxValue != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_stepValue != *((_QWORD *)v4 + 3))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[HMImmutableSettingsProtoIntegerValueEvent hash](self->_value, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_minValue;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_maxValue;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_stepValue;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMImmutableSettingsProtoIntegerValueEvent *value;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  value = self->_value;
  v6 = v4[4];
  if (value)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HMImmutableSettingsProtoIntegerValueEvent mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HMImmutableSettingsProtoBoundedIntegerSettingEvent setValue:](self, "setValue:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 2) == 0)
  {
    if ((v4[5] & 1) == 0)
      goto LABEL_9;
LABEL_13:
    self->_maxValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    if ((v4[5] & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_minValue = v4[2];
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 4) != 0)
  {
LABEL_10:
    self->_stepValue = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:

}

- (HMImmutableSettingsProtoIntegerValueEvent)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (int64_t)maxValue
{
  return self->_maxValue;
}

- (int64_t)stepValue
{
  return self->_stepValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
