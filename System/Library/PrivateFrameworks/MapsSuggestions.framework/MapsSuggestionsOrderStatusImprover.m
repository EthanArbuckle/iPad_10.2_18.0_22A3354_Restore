@implementation MapsSuggestionsOrderStatusImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MapsSuggestionsOrderStatusImprover *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  MapsSuggestionsOrderStatusImprover *v16;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  int v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v29 = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusImprover.m";
      v31 = 1024;
      v32 = 55;
      v33 = 2082;
      v34 = "-[MapsSuggestionsOrderStatusImprover improveEntry:]";
      v35 = 2082;
      v36 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v29, 0x26u);
    }

    goto LABEL_14;
  }
  if (objc_msgSend(v4, "type") != 23)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v7 = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLocalizedOrderPickupTitle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsKey:", CFSTR("MapsSuggestionsOrderPickupMerchant")))
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsOrderPickupMerchant"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsOrderPickupMerchant"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsLocalizedOrderPickupFromMerchantTitle(v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
  }
  v12 = v5;
  v13 = v12;
  if (!self)
    goto LABEL_21;
  if (objc_msgSend(v12, "containsKey:", CFSTR("MapsSuggestionsOrderPickupStartDate")))
  {
    objc_msgSend(v13, "dateForKey:", CFSTR("MapsSuggestionsOrderPickupStartDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && MapsSuggestionsIsInTheFuture(v14))
    {
      MapsSuggestionsLocalizedOrderPickupReadyAt(v15);
      v16 = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      self = v16;

      goto LABEL_21;
    }

  }
  objc_msgSend(v13, "expires");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v13, "expires");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MapsSuggestionsSecondsTo(v21);
    GEOConfigGetDouble();
    v24 = v23;

    if (v22 <= v24)
    {
      objc_msgSend(v13, "expires");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MapsSuggestionsLocalizedOrderPickupReadyUntil(v15);
      v16 = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  MapsSuggestionsLocalizedOrderPickupReady();
  self = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  MapsSuggestionsLocalizedHideInMapsString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setString:forKey:", v25, CFSTR("MapsSuggestionsRemovalBehaviorStringForHide"));

  MapsSuggestionsLocalizedForgetMyVisitsString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setString:forKey:", v26, CFSTR("MapsSuggestionsRemovalBehaviorStringForForget"));

  objc_msgSend(v13, "setUndecoratedTitle:", v8);
  v27 = v8 == v6 && self == v7;
  v18 = !v27;
  if (!v27)
  {
    objc_msgSend(v13, "setTitle:", v8);
    objc_msgSend(v13, "setSubtitle:", self);
  }

LABEL_30:
  return v18;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
