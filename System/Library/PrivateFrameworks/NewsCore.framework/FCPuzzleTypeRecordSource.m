@implementation FCPuzzleTypeRecordSource

+ (id)recordIDPrefixes
{
  return &unk_1E470C6C0;
}

- (id)recordIDPrefixes
{
  return +[FCPuzzleTypeRecordSource recordIDPrefixes](FCPuzzleTypeRecordSource, "recordIDPrefixes");
}

+ (BOOL)recognizesRecordID:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[FCPuzzleTypeRecordSource recordIDPrefixes](FCPuzzleTypeRecordSource, "recordIDPrefixes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[FCRecordSource recognizesRecordID:inRecordIDPrefixes:](FCRecordSource, "recognizesRecordID:inRecordIDPrefixes:", v3, v4);

  return v5;
}

- (id)recordType
{
  return CFSTR("PuzzleType");
}

- (int)pbRecordType
{
  return 16;
}

- (unint64_t)storeVersion
{
  return 2;
}

- (id)storeFilename
{
  return CFSTR("puzzle-type-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F80E0 != -1)
    dispatch_once(&qword_1ED0F80E0, &__block_literal_global_3_2);
  return (id)_MergedGlobals_163;
}

void __46__FCPuzzleTypeRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("name"), CFSTR("kind"), CFSTR("engineResourceID"), CFSTR("superfeedConfigResourceID"), CFSTR("latestPuzzleIDs"), CFSTR("promotedPuzzleIDs"), CFSTR("nameImage"), CFSTR("nameImageForDarkBackground"), CFSTR("coverImage"), CFSTR("feedNavImage"), CFSTR("navigationChromeBackgroundImage"), CFSTR("navigationChromeBackgroundImageCompact"), CFSTR("navigationChromeBackgroundImageLarge"), CFSTR("navigationChromeBackgroundDarkModeImage"), CFSTR("navigationChromeBackgroundDarkModeImageCompact"), CFSTR("navigationChromeBackgroundDarkModeImageLarge"), CFSTR("language"),
    CFSTR("blockedStorefrontIDs"),
    CFSTR("allowedStorefrontIDs"),
    CFSTR("minNewsVersion"),
    CFSTR("exploreTileImage"),
    CFSTR("themeConfiguration"),
    CFSTR("imagesResourceID"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_163;
  _MergedGlobals_163 = v0;

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (objc_class *)MEMORY[0x1E0D627E0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kind"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKind:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("engineResourceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEngineResourceID:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("superfeedConfigResourceID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuperfeedConfigResourceID:", v12);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("latestPuzzleIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLatestPuzzleIDs:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("promotedPuzzleIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPromotedPuzzleIDs:", v14);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("coverImage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCoverImageURL:", v15);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("nameImage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNameImageURL:", v16);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("nameImageForDarkBackground"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNameImageForDarkBackgroundURL:", v17);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("feedNavImage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFeedNavImageURL:", v18);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundImageURL:", v19);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImageCompact"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundImageCompactURL:", v20);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImageLarge"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundImageLargeURL:", v21);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundDarkModeImage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundDarkModeImageURL:", v22);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundDarkModeImageCompact"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundDarkModeImageCompactURL:", v23);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundDarkModeImageLarge"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNavigationChromeBackgroundDarkModeImageLargeURL:", v24);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("language"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLanguage:", v25);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blockedStorefrontIDs"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");
  objc_msgSend(v8, "setBlockedStorefrontIDs:", v27);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowedStorefrontIDs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");
  objc_msgSend(v8, "setAllowedStorefrontIDs:", v29);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("minNewsVersion"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v30));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("exploreTileImage"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExploreTileImageURL:", v31);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("themeConfiguration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThemeConfiguration:", v32);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("imagesResourceID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setImagesResourceID:", v33);
  return v8;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F80F0 != -1)
    dispatch_once(&qword_1ED0F80F0, &__block_literal_global_10_0);
  return (id)qword_1ED0F80E8;
}

uint64_t __46__FCPuzzleTypeRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F80E8;
  qword_1ED0F80E8 = v0;

  objc_msgSend((id)qword_1ED0F80E8, "setCachePolicy:", 4);
  return objc_msgSend((id)qword_1ED0F80E8, "setMaximumCachedAge:", 28800.0);
}

@end
