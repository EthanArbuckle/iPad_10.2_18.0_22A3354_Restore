@implementation ATXContextActionIdentifier(Topic)

- (id)initWithTopic:()Topic sectionBundleIdentifier:
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  NSObject *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && -[NSObject length](v7, "length"))
  {
    v9 = (void *)objc_opt_new();
    if (+[ATXSpotlightContextAdapter isSpotlightRecentSectionIdentifier:](ATXSpotlightContextAdapter, "isSpotlightRecentSectionIdentifier:", v8))
    {
      __atxlog_handle_blending();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412546;
        v19 = v8;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier: skipping recent topic: %@, %@", (uint8_t *)&v18, 0x16u);
      }
      v11 = 0;
    }
    else
    {
      objc_msgSend(v9, "contextCodeIdentifierWithSectionBundleIdentifier:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      +[ATXSpotlightAction spotlightActionTypeFromTopic:](ATXSpotlightAction, "spotlightActionTypeFromTopic:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend((id)objc_opt_class(), "actionTypeFromSpotlightActionType:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        +[ATXSpotlightAction actionIdentifierFromTopic:](ATXSpotlightAction, "actionIdentifierFromTopic:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "hash");
        if (-[NSObject length](v10, "length")
          && objc_msgSend(v12, "length")
          && -[NSObject length](v13, "length")
          && v15)
        {
          a1 = (id)objc_msgSend(a1, "initWithContext:subType:instanceIdentifierInteger:", v10, v13, v15);
          v11 = a1;
        }
        else
        {
          __atxlog_handle_blending();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v18 = 138413058;
            v19 = v10;
            v20 = 2112;
            v21 = v12;
            v22 = 2112;
            v23 = v13;
            v24 = 2112;
            v25 = v14;
            _os_log_debug_impl(&dword_1A49EF000, v16, OS_LOG_TYPE_DEBUG, "ATXContextActionIdentifier: expected component missing: %@, %@, %@, %@", (uint8_t *)&v18, 0x2Au);
          }

          v11 = 0;
        }

      }
      else
      {
        __atxlog_handle_blending();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[ATXContextActionIdentifier(Topic) initWithTopic:sectionBundleIdentifier:].cold.1((uint64_t)v8, (uint64_t)v6, v13);
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)initWithTopic:()Topic sectionBundleIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: spotlightActionType is nil: %@, %@", (uint8_t *)&v3, 0x16u);
}

@end
