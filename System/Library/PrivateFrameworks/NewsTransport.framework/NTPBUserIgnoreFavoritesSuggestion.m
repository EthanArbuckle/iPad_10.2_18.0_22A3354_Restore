@implementation NTPBUserIgnoreFavoritesSuggestion

- (int)ignoredFeedType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_ignoredFeedType;
  else
    return 0;
}

- (void)setIgnoredFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ignoredFeedType = a3;
}

- (void)setHasIgnoredFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIgnoredFeedType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)ignoreLocation
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_ignoreLocation;
  else
    return 0;
}

- (void)setIgnoreLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ignoreLocation = a3;
}

- (void)setHasIgnoreLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIgnoreLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIgnoredFeedId
{
  return self->_ignoredFeedId != 0;
}

- (void)setSuggestionPositionWhenIgnored:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_suggestionPositionWhenIgnored = a3;
}

- (void)setHasSuggestionPositionWhenIgnored:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuggestionPositionWhenIgnored
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
  v8.super_class = (Class)NTPBUserIgnoreFavoritesSuggestion;
  -[NTPBUserIgnoreFavoritesSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserIgnoreFavoritesSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *ignoredFeedId;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ignoredFeedType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ignored_feed_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ignoreLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ignore_location"));

  }
  ignoredFeedId = self->_ignoredFeedId;
  if (ignoredFeedId)
    objc_msgSend(v3, "setObject:forKey:", ignoredFeedId, CFSTR("ignored_feed_id"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_suggestionPositionWhenIgnored);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("suggestion_position_when_ignored"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserIgnoreFavoritesSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_ignoredFeedId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_ignoredFeedType;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_ignoreLocation;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_ignoredFeedId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_suggestionPositionWhenIgnored;
    *(_BYTE *)(v6 + 32) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *ignoredFeedId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_ignoredFeedType != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_ignoreLocation != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  ignoredFeedId = self->_ignoredFeedId;
  if ((unint64_t)ignoredFeedId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](ignoredFeedId, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_suggestionPositionWhenIgnored != *((_DWORD *)v4 + 7))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_ignoredFeedType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_ignoreLocation;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_ignoredFeedId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_suggestionPositionWhenIgnored;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
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
    self->_ignoredFeedType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 1) != 0)
  {
    self->_ignoreLocation = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[NTPBUserIgnoreFavoritesSuggestion setIgnoredFeedId:](self, "setIgnoredFeedId:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    self->_suggestionPositionWhenIgnored = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)ignoredFeedId
{
  return self->_ignoredFeedId;
}

- (void)setIgnoredFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredFeedId, a3);
}

- (int)suggestionPositionWhenIgnored
{
  return self->_suggestionPositionWhenIgnored;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredFeedId, 0);
}

@end
