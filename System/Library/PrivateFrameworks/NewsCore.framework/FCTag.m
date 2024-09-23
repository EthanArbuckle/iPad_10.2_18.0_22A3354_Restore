@implementation FCTag

- (FCHeadlineTemplate)defaultHeadlineTemplate
{
  return self->_defaultHeadlineTemplate;
}

- (FCSportsProviding)asSports
{
  FCTag *v3;

  if (-[FCTag isSports](self, "isSports"))
    v3 = self;
  else
    v3 = 0;
  return (FCSportsProviding *)v3;
}

- (BOOL)isSports
{
  return self->_isSports;
}

- (FCFeedTheming)theme
{
  return (FCFeedTheming *)self;
}

- (FCColor)foregroundColor
{
  NSString *foregroundColorHexString;
  NSString *v3;
  void *v4;

  if (self)
    foregroundColorHexString = self->_foregroundColorHexString;
  else
    foregroundColorHexString = 0;
  v3 = foregroundColorHexString;
  if (-[NSString length](v3, "length"))
  {
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)backgroundColor
{
  NSString *backgroundColorHexString;
  NSString *v3;
  void *v4;

  if (self)
    backgroundColorHexString = self->_backgroundColorHexString;
  else
    backgroundColorHexString = 0;
  v3 = backgroundColorHexString;
  if (-[NSString length](v3, "length"))
  {
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (FCColor *)v4;
}

- (id)_FCColorFromHexTriplet:(void *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "length"))
    {
      +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v4);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (double)bannerImageScale
{
  return self->_bannerImageScale;
}

- (double)bannerImageBaselineOffsetPercentage
{
  return self->_bannerImageBaselineOffsetPercentage;
}

- (FCAssetHandle)feedNavImageAssetHandle
{
  return self->_feedNavImageAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (BOOL)isNewspaper
{
  return self->_isNewspaper;
}

- (BOOL)isMySports
{
  return self->_isMySports;
}

- (BOOL)isMagazine
{
  return self->_isMagazine;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)hideAccessoryText
{
  return self->_hideAccessoryText;
}

- (BOOL)isSportsEvent
{
  return -[FCTag conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE674540);
}

- (FCChannelProviding)asChannel
{
  FCTag *v3;

  if (-[FCTag tagType](self, "tagType") == 2)
    v3 = self;
  else
    v3 = 0;
  return (FCChannelProviding *)v3;
}

- (FCTopicProviding)asTopic
{
  FCTag *v3;

  if (-[FCTag tagType](self, "tagType") == 1)
    v3 = self;
  else
    v3 = 0;
  return (FCTopicProviding *)v3;
}

- (FCSectionProviding)asSection
{
  FCTag *v2;

  v2 = self;
  if (-[FCTag tagType](self, "tagType") != 3
    && -[FCTag tagType](v2, "tagType") != 5
    && -[FCTag tagType](v2, "tagType") != 4)
  {
    v2 = 0;
  }
  return (FCSectionProviding *)v2;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (FCColor)feedBackgroundColor
{
  NSString *feedBackgroundColorHexString;

  if (self)
    feedBackgroundColorHexString = self->_feedBackgroundColorHexString;
  else
    feedBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, feedBackgroundColorHexString);
}

- (FCColor)feedControlColor
{
  NSString *feedControlColorHexString;

  if (self)
    feedControlColorHexString = self->_feedControlColorHexString;
  else
    feedControlColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, feedControlColorHexString);
}

- (FCTag)initWithTagRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FCTag *v15;
  uint64_t v16;
  NSString *nameCompact;
  uint64_t v18;
  NTPBFeedConfiguration *feedConfiguration;
  uint64_t v20;
  NSArray *publisherPaidOfferableConfigurations;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDate *fetchDate;
  uint64_t v28;
  NSDate *loadDate;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSDate *lastModifiedDate;
  void *v35;
  uint64_t v36;
  NSString *versionKey;
  uint64_t v38;
  NSString *replacementID;
  uint64_t v40;
  NSString *highlightsArticleListID;
  uint64_t v42;
  NSString *primaryAudience;
  uint64_t v44;
  NSArray *iAdCategories;
  uint64_t v46;
  NSArray *iAdKeywords;
  uint64_t v48;
  NSString *language;
  uint64_t v50;
  NSString *magazineGenre;
  uint64_t v52;
  NSString *superfeedConfigResourceID;
  double v54;
  uint64_t v55;
  NSArray *adTargetingKeywords;
  uint64_t v57;
  NSArray *blockedStorefrontIDs;
  uint64_t v59;
  NSArray *allowedStorefrontIDs;
  uint64_t v61;
  NSString *subtitle;
  uint64_t v63;
  NSArray *currentIssueIDs;
  uint64_t v65;
  NSArray *recentIssueIDs;
  uint64_t v67;
  NSString *backIssuesListID;
  double v69;
  uint64_t v70;
  FCAssetHandle *logoImageAssetHandle;
  uint64_t v72;
  FCAssetHandle *nameImageAssetHandle;
  uint64_t v74;
  FCAssetHandle *nameImageCompactAssetHandle;
  uint64_t v76;
  FCAssetHandle *nameImageForDarkBackgroundAssetHandle;
  void *v78;
  uint64_t v79;
  FCAssetHandle *nameImageMaskAssetHandle;
  uint64_t v81;
  FCAssetHandle *coverImageAssetHandle;
  uint64_t v83;
  FCAssetHandle *feedNavImageAssetHandle;
  uint64_t v85;
  FCAssetHandle *feedNavImageHQAssetHandle;
  uint64_t v87;
  NSString *parentID;
  uint64_t v89;
  NSArray *sectionIDs;
  uint64_t v91;
  NSString *defaultSectionID;
  uint64_t v93;
  NSArray *sectionFeedConfigurations;
  uint64_t v95;
  NSString *supergroupConfigJson;
  uint64_t v97;
  NSString *supergroupKnobsJson;
  FCSectionSupergroupKnobs *v99;
  void *v100;
  uint64_t v101;
  FCSectionSupergroupKnobs *supergroupKnobs;
  void *v103;
  void *v104;
  uint64_t v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  NSString *foregroundColorHexString;
  uint64_t v116;
  NSString *darkStyleForegroundColorHexString;
  uint64_t v118;
  NSString *backgroundColorHexString;
  uint64_t v120;
  NSString *darkStyleBackgroundColorHexString;
  uint64_t v122;
  NSString *groupTitleColorHexString;
  uint64_t v124;
  NSString *navigationChromeBackgroundColorHexString;
  uint64_t v126;
  NSString *darkStyleNavigationChromeBackgroundColorHexString;
  uint64_t v128;
  NSString *navigationChromeSeparatorColorHexString;
  uint64_t v130;
  NSString *darkStyleNavigationChromeSeparatorColorHexString;
  uint64_t v132;
  uint64_t v133;
  FCColorGradient *navigationChromeBackgroundGradient;
  NSObject *v135;
  id v136;
  id v137;
  uint64_t v138;
  NSString *v139;
  uint64_t v140;
  NSString *v141;
  uint64_t v142;
  NSString *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  FCTextInfo *v148;
  uint64_t v149;
  FCTextInfo *v150;
  uint64_t v151;
  FCTextInfo *v152;
  uint64_t v153;
  uint64_t v154;
  FCColorGradient *darkStyleNavigationChromeBackgroundGradient;
  uint64_t v156;
  NSString *feedBackgroundColorHexString;
  uint64_t v158;
  NSString *darkStyleFeedBackgroundColorHexString;
  uint64_t v160;
  uint64_t v161;
  FCColorGradient *feedBackgroundGradient;
  uint64_t v163;
  uint64_t v164;
  FCColorGradient *darkStyleFeedBackgroundGradient;
  uint64_t v166;
  NSString *feedControlColorHexString;
  uint64_t v168;
  NSString *darkStyleFeedControlColorHexString;
  uint64_t v170;
  NSString *adBackgroundColorHexString;
  uint64_t v172;
  NSString *darkStyleAdBackgroundColorHexString;
  uint64_t v174;
  uint64_t v175;
  FCColorGradient *adBackgroundGradient;
  void *v177;
  _QWORD *v178;
  uint64_t v179;
  FCColorGradient *darkStyleAdBackgroundGradient;
  uint64_t v181;
  NSString *feedMastheadType;
  void *v183;
  uint64_t v184;
  FCTextInfo *headlineTitleTextInfo;
  void *v186;
  uint64_t v187;
  FCTextInfo *headlineExcerptTextInfo;
  void *v189;
  uint64_t v190;
  FCTextInfo *headlineBylineTextInfo;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  uint64_t v198;
  NFLazy *lazyContentColorMap;
  FCHeadlineTemplate *v200;
  void *v201;
  void *v202;
  void *v203;
  unint64_t v204;
  void *v205;
  unint64_t v206;
  id v207;
  _WORD *v208;
  unint64_t v209;
  CGFloat v210;
  unint64_t v211;
  CGFloat v212;
  double v213;
  double v214;
  unint64_t v215;
  double v216;
  unint64_t v217;
  double v218;
  unint64_t v219;
  unint64_t v220;
  double v221;
  double v222;
  unint64_t v223;
  unint64_t v224;
  CGFloat v225;
  CGFloat v226;
  uint64_t v227;
  NSString *publisherPaidAuthorizationURL;
  uint64_t v229;
  NSString *publisherPaidVerificationURL;
  uint64_t v231;
  NSString *publisherPaidWebAccessURL;
  uint64_t v233;
  NSArray *publisherPaidFeldsparablePurchaseIDs;
  uint64_t v235;
  NSArray *publisherPaidBundlePurchaseIDs;
  void *v237;
  uint64_t v238;
  NSArray *v239;
  uint64_t v240;
  NTPBPublisherPaidDescriptionStrings *publisherPaidDescriptionStrings;
  uint64_t v242;
  unint64_t v243;
  void *v244;
  uint64_t v245;
  FCAssetHandle *nameImageMaskWidgetLQAssetHandle;
  void *v247;
  uint64_t v248;
  FCAssetHandle *nameImageMaskWidgetHQAssetHandle;
  void *v250;
  uint64_t v251;
  FCAssetHandle *nameImageLargeAssetHandle;
  void *v253;
  uint64_t v254;
  FCAssetHandle *nameImageLargeMaskAssetHandle;
  void *v256;
  uint64_t v257;
  FCAssetHandle *navigationChromeBackgroundImage;
  void *v259;
  uint64_t v260;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImage;
  void *v262;
  uint64_t v263;
  FCAssetHandle *navigationChromeBackgroundImageCompact;
  void *v265;
  uint64_t v266;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImageCompact;
  void *v268;
  uint64_t v269;
  FCAssetHandle *navigationChromeBackgroundImageLarge;
  void *v271;
  uint64_t v272;
  FCAssetHandle *darkStyleNavigationChromeBackgroundImageLarge;
  void *v274;
  void *v275;
  uint64_t v276;
  FCAssetHandle *v277;
  FCTagBanner *v278;
  FCTagBanner *bannerImageForWhiteBackground;
  FCTagBanner *v280;
  FCTagBanner *bannerImageForThemeBackground;
  FCTagBanner *v282;
  FCTagBanner *bannerImageForMask;
  FCTagBanner *v284;
  uint64_t v285;
  FCTagBanner *compactBannerImage;
  void *v287;
  uint64_t v288;
  FCAssetHandle *sportsLogoImageAssetHandle;
  uint64_t v290;
  FCAssetHandle *sportsLogoImageCompactAssetHandle;
  uint64_t v292;
  FCAssetHandle *sportsLogoImageLargeAssetHandle;
  uint64_t v294;
  FCAssetHandle *sportsLogoAltImageAssetHandle;
  uint64_t v296;
  FCAssetHandle *sportsLogoAltImageCompactAssetHandle;
  uint64_t v298;
  FCAssetHandle *sportsLogoAltImageLargeAssetHandle;
  void *v300;
  uint64_t v301;
  uint64_t v302;
  NSString *sportsData;
  void *v304;
  void *v305;
  void *v306;
  id v307;
  FCSportsData *v308;
  uint64_t v309;
  NSString *UMCCanonicalID;
  uint64_t v311;
  NSString *sportsPrimaryName;
  uint64_t v313;
  NSString *sportsNameAbbreviation;
  uint64_t v315;
  NSString *sportsSecondaryName;
  uint64_t v317;
  NSString *sportsSecondaryShortName;
  uint64_t v319;
  NSString *sportsFullName;
  uint64_t v321;
  NSString *topLevelSportTagIdentifier;
  uint64_t v323;
  NSArray *topLevelGroupsTagIdentifiers;
  uint64_t v325;
  NSString *sportsNickname;
  uint64_t v327;
  NSString *sportsLocation;
  uint64_t v329;
  NSString *sportsTypeDisplayName;
  uint64_t v331;
  NSString *sportsTypePluralizedDisplayName;
  void *v333;
  uint64_t v334;
  void *v335;
  void *v336;
  void *v337;
  id v338;
  void *v339;
  uint64_t v340;
  FCColor *sportsPrimaryColor;
  void *v342;
  uint64_t v343;
  FCColor *sportsSecondaryColor;
  void *v345;
  uint64_t v346;
  FCColor *sportsEventNavigationForegroundColor;
  void *v348;
  void *v349;
  void *v350;
  uint64_t v351;
  NSArray *publisherSpecifiedArticleIDs;
  void *v353;
  void *v354;
  uint64_t v355;
  NSDate *publisherSpecifiedArticleIDsModifiedDate;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  id v361;
  id v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t i;
  FCPublisherSpecifiedArticle *v367;
  void *v368;
  uint64_t v369;
  void *v370;
  void *v371;
  void *v372;
  uint64_t v373;
  void *v374;
  void *v375;
  void *v376;
  void *paidBundlePaywallConfiguration;
  void *v378;
  int v379;
  FCPaywallConfiguration *v380;
  void *v381;
  uint64_t v382;
  void *v383;
  void *v384;
  id v385;
  NSObject *v386;
  FCSportsRecommendationMappings *v387;
  FCSportsRecommendationMappings *sportsRecommendationMappings;
  uint64_t v389;
  NSString *name;
  uint64_t v391;
  NSString *v392;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  id v399;
  void *v400;
  id v401;
  id v402;
  id v403;
  void *v404;
  _QWORD *v405;
  _QWORD *v406;
  void *v407;
  FCHeadlineTemplate *v408;
  id v409;
  id v410;
  void *v411;
  void *context;
  id obja;
  void *v415;
  id v416;
  id v417;
  id v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  _BYTE buf[24];
  __int128 v424;
  uint64_t v425;

  v425 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v416 = a5;
  objc_msgSend(v8, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "type") - 1;
  if (v11 < 5)
    v12 = v11 + 1;
  else
    v12 = 0;
  objc_msgSend(v8, "base");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v415 = (void *)v10;
  v15 = -[FCTag initWithTagType:identifier:name:](self, "initWithTagType:identifier:name:", v12, v14, v10);

  if (!v15)
    goto LABEL_82;
  v409 = a4;
  context = (void *)MEMORY[0x1A8580B64]();
  if ((objc_msgSend(v8, "propertyFlags") & 4) != 0)
    v15->_userFacingTagTypeOverride = 1;
  objc_msgSend(v8, "nameCompact");
  v16 = objc_claimAutoreleasedReturnValue();
  nameCompact = v15->_nameCompact;
  v15->_nameCompact = (NSString *)v16;

  objc_msgSend(v8, "feedConfiguration");
  v18 = objc_claimAutoreleasedReturnValue();
  feedConfiguration = v15->_feedConfiguration;
  v15->_feedConfiguration = (NTPBFeedConfiguration *)v18;

  objc_msgSend(v8, "purchaseOfferableConfigurations");
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTag purchaseOfferableConfigurationsFromProtobufList:](v411);
  v20 = objc_claimAutoreleasedReturnValue();
  publisherPaidOfferableConfigurations = v15->_publisherPaidOfferableConfigurations;
  v15->_publisherPaidOfferableConfigurations = (NSArray *)v20;

  v22 = 0x1E0C99000uLL;
  v23 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "base");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dateWithPBDate:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  fetchDate = v15->_fetchDate;
  v15->_fetchDate = (NSDate *)v26;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v28 = objc_claimAutoreleasedReturnValue();
  loadDate = v15->_loadDate;
  v15->_loadDate = (NSDate *)v28;

  v30 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "base");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "modificationDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dateWithPBDate:", v32);
  v33 = objc_claimAutoreleasedReturnValue();
  lastModifiedDate = v15->_lastModifiedDate;
  v15->_lastModifiedDate = (NSDate *)v33;

  objc_msgSend(v8, "base");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "changeTag");
  v36 = objc_claimAutoreleasedReturnValue();
  versionKey = v15->_versionKey;
  v15->_versionKey = (NSString *)v36;

  v15->_isDeprecated = objc_msgSend(v8, "isDeprecated");
  objc_msgSend(v8, "replacementID");
  v38 = objc_claimAutoreleasedReturnValue();
  replacementID = v15->_replacementID;
  v15->_replacementID = (NSString *)v38;

  objc_msgSend(v8, "highlightsArticleListID");
  v40 = objc_claimAutoreleasedReturnValue();
  highlightsArticleListID = v15->_highlightsArticleListID;
  v15->_highlightsArticleListID = (NSString *)v40;

  v15->_isExplicitContent = objc_msgSend(v8, "isExplicitContent");
  objc_msgSend(v8, "primaryAudience");
  v42 = objc_claimAutoreleasedReturnValue();
  primaryAudience = v15->_primaryAudience;
  v15->_primaryAudience = (NSString *)v42;

  objc_msgSend(v8, "iAdCategories");
  v44 = objc_claimAutoreleasedReturnValue();
  iAdCategories = v15->_iAdCategories;
  v15->_iAdCategories = (NSArray *)v44;

  objc_msgSend(v8, "iAdKeywords");
  v46 = objc_claimAutoreleasedReturnValue();
  iAdKeywords = v15->_iAdKeywords;
  v15->_iAdKeywords = (NSArray *)v46;

  objc_msgSend(v8, "language");
  v48 = objc_claimAutoreleasedReturnValue();
  language = v15->_language;
  v15->_language = (NSString *)v48;

  objc_msgSend(v8, "magazineGenre");
  v50 = objc_claimAutoreleasedReturnValue();
  magazineGenre = v15->_magazineGenre;
  v15->_magazineGenre = (NSString *)v50;

  objc_msgSend(v8, "superfeedConfigResourceID");
  v52 = objc_claimAutoreleasedReturnValue();
  superfeedConfigResourceID = v15->_superfeedConfigResourceID;
  v15->_superfeedConfigResourceID = (NSString *)v52;

  objc_msgSend(v8, "subscriptionRate");
  v15->_subscriptionRate = v54;
  objc_msgSend(v8, "adTargetingKeywords");
  v55 = objc_claimAutoreleasedReturnValue();
  adTargetingKeywords = v15->_adTargetingKeywords;
  v15->_adTargetingKeywords = (NSArray *)v55;

  objc_msgSend(v8, "blockedStorefrontIDs");
  v57 = objc_claimAutoreleasedReturnValue();
  blockedStorefrontIDs = v15->_blockedStorefrontIDs;
  v15->_blockedStorefrontIDs = (NSArray *)v57;

  objc_msgSend(v8, "allowedStorefrontIDs");
  v59 = objc_claimAutoreleasedReturnValue();
  allowedStorefrontIDs = v15->_allowedStorefrontIDs;
  v15->_allowedStorefrontIDs = (NSArray *)v59;

  v15->_score = objc_msgSend(v8, "score");
  v15->_contentProvider = objc_msgSend(v8, "contentProvider");
  v15->_isPublic = objc_msgSend(v8, "isPublic");
  v15->_minimumNewsVersion = objc_msgSend(v8, "minimumNewsVersion");
  v15->_isNotificationEnabled = objc_msgSend(v8, "isNotificationEnabled");
  objc_msgSend(v8, "subtitle");
  v61 = objc_claimAutoreleasedReturnValue();
  subtitle = v15->_subtitle;
  v15->_subtitle = (NSString *)v61;

  objc_msgSend(v8, "latestIssueIDs");
  v63 = objc_claimAutoreleasedReturnValue();
  currentIssueIDs = v15->_currentIssueIDs;
  v15->_currentIssueIDs = (NSArray *)v63;

  objc_msgSend(v8, "recentIssueIDs");
  v65 = objc_claimAutoreleasedReturnValue();
  recentIssueIDs = v15->_recentIssueIDs;
  v15->_recentIssueIDs = (NSArray *)v65;

  objc_msgSend(v8, "archiveIssueListID");
  v67 = objc_claimAutoreleasedReturnValue();
  backIssuesListID = v15->_backIssuesListID;
  v15->_backIssuesListID = (NSString *)v67;

  objc_msgSend(v8, "nameImageScaleFactor");
  v15->_bannerImageScale = v69;
  v15->_bannerImageBaselineOffsetPercentage = (double)(unint64_t)objc_msgSend(v8, "nameImageBaselineShift");
  objc_msgSend(v8, "generateLogoImageAssetHandleWithAssetManager:", v9);
  v70 = objc_claimAutoreleasedReturnValue();
  logoImageAssetHandle = v15->_logoImageAssetHandle;
  v15->_logoImageAssetHandle = (FCAssetHandle *)v70;

  objc_msgSend(v8, "generateNameImageAssetHandleWithAssetManager:", v9);
  v72 = objc_claimAutoreleasedReturnValue();
  nameImageAssetHandle = v15->_nameImageAssetHandle;
  v15->_nameImageAssetHandle = (FCAssetHandle *)v72;

  objc_msgSend(v8, "generateNameImageCompactAssetHandleWithAssetManager:", v9);
  v74 = objc_claimAutoreleasedReturnValue();
  nameImageCompactAssetHandle = v15->_nameImageCompactAssetHandle;
  v15->_nameImageCompactAssetHandle = (FCAssetHandle *)v74;

  objc_msgSend(v8, "generateNameImageForDarkBackgroundAssetHandleWithAssetManager:", v9);
  v76 = objc_claimAutoreleasedReturnValue();
  nameImageForDarkBackgroundAssetHandle = v15->_nameImageForDarkBackgroundAssetHandle;
  v15->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v76;

  objc_msgSend(v8, "nameImageMaskURL");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNameImageMaskAssetHandleForURL:withAssetManager:", v78, v9);
  v79 = objc_claimAutoreleasedReturnValue();
  nameImageMaskAssetHandle = v15->_nameImageMaskAssetHandle;
  v15->_nameImageMaskAssetHandle = (FCAssetHandle *)v79;

  objc_msgSend(v8, "generateCoverImageAssetHandleWithAssetManager:", v9);
  v81 = objc_claimAutoreleasedReturnValue();
  coverImageAssetHandle = v15->_coverImageAssetHandle;
  v15->_coverImageAssetHandle = (FCAssetHandle *)v81;

  objc_msgSend(v8, "generateFeedNavImageAssetHandleWithAssetManager:", v9);
  v83 = objc_claimAutoreleasedReturnValue();
  feedNavImageAssetHandle = v15->_feedNavImageAssetHandle;
  v15->_feedNavImageAssetHandle = (FCAssetHandle *)v83;

  objc_msgSend(v8, "generateFeedNavImageHQAssetHandleWithAssetManager:", v9);
  v85 = objc_claimAutoreleasedReturnValue();
  feedNavImageHQAssetHandle = v15->_feedNavImageHQAssetHandle;
  v15->_feedNavImageHQAssetHandle = (FCAssetHandle *)v85;

  objc_msgSend(v8, "parentID");
  v87 = objc_claimAutoreleasedReturnValue();
  parentID = v15->_parentID;
  v15->_parentID = (NSString *)v87;

  objc_msgSend(v8, "channelSectionIDs");
  v89 = objc_claimAutoreleasedReturnValue();
  sectionIDs = v15->_sectionIDs;
  v15->_sectionIDs = (NSArray *)v89;

  objc_msgSend(v8, "channelDefaultSectionID");
  v91 = objc_claimAutoreleasedReturnValue();
  defaultSectionID = v15->_defaultSectionID;
  v15->_defaultSectionID = (NSString *)v91;

  objc_msgSend(v8, "channelSectionFeedConfigurations");
  v93 = objc_claimAutoreleasedReturnValue();
  sectionFeedConfigurations = v15->_sectionFeedConfigurations;
  v15->_sectionFeedConfigurations = (NSArray *)v93;

  objc_msgSend(v8, "supergroupConfigJson");
  v95 = objc_claimAutoreleasedReturnValue();
  supergroupConfigJson = v15->_supergroupConfigJson;
  v15->_supergroupConfigJson = (NSString *)v95;

  objc_msgSend(v8, "supergroupKnobsJson");
  v97 = objc_claimAutoreleasedReturnValue();
  supergroupKnobsJson = v15->_supergroupKnobsJson;
  v15->_supergroupKnobsJson = (NSString *)v97;

  v99 = [FCSectionSupergroupKnobs alloc];
  objc_msgSend(v8, "supergroupKnobsJson");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = -[FCSectionSupergroupKnobs initWithJSONString:](v99, "initWithJSONString:", v100);
  supergroupKnobs = v15->_supergroupKnobs;
  v15->_supergroupKnobs = (FCSectionSupergroupKnobs *)v101;

  v15->_hideAccessoryText = objc_msgSend(v8, "hideAccessoryText");
  objc_msgSend(v8, "templateJson");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "dataUsingEncoding:", 4);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    v403 = a5;
    v418 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v104, 0, &v418);
    v105 = objc_claimAutoreleasedReturnValue();
    v106 = v418;
    v407 = (void *)v105;
    if (v105)
    {
      if (v9)
        v107 = (void *)v9[15];
      else
        v107 = 0;
      v108 = v107;
      v109 = v407;
      v110 = v108;
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("2"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (v111)
      {
        v404 = v110;
        v112 = objc_msgSend(CFSTR("2"), "integerValue");
        v113 = v111;
        if (v112 == 2)
        {
          v401 = v106;
          v399 = v404;
          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("foregroundColor"));
          v114 = objc_claimAutoreleasedReturnValue();
          foregroundColorHexString = v15->_foregroundColorHexString;
          v15->_foregroundColorHexString = (NSString *)v114;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleForegroundColor"));
          v116 = objc_claimAutoreleasedReturnValue();
          darkStyleForegroundColorHexString = v15->_darkStyleForegroundColorHexString;
          v15->_darkStyleForegroundColorHexString = (NSString *)v116;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
          v118 = objc_claimAutoreleasedReturnValue();
          backgroundColorHexString = v15->_backgroundColorHexString;
          v15->_backgroundColorHexString = (NSString *)v118;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleBackgroundColor"));
          v120 = objc_claimAutoreleasedReturnValue();
          darkStyleBackgroundColorHexString = v15->_darkStyleBackgroundColorHexString;
          v15->_darkStyleBackgroundColorHexString = (NSString *)v120;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("groupTitleColor"));
          v122 = objc_claimAutoreleasedReturnValue();
          groupTitleColorHexString = v15->_groupTitleColorHexString;
          v15->_groupTitleColorHexString = (NSString *)v122;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundColor"));
          v124 = objc_claimAutoreleasedReturnValue();
          navigationChromeBackgroundColorHexString = v15->_navigationChromeBackgroundColorHexString;
          v15->_navigationChromeBackgroundColorHexString = (NSString *)v124;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundDarkModeColor"));
          v126 = objc_claimAutoreleasedReturnValue();
          darkStyleNavigationChromeBackgroundColorHexString = v15->_darkStyleNavigationChromeBackgroundColorHexString;
          v15->_darkStyleNavigationChromeBackgroundColorHexString = (NSString *)v126;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeSeparatorColor"));
          v128 = objc_claimAutoreleasedReturnValue();
          navigationChromeSeparatorColorHexString = v15->_navigationChromeSeparatorColorHexString;
          v15->_navigationChromeSeparatorColorHexString = (NSString *)v128;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeSeparatorDarkModeColor"));
          v130 = objc_claimAutoreleasedReturnValue();
          darkStyleNavigationChromeSeparatorColorHexString = v15->_darkStyleNavigationChromeSeparatorColorHexString;
          v15->_darkStyleNavigationChromeSeparatorColorHexString = (NSString *)v130;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundGradient"));
          v132 = objc_claimAutoreleasedReturnValue();
          v400 = (void *)v132;
          if (v132)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v132);
            v133 = objc_claimAutoreleasedReturnValue();
            navigationChromeBackgroundGradient = v15->_navigationChromeBackgroundGradient;
            v15->_navigationChromeBackgroundGradient = (FCColorGradient *)v133;
          }
          else
          {
            navigationChromeBackgroundGradient = v15->_navigationChromeBackgroundGradient;
            v15->_navigationChromeBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundDarkModeGradient"));
          v153 = objc_claimAutoreleasedReturnValue();
          v398 = (void *)v153;
          if (v153)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v153);
            v154 = objc_claimAutoreleasedReturnValue();
            darkStyleNavigationChromeBackgroundGradient = v15->_darkStyleNavigationChromeBackgroundGradient;
            v15->_darkStyleNavigationChromeBackgroundGradient = (FCColorGradient *)v154;
          }
          else
          {
            darkStyleNavigationChromeBackgroundGradient = v15->_darkStyleNavigationChromeBackgroundGradient;
            v15->_darkStyleNavigationChromeBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("feedBackgroundColor"));
          v156 = objc_claimAutoreleasedReturnValue();
          feedBackgroundColorHexString = v15->_feedBackgroundColorHexString;
          v15->_feedBackgroundColorHexString = (NSString *)v156;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleFeedBackgroundColor"));
          v158 = objc_claimAutoreleasedReturnValue();
          darkStyleFeedBackgroundColorHexString = v15->_darkStyleFeedBackgroundColorHexString;
          v15->_darkStyleFeedBackgroundColorHexString = (NSString *)v158;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("feedBackgroundGradient"));
          v160 = objc_claimAutoreleasedReturnValue();
          v397 = (void *)v160;
          if (v160)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v160);
            v161 = objc_claimAutoreleasedReturnValue();
            feedBackgroundGradient = v15->_feedBackgroundGradient;
            v15->_feedBackgroundGradient = (FCColorGradient *)v161;
          }
          else
          {
            feedBackgroundGradient = v15->_feedBackgroundGradient;
            v15->_feedBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleFeedBackgroundGradient"));
          v163 = objc_claimAutoreleasedReturnValue();
          v396 = (void *)v163;
          if (v163)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v163);
            v164 = objc_claimAutoreleasedReturnValue();
            darkStyleFeedBackgroundGradient = v15->_darkStyleFeedBackgroundGradient;
            v15->_darkStyleFeedBackgroundGradient = (FCColorGradient *)v164;
          }
          else
          {
            darkStyleFeedBackgroundGradient = v15->_darkStyleFeedBackgroundGradient;
            v15->_darkStyleFeedBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("feedControlColor"));
          v166 = objc_claimAutoreleasedReturnValue();
          feedControlColorHexString = v15->_feedControlColorHexString;
          v15->_feedControlColorHexString = (NSString *)v166;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleFeedControlColor"));
          v168 = objc_claimAutoreleasedReturnValue();
          darkStyleFeedControlColorHexString = v15->_darkStyleFeedControlColorHexString;
          v15->_darkStyleFeedControlColorHexString = (NSString *)v168;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("adBackgroundColor"));
          v170 = objc_claimAutoreleasedReturnValue();
          adBackgroundColorHexString = v15->_adBackgroundColorHexString;
          v15->_adBackgroundColorHexString = (NSString *)v170;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleAdBackgroundColor"));
          v172 = objc_claimAutoreleasedReturnValue();
          darkStyleAdBackgroundColorHexString = v15->_darkStyleAdBackgroundColorHexString;
          v15->_darkStyleAdBackgroundColorHexString = (NSString *)v172;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("adBackgroundGradient"));
          v174 = objc_claimAutoreleasedReturnValue();
          v395 = (void *)v174;
          if (v174)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v174, v174, v396, v397, v398);
            v175 = objc_claimAutoreleasedReturnValue();
            adBackgroundGradient = v15->_adBackgroundGradient;
            v15->_adBackgroundGradient = (FCColorGradient *)v175;
          }
          else
          {
            adBackgroundGradient = v15->_adBackgroundGradient;
            v15->_adBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("darkStyleAdBackgroundGradient"));
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = v9;
          if (v177)
          {
            +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v177);
            v179 = objc_claimAutoreleasedReturnValue();
            darkStyleAdBackgroundGradient = v15->_darkStyleAdBackgroundGradient;
            v15->_darkStyleAdBackgroundGradient = (FCColorGradient *)v179;
          }
          else
          {
            darkStyleAdBackgroundGradient = v15->_darkStyleAdBackgroundGradient;
            v15->_darkStyleAdBackgroundGradient = 0;
          }

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("feedMastheadType"));
          v181 = objc_claimAutoreleasedReturnValue();
          feedMastheadType = v15->_feedMastheadType;
          v15->_feedMastheadType = (NSString *)v181;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("titleFontAttributes"));
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v183, v399);
          v184 = objc_claimAutoreleasedReturnValue();
          headlineTitleTextInfo = v15->_headlineTitleTextInfo;
          v15->_headlineTitleTextInfo = (FCTextInfo *)v184;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("excerptFontAttributes"));
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v186, v399);
          v187 = objc_claimAutoreleasedReturnValue();
          headlineExcerptTextInfo = v15->_headlineExcerptTextInfo;
          v15->_headlineExcerptTextInfo = (FCTextInfo *)v187;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("bylineFontAttributes"));
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v189, v399);
          v190 = objc_claimAutoreleasedReturnValue();

          headlineBylineTextInfo = v15->_headlineBylineTextInfo;
          v15->_headlineBylineTextInfo = (FCTextInfo *)v190;

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImageContentMode"));
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          v15->_navigationChromeBackgroundImageContentMode = FCContentModeFromString(v192);

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImageContentModeCompact"));
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          v15->_navigationChromeBackgroundImageContentModeCompact = FCContentModeFromString(v193);

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("navigationChromeBackgroundImageContentModeLarge"));
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v15->_navigationChromeBackgroundImageContentModeLarge = FCContentModeFromString(v194);

          objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("contentColorMap"));
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v196 = objc_alloc(MEMORY[0x1E0D60AD0]);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __61__FCTag__inflateFromJSONDictionary_withVersion_URLGenerator___block_invoke;
          *(_QWORD *)&v424 = &unk_1E463B350;
          *((_QWORD *)&v424 + 1) = v195;
          v197 = v195;
          v198 = objc_msgSend(v196, "initWithConstructor:", buf);
          lazyContentColorMap = v15->_lazyContentColorMap;
          v15->_lazyContentColorMap = (NFLazy *)v198;

          v9 = v178;
          v22 = 0x1E0C99000uLL;
          v106 = v401;
        }

        v110 = v404;
      }
      else
      {
        v136 = v110;
        v402 = v106;
        v137 = v109;
        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("foregroundColor"));
        v138 = objc_claimAutoreleasedReturnValue();
        v139 = v15->_foregroundColorHexString;
        v15->_foregroundColorHexString = (NSString *)v138;

        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
        v140 = objc_claimAutoreleasedReturnValue();
        v141 = v15->_backgroundColorHexString;
        v15->_backgroundColorHexString = (NSString *)v140;

        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("groupTitleColor"));
        v142 = objc_claimAutoreleasedReturnValue();
        v143 = v15->_groupTitleColorHexString;
        v15->_groupTitleColorHexString = (NSString *)v142;

        __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, CFSTR("headlineTitleFontName"), CFSTR("headlineTitleFontResourceID"));
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, CFSTR("headlineExcerptFontName"), CFSTR("headlineExcerptFontResourceID"));
        v405 = v9;
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(v137, CFSTR("headlineBylineFontName"), CFSTR("headlineBylineFontResourceID"));
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v144, v136);
        v147 = objc_claimAutoreleasedReturnValue();
        v148 = v15->_headlineTitleTextInfo;
        v15->_headlineTitleTextInfo = (FCTextInfo *)v147;

        +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v145, v136);
        v149 = objc_claimAutoreleasedReturnValue();
        v150 = v15->_headlineExcerptTextInfo;
        v15->_headlineExcerptTextInfo = (FCTextInfo *)v149;

        +[FCTextInfo textInfoFromJSONValues:URLGenerator:](FCTextInfo, "textInfoFromJSONValues:URLGenerator:", v146, v136);
        v151 = objc_claimAutoreleasedReturnValue();

        v152 = v15->_headlineBylineTextInfo;
        v15->_headlineBylineTextInfo = (FCTextInfo *)v151;
        v111 = 0;
        v106 = v402;

        v22 = 0x1E0C99000;
        v9 = v405;

      }
    }
    else
    {
      v135 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v106;
        _os_log_error_impl(&dword_1A1B90000, v135, OS_LOG_TYPE_ERROR, "failed to parse Tag template JSON with error: %{public}@", buf, 0xCu);
      }
    }

    a5 = v403;
  }
  v200 = objc_alloc_init(FCHeadlineTemplate);
  -[FCHeadlineTemplate setHeadlineTitleTextInfo:](v200, "setHeadlineTitleTextInfo:", v15->_headlineTitleTextInfo);
  -[FCHeadlineTemplate setHeadlineExcerptTextInfo:](v200, "setHeadlineExcerptTextInfo:", v15->_headlineExcerptTextInfo);
  -[FCHeadlineTemplate setHeadlineBylineTextInfo:](v200, "setHeadlineBylineTextInfo:", v15->_headlineBylineTextInfo);
  +[FCColor whiteColor](FCColor, "whiteColor");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadlineTemplate setBackgroundColor:](v200, "setBackgroundColor:", v201);

  v408 = v200;
  objc_storeStrong((id *)&v15->_defaultHeadlineTemplate, v200);
  objc_msgSend(v8, "nameImageMetadata");
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  if (v202)
  {
    objc_msgSend(v8, "nameImageMetadata");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "length");

    if (v204 <= 0x23 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v394 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("name image metadata has unexpected size"));
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCTag initWithTagRecord:assetManager:interestToken:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCTag.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v424) = 560;
      WORD2(v424) = 2114;
      *(_QWORD *)((char *)&v424 + 6) = v394;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v8, "nameImageMetadata", v395);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v205, "length");

    if (v206 >= 0x24)
    {
      objc_msgSend(v8, "nameImageMetadata");
      v207 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v208 = (_WORD *)objc_msgSend(v207, "bytes");

      LOWORD(v209) = *v208;
      v210 = (double)v209;
      LOWORD(v211) = v208[1];
      v212 = (double)v211;
      v15->_nameImageSize.width = v210;
      v15->_nameImageSize.height = v212;
      LOWORD(v210) = v208[2];
      v213 = (double)*(unint64_t *)&v210;
      LOWORD(v212) = v208[5];
      v214 = (double)*(unint64_t *)&v212;
      LOWORD(v215) = v208[4];
      v216 = (double)v215;
      LOWORD(v217) = v208[3];
      v218 = (double)v217;
      v15->_nameImageInsets.top = v213;
      v15->_nameImageInsets.left = v214;
      v15->_nameImageInsets.bottom = v216;
      v15->_nameImageInsets.right = v218;
      LOWORD(v213) = v208[6];
      LOWORD(v214) = v208[7];
      LOWORD(v216) = v208[8];
      LOWORD(v218) = v208[11];
      LOWORD(v219) = v208[10];
      LOWORD(v220) = v208[9];
      v15->_nameImageForDarkBackgroundSize.width = (double)*(unint64_t *)&v213;
      v15->_nameImageForDarkBackgroundSize.height = (double)*(unint64_t *)&v214;
      v221 = (double)*(unint64_t *)&v216;
      v222 = (double)*(unint64_t *)&v218;
      *(double *)&v223 = (double)v219;
      *(double *)&v224 = (double)v220;
      v15->_nameImageForDarkBackgroundInsets.top = v221;
      v15->_nameImageForDarkBackgroundInsets.left = v222;
      v15->_nameImageForDarkBackgroundInsets.bottom = (double)v219;
      v15->_nameImageForDarkBackgroundInsets.right = (double)v220;
      LOWORD(v221) = v208[12];
      v225 = (double)*(unint64_t *)&v221;
      LOWORD(v222) = v208[13];
      v226 = (double)*(unint64_t *)&v222;
      v15->_nameImageMaskSize.width = v225;
      v15->_nameImageMaskSize.height = v226;
      LOWORD(v225) = v208[14];
      LOWORD(v226) = v208[17];
      LOWORD(v223) = v208[16];
      LOWORD(v224) = v208[15];
      v15->_nameImageMaskInsets.top = (double)*(unint64_t *)&v225;
      v15->_nameImageMaskInsets.left = (double)*(unint64_t *)&v226;
      v15->_nameImageMaskInsets.bottom = (double)v223;
      v15->_nameImageMaskInsets.right = (double)v224;
    }
  }
  objc_msgSend(v8, "publisherPaidAuthorizationURL", v395);
  v227 = objc_claimAutoreleasedReturnValue();
  publisherPaidAuthorizationURL = v15->_publisherPaidAuthorizationURL;
  v15->_publisherPaidAuthorizationURL = (NSString *)v227;

  objc_msgSend(v8, "publisherPaidVerificationURL");
  v229 = objc_claimAutoreleasedReturnValue();
  publisherPaidVerificationURL = v15->_publisherPaidVerificationURL;
  v15->_publisherPaidVerificationURL = (NSString *)v229;

  objc_msgSend(v8, "publisherPaidWebaccessURL");
  v231 = objc_claimAutoreleasedReturnValue();
  publisherPaidWebAccessURL = v15->_publisherPaidWebAccessURL;
  v15->_publisherPaidWebAccessURL = (NSString *)v231;

  objc_msgSend(v8, "publisherPaidFeldsparablePurchaseIDs");
  v233 = objc_claimAutoreleasedReturnValue();
  publisherPaidFeldsparablePurchaseIDs = v15->_publisherPaidFeldsparablePurchaseIDs;
  v15->_publisherPaidFeldsparablePurchaseIDs = (NSArray *)v233;

  objc_msgSend(v8, "publisherPaidBundlePurchaseIDs");
  v235 = objc_claimAutoreleasedReturnValue();
  publisherPaidBundlePurchaseIDs = v15->_publisherPaidBundlePurchaseIDs;
  v15->_publisherPaidBundlePurchaseIDs = (NSArray *)v235;

  objc_msgSend(v8, "purchaseOfferableConfigurations");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTag purchaseOfferableConfigurationsFromProtobufList:](v237);
  v238 = objc_claimAutoreleasedReturnValue();
  v239 = v15->_publisherPaidOfferableConfigurations;
  v15->_publisherPaidOfferableConfigurations = (NSArray *)v238;

  v15->_publisherPaidLeakyPaywallOptOut = objc_msgSend(v8, "publisherPaidLeakyPaywallOptOut");
  v15->_publisherPaidWebAccessOptIn = objc_msgSend(v8, "publisherPaidWebOptIn");
  objc_msgSend(v8, "publisherPaidDescriptionStrings");
  v240 = objc_claimAutoreleasedReturnValue();
  publisherPaidDescriptionStrings = v15->_publisherPaidDescriptionStrings;
  v15->_publisherPaidDescriptionStrings = (NTPBPublisherPaidDescriptionStrings *)v240;

  v242 = objc_msgSend(v8, "groupingAvailability") - 1;
  if (v242 < 3)
    v243 = v242 + 1;
  else
    v243 = 0;
  v15->_groupingEligibility = v243;
  v15->_isHidden = objc_msgSend(v8, "isHidden");
  objc_msgSend(v8, "nameImageMaskWidgetLQURL");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNameImageMaskAssetHandleForURL:withAssetManager:", v244, v9);
  v245 = objc_claimAutoreleasedReturnValue();
  nameImageMaskWidgetLQAssetHandle = v15->_nameImageMaskWidgetLQAssetHandle;
  v15->_nameImageMaskWidgetLQAssetHandle = (FCAssetHandle *)v245;

  objc_msgSend(v8, "nameImageMaskWidgetHQURL");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNameImageMaskAssetHandleForURL:withAssetManager:", v247, v9);
  v248 = objc_claimAutoreleasedReturnValue();
  nameImageMaskWidgetHQAssetHandle = v15->_nameImageMaskWidgetHQAssetHandle;
  v15->_nameImageMaskWidgetHQAssetHandle = (FCAssetHandle *)v248;

  objc_msgSend(v8, "nameImageLargeURL");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNameImageLargeAssetHandleForURLString:withAssetManager:", v250, v9);
  v251 = objc_claimAutoreleasedReturnValue();
  nameImageLargeAssetHandle = v15->_nameImageLargeAssetHandle;
  v15->_nameImageLargeAssetHandle = (FCAssetHandle *)v251;

  objc_msgSend(v8, "nameImageLargeMaskURL");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNameImageLargeMaskAssetHandleForURLString:withAssetManager:", v253, v9);
  v254 = objc_claimAutoreleasedReturnValue();
  nameImageLargeMaskAssetHandle = v15->_nameImageLargeMaskAssetHandle;
  v15->_nameImageLargeMaskAssetHandle = (FCAssetHandle *)v254;

  objc_msgSend(v8, "navigationChromeBackgroundImageURL");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageAssetHandleForURLString:withAssetManager:", v256, v9);
  v257 = objc_claimAutoreleasedReturnValue();
  navigationChromeBackgroundImage = v15->_navigationChromeBackgroundImage;
  v15->_navigationChromeBackgroundImage = (FCAssetHandle *)v257;

  objc_msgSend(v8, "darkStyleNavigationChromeBackgroundImageURL");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageAssetHandleForURLString:withAssetManager:", v259, v9);
  v260 = objc_claimAutoreleasedReturnValue();
  darkStyleNavigationChromeBackgroundImage = v15->_darkStyleNavigationChromeBackgroundImage;
  v15->_darkStyleNavigationChromeBackgroundImage = (FCAssetHandle *)v260;

  objc_msgSend(v8, "navigationChromeBackgroundImageCompactURL");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:withAssetManager:", v262, v9);
  v263 = objc_claimAutoreleasedReturnValue();
  navigationChromeBackgroundImageCompact = v15->_navigationChromeBackgroundImageCompact;
  v15->_navigationChromeBackgroundImageCompact = (FCAssetHandle *)v263;

  objc_msgSend(v8, "darkStyleNavigationChromeBackgroundImageCompactURL");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:withAssetManager:", v265, v9);
  v266 = objc_claimAutoreleasedReturnValue();
  darkStyleNavigationChromeBackgroundImageCompact = v15->_darkStyleNavigationChromeBackgroundImageCompact;
  v15->_darkStyleNavigationChromeBackgroundImageCompact = (FCAssetHandle *)v266;

  objc_msgSend(v8, "navigationChromeBackgroundImageLargeURL");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:withAssetManager:", v268, v9);
  v269 = objc_claimAutoreleasedReturnValue();
  navigationChromeBackgroundImageLarge = v15->_navigationChromeBackgroundImageLarge;
  v15->_navigationChromeBackgroundImageLarge = (FCAssetHandle *)v269;

  objc_msgSend(v8, "darkStyleNavigationChromeBackgroundImageLargeURL");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:withAssetManager:", v271, v9);
  v272 = objc_claimAutoreleasedReturnValue();
  darkStyleNavigationChromeBackgroundImageLarge = v15->_darkStyleNavigationChromeBackgroundImageLarge;
  v15->_darkStyleNavigationChromeBackgroundImageLarge = (FCAssetHandle *)v272;

  objc_msgSend(v8, "nameImageCompactURL");
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  if (v274)
  {
    objc_msgSend(v8, "nameImageCompactURL");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generateNameImageMaskAssetHandleForURL:withAssetManager:", v275, v9);
    v276 = objc_claimAutoreleasedReturnValue();
    v277 = v15->_nameImageCompactAssetHandle;
    v15->_nameImageCompactAssetHandle = (FCAssetHandle *)v276;

  }
  objc_storeStrong((id *)&v15->_tagRecord, a3);
  objc_storeStrong((id *)&v15->_assetManager, v409);
  objc_storeStrong((id *)&v15->_tagInterestToken, a5);
  v278 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageAssetHandle, v15->_nameImageSize.width, v15->_nameImageSize.height, v15->_nameImageInsets.top, v15->_nameImageInsets.left, v15->_nameImageInsets.bottom, v15->_nameImageInsets.right);
  bannerImageForWhiteBackground = v15->_bannerImageForWhiteBackground;
  v15->_bannerImageForWhiteBackground = v278;

  v280 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageForDarkBackgroundAssetHandle, v15->_nameImageForDarkBackgroundSize.width, v15->_nameImageForDarkBackgroundSize.height, v15->_nameImageForDarkBackgroundInsets.top, v15->_nameImageForDarkBackgroundInsets.left, v15->_nameImageForDarkBackgroundInsets.bottom, v15->_nameImageForDarkBackgroundInsets.right);
  bannerImageForThemeBackground = v15->_bannerImageForThemeBackground;
  v15->_bannerImageForThemeBackground = v280;

  v282 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v15->_nameImageMaskAssetHandle, v15->_nameImageMaskSize.width, v15->_nameImageMaskSize.height, v15->_nameImageMaskInsets.top, v15->_nameImageMaskInsets.left, v15->_nameImageMaskInsets.bottom, v15->_nameImageMaskInsets.right);
  bannerImageForMask = v15->_bannerImageForMask;
  v15->_bannerImageForMask = v282;

  v284 = [FCTagBanner alloc];
  v285 = -[FCTagBanner initWithAssetHandle:size:insets:](v284, "initWithAssetHandle:size:insets:", v15->_nameImageCompactAssetHandle, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0, 0.0, 0.0, 0.0);
  compactBannerImage = v15->_compactBannerImage;
  v15->_compactBannerImage = (FCTagBanner *)v285;

  v15->_isRealTimeTrackingEnabled = objc_msgSend(v8, "behaviorFlags") & 1;
  v15->_isArticleReadCountReportingEnabled = (objc_msgSend(v8, "behaviorFlags") & 8) != 0;
  v15->_isAutoDarkModeEnabled = (objc_msgSend(v8, "behaviorFlags") & 0x10) == 0;
  v15->_disableFollow = (objc_msgSend(v8, "behaviorFlags") & 2) != 0;
  v15->_disableBlock = (objc_msgSend(v8, "behaviorFlags") & 4) != 0;
  v15->_useCompactNameForPersonalizedPaywall = (objc_msgSend(v8, "behaviorFlags") & 0x20) != 0;
  v15->_sponsoredFeedEligible = (objc_msgSend(v8, "behaviorFlags") & 0x40) != 0;
  v15->_isInternal = objc_msgSend(v8, "propertyFlags") & 1;
  v15->_isSandbox = (objc_msgSend(v8, "propertyFlags") & 2) != 0;
  v15->_isLocal = (objc_msgSend(v8, "propertyFlags") & 4) != 0;
  v15->_isSensitiveTopic = (objc_msgSend(v8, "propertyFlags") & 8) != 0;
  v15->_isNewspaper = (objc_msgSend(v8, "propertyFlags") & 0x10) != 0;
  v15->_isMagazine = (objc_msgSend(v8, "propertyFlags") & 0x20) != 0;
  v15->_isSports = (objc_msgSend(v8, "propertyFlags") & 0x40) != 0;
  v15->_isMySports = (objc_msgSend(v8, "propertyFlags") & 0x80) != 0;
  v15->_isPuzzleHub = ((unsigned __int16)objc_msgSend(v8, "propertyFlags") >> 8) & 1;
  v15->_hasEvergreenArticleList = objc_msgSend(v8, "propertyFlagsLocalized") & 1;
  -[FCTag identifier](v15, "identifier");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v15->_isPuzzleType = +[FCPuzzleType isPuzzleTypeIdentifier:](FCPuzzleType, "isPuzzleTypeIdentifier:", v287);

  v15->_isSportsRecommendable = objc_msgSend(v8, "isSportsRecommendable");
  objc_msgSend(v8, "generateSportsLogoImageAssetHandleWithAssetManager:", v9);
  v288 = objc_claimAutoreleasedReturnValue();
  sportsLogoImageAssetHandle = v15->_sportsLogoImageAssetHandle;
  v15->_sportsLogoImageAssetHandle = (FCAssetHandle *)v288;

  objc_msgSend(v8, "generateSportsLogoImageCompactAssetHandleWithAssetManager:", v9);
  v290 = objc_claimAutoreleasedReturnValue();
  sportsLogoImageCompactAssetHandle = v15->_sportsLogoImageCompactAssetHandle;
  v15->_sportsLogoImageCompactAssetHandle = (FCAssetHandle *)v290;

  objc_msgSend(v8, "generateSportsLogoImageLargeAssetHandleWithAssetManager:", v9);
  v292 = objc_claimAutoreleasedReturnValue();
  sportsLogoImageLargeAssetHandle = v15->_sportsLogoImageLargeAssetHandle;
  v15->_sportsLogoImageLargeAssetHandle = (FCAssetHandle *)v292;

  objc_msgSend(v8, "generateSportsLogoAltImageAssetHandleWithAssetManager:", v9);
  v294 = objc_claimAutoreleasedReturnValue();
  sportsLogoAltImageAssetHandle = v15->_sportsLogoAltImageAssetHandle;
  v15->_sportsLogoAltImageAssetHandle = (FCAssetHandle *)v294;

  objc_msgSend(v8, "generateSportsLogoAltImageCompactAssetHandleWithAssetManager:", v9);
  v296 = objc_claimAutoreleasedReturnValue();
  sportsLogoAltImageCompactAssetHandle = v15->_sportsLogoAltImageCompactAssetHandle;
  v15->_sportsLogoAltImageCompactAssetHandle = (FCAssetHandle *)v296;

  objc_msgSend(v8, "generateSportsLogoAltImageLargeAssetHandleWithAssetManager:", v9);
  v298 = objc_claimAutoreleasedReturnValue();
  sportsLogoAltImageLargeAssetHandle = v15->_sportsLogoAltImageLargeAssetHandle;
  v15->_sportsLogoAltImageLargeAssetHandle = (FCAssetHandle *)v298;

  objc_msgSend(v8, "sportsData");
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v301 = objc_msgSend(v300, "length");

  if (v301)
  {
    objc_msgSend(v8, "sportsData");
    v302 = objc_claimAutoreleasedReturnValue();
    sportsData = v15->_sportsData;
    v15->_sportsData = (NSString *)v302;

    v304 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "sportsData");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "fc_dictionaryFromJSON:", v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();

    v307 = v306;
    v308 = -[FCSportsData initWithDictionary:]([FCSportsData alloc], "initWithDictionary:", v307);

    -[FCSportsData UMCCanonicalID](v308, "UMCCanonicalID");
    v309 = objc_claimAutoreleasedReturnValue();
    UMCCanonicalID = v15->_UMCCanonicalID;
    v15->_UMCCanonicalID = (NSString *)v309;

    -[FCSportsData sportsPrimaryName](v308, "sportsPrimaryName");
    v311 = objc_claimAutoreleasedReturnValue();
    sportsPrimaryName = v15->_sportsPrimaryName;
    v15->_sportsPrimaryName = (NSString *)v311;

    -[FCSportsData sportsNameAbbreviation](v308, "sportsNameAbbreviation");
    v313 = objc_claimAutoreleasedReturnValue();
    sportsNameAbbreviation = v15->_sportsNameAbbreviation;
    v15->_sportsNameAbbreviation = (NSString *)v313;

    -[FCSportsData sportsSecondaryName](v308, "sportsSecondaryName");
    v315 = objc_claimAutoreleasedReturnValue();
    sportsSecondaryName = v15->_sportsSecondaryName;
    v15->_sportsSecondaryName = (NSString *)v315;

    -[FCSportsData sportsSecondaryShortName](v308, "sportsSecondaryShortName");
    v317 = objc_claimAutoreleasedReturnValue();
    sportsSecondaryShortName = v15->_sportsSecondaryShortName;
    v15->_sportsSecondaryShortName = (NSString *)v317;

    -[FCSportsData sportsFullName](v308, "sportsFullName");
    v319 = objc_claimAutoreleasedReturnValue();
    sportsFullName = v15->_sportsFullName;
    v15->_sportsFullName = (NSString *)v319;

    -[FCSportsData topLevelSportTagIdentifier](v308, "topLevelSportTagIdentifier");
    v321 = objc_claimAutoreleasedReturnValue();
    topLevelSportTagIdentifier = v15->_topLevelSportTagIdentifier;
    v15->_topLevelSportTagIdentifier = (NSString *)v321;

    -[FCSportsData topLevelGroupsTagIdentifiers](v308, "topLevelGroupsTagIdentifiers");
    v323 = objc_claimAutoreleasedReturnValue();
    topLevelGroupsTagIdentifiers = v15->_topLevelGroupsTagIdentifiers;
    v15->_topLevelGroupsTagIdentifiers = (NSArray *)v323;

    -[FCSportsData sportsNickname](v308, "sportsNickname");
    v325 = objc_claimAutoreleasedReturnValue();
    sportsNickname = v15->_sportsNickname;
    v15->_sportsNickname = (NSString *)v325;

    -[FCSportsData sportsLocation](v308, "sportsLocation");
    v327 = objc_claimAutoreleasedReturnValue();
    sportsLocation = v15->_sportsLocation;
    v15->_sportsLocation = (NSString *)v327;

    v15->_hideLocationInMasthead = -[FCSportsData hideLocationInMasthead](v308, "hideLocationInMasthead");
    v15->_sportsType = -[FCSportsData sportsType](v308, "sportsType");
    -[FCSportsData sportsTypeDisplayName](v308, "sportsTypeDisplayName");
    v329 = objc_claimAutoreleasedReturnValue();
    sportsTypeDisplayName = v15->_sportsTypeDisplayName;
    v15->_sportsTypeDisplayName = (NSString *)v329;

    -[FCSportsData sportsTypePluralizedDisplayName](v308, "sportsTypePluralizedDisplayName");
    v331 = objc_claimAutoreleasedReturnValue();
    sportsTypePluralizedDisplayName = v15->_sportsTypePluralizedDisplayName;
    v15->_sportsTypePluralizedDisplayName = (NSString *)v331;

    v15->_sportsLeagueType = -[FCSportsData sportsLeagueType](v308, "sportsLeagueType");
  }
  objc_msgSend(v8, "sportsTheme");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  v334 = objc_msgSend(v333, "length");

  if (v334)
  {
    v335 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "sportsTheme");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v335, "fc_dictionaryFromJSON:", v336);
    v337 = (void *)objc_claimAutoreleasedReturnValue();

    v338 = v337;
    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("primaryColor"));
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v339);
    v340 = objc_claimAutoreleasedReturnValue();
    sportsPrimaryColor = v15->_sportsPrimaryColor;
    v15->_sportsPrimaryColor = (FCColor *)v340;

    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("secondaryColor"));
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v342);
    v343 = objc_claimAutoreleasedReturnValue();
    sportsSecondaryColor = v15->_sportsSecondaryColor;
    v15->_sportsSecondaryColor = (FCColor *)v343;

    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("sportsEventNavigationForegroundColor"));
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v345);
    v346 = objc_claimAutoreleasedReturnValue();
    sportsEventNavigationForegroundColor = v15->_sportsEventNavigationForegroundColor;
    v15->_sportsEventNavigationForegroundColor = (FCColor *)v346;

    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("sportsLogoMastheadHorizontalPaddingOffset"));
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_sportsLogoMastheadHorizontalPaddingOffset = objc_msgSend(v348, "integerValue");
    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("sportsLogoMastheadLeadingOffset"));
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_sportsLogoMastheadLeadingOffset = objc_msgSend(v349, "integerValue");
    objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("sportsLogoMastheadVisibility"));
    v350 = (void *)objc_claimAutoreleasedReturnValue();

    v15->_sportsLogoMastheadVisibility = (unint64_t)FCMastheadLogoVisibilityFromString(v350);
  }
  objc_msgSend(v8, "publisherSpecifiedArticleIDs");
  v351 = objc_claimAutoreleasedReturnValue();
  publisherSpecifiedArticleIDs = v15->_publisherSpecifiedArticleIDs;
  v15->_publisherSpecifiedArticleIDs = (NSArray *)v351;

  v353 = *(void **)(v22 + 3432);
  objc_msgSend(v8, "publisherSpecifiedArticleIDsModifiedDate");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v353, "dateWithPBDate:", v354);
  v355 = objc_claimAutoreleasedReturnValue();
  publisherSpecifiedArticleIDsModifiedDate = v15->_publisherSpecifiedArticleIDsModifiedDate;
  v15->_publisherSpecifiedArticleIDsModifiedDate = (NSDate *)v355;

  if (objc_msgSend(v8, "hasPublisherSpecifiedArticlesJson"))
  {
    v406 = v9;
    v357 = (void *)MEMORY[0x1E0C99D80];
    obja = v8;
    objc_msgSend(v8, "publisherSpecifiedArticlesJson");
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v357, "fc_dictionaryFromJSON:", v358);
    v359 = (void *)objc_claimAutoreleasedReturnValue();

    v410 = v359;
    objc_msgSend(v359, "objectForKeyedSubscript:", CFSTR("articles"));
    v360 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v419 = 0u;
    v420 = 0u;
    v421 = 0u;
    v422 = 0u;
    v362 = v360;
    v363 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v419, buf, 16);
    if (v363)
    {
      v364 = v363;
      v365 = *(_QWORD *)v420;
      do
      {
        for (i = 0; i != v364; ++i)
        {
          if (*(_QWORD *)v420 != v365)
            objc_enumerationMutation(v362);
          v367 = -[FCPublisherSpecifiedArticle initWithDictionary:]([FCPublisherSpecifiedArticle alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v419 + 1) + 8 * i));
          -[FCPublisherSpecifiedArticle articleID](v367, "articleID");
          v368 = (void *)objc_claimAutoreleasedReturnValue();
          v369 = objc_msgSend(v368, "length");

          if (v369)
          {
            -[FCPublisherSpecifiedArticle articleID](v367, "articleID");
            v370 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v361, "setObject:forKeyedSubscript:", v367, v370);

          }
        }
        v364 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v419, buf, 16);
      }
      while (v364);
    }

    if (objc_msgSend(v361, "count"))
      v371 = v361;
    else
      v371 = 0;
    objc_storeStrong((id *)&v15->_publisherSpecifiedArticles, v371);

    v8 = obja;
    v9 = v406;
  }
  objc_msgSend(v8, "paidBundlePaywallConfigurationJson");
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v373 = objc_msgSend(v372, "length");

  if (v373)
  {
    v374 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "paidBundlePaywallConfigurationJson");
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v374, "fc_dictionaryFromJSON:", v375);
    v376 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v376, "allKeys");
    paidBundlePaywallConfiguration = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(paidBundlePaywallConfiguration, "count"))
    {
      objc_msgSend(v376, "allKeys");
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      v379 = objc_msgSend(v378, "containsObject:", CFSTR("subscriptionButton"));

      if (!v379)
      {
LABEL_72:

        goto LABEL_73;
      }
      v380 = -[FCPaywallConfiguration initWithConfigDictionary:]([FCPaywallConfiguration alloc], "initWithConfigDictionary:", v376);
      paidBundlePaywallConfiguration = v15->_paidBundlePaywallConfiguration;
      v15->_paidBundlePaywallConfiguration = v380;
    }

    goto LABEL_72;
  }
LABEL_73:
  -[FCTag sportsRecommendationMappingsJSON](v15, "sportsRecommendationMappingsJSON");
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  v382 = objc_msgSend(v381, "length");

  if (v382)
  {
    -[FCTag sportsRecommendationMappingsJSON](v15, "sportsRecommendationMappingsJSON");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    if (v383)
    {
      v417 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v383, 0, &v417);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v385 = v417;
      if (v385)
      {
        v386 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v385;
          _os_log_error_impl(&dword_1A1B90000, v386, OS_LOG_TYPE_ERROR, "failed to parse sports recommendation JSON with error: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v387 = -[FCSportsRecommendationMappings initWithDictionary:]([FCSportsRecommendationMappings alloc], "initWithDictionary:", v384);
        sportsRecommendationMappings = v15->_sportsRecommendationMappings;
        v15->_sportsRecommendationMappings = v387;

      }
    }

  }
  FCTagAdjustName(v15->_name, v15->_isMySports);
  v389 = objc_claimAutoreleasedReturnValue();
  name = v15->_name;
  v15->_name = (NSString *)v389;

  FCTagAdjustName(v15->_nameCompact, v15->_isMySports);
  v391 = objc_claimAutoreleasedReturnValue();
  v392 = v15->_nameCompact;
  v15->_nameCompact = (NSString *)v391;

  objc_autoreleasePoolPop(context);
LABEL_82:

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)purchaseOfferableConfigurationsFromProtobufList:(void *)a1
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  FCPurchaseOfferableConfiguration *v8;
  void *v9;
  FCPurchaseOfferableConfiguration *v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v8 = [FCPurchaseOfferableConfiguration alloc];
        objc_msgSend(v7, "purchaseId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[FCPurchaseOfferableConfiguration initWithPurchaseID:allowsPublisherPhoneApp:allowsPublisherPadApp:allowsPublisherWebsite:preferredOffer:](v8, "initWithPurchaseID:allowsPublisherPhoneApp:allowsPublisherPadApp:allowsPublisherWebsite:preferredOffer:", v9, objc_msgSend(v7, "allowsPublisherPhoneApp"), objc_msgSend(v7, "allowsPublisherPadApp"), objc_msgSend(v7, "allowsPublisherWebSite"), objc_msgSend(v7, "preferredOffer"));

        objc_msgSend(v2, "addObject:", v10);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = (void *)objc_msgSend(v2, "copy");
  return v11;
}

- (FCTag)initWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  FCTag *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  FCTag *name;
  void *v16;
  objc_super v17;
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
  v8 = a4;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != 0");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCTag initWithTagType:identifier:name:]";
    v20 = 2080;
    v21 = "FCTag.m";
    v22 = 1024;
    v23 = 323;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v17.receiver = self;
  v17.super_class = (Class)FCTag;
  v10 = -[FCTag init](&v17, sel_init);
  if (v10)
  {
    if (objc_msgSend(v8, "length"))
    {
      v10->_tagType = a3;
      v11 = objc_msgSend(v8, "copy");
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v11;

      v13 = objc_msgSend(v9, "copy");
      name = (FCTag *)v10->_name;
      v10->_name = (NSString *)v13;
    }
    else
    {
      name = v10;
      v10 = 0;
    }

  }
  return v10;
}

- (NSData)sportsRecommendationMappingsJSON
{
  void *v2;
  void *v3;
  void *v4;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sportsRecommendationMappingsJson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_gzipInflate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NTPBTagRecord)tagRecord
{
  return self->_tagRecord;
}

- (FCTagBanner)bannerImageForThemeBackground
{
  void *v3;
  FCTagBanner *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCTag nameImageForDarkBackgroundAssetHandle](self, "nameImageForDarkBackgroundAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_bannerImageForThemeBackground;
  }
  else
  {
    -[FCTag nameImageAssetHandle](self, "nameImageAssetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCTag bannerImageForWhiteBackground](self, "bannerImageForWhiteBackground");
      v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FCTag nameImageMaskAssetHandle](self, "nameImageMaskAssetHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[FCTag bannerImageForMask](self, "bannerImageForMask");
        v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FCTag nameImageCompactAssetHandle](self, "nameImageCompactAssetHandle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[FCTag compactBannerImage](self, "compactBannerImage");
          v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCTagBanner)bannerImageForWhiteBackground
{
  void *v3;
  FCTagBanner *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCTag nameImageAssetHandle](self, "nameImageAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_bannerImageForWhiteBackground;
  }
  else
  {
    -[FCTag nameImageForDarkBackgroundAssetHandle](self, "nameImageForDarkBackgroundAssetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCTag bannerImageForThemeBackground](self, "bannerImageForThemeBackground");
      v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FCTag nameImageMaskAssetHandle](self, "nameImageMaskAssetHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[FCTag bannerImageForMask](self, "bannerImageForMask");
        v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FCTag nameImageCompactAssetHandle](self, "nameImageCompactAssetHandle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[FCTag compactBannerImage](self, "compactBannerImage");
          v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCAssetHandle)nameImageAssetHandle
{
  return self->_nameImageAssetHandle;
}

- (FCAssetHandle)nameImageForDarkBackgroundAssetHandle
{
  return self->_nameImageForDarkBackgroundAssetHandle;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPurchaseSetup
{
  void *v2;
  BOOL v3;

  -[FCTag publisherPaidOfferableConfigurations](self, "publisherPaidOfferableConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)publisherPaidOfferableConfigurations
{
  return self->_publisherPaidOfferableConfigurations;
}

- (FCTagBanner)bannerImageForMask
{
  void *v3;
  FCTagBanner *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCTag nameImageMaskAssetHandle](self, "nameImageMaskAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_bannerImageForMask;
  }
  else
  {
    -[FCTag nameImageForDarkBackgroundAssetHandle](self, "nameImageForDarkBackgroundAssetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCTag bannerImageForThemeBackground](self, "bannerImageForThemeBackground");
      v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FCTag nameImageAssetHandle](self, "nameImageAssetHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[FCTag bannerImageForWhiteBackground](self, "bannerImageForWhiteBackground");
        v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FCTag nameImageCompactAssetHandle](self, "nameImageCompactAssetHandle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[FCTag compactBannerImage](self, "compactBannerImage");
          v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCAssetHandle)nameImageMaskAssetHandle
{
  return self->_nameImageMaskAssetHandle;
}

- (NSArray)currentIssueIDs
{
  return self->_currentIssueIDs;
}

- (FCContentManifest)contentManifest
{
  void *v2;
  void *v3;
  void *v4;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentManifest *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagRecordInterestToken, 0);
  objc_storeStrong((id *)&self->_tagRecord, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_lazyContentColorMap, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_adBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedControlColorHexString, 0);
  objc_storeStrong((id *)&self->_feedControlColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeSeparatorColorHexString, 0);
  objc_storeStrong((id *)&self->_navigationChromeSeparatorColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleForegroundColorHexString, 0);
  objc_storeStrong((id *)&self->_foregroundColorHexString, 0);
  objc_storeStrong((id *)&self->_darkStyleBackgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_backgroundColorHexString, 0);
  objc_storeStrong((id *)&self->_sectionFeedConfigurations, 0);
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_tagInterestToken, 0);
  objc_storeStrong((id *)&self->_pptFeedIDOverride, 0);
  objc_storeStrong((id *)&self->_feedMastheadType, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_adBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleAdBackgroundColor, 0);
  objc_storeStrong((id *)&self->_adBackgroundColor, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedControlColor, 0);
  objc_storeStrong((id *)&self->_feedControlColor, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_feedBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleFeedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sportsEventNavigationForegroundColor, 0);
  objc_storeStrong((id *)&self->_topLevelGroupsTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_topLevelSportTagIdentifier, 0);
  objc_storeStrong((id *)&self->_sportsRecommendationMappings, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryColor, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryColor, 0);
  objc_storeStrong((id *)&self->_sportsTypePluralizedDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsTypeDisplayName, 0);
  objc_storeStrong((id *)&self->_sportsLocation, 0);
  objc_storeStrong((id *)&self->_sportsNickname, 0);
  objc_storeStrong((id *)&self->_sportsFullName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryShortName, 0);
  objc_storeStrong((id *)&self->_sportsSecondaryName, 0);
  objc_storeStrong((id *)&self->_sportsNameAbbreviation, 0);
  objc_storeStrong((id *)&self->_sportsPrimaryName, 0);
  objc_storeStrong((id *)&self->_UMCCanonicalID, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoAltImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsLogoImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_sportsData, 0);
  objc_storeStrong((id *)&self->_titleDisplaySuffix, 0);
  objc_storeStrong((id *)&self->_titleDisplayPrefix, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_loadDate, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_groupDarkStyleTitleColorHexString, 0);
  objc_storeStrong((id *)&self->_groupTitleColorHexString, 0);
  objc_storeStrong((id *)&self->_supergroupKnobs, 0);
  objc_storeStrong((id *)&self->_supergroupKnobsJson, 0);
  objc_storeStrong((id *)&self->_supergroupConfigJson, 0);
  objc_storeStrong((id *)&self->_paidBundlePaywallConfiguration, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticles, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDsModifiedDate, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_nameImageLargeMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageLargeAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskWidgetHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskWidgetLQAssetHandle, 0);
  objc_storeStrong((id *)&self->_publisherPaidDescriptionStrings, 0);
  objc_storeStrong((id *)&self->_publisherPaidOfferableConfigurations, 0);
  objc_storeStrong((id *)&self->_publisherPaidBundlePurchaseIDs, 0);
  objc_storeStrong((id *)&self->_publisherPaidFeldsparablePurchaseIDs, 0);
  objc_storeStrong((id *)&self->_publisherPaidWebAccessURL, 0);
  objc_storeStrong((id *)&self->_publisherPaidVerificationURL, 0);
  objc_storeStrong((id *)&self->_publisherPaidAuthorizationURL, 0);
  objc_storeStrong((id *)&self->_compactBannerImage, 0);
  objc_storeStrong((id *)&self->_bannerImageForMask, 0);
  objc_storeStrong((id *)&self->_bannerImageForThemeBackground, 0);
  objc_storeStrong((id *)&self->_bannerImageForWhiteBackground, 0);
  objc_storeStrong((id *)&self->_defaultHeadlineTemplate, 0);
  objc_storeStrong((id *)&self->_defaultSectionID, 0);
  objc_storeStrong((id *)&self->_sectionIDs, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_headlineBylineTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineExcerptTextInfo, 0);
  objc_storeStrong((id *)&self->_headlineTitleTextInfo, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundGradient, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageLarge, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImageCompact, 0);
  objc_storeStrong((id *)&self->_darkStyleNavigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_navigationChromeBackgroundImage, 0);
  objc_storeStrong((id *)&self->_feedNavImageHQAssetHandle, 0);
  objc_storeStrong((id *)&self->_feedNavImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_logoImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageMaskAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackgroundAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageCompactAssetHandle, 0);
  objc_storeStrong((id *)&self->_nameImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_adTargetingKeywords, 0);
  objc_storeStrong((id *)&self->_superfeedConfigResourceID, 0);
  objc_storeStrong((id *)&self->_magazineGenre, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_backIssuesListID, 0);
  objc_storeStrong((id *)&self->_recentIssueIDs, 0);
  objc_storeStrong((id *)&self->_currentIssueIDs, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_highlightsArticleListID, 0);
  objc_storeStrong((id *)&self->_replacementID, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_nameCompact, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_versionKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (FCTag)initWithTagMetadata:(id)a3 assetManager:(id)a4 isSports:(BOOL)a5
{
  id v8;
  id v9;
  FCTag *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *sportsPrimaryName;
  uint64_t v17;
  NSString *sportsSecondaryName;
  uint64_t v19;
  NSString *sportsSecondaryShortName;
  uint64_t v21;
  NSString *sportsFullName;
  void *v23;
  uint64_t v24;
  FCColor *sportsPrimaryColor;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSString *groupTitleColorHexString;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _WORD *v34;
  unint64_t v35;
  CGFloat v36;
  unint64_t v37;
  CGFloat v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  double v48;
  unint64_t v49;
  unint64_t v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  uint64_t v54;
  FCAssetHandle *nameImageAssetHandle;
  FCTagBanner *v56;
  FCTagBanner *bannerImageForWhiteBackground;
  void *v58;
  uint64_t v59;
  FCAssetHandle *coverImageAssetHandle;
  void *v61;
  uint64_t v62;
  FCAssetHandle *feedNavImageAssetHandle;
  void *v64;
  uint64_t v65;
  FCAssetHandle *nameImageForDarkBackgroundAssetHandle;
  FCTagBanner *v67;
  FCTagBanner *bannerImageForThemeBackground;
  void *v69;
  uint64_t v70;
  FCAssetHandle *nameImageMaskAssetHandle;
  FCTagBanner *v72;
  FCTagBanner *bannerImageForMask;
  void *v74;
  uint64_t v75;
  FCAssetHandle *sportsLogoImageCompactAssetHandle;
  objc_super v78;

  v8 = a3;
  v9 = a4;
  v78.receiver = self;
  v78.super_class = (Class)FCTag;
  v10 = -[FCTag init](&v78, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_msgSend(v8, "identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;

    v10->_tagType = objc_msgSend(v8, "tagType");
    v10->_isSports = a5;
    objc_msgSend(v8, "sportsPrimaryName");
    v15 = objc_claimAutoreleasedReturnValue();
    sportsPrimaryName = v10->_sportsPrimaryName;
    v10->_sportsPrimaryName = (NSString *)v15;

    objc_msgSend(v8, "sportsSecondaryName");
    v17 = objc_claimAutoreleasedReturnValue();
    sportsSecondaryName = v10->_sportsSecondaryName;
    v10->_sportsSecondaryName = (NSString *)v17;

    objc_msgSend(v8, "sportsSecondaryShortName");
    v19 = objc_claimAutoreleasedReturnValue();
    sportsSecondaryShortName = v10->_sportsSecondaryShortName;
    v10->_sportsSecondaryShortName = (NSString *)v19;

    objc_msgSend(v8, "sportsFullName");
    v21 = objc_claimAutoreleasedReturnValue();
    sportsFullName = v10->_sportsFullName;
    v10->_sportsFullName = (NSString *)v21;

    v10->_sportsLeagueType = objc_msgSend(v8, "sportsLeagueType");
    objc_msgSend(v8, "sportsPrimaryColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    sportsPrimaryColor = v10->_sportsPrimaryColor;
    v10->_sportsPrimaryColor = (FCColor *)v24;

    v26 = objc_msgSend(v8, "isAthlete");
    v27 = 4;
    if (!v26)
      v27 = 0;
    v10->_sportsType = v27;
    v10->_isLocal = objc_msgSend(v8, "isLocalNews");
    objc_msgSend(v8, "groupTitleColor");
    v28 = objc_claimAutoreleasedReturnValue();
    groupTitleColorHexString = v10->_groupTitleColorHexString;
    v10->_groupTitleColorHexString = (NSString *)v28;

    objc_msgSend(v8, "nameImageMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "dataUsingEncoding:", 4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v34 = (_WORD *)objc_msgSend(objc_retainAutorelease(v32), "bytes");
        LOWORD(v35) = *v34;
        v36 = (double)v35;
        LOWORD(v37) = v34[1];
        v38 = (double)v37;
        v10->_nameImageSize.width = v36;
        v10->_nameImageSize.height = v38;
        LOWORD(v36) = v34[2];
        v39 = (double)*(unint64_t *)&v36;
        LOWORD(v38) = v34[5];
        v40 = (double)*(unint64_t *)&v38;
        LOWORD(v41) = v34[4];
        v42 = (double)v41;
        LOWORD(v43) = v34[3];
        v44 = (double)v43;
        v10->_nameImageInsets.top = v39;
        v10->_nameImageInsets.left = v40;
        v10->_nameImageInsets.bottom = v42;
        v10->_nameImageInsets.right = v44;
        LOWORD(v39) = v34[6];
        LOWORD(v40) = v34[7];
        LOWORD(v42) = v34[8];
        LOWORD(v44) = v34[11];
        LOWORD(v45) = v34[10];
        LOWORD(v46) = v34[9];
        v10->_nameImageForDarkBackgroundSize.width = (double)*(unint64_t *)&v39;
        v10->_nameImageForDarkBackgroundSize.height = (double)*(unint64_t *)&v40;
        v47 = (double)*(unint64_t *)&v42;
        v48 = (double)*(unint64_t *)&v44;
        *(double *)&v49 = (double)v45;
        *(double *)&v50 = (double)v46;
        v10->_nameImageForDarkBackgroundInsets.top = v47;
        v10->_nameImageForDarkBackgroundInsets.left = v48;
        v10->_nameImageForDarkBackgroundInsets.bottom = (double)v45;
        v10->_nameImageForDarkBackgroundInsets.right = (double)v46;
        LOWORD(v47) = v34[12];
        v51 = (double)*(unint64_t *)&v47;
        LOWORD(v48) = v34[13];
        v52 = (double)*(unint64_t *)&v48;
        v10->_nameImageMaskSize.width = v51;
        v10->_nameImageMaskSize.height = v52;
        LOWORD(v51) = v34[14];
        LOWORD(v52) = v34[17];
        LOWORD(v49) = v34[16];
        LOWORD(v50) = v34[15];
        v10->_nameImageMaskInsets.top = (double)*(unint64_t *)&v51;
        v10->_nameImageMaskInsets.left = (double)*(unint64_t *)&v52;
        v10->_nameImageMaskInsets.bottom = (double)v49;
        v10->_nameImageMaskInsets.right = (double)v50;
      }

    }
    objc_msgSend(v8, "nameImage");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v53, 0);
      v54 = objc_claimAutoreleasedReturnValue();
      nameImageAssetHandle = v10->_nameImageAssetHandle;
      v10->_nameImageAssetHandle = (FCAssetHandle *)v54;

      v56 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageAssetHandle, v10->_nameImageSize.width, v10->_nameImageSize.height, v10->_nameImageInsets.top, v10->_nameImageInsets.left, v10->_nameImageInsets.bottom, v10->_nameImageInsets.right);
      bannerImageForWhiteBackground = v10->_bannerImageForWhiteBackground;
      v10->_bannerImageForWhiteBackground = v56;

    }
    objc_msgSend(v8, "coverImage");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v58, 0);
      v59 = objc_claimAutoreleasedReturnValue();
      coverImageAssetHandle = v10->_coverImageAssetHandle;
      v10->_coverImageAssetHandle = (FCAssetHandle *)v59;

    }
    objc_msgSend(v8, "feedNavImage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v61, 0);
      v62 = objc_claimAutoreleasedReturnValue();
      feedNavImageAssetHandle = v10->_feedNavImageAssetHandle;
      v10->_feedNavImageAssetHandle = (FCAssetHandle *)v62;

    }
    objc_msgSend(v8, "nameImageForDarkBackground");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v64, 0);
      v65 = objc_claimAutoreleasedReturnValue();
      nameImageForDarkBackgroundAssetHandle = v10->_nameImageForDarkBackgroundAssetHandle;
      v10->_nameImageForDarkBackgroundAssetHandle = (FCAssetHandle *)v65;

      v67 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageForDarkBackgroundAssetHandle, v10->_nameImageForDarkBackgroundSize.width, v10->_nameImageForDarkBackgroundSize.height, v10->_nameImageForDarkBackgroundInsets.top, v10->_nameImageForDarkBackgroundInsets.left, v10->_nameImageForDarkBackgroundInsets.bottom, v10->_nameImageForDarkBackgroundInsets.right);
      bannerImageForThemeBackground = v10->_bannerImageForThemeBackground;
      v10->_bannerImageForThemeBackground = v67;

    }
    objc_msgSend(v8, "nameImageMask");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v69, 0);
      v70 = objc_claimAutoreleasedReturnValue();
      nameImageMaskAssetHandle = v10->_nameImageMaskAssetHandle;
      v10->_nameImageMaskAssetHandle = (FCAssetHandle *)v70;

      v72 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v10->_nameImageMaskAssetHandle, v10->_nameImageMaskSize.width, v10->_nameImageMaskSize.height, v10->_nameImageMaskInsets.top, v10->_nameImageMaskInsets.left, v10->_nameImageMaskInsets.bottom, v10->_nameImageMaskInsets.right);
      bannerImageForMask = v10->_bannerImageForMask;
      v10->_bannerImageForMask = v72;

    }
    objc_msgSend(v8, "sportsLogoImageCompact");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v74, 0);
      v75 = objc_claimAutoreleasedReturnValue();
      sportsLogoImageCompactAssetHandle = v10->_sportsLogoImageCompactAssetHandle;
      v10->_sportsLogoImageCompactAssetHandle = (FCAssetHandle *)v75;

    }
  }

  return v10;
}

- (FCTag)initWithData:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  FCTag *v10;
  void *v11;
  FCTag *v12;

  v6 = (objc_class *)MEMORY[0x1E0D62848];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithData:", v8);

  v10 = [FCTag alloc];
  objc_msgSend(v7, "assetManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FCTag initWithTagRecord:assetManager:interestToken:](v10, "initWithTagRecord:assetManager:interestToken:", v9, v11, 0);
  return v12;
}

- (unint64_t)userFacingTagType
{
  unint64_t result;

  result = self->_userFacingTagTypeOverride;
  if (!result)
  {
    result = -[FCTag tagType](self, "tagType");
    if (result != 2)
      return result == 1;
  }
  return result;
}

- (NSArray)loadableFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTag headlineTitleTextInfo](self, "headlineTitleTextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[FCTag headlineExcerptTextInfo](self, "headlineExcerptTextInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  -[FCTag headlineBylineTextInfo](self, "headlineBylineTextInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addObject:", v9);

  return (NSArray *)v3;
}

- (BOOL)isBlockedExplicitContent
{
  void *v3;
  char v4;
  void *v5;

  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isExplicitContentAllowed") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[FCTag primaryAudience](self, "primaryAudience");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("MATURE"));

  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTag name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("name"), v4);

  -[FCTag identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("ID"), v5);

  objc_msgSend(v3, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)groupName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[FCTag titleDisplayPrefix](self, "titleDisplayPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCTag titleDisplayPrefix](self, "titleDisplayPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  if (self->_name)
    objc_msgSend(v3, "appendString:");
  -[FCTag titleDisplaySuffix](self, "titleDisplaySuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FCTag titleDisplaySuffix](self, "titleDisplaySuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v8;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[FCTag asSports](self, "asSports");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "sportsType"), v5 <= 0xB))
  {
    if (((1 << v5) & 0xFDB) != 0)
      objc_msgSend(v4, "sportsFullName");
    else
      objc_msgSend(v4, "sportsPrimaryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[FCTag name](self, "name");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    -[FCTag name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (NSString)compactDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FCTag asSports](self, "asSports");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "sportsSecondaryShortName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    FCBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_1E464BC40, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCTag mainCompactDisplayName](self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsSecondaryShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithFormat:", v8, v9, v10);

  }
  else
  {
    -[FCTag mainCompactDisplayName](self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v11;
}

- (id)mainCompactDisplayName
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "nameCompact");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2
      && (v3 = (void *)v2,
          objc_msgSend(v1, "nameCompact"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToString:", &stru_1E464BC40),
          v4,
          v3,
          (v5 & 1) == 0))
    {
      objc_msgSend(v1, "nameCompact");
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "asSports");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "sportsPrimaryName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          objc_msgSend(v1, "displayName");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v1 = v10;

      }
      else
      {
        objc_msgSend(v1, "displayName");
        v1 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  return v1;
}

id __60__FCTag__inflateFromVersionlessJSONDictionary_URLGenerator___block_invoke(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("fontName"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("fontResourceID"));

  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

FCContentColorMap *__61__FCTag__inflateFromJSONDictionary_withVersion_URLGenerator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  __objc2_class **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __objc2_class **v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  FCContentColorPair *v20;
  FCContentColorMap *v21;
  FCContentColorMap *v23;
  void *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = *(id *)(a1 + 32);
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v28;
      v5 = CFSTR("light");
      v6 = CFSTR("dark");
      v7 = off_1E4634000;
      do
      {
        v8 = 0;
        v25 = v3;
        do
        {
          if (*(_QWORD *)v28 != v4)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
          objc_msgSend(v9, "objectForKeyedSubscript:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class nullableColorWithHexString:](v7[71], "nullableColorWithHexString:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class nullableColorWithHexString:](v7[71], "nullableColorWithHexString:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v12)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            v16 = v7;
            v17 = v6;
            v18 = v5;
            v19 = v4;
            v20 = -[FCContentColorPair initWithLightColor:darkColor:]([FCContentColorPair alloc], "initWithLightColor:darkColor:", v12, v13);
            objc_msgSend(v24, "addObject:", v20);

            v4 = v19;
            v5 = v18;
            v6 = v17;
            v7 = v16;
            v3 = v25;
          }

          ++v8;
        }
        while (v3 != v8);
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v3);
    }

    v21 = -[FCContentColorMap initWithColors:]([FCContentColorMap alloc], "initWithColors:", v24);
    return v21;
  }
  else
  {
    v23 = [FCContentColorMap alloc];
    return -[FCContentColorMap initWithColors:](v23, "initWithColors:", MEMORY[0x1E0C9AA60]);
  }
}

- (id)initForTestingWithTagType:(unint64_t)a3 identifier:(id)a4 name:(id)a5 umcCanonicalID:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *identifier;
  NSString *v15;
  NSString *name;
  NSString *v17;
  NSString *UMCCanonicalID;
  void *v20;
  _BYTE v21[22];
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self)
  {
    if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != 0");
      *(_DWORD *)v21 = 136315906;
      *(_QWORD *)&v21[4] = "-[FCTag initWithTagType:identifier:name:umcCanonicalID:]";
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "FCTag.m";
      v22 = 1024;
      v23 = 344;
      v24 = 2114;
      v25 = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v21, 0x26u);

    }
    *(_QWORD *)v21 = self;
    *(_QWORD *)&v21[8] = FCTag;
    self = (FCTag *)objc_msgSendSuper2((objc_super *)v21, sel_init);
    if (self)
    {
      if (objc_msgSend(v10, "length"))
      {
        self->_tagType = a3;
        v13 = (NSString *)objc_msgSend(v10, "copy");
        identifier = self->_identifier;
        self->_identifier = v13;

        v15 = (NSString *)objc_msgSend(v11, "copy");
        name = self->_name;
        self->_name = v15;

        v17 = (NSString *)objc_msgSend(v12, "copy");
        UMCCanonicalID = self->_UMCCanonicalID;
        self->_UMCCanonicalID = v17;

        self->_isSports = 1;
      }
      else
      {

        self = 0;
      }
    }
  }

  return self;
}

- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 defaultSection:(id)a5 publisherAuthorizationURL:(id)a6 publisherVerificationURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCTag *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSString *defaultSectionID;
  uint64_t v24;
  NSString *publisherPaidAuthorizationURL;
  uint64_t v26;
  FCTag *publisherPaidVerificationURL;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!objc_msgSend(v12, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCTag initChannelForTestingWithIdentifier:name:defaultSection:publisherAuthorizationURL:publisherVerificationURL:]";
    v33 = 2080;
    v34 = "FCTag.m";
    v35 = 1024;
    v36 = 1058;
    v37 = 2114;
    v38 = v29;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v30.receiver = self;
  v30.super_class = (Class)FCTag;
  v17 = -[FCTag init](&v30, sel_init);
  if (v17)
  {
    if (objc_msgSend(v12, "length"))
    {
      v17->_tagType = 2;
      v18 = objc_msgSend(v12, "copy");
      identifier = v17->_identifier;
      v17->_identifier = (NSString *)v18;

      v20 = objc_msgSend(v13, "copy");
      name = v17->_name;
      v17->_name = (NSString *)v20;

      v22 = objc_msgSend(v14, "copy");
      defaultSectionID = v17->_defaultSectionID;
      v17->_defaultSectionID = (NSString *)v22;

      v24 = objc_msgSend(v15, "copy");
      publisherPaidAuthorizationURL = v17->_publisherPaidAuthorizationURL;
      v17->_publisherPaidAuthorizationURL = (NSString *)v24;

      v26 = objc_msgSend(v16, "copy");
      publisherPaidVerificationURL = (FCTag *)v17->_publisherPaidVerificationURL;
      v17->_publisherPaidVerificationURL = (NSString *)v26;
    }
    else
    {
      publisherPaidVerificationURL = v17;
      v17 = 0;
    }

  }
  return v17;
}

- (id)initChannelForTestingWithIdentifier:(id)a3 name:(id)a4 publisherPaidBundlePurchaseIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCTag *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  void *publisherPaidBundlePurchaseIDs;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCTag initChannelForTestingWithIdentifier:name:publisherPaidBundlePurchaseIDs:]";
    v23 = 2080;
    v24 = "FCTag.m";
    v25 = 1024;
    v26 = 1084;
    v27 = 2114;
    v28 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20.receiver = self;
  v20.super_class = (Class)FCTag;
  v11 = -[FCTag init](&v20, sel_init);
  if (v11)
  {
    if (objc_msgSend(v8, "length"))
    {
      v11->_tagType = 2;
      v12 = objc_msgSend(v8, "copy");
      identifier = v11->_identifier;
      v11->_identifier = (NSString *)v12;

      v14 = objc_msgSend(v9, "copy");
      name = v11->_name;
      v11->_name = (NSString *)v14;

      v16 = objc_msgSend(v10, "copy");
      publisherPaidBundlePurchaseIDs = v11->_publisherPaidBundlePurchaseIDs;
      v11->_publisherPaidBundlePurchaseIDs = (NSArray *)v16;
    }
    else
    {
      publisherPaidBundlePurchaseIDs = v11;
      v11 = 0;
    }

  }
  return v11;
}

- (id)initChannelFromNotificationWithIdentifier:(id)a3 name:(id)a4 nameImageAssetHandle:(id)a5 nameImageMaskAssetHandle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FCTag *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *name;
  FCTagBanner *v19;
  double v20;
  double v21;
  uint64_t v22;
  FCTagBanner *bannerImageForWhiteBackground;
  FCTagBanner *v24;
  void *bannerImageForMask;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "length") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier.length != 0");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCTag initChannelFromNotificationWithIdentifier:name:nameImageAssetHandle:nameImageMaskAssetHandle:]";
    v31 = 2080;
    v32 = "FCTag.m";
    v33 = 1024;
    v34 = 1109;
    v35 = 2114;
    v36 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v28.receiver = self;
  v28.super_class = (Class)FCTag;
  v14 = -[FCTag init](&v28, sel_init);
  if (v14)
  {
    if (objc_msgSend(v10, "length"))
    {
      v14->_tagType = 2;
      v15 = objc_msgSend(v10, "copy");
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      v17 = objc_msgSend(v11, "copy");
      name = v14->_name;
      v14->_name = (NSString *)v17;

      objc_storeStrong((id *)&v14->_nameImageAssetHandle, a5);
      v19 = [FCTagBanner alloc];
      v20 = *MEMORY[0x1E0C9D820];
      v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v22 = -[FCTagBanner initWithAssetHandle:size:insets:](v19, "initWithAssetHandle:size:insets:", v12, *MEMORY[0x1E0C9D820], v21, 0.0, 0.0, 0.0, 0.0);
      bannerImageForWhiteBackground = v14->_bannerImageForWhiteBackground;
      v14->_bannerImageForWhiteBackground = (FCTagBanner *)v22;

      v24 = -[FCTagBanner initWithAssetHandle:size:insets:]([FCTagBanner alloc], "initWithAssetHandle:size:insets:", v13, v20, v21, 0.0, 0.0, 0.0, 0.0);
      bannerImageForMask = v14->_bannerImageForMask;
      v14->_bannerImageForMask = v24;
    }
    else
    {
      bannerImageForMask = v14;
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

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

  if (v6)
  {
    -[FCTag identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCTag identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

- (FCSportsEventProviding)asSportsEvent
{
  FCTag *v3;

  if (-[FCTag isSportsEvent](self, "isSportsEvent"))
    v3 = self;
  else
    v3 = 0;
  return (FCSportsEventProviding *)v3;
}

- (FCPuzzleTypeProviding)asPuzzleType
{
  FCTag *v3;

  if (-[FCTag isPuzzleType](self, "isPuzzleType"))
    v3 = self;
  else
    v3 = 0;
  return (FCPuzzleTypeProviding *)v3;
}

- (BOOL)allowCustomBottomStyle
{
  return 0;
}

- (BOOL)isSubscribable
{
  BOOL v3;
  void *v4;

  if (-[FCTag isDeprecated](self, "isDeprecated"))
    return 0;
  if (-[FCTag tagType](self, "tagType") != 1)
  {
    if (-[FCTag tagType](self, "tagType") == 2)
    {
      -[FCTag defaultSectionID](self, "defaultSectionID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v4 != 0;

      return v3;
    }
    return 0;
  }
  return 1;
}

- (NSString)personalizedPaywallName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[FCTag useCompactNameForPersonalizedPaywall](self, "useCompactNameForPersonalizedPaywall"))
  {
    -[FCTag nameCompact](self, "nameCompact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[FCTag name](self, "name");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    -[FCTag name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCTag versionKey](self, "versionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "versionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  return v9;
}

- (id)freeFeedIDForBin:(int64_t)a3
{
  void *v5;
  void *v6;
  NTPBFeedConfiguration *feedConfiguration;
  void *v8;
  void *v9;
  id v10;

  -[FCTag pptFeedIDOverride](self, "pptFeedIDOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCTag pptFeedIDOverride](self, "pptFeedIDOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self)
      feedConfiguration = self->_feedConfiguration;
    else
      feedConfiguration = 0;
    -[NTPBFeedConfiguration feedIDForBin:paid:](feedConfiguration, "feedIDForBin:paid:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[FCTag identifier](self, "identifier");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v10;

  }
  return v6;
}

- (id)paidFeedIDForBin:(int64_t)a3
{
  void *v5;
  void *v6;
  NTPBFeedConfiguration *feedConfiguration;
  void *v8;
  void *v9;
  id v10;

  -[FCTag pptFeedIDOverride](self, "pptFeedIDOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCTag pptFeedIDOverride](self, "pptFeedIDOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self)
      feedConfiguration = self->_feedConfiguration;
    else
      feedConfiguration = 0;
    -[NTPBFeedConfiguration feedIDForBin:paid:](feedConfiguration, "feedIDForBin:paid:", a3, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[FCTag freeFeedIDForBin:](self, "freeFeedIDForBin:", a3);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v10;

  }
  return v6;
}

- (id)_feedConfigurationForSection:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  if (a1)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__45;
    v18 = __Block_byref_object_dispose__45;
    v19 = 0;
    objc_msgSend(a1, "sectionIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = a1[130];
    v7 = objc_msgSend(v6, "count");

    if (v5 == v7)
    {
      objc_msgSend(a1, "sectionIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[130];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __38__FCTag__feedConfigurationForSection___block_invoke;
      v11[3] = &unk_1E4645B50;
      v12 = v3;
      v13 = &v14;
      objc_msgSend(v8, "fc_enumerateSideBySideWithArray:reverse:block:", v9, 0, v11);

    }
    a1 = (id *)(id)v15[5];
    _Block_object_dispose(&v14, 8);

  }
  return a1;
}

void __38__FCTag__feedConfigurationForSection___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)setTitleDisplayPrefixOverride:(id)a3
{
  id v4;
  FCTag *v5;
  void *v6;
  FCAssetManager *v7;
  FCInterestToken *tagInterestToken;
  FCTag *v9;

  v4 = a3;
  v5 = [FCTag alloc];
  -[FCTag tagRecord](self, "tagRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v7 = self->_assetManager;
    tagInterestToken = self->_tagInterestToken;
  }
  else
  {
    v7 = 0;
    tagInterestToken = 0;
  }
  v9 = -[FCTag initWithTagRecord:assetManager:interestToken:](v5, "initWithTagRecord:assetManager:interestToken:", v6, v7, tagInterestToken);

  -[FCTag setTitleDisplayPrefix:](v9, "setTitleDisplayPrefix:", v4);
  return v9;
}

- (id)setTitleDisplaySuffixOverride:(id)a3
{
  id v4;
  FCTag *v5;
  void *v6;
  FCAssetManager *v7;
  FCInterestToken *tagInterestToken;
  FCTag *v9;

  v4 = a3;
  v5 = [FCTag alloc];
  -[FCTag tagRecord](self, "tagRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v7 = self->_assetManager;
    tagInterestToken = self->_tagInterestToken;
  }
  else
  {
    v7 = 0;
    tagInterestToken = 0;
  }
  v9 = -[FCTag initWithTagRecord:assetManager:interestToken:](v5, "initWithTagRecord:assetManager:interestToken:", v6, v7, tagInterestToken);

  -[FCTag setTitleDisplaySuffix:](v9, "setTitleDisplaySuffix:", v4);
  return v9;
}

- (id)freeFeedIDForSection:(id)a3 bin:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v6 = a3;
  -[FCTag _feedConfigurationForSection:]((id *)&self->super.isa, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedIDForBin:paid:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[FCTag defaultSectionID](self, "defaultSectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if (v10)
    {
      -[FCTag freeFeedIDForBin:](self, "freeFeedIDForBin:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  if (v8)
    v11 = v8;
  else
    v11 = v6;
  v12 = v11;

  return v12;
}

- (id)paidFeedIDForSection:(id)a3 bin:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a3;
  -[FCTag _feedConfigurationForSection:]((id *)&self->super.isa, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedIDForBin:paid:", a4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[FCTag defaultSectionID](self, "defaultSectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqualToString:", v9);

    if (!v10
      || (-[FCTag paidFeedIDForBin:](self, "paidFeedIDForBin:", a4),
          (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[FCTag freeFeedIDForSection:bin:](self, "freeFeedIDForSection:bin:", v6, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (BOOL)isNoLongerAvailable
{
  void *v3;
  BOOL v4;

  if (!-[FCTag isDeprecated](self, "isDeprecated"))
    return 0;
  -[FCTag replacementID](self, "replacementID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)isAuthenticationSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  -[FCTag publisherPaidAuthorizationURL](self, "publisherPaidAuthorizationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_stringByTrimmingWhiteSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCTag publisherPaidVerificationURL](self, "publisherPaidVerificationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_stringByTrimmingWhiteSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithURL:resolvingAgainstBaseURL:", v8, 1);

    v10 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithURL:resolvingAgainstBaseURL:", v11, 1);

    objc_msgSend(v9, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FCTag _isValidScheme:]((_BOOL8)self, v13))
    {
      objc_msgSend(v12, "scheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[FCTag _isValidScheme:]((_BOOL8)self, v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_isValidScheme:(_BOOL8)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "length");
    a1 = v5 == objc_msgSend(CFSTR("https"), "length")
      && objc_msgSend(v4, "rangeOfString:options:", CFSTR("https"), 1) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return a1;
}

- (id)authorizationURL
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.stocks"));

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[FCTag identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("applenews://authentication_callback");
  if (v5)
    v9 = CFSTR("stocks://authentication_callback");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCTag publisherPaidAuthorizationURL](self, "publisherPaidAuthorizationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fc_stringByTrimmingWhiteSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithURL:resolvingAgainstBaseURL:", v14, 1);

    objc_msgSend(v15, "scheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCTag _isValidScheme:]((_BOOL8)self, v16);

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0C997E8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v12, "rangeOfString:", CFSTR("redirect_uri"));
      v23 = (void *)MEMORY[0x1E0C99E98];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@?%@=%@&%@=%@&%@=%@"), v12, CFSTR("redirect_uri"), v10, CFSTR("country"), v21, CFSTR("language"), v19);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@&%@=%@&%@=%@"), v12, v10, CFSTR("country"), v21, CFSTR("language"), v19, v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLWithString:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)prefetchPurchaseOffer
{
  void *v3;
  id v4;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!-[FCTag isPurchaseSetup](self, "isPurchaseSetup"))
    return 0;
  -[FCTag publisherPaidOfferableConfigurations](self, "publisherPaidOfferableConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__45;
    v12 = __Block_byref_object_dispose__45;
    v13 = 0;
    -[FCTag publisherPaidOfferableConfigurations](self, "publisherPaidOfferableConfigurations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__FCTag_prefetchPurchaseOffer__block_invoke;
    v7[3] = &unk_1E4645B78;
    v7[4] = &v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
    v4 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
  }

  return v4;
}

void __30__FCTag_prefetchPurchaseOffer__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "preferredOffer"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSString)articleRecirculationConfigJSON
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[FCTag tagRecord](self, "tagRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleRecirculationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_gzipInflate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithData:encoding:", v6, 4);

  return (NSString *)v7;
}

- (NSString)highlightsArticleListID
{
  void *v2;
  void *v3;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightsArticleListID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stocksFeedConfigJSON
{
  void *v2;
  void *v3;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksFeedConfigurationJson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)feedType
{
  unint64_t v2;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[FCTag tagType](self, "tagType");
  if (v2 < 6)
    return qword_1A1E82788[v2];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
    v5 = 136315906;
    v6 = "-[FCTag feedType]";
    v7 = 2080;
    v8 = "FCTag.m";
    v9 = 1024;
    v10 = 1481;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return 0;
}

- (BOOL)isWhite
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[FCTag backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FCTag backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCColor whiteColor](FCColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isSimilarToColor:withinPercentage:", v5, 0.12);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isDark
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  BOOL v14;

  -[FCTag backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "red");
  v5 = v4;
  -[FCTag backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "green");
  v8 = v7 * 0.7152 + v5 * 0.2126;
  -[FCTag backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blue");
  v11 = v8 + v10 * 0.0722;

  -[FCTag backgroundColor](self, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 < 0.7 || v12 == 0;

  return v14;
}

- (FCTagBanner)defaultBannerImage
{
  if (-[FCTag isWhite](self, "isWhite"))
    -[FCTag bannerImageForWhiteBackground](self, "bannerImageForWhiteBackground");
  else
    -[FCTag bannerImageForThemeBackground](self, "bannerImageForThemeBackground");
  return (FCTagBanner *)(id)objc_claimAutoreleasedReturnValue();
}

- (FCTagBanner)compactBannerImage
{
  void *v3;
  FCTagBanner *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FCTag nameImageCompactAssetHandle](self, "nameImageCompactAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = self->_compactBannerImage;
  }
  else
  {
    -[FCTag nameImageMaskAssetHandle](self, "nameImageMaskAssetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCTag bannerImageForMask](self, "bannerImageForMask");
      v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FCTag nameImageAssetHandle](self, "nameImageAssetHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[FCTag bannerImageForWhiteBackground](self, "bannerImageForWhiteBackground");
        v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FCTag nameImageForDarkBackgroundAssetHandle](self, "nameImageForDarkBackgroundAssetHandle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[FCTag bannerImageForThemeBackground](self, "bannerImageForThemeBackground");
          v4 = (FCTagBanner *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  return v4;
}

- (FCColor)darkStyleBackgroundColor
{
  NSString *darkStyleBackgroundColorHexString;
  NSString *v3;
  void *v4;

  if (self)
    darkStyleBackgroundColorHexString = self->_darkStyleBackgroundColorHexString;
  else
    darkStyleBackgroundColorHexString = 0;
  v3 = darkStyleBackgroundColorHexString;
  if (-[NSString length](v3, "length"))
  {
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)darkStyleForegroundColor
{
  NSString *darkStyleForegroundColorHexString;
  NSString *v3;
  void *v4;

  if (self)
    darkStyleForegroundColorHexString = self->_darkStyleForegroundColorHexString;
  else
    darkStyleForegroundColorHexString = 0;
  v3 = darkStyleForegroundColorHexString;
  if (-[NSString length](v3, "length"))
  {
    +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (FCColor *)v4;
}

- (FCColor)navigationChromeBackgroundColor
{
  NSString *navigationChromeBackgroundColorHexString;

  if (self)
    navigationChromeBackgroundColorHexString = self->_navigationChromeBackgroundColorHexString;
  else
    navigationChromeBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, navigationChromeBackgroundColorHexString);
}

- (FCColor)darkStyleNavigationChromeBackgroundColor
{
  NSString *darkStyleNavigationChromeBackgroundColorHexString;

  if (self)
    darkStyleNavigationChromeBackgroundColorHexString = self->_darkStyleNavigationChromeBackgroundColorHexString;
  else
    darkStyleNavigationChromeBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleNavigationChromeBackgroundColorHexString);
}

- (FCColor)navigationChromeSeparatorColor
{
  NSString *navigationChromeSeparatorColorHexString;

  if (self)
    navigationChromeSeparatorColorHexString = self->_navigationChromeSeparatorColorHexString;
  else
    navigationChromeSeparatorColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, navigationChromeSeparatorColorHexString);
}

- (FCColor)darkStyleNavigationChromeSeparatorColor
{
  NSString *darkStyleNavigationChromeSeparatorColorHexString;

  if (self)
    darkStyleNavigationChromeSeparatorColorHexString = self->_darkStyleNavigationChromeSeparatorColorHexString;
  else
    darkStyleNavigationChromeSeparatorColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleNavigationChromeSeparatorColorHexString);
}

- (FCColor)darkStyleFeedBackgroundColor
{
  NSString *darkStyleFeedBackgroundColorHexString;

  if (self)
    darkStyleFeedBackgroundColorHexString = self->_darkStyleFeedBackgroundColorHexString;
  else
    darkStyleFeedBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleFeedBackgroundColorHexString);
}

- (FCColor)darkStyleFeedControlColor
{
  NSString *darkStyleFeedControlColorHexString;

  if (self)
    darkStyleFeedControlColorHexString = self->_darkStyleFeedControlColorHexString;
  else
    darkStyleFeedControlColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleFeedControlColorHexString);
}

- (FCColor)adBackgroundColor
{
  NSString *adBackgroundColorHexString;

  if (self)
    adBackgroundColorHexString = self->_adBackgroundColorHexString;
  else
    adBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, adBackgroundColorHexString);
}

- (FCColor)darkStyleAdBackgroundColor
{
  NSString *darkStyleAdBackgroundColorHexString;

  if (self)
    darkStyleAdBackgroundColorHexString = self->_darkStyleAdBackgroundColorHexString;
  else
    darkStyleAdBackgroundColorHexString = 0;
  return (FCColor *)-[FCTag _FCColorFromHexTriplet:](self, darkStyleAdBackgroundColorHexString);
}

- (FCColor)groupTitleColor
{
  NSString *groupTitleColorHexString;
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  if (self)
    groupTitleColorHexString = self->_groupTitleColorHexString;
  else
    groupTitleColorHexString = 0;
  v4 = groupTitleColorHexString;
  if (-[NSString length](v4, "length"))
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (-[FCTag tagType](self, "tagType") == 2)
  {
    -[FCTag theme](self, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCTag theme](self, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "foregroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[FCColor whiteColor](FCColor, "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isSimilarToColor:withinPercentage:", v10, 0.2);

      v12 = v7;
      if (!v11)
        goto LABEL_12;
    }
    if (v9
      && (+[FCColor whiteColor](FCColor, "whiteColor"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v9, "isSimilarToColor:withinPercentage:", v13, 0.2),
          v13,
          v12 = v9,
          (v14 & 1) == 0))
    {
LABEL_12:
      v5 = v12;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (FCColor *)v5;
}

- (FCColor)groupDarkStyleTitleColor
{
  NSString *groupDarkStyleTitleColorHexString;
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  if (self)
    groupDarkStyleTitleColorHexString = self->_groupDarkStyleTitleColorHexString;
  else
    groupDarkStyleTitleColorHexString = 0;
  v4 = groupDarkStyleTitleColorHexString;
  if (-[NSString length](v4, "length"))
  {
    +[FCColor colorWithHexString:](FCColor, "colorWithHexString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (-[FCTag tagType](self, "tagType") == 2)
  {
    -[FCTag theme](self, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "darkStyleBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCTag theme](self, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "darkStyleForegroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[FCColor blackColor](FCColor, "blackColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isSimilarToColor:withinPercentage:", v10, 0.2);

      v12 = v7;
      if (!v11)
        goto LABEL_12;
    }
    if (v9
      && (+[FCColor blackColor](FCColor, "blackColor"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v9, "isSimilarToColor:withinPercentage:", v13, 0.2),
          v13,
          v12 = v9,
          (v14 & 1) == 0))
    {
LABEL_12:
      v5 = v12;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (FCColor *)v5;
}

- (FCContentColorMap)contentColorMap
{
  if (self)
    self = (FCTag *)self->_lazyContentColorMap;
  return (FCContentColorMap *)-[FCTag value](self, "value");
}

- (NSData)backingTagRecordData
{
  void *v2;
  void *v3;

  -[FCTag tagRecord](self, "tagRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isWhitelisted
{
  void *v3;
  void *v4;
  char v5;

  -[FCTag iAdCategories](self, "iAdCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTag identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (unint64_t)channelType
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (-[FCTag isLocal](self, "isLocal"))
    return 1;
  if (-[FCTag isMagazine](self, "isMagazine"))
    return 2;
  -[FCTag currentIssueIDs](self, "currentIssueIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[FCTag recentIssueIDs](self, "recentIssueIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 + v7)
    return 2;
  if (-[FCTag isNewspaper](self, "isNewspaper"))
    return 3;
  if (-[FCTag isMySports](self, "isMySports"))
    return 4;
  if (-[FCTag isPuzzleHub](self, "isPuzzleHub"))
    return 5;
  return 0;
}

- (NSArray)sportsParentTagIdentifiers
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[FCTag topLevelGroupsTagIdentifiers](self, "topLevelGroupsTagIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FCTag topLevelGroupsTagIdentifiers](self, "topLevelGroupsTagIdentifiers");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FCTag topLevelSportTagIdentifier](self, "topLevelSportTagIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FCTag topLevelSportTagIdentifier](self, "topLevelSportTagIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSArray *)v7;
    }
    else
    {
      return (NSArray *)MEMORY[0x1E0C9AA60];
    }
  }
}

- (NSString)versionKey
{
  return self->_versionKey;
}

- (NSString)nameCompact
{
  return self->_nameCompact;
}

- (int64_t)contentProvider
{
  return self->_contentProvider;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSString)replacementID
{
  return self->_replacementID;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (int64_t)score
{
  return self->_score;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSArray)recentIssueIDs
{
  return self->_recentIssueIDs;
}

- (NSString)backIssuesListID
{
  return self->_backIssuesListID;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)magazineGenre
{
  return self->_magazineGenre;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (double)subscriptionRate
{
  return self->_subscriptionRate;
}

- (NSArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (void)setNameImageAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_nameImageAssetHandle, a3);
}

- (CGSize)nameImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nameImageSize.width;
  height = self->_nameImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNameImageSize:(CGSize)a3
{
  self->_nameImageSize = a3;
}

- (FCEdgeInsets)nameImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  FCEdgeInsets result;

  top = self->_nameImageInsets.top;
  left = self->_nameImageInsets.left;
  bottom = self->_nameImageInsets.bottom;
  right = self->_nameImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (FCAssetHandle)nameImageCompactAssetHandle
{
  return self->_nameImageCompactAssetHandle;
}

- (void)setBannerImageScale:(double)a3
{
  self->_bannerImageScale = a3;
}

- (void)setBannerImageBaselineOffsetPercentage:(double)a3
{
  self->_bannerImageBaselineOffsetPercentage = a3;
}

- (CGSize)nameImageForDarkBackgroundSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nameImageForDarkBackgroundSize.width;
  height = self->_nameImageForDarkBackgroundSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (FCEdgeInsets)nameImageForDarkBackgroundInsets
{
  double top;
  double left;
  double bottom;
  double right;
  FCEdgeInsets result;

  top = self->_nameImageForDarkBackgroundInsets.top;
  left = self->_nameImageForDarkBackgroundInsets.left;
  bottom = self->_nameImageForDarkBackgroundInsets.bottom;
  right = self->_nameImageForDarkBackgroundInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)nameImageMaskSize
{
  double width;
  double height;
  CGSize result;

  width = self->_nameImageMaskSize.width;
  height = self->_nameImageMaskSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (FCEdgeInsets)nameImageMaskInsets
{
  double top;
  double left;
  double bottom;
  double right;
  FCEdgeInsets result;

  top = self->_nameImageMaskInsets.top;
  left = self->_nameImageMaskInsets.left;
  bottom = self->_nameImageMaskInsets.bottom;
  right = self->_nameImageMaskInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (FCAssetHandle)logoImageAssetHandle
{
  return self->_logoImageAssetHandle;
}

- (FCAssetHandle)feedNavImageHQAssetHandle
{
  return self->_feedNavImageHQAssetHandle;
}

- (FCAssetHandle)navigationChromeBackgroundImage
{
  return self->_navigationChromeBackgroundImage;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImage
{
  return self->_darkStyleNavigationChromeBackgroundImage;
}

- (FCAssetHandle)navigationChromeBackgroundImageCompact
{
  return self->_navigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageCompact
{
  return self->_darkStyleNavigationChromeBackgroundImageCompact;
}

- (FCAssetHandle)navigationChromeBackgroundImageLarge
{
  return self->_navigationChromeBackgroundImageLarge;
}

- (FCAssetHandle)darkStyleNavigationChromeBackgroundImageLarge
{
  return self->_darkStyleNavigationChromeBackgroundImageLarge;
}

- (FCColorGradient)navigationChromeBackgroundGradient
{
  return self->_navigationChromeBackgroundGradient;
}

- (FCColorGradient)darkStyleNavigationChromeBackgroundGradient
{
  return self->_darkStyleNavigationChromeBackgroundGradient;
}

- (FCTextInfo)headlineTitleTextInfo
{
  return self->_headlineTitleTextInfo;
}

- (FCTextInfo)headlineExcerptTextInfo
{
  return self->_headlineExcerptTextInfo;
}

- (FCTextInfo)headlineBylineTextInfo
{
  return self->_headlineBylineTextInfo;
}

- (NSString)parentID
{
  return self->_parentID;
}

- (NSArray)sectionIDs
{
  return self->_sectionIDs;
}

- (NSString)defaultSectionID
{
  return self->_defaultSectionID;
}

- (NSString)publisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL;
}

- (NSString)publisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL;
}

- (NSString)publisherPaidWebAccessURL
{
  return self->_publisherPaidWebAccessURL;
}

- (NSArray)publisherPaidFeldsparablePurchaseIDs
{
  return self->_publisherPaidFeldsparablePurchaseIDs;
}

- (NSArray)publisherPaidBundlePurchaseIDs
{
  return self->_publisherPaidBundlePurchaseIDs;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return self->_publisherPaidLeakyPaywallOptOut;
}

- (BOOL)publisherPaidWebAccessOptIn
{
  return self->_publisherPaidWebAccessOptIn;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings;
}

- (FCAssetHandle)nameImageMaskWidgetLQAssetHandle
{
  return self->_nameImageMaskWidgetLQAssetHandle;
}

- (FCAssetHandle)nameImageMaskWidgetHQAssetHandle
{
  return self->_nameImageMaskWidgetHQAssetHandle;
}

- (FCAssetHandle)nameImageLargeAssetHandle
{
  return self->_nameImageLargeAssetHandle;
}

- (FCAssetHandle)nameImageLargeMaskAssetHandle
{
  return self->_nameImageLargeMaskAssetHandle;
}

- (unint64_t)groupingEligibility
{
  return self->_groupingEligibility;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isRealTimeTrackingEnabled
{
  return self->_isRealTimeTrackingEnabled;
}

- (BOOL)isArticleReadCountReportingEnabled
{
  return self->_isArticleReadCountReportingEnabled;
}

- (BOOL)isAutoDarkModeEnabled
{
  return self->_isAutoDarkModeEnabled;
}

- (BOOL)disableFollow
{
  return self->_disableFollow;
}

- (BOOL)disableBlock
{
  return self->_disableBlock;
}

- (BOOL)useCompactNameForPersonalizedPaywall
{
  return self->_useCompactNameForPersonalizedPaywall;
}

- (BOOL)sponsoredFeedEligible
{
  return self->_sponsoredFeedEligible;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)isSandbox
{
  return self->_isSandbox;
}

- (BOOL)isSensitiveTopic
{
  return self->_isSensitiveTopic;
}

- (BOOL)isPuzzleHub
{
  return self->_isPuzzleHub;
}

- (BOOL)isPuzzleType
{
  return self->_isPuzzleType;
}

- (BOOL)hasEvergreenArticleList
{
  return self->_hasEvergreenArticleList;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (NSDate)publisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate;
}

- (NSDictionary)publisherSpecifiedArticles
{
  return self->_publisherSpecifiedArticles;
}

- (FCPaywallConfiguration)paidBundlePaywallConfiguration
{
  return self->_paidBundlePaywallConfiguration;
}

- (NSString)supergroupConfigJson
{
  return self->_supergroupConfigJson;
}

- (NSString)supergroupKnobsJson
{
  return self->_supergroupKnobsJson;
}

- (FCSectionSupergroupKnobs)supergroupKnobs
{
  return self->_supergroupKnobs;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NSDate)loadDate
{
  return self->_loadDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)titleDisplayPrefix
{
  return self->_titleDisplayPrefix;
}

- (void)setTitleDisplayPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (NSString)titleDisplaySuffix
{
  return self->_titleDisplaySuffix;
}

- (void)setTitleDisplaySuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (BOOL)isSportsRecommendable
{
  return self->_isSportsRecommendable;
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (FCAssetHandle)sportsLogoImageCompactAssetHandle
{
  return self->_sportsLogoImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoImageAssetHandle
{
  return self->_sportsLogoImageAssetHandle;
}

- (FCAssetHandle)sportsLogoImageLargeAssetHandle
{
  return self->_sportsLogoImageLargeAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageCompactAssetHandle
{
  return self->_sportsLogoAltImageCompactAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageAssetHandle
{
  return self->_sportsLogoAltImageAssetHandle;
}

- (FCAssetHandle)sportsLogoAltImageLargeAssetHandle
{
  return self->_sportsLogoAltImageLargeAssetHandle;
}

- (NSString)UMCCanonicalID
{
  return self->_UMCCanonicalID;
}

- (NSString)sportsPrimaryName
{
  return self->_sportsPrimaryName;
}

- (NSString)sportsNameAbbreviation
{
  return self->_sportsNameAbbreviation;
}

- (NSString)sportsSecondaryName
{
  return self->_sportsSecondaryName;
}

- (NSString)sportsSecondaryShortName
{
  return self->_sportsSecondaryShortName;
}

- (NSString)sportsFullName
{
  return self->_sportsFullName;
}

- (NSString)sportsNickname
{
  return self->_sportsNickname;
}

- (NSString)sportsLocation
{
  return self->_sportsLocation;
}

- (BOOL)hideLocationInMasthead
{
  return self->_hideLocationInMasthead;
}

- (unint64_t)sportsType
{
  return self->_sportsType;
}

- (NSString)sportsTypeDisplayName
{
  return self->_sportsTypeDisplayName;
}

- (NSString)sportsTypePluralizedDisplayName
{
  return self->_sportsTypePluralizedDisplayName;
}

- (unint64_t)sportsLeagueType
{
  return self->_sportsLeagueType;
}

- (FCColor)sportsPrimaryColor
{
  return self->_sportsPrimaryColor;
}

- (FCColor)sportsSecondaryColor
{
  return self->_sportsSecondaryColor;
}

- (FCSportsRecommendationMappings)sportsRecommendationMappings
{
  return self->_sportsRecommendationMappings;
}

- (NSString)topLevelSportTagIdentifier
{
  return self->_topLevelSportTagIdentifier;
}

- (NSArray)topLevelGroupsTagIdentifiers
{
  return self->_topLevelGroupsTagIdentifiers;
}

- (int64_t)sportsLogoMastheadLeadingOffset
{
  return self->_sportsLogoMastheadLeadingOffset;
}

- (int64_t)sportsLogoMastheadHorizontalPaddingOffset
{
  return self->_sportsLogoMastheadHorizontalPaddingOffset;
}

- (unint64_t)sportsLogoMastheadVisibility
{
  return self->_sportsLogoMastheadVisibility;
}

- (FCColor)sportsEventNavigationForegroundColor
{
  return self->_sportsEventNavigationForegroundColor;
}

- (unint64_t)navigationChromeBackgroundImageContentMode
{
  return self->_navigationChromeBackgroundImageContentMode;
}

- (unint64_t)navigationChromeBackgroundImageContentModeCompact
{
  return self->_navigationChromeBackgroundImageContentModeCompact;
}

- (unint64_t)navigationChromeBackgroundImageContentModeLarge
{
  return self->_navigationChromeBackgroundImageContentModeLarge;
}

- (FCColorGradient)feedBackgroundGradient
{
  return self->_feedBackgroundGradient;
}

- (FCColorGradient)darkStyleFeedBackgroundGradient
{
  return self->_darkStyleFeedBackgroundGradient;
}

- (FCColorGradient)adBackgroundGradient
{
  return self->_adBackgroundGradient;
}

- (FCColorGradient)darkStyleAdBackgroundGradient
{
  return self->_darkStyleAdBackgroundGradient;
}

- (NSString)feedMastheadType
{
  return self->_feedMastheadType;
}

- (NSString)pptFeedIDOverride
{
  return self->_pptFeedIDOverride;
}

- (void)setPptFeedIDOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (FCInterestToken)tagRecordInterestToken
{
  return self->_tagRecordInterestToken;
}

@end
