@implementation ATXWidgetDwellTracker

- (void)widgetDidDisappear:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *widgetUniqueIdToAppearDateMap;
  void *v14;
  double v15;
  NSObject *WeakRetained;
  NSMutableDictionary *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "widgetUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "compactDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widgetUniqueId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[ATXWidgetDwellTracker widgetDidDisappear:date:]";
      v21 = 2112;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "RAS: %s: widget: %@ (widgetID %{public}@)", (uint8_t *)&v19, 0x20u);

    }
    widgetUniqueIdToAppearDateMap = self->_widgetUniqueIdToAppearDateMap;
    objc_msgSend(v6, "widgetUniqueId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](widgetUniqueIdToAppearDateMap, "objectForKeyedSubscript:", v14);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", v10);
      if (v15 <= 3.5)
      {
LABEL_12:
        v17 = self->_widgetUniqueIdToAppearDateMap;
        objc_msgSend(v6, "widgetUniqueId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);

        goto LABEL_13;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject significantDwellDetectedForWidget:date:](WeakRetained, "significantDwellDetectedForWidget:date:", v6, v7);
    }
    else
    {
      __atxlog_handle_home_screen();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_FAULT))
        -[ATXWidgetDwellTracker widgetDidDisappear:date:].cold.2(v6);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[ATXWidgetDwellTracker widgetDidDisappear:date:].cold.1(v6);
LABEL_13:

}

- (ATXWidgetDwellTracker)init
{
  ATXWidgetDwellTracker *v2;
  uint64_t v3;
  NSMutableDictionary *widgetUniqueIdToAppearDateMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXWidgetDwellTracker;
  v2 = -[ATXWidgetDwellTracker init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    widgetUniqueIdToAppearDateMap = v2->_widgetUniqueIdToAppearDateMap;
    v2->_widgetUniqueIdToAppearDateMap = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)widgetDidAppear:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *widgetUniqueIdToAppearDateMap;
  void *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "widgetUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_home_screen();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "compactDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widgetUniqueId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[ATXWidgetDwellTracker widgetDidAppear:date:]";
      v20 = 2112;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "RAS: %s: widget: %@ (widgetID %{public}@)", (uint8_t *)&v18, 0x20u);

    }
    widgetUniqueIdToAppearDateMap = self->_widgetUniqueIdToAppearDateMap;
    objc_msgSend(v6, "widgetUniqueId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](widgetUniqueIdToAppearDateMap, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      __atxlog_handle_home_screen();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ATXWidgetDwellTracker widgetDidAppear:date:].cold.2(v6);

    }
    v17 = self->_widgetUniqueIdToAppearDateMap;
    objc_msgSend(v6, "widgetUniqueId");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v7, v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    -[ATXWidgetDwellTracker widgetDidAppear:date:].cold.1(v6);
  }

}

- (void)resetAllTracking
{
  -[NSMutableDictionary removeAllObjects](self->_widgetUniqueIdToAppearDateMap, "removeAllObjects");
}

- (ATXWidgetDwellTrackerDelegate)delegate
{
  return (ATXWidgetDwellTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetUniqueIdToAppearDateMap, 0);
}

- (void)widgetDidAppear:(void *)a1 date:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "compactDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "RAS: %s: widget %@ unexpectedly has null unique ID. Dwell tracking will not work for this widget.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)widgetDidAppear:(void *)a1 date:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "widgetUniqueId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "RAS: %s: widget ID %{public}@ seems to have already appeared. Overriding appear date.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)widgetDidDisappear:(void *)a1 date:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "compactDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "RAS: %s: widget %@ unexpectedly has null unique ID. Dwell tracking will not work for this widget.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)widgetDidDisappear:(void *)a1 date:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "widgetUniqueId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "RAS: %s: No appearing date on record for widget ID %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

@end
