@implementation ATXModeMetadataConstants

- (ATXModeMetadataConstants)init
{
  ATXModeMetadataConstants *v2;
  uint64_t v3;
  ATXModeEntityTrialClientWrapper *modeEntityTrialClientWrapper;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *appCategoryScores_V2;
  uint64_t v10;
  NSDictionary *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appCategoryScores_V1;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *parameters;
  NSDictionary *defaultAppGenreModeAffinities;
  NSDictionary *defaultAppGenreModeAffinities_v2;
  uint8_t v22[8];
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)ATXModeMetadataConstants;
  v2 = -[ATXModeMetadataConstants init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8F60], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;

    -[ATXModeEntityTrialClientWrapper modeAffinityAppCategoryScores](v2->_modeEntityTrialClientWrapper, "modeAffinityAppCategoryScores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      __atxlog_handle_modes();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeMetadataConstants: Loaded mode affinity app category scores from Trial", v22, 2u);
      }

      -[ATXModeEntityTrialClientWrapper modeAffinityAppCategoryScores](v2->_modeEntityTrialClientWrapper, "modeAffinityAppCategoryScores");
      v8 = objc_claimAutoreleasedReturnValue();
      appCategoryScores_V2 = v2->_appCategoryScores_V2;
      v2->_appCategoryScores_V2 = (NSDictionary *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF8CF0], "rawDictionaryForResource:ofType:", CFSTR("ATXAppCategoryScoresV2"), CFSTR("plist"));
      appCategoryScores_V2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(appCategoryScores_V2, "objectForKeyedSubscript:", CFSTR("Modes"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v2->_appCategoryScores_V2;
      v2->_appCategoryScores_V2 = (NSDictionary *)v10;

    }
    objc_msgSend(MEMORY[0x1E0CF8CF0], "rawDictionaryForResource:ofType:", CFSTR("ATXAppCategoryScoresV1"), CFSTR("plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Modes"));
    v13 = objc_claimAutoreleasedReturnValue();
    appCategoryScores_V1 = v2->_appCategoryScores_V1;
    v2->_appCategoryScores_V1 = (NSDictionary *)v13;

    v24[0] = CFSTR("DefaultAppGenreModeAffinities");
    -[ATXModeMetadataConstants getCategoryScoresV1](v2, "getCategoryScoresV1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("DefaultAppGenreModeAffinities_v2");
    v25[0] = v15;
    -[ATXModeMetadataConstants getCategoryScoresV2](v2, "getCategoryScoresV2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = objc_claimAutoreleasedReturnValue();
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v17;

    defaultAppGenreModeAffinities = v2->_defaultAppGenreModeAffinities;
    v2->_defaultAppGenreModeAffinities = 0;

    defaultAppGenreModeAffinities_v2 = v2->_defaultAppGenreModeAffinities_v2;
    v2->_defaultAppGenreModeAffinities_v2 = 0;

  }
  return v2;
}

- (id)getCategoryScoresV2
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  ATXModeMetadataConstants *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self;
  obj = self->_appCategoryScores_V2;
  v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      v5 = v3;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v21 = v4;
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[NSDictionary objectForKeyedSubscript:](v22->_appCategoryScores_V2, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
              -[NSDictionary objectForKeyedSubscript:](v22->_appCategoryScores_V2, "objectForKeyedSubscript:", v6);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0CF8C98], "appDirectoryCategoryStringToAppDirectoryCategoryID:", v12));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v14, v15);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }

        objc_msgSend(v19, "setObject:forKey:", v5, v6);
        v3 = (void *)objc_opt_new();

        v4 = v21 + 1;
        v5 = v3;
      }
      while (v21 + 1 != v20);
      v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  return v19;
}

- (id)getCategoryScoresV1
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  ATXModeMetadataConstants *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self;
  obj = self->_appCategoryScores_V1;
  v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      v5 = v3;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v21 = v4;
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[NSDictionary objectForKeyedSubscript:](v22->_appCategoryScores_V1, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
              -[NSDictionary objectForKeyedSubscript:](v22->_appCategoryScores_V1, "objectForKeyedSubscript:", v6);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0CF8C98], "appDirectoryCategoryStringToAppDirectoryCategoryID:", v12));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v14, v15);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }

        objc_msgSend(v19, "setObject:forKey:", v5, v6);
        v3 = (void *)objc_opt_new();

        v4 = v21 + 1;
        v5 = v3;
      }
      while (v21 + 1 != v20);
      v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  return v19;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken7 != -1)
    dispatch_once(&sharedInstance__pasOnceToken7, &__block_literal_global_102);
  return (id)sharedInstance__pasExprOnceResult_20;
}

void __42__ATXModeMetadataConstants_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_20;
  sharedInstance__pasExprOnceResult_20 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)defaultAppGenreModeAffinities
{
  NSDictionary *defaultAppGenreModeAffinities;

  defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
  if (!defaultAppGenreModeAffinities)
  {
    -[ATXModeMetadataConstants _populateDefaultAppGenreModeAffinities](self, "_populateDefaultAppGenreModeAffinities");
    defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
  }
  return defaultAppGenreModeAffinities;
}

- (void)_populateDefaultAppGenreModeAffinities
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *defaultAppGenreModeAffinities;
  NSDictionary *v6;
  uint64_t v7;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("DefaultAppGenreModeAffinities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("DefaultAppGenreModeAffinities"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[ATXModeMetadataConstants _invertDictionary:](self, "_invertDictionary:", v7);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    defaultAppGenreModeAffinities = self->_defaultAppGenreModeAffinities;
    self->_defaultAppGenreModeAffinities = v4;

    v6 = (NSDictionary *)v7;
  }
  else
  {
    v6 = self->_defaultAppGenreModeAffinities;
    self->_defaultAppGenreModeAffinities = (NSDictionary *)MEMORY[0x1E0C9AA70];
  }

}

- (id)defaultAppGenreModeAffinities_v2
{
  NSDictionary *defaultAppGenreModeAffinities_v2;

  defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
  if (!defaultAppGenreModeAffinities_v2)
  {
    -[ATXModeMetadataConstants _populateDefaultAppGenreModeAffinities_v2](self, "_populateDefaultAppGenreModeAffinities_v2");
    defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
  }
  return defaultAppGenreModeAffinities_v2;
}

- (void)_populateDefaultAppGenreModeAffinities_v2
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *defaultAppGenreModeAffinities_v2;
  NSDictionary *v6;
  uint64_t v7;

  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("DefaultAppGenreModeAffinities_v2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("DefaultAppGenreModeAffinities_v2"));
    v7 = objc_claimAutoreleasedReturnValue();
    -[ATXModeMetadataConstants _invertDictionary:](self, "_invertDictionary:", v7);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    defaultAppGenreModeAffinities_v2 = self->_defaultAppGenreModeAffinities_v2;
    self->_defaultAppGenreModeAffinities_v2 = v4;

    v6 = (NSDictionary *)v7;
  }
  else
  {
    v6 = self->_defaultAppGenreModeAffinities_v2;
    self->_defaultAppGenreModeAffinities_v2 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  }

}

- (id)_invertDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v5);
        v22 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v6);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v5, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                v15 = (void *)objc_opt_new();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

              }
              objc_msgSend(v5, "objectForKeyedSubscript:", v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v13);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v7);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v10);
        }

        v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppGenreModeAffinities_v2, 0);
  objc_storeStrong((id *)&self->_defaultAppGenreModeAffinities, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_appCategoryScores_V2, 0);
  objc_storeStrong((id *)&self->_appCategoryScores_V1, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
}

@end
