@implementation ATXLaunchAndLocationHarvester

+ (void)logAppOrClipLaunch:(id)a3 isNegativeSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  __CFString *v50;
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_hero();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v8 = CFSTR("negative");
    else
      v8 = CFSTR("positive");
    objc_msgSend(v6, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "urlHash");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("NULL URL hash");
    }
    *(_DWORD *)buf = 138412802;
    v46 = v8;
    v47 = 2112;
    v48 = v9;
    v49 = 2112;
    v50 = v11;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, ": Received %@ session to harvest. Bundle Id: %@ URLHash: %@", buf, 0x20u);
    if (v10)

  }
  objc_msgSend(v6, "latitude");
  v12 = *MEMORY[0x1E0D2FC80];
  if (v13 == *MEMORY[0x1E0D2FC80] && (objc_msgSend(v6, "longitude"), v14 == v12))
  {
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "getCurrentLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_14:
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v20 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isClip"))
      {
        +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "appClipShadowLogSamplesPerDay");

        -[NSObject launchAndLocationHarvesterSamplingRate](v20, "launchAndLocationHarvesterSamplingRate");
        v24 = v23;
        objc_msgSend(CFSTR("LaunchAndLocationHavester"), "stringByAppendingString:", CFSTR(".appClip"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "launchReason") == 3 || objc_msgSend(v6, "launchReason") == 2)
        {
          if (v4)
            v26 = CFSTR(".negativeSession");
          else
            v26 = CFSTR(".positiveSession");
          objc_msgSend(v25, "stringByAppendingString:", v26);
          v29 = objc_claimAutoreleasedReturnValue();
LABEL_30:

          v30 = 0;
          v25 = (void *)v29;
LABEL_31:
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v30
            || objc_msgSend(a1, "_passedGeneralFiltersGivenLocation:date:", v19, v31)
            && (objc_msgSend(v6, "bundleId"),
                v32 = (void *)objc_claimAutoreleasedReturnValue(),
                v33 = objc_msgSend(a1, "_passedAppOrClipSpecificFiltersGivenBundleId:date:isClip:counterKey:samplingRate:maxSamples:", v32, v31, objc_msgSend(v6, "isClip"), v25, v22, v24), v32, v33))
          {
            objc_msgSend(v6, "bundleId");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "urlHash");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v44) = v4;
            objc_msgSend(a1, "_awdMetricsObjectWithLocation:date:bundleId:urlHash:isClip:launchReason:isNegativeSession:", v19, v31, v34, v35, objc_msgSend(v6, "isClip"), objc_msgSend(v6, "launchReason"), v44);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(a1, "_postAwdMetrics:", v36);
            +[ATXLaunchAndLocationFilterer incrementOnDeviceDailySamplesWithCounterKey:date:](ATXLaunchAndLocationFilterer, "incrementOnDeviceDailySamplesWithCounterKey:date:", v25, v31);

          }
          goto LABEL_35;
        }
        if (!v4)
        {
          v30 = 1;
          goto LABEL_31;
        }
        __atxlog_handle_hero();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
LABEL_39:
          +[ATXLaunchAndLocationHarvester logAppOrClipLaunch:isNegativeSession:].cold.1(v31, v37, v38, v39, v40, v41, v42, v43);
      }
      else
      {
        objc_msgSend(CFSTR("LaunchAndLocationHavester"), "stringByAppendingString:", CFSTR(".app"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "launchReason") == 3 || objc_msgSend(v6, "launchReason") == 2)
        {
          if (v4)
            v27 = CFSTR(".negativeSession");
          else
            v27 = CFSTR(".positiveSession");
          objc_msgSend(v25, "stringByAppendingString:", v27);
          v29 = objc_claimAutoreleasedReturnValue();
          v24 = 1.0;
          v22 = -1;
          goto LABEL_30;
        }
        if (!v4)
        {
          v30 = 0;
          v24 = 1.0;
          v22 = -1;
          goto LABEL_31;
        }
        __atxlog_handle_hero();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v6, "latitude");
    v17 = v16;
    objc_msgSend(v6, "longitude");
    v19 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v17, v18);
    if (v19)
      goto LABEL_14;
  }
  __atxlog_handle_hero();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, ": Received nil location. Ignoring", buf, 2u);
  }
LABEL_36:

}

+ (BOOL)_passedAppOrClipSpecificFiltersGivenBundleId:(id)a3 date:(id)a4 isClip:(BOOL)a5 counterKey:(id)a6 samplingRate:(double)a7 maxSamples:(unint64_t)a8
{
  return +[ATXLaunchAndLocationFilterer shouldSampleWithCounterKey:date:samplingRate:maxSamples:](ATXLaunchAndLocationFilterer, "shouldSampleWithCounterKey:date:samplingRate:maxSamples:", a6, a4, a8, a7);
}

+ (BOOL)_passedGeneralFiltersGivenLocation:(id)a3 date:(id)a4
{
  return !+[ATXLaunchAndLocationFilterer locationIsStaleOrNotAccurateEnough:now:](ATXLaunchAndLocationFilterer, "locationIsStaleOrNotAccurateEnough:now:", a3, a4);
}

+ (id)_awdMetricsObjectWithLocation:(id)a3 date:(id)a4 bundleId:(id)a5 urlHash:(id)a6 isClip:(BOOL)a7 launchReason:(int)a8 isNegativeSession:(BOOL)a9
{
  _BOOL8 v9;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;

  v9 = a7;
  v13 = (void *)MEMORY[0x1E0C99D48];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "components:fromDate:", 32, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v20, "setBundleId:", v21);
  objc_msgSend(v17, "coordinate");
  *(float *)&v22 = v22;
  objc_msgSend(v20, "setLatitude:", v22);
  objc_msgSend(v17, "coordinate");
  *(float *)&v24 = v23;
  objc_msgSend(v20, "setLongitude:", v24);
  objc_msgSend(v17, "horizontalAccuracy");
  v26 = v25;

  objc_msgSend(v20, "setLocationAccuracy:", v26);
  objc_msgSend(v20, "setTimeBucket:", objc_msgSend(v19, "hour"));
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIsTourist:", objc_msgSend(v27, "isTourist"));

  objc_msgSend(v20, "setUrlHash:", v14);
  objc_msgSend(v20, "setIsClip:", v9);
  objc_msgSend(v20, "setLaunchReason:", a8);
  objc_msgSend(v20, "setIsNegativeSession:", a9);

  return v20;
}

+ (void)_postAwdMetrics:(id)a3
{
  AWDPostMetric();
}

+ (void)logAppOrClipLaunch:(uint64_t)a3 isNegativeSession:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Received negative session from a non-proactive UI", a5, a6, a7, a8, 0);
}

@end
