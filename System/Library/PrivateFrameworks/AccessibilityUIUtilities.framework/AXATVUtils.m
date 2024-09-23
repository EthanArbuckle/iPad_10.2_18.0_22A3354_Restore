@implementation AXATVUtils

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance__Shared;
}

void __28__AXATVUtils_sharedInstance__block_invoke()
{
  AXATVUtils *v0;
  void *v1;

  v0 = objc_alloc_init(AXATVUtils);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (BOOL)isTVMLKitLoaded
{
  BOOL result;

  if (isTVMLKitLoaded_TVMLKitLoaded)
    return 1;
  result = NSClassFromString(CFSTR("TVViewElement")) != 0;
  isTVMLKitLoaded_TVMLKitLoaded = result;
  return result;
}

- (BOOL)isProcessTVAppStore
{
  if (isProcessTVAppStore_onceToken != -1)
    dispatch_once(&isProcessTVAppStore_onceToken, &__block_literal_global_178);
  return isProcessTVAppStore_IsAppStore;
}

void __33__AXATVUtils_isProcessTVAppStore__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isProcessTVAppStore_IsAppStore = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.TVAppStore"));

}

- (id)atvaccessibilityLocalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E76AC698, CFSTR("Accessibility"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)atvaccessibilityLocalizedNameForBundleID:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.HeadBoard")))
  {
    -[AXATVUtils atvaccessibilityLocalizedString:](self, "atvaccessibilityLocalizedString:", CFSTR("name.for.bundle.headboard"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityIdentifierForResourceURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "scheme"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("resource")),
        v5,
        v6))
  {
    objc_msgSend(v4, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)accessibilityLabelForID:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tomato-splat")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("RTRotten")))
  {
    v5 = CFSTR("tv.freshness.rotten");
LABEL_4:
    -[AXATVUtils atvaccessibilityLocalizedString:](self, "atvaccessibilityLocalizedString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[AXATVUtils atvaccessibilityLocalizedString:](self, "atvaccessibilityLocalizedString:", CFSTR("tv.tomato.rating.format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tomato-fresh")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("RTFresh")))
  {
    v5 = CFSTR("tv.freshness.fresh");
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tomato-certified")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("RTCertified")))
  {
    v5 = CFSTR("tv.freshness.certified.fresh");
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("common-sense")) & 1) != 0
    || objc_msgSend(v4, "hasPrefix:", CFSTR("cs_")))
  {
    v11 = CFSTR("tv.common.sense");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("overlay-checkmark")))
  {
    v11 = CFSTR("tv.played");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("mpaa-g")) & 1) != 0
         || (objc_msgSend(v4, "hasPrefix:", CFSTR("tv-g")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("g_mask")))
  {
    v11 = CFSTR("axid.icon.rating.g");
  }
  else if (objc_msgSend(v4, "axContainsString:", CFSTR("pg13")))
  {
    v11 = CFSTR("axid.icon.rating.pg13");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("mpaa-pg")) & 1) != 0
         || (objc_msgSend(v4, "hasPrefix:", CFSTR("tv-pg")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("pg_mask")))
  {
    v11 = CFSTR("axid.icon.rating.pg");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-ma")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tvma_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tvma");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("nr")) & 1) != 0
         || (objc_msgSend(v4, "hasPrefix:", CFSTR("tv-nr")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("nr_mask")))
  {
    v11 = CFSTR("axid.icon.rating.nr");
  }
  else if ((objc_msgSend(v4, "isEqual:", CFSTR("mpaa-r")) & 1) != 0
         || (objc_msgSend(v4, "hasPrefix:", CFSTR("tv-r")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("r_mask")))
  {
    v11 = CFSTR("axid.icon.rating.r");
  }
  else if (objc_msgSend(v4, "axContainsString:", CFSTR("unrated")))
  {
    v11 = CFSTR("axid.icon.rating.unrated");
  }
  else if (objc_msgSend(v4, "axContainsString:", CFSTR("nc17")))
  {
    v11 = CFSTR("axid.icon.rating.nc17");
  }
  else if (objc_msgSend(v4, "axContainsString:", CFSTR("y7fv")))
  {
    v11 = CFSTR("axid.icon.rating.tvy7fv");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-y7")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tvy7_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tvy7");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-y")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tvy_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tvy");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-pg")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tvpg_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tvpg");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-g")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tvg_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tvg");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("tv-14")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("tv14_mask")))
  {
    v11 = CFSTR("axid.icon.rating.tv14");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("4k-hdr")))
  {
    v11 = CFSTR("axid.icon.4k-hdr");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("hdr")))
  {
    v11 = CFSTR("axid.icon.hdr");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("hd")))
  {
    v11 = CFSTR("axid.icon.hd");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("cc")))
  {
    v11 = CFSTR("axid.icon.closed.captions");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("RT")))
  {
    v11 = CFSTR("tv.tomato.rating");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("metadata-ad")))
  {
    v11 = CFSTR("axid.icon.ad");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("4k")))
  {
    v11 = CFSTR("axid.icon.4k");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("metadata-sdh")))
  {
    v11 = CFSTR("axid.icon.sdh");
  }
  else if ((objc_msgSend(v4, "hasPrefix:", CFSTR("dolby-vision")) & 1) != 0
         || objc_msgSend(v4, "isEqual:", CFSTR("dolbyvision_mask")))
  {
    v11 = CFSTR("axid.icon.dolby-vision");
  }
  else if (objc_msgSend(v4, "axContainsString:", CFSTR("atmos")))
  {
    v11 = CFSTR("axid.icon.dolby-atmos");
  }
  else
  {
    if (!objc_msgSend(v4, "axContainsString:", CFSTR("itunes-extras-badge")))
    {
      v9 = 0;
      goto LABEL_5;
    }
    v11 = CFSTR("axid.icon.itunes-extras");
  }
  -[AXATVUtils atvaccessibilityLocalizedString:](self, "atvaccessibilityLocalizedString:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v9;
}

- (id)accessibilityLabelForResourceURL:(id)a3
{
  void *v4;
  void *v5;

  -[AXATVUtils accessibilityIdentifierForResourceURL:](self, "accessibilityIdentifierForResourceURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXATVUtils accessibilityLabelForID:](self, "accessibilityLabelForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentFocusedView
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("focusedView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
