@implementation NTPBSportsEventRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBSportsEventRecord setBase:](self, "setBase:", 0);
  -[NTPBSportsEventRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:", 0);
  -[NTPBSportsEventRecord setEventCompetitorTagIDs:](self, "setEventCompetitorTagIDs:", 0);
  -[NTPBSportsEventRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:", 0);
  -[NTPBSportsEventRecord setEventArticleListID:](self, "setEventArticleListID:", 0);
  -[NTPBSportsEventRecord setSportsData:](self, "setSportsData:", 0);
  -[NTPBSportsEventRecord setSportsTheme:](self, "setSportsTheme:", 0);
  -[NTPBSportsEventRecord setEventLeagueTagID:](self, "setEventLeagueTagID:", 0);
  -[NTPBSportsEventRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBSportsEventRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBSportsEventRecord;
  -[NTPBSportsEventRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumNewsVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)clearEventCompetitorTagIDs
{
  -[NSMutableArray removeAllObjects](self->_eventCompetitorTagIDs, "removeAllObjects");
}

- (void)addEventCompetitorTagIDs:(id)a3
{
  NSMutableArray *eventCompetitorTagIDs;

  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  if (!eventCompetitorTagIDs)
  {
    eventCompetitorTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_eventCompetitorTagIDs = eventCompetitorTagIDs;
  }
  -[NSMutableArray addObject:](eventCompetitorTagIDs, "addObject:", a3);
}

- (unint64_t)eventCompetitorTagIDsCount
{
  return -[NSMutableArray count](self->_eventCompetitorTagIDs, "count");
}

- (id)eventCompetitorTagIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_eventCompetitorTagIDs, "objectAtIndex:", a3);
}

+ (Class)eventCompetitorTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHighlightsArticleListID
{
  return self->_highlightsArticleListID != 0;
}

- (BOOL)hasEventArticleListID
{
  return self->_eventArticleListID != 0;
}

- (BOOL)hasSportsData
{
  return self->_sportsData != 0;
}

- (BOOL)hasSportsTheme
{
  return self->_sportsTheme != 0;
}

- (BOOL)hasEventLeagueTagID
{
  return self->_eventLeagueTagID != 0;
}

- (void)setIsDeprecated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isDeprecated = a3;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsDeprecated
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearBlockedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_blockedStorefrontIDs, "removeAllObjects");
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  NSMutableArray *blockedStorefrontIDs;

  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }
  -[NSMutableArray addObject:](blockedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)blockedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_blockedStorefrontIDs, "count");
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blockedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_allowedStorefrontIDs, "removeAllObjects");
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  NSMutableArray *allowedStorefrontIDs;

  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }
  -[NSMutableArray addObject:](allowedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)allowedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_allowedStorefrontIDs, "count");
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allowedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBSportsEventRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBSportsEventRecord description](&v3, sel_description), -[NTPBSportsEventRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *superfeedConfigResourceID;
  NSMutableArray *eventCompetitorTagIDs;
  NSString *highlightsArticleListID;
  NSString *eventArticleListID;
  NSString *sportsData;
  NSString *sportsTheme;
  NSString *eventLeagueTagID;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID)
    objc_msgSend(v3, "setObject:forKey:", superfeedConfigResourceID, CFSTR("superfeed_config_resource_ID"));
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  if (eventCompetitorTagIDs)
    objc_msgSend(v3, "setObject:forKey:", eventCompetitorTagIDs, CFSTR("event_competitor_tag_IDs"));
  highlightsArticleListID = self->_highlightsArticleListID;
  if (highlightsArticleListID)
    objc_msgSend(v3, "setObject:forKey:", highlightsArticleListID, CFSTR("highlights_article_list_ID"));
  eventArticleListID = self->_eventArticleListID;
  if (eventArticleListID)
    objc_msgSend(v3, "setObject:forKey:", eventArticleListID, CFSTR("event_article_list_ID"));
  sportsData = self->_sportsData;
  if (sportsData)
    objc_msgSend(v3, "setObject:forKey:", sportsData, CFSTR("sports_data"));
  sportsTheme = self->_sportsTheme;
  if (sportsTheme)
    objc_msgSend(v3, "setObject:forKey:", sportsTheme, CFSTR("sports_theme"));
  eventLeagueTagID = self->_eventLeagueTagID;
  if (eventLeagueTagID)
    objc_msgSend(v3, "setObject:forKey:", eventLeagueTagID, CFSTR("event_league_tag_ID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDeprecated), CFSTR("is_deprecated"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSportsEventRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *eventCompetitorTagIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_superfeedConfigResourceID)
    PBDataWriterWriteStringField();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](eventCompetitorTagIDs, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(eventCompetitorTagIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](eventCompetitorTagIDs, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }
  if (self->_highlightsArticleListID)
    PBDataWriterWriteStringField();
  if (self->_eventArticleListID)
    PBDataWriterWriteStringField();
  if (self->_sportsData)
    PBDataWriterWriteStringField();
  if (self->_sportsTheme)
    PBDataWriterWriteStringField();
  if (self->_eventLeagueTagID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v11);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *eventCompetitorTagIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_minimumNewsVersion;
    *(_BYTE *)(v5 + 100) |= 1u;
  }

  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_superfeedConfigResourceID, "copyWithZone:", a3);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](eventCompetitorTagIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(eventCompetitorTagIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEventCompetitorTagIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](eventCompetitorTagIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_highlightsArticleListID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_eventArticleListID, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 72) = -[NSString copyWithZone:](self->_sportsData, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_sportsTheme, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_eventLeagueTagID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 96) = self->_isDeprecated;
    *(_BYTE *)(v5 + 100) |= 2u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(blockedStorefrontIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(allowedStorefrontIDs);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *superfeedConfigResourceID;
  NSMutableArray *eventCompetitorTagIDs;
  NSString *highlightsArticleListID;
  NSString *eventArticleListID;
  NSString *sportsData;
  NSString *sportsTheme;
  NSString *eventLeagueTagID;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 3)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 100) & 1) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 1))
          goto LABEL_27;
      }
      else if ((*((_BYTE *)a3 + 100) & 1) != 0)
      {
        goto LABEL_27;
      }
      superfeedConfigResourceID = self->_superfeedConfigResourceID;
      if (!((unint64_t)superfeedConfigResourceID | *((_QWORD *)a3 + 11))
        || (v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:")) != 0)
      {
        eventCompetitorTagIDs = self->_eventCompetitorTagIDs;
        if (!((unint64_t)eventCompetitorTagIDs | *((_QWORD *)a3 + 6))
          || (v5 = -[NSMutableArray isEqual:](eventCompetitorTagIDs, "isEqual:")) != 0)
        {
          highlightsArticleListID = self->_highlightsArticleListID;
          if (!((unint64_t)highlightsArticleListID | *((_QWORD *)a3 + 8))
            || (v5 = -[NSString isEqual:](highlightsArticleListID, "isEqual:")) != 0)
          {
            eventArticleListID = self->_eventArticleListID;
            if (!((unint64_t)eventArticleListID | *((_QWORD *)a3 + 5))
              || (v5 = -[NSString isEqual:](eventArticleListID, "isEqual:")) != 0)
            {
              sportsData = self->_sportsData;
              if (!((unint64_t)sportsData | *((_QWORD *)a3 + 9))
                || (v5 = -[NSString isEqual:](sportsData, "isEqual:")) != 0)
              {
                sportsTheme = self->_sportsTheme;
                if (!((unint64_t)sportsTheme | *((_QWORD *)a3 + 10))
                  || (v5 = -[NSString isEqual:](sportsTheme, "isEqual:")) != 0)
                {
                  eventLeagueTagID = self->_eventLeagueTagID;
                  if (!((unint64_t)eventLeagueTagID | *((_QWORD *)a3 + 7))
                    || (v5 = -[NSString isEqual:](eventLeagueTagID, "isEqual:")) != 0)
                  {
                    if ((*(_BYTE *)&self->_has & 2) != 0)
                    {
                      if ((*((_BYTE *)a3 + 100) & 2) != 0)
                      {
                        if (self->_isDeprecated)
                        {
                          if (!*((_BYTE *)a3 + 96))
                            goto LABEL_27;
                          goto LABEL_33;
                        }
                        if (!*((_BYTE *)a3 + 96))
                        {
LABEL_33:
                          blockedStorefrontIDs = self->_blockedStorefrontIDs;
                          if (!((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 4))
                            || (v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
                          {
                            allowedStorefrontIDs = self->_allowedStorefrontIDs;
                            if ((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 2))
                              LOBYTE(v5) = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
                            else
                              LOBYTE(v5) = 1;
                          }
                          return v5;
                        }
                      }
                    }
                    else if ((*((_BYTE *)a3 + 100) & 2) == 0)
                    {
                      goto LABEL_33;
                    }
LABEL_27:
                    LOBYTE(v5) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_minimumNewsVersion;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_superfeedConfigResourceID, "hash");
  v6 = -[NSMutableArray hash](self->_eventCompetitorTagIDs, "hash");
  v7 = -[NSString hash](self->_highlightsArticleListID, "hash");
  v8 = -[NSString hash](self->_eventArticleListID, "hash");
  v9 = -[NSString hash](self->_sportsData, "hash");
  v10 = -[NSString hash](self->_sportsTheme, "hash");
  v11 = -[NSString hash](self->_eventLeagueTagID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_isDeprecated;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  return v13 ^ -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 3);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBSportsEventRecord setBase:](self, "setBase:");
  }
  if ((*((_BYTE *)a3 + 100) & 1) != 0)
  {
    self->_minimumNewsVersion = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 11))
    -[NTPBSportsEventRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        -[NTPBSportsEventRecord addEventCompetitorTagIDs:](self, "addEventCompetitorTagIDs:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }
  if (*((_QWORD *)a3 + 8))
    -[NTPBSportsEventRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBSportsEventRecord setEventArticleListID:](self, "setEventArticleListID:");
  if (*((_QWORD *)a3 + 9))
    -[NTPBSportsEventRecord setSportsData:](self, "setSportsData:");
  if (*((_QWORD *)a3 + 10))
    -[NTPBSportsEventRecord setSportsTheme:](self, "setSportsTheme:");
  if (*((_QWORD *)a3 + 7))
    -[NTPBSportsEventRecord setEventLeagueTagID:](self, "setEventLeagueTagID:");
  if ((*((_BYTE *)a3 + 100) & 2) != 0)
  {
    self->_isDeprecated = *((_BYTE *)a3 + 96);
    *(_BYTE *)&self->_has |= 2u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 4);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        -[NTPBSportsEventRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 2);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[NTPBSportsEventRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)eventCompetitorTagIDs
{
  return self->_eventCompetitorTagIDs;
}

- (void)setEventCompetitorTagIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (void)setHighlightsArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)eventArticleListID
{
  return self->_eventArticleListID;
}

- (void)setEventArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (void)setSportsData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)sportsTheme
{
  return self->_sportsTheme;
}

- (void)setSportsTheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)eventLeagueTagID
{
  return self->_eventLeagueTagID;
}

- (void)setEventLeagueTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
