@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort

- (double)rawClicks
{
  return self->_rawClicks;
}

- (double)impressions
{
  return self->_impressions;
}

- (double)clicks
{
  return self->_clicks;
}

- (BOOL)hasRawClicks
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 10) = self->_type;
    *((_BYTE *)result + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_clicks;
  *((_BYTE *)result + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_impressions;
  *((_BYTE *)result + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 4) = self->_timestamp;
  *((_BYTE *)result + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_rawClicks;
  *((_BYTE *)result + 44) |= 4u;
  return result;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Default");
  if (a3 == 1)
  {
    v3 = CFSTR("Paid");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Paid"));

  return v4;
}

- (void)setClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clicks = a3;
}

- (void)setHasClicks:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClicks
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setImpressions:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_impressions = a3;
}

- (void)setHasImpressions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasImpressions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRawClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rawClicks = a3;
}

- (void)setHasRawClicks:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort;
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int type;
  __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v6 = CFSTR("Paid");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("Default");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clicks);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("clicks"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timestamp);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_12;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_impressions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("impressions"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_rawClicks);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("raw_clicks"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_clicks;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *((_QWORD *)v4 + 4) = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_impressions;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_rawClicks;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_7:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_clicks != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_impressions != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_rawClicks != *((double *)v4 + 3))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double clicks;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double impressions;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  double rawClicks;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  clicks = self->_clicks;
  v6 = -clicks;
  if (clicks >= 0.0)
    v6 = self->_clicks;
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
LABEL_11:
  if ((has & 2) != 0)
  {
    impressions = self->_impressions;
    v12 = -impressions;
    if (impressions >= 0.0)
      v12 = self->_impressions;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 8) != 0)
  {
    v15 = 2654435761 * self->_timestamp;
    if ((has & 4) != 0)
      goto LABEL_21;
LABEL_26:
    v20 = 0;
    return v9 ^ v4 ^ v10 ^ v15 ^ v20;
  }
  v15 = 0;
  if ((has & 4) == 0)
    goto LABEL_26;
LABEL_21:
  rawClicks = self->_rawClicks;
  v17 = -rawClicks;
  if (rawClicks >= 0.0)
    v17 = self->_rawClicks;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0)
      v20 += (unint64_t)v19;
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
  return v9 ^ v4 ^ v10 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_clicks = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_impressions = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    self->_rawClicks = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:

}

- (int64_t)timestamp
{
  return self->_timestamp;
}

@end
