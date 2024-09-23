@implementation HighlightAlertCodableState

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasEventUUID
{
  return self->_eventUUID != 0;
}

- (void)setEventDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAcknowledged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_acknowledged = a3;
}

- (void)setHasAcknowledged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAcknowledged
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDismissed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_dismissed = a3;
}

- (void)setHasDismissed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDismissed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)HighlightAlertCodableState;
  -[HighlightAlertCodableState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HighlightAlertCodableState dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *eventUUID;
  char v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_latestSupportedVersion);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumSupportedVersion);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("minimumSupportedVersion"));

  }
  eventUUID = self->_eventUUID;
  if (eventUUID)
    objc_msgSend(v3, "setObject:forKey:", eventUUID, CFSTR("eventUUID"));
  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_eventDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("eventDate"));

    v8 = (char)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_acknowledged);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("acknowledged"));

      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        return v3;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_expirationDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("expirationDate"));

  v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v8 & 0x20) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_dismissed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dismissed"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HighlightAlertCodableStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_eventUUID)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v5 = (char)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v5 & 0x20) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[4] = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 52) |= 8u;
  }
  if (self->_eventUUID)
  {
    v7 = v4;
    objc_msgSend(v4, "setEventUUID:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_eventDate;
    *((_BYTE *)v4 + 52) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      *((_BYTE *)v4 + 48) = self->_acknowledged;
      *((_BYTE *)v4 + 52) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = *(_QWORD *)&self->_expirationDate;
  *((_BYTE *)v4 + 52) |= 2u;
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v6 & 0x20) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 49) = self->_dismissed;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_eventUUID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_eventDate;
    *(_BYTE *)(v6 + 52) |= 1u;
    v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 0x10) == 0)
        goto LABEL_8;
LABEL_13:
      *(_BYTE *)(v6 + 48) = self->_acknowledged;
      *(_BYTE *)(v6 + 52) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 0x20) == 0)
        return (id)v6;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 16) = self->_expirationDate;
  *(_BYTE *)(v6 + 52) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 0x10) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v10 & 0x20) != 0)
  {
LABEL_9:
    *(_BYTE *)(v6 + 49) = self->_dismissed;
    *(_BYTE *)(v6 + 52) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *eventUUID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 3))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_35;
  }
  eventUUID = self->_eventUUID;
  if ((unint64_t)eventUUID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](eventUUID, "isEqual:"))
      goto LABEL_35;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_eventDate != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_expirationDate != *((double *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_35;
    if (self->_acknowledged)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  v7 = (*((_BYTE *)v4 + 52) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x20) != 0)
    {
      if (self->_dismissed)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_35;
      }
      else if (*((_BYTE *)v4 + 49))
      {
        goto LABEL_35;
      }
      v7 = 1;
      goto LABEL_36;
    }
LABEL_35:
    v7 = 0;
  }
LABEL_36:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double eventDate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double expirationDate;
  double v14;
  long double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_minimumSupportedVersion;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_eventUUID, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    eventDate = self->_eventDate;
    v9 = -eventDate;
    if (eventDate >= 0.0)
      v9 = self->_eventDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
  {
    expirationDate = self->_expirationDate;
    v14 = -expirationDate;
    if (expirationDate >= 0.0)
      v14 = self->_expirationDate;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v17 = 2654435761 * self->_acknowledged;
    if ((has & 0x20) != 0)
      goto LABEL_24;
LABEL_26:
    v18 = 0;
    return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v5;
  }
  v17 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_26;
LABEL_24:
  v18 = 2654435761 * self->_dismissed;
  return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_latestSupportedVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 8) != 0)
  {
    self->_minimumSupportedVersion = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    v7 = v4;
    -[HighlightAlertCodableState setEventUUID:](self, "setEventUUID:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 1) != 0)
  {
    self->_eventDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 52);
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0)
        goto LABEL_10;
LABEL_15:
      self->_acknowledged = *((_BYTE *)v4 + 48);
      *(_BYTE *)&self->_has |= 0x10u;
      if ((*((_BYTE *)v4 + 52) & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_expirationDate = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 0x10) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v6 & 0x20) != 0)
  {
LABEL_11:
    self->_dismissed = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_12:

}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
  objc_storeStrong((id *)&self->_eventUUID, a3);
}

- (double)eventDate
{
  return self->_eventDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventUUID, 0);
}

@end
