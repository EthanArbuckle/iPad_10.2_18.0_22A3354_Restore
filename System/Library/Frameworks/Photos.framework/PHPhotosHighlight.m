@implementation PHPhotosHighlight

- (unint64_t)assetsCountPrivate
{
  unint64_t assetsCount;

  assetsCount = self->_assetsCount;
  return assetsCount - -[PHPhotosHighlight assetsCountShared](self, "assetsCountShared");
}

- (unint64_t)assetsCountShared
{
  return self->_assetsCountShared;
}

- (BOOL)isRecent
{
  return self->_recent;
}

- (PHPhotosHighlight)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v9;
  PHPhotosHighlight *v10;
  uint64_t v11;
  NSDate *startDate;
  uint64_t v13;
  NSDate *endDate;
  uint64_t v15;
  NSString *subtitle;
  uint64_t v17;
  NSString *verboseSmartDescription;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDate *lastEnrichmentDate;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSManagedObjectID *keyAssetPrivate;
  uint64_t v42;
  NSManagedObjectID *dayGroupKeyAssetPrivate;
  uint64_t v44;
  NSManagedObjectID *monthKeyAssetPrivate;
  uint64_t v46;
  NSManagedObjectID *yearKeyAssetPrivate;
  uint64_t v48;
  NSManagedObjectID *parentPhotosHighlight;
  void *v50;
  unsigned __int16 v51;
  uint64_t v52;
  NSString *subtitleShared;
  uint64_t v54;
  NSString *subtitleMixed;
  uint64_t v56;
  NSString *verboseSmartDescriptionShared;
  uint64_t v58;
  NSString *verboseSmartDescriptionMixed;
  uint64_t v60;
  NSManagedObjectID *keyAssetShared;
  uint64_t v62;
  NSManagedObjectID *monthKeyAssetShared;
  uint64_t v64;
  NSManagedObjectID *yearKeyAssetShared;
  uint64_t v66;
  NSManagedObjectID *dayGroupKeyAssetShared;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSString *localizedTitle;
  uint64_t v89;
  NSString *shortDateDescriptionPrivate;
  uint64_t v91;
  NSString *titleShared;
  uint64_t v93;
  NSString *shortDateDescriptionShared;
  uint64_t v95;
  NSString *titleMixed;
  uint64_t v97;
  NSString *shortDateDescriptionMixed;
  NSString *v99;
  objc_super v101;

  v9 = a3;
  v101.receiver = self;
  v101.super_class = (Class)PHPhotosHighlight;
  v10 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v101, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v9, a4, a5);
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v13;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v15 = objc_claimAutoreleasedReturnValue();
    subtitle = v10->_subtitle;
    v10->_subtitle = (NSString *)v15;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("verboseSmartDescription"));
    v17 = objc_claimAutoreleasedReturnValue();
    verboseSmartDescription = v10->_verboseSmartDescription;
    v10->_verboseSmartDescription = (NSString *)v17;

    v10->super._assetCollectionType = 6;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("visibilityState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_visibilityState = objc_msgSend(v19, "unsignedShortValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kind"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_kind = objc_msgSend(v20, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_type = objc_msgSend(v21, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("category"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_category = objc_msgSend(v22, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("promotionScore"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v10->_promotionScore = v24;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startTimeZoneOffset"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_startTimeZoneOffset = objc_msgSend(v25, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endTimeZoneOffset"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_endTimeZoneOffset = objc_msgSend(v26, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("category"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v26) = objc_msgSend(v27, "integerValue");

    v10->_recent = (unsigned __int16)v26 == 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("enrichmentState"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_enrichmentState = objc_msgSend(v28, "shortValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lastEnrichmentDate"));
    v29 = objc_claimAutoreleasedReturnValue();
    lastEnrichmentDate = v10->_lastEnrichmentDate;
    v10->_lastEnrichmentDate = (NSDate *)v29;

    v10->_enriched = v10->_enrichmentState != 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mood"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_mood = objc_msgSend(v31, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetsCount"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_assetsCount = objc_msgSend(v32, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupAssetsCount"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupAssetsCount = objc_msgSend(v33, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupExtendedAssetsCount"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupExtendedAssetsCount = objc_msgSend(v34, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupSummaryAssetsCount"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupSummaryAssetsCount = objc_msgSend(v35, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("extendedCount"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_extendedCount = objc_msgSend(v36, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("summaryCount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_summaryCount = objc_msgSend(v37, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("highlightVersion"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_highlightVersion = objc_msgSend(v38, "intValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("enrichmentVersion"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_enrichmentVersion = objc_msgSend(v39, "intValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("keyAssetPrivate"));
    v40 = objc_claimAutoreleasedReturnValue();
    keyAssetPrivate = v10->_keyAssetPrivate;
    v10->_keyAssetPrivate = (NSManagedObjectID *)v40;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetPrivate"));
    v42 = objc_claimAutoreleasedReturnValue();
    dayGroupKeyAssetPrivate = v10->_dayGroupKeyAssetPrivate;
    v10->_dayGroupKeyAssetPrivate = (NSManagedObjectID *)v42;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("monthKeyAssetPrivate"));
    v44 = objc_claimAutoreleasedReturnValue();
    monthKeyAssetPrivate = v10->_monthKeyAssetPrivate;
    v10->_monthKeyAssetPrivate = (NSManagedObjectID *)v44;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("yearKeyAssetPrivate"));
    v46 = objc_claimAutoreleasedReturnValue();
    yearKeyAssetPrivate = v10->_yearKeyAssetPrivate;
    v10->_yearKeyAssetPrivate = (NSManagedObjectID *)v46;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("parentPhotosHighlight"));
    v48 = objc_claimAutoreleasedReturnValue();
    parentPhotosHighlight = v10->_parentPhotosHighlight;
    v10->_parentPhotosHighlight = (NSManagedObjectID *)v48;

    if ((a4 & 0x1C) < 0x14 && ((0x17u >> ((a4 & 0x1C) >> 2)) & 1) != 0)
    {
      v51 = word_19944A6E8[(a4 >> 2) & 7];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PHPhotosHighlight.m"), 557, CFSTR("Private/Shared property hints are mutually exclusive %lu"), a4 & 0x1C);

      v51 = 0;
    }
    v10->_sharingFilter = v51;
    v10->_isSharingSuggestion = (a4 & 0x20) != 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subtitleShared"));
    v52 = objc_claimAutoreleasedReturnValue();
    subtitleShared = v10->_subtitleShared;
    v10->_subtitleShared = (NSString *)v52;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subtitleMixed"));
    v54 = objc_claimAutoreleasedReturnValue();
    subtitleMixed = v10->_subtitleMixed;
    v10->_subtitleMixed = (NSString *)v54;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("verboseSmartDescriptionShared"));
    v56 = objc_claimAutoreleasedReturnValue();
    verboseSmartDescriptionShared = v10->_verboseSmartDescriptionShared;
    v10->_verboseSmartDescriptionShared = (NSString *)v56;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("verboseSmartDescriptionMixed"));
    v58 = objc_claimAutoreleasedReturnValue();
    verboseSmartDescriptionMixed = v10->_verboseSmartDescriptionMixed;
    v10->_verboseSmartDescriptionMixed = (NSString *)v58;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("keyAssetShared"));
    v60 = objc_claimAutoreleasedReturnValue();
    keyAssetShared = v10->_keyAssetShared;
    v10->_keyAssetShared = (NSManagedObjectID *)v60;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("monthKeyAssetShared"));
    v62 = objc_claimAutoreleasedReturnValue();
    monthKeyAssetShared = v10->_monthKeyAssetShared;
    v10->_monthKeyAssetShared = (NSManagedObjectID *)v62;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("yearKeyAssetShared"));
    v64 = objc_claimAutoreleasedReturnValue();
    yearKeyAssetShared = v10->_yearKeyAssetShared;
    v10->_yearKeyAssetShared = (NSManagedObjectID *)v64;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupKeyAssetShared"));
    v66 = objc_claimAutoreleasedReturnValue();
    dayGroupKeyAssetShared = v10->_dayGroupKeyAssetShared;
    v10->_dayGroupKeyAssetShared = (NSManagedObjectID *)v66;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_sharingComposition = objc_msgSend(v68, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mixedSharingCompositionKeyAssetRelationship"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_mixedSharingCompositionKeyAssetRelationship = objc_msgSend(v69, "unsignedShortValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("assetsCountShared"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_assetsCountShared = objc_msgSend(v70, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("extendedCountShared"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_extendedCountShared = objc_msgSend(v71, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("summaryCountShared"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_summaryCountShared = objc_msgSend(v72, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupAssetsCountShared"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupAssetsCountShared = objc_msgSend(v73, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupExtendedAssetsCountShared"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupExtendedAssetsCountShared = objc_msgSend(v74, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayGroupSummaryAssetsCountShared"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_dayGroupSummaryAssetsCountShared = objc_msgSend(v75, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("visibilityStateShared"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_visibilityStateShared = objc_msgSend(v76, "unsignedShortValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("visibilityStateMixed"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_visibilityStateMixed = objc_msgSend(v77, "unsignedShortValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("photoAssetsSuggestedByPhotosCount"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_photoAssetsSuggestedByPhotosCount = objc_msgSend(v78, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("videoAssetsSuggestedByPhotosCount"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_videoAssetsSuggestedByPhotosCount = objc_msgSend(v79, "integerValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("titleShared"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("titleMixed"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl() && PLPhotosHighlightTypeIsConsideredTrip())
    {
      v83 = *MEMORY[0x1E0D72488];
      objc_msgSend(v80, "componentsSeparatedByString:", *MEMORY[0x1E0D72488]);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "componentsSeparatedByString:", v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "componentsSeparatedByString:", v83);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v84, "count"))
      {
        objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
        v87 = objc_claimAutoreleasedReturnValue();
        localizedTitle = v10->super._localizedTitle;
        v10->super._localizedTitle = (NSString *)v87;

        if (objc_msgSend(v84, "count") == 2)
        {
          objc_msgSend(v84, "objectAtIndexedSubscript:", 1);
          v89 = objc_claimAutoreleasedReturnValue();
          shortDateDescriptionPrivate = v10->_shortDateDescriptionPrivate;
          v10->_shortDateDescriptionPrivate = (NSString *)v89;

        }
      }
      if (objc_msgSend(v85, "count"))
      {
        objc_msgSend(v85, "objectAtIndexedSubscript:", 0);
        v91 = objc_claimAutoreleasedReturnValue();
        titleShared = v10->_titleShared;
        v10->_titleShared = (NSString *)v91;

        if (objc_msgSend(v85, "count") == 2)
        {
          objc_msgSend(v85, "objectAtIndexedSubscript:", 1);
          v93 = objc_claimAutoreleasedReturnValue();
          shortDateDescriptionShared = v10->_shortDateDescriptionShared;
          v10->_shortDateDescriptionShared = (NSString *)v93;

        }
      }
      if (objc_msgSend(v86, "count"))
      {
        objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
        v95 = objc_claimAutoreleasedReturnValue();
        titleMixed = v10->_titleMixed;
        v10->_titleMixed = (NSString *)v95;

        if (objc_msgSend(v86, "count") == 2)
        {
          objc_msgSend(v86, "objectAtIndexedSubscript:", 1);
          v97 = objc_claimAutoreleasedReturnValue();
          shortDateDescriptionMixed = v10->_shortDateDescriptionMixed;
          v10->_shortDateDescriptionMixed = (NSString *)v97;

        }
      }

    }
    else
    {
      objc_storeStrong((id *)&v10->super._localizedTitle, v80);
      objc_storeStrong((id *)&v10->_titleShared, v81);
      v99 = v82;
      v84 = v10->_titleMixed;
      v10->_titleMixed = v99;
    }

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPhotosHighlight;
  if (-[PHObject isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = objc_msgSend(v4, "isSharingSuggestion");
    v6 = v5 ^ -[PHPhotosHighlight isSharingSuggestion](self, "isSharingSuggestion") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unsigned)enrichmentState
{
  return self->_enrichmentState;
}

- (double)promotionScore
{
  return self->_promotionScore;
}

- (unsigned)type
{
  return self->_type;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetIdentifier"), "length"))
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetIdentifier"));
  else
    v4 = 0;
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetCore"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetCore")))
  {
    v4 |= 2uLL;
  }
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetOnlyPrivate"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetOnlyPrivate")))
  {
    v4 |= 4uLL;
  }
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetOnlyShared"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetOnlyShared")))
  {
    v4 |= 8uLL;
  }
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetPrivateOrShared"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetPrivateOrShared")))
  {
    v4 |= 0x10uLL;
  }
  if (objc_msgSend(CFSTR("PHPhotosHighlightPropertySetSharingSuggestions"), "length")
    && objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetSharingSuggestions")))
  {
    v4 |= 0x20uLL;
  }
  if (!objc_msgSend(v3, "containsObject:", CFSTR("PHPhotosHighlightPropertySetIdentifier")))
    v4 |= 2uLL;

  return v4;
}

- (unsigned)preferredCurationType
{
  BOOL v2;

  if (self->_kind)
    v2 = self->_kind == 3;
  else
    v2 = 1;
  if (v2)
    return 2;
  else
    return 0;
}

- (unint64_t)dayGroupAssetsCountPrivate
{
  unint64_t dayGroupAssetsCount;

  dayGroupAssetsCount = self->_dayGroupAssetsCount;
  return dayGroupAssetsCount - -[PHPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared");
}

- (unint64_t)dayGroupAssetsCountShared
{
  return self->_dayGroupAssetsCountShared;
}

- (id)title
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = -[PHPhotosHighlight category](self, "category");
  if (-[PHPhotosHighlight kind](self, "kind") && -[PHPhotosHighlight kind](self, "kind") != 3)
  {
    v8 = 0;
  }
  else
  {
    -[PHAssetCollection startDate](self, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5;

    v7 = -v6;
    if (v6 >= 0.0)
      v7 = v6;
    v8 = v7 < 604800.0;
  }
  if (v3 == 1 || v8)
  {
    if (_os_feature_enabled_impl())
      v10 = 8;
    else
      v10 = 0;
    objc_msgSend((id)objc_opt_class(), "dateRangeTitleGenerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotosHighlight localStartDate](self, "localStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotosHighlight localEndDate](self, "localEndDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v12, v13, -[PHPhotosHighlight category](self, "category"), -[PHPhotosHighlight kind](self, "kind"), -[PHPhotosHighlight type](self, "type"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHPhotosHighlight localizedTitle](self, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)localizedTitle
{
  int v3;
  int sharingComposition;
  int *v5;
  int sharingFilter;

  v3 = -[PHPhotosHighlight kind](self, "kind");
  if (v3 != 3 && v3)
  {
    v5 = &OBJC_IVAR___PHAssetCollection__localizedTitle;
  }
  else
  {
    sharingComposition = self->_sharingComposition;
    v5 = &OBJC_IVAR___PHAssetCollection__localizedTitle;
    if (sharingComposition == 2)
    {
      sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1)
        v5 = &OBJC_IVAR___PHPhotosHighlight__titleShared;
      if (sharingFilter == 2)
        v5 = &OBJC_IVAR___PHPhotosHighlight__titleMixed;
    }
    else if (sharingComposition == 1)
    {
      v5 = &OBJC_IVAR___PHPhotosHighlight__titleShared;
    }
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v5);
}

- (unsigned)category
{
  return self->_category;
}

+ (id)managedEntityName
{
  return CFSTR("PhotosHighlight");
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PHPhotosHighlight_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToFetchWithHint__onceToken_9748 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_9748, block);
  return (id)propertiesToFetchWithHint__array_9749;
}

id __89__PHPhotosHighlight_keyAssetInverseRelationshipPredicateForHighlight_forHighlightFilter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  switch(objc_msgSend(v2, "kind"))
  {
    case 0u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("highlightBeingKeyAssetPrivate");
      goto LABEL_9;
    case 1u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("monthHighlightBeingKeyAssetPrivate");
      goto LABEL_9;
    case 2u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("yearHighlightBeingKeyAssetPrivate");
      goto LABEL_9;
    case 3u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("dayGroupHighlightBeingKeyAssetPrivate");
LABEL_9:
      objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v11 = objc_msgSend(v2, "kind");
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "keyAssetInverseRelationshipPredicateForHighlight (privateHandler): Unhandled highlight kind: %ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v8;
}

- (int64_t)assetCollectionSubtype
{
  unsigned int v3;
  objc_super v5;

  v3 = -[PHPhotosHighlight kind](self, "kind");
  if (v3 < 4)
    return v3 + 1000000301;
  v5.receiver = self;
  v5.super_class = (Class)PHPhotosHighlight;
  return -[PHAssetCollection assetCollectionSubtype](&v5, sel_assetCollectionSubtype);
}

- (unsigned)kind
{
  return self->_kind;
}

+ (id)keyAssetInverseRelationshipPredicateForHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4
{
  void *v4;

  objc_msgSend(a1, "_choosePrivateOrSharedRelationshipForHighlight:givenFilter:privateHandler:sharedHandler:", a3, a4, &__block_literal_global_197, &__block_literal_global_209);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_choosePrivateOrSharedRelationshipForHighlight:(id)a3 givenFilter:(unsigned __int16)a4 privateHandler:(id)a5 sharedHandler:(id)a6
{
  int v8;
  id v9;
  void (**v10)(id, id);
  void (**v11)(id, id);
  int v12;
  void (**v13)(id, id);
  void *v14;
  unsigned int v15;

  v8 = a4;
  v9 = a3;
  v10 = (void (**)(id, id))a5;
  v11 = (void (**)(id, id))a6;
  v12 = objc_msgSend(v9, "sharingComposition");
  if (v12 == 2)
  {
    v13 = v10;
    if (v8)
    {
      if (v8 == 2)
      {
        v15 = objc_msgSend(v9, "mixedSharingCompositionKeyAssetRelationship");
        v13 = v10;
        if (v15 >= 2)
        {
          if (v15 != 2)
            goto LABEL_15;
          v13 = v11;
        }
      }
      else
      {
        v13 = v11;
        if (v8 != 1)
          goto LABEL_15;
      }
    }
  }
  else
  {
    if (v12 != 1)
    {
      if (!v12)
      {
        v13 = v10;
        if ((v8 & 0xFFFFFFFD) == 0)
          goto LABEL_11;
      }
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
    v13 = v11;
    if ((v8 - 1) >= 2)
      goto LABEL_15;
  }
LABEL_11:
  v13[2](v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v14;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (unint64_t)estimatedVideosCount
{
  objc_super v4;

  if (-[PHPhotosHighlight isSharingSuggestion](self, "isSharingSuggestion"))
    return -[PHPhotosHighlight videoAssetsSuggestedByPhotosCount](self, "videoAssetsSuggestedByPhotosCount");
  v4.receiver = self;
  v4.super_class = (Class)PHPhotosHighlight;
  return -[PHAssetCollection estimatedVideosCount](&v4, sel_estimatedVideosCount);
}

- (unint64_t)estimatedPhotosCount
{
  objc_super v4;

  if (-[PHPhotosHighlight isSharingSuggestion](self, "isSharingSuggestion"))
    return -[PHPhotosHighlight photoAssetsSuggestedByPhotosCount](self, "photoAssetsSuggestedByPhotosCount");
  v4.receiver = self;
  v4.super_class = (Class)PHPhotosHighlight;
  return -[PHAssetCollection estimatedPhotosCount](&v4, sel_estimatedPhotosCount);
}

- (unint64_t)assetsCount
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  unsigned int kind;
  int sharingComposition;
  int sharingFilter;

  result = -[PHPhotosHighlight isSharingSuggestion](self, "isSharingSuggestion");
  if (!(_DWORD)result)
  {
    kind = self->_kind;
    if (kind >= 3)
    {
      if (kind != 3)
        return result;
      sharingComposition = self->_sharingComposition;
      if (!self->_sharingComposition)
        return -[PHPhotosHighlight dayGroupAssetsCountPrivate](self, "dayGroupAssetsCountPrivate");
      goto LABEL_16;
    }
    sharingComposition = self->_sharingComposition;
    if (sharingComposition == 2)
    {
      sharingFilter = self->_sharingFilter;
      if (sharingFilter == 2)
        return -[PHPhotosHighlight assetsCountMixed](self, "assetsCountMixed");
      if (sharingFilter != 1)
      {
        if (self->_sharingFilter)
          goto LABEL_24;
        return -[PHPhotosHighlight assetsCountPrivate](self, "assetsCountPrivate");
      }
    }
    else if (sharingComposition != 1)
    {
      if (self->_sharingComposition)
      {
LABEL_16:
        if (sharingComposition == 1)
          return -[PHPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared");
        if (sharingComposition != 2)
          return result;
        sharingFilter = self->_sharingFilter;
LABEL_24:
        if (sharingFilter == 2)
          return -[PHPhotosHighlight dayGroupAssetsCountMixed](self, "dayGroupAssetsCountMixed");
        if (sharingFilter != 1)
        {
          if (sharingFilter)
            return result;
          return -[PHPhotosHighlight dayGroupAssetsCountPrivate](self, "dayGroupAssetsCountPrivate");
        }
        return -[PHPhotosHighlight dayGroupAssetsCountShared](self, "dayGroupAssetsCountShared");
      }
      return -[PHPhotosHighlight assetsCountPrivate](self, "assetsCountPrivate");
    }
    return -[PHPhotosHighlight assetsCountShared](self, "assetsCountShared");
  }
  v4 = -[PHPhotosHighlight photoAssetsSuggestedByPhotosCount](self, "photoAssetsSuggestedByPhotosCount");
  v5 = -[PHPhotosHighlight videoAssetsSuggestedByPhotosCount](self, "videoAssetsSuggestedByPhotosCount");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v5 + v4;
}

- (BOOL)isSharingSuggestion
{
  return self->_isSharingSuggestion;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 1;
}

void __47__PHPhotosHighlight_propertiesToFetchWithHint___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[54];

  v4[53] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v0, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setExpression:", v1);

  objc_msgSend(v0, "setExpressionResultType:", 2000);
  v4[0] = v0;
  v4[1] = CFSTR("uuid");
  v4[2] = CFSTR("title");
  v4[3] = CFSTR("subtitle");
  v4[4] = CFSTR("verboseSmartDescription");
  v4[5] = CFSTR("startDate");
  v4[6] = CFSTR("endDate");
  v4[7] = CFSTR("visibilityState");
  v4[8] = CFSTR("kind");
  v4[9] = CFSTR("type");
  v4[10] = CFSTR("category");
  v4[11] = CFSTR("startTimeZoneOffset");
  v4[12] = CFSTR("endTimeZoneOffset");
  v4[13] = CFSTR("promotionScore");
  v4[14] = CFSTR("enrichmentState");
  v4[15] = CFSTR("lastEnrichmentDate");
  v4[16] = CFSTR("mood");
  v4[17] = CFSTR("assetsCount");
  v4[18] = CFSTR("assetsCountShared");
  v4[19] = CFSTR("dayGroupAssetsCount");
  v4[20] = CFSTR("dayGroupExtendedAssetsCount");
  v4[21] = CFSTR("dayGroupSummaryAssetsCount");
  v4[22] = CFSTR("extendedCount");
  v4[23] = CFSTR("summaryCount");
  v4[24] = CFSTR("highlightVersion");
  v4[25] = CFSTR("enrichmentVersion");
  v4[26] = CFSTR("keyAssetPrivate");
  v4[27] = CFSTR("dayGroupKeyAssetPrivate");
  v4[28] = CFSTR("monthKeyAssetPrivate");
  v4[29] = CFSTR("yearKeyAssetPrivate");
  v4[30] = CFSTR("parentPhotosHighlight");
  v4[31] = CFSTR("assetsCountShared");
  v4[32] = CFSTR("dayGroupAssetsCountShared");
  v4[33] = CFSTR("dayGroupExtendedAssetsCountShared");
  v4[34] = CFSTR("dayGroupSummaryAssetsCountShared");
  v4[35] = CFSTR("extendedCountShared");
  v4[36] = CFSTR("summaryCountShared");
  v4[37] = CFSTR("keyAssetShared");
  v4[38] = CFSTR("dayGroupKeyAssetShared");
  v4[39] = CFSTR("monthKeyAssetShared");
  v4[40] = CFSTR("yearKeyAssetShared");
  v4[41] = CFSTR("titleShared");
  v4[42] = CFSTR("titleMixed");
  v4[43] = CFSTR("subtitleShared");
  v4[44] = CFSTR("subtitleMixed");
  v4[45] = CFSTR("verboseSmartDescriptionShared");
  v4[46] = CFSTR("verboseSmartDescriptionMixed");
  v4[47] = CFSTR("mixedSharingCompositionKeyAssetRelationship");
  v4[48] = CFSTR("sharingComposition");
  v4[49] = CFSTR("visibilityStateShared");
  v4[50] = CFSTR("visibilityStateMixed");
  v4[51] = CFSTR("photoAssetsSuggestedByPhotosCount");
  v4[52] = CFSTR("videoAssetsSuggestedByPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 53);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesToFetchWithHint__array_9749;
  propertiesToFetchWithHint__array_9749 = v2;

}

- (id)localizedSubtitle
{
  int v3;
  int sharingComposition;
  int *v5;
  int sharingFilter;

  v3 = -[PHPhotosHighlight kind](self, "kind");
  if (v3 != 3 && v3)
  {
    v5 = &OBJC_IVAR___PHPhotosHighlight__subtitle;
  }
  else
  {
    sharingComposition = self->_sharingComposition;
    v5 = &OBJC_IVAR___PHPhotosHighlight__subtitle;
    if (sharingComposition == 2)
    {
      sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1)
        v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleShared;
      if (sharingFilter == 2)
        v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleMixed;
    }
    else if (sharingComposition == 1)
    {
      v5 = &OBJC_IVAR___PHPhotosHighlight__subtitleShared;
    }
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v5);
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)canContainCustomKeyAssets
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 1;
}

- (NSString)verboseSmartDescription
{
  int sharingComposition;
  int *v3;
  unint64_t sharingFilter;

  sharingComposition = self->_sharingComposition;
  if (!self->_sharingComposition)
  {
    v3 = &OBJC_IVAR___PHPhotosHighlight__verboseSmartDescription;
    goto LABEL_8;
  }
  if (sharingComposition == 2)
  {
    sharingFilter = self->_sharingFilter;
    if (sharingFilter <= 2)
    {
      v3 = off_1E35D7A58[sharingFilter];
      goto LABEL_8;
    }
  }
  else if (sharingComposition == 1)
  {
    v3 = &OBJC_IVAR___PHPhotosHighlight__verboseSmartDescriptionShared;
LABEL_8:
    a2 = (SEL)*(id *)((char *)&self->super.super.super.super.isa + *v3);
  }
  return (NSString *)(id)a2;
}

- (NSString)verboseSmartDescriptionPrivate
{
  return self->_verboseSmartDescription;
}

- (unint64_t)extendedCount
{
  unsigned int v2;
  int v3;
  int v4;

  v2 = *(unsigned __int16 *)(self + 368);
  if (v2 >= 3)
  {
    if (v2 != 3)
      return self;
    v3 = *(unsigned __int16 *)(self + 366);
    goto LABEL_8;
  }
  v3 = *(unsigned __int16 *)(self + 366);
  if (v3 == 2)
  {
    v4 = *(unsigned __int16 *)(self + 384);
    if (v4 == 2)
      return objc_msgSend((id)self, "extendedCountMixed");
    if (v4 != 1)
    {
      if (!*(_WORD *)(self + 384))
        return objc_msgSend((id)self, "extendedCountPrivate");
      goto LABEL_17;
    }
    return objc_msgSend((id)self, "extendedCountShared");
  }
  if (v3 == 1)
    return objc_msgSend((id)self, "extendedCountShared");
  if (!*(_WORD *)(self + 366))
    return objc_msgSend((id)self, "extendedCountPrivate");
LABEL_8:
  if (!v3)
    return objc_msgSend((id)self, "dayGroupExtendedAssetsCountPrivate");
  if (v3 == 1)
    return objc_msgSend((id)self, "dayGroupExtendedAssetsCountShared");
  if (v3 != 2)
    return self;
  v4 = *(unsigned __int16 *)(self + 384);
LABEL_17:
  switch(v4)
  {
    case 2:
      return objc_msgSend((id)self, "dayGroupExtendedAssetsCountMixed");
    case 1:
      return objc_msgSend((id)self, "dayGroupExtendedAssetsCountShared");
    case 0:
      return objc_msgSend((id)self, "dayGroupExtendedAssetsCountPrivate");
  }
  return self;
}

- (unint64_t)summaryCount
{
  int sharingComposition;
  int sharingFilter;

  if (!self->_kind)
  {
    sharingComposition = self->_sharingComposition;
    if (sharingComposition == 2)
    {
      sharingFilter = self->_sharingFilter;
      if (sharingFilter == 2)
        return -[PHPhotosHighlight summaryCountMixed](self, "summaryCountMixed");
      if (sharingFilter != 1)
      {
        if (self->_sharingFilter)
          goto LABEL_8;
        return -[PHPhotosHighlight summaryCountPrivate](self, "summaryCountPrivate");
      }
    }
    else if (sharingComposition != 1)
    {
      if (self->_sharingComposition)
        goto LABEL_4;
      return -[PHPhotosHighlight summaryCountPrivate](self, "summaryCountPrivate");
    }
    return -[PHPhotosHighlight summaryCountShared](self, "summaryCountShared");
  }
  if (self->_kind != 3)
    return 0;
  sharingComposition = self->_sharingComposition;
LABEL_4:
  if (!sharingComposition)
    return -[PHPhotosHighlight dayGroupSummaryAssetsCountPrivate](self, "dayGroupSummaryAssetsCountPrivate");
  if (sharingComposition == 1)
    return -[PHPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared");
  if (sharingComposition != 2)
    return 0;
  sharingFilter = self->_sharingFilter;
LABEL_8:
  if (sharingFilter != 2)
  {
    if (sharingFilter != 1)
    {
      if (!sharingFilter)
        return -[PHPhotosHighlight dayGroupSummaryAssetsCountPrivate](self, "dayGroupSummaryAssetsCountPrivate");
      return 0;
    }
    return -[PHPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared");
  }
  return -[PHPhotosHighlight dayGroupSummaryAssetsCountMixed](self, "dayGroupSummaryAssetsCountMixed");
}

- (unsigned)visibilityStatePrivate
{
  return self->_visibilityState;
}

- (unsigned)visibilityState
{
  int sharingComposition;
  int sharingFilter;

  sharingComposition = self->_sharingComposition;
  if (sharingComposition != 2)
  {
    if (sharingComposition != 1)
    {
      if (!self->_sharingComposition)
        return -[PHPhotosHighlight visibilityStatePrivate](self, "visibilityStatePrivate");
      return 0;
    }
    return -[PHPhotosHighlight visibilityStateShared](self, "visibilityStateShared");
  }
  sharingFilter = self->_sharingFilter;
  if (sharingFilter != 2)
  {
    if (sharingFilter != 1)
    {
      if (!self->_sharingFilter)
        return -[PHPhotosHighlight visibilityStatePrivate](self, "visibilityStatePrivate");
      return 0;
    }
    return -[PHPhotosHighlight visibilityStateShared](self, "visibilityStateShared");
  }
  return -[PHPhotosHighlight visibilityStateMixed](self, "visibilityStateMixed");
}

- (unint64_t)extendedCountShared
{
  return self->_extendedCountShared;
}

- (unint64_t)summaryCountShared
{
  return self->_summaryCountShared;
}

- (unint64_t)extendedCountPrivate
{
  unint64_t extendedCount;

  extendedCount = self->_extendedCount;
  return extendedCount - -[PHPhotosHighlight extendedCountShared](self, "extendedCountShared");
}

- (unint64_t)summaryCountPrivate
{
  unint64_t summaryCount;

  summaryCount = self->_summaryCount;
  return summaryCount - -[PHPhotosHighlight summaryCountShared](self, "summaryCountShared");
}

- (unint64_t)assetsCountMixed
{
  return self->_assetsCount;
}

- (unint64_t)extendedCountMixed
{
  return self->_extendedCount;
}

- (unint64_t)summaryCountMixed
{
  return self->_summaryCount;
}

- (unint64_t)dayGroupExtendedAssetsCountPrivate
{
  unint64_t dayGroupExtendedAssetsCount;

  dayGroupExtendedAssetsCount = self->_dayGroupExtendedAssetsCount;
  return dayGroupExtendedAssetsCount
       - -[PHPhotosHighlight dayGroupExtendedAssetsCountShared](self, "dayGroupExtendedAssetsCountShared");
}

- (unint64_t)dayGroupSummaryAssetsCountPrivate
{
  unint64_t dayGroupSummaryAssetsCount;

  dayGroupSummaryAssetsCount = self->_dayGroupSummaryAssetsCount;
  return dayGroupSummaryAssetsCount
       - -[PHPhotosHighlight dayGroupSummaryAssetsCountShared](self, "dayGroupSummaryAssetsCountShared");
}

- (unint64_t)dayGroupAssetsCountMixed
{
  return self->_dayGroupAssetsCount;
}

- (unint64_t)dayGroupExtendedAssetsCountMixed
{
  return self->_dayGroupExtendedAssetsCount;
}

- (unint64_t)dayGroupSummaryAssetsCountMixed
{
  return self->_dayGroupSummaryAssetsCount;
}

- (unint64_t)countForCurationType:(unsigned __int16)a3
{
  if (a3 == 2)
    return -[PHPhotosHighlight extendedCount](self, "extendedCount");
  if (a3 == 1)
    return -[PHPhotosHighlight summaryCount](self, "summaryCount");
  return 0;
}

- (NSString)shortDateDescription
{
  int v3;
  int sharingComposition;
  int *v5;
  int sharingFilter;

  v3 = -[PHPhotosHighlight kind](self, "kind");
  if (v3 != 3 && v3)
  {
    v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionPrivate;
  }
  else
  {
    sharingComposition = self->_sharingComposition;
    v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionPrivate;
    if (sharingComposition == 2)
    {
      sharingFilter = self->_sharingFilter;
      if (sharingFilter == 1)
        v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionShared;
      if (sharingFilter == 2)
        v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionMixed;
    }
    else if (sharingComposition == 1)
    {
      v5 = &OBJC_IVAR___PHPhotosHighlight__shortDateDescriptionShared;
    }
  }
  return (NSString *)*(id *)((char *)&self->super.super.super.super.isa + *v5);
}

- (NSString)dateDescriptionPrivate
{
  return self->super._localizedTitle;
}

- (NSString)subtitle
{
  void *subtitle;
  void *v4;
  NSString *v5;

  -[PHPhotosHighlight verboseSmartDescriptionUserEdited](self, "verboseSmartDescriptionUserEdited");
  subtitle = (void *)objc_claimAutoreleasedReturnValue();
  v4 = subtitle;
  if (!subtitle)
    subtitle = self->_subtitle;
  v5 = subtitle;

  return v5;
}

- (id)dateDescriptionWithOptions:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  -[PHPhotosHighlight localStartDate](self, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight localEndDate](self, "localEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHPhotosHighlight kind](self, "kind") == 1)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    objc_msgSend(v5, "dateByAddingTimeInterval:", v7 * 0.5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v8;
    v5 = v8;
  }
  objc_msgSend((id)objc_opt_class(), "dateRangeTitleGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateRangeTitleWithStartDate:endDate:category:kind:type:options:", v5, v6, -[PHPhotosHighlight category](self, "category"), -[PHPhotosHighlight kind](self, "kind"), -[PHPhotosHighlight type](self, "type"), 2 * (v3 & 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)subtitlePrivate
{
  return self->_subtitle;
}

- (NSDate)localStartDate
{
  NSDate *localStartDate;
  NSDate *v4;
  NSDate *v5;

  localStartDate = self->_localStartDate;
  if (!localStartDate)
  {
    -[NSDate dateByAddingTimeInterval:](self->super._startDate, "dateByAddingTimeInterval:", (double)self->_startTimeZoneOffset);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_localStartDate;
    self->_localStartDate = v4;

    localStartDate = self->_localStartDate;
  }
  return localStartDate;
}

- (NSDate)localEndDate
{
  NSDate *localEndDate;
  NSDate *v4;
  NSDate *v5;

  localEndDate = self->_localEndDate;
  if (!localEndDate)
  {
    -[NSDate dateByAddingTimeInterval:](self->super._endDate, "dateByAddingTimeInterval:", (double)self->_endTimeZoneOffset);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_localEndDate;
    self->_localEndDate = v4;

    localEndDate = self->_localEndDate;
  }
  return localEndDate;
}

- (id)keyAssetObjectIDForKindWithFilter:(unsigned __int16)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "_keyAssetObjectIDForHighlight:filter:", self, a3);
}

- (NSManagedObjectID)keyAssetObjectIDForKind
{
  return (NSManagedObjectID *)-[PHPhotosHighlight keyAssetObjectIDForKindWithFilter:](self, "keyAssetObjectIDForKindWithFilter:", self->_sharingFilter);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHPhotosHighlight;
  -[PHAssetCollection description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight dateDescription](self, "dateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight smartDescription](self, "smartDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight verboseSmartDescription](self, "verboseSmartDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetCollection endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight kind](self, "kind");
  PLDescriptionForPhotosHighlightKind();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotosHighlight type](self, "type");
  PLDescriptionForPhotosHighlightType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PHPhotosHighlight isRecent](self, "isRecent");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ - %@, verboseSmartDescription: %@, [%@ - %@], kind: %@, type: %@, isRecent: %@"), v4, v5, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)photoAssetsSuggestedByPhotosCount
{
  return self->_photoAssetsSuggestedByPhotosCount;
}

- (unint64_t)videoAssetsSuggestedByPhotosCount
{
  return self->_videoAssetsSuggestedByPhotosCount;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (void)setLocalStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_localStartDate, a3);
}

- (void)setLocalEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_localEndDate, a3);
}

- (int64_t)startTimeZoneOffset
{
  return self->_startTimeZoneOffset;
}

- (int64_t)endTimeZoneOffset
{
  return self->_endTimeZoneOffset;
}

- (BOOL)isEnriched
{
  return self->_enriched;
}

- (void)setEnriched:(BOOL)a3
{
  self->_enriched = a3;
}

- (void)setRecent:(BOOL)a3
{
  self->_recent = a3;
}

- (NSDate)lastEnrichmentDate
{
  return self->_lastEnrichmentDate;
}

- (void)setLastEnrichmentDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastEnrichmentDate, a3);
}

- (unint64_t)mood
{
  return self->_mood;
}

- (unint64_t)dayGroupAssetsCount
{
  return self->_dayGroupAssetsCount;
}

- (unint64_t)dayGroupExtendedAssetsCount
{
  return self->_dayGroupExtendedAssetsCount;
}

- (unint64_t)dayGroupSummaryAssetsCount
{
  return self->_dayGroupSummaryAssetsCount;
}

- (NSString)subtitleShared
{
  return self->_subtitleShared;
}

- (NSString)subtitleMixed
{
  return self->_subtitleMixed;
}

- (NSString)titleShared
{
  return self->_titleShared;
}

- (NSString)titleMixed
{
  return self->_titleMixed;
}

- (NSString)dateDescriptionShared
{
  return self->_dateDescriptionShared;
}

- (NSString)dateDescriptionMixed
{
  return self->_dateDescriptionMixed;
}

- (NSString)shortDateDescriptionPrivate
{
  return self->_shortDateDescriptionPrivate;
}

- (NSString)shortDateDescriptionShared
{
  return self->_shortDateDescriptionShared;
}

- (NSString)shortDateDescriptionMixed
{
  return self->_shortDateDescriptionMixed;
}

- (NSString)verboseSmartDescriptionShared
{
  return self->_verboseSmartDescriptionShared;
}

- (NSString)verboseSmartDescriptionMixed
{
  return self->_verboseSmartDescriptionMixed;
}

- (NSString)verboseSmartDescriptionUserEdited
{
  return self->_verboseSmartDescriptionUserEdited;
}

- (NSManagedObjectID)keyAssetPrivate
{
  return self->_keyAssetPrivate;
}

- (NSManagedObjectID)monthKeyAssetPrivate
{
  return self->_monthKeyAssetPrivate;
}

- (NSManagedObjectID)yearKeyAssetPrivate
{
  return self->_yearKeyAssetPrivate;
}

- (NSManagedObjectID)dayGroupKeyAssetPrivate
{
  return self->_dayGroupKeyAssetPrivate;
}

- (unsigned)visibilityStateShared
{
  return self->_visibilityStateShared;
}

- (unsigned)visibilityStateMixed
{
  return self->_visibilityStateMixed;
}

- (NSManagedObjectID)keyAssetShared
{
  return self->_keyAssetShared;
}

- (NSManagedObjectID)monthKeyAssetShared
{
  return self->_monthKeyAssetShared;
}

- (NSManagedObjectID)yearKeyAssetShared
{
  return self->_yearKeyAssetShared;
}

- (NSManagedObjectID)dayGroupKeyAssetShared
{
  return self->_dayGroupKeyAssetShared;
}

- (unint64_t)dayGroupExtendedAssetsCountShared
{
  return self->_dayGroupExtendedAssetsCountShared;
}

- (unint64_t)dayGroupSummaryAssetsCountShared
{
  return self->_dayGroupSummaryAssetsCountShared;
}

- (signed)highlightVersion
{
  return self->_highlightVersion;
}

- (signed)enrichmentVersion
{
  return self->_enrichmentVersion;
}

- (NSManagedObjectID)parentPhotosHighlight
{
  return self->_parentPhotosHighlight;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (unsigned)mixedSharingCompositionKeyAssetRelationship
{
  return self->_mixedSharingCompositionKeyAssetRelationship;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPhotosHighlight, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetShared, 0);
  objc_storeStrong((id *)&self->_keyAssetShared, 0);
  objc_storeStrong((id *)&self->_dayGroupKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_yearKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_monthKeyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_keyAssetPrivate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionUserEdited, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescriptionShared, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionShared, 0);
  objc_storeStrong((id *)&self->_shortDateDescriptionPrivate, 0);
  objc_storeStrong((id *)&self->_dateDescriptionMixed, 0);
  objc_storeStrong((id *)&self->_dateDescriptionShared, 0);
  objc_storeStrong((id *)&self->_titleMixed, 0);
  objc_storeStrong((id *)&self->_titleShared, 0);
  objc_storeStrong((id *)&self->_subtitleMixed, 0);
  objc_storeStrong((id *)&self->_subtitleShared, 0);
  objc_storeStrong((id *)&self->_lastEnrichmentDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_verboseSmartDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

+ (id)_keyAssetObjectIDForHighlight:(id)a3 filter:(unsigned __int16)a4
{
  return (id)objc_msgSend(a1, "_choosePrivateOrSharedRelationshipForHighlight:givenFilter:privateHandler:sharedHandler:", a3, a4, &__block_literal_global_9753, &__block_literal_global_30_9754);
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = propertySetClassForPropertySet__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&propertySetClassForPropertySet__onceToken, &__block_literal_global_32);
  objc_msgSend((id)propertySetClassForPropertySet__propertySetClassByPropertySetName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)propertySetAccessorsByPropertySet
{
  if (propertySetAccessorsByPropertySet_onceToken != -1)
    dispatch_once(&propertySetAccessorsByPropertySet_onceToken, &__block_literal_global_34);
  return (id)propertySetAccessorsByPropertySet_accessorByPropertySetName;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetIdentifier"), "length");
  if ((v3 & 1) != 0 && v5)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetIdentifier"));
  v6 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetCore"), "length");
  if ((v3 & 2) != 0 && v6)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetCore"));
  v7 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetOnlyPrivate"), "length");
  if ((v3 & 4) != 0 && v7)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetOnlyPrivate"));
  v8 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetOnlyShared"), "length");
  if ((v3 & 8) != 0 && v8)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetOnlyShared"));
  v9 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetPrivateOrShared"), "length");
  if ((v3 & 0x10) != 0 && v9)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetPrivateOrShared"));
  v10 = objc_msgSend(CFSTR("PHPhotosHighlightPropertySetSharingSuggestions"), "length");
  if ((v3 & 0x20) != 0 && v10)
    objc_msgSend(v4, "addObject:", CFSTR("PHPhotosHighlightPropertySetSharingSuggestions"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHPhotosHighlight");
  return CFSTR("PHPhotosHighlight");
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("sharingComposition"), v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierCode
{
  return CFSTR("120");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_9737;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PHPhotosHighlight_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_9721 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_9721, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_9722, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PHPhotosHighlight;
  objc_msgSendSuper2(&v14, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "expressionType") == 3)
    {
      objc_msgSend(v8, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("enriched")) && !objc_msgSend(v9, "expressionType"))
    {
      objc_msgSend(v9, "constantValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "BOOLValue"))
        v12 = CFSTR("enrichmentState > %d");
      else
        v12 = CFSTR("enrichmentState == %d");
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v12, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)dateRangeTitleGenerator
{
  pl_dispatch_once();
  return (id)dateRangeTitleGenerator_pl_once_object_17;
}

+ (id)fetchHighlightsWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHPhotosHighlight, "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, a3);
}

+ (id)collageAssetsInverseRelationshipPredicateForDayHighlight:(id)a3 forHighlightFilter:(unsigned __int16)a4
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;

  v5 = a4;
  v6 = a3;
  v7 = v6;
  switch(v5)
  {
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "objectID");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("dayHighlightBeingCollageAssetsMixed");
      goto LABEL_7;
    case 1:
      v8 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "objectID");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("dayHighlightBeingCollageAssetsShared");
      goto LABEL_7;
    case 0:
      v8 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "objectID");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("dayHighlightBeingCollageAssetsPrivate");
LABEL_7:
      objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), v11, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v4;
}

+ (id)fetchParentHighlightForHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PHPhotosHighlight_fetchParentHighlightForHighlight_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchParentHighlightsForHighlights:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PHPhotosHighlight_fetchParentHighlightsForHighlights_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchChildHighlightsForHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PHPhotosHighlight_fetchChildHighlightsForHighlight_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchParentDayGroupHighlightForHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PHPhotosHighlight_fetchParentDayGroupHighlightForHighlight_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchChildDayGroupHighlightsForHighlight:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PHPhotosHighlight_fetchChildDayGroupHighlightsForHighlight_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssets:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        if (!v8)
        {
          objc_msgSend(v15, "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  if (v8)
  {
    objc_msgSend(a1, "_fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:photoLibrary:", v9, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v17;
}

+ (id)fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:photoLibrary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__9680;
    v20 = __Block_byref_object_dispose__9681;
    v21 = 0;
    objc_msgSend(v6, "photoLibraryForCurrentQueueQoS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__PHPhotosHighlight__fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v12[3] = &unk_1E35DEE50;
    v13 = v5;
    v14 = v7;
    v15 = buf;
    objc_msgSend(v8, "performBlockAndWait:", v12);
    v9 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_FAULT, "Can't fetch PhotosHighlight using assets uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    v9 = (id)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

+ (id)fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:photoLibrary:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__9680;
    v21 = __Block_byref_object_dispose__9681;
    v22 = 0;
    objc_msgSend(v6, "photoLibraryForCurrentQueueQoS");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__PHPhotosHighlight__fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke;
    v13[3] = &unk_1E35DEE50;
    v14 = v5;
    v9 = v8;
    v15 = v9;
    v16 = buf;
    objc_msgSend(v9, "performBlockAndWait:", v13);
    v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_FAULT, "Can't fetch trip highlights using assets uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    v10 = (id)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

+ (id)fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__9680;
    v21 = __Block_byref_object_dispose__9681;
    v22 = 0;
    objc_msgSend(v7, "photoLibraryForCurrentQueueQoS");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__PHPhotosHighlight_fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs_options___block_invoke;
    v13[3] = &unk_1E35DEE50;
    v14 = v5;
    v15 = v8;
    v16 = buf;
    objc_msgSend(v9, "performBlockAndWait:", v13);
    v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLPhotoKitGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_FAULT, "Can't fetch PhotosHighlight using moment uuids because no PHPhotoLibrary specified", buf, 2u);
    }

    v10 = (id)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

+ (id)fetchSharedLibrarySharingSuggestionsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v4;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setSharingFilter:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "internalPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0 || %K > 0"), CFSTR("photoAssetsSuggestedByPhotosCount"), CFSTR("videoAssetsSuggestedByPhotosCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v10);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("kind"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v17);

  v23 = CFSTR("PHPhotosHighlightPropertySetSharingSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFetchPropertySets:", v18);

  +[PHPhotosHighlight fetchHighlightsWithOptions:](PHPhotosHighlight, "fetchHighlightsWithOptions:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)fetchHighlightsInSharedLibrarySharingSuggestions:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPhotosHighlight.m"), 1216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharingSuggestions != nil"));

  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", 0, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", 0, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("objectID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parentPhotosHighlight IN (%@)"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0 || %K > 0"), CFSTR("photoAssetsSuggestedByPhotosCount"), CFSTR("videoAssetsSuggestedByPhotosCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3528];
  v27[0] = v12;
  v27[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalSortDescriptors:", v19);

  objc_msgSend(v7, "setSharingFilter:", 0);
  v25 = CFSTR("PHPhotosHighlightPropertySetSharingSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFetchPropertySets:", v20);

  +[PHPhotosHighlight fetchHighlightsWithOptions:](PHPhotosHighlight, "fetchHighlightsWithOptions:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)fetchAllSharedLibrarySharingSuggestionHighlightsWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PHFetchOptions effectivePhotoLibraryForFetchOptions:object:](PHFetchOptions, "effectivePhotoLibraryForFetchOptions:object:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0 || %K > 0"), CFSTR("photoAssetsSuggestedByPhotosCount"), CFSTR("videoAssetsSuggestedByPhotosCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3528];
  v21[0] = v8;
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v15);

  objc_msgSend(v5, "setSharingFilter:", 0);
  v19 = CFSTR("PHPhotosHighlightPropertySetSharingSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFetchPropertySets:", v16);

  +[PHPhotosHighlight fetchHighlightsWithOptions:](PHPhotosHighlight, "fetchHighlightsWithOptions:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)processRecentHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "debugClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "processRecentHighlightsWithError:", &v10);
  v7 = v10;

  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Failed to process recent highlights with Error \"%@\".", buf, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)processUnprocessedMomentLocations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "debugClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "processUnprocessedMomentLocationsWithError:", &v10);
  v7 = v10;

  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Failed to process moments with unprocessed location with Error \"%@\".", buf, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)updateHighlightTitles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "debugClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "updateHighlightTitlesWithError:", &v10);
  v7 = v10;

  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Failed to update highlight titles with Error \"%@\".", buf, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)cleanupEmptyHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "debugClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "cleanupEmptyHighlightsWithError:", &v10);
  v7 = v10;

  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Failed to clean up empty highlights with Error \"%@\".", buf, 0xCu);
    }

  }
  return v6;
}

+ (BOOL)invalidateHighlightSubtitlesAndRegenerateHighlightTitles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719C0];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAssetsdClientForPhotoLibraryURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "debugClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:", &v10);
  v7 = v10;

  if (v7)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Failed to regenerate highlight titles with Error \"%@\".", buf, 0xCu);
    }

  }
  return v6;
}

void __80__PHPhotosHighlight_fetchPhotosHighlightUUIDByMomentUUIDForMomentUUIDs_options___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719E8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryForCurrentQueueQoS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "batchFetchPhotosHighlightUUIDsByMomentUUIDsWithMomentUUIDs:library:error:", v3, v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching highlight uuid by moment uuid: %@", buf, 0xCu);
    }
  }

}

void __82__PHPhotosHighlight__fetchTripHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D719E8], "batchFetchTripHighlightUUIDsByAssetUUIDsWithAssetUUIDs:library:error:", v2, v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = v4;
    v8 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Error batch fetching trip highlights by asset: %@", buf, 0xCu);
    }
  }

}

void __84__PHPhotosHighlight__fetchPhotosHighlightUUIDByAssetUUIDForAssetUUIDs_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D719E8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryForCurrentQueueQoS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "batchFetchPhotosHighlightUUIDsByAssetUUIDsWithAssetUUIDs:library:error:", v3, v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    PLPhotoKitGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Error batch fetching person groups by asset: %@", buf, 0xCu);
    }
  }

}

id __70__PHPhotosHighlight_fetchChildDayGroupHighlightsForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForChildrenDayGroupHighlightsForPhotosHighlight:options:](PHQuery, "queryForChildrenDayGroupHighlightsForPhotosHighlight:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __70__PHPhotosHighlight_fetchParentDayGroupHighlightForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForParentDayGroupHighlightForPhotosHighlight:options:](PHQuery, "queryForParentDayGroupHighlightForPhotosHighlight:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __62__PHPhotosHighlight_fetchChildHighlightsForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForChildrenHighlightsForPhotosHighlight:options:](PHQuery, "queryForChildrenHighlightsForPhotosHighlight:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __64__PHPhotosHighlight_fetchParentHighlightsForHighlights_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForParentHighlightsForPhotosHighlights:options:](PHQuery, "queryForParentHighlightsForPhotosHighlights:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __62__PHPhotosHighlight_fetchParentHighlightForHighlight_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForParentHighlightForPhotosHighlight:options:](PHQuery, "queryForParentHighlightForPhotosHighlight:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __89__PHPhotosHighlight_keyAssetInverseRelationshipPredicateForHighlight_forHighlightFilter___block_invoke_208(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  switch(objc_msgSend(v2, "kind"))
  {
    case 0u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("highlightBeingKeyAssetShared");
      goto LABEL_9;
    case 1u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("monthHighlightBeingKeyAssetShared");
      goto LABEL_9;
    case 2u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("yearHighlightBeingKeyAssetShared");
      goto LABEL_9;
    case 3u:
      v3 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v2, "objectID");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = CFSTR("dayGroupHighlightBeingKeyAssetShared");
LABEL_9:
      objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v11 = objc_msgSend(v2, "kind");
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "keyAssetInverseRelationshipPredicateForHighlight (sharedHandler): Unhandled highlight kind: %ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v8;
}

void __44__PHPhotosHighlight_dateRangeTitleGenerator__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D716B8]);
  v1 = (void *)dateRangeTitleGenerator_pl_once_object_17;
  dateRangeTitleGenerator_pl_once_object_17 = (uint64_t)v0;

}

void __57__PHPhotosHighlight_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[48];

  v4[47] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("localizedTitle");
  v4[1] = CFSTR("title");
  v4[2] = CFSTR("subtitle");
  v4[3] = CFSTR("dateDescription");
  v4[4] = CFSTR("smartDescription");
  v4[5] = CFSTR("verboseSmartDescription");
  v4[6] = CFSTR("endDate");
  v4[7] = CFSTR("startDate");
  v4[8] = CFSTR("visibilityState");
  v4[9] = CFSTR("kind");
  v4[10] = CFSTR("type");
  v4[11] = CFSTR("category");
  v4[12] = CFSTR("startTimeZoneOffset");
  v4[13] = CFSTR("endTimeZoneOffset");
  v4[14] = CFSTR("promotionScore");
  v4[15] = CFSTR("mood");
  v4[16] = CFSTR("estimatedAssetCount");
  v4[17] = CFSTR("assetsCount");
  v4[18] = CFSTR("extendedCount");
  v4[19] = CFSTR("summaryCount");
  v4[20] = CFSTR("enrichmentState");
  v4[21] = CFSTR("keyAssetPrivate");
  v4[22] = CFSTR("dayGroupKeyAssetPrivate");
  v4[23] = CFSTR("monthKeyAssetPrivate");
  v4[24] = CFSTR("yearKeyAssetPrivate");
  v4[25] = CFSTR("parentPhotosHighlight");
  v4[26] = CFSTR("titleShared");
  v4[27] = CFSTR("titleMixed");
  v4[28] = CFSTR("subtitleShared");
  v4[29] = CFSTR("subtitleMixed");
  v4[30] = CFSTR("dateDescriptionShared");
  v4[31] = CFSTR("dateDescriptionMixed");
  v4[32] = CFSTR("smartDescriptionShared");
  v4[33] = CFSTR("smartDescriptionMixed");
  v4[34] = CFSTR("assetsCountShared");
  v4[35] = CFSTR("extendedCountShared");
  v4[36] = CFSTR("summaryCountShared");
  v4[37] = CFSTR("keyAssetShared");
  v4[38] = CFSTR("dayGroupKeyAssetShared");
  v4[39] = CFSTR("monthKeyAssetShared");
  v4[40] = CFSTR("yearKeyAssetShared");
  v4[41] = CFSTR("verboseSmartDescriptionShared");
  v4[42] = CFSTR("verboseSmartDescriptionMixed");
  v4[43] = CFSTR("mixedSharingCompositionKeyAssetRelationship");
  v4[44] = CFSTR("sharingComposition");
  v4[45] = CFSTR("photoAssetsSuggestedByPhotosCount");
  v4[46] = CFSTR("videoAssetsSuggestedByPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 47);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_9722;
  transformValueExpression_forKeyPath___passThroughSet_9722 = v2;

}

void __33__PHPhotosHighlight_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PHEntityKeyMap *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  _QWORD v92[2];
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  _QWORD v104[2];
  _QWORD v105[3];
  const __CFString *v106;
  const __CFString *v107;
  _QWORD v108[52];
  _QWORD v109[54];

  v109[52] = *MEMORY[0x1E0C80C00];
  v43 = [PHEntityKeyMap alloc];
  v108[0] = CFSTR("objectID");
  v107 = CFSTR("objectID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v55;
  v108[1] = CFSTR("uuid");
  v106 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v54;
  v108[2] = CFSTR("title");
  v105[0] = CFSTR("localizedTitle");
  v105[1] = CFSTR("title");
  v105[2] = CFSTR("dateDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v53;
  v108[3] = CFSTR("subtitle");
  v104[0] = CFSTR("subtitle");
  v104[1] = CFSTR("smartDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v52;
  v108[4] = CFSTR("verboseSmartDescription");
  v103 = CFSTR("verboseSmartDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v51;
  v108[5] = CFSTR("endDate");
  v102 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v109[5] = v50;
  v108[6] = CFSTR("startDate");
  v101 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v109[6] = v49;
  v108[7] = CFSTR("visibilityState");
  v100 = CFSTR("visibilityState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v109[7] = v48;
  v108[8] = CFSTR("kind");
  v99 = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v109[8] = v47;
  v108[9] = CFSTR("type");
  v98 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v109[9] = v46;
  v108[10] = CFSTR("category");
  v97 = CFSTR("category");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v109[10] = v45;
  v108[11] = CFSTR("startTimeZoneOffset");
  v96 = CFSTR("startTimeZoneOffset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v109[11] = v44;
  v108[12] = CFSTR("endTimeZoneOffset");
  v95 = CFSTR("endTimeZoneOffset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v109[12] = v42;
  v108[13] = CFSTR("promotionScore");
  v94 = CFSTR("promotionScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v109[13] = v41;
  v108[14] = CFSTR("mood");
  v93 = CFSTR("mood");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v109[14] = v40;
  v108[15] = CFSTR("assetsCount");
  v92[0] = CFSTR("estimatedAssetCount");
  v92[1] = CFSTR("assetsCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v109[15] = v39;
  v108[16] = CFSTR("dayGroupAssetsCount");
  v91 = CFSTR("dayGroupAssetsCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v109[16] = v38;
  v108[17] = CFSTR("dayGroupExtendedAssetsCount");
  v90 = CFSTR("dayGroupExtendedAssetsCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v109[17] = v37;
  v108[18] = CFSTR("dayGroupSummaryAssetsCount");
  v89 = CFSTR("dayGroupSummaryAssetsCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v109[18] = v36;
  v108[19] = CFSTR("extendedCount");
  v88 = CFSTR("extendedCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v109[19] = v35;
  v108[20] = CFSTR("enrichmentState");
  v87 = CFSTR("enrichmentState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109[20] = v34;
  v108[21] = CFSTR("lastEnrichmentDate");
  v86 = CFSTR("lastEnrichmentDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v109[21] = v33;
  v108[22] = CFSTR("highlightVersion");
  v85 = CFSTR("highlightVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v109[22] = v32;
  v108[23] = CFSTR("enrichmentVersion");
  v84 = CFSTR("enrichmentVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v109[23] = v31;
  v108[24] = CFSTR("keyAssetPrivate");
  v83 = CFSTR("keyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v109[24] = v30;
  v108[25] = CFSTR("dayGroupKeyAssetPrivate");
  v82 = CFSTR("dayGroupKeyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v109[25] = v29;
  v108[26] = CFSTR("monthKeyAssetPrivate");
  v81 = CFSTR("monthKeyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v109[26] = v28;
  v108[27] = CFSTR("yearKeyAssetPrivate");
  v80 = CFSTR("yearKeyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v109[27] = v27;
  v108[28] = CFSTR("parentPhotosHighlight");
  v79 = CFSTR("parentPhotosHighlight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v109[28] = v26;
  v108[29] = CFSTR("verboseSmartDescriptionShared");
  v78 = CFSTR("verboseSmartDescriptionShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v109[29] = v25;
  v108[30] = CFSTR("verboseSmartDescriptionMixed");
  v77 = CFSTR("verboseSmartDescriptionMixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v109[30] = v24;
  v108[31] = CFSTR("subtitleShared");
  v76[0] = CFSTR("subtitleShared");
  v76[1] = CFSTR("smartDescriptionShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v109[31] = v23;
  v108[32] = CFSTR("subtitleMixed");
  v75[0] = CFSTR("subtitleMixed");
  v75[1] = CFSTR("smartDescriptionMixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v109[32] = v22;
  v108[33] = CFSTR("titleShared");
  v74[0] = CFSTR("titleShared");
  v74[1] = CFSTR("dateDescriptionShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v109[33] = v21;
  v108[34] = CFSTR("titleMixed");
  v73[0] = CFSTR("titleMixed");
  v73[1] = CFSTR("dateDescriptionMixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v109[34] = v20;
  v108[35] = CFSTR("dayGroupAssetsCountShared");
  v72 = CFSTR("dayGroupAssetsCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v109[35] = v19;
  v108[36] = CFSTR("dayGroupExtendedAssetsCountShared");
  v71 = CFSTR("dayGroupExtendedAssetsCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v109[36] = v18;
  v108[37] = CFSTR("dayGroupSummaryAssetsCountShared");
  v70 = CFSTR("dayGroupSummaryAssetsCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v109[37] = v17;
  v108[38] = CFSTR("extendedCountShared");
  v69 = CFSTR("extendedCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v109[38] = v16;
  v108[39] = CFSTR("summaryCount");
  v68 = CFSTR("summaryCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v109[39] = v15;
  v108[40] = CFSTR("summaryCountShared");
  v67 = CFSTR("summaryCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v109[40] = v14;
  v108[41] = CFSTR("keyAssetShared");
  v66 = CFSTR("keyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v109[41] = v13;
  v108[42] = CFSTR("dayGroupKeyAssetShared");
  v65 = CFSTR("dayGroupKeyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v109[42] = v12;
  v108[43] = CFSTR("monthKeyAssetShared");
  v64 = CFSTR("monthKeyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v109[43] = v0;
  v108[44] = CFSTR("yearKeyAssetShared");
  v63 = CFSTR("yearKeyAssetShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v109[44] = v1;
  v108[45] = CFSTR("mixedSharingCompositionKeyAssetRelationship");
  v62 = CFSTR("mixedSharingCompositionKeyAssetRelationship");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v109[45] = v2;
  v108[46] = CFSTR("assetsCountShared");
  v61 = CFSTR("assetsCountShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v109[46] = v3;
  v108[47] = CFSTR("sharingComposition");
  v60 = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v109[47] = v4;
  v108[48] = CFSTR("visibilityStateShared");
  v59 = CFSTR("visibilityStateShared");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v109[48] = v5;
  v108[49] = CFSTR("visibilityStateMixed");
  v58 = CFSTR("visibilityStateMixed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v109[49] = v6;
  v108[50] = CFSTR("photoAssetsSuggestedByPhotosCount");
  v57 = CFSTR("photoAssetsSuggestedByPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v109[50] = v7;
  v108[51] = CFSTR("videoAssetsSuggestedByPhotosCount");
  v56 = CFSTR("videoAssetsSuggestedByPhotosCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v109[51] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 52);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v43, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_9737;
  entityKeyMap_pl_once_object_15_9737 = v10;

}

void __54__PHPhotosHighlight_propertySetAccessorsByPropertySet__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHPhotosHighlightPropertySetIdentifier");
  v2[1] = CFSTR("PHPhotosHighlightPropertySetCore");
  v3[0] = CFSTR("self");
  v3[1] = CFSTR("self");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetAccessorsByPropertySet_accessorByPropertySetName;
  propertySetAccessorsByPropertySet_accessorByPropertySetName = v0;

}

void __52__PHPhotosHighlight_propertySetClassForPropertySet___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHPhotosHighlightPropertySetIdentifier");
  v2[1] = CFSTR("PHPhotosHighlightPropertySetCore");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertySetClassForPropertySet__propertySetClassByPropertySetName;
  propertySetClassForPropertySet__propertySetClassByPropertySetName = v0;

}

id __58__PHPhotosHighlight__keyAssetObjectIDForHighlight_filter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v3 = a2;
  switch(objc_msgSend(v3, "kind"))
  {
    case 0u:
      objc_msgSend(v3, "keyAssetShared");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1u:
      objc_msgSend(v3, "monthKeyAssetShared");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2u:
      objc_msgSend(v3, "yearKeyAssetShared");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3u:
      objc_msgSend(v3, "dayGroupKeyAssetShared");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v2 = (void *)v4;
      break;
    default:
      break;
  }

  return v2;
}

id __58__PHPhotosHighlight__keyAssetObjectIDForHighlight_filter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v3 = a2;
  switch(objc_msgSend(v3, "kind"))
  {
    case 0u:
      objc_msgSend(v3, "keyAssetPrivate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1u:
      objc_msgSend(v3, "monthKeyAssetPrivate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2u:
      objc_msgSend(v3, "yearKeyAssetPrivate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3u:
      objc_msgSend(v3, "dayGroupKeyAssetPrivate");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v2 = (void *)v4;
      break;
    default:
      break;
  }

  return v2;
}

@end
