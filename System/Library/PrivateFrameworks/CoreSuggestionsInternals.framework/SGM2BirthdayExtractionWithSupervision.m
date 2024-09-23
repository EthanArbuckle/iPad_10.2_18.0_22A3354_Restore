@implementation SGM2BirthdayExtractionWithSupervision

- (void)setDateIsCorrect:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dateIsCorrect = a3;
}

- (void)setHasDateIsCorrect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDateIsCorrect
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsFromCongratulation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isFromCongratulation = a3;
}

- (void)setHasIsFromCongratulation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsFromCongratulation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModelVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDidRegexTrigger:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_didRegexTrigger = a3;
}

- (void)setHasDidRegexTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDidRegexTrigger
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)offset
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_offset;
  else
    return 0;
}

- (void)setOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_offset = a3;
}

- (void)setHasOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOffset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)offsetAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7DB16F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOffset:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdayWrongDay")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdaySameDay")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdayPreviousDay")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdayNextDay")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdayPreviousWeek")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2BirthdayNextWeek")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDidResponseKitTrigger:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_didResponseKitTrigger = a3;
}

- (void)setHasDidResponseKitTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidResponseKitTrigger
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
  v8.super_class = (Class)SGM2BirthdayExtractionWithSupervision;
  -[SGM2BirthdayExtractionWithSupervision description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2BirthdayExtractionWithSupervision dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;
  void *v10;
  uint64_t offset;
  __CFString *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dateIsCorrect);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dateIsCorrect"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFromCongratulation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isFromCongratulation"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("modelVersion"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    offset = self->_offset;
    if (offset >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_offset);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E7DB16F8[offset];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("offset"));

    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    return v3;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didRegexTrigger);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("didRegexTrigger"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didResponseKitTrigger);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("didResponseKitTrigger"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2BirthdayExtractionWithSupervisionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[16] = self->_dateIsCorrect;
    v4[20] |= 4u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = self->_isFromCongratulation;
  v4[20] |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 2) = self->_modelVersion;
  v4[20] |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 3) = self->_offset;
    v4[20] |= 2u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v4[17] = self->_didRegexTrigger;
  v4[20] |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v4[18] = self->_didResponseKitTrigger;
    v4[20] |= 0x10u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 16) = self->_dateIsCorrect;
    *((_BYTE *)result + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 19) = self->_isFromCongratulation;
  *((_BYTE *)result + 20) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_modelVersion;
  *((_BYTE *)result + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 17) = self->_didRegexTrigger;
  *((_BYTE *)result + 20) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_offset;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_7:
  *((_BYTE *)result + 18) = self->_didResponseKitTrigger;
  *((_BYTE *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_38;
    if (self->_dateIsCorrect)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x20) == 0)
      goto LABEL_38;
    if (self->_isFromCongratulation)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_modelVersion != *((_DWORD *)v4 + 2))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_38;
    if (self->_didRegexTrigger)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_offset != *((_DWORD *)v4 + 3))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_38;
  }
  v5 = (*((_BYTE *)v4 + 20) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
    {
      if (self->_didResponseKitTrigger)
      {
        if (!*((_BYTE *)v4 + 18))
          goto LABEL_38;
      }
      else if (*((_BYTE *)v4 + 18))
      {
        goto LABEL_38;
      }
      v5 = 1;
      goto LABEL_39;
    }
LABEL_38:
    v5 = 0;
  }
LABEL_39:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761 * self->_dateIsCorrect;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isFromCongratulation;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_modelVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_didRegexTrigger;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_offset;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_didResponseKitTrigger;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_dateIsCorrect = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_isFromCongratulation = *((_BYTE *)v4 + 19);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_modelVersion = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_offset = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 20) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_didRegexTrigger = *((_BYTE *)v4 + 17);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    self->_didResponseKitTrigger = *((_BYTE *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_8:

}

- (BOOL)dateIsCorrect
{
  return self->_dateIsCorrect;
}

- (BOOL)isFromCongratulation
{
  return self->_isFromCongratulation;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)didRegexTrigger
{
  return self->_didRegexTrigger;
}

- (BOOL)didResponseKitTrigger
{
  return self->_didResponseKitTrigger;
}

@end
