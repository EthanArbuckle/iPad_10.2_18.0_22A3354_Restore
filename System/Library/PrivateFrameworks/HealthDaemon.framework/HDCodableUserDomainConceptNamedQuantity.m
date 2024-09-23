@implementation HDCodableUserDomainConceptNamedQuantity

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(double)a3
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

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)HDCodableUserDomainConceptNamedQuantity;
  -[HDCodableUserDomainConceptNamedQuantity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptNamedQuantity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  void *v6;
  NSString *unit;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("value"));

  }
  unit = self->_unit;
  if (unit)
    objc_msgSend(v4, "setObject:forKey:", unit, CFSTR("unit"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timestamp"));

      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return v4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("deleted"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptNamedQuantityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_unit)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteDoubleField();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_value;
    *((_BYTE *)v4 + 60) |= 4u;
  }
  if (self->_unit)
  {
    objc_msgSend(v6, "setUnit:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_type;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
      *((_BYTE *)v4 + 60) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 4) = self->_version;
  *((_BYTE *)v4 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 56) = self->_deleted;
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_value;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_unit, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v5 + 8) = self->_timestamp;
      *(_BYTE *)(v5 + 60) |= 1u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        return (id)v5;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v5 + 32) = self->_version;
  *(_BYTE *)(v5 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 56) = self->_deleted;
    *(_BYTE *)(v5 + 60) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  char has;
  char v7;
  NSString *unit;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_29;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 60);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_value != *((double *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  unit = self->_unit;
  if ((unint64_t)unit | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](unit, "isEqual:"))
      goto LABEL_29;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 60);
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_version != *((_QWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_29;
  }
  v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_29;
      }
      else if (*((_BYTE *)v4 + 56))
      {
        goto LABEL_29;
      }
      v9 = 1;
      goto LABEL_30;
    }
LABEL_29:
    v9 = 0;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double value;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  char has;
  uint64_t v11;
  uint64_t v12;
  double timestamp;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    value = self->_value;
    v6 = -value;
    if (value >= 0.0)
      v6 = self->_value;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = -[NSString hash](self->_unit, "hash");
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_11;
LABEL_17:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_12;
LABEL_18:
    v17 = 0;
    goto LABEL_21;
  }
  v11 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_17;
LABEL_11:
  v12 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_18;
LABEL_12:
  timestamp = self->_timestamp;
  v14 = -timestamp;
  if (timestamp >= 0.0)
    v14 = self->_timestamp;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_21:
  if ((has & 0x10) != 0)
    v18 = 2654435761 * self->_deleted;
  else
    v18 = 0;
  return v4 ^ v3 ^ v9 ^ v11 ^ v12 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableUserDomainConceptNamedQuantity setName:](self, "setName:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    self->_value = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableUserDomainConceptNamedQuantity setUnit:](self, "setUnit:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
LABEL_15:
      self->_timestamp = *((double *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 60) & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_version = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v5 & 0x10) != 0)
  {
LABEL_11:
    self->_deleted = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_12:

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)value
{
  return self->_value;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
