@implementation HKCodableWheelchairSetting

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasIsUsingWheelchair:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)setIsUsingWheelchair:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isUsingWheelchair = a3;
}

- (BOOL)hasIsUsingWheelchair
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HKCodableWheelchairSetting;
  -[HKCodableWheelchairSetting description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableWheelchairSetting dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("latestSupportedVersion"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUsingWheelchair);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isUsingWheelchair"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("minimumSupportedVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableWheelchairSettingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[1] = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_BYTE *)v4 + 24) = self->_isUsingWheelchair;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 24) = self->_isUsingWheelchair;
    *((_BYTE *)result + 28) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_latestSupportedVersion;
  *((_BYTE *)result + 28) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 2) = self->_minimumSupportedVersion;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_isUsingWheelchair)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_19;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_10;
    }
LABEL_19:
    v5 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
    goto LABEL_19;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_19;
    v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_isUsingWheelchair;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_latestSupportedVersion;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_minimumSupportedVersion;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_latestSupportedVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_isUsingWheelchair = *((_BYTE *)v4 + 24);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_minimumSupportedVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (BOOL)isUsingWheelchair
{
  return self->_isUsingWheelchair;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

@end
