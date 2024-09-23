@implementation NTPBDiscoverMoreInterstitialExposure

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWithNextArticleAffordance:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_withNextArticleAffordance = a3;
}

- (void)setHasWithNextArticleAffordance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWithNextArticleAffordance
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)nextArticleAffordanceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_nextArticleAffordanceType;
  else
    return 0;
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNextArticleAffordanceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_24CD50AA0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNextArticleAffordanceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCOVER_MORE_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_SPOTLIGHT_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_PUB_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_EDITORS_PICKS_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY_BRIEFINGS_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREAT_STORIES_YOU_MISSED_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FOR_YOU_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_SUBSCRIPTION_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_AND_GREATEST_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_NEXT_ARTICLE_AFFORDANCE_TYPE")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTappedNextArticleAffordanceFeedId
{
  return self->_tappedNextArticleAffordanceFeedId != 0;
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
  v8.super_class = (Class)NTPBDiscoverMoreInterstitialExposure;
  -[NTPBDiscoverMoreInterstitialExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBDiscoverMoreInterstitialExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t nextArticleAffordanceType;
  __CFString *v8;
  NSString *tappedNextArticleAffordanceFeedId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_withNextArticleAffordance);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("with_next_article_affordance"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_11;
LABEL_7:
    nextArticleAffordanceType = self->_nextArticleAffordanceType;
    if (nextArticleAffordanceType >= 0x10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nextArticleAffordanceType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24CD50AA0[nextArticleAffordanceType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("next_article_affordance_type"));

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_6;
LABEL_3:
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_11:
  tappedNextArticleAffordanceFeedId = self->_tappedNextArticleAffordanceFeedId;
  if (tappedNextArticleAffordanceFeedId)
    objc_msgSend(v3, "setObject:forKey:", tappedNextArticleAffordanceFeedId, CFSTR("tapped_next_article_affordance_feed_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDiscoverMoreInterstitialExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_tappedNextArticleAffordanceFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 28) = self->_withNextArticleAffordance;
    *(_BYTE *)(v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_userAction;
  *(_BYTE *)(v5 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_nextArticleAffordanceType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_tappedNextArticleAffordanceFeedId, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tappedNextArticleAffordanceFeedId;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_userAction != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) != 0)
    {
      if (self->_withNextArticleAffordance)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_22;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_15;
    }
LABEL_22:
    v6 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 32) & 4) != 0)
    goto LABEL_22;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_22;
  }
  tappedNextArticleAffordanceFeedId = self->_tappedNextArticleAffordanceFeedId;
  if ((unint64_t)tappedNextArticleAffordanceFeedId | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](tappedNextArticleAffordanceFeedId, "isEqual:");
  else
    v6 = 1;
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_tappedNextArticleAffordanceFeedId, "hash");
  }
  v2 = 2654435761 * self->_userAction;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_withNextArticleAffordance;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_nextArticleAffordanceType;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_tappedNextArticleAffordanceFeedId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_withNextArticleAffordance = *((_BYTE *)v4 + 28);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_4:
    self->_nextArticleAffordanceType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[NTPBDiscoverMoreInterstitialExposure setTappedNextArticleAffordanceFeedId:](self, "setTappedNextArticleAffordanceFeedId:");
    v4 = v6;
  }

}

- (BOOL)withNextArticleAffordance
{
  return self->_withNextArticleAffordance;
}

- (NSString)tappedNextArticleAffordanceFeedId
{
  return self->_tappedNextArticleAffordanceFeedId;
}

- (void)setTappedNextArticleAffordanceFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_tappedNextArticleAffordanceFeedId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedNextArticleAffordanceFeedId, 0);
}

@end
