@implementation ATXTimelineAbuseControlConfig

- (ATXTimelineAbuseControlConfig)init
{
  ATXTimelineAbuseControlConfig *v2;
  uint64_t v3;
  NSDictionary *config;
  NSDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  ATXTimelineRelevancePersonalizedConfig *personalizedConfig;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)ATXTimelineAbuseControlConfig;
  v2 = -[ATXTimelineAbuseControlConfig init](&v70, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    config = v2->_config;
    v2->_config = (NSDictionary *)v3;

    v5 = v2->_config;
    if (v5)
    {
      -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("DenyList"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = (void *)MEMORY[0x1E0C9AA60];
      if (v6)
        v9 = (void *)v6;
      else
        v9 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)&v2->_denyList, v9);

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("WidgetsExcludedFromPersonalizedQuotaUpdate"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v8;
      objc_storeStrong((id *)&v2->_widgetsExcludedFromPersonalizedQuotaUpdate, v12);

      -[NSDictionary objectForKey:](v2->_config, "objectForKey:", CFSTR("abGroup"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (__CFString *)v13;
      else
        v15 = CFSTR("default");
      objc_storeStrong((id *)&v2->_timelineRelevanceABGroup, v15);

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("MinimumSecondsBetweenMetadataUpdatesPerSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");
      v18 = 60;
      if (v17)
        v18 = v17;
      v2->_minimumSecondsBetweenMetadataUpdatesPerSource = v18;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("TimelineUpdateLimitPerSource"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
      v21 = 100;
      if (v20)
        v21 = v20;
      v2->_timelineUpdateLimitPerSource = v21;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("TimelineUpdateLimitPerAppBundleId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");
      v24 = 300;
      if (v23)
        v24 = v23;
      v2->_timelineUpdateLimitPerAppBundleId = v24;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("DefaultDurationForTimelineSuggestions"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");
      v27 = 3600;
      if (v26)
        v27 = v26;
      v2->_defaultDurationForTimelineSuggestions = v27;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("DefaultDurationForFallbackTimelineSuggestions"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "unsignedIntegerValue");
      v30 = 86400;
      if (v29)
        v30 = v29;
      v2->_defaultDurationForFallbackTimelineSuggestions = v30;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("SoftRotationQuota"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "integerValue");
      if (v32 <= 1)
        v33 = 1;
      else
        v33 = v32;
      v2->_defaultSoftRotationQuota = v33;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("HardRotationQuota"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "integerValue");
      if (v35)
        v36 = v35;
      else
        v36 = 2;
      v2->_defaultHardRotationQuota = v36;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("SoftRotationQuotaForSingleScoreSchemas"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "integerValue");
      if (v38 <= 1)
        v39 = 1;
      else
        v39 = v38;
      v2->_defaultSoftRotationQuotaForSingleScoreSchemas = v39;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("HardRotationQuotaForSingleScoreSchemas"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "integerValue");
      if (v41)
        v42 = v41;
      else
        v42 = 2;
      v2->_defaultHardRotationQuotaForSingleScoreSchemas = v42;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("SoftRotationQuotaForLikelyDiverseSchemas"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "integerValue");
      v45 = 3;
      if (v44)
        v45 = v44;
      v2->_defaultSoftRotationQuotaForLikelyDiverseSchemas = v45;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("HardRotationQuotaForLikelyDiverseSchemas"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "integerValue");
      v48 = 4;
      if (v47)
        v48 = v47;
      v2->_defaultHardRotationQuotaForLikelyDiverseSchemas = v48;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("SoftRotationQuotaForDiverseSchemas"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "integerValue");
      v51 = 5;
      if (v50)
        v51 = v50;
      v2->_defaultSoftRotationQuotaForDiverseSchemas = v51;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("HardRotationQuotaForDiverseSchemas"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "integerValue");
      v54 = 6;
      if (v53)
        v54 = v53;
      v2->_defaultHardRotationQuotaForDiverseSchemas = v54;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("Duration"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "integerValue");
      if (v56)
        v57 = v56;
      else
        v57 = 900;
      v2->_defaultDurationLimit = v57;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("DurationLimitForSingleScoreSchemas"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "integerValue");
      if (v59)
        v60 = v59;
      else
        v60 = 900;
      v2->_defaultDurationLimitForSingleScoreSchemas = v60;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("DurationLimitForLikelyDiverseSchemas"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "integerValue");
      if (v62)
        v63 = v62;
      else
        v63 = 1800;
      v2->_defaultDurationLimitForLikelyDiverseSchemas = v63;

      -[NSDictionary objectForKeyedSubscript:](v2->_config, "objectForKeyedSubscript:", CFSTR("DurationLimitForDiverseSchemas"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "integerValue");
      if (v65)
        v66 = v65;
      else
        v66 = 1800;
      v2->_defaultDurationLimitForDiverseSchemas = v66;

      v67 = objc_opt_new();
      personalizedConfig = v2->_personalizedConfig;
      v2->_personalizedConfig = (ATXTimelineRelevancePersonalizedConfig *)v67;

    }
  }
  return v2;
}

- (int64_t)softRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return -[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("SoftRotationQuota"), a3, a4);
}

- (int64_t)hardRotationQuotaForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return -[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("HardRotationQuota"), a3, a4);
}

- (double)durationLimitForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return (double)-[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("Duration"), a3, a4);
}

- (double)coolDownIntervalForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return (double)-[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("CoolDown"), a3, a4);
}

- (BOOL)randomizationDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return -[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("RandomizationDisabled"), a3, a4) != 0;
}

- (BOOL)stalenessDisabledForWidgetWithIdentifier:(id)a3 kind:(id)a4
{
  return -[ATXTimelineAbuseControlConfig resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:](self, "resolvedValueForConfigWithKey:forWidgetWithIdentifier:kind:", CFSTR("StalenessDisabled"), a3, a4) != 0;
}

- (BOOL)shouldUsePersonalizedBudgets
{
  return -[NSString isEqualToString:](self->_timelineRelevanceABGroup, "isEqualToString:", CFSTR("default"));
}

- (int64_t)resolvedValueForConfigWithKey:(id)a3 forWidgetWithIdentifier:(id)a4 kind:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  void *v14;
  void *config;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ATXTimelineRelevancePersonalizedConfig personalizedValueForParameter:forWidgetBundleIdentifier:kind:](self->_personalizedConfig, "personalizedValueForParameter:forWidgetBundleIdentifier:kind:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ATXTimelineAbuseControlConfig shouldUsePersonalizedBudgets](self, "shouldUsePersonalizedBudgets") && v11)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = 138413058;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Using personalized %@ for widgetBundleId: %@, widgetKind: %@: %@", (uint8_t *)&v19, 0x2Au);
    }

    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v10);
    config = (void *)objc_claimAutoreleasedReturnValue();
    v16 = config;
    if (!config)
    {
      if (v14)
        config = v14;
      else
        config = self->_config;
    }
    objc_msgSend(config, "objectForKeyedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v17, "integerValue");

  }
  return v13;
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (unint64_t)minimumSecondsBetweenMetadataUpdatesPerSource
{
  return self->_minimumSecondsBetweenMetadataUpdatesPerSource;
}

- (unint64_t)timelineUpdateLimitPerSource
{
  return self->_timelineUpdateLimitPerSource;
}

- (unint64_t)timelineUpdateLimitPerAppBundleId
{
  return self->_timelineUpdateLimitPerAppBundleId;
}

- (unint64_t)defaultDurationForTimelineSuggestions
{
  return self->_defaultDurationForTimelineSuggestions;
}

- (unint64_t)defaultDurationForFallbackTimelineSuggestions
{
  return self->_defaultDurationForFallbackTimelineSuggestions;
}

- (int64_t)defaultSoftRotationQuota
{
  return self->_defaultSoftRotationQuota;
}

- (int64_t)defaultHardRotationQuota
{
  return self->_defaultHardRotationQuota;
}

- (int64_t)defaultSoftRotationQuotaForSingleScoreSchemas
{
  return self->_defaultSoftRotationQuotaForSingleScoreSchemas;
}

- (int64_t)defaultHardRotationQuotaForSingleScoreSchemas
{
  return self->_defaultHardRotationQuotaForSingleScoreSchemas;
}

- (int64_t)defaultSoftRotationQuotaForLikelyDiverseSchemas
{
  return self->_defaultSoftRotationQuotaForLikelyDiverseSchemas;
}

- (int64_t)defaultHardRotationQuotaForLikelyDiverseSchemas
{
  return self->_defaultHardRotationQuotaForLikelyDiverseSchemas;
}

- (int64_t)defaultSoftRotationQuotaForDiverseSchemas
{
  return self->_defaultSoftRotationQuotaForDiverseSchemas;
}

- (void)setDefaultSoftRotationQuotaForDiverseSchemas:(int64_t)a3
{
  self->_defaultSoftRotationQuotaForDiverseSchemas = a3;
}

- (int64_t)defaultHardRotationQuotaForDiverseSchemas
{
  return self->_defaultHardRotationQuotaForDiverseSchemas;
}

- (void)setDefaultHardRotationQuotaForDiverseSchemas:(int64_t)a3
{
  self->_defaultHardRotationQuotaForDiverseSchemas = a3;
}

- (int64_t)defaultDurationLimit
{
  return self->_defaultDurationLimit;
}

- (int64_t)defaultDurationLimitForSingleScoreSchemas
{
  return self->_defaultDurationLimitForSingleScoreSchemas;
}

- (int64_t)defaultDurationLimitForLikelyDiverseSchemas
{
  return self->_defaultDurationLimitForLikelyDiverseSchemas;
}

- (int64_t)defaultDurationLimitForDiverseSchemas
{
  return self->_defaultDurationLimitForDiverseSchemas;
}

- (NSArray)widgetsExcludedFromPersonalizedQuotaUpdate
{
  return self->_widgetsExcludedFromPersonalizedQuotaUpdate;
}

- (void)setWidgetsExcludedFromPersonalizedQuotaUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_widgetsExcludedFromPersonalizedQuotaUpdate, a3);
}

- (NSString)timelineRelevanceABGroup
{
  return self->_timelineRelevanceABGroup;
}

- (void)setTimelineRelevanceABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_timelineRelevanceABGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyList, 0);
  objc_storeStrong((id *)&self->_personalizedConfig, 0);
  objc_storeStrong((id *)&self->_widgetsExcludedFromPersonalizedQuotaUpdate, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceABGroup, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
