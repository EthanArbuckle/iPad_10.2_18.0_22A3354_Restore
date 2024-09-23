@implementation NTPBTagTodaySectionSpecificConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBTagTodaySectionSpecificConfig setTagID:](self, "setTagID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagTodaySectionSpecificConfig;
  -[NTPBTagTodaySectionSpecificConfig dealloc](&v3, sel_dealloc);
}

- (void)setCutoffTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cutoffTime = a3;
}

- (void)setHasCutoffTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCutoffTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_headlinesPerFeedFetchCount = a3;
}

- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHeadlinesPerFeedFetchCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)fetchingBin
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_fetchingBin;
  else
    return 0;
}

- (void)setFetchingBin:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fetchingBin = a3;
}

- (void)setHasFetchingBin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFetchingBin
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (void)setMinimumUpdateInterval:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minimumUpdateInterval = a3;
}

- (void)setHasMinimumUpdateInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTagTodaySectionSpecificConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTagTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBTagTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *tagID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cutoffTime), CFSTR("cutoff_time"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_headlinesPerFeedFetchCount), CFSTR("headlines_per_feed_fetch_count"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fetchingBin), CFSTR("fetching_bin"));
LABEL_5:
  tagID = self->_tagID;
  if (tagID)
    objc_msgSend(v3, "setObject:forKey:", tagID, CFSTR("tag_ID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minimumUpdateInterval), CFSTR("minimum_update_interval"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_tagID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_cutoffTime;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_headlinesPerFeedFetchCount;
  *(_BYTE *)(v5 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_fetchingBin;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_tagID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_minimumUpdateInterval;
    *(_BYTE *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *tagID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_cutoffTime != *((_QWORD *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_headlinesPerFeedFetchCount != *((_QWORD *)a3 + 2))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_fetchingBin != *((_DWORD *)a3 + 8))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    tagID = self->_tagID;
    if ((unint64_t)tagID | *((_QWORD *)a3 + 5))
    {
      v5 = -[NSString isEqual:](tagID, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 48) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_minimumUpdateInterval != *((_QWORD *)a3 + 3))
        goto LABEL_24;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_cutoffTime;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_headlinesPerFeedFetchCount;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fetchingBin;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_tagID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761u * self->_minimumUpdateInterval;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 48);
  if ((v5 & 1) != 0)
  {
    self->_cutoffTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_headlinesPerFeedFetchCount = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
LABEL_4:
    self->_fetchingBin = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 5))
    -[NTPBTagTodaySectionSpecificConfig setTagID:](self, "setTagID:");
  if ((*((_BYTE *)a3 + 48) & 4) != 0)
  {
    self->_minimumUpdateInterval = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
}

- (unint64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (unint64_t)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

@end
