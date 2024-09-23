@implementation NTPBForYouConfigRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setTrendingArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setTodayFeedTopStoriesArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setTodayFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setSpotlightArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setEditorialSectionTagIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setEditorialArticleListIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)todayFeedTopStoriesArticleIDs
{
  return self->_todayFeedTopStoriesArticleIDs;
}

- (NSString)todayFeedConfiguration
{
  return self->_todayFeedConfiguration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *editorialArticleListIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *editorialSectionTagIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *todayFeedTopStoriesArticleIDs;
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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[2] = (id)-[NSString copyWithZone:](self->_configuration, "copyWithZone:", a3);

  v5[8] = (id)-[NSString copyWithZone:](self->_trendingArticleListID, "copyWithZone:", a3);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  editorialArticleListIDs = self->_editorialArticleListIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialArticleListIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(editorialArticleListIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addEditorialArticleListIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialArticleListIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialSectionTagIDs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(editorialSectionTagIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addEditorialSectionTagIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialSectionTagIDs, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }

  v5[5] = (id)-[NSString copyWithZone:](self->_spotlightArticleID, "copyWithZone:", a3);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayFeedTopStoriesArticleIDs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(todayFeedTopStoriesArticleIDs);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v5, "addTodayFeedTopStoriesArticleIDs:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayFeedTopStoriesArticleIDs, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }

  v5[6] = (id)-[NSString copyWithZone:](self->_todayFeedConfiguration, "copyWithZone:", a3);
  return v5;
}

- (void)addTodayFeedTopStoriesArticleIDs:(id)a3
{
  NSMutableArray *todayFeedTopStoriesArticleIDs;

  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  if (!todayFeedTopStoriesArticleIDs)
  {
    todayFeedTopStoriesArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_todayFeedTopStoriesArticleIDs = todayFeedTopStoriesArticleIDs;
  }
  -[NSMutableArray addObject:](todayFeedTopStoriesArticleIDs, "addObject:", a3);
}

- (void)addEditorialSectionTagIDs:(id)a3
{
  NSMutableArray *editorialSectionTagIDs;

  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  if (!editorialSectionTagIDs)
  {
    editorialSectionTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_editorialSectionTagIDs = editorialSectionTagIDs;
  }
  -[NSMutableArray addObject:](editorialSectionTagIDs, "addObject:", a3);
}

- (void)addEditorialArticleListIDs:(id)a3
{
  NSMutableArray *editorialArticleListIDs;

  editorialArticleListIDs = self->_editorialArticleListIDs;
  if (!editorialArticleListIDs)
  {
    editorialArticleListIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_editorialArticleListIDs = editorialArticleListIDs;
  }
  -[NSMutableArray addObject:](editorialArticleListIDs, "addObject:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return NTPBForYouConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBForYouConfigRecord setBase:](self, "setBase:", 0);
  -[NTPBForYouConfigRecord setConfiguration:](self, "setConfiguration:", 0);
  -[NTPBForYouConfigRecord setTrendingArticleListID:](self, "setTrendingArticleListID:", 0);
  -[NTPBForYouConfigRecord setEditorialArticleListIDs:](self, "setEditorialArticleListIDs:", 0);
  -[NTPBForYouConfigRecord setEditorialSectionTagIDs:](self, "setEditorialSectionTagIDs:", 0);
  -[NTPBForYouConfigRecord setSpotlightArticleID:](self, "setSpotlightArticleID:", 0);
  -[NTPBForYouConfigRecord setTodayFeedTopStoriesArticleIDs:](self, "setTodayFeedTopStoriesArticleIDs:", 0);
  -[NTPBForYouConfigRecord setTodayFeedConfiguration:](self, "setTodayFeedConfiguration:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouConfigRecord;
  -[NTPBForYouConfigRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasTrendingArticleListID
{
  return self->_trendingArticleListID != 0;
}

- (void)clearEditorialArticleListIDs
{
  -[NSMutableArray removeAllObjects](self->_editorialArticleListIDs, "removeAllObjects");
}

- (unint64_t)editorialArticleListIDsCount
{
  return -[NSMutableArray count](self->_editorialArticleListIDs, "count");
}

- (id)editorialArticleListIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_editorialArticleListIDs, "objectAtIndex:", a3);
}

+ (Class)editorialArticleListIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearEditorialSectionTagIDs
{
  -[NSMutableArray removeAllObjects](self->_editorialSectionTagIDs, "removeAllObjects");
}

- (unint64_t)editorialSectionTagIDsCount
{
  return -[NSMutableArray count](self->_editorialSectionTagIDs, "count");
}

- (id)editorialSectionTagIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_editorialSectionTagIDs, "objectAtIndex:", a3);
}

+ (Class)editorialSectionTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSpotlightArticleID
{
  return self->_spotlightArticleID != 0;
}

- (void)clearTodayFeedTopStoriesArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_todayFeedTopStoriesArticleIDs, "removeAllObjects");
}

- (unint64_t)todayFeedTopStoriesArticleIDsCount
{
  return -[NSMutableArray count](self->_todayFeedTopStoriesArticleIDs, "count");
}

- (id)todayFeedTopStoriesArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_todayFeedTopStoriesArticleIDs, "objectAtIndex:", a3);
}

+ (Class)todayFeedTopStoriesArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTodayFeedConfiguration
{
  return self->_todayFeedConfiguration != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouConfigRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBForYouConfigRecord description](&v3, sel_description), -[NTPBForYouConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *configuration;
  NSString *trendingArticleListID;
  NSMutableArray *editorialArticleListIDs;
  NSMutableArray *editorialSectionTagIDs;
  NSString *spotlightArticleID;
  NSMutableArray *todayFeedTopStoriesArticleIDs;
  NSString *todayFeedConfiguration;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  configuration = self->_configuration;
  if (configuration)
    objc_msgSend(v3, "setObject:forKey:", configuration, CFSTR("configuration"));
  trendingArticleListID = self->_trendingArticleListID;
  if (trendingArticleListID)
    objc_msgSend(v3, "setObject:forKey:", trendingArticleListID, CFSTR("trendingArticleListID"));
  editorialArticleListIDs = self->_editorialArticleListIDs;
  if (editorialArticleListIDs)
    objc_msgSend(v3, "setObject:forKey:", editorialArticleListIDs, CFSTR("editorialArticleListIDs"));
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  if (editorialSectionTagIDs)
    objc_msgSend(v3, "setObject:forKey:", editorialSectionTagIDs, CFSTR("editorialSectionTagIDs"));
  spotlightArticleID = self->_spotlightArticleID;
  if (spotlightArticleID)
    objc_msgSend(v3, "setObject:forKey:", spotlightArticleID, CFSTR("spotlightArticleID"));
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  if (todayFeedTopStoriesArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", todayFeedTopStoriesArticleIDs, CFSTR("todayFeedTopStoriesArticleIDs"));
  todayFeedConfiguration = self->_todayFeedConfiguration;
  if (todayFeedConfiguration)
    objc_msgSend(v3, "setObject:forKey:", todayFeedConfiguration, CFSTR("todayFeedConfiguration"));
  return v3;
}

- (void)writeTo:(id)a3
{
  NSMutableArray *editorialArticleListIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *editorialSectionTagIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *todayFeedTopStoriesArticleIDs;
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
  if (self->_configuration)
    PBDataWriterWriteStringField();
  if (self->_trendingArticleListID)
    PBDataWriterWriteStringField();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  editorialArticleListIDs = self->_editorialArticleListIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialArticleListIDs, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(editorialArticleListIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialArticleListIDs, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  editorialSectionTagIDs = self->_editorialSectionTagIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialSectionTagIDs, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(editorialSectionTagIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](editorialSectionTagIDs, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v11);
  }
  if (self->_spotlightArticleID)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayFeedTopStoriesArticleIDs, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(todayFeedTopStoriesArticleIDs);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todayFeedTopStoriesArticleIDs, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }
  if (self->_todayFeedConfiguration)
    PBDataWriterWriteStringField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *configuration;
  NSString *trendingArticleListID;
  NSMutableArray *editorialArticleListIDs;
  NSMutableArray *editorialSectionTagIDs;
  NSString *spotlightArticleID;
  NSMutableArray *todayFeedTopStoriesArticleIDs;
  NSString *todayFeedConfiguration;

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
        trendingArticleListID = self->_trendingArticleListID;
        if (!((unint64_t)trendingArticleListID | *((_QWORD *)a3 + 8))
          || (v5 = -[NSString isEqual:](trendingArticleListID, "isEqual:")) != 0)
        {
          editorialArticleListIDs = self->_editorialArticleListIDs;
          if (!((unint64_t)editorialArticleListIDs | *((_QWORD *)a3 + 3))
            || (v5 = -[NSMutableArray isEqual:](editorialArticleListIDs, "isEqual:")) != 0)
          {
            editorialSectionTagIDs = self->_editorialSectionTagIDs;
            if (!((unint64_t)editorialSectionTagIDs | *((_QWORD *)a3 + 4))
              || (v5 = -[NSMutableArray isEqual:](editorialSectionTagIDs, "isEqual:")) != 0)
            {
              spotlightArticleID = self->_spotlightArticleID;
              if (!((unint64_t)spotlightArticleID | *((_QWORD *)a3 + 5))
                || (v5 = -[NSString isEqual:](spotlightArticleID, "isEqual:")) != 0)
              {
                todayFeedTopStoriesArticleIDs = self->_todayFeedTopStoriesArticleIDs;
                if (!((unint64_t)todayFeedTopStoriesArticleIDs | *((_QWORD *)a3 + 7))
                  || (v5 = -[NSMutableArray isEqual:](todayFeedTopStoriesArticleIDs, "isEqual:")) != 0)
                {
                  todayFeedConfiguration = self->_todayFeedConfiguration;
                  if ((unint64_t)todayFeedConfiguration | *((_QWORD *)a3 + 6))
                    LOBYTE(v5) = -[NSString isEqual:](todayFeedConfiguration, "isEqual:");
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
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_configuration, "hash") ^ v3;
  v5 = -[NSString hash](self->_trendingArticleListID, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_editorialArticleListIDs, "hash");
  v7 = -[NSMutableArray hash](self->_editorialSectionTagIDs, "hash");
  v8 = v7 ^ -[NSString hash](self->_spotlightArticleID, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_todayFeedTopStoriesArticleIDs, "hash");
  return v9 ^ -[NSString hash](self->_todayFeedConfiguration, "hash");
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
  v6 = *((_QWORD *)a3 + 1);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBForYouConfigRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 2))
    -[NTPBForYouConfigRecord setConfiguration:](self, "setConfiguration:");
  if (*((_QWORD *)a3 + 8))
    -[NTPBForYouConfigRecord setTrendingArticleListID:](self, "setTrendingArticleListID:");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 3);
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
        -[NTPBForYouConfigRecord addEditorialArticleListIDs:](self, "addEditorialArticleListIDs:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
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
        -[NTPBForYouConfigRecord addEditorialSectionTagIDs:](self, "addEditorialSectionTagIDs:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }
  if (*((_QWORD *)a3 + 5))
    -[NTPBForYouConfigRecord setSpotlightArticleID:](self, "setSpotlightArticleID:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 7);
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
        -[NTPBForYouConfigRecord addTodayFeedTopStoriesArticleIDs:](self, "addTodayFeedTopStoriesArticleIDs:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }
  if (*((_QWORD *)a3 + 6))
    -[NTPBForYouConfigRecord setTodayFeedConfiguration:](self, "setTodayFeedConfiguration:");
}

- (NSString)configuration
{
  return self->_configuration;
}

- (NSString)trendingArticleListID
{
  return self->_trendingArticleListID;
}

- (NSMutableArray)editorialArticleListIDs
{
  return self->_editorialArticleListIDs;
}

- (NSMutableArray)editorialSectionTagIDs
{
  return self->_editorialSectionTagIDs;
}

- (NSString)spotlightArticleID
{
  return self->_spotlightArticleID;
}

@end
