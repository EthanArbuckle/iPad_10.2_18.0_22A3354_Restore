@implementation FCArticleHeadline

- (id)topics
{
  return self->_topics;
}

- (id)publisherID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceChannelTagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FCHeadline sourceChannelID](self, "sourceChannelID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)thumbnailImageTextColor
{
  FCColor *thumbnailImageTextColor;
  FCColor *v3;
  void *v4;
  void *v5;

  thumbnailImageTextColor = self->_thumbnailImageTextColor;
  if (thumbnailImageTextColor)
  {
    v3 = thumbnailImageTextColor;
  }
  else
  {
    -[FCArticleHeadline articleRecord](self, "articleRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
    v3 = (FCColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)thumbnailImageAccentColor
{
  FCColor *thumbnailImageAccentColor;
  FCColor *v3;
  void *v4;
  void *v5;

  thumbnailImageAccentColor = self->_thumbnailImageAccentColor;
  if (thumbnailImageAccentColor)
  {
    v3 = thumbnailImageAccentColor;
  }
  else
  {
    -[FCArticleHeadline articleRecord](self, "articleRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailAccentColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
    v3 = (FCColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)thumbnailImageBackgroundColor
{
  FCColor *thumbnailImageBackgroundColor;
  FCColor *v3;
  void *v4;
  void *v5;

  thumbnailImageBackgroundColor = self->_thumbnailImageBackgroundColor;
  if (thumbnailImageBackgroundColor)
  {
    v3 = thumbnailImageBackgroundColor;
  }
  else
  {
    -[FCArticleHeadline articleRecord](self, "articleRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
    v3 = (FCColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)thumbnailImagePrimaryColor
{
  FCColor *thumbnailImagePrimaryColor;
  FCColor *v3;
  void *v4;
  void *v5;

  thumbnailImagePrimaryColor = self->_thumbnailImagePrimaryColor;
  if (thumbnailImagePrimaryColor)
  {
    v3 = thumbnailImagePrimaryColor;
  }
  else
  {
    -[FCArticleHeadline articleRecord](self, "articleRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailPrimaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v5);
    v3 = (FCColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NTPBArticleRecord)articleRecord
{
  return self->_articleRecord;
}

- (BOOL)isSponsored
{
  return self->_sponsored;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (id)publishDate
{
  return self->_publishDate;
}

- (id)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (id)language
{
  return self->_language;
}

- (BOOL)isAIGenerated
{
  return self->_aiGenerated;
}

- (id)videoStillImage
{
  return self->_videoStillImage;
}

- (BOOL)hasAudioTrack
{
  return self->_narrativeTrack != 0;
}

- (id)narrativeTrack
{
  return self->_narrativeTrack;
}

- (id)authors
{
  return self->_authors;
}

- (id)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (id)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (id)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (id)thumbnail
{
  return self->_thumbnail;
}

- (id)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (id)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (FCArticleHeadline)initWithArticleRecord:(id)a3 articleInterestToken:(id)a4 sourceChannel:(id)a5 parentIssue:(id)a6 storyStyleConfigs:(id)a7 storyTypeTimeout:(int64_t)a8 rapidUpdatesTimeout:(int64_t)a9 assetManager:(id)a10 experimentalTitleProvider:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCArticleHeadline *v22;
  uint64_t v23;
  FCChannelProviding *sourceChannel;
  uint64_t v25;
  NSString *sourceName;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *referencedArticleID;
  uint64_t v34;
  NSString *clusterID;
  uint64_t v36;
  NSString *language;
  uint64_t v38;
  NSData *float16TitleEncoding;
  uint64_t v40;
  NSData *float16FullBodyEncoding;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSDate *globalExpirationTime;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *tagsExpiration;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  FCHeadlineExperimentalTitleMetadata *experimentalTitleMetadata;
  uint64_t v56;
  FCHeadlineExperimentalTitleMetadata *title;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSString *titleCompact;
  uint64_t v62;
  NSString *primaryAudience;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  uint64_t v72;
  NSData *thumbnailPerceptualHash;
  unint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  unint64_t v79;
  double v80;
  double v81;
  unint64_t v82;
  double v83;
  double v84;
  unint64_t v85;
  double v86;
  double v87;
  unint64_t v88;
  double v89;
  double v90;
  unint64_t v91;
  double v92;
  double v93;
  unint64_t v94;
  double v95;
  double v96;
  unint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSString *shortExcerpt;
  uint64_t v108;
  NSString *accessoryText;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSDate *lastModifiedDate;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSDate *lastFetchedDate;
  uint64_t v120;
  NSArray *topics;
  uint64_t v122;
  NSArray *topicIDs;
  uint64_t v124;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  uint64_t v126;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  uint64_t v128;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *publisherCohorts;
  uint64_t v130;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *publisherConversionStats;
  uint64_t v132;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *publisherTagMetadata;
  BOOL v134;
  uint64_t v135;
  NSArray *iAdCategories;
  uint64_t v137;
  NSArray *iAdKeywords;
  uint64_t v139;
  NSArray *iAdSectionIDs;
  uint64_t v141;
  NSArray *blockedStorefrontIDs;
  uint64_t v143;
  NSArray *allowedStorefrontIDs;
  void *v145;
  uint64_t v146;
  NSArray *relatedArticleIDs;
  uint64_t v148;
  NSArray *moreFromPublisherArticleIDs;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  FCIssue *parentIssue;
  uint64_t v156;
  NSArray *linkedArticleIDs;
  uint64_t v158;
  NSArray *linkedIssueIDs;
  uint64_t v160;
  NSArray *authors;
  uint64_t v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  uint64_t v168;
  FCAssetHandle *videoStillImage;
  double v170;
  FCCoverArt *v171;
  void *v172;
  uint64_t v173;
  FCCoverArt *coverArt;
  void *v175;
  uint64_t v176;
  NSString *videoCallToActionTitle;
  uint64_t v178;
  uint64_t v179;
  NSURL *videoCallToActionURL;
  uint64_t v181;
  NSString *videoType;
  uint64_t v183;
  NSArray *sportsEventIDs;
  void *v185;
  double v186;
  double v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  int64_t behaviorFlags;
  char v192;
  void *v193;
  _BOOL4 v194;
  NSObject *v195;
  void *v196;
  NSDate *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  NSString *layeredThumbnailJSON;
  double v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  void *v209;
  FCAssetHandle *articleRecirculationConfigAssetHandle;
  id v211;
  _QWORD *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
  void *v217;
  void *v218;
  id v219;
  void *v220;
  uint64_t v221;
  NSString *excerpt;
  uint64_t v223;
  NSArray *narrators;
  uint64_t v225;
  NSString *narrativeTrackPreferredUpsellVariantID;
  void *v227;
  void *v228;
  uint64_t v229;
  NSArray *narrativeTrackBuddyArticleIDs;
  void *v231;
  id v232;
  void *v233;
  uint64_t v234;
  FCArticleAudioTrack *v235;
  void *v236;
  uint64_t v237;
  FCArticleAudioTrack *narrativeTrack;
  void *v239;
  void *v240;
  void *v241;
  double v242;
  double v243;
  double v244;
  uint64_t v245;
  double v246;
  void *v247;
  id v248;
  void *v249;
  FCArticleAudioTrack *v250;
  double v251;
  double v252;
  void *v253;
  double v254;
  double v255;
  void *v256;
  void *v257;
  double v258;
  uint64_t v259;
  FCArticleAudioTrack *narrativeTrackSample;
  FCArticleAudioTrack *v261;
  uint64_t v262;
  NSString *narrativeTrackTextRanges;
  uint64_t v264;
  FCHeadlineThumbnail *thumbnailLQ;
  uint64_t v266;
  FCHeadlineThumbnail *thumbnail;
  uint64_t v268;
  FCHeadlineThumbnail *thumbnailMedium;
  uint64_t v270;
  FCHeadlineThumbnail *thumbnailHQ;
  uint64_t v272;
  FCHeadlineThumbnail *thumbnailUltraHQ;
  uint64_t v274;
  FCHeadlineThumbnail *thumbnailWidgetLQ;
  uint64_t v276;
  FCHeadlineThumbnail *thumbnailWidget;
  uint64_t v278;
  FCHeadlineThumbnail *thumbnailWidgetHQ;
  BOOL v280;
  NSURL **p_videoURL;
  uint64_t v282;
  void *v284;
  id v285;
  objc_class *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  NSObject *v291;
  uint64_t v292;
  void *v293;
  const __CFString *v294;
  uint64_t v295;
  void *v296;
  const __CFString *v297;
  void *v298;
  void *v299;
  void *v300;
  double v301;
  void *v302;
  void *v303;
  id v304;
  id v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  void *v322;
  void *v323;
  void *context;
  id v325;
  id v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  id v334;
  void *v335;
  void *v336;
  id v337;
  id v338;
  objc_super v339;
  id v340;
  _BYTE buf[24];
  __int128 v342;
  id v343;
  uint64_t v344;

  v344 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v337 = a7;
  v21 = a10;
  v338 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v284 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleRecord");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyS"
                         "tyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCArticleHeadline.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v342) = 265;
    WORD2(v342) = 2114;
    *(_QWORD *)((char *)&v342 + 6) = v284;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v339.receiver = self;
  v339.super_class = (Class)FCArticleHeadline;
  v22 = -[FCHeadline init](&v339, sel_init);
  if (v22)
  {
    v334 = v20;
    context = (void *)MEMORY[0x1A8580B64]();
    objc_storeStrong((id *)&v22->_articleRecord, a3);
    objc_storeStrong((id *)&v22->_articleInterestToken, a4);
    v23 = objc_msgSend(v19, "copy");
    sourceChannel = v22->_sourceChannel;
    v22->_sourceChannel = (FCChannelProviding *)v23;

    objc_msgSend(v19, "name");
    v25 = objc_claimAutoreleasedReturnValue();
    sourceName = v22->_sourceName;
    v22->_sourceName = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0DE7910];
    -[NTPBArticleRecord sourceChannelTagID](v22->_articleRecord, "sourceChannelTagID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCChannelProviding identifier](v22->_sourceChannel, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = objc_msgSend(v27, "nf_object:isEqualToObject:", v28, v29);

    if ((v27 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v285 = objc_alloc(MEMORY[0x1E0CB3940]);
      v286 = (objc_class *)objc_opt_class();
      NSStringFromClass(v286);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTPBArticleRecord sourceChannelTagID](v22->_articleRecord, "sourceChannelTagID");
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCChannelProviding identifier](v22->_sourceChannel, "identifier");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      v290 = (void *)objc_msgSend(v285, "initWithFormat:", CFSTR("Attempting to initialize a %@ with mismatched articleRecord sourceChannelTagID : %@ and sourceChannel identifier : %@"), v287, v288, v289);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:stor"
                           "yStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCArticleHeadline.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v342) = 296;
      WORD2(v342) = 2114;
      *(_QWORD *)((char *)&v342 + 6) = v290;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v17, "base");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v22->_identifier, v31);
    v336 = v31;
    objc_storeStrong((id *)&v22->_articleID, v31);
    v22->_featureCandidate = objc_msgSend(v17, "isFeatureCandidate");
    objc_msgSend(v17, "referencedArticleID");
    v32 = objc_claimAutoreleasedReturnValue();
    referencedArticleID = v22->_referencedArticleID;
    v22->_referencedArticleID = (NSString *)v32;

    objc_msgSend(v17, "clusterID");
    v34 = objc_claimAutoreleasedReturnValue();
    clusterID = v22->_clusterID;
    v22->_clusterID = (NSString *)v34;

    objc_msgSend(v17, "language");
    v36 = objc_claimAutoreleasedReturnValue();
    language = v22->_language;
    v22->_language = (NSString *)v36;

    v22->_bodyTextLength = objc_msgSend(v17, "bodyTextLength");
    objc_msgSend(v17, "float16TitleEncoding");
    v38 = objc_claimAutoreleasedReturnValue();
    float16TitleEncoding = v22->_float16TitleEncoding;
    v22->_float16TitleEncoding = (NSData *)v38;

    objc_msgSend(v17, "float16FullBodyEncoding");
    v40 = objc_claimAutoreleasedReturnValue();
    float16FullBodyEncoding = v22->_float16FullBodyEncoding;
    v22->_float16FullBodyEncoding = (NSData *)v40;

    objc_msgSend(v17, "expirationData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = objc_msgSend(v42, "hasGlobalExpireUtcTime");

    if ((_DWORD)v31)
    {
      v43 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v17, "expirationData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v44, "globalExpireUtcTime") / 1000.0);
      v45 = objc_claimAutoreleasedReturnValue();
      globalExpirationTime = v22->_globalExpirationTime;
      v22->_globalExpirationTime = (NSDate *)v45;

    }
    objc_msgSend(v17, "expirationData");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "tagsExpirationLists");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCArticleTagsExpiration tagsExpirationsFromRecord:](FCArticleTagsExpiration, "tagsExpirationsFromRecord:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    tagsExpiration = v22->_tagsExpiration;
    v22->_tagsExpiration = (NSArray *)v49;

    objc_msgSend(v17, "title");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    if (v338)
    {
      objc_msgSend(v17, "experimentalTitles");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v338, "headlineMetadataFromTitle:fromExperimentalTitles:forArticleID:", v52, v53, v336);
      v54 = objc_claimAutoreleasedReturnValue();
      experimentalTitleMetadata = v22->_experimentalTitleMetadata;
      v22->_experimentalTitleMetadata = (FCHeadlineExperimentalTitleMetadata *)v54;

      -[FCHeadlineExperimentalTitleMetadata chosenTitle](v22->_experimentalTitleMetadata, "chosenTitle");
      v56 = objc_claimAutoreleasedReturnValue();
      title = (FCHeadlineExperimentalTitleMetadata *)v22->_title;
      v22->_title = (NSString *)v56;
    }
    else
    {
      v58 = v22->_title;
      v22->_title = (NSString *)v51;

      title = v22->_experimentalTitleMetadata;
      v22->_experimentalTitleMetadata = 0;
    }

    v335 = v19;
    if (!-[NSString length](v22->_title, "length"))
    {
      v59 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        v291 = v59;
        objc_msgSend(v17, "title");
        v292 = objc_claimAutoreleasedReturnValue();
        v293 = (void *)v292;
        if (v292)
          v294 = (const __CFString *)v292;
        else
          v294 = CFSTR("nil");
        objc_msgSend(v17, "experimentalTitles");
        v295 = objc_claimAutoreleasedReturnValue();
        v296 = (void *)v295;
        *(_DWORD *)buf = 138543874;
        if (v295)
          v297 = (const __CFString *)v295;
        else
          v297 = CFSTR("nil");
        *(_QWORD *)&buf[4] = v336;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v294;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&v342 = v297;
        _os_log_error_impl(&dword_1A1B90000, v291, OS_LOG_TYPE_ERROR, "Headline article [%{public}@] was assigned an empty title! Original record had title=[%{public}@] experimentalTitles=[%{public}@]", buf, 0x20u);

      }
    }
    objc_msgSend(v17, "titleCompact");
    v60 = objc_claimAutoreleasedReturnValue();
    titleCompact = v22->_titleCompact;
    v22->_titleCompact = (NSString *)v60;

    objc_msgSend(v17, "primaryAudience");
    v62 = objc_claimAutoreleasedReturnValue();
    primaryAudience = v22->_primaryAudience;
    v22->_primaryAudience = (NSString *)v62;

    v64 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "publishDate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dateWithPBDate:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    if (qword_1ED0F7BA0 != -1)
      dispatch_once(&qword_1ED0F7BA0, &__block_literal_global_46_4);
    v67 = byte_1ED0F7B8A;
    if (byte_1ED0F7B8A)
    {
      objc_msgSend(v66, "fc_adjustToRecentDate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = v66;
    }
    objc_storeStrong((id *)&v22->_publishDate, v68);
    if (v67)

    v22->_publisherArticleVersion = objc_msgSend(v17, "publisherArticleVersion");
    v22->_backendArticleVersion = objc_msgSend(v17, "backendArticleVersion");
    v22->_thumbnailFocalFrame.origin.x = FCCGRectFromBuffer(objc_msgSend(v17, "thumbnailFocalFrame"));
    v22->_thumbnailFocalFrame.origin.y = v69;
    v22->_thumbnailFocalFrame.size.width = v70;
    v22->_thumbnailFocalFrame.size.height = v71;
    objc_msgSend(v17, "thumbnailPerceptualHash");
    v72 = objc_claimAutoreleasedReturnValue();
    thumbnailPerceptualHash = v22->_thumbnailPerceptualHash;
    v22->_thumbnailPerceptualHash = (NSData *)v72;

    v74 = objc_msgSend(v17, "thumbnailLQMetadata");
    v76 = *MEMORY[0x1E0C9D820];
    v75 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v77 = v75;
    v78 = *MEMORY[0x1E0C9D820];
    if (v74)
    {
      v77 = (double)((v74 >> 8) & 0xFFFFFFF);
      v78 = (double)(v74 >> 36);
    }
    v79 = objc_msgSend(v17, "thumbnailMetadata");
    v80 = v75;
    v81 = v76;
    if (v79)
    {
      v80 = (double)((v79 >> 8) & 0xFFFFFFF);
      v81 = (double)(v79 >> 36);
    }
    v82 = objc_msgSend(v17, "thumbnailMediumMetadata");
    v83 = v75;
    v84 = v76;
    if (v82)
    {
      v83 = (double)((v82 >> 8) & 0xFFFFFFF);
      v84 = (double)(v82 >> 36);
    }
    v320 = v84;
    v85 = objc_msgSend(v17, "thumbnailHQMetadata");
    v86 = v75;
    v87 = v76;
    if (v85)
    {
      v86 = (double)((v85 >> 8) & 0xFFFFFFF);
      v87 = (double)(v85 >> 36);
    }
    v318 = v87;
    v321 = v86;
    v88 = objc_msgSend(v17, "thumbnailUltraHQMetadata");
    v89 = v75;
    v90 = v76;
    if (v88)
    {
      v89 = (double)((v88 >> 8) & 0xFFFFFFF);
      v90 = (double)(v88 >> 36);
    }
    v316 = v90;
    v319 = v89;
    v91 = objc_msgSend(v17, "thumbnailWidgetLQMetadata");
    v92 = v75;
    v93 = v76;
    if (v91)
    {
      v92 = (double)((v91 >> 8) & 0xFFFFFFF);
      v93 = (double)(v91 >> 36);
    }
    v314 = v93;
    v317 = v92;
    v94 = objc_msgSend(v17, "thumbnailWidgetMetadata");
    v95 = v75;
    v96 = v76;
    if (v94)
    {
      v95 = (double)((v94 >> 8) & 0xFFFFFFF);
      v96 = (double)(v94 >> 36);
    }
    v313 = v96;
    v315 = v95;
    v323 = v66;
    v97 = objc_msgSend(v17, "thumbnailWidgetHQMetadata");
    if (v97)
    {
      v75 = (double)((v97 >> 8) & 0xFFFFFFF);
      v76 = (double)(v97 >> 36);
    }
    objc_msgSend(v17, "thumbnailLQURL");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v98, v21);
    v333 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailURL");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v99, v21);
    v332 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailMediumURL");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v100, v21);
    v331 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailHQURL");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v101, v21);
    v330 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailUltraHQURL");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v102, v21);
    v329 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailWidgetLQURL");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v103, v21);
    v328 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailWidgetURL");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v104, v21);
    v327 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "thumbnailWidgetHQURL");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v105, v21);
    v322 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "shortExcerpt");
    v106 = objc_claimAutoreleasedReturnValue();
    shortExcerpt = v22->_shortExcerpt;
    v22->_shortExcerpt = (NSString *)v106;

    objc_msgSend(v17, "accessoryText");
    v108 = objc_claimAutoreleasedReturnValue();
    accessoryText = v22->_accessoryText;
    v22->_accessoryText = (NSString *)v108;

    v110 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "base");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "modificationDate");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "dateWithPBDate:", v112);
    v113 = objc_claimAutoreleasedReturnValue();
    lastModifiedDate = v22->_lastModifiedDate;
    v22->_lastModifiedDate = (NSDate *)v113;

    v115 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v17, "base");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "fetchDate");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "dateWithPBDate:", v117);
    v118 = objc_claimAutoreleasedReturnValue();
    lastFetchedDate = v22->_lastFetchedDate;
    v22->_lastFetchedDate = (NSDate *)v118;

    objc_msgSend(v17, "topics");
    v120 = objc_claimAutoreleasedReturnValue();
    topics = v22->_topics;
    v22->_topics = (NSArray *)v120;

    objc_msgSend(v17, "topicIDs");
    v122 = objc_claimAutoreleasedReturnValue();
    topicIDs = v22->_topicIDs;
    v22->_topicIDs = (NSArray *)v122;

    objc_msgSend(v17, "globalCohorts");
    v124 = objc_claimAutoreleasedReturnValue();
    globalCohorts = v22->_globalCohorts;
    v22->_globalCohorts = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v124;

    objc_msgSend(v17, "globalConversionStats");
    v126 = objc_claimAutoreleasedReturnValue();
    globalConversionStats = v22->_globalConversionStats;
    v22->_globalConversionStats = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v126;

    objc_msgSend(v17, "sourceChannelCohorts");
    v128 = objc_claimAutoreleasedReturnValue();
    publisherCohorts = v22->_publisherCohorts;
    v22->_publisherCohorts = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v128;

    objc_msgSend(v17, "channelConversionStats");
    v130 = objc_claimAutoreleasedReturnValue();
    publisherConversionStats = v22->_publisherConversionStats;
    v22->_publisherConversionStats = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v130;

    objc_msgSend(v17, "channelTagMetadata");
    v132 = objc_claimAutoreleasedReturnValue();
    publisherTagMetadata = v22->_publisherTagMetadata;
    v22->_publisherTagMetadata = (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *)v132;

    if ((objc_msgSend(v17, "isSponsored") & 1) != 0)
    {
      v134 = 1;
    }
    else
    {
      objc_opt_self();
      if (qword_1ED0F7B90 != -1)
        dispatch_once(&qword_1ED0F7B90, &__block_literal_global_44_3);
      v134 = _MergedGlobals_17 != 0;
    }
    v22->_sponsored = v134;
    objc_msgSend(v17, "iAdCategories");
    v135 = objc_claimAutoreleasedReturnValue();
    iAdCategories = v22->_iAdCategories;
    v22->_iAdCategories = (NSArray *)v135;

    objc_msgSend(v17, "iAdKeywords");
    v137 = objc_claimAutoreleasedReturnValue();
    iAdKeywords = v22->_iAdKeywords;
    v22->_iAdKeywords = (NSArray *)v137;

    objc_msgSend(v17, "iAdSectionIDs");
    v139 = objc_claimAutoreleasedReturnValue();
    iAdSectionIDs = v22->_iAdSectionIDs;
    v22->_iAdSectionIDs = (NSArray *)v139;

    v22->_isDraft = objc_msgSend(v17, "isDraft");
    objc_msgSend(v17, "blockedStorefrontIDs");
    v141 = objc_claimAutoreleasedReturnValue();
    blockedStorefrontIDs = v22->_blockedStorefrontIDs;
    v22->_blockedStorefrontIDs = (NSArray *)v141;

    objc_msgSend(v17, "allowedStorefrontIDs");
    v143 = objc_claimAutoreleasedReturnValue();
    allowedStorefrontIDs = v22->_allowedStorefrontIDs;
    v22->_allowedStorefrontIDs = (NSArray *)v143;

    objc_msgSend(v17, "base");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_deleted = objc_msgSend(v145, "deletedFromCloud");

    objc_msgSend(v17, "relatedArticleIDs");
    v146 = objc_claimAutoreleasedReturnValue();
    relatedArticleIDs = v22->_relatedArticleIDs;
    v22->_relatedArticleIDs = (NSArray *)v146;

    objc_msgSend(v17, "moreFromPublisherArticleIDs");
    v148 = objc_claimAutoreleasedReturnValue();
    moreFromPublisherArticleIDs = v22->_moreFromPublisherArticleIDs;
    v22->_moreFromPublisherArticleIDs = (NSArray *)v148;

    v150 = objc_msgSend(v17, "contentType") - 1;
    if (v150 < 3)
      v151 = v150 + 1;
    else
      v151 = 0;
    v22->_contentType = v151;
    v152 = objc_msgSend(v17, "role") - 1;
    if (v152 < 8)
      v153 = v152 + 1;
    else
      v153 = 0;
    v22->_role = v153;
    v154 = objc_msgSend(v20, "copy");
    parentIssue = v22->_parentIssue;
    v22->_parentIssue = (FCIssue *)v154;

    if (v20)
      -[FCHeadline markAsEvergreen](v22, "markAsEvergreen");
    v22->_halfLife = objc_msgSend(v17, "halfLifeMilliseconds");
    v22->_halfLifeOverride = objc_msgSend(v17, "halfLifeMillisecondsOverride");
    objc_msgSend(v17, "linkedArticleIDs");
    v156 = objc_claimAutoreleasedReturnValue();
    linkedArticleIDs = v22->_linkedArticleIDs;
    v22->_linkedArticleIDs = (NSArray *)v156;

    objc_msgSend(v17, "linkedIssueIDs");
    v158 = objc_claimAutoreleasedReturnValue();
    linkedIssueIDs = v22->_linkedIssueIDs;
    v22->_linkedIssueIDs = (NSArray *)v158;

    objc_msgSend(v17, "authors");
    v160 = objc_claimAutoreleasedReturnValue();
    authors = v22->_authors;
    v22->_authors = (NSArray *)v160;

    objc_msgSend(v17, "contentURL");
    v162 = objc_claimAutoreleasedReturnValue();
    if (v162)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v163 = 0;
    }
    objc_storeStrong((id *)&v22->_contentURL, v163);
    if (v162)

    v312 = (void *)v162;
    objc_msgSend(v17, "videoURL");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v164, "length");
    v311 = v164;
    if (v165)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v164);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v166 = 0;
    }
    objc_storeStrong((id *)&v22->_videoURL, v166);
    if (v165)

    objc_msgSend(v17, "videoStillImageURL");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateThumbnailAssetHandleForURL:withAssetManager:", v167, v21);
    v168 = objc_claimAutoreleasedReturnValue();
    videoStillImage = v22->_videoStillImage;
    v22->_videoStillImage = (FCAssetHandle *)v168;

    objc_msgSend(v17, "videoDuration");
    v22->_videoDuration = v170;
    v171 = [FCCoverArt alloc];
    objc_msgSend(v17, "coverArt");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = -[FCCoverArt initWithJSONString:](v171, "initWithJSONString:", v172);
    coverArt = v22->_coverArt;
    v22->_coverArt = (FCCoverArt *)v173;

    objc_msgSend(v17, "videoCallToActionTitle");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend(v175, "copy");
    videoCallToActionTitle = v22->_videoCallToActionTitle;
    v22->_videoCallToActionTitle = (NSString *)v176;

    objc_msgSend(v17, "videoCallToActionURL");
    v178 = objc_claimAutoreleasedReturnValue();
    if (v178)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v178);
      v179 = objc_claimAutoreleasedReturnValue();
      videoCallToActionURL = v22->_videoCallToActionURL;
      v22->_videoCallToActionURL = (NSURL *)v179;

    }
    objc_msgSend(v17, "videoType");
    v181 = objc_claimAutoreleasedReturnValue();
    videoType = v22->_videoType;
    v22->_videoType = (NSString *)v181;

    objc_msgSend(v17, "sportsEventIDs");
    v183 = objc_claimAutoreleasedReturnValue();
    sportsEventIDs = v22->_sportsEventIDs;
    v22->_sportsEventIDs = (NSArray *)v183;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "timeIntervalSinceDate:", v22->_lastModifiedDate);
    v187 = v186;

    objc_opt_self();
    v310 = (void *)v178;
    if (qword_1ED0F7B98 != -1)
      dispatch_once(&qword_1ED0F7B98, &__block_literal_global_45_4);
    if (byte_1ED0F7B89)
    {
      v188 = arc4random_uniform(3u) + 1;
      if (v188 < 5)
      {
        v22->_storyType = v188 + 1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v337, "objectForKey:", v185);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v189 = 0;
        v22->_storyType = 0;
      }
      objc_storeStrong((id *)&v22->_storyStyle, v189);
      if (v188 <= 4)
      {

      }
    }
    v190 = objc_msgSend(v17, "behaviorFlags");
    LOWORD(behaviorFlags) = v190;
    v22->_behaviorFlags = v190;
    if ((v190 & 1) != 0)
    {
      if (v187 >= (double)a9)
      {
        v193 = (void *)FCDefaultLog;
        v194 = os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT);
        v192 = 0;
        if (v194)
        {
          v195 = v193;
          -[FCArticleHeadline articleID](v22, "articleID");
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = v22->_lastModifiedDate;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a9);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v196;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v197;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&v342 = v198;
          _os_log_impl(&dword_1A1B90000, v195, OS_LOG_TYPE_DEFAULT, "Headline will ignore rapid-updates flag due to rapid-updates timeout, articleID=%{public}@, lastModified=%{public}@, timeout=%{public}@", buf, 0x20u);

          v192 = 0;
          behaviorFlags = v22->_behaviorFlags;
        }
      }
      else
      {
        v192 = 1;
      }
      v22->_needsRapidUpdates = v192;
    }
    v22->_disableTapToChannel = (behaviorFlags & 2) != 0;
    v22->_boundToContext = (behaviorFlags & 4) != 0;
    v22->_hiddenFromFeeds = (behaviorFlags & 8) != 0;
    v22->_pressRelease = (behaviorFlags & 0x10) != 0;
    v22->_hiddenFromAutoFavorites = (behaviorFlags & 0x20) != 0;
    v22->_webEmbedsEnabled = (behaviorFlags & 0x40) != 0;
    v22->_showBundleSoftPaywall = (behaviorFlags & 0x80) != 0;
    v22->_useTransparentNavigationBar = BYTE1(behaviorFlags) & 1;
    v22->_disableBookmarking = (behaviorFlags & 0x200) != 0;
    v22->_hideModalCloseButton = (behaviorFlags & 0x400) != 0;
    v22->_reduceVisibility = (behaviorFlags & 0x800) != 0;
    v22->_webConverted = (behaviorFlags & 0x1000) != 0;
    v22->_disablePrerollAds = (behaviorFlags & 0x4000) != 0;
    v22->_aiGenerated = (behaviorFlags & 0x8000) != 0;
    v22->_minimumNewsVersion = objc_msgSend(v17, "minimumNewsVersion");
    v22->_paid = objc_msgSend(v17, "isPaid");
    v22->_bundlePaid = objc_msgSend(v17, "isBundlePaid");
    v22->_canBePurchased = objc_msgSend(v335, "isPurchaseSetup");
    v22->_issueOnly = objc_msgSend(v17, "isIssueOnly");
    objc_msgSend(v17, "layeredCover");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend(v199, "copy");
    layeredThumbnailJSON = v22->_layeredThumbnailJSON;
    v22->_layeredThumbnailJSON = (NSString *)v200;

    objc_msgSend(v17, "layeredCoverAspectRatio");
    v22->_layeredThumbnailAspectRatio = v202;
    objc_msgSend(v17, "routeURL");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "length");
    if (v204)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v203);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v205 = 0;
    }
    objc_storeStrong((id *)&v22->_routeURL, v205);
    if (v204)

    v22->_dataSource = 0;
    if ((objc_msgSend(v17, "schemaFlags") & 1) != 0)
    {
      objc_msgSend(v17, "articleRecirculationConfigurationURL");
      v209 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v209)
        goto LABEL_87;
      objc_msgSend(v17, "articleRecirculationConfigurationURL");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assetHandleForCKAssetURLString:lifetimeHint:", v207, 2);
      v208 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      FCCKLocalizedArticleArticleRecirculationConfigurationKey();
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      +[FCRecordFieldURLProtocol URLForRecordID:fieldName:](FCRecordFieldURLProtocol, "URLForRecordID:fieldName:", v336, v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "assetHandleForURL:lifetimeHint:", v207, 2);
      v208 = objc_claimAutoreleasedReturnValue();
    }
    articleRecirculationConfigAssetHandle = v22->_articleRecirculationConfigAssetHandle;
    v22->_articleRecirculationConfigAssetHandle = (FCAssetHandle *)v208;

LABEL_87:
    v326 = v18;
    v211 = v17;
    v325 = v21;
    v212 = v21;
    v213 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v211, "narrativeTrackFullURL");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "fc_safeURLWithString:", v214);
    v215 = (void *)objc_claimAutoreleasedReturnValue();

    if (v215)
    {
      v216 = v215;
      objc_msgSend(v211, "narrativeTrackMetadata");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      if (v217)
      {
        v340 = 0;
        objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:error:", v217, &v340);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = v340;
        v220 = v219;
        if (v218)
        {
          v305 = v219;
          v306 = v217;
          v309 = v216;
          objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("description"));
          v221 = objc_claimAutoreleasedReturnValue();
          excerpt = v22->_excerpt;
          v22->_excerpt = (NSString *)v221;

          objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("narrators"));
          v223 = objc_claimAutoreleasedReturnValue();
          narrators = v22->_narrators;
          v22->_narrators = (NSArray *)v223;

          objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("preferredUpsellVariant"));
          v225 = objc_claimAutoreleasedReturnValue();
          narrativeTrackPreferredUpsellVariantID = v22->_narrativeTrackPreferredUpsellVariantID;
          v22->_narrativeTrackPreferredUpsellVariantID = (NSString *)v225;

          objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("upNext"));
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          v228 = (void *)MEMORY[0x1E0C99D20];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_42;
          *(_QWORD *)&v342 = &unk_1E463AA30;
          v304 = v227;
          *((_QWORD *)&v342 + 1) = v304;
          objc_msgSend(v228, "fc_array:", buf);
          v229 = objc_claimAutoreleasedReturnValue();
          narrativeTrackBuddyArticleIDs = v22->_narrativeTrackBuddyArticleIDs;
          v22->_narrativeTrackBuddyArticleIDs = (NSArray *)v229;

          objc_msgSend(v211, "narrativeTrackFullIdentifier");
          v307 = v203;
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          if (v212)
            v231 = (void *)v212[14];
          else
            v231 = 0;
          v232 = v231;
          +[FCArticleHeadline _tempOverrideMIMETypeForURL:]((uint64_t)FCArticleHeadline, v309);
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "assetWithIdentifier:remoteURL:overrideMIMEType:", v308, v309, v233);
          v234 = objc_claimAutoreleasedReturnValue();

          v235 = [FCArticleAudioTrack alloc];
          objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("fullTrackDuration"));
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "doubleValue");
          v303 = (void *)v234;
          v237 = -[FCArticleAudioTrack initWithType:asset:duration:](v235, "initWithType:asset:duration:", 0, v234);
          narrativeTrack = v22->_narrativeTrack;
          v22->_narrativeTrack = (FCArticleAudioTrack *)v237;

          v239 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v211, "narrativeTrackSampleURL");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "fc_safeURLWithString:", v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();

          v302 = v241;
          if (v241)
          {
            v301 = v81;
            v242 = v83;
            v243 = v78;
            v244 = v80;
            objc_msgSend(v211, "narrativeTrackSampleIdentifier");
            v245 = objc_claimAutoreleasedReturnValue();
            v246 = v77;
            if (v212)
              v247 = (void *)v212[14];
            else
              v247 = 0;
            v248 = v247;
            +[FCArticleHeadline _tempOverrideMIMETypeForURL:]((uint64_t)FCArticleHeadline, v241);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v248, "assetWithIdentifier:remoteURL:overrideMIMEType:", v245, v241, v249);
            v299 = (void *)objc_claimAutoreleasedReturnValue();

            v250 = [FCArticleAudioTrack alloc];
            objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("sampleTrackDuration"));
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v300, "doubleValue");
            v252 = v251;
            objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("sampleTrackEmbeddedUpsellStartTime"));
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "doubleValue");
            v255 = v254;
            objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("sampleTrackEmbeddedUpsellEndTime"));
            v256 = (void *)v245;
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v257, "doubleValue");
            v259 = -[FCArticleAudioTrack initWithType:asset:duration:embeddedUpsellStartTime:embeddedUpsellEndTime:](v250, "initWithType:asset:duration:embeddedUpsellStartTime:embeddedUpsellEndTime:", 0, v299, v252, v255, v258);
            narrativeTrackSample = v22->_narrativeTrackSample;
            v22->_narrativeTrackSample = (FCArticleAudioTrack *)v259;

            v77 = v246;
            v80 = v244;
            v78 = v243;
            v83 = v242;
            v81 = v301;
          }
          else
          {
            v261 = v22->_narrativeTrack;
            v256 = v22->_narrativeTrackSample;
            v22->_narrativeTrackSample = v261;
          }
          v203 = v307;
          v220 = v305;

          objc_msgSend(v211, "narrativeTrackTextRanges");
          v262 = objc_claimAutoreleasedReturnValue();
          narrativeTrackTextRanges = v22->_narrativeTrackTextRanges;
          v22->_narrativeTrackTextRanges = (NSString *)v262;

          v216 = v309;
          v217 = v306;
        }
        else
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_41;
          *(_QWORD *)&v342 = &unk_1E463AD10;
          *((_QWORD *)&v342 + 1) = v22;
          v343 = v219;
          __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_41((uint64_t)buf);
        }

      }
      else
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2;
        *(_QWORD *)&v342 = &unk_1E463AB18;
        *((_QWORD *)&v342 + 1) = v22;
        __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2((uint64_t)buf);
      }

    }
    objc_autoreleasePoolPop(context);
    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v333, v78, v77);
    v264 = objc_claimAutoreleasedReturnValue();
    thumbnailLQ = v22->_thumbnailLQ;
    v22->_thumbnailLQ = (FCHeadlineThumbnail *)v264;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v332, v81, v80);
    v266 = objc_claimAutoreleasedReturnValue();
    thumbnail = v22->_thumbnail;
    v22->_thumbnail = (FCHeadlineThumbnail *)v266;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v331, v320, v83);
    v268 = objc_claimAutoreleasedReturnValue();
    thumbnailMedium = v22->_thumbnailMedium;
    v22->_thumbnailMedium = (FCHeadlineThumbnail *)v268;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v330, v318, v321);
    v270 = objc_claimAutoreleasedReturnValue();
    thumbnailHQ = v22->_thumbnailHQ;
    v22->_thumbnailHQ = (FCHeadlineThumbnail *)v270;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v329, v316, v319);
    v272 = objc_claimAutoreleasedReturnValue();
    thumbnailUltraHQ = v22->_thumbnailUltraHQ;
    v22->_thumbnailUltraHQ = (FCHeadlineThumbnail *)v272;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v328, v314, v317);
    v274 = objc_claimAutoreleasedReturnValue();
    thumbnailWidgetLQ = v22->_thumbnailWidgetLQ;
    v22->_thumbnailWidgetLQ = (FCHeadlineThumbnail *)v274;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v327, v313, v315);
    v276 = objc_claimAutoreleasedReturnValue();
    thumbnailWidget = v22->_thumbnailWidget;
    v22->_thumbnailWidget = (FCHeadlineThumbnail *)v276;

    +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v322, v76, v75);
    v278 = objc_claimAutoreleasedReturnValue();
    thumbnailWidgetHQ = v22->_thumbnailWidgetHQ;
    v22->_thumbnailWidgetHQ = (FCHeadlineThumbnail *)v278;

    if (v22->_thumbnailLQ)
    {
      v280 = 1;
      v18 = v326;
    }
    else
    {
      v18 = v326;
      if (!v22->_thumbnail)
      {
        p_videoURL = &v22->_videoURL;
        if (v22->_thumbnailMedium)
        {
          v280 = 1;
          v20 = v334;
          v19 = v335;
        }
        else
        {
          v20 = v334;
          if (v22->_thumbnailHQ)
            v280 = 1;
          else
            v280 = v22->_thumbnailUltraHQ != 0;
          v19 = v335;
        }
        goto LABEL_107;
      }
      v280 = 1;
    }
    v20 = v334;
    v19 = v335;
    p_videoURL = &v22->_videoURL;
LABEL_107:
    v22->_hasThumbnail = v280;
    v21 = v325;
    if (!v22->_halfLife)
    {
      v282 = 21600000;
      if (v20 && objc_msgSend(v20, "halfLife"))
        v282 = objc_msgSend(v20, "halfLife");
      v22->_halfLife = v282;
    }
    if (*p_videoURL
      && -[FCArticleHeadline contentType](v22, "contentType") != 2
      && *p_videoURL
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v298 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The videoURL field should only be set for ANF articles"));
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:stor"
                           "yStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCArticleHeadline.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v342) = 521;
      WORD2(v342) = 2114;
      *(_QWORD *)((char *)&v342 + 6) = v298;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

  return v22;
}

- (id)videoURL
{
  return self->_videoURL;
}

- (NSString)title
{
  return self->_title;
}

- (id)topicIDs
{
  return self->_topicIDs;
}

- (unint64_t)halfLife
{
  return self->_halfLife;
}

- (id)publisherCohorts
{
  return self->_publisherCohorts;
}

- (id)globalCohorts
{
  return self->_globalCohorts;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (id)clusterID
{
  return self->_clusterID;
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

- (id)iAdKeywords
{
  return self->_iAdKeywords;
}

- (BOOL)webConverted
{
  return self->_webConverted;
}

- (BOOL)reduceVisibility
{
  return self->_reduceVisibility;
}

- (id)publisherTagMetadata
{
  return self->_publisherTagMetadata;
}

- (id)publisherConversionStats
{
  return self->_publisherConversionStats;
}

- (BOOL)isFeatureCandidate
{
  return self->_featureCandidate;
}

- (id)iAdCategories
{
  return self->_iAdCategories;
}

- (unint64_t)halfLifeOverride
{
  return self->_halfLifeOverride;
}

- (id)globalConversionStats
{
  return self->_globalConversionStats;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setPublishDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (id)storyStyle
{
  return self->_storyStyle;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (id)contentWithContext:(id)a3
{
  id v4;
  FCArticleContent *v5;
  void *v6;
  FCArticleContent *v7;

  v4 = a3;
  v5 = [FCArticleContent alloc];
  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCArticleContent initWithContext:articleRecord:](v5, "initWithContext:articleRecord:", v4, v6);

  return v7;
}

- (id)shortExcerpt
{
  return self->_shortExcerpt;
}

- (BOOL)isPressRelease
{
  return self->_pressRelease;
}

- (unint64_t)role
{
  return self->_role;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (id)routeURL
{
  return self->_routeURL;
}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[5];

  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__FCArticleHeadline_contentManifest__block_invoke;
  v7[3] = &unk_1E463AA30;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithManifests:](v3, "initWithManifests:", v4);

  return v5;
}

void __36__FCArticleHeadline_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "articleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "sourceChannel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE666C30))
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v14 = v10;

  objc_msgSend(v14, "contentManifest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

  objc_msgSend(*(id *)(a1 + 32), "parentIssue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentManifest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v13);

}

- (id)parentIssue
{
  return self->_parentIssue;
}

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (NSString)stocksScoresJSON
{
  void *v2;
  void *v3;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksScores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stocksMetadataJSON
{
  void *v2;
  void *v3;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)articleID
{
  return self->_articleID;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (void)setIsEvergreen:(BOOL)a3
{
  self->_isEvergreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleInterestToken, 0);
  objc_storeStrong((id *)&self->_articleRecord, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfigAssetHandle, 0);
  objc_storeStrong((id *)&self->_float16FullBodyEncoding, 0);
  objc_storeStrong((id *)&self->_float16TitleEncoding, 0);
  objc_storeStrong((id *)&self->_routeURL, 0);
  objc_storeStrong((id *)&self->_tagsExpiration, 0);
  objc_storeStrong((id *)&self->_globalExpirationTime, 0);
  objc_storeStrong((id *)&self->_narrativeTrackPreferredUpsellVariantID, 0);
  objc_storeStrong((id *)&self->_narrativeTrackBuddyArticleIDs, 0);
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_narrators, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_thumbnailImageAccentColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImageTextColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_thumbnailImagePrimaryColor, 0);
  objc_storeStrong((id *)&self->_layeredThumbnailJSON, 0);
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_videoType, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_parentIssue, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_videoStillImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_publisherTagMetadata, 0);
  objc_storeStrong((id *)&self->_publisherConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);
  objc_storeStrong((id *)&self->_publisherCohorts, 0);
  objc_storeStrong((id *)&self->_globalCohorts, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailWidget, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailPerceptualHash, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_experimentalTitleMetadata, 0);
  objc_storeStrong((id *)&self->_titleCompact, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)needsRapidUpdates
{
  return self->_needsRapidUpdates;
}

- (id)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (id)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (BOOL)isLocalDraft
{
  return self->_isLocalDraft;
}

void __55__FCArticleHeadline__forceArticlesToBeShownAsSponsored__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_17 = objc_msgSend(v0, "BOOLForKey:", CFSTR("force_articles_to_be_shown_as_sponsored"));

}

void __46__FCArticleHeadline__simulateTopStoriesBadges__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ED0F7B89 = objc_msgSend(v0, "BOOLForKey:", CFSTR("simulate_top_stories_badges"));

}

void __43__FCArticleHeadline__fakeArticlesTimestamp__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ED0F7B8A = objc_msgSend(v0, "BOOLForKey:", CFSTR("newsfeed.content.show_fake_timestamps"));

}

- (FCArticleHeadline)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCArticleHeadline init]";
    v9 = 2080;
    v10 = "FCArticleHeadline.m";
    v11 = 1024;
    v12 = 176;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCArticleHeadline init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCArticleHeadline)initWithArticleMetadata:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCArticleHeadline *v11;
  uint64_t v12;
  FCChannelProviding *sourceChannel;
  uint64_t v14;
  NSString *sourceName;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *articleID;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSDate *publishDate;
  void *v24;
  uint64_t v25;
  FCColor *thumbnailImageTextColor;
  void *v27;
  uint64_t v28;
  FCColor *thumbnailImageBackgroundColor;
  void *v30;
  uint64_t v31;
  FCColor *thumbnailImageAccentColor;
  void *v33;
  uint64_t v34;
  FCColor *thumbnailImagePrimaryColor;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  double *v40;
  unint64_t v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  FCHeadlineThumbnail *thumbnail;
  void *v48;
  unint64_t v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  FCHeadlineThumbnail *thumbnailHQ;
  void *v56;
  unint64_t v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  uint64_t v62;
  FCHeadlineThumbnail *v63;
  void *v64;
  unint64_t v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  FCHeadlineThumbnail *v71;
  void *v72;
  unint64_t v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  uint64_t v78;
  FCHeadlineThumbnail *thumbnailUltraHQ;
  void *v80;
  uint64_t v81;
  void *v82;
  BOOL v83;
  uint64_t v84;
  NSURL *routeURL;
  void *v86;
  void *v87;
  objc_super v89;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v89.receiver = self;
  v89.super_class = (Class)FCArticleHeadline;
  v11 = -[FCHeadline init](&v89, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    sourceChannel = v11->_sourceChannel;
    v11->_sourceChannel = (FCChannelProviding *)v12;

    objc_msgSend(v9, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    sourceName = v11->_sourceName;
    v11->_sourceName = (NSString *)v14;

    objc_msgSend(v8, "articleID");
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    objc_msgSend(v8, "articleID");
    v18 = objc_claimAutoreleasedReturnValue();
    articleID = v11->_articleID;
    v11->_articleID = (NSString *)v18;

    objc_msgSend(v8, "title");
    v20 = objc_claimAutoreleasedReturnValue();
    title = v11->_title;
    v11->_title = (NSString *)v20;

    objc_msgSend(v8, "publishDate");
    v22 = objc_claimAutoreleasedReturnValue();
    publishDate = v11->_publishDate;
    v11->_publishDate = (NSDate *)v22;

    v11->_contentType = objc_msgSend(v8, "contentType");
    objc_msgSend(v8, "thumbnailTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    thumbnailImageTextColor = v11->_thumbnailImageTextColor;
    v11->_thumbnailImageTextColor = (FCColor *)v25;

    objc_msgSend(v8, "thumbnailBackgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    thumbnailImageBackgroundColor = v11->_thumbnailImageBackgroundColor;
    v11->_thumbnailImageBackgroundColor = (FCColor *)v28;

    objc_msgSend(v8, "thumbnailAccentColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    thumbnailImageAccentColor = v11->_thumbnailImageAccentColor;
    v11->_thumbnailImageAccentColor = (FCColor *)v31;

    objc_msgSend(v8, "thumbnailPrimaryColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    thumbnailImagePrimaryColor = v11->_thumbnailImagePrimaryColor;
    v11->_thumbnailImagePrimaryColor = (FCColor *)v34;

    v11->_thumbnailFocalFrame.origin.x = FCCGRectFromBuffer(objc_msgSend(v8, "thumbnailFocalFrame"));
    v11->_thumbnailFocalFrame.origin.y = v36;
    v11->_thumbnailFocalFrame.size.width = v37;
    v11->_thumbnailFocalFrame.size.height = v38;
    objc_msgSend(v8, "thumbnail");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (double *)MEMORY[0x1E0C9D820];
    if (v39)
    {
      v41 = objc_msgSend(v8, "thumbnailMetadata");
      if (v41)
        v42 = (double)((v41 >> 8) & 0xFFFFFFF);
      else
        v42 = v40[1];
      if (v41)
        v43 = (double)(v41 >> 36);
      else
        v43 = *v40;
      objc_msgSend(v8, "thumbnail", *v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetHandleForCKAssetURLString:lifetimeHint:", v44, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v45, v43, v42);
      v46 = objc_claimAutoreleasedReturnValue();
      thumbnail = v11->_thumbnail;
      v11->_thumbnail = (FCHeadlineThumbnail *)v46;

    }
    objc_msgSend(v8, "thumbnailHQ");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_msgSend(v8, "thumbnailHQMetadata");
      if (v49)
        v50 = (double)((v49 >> 8) & 0xFFFFFFF);
      else
        v50 = v40[1];
      if (v49)
        v51 = (double)(v49 >> 36);
      else
        v51 = *v40;
      objc_msgSend(v8, "thumbnailHQ", *v40);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetHandleForCKAssetURLString:lifetimeHint:", v52, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v53, v51, v50);
      v54 = objc_claimAutoreleasedReturnValue();
      thumbnailHQ = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v54;

    }
    objc_msgSend(v8, "thumbnailMedium");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = objc_msgSend(v8, "thumbnailMediumMetadata");
      if (v57)
        v58 = (double)((v57 >> 8) & 0xFFFFFFF);
      else
        v58 = v40[1];
      if (v57)
        v59 = (double)(v57 >> 36);
      else
        v59 = *v40;
      objc_msgSend(v8, "thumbnailHQ", *v40);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetHandleForCKAssetURLString:lifetimeHint:", v60, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v61, v59, v58);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v62;

    }
    objc_msgSend(v8, "thumbnailHQ");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = objc_msgSend(v8, "thumbnailHQMetadata");
      if (v65)
        v66 = (double)((v65 >> 8) & 0xFFFFFFF);
      else
        v66 = v40[1];
      if (v65)
        v67 = (double)(v65 >> 36);
      else
        v67 = *v40;
      objc_msgSend(v8, "thumbnailHQ", *v40);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetHandleForCKAssetURLString:lifetimeHint:", v68, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v69, v67, v66);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = v11->_thumbnailHQ;
      v11->_thumbnailHQ = (FCHeadlineThumbnail *)v70;

      v11->_hasThumbnail = 1;
    }
    objc_msgSend(v8, "thumbnailUltraHQ");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      v73 = objc_msgSend(v8, "thumbnailUltraHQMetadata");
      if (v73)
        v74 = (double)((v73 >> 8) & 0xFFFFFFF);
      else
        v74 = v40[1];
      if (v73)
        v75 = (double)(v73 >> 36);
      else
        v75 = *v40;
      objc_msgSend(v8, "thumbnailUltraHQ", *v40);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "assetHandleForCKAssetURLString:lifetimeHint:", v76, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v77, v75, v74);
      v78 = objc_claimAutoreleasedReturnValue();
      thumbnailUltraHQ = v11->_thumbnailUltraHQ;
      v11->_thumbnailUltraHQ = (FCHeadlineThumbnail *)v78;

      v11->_hasThumbnail = 1;
    }
    objc_msgSend(v8, "videoURL");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "length");
    if (v81)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v80);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v82 = 0;
    }
    objc_storeStrong((id *)&v11->_videoURL, v82);
    if (v81)

    v83 = v11->_thumbnail || v11->_thumbnailMedium || v11->_thumbnailHQ || v11->_thumbnailUltraHQ != 0;
    v11->_hasThumbnail = v83;
    v11->_paid = objc_msgSend(v8, "isPaid");
    v11->_bundlePaid = objc_msgSend(v8, "isPaid");
    objc_msgSend(v8, "routeURL");
    v84 = objc_claimAutoreleasedReturnValue();
    routeURL = v11->_routeURL;
    v11->_routeURL = (NSURL *)v84;

    objc_msgSend(v8, "contentURL");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = 0;
    }
    objc_storeStrong((id *)&v11->_contentURL, v87);
    if (v86)

    v11->_role = 1;
    v11->_dataSource = 1;

  }
  return v11;
}

- (FCArticleHeadline)initWithArticleRecordData:(id)a3 sourceChannel:(id)a4 parentIssue:(id)a5 assetManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  FCArticleHeadline *v15;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62630]), "initWithData:", v10);
  if (v14)
  {
    self = -[FCArticleHeadline initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:](self, "initWithArticleRecord:articleInterestToken:sourceChannel:parentIssue:storyStyleConfigs:storyTypeTimeout:rapidUpdatesTimeout:assetManager:experimentalTitleProvider:", v14, 0, v11, v12, 0, 0, 0, v13, 0);
    v15 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to parse data %@"), v10);
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCArticleHeadline initWithArticleRecordData:sourceChannel:parentIssue:assetManager:]";
      v20 = 2080;
      v21 = "FCArticleHeadline.m";
      v22 = 1024;
      v23 = 533;
      v24 = 2114;
      v25 = v17;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: ReferredArticleDecode) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v15 = 0;
  }

  return v15;
}

- (id)backingArticleRecordData
{
  void *v2;
  void *v3;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publisherSpecifiedArticleIDs
{
  void *v2;
  void *v3;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publisherSpecifiedArticleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FCArticleHeadline_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __35__FCArticleHeadline_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "articleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "sourceChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE666C30))
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v13 = v9;

  objc_msgSend(v13, "contentArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "parentIssue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentArchive");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v12);

}

- (NSString)stocksClusterID
{
  void *v2;
  void *v3;

  -[FCArticleHeadline articleRecord](self, "articleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksClusterID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "article %{public}@ has a narrative track URL but no metadata", (uint8_t *)&v6, 0xCu);

  }
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "failed to parse narrative track metadata for %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __72__FCArticleHeadline__adoptNarrativeTrackFromArticleRecord_assetManager___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("articleID"), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fc_safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (__CFString)_tempOverrideMIMETypeForURL:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v2, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("aif")))
    {

    }
    else
    {
      objc_msgSend(v2, "pathExtension");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("aiff"));

      if (!v7)
      {
        v8 = 0;
        goto LABEL_6;
      }
    }
  }
  v8 = CFSTR("audio/mpeg");
LABEL_6:

  return v8;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (id)referencedArticleID
{
  return self->_referencedArticleID;
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 920);
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 936);
}

- (id)titleCompact
{
  return self->_titleCompact;
}

- (void)setTitleCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 944);
}

- (id)experimentalTitleMetadata
{
  return self->_experimentalTitleMetadata;
}

- (id)primaryAudience
{
  return self->_primaryAudience;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (id)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (id)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void)setThumbnailLQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLQ, a3);
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (void)setThumbnailMedium:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailMedium, a3);
}

- (void)setThumbnailHQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailHQ, a3);
}

- (void)setThumbnailUltraHQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, a3);
}

- (id)thumbnailWidgetLQ
{
  return self->_thumbnailWidgetLQ;
}

- (id)thumbnailWidget
{
  return self->_thumbnailWidget;
}

- (id)thumbnailWidgetHQ
{
  return self->_thumbnailWidgetHQ;
}

- (void)setShortExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (id)accessoryText
{
  return self->_accessoryText;
}

- (void)setAccessoryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
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

- (void)setTopicIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (void)setAiGenerated:(BOOL)a3
{
  self->_aiGenerated = a3;
}

- (id)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (id)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (id)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (void)setStoryStyle:(id)a3
{
  objc_storeStrong((id *)&self->_storyStyle, a3);
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

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_hiddenFromAutoFavorites;
}

- (BOOL)disablePrerollAds
{
  return self->_disablePrerollAds;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (id)coverArt
{
  return self->_coverArt;
}

- (id)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (id)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (id)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (id)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (void)setSportsEventIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (BOOL)canBePurchased
{
  return self->_canBePurchased;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
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

- (BOOL)reduceVisibilityForNonFollowers
{
  return self->_reduceVisibilityForNonFollowers;
}

- (void)setHalfLife:(unint64_t)a3
{
  self->_halfLife = a3;
}

- (id)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (id)narrators
{
  return self->_narrators;
}

- (id)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (id)narrativeTrackBuddyArticleIDs
{
  return self->_narrativeTrackBuddyArticleIDs;
}

- (id)narrativeTrackPreferredUpsellVariantID
{
  return self->_narrativeTrackPreferredUpsellVariantID;
}

- (id)globalExpirationTime
{
  return self->_globalExpirationTime;
}

- (void)setGlobalExpirationTime:(id)a3
{
  objc_storeStrong((id *)&self->_globalExpirationTime, a3);
}

- (id)tagsExpiration
{
  return self->_tagsExpiration;
}

- (id)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (id)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (id)articleRecirculationConfigAssetHandle
{
  return self->_articleRecirculationConfigAssetHandle;
}

- (unint64_t)dataSource
{
  return self->_dataSource;
}

- (void)setArticleRecord:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecord, a3);
}

- (FCInterestToken)articleInterestToken
{
  return self->_articleInterestToken;
}

- (void)setArticleInterestToken:(id)a3
{
  objc_storeStrong((id *)&self->_articleInterestToken, a3);
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  self->_behaviorFlags = a3;
}

@end
