@implementation FCPuzzleRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C6A8;
}

- (id)recordType
{
  return CFSTR("Puzzle");
}

- (int)pbRecordType
{
  return 15;
}

- (unint64_t)storeVersion
{
  return 2;
}

- (id)storeFilename
{
  return CFSTR("puzzle-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 2000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F7FB0 != -1)
    dispatch_once(&qword_1ED0F7FB0, &__block_literal_global_3_1);
  return (id)_MergedGlobals_157;
}

void __42__FCPuzzleRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("description"), CFSTR("puzzleTypeID"), CFSTR("dataResourceID"), CFSTR("authors"), CFSTR("isPaid"), CFSTR("publishDate"), CFSTR("difficulty"), CFSTR("thumbnailSmall"), CFSTR("thumbnailLarge"), CFSTR("language"), CFSTR("blockedStorefrontIDs"), CFSTR("allowedStorefrontIDs"), CFSTR("minNewsVersion"), CFSTR("teaserConfiguration"), CFSTR("behaviorFlags"),
    CFSTR("isDeprecated"),
    CFSTR("isDraft"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_157;
  _MergedGlobals_157 = v0;

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 1000000;
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

  v5 = (objc_class *)MEMORY[0x1E0D627D8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPuzzleDescription:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dataResourceID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataResourceID:", v12);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPuzzleTypeID:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("authors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v8, "setAuthors:", v15);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isPaid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsPaid:", objc_msgSend(v16, "BOOLValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("publishDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pbDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPublishedDate:", v18);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("difficulty"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDifficultyLevel:", objc_msgSend(v19, "unsignedLongLongValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailSmall"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThumbnailImageCompactURL:", v20);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailLarge"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThumbnailImageLargeURL:", v21);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("language"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLanguage:", v22);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("blockedStorefrontIDs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");
  objc_msgSend(v8, "setBlockedStorefrontIDs:", v24);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allowedStorefrontIDs"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  objc_msgSend(v8, "setAllowedStorefrontIDs:", v26);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("minNewsVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v27));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("teaserConfiguration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTeaserConfiguration:", v28);

  objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBehaviorFlags:", objc_msgSend(v29, "unsignedLongLongValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isDeprecated"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsDeprecated:", objc_msgSend(v30, "BOOLValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isDraft"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIsDraft:", objc_msgSend(v31, "BOOLValue"));
  return v8;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F7FC0 != -1)
    dispatch_once(&qword_1ED0F7FC0, &__block_literal_global_8);
  return (id)qword_1ED0F7FB8;
}

uint64_t __42__FCPuzzleRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F7FB8;
  qword_1ED0F7FB8 = v0;

  objc_msgSend((id)qword_1ED0F7FB8, "setCachePolicy:", 4);
  return objc_msgSend((id)qword_1ED0F7FB8, "setMaximumCachedAge:", 86400.0);
}

@end
