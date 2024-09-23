@implementation NTPBIAdConfig

- (void)setSegmentsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_segmentsEnabled = a3;
}

- (void)setHasSegmentsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSegmentsEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSegmentsThreshold:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_segmentsThreshold = a3;
}

- (void)setHasSegmentsThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSegmentsThreshold
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSegmentsSubmissionFrequency:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_segmentsSubmissionFrequency = a3;
}

- (void)setHasSegmentsSubmissionFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSegmentsSubmissionFrequency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSegmentsHistoryWindowInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_segmentsHistoryWindowInterval = a3;
}

- (void)setHasSegmentsHistoryWindowInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSegmentsHistoryWindowInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSegmentsMinimumArticleCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_segmentsMinimumArticleCount = a3;
}

- (void)setHasSegmentsMinimumArticleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSegmentsMinimumArticleCount
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBIAdConfig;
  -[NTPBIAdConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBIAdConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_segmentsEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("segments_enabled"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_segmentsThreshold);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("segments_threshold"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_segmentsHistoryWindowInterval);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("segments_history_window_interval"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_segmentsSubmissionFrequency);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("segments_submission_frequency"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_segmentsMinimumArticleCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("segments_minimum_article_count"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIAdConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt64Field();
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)result + 40) = self->_segmentsEnabled;
    *((_BYTE *)result + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_segmentsThreshold;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 3) = self->_segmentsSubmissionFrequency;
  *((_BYTE *)result + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 1) = self->_segmentsHistoryWindowInterval;
  *((_BYTE *)result + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 2) = self->_segmentsMinimumArticleCount;
  *((_BYTE *)result + 44) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    {
      if (self->_segmentsEnabled)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_29;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_10;
    }
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    goto LABEL_29;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_segmentsThreshold != *((double *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_segmentsSubmissionFrequency != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_segmentsHistoryWindowInterval != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_29;
  }
  v5 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_segmentsMinimumArticleCount != *((_QWORD *)v4 + 2))
      goto LABEL_29;
    v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double segmentsThreshold;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4 = 2654435761 * self->_segmentsEnabled;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_3:
  segmentsThreshold = self->_segmentsThreshold;
  v6 = -segmentsThreshold;
  if (segmentsThreshold >= 0.0)
    v6 = self->_segmentsThreshold;
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
  if ((has & 4) == 0)
  {
    v10 = 0;
    if ((has & 1) != 0)
      goto LABEL_13;
LABEL_16:
    v11 = 0;
    if ((has & 2) != 0)
      goto LABEL_14;
LABEL_17:
    v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  v10 = 2654435761 * self->_segmentsSubmissionFrequency;
  if ((has & 1) == 0)
    goto LABEL_16;
LABEL_13:
  v11 = 2654435761 * self->_segmentsHistoryWindowInterval;
  if ((has & 2) == 0)
    goto LABEL_17;
LABEL_14:
  v12 = 2654435761 * self->_segmentsMinimumArticleCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_segmentsEnabled = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_segmentsThreshold = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
LABEL_11:
    self->_segmentsHistoryWindowInterval = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_segmentsSubmissionFrequency = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_segmentsMinimumArticleCount = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (BOOL)segmentsEnabled
{
  return self->_segmentsEnabled;
}

- (double)segmentsThreshold
{
  return self->_segmentsThreshold;
}

- (int64_t)segmentsSubmissionFrequency
{
  return self->_segmentsSubmissionFrequency;
}

- (int64_t)segmentsHistoryWindowInterval
{
  return self->_segmentsHistoryWindowInterval;
}

- (int64_t)segmentsMinimumArticleCount
{
  return self->_segmentsMinimumArticleCount;
}

@end
