@implementation ATXUserNotification(EngagementTracking)

- (void)populateEngagementFromSource:()EngagementTracking sectionIdentifier:sectionPosition:sectionSize:digestTimeline:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;

  v37 = a7;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(a1, "setDigestEngagementTrackingMetrics:", v14);

  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSectionIdentifier:", v12);

  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSectionPosition:", a5);

  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSectionSize:", a6);

  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolutionsForNotifications:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_msgSend(v23, "numExpansions");
    objc_msgSend(a1, "digestEngagementTrackingMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNumExpansions:", v24);

    if (!objc_msgSend(v23, "resolutionType"))
    {
      objc_msgSend(v37, "digestRemovedTimestamp");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_5;
      v27 = (void *)v26;
      objc_msgSend(v37, "digestRemovedTimestamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "resolutionTimestamp");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "compare:", v29);

      if (v30 == -1)
      {
        objc_msgSend(a1, "digestEngagementTrackingMetrics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNumEngagementsAfterExpiration:", 1);
      }
      else
      {
LABEL_5:
        objc_msgSend(v37, "firstScheduledViewTimestamp");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
          goto LABEL_7;
        v32 = (void *)v31;
        objc_msgSend(v37, "firstScheduledViewTimestamp");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "resolutionTimestamp");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "compare:", v34);

        if (v35 == -1)
        {
          objc_msgSend(a1, "digestEngagementTrackingMetrics");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setNumEngagementsInScheduled:", 1);
        }
        else
        {
LABEL_7:
          objc_msgSend(a1, "digestEngagementTrackingMetrics");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setNumEngagementsInUpcoming:", 1);
        }
      }

    }
  }

}

@end
