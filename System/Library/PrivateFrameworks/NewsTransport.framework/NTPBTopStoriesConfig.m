@implementation NTPBTopStoriesConfig

- (void)setPinningEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_pinningEnabled = a3;
}

- (void)setHasPinningEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPinningEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPromotingEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_promotingEnabled = a3;
}

- (void)setHasPromotingEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPromotingEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setMaximumArticleCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maximumArticleCount = a3;
}

- (void)setHasMaximumArticleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaximumArticleCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCutoffTime:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cutoffTime = a3;
}

- (void)setHasCutoffTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCutoffTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearStyleConfigs
{
  -[NSMutableArray removeAllObjects](self->_styleConfigs, "removeAllObjects");
}

- (void)addStyleConfigs:(id)a3
{
  id v4;
  NSMutableArray *styleConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  styleConfigs = self->_styleConfigs;
  v8 = v4;
  if (!styleConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_styleConfigs;
    self->_styleConfigs = v6;

    v4 = v8;
    styleConfigs = self->_styleConfigs;
  }
  -[NSMutableArray addObject:](styleConfigs, "addObject:", v4);

}

- (unint64_t)styleConfigsCount
{
  return -[NSMutableArray count](self->_styleConfigs, "count");
}

- (id)styleConfigsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_styleConfigs, "objectAtIndex:", a3);
}

+ (Class)styleConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setBadgesTimeout:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_badgesTimeout = a3;
}

- (void)setHasBadgesTimeout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBadgesTimeout
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBTopStoriesConfig;
  -[NTPBTopStoriesConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTopStoriesConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *channelId;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pinningEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pinning_enabled"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_promotingEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("promoting_enabled"));

  }
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v3, "setObject:forKey:", channelId, CFSTR("channel_id"));
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maximumArticleCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("maximum_article_count"));

    v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cutoffTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cutoff_time"));

  }
  if (-[NSMutableArray count](self->_styleConfigs, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_styleConfigs, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = self->_styleConfigs;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("style_configs"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_badgesTimeout);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("badges_timeout"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopStoriesConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_channelId)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
    PBDataWriterWriteInt64Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_styleConfigs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[48] = self->_pinningEnabled;
    v5[52] |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v5[49] = self->_promotingEnabled;
    v5[52] |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v8;

  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((_QWORD *)v6 + 3) = self->_maximumArticleCount;
    v6[52] |= 4u;
    v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    *((_QWORD *)v6 + 2) = self->_cutoffTime;
    v6[52] |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_styleConfigs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addStyleConfigs:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v6 + 1) = self->_badgesTimeout;
    v6[52] |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *channelId;
  NSMutableArray *styleConfigs;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_38;
    if (self->_pinningEnabled)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_38;
    if (self->_promotingEnabled)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_maximumArticleCount != *((_QWORD *)v4 + 3))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_cutoffTime != *((_QWORD *)v4 + 2))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_38;
  }
  styleConfigs = self->_styleConfigs;
  if ((unint64_t)styleConfigs | *((_QWORD *)v4 + 5))
  {
    if (-[NSMutableArray isEqual:](styleConfigs, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_34;
    }
LABEL_38:
    v8 = 0;
    goto LABEL_39;
  }
LABEL_34:
  v8 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_badgesTimeout != *((_QWORD *)v4 + 1))
      goto LABEL_38;
    v8 = 1;
  }
LABEL_39:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_pinningEnabled;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_promotingEnabled;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_maximumArticleCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_cutoffTime;
      goto LABEL_11;
    }
  }
  v7 = 0;
LABEL_11:
  v8 = -[NSMutableArray hash](self->_styleConfigs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_badgesTimeout;
  else
    v9 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  id v5;
  char v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = v4[52];
  if ((v6 & 8) != 0)
  {
    self->_pinningEnabled = v4[48];
    *(_BYTE *)&self->_has |= 8u;
    v6 = v4[52];
  }
  if ((v6 & 0x10) != 0)
  {
    self->_promotingEnabled = v4[49];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 4))
    -[NTPBTopStoriesConfig setChannelId:](self, "setChannelId:");
  v7 = *((_BYTE *)v5 + 52);
  if ((v7 & 4) != 0)
  {
    self->_maximumArticleCount = *((_QWORD *)v5 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v5 + 52);
  }
  if ((v7 & 2) != 0)
  {
    self->_cutoffTime = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NTPBTopStoriesConfig addStyleConfigs:](self, "addStyleConfigs:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)v5 + 52) & 1) != 0)
  {
    self->_badgesTimeout = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)pinningEnabled
{
  return self->_pinningEnabled;
}

- (BOOL)promotingEnabled
{
  return self->_promotingEnabled;
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (int64_t)maximumArticleCount
{
  return self->_maximumArticleCount;
}

- (int64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (NSMutableArray)styleConfigs
{
  return self->_styleConfigs;
}

- (void)setStyleConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_styleConfigs, a3);
}

- (int64_t)badgesTimeout
{
  return self->_badgesTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleConfigs, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end
