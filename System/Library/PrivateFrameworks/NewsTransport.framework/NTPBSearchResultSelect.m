@implementation NTPBSearchResultSelect

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (int)searchLocation
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_searchLocation;
  else
    return 0;
}

- (void)setSearchLocation:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_searchLocation = a3;
}

- (void)setHasSearchLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSearchLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)searchLocationAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD51040[a3];
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

- (int)selectedResultType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_selectedResultType;
  else
    return 0;
}

- (void)setSelectedResultType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_selectedResultType = a3;
}

- (void)setHasSelectedResultType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSelectedResultType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)selectedResultActionType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_selectedResultActionType;
  else
    return 0;
}

- (void)setSelectedResultActionType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_selectedResultActionType = a3;
}

- (void)setHasSelectedResultActionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSelectedResultActionType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)selectedResultSection
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_selectedResultSection;
  else
    return 0;
}

- (void)setSelectedResultSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_selectedResultSection = a3;
}

- (void)setHasSelectedResultSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSelectedResultSection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSelectedResultString
{
  return self->_selectedResultString != 0;
}

- (BOOL)hasSelectedResultFeedId
{
  return self->_selectedResultFeedId != 0;
}

- (void)setSelectedResultRankInSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_selectedResultRankInSection = a3;
}

- (void)setHasSelectedResultRankInSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSelectedResultRankInSection
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSelectedResultShowMore:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selectedResultShowMore = a3;
}

- (void)setHasSelectedResultShowMore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelectedResultShowMore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)searchExecutionMethod
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_searchExecutionMethod;
  else
    return 0;
}

- (void)setSearchExecutionMethod:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_searchExecutionMethod = a3;
}

- (void)setHasSearchExecutionMethod:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSearchExecutionMethod
{
  return *(_WORD *)&self->_has & 1;
}

- (id)searchExecutionMethodAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD51068[a3];
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
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalResults = a3;
}

- (void)setHasTotalResults:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalResults
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalResultsInSelectedSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalResultsInSelectedSection = a3;
}

- (void)setHasTotalResultsInSelectedSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalResultsInSelectedSection
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearNonSelectedResultFeedIds
{
  -[NSMutableArray removeAllObjects](self->_nonSelectedResultFeedIds, "removeAllObjects");
}

- (void)addNonSelectedResultFeedId:(id)a3
{
  id v4;
  NSMutableArray *nonSelectedResultFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  v8 = v4;
  if (!nonSelectedResultFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_nonSelectedResultFeedIds;
    self->_nonSelectedResultFeedIds = v6;

    v4 = v8;
    nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  }
  -[NSMutableArray addObject:](nonSelectedResultFeedIds, "addObject:", v4);

}

- (unint64_t)nonSelectedResultFeedIdsCount
{
  return -[NSMutableArray count](self->_nonSelectedResultFeedIds, "count");
}

- (id)nonSelectedResultFeedIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nonSelectedResultFeedIds, "objectAtIndex:", a3);
}

+ (Class)nonSelectedResultFeedIdType
{
  return (Class)objc_opt_class();
}

- (void)setDidSelectResult:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_didSelectResult = a3;
}

- (void)setHasDidSelectResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDidSelectResult
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearSearchResults
{
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
}

- (void)addSearchResults:(id)a3
{
  id v4;
  NSMutableArray *searchResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  searchResults = self->_searchResults;
  v8 = v4;
  if (!searchResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_searchResults;
    self->_searchResults = v6;

    v4 = v8;
    searchResults = self->_searchResults;
  }
  -[NSMutableArray addObject:](searchResults, "addObject:", v4);

}

- (unint64_t)searchResultsCount
{
  return -[NSMutableArray count](self->_searchResults, "count");
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_searchResults, "objectAtIndex:", a3);
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
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

- (int)searchResultSelectLocation
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_searchResultSelectLocation;
  else
    return 0;
}

- (void)setSearchResultSelectLocation:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_searchResultSelectLocation = a3;
}

- (void)setHasSearchResultSelectLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSearchResultSelectLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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

- (BOOL)hasSelectedResultArticleId
{
  return self->_selectedResultArticleId != 0;
}

- (void)clearArticleResultArticleIds
{
  -[NSMutableArray removeAllObjects](self->_articleResultArticleIds, "removeAllObjects");
}

- (void)addArticleResultArticleIds:(id)a3
{
  id v4;
  NSMutableArray *articleResultArticleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  articleResultArticleIds = self->_articleResultArticleIds;
  v8 = v4;
  if (!articleResultArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_articleResultArticleIds;
    self->_articleResultArticleIds = v6;

    v4 = v8;
    articleResultArticleIds = self->_articleResultArticleIds;
  }
  -[NSMutableArray addObject:](articleResultArticleIds, "addObject:", v4);

}

- (unint64_t)articleResultArticleIdsCount
{
  return -[NSMutableArray count](self->_articleResultArticleIds, "count");
}

- (id)articleResultArticleIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleResultArticleIds, "objectAtIndex:", a3);
}

+ (Class)articleResultArticleIdsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NTPBSearchResultSelect;
  -[NTPBSearchResultSelect description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBSearchResultSelect dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int16 has;
  uint64_t searchLocation;
  __CFString *v8;
  void *v9;
  NSString *selectedResultString;
  NSString *selectedResultFeedId;
  __int16 v12;
  void *v13;
  NSMutableArray *nonSelectedResultFeedIds;
  void *v15;
  NSMutableArray *searchResults;
  NSString *topResultFeedId;
  NSMutableArray *topicResultFeedIds;
  NSMutableArray *channelResultFeedIds;
  NSString *storeFrontId;
  void *v21;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *selectedResultArticleId;
  NSMutableArray *articleResultArticleIds;
  NSString *topResultArticleId;
  NSString *topResultChannelId;
  NSString *topResultTopicId;
  NSString *completedSearchString;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t searchExecutionMethod;
  __CFString *v38;
  void *v39;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("search_string"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    searchLocation = self->_searchLocation;
    if (searchLocation >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_searchLocation);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24CD51040[searchLocation];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("search_location"));

    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selectedResultType);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("selected_result_type"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selectedResultActionType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("selected_result_action_type"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selectedResultSection);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("selected_result_section"));

  }
LABEL_12:
  selectedResultString = self->_selectedResultString;
  if (selectedResultString)
    objc_msgSend(v4, "setObject:forKey:", selectedResultString, CFSTR("selected_result_string"));
  selectedResultFeedId = self->_selectedResultFeedId;
  if (selectedResultFeedId)
    objc_msgSend(v4, "setObject:forKey:", selectedResultFeedId, CFSTR("selected_result_feed_id"));
  v12 = (__int16)self->_has;
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_selectedResultRankInSection);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("selected_result_rank_in_section"));

    v12 = (__int16)self->_has;
    if ((v12 & 0x400) == 0)
    {
LABEL_18:
      if ((v12 & 1) == 0)
        goto LABEL_19;
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_selectedResultShowMore);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("selected_result_show_more"));

  v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_19:
    if ((v12 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_66;
  }
LABEL_62:
  searchExecutionMethod = self->_searchExecutionMethod;
  if (searchExecutionMethod >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_searchExecutionMethod);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = off_24CD51068[searchExecutionMethod];
  }
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("search_execution_method"));

  v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_20:
    if ((v12 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalResults);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("total_results"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalResultsInSelectedSection);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("total_results_in_selected_section"));

  }
LABEL_22:
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  if (nonSelectedResultFeedIds)
    objc_msgSend(v4, "setObject:forKey:", nonSelectedResultFeedIds, CFSTR("non_selected_result_feed_id"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didSelectResult);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("did_select_result"));

  }
  searchResults = self->_searchResults;
  if (searchResults)
    objc_msgSend(v4, "setObject:forKey:", searchResults, CFSTR("search_results"));
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
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_searchResultSelectLocation);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("search_result_select_location"));

  }
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v4, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v4, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v4, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  selectedResultArticleId = self->_selectedResultArticleId;
  if (selectedResultArticleId)
    objc_msgSend(v4, "setObject:forKey:", selectedResultArticleId, CFSTR("selected_result_article_id"));
  articleResultArticleIds = self->_articleResultArticleIds;
  if (articleResultArticleIds)
    objc_msgSend(v4, "setObject:forKey:", articleResultArticleIds, CFSTR("article_result_article_ids"));
  topResultArticleId = self->_topResultArticleId;
  if (topResultArticleId)
    objc_msgSend(v4, "setObject:forKey:", topResultArticleId, CFSTR("top_result_article_id"));
  topResultChannelId = self->_topResultChannelId;
  if (topResultChannelId)
    objc_msgSend(v4, "setObject:forKey:", topResultChannelId, CFSTR("top_result_channel_id"));
  topResultTopicId = self->_topResultTopicId;
  if (topResultTopicId)
    objc_msgSend(v4, "setObject:forKey:", topResultTopicId, CFSTR("top_result_topic_id"));
  completedSearchString = self->_completedSearchString;
  if (completedSearchString)
    objc_msgSend(v4, "setObject:forKey:", completedSearchString, CFSTR("completed_search_string"));
  v31 = v4;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSearchResultSelectReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_searchString)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_80;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  if (self->_selectedResultString)
    PBDataWriterWriteStringField();
  if (self->_selectedResultFeedId)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_14:
      if ((v6 & 1) == 0)
        goto LABEL_15;
      goto LABEL_84;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_nonSelectedResultFeedIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
    PBDataWriterWriteBOOLField();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_searchResults;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  if (self->_topResultFeedId)
    PBDataWriterWriteStringField();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_topicResultFeedIds;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_channelResultFeedIds;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  if (self->_storeFrontId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if (self->_selectedResultArticleId)
    PBDataWriterWriteStringField();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self->_articleResultArticleIds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteStringField();
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

  if (self->_topResultArticleId)
    PBDataWriterWriteStringField();
  if (self->_topResultChannelId)
    PBDataWriterWriteStringField();
  if (self->_topResultTopicId)
    PBDataWriterWriteStringField();
  if (self->_completedSearchString)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_searchLocation;
    *(_WORD *)(v5 + 204) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 136) = self->_selectedResultType;
  *(_WORD *)(v5 + 204) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_54:
  *(_DWORD *)(v5 + 96) = self->_selectedResultActionType;
  *(_WORD *)(v5 + 204) |= 8u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 124) = self->_selectedResultSection;
    *(_WORD *)(v5 + 204) |= 0x20u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_selectedResultString, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v9;

  v11 = -[NSString copyWithZone:](self->_selectedResultFeedId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_selectedResultRankInSection;
    *(_WORD *)(v5 + 204) |= 0x10u;
    v13 = (__int16)self->_has;
    if ((v13 & 0x400) == 0)
    {
LABEL_8:
      if ((v13 & 1) == 0)
        goto LABEL_9;
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *(_BYTE *)(v5 + 201) = self->_selectedResultShowMore;
  *(_WORD *)(v5 + 204) |= 0x400u;
  v13 = (__int16)self->_has;
  if ((v13 & 1) == 0)
  {
LABEL_9:
    if ((v13 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 64) = self->_searchExecutionMethod;
  *(_WORD *)(v5 + 204) |= 1u;
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_10:
    if ((v13 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_59:
  *(_DWORD *)(v5 + 192) = self->_totalResults;
  *(_WORD *)(v5 + 204) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 196) = self->_totalResultsInSelectedSection;
    *(_WORD *)(v5 + 204) |= 0x100u;
  }
LABEL_12:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v14 = self->_nonSelectedResultFeedIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v82 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNonSelectedResultFeedId:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 200) = self->_didSelectResult;
    *(_WORD *)(v5 + 204) |= 0x200u;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v20 = self->_searchResults;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v78 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSearchResults:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    }
    while (v22);
  }

  v26 = -[NSString copyWithZone:](self->_topResultFeedId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v26;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v28 = self->_topicResultFeedIds;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v74 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopicResultFeedIds:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v30);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v34 = self->_channelResultFeedIds;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v70;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v70 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelResultFeedIds:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    }
    while (v36);
  }

  v40 = -[NSString copyWithZone:](self->_storeFrontId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v40;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchResultSelectLocation;
    *(_WORD *)(v5 + 204) |= 4u;
  }
  v42 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v42;

  v44 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v44;

  v46 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v46;

  v48 = -[NSString copyWithZone:](self->_selectedResultArticleId, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v48;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v50 = self->_articleResultArticleIds;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v66;
    do
    {
      for (n = 0; n != v52; ++n)
      {
        if (*(_QWORD *)v66 != v53)
          objc_enumerationMutation(v50);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v65);
        objc_msgSend((id)v5, "addArticleResultArticleIds:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    }
    while (v52);
  }

  v56 = -[NSString copyWithZone:](self->_topResultArticleId, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v56;

  v58 = -[NSString copyWithZone:](self->_topResultChannelId, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v58;

  v60 = -[NSString copyWithZone:](self->_topResultTopicId, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v60;

  v62 = -[NSString copyWithZone:](self->_completedSearchString, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v62;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchString;
  __int16 has;
  __int16 v7;
  NSString *selectedResultString;
  NSString *selectedResultFeedId;
  __int16 v10;
  __int16 v11;
  NSMutableArray *nonSelectedResultFeedIds;
  NSMutableArray *searchResults;
  NSString *topResultFeedId;
  NSMutableArray *topicResultFeedIds;
  NSMutableArray *channelResultFeedIds;
  NSString *storeFrontId;
  __int16 v18;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *selectedResultArticleId;
  NSMutableArray *articleResultArticleIds;
  NSString *topResultArticleId;
  NSString *topResultChannelId;
  NSString *topResultTopicId;
  NSString *completedSearchString;
  char v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_100;
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:"))
      goto LABEL_100;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 102);
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_searchLocation != *((_DWORD *)v4 + 17))
      goto LABEL_100;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_selectedResultType != *((_DWORD *)v4 + 34))
      goto LABEL_100;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_selectedResultActionType != *((_DWORD *)v4 + 24))
      goto LABEL_100;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_100;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_selectedResultSection != *((_DWORD *)v4 + 31))
      goto LABEL_100;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_100;
  }
  selectedResultString = self->_selectedResultString;
  if ((unint64_t)selectedResultString | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](selectedResultString, "isEqual:"))
  {
    goto LABEL_100;
  }
  selectedResultFeedId = self->_selectedResultFeedId;
  if ((unint64_t)selectedResultFeedId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](selectedResultFeedId, "isEqual:"))
      goto LABEL_100;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 102);
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_selectedResultRankInSection != *((_DWORD *)v4 + 30))
      goto LABEL_100;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x400) == 0)
      goto LABEL_100;
    if (self->_selectedResultShowMore)
    {
      if (!*((_BYTE *)v4 + 201))
        goto LABEL_100;
    }
    else if (*((_BYTE *)v4 + 201))
    {
      goto LABEL_100;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) != 0)
  {
    goto LABEL_100;
  }
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_searchExecutionMethod != *((_DWORD *)v4 + 16))
      goto LABEL_100;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_100;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_totalResults != *((_DWORD *)v4 + 48))
      goto LABEL_100;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_100;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x100) == 0 || self->_totalResultsInSelectedSection != *((_DWORD *)v4 + 49))
      goto LABEL_100;
  }
  else if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
    goto LABEL_100;
  }
  nonSelectedResultFeedIds = self->_nonSelectedResultFeedIds;
  if ((unint64_t)nonSelectedResultFeedIds | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](nonSelectedResultFeedIds, "isEqual:"))
      goto LABEL_100;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 102) & 0x200) != 0)
    {
      if (self->_didSelectResult)
      {
        if (!*((_BYTE *)v4 + 200))
          goto LABEL_100;
        goto LABEL_67;
      }
      if (!*((_BYTE *)v4 + 200))
        goto LABEL_67;
    }
LABEL_100:
    v28 = 0;
    goto LABEL_101;
  }
  if ((*((_WORD *)v4 + 102) & 0x200) != 0)
    goto LABEL_100;
LABEL_67:
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((_QWORD *)v4 + 10)
    && !-[NSMutableArray isEqual:](searchResults, "isEqual:"))
  {
    goto LABEL_100;
  }
  topResultFeedId = self->_topResultFeedId;
  if ((unint64_t)topResultFeedId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](topResultFeedId, "isEqual:"))
      goto LABEL_100;
  }
  topicResultFeedIds = self->_topicResultFeedIds;
  if ((unint64_t)topicResultFeedIds | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](topicResultFeedIds, "isEqual:"))
      goto LABEL_100;
  }
  channelResultFeedIds = self->_channelResultFeedIds;
  if ((unint64_t)channelResultFeedIds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](channelResultFeedIds, "isEqual:"))
      goto LABEL_100;
  }
  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](storeFrontId, "isEqual:"))
      goto LABEL_100;
  }
  v18 = *((_WORD *)v4 + 102);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_searchResultSelectLocation != *((_DWORD *)v4 + 18))
      goto LABEL_100;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_100;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_100;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_100;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_100;
  }
  selectedResultArticleId = self->_selectedResultArticleId;
  if ((unint64_t)selectedResultArticleId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](selectedResultArticleId, "isEqual:"))
      goto LABEL_100;
  }
  articleResultArticleIds = self->_articleResultArticleIds;
  if ((unint64_t)articleResultArticleIds | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](articleResultArticleIds, "isEqual:"))
      goto LABEL_100;
  }
  topResultArticleId = self->_topResultArticleId;
  if ((unint64_t)topResultArticleId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](topResultArticleId, "isEqual:"))
      goto LABEL_100;
  }
  topResultChannelId = self->_topResultChannelId;
  if ((unint64_t)topResultChannelId | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](topResultChannelId, "isEqual:"))
      goto LABEL_100;
  }
  topResultTopicId = self->_topResultTopicId;
  if ((unint64_t)topResultTopicId | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](topResultTopicId, "isEqual:"))
      goto LABEL_100;
  }
  completedSearchString = self->_completedSearchString;
  if ((unint64_t)completedSearchString | *((_QWORD *)v4 + 5))
    v28 = -[NSString isEqual:](completedSearchString, "isEqual:");
  else
    v28 = 1;
LABEL_101:

  return v28;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;

  v34 = -[NSString hash](self->_searchString, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v33 = 2654435761 * self->_searchLocation;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v32 = 2654435761 * self->_selectedResultType;
      if ((has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v31 = 0;
      if ((has & 0x20) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v33 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v31 = 2654435761 * self->_selectedResultActionType;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v30 = 2654435761 * self->_selectedResultSection;
    goto LABEL_10;
  }
LABEL_9:
  v30 = 0;
LABEL_10:
  v29 = -[NSString hash](self->_selectedResultString, "hash");
  v28 = -[NSString hash](self->_selectedResultFeedId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    v27 = 2654435761 * self->_selectedResultRankInSection;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_12:
      v26 = 2654435761 * self->_selectedResultShowMore;
      if ((v4 & 1) != 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else
  {
    v27 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_12;
  }
  v26 = 0;
  if ((v4 & 1) != 0)
  {
LABEL_13:
    v25 = 2654435761 * self->_searchExecutionMethod;
    if ((v4 & 0x80) != 0)
      goto LABEL_14;
LABEL_19:
    v24 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_15;
    goto LABEL_20;
  }
LABEL_18:
  v25 = 0;
  if ((v4 & 0x80) == 0)
    goto LABEL_19;
LABEL_14:
  v24 = 2654435761 * self->_totalResults;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_15:
    v5 = 2654435761 * self->_totalResultsInSelectedSection;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
LABEL_21:
  v6 = -[NSMutableArray hash](self->_nonSelectedResultFeedIds, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v7 = 2654435761 * self->_didSelectResult;
  else
    v7 = 0;
  v8 = -[NSMutableArray hash](self->_searchResults, "hash");
  v9 = -[NSString hash](self->_topResultFeedId, "hash");
  v10 = -[NSMutableArray hash](self->_topicResultFeedIds, "hash");
  v11 = -[NSMutableArray hash](self->_channelResultFeedIds, "hash");
  v12 = -[NSString hash](self->_storeFrontId, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_searchResultSelectLocation;
  else
    v13 = 0;
  v14 = v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  v15 = -[NSString hash](self->_campaignId, "hash");
  v16 = v15 ^ -[NSString hash](self->_campaignType, "hash");
  v17 = v16 ^ -[NSString hash](self->_creativeId, "hash");
  v18 = v17 ^ -[NSString hash](self->_selectedResultArticleId, "hash");
  v19 = v18 ^ -[NSMutableArray hash](self->_articleResultArticleIds, "hash");
  v20 = v14 ^ v19 ^ -[NSString hash](self->_topResultArticleId, "hash");
  v21 = -[NSString hash](self->_topResultChannelId, "hash");
  v22 = v21 ^ -[NSString hash](self->_topResultTopicId, "hash");
  return v20 ^ v22 ^ -[NSString hash](self->_completedSearchString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 11))
    -[NTPBSearchResultSelect setSearchString:](self, "setSearchString:");
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 2) != 0)
  {
    self->_searchLocation = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 102);
    if ((v5 & 0x40) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_80;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_5;
  }
  self->_selectedResultType = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 102);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_80:
  self->_selectedResultActionType = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_7:
    self->_selectedResultSection = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 16))
    -[NTPBSearchResultSelect setSelectedResultString:](self, "setSelectedResultString:");
  if (*((_QWORD *)v4 + 14))
    -[NTPBSearchResultSelect setSelectedResultFeedId:](self, "setSelectedResultFeedId:");
  v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x10) != 0)
  {
    self->_selectedResultRankInSection = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)v4 + 102);
    if ((v6 & 0x400) == 0)
    {
LABEL_14:
      if ((v6 & 1) == 0)
        goto LABEL_15;
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 102) & 0x400) == 0)
  {
    goto LABEL_14;
  }
  self->_selectedResultShowMore = *((_BYTE *)v4 + 201);
  *(_WORD *)&self->_has |= 0x400u;
  v6 = *((_WORD *)v4 + 102);
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_85;
  }
LABEL_84:
  self->_searchExecutionMethod = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 1u;
  v6 = *((_WORD *)v4 + 102);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_85:
  self->_totalResults = *((_DWORD *)v4 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 102) & 0x100) != 0)
  {
LABEL_17:
    self->_totalResultsInSelectedSection = *((_DWORD *)v4 + 49);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_18:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        -[NTPBSearchResultSelect addNonSelectedResultFeedId:](self, "addNonSelectedResultFeedId:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  if ((*((_WORD *)v4 + 102) & 0x200) != 0)
  {
    self->_didSelectResult = *((_BYTE *)v4 + 200);
    *(_WORD *)&self->_has |= 0x200u;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = *((id *)v4 + 10);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        -[NTPBSearchResultSelect addSearchResults:](self, "addSearchResults:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  if (*((_QWORD *)v4 + 21))
    -[NTPBSearchResultSelect setTopResultFeedId:](self, "setTopResultFeedId:");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *((id *)v4 + 23);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        -[NTPBSearchResultSelect addTopicResultFeedIds:](self, "addTopicResultFeedIds:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = *((id *)v4 + 4);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        -[NTPBSearchResultSelect addChannelResultFeedIds:](self, "addChannelResultFeedIds:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  if (*((_QWORD *)v4 + 18))
    -[NTPBSearchResultSelect setStoreFrontId:](self, "setStoreFrontId:");
  if ((*((_WORD *)v4 + 102) & 4) != 0)
  {
    self->_searchResultSelectLocation = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NTPBSearchResultSelect setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBSearchResultSelect setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v4 + 6))
    -[NTPBSearchResultSelect setCreativeId:](self, "setCreativeId:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBSearchResultSelect setSelectedResultArticleId:](self, "setSelectedResultArticleId:");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = *((id *)v4 + 1);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[NTPBSearchResultSelect addArticleResultArticleIds:](self, "addArticleResultArticleIds:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * n), (_QWORD)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

  if (*((_QWORD *)v4 + 19))
    -[NTPBSearchResultSelect setTopResultArticleId:](self, "setTopResultArticleId:");
  if (*((_QWORD *)v4 + 20))
    -[NTPBSearchResultSelect setTopResultChannelId:](self, "setTopResultChannelId:");
  if (*((_QWORD *)v4 + 22))
    -[NTPBSearchResultSelect setTopResultTopicId:](self, "setTopResultTopicId:");
  if (*((_QWORD *)v4 + 5))
    -[NTPBSearchResultSelect setCompletedSearchString:](self, "setCompletedSearchString:");

}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSString)selectedResultString
{
  return self->_selectedResultString;
}

- (void)setSelectedResultString:(id)a3
{
  objc_storeStrong((id *)&self->_selectedResultString, a3);
}

- (NSString)selectedResultFeedId
{
  return self->_selectedResultFeedId;
}

- (void)setSelectedResultFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_selectedResultFeedId, a3);
}

- (int)selectedResultRankInSection
{
  return self->_selectedResultRankInSection;
}

- (BOOL)selectedResultShowMore
{
  return self->_selectedResultShowMore;
}

- (int)totalResults
{
  return self->_totalResults;
}

- (int)totalResultsInSelectedSection
{
  return self->_totalResultsInSelectedSection;
}

- (NSMutableArray)nonSelectedResultFeedIds
{
  return self->_nonSelectedResultFeedIds;
}

- (void)setNonSelectedResultFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_nonSelectedResultFeedIds, a3);
}

- (BOOL)didSelectResult
{
  return self->_didSelectResult;
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
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

- (NSString)selectedResultArticleId
{
  return self->_selectedResultArticleId;
}

- (void)setSelectedResultArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_selectedResultArticleId, a3);
}

- (NSMutableArray)articleResultArticleIds
{
  return self->_articleResultArticleIds;
}

- (void)setArticleResultArticleIds:(id)a3
{
  objc_storeStrong((id *)&self->_articleResultArticleIds, a3);
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
  objc_storeStrong((id *)&self->_selectedResultString, 0);
  objc_storeStrong((id *)&self->_selectedResultFeedId, 0);
  objc_storeStrong((id *)&self->_selectedResultArticleId, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_nonSelectedResultFeedIds, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_completedSearchString, 0);
  objc_storeStrong((id *)&self->_channelResultFeedIds, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleResultArticleIds, 0);
}

@end
