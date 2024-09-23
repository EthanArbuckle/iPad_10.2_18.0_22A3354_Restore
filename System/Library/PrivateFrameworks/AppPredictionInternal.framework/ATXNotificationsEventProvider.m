@implementation ATXNotificationsEventProvider

- (ATXNotificationsEventProvider)initWithLastNDays:(unint64_t)a3
{
  ATXNotificationsEventProvider *v4;
  uint64_t v5;
  NSDate *thresholdDateLastNDays;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXNotificationsEventProvider;
  v4 = -[ATXNotificationsEventProvider init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a3));
    v5 = objc_claimAutoreleasedReturnValue();
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;

  }
  return v4;
}

- (void)cacheGlobalNotificationStreamIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXNotificationsEventProvider: Could not fetch notification stream with error: %@", a5, a6, a7, a8, 2u);
}

void __73__ATXNotificationsEventProvider_cacheGlobalNotificationStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __73__ATXNotificationsEventProvider_cacheGlobalNotificationStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "usageType") == 17 || objc_msgSend(v3, "usageType") == 18)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    objc_msgSend(v7, "timestamp");
    if (v4 > *(double *)(a1 + 64))
    {
      v5 = *(_QWORD *)(a1 + 40);
LABEL_5:
      ++*(_DWORD *)(*(_QWORD *)(v5 + 8) + 24);
    }
  }
  else if (objc_msgSend(v3, "usageType") == 4)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v7, "timestamp");
    if (v6 > *(double *)(a1 + 64))
    {
      v5 = *(_QWORD *)(a1 + 56);
      goto LABEL_5;
    }
  }

}

- (void)cacheModeNotificationStreamIfNecessary
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXNotificationsEventProvider: Could not fetch inferred mode stream and notification stream with error: %@", a5, a6, a7, a8, 2u);
}

uint64_t __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v5 = a3;
  objc_msgSend(a2, "timestamp");
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

void __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __71__ATXNotificationsEventProvider_cacheModeNotificationStreamIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  objc_msgSend(v29, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v29, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(v5, "modeType") == 2)
    {
LABEL_3:
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;
      goto LABEL_20;
    }
    objc_msgSend(v6, "modeType");
    BMUserFocusInferredModeTypeToActivity();
    ATXModeFromActivityType();
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v23)
    {
      ATXModeToString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      v26 = objc_msgSend(v6, "isStart");
      if (v25)
      {
        if ((v26 & 1) != 0)
          goto LABEL_21;
        goto LABEL_3;
      }
    }
    else
    {
      v26 = objc_msgSend(v6, "isStart");
    }
    if (!v26)
    {
LABEL_21:

      goto LABEL_22;
    }
    ATXModeToString();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(v29, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "usageType") == 17 || objc_msgSend(v6, "usageType") == 18)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue") + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      objc_msgSend(v29, "timestamp");
      if (v13 > *(double *)(a1 + 72))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      }
    }
    if (objc_msgSend(v6, "usageType") != 4)
      goto LABEL_21;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "intValue") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    objc_msgSend(v29, "timestamp");
    if (v20 <= *(double *)(a1 + 72))
      goto LABEL_21;
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v22, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

    goto LABEL_20;
  }
LABEL_22:

}

- (unint64_t)globalCountOfNotificationsReceivedWithinLastNDays
{
  -[ATXNotificationsEventProvider cacheGlobalNotificationStreamIfNecessary](self, "cacheGlobalNotificationStreamIfNecessary");
  return self->_notificationsReceivedGloballyInLastNDays;
}

- (unint64_t)globalCountOfNotificationsReceivedWithinLast1Day
{
  -[ATXNotificationsEventProvider cacheGlobalNotificationStreamIfNecessary](self, "cacheGlobalNotificationStreamIfNecessary");
  return self->_notificationsReceivedGloballyInLast1Day;
}

- (unint64_t)globalCountOfNotificationsClearedWithinLastNDays
{
  -[ATXNotificationsEventProvider cacheGlobalNotificationStreamIfNecessary](self, "cacheGlobalNotificationStreamIfNecessary");
  return self->_notificationsClearedGloballyInLastNDays;
}

- (unint64_t)globalCountOfNotificationsClearedWithinLast1Day
{
  -[ATXNotificationsEventProvider cacheGlobalNotificationStreamIfNecessary](self, "cacheGlobalNotificationStreamIfNecessary");
  return self->_notificationsClearedGloballyInLast1Day;
}

- (unint64_t)modeCountOfNotificationsReceivedWithinLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXNotificationsEventProvider cacheModeNotificationStreamIfNecessary](self, "cacheModeNotificationStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_notificationsReceivedInModeInLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)modeCountOfNotificationsReceivedWithinLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXNotificationsEventProvider cacheModeNotificationStreamIfNecessary](self, "cacheModeNotificationStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_notificationsReceivedInModeInLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)modeCountOfNotificationsClearedWithinLastNDaysForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXNotificationsEventProvider cacheModeNotificationStreamIfNecessary](self, "cacheModeNotificationStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_notificationsClearedInModeInLastNDays, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (unint64_t)modeCountOfNotificationsClearedWithinLast1DayForMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXNotificationsEventProvider cacheModeNotificationStreamIfNecessary](self, "cacheModeNotificationStreamIfNecessary");
  ATXModeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_notificationsClearedInModeInLast1Day, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsClearedInModeInLast1Day, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInModeInLastNDays, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInModeInLast1Day, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInModeInLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end
