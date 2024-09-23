@implementation ATXTimelineDonationsPruner

- (void)pruneTimelineRelevanceTableWithXPCActivity:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  _BOOL4 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  uint8_t v19[2];
  __int16 v20;
  __int16 v21;
  uint8_t buf[16];

  v3 = a3;
  __atxlog_handle_timeline();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Pruning timeline donations", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF8EC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "didDefer"))
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v7 = "ATXTimelineDonationsPruner: Asked to defer";
      v8 = (uint8_t *)&v21;
LABEL_20:
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v9 = objc_msgSend(v5, "pruneTimelineEntries");
  __atxlog_handle_timeline();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v11)
      goto LABEL_12;
    v20 = 0;
    v12 = "Sucessfully finished pruning the timeline relevance table";
    v13 = (uint8_t *)&v20;
  }
  else
  {
    if (!v11)
      goto LABEL_12;
    *(_WORD *)v19 = 0;
    v12 = "Unable to finish pruning the timeline relevance table";
    v13 = v19;
  }
  _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
LABEL_12:

  if (objc_msgSend(v3, "didDefer"))
  {
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v7 = "ATXTimelineDonationsPruner: Asked to defer";
      v8 = (uint8_t *)&v18;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = objc_msgSend(v5, "pruneInvalidSuggestions");
    __atxlog_handle_timeline();
    v6 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        v17 = 0;
        v7 = "Sucessfully finished pruning invalid info suggestions";
        v8 = (uint8_t *)&v17;
        goto LABEL_20;
      }
    }
    else if (v15)
    {
      v16 = 0;
      v7 = "Unable to finish pruning invalid info suggestions";
      v8 = (uint8_t *)&v16;
      goto LABEL_20;
    }
  }
LABEL_21:

}

@end
