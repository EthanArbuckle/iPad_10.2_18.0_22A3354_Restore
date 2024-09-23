@implementation ATXMissedNotificationRanking(EngagementTracking)

- (void)populateEngagementFromSource:()EngagementTracking
{
  void *v4;
  void *v5;
  ATXNotificationResolutionDictionarySource *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;

  v22 = a3;
  objc_msgSend(a1, "allNotificationIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resolutionsForNotifications:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXNotificationResolutionDictionarySource initWithResolutionDictionary:]([ATXNotificationResolutionDictionarySource alloc], "initWithResolutionDictionary:", v5);
  v7 = (void *)objc_opt_new();
  objc_msgSend(a1, "setDigestEngagementTrackingMetrics:", v7);

  objc_msgSend(a1, "rankedGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(a1, "rankedGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "isCommunicationGroup"))
        v13 = CFSTR("messageGroups");
      else
        v13 = CFSTR("rankedGroups");
      v14 = v13;
      objc_msgSend(a1, "rankedGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(a1, "digestTimeline");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "populateEngagementFromSource:sectionIdentifier:sectionPosition:sectionSize:digestTimeline:", v6, v14, v10, v16, v17);

      objc_msgSend(a1, "digestEngagementTrackingMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "digestEngagementTrackingMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addMetricsFromOtherTracker:", v19);

      ++v10;
      objc_msgSend(a1, "rankedGroups");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v10 < v21);
  }

}

@end
