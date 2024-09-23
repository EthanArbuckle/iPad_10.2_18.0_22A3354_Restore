@implementation NTPBSearchExecute

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (int)searchLocation
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_searchLocation;
  else
    return 0;
}

- (void)setSearchLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_searchLocation = a3;
}

- (void)setHasSearchLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSearchLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)searchLocationAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD507B8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SEARCH_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_BAR_SEARCH_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TAB_SEARCH_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_TAB_SEARCH_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOC_SEARCH_LOCATION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)searchExecutionMethod
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_searchExecutionMethod;
  else
    return 0;
}

- (void)setSearchExecutionMethod:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_searchExecutionMethod = a3;
}

- (void)setHasSearchExecutionMethod:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSearchExecutionMethod
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)searchExecutionMethodAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD507E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchExecutionMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SEARCH_EXECUTION_METHOD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCHTAP_SEARCH_EXECUTION_METHOD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH_EXECUTION_METHOD")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTotalResults:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalResults = a3;
}

- (void)setHasTotalResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalResults
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopResultFeedId
{
  return self->_topResultFeedId != 0;
}

- (void)clearTopicResultFeedIds
{
  -[NSMutableArray removeAllObjects](self->_topicResultFeedIds, "removeAllObjects");
}

- (void)addTopicResultFeedIds:(id)a3
{
  id v4;
  NSMutableArray *topicResultFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicResultFeedIds = self->_topicResultFeedIds;
  v8 = v4;
  if (!topicResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicResultFeedIds;
    self->_topicResultFeedIds = v6;

    v4 = v8;
    topicResultFeedIds = self->_topicResultFeedIds;
  }
  -[NSMutableArray addObject:](topicResultFeedIds, "addObject:", v4);

}

- (unint64_t)topicResultFeedIdsCount
{
  return -[NSMutableArray count](self->_topicResultFeedIds, "count");
}

- (id)topicResultFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicResultFeedIds, "objectAtIndex:", a3);
}

+ (Class)topicResultFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelResultFeedIds
{
  -[NSMutableArray removeAllObjects](self->_channelResultFeedIds, "removeAllObjects");
}

- (void)addChannelResultFeedIds:(id)a3
{
  id v4;
  NSMutableArray *channelResultFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelResultFeedIds = self->_channelResultFeedIds;
  v8 = v4;
  if (!channelResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelResultFeedIds;
    self->_channelResultFeedIds = v6;

    v4 = v8;
    channelResultFeedIds = self->_channelResultFeedIds;
  }
  -[NSMutableArray addObject:](channelResultFeedIds, "addObject:", v4);

}

- (unint64_t)channelResultFeedIdsCount
{
  return -[NSMutableArray count](self->_channelResultFeedIds, "count");
}

- (id)channelResultFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelResultFeedIds, "objectAtIndex:", a3);
}

+ (Class)channelResultFeedIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (BOOL)hasTopResultArticleId
{
  return self->_topResultArticleId != 0;
}

- (BOOL)hasTopResultChannelId
{
  return self->_topResultChannelId != 0;
}

- (BOOL)hasTopResultTopicId
{
  return self->_topResultTopicId != 0;
}

- (void)clearArticleResultIds
{
  -[NSMutableArray removeAllObjects](self->_articleResultIds, "removeAllObjects");
}

- (void)addArticleResultIds:(id)a3
{
  id v4;
  NSMutableArray *articleResultIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  articleResultIds = self->_articleResultIds;
  v8 = v4;
  if (!articleResultIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_articleResultIds;
    self->_articleResultIds = v6;

    v4 = v8;
    articleResultIds = self->_articleResultIds;
  }
  -[NSMutableArray addObject:](articleResultIds, "addObject:", v4);

}

- (unint64_t)articleResultIdsCount
{
  return -[NSMutableArray count](self->_articleResultIds, "count");
}

- (id)articleResultIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleResultIds, "objectAtIndex:", a3);
}

+ (Class)articleResultIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompletedSearchString
{
  return self->_completedSearchString != 0;
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
  v8.super_class = (Class)NTPBSearchExecute;
  -[NTPBSearchExecute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBSearchExecute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *searchString;
  char has;
  void *v7;
  NSString *topResultFeedId;
  NSMutableArray *topicResultFeedIds;
  NSMutableArray *channelResultFeedIds;
  NSString *storeFrontId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *topResultArticleId;
  NSString *topResultChannelId;
  NSString *topResultTopicId;
  NSMutableArray *articleResultIds;
  NSString *completedSearchString;
  uint64_t searchLocation;
  __CFString *v22;
  uint64_t searchExecutionMethod;
  __CFString *v24;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("search_string"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    searchLocation = self->_searchLocation;
    if (searchLocation >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_searchLocation);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_24CD507B8[searchLocation];
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("search_location"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  searchExecutionMethod = self->_searchExecutionMethod;
  if (searchExecutionMethod >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_searchExecutionMethod);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_24CD507E0[searchExecutionMethod];
  }
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("search_execution_method"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalResults);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("total_results"));

  }
LABEL_7:
  topResultFeedId = self->_topResultFeedId;
  if (topResultFeedId)
    objc_msgSend(v4, "setObject:forKey:", topResultFeedId, CFSTR("top_result_feed_id"));
  topicResultFeedIds = self->_topicResultFeedIds;
  if (topicResultFeedIds)
    objc_msgSend(v4, "setObject:forKey:", topicResultFeedIds, CFSTR("topic_result_feed_ids"));
  channelResultFeedIds = self->_channelResultFeedIds;
  if (channelResultFeedIds)
    objc_msgSend(v4, "setObject:forKey:", channelResultFeedIds, CFSTR("channel_result_feed_ids"));
  storeFrontId = self->_storeFrontId;
  if (storeFrontId)
    objc_msgSend(v4, "setObject:forKey:", storeFrontId, CFSTR("store_front_id"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v4, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v4, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v4, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  topResultArticleId = self->_topResultArticleId;
  if (topResultArticleId)
    objc_msgSend(v4, "setObject:forKey:", topResultArticleId, CFSTR("top_result_article_id"));
  topResultChannelId = self->_topResultChannelId;
  if (topResultChannelId)
    objc_msgSend(v4, "setObject:forKey:", topResultChannelId, CFSTR("top_result_channel_id"));
  topResultTopicId = self->_topResultTopicId;
  if (topResultTopicId)
    objc_msgSend(v4, "setObject:forKey:", topResultTopicId, CFSTR("top_result_topic_id"));
  articleResultIds = self->_articleResultIds;
  if (articleResultIds)
    objc_msgSend(v4, "setObject:forKey:", articleResultIds, CFSTR("article_result_ids"));
  completedSearchString = self->_completedSearchString;
  if (completedSearchString)
    objc_msgSend(v4, "setObject:forKey:", completedSearchString, CFSTR("completed_search_string"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchExecuteReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_searchString)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_topResultFeedId)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_topicResultFeedIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_channelResultFeedIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  if (self->_storeFrontId)
    PBDataWriterWriteStringField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if (self->_topResultArticleId)
    PBDataWriterWriteStringField();
  if (self->_topResultChannelId)
    PBDataWriterWriteStringField();
  if (self->_topResultTopicId)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_articleResultIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (self->_completedSearchString)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_searchLocation;
    *(_BYTE *)(v5 + 124) |= 2u;
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
  *(_DWORD *)(v5 + 56) = self->_searchExecutionMethod;
  *(_BYTE *)(v5 + 124) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 120) = self->_totalResults;
    *(_BYTE *)(v5 + 124) |= 4u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_topResultFeedId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = self->_topicResultFeedIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopicResultFeedIds:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v13);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = self->_channelResultFeedIds;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v51 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelResultFeedIds:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v19);
  }

  v23 = -[NSString copyWithZone:](self->_storeFrontId, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v23;

  v25 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;

  v27 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v27;

  v29 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v29;

  v31 = -[NSString copyWithZone:](self->_topResultArticleId, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v31;

  v33 = -[NSString copyWithZone:](self->_topResultChannelId, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v33;

  v35 = -[NSString copyWithZone:](self->_topResultTopicId, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v35;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = self->_articleResultIds;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addArticleResultIds:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v39);
  }

  v43 = -[NSString copyWithZone:](self->_completedSearchString, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v43;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  NSString *topResultFeedId;
  NSMutableArray *topicResultFeedIds;
  NSMutableArray *channelResultFeedIds;
  NSString *storeFrontId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *topResultArticleId;
  NSString *topResultChannelId;
  NSString *topResultTopicId;
  NSMutableArray *articleResultIds;
  NSString *completedSearchString;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 2) == 0 || self->_searchLocation != *((_DWORD *)v4 + 15))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 124) & 2) != 0)
  {
LABEL_43:
    v18 = 0;
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 1) == 0 || self->_searchExecutionMethod != *((_DWORD *)v4 + 14))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 4) == 0 || self->_totalResults != *((_DWORD *)v4 + 30))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 124) & 4) != 0)
  {
    goto LABEL_43;
  }
  topResultFeedId = self->_topResultFeedId;
  if ((unint64_t)topResultFeedId | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](topResultFeedId, "isEqual:"))
  {
    goto LABEL_43;
  }
  topicResultFeedIds = self->_topicResultFeedIds;
  if ((unint64_t)topicResultFeedIds | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](topicResultFeedIds, "isEqual:"))
      goto LABEL_43;
  }
  channelResultFeedIds = self->_channelResultFeedIds;
  if ((unint64_t)channelResultFeedIds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](channelResultFeedIds, "isEqual:"))
      goto LABEL_43;
  }
  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](storeFrontId, "isEqual:"))
      goto LABEL_43;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_43;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_43;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_43;
  }
  topResultArticleId = self->_topResultArticleId;
  if ((unint64_t)topResultArticleId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](topResultArticleId, "isEqual:"))
      goto LABEL_43;
  }
  topResultChannelId = self->_topResultChannelId;
  if ((unint64_t)topResultChannelId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](topResultChannelId, "isEqual:"))
      goto LABEL_43;
  }
  topResultTopicId = self->_topResultTopicId;
  if ((unint64_t)topResultTopicId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](topResultTopicId, "isEqual:"))
      goto LABEL_43;
  }
  articleResultIds = self->_articleResultIds;
  if ((unint64_t)articleResultIds | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](articleResultIds, "isEqual:"))
      goto LABEL_43;
  }
  completedSearchString = self->_completedSearchString;
  if ((unint64_t)completedSearchString | *((_QWORD *)v4 + 5))
    v18 = -[NSString isEqual:](completedSearchString, "isEqual:");
  else
    v18 = 1;
LABEL_44:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;

  v3 = -[NSString hash](self->_searchString, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = 2654435761 * self->_searchLocation;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_searchExecutionMethod;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_totalResults;
LABEL_8:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_topResultFeedId, "hash");
  v8 = -[NSMutableArray hash](self->_topicResultFeedIds, "hash");
  v9 = v8 ^ -[NSMutableArray hash](self->_channelResultFeedIds, "hash");
  v10 = v7 ^ v9 ^ -[NSString hash](self->_storeFrontId, "hash");
  v11 = -[NSString hash](self->_campaignId, "hash");
  v12 = v11 ^ -[NSString hash](self->_campaignType, "hash");
  v13 = v12 ^ -[NSString hash](self->_creativeId, "hash");
  v14 = v10 ^ v13 ^ -[NSString hash](self->_topResultArticleId, "hash");
  v15 = -[NSString hash](self->_topResultChannelId, "hash");
  v16 = v15 ^ -[NSString hash](self->_topResultTopicId, "hash");
  v17 = v16 ^ -[NSMutableArray hash](self->_articleResultIds, "hash");
  return v14 ^ v17 ^ -[NSString hash](self->_completedSearchString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 8))
    -[NTPBSearchExecute setSearchString:](self, "setSearchString:");
  v5 = *((_BYTE *)v4 + 124);
  if ((v5 & 2) != 0)
  {
    self->_searchLocation = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 124);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 124) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_searchExecutionMethod = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 124) & 4) != 0)
  {
LABEL_6:
    self->_totalResults = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 12))
    -[NTPBSearchExecute setTopResultFeedId:](self, "setTopResultFeedId:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 14);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[NTPBSearchExecute addTopicResultFeedIds:](self, "addTopicResultFeedIds:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[NTPBSearchExecute addChannelResultFeedIds:](self, "addChannelResultFeedIds:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 9))
    -[NTPBSearchExecute setStoreFrontId:](self, "setStoreFrontId:");
  if (*((_QWORD *)v4 + 2))
    -[NTPBSearchExecute setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBSearchExecute setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v4 + 6))
    -[NTPBSearchExecute setCreativeId:](self, "setCreativeId:");
  if (*((_QWORD *)v4 + 10))
    -[NTPBSearchExecute setTopResultArticleId:](self, "setTopResultArticleId:");
  if (*((_QWORD *)v4 + 11))
    -[NTPBSearchExecute setTopResultChannelId:](self, "setTopResultChannelId:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBSearchExecute setTopResultTopicId:](self, "setTopResultTopicId:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 1);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[NTPBSearchExecute addArticleResultIds:](self, "addArticleResultIds:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 5))
    -[NTPBSearchExecute setCompletedSearchString:](self, "setCompletedSearchString:");

}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (int)totalResults
{
  return self->_totalResults;
}

- (NSString)topResultFeedId
{
  return self->_topResultFeedId;
}

- (void)setTopResultFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_topResultFeedId, a3);
}

- (NSMutableArray)topicResultFeedIds
{
  return self->_topicResultFeedIds;
}

- (void)setTopicResultFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicResultFeedIds, a3);
}

- (NSMutableArray)channelResultFeedIds
{
  return self->_channelResultFeedIds;
}

- (void)setChannelResultFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_channelResultFeedIds, a3);
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontId, a3);
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
  objc_storeStrong((id *)&self->_campaignType, a3);
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_creativeId, a3);
}

- (NSString)topResultArticleId
{
  return self->_topResultArticleId;
}

- (void)setTopResultArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_topResultArticleId, a3);
}

- (NSString)topResultChannelId
{
  return self->_topResultChannelId;
}

- (void)setTopResultChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_topResultChannelId, a3);
}

- (NSString)topResultTopicId
{
  return self->_topResultTopicId;
}

- (void)setTopResultTopicId:(id)a3
{
  objc_storeStrong((id *)&self->_topResultTopicId, a3);
}

- (NSMutableArray)articleResultIds
{
  return self->_articleResultIds;
}

- (void)setArticleResultIds:(id)a3
{
  objc_storeStrong((id *)&self->_articleResultIds, a3);
}

- (NSString)completedSearchString
{
  return self->_completedSearchString;
}

- (void)setCompletedSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_completedSearchString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicResultFeedIds, 0);
  objc_storeStrong((id *)&self->_topResultTopicId, 0);
  objc_storeStrong((id *)&self->_topResultFeedId, 0);
  objc_storeStrong((id *)&self->_topResultChannelId, 0);
  objc_storeStrong((id *)&self->_topResultArticleId, 0);
  objc_storeStrong((id *)&self->_storeFrontId, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_completedSearchString, 0);
  objc_storeStrong((id *)&self->_channelResultFeedIds, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleResultIds, 0);
}

@end
