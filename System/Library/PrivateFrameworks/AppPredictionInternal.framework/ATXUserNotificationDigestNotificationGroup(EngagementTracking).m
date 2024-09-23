@implementation ATXUserNotificationDigestNotificationGroup(EngagementTracking)

- (void)populateEngagementFromSource:()EngagementTracking sectionIdentifier:sectionPosition:sectionSize:digestTimeline:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v12 = a4;
  v13 = a7;
  v14 = (void *)objc_opt_new();
  objc_msgSend(a1, "setDigestEngagementTrackingMetrics:", v14);

  objc_msgSend(a1, "rankedNotifications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      objc_msgSend(a1, "rankedNotifications");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "rankedNotifications");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "populateEngagementFromSource:sectionIdentifier:sectionPosition:sectionSize:digestTimeline:", v28, v12, v17, objc_msgSend(v20, "count"), v13);

      objc_msgSend(a1, "digestEngagementTrackingMetrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "digestEngagementTrackingMetrics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addMetricsFromOtherTracker:", v22);

      ++v17;
      objc_msgSend(a1, "rankedNotifications");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v17 < v24);
  }
  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSectionIdentifier:", v12);

  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSectionSize:", a6);

  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSectionPosition:", a5);

}

@end
