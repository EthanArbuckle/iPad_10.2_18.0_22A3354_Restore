@implementation ATXUserNotificationDigest(EngagementTracking)

- (uint64_t)computeNumDigestExpansions
{
  NSObject *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t v18[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int128 buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Computing digest expansions for: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x2020000000;
  v24 = 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "publisherFromStartTime:", v5 + -604800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke;
  v17[3] = &unk_1E82DF748;
  v17[4] = a1;
  objc_msgSend(v6, "filterWithIsIncluded:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = 3221225472;
  v16[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_19;
  v16[3] = &unk_1E82DCE78;
  v16[4] = a1;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_21;
  v15[3] = &unk_1E82DBE68;
  v15[4] = &buf;
  v16[0] = v7;
  v9 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v16, v15);

  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    *(_DWORD *)v18 = 138543618;
    v19 = v11;
    v20 = 2048;
    v21 = v12;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "Computed digest expansions for: %{public}@: %ld", v18, 0x16u);

  }
  v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v13;
}

- (void)populateEngagementFromSource:()EngagementTracking
{
  void *v4;
  void *v5;
  ATXNotificationResolutionDictionarySource *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;

  v46 = a3;
  objc_msgSend(a1, "allNotificationIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "resolutionsForNotifications:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXNotificationResolutionDictionarySource initWithResolutionDictionary:]([ATXNotificationResolutionDictionarySource alloc], "initWithResolutionDictionary:", v5);
  v7 = (void *)objc_opt_new();
  objc_msgSend(a1, "setDigestEngagementTrackingMetrics:", v7);

  v8 = objc_msgSend(a1, "computeNumDigestExpansions");
  objc_msgSend(a1, "digestEngagementTrackingMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumDigestExpansions:", v8);

  objc_msgSend(a1, "messageGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(a1, "messageGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "messageGroups");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(a1, "digestTimeline");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "populateEngagementFromSource:sectionIdentifier:sectionPosition:sectionSize:digestTimeline:", v6, CFSTR("messageGroups"), v12, v16, v17);

      objc_msgSend(a1, "digestEngagementTrackingMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "digestEngagementTrackingMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addMetricsFromOtherTracker:", v19);

      ++v12;
      objc_msgSend(a1, "messageGroups");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v12 < v21);
  }
  objc_msgSend(a1, "highlightedGroups");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = 0;
    do
    {
      objc_msgSend(a1, "highlightedGroups");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "highlightedGroups");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      objc_msgSend(a1, "digestTimeline");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "populateEngagementFromSource:sectionIdentifier:sectionPosition:sectionSize:digestTimeline:", v6, CFSTR("highlightedGroups"), v24, v28, v29);

      objc_msgSend(a1, "digestEngagementTrackingMetrics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "digestEngagementTrackingMetrics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addMetricsFromOtherTracker:", v31);

      ++v24;
      objc_msgSend(a1, "highlightedGroups");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

    }
    while (v24 < v33);
  }
  objc_msgSend(a1, "rankedGroups");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = 0;
    do
    {
      objc_msgSend(a1, "rankedGroups");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "rankedGroups");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");
      objc_msgSend(a1, "digestTimeline");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "populateEngagementFromSource:sectionIdentifier:sectionPosition:sectionSize:digestTimeline:", v6, CFSTR("otherGroups"), v36, v40, v41);

      objc_msgSend(a1, "digestEngagementTrackingMetrics");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "digestEngagementTrackingMetrics");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addMetricsFromOtherTracker:", v43);

      ++v36;
      objc_msgSend(a1, "rankedGroups");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

    }
    while (v36 < v45);
  }

}

@end
