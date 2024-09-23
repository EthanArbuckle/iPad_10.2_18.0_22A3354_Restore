@implementation HDCodableUserDomainConceptLocalizedStringProperty

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
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HDCodableUserDomainConceptLocalizedStringProperty;
  -[HDCodableUserDomainConceptLocalizedStringProperty description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptLocalizedStringProperty dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *stringValue;
  NSString *locale;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend(v3, "setObject:forKey:", stringValue, CFSTR("stringValue"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKey:", locale, CFSTR("locale"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("deleted"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptLocalizedStringPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_locale)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_type;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_version;
  *((_BYTE *)v4 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 52) |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    v4 = v6;
  }
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_deleted;
    *((_BYTE *)v4 + 52) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_version;
  *(_BYTE *)(v5 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_locale, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 48) = self->_deleted;
    *(_BYTE *)(v6 + 52) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stringValue;
  NSString *locale;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_version != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_23;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_23;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](locale, "isEqual:"))
      goto LABEL_23;
  }
  v7 = (*((_BYTE *)v4 + 52) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
    {
LABEL_23:
      v7 = 0;
      goto LABEL_24;
    }
    if (self->_deleted)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_23;
    }
    v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  v3 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  v10 = -[NSString hash](self->_stringValue, "hash");
  v11 = -[NSString hash](self->_locale, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v12 = 2654435761 * self->_deleted;
  else
    v12 = 0;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_4:
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableUserDomainConceptLocalizedStringProperty setStringValue:](self, "setStringValue:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableUserDomainConceptLocalizedStringProperty setLocale:](self, "setLocale:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    self->_deleted = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
  }

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

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
