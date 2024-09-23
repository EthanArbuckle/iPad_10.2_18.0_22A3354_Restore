@implementation NTPBFeedItem(FCFeedItem)

+ (id)baseKeysForFeedItemRecord
{
  if (qword_1ED0F8500 != -1)
    dispatch_once(&qword_1ED0F8500, &__block_literal_global_4_2);
  return (id)_MergedGlobals_186;
}

+ (id)baseKeysForArticleRecord
{
  if (qword_1ED0F8510 != -1)
    dispatch_once(&qword_1ED0F8510, &__block_literal_global_7_3);
  return (id)qword_1ED0F8508;
}

+ (id)keysForFeedItemAndArticleRecordWithRecordSource:()FCFeedItem
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NTPBFeedItem_FCFeedItem__keysForFeedItemAndArticleRecordWithRecordSource___block_invoke;
  v8[3] = &unk_1E463AA30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "fc_array:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)markAsEvergreen
{
  return objc_msgSend(a1, "setIsEvergreen:", 1);
}

- (uint64_t)applyConditionalScore:()FCFeedItem
{
  double v4;

  objc_msgSend(a1, "conditionalScore");
  if (v4 <= a2)
    v4 = a2;
  return objc_msgSend(a1, "setConditionalScore:", v4);
}

+ (id)keysForArticleRecordWithRecordSource:()FCFeedItem
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__NTPBFeedItem_FCFeedItem__keysForArticleRecordWithRecordSource___block_invoke;
  v8[3] = &unk_1E463AA30;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "fc_array:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)feedItemFromCKRecord:()FCFeedItem storefrontID:recordSource:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
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
  int v25;
  void *v26;
  int v27;
  void *v28;
  int64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v82;
  _QWORD v83[4];
  id v84;
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  char *v88;
  __int16 v89;
  int v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "identifierFromCKRecord:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D626D0]);
    objc_msgSend(v11, "setArticleID:", v10);
    objc_msgSend(v7, "objectForKey:", CFSTR("sourceChannelTagID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceChannelID:", v12);

    objc_msgSend(v7, "objectForKey:", CFSTR("parentIssueID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setParentIssueID:", v13);
    objc_msgSend(v11, "setIsEvergreen:", v13 != 0);
    objc_msgSend(v7, "objectForKey:", CFSTR("clusterID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClusterID:", v14);

    objc_msgSend(v7, "objectForKey:", CFSTR("contentType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentType:", FCArticleContentTypeFromString(v15));

    objc_msgSend(v7, "objectForKey:", CFSTR("scoresTopicTagIDs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v11, "setTopicIDs:", v17);

    objc_msgSend(v7, "objectForKey:", CFSTR("bodyTextLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBodyTextLength:", objc_msgSend(v18, "longLongValue"));

    objc_msgSend(v7, "objectForKey:", CFSTR("language"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLanguage:", v19);

    objc_msgSend(v7, "objectForKey:", CFSTR("role"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("role"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIsFeatured:", objc_msgSend(v21, "caseInsensitiveCompare:", CFSTR("feature")) == 0);

    }
    +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("allowedStorefrontIDs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("blockedStorefrontIDs"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v8;
    v25 = objc_msgSend(v22, "isContentBlockedInStorefrontID:withAllowedStorefrontIDs:blockedStorefrontIDs:", v8, v23, v24);

    if (v25)
      objc_msgSend(v11, "setIsFromBlockedStorefront:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("primaryAudience"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("MATURE"));

    if (v27)
      objc_msgSend(v11, "setIsExplicitContent:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("minNewsVersion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v28) << 32;

    if (v29)
      objc_msgSend(v11, "setMinimumNewsVersion:", v29 >> 32);
    objc_msgSend(v7, "objectForKey:", CFSTR("thumbnailMetadata"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedLongLongValue");

    if (v31)
      objc_msgSend(v11, "setHasThumbnail:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("thumbnailPerceptualHash"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setThumbnailPerceptualHash:", v32);

    objc_msgSend(v7, "objectForKey:", CFSTR("isPaid"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "BOOLValue");

    if (v34)
      objc_msgSend(v11, "setIsPaid:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("isBundlePaid"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "BOOLValue");

    if (v36)
      objc_msgSend(v11, "setIsBundlePaid:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("isSponsored"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");

    if (v38)
      objc_msgSend(v11, "setIsSponsored:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("videoURL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
      objc_msgSend(v11, "setHasVideo:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("videoStillImage"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
      objc_msgSend(v11, "setHasVideoStillImage:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("narrativeTrackFullURL"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      objc_msgSend(v11, "setHasAudioTrack:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntegerValue");

    if ((v43 & 0x20) != 0)
      objc_msgSend(v11, "setIsHiddenFromAutoFavorites:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue");

    if ((v45 & 0x800) != 0)
      objc_msgSend(v11, "setReduceVisibility:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "unsignedIntegerValue");

    if ((v47 & 0x2000) != 0)
      objc_msgSend(v11, "setReduceVisibilityForNonFollowers:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "unsignedIntegerValue");

    if ((v49 & 0x1000) != 0)
      objc_msgSend(v11, "setWebConverted:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("behaviorFlags"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "unsignedIntegerValue");

    if (v51 < 0)
      objc_msgSend(v11, "setIsAIGenerated:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("isFeature"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "BOOLValue");

    if (v53)
      objc_msgSend(v11, "setIsFeatureCandidate:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("isIssueOnly"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "BOOLValue");

    if (v55)
      objc_msgSend(v11, "setIsIssueOnly:", 1);
    objc_msgSend(v7, "objectForKey:", CFSTR("publisherArticleVersion"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPublisherArticleVersion:", objc_msgSend(v56, "longLongValue"));

    objc_msgSend(v9, "engagementFromCKRecord:", v7);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "globalCohorts");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGlobalCohorts:", v58);

    objc_msgSend(v57, "sourceChannelCohorts");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceChannelCohorts:", v59);

    objc_msgSend(v9, "conversionStatsFromCKRecord:", v7);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "globalConversionStats");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setGlobalConversionStats:", v61);

    objc_msgSend(v60, "channelConversionStats");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setChannelConversionStats:", v62);

    objc_msgSend(v9, "articleTagMetadataFromCKRecord:", v7);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "channelTagMetadata");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setChannelTagMetadata:", v64);

    v65 = objc_alloc(MEMORY[0x1E0D625B8]);
    objc_msgSend(v7, "objectForKey:", CFSTR("expirationData"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v65, "initWithData:", v66);
    objc_msgSend(v11, "setExpirationData:", v67);

    objc_msgSend(v63, "topicTagMetadatas");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "articleTopicsFromCKRecord:engagement:conversionStats:tagMetadata:", v7, v57, v60, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTopics:", v69);

    objc_msgSend(v7, "recordType");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = objc_msgSend(v70, "isEqualToString:", CFSTR("Article"));

    if ((_DWORD)v69)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("publishDate"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPublishDateMilliseconds:", objc_msgSend(v71, "fc_millisecondTimeIntervalSince1970"));

      objc_msgSend(v7, "objectForKey:", CFSTR("halfLifeMillis"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFeedHalfLifeMilliseconds:", objc_msgSend(v72, "unsignedLongLongValue"));
    }
    else
    {
      objc_msgSend(v7, "recordType");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("FeedItemAndArticle"));

      if (v74)
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("tagID"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFeedID:", v75);

        objc_msgSend(v7, "objectForKey:", CFSTR("order"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setOrder:", objc_msgSend(v76, "unsignedLongLongValue"));

        objc_msgSend(v7, "objectForKey:", CFSTR("publishDateMillis"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPublishDateMilliseconds:", objc_msgSend(v77, "unsignedLongLongValue"));

        objc_msgSend(v7, "objectForKey:", CFSTR("tagHalfLifeMillis"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFeedHalfLifeMilliseconds:", objc_msgSend(v78, "unsignedLongLongValue"));

        objc_msgSend(v7, "objectForKey:", CFSTR("userFeedback"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "doubleValue");
        objc_msgSend(v11, "setGlobalUserFeedback:");
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected record type for FeedItem: %@"), v7);
        *(_DWORD *)buf = 136315906;
        v86 = "+[NTPBFeedItem(FCFeedItem) feedItemFromCKRecord:storefrontID:recordSource:]";
        v87 = 2080;
        v88 = "FCFeedItem.m";
        v89 = 1024;
        v90 = 287;
        v91 = 2114;
        v92 = v72;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }

LABEL_45:
    objc_msgSend(v7, "objectForKey:", CFSTR("float16TitleEncoding"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFloat16TitleEncoding:", v79);

    objc_msgSend(v7, "objectForKey:", CFSTR("float16FullBodyEncoding"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFloat16FullBodyEncoding:", v80);

    v8 = v82;
    goto LABEL_46;
  }
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke;
  v83[3] = &unk_1E463B350;
  v84 = v7;
  __75__NTPBFeedItem_FCFeedItem__feedItemFromCKRecord_storefrontID_recordSource___block_invoke((uint64_t)v83);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v84;
LABEL_46:

  return v11;
}

- (BOOL)isEqual:()FCFeedItem
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(a1, "feedID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
  {
    v10 = (void *)MEMORY[0x1E0DE7910];
    objc_msgSend(a1, "articleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12))
    {
      v13 = objc_msgSend(a1, "order");
      v14 = v13 == objc_msgSend(v6, "order");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)hash
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "feedID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  objc_msgSend(a1, "articleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  v6 = v5 ^ objc_msgSend(a1, "order");

  return v6;
}

- (uint64_t)compareOrder:()FCFeedItem
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "order");
  v6 = objc_msgSend(v4, "order");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (uint64_t)compareOrderDescending:()FCFeedItem
{
  unint64_t v4;
  unint64_t v5;

  v4 = objc_msgSend(a3, "order");
  v5 = objc_msgSend(a1, "order");
  if (v4 < v5)
    return -1;
  else
    return v4 > v5;
}

- (uint64_t)compareGlobalUserFeedback:()FCFeedItem
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "globalUserFeedback");
  v6 = v5;
  objc_msgSend(v4, "globalUserFeedback");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (uint64_t)compareGlobalUserFeedbackDescending:()FCFeedItem
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "globalUserFeedback");
  v5 = v4;
  objc_msgSend(a1, "globalUserFeedback");
  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (void)enumerateFeaturesWithBlock:()FCFeedItem
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "topicIDs", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          +[FCFeedItemFeature featureForTopicID:](FCFeedItemFeature, "featureForTopicID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (uint64_t)hasFeature:()FCFeedItem
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 2)
  {
    v8 = 1;
  }
  else if (v5 == 1)
  {
    objc_msgSend(a1, "topicIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topicID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p: %@"), a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isANF
{
  return objc_msgSend(a1, "contentType") == 2;
}

- (id)scoreProfile
{
  return objc_getAssociatedObject(a1, (const void *)FCFeedItemScoreProfileKey);
}

- (void)setScoreProfile:()FCFeedItem
{
  objc_setAssociatedObject(a1, (const void *)FCFeedItemScoreProfileKey, a3, (void *)0x301);
}

- (uint64_t)publishDate
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", objc_msgSend(a1, "publishDateMilliseconds"));
}

- (uint64_t)mustShow
{
  return 0;
}

- (uint64_t)publisherArticleVersion
{
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
    v2 = 136315906;
    v3 = "-[NTPBFeedItem(FCFeedItem) publisherArticleVersion]";
    v4 = 2080;
    v5 = "FCFeedItem.m";
    v6 = 1024;
    v7 = 436;
    v8 = 2114;
    v9 = v1;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2, 0x26u);

  }
  return 0;
}

- (uint64_t)canBePurchased
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case unsupported"));
    v4 = 136315906;
    v5 = "-[NTPBFeedItem(FCFeedItem) canBePurchased]";
    v6 = 2080;
    v7 = "FCFeedItem.m";
    v8 = 1024;
    v9 = 442;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

  }
  if ((objc_msgSend(a1, "isPaid") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isBundlePaid");
}

- (void)enumerateTopicCohortsWithBlock:()FCFeedItem
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "topics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__NTPBFeedItem_FCFeedItem__enumerateTopicCohortsWithBlock___block_invoke_2;
    v7[3] = &unk_1E4645FF0;
    v8 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

- (void)enumerateTopicConversionStatsWithBlock:()FCFeedItem
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "topics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "topics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__NTPBFeedItem_FCFeedItem__enumerateTopicConversionStatsWithBlock___block_invoke_2;
    v7[3] = &unk_1E4645FF0;
    v8 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

- (void)addSurfacedByArticleListID:()FCFeedItem
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("LX")))
    objc_msgSend(a1, "setIsCoread:", 1);
  objc_msgSend(a1, "addSurfacedByArticleListID2:", v4);

}

@end
