@implementation MapsSuggestionsVirtualGarageImprover

- (BOOL)improveEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  char v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsVirtualGarageImprover.m";
      v22 = 1024;
      v23 = 23;
      v24 = 2082;
      v25 = "-[MapsSuggestionsVirtualGarageImprover improveEntry:]";
      v26 = 2082;
      v27 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v20, 0x26u);
    }

    goto LABEL_15;
  }
  if (objc_msgSend(v4, "type") != 20)
  {
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  MapsSuggestionsLocalizedSubtitleForVehicleSetup();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("MapsSuggestionsVehicleSetupManufacturerKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsLocalizedTitleFormatForVehicleSetup(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || !objc_msgSend(v7, "length"))
  {
    MapsSuggestionsLocalizedBackupTitleFormatForVehicleSetup();
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v5);
  v11 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v6, v5);
  objc_msgSend(v5, "weight");
  v13 = v12;
  GEOConfigGetDouble();
  v15 = v14;
  if (v13 != v14)
    objc_msgSend(v5, "setWeight:", 0.85);
  if (v13 == v15)
    v16 = v11;
  else
    v16 = 1;
  v17 = v10 | v16;

LABEL_16:
  return v17;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
