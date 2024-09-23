@implementation ATXUserNotificationGroup

- (ATXUserNotificationGroup)initWithNotifications:(id)a3
{
  id v4;
  ATXUserNotificationGroup *v5;
  uint64_t v6;
  NSArray *notifications;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserNotificationGroup;
  v5 = -[ATXUserNotificationGroup init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_190);
    v6 = objc_claimAutoreleasedReturnValue();
    notifications = v5->_notifications;
    v5->_notifications = (NSArray *)v6;

  }
  return v5;
}

uint64_t __50__ATXUserNotificationGroup_initWithNotifications___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (BOOL)runCachedCheckOnNotificationsWithIvar:(int64_t *)a3 block:(id)a4
{
  uint64_t (**v6)(id, _QWORD);
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, _QWORD))a4;
  if (*a3)
  {
    LOBYTE(v7) = *a3 == 2;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_notifications;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v14;
      v10 = 2;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v8);
          if ((v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_13:

    *a3 = v10;
  }

  return v7;
}

- (BOOL)hasCriticalNotifications
{
  return -[ATXUserNotificationGroup runCachedCheckOnNotificationsWithIvar:block:](self, "runCachedCheckOnNotificationsWithIvar:block:", &self->_hasCriticalNotifications, &__block_literal_global_9_3);
}

BOOL __52__ATXUserNotificationGroup_hasCriticalNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "urgency") == 0;
}

- (BOOL)hasTimeSensitiveNotifications
{
  return -[ATXUserNotificationGroup runCachedCheckOnNotificationsWithIvar:block:](self, "runCachedCheckOnNotificationsWithIvar:block:", &self->_hasTimeSensitiveNotifications, &__block_literal_global_10_1);
}

BOOL __57__ATXUserNotificationGroup_hasTimeSensitiveNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "urgency") == 1;
}

- (BOOL)hasCommunicationsNotifications
{
  return -[ATXUserNotificationGroup runCachedCheckOnNotificationsWithIvar:block:](self, "runCachedCheckOnNotificationsWithIvar:block:", &self->_hasCommunicationsNotifications, &__block_literal_global_11_1);
}

uint64_t __58__ATXUserNotificationGroup_hasCommunicationsNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMessage");
}

- (BOOL)qualifiesForHighEngagement
{
  return 0;
}

- (double)latestNotificationTimestamp
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_notifications;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "timestamp", (_QWORD)v10);
        if (v8 >= v6)
          v6 = v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  int v9;
  int64_t v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  v5 = -[ATXUserNotificationGroup hasCriticalNotifications](self, "hasCriticalNotifications");
  if (v5 != objc_msgSend(v4, "hasCriticalNotifications"))
  {
    v6 = -[ATXUserNotificationGroup hasCriticalNotifications](self, "hasCriticalNotifications");
    goto LABEL_9;
  }
  v7 = -[ATXUserNotificationGroup hasTimeSensitiveNotifications](self, "hasTimeSensitiveNotifications");
  if (v7 != objc_msgSend(v4, "hasTimeSensitiveNotifications"))
  {
    v6 = -[ATXUserNotificationGroup hasTimeSensitiveNotifications](self, "hasTimeSensitiveNotifications");
    goto LABEL_9;
  }
  v8 = -[ATXUserNotificationGroup hasCommunicationsNotifications](self, "hasCommunicationsNotifications");
  if (v8 != objc_msgSend(v4, "hasCommunicationsNotifications"))
  {
    v6 = -[ATXUserNotificationGroup hasCommunicationsNotifications](self, "hasCommunicationsNotifications");
    goto LABEL_9;
  }
  v9 = -[ATXUserNotificationGroup qualifiesForHighEngagement](self, "qualifiesForHighEngagement");
  if (v9 != objc_msgSend(v4, "qualifiesForHighEngagement"))
  {
    v6 = -[ATXUserNotificationGroup qualifiesForHighEngagement](self, "qualifiesForHighEngagement");
LABEL_9:
    if (v6)
      v10 = 1;
    else
      v10 = -1;
    goto LABEL_12;
  }
  -[ATXUserNotificationGroup latestNotificationTimestamp](self, "latestNotificationTimestamp");
  v13 = v12;
  objc_msgSend(v4, "latestNotificationTimestamp");
  if (v13 == v14)
  {
    v10 = 0;
  }
  else
  {
    -[ATXUserNotificationGroup latestNotificationTimestamp](self, "latestNotificationTimestamp");
    v16 = v15;
    objc_msgSend(v4, "latestNotificationTimestamp");
    if (v16 > v17)
      v10 = 1;
    else
      v10 = -1;
  }
LABEL_12:

  return v10;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
}

@end
