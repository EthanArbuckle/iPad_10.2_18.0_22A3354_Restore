@implementation NTPBEmailOptInInvite

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)emailOptInInviteLocation
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_emailOptInInviteLocation;
  else
    return 0;
}

- (void)setEmailOptInInviteLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_emailOptInInviteLocation = a3;
}

- (void)setHasEmailOptInInviteLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEmailOptInInviteLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)parentFeedType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51FA0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParentFeedType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_FEED_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_FEED_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECTION_FEED_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_FEED_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_FEED_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_PUB_ARTICLES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_HISTORY_FEED_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_LIST_FEED_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED_FEED_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_FEED_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUG_FEED_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FEED_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_FEED_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYMBOL_FEED_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAGAZINE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_FEED_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_MAGAZINES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FEED_TYPE")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (int)newsletterSubscriptionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_newsletterSubscriptionType;
  else
    return 0;
}

- (void)setNewsletterSubscriptionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_newsletterSubscriptionType = a3;
}

- (void)setHasNewsletterSubscriptionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewsletterSubscriptionType
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
  v8.super_class = (Class)NTPBEmailOptInInvite;
  -[NTPBEmailOptInInvite description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEmailOptInInvite dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t parentFeedType;
  __CFString *v8;
  NSString *parentFeedId;
  NSString *articleId;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_emailOptInInviteLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("email_opt_in_invite_location"));

  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_7:
  parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CD51FA0[parentFeedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("parent_feed_type"));

LABEL_11:
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_newsletterSubscriptionType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("newsletter_subscription_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEmailOptInInviteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_parentFeedId)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_userAction;
    *(_BYTE *)(v5 + 40) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_emailOptInInviteLocation;
  *(_BYTE *)(v5 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_parentFeedType;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_newsletterSubscriptionType;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *parentFeedId;
  NSString *articleId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_userAction != *((_DWORD *)v4 + 9))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
LABEL_25:
    v7 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_emailOptInInviteLocation != *((_DWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 8))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_25;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](parentFeedId, "isEqual:"))
  {
    goto LABEL_25;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_25;
  }
  v7 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_newsletterSubscriptionType != *((_DWORD *)v4 + 5))
      goto LABEL_25;
    v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_userAction;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_emailOptInInviteLocation;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_parentFeedType;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_parentFeedId, "hash");
  v7 = -[NSString hash](self->_articleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_newsletterSubscriptionType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_emailOptInInviteLocation = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_parentFeedType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBEmailOptInInvite setParentFeedId:](self, "setParentFeedId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBEmailOptInInvite setArticleId:](self, "setArticleId:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_newsletterSubscriptionType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
