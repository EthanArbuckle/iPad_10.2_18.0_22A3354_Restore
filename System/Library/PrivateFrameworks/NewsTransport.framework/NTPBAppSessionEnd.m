@implementation NTPBAppSessionEnd

- (int)sessionEndReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_sessionEndReason;
  else
    return 0;
}

- (void)setSessionEndReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sessionEndReason = a3;
}

- (void)setHasSessionEndReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSessionEndReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)sessionEndReasonAsString:(int)a3
{
  if (a3 < 8)
    return off_24CD52338[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSessionEndReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_HISTORY_CLEAR_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BACKGROUND_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORCE_QUIT_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_NOTIFICATION_RECEIVED_RESET_USER_ID_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ICLOUD_SYNCED_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_VIDEO_PLAYER_DISMISSED_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NAVIGATION_SESSION_END_REASON")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearLastVisibleViews
{
  -[NSMutableArray removeAllObjects](self->_lastVisibleViews, "removeAllObjects");
}

- (void)addLastVisibleViews:(id)a3
{
  id v4;
  NSMutableArray *lastVisibleViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lastVisibleViews = self->_lastVisibleViews;
  v8 = v4;
  if (!lastVisibleViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_lastVisibleViews;
    self->_lastVisibleViews = v6;

    v4 = v8;
    lastVisibleViews = self->_lastVisibleViews;
  }
  -[NSMutableArray addObject:](lastVisibleViews, "addObject:", v4);

}

- (unint64_t)lastVisibleViewsCount
{
  return -[NSMutableArray count](self->_lastVisibleViews, "count");
}

- (id)lastVisibleViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_lastVisibleViews, "objectAtIndex:", a3);
}

+ (Class)lastVisibleViewsType
{
  return (Class)objc_opt_class();
}

- (void)setChannelSubscriptionCount:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_channelSubscriptionCount = a3;
}

- (void)setHasChannelSubscriptionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChannelSubscriptionCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTopicSubscriptionCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_topicSubscriptionCount = a3;
}

- (void)setHasTopicSubscriptionCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTopicSubscriptionCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAppSessionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appSessionDuration = a3;
}

- (void)setHasAppSessionDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppSessionDuration
{
  return *(_WORD *)&self->_has & 1;
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

- (void)setNotitificationsEnabledChannelsCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_notitificationsEnabledChannelsCount = a3;
}

- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNotitificationsEnabledChannelsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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

- (void)setNotificationEnabledChannelsCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_notificationEnabledChannelsCount = a3;
}

- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNotificationEnabledChannelsCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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

- (void)setBreakingNewsAvailableDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_breakingNewsAvailableDuringSession = a3;
}

- (void)setHasBreakingNewsAvailableDuringSession:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasBreakingNewsAvailableDuringSession
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setBreakingNewsDismissedDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_breakingNewsDismissedDuringSession = a3;
}

- (void)setHasBreakingNewsDismissedDuringSession:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasBreakingNewsDismissedDuringSession
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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
  *(_WORD *)&self->_has |= 0x40u;
  self->_portraitAutoSubscribeFeedCount = a3;
}

- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPortraitAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSafariAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_safariAutoSubscribeFeedCount = a3;
}

- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSafariAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAppsAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appsAutoSubscribeFeedCount = a3;
}

- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppsAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setInternalAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_internalAutoSubscribeFeedCount = a3;
}

- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasInternalAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSyncedOtherUserIdDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_syncedOtherUserIdDuringSession = a3;
}

- (void)setHasSyncedOtherUserIdDuringSession:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSyncedOtherUserIdDuringSession
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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
  v8.super_class = (Class)NTPBAppSessionEnd;
  -[NTPBAppSessionEnd description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAppSessionEnd dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t sessionEndReason;
  __CFString *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int16 has;
  void *v14;
  NSMutableArray *paidSubscriptionChannelIds;
  void *v16;
  NSMutableArray *notificationChannelIds;
  void *v18;
  NSMutableArray *subscribedFeedIds;
  __int16 v20;
  void *v21;
  void *v22;
  NSMutableArray *autoSubscribedFeedIds;
  NSMutableArray *groupableFeedIds;
  __int16 v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    sessionEndReason = self->_sessionEndReason;
    if (sessionEndReason >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sessionEndReason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD52338[sessionEndReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("session_end_reason"));

  }
  if (-[NSMutableArray count](self->_lastVisibleViews, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_lastVisibleViews, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = self->_lastVisibleViews;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("last_visible_views"));
  }
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_channelSubscriptionCount);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("channel_subscription_count"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 1) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topicSubscriptionCount);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("topic_subscription_count"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appSessionDuration);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("app_session_duration"));

  }
LABEL_19:
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if (paidSubscriptionChannelIds)
    objc_msgSend(v3, "setObject:forKey:", paidSubscriptionChannelIds, CFSTR("paid_subscription_channel_ids"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notitificationsEnabledChannelsCount);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("notitifications_enabled_channels_count"));

  }
  notificationChannelIds = self->_notificationChannelIds;
  if (notificationChannelIds)
    objc_msgSend(v3, "setObject:forKey:", notificationChannelIds, CFSTR("notification_channel_ids"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationEnabledChannelsCount);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("notification_enabled_channels_count"));

  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds)
    objc_msgSend(v3, "setObject:forKey:", subscribedFeedIds, CFSTR("subscribed_feed_ids"));
  v20 = (__int16)self->_has;
  if ((v20 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_breakingNewsAvailableDuringSession);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("breaking_news_available_during_session"));

    v20 = (__int16)self->_has;
  }
  if ((v20 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_breakingNewsDismissedDuringSession);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("breaking_news_dismissed_during_session"));

  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if (autoSubscribedFeedIds)
    objc_msgSend(v3, "setObject:forKey:", autoSubscribedFeedIds, CFSTR("auto_subscribed_feed_ids"));
  groupableFeedIds = self->_groupableFeedIds;
  if (groupableFeedIds)
    objc_msgSend(v3, "setObject:forKey:", groupableFeedIds, CFSTR("groupable_feed_ids"));
  v25 = (__int16)self->_has;
  if ((v25 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_portraitAutoSubscribeFeedCount);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("portrait_auto_subscribe_feed_count"));

    v25 = (__int16)self->_has;
    if ((v25 & 0x80) == 0)
    {
LABEL_39:
      if ((v25 & 2) == 0)
        goto LABEL_40;
      goto LABEL_49;
    }
  }
  else if ((v25 & 0x80) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_safariAutoSubscribeFeedCount);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("safari_auto_subscribe_feed_count"));

  v25 = (__int16)self->_has;
  if ((v25 & 2) == 0)
  {
LABEL_40:
    if ((v25 & 8) == 0)
      goto LABEL_41;
LABEL_50:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_internalAutoSubscribeFeedCount);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("internal_auto_subscribe_feed_count"));

    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      return v3;
    goto LABEL_42;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_appsAutoSubscribeFeedCount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("apps_auto_subscribe_feed_count"));

  v25 = (__int16)self->_has;
  if ((v25 & 8) != 0)
    goto LABEL_50;
LABEL_41:
  if ((v25 & 0x1000) != 0)
  {
LABEL_42:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_syncedOtherUserIdDuringSession);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("synced_other_user_id_during_session"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
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
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int16 v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  __int16 v37;
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v5 = self->_lastVisibleViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_12:
      if ((has & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_13:
    PBDataWriterWriteInt64Field();
LABEL_14:
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
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v13);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
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
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v18);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
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
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v23);
  }

  v26 = (__int16)self->_has;
  if ((v26 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x800) != 0)
    PBDataWriterWriteBOOLField();
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
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteStringField();
      }
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
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        PBDataWriterWriteStringField();
      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v34);
  }

  v37 = (__int16)self->_has;
  if ((v37 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v37 = (__int16)self->_has;
    if ((v37 & 0x80) == 0)
    {
LABEL_59:
      if ((v37 & 2) == 0)
        goto LABEL_60;
      goto LABEL_69;
    }
  }
  else if ((v37 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteInt32Field();
  v37 = (__int16)self->_has;
  if ((v37 & 2) == 0)
  {
LABEL_60:
    if ((v37 & 8) == 0)
      goto LABEL_61;
LABEL_70:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v37 = (__int16)self->_has;
  if ((v37 & 8) != 0)
    goto LABEL_70;
LABEL_61:
  if ((v37 & 0x1000) != 0)
LABEL_62:
    PBDataWriterWriteBOOLField();
LABEL_63:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int16 has;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  __int16 v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t n;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  __int16 v45;
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
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_sessionEndReason;
    *(_WORD *)(v5 + 120) |= 0x100u;
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v7 = self->_lastVisibleViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v68 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addLastVisibleViews:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v9);
  }

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_channelSubscriptionCount;
    *(_WORD *)(v6 + 120) |= 4u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_12:
      if ((has & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 112) = self->_topicSubscriptionCount;
  *(_WORD *)(v6 + 120) |= 0x200u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_13:
    *(_QWORD *)(v6 + 8) = self->_appSessionDuration;
    *(_WORD *)(v6 + 120) |= 1u;
  }
LABEL_14:
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v14 = self->_paidSubscriptionChannelIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v64 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPaidSubscriptionChannelIds:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_notitificationsEnabledChannelsCount;
    *(_WORD *)(v6 + 120) |= 0x20u;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v20 = self->_notificationChannelIds;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v60;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v60 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNotificationChannelIds:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_notificationEnabledChannelsCount;
    *(_WORD *)(v6 + 120) |= 0x10u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v26 = self->_subscribedFeedIds;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v56;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v56 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSubscribedFeedIds:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v55, v73, 16);
    }
    while (v28);
  }

  v32 = (__int16)self->_has;
  if ((v32 & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 116) = self->_breakingNewsAvailableDuringSession;
    *(_WORD *)(v6 + 120) |= 0x400u;
    v32 = (__int16)self->_has;
  }
  if ((v32 & 0x800) != 0)
  {
    *(_BYTE *)(v6 + 117) = self->_breakingNewsDismissedDuringSession;
    *(_WORD *)(v6 + 120) |= 0x800u;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = self->_autoSubscribedFeedIds;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v52;
    do
    {
      for (n = 0; n != v35; ++n)
      {
        if (*(_QWORD *)v52 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addAutoSubscribedFeedIds:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v72, 16);
    }
    while (v35);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v39 = self->_groupableFeedIds;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v48;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * ii), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend((id)v6, "addGroupableFeedIds:", v44);

      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v47, v71, 16);
    }
    while (v41);
  }

  v45 = (__int16)self->_has;
  if ((v45 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_portraitAutoSubscribeFeedCount;
    *(_WORD *)(v6 + 120) |= 0x40u;
    v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_59:
      if ((v45 & 2) == 0)
        goto LABEL_60;
      goto LABEL_69;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  *(_DWORD *)(v6 + 92) = self->_safariAutoSubscribeFeedCount;
  *(_WORD *)(v6 + 120) |= 0x80u;
  v45 = (__int16)self->_has;
  if ((v45 & 2) == 0)
  {
LABEL_60:
    if ((v45 & 8) == 0)
      goto LABEL_61;
LABEL_70:
    *(_DWORD *)(v6 + 48) = self->_internalAutoSubscribeFeedCount;
    *(_WORD *)(v6 + 120) |= 8u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      return (id)v6;
    goto LABEL_62;
  }
LABEL_69:
  *(_DWORD *)(v6 + 16) = self->_appsAutoSubscribeFeedCount;
  *(_WORD *)(v6 + 120) |= 2u;
  v45 = (__int16)self->_has;
  if ((v45 & 8) != 0)
    goto LABEL_70;
LABEL_61:
  if ((v45 & 0x1000) != 0)
  {
LABEL_62:
    *(_BYTE *)(v6 + 118) = self->_syncedOtherUserIdDuringSession;
    *(_WORD *)(v6 + 120) |= 0x1000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *lastVisibleViews;
  __int16 v7;
  NSMutableArray *paidSubscriptionChannelIds;
  __int16 v9;
  NSMutableArray *notificationChannelIds;
  __int16 v11;
  NSMutableArray *subscribedFeedIds;
  NSMutableArray *autoSubscribedFeedIds;
  NSMutableArray *groupableFeedIds;
  __int16 v15;
  __int16 v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_87;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x100) == 0 || self->_sessionEndReason != *((_DWORD *)v4 + 24))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    goto LABEL_87;
  }
  lastVisibleViews = self->_lastVisibleViews;
  if ((unint64_t)lastVisibleViews | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](lastVisibleViews, "isEqual:"))
      goto LABEL_87;
    has = (__int16)self->_has;
  }
  v7 = *((_WORD *)v4 + 60);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_channelSubscriptionCount != *((_DWORD *)v4 + 8))
      goto LABEL_87;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x200) == 0 || self->_topicSubscriptionCount != *((_DWORD *)v4 + 28))
      goto LABEL_87;
  }
  else if ((*((_WORD *)v4 + 60) & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_appSessionDuration != *((_QWORD *)v4 + 1))
      goto LABEL_87;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_87;
  }
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if ((unint64_t)paidSubscriptionChannelIds | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](paidSubscriptionChannelIds, "isEqual:"))
      goto LABEL_87;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 60);
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_notitificationsEnabledChannelsCount != *((_DWORD *)v4 + 19))
      goto LABEL_87;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  notificationChannelIds = self->_notificationChannelIds;
  if ((unint64_t)notificationChannelIds | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](notificationChannelIds, "isEqual:"))
      goto LABEL_87;
    has = (__int16)self->_has;
  }
  v11 = *((_WORD *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_notificationEnabledChannelsCount != *((_DWORD *)v4 + 18))
      goto LABEL_87;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:"))
      goto LABEL_87;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x400) == 0)
      goto LABEL_87;
    if (self->_breakingNewsAvailableDuringSession)
    {
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_87;
    }
    else if (*((_BYTE *)v4 + 116))
    {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x800) == 0)
      goto LABEL_87;
    if (self->_breakingNewsDismissedDuringSession)
    {
      if (!*((_BYTE *)v4 + 117))
        goto LABEL_87;
    }
    else if (*((_BYTE *)v4 + 117))
    {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x800) != 0)
  {
    goto LABEL_87;
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if ((unint64_t)autoSubscribedFeedIds | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](autoSubscribedFeedIds, "isEqual:"))
  {
    goto LABEL_87;
  }
  groupableFeedIds = self->_groupableFeedIds;
  if ((unint64_t)groupableFeedIds | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](groupableFeedIds, "isEqual:"))
      goto LABEL_87;
  }
  v15 = (__int16)self->_has;
  v16 = *((_WORD *)v4 + 60);
  if ((v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_portraitAutoSubscribeFeedCount != *((_DWORD *)v4 + 22))
      goto LABEL_87;
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_safariAutoSubscribeFeedCount != *((_DWORD *)v4 + 23))
      goto LABEL_87;
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_appsAutoSubscribeFeedCount != *((_DWORD *)v4 + 4))
      goto LABEL_87;
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_internalAutoSubscribeFeedCount != *((_DWORD *)v4 + 12))
      goto LABEL_87;
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x1000) != 0)
    {
      if (self->_syncedOtherUserIdDuringSession)
      {
        if (!*((_BYTE *)v4 + 118))
          goto LABEL_87;
      }
      else if (*((_BYTE *)v4 + 118))
      {
        goto LABEL_87;
      }
      v17 = 1;
      goto LABEL_88;
    }
LABEL_87:
    v17 = 0;
    goto LABEL_88;
  }
  v17 = (v16 & 0x1000) == 0;
LABEL_88:

  return v17;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v25 = 2654435761 * self->_sessionEndReason;
  else
    v25 = 0;
  v24 = -[NSMutableArray hash](self->_lastVisibleViews, "hash");
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
    v23 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
LABEL_9:
    v22 = 0;
    if ((has & 1) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v23 = 2654435761 * self->_channelSubscriptionCount;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_9;
LABEL_6:
  v22 = 2654435761 * self->_topicSubscriptionCount;
  if ((has & 1) != 0)
  {
LABEL_7:
    v21 = 2654435761 * self->_appSessionDuration;
    goto LABEL_11;
  }
LABEL_10:
  v21 = 0;
LABEL_11:
  v19 = -[NSMutableArray hash](self->_paidSubscriptionChannelIds, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v4 = 2654435761 * self->_notitificationsEnabledChannelsCount;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_notificationChannelIds, "hash", v19);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v6 = 2654435761 * self->_notificationEnabledChannelsCount;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_subscribedFeedIds, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v8 = 2654435761 * self->_breakingNewsAvailableDuringSession;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_19;
  }
  else
  {
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_19:
      v9 = 2654435761 * self->_breakingNewsDismissedDuringSession;
      goto LABEL_22;
    }
  }
  v9 = 0;
LABEL_22:
  v10 = -[NSMutableArray hash](self->_autoSubscribedFeedIds, "hash");
  v11 = -[NSMutableArray hash](self->_groupableFeedIds, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    v13 = 2654435761 * self->_portraitAutoSubscribeFeedCount;
    if ((v12 & 0x80) != 0)
    {
LABEL_24:
      v14 = 2654435761 * self->_safariAutoSubscribeFeedCount;
      if ((v12 & 2) != 0)
        goto LABEL_25;
      goto LABEL_30;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 0x80) != 0)
      goto LABEL_24;
  }
  v14 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_25:
    v15 = 2654435761 * self->_appsAutoSubscribeFeedCount;
    if ((v12 & 8) != 0)
      goto LABEL_26;
LABEL_31:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_27;
LABEL_32:
    v17 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_30:
  v15 = 0;
  if ((v12 & 8) == 0)
    goto LABEL_31;
LABEL_26:
  v16 = 2654435761 * self->_internalAutoSubscribeFeedCount;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_32;
LABEL_27:
  v17 = 2654435761 * self->_syncedOtherUserIdDuringSession;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
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
  __int16 v11;
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
  __int16 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t n;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ii;
  __int16 v38;
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
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    self->_sessionEndReason = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v6 = *((id *)v4 + 7);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        -[NTPBAppSessionEnd addLastVisibleViews:](self, "addLastVisibleViews:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    }
    while (v8);
  }

  v11 = *((_WORD *)v5 + 60);
  if ((v11 & 4) != 0)
  {
    self->_channelSubscriptionCount = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 4u;
    v11 = *((_WORD *)v5 + 60);
    if ((v11 & 0x200) == 0)
    {
LABEL_12:
      if ((v11 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*((_WORD *)v5 + 60) & 0x200) == 0)
  {
    goto LABEL_12;
  }
  self->_topicSubscriptionCount = *((_DWORD *)v5 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v5 + 60) & 1) != 0)
  {
LABEL_13:
    self->_appSessionDuration = *((_QWORD *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v12 = *((id *)v5 + 10);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(v12);
        -[NTPBAppSessionEnd addPaidSubscriptionChannelIds:](self, "addPaidSubscriptionChannelIds:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v14);
  }

  if ((*((_WORD *)v5 + 60) & 0x20) != 0)
  {
    self->_notitificationsEnabledChannelsCount = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 0x20u;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v17 = *((id *)v5 + 8);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v52 != v20)
          objc_enumerationMutation(v17);
        -[NTPBAppSessionEnd addNotificationChannelIds:](self, "addNotificationChannelIds:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    }
    while (v19);
  }

  if ((*((_WORD *)v5 + 60) & 0x10) != 0)
  {
    self->_notificationEnabledChannelsCount = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = *((id *)v5 + 13);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v48 != v25)
          objc_enumerationMutation(v22);
        -[NTPBAppSessionEnd addSubscribedFeedIds:](self, "addSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
    }
    while (v24);
  }

  v27 = *((_WORD *)v5 + 60);
  if ((v27 & 0x400) != 0)
  {
    self->_breakingNewsAvailableDuringSession = *((_BYTE *)v5 + 116);
    *(_WORD *)&self->_has |= 0x400u;
    v27 = *((_WORD *)v5 + 60);
  }
  if ((v27 & 0x800) != 0)
  {
    self->_breakingNewsDismissedDuringSession = *((_BYTE *)v5 + 117);
    *(_WORD *)&self->_has |= 0x800u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v28 = *((id *)v5 + 3);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v64, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v44;
    do
    {
      for (n = 0; n != v30; ++n)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(v28);
        -[NTPBAppSessionEnd addAutoSubscribedFeedIds:](self, "addAutoSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * n));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v64, 16);
    }
    while (v30);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = *((id *)v5 + 5);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v40;
    do
    {
      for (ii = 0; ii != v35; ++ii)
      {
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(v33);
        -[NTPBAppSessionEnd addGroupableFeedIds:](self, "addGroupableFeedIds:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * ii), (_QWORD)v39);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
    }
    while (v35);
  }

  v38 = *((_WORD *)v5 + 60);
  if ((v38 & 0x40) != 0)
  {
    self->_portraitAutoSubscribeFeedCount = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x40u;
    v38 = *((_WORD *)v5 + 60);
    if ((v38 & 0x80) == 0)
    {
LABEL_59:
      if ((v38 & 2) == 0)
        goto LABEL_60;
      goto LABEL_69;
    }
  }
  else if ((v38 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  self->_safariAutoSubscribeFeedCount = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x80u;
  v38 = *((_WORD *)v5 + 60);
  if ((v38 & 2) == 0)
  {
LABEL_60:
    if ((v38 & 8) == 0)
      goto LABEL_61;
LABEL_70:
    self->_internalAutoSubscribeFeedCount = *((_DWORD *)v5 + 12);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v5 + 60) & 0x1000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_69:
  self->_appsAutoSubscribeFeedCount = *((_DWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 2u;
  v38 = *((_WORD *)v5 + 60);
  if ((v38 & 8) != 0)
    goto LABEL_70;
LABEL_61:
  if ((v38 & 0x1000) != 0)
  {
LABEL_62:
    self->_syncedOtherUserIdDuringSession = *((_BYTE *)v5 + 118);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_63:

}

- (NSMutableArray)lastVisibleViews
{
  return self->_lastVisibleViews;
}

- (void)setLastVisibleViews:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleViews, a3);
}

- (int)channelSubscriptionCount
{
  return self->_channelSubscriptionCount;
}

- (int)topicSubscriptionCount
{
  return self->_topicSubscriptionCount;
}

- (int64_t)appSessionDuration
{
  return self->_appSessionDuration;
}

- (NSMutableArray)paidSubscriptionChannelIds
{
  return self->_paidSubscriptionChannelIds;
}

- (void)setPaidSubscriptionChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, a3);
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

- (BOOL)breakingNewsAvailableDuringSession
{
  return self->_breakingNewsAvailableDuringSession;
}

- (BOOL)breakingNewsDismissedDuringSession
{
  return self->_breakingNewsDismissedDuringSession;
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

- (BOOL)syncedOtherUserIdDuringSession
{
  return self->_syncedOtherUserIdDuringSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationChannelIds, 0);
  objc_storeStrong((id *)&self->_lastVisibleViews, 0);
  objc_storeStrong((id *)&self->_groupableFeedIds, 0);
  objc_storeStrong((id *)&self->_autoSubscribedFeedIds, 0);
}

@end
