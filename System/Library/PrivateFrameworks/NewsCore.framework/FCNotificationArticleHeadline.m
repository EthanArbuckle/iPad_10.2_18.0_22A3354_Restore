@implementation FCNotificationArticleHeadline

- (FCNotificationArticleHeadline)initWithArticlePayload:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCNotificationArticleHeadline *v12;
  FCNotificationArticleHeadline *v13;
  void *v14;
  uint64_t v15;
  FCChannelProviding *sourceChannel;
  uint64_t v17;
  void *sourceName;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  FCNotificationArticleHeadline *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  NSString *referencedArticleID;
  uint64_t v34;
  NSString *clusterID;
  uint64_t v36;
  NSString *title;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  NSDate *publishDate;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  NSDate *lastModifiedDate;
  void *v48;
  void *v49;
  uint64_t v50;
  NSString *changeEtag;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  void *v56;
  unint64_t v57;
  double v58;
  double v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  FCHeadlineThumbnail *thumbnail;
  uint64_t v64;
  NSString *flintDocumentUrlString;
  uint64_t v66;
  NSData *flintDocumentPrefetchedData;
  uint64_t v68;
  NSArray *flintFontResourceIDs;
  uint64_t v70;
  NSString *shortExcerpt;
  uint64_t v72;
  NSString *accessoryText;
  uint64_t v74;
  NSArray *topicIDs;
  uint64_t v76;
  NSNumber *globalCohortScoresCTR;
  uint64_t v78;
  NSNumber *channelCohortScoresCTR;
  uint64_t v80;
  NSArray *topicCohortScoresCTRs;
  void *v82;
  uint64_t v83;
  NSArray *iAdCategories;
  uint64_t v85;
  NSArray *iAdKeywords;
  uint64_t v87;
  NSArray *iAdSectionIDs;
  uint64_t v89;
  NSArray *relatedArticleIDs;
  uint64_t v91;
  NSArray *moreFromPublisherArticleIDs;
  uint64_t v93;
  NSArray *publisherSpecifiedArticleIDs;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  FCAssetHandle *articleRecirculationConfigAssetHandle;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  NSURL **p_videoURL;
  void *v108;
  float v109;
  void *v110;
  __int16 v111;
  void *v112;
  void *v113;
  void *v114;
  NSString *primaryAudience;
  FCCoverArt *coverArt;
  NSArray *blockedStorefrontIDs;
  NSArray *v118;
  NSArray *allowedStorefrontIDs;
  void *v120;
  FCTopStoriesStyleConfiguration *storyStyle;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  unint64_t v127;
  void *v128;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  objc_super v136;
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  char *v140;
  __int16 v141;
  int v142;
  __int16 v143;
  void *v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v130 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articlePayload");
    *(_DWORD *)buf = 136315906;
    v138 = "-[FCNotificationArticleHeadline initWithArticlePayload:sourceChannel:assetManager:]";
    v139 = 2080;
    v140 = "FCNotificationArticleHeadline.m";
    v141 = 1024;
    v142 = 137;
    v143 = 2114;
    v144 = v130;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v136.receiver = self;
  v136.super_class = (Class)FCNotificationArticleHeadline;
  v12 = -[FCHeadline init](&v136, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_52;
  objc_storeStrong((id *)&v12->_articlePayload, a3);
  objc_storeStrong((id *)&v13->_assetManager, a5);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("aid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || objc_msgSend(0, "length"))
  {
    v134 = v10;
    v135 = v11;
    if (v10)
    {
      v15 = objc_msgSend(v10, "copy");
      sourceChannel = v13->_sourceChannel;
      v13->_sourceChannel = (FCChannelProviding *)v15;

      objc_msgSend(v10, "name");
      v17 = objc_claimAutoreleasedReturnValue();
      sourceName = v13->_sourceName;
      v13->_sourceName = (NSString *)v17;
    }
    else
    {
      v132 = v14;
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cid"));
      sourceName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pn"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pl2"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pm2"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetHandleForURL:lifetimeHint:", v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }
      if (objc_msgSend(v21, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "assetHandleForURL:lifetimeHint:", v26, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = 0;
      }
      v28 = objc_msgSend(sourceName, "length");
      if (v28)
        v29 = -[FCTag initChannelFromNotificationWithIdentifier:name:nameImageAssetHandle:nameImageMaskAssetHandle:]([FCTag alloc], "initChannelFromNotificationWithIdentifier:name:nameImageAssetHandle:nameImageMaskAssetHandle:", sourceName, v19, v23, v27);
      else
        v29 = 0;
      objc_storeStrong((id *)&v13->_sourceChannel, v29);
      if (v28)

      v30 = v13->_sourceName;
      v13->_sourceName = (NSString *)v19;

      v11 = v135;
      v14 = v132;
    }

    objc_storeStrong((id *)&v13->_identifier, v14);
    objc_storeStrong((id *)&v13->_articleID, v14);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isf"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_featureCandidate = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ra"));
    v32 = objc_claimAutoreleasedReturnValue();
    referencedArticleID = v13->_referencedArticleID;
    v13->_referencedArticleID = (NSString *)v32;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cli"));
    v34 = objc_claimAutoreleasedReturnValue();
    clusterID = v13->_clusterID;
    v13->_clusterID = (NSString *)v34;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ti"));
    v36 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v36;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pd"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", (unint64_t)v40);
    v41 = objc_claimAutoreleasedReturnValue();
    publishDate = v13->_publishDate;
    v13->_publishDate = (NSDate *)v41;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ts"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    v45 = v44;

    objc_msgSend(MEMORY[0x1E0C99D68], "fc_dateWithMillisecondTimeIntervalSince1970:", (unint64_t)v45);
    v46 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v13->_lastModifiedDate;
    v13->_lastModifiedDate = (NSDate *)v46;

    objc_storeStrong((id *)&v13->_lastFetchedDate, v13->_lastModifiedDate);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("prev"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_publisherArticleVersion = objc_msgSend(v48, "unsignedLongLongValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rev"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_backendArticleVersion = objc_msgSend(v49, "unsignedLongLongValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("etag"));
    v50 = objc_claimAutoreleasedReturnValue();
    changeEtag = v13->_changeEtag;
    v13->_changeEtag = (NSString *)v50;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tnff"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_thumbnailFocalFrame.origin.x = FCCGRectFromBuffer(objc_msgSend(v52, "unsignedLongLongValue"));
    v13->_thumbnailFocalFrame.origin.y = v53;
    v13->_thumbnailFocalFrame.size.width = v54;
    v13->_thumbnailFocalFrame.size.height = v55;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tnm"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "unsignedLongLongValue");
    if (v57)
      v58 = (double)((v57 >> 8) & 0xFFFFFFF);
    else
      v58 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v57)
      v59 = (double)(v57 >> 36);
    else
      v59 = *MEMORY[0x1E0C9D820];

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tn2"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNotificationArticleHeadline generateThumbnailAssetHandleForUrlString:withAssetManager:](v13, "generateThumbnailAssetHandleForUrlString:withAssetManager:", v60, v11);
    v61 = objc_claimAutoreleasedReturnValue();

    v133 = (void *)v61;
    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v61, v59, v58);
    v62 = objc_claimAutoreleasedReturnValue();
    thumbnail = v13->_thumbnail;
    v13->_thumbnail = (FCHeadlineThumbnail *)v62;

    v13->_hasThumbnail = v13->_thumbnail != 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fau"));
    v64 = objc_claimAutoreleasedReturnValue();
    flintDocumentUrlString = v13->_flintDocumentUrlString;
    v13->_flintDocumentUrlString = (NSString *)v64;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fdad"));
    v66 = objc_claimAutoreleasedReturnValue();
    flintDocumentPrefetchedData = v13->_flintDocumentPrefetchedData;
    v13->_flintDocumentPrefetchedData = (NSData *)v66;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ffr"));
    v68 = objc_claimAutoreleasedReturnValue();
    flintFontResourceIDs = v13->_flintFontResourceIDs;
    v13->_flintFontResourceIDs = (NSArray *)v68;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ex"));
    v70 = objc_claimAutoreleasedReturnValue();
    shortExcerpt = v13->_shortExcerpt;
    v13->_shortExcerpt = (NSString *)v70;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("at"));
    v72 = objc_claimAutoreleasedReturnValue();
    accessoryText = v13->_accessoryText;
    v13->_accessoryText = (NSString *)v72;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tt"));
    v74 = objc_claimAutoreleasedReturnValue();
    topicIDs = v13->_topicIDs;
    v13->_topicIDs = (NSArray *)v74;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("gcs"));
    v76 = objc_claimAutoreleasedReturnValue();
    globalCohortScoresCTR = v13->_globalCohortScoresCTR;
    v13->_globalCohortScoresCTR = (NSNumber *)v76;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ccs"));
    v78 = objc_claimAutoreleasedReturnValue();
    channelCohortScoresCTR = v13->_channelCohortScoresCTR;
    v13->_channelCohortScoresCTR = (NSNumber *)v78;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tcs"));
    v80 = objc_claimAutoreleasedReturnValue();
    topicCohortScoresCTRs = v13->_topicCohortScoresCTRs;
    v13->_topicCohortScoresCTRs = (NSArray *)v80;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iss"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_sponsored = objc_msgSend(v82, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iac"));
    v83 = objc_claimAutoreleasedReturnValue();
    iAdCategories = v13->_iAdCategories;
    v13->_iAdCategories = (NSArray *)v83;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iak"));
    v85 = objc_claimAutoreleasedReturnValue();
    iAdKeywords = v13->_iAdKeywords;
    v13->_iAdKeywords = (NSArray *)v85;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iast"));
    v87 = objc_claimAutoreleasedReturnValue();
    iAdSectionIDs = v13->_iAdSectionIDs;
    v13->_iAdSectionIDs = (NSArray *)v87;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ra2"));
    v89 = objc_claimAutoreleasedReturnValue();
    relatedArticleIDs = v13->_relatedArticleIDs;
    v13->_relatedArticleIDs = (NSArray *)v89;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mfp"));
    v91 = objc_claimAutoreleasedReturnValue();
    moreFromPublisherArticleIDs = v13->_moreFromPublisherArticleIDs;
    v13->_moreFromPublisherArticleIDs = (NSArray *)v91;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("psa"));
    v93 = objc_claimAutoreleasedReturnValue();
    publisherSpecifiedArticleIDs = v13->_publisherSpecifiedArticleIDs;
    v13->_publisherSpecifiedArticleIDs = (NSArray *)v93;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ct"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_contentType = ArticleContentTypeFromString(v95);

    FCCKLocalizedArticleArticleRecirculationConfigurationKey();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v14;
    +[FCRecordFieldURLProtocol URLForRecordID:fieldName:](FCRecordFieldURLProtocol, "URLForRecordID:fieldName:", v14, v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "assetHandleForURL:lifetimeHint:", v98, 2);
    v99 = objc_claimAutoreleasedReturnValue();
    articleRecirculationConfigAssetHandle = v13->_articleRecirculationConfigAssetHandle;
    v13->_articleRecirculationConfigAssetHandle = (FCAssetHandle *)v99;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cu"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "length");
    if (v102)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v103 = 0;
    }
    objc_storeStrong((id *)&v13->_contentURL, v103);
    if (v102)

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vu"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "length");
    if (v105)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v104);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v106 = 0;
    }
    p_videoURL = &v13->_videoURL;
    objc_storeStrong((id *)&v13->_videoURL, v106);
    if (v105)

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vd"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "floatValue");
    v13->_videoDuration = v109;

    v13->_webEmbedsEnabled = 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bf"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "unsignedLongLongValue");

    v13->_needsRapidUpdates = v111 & 1;
    v13->_disableTapToChannel = (v111 & 2) != 0;
    v13->_pressRelease = (v111 & 0x10) != 0;
    v13->_hiddenFromAutoFavorites = (v111 & 0x20) != 0;
    v13->_showBundleSoftPaywall = (v111 & 0x80) != 0;
    v13->_useTransparentNavigationBar = HIBYTE(v111) & 1;
    v13->_disableBookmarking = (v111 & 0x200) != 0;
    v13->_hideModalCloseButton = (v111 & 0x400) != 0;
    v13->_reduceVisibility = (v111 & 0x800) != 0;
    v13->_reduceVisibilityForNonFollowers = (v111 & 0x2000) != 0;
    v13->_webConverted = (v111 & 0x1000) != 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("mnv"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_minimumNewsVersion = +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v112);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ip"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_paid = objc_msgSend(v113, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ibp"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_bundlePaid = objc_msgSend(v114, "BOOLValue");

    primaryAudience = v13->_primaryAudience;
    v13->_primaryAudience = 0;

    coverArt = v13->_coverArt;
    v13->_coverArt = 0;

    v13->_isDraft = 0;
    v13->_isLocalDraft = 0;
    blockedStorefrontIDs = v13->_blockedStorefrontIDs;
    v118 = (NSArray *)MEMORY[0x1E0C9AA60];
    v13->_blockedStorefrontIDs = (NSArray *)MEMORY[0x1E0C9AA60];

    allowedStorefrontIDs = v13->_allowedStorefrontIDs;
    v13->_allowedStorefrontIDs = v118;

    v13->_deleted = 0;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("st"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_storyType = FCArticleStoryTypeForStoryTypeString(v120);

    storyStyle = v13->_storyStyle;
    v13->_storyStyle = 0;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("btl"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "unsignedLongLongValue");

    if (v123 <= 0)
      v124 = -1;
    else
      v124 = v123;
    v13->_bodyTextLength = v124;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rl"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = PBArticleRoleFromString(v125) - 1;
    if (v126 < 8)
      v127 = v126 + 1;
    else
      v127 = 0;
    v13->_role = v127;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isi"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_issueOnly = objc_msgSend(v128, "BOOLValue");

    if (*p_videoURL
      && -[FCNotificationArticleHeadline contentType](v13, "contentType") != 2
      && *p_videoURL
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v131 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The videoURL field should only be set for flint articles"));
      *(_DWORD *)buf = 136315906;
      v138 = "-[FCNotificationArticleHeadline initWithArticlePayload:sourceChannel:assetManager:]";
      v139 = 2080;
      v140 = "FCNotificationArticleHeadline.m";
      v141 = 1024;
      v142 = 280;
      v143 = 2114;
      v144 = v131;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v10 = v134;
    v11 = v135;
LABEL_52:
    v25 = v13;
    goto LABEL_53;
  }
  v24 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "Article ID is empty in payload", buf, 2u);
  }
  v25 = 0;
LABEL_53:

  return v25;
}

- (id)contentWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FCANFContent *v15;
  void *v16;
  void *v17;
  FCANFContent *v18;
  FCArticleContent *v19;
  void *v20;
  FCArticleContent *v21;
  void *v22;
  NSObject *v24;
  unint64_t v25;
  __CFString *v26;
  int v27;
  unint64_t v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[FCNotificationArticleHeadline contentType](self, "contentType", a3) != 2)
  {
    v22 = (void *)FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      v24 = v22;
      v25 = -[FCNotificationArticleHeadline contentType](self, "contentType");
      -[FCNotificationArticleHeadline articleID](self, "articleID");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = 134218242;
      v28 = v25;
      v29 = 2114;
      v30 = v26;
      _os_log_error_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_ERROR, "Invalid content type: %lu for article ID: %{public}@", (uint8_t *)&v27, 0x16u);

    }
    goto LABEL_10;
  }
  -[FCNotificationArticleHeadline flintDocumentUrlString](self, "flintDocumentUrlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
LABEL_10:
    v21 = 0;
    return v21;
  }
  v6 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[FCNotificationArticleHeadline articleID](self, "articleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCNotificationArticleHeadline flintDocumentPrefetchedData](self, "flintDocumentPrefetchedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("with");
    if (!v9)
      v10 = CFSTR("without");
    v27 = 138543618;
    v28 = (unint64_t)v8;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Creating content for article %{public}@ %{public}@ prefetched ANF JSON", (uint8_t *)&v27, 0x16u);

  }
  -[FCNotificationArticleHeadline flintDocumentUrlString](self, "flintDocumentUrlString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationArticleHeadline flintDocumentPrefetchedData](self, "flintDocumentPrefetchedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationArticleHeadline assetManager](self, "assetManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationArticleHeadline generateFlintDocumentAssetHandleForUrlString:prefetchedData:withAssetManager:](self, "generateFlintDocumentAssetHandleForUrlString:prefetchedData:withAssetManager:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [FCANFContent alloc];
  -[FCNotificationArticleHeadline articleID](self, "articleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNotificationArticleHeadline flintFontResourceIDs](self, "flintFontResourceIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCANFContent initWithIdentifier:mainDocumentAssetHandle:fontResourceIDs:](v15, "initWithIdentifier:mainDocumentAssetHandle:fontResourceIDs:", v16, v14, v17);

  v19 = [FCArticleContent alloc];
  -[FCNotificationArticleHeadline articleID](self, "articleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[FCArticleContent initWithArticleID:anfContent:](v19, "initWithArticleID:anfContent:", v20, v18);

  return v21;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  if (-[FCNotificationArticleHeadline contentType](self, "contentType") == 2)
  {
    -[FCNotificationArticleHeadline flintDocumentUrlString](self, "flintDocumentUrlString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }
  -[FCNotificationArticleHeadline sourceChannel](self, "sourceChannel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 && v4;
}

- (id)generateThumbnailAssetHandleForUrlString:(id)a3 withAssetManager:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "assetHandleForCKAssetURLString:lifetimeHint:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)generateFlintDocumentAssetHandleForUrlString:(id)a3 prefetchedData:(id)a4 withAssetManager:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v9, "assetHandleForCKAssetURLString:prefetchedData:unzipIfNeeded:lifetimeHint:", v7, v8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)sourceFeedID
{
  return 0;
}

- (unint64_t)halfLife
{
  return 0;
}

- (NSString)publisherID
{
  void *v2;
  void *v3;

  -[FCNotificationArticleHeadline sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return -[FCNotificationArticleHeadline contentType](self, "contentType") == 2;
}

- (BOOL)hasVideo
{
  void *v2;
  BOOL v3;

  -[FCNotificationArticleHeadline videoURL](self, "videoURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D625D8]);
  -[FCNotificationArticleHeadline globalCohortScoresCTR](self, "globalCohortScoresCTR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "setClicks:");

  objc_msgSend(v3, "setImpressions:", 1.0);
  objc_msgSend(v3, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
  v5 = objc_alloc_init(MEMORY[0x1E0D625E0]);
  objc_msgSend(v5, "addCohorts:", v3);

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v5;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D625D8]);
  -[FCNotificationArticleHeadline channelCohortScoresCTR](self, "channelCohortScoresCTR");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "setClicks:");

  objc_msgSend(v3, "setImpressions:", 1.0);
  objc_msgSend(v3, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
  v5 = objc_alloc_init(MEMORY[0x1E0D625E0]);
  objc_msgSend(v5, "addCohorts:", v3);

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v5;
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[FCNotificationArticleHeadline topicCohortScoresCTRs](self, "topicCohortScoresCTRs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = objc_alloc_init(MEMORY[0x1E0D625E0]);
        v11 = objc_alloc_init(MEMORY[0x1E0D625D8]);
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(v11, "setClicks:");
        objc_msgSend(v11, "setImpressions:", 1.0);
        objc_msgSend(v11, "setType:", -[FCNotificationArticleHeadline isPaid](self, "isPaid"));
        objc_msgSend(v10, "addCohorts:", v11);
        objc_msgSend(v4, "addObject:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  -[FCNotificationArticleHeadline topicIDs](self, "topicIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = objc_msgSend(v4, "count");

  if (v13 == v14)
  {
    -[FCNotificationArticleHeadline topicIDs](self, "topicIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__FCNotificationArticleHeadline_enumerateTopicCohortsWithBlock___block_invoke;
    v18[3] = &unk_1E463C5B8;
    v19 = v16;
    objc_msgSend(v15, "fc_enumerateSideBySideWithArray:reverse:block:", v4, 0, v18);

  }
}

uint64_t __64__FCNotificationArticleHeadline_enumerateTopicCohortsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return 0;
}

- (NSArray)topics
{
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 888);
}

- (id)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 896);
}

- (id)referencedArticleID
{
  return self->_referencedArticleID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 928);
}

- (id)primaryAudience
{
  return self->_primaryAudience;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (id)sourceChannel
{
  return self->_sourceChannel;
}

- (void)setSourceChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (id)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (CGRect)thumbnailFocalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_thumbnailFocalFrame.origin.x;
  y = self->_thumbnailFocalFrame.origin.y;
  width = self->_thumbnailFocalFrame.size.width;
  height = self->_thumbnailFocalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (id)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (void)setThumbnailLQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLQ, a3);
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (id)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (void)setThumbnailMedium:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailMedium, a3);
}

- (id)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (void)setThumbnailHQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailHQ, a3);
}

- (id)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (void)setThumbnailUltraHQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, a3);
}

- (id)shortExcerpt
{
  return self->_shortExcerpt;
}

- (void)setShortExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (id)accessoryText
{
  return self->_accessoryText;
}

- (void)setAccessoryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (id)contentURL
{
  return self->_contentURL;
}

- (id)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (id)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (id)videoURL
{
  return self->_videoURL;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (BOOL)isSponsored
{
  return self->_sponsored;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (id)iAdKeywords
{
  return self->_iAdKeywords;
}

- (id)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isLocalDraft
{
  return self->_isLocalDraft;
}

- (id)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (id)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (BOOL)isFeatureCandidate
{
  return self->_featureCandidate;
}

- (id)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (id)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (id)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (id)articleRecirculationConfigAssetHandle
{
  return self->_articleRecirculationConfigAssetHandle;
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (id)storyStyle
{
  return self->_storyStyle;
}

- (void)setStoryStyle:(id)a3
{
  objc_storeStrong((id *)&self->_storyStyle, a3);
}

- (BOOL)needsRapidUpdates
{
  return self->_needsRapidUpdates;
}

- (BOOL)disableTapToChannel
{
  return self->_disableTapToChannel;
}

- (BOOL)isBoundToContext
{
  return self->_boundToContext;
}

- (BOOL)isHiddenFromFeeds
{
  return self->_hiddenFromFeeds;
}

- (BOOL)isPressRelease
{
  return self->_pressRelease;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (id)coverArt
{
  return self->_coverArt;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)showBundleSoftPaywall
{
  return self->_showBundleSoftPaywall;
}

- (BOOL)useTransparentNavigationBar
{
  return self->_useTransparentNavigationBar;
}

- (BOOL)disableBookmarking
{
  return self->_disableBookmarking;
}

- (BOOL)hideModalCloseButton
{
  return self->_hideModalCloseButton;
}

- (BOOL)reduceVisibility
{
  return self->_reduceVisibility;
}

- (BOOL)reduceVisibilityForNonFollowers
{
  return self->_reduceVisibilityForNonFollowers;
}

- (BOOL)webConverted
{
  return self->_webConverted;
}

- (id)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (id)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (id)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (id)surfacedByArticleListIDs
{
  return self->_surfacedByArticleListIDs;
}

- (void)setSurfacedByArticleListIDs:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, a3);
}

- (id)narrativeTrack
{
  return self->_narrativeTrack;
}

- (id)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (id)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (id)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (id)routeURL
{
  return self->_routeURL;
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (NSDictionary)articlePayload
{
  return self->_articlePayload;
}

- (void)setArticlePayload:(id)a3
{
  objc_storeStrong((id *)&self->_articlePayload, a3);
}

- (NSString)flintDocumentUrlString
{
  return self->_flintDocumentUrlString;
}

- (void)setFlintDocumentUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_flintDocumentUrlString, a3);
}

- (NSData)flintDocumentPrefetchedData
{
  return self->_flintDocumentPrefetchedData;
}

- (void)setFlintDocumentPrefetchedData:(id)a3
{
  objc_storeStrong((id *)&self->_flintDocumentPrefetchedData, a3);
}

- (NSArray)flintFontResourceIDs
{
  return self->_flintFontResourceIDs;
}

- (void)setFlintFontResourceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_flintFontResourceIDs, a3);
}

- (NSString)changeEtag
{
  return self->_changeEtag;
}

- (void)setChangeEtag:(id)a3
{
  objc_storeStrong((id *)&self->_changeEtag, a3);
}

- (NSNumber)globalCohortScoresCTR
{
  return self->_globalCohortScoresCTR;
}

- (void)setGlobalCohortScoresCTR:(id)a3
{
  objc_storeStrong((id *)&self->_globalCohortScoresCTR, a3);
}

- (NSNumber)channelCohortScoresCTR
{
  return self->_channelCohortScoresCTR;
}

- (void)setChannelCohortScoresCTR:(id)a3
{
  objc_storeStrong((id *)&self->_channelCohortScoresCTR, a3);
}

- (NSArray)topicCohortScoresCTRs
{
  return self->_topicCohortScoresCTRs;
}

- (void)setTopicCohortScoresCTRs:(id)a3
{
  objc_storeStrong((id *)&self->_topicCohortScoresCTRs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicCohortScoresCTRs, 0);
  objc_storeStrong((id *)&self->_channelCohortScoresCTR, 0);
  objc_storeStrong((id *)&self->_globalCohortScoresCTR, 0);
  objc_storeStrong((id *)&self->_changeEtag, 0);
  objc_storeStrong((id *)&self->_flintFontResourceIDs, 0);
  objc_storeStrong((id *)&self->_flintDocumentPrefetchedData, 0);
  objc_storeStrong((id *)&self->_flintDocumentUrlString, 0);
  objc_storeStrong((id *)&self->_articlePayload, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_routeURL, 0);
  objc_storeStrong((id *)&self->_layeredThumbnailJSON, 0);
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfigAssetHandle, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
