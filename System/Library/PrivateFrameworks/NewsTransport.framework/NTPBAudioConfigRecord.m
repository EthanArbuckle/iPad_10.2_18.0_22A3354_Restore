@implementation NTPBAudioConfigRecord

- (NSMutableArray)heroArticleIDs
{
  return self->_heroArticleIDs;
}

- (NSString)dailyBriefingArticleID
{
  return self->_dailyBriefingArticleID;
}

- (NSString)curatedArticleIDs
{
  return self->_curatedArticleIDs;
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (NSString)feedConfiguration
{
  return self->_feedConfiguration;
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBAudioConfigRecord setBase:](self, "setBase:", 0);
  -[NTPBAudioConfigRecord setConfiguration:](self, "setConfiguration:", 0);
  -[NTPBAudioConfigRecord setDailyBriefingArticleID:](self, "setDailyBriefingArticleID:", 0);
  -[NTPBAudioConfigRecord setFeaturedAudioArticleListID:](self, "setFeaturedAudioArticleListID:", 0);
  -[NTPBAudioConfigRecord setHeroArticleIDs:](self, "setHeroArticleIDs:", 0);
  -[NTPBAudioConfigRecord setLatestAudioArticleListID:](self, "setLatestAudioArticleListID:", 0);
  -[NTPBAudioConfigRecord setFeedConfiguration:](self, "setFeedConfiguration:", 0);
  -[NTPBAudioConfigRecord setCuratedArticleIDs:](self, "setCuratedArticleIDs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioConfigRecord;
  -[NTPBAudioConfigRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasDailyBriefingArticleID
{
  return self->_dailyBriefingArticleID != 0;
}

- (BOOL)hasFeaturedAudioArticleListID
{
  return self->_featuredAudioArticleListID != 0;
}

- (void)clearHeroArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_heroArticleIDs, "removeAllObjects");
}

- (void)addHeroArticleIDs:(id)a3
{
  NSMutableArray *heroArticleIDs;

  heroArticleIDs = self->_heroArticleIDs;
  if (!heroArticleIDs)
  {
    heroArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_heroArticleIDs = heroArticleIDs;
  }
  -[NSMutableArray addObject:](heroArticleIDs, "addObject:", a3);
}

- (unint64_t)heroArticleIDsCount
{
  return -[NSMutableArray count](self->_heroArticleIDs, "count");
}

- (id)heroArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_heroArticleIDs, "objectAtIndex:", a3);
}

+ (Class)heroArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLatestAudioArticleListID
{
  return self->_latestAudioArticleListID != 0;
}

- (BOOL)hasFeedConfiguration
{
  return self->_feedConfiguration != 0;
}

- (BOOL)hasCuratedArticleIDs
{
  return self->_curatedArticleIDs != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAudioConfigRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAudioConfigRecord description](&v3, sel_description), -[NTPBAudioConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *configuration;
  NSString *dailyBriefingArticleID;
  NSString *featuredAudioArticleListID;
  NSMutableArray *heroArticleIDs;
  NSString *latestAudioArticleListID;
  NSString *feedConfiguration;
  NSString *curatedArticleIDs;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  configuration = self->_configuration;
  if (configuration)
    objc_msgSend(v3, "setObject:forKey:", configuration, CFSTR("configuration"));
  dailyBriefingArticleID = self->_dailyBriefingArticleID;
  if (dailyBriefingArticleID)
    objc_msgSend(v3, "setObject:forKey:", dailyBriefingArticleID, CFSTR("dailyBriefingArticleID"));
  featuredAudioArticleListID = self->_featuredAudioArticleListID;
  if (featuredAudioArticleListID)
    objc_msgSend(v3, "setObject:forKey:", featuredAudioArticleListID, CFSTR("featuredAudioArticleListID"));
  heroArticleIDs = self->_heroArticleIDs;
  if (heroArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", heroArticleIDs, CFSTR("heroArticleIDs"));
  latestAudioArticleListID = self->_latestAudioArticleListID;
  if (latestAudioArticleListID)
    objc_msgSend(v3, "setObject:forKey:", latestAudioArticleListID, CFSTR("latestAudioArticleListID"));
  feedConfiguration = self->_feedConfiguration;
  if (feedConfiguration)
    objc_msgSend(v3, "setObject:forKey:", feedConfiguration, CFSTR("feedConfiguration"));
  curatedArticleIDs = self->_curatedArticleIDs;
  if (curatedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", curatedArticleIDs, CFSTR("curatedArticleIDs"));
  return v3;
}

- (void)writeTo:(id)a3
{
  NSMutableArray *heroArticleIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_configuration)
    PBDataWriterWriteStringField();
  if (self->_dailyBriefingArticleID)
    PBDataWriterWriteStringField();
  if (self->_featuredAudioArticleListID)
    PBDataWriterWriteStringField();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  heroArticleIDs = self->_heroArticleIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](heroArticleIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(heroArticleIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](heroArticleIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_latestAudioArticleListID)
    PBDataWriterWriteStringField();
  if (self->_feedConfiguration)
    PBDataWriterWriteStringField();
  if (self->_curatedArticleIDs)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *heroArticleIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_configuration, "copyWithZone:", a3);

  v5[4] = (id)-[NSString copyWithZone:](self->_dailyBriefingArticleID, "copyWithZone:", a3);
  v5[5] = (id)-[NSString copyWithZone:](self->_featuredAudioArticleListID, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  heroArticleIDs = self->_heroArticleIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](heroArticleIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(heroArticleIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addHeroArticleIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](heroArticleIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v5[8] = (id)-[NSString copyWithZone:](self->_latestAudioArticleListID, "copyWithZone:", a3);
  v5[6] = (id)-[NSString copyWithZone:](self->_feedConfiguration, "copyWithZone:", a3);

  v5[3] = (id)-[NSString copyWithZone:](self->_curatedArticleIDs, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *configuration;
  NSString *dailyBriefingArticleID;
  NSString *featuredAudioArticleListID;
  NSMutableArray *heroArticleIDs;
  NSString *latestAudioArticleListID;
  NSString *feedConfiguration;
  NSString *curatedArticleIDs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 1)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      configuration = self->_configuration;
      if (!((unint64_t)configuration | *((_QWORD *)a3 + 2))
        || (v5 = -[NSString isEqual:](configuration, "isEqual:")) != 0)
      {
        dailyBriefingArticleID = self->_dailyBriefingArticleID;
        if (!((unint64_t)dailyBriefingArticleID | *((_QWORD *)a3 + 4))
          || (v5 = -[NSString isEqual:](dailyBriefingArticleID, "isEqual:")) != 0)
        {
          featuredAudioArticleListID = self->_featuredAudioArticleListID;
          if (!((unint64_t)featuredAudioArticleListID | *((_QWORD *)a3 + 5))
            || (v5 = -[NSString isEqual:](featuredAudioArticleListID, "isEqual:")) != 0)
          {
            heroArticleIDs = self->_heroArticleIDs;
            if (!((unint64_t)heroArticleIDs | *((_QWORD *)a3 + 7))
              || (v5 = -[NSMutableArray isEqual:](heroArticleIDs, "isEqual:")) != 0)
            {
              latestAudioArticleListID = self->_latestAudioArticleListID;
              if (!((unint64_t)latestAudioArticleListID | *((_QWORD *)a3 + 8))
                || (v5 = -[NSString isEqual:](latestAudioArticleListID, "isEqual:")) != 0)
              {
                feedConfiguration = self->_feedConfiguration;
                if (!((unint64_t)feedConfiguration | *((_QWORD *)a3 + 6))
                  || (v5 = -[NSString isEqual:](feedConfiguration, "isEqual:")) != 0)
                {
                  curatedArticleIDs = self->_curatedArticleIDs;
                  if ((unint64_t)curatedArticleIDs | *((_QWORD *)a3 + 3))
                    LOBYTE(v5) = -[NSString isEqual:](curatedArticleIDs, "isEqual:");
                  else
                    LOBYTE(v5) = 1;
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
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_configuration, "hash") ^ v3;
  v5 = -[NSString hash](self->_dailyBriefingArticleID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_featuredAudioArticleListID, "hash");
  v7 = -[NSMutableArray hash](self->_heroArticleIDs, "hash");
  v8 = v7 ^ -[NSString hash](self->_latestAudioArticleListID, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_feedConfiguration, "hash");
  return v9 ^ -[NSString hash](self->_curatedArticleIDs, "hash");
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 1);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBAudioConfigRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 2))
    -[NTPBAudioConfigRecord setConfiguration:](self, "setConfiguration:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBAudioConfigRecord setDailyBriefingArticleID:](self, "setDailyBriefingArticleID:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBAudioConfigRecord setFeaturedAudioArticleListID:](self, "setFeaturedAudioArticleListID:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[NTPBAudioConfigRecord addHeroArticleIDs:](self, "addHeroArticleIDs:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  if (*((_QWORD *)a3 + 8))
    -[NTPBAudioConfigRecord setLatestAudioArticleListID:](self, "setLatestAudioArticleListID:");
  if (*((_QWORD *)a3 + 6))
    -[NTPBAudioConfigRecord setFeedConfiguration:](self, "setFeedConfiguration:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBAudioConfigRecord setCuratedArticleIDs:](self, "setCuratedArticleIDs:");
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setDailyBriefingArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)featuredAudioArticleListID
{
  return self->_featuredAudioArticleListID;
}

- (void)setFeaturedAudioArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setHeroArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)latestAudioArticleListID
{
  return self->_latestAudioArticleListID;
}

- (void)setLatestAudioArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setCuratedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
