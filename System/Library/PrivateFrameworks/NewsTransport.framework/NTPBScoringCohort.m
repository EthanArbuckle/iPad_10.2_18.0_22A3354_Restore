@implementation NTPBScoringCohort

- (void)dealloc
{
  objc_super v3;

  -[NTPBScoringCohort setIdentifier:](self, "setIdentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoringCohort;
  -[NTPBScoringCohort dealloc](&v3, sel_dealloc);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setRawClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_rawClicks = a3;
}

- (void)setImpressions:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_impressions = a3;
}

- (void)setClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clicks = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setHasClicks:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClicks
{
  return *(_BYTE *)&self->_has & 1;
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

- (BOOL)hasRawClicks
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBScoringCohort;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBScoringCohort description](&v3, sel_description), -[NTPBScoringCohort dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_rawClicks), CFSTR("raw_clicks"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v4;
    goto LABEL_6;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clicks), CFSTR("clicks"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_impressions), CFSTR("impressions"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoringCohortReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        return;
LABEL_9:
      PBDataWriterWriteDoubleField();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 24) = self->_rawClicks;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_clicks;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_impressions;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_clicks != *((double *)a3 + 1))
          goto LABEL_18;
      }
      else if ((*((_BYTE *)a3 + 40) & 1) != 0)
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_rawClicks != *((double *)a3 + 3))
          goto LABEL_18;
      }
      else if ((*((_BYTE *)a3 + 40) & 4) != 0)
      {
        goto LABEL_18;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 40) & 2) == 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_impressions != *((double *)a3 + 2))
          goto LABEL_18;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double clicks;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double rawClicks;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double impressions;
  double v17;
  long double v18;
  double v19;

  v3 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    clicks = self->_clicks;
    v7 = -clicks;
    if (clicks >= 0.0)
      v7 = self->_clicks;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 4) != 0)
  {
    rawClicks = self->_rawClicks;
    v12 = -rawClicks;
    if (rawClicks >= 0.0)
      v12 = self->_rawClicks;
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
  if ((has & 2) != 0)
  {
    impressions = self->_impressions;
    v17 = -impressions;
    if (impressions >= 0.0)
      v17 = self->_impressions;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 4))
    -[NTPBScoringCohort setIdentifier:](self, "setIdentifier:");
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) != 0)
  {
    self->_clicks = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        return;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_rawClicks = *((double *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 40) & 2) == 0)
    return;
LABEL_6:
  self->_impressions = *((double *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)clicks
{
  return self->_clicks;
}

- (double)rawClicks
{
  return self->_rawClicks;
}

- (double)impressions
{
  return self->_impressions;
}

@end
