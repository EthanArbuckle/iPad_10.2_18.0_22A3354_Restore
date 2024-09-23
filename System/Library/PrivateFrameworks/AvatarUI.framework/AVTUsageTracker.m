@implementation AVTUsageTracker

+ (id)currentSession
{
  void *v2;
  void *v3;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "usageTrackingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3
{
  id v4;
  AVTCoreAnalyticsClient *v5;

  v4 = a3;
  v5 = objc_alloc_init(AVTCoreAnalyticsClient);
  objc_msgSend(a1, "trackStickerSentFromHostBundleIdentifier:withCoreAnalyticsClient:", v4, v5);

}

+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3 withCoreAnalyticsClient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[AVTUsageTrackingSession allowListAppNameFromBundleID:](AVTUsageTrackingSession, "allowListAppNameFromBundleID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@StickerSentInApp"), CFSTR("com.apple.Animoji.Analytics.StickersApp."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("appName");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEventForKey:payload:", v7, v8);

}

+ (void)trackCountOfMemojiInStore:(id)a3
{
  id v4;
  AVTCoreAnalyticsClient *v5;

  v4 = a3;
  v5 = objc_alloc_init(AVTCoreAnalyticsClient);
  objc_msgSend(a1, "trackCountOfMemojiInStore:withCoreAnalyticsClient:", v4, v5);

}

+ (void)trackCountOfMemojiInStore:(id)a3 withCoreAnalyticsClient:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D00840];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "requestForCustomAvatars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarsForFetchRequest:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@FeatureAdoption"), CFSTR("com.apple.Memoji.Analytics."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("memojiCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEventForKey:payload:", v11, v13);

}

@end
