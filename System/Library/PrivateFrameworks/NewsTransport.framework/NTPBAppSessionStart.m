@implementation NTPBAppSessionStart

- (void)setLastAppSessionTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_lastAppSessionTimestamp = a3;
}

- (void)setHasLastAppSessionTimestamp:(BOOL)a3
{
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLastAppSessionTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)clearVisibleViews
{
  -[NSMutableArray removeAllObjects](self->_visibleViews, "removeAllObjects");
}

- (void)addVisibleViews:(id)a3
{
  id v4;
  NSMutableArray *visibleViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visibleViews = self->_visibleViews;
  v8 = v4;
  if (!visibleViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_visibleViews;
    self->_visibleViews = v6;

    v4 = v8;
    visibleViews = self->_visibleViews;
  }
  -[NSMutableArray addObject:](visibleViews, "addObject:", v4);

}

- (unint64_t)visibleViewsCount
{
  return -[NSMutableArray count](self->_visibleViews, "count");
}

- (id)visibleViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleViews, "objectAtIndex:", a3);
}

+ (Class)visibleViewsType
{
  return (Class)objc_opt_class();
}

- (void)setChannelSubscriptionCount:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_channelSubscriptionCount = a3;
}

- (void)setHasChannelSubscriptionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasChannelSubscriptionCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTopicSubscriptionCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_topicSubscriptionCount = a3;
}

- (void)setHasTopicSubscriptionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTopicSubscriptionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (void)clearPaidSubscriptionChannelIds
{
  -[NSMutableArray removeAllObjects](self->_paidSubscriptionChannelIds, "removeAllObjects");
}

- (void)addPaidSubscriptionChannelIds:(id)a3
{
  id v4;
  NSMutableArray *paidSubscriptionChannelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  v8 = v4;
  if (!paidSubscriptionChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_paidSubscriptionChannelIds;
    self->_paidSubscriptionChannelIds = v6;

    v4 = v8;
    paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  }
  -[NSMutableArray addObject:](paidSubscriptionChannelIds, "addObject:", v4);

}

- (unint64_t)paidSubscriptionChannelIdsCount
{
  return -[NSMutableArray count](self->_paidSubscriptionChannelIds, "count");
}

- (id)paidSubscriptionChannelIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paidSubscriptionChannelIds, "objectAtIndex:", a3);
}

+ (Class)paidSubscriptionChannelIdsType
{
  return (Class)objc_opt_class();
}

- (void)setStartedFromNotification:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_startedFromNotification = a3;
}

- (void)setHasStartedFromNotification:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasStartedFromNotification
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (BOOL)hasNotificationSenderChannelId
{
  return self->_notificationSenderChannelId != 0;
}

- (BOOL)hasNotificationSourceChannelId
{
  return self->_notificationSourceChannelId != 0;
}

- (void)setNotitificationsEnabledChannelsCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_notitificationsEnabledChannelsCount = a3;
}

- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotitificationsEnabledChannelsCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)clearNotificationChannelIds
{
  -[NSMutableArray removeAllObjects](self->_notificationChannelIds, "removeAllObjects");
}

- (void)addNotificationChannelIds:(id)a3
{
  id v4;
  NSMutableArray *notificationChannelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  notificationChannelIds = self->_notificationChannelIds;
  v8 = v4;
  if (!notificationChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_notificationChannelIds;
    self->_notificationChannelIds = v6;

    v4 = v8;
    notificationChannelIds = self->_notificationChannelIds;
  }
  -[NSMutableArray addObject:](notificationChannelIds, "addObject:", v4);

}

- (unint64_t)notificationChannelIdsCount
{
  return -[NSMutableArray count](self->_notificationChannelIds, "count");
}

- (id)notificationChannelIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_notificationChannelIds, "objectAtIndex:", a3);
}

+ (Class)notificationChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationArticleId
{
  return self->_notificationArticleId != 0;
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

- (void)setNotificationEnabledChannelsCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_notificationEnabledChannelsCount = a3;
}

- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNotificationEnabledChannelsCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearSubscribedFeedIds
{
  -[NSMutableArray removeAllObjects](self->_subscribedFeedIds, "removeAllObjects");
}

- (void)addSubscribedFeedIds:(id)a3
{
  id v4;
  NSMutableArray *subscribedFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subscribedFeedIds = self->_subscribedFeedIds;
  v8 = v4;
  if (!subscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subscribedFeedIds;
    self->_subscribedFeedIds = v6;

    v4 = v8;
    subscribedFeedIds = self->_subscribedFeedIds;
  }
  -[NSMutableArray addObject:](subscribedFeedIds, "addObject:", v4);

}

- (unint64_t)subscribedFeedIdsCount
{
  return -[NSMutableArray count](self->_subscribedFeedIds, "count");
}

- (id)subscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subscribedFeedIds, "objectAtIndex:", a3);
}

+ (Class)subscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (int)sessionStartMethod
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_sessionStartMethod;
  else
    return 0;
}

- (void)setSessionStartMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_sessionStartMethod = a3;
}

- (void)setHasSessionStartMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSessionStartMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)widgetSection
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_widgetSection;
  else
    return 0;
}

- (void)setWidgetSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_widgetSection = a3;
}

- (void)setHasWidgetSection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWidgetSection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)widgetSectionAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD4FD38[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetSection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_WIDGET_SECTION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWidgetSectionArticleRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_widgetSectionArticleRank = a3;
}

- (void)setHasWidgetSectionArticleRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWidgetSectionArticleRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWidgetArticleRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (void)clearAutoSubscribedFeedIds
{
  -[NSMutableArray removeAllObjects](self->_autoSubscribedFeedIds, "removeAllObjects");
}

- (void)addAutoSubscribedFeedIds:(id)a3
{
  id v4;
  NSMutableArray *autoSubscribedFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  v8 = v4;
  if (!autoSubscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_autoSubscribedFeedIds;
    self->_autoSubscribedFeedIds = v6;

    v4 = v8;
    autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  }
  -[NSMutableArray addObject:](autoSubscribedFeedIds, "addObject:", v4);

}

- (unint64_t)autoSubscribedFeedIdsCount
{
  return -[NSMutableArray count](self->_autoSubscribedFeedIds, "count");
}

- (id)autoSubscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_autoSubscribedFeedIds, "objectAtIndex:", a3);
}

+ (Class)autoSubscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearGroupableFeedIds
{
  -[NSMutableArray removeAllObjects](self->_groupableFeedIds, "removeAllObjects");
}

- (void)addGroupableFeedIds:(id)a3
{
  id v4;
  NSMutableArray *groupableFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groupableFeedIds = self->_groupableFeedIds;
  v8 = v4;
  if (!groupableFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_groupableFeedIds;
    self->_groupableFeedIds = v6;

    v4 = v8;
    groupableFeedIds = self->_groupableFeedIds;
  }
  -[NSMutableArray addObject:](groupableFeedIds, "addObject:", v4);

}

- (unint64_t)groupableFeedIdsCount
{
  return -[NSMutableArray count](self->_groupableFeedIds, "count");
}

- (id)groupableFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groupableFeedIds, "objectAtIndex:", a3);
}

+ (Class)groupableFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)setPortraitAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_portraitAutoSubscribeFeedCount = a3;
}

- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPortraitAutoSubscribeFeedCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSafariAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_safariAutoSubscribeFeedCount = a3;
}

- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSafariAutoSubscribeFeedCount
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setAppsAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appsAutoSubscribeFeedCount = a3;
}

- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppsAutoSubscribeFeedCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setInternalAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_internalAutoSubscribeFeedCount = a3;
}

- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasInternalAutoSubscribeFeedCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)viewabilityState
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_viewabilityState;
  else
    return 0;
}

- (void)setViewabilityState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_viewabilityState = a3;
}

- (void)setHasViewabilityState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasViewabilityState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)notificationType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_notificationType;
  else
    return 0;
}

- (void)setNotificationType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNotificationType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsNewIssuesNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isNewIssuesNotificationEnabled = a3;
}

- (void)setHasIsNewIssuesNotificationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsNewIssuesNotificationEnabled
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsMarketingNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isMarketingNotificationEnabled = a3;
}

- (void)setHasIsMarketingNotificationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsMarketingNotificationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  v8.super_class = (Class)NTPBAppSessionStart;
  -[NTPBAppSessionStart description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAppSessionStart dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  $FCCF821F11C5FAFB61D31B7D7B590019 has;
  void *v13;
  void *v14;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  NSMutableArray *paidSubscriptionChannelIds;
  void *v19;
  NSString *notificationId;
  NSString *notificationSenderChannelId;
  NSString *notificationSourceChannelId;
  void *v23;
  NSMutableArray *notificationChannelIds;
  NSString *notificationArticleId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  void *v29;
  NSMutableArray *subscribedFeedIds;
  $FCCF821F11C5FAFB61D31B7D7B590019 v31;
  void *v32;
  NTPBWidgetEngagement *widgetEngagement;
  void *v34;
  NSMutableArray *autoSubscribedFeedIds;
  NSMutableArray *groupableFeedIds;
  $FCCF821F11C5FAFB61D31B7D7B590019 v37;
  void *v38;
  id v39;
  void *v41;
  uint64_t widgetSection;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastAppSessionTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("last_app_session_timestamp"));

  }
  if (-[NSMutableArray count](self->_visibleViews, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_visibleViews, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = self->_visibleViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("visible_views"));
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_channelSubscriptionCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("channel_subscription_count"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topicSubscriptionCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("topic_subscription_count"));

  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication)
    objc_msgSend(v3, "setObject:forKey:", referringSourceApplication, CFSTR("referring_source_application"));
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  userActivityType = self->_userActivityType;
  if (userActivityType)
    objc_msgSend(v3, "setObject:forKey:", userActivityType, CFSTR("user_activity_type"));
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if (paidSubscriptionChannelIds)
    objc_msgSend(v3, "setObject:forKey:", paidSubscriptionChannelIds, CFSTR("paid_subscription_channel_ids"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_startedFromNotification);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("started_from_notification"));

  }
  notificationId = self->_notificationId;
  if (notificationId)
    objc_msgSend(v3, "setObject:forKey:", notificationId, CFSTR("notification_id"));
  notificationSenderChannelId = self->_notificationSenderChannelId;
  if (notificationSenderChannelId)
    objc_msgSend(v3, "setObject:forKey:", notificationSenderChannelId, CFSTR("notification_sender_channel_id"));
  notificationSourceChannelId = self->_notificationSourceChannelId;
  if (notificationSourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", notificationSourceChannelId, CFSTR("notification_source_channel_id"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notitificationsEnabledChannelsCount);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("notitifications_enabled_channels_count"));

  }
  notificationChannelIds = self->_notificationChannelIds;
  if (notificationChannelIds)
    objc_msgSend(v3, "setObject:forKey:", notificationChannelIds, CFSTR("notification_channel_ids"));
  notificationArticleId = self->_notificationArticleId;
  if (notificationArticleId)
    objc_msgSend(v3, "setObject:forKey:", notificationArticleId, CFSTR("notification_article_id"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationEnabledChannelsCount);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("notification_enabled_channels_count"));

  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds)
    objc_msgSend(v3, "setObject:forKey:", subscribedFeedIds, CFSTR("subscribed_feed_ids"));
  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sessionStartMethod);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("session_start_method"));

    v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x2000) == 0)
    {
LABEL_50:
      if ((*(_WORD *)&v31 & 0x4000) == 0)
        goto LABEL_51;
      goto LABEL_82;
    }
  }
  else if ((*(_WORD *)&v31 & 0x2000) == 0)
  {
    goto LABEL_50;
  }
  widgetSection = self->_widgetSection;
  if (widgetSection >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetSection);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = off_24CD4FD38[widgetSection];
  }
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("widget_section"));

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x4000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v31 & 0x1000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSectionArticleRank);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("widget_section_article_rank"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_52:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRank);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("widget_article_rank"));

  }
LABEL_53:
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    -[NTPBWidgetEngagement dictionaryRepresentation](widgetEngagement, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("widget_engagement"));

  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if (autoSubscribedFeedIds)
    objc_msgSend(v3, "setObject:forKey:", autoSubscribedFeedIds, CFSTR("auto_subscribed_feed_ids"));
  groupableFeedIds = self->_groupableFeedIds;
  if (groupableFeedIds)
    objc_msgSend(v3, "setObject:forKey:", groupableFeedIds, CFSTR("groupable_feed_ids"));
  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_portraitAutoSubscribeFeedCount);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("portrait_auto_subscribe_feed_count"));

    v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x100) == 0)
    {
LABEL_61:
      if ((*(_BYTE *)&v37 & 2) == 0)
        goto LABEL_62;
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v37 & 0x100) == 0)
  {
    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_safariAutoSubscribeFeedCount);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("safari_auto_subscribe_feed_count"));

  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 2) == 0)
  {
LABEL_62:
    if ((*(_BYTE *)&v37 & 8) == 0)
      goto LABEL_63;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_appsAutoSubscribeFeedCount);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("apps_auto_subscribe_feed_count"));

  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 8) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&v37 & 0x800) == 0)
      goto LABEL_64;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_internalAutoSubscribeFeedCount);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("internal_auto_subscribe_feed_count"));

  v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x800) == 0)
  {
LABEL_64:
    if ((*(_BYTE *)&v37 & 0x20) == 0)
      goto LABEL_65;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_viewabilityState);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("viewability_state"));

  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x20) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v37 & 0x10000) == 0)
      goto LABEL_66;
LABEL_78:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNewIssuesNotificationEnabled);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("is_new_issues_notification_enabled"));

    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationType);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("notification_type"));

  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x10000) != 0)
    goto LABEL_78;
LABEL_66:
  if ((*(_WORD *)&v37 & 0x8000) != 0)
  {
LABEL_67:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMarketingNotificationEnabled);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("is_marketing_notification_enabled"));

  }
LABEL_68:
  v39 = v3;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $FCCF821F11C5FAFB61D31B7D7B590019 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  $FCCF821F11C5FAFB61D31B7D7B590019 v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  $FCCF821F11C5FAFB61D31B7D7B590019 v37;
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = self->_visibleViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v7);
  }

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_referringSourceApplication)
    PBDataWriterWriteStringField();
  if (self->_referringUrl)
    PBDataWriterWriteStringField();
  if (self->_userActivityType)
    PBDataWriterWriteStringField();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = self->_paidSubscriptionChannelIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_notificationId)
    PBDataWriterWriteStringField();
  if (self->_notificationSenderChannelId)
    PBDataWriterWriteStringField();
  if (self->_notificationSourceChannelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = self->_notificationChannelIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v51;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v18);
  }

  if (self->_notificationArticleId)
    PBDataWriterWriteStringField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = self->_subscribedFeedIds;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v23);
  }

  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v26 = self->_has;
    if ((*(_WORD *)&v26 & 0x2000) == 0)
    {
LABEL_63:
      if ((*(_WORD *)&v26 & 0x4000) == 0)
        goto LABEL_64;
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v26 & 0x2000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteInt32Field();
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x4000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v26 & 0x1000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_65:
    PBDataWriterWriteInt32Field();
LABEL_66:
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = self->_autoSubscribedFeedIds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v43;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteStringField();
        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    }
    while (v29);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = self->_groupableFeedIds;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        PBDataWriterWriteStringField();
        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v34);
  }

  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x100) == 0)
    {
LABEL_84:
      if ((*(_BYTE *)&v37 & 2) == 0)
        goto LABEL_85;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v37 & 0x100) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteInt32Field();
  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 2) == 0)
  {
LABEL_85:
    if ((*(_BYTE *)&v37 & 8) == 0)
      goto LABEL_86;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 8) == 0)
  {
LABEL_86:
    if ((*(_WORD *)&v37 & 0x800) == 0)
      goto LABEL_87;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x800) == 0)
  {
LABEL_87:
    if ((*(_BYTE *)&v37 & 0x20) == 0)
      goto LABEL_88;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 0x20) == 0)
  {
LABEL_88:
    if ((*(_DWORD *)&v37 & 0x10000) == 0)
      goto LABEL_89;
LABEL_102:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x10000) != 0)
    goto LABEL_102;
LABEL_89:
  if ((*(_WORD *)&v37 & 0x8000) != 0)
LABEL_90:
    PBDataWriterWriteBOOLField();
LABEL_91:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  $FCCF821F11C5FAFB61D31B7D7B590019 has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  $FCCF821F11C5FAFB61D31B7D7B590019 v52;
  id v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67;
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
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_lastAppSessionTimestamp;
    *(_DWORD *)(v5 + 244) |= 1u;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v7 = self->_visibleViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v90;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v90 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addVisibleViews:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    }
    while (v9);
  }

  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_channelSubscriptionCount;
    *(_DWORD *)(v6 + 244) |= 4u;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 184) = self->_topicSubscriptionCount;
    *(_DWORD *)(v6 + 244) |= 0x400u;
  }
  v14 = -[NSString copyWithZone:](self->_referringSourceApplication, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v14;

  v16 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v16;

  v18 = -[NSString copyWithZone:](self->_userActivityType, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v18;

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v20 = self->_paidSubscriptionChannelIds;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v86;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v86 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v24), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPaidSubscriptionChannelIds:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v22);
  }

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_BYTE *)(v6 + 242) = self->_startedFromNotification;
    *(_DWORD *)(v6 + 244) |= 0x20000u;
  }
  v26 = -[NSString copyWithZone:](self->_notificationId, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v26;

  v28 = -[NSString copyWithZone:](self->_notificationSenderChannelId, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v28;

  v30 = -[NSString copyWithZone:](self->_notificationSourceChannelId, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v30;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_notitificationsEnabledChannelsCount;
    *(_DWORD *)(v6 + 244) |= 0x40u;
  }
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v32 = self->_notificationChannelIds;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v82;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v82 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNotificationChannelIds:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
    }
    while (v34);
  }

  v38 = -[NSString copyWithZone:](self->_notificationArticleId, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v38;

  v40 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v40;

  v42 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v42;

  v44 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v44;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_notificationEnabledChannelsCount;
    *(_DWORD *)(v6 + 244) |= 0x10u;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v46 = self->_subscribedFeedIds;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v78;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v78 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v50), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSubscribedFeedIds:", v51);

        ++v50;
      }
      while (v48 != v50);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    }
    while (v48);
  }

  v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 172) = self->_sessionStartMethod;
    *(_DWORD *)(v6 + 244) |= 0x200u;
    v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x2000) == 0)
    {
LABEL_43:
      if ((*(_WORD *)&v52 & 0x4000) == 0)
        goto LABEL_44;
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v52 & 0x2000) == 0)
  {
    goto LABEL_43;
  }
  *(_DWORD *)(v6 + 232) = self->_widgetSection;
  *(_DWORD *)(v6 + 244) |= 0x2000u;
  v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x4000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v52 & 0x1000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_72:
  *(_DWORD *)(v6 + 236) = self->_widgetSectionArticleRank;
  *(_DWORD *)(v6 + 244) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_45:
    *(_DWORD *)(v6 + 216) = self->_widgetArticleRank;
    *(_DWORD *)(v6 + 244) |= 0x1000u;
  }
LABEL_46:
  v53 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v54 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v53;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v55 = self->_autoSubscribedFeedIds;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v74;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v59), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAutoSubscribedFeedIds:", v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
    }
    while (v57);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v61 = self->_groupableFeedIds;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v70;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v65), "copyWithZone:", a3, (_QWORD)v69);
        objc_msgSend((id)v6, "addGroupableFeedIds:", v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
    }
    while (v63);
  }

  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_portraitAutoSubscribeFeedCount;
    *(_DWORD *)(v6 + 244) |= 0x80u;
    v67 = self->_has;
    if ((*(_WORD *)&v67 & 0x100) == 0)
    {
LABEL_62:
      if ((*(_BYTE *)&v67 & 2) == 0)
        goto LABEL_63;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&v67 & 0x100) == 0)
  {
    goto LABEL_62;
  }
  *(_DWORD *)(v6 + 168) = self->_safariAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 0x100u;
  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 2) == 0)
  {
LABEL_63:
    if ((*(_BYTE *)&v67 & 8) == 0)
      goto LABEL_64;
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v6 + 16) = self->_appsAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 2u;
  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 8) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v67 & 0x800) == 0)
      goto LABEL_65;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v6 + 72) = self->_internalAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 8u;
  v67 = self->_has;
  if ((*(_WORD *)&v67 & 0x800) == 0)
  {
LABEL_65:
    if ((*(_BYTE *)&v67 & 0x20) == 0)
      goto LABEL_66;
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v6 + 200) = self->_viewabilityState;
  *(_DWORD *)(v6 + 244) |= 0x800u;
  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 0x20) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v67 & 0x10000) == 0)
      goto LABEL_67;
LABEL_80:
    *(_BYTE *)(v6 + 241) = self->_isNewIssuesNotificationEnabled;
    *(_DWORD *)(v6 + 244) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      return (id)v6;
    goto LABEL_68;
  }
LABEL_79:
  *(_DWORD *)(v6 + 128) = self->_notificationType;
  *(_DWORD *)(v6 + 244) |= 0x20u;
  v67 = self->_has;
  if ((*(_DWORD *)&v67 & 0x10000) != 0)
    goto LABEL_80;
LABEL_67:
  if ((*(_WORD *)&v67 & 0x8000) != 0)
  {
LABEL_68:
    *(_BYTE *)(v6 + 240) = self->_isMarketingNotificationEnabled;
    *(_DWORD *)(v6 + 244) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $FCCF821F11C5FAFB61D31B7D7B590019 has;
  int v6;
  NSMutableArray *visibleViews;
  int v8;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  NSMutableArray *paidSubscriptionChannelIds;
  int v13;
  NSString *notificationId;
  NSString *notificationSenderChannelId;
  NSString *notificationSourceChannelId;
  int v17;
  NSMutableArray *notificationChannelIds;
  NSString *notificationArticleId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $FCCF821F11C5FAFB61D31B7D7B590019 v23;
  int v24;
  NSMutableArray *subscribedFeedIds;
  int v26;
  NTPBWidgetEngagement *widgetEngagement;
  NSMutableArray *autoSubscribedFeedIds;
  NSMutableArray *groupableFeedIds;
  $FCCF821F11C5FAFB61D31B7D7B590019 v30;
  int v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_132;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 61);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_lastAppSessionTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_132;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_132;
  }
  visibleViews = self->_visibleViews;
  if ((unint64_t)visibleViews | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](visibleViews, "isEqual:"))
      goto LABEL_132;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 61);
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_channelSubscriptionCount != *((_DWORD *)v4 + 12))
      goto LABEL_132;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_topicSubscriptionCount != *((_DWORD *)v4 + 46))
      goto LABEL_132;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_132;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](referringSourceApplication, "isEqual:"))
  {
    goto LABEL_132;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:"))
      goto LABEL_132;
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:"))
      goto LABEL_132;
  }
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if ((unint64_t)paidSubscriptionChannelIds | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](paidSubscriptionChannelIds, "isEqual:"))
      goto LABEL_132;
  }
  v13 = *((_DWORD *)v4 + 61);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    if ((v13 & 0x20000) == 0)
      goto LABEL_132;
    if (self->_startedFromNotification)
    {
      if (!*((_BYTE *)v4 + 242))
        goto LABEL_132;
    }
    else if (*((_BYTE *)v4 + 242))
    {
      goto LABEL_132;
    }
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_132;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_132;
  }
  notificationSenderChannelId = self->_notificationSenderChannelId;
  if ((unint64_t)notificationSenderChannelId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](notificationSenderChannelId, "isEqual:"))
      goto LABEL_132;
  }
  notificationSourceChannelId = self->_notificationSourceChannelId;
  if ((unint64_t)notificationSourceChannelId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](notificationSourceChannelId, "isEqual:"))
      goto LABEL_132;
  }
  v17 = *((_DWORD *)v4 + 61);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_notitificationsEnabledChannelsCount != *((_DWORD *)v4 + 33))
      goto LABEL_132;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_132;
  }
  notificationChannelIds = self->_notificationChannelIds;
  if ((unint64_t)notificationChannelIds | *((_QWORD *)v4 + 11)
    && !-[NSMutableArray isEqual:](notificationChannelIds, "isEqual:"))
  {
    goto LABEL_132;
  }
  notificationArticleId = self->_notificationArticleId;
  if ((unint64_t)notificationArticleId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](notificationArticleId, "isEqual:"))
      goto LABEL_132;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_132;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_132;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_132;
  }
  v23 = self->_has;
  v24 = *((_DWORD *)v4 + 61);
  if ((*(_BYTE *)&v23 & 0x10) != 0)
  {
    if ((v24 & 0x10) == 0 || self->_notificationEnabledChannelsCount != *((_DWORD *)v4 + 24))
      goto LABEL_132;
  }
  else if ((v24 & 0x10) != 0)
  {
    goto LABEL_132;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:"))
      goto LABEL_132;
    v23 = self->_has;
  }
  v26 = *((_DWORD *)v4 + 61);
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
    if ((v26 & 0x200) == 0 || self->_sessionStartMethod != *((_DWORD *)v4 + 43))
      goto LABEL_132;
  }
  else if ((v26 & 0x200) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    if ((v26 & 0x2000) == 0 || self->_widgetSection != *((_DWORD *)v4 + 58))
      goto LABEL_132;
  }
  else if ((v26 & 0x2000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x4000) != 0)
  {
    if ((v26 & 0x4000) == 0 || self->_widgetSectionArticleRank != *((_DWORD *)v4 + 59))
      goto LABEL_132;
  }
  else if ((v26 & 0x4000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x1000) != 0)
  {
    if ((v26 & 0x1000) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 54))
      goto LABEL_132;
  }
  else if ((v26 & 0x1000) != 0)
  {
    goto LABEL_132;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 28)
    && !-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
  {
    goto LABEL_132;
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if ((unint64_t)autoSubscribedFeedIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](autoSubscribedFeedIds, "isEqual:"))
      goto LABEL_132;
  }
  groupableFeedIds = self->_groupableFeedIds;
  if ((unint64_t)groupableFeedIds | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](groupableFeedIds, "isEqual:"))
      goto LABEL_132;
  }
  v30 = self->_has;
  v31 = *((_DWORD *)v4 + 61);
  if ((*(_BYTE *)&v30 & 0x80) != 0)
  {
    if ((v31 & 0x80) == 0 || self->_portraitAutoSubscribeFeedCount != *((_DWORD *)v4 + 36))
      goto LABEL_132;
  }
  else if ((v31 & 0x80) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x100) != 0)
  {
    if ((v31 & 0x100) == 0 || self->_safariAutoSubscribeFeedCount != *((_DWORD *)v4 + 42))
      goto LABEL_132;
  }
  else if ((v31 & 0x100) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_BYTE *)&v30 & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_appsAutoSubscribeFeedCount != *((_DWORD *)v4 + 4))
      goto LABEL_132;
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_BYTE *)&v30 & 8) != 0)
  {
    if ((v31 & 8) == 0 || self->_internalAutoSubscribeFeedCount != *((_DWORD *)v4 + 18))
      goto LABEL_132;
  }
  else if ((v31 & 8) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x800) != 0)
  {
    if ((v31 & 0x800) == 0 || self->_viewabilityState != *((_DWORD *)v4 + 50))
      goto LABEL_132;
  }
  else if ((v31 & 0x800) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_BYTE *)&v30 & 0x20) != 0)
  {
    if ((v31 & 0x20) == 0 || self->_notificationType != *((_DWORD *)v4 + 32))
      goto LABEL_132;
  }
  else if ((v31 & 0x20) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_DWORD *)&v30 & 0x10000) != 0)
  {
    if ((v31 & 0x10000) == 0)
      goto LABEL_132;
    if (self->_isNewIssuesNotificationEnabled)
    {
      if (!*((_BYTE *)v4 + 241))
        goto LABEL_132;
    }
    else if (*((_BYTE *)v4 + 241))
    {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x10000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x8000) != 0)
  {
    if ((v31 & 0x8000) != 0)
    {
      if (self->_isMarketingNotificationEnabled)
      {
        if (!*((_BYTE *)v4 + 240))
          goto LABEL_132;
      }
      else if (*((_BYTE *)v4 + 240))
      {
        goto LABEL_132;
      }
      v32 = 1;
      goto LABEL_133;
    }
LABEL_132:
    v32 = 0;
    goto LABEL_133;
  }
  v32 = (*((_DWORD *)v4 + 61) & 0x8000) == 0;
LABEL_133:

  return v32;
}

- (unint64_t)hash
{
  $FCCF821F11C5FAFB61D31B7D7B590019 has;
  uint64_t v4;
  uint64_t v5;
  $FCCF821F11C5FAFB61D31B7D7B590019 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $FCCF821F11C5FAFB61D31B7D7B590019 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v42 = 2654435761 * self->_lastAppSessionTimestamp;
  else
    v42 = 0;
  v41 = -[NSMutableArray hash](self->_visibleViews, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    v40 = 2654435761 * self->_channelSubscriptionCount;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_6;
  }
  else
  {
    v40 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_6:
      v39 = 2654435761 * self->_topicSubscriptionCount;
      goto LABEL_9;
    }
  }
  v39 = 0;
LABEL_9:
  v38 = -[NSString hash](self->_referringSourceApplication, "hash");
  v37 = -[NSString hash](self->_referringUrl, "hash");
  v36 = -[NSString hash](self->_userActivityType, "hash");
  v35 = -[NSMutableArray hash](self->_paidSubscriptionChannelIds, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v34 = 2654435761 * self->_startedFromNotification;
  else
    v34 = 0;
  v33 = -[NSString hash](self->_notificationId, "hash");
  v32 = -[NSString hash](self->_notificationSenderChannelId, "hash");
  v31 = -[NSString hash](self->_notificationSourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v30 = 2654435761 * self->_notitificationsEnabledChannelsCount;
  else
    v30 = 0;
  v29 = -[NSMutableArray hash](self->_notificationChannelIds, "hash");
  v28 = -[NSString hash](self->_notificationArticleId, "hash");
  v27 = -[NSString hash](self->_campaignId, "hash");
  v26 = -[NSString hash](self->_campaignType, "hash");
  v25 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v4 = -[NSMutableArray hash](self->_subscribedFeedIds, "hash", 2654435761 * self->_notificationEnabledChannelsCount);
  else
    v4 = -[NSMutableArray hash](self->_subscribedFeedIds, "hash", 0);
  v5 = v4;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    v7 = 2654435761 * self->_sessionStartMethod;
    if ((*(_WORD *)&v6 & 0x2000) != 0)
    {
LABEL_20:
      v8 = 2654435761 * self->_widgetSection;
      if ((*(_WORD *)&v6 & 0x4000) != 0)
        goto LABEL_21;
LABEL_25:
      v9 = 0;
      if ((*(_WORD *)&v6 & 0x1000) != 0)
        goto LABEL_22;
      goto LABEL_26;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_WORD *)&v6 & 0x2000) != 0)
      goto LABEL_20;
  }
  v8 = 0;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
    goto LABEL_25;
LABEL_21:
  v9 = 2654435761 * self->_widgetSectionArticleRank;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
LABEL_22:
    v10 = 2654435761 * self->_widgetArticleRank;
    goto LABEL_27;
  }
LABEL_26:
  v10 = 0;
LABEL_27:
  v11 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v12 = -[NSMutableArray hash](self->_autoSubscribedFeedIds, "hash");
  v13 = -[NSMutableArray hash](self->_groupableFeedIds, "hash");
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    v15 = 2654435761 * self->_portraitAutoSubscribeFeedCount;
    if ((*(_WORD *)&v14 & 0x100) != 0)
    {
LABEL_29:
      v16 = 2654435761 * self->_safariAutoSubscribeFeedCount;
      if ((*(_BYTE *)&v14 & 2) != 0)
        goto LABEL_30;
      goto LABEL_38;
    }
  }
  else
  {
    v15 = 0;
    if ((*(_WORD *)&v14 & 0x100) != 0)
      goto LABEL_29;
  }
  v16 = 0;
  if ((*(_BYTE *)&v14 & 2) != 0)
  {
LABEL_30:
    v17 = 2654435761 * self->_appsAutoSubscribeFeedCount;
    if ((*(_BYTE *)&v14 & 8) != 0)
      goto LABEL_31;
    goto LABEL_39;
  }
LABEL_38:
  v17 = 0;
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
LABEL_31:
    v18 = 2654435761 * self->_internalAutoSubscribeFeedCount;
    if ((*(_WORD *)&v14 & 0x800) != 0)
      goto LABEL_32;
    goto LABEL_40;
  }
LABEL_39:
  v18 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_32:
    v19 = 2654435761 * self->_viewabilityState;
    if ((*(_BYTE *)&v14 & 0x20) != 0)
      goto LABEL_33;
    goto LABEL_41;
  }
LABEL_40:
  v19 = 0;
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
LABEL_33:
    v20 = 2654435761 * self->_notificationType;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
      goto LABEL_34;
LABEL_42:
    v21 = 0;
    if ((*(_WORD *)&v14 & 0x8000) != 0)
      goto LABEL_35;
LABEL_43:
    v22 = 0;
    return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_41:
  v20 = 0;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
    goto LABEL_42;
LABEL_34:
  v21 = 2654435761 * self->_isNewIssuesNotificationEnabled;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
    goto LABEL_43;
LABEL_35:
  v22 = 2654435761 * self->_isMarketingNotificationEnabled;
  return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
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
  int v27;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ii;
  int v40;
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 244) & 1) != 0)
  {
    self->_lastAppSessionTimestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v6 = *((id *)v4 + 26);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(v6);
        -[NTPBAppSessionStart addVisibleViews:](self, "addVisibleViews:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v5 + 61);
  if ((v11 & 4) != 0)
  {
    self->_channelSubscriptionCount = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 4u;
    v11 = *((_DWORD *)v5 + 61);
  }
  if ((v11 & 0x400) != 0)
  {
    self->_topicSubscriptionCount = *((_DWORD *)v5 + 46);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v5 + 19))
    -[NTPBAppSessionStart setReferringSourceApplication:](self, "setReferringSourceApplication:");
  if (*((_QWORD *)v5 + 20))
    -[NTPBAppSessionStart setReferringUrl:](self, "setReferringUrl:");
  if (*((_QWORD *)v5 + 24))
    -[NTPBAppSessionStart setUserActivityType:](self, "setUserActivityType:");
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v12 = *((id *)v5 + 17);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v58 != v15)
          objc_enumerationMutation(v12);
        -[NTPBAppSessionStart addPaidSubscriptionChannelIds:](self, "addPaidSubscriptionChannelIds:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v5 + 246) & 2) != 0)
  {
    self->_startedFromNotification = *((_BYTE *)v5 + 242);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)v5 + 13))
    -[NTPBAppSessionStart setNotificationId:](self, "setNotificationId:");
  if (*((_QWORD *)v5 + 14))
    -[NTPBAppSessionStart setNotificationSenderChannelId:](self, "setNotificationSenderChannelId:");
  if (*((_QWORD *)v5 + 15))
    -[NTPBAppSessionStart setNotificationSourceChannelId:](self, "setNotificationSourceChannelId:");
  if ((*((_BYTE *)v5 + 244) & 0x40) != 0)
  {
    self->_notitificationsEnabledChannelsCount = *((_DWORD *)v5 + 33);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v17 = *((id *)v5 + 11);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v54 != v20)
          objc_enumerationMutation(v17);
        -[NTPBAppSessionStart addNotificationChannelIds:](self, "addNotificationChannelIds:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    }
    while (v19);
  }

  if (*((_QWORD *)v5 + 10))
    -[NTPBAppSessionStart setNotificationArticleId:](self, "setNotificationArticleId:");
  if (*((_QWORD *)v5 + 4))
    -[NTPBAppSessionStart setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBAppSessionStart setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 7))
    -[NTPBAppSessionStart setCreativeId:](self, "setCreativeId:");
  if ((*((_BYTE *)v5 + 244) & 0x10) != 0)
  {
    self->_notificationEnabledChannelsCount = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v22 = *((id *)v5 + 22);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        -[NTPBAppSessionStart addSubscribedFeedIds:](self, "addSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
    }
    while (v24);
  }

  v27 = *((_DWORD *)v5 + 61);
  if ((v27 & 0x200) != 0)
  {
    self->_sessionStartMethod = *((_DWORD *)v5 + 43);
    *(_DWORD *)&self->_has |= 0x200u;
    v27 = *((_DWORD *)v5 + 61);
    if ((v27 & 0x2000) == 0)
    {
LABEL_63:
      if ((v27 & 0x4000) == 0)
        goto LABEL_64;
      goto LABEL_71;
    }
  }
  else if ((v27 & 0x2000) == 0)
  {
    goto LABEL_63;
  }
  self->_widgetSection = *((_DWORD *)v5 + 58);
  *(_DWORD *)&self->_has |= 0x2000u;
  v27 = *((_DWORD *)v5 + 61);
  if ((v27 & 0x4000) == 0)
  {
LABEL_64:
    if ((v27 & 0x1000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_71:
  self->_widgetSectionArticleRank = *((_DWORD *)v5 + 59);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v5 + 61) & 0x1000) != 0)
  {
LABEL_65:
    self->_widgetArticleRank = *((_DWORD *)v5 + 54);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_66:
  widgetEngagement = self->_widgetEngagement;
  v29 = *((_QWORD *)v5 + 28);
  if (widgetEngagement)
  {
    if (v29)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v29)
  {
    -[NTPBAppSessionStart setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = *((id *)v5 + 3);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v46;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        -[NTPBAppSessionStart addAutoSubscribedFeedIds:](self, "addAutoSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * n));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
    }
    while (v32);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v35 = *((id *)v5 + 8);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v42;
    do
    {
      for (ii = 0; ii != v37; ++ii)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(v35);
        -[NTPBAppSessionStart addGroupableFeedIds:](self, "addGroupableFeedIds:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * ii), (_QWORD)v41);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
    }
    while (v37);
  }

  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x80) != 0)
  {
    self->_portraitAutoSubscribeFeedCount = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x80u;
    v40 = *((_DWORD *)v5 + 61);
    if ((v40 & 0x100) == 0)
    {
LABEL_91:
      if ((v40 & 2) == 0)
        goto LABEL_92;
      goto LABEL_101;
    }
  }
  else if ((v40 & 0x100) == 0)
  {
    goto LABEL_91;
  }
  self->_safariAutoSubscribeFeedCount = *((_DWORD *)v5 + 42);
  *(_DWORD *)&self->_has |= 0x100u;
  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 2) == 0)
  {
LABEL_92:
    if ((v40 & 8) == 0)
      goto LABEL_93;
    goto LABEL_102;
  }
LABEL_101:
  self->_appsAutoSubscribeFeedCount = *((_DWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 8) == 0)
  {
LABEL_93:
    if ((v40 & 0x800) == 0)
      goto LABEL_94;
    goto LABEL_103;
  }
LABEL_102:
  self->_internalAutoSubscribeFeedCount = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 8u;
  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x800) == 0)
  {
LABEL_94:
    if ((v40 & 0x20) == 0)
      goto LABEL_95;
    goto LABEL_104;
  }
LABEL_103:
  self->_viewabilityState = *((_DWORD *)v5 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x20) == 0)
  {
LABEL_95:
    if ((v40 & 0x10000) == 0)
      goto LABEL_96;
LABEL_105:
    self->_isNewIssuesNotificationEnabled = *((_BYTE *)v5 + 241);
    *(_DWORD *)&self->_has |= 0x10000u;
    if ((*((_DWORD *)v5 + 61) & 0x8000) == 0)
      goto LABEL_98;
    goto LABEL_97;
  }
LABEL_104:
  self->_notificationType = *((_DWORD *)v5 + 32);
  *(_DWORD *)&self->_has |= 0x20u;
  v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x10000) != 0)
    goto LABEL_105;
LABEL_96:
  if ((v40 & 0x8000) != 0)
  {
LABEL_97:
    self->_isMarketingNotificationEnabled = *((_BYTE *)v5 + 240);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_98:

}

- (int64_t)lastAppSessionTimestamp
{
  return self->_lastAppSessionTimestamp;
}

- (NSMutableArray)visibleViews
{
  return self->_visibleViews;
}

- (void)setVisibleViews:(id)a3
{
  objc_storeStrong((id *)&self->_visibleViews, a3);
}

- (int)channelSubscriptionCount
{
  return self->_channelSubscriptionCount;
}

- (int)topicSubscriptionCount
{
  return self->_topicSubscriptionCount;
}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_referringSourceApplication, a3);
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
  objc_storeStrong((id *)&self->_referringUrl, a3);
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityType, a3);
}

- (NSMutableArray)paidSubscriptionChannelIds
{
  return self->_paidSubscriptionChannelIds;
}

- (void)setPaidSubscriptionChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, a3);
}

- (BOOL)startedFromNotification
{
  return self->_startedFromNotification;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationId, a3);
}

- (NSString)notificationSenderChannelId
{
  return self->_notificationSenderChannelId;
}

- (void)setNotificationSenderChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSenderChannelId, a3);
}

- (NSString)notificationSourceChannelId
{
  return self->_notificationSourceChannelId;
}

- (void)setNotificationSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSourceChannelId, a3);
}

- (int)notitificationsEnabledChannelsCount
{
  return self->_notitificationsEnabledChannelsCount;
}

- (NSMutableArray)notificationChannelIds
{
  return self->_notificationChannelIds;
}

- (void)setNotificationChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_notificationChannelIds, a3);
}

- (NSString)notificationArticleId
{
  return self->_notificationArticleId;
}

- (void)setNotificationArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationArticleId, a3);
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

- (int)notificationEnabledChannelsCount
{
  return self->_notificationEnabledChannelsCount;
}

- (NSMutableArray)subscribedFeedIds
{
  return self->_subscribedFeedIds;
}

- (void)setSubscribedFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedFeedIds, a3);
}

- (int)widgetSectionArticleRank
{
  return self->_widgetSectionArticleRank;
}

- (int)widgetArticleRank
{
  return self->_widgetArticleRank;
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEngagement, a3);
}

- (NSMutableArray)autoSubscribedFeedIds
{
  return self->_autoSubscribedFeedIds;
}

- (void)setAutoSubscribedFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_autoSubscribedFeedIds, a3);
}

- (NSMutableArray)groupableFeedIds
{
  return self->_groupableFeedIds;
}

- (void)setGroupableFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_groupableFeedIds, a3);
}

- (int)portraitAutoSubscribeFeedCount
{
  return self->_portraitAutoSubscribeFeedCount;
}

- (int)safariAutoSubscribeFeedCount
{
  return self->_safariAutoSubscribeFeedCount;
}

- (int)appsAutoSubscribeFeedCount
{
  return self->_appsAutoSubscribeFeedCount;
}

- (int)internalAutoSubscribeFeedCount
{
  return self->_internalAutoSubscribeFeedCount;
}

- (BOOL)isNewIssuesNotificationEnabled
{
  return self->_isNewIssuesNotificationEnabled;
}

- (BOOL)isMarketingNotificationEnabled
{
  return self->_isMarketingNotificationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationSourceChannelId, 0);
  objc_storeStrong((id *)&self->_notificationSenderChannelId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_notificationChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationArticleId, 0);
  objc_storeStrong((id *)&self->_groupableFeedIds, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_autoSubscribedFeedIds, 0);
}

@end
