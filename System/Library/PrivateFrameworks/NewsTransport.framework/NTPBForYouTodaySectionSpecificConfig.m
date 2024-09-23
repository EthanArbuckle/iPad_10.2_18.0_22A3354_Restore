@implementation NTPBForYouTodaySectionSpecificConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBForYouTodaySectionSpecificConfig setLocalNewsPromotedArticle:](self, "setLocalNewsPromotedArticle:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouTodaySectionSpecificConfig;
  -[NTPBForYouTodaySectionSpecificConfig dealloc](&v3, sel_dealloc);
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

- (void)setSubscriptionsFetchCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subscriptionsFetchCount = a3;
}

- (void)setHasSubscriptionsFetchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubscriptionsFetchCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_headlinesPerFeedFetchCount = a3;
}

- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeadlinesPerFeedFetchCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)fetchingBin
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_fetchingBin;
  else
    return 0;
}

- (void)setFetchingBin:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_fetchingBin = a3;
}

- (void)setHasFetchingBin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasFetchingBin
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMinimumUpdateInterval:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minimumUpdateInterval = a3;
}

- (void)setHasMinimumUpdateInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasLocalNewsPromotedArticle
{
  return self->_localNewsPromotedArticle != 0;
}

- (void)setLocalNewsPromotionIndex:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_localNewsPromotionIndex = a3;
}

- (void)setHasLocalNewsPromotionIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocalNewsPromotionIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFeedMaxCount:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feedMaxCount = a3;
}

- (void)setHasFeedMaxCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedMaxCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouTodaySectionSpecificConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBForYouTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBForYouTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NTPBTodaySectionConfigArticle *localNewsPromotedArticle;
  char v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cutoffTime), CFSTR("cutoff_time"));
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_subscriptionsFetchCount), CFSTR("subscriptions_fetch_count"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_headlinesPerFeedFetchCount), CFSTR("headlines_per_feed_fetch_count"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fetchingBin), CFSTR("fetching_bin"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minimumUpdateInterval), CFSTR("minimum_update_interval"));
LABEL_7:
  localNewsPromotedArticle = self->_localNewsPromotedArticle;
  if (localNewsPromotedArticle)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBTodaySectionConfigArticle dictionaryRepresentation](localNewsPromotedArticle, "dictionaryRepresentation"), CFSTR("local_news_promoted_article"));
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_localNewsPromotionIndex), CFSTR("local_news_promotion_index"));
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_feedMaxCount), CFSTR("feed_max_count"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBForYouTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:
  if (self->_localNewsPromotedArticle)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_cutoffTime;
    *(_BYTE *)(v5 + 72) |= 1u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 48) = self->_subscriptionsFetchCount;
  *(_BYTE *)(v5 + 72) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *(_QWORD *)(v5 + 24) = self->_headlinesPerFeedFetchCount;
  *(_BYTE *)(v5 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  *(_DWORD *)(v5 + 56) = self->_fetchingBin;
  *(_BYTE *)(v5 + 72) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_QWORD *)(v5 + 40) = self->_minimumUpdateInterval;
    *(_BYTE *)(v5 + 72) |= 0x10u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 64) = -[NTPBTodaySectionConfigArticle copyWithZone:](self->_localNewsPromotedArticle, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_localNewsPromotionIndex;
    *(_BYTE *)(v6 + 72) |= 8u;
    v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_feedMaxCount;
    *(_BYTE *)(v6 + 72) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NTPBTodaySectionConfigArticle *localNewsPromotedArticle;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_cutoffTime != *((_QWORD *)a3 + 1))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x20) == 0 || self->_subscriptionsFetchCount != *((_QWORD *)a3 + 6))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_headlinesPerFeedFetchCount != *((_QWORD *)a3 + 3))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 4) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x40) == 0 || self->_fetchingBin != *((_DWORD *)a3 + 14))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_39;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_minimumUpdateInterval != *((_QWORD *)a3 + 5))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    localNewsPromotedArticle = self->_localNewsPromotedArticle;
    if ((unint64_t)localNewsPromotedArticle | *((_QWORD *)a3 + 8))
    {
      v5 = -[NTPBTodaySectionConfigArticle isEqual:](localNewsPromotedArticle, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_localNewsPromotionIndex != *((_QWORD *)a3 + 4))
        goto LABEL_39;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 72) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_feedMaxCount != *((_QWORD *)a3 + 2))
        goto LABEL_39;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_cutoffTime;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_subscriptionsFetchCount;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_headlinesPerFeedFetchCount;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_fetchingBin;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761u * self->_minimumUpdateInterval;
    goto LABEL_12;
  }
LABEL_11:
  v7 = 0;
LABEL_12:
  v8 = -[NTPBTodaySectionConfigArticle hash](self->_localNewsPromotedArticle, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v9 = 2654435761u * self->_localNewsPromotionIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_14:
  v10 = 2654435761u * self->_feedMaxCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  NTPBTodaySectionConfigArticle *localNewsPromotedArticle;
  uint64_t v7;
  char v8;

  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 1) != 0)
  {
    self->_cutoffTime = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 72);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_subscriptionsFetchCount = *((_QWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_headlinesPerFeedFetchCount = *((_QWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  self->_fetchingBin = *((_DWORD *)a3 + 14);
  *(_BYTE *)&self->_has |= 0x40u;
  if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
  {
LABEL_6:
    self->_minimumUpdateInterval = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:
  localNewsPromotedArticle = self->_localNewsPromotedArticle;
  v7 = *((_QWORD *)a3 + 8);
  if (localNewsPromotedArticle)
  {
    if (v7)
      -[NTPBTodaySectionConfigArticle mergeFrom:](localNewsPromotedArticle, "mergeFrom:");
  }
  else if (v7)
  {
    -[NTPBForYouTodaySectionSpecificConfig setLocalNewsPromotedArticle:](self, "setLocalNewsPromotedArticle:");
  }
  v8 = *((_BYTE *)a3 + 72);
  if ((v8 & 8) != 0)
  {
    self->_localNewsPromotionIndex = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v8 = *((_BYTE *)a3 + 72);
  }
  if ((v8 & 2) != 0)
  {
    self->_feedMaxCount = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)subscriptionsFetchCount
{
  return self->_subscriptionsFetchCount;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (unint64_t)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

- (NTPBTodaySectionConfigArticle)localNewsPromotedArticle
{
  return self->_localNewsPromotedArticle;
}

- (void)setLocalNewsPromotedArticle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (unint64_t)feedMaxCount
{
  return self->_feedMaxCount;
}

@end
