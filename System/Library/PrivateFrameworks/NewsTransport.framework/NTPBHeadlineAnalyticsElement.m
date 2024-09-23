@implementation NTPBHeadlineAnalyticsElement

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (void)setArticleVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_articleVersion = a3;
}

- (void)setHasArticleVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNeedsSeenStateTracking:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_needsSeenStateTracking = a3;
}

- (void)setHasNeedsSeenStateTracking:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNeedsSeenStateTracking
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (BOOL)hasPreseenCountTrackingIdentifier
{
  return self->_preseenCountTrackingIdentifier != 0;
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
  v8.super_class = (Class)NTPBHeadlineAnalyticsElement;
  -[NTPBHeadlineAnalyticsElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBHeadlineAnalyticsElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleID;
  char has;
  void *v7;
  void *v8;
  NSString *channelID;
  NSString *preseenCountTrackingIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v3, "setObject:forKey:", articleID, CFSTR("article_ID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("article_version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_needsSeenStateTracking);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("needs_seen_state_tracking"));

  }
  channelID = self->_channelID;
  if (channelID)
    objc_msgSend(v4, "setObject:forKey:", channelID, CFSTR("channel_ID"));
  preseenCountTrackingIdentifier = self->_preseenCountTrackingIdentifier;
  if (preseenCountTrackingIdentifier)
    objc_msgSend(v4, "setObject:forKey:", preseenCountTrackingIdentifier, CFSTR("preseen_count_tracking_identifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineAnalyticsElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_articleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_channelID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_preseenCountTrackingIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_articleVersion;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_needsSeenStateTracking;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_channelID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_preseenCountTrackingIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleID;
  NSString *channelID;
  NSString *preseenCountTrackingIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  articleID = self->_articleID;
  if ((unint64_t)articleID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleID, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_articleVersion != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_needsSeenStateTracking)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_21;
        goto LABEL_17;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_17;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_21;
LABEL_17:
  channelID = self->_channelID;
  if ((unint64_t)channelID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](channelID, "isEqual:"))
    goto LABEL_21;
  preseenCountTrackingIdentifier = self->_preseenCountTrackingIdentifier;
  if ((unint64_t)preseenCountTrackingIdentifier | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](preseenCountTrackingIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_articleID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_articleVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_needsSeenStateTracking;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_channelID, "hash");
  return v6 ^ -[NSString hash](self->_preseenCountTrackingIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBHeadlineAnalyticsElement setArticleID:](self, "setArticleID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_articleVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_needsSeenStateTracking = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBHeadlineAnalyticsElement setChannelID:](self, "setChannelID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBHeadlineAnalyticsElement setPreseenCountTrackingIdentifier:](self, "setPreseenCountTrackingIdentifier:");
    v4 = v6;
  }

}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_storeStrong((id *)&self->_articleID, a3);
}

- (int64_t)articleVersion
{
  return self->_articleVersion;
}

- (BOOL)needsSeenStateTracking
{
  return self->_needsSeenStateTracking;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_storeStrong((id *)&self->_channelID, a3);
}

- (NSString)preseenCountTrackingIdentifier
{
  return self->_preseenCountTrackingIdentifier;
}

- (void)setPreseenCountTrackingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_preseenCountTrackingIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preseenCountTrackingIdentifier, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
