@implementation NTPBPrefetchConfig

- (void)setBackgroundFetchEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_backgroundFetchEnabled = a3;
}

- (void)setHasBackgroundFetchEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBackgroundFetchEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBackgroundFetchMinimumInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_backgroundFetchMinimumInterval = a3;
}

- (void)setHasBackgroundFetchMinimumInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackgroundFetchMinimumInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFeedPrefetchForYou:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_feedPrefetchForYou = a3;
}

- (void)setHasFeedPrefetchForYou:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFeedPrefetchForYou
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setFeedPrefetchFavoritesLimit:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feedPrefetchFavoritesLimit = a3;
}

- (void)setHasFeedPrefetchFavoritesLimit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedPrefetchFavoritesLimit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBackgroundFetchEnabled2:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_backgroundFetchEnabled2 = a3;
}

- (void)setHasBackgroundFetchEnabled2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBackgroundFetchEnabled2
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPrefetchedForYouExpiration:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_prefetchedForYouExpiration = a3;
}

- (void)setHasPrefetchedForYouExpiration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrefetchedForYouExpiration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NTPBPrefetchConfig;
  -[NTPBPrefetchConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPrefetchConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_backgroundFetchEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("background_fetch_enabled"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_backgroundFetchMinimumInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("background_fetch_minimum_interval"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_feedPrefetchForYou);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("feed_prefetch_for_you"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_backgroundFetchEnabled2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("background_fetch_enabled_2"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_feedPrefetchFavoritesLimit);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("feed_prefetch_favorites_limit"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_prefetchedForYouExpiration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("prefetched_for_you_expiration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrefetchConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
LABEL_7:
    PBDataWriterWriteInt64Field();
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)result + 32) = self->_backgroundFetchEnabled;
    *((_BYTE *)result + 36) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_backgroundFetchMinimumInterval;
  *((_BYTE *)result + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 34) = self->_feedPrefetchForYou;
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 2) = self->_feedPrefetchFavoritesLimit;
  *((_BYTE *)result + 36) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 33) = self->_backgroundFetchEnabled2;
  *((_BYTE *)result + 36) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_7:
  *((_QWORD *)result + 3) = self->_prefetchedForYouExpiration;
  *((_BYTE *)result + 36) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_40;
    if (self->_backgroundFetchEnabled)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_backgroundFetchMinimumInterval != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_40;
    if (self->_feedPrefetchForYou)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_40;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_feedPrefetchFavoritesLimit != *((_QWORD *)v4 + 2))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    {
      if (self->_backgroundFetchEnabled2)
      {
        if (!*((_BYTE *)v4 + 33))
          goto LABEL_40;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_36;
    }
LABEL_40:
    v5 = 0;
    goto LABEL_41;
  }
  if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
    goto LABEL_40;
LABEL_36:
  v5 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_prefetchedForYouExpiration != *((_QWORD *)v4 + 3))
      goto LABEL_40;
    v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double backgroundFetchMinimumInterval;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4 = 2654435761 * self->_backgroundFetchEnabled;
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
  backgroundFetchMinimumInterval = self->_backgroundFetchMinimumInterval;
  v6 = -backgroundFetchMinimumInterval;
  if (backgroundFetchMinimumInterval >= 0.0)
    v6 = self->_backgroundFetchMinimumInterval;
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
  if ((has & 0x20) != 0)
  {
    v10 = 2654435761 * self->_feedPrefetchForYou;
    if ((has & 2) != 0)
    {
LABEL_13:
      v11 = 2654435761 * self->_feedPrefetchFavoritesLimit;
      if ((has & 0x10) != 0)
        goto LABEL_14;
LABEL_18:
      v12 = 0;
      if ((has & 4) != 0)
        goto LABEL_15;
LABEL_19:
      v13 = 0;
      return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    v10 = 0;
    if ((has & 2) != 0)
      goto LABEL_13;
  }
  v11 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_18;
LABEL_14:
  v12 = 2654435761 * self->_backgroundFetchEnabled2;
  if ((has & 4) == 0)
    goto LABEL_19;
LABEL_15:
  v13 = 2654435761 * self->_prefetchedForYouExpiration;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_backgroundFetchEnabled = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_backgroundFetchMinimumInterval = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_feedPrefetchForYou = *((_BYTE *)v4 + 34);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    self->_backgroundFetchEnabled2 = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_feedPrefetchFavoritesLimit = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 4) != 0)
  {
LABEL_7:
    self->_prefetchedForYouExpiration = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:

}

- (BOOL)backgroundFetchEnabled
{
  return self->_backgroundFetchEnabled;
}

- (double)backgroundFetchMinimumInterval
{
  return self->_backgroundFetchMinimumInterval;
}

- (BOOL)feedPrefetchForYou
{
  return self->_feedPrefetchForYou;
}

- (int64_t)feedPrefetchFavoritesLimit
{
  return self->_feedPrefetchFavoritesLimit;
}

- (BOOL)backgroundFetchEnabled2
{
  return self->_backgroundFetchEnabled2;
}

- (int64_t)prefetchedForYouExpiration
{
  return self->_prefetchedForYouExpiration;
}

@end
