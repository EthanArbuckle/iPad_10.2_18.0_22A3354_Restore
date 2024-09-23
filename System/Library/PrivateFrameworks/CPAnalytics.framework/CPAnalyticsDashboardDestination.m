@implementation CPAnalyticsDashboardDestination

- (CPAnalyticsDashboardDestination)init
{
  abort();
}

- (CPAnalyticsDashboardDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsDashboardDestination *v6;
  CPAnalyticsDashboardDestination *v7;
  objc_super v9;

  v5 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CPAnalyticsDashboardDestination;
  v6 = -[CPAnalyticsDashboardDestination init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_cpAnalyticsInstance, v5);

  return v7;
}

- (void)processEvent:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (NSArray)allStandardProperties
{
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("cpa_common_hourOfDay");
  v3[1] = CFSTR("cpa_common_dayOfWeek");
  v3[2] = CFSTR("cpa_common_deviceFreeSpace");
  v3[3] = CFSTR("cpa_common_deviceModel");
  v3[4] = CFSTR("cpa_common_osVersion");
  v3[5] = CFSTR("cpa_common_librarySizeRange");
  v3[6] = CFSTR("cpa_common_processName");
  v3[7] = CFSTR("cpa_common_lowPowerModeEnabled");
  v3[8] = CFSTR("cpa_common_icpl_enabled");
  v3[9] = CFSTR("cpa_common_icpl_exceedingQuota");
  v3[10] = CFSTR("cpa_common_icpl_lowDiskSpace");
  v3[11] = CFSTR("cpa_common_icpl_veryLowDiskSpace");
  v3[12] = CFSTR("cpa_common_icpl_hasChangesToProcess");
  v3[13] = CFSTR("cpa_common_sharedLibraryEnabled");
  v3[14] = CFSTR("cpa_demographic_userGender");
  v3[15] = CFSTR("cpa_demographic_userAgeRange");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 16);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allMediaProperties
{
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("cpa_media_adjusted");
  v3[1] = CFSTR("cpa_media_cameraType");
  v3[2] = CFSTR("cpa_media_favorite");
  v3[3] = CFSTR("cpa_media_importSource");
  v3[4] = CFSTR("cpa_media_type");
  v3[5] = CFSTR("cpa_media_subType");
  v3[6] = CFSTR("cpa_media_age");
  v3[7] = CFSTR("cpa_media_count");
  v3[8] = CFSTR("cpa_media_duration");
  v3[9] = CFSTR("cpa_media_orientation");
  v3[10] = CFSTR("cpa_media_sceneType");
  v3[11] = CFSTR("cpa_media_subject");
  v3[12] = CFSTR("cpa_media_libraryType");
  v3[13] = CFSTR("cpa_media_syndicationState");
  v3[14] = CFSTR("cpa_media_hasSyndicationIdentifier");
  v3[15] = CFSTR("cpa_media_sharedLibraryScope");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 16);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)allErrorProperties
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("cpa_error_domain");
  v3[1] = CFSTR("cpa_error_code");
  v3[2] = CFSTR("cpa_error_codeAsString");
  v3[3] = CFSTR("cpa_error_description");
  v3[4] = CFSTR("cpa_error_indepthErrors");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isMediaEvent:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "propertyForKey:", CFSTR("cpa_media_localIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:(id)a3 fromSourceEvent:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CPAnalyticsDashboardDestination allStandardProperties](self, "allStandardProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsDashboardDestination buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:](self, "buildCoreAnalyticsEventPayloadWithProperties:fromSourceEvent:intoTargetEventPayload:", v11, v9, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:withPayload:shouldSanitize:](CPAnalyticsCoreAnalyticsHelper, "sendCoreAnalyticsEvent:withPayload:shouldSanitize:", v10, v12, 0);
}

- (id)buildCoreAnalyticsEventPayloadWithProperties:(id)a3 fromSourceEvent:(id)a4 intoTargetEventPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v9);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v16, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v8, "propertyForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
    v19 = v10;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

- (void)reportMalformedEvent:(id)a3 malformationDescriptionWithFormat:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v18);

  CPAnalyticsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(v5, "copyRawPayload");
    *(_DWORD *)buf = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_20AB22000, v9, OS_LOG_TYPE_ERROR, "Malformed event %@ with payload %@: %@", buf, 0x20u);

  }
}

- (CPAnalytics)cpAnalyticsInstance
{
  return (CPAnalytics *)objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cpAnalyticsInstance);
}

@end
