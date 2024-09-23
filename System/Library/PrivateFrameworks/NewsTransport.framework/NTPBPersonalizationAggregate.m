@implementation NTPBPersonalizationAggregate

- (double)impressions
{
  return self->_impressions;
}

- (double)clicks
{
  return self->_clicks;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationAggregateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizationAggregate setFeatureKey:](self, "setFeatureKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregate;
  -[NTPBPersonalizationAggregate dealloc](&v3, sel_dealloc);
}

- (void)setFeatureKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)featureKey
{
  return self->_featureKey;
}

- (void)setImpressions:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_impressions = a3;
}

- (void)setClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clicks = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregate;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizationAggregate description](&v3, sel_description), -[NTPBPersonalizationAggregate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (BOOL)hasFeatureKey
{
  return self->_featureKey != 0;
}

- (void)setHasClicks:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClicks
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasImpressions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasImpressions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEventCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(unint64_t)a3
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

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *featureKey;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  featureKey = self->_featureKey;
  if (featureKey)
    objc_msgSend(v3, "setObject:forKey:", featureKey, CFSTR("feature_key"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clicks), CFSTR("clicks"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_eventCount), CFSTR("event_count"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_impressions), CFSTR("impressions"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
LABEL_7:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  return v4;
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_featureKey)
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
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint64Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_featureKey, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_clicks;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 16) = self->_eventCount;
      *(_BYTE *)(v5 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_impressions;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *featureKey;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    featureKey = self->_featureKey;
    if (!((unint64_t)featureKey | *((_QWORD *)a3 + 5))
      || (v5 = -[NSString isEqual:](featureKey, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_clicks != *((double *)a3 + 1))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 48) & 1) != 0)
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(_BYTE *)&self->_has & 4) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_impressions != *((double *)a3 + 3))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 48) & 4) != 0)
      {
        goto LABEL_23;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_eventCount != *((_QWORD *)a3 + 2))
          goto LABEL_23;
      }
      else if ((*((_BYTE *)a3 + 48) & 2) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 8) == 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
      {
        if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
          goto LABEL_23;
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
  double impressions;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;

  v3 = -[NSString hash](self->_featureKey, "hash");
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
  if ((has & 2) != 0)
  {
    v15 = 2654435761u * self->_eventCount;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v16 = 0;
    return v5 ^ v3 ^ v10 ^ v15 ^ v16;
  }
  v15 = 0;
  if ((has & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v16 = 2654435761u * self->_timestamp;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 5))
    -[NTPBPersonalizationAggregate setFeatureKey:](self, "setFeatureKey:");
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 1) != 0)
  {
    self->_clicks = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_impressions = *((double *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  self->_eventCount = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 48) & 8) == 0)
    return;
LABEL_7:
  self->_timestamp = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
}

@end
