@implementation NTPBBinningConfig

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasEnabled
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setEvaluationFrequency:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_evaluationFrequency = a3;
}

- (void)setHasEvaluationFrequency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvaluationFrequency
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHistoryLength:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_historyLength = a3;
}

- (void)setHasHistoryLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHistoryLength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIncreaseConsumptionThreshold:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_increaseConsumptionThreshold = a3;
}

- (void)setHasIncreaseConsumptionThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIncreaseConsumptionThreshold
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDecreaseConsumptionThreshold:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_decreaseConsumptionThreshold = a3;
}

- (void)setHasDecreaseConsumptionThreshold:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecreaseConsumptionThreshold
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinimumArticleCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minimumArticleCount = a3;
}

- (void)setHasMinimumArticleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumArticleCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)defaultTopicBin
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_defaultTopicBin;
  else
    return 0;
}

- (void)setDefaultTopicBin:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_defaultTopicBin = a3;
}

- (void)setHasDefaultTopicBin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasDefaultTopicBin
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)defaultChannelBin
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_defaultChannelBin;
  else
    return 0;
}

- (void)setDefaultChannelBin:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_defaultChannelBin = a3;
}

- (void)setHasDefaultChannelBin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDefaultChannelBin
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
  v8.super_class = (Class)NTPBBinningConfig;
  -[NTPBBinningConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBBinningConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if (has < 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("enabled"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_evaluationFrequency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("evaluation_frequency"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_historyLength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("history_length"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_increaseConsumptionThreshold);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("increase_consumption_threshold"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_decreaseConsumptionThreshold);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("decrease_consumption_threshold"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_defaultTopicBin);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("default_topic_bin"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumArticleCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("minimum_article_count"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_defaultChannelBin);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("default_channel_bin"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBinningConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if (has < 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if (has < 0)
  {
    *((_BYTE *)result + 56) = self->_enabled;
    *((_BYTE *)result + 60) |= 0x80u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_evaluationFrequency;
  *((_BYTE *)result + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 3) = self->_historyLength;
  *((_BYTE *)result + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_increaseConsumptionThreshold;
  *((_BYTE *)result + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_decreaseConsumptionThreshold;
  *((_BYTE *)result + 60) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 5) = self->_minimumArticleCount;
  *((_BYTE *)result + 60) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 13) = self->_defaultTopicBin;
  *((_BYTE *)result + 60) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 12) = self->_defaultChannelBin;
  *((_BYTE *)result + 60) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $930619314BB491B6042BE465C0200C5C has;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x80) == 0)
      goto LABEL_4;
LABEL_44:
    v6 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 60) & 0x80) == 0)
    goto LABEL_44;
  if (self->_enabled)
  {
    if (!*((_BYTE *)v4 + 56))
      goto LABEL_44;
  }
  else if (*((_BYTE *)v4 + 56))
  {
    goto LABEL_44;
  }
LABEL_4:
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_evaluationFrequency != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_historyLength != *((_QWORD *)v4 + 3))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_increaseConsumptionThreshold != *((double *)v4 + 4))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_decreaseConsumptionThreshold != *((double *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_minimumArticleCount != *((_QWORD *)v4 + 5))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x40) == 0 || self->_defaultTopicBin != *((_DWORD *)v4 + 13))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  v6 = (*((_BYTE *)v4 + 60) & 0x20) == 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0 || self->_defaultChannelBin != *((_DWORD *)v4 + 12))
      goto LABEL_44;
    v6 = 1;
  }
LABEL_45:

  return v6;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double increaseConsumptionThreshold;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double decreaseConsumptionThreshold;
  double v14;
  long double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  has = (char)self->_has;
  if (has < 0)
  {
    v4 = 2654435761 * self->_enabled;
    if ((*(_BYTE *)&self->_has & 2) == 0)
    {
LABEL_3:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
  }
  v5 = 2654435761 * self->_evaluationFrequency;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_historyLength;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  increaseConsumptionThreshold = self->_increaseConsumptionThreshold;
  v8 = -increaseConsumptionThreshold;
  if (increaseConsumptionThreshold >= 0.0)
    v8 = self->_increaseConsumptionThreshold;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 1) != 0)
  {
    decreaseConsumptionThreshold = self->_decreaseConsumptionThreshold;
    v14 = -decreaseConsumptionThreshold;
    if (decreaseConsumptionThreshold >= 0.0)
      v14 = self->_decreaseConsumptionThreshold;
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
  if ((has & 0x10) == 0)
  {
    v17 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_25;
LABEL_28:
    v18 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_26;
LABEL_29:
    v19 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19;
  }
  v17 = 2654435761 * self->_minimumArticleCount;
  if ((has & 0x40) == 0)
    goto LABEL_28;
LABEL_25:
  v18 = 2654435761 * self->_defaultTopicBin;
  if ((has & 0x20) == 0)
    goto LABEL_29;
LABEL_26:
  v19 = 2654435761 * self->_defaultChannelBin;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 60);
  if (v5 < 0)
  {
    self->_enabled = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x80u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluationFrequency = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_historyLength = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_increaseConsumptionThreshold = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_decreaseConsumptionThreshold = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
LABEL_17:
    self->_defaultTopicBin = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v4 + 60) & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_minimumArticleCount = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 0x40) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 0x20) != 0)
  {
LABEL_9:
    self->_defaultChannelBin = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_10:

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)evaluationFrequency
{
  return self->_evaluationFrequency;
}

- (int64_t)historyLength
{
  return self->_historyLength;
}

- (double)increaseConsumptionThreshold
{
  return self->_increaseConsumptionThreshold;
}

- (double)decreaseConsumptionThreshold
{
  return self->_decreaseConsumptionThreshold;
}

- (int64_t)minimumArticleCount
{
  return self->_minimumArticleCount;
}

@end
