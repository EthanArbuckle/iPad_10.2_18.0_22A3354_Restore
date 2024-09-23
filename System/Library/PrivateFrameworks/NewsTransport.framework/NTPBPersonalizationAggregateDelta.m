@implementation NTPBPersonalizationAggregateDelta

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizationAggregateDelta setFeatureKey:](self, "setFeatureKey:", 0);
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregateDelta;
  -[NTPBPersonalizationAggregateDelta dealloc](&v3, sel_dealloc);
}

- (BOOL)hasFeatureKey
{
  return self->_featureKey != 0;
}

- (void)setDefaultClicks:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_defaultClicks = a3;
}

- (void)setHasDefaultClicks:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefaultClicks
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDefaultImpressions:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_defaultImpressions = a3;
}

- (void)setHasDefaultImpressions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultImpressions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)eventsCount
{
  return self->_events.count;
}

- (unsigned)events
{
  return self->_events.list;
}

- (void)clearEvents
{
  PBRepeatedUInt32Clear();
}

- (void)addEvents:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)eventsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_events;
  unint64_t count;

  p_events = &self->_events;
  count = self->_events.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_events->list[a3];
}

- (void)setEvents:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setImpressionBias:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_impressionBias = a3;
}

- (void)setHasImpressionBias:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasImpressionBias
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGroupBias:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_groupBias = a3;
}

- (void)setHasGroupBias:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGroupBias
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregateDelta;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizationAggregateDelta description](&v3, sel_description), -[NTPBPersonalizationAggregateDelta dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *featureKey;
  char has;
  char v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  featureKey = self->_featureKey;
  if (featureKey)
    objc_msgSend(v3, "setObject:forKey:", featureKey, CFSTR("feature_key"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_defaultClicks), CFSTR("default_clicks"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_defaultImpressions), CFSTR("default_impressions"));
  objc_msgSend(v4, "setObject:forKey:", PBRepeatedUInt32NSArray(), CFSTR("events"));
  v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_impressionBias), CFSTR("impression_bias"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_10;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 4) != 0)
LABEL_10:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_groupBias), CFSTR("group_bias"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationAggregateDeltaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  unint64_t v5;
  char v6;

  if (self->_featureKey)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_events.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_events.count);
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_12:
      if ((v6 & 4) == 0)
        return;
LABEL_16:
      PBDataWriterWriteDoubleField();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;
  char v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 72) = -[NSString copyWithZone:](self->_featureKey, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_defaultClicks;
    *(_BYTE *)(v5 + 80) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_defaultImpressions;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  PBRepeatedUInt32Copy();
  v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    *(double *)(v5 + 56) = self->_impressionBias;
    *(_BYTE *)(v5 + 80) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_8;
  }
  *(_QWORD *)(v5 + 64) = self->_timestamp;
  *(_BYTE *)(v5 + 80) |= 0x10u;
  v7 = (char)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v7 & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 48) = self->_groupBias;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSString *featureKey;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    featureKey = self->_featureKey;
    if (!((unint64_t)featureKey | *((_QWORD *)a3 + 9))
      || (IsEqual = -[NSString isEqual:](featureKey, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 80) & 1) == 0 || self->_defaultClicks != *((double *)a3 + 4))
          goto LABEL_29;
      }
      else if ((*((_BYTE *)a3 + 80) & 1) != 0)
      {
LABEL_29:
        LOBYTE(IsEqual) = 0;
        return IsEqual;
      }
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 80) & 2) == 0 || self->_defaultImpressions != *((double *)a3 + 5))
          goto LABEL_29;
      }
      else if ((*((_BYTE *)a3 + 80) & 2) != 0)
      {
        goto LABEL_29;
      }
      IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        if ((*(_BYTE *)&self->_has & 0x10) != 0)
        {
          if ((*((_BYTE *)a3 + 80) & 0x10) == 0 || self->_timestamp != *((_QWORD *)a3 + 8))
            goto LABEL_29;
        }
        else if ((*((_BYTE *)a3 + 80) & 0x10) != 0)
        {
          goto LABEL_29;
        }
        if ((*(_BYTE *)&self->_has & 8) != 0)
        {
          if ((*((_BYTE *)a3 + 80) & 8) == 0 || self->_impressionBias != *((double *)a3 + 7))
            goto LABEL_29;
        }
        else if ((*((_BYTE *)a3 + 80) & 8) != 0)
        {
          goto LABEL_29;
        }
        LOBYTE(IsEqual) = (*((_BYTE *)a3 + 80) & 4) == 0;
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 80) & 4) == 0 || self->_groupBias != *((double *)a3 + 6))
            goto LABEL_29;
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double defaultClicks;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double defaultImpressions;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  double impressionBias;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  double groupBias;
  double v25;
  long double v26;
  double v27;

  v3 = -[NSString hash](self->_featureKey, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    defaultClicks = self->_defaultClicks;
    v7 = -defaultClicks;
    if (defaultClicks >= 0.0)
      v7 = self->_defaultClicks;
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
  if ((has & 2) != 0)
  {
    defaultImpressions = self->_defaultImpressions;
    v12 = -defaultImpressions;
    if (defaultImpressions >= 0.0)
      v12 = self->_defaultImpressions;
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
  v15 = PBRepeatedUInt32Hash();
  v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    v17 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_19;
LABEL_24:
    v22 = 0;
    goto LABEL_27;
  }
  v17 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_24;
LABEL_19:
  impressionBias = self->_impressionBias;
  v19 = -impressionBias;
  if (impressionBias >= 0.0)
    v19 = self->_impressionBias;
  v20 = floor(v19 + 0.5);
  v21 = (v19 - v20) * 1.84467441e19;
  v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0)
      v22 += (unint64_t)v21;
  }
  else
  {
    v22 -= (unint64_t)fabs(v21);
  }
LABEL_27:
  if ((v16 & 4) != 0)
  {
    groupBias = self->_groupBias;
    v25 = -groupBias;
    if (groupBias >= 0.0)
      v25 = self->_groupBias;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;

  if (*((_QWORD *)a3 + 9))
    -[NTPBPersonalizationAggregateDelta setFeatureKey:](self, "setFeatureKey:");
  v5 = *((_BYTE *)a3 + 80);
  if ((v5 & 1) != 0)
  {
    self->_defaultClicks = *((double *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_defaultImpressions = *((double *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = objc_msgSend(a3, "eventsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[NTPBPersonalizationAggregateDelta addEvents:](self, "addEvents:", objc_msgSend(a3, "eventsAtIndex:", i));
  }
  v9 = *((_BYTE *)a3 + 80);
  if ((v9 & 0x10) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 0x10u;
    v9 = *((_BYTE *)a3 + 80);
    if ((v9 & 8) == 0)
    {
LABEL_12:
      if ((v9 & 4) == 0)
        return;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 80) & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_impressionBias = *((double *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 80) & 4) == 0)
    return;
LABEL_13:
  self->_groupBias = *((double *)a3 + 6);
  *(_BYTE *)&self->_has |= 4u;
}

- (NSString)featureKey
{
  return self->_featureKey;
}

- (void)setFeatureKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (double)defaultClicks
{
  return self->_defaultClicks;
}

- (double)defaultImpressions
{
  return self->_defaultImpressions;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)impressionBias
{
  return self->_impressionBias;
}

- (double)groupBias
{
  return self->_groupBias;
}

@end
