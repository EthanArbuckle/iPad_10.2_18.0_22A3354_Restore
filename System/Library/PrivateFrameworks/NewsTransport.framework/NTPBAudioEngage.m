@implementation NTPBAudioEngage

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)groupType
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasGroupType
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD507F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_ARTICLES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORS_PICKS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_TOPIC_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_ARTICLES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY_BRIEFINGS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREAT_STORIES_YOU_MISSED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FOR_YOU_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_SUBSCRIPTION_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_AND_GREATEST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTED_TOPICS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_VIDEOS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_VIDEOS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYMBOL_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECIRCULATION_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_PUB_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_MAGAZINES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ISSUE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ARTICLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ISSUE_ARTICLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED_ISSUES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEW_ISSUE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_LIST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ORDERED_ARTICLE_LIST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BEST_OF_BUNDLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWSPAPER_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_NEWS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_UP_NEXT_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FOR_YOU_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_RECENTLY_PLAYED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_DAILY_BRIEFING_GROUP_TYPE")))
  {
    v4 = 39;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (int)feedType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFeedType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD50938[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedType:(id)a3
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

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (void)setTrackDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_trackDuration = a3;
}

- (void)setHasTrackDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTrackDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)trackVariant
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_trackVariant;
  else
    return 0;
}

- (void)setTrackVariant:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_trackVariant = a3;
}

- (void)setHasTrackVariant:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTrackVariant
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)trackVariantAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD509E8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrackVariant:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRACK_VARIANT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAMPLE_TRACK_VARIANT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETE_TRACK_VARIANT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAudioTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audioTimePlayed = a3;
}

- (void)setHasAudioTimePlayed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudioTimePlayed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAudioDeltaTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_audioDeltaTimePlayed = a3;
}

- (void)setHasAudioDeltaTimePlayed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAudioDeltaTimePlayed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)userAction
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPosition:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPosition
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (int)playMethod
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_playMethod;
  else
    return 0;
}

- (void)setPlayMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_playMethod = a3;
}

- (void)setHasPlayMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPlayMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)listeningSource
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_listeningSource;
  else
    return 0;
}

- (void)setListeningSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_listeningSource = a3;
}

- (void)setHasListeningSource:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasListeningSource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)clearFractionalCohortMemberships
{
  -[NSMutableArray removeAllObjects](self->_fractionalCohortMemberships, "removeAllObjects");
}

- (void)addFractionalCohortMembership:(id)a3
{
  id v4;
  NSMutableArray *fractionalCohortMemberships;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  v8 = v4;
  if (!fractionalCohortMemberships)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_fractionalCohortMemberships;
    self->_fractionalCohortMemberships = v6;

    v4 = v8;
    fractionalCohortMemberships = self->_fractionalCohortMemberships;
  }
  -[NSMutableArray addObject:](fractionalCohortMemberships, "addObject:", v4);

}

- (unint64_t)fractionalCohortMembershipsCount
{
  return -[NSMutableArray count](self->_fractionalCohortMemberships, "count");
}

- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fractionalCohortMemberships, "objectAtIndex:", a3);
}

+ (Class)fractionalCohortMembershipType
{
  return (Class)objc_opt_class();
}

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAgedUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_agedUserFeedbackScore = a3;
}

- (void)setHasAgedUserFeedbackScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAgedUserFeedbackScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_autoSubscribeCtr = a3;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDiversifiedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_diversifiedPersonalizationScore = a3;
}

- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDiversifiedPersonalizationScore
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFeatureCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_featureCtr = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFeatureCtr
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setGlobalScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_globalScore = a3;
}

- (void)setHasGlobalScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGlobalScore
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_personalizationScore = a3;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPersonalizationScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_subscribedChannelCtr = a3;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSubscribedChannelCtr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_userFeedbackScore = a3;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasUserFeedbackScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setPlaybackSpeed:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_playbackSpeed = a3;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPlaybackSpeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)audioEngagementOriginationData
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_audioEngagementOriginationData;
  else
    return 0;
}

- (void)setAudioEngagementOriginationData:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_audioEngagementOriginationData = a3;
}

- (void)setHasAudioEngagementOriginationData:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAudioEngagementOriginationData
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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
  v8.super_class = (Class)NTPBAudioEngage;
  -[NTPBAudioEngage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAudioEngage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  NSString *sourceChannelId;
  $378D275FDE9922AC2663EB703B3A6EE4 has;
  void *v8;
  uint64_t groupType;
  __CFString *v10;
  NSString *groupFeedId;
  NSData *groupViewExposureId;
  uint64_t feedType;
  __CFString *v14;
  NSString *feedId;
  $378D275FDE9922AC2663EB703B3A6EE4 v16;
  void *v17;
  NSString *engagementId;
  $378D275FDE9922AC2663EB703B3A6EE4 v19;
  void *v20;
  void *v21;
  NSData *articleViewingSessionId;
  double v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  $378D275FDE9922AC2663EB703B3A6EE4 v31;
  void *v32;
  NTPBIssueData *issueData;
  void *v34;
  NTPBIssueViewData *issueViewData;
  void *v36;
  NTPBChannelData *channelData;
  void *v38;
  NSString *language;
  $378D275FDE9922AC2663EB703B3A6EE4 v40;
  void *v41;
  id v42;
  void *v44;
  uint64_t trackVariant;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("ad_supported_channel"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_24CD507F8[groupType];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("group_type"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v4, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24CD50938[feedType];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v4, "setObject:forKey:", feedId, CFSTR("feed_id"));
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trackDuration);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("track_duration"));

    v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
    {
LABEL_25:
      if ((*(_BYTE *)&v16 & 8) == 0)
        goto LABEL_26;
      goto LABEL_91;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
    goto LABEL_25;
  }
  trackVariant = self->_trackVariant;
  if (trackVariant >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trackVariant);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_24CD509E8[trackVariant];
  }
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("track_variant"));

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 8) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v16 & 4) == 0)
      goto LABEL_27;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_audioTimePlayed);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v59, CFSTR("audio_time_played"));

  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 4) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_28;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_audioDeltaTimePlayed);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("audio_delta_time_played"));

  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v16 & 0x100000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("user_action"));

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_position);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("position"));

  }
LABEL_30:
  engagementId = self->_engagementId;
  if (engagementId)
    objc_msgSend(v4, "setObject:forKey:", engagementId, CFSTR("engagement_id"));
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_playMethod);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("play_method"));

    v19 = self->_has;
  }
  if ((*(_DWORD *)&v19 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_listeningSource);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("listening_source"));

  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v4, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v25 = self->_fractionalCohortMemberships;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v63 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("fractional_cohort_membership"));
  }
  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedPersonalizationScore);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("aged_personalization_score"));

    v31 = self->_has;
    if ((*(_BYTE *)&v31 & 2) == 0)
    {
LABEL_49:
      if ((*(_BYTE *)&v31 & 0x10) == 0)
        goto LABEL_50;
      goto LABEL_77;
    }
  }
  else if ((*(_BYTE *)&v31 & 2) == 0)
  {
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedUserFeedbackScore);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("aged_user_feedback_score"));

  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 0x10) == 0)
  {
LABEL_50:
    if ((*(_BYTE *)&v31 & 0x20) == 0)
      goto LABEL_51;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_autoSubscribeCtr);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("auto_subscribe_ctr"));

  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 0x20) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v31 & 0x40) == 0)
      goto LABEL_52;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_computedGlobalScoreCoefficient);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("computed_global_score_coefficient"));

  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 0x40) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v31 & 0x80) == 0)
      goto LABEL_53;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_diversifiedPersonalizationScore);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("diversified_personalization_score"));

  v31 = self->_has;
  if ((*(_BYTE *)&v31 & 0x80) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v31 & 0x100) == 0)
      goto LABEL_54;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_featureCtr);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("feature_ctr"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x100) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v31 & 0x200) == 0)
      goto LABEL_55;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_globalScore);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("global_score"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x200) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v31 & 0x400) == 0)
      goto LABEL_56;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_paidNonpaidSubscriptionCtr);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("paid_nonpaid_subscription_ctr"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x400) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v31 & 0x800) == 0)
      goto LABEL_57;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_personalizationScore);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("personalization_score"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v31 & 0x2000) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedChannelCtr);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("subscribed_channel_ctr"));

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_userFeedbackScore);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("user_feedback_score"));

  }
LABEL_59:
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("issue_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("issue_view_data"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("channel_data"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v40 & 0x80000) == 0)
      goto LABEL_69;
LABEL_87:
    *(float *)&v23 = self->_playbackSpeed;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("playbackSpeed"));

    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_71;
    goto LABEL_70;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("is_paid_subscriber_to_source_channel"));

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) != 0)
    goto LABEL_87;
LABEL_69:
  if ((*(_WORD *)&v40 & 0x4000) != 0)
  {
LABEL_70:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_audioEngagementOriginationData);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("audio_engagement_origination_data"));

  }
LABEL_71:
  v42 = v4;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioEngageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $378D275FDE9922AC2663EB703B3A6EE4 has;
  $378D275FDE9922AC2663EB703B3A6EE4 v6;
  $378D275FDE9922AC2663EB703B3A6EE4 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $378D275FDE9922AC2663EB703B3A6EE4 v13;
  $378D275FDE9922AC2663EB703B3A6EE4 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&v6 & 8) == 0)
        goto LABEL_20;
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_21;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_23:
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_engagementId)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_fractionalCohortMemberships;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v13 = self->_has;
    if ((*(_BYTE *)&v13 & 2) == 0)
    {
LABEL_41:
      if ((*(_BYTE *)&v13 & 0x10) == 0)
        goto LABEL_42;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v13 & 2) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&v13 & 0x20) == 0)
      goto LABEL_43;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_44;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v13 & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x80) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v13 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v13 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v13 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v13 & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v13 & 0x2000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_50:
    PBDataWriterWriteDoubleField();
LABEL_51:
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  if (self->_language)
    PBDataWriterWriteStringField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v14 & 0x80000) == 0)
      goto LABEL_61;
LABEL_82:
    PBDataWriterWriteFloatField();
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
  PBDataWriterWriteBOOLField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
    goto LABEL_82;
LABEL_61:
  if ((*(_WORD *)&v14 & 0x4000) != 0)
LABEL_62:
    PBDataWriterWriteInt32Field();
LABEL_63:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $378D275FDE9922AC2663EB703B3A6EE4 has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  $378D275FDE9922AC2663EB703B3A6EE4 v17;
  uint64_t v18;
  void *v19;
  $378D275FDE9922AC2663EB703B3A6EE4 v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  $378D275FDE9922AC2663EB703B3A6EE4 v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  $378D275FDE9922AC2663EB703B3A6EE4 v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v8;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 264) = self->_adSupportedChannel;
    *(_DWORD *)(v5 + 268) |= 0x800000u;
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_groupType;
    *(_DWORD *)(v5 + 268) |= 0x10000u;
  }
  v11 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v11;

  v13 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v13;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_feedType;
    *(_DWORD *)(v5 + 268) |= 0x8000u;
  }
  v15 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v15;

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_trackDuration;
    *(_DWORD *)(v5 + 268) |= 0x1000u;
    v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x200000) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&v17 & 8) == 0)
        goto LABEL_10;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 256) = self->_trackVariant;
  *(_DWORD *)(v5 + 268) |= 0x200000u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v17 & 4) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  *(_QWORD *)(v5 + 32) = self->_audioTimePlayed;
  *(_DWORD *)(v5 + 268) |= 8u;
  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 4) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v17 & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  *(_QWORD *)(v5 + 24) = self->_audioDeltaTimePlayed;
  *(_DWORD *)(v5 + 268) |= 4u;
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v17 & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_46:
  *(_DWORD *)(v5 + 260) = self->_userAction;
  *(_DWORD *)(v5 + 268) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 244) = self->_position;
    *(_DWORD *)(v5 + 268) |= 0x100000u;
  }
LABEL_14:
  v18 = -[NSString copyWithZone:](self->_engagementId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v18;

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 236) = self->_playMethod;
    *(_DWORD *)(v5 + 268) |= 0x40000u;
    v20 = self->_has;
  }
  if ((*(_DWORD *)&v20 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_listeningSource;
    *(_DWORD *)(v5 + 268) |= 0x20000u;
  }
  v21 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v21;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = self->_fractionalCohortMemberships;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addFractionalCohortMembership:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v25);
  }

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_agedPersonalizationScore;
    *(_DWORD *)(v5 + 268) |= 1u;
    v29 = self->_has;
    if ((*(_BYTE *)&v29 & 2) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v29 & 0x10) == 0)
        goto LABEL_28;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v29 & 2) == 0)
  {
    goto LABEL_27;
  }
  *(double *)(v5 + 16) = self->_agedUserFeedbackScore;
  *(_DWORD *)(v5 + 268) |= 2u;
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x10) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v29 & 0x20) == 0)
      goto LABEL_29;
    goto LABEL_51;
  }
LABEL_50:
  *(double *)(v5 + 40) = self->_autoSubscribeCtr;
  *(_DWORD *)(v5 + 268) |= 0x10u;
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x20) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v29 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 48) = self->_computedGlobalScoreCoefficient;
  *(_DWORD *)(v5 + 268) |= 0x20u;
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x40) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v29 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 56) = self->_diversifiedPersonalizationScore;
  *(_DWORD *)(v5 + 268) |= 0x40u;
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 0x80) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v29 & 0x100) == 0)
      goto LABEL_32;
    goto LABEL_54;
  }
LABEL_53:
  *(double *)(v5 + 64) = self->_featureCtr;
  *(_DWORD *)(v5 + 268) |= 0x80u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x100) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v29 & 0x200) == 0)
      goto LABEL_33;
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 72) = self->_globalScore;
  *(_DWORD *)(v5 + 268) |= 0x100u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v29 & 0x400) == 0)
      goto LABEL_34;
    goto LABEL_56;
  }
LABEL_55:
  *(double *)(v5 + 80) = self->_paidNonpaidSubscriptionCtr;
  *(_DWORD *)(v5 + 268) |= 0x200u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v29 & 0x800) == 0)
      goto LABEL_35;
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 88) = self->_personalizationScore;
  *(_DWORD *)(v5 + 268) |= 0x400u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v29 & 0x2000) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_57:
  *(double *)(v5 + 96) = self->_subscribedChannelCtr;
  *(_DWORD *)(v5 + 268) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_36:
    *(double *)(v5 + 112) = self->_userFeedbackScore;
    *(_DWORD *)(v5 + 268) |= 0x2000u;
  }
LABEL_37:
  v30 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3, (_QWORD)v40);
  v31 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v30;

  v32 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v32;

  v34 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v34;

  v36 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v36;

  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v38 & 0x80000) == 0)
      goto LABEL_39;
LABEL_60:
    *(float *)(v5 + 240) = self->_playbackSpeed;
    *(_DWORD *)(v5 + 268) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0)
      return (id)v5;
    goto LABEL_40;
  }
  *(_BYTE *)(v5 + 265) = self->_isPaidSubscriberToSourceChannel;
  *(_DWORD *)(v5 + 268) |= 0x1000000u;
  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x80000) != 0)
    goto LABEL_60;
LABEL_39:
  if ((*(_WORD *)&v38 & 0x4000) != 0)
  {
LABEL_40:
    *(_DWORD *)(v5 + 136) = self->_audioEngagementOriginationData;
    *(_DWORD *)(v5 + 268) |= 0x4000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *sourceChannelId;
  $378D275FDE9922AC2663EB703B3A6EE4 has;
  int v8;
  NSString *groupFeedId;
  NSData *groupViewExposureId;
  $378D275FDE9922AC2663EB703B3A6EE4 v11;
  int v12;
  NSString *feedId;
  int v14;
  NSString *engagementId;
  int v16;
  NSData *articleViewingSessionId;
  NSMutableArray *fractionalCohortMemberships;
  $378D275FDE9922AC2663EB703B3A6EE4 v19;
  int v20;
  NTPBIssueData *issueData;
  NTPBIssueViewData *issueViewData;
  NTPBChannelData *channelData;
  NSString *language;
  $378D275FDE9922AC2663EB703B3A6EE4 v25;
  int v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_159;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_159;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_159;
  }
  has = self->_has;
  v8 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0)
      goto LABEL_159;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 264))
        goto LABEL_159;
    }
    else if (*((_BYTE *)v4 + 264))
    {
      goto LABEL_159;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_groupType != *((_DWORD *)v4 + 48))
      goto LABEL_159;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_159;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 23)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_159;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 25))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_159;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)v4 + 67);
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_feedType != *((_DWORD *)v4 + 42))
      goto LABEL_159;
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_159;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_159;
    v11 = self->_has;
  }
  v14 = *((_DWORD *)v4 + 67);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_trackDuration != *((_QWORD *)v4 + 13))
      goto LABEL_159;
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0 || self->_trackVariant != *((_DWORD *)v4 + 64))
      goto LABEL_159;
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_audioTimePlayed != *((_QWORD *)v4 + 4))
      goto LABEL_159;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_audioDeltaTimePlayed != *((_QWORD *)v4 + 3))
      goto LABEL_159;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x400000) != 0)
  {
    if ((v14 & 0x400000) == 0 || self->_userAction != *((_DWORD *)v4 + 65))
      goto LABEL_159;
  }
  else if ((v14 & 0x400000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_position != *((_DWORD *)v4 + 61))
      goto LABEL_159;
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_159;
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:"))
      goto LABEL_159;
    v11 = self->_has;
  }
  v16 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    if ((v16 & 0x40000) == 0 || self->_playMethod != *((_DWORD *)v4 + 59))
      goto LABEL_159;
  }
  else if ((v16 & 0x40000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_listeningSource != *((_DWORD *)v4 + 58))
      goto LABEL_159;
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_159;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 16)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_159;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_159;
  }
  v19 = self->_has;
  v20 = *((_DWORD *)v4 + 67);
  if ((*(_BYTE *)&v19 & 1) != 0)
  {
    if ((v20 & 1) == 0 || self->_agedPersonalizationScore != *((double *)v4 + 1))
      goto LABEL_159;
  }
  else if ((v20 & 1) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_agedUserFeedbackScore != *((double *)v4 + 2))
      goto LABEL_159;
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_autoSubscribeCtr != *((double *)v4 + 5))
      goto LABEL_159;
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v19 & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0 || self->_computedGlobalScoreCoefficient != *((double *)v4 + 6))
      goto LABEL_159;
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_diversifiedPersonalizationScore != *((double *)v4 + 7))
      goto LABEL_159;
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_BYTE *)&v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_featureCtr != *((double *)v4 + 8))
      goto LABEL_159;
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    if ((v20 & 0x100) == 0 || self->_globalScore != *((double *)v4 + 9))
      goto LABEL_159;
  }
  else if ((v20 & 0x100) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    if ((v20 & 0x200) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)v4 + 10))
      goto LABEL_159;
  }
  else if ((v20 & 0x200) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x400) != 0)
  {
    if ((v20 & 0x400) == 0 || self->_personalizationScore != *((double *)v4 + 11))
      goto LABEL_159;
  }
  else if ((v20 & 0x400) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0 || self->_subscribedChannelCtr != *((double *)v4 + 12))
      goto LABEL_159;
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    if ((v20 & 0x2000) == 0 || self->_userFeedbackScore != *((double *)v4 + 14))
      goto LABEL_159;
  }
  else if ((v20 & 0x2000) != 0)
  {
    goto LABEL_159;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 26) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_159;
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 27))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_159;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 18))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:"))
      goto LABEL_159;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_159;
  }
  v25 = self->_has;
  v26 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&v25 & 0x1000000) != 0)
  {
    if ((v26 & 0x1000000) != 0)
    {
      if (self->_isPaidSubscriberToSourceChannel)
      {
        if (!*((_BYTE *)v4 + 265))
          goto LABEL_159;
        goto LABEL_149;
      }
      if (!*((_BYTE *)v4 + 265))
        goto LABEL_149;
    }
LABEL_159:
    v27 = 0;
    goto LABEL_160;
  }
  if ((v26 & 0x1000000) != 0)
    goto LABEL_159;
LABEL_149:
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    if ((v26 & 0x80000) == 0 || self->_playbackSpeed != *((float *)v4 + 60))
      goto LABEL_159;
  }
  else if ((v26 & 0x80000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v25 & 0x4000) != 0)
  {
    if ((v26 & 0x4000) == 0 || self->_audioEngagementOriginationData != *((_DWORD *)v4 + 34))
      goto LABEL_159;
    v27 = 1;
  }
  else
  {
    v27 = (*((_DWORD *)v4 + 67) & 0x4000) == 0;
  }
LABEL_160:

  return v27;
}

- (unint64_t)hash
{
  $378D275FDE9922AC2663EB703B3A6EE4 has;
  $378D275FDE9922AC2663EB703B3A6EE4 v4;
  $378D275FDE9922AC2663EB703B3A6EE4 v5;
  $378D275FDE9922AC2663EB703B3A6EE4 v6;
  unint64_t v7;
  double agedPersonalizationScore;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double agedUserFeedbackScore;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double autoSubscribeCtr;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  double computedGlobalScoreCoefficient;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  double diversifiedPersonalizationScore;
  double v29;
  long double v30;
  double v31;
  unint64_t v32;
  double featureCtr;
  double v34;
  long double v35;
  double v36;
  unint64_t v37;
  double globalScore;
  double v39;
  long double v40;
  double v41;
  unint64_t v42;
  double paidNonpaidSubscriptionCtr;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  double personalizationScore;
  double v49;
  long double v50;
  double v51;
  unint64_t v52;
  double subscribedChannelCtr;
  double v54;
  long double v55;
  double v56;
  unint64_t v57;
  double userFeedbackScore;
  double v59;
  long double v60;
  double v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  NSUInteger v65;
  $378D275FDE9922AC2663EB703B3A6EE4 v66;
  uint64_t v67;
  float playbackSpeed;
  float v69;
  float v70;
  float v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSUInteger v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSUInteger v94;
  uint64_t v95;
  uint64_t v96;
  NSUInteger v97;
  uint64_t v98;
  uint64_t v99;
  NSUInteger v100;
  NSUInteger v101;

  v101 = -[NSString hash](self->_articleId, "hash");
  v100 = -[NSString hash](self->_sourceChannelId, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    v99 = 2654435761 * self->_adSupportedChannel;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_3;
  }
  else
  {
    v99 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      v98 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  v98 = 0;
LABEL_6:
  v97 = -[NSString hash](self->_groupFeedId, "hash");
  v96 = -[NSData hash](self->_groupViewExposureId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v95 = 2654435761 * self->_feedType;
  else
    v95 = 0;
  v94 = -[NSString hash](self->_feedId, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    v93 = 2654435761 * self->_trackDuration;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
    {
LABEL_11:
      v92 = 2654435761 * self->_trackVariant;
      if ((*(_BYTE *)&v4 & 8) != 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else
  {
    v93 = 0;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_11;
  }
  v92 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_12:
    v91 = 2654435761 * self->_audioTimePlayed;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_13;
    goto LABEL_19;
  }
LABEL_18:
  v91 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_13:
    v90 = 2654435761 * self->_audioDeltaTimePlayed;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_14;
LABEL_20:
    v89 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0)
      goto LABEL_15;
    goto LABEL_21;
  }
LABEL_19:
  v90 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0)
    goto LABEL_20;
LABEL_14:
  v89 = 2654435761 * self->_userAction;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_15:
    v88 = 2654435761 * self->_position;
    goto LABEL_22;
  }
LABEL_21:
  v88 = 0;
LABEL_22:
  v87 = -[NSString hash](self->_engagementId, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    v86 = 2654435761 * self->_playMethod;
    if ((*(_DWORD *)&v5 & 0x20000) != 0)
      goto LABEL_24;
  }
  else
  {
    v86 = 0;
    if ((*(_DWORD *)&v5 & 0x20000) != 0)
    {
LABEL_24:
      v85 = 2654435761 * self->_listeningSource;
      goto LABEL_27;
    }
  }
  v85 = 0;
LABEL_27:
  v84 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v83 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    agedPersonalizationScore = self->_agedPersonalizationScore;
    v9 = -agedPersonalizationScore;
    if (agedPersonalizationScore >= 0.0)
      v9 = self->_agedPersonalizationScore;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    agedUserFeedbackScore = self->_agedUserFeedbackScore;
    v14 = -agedUserFeedbackScore;
    if (agedUserFeedbackScore >= 0.0)
      v14 = self->_agedUserFeedbackScore;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((*(_BYTE *)&v6 & 0x10) != 0)
  {
    autoSubscribeCtr = self->_autoSubscribeCtr;
    v19 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0)
      v19 = self->_autoSubscribeCtr;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    v24 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0)
      v24 = self->_computedGlobalScoreCoefficient;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    diversifiedPersonalizationScore = self->_diversifiedPersonalizationScore;
    v29 = -diversifiedPersonalizationScore;
    if (diversifiedPersonalizationScore >= 0.0)
      v29 = self->_diversifiedPersonalizationScore;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    featureCtr = self->_featureCtr;
    v34 = -featureCtr;
    if (featureCtr >= 0.0)
      v34 = self->_featureCtr;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    globalScore = self->_globalScore;
    v39 = -globalScore;
    if (globalScore >= 0.0)
      v39 = self->_globalScore;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  v77 = v37;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    v44 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0)
      v44 = self->_paidNonpaidSubscriptionCtr;
    v45 = floor(v44 + 0.5);
    v46 = (v44 - v45) * 1.84467441e19;
    v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0)
        v42 += (unint64_t)v46;
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    v42 = 0;
  }
  v76 = v42;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    personalizationScore = self->_personalizationScore;
    v49 = -personalizationScore;
    if (personalizationScore >= 0.0)
      v49 = self->_personalizationScore;
    v50 = floor(v49 + 0.5);
    v51 = (v49 - v50) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0)
        v47 += (unint64_t)v51;
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    v47 = 0;
  }
  v75 = v47;
  v80 = v17;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    subscribedChannelCtr = self->_subscribedChannelCtr;
    v54 = -subscribedChannelCtr;
    if (subscribedChannelCtr >= 0.0)
      v54 = self->_subscribedChannelCtr;
    v55 = floor(v54 + 0.5);
    v56 = (v54 - v55) * 1.84467441e19;
    v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0)
        v52 += (unint64_t)v56;
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    v52 = 0;
  }
  v81 = v12;
  v82 = v7;
  v79 = v22;
  v78 = v32;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    userFeedbackScore = self->_userFeedbackScore;
    v59 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0)
      v59 = self->_userFeedbackScore;
    v60 = floor(v59 + 0.5);
    v61 = (v59 - v60) * 1.84467441e19;
    v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  v62 = -[NTPBIssueData hash](self->_issueData, "hash");
  v63 = -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  v64 = -[NTPBChannelData hash](self->_channelData, "hash");
  v65 = -[NSString hash](self->_language, "hash");
  v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x1000000) != 0)
  {
    v67 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    if ((*(_DWORD *)&v66 & 0x80000) != 0)
      goto LABEL_117;
LABEL_122:
    v72 = 0;
    goto LABEL_125;
  }
  v67 = 0;
  if ((*(_DWORD *)&v66 & 0x80000) == 0)
    goto LABEL_122;
LABEL_117:
  playbackSpeed = self->_playbackSpeed;
  v69 = -playbackSpeed;
  if (playbackSpeed >= 0.0)
    v69 = self->_playbackSpeed;
  v70 = floorf(v69 + 0.5);
  v71 = (float)(v69 - v70) * 1.8447e19;
  v72 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
  if (v71 >= 0.0)
  {
    if (v71 > 0.0)
      v72 += (unint64_t)v71;
  }
  else
  {
    v72 -= (unint64_t)fabsf(v71);
  }
LABEL_125:
  if ((*(_WORD *)&v66 & 0x4000) != 0)
    v73 = 2654435761 * self->_audioEngagementOriginationData;
  else
    v73 = 0;
  return v100 ^ v101 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v27 ^ v78 ^ v77 ^ v76 ^ v75 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v67 ^ v72 ^ v73;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  NTPBIssueData *issueData;
  uint64_t v15;
  NTPBIssueViewData *issueViewData;
  uint64_t v17;
  NTPBChannelData *channelData;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 15))
    -[NTPBAudioEngage setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v4 + 31))
    -[NTPBAudioEngage setSourceChannelId:](self, "setSourceChannelId:");
  v5 = *((_DWORD *)v4 + 67);
  if ((v5 & 0x800000) != 0)
  {
    self->_adSupportedChannel = *((_BYTE *)v4 + 264);
    *(_DWORD *)&self->_has |= 0x800000u;
    v5 = *((_DWORD *)v4 + 67);
  }
  if ((v5 & 0x10000) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((_QWORD *)v4 + 23))
    -[NTPBAudioEngage setGroupFeedId:](self, "setGroupFeedId:");
  if (*((_QWORD *)v4 + 25))
    -[NTPBAudioEngage setGroupViewExposureId:](self, "setGroupViewExposureId:");
  if ((*((_BYTE *)v4 + 269) & 0x80) != 0)
  {
    self->_feedType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((_QWORD *)v4 + 20))
    -[NTPBAudioEngage setFeedId:](self, "setFeedId:");
  v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 0x1000) != 0)
  {
    self->_trackDuration = *((_QWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
    v6 = *((_DWORD *)v4 + 67);
    if ((v6 & 0x200000) == 0)
    {
LABEL_19:
      if ((v6 & 8) == 0)
        goto LABEL_20;
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_19;
  }
  self->_trackVariant = *((_DWORD *)v4 + 64);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 8) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  self->_audioTimePlayed = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  self->_audioDeltaTimePlayed = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((v6 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_58:
  self->_userAction = *((_DWORD *)v4 + 65);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v4 + 67) & 0x100000) != 0)
  {
LABEL_23:
    self->_position = *((_DWORD *)v4 + 61);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_24:
  if (*((_QWORD *)v4 + 19))
    -[NTPBAudioEngage setEngagementId:](self, "setEngagementId:");
  v7 = *((_DWORD *)v4 + 67);
  if ((v7 & 0x40000) != 0)
  {
    self->_playMethod = *((_DWORD *)v4 + 59);
    *(_DWORD *)&self->_has |= 0x40000u;
    v7 = *((_DWORD *)v4 + 67);
  }
  if ((v7 & 0x20000) != 0)
  {
    self->_listeningSource = *((_DWORD *)v4 + 58);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)v4 + 16))
    -[NTPBAudioEngage setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = *((id *)v4 + 22);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        -[NTPBAudioEngage addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 1) != 0)
  {
    self->_agedPersonalizationScore = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v13 = *((_DWORD *)v4 + 67);
    if ((v13 & 2) == 0)
    {
LABEL_41:
      if ((v13 & 0x10) == 0)
        goto LABEL_42;
      goto LABEL_62;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_41;
  }
  self->_agedUserFeedbackScore = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x10) == 0)
  {
LABEL_42:
    if ((v13 & 0x20) == 0)
      goto LABEL_43;
    goto LABEL_63;
  }
LABEL_62:
  self->_autoSubscribeCtr = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x20) == 0)
  {
LABEL_43:
    if ((v13 & 0x40) == 0)
      goto LABEL_44;
    goto LABEL_64;
  }
LABEL_63:
  self->_computedGlobalScoreCoefficient = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x40) == 0)
  {
LABEL_44:
    if ((v13 & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_65;
  }
LABEL_64:
  self->_diversifiedPersonalizationScore = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x80) == 0)
  {
LABEL_45:
    if ((v13 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_66;
  }
LABEL_65:
  self->_featureCtr = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x100) == 0)
  {
LABEL_46:
    if ((v13 & 0x200) == 0)
      goto LABEL_47;
    goto LABEL_67;
  }
LABEL_66:
  self->_globalScore = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x200) == 0)
  {
LABEL_47:
    if ((v13 & 0x400) == 0)
      goto LABEL_48;
    goto LABEL_68;
  }
LABEL_67:
  self->_paidNonpaidSubscriptionCtr = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x400) == 0)
  {
LABEL_48:
    if ((v13 & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_69;
  }
LABEL_68:
  self->_personalizationScore = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x800) == 0)
  {
LABEL_49:
    if ((v13 & 0x2000) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
LABEL_69:
  self->_subscribedChannelCtr = *((double *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 67) & 0x2000) != 0)
  {
LABEL_50:
    self->_userFeedbackScore = *((double *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_51:
  issueData = self->_issueData;
  v15 = *((_QWORD *)v4 + 26);
  if (issueData)
  {
    if (v15)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v15)
  {
    -[NTPBAudioEngage setIssueData:](self, "setIssueData:");
  }
  issueViewData = self->_issueViewData;
  v17 = *((_QWORD *)v4 + 27);
  if (issueViewData)
  {
    if (v17)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v17)
  {
    -[NTPBAudioEngage setIssueViewData:](self, "setIssueViewData:");
  }
  channelData = self->_channelData;
  v19 = *((_QWORD *)v4 + 18);
  if (channelData)
  {
    if (v19)
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v19)
  {
    -[NTPBAudioEngage setChannelData:](self, "setChannelData:");
  }
  if (*((_QWORD *)v4 + 28))
    -[NTPBAudioEngage setLanguage:](self, "setLanguage:");
  v20 = *((_DWORD *)v4 + 67);
  if ((v20 & 0x1000000) == 0)
  {
    if ((v20 & 0x80000) == 0)
      goto LABEL_87;
LABEL_91:
    self->_playbackSpeed = *((float *)v4 + 60);
    *(_DWORD *)&self->_has |= 0x80000u;
    if ((*((_DWORD *)v4 + 67) & 0x4000) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
  self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v4 + 265);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v20 = *((_DWORD *)v4 + 67);
  if ((v20 & 0x80000) != 0)
    goto LABEL_91;
LABEL_87:
  if ((v20 & 0x4000) != 0)
  {
LABEL_88:
    self->_audioEngagementOriginationData = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_89:

}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (int64_t)trackDuration
{
  return self->_trackDuration;
}

- (int64_t)audioTimePlayed
{
  return self->_audioTimePlayed;
}

- (int64_t)audioDeltaTimePlayed
{
  return self->_audioDeltaTimePlayed;
}

- (int)position
{
  return self->_position;
}

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
  objc_storeStrong((id *)&self->_engagementId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)agedUserFeedbackScore
{
  return self->_agedUserFeedbackScore;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)diversifiedPersonalizationScore
{
  return self->_diversifiedPersonalizationScore;
}

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)globalScore
{
  return self->_globalScore;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (NTPBChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
  objc_storeStrong((id *)&self->_channelData, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
