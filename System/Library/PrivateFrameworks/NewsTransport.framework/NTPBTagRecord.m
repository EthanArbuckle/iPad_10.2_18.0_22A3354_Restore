@implementation NTPBTagRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (int64_t)propertyFlags
{
  return self->_propertyFlags;
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (NSData)nameImageMetadata
{
  return self->_nameImageMetadata;
}

- (NSString)nameImageCompactURL
{
  return self->_nameImageCompactURL;
}

- (NSString)supergroupKnobsJson
{
  return self->_supergroupKnobsJson;
}

- (NSMutableArray)purchaseOfferableConfigurations
{
  return self->_purchaseOfferableConfigurations;
}

- (NSString)feedNavImageURL
{
  return self->_feedNavImageURL;
}

- (NSString)nameImageURL
{
  return self->_nameImageURL;
}

- (NSString)feedNavImageHQURL
{
  return self->_feedNavImageHQURL;
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)nameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSMutableArray)channelSectionIDs
{
  return self->_channelSectionIDs;
}

- (NSString)publisherPaidWebaccessURL
{
  return self->_publisherPaidWebaccessURL;
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)subscriptionRate
{
  return self->_subscriptionRate;
}

- (int64_t)score
{
  return self->_score;
}

- (NSString)replacementID
{
  return self->_replacementID;
}

- (NSMutableArray)recentIssueIDs
{
  return self->_recentIssueIDs;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSString)name
{
  return self->_name;
}

- (double)nameImageScaleFactor
{
  return self->_nameImageScaleFactor;
}

- (unint64_t)nameImageBaselineShift
{
  return self->_nameImageBaselineShift;
}

- (NSString)nameCompact
{
  return self->_nameCompact;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)magazineGenre
{
  return self->_magazineGenre;
}

- (NSString)logoURL
{
  return self->_logoURL;
}

- (NSMutableArray)latestIssueIDs
{
  return self->_latestIssueIDs;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (NSMutableArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSMutableArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSString)highlightsArticleListID
{
  return self->_highlightsArticleListID;
}

- (NTPBFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (int64_t)contentProvider
{
  return self->_contentProvider;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSString)archiveIssueListID
{
  return self->_archiveIssueListID;
}

- (NSMutableArray)adTargetingKeywords
{
  return self->_adTargetingKeywords;
}

- (NSString)templateJson
{
  return self->_templateJson;
}

- (NSString)supergroupConfigJson
{
  return self->_supergroupConfigJson;
}

- (NSString)parentID
{
  return self->_parentID;
}

- (NSString)nameImageMaskURL
{
  return self->_nameImageMaskURL;
}

- (BOOL)hideAccessoryText
{
  return self->_hideAccessoryText;
}

- (NSMutableArray)channelSectionFeedConfigurations
{
  return self->_channelSectionFeedConfigurations;
}

- (NSString)channelDefaultSectionID
{
  return self->_channelDefaultSectionID;
}

- (NSString)sportsTheme
{
  return self->_sportsTheme;
}

- (NSData)sportsRecommendationMappingsJson
{
  return self->_sportsRecommendationMappingsJson;
}

- (NSString)sportsLogoImageURL
{
  return self->_sportsLogoImageURL;
}

- (NSString)sportsLogoImageLargeURL
{
  return self->_sportsLogoImageLargeURL;
}

- (NSString)sportsLogoImageCompactURL
{
  return self->_sportsLogoImageCompactURL;
}

- (NSString)sportsLogoAltImageURL
{
  return self->_sportsLogoAltImageURL;
}

- (NSString)sportsLogoAltImageLargeURL
{
  return self->_sportsLogoAltImageLargeURL;
}

- (NSString)sportsLogoAltImageCompactURL
{
  return self->_sportsLogoAltImageCompactURL;
}

- (NSString)sportsData
{
  return self->_sportsData;
}

- (NSMutableArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (NTPBDate)publisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate;
}

- (BOOL)publisherPaidWebOptIn
{
  return self->_publisherPaidWebOptIn;
}

- (NSString)publisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL;
}

- (BOOL)publisherPaidLeakyPaywallOptOut
{
  return self->_publisherPaidLeakyPaywallOptOut;
}

- (NSMutableArray)publisherPaidFeldsparablePurchaseIDs
{
  return self->_publisherPaidFeldsparablePurchaseIDs;
}

- (NTPBPublisherPaidDescriptionStrings)publisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings;
}

- (NSMutableArray)publisherPaidBundlePurchaseIDs
{
  return self->_publisherPaidBundlePurchaseIDs;
}

- (NSString)publisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL;
}

- (int64_t)propertyFlagsLocalized
{
  return self->_propertyFlagsLocalized;
}

- (NSString)paidBundlePaywallConfigurationJson
{
  return self->_paidBundlePaywallConfigurationJson;
}

- (NSString)navigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL;
}

- (NSString)navigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL;
}

- (NSString)navigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL;
}

- (NSString)nameImageMaskWidgetLQURL
{
  return self->_nameImageMaskWidgetLQURL;
}

- (NSString)nameImageMaskWidgetHQURL
{
  return self->_nameImageMaskWidgetHQURL;
}

- (NSString)nameImageLargeURL
{
  return self->_nameImageLargeURL;
}

- (NSString)nameImageLargeMaskURL
{
  return self->_nameImageLargeMaskURL;
}

- (BOOL)isSportsRecommendable
{
  return self->_isSportsRecommendable;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (NSString)darkStyleNavigationChromeBackgroundImageURL
{
  return self->_darkStyleNavigationChromeBackgroundImageURL;
}

- (NSString)darkStyleNavigationChromeBackgroundImageLargeURL
{
  return self->_darkStyleNavigationChromeBackgroundImageLargeURL;
}

- (NSString)darkStyleNavigationChromeBackgroundImageCompactURL
{
  return self->_darkStyleNavigationChromeBackgroundImageCompactURL;
}

- (BOOL)hasPublisherSpecifiedArticlesJson
{
  return self->_publisherSpecifiedArticlesJson != 0;
}

- (int)type
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (int)groupingAvailability
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_groupingAvailability;
  else
    return 0;
}

- (NSString)publisherSpecifiedArticlesJson
{
  return self->_publisherSpecifiedArticlesJson;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBTagRecord setBase:](self, "setBase:", 0);
  -[NTPBTagRecord setName:](self, "setName:", 0);
  -[NTPBTagRecord setReplacementID:](self, "setReplacementID:", 0);
  -[NTPBTagRecord setPrimaryAudience:](self, "setPrimaryAudience:", 0);
  -[NTPBTagRecord setParentID:](self, "setParentID:", 0);
  -[NTPBTagRecord setLogoURL:](self, "setLogoURL:", 0);
  -[NTPBTagRecord setIAdCategories:](self, "setIAdCategories:", 0);
  -[NTPBTagRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBTagRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  -[NTPBTagRecord setFeedConfiguration:](self, "setFeedConfiguration:", 0);
  -[NTPBTagRecord setNameImageURL:](self, "setNameImageURL:", 0);
  -[NTPBTagRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:", 0);
  -[NTPBTagRecord setNameImageMaskURL:](self, "setNameImageMaskURL:", 0);
  -[NTPBTagRecord setNameImageMetadata:](self, "setNameImageMetadata:", 0);
  -[NTPBTagRecord setCoverImageURL:](self, "setCoverImageURL:", 0);
  -[NTPBTagRecord setTemplateJson:](self, "setTemplateJson:", 0);
  -[NTPBTagRecord setChannelSectionIDs:](self, "setChannelSectionIDs:", 0);
  -[NTPBTagRecord setChannelDefaultSectionID:](self, "setChannelDefaultSectionID:", 0);
  -[NTPBTagRecord setChannelSectionFeedConfigurations:](self, "setChannelSectionFeedConfigurations:", 0);
  -[NTPBTagRecord setPublisherPaidAuthorizationURL:](self, "setPublisherPaidAuthorizationURL:", 0);
  -[NTPBTagRecord setPublisherPaidVerificationURL:](self, "setPublisherPaidVerificationURL:", 0);
  -[NTPBTagRecord setPublisherPaidWebaccessURL:](self, "setPublisherPaidWebaccessURL:", 0);
  -[NTPBTagRecord setPublisherPaidFeldsparablePurchaseIDs:](self, "setPublisherPaidFeldsparablePurchaseIDs:", 0);
  -[NTPBTagRecord setPublisherPaidBundlePurchaseIDs:](self, "setPublisherPaidBundlePurchaseIDs:", 0);
  -[NTPBTagRecord setPurchaseOfferableConfigurations:](self, "setPurchaseOfferableConfigurations:", 0);
  -[NTPBTagRecord setIAdKeywords:](self, "setIAdKeywords:", 0);
  -[NTPBTagRecord setNameImageMaskWidgetLQURL:](self, "setNameImageMaskWidgetLQURL:", 0);
  -[NTPBTagRecord setNameImageMaskWidgetHQURL:](self, "setNameImageMaskWidgetHQURL:", 0);
  -[NTPBTagRecord setPublisherPaidDescriptionStrings:](self, "setPublisherPaidDescriptionStrings:", 0);
  -[NTPBTagRecord setNameCompact:](self, "setNameCompact:", 0);
  -[NTPBTagRecord setNameImageCompactURL:](self, "setNameImageCompactURL:", 0);
  -[NTPBTagRecord setNameImageCompactMetadata:](self, "setNameImageCompactMetadata:", 0);
  -[NTPBTagRecord setArticleRecirculationConfiguration:](self, "setArticleRecirculationConfiguration:", 0);
  -[NTPBTagRecord setPublisherSpecifiedArticleIDs:](self, "setPublisherSpecifiedArticleIDs:", 0);
  -[NTPBTagRecord setSubtitle:](self, "setSubtitle:", 0);
  -[NTPBTagRecord setPublisherSpecifiedArticleIDsModifiedDate:](self, "setPublisherSpecifiedArticleIDsModifiedDate:", 0);
  -[NTPBTagRecord setFeedNavImageURL:](self, "setFeedNavImageURL:", 0);
  -[NTPBTagRecord setLatestIssueIDs:](self, "setLatestIssueIDs:", 0);
  -[NTPBTagRecord setArchiveIssueListID:](self, "setArchiveIssueListID:", 0);
  -[NTPBTagRecord setLanguage:](self, "setLanguage:", 0);
  -[NTPBTagRecord setMagazineGenre:](self, "setMagazineGenre:", 0);
  -[NTPBTagRecord setPaidBundlePaywallConfigurationJson:](self, "setPaidBundlePaywallConfigurationJson:", 0);
  -[NTPBTagRecord setStocksFeedConfigurationJson:](self, "setStocksFeedConfigurationJson:", 0);
  -[NTPBTagRecord setSupergroupConfigJson:](self, "setSupergroupConfigJson:", 0);
  -[NTPBTagRecord setSupergroupKnobsJson:](self, "setSupergroupKnobsJson:", 0);
  -[NTPBTagRecord setRecentIssueIDs:](self, "setRecentIssueIDs:", 0);
  -[NTPBTagRecord setNameImageLargeURL:](self, "setNameImageLargeURL:", 0);
  -[NTPBTagRecord setNameImageLargeMaskURL:](self, "setNameImageLargeMaskURL:", 0);
  -[NTPBTagRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:", 0);
  -[NTPBTagRecord setSportsRecommendationMappingsJson:](self, "setSportsRecommendationMappingsJson:", 0);
  -[NTPBTagRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:", 0);
  -[NTPBTagRecord setSportsLogoImageURL:](self, "setSportsLogoImageURL:", 0);
  -[NTPBTagRecord setSportsLogoImageCompactURL:](self, "setSportsLogoImageCompactURL:", 0);
  -[NTPBTagRecord setSportsLogoImageLargeURL:](self, "setSportsLogoImageLargeURL:", 0);
  -[NTPBTagRecord setSportsData:](self, "setSportsData:", 0);
  -[NTPBTagRecord setSportsTheme:](self, "setSportsTheme:", 0);
  -[NTPBTagRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:", 0);
  -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageURL:](self, "setDarkStyleNavigationChromeBackgroundImageURL:", 0);
  -[NTPBTagRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:", 0);
  -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageCompactURL:](self, "setDarkStyleNavigationChromeBackgroundImageCompactURL:", 0);
  -[NTPBTagRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:", 0);
  -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageLargeURL:](self, "setDarkStyleNavigationChromeBackgroundImageLargeURL:", 0);
  -[NTPBTagRecord setPublisherSpecifiedArticlesJson:](self, "setPublisherSpecifiedArticlesJson:", 0);
  -[NTPBTagRecord setAdTargetingKeywords:](self, "setAdTargetingKeywords:", 0);
  -[NTPBTagRecord setFeedNavImageHQURL:](self, "setFeedNavImageHQURL:", 0);
  -[NTPBTagRecord setSportsLogoAltImageURL:](self, "setSportsLogoAltImageURL:", 0);
  -[NTPBTagRecord setSportsLogoAltImageCompactURL:](self, "setSportsLogoAltImageCompactURL:", 0);
  -[NTPBTagRecord setSportsLogoAltImageLargeURL:](self, "setSportsLogoAltImageLargeURL:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagRecord;
  -[NTPBTagRecord dealloc](&v3, sel_dealloc);
}

- (void)setTemplateJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 624);
}

- (void)setSupergroupKnobsJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (void)setSupergroupConfigJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 592);
}

- (void)setStocksFeedConfigurationJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (void)setSportsTheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (void)setSportsRecommendationMappingsJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (void)setSportsLogoImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (void)setSportsLogoImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (void)setSportsLogoImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (void)setSportsLogoAltImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (void)setSportsLogoAltImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (void)setSportsLogoAltImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (void)setSportsData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (void)setReplacementID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (void)setRecentIssueIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (void)setPurchaseOfferableConfigurations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (void)setPublisherSpecifiedArticlesJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (void)setPublisherSpecifiedArticleIDsModifiedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 472);
}

- (void)setPublisherSpecifiedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (void)setPublisherPaidWebaccessURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (void)setPublisherPaidVerificationURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (void)setPublisherPaidFeldsparablePurchaseIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (void)setPublisherPaidDescriptionStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (void)setPublisherPaidBundlePurchaseIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (void)setPublisherPaidAuthorizationURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (void)setPrimaryAudience:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (void)setParentID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (void)setPaidBundlePaywallConfigurationJson:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (void)setNavigationChromeBackgroundImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (void)setNameImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (void)setNameImageMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (void)setNameImageMaskWidgetLQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (void)setNameImageMaskWidgetHQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (void)setNameImageMaskURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (void)setNameImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void)setNameImageLargeMaskURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (void)setNameImageForDarkBackgroundURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (void)setNameImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void)setNameImageCompactMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (void)setNameCompact:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (void)setMagazineGenre:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (void)setLatestIssueIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (void)setIAdKeywords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (void)setIAdCategories:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setHighlightsArticleListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setFeedNavImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setFeedNavImageHQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)setFeedConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (void)setDarkStyleNavigationChromeBackgroundImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setDarkStyleNavigationChromeBackgroundImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setDarkStyleNavigationChromeBackgroundImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setCoverImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (void)setChannelSectionIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)setChannelSectionFeedConfigurations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setChannelDefaultSectionID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setArticleRecirculationConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (void)setArchiveIssueListID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setAdTargetingKeywords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has;
  NSMutableArray *iAdCategories;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  NSMutableArray *channelSectionIDs;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  NSMutableArray *channelSectionFeedConfigurations;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v37;
  NSMutableArray *publisherPaidFeldsparablePurchaseIDs;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  void *v43;
  NSMutableArray *publisherPaidBundlePurchaseIDs;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t jj;
  void *v49;
  NSMutableArray *purchaseOfferableConfigurations;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  void *v55;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v56;
  NSMutableArray *iAdKeywords;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t mm;
  void *v62;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v63;
  NSMutableArray *publisherSpecifiedArticleIDs;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t nn;
  void *v69;
  NSMutableArray *latestIssueIDs;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i1;
  void *v75;
  NSMutableArray *recentIssueIDs;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i2;
  void *v81;
  NSMutableArray *adTargetingKeywords;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i3;
  void *v87;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 112) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v5 + 632) = self->_type;
    *(_DWORD *)(v5 + 648) |= 0x400u;
  }

  *(_QWORD *)(v5 + 272) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_contentProvider;
    *(_DWORD *)(v5 + 648) |= 2u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 641) = self->_isPublic;
  *(_DWORD *)(v5 + 648) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 637) = self->_isDeprecated;
    *(_DWORD *)(v5 + 648) |= 0x1000u;
  }
LABEL_7:

  *(_QWORD *)(v5 + 504) = -[NSString copyWithZone:](self->_replacementID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 408) = -[NSString copyWithZone:](self->_primaryAudience, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 400) = -[NSString copyWithZone:](self->_parentID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 256) = -[NSString copyWithZone:](self->_logoURL, "copyWithZone:", a3);
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  iAdCategories = self->_iAdCategories;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v138 != v10)
          objc_enumerationMutation(iAdCategories);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIAdCategories:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    }
    while (v9);
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v134 != v16)
          objc_enumerationMutation(blockedStorefrontIDs);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
    }
    while (v15);
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v130;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v130 != v22)
          objc_enumerationMutation(allowedStorefrontIDs);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v129, v151, 16);
    }
    while (v21);
  }

  *(_QWORD *)(v5 + 184) = -[NTPBFeedConfiguration copyWithZone:](self->_feedConfiguration, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_score;
    *(_DWORD *)(v5 + 648) |= 0x80u;
  }

  *(_QWORD *)(v5 + 360) = -[NSString copyWithZone:](self->_nameImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 304) = -[NSString copyWithZone:](self->_nameImageForDarkBackgroundURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 328) = -[NSString copyWithZone:](self->_nameImageMaskURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 352) = -[NSData copyWithZone:](self->_nameImageMetadata, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 152) = -[NSString copyWithZone:](self->_coverImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 624) = -[NSString copyWithZone:](self->_templateJson, "copyWithZone:", a3);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  channelSectionIDs = self->_channelSectionIDs;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionIDs, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v126;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v126 != v28)
          objc_enumerationMutation(channelSectionIDs);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelSectionIDs:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionIDs, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
    }
    while (v27);
  }

  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_channelDefaultSectionID, "copyWithZone:", a3);
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v122;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v122 != v34)
          objc_enumerationMutation(channelSectionFeedConfigurations);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addChannelSectionFeedConfigurations:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
    }
    while (v33);
  }
  v37 = self->_has;
  if ((*(_BYTE *)&v37 & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_minimumNewsVersion;
    *(_DWORD *)(v5 + 648) |= 4u;
    v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x2000) == 0)
    {
LABEL_46:
      if ((*(_WORD *)&v37 & 0x8000) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v37 & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  *(_BYTE *)(v5 + 638) = self->_isExplicitContent;
  *(_DWORD *)(v5 + 648) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_47:
    *(_BYTE *)(v5 + 640) = self->_isNotificationEnabled;
    *(_DWORD *)(v5 + 648) |= 0x8000u;
  }
LABEL_48:

  *(_QWORD *)(v5 + 416) = -[NSString copyWithZone:](self->_publisherPaidAuthorizationURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 448) = -[NSString copyWithZone:](self->_publisherPaidVerificationURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 456) = -[NSString copyWithZone:](self->_publisherPaidWebaccessURL, "copyWithZone:", a3);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidFeldsparablePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v118;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v118 != v41)
          objc_enumerationMutation(publisherPaidFeldsparablePurchaseIDs);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPublisherPaidFeldsparablePurchaseIDs:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidFeldsparablePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
    }
    while (v40);
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidBundlePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v114;
    do
    {
      for (jj = 0; jj != v46; ++jj)
      {
        if (*(_QWORD *)v114 != v47)
          objc_enumerationMutation(publisherPaidBundlePurchaseIDs);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPublisherPaidBundlePurchaseIDs:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidBundlePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
    }
    while (v46);
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v109, v146, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v110;
    do
    {
      for (kk = 0; kk != v52; ++kk)
      {
        if (*(_QWORD *)v110 != v53)
          objc_enumerationMutation(purchaseOfferableConfigurations);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPurchaseOfferableConfiguration:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v109, v146, 16);
    }
    while (v52);
  }
  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    *(_BYTE *)(v5 + 643) = self->_publisherPaidLeakyPaywallOptOut;
    *(_DWORD *)(v5 + 648) |= 0x40000u;
    v56 = self->_has;
    if ((*(_DWORD *)&v56 & 0x80000) == 0)
    {
LABEL_71:
      if ((*(_BYTE *)&v56 & 8) == 0)
        goto LABEL_72;
      goto LABEL_132;
    }
  }
  else if ((*(_DWORD *)&v56 & 0x80000) == 0)
  {
    goto LABEL_71;
  }
  *(_BYTE *)(v5 + 644) = self->_publisherPaidWebOptIn;
  *(_DWORD *)(v5 + 648) |= 0x80000u;
  v56 = self->_has;
  if ((*(_BYTE *)&v56 & 8) == 0)
  {
LABEL_72:
    if ((*(_BYTE *)&v56 & 0x10) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_132:
  *(_QWORD *)(v5 + 32) = self->_nameImageBaselineShift;
  *(_DWORD *)(v5 + 648) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_73:
    *(double *)(v5 + 40) = self->_nameImageScaleFactor;
    *(_DWORD *)(v5 + 648) |= 0x10u;
  }
LABEL_74:
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  iAdKeywords = self->_iAdKeywords;
  v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v105, v145, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v106;
    do
    {
      for (mm = 0; mm != v59; ++mm)
      {
        if (*(_QWORD *)v106 != v60)
          objc_enumerationMutation(iAdKeywords);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIAdKeywords:", v62);

      }
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v105, v145, 16);
    }
    while (v59);
  }

  *(_QWORD *)(v5 + 344) = -[NSString copyWithZone:](self->_nameImageMaskWidgetLQURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 336) = -[NSString copyWithZone:](self->_nameImageMaskWidgetHQURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(_BYTE *)(v5 + 636) = self->_hideAccessoryText;
    *(_DWORD *)(v5 + 648) |= 0x800u;
  }

  *(_QWORD *)(v5 + 432) = -[NTPBPublisherPaidDescriptionStrings copyWithZone:](self->_publisherPaidDescriptionStrings, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 280) = -[NSString copyWithZone:](self->_nameCompact, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 296) = -[NSString copyWithZone:](self->_nameImageCompactURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 288) = -[NSData copyWithZone:](self->_nameImageCompactMetadata, "copyWithZone:", a3);
  v63 = self->_has;
  if ((*(_WORD *)&v63 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 208) = self->_groupingAvailability;
    *(_DWORD *)(v5 + 648) |= 0x200u;
    v63 = self->_has;
    if ((*(_WORD *)&v63 & 0x4000) == 0)
    {
LABEL_85:
      if ((*(_BYTE *)&v63 & 1) == 0)
        goto LABEL_87;
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&v63 & 0x4000) == 0)
  {
    goto LABEL_85;
  }
  *(_BYTE *)(v5 + 639) = self->_isHidden;
  *(_DWORD *)(v5 + 648) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_86:
    *(_QWORD *)(v5 + 8) = self->_behaviorFlags;
    *(_DWORD *)(v5 + 648) |= 1u;
  }
LABEL_87:

  *(_QWORD *)(v5 + 104) = -[NSData copyWithZone:](self->_articleRecirculationConfiguration, "copyWithZone:", a3);
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v102;
    do
    {
      for (nn = 0; nn != v66; ++nn)
      {
        if (*(_QWORD *)v102 != v67)
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPublisherSpecifiedArticleIDs:", v69);

      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v101, v144, 16);
    }
    while (v66);
  }

  *(_QWORD *)(v5 + 592) = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 472) = -[NTPBDate copyWithZone:](self->_publisherSpecifiedArticleIDsModifiedDate, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 200) = -[NSString copyWithZone:](self->_feedNavImageURL, "copyWithZone:", a3);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  latestIssueIDs = self->_latestIssueIDs;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestIssueIDs, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v98;
    do
    {
      for (i1 = 0; i1 != v72; ++i1)
      {
        if (*(_QWORD *)v98 != v73)
          objc_enumerationMutation(latestIssueIDs);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLatestIssueIDs:", v75);

      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestIssueIDs, "countByEnumeratingWithState:objects:count:", &v97, v143, 16);
    }
    while (v72);
  }

  *(_QWORD *)(v5 + 96) = -[NSString copyWithZone:](self->_archiveIssueListID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 240) = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 264) = -[NSString copyWithZone:](self->_magazineGenre, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 392) = -[NSString copyWithZone:](self->_paidBundlePaywallConfigurationJson, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 584) = -[NSString copyWithZone:](self->_stocksFeedConfigurationJson, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 608) = -[NSString copyWithZone:](self->_supergroupConfigJson, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 616) = -[NSString copyWithZone:](self->_supergroupKnobsJson, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_propertyFlags;
    *(_DWORD *)(v5 + 648) |= 0x20u;
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  recentIssueIDs = self->_recentIssueIDs;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentIssueIDs, "countByEnumeratingWithState:objects:count:", &v93, v142, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v94;
    do
    {
      for (i2 = 0; i2 != v78; ++i2)
      {
        if (*(_QWORD *)v94 != v79)
          objc_enumerationMutation(recentIssueIDs);
        v81 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRecentIssueIDs:", v81);

      }
      v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentIssueIDs, "countByEnumeratingWithState:objects:count:", &v93, v142, 16);
    }
    while (v78);
  }

  *(_QWORD *)(v5 + 320) = -[NSString copyWithZone:](self->_nameImageLargeURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 312) = -[NSString copyWithZone:](self->_nameImageLargeMaskURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 600) = -[NSString copyWithZone:](self->_superfeedConfigResourceID, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_BYTE *)(v5 + 642) = self->_isSportsRecommendable;
    *(_DWORD *)(v5 + 648) |= 0x20000u;
  }

  *(_QWORD *)(v5 + 568) = -[NSData copyWithZone:](self->_sportsRecommendationMappingsJson, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 216) = -[NSString copyWithZone:](self->_highlightsArticleListID, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 560) = -[NSString copyWithZone:](self->_sportsLogoImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 544) = -[NSString copyWithZone:](self->_sportsLogoImageCompactURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 552) = -[NSString copyWithZone:](self->_sportsLogoImageLargeURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 512) = -[NSString copyWithZone:](self->_sportsData, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 576) = -[NSString copyWithZone:](self->_sportsTheme, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 384) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 176) = -[NSString copyWithZone:](self->_darkStyleNavigationChromeBackgroundImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 368) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageCompactURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_darkStyleNavigationChromeBackgroundImageCompactURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 376) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageLargeURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 168) = -[NSString copyWithZone:](self->_darkStyleNavigationChromeBackgroundImageLargeURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(double *)(v5 + 72) = self->_subscriptionRate;
    *(_DWORD *)(v5 + 648) |= 0x100u;
  }

  *(_QWORD *)(v5 + 480) = -[NSString copyWithZone:](self->_publisherSpecifiedArticlesJson, "copyWithZone:", a3);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  adTargetingKeywords = self->_adTargetingKeywords;
  v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adTargetingKeywords, "countByEnumeratingWithState:objects:count:", &v89, v141, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v90;
    do
    {
      for (i3 = 0; i3 != v84; ++i3)
      {
        if (*(_QWORD *)v90 != v85)
          objc_enumerationMutation(adTargetingKeywords);
        v87 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAdTargetingKeywords:", v87);

      }
      v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adTargetingKeywords, "countByEnumeratingWithState:objects:count:", &v89, v141, 16);
    }
    while (v84);
  }

  *(_QWORD *)(v5 + 192) = -[NSString copyWithZone:](self->_feedNavImageHQURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 536) = -[NSString copyWithZone:](self->_sportsLogoAltImageURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 520) = -[NSString copyWithZone:](self->_sportsLogoAltImageCompactURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 528) = -[NSString copyWithZone:](self->_sportsLogoAltImageLargeURL, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_propertyFlagsLocalized;
    *(_DWORD *)(v5 + 648) |= 0x40u;
  }
  return (id)v5;
}

- (void)addChannelSectionIDs:(id)a3
{
  NSMutableArray *channelSectionIDs;

  channelSectionIDs = self->_channelSectionIDs;
  if (!channelSectionIDs)
  {
    channelSectionIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_channelSectionIDs = channelSectionIDs;
  }
  -[NSMutableArray addObject:](channelSectionIDs, "addObject:", a3);
}

- (void)addChannelSectionFeedConfigurations:(id)a3
{
  NSMutableArray *channelSectionFeedConfigurations;

  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  if (!channelSectionFeedConfigurations)
  {
    channelSectionFeedConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_channelSectionFeedConfigurations = channelSectionFeedConfigurations;
  }
  -[NSMutableArray addObject:](channelSectionFeedConfigurations, "addObject:", a3);
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  NSMutableArray *allowedStorefrontIDs;

  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }
  -[NSMutableArray addObject:](allowedStorefrontIDs, "addObject:", a3);
}

- (void)addPublisherSpecifiedArticleIDs:(id)a3
{
  NSMutableArray *publisherSpecifiedArticleIDs;

  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (!publisherSpecifiedArticleIDs)
  {
    publisherSpecifiedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_publisherSpecifiedArticleIDs = publisherSpecifiedArticleIDs;
  }
  -[NSMutableArray addObject:](publisherSpecifiedArticleIDs, "addObject:", a3);
}

- (void)addIAdCategories:(id)a3
{
  NSMutableArray *iAdCategories;

  iAdCategories = self->_iAdCategories;
  if (!iAdCategories)
  {
    iAdCategories = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_iAdCategories = iAdCategories;
  }
  -[NSMutableArray addObject:](iAdCategories, "addObject:", a3);
}

- (void)addRecentIssueIDs:(id)a3
{
  NSMutableArray *recentIssueIDs;

  recentIssueIDs = self->_recentIssueIDs;
  if (!recentIssueIDs)
  {
    recentIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_recentIssueIDs = recentIssueIDs;
  }
  -[NSMutableArray addObject:](recentIssueIDs, "addObject:", a3);
}

- (void)addPublisherPaidBundlePurchaseIDs:(id)a3
{
  NSMutableArray *publisherPaidBundlePurchaseIDs;

  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if (!publisherPaidBundlePurchaseIDs)
  {
    publisherPaidBundlePurchaseIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_publisherPaidBundlePurchaseIDs = publisherPaidBundlePurchaseIDs;
  }
  -[NSMutableArray addObject:](publisherPaidBundlePurchaseIDs, "addObject:", a3);
}

- (void)addPublisherPaidFeldsparablePurchaseIDs:(id)a3
{
  NSMutableArray *publisherPaidFeldsparablePurchaseIDs;

  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if (!publisherPaidFeldsparablePurchaseIDs)
  {
    publisherPaidFeldsparablePurchaseIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_publisherPaidFeldsparablePurchaseIDs = publisherPaidFeldsparablePurchaseIDs;
  }
  -[NSMutableArray addObject:](publisherPaidFeldsparablePurchaseIDs, "addObject:", a3);
}

- (void)addLatestIssueIDs:(id)a3
{
  NSMutableArray *latestIssueIDs;

  latestIssueIDs = self->_latestIssueIDs;
  if (!latestIssueIDs)
  {
    latestIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_latestIssueIDs = latestIssueIDs;
  }
  -[NSMutableArray addObject:](latestIssueIDs, "addObject:", a3);
}

- (void)addPurchaseOfferableConfiguration:(id)a3
{
  NSMutableArray *purchaseOfferableConfigurations;

  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  if (!purchaseOfferableConfigurations)
  {
    purchaseOfferableConfigurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_purchaseOfferableConfigurations = purchaseOfferableConfigurations;
  }
  -[NSMutableArray addObject:](purchaseOfferableConfigurations, "addObject:", a3);
}

- (void)addAdTargetingKeywords:(id)a3
{
  NSMutableArray *adTargetingKeywords;

  adTargetingKeywords = self->_adTargetingKeywords;
  if (!adTargetingKeywords)
  {
    adTargetingKeywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_adTargetingKeywords = adTargetingKeywords;
  }
  -[NSMutableArray addObject:](adTargetingKeywords, "addObject:", a3);
}

- (void)addIAdKeywords:(id)a3
{
  NSMutableArray *iAdKeywords;

  iAdKeywords = self->_iAdKeywords;
  if (!iAdKeywords)
  {
    iAdKeywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_iAdKeywords = iAdKeywords;
  }
  -[NSMutableArray addObject:](iAdKeywords, "addObject:", a3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_type = a3;
}

- (void)setSubscriptionRate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_subscriptionRate = a3;
}

- (void)setScore:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_score = a3;
}

- (void)setPublisherPaidWebOptIn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_publisherPaidWebOptIn = a3;
}

- (void)setPublisherPaidLeakyPaywallOptOut:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_publisherPaidLeakyPaywallOptOut = a3;
}

- (void)setPropertyFlagsLocalized:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_propertyFlagsLocalized = a3;
}

- (void)setPropertyFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_propertyFlags = a3;
}

- (void)setNameImageScaleFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_nameImageScaleFactor = a3;
}

- (void)setNameImageBaselineShift:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_nameImageBaselineShift = a3;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_minimumNewsVersion = a3;
}

- (void)setIsSportsRecommendable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isSportsRecommendable = a3;
}

- (void)setIsPublic:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isPublic = a3;
}

- (void)setIsNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isNotificationEnabled = a3;
}

- (void)setIsHidden:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isHidden = a3;
}

- (void)setIsExplicitContent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isExplicitContent = a3;
}

- (void)setIsDeprecated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isDeprecated = a3;
}

- (void)setHideAccessoryText:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hideAccessoryText = a3;
}

- (void)setGroupingAvailability:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_groupingAvailability = a3;
}

- (void)setContentProvider:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_contentProvider = a3;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_behaviorFlags = a3;
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)setHasType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setHasContentProvider:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasContentProvider
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsPublic:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsPublic
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsDeprecated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasReplacementID
{
  return self->_replacementID != 0;
}

- (BOOL)hasPrimaryAudience
{
  return self->_primaryAudience != 0;
}

- (BOOL)hasParentID
{
  return self->_parentID != 0;
}

- (BOOL)hasLogoURL
{
  return self->_logoURL != 0;
}

- (void)clearIAdCategories
{
  -[NSMutableArray removeAllObjects](self->_iAdCategories, "removeAllObjects");
}

- (unint64_t)iAdCategoriesCount
{
  return -[NSMutableArray count](self->_iAdCategories, "count");
}

- (id)iAdCategoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_iAdCategories, "objectAtIndex:", a3);
}

+ (Class)iAdCategoriesType
{
  return (Class)objc_opt_class();
}

- (void)clearBlockedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_blockedStorefrontIDs, "removeAllObjects");
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  NSMutableArray *blockedStorefrontIDs;

  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }
  -[NSMutableArray addObject:](blockedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)blockedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_blockedStorefrontIDs, "count");
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blockedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_allowedStorefrontIDs, "removeAllObjects");
}

- (unint64_t)allowedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_allowedStorefrontIDs, "count");
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allowedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedConfiguration
{
  return self->_feedConfiguration != 0;
}

- (void)setHasScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasNameImageURL
{
  return self->_nameImageURL != 0;
}

- (BOOL)hasNameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL != 0;
}

- (BOOL)hasNameImageMaskURL
{
  return self->_nameImageMaskURL != 0;
}

- (BOOL)hasNameImageMetadata
{
  return self->_nameImageMetadata != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (BOOL)hasTemplateJson
{
  return self->_templateJson != 0;
}

- (void)clearChannelSectionIDs
{
  -[NSMutableArray removeAllObjects](self->_channelSectionIDs, "removeAllObjects");
}

- (unint64_t)channelSectionIDsCount
{
  return -[NSMutableArray count](self->_channelSectionIDs, "count");
}

- (id)channelSectionIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelSectionIDs, "objectAtIndex:", a3);
}

+ (Class)channelSectionIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelDefaultSectionID
{
  return self->_channelDefaultSectionID != 0;
}

- (void)clearChannelSectionFeedConfigurations
{
  -[NSMutableArray removeAllObjects](self->_channelSectionFeedConfigurations, "removeAllObjects");
}

- (unint64_t)channelSectionFeedConfigurationsCount
{
  return -[NSMutableArray count](self->_channelSectionFeedConfigurations, "count");
}

- (id)channelSectionFeedConfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelSectionFeedConfigurations, "objectAtIndex:", a3);
}

+ (Class)channelSectionFeedConfigurationsType
{
  return (Class)objc_opt_class();
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIsExplicitContent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasIsNotificationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsNotificationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPublisherPaidAuthorizationURL
{
  return self->_publisherPaidAuthorizationURL != 0;
}

- (BOOL)hasPublisherPaidVerificationURL
{
  return self->_publisherPaidVerificationURL != 0;
}

- (BOOL)hasPublisherPaidWebaccessURL
{
  return self->_publisherPaidWebaccessURL != 0;
}

- (void)clearPublisherPaidFeldsparablePurchaseIDs
{
  -[NSMutableArray removeAllObjects](self->_publisherPaidFeldsparablePurchaseIDs, "removeAllObjects");
}

- (unint64_t)publisherPaidFeldsparablePurchaseIDsCount
{
  return -[NSMutableArray count](self->_publisherPaidFeldsparablePurchaseIDs, "count");
}

- (id)publisherPaidFeldsparablePurchaseIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_publisherPaidFeldsparablePurchaseIDs, "objectAtIndex:", a3);
}

+ (Class)publisherPaidFeldsparablePurchaseIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPublisherPaidBundlePurchaseIDs
{
  -[NSMutableArray removeAllObjects](self->_publisherPaidBundlePurchaseIDs, "removeAllObjects");
}

- (unint64_t)publisherPaidBundlePurchaseIDsCount
{
  return -[NSMutableArray count](self->_publisherPaidBundlePurchaseIDs, "count");
}

- (id)publisherPaidBundlePurchaseIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_publisherPaidBundlePurchaseIDs, "objectAtIndex:", a3);
}

+ (Class)publisherPaidBundlePurchaseIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPurchaseOfferableConfigurations
{
  -[NSMutableArray removeAllObjects](self->_purchaseOfferableConfigurations, "removeAllObjects");
}

- (unint64_t)purchaseOfferableConfigurationsCount
{
  return -[NSMutableArray count](self->_purchaseOfferableConfigurations, "count");
}

- (id)purchaseOfferableConfigurationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_purchaseOfferableConfigurations, "objectAtIndex:", a3);
}

+ (Class)purchaseOfferableConfigurationType
{
  return (Class)objc_opt_class();
}

- (void)setHasPublisherPaidLeakyPaywallOptOut:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPublisherPaidLeakyPaywallOptOut
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasPublisherPaidWebOptIn:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPublisherPaidWebOptIn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasNameImageBaselineShift:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNameImageBaselineShift
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNameImageScaleFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNameImageScaleFactor
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearIAdKeywords
{
  -[NSMutableArray removeAllObjects](self->_iAdKeywords, "removeAllObjects");
}

- (unint64_t)iAdKeywordsCount
{
  return -[NSMutableArray count](self->_iAdKeywords, "count");
}

- (id)iAdKeywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_iAdKeywords, "objectAtIndex:", a3);
}

+ (Class)iAdKeywordsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNameImageMaskWidgetLQURL
{
  return self->_nameImageMaskWidgetLQURL != 0;
}

- (BOOL)hasNameImageMaskWidgetHQURL
{
  return self->_nameImageMaskWidgetHQURL != 0;
}

- (void)setHasHideAccessoryText:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHideAccessoryText
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPublisherPaidDescriptionStrings
{
  return self->_publisherPaidDescriptionStrings != 0;
}

- (BOOL)hasNameCompact
{
  return self->_nameCompact != 0;
}

- (BOOL)hasNameImageCompactURL
{
  return self->_nameImageCompactURL != 0;
}

- (BOOL)hasNameImageCompactMetadata
{
  return self->_nameImageCompactMetadata != 0;
}

- (void)setHasGroupingAvailability:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGroupingAvailability
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasIsHidden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsHidden
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBehaviorFlags
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasArticleRecirculationConfiguration
{
  return self->_articleRecirculationConfiguration != 0;
}

- (void)clearPublisherSpecifiedArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_publisherSpecifiedArticleIDs, "removeAllObjects");
}

- (unint64_t)publisherSpecifiedArticleIDsCount
{
  return -[NSMutableArray count](self->_publisherSpecifiedArticleIDs, "count");
}

- (id)publisherSpecifiedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_publisherSpecifiedArticleIDs, "objectAtIndex:", a3);
}

+ (Class)publisherSpecifiedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasPublisherSpecifiedArticleIDsModifiedDate
{
  return self->_publisherSpecifiedArticleIDsModifiedDate != 0;
}

- (BOOL)hasFeedNavImageURL
{
  return self->_feedNavImageURL != 0;
}

- (void)clearLatestIssueIDs
{
  -[NSMutableArray removeAllObjects](self->_latestIssueIDs, "removeAllObjects");
}

- (unint64_t)latestIssueIDsCount
{
  return -[NSMutableArray count](self->_latestIssueIDs, "count");
}

- (id)latestIssueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_latestIssueIDs, "objectAtIndex:", a3);
}

+ (Class)latestIssueIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasArchiveIssueListID
{
  return self->_archiveIssueListID != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasMagazineGenre
{
  return self->_magazineGenre != 0;
}

- (BOOL)hasPaidBundlePaywallConfigurationJson
{
  return self->_paidBundlePaywallConfigurationJson != 0;
}

- (BOOL)hasStocksFeedConfigurationJson
{
  return self->_stocksFeedConfigurationJson != 0;
}

- (BOOL)hasSupergroupConfigJson
{
  return self->_supergroupConfigJson != 0;
}

- (BOOL)hasSupergroupKnobsJson
{
  return self->_supergroupKnobsJson != 0;
}

- (void)setHasPropertyFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPropertyFlags
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearRecentIssueIDs
{
  -[NSMutableArray removeAllObjects](self->_recentIssueIDs, "removeAllObjects");
}

- (unint64_t)recentIssueIDsCount
{
  return -[NSMutableArray count](self->_recentIssueIDs, "count");
}

- (id)recentIssueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recentIssueIDs, "objectAtIndex:", a3);
}

+ (Class)recentIssueIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNameImageLargeURL
{
  return self->_nameImageLargeURL != 0;
}

- (BOOL)hasNameImageLargeMaskURL
{
  return self->_nameImageLargeMaskURL != 0;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)setHasIsSportsRecommendable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsSportsRecommendable
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasSportsRecommendationMappingsJson
{
  return self->_sportsRecommendationMappingsJson != 0;
}

- (BOOL)hasHighlightsArticleListID
{
  return self->_highlightsArticleListID != 0;
}

- (BOOL)hasSportsLogoImageURL
{
  return self->_sportsLogoImageURL != 0;
}

- (BOOL)hasSportsLogoImageCompactURL
{
  return self->_sportsLogoImageCompactURL != 0;
}

- (BOOL)hasSportsLogoImageLargeURL
{
  return self->_sportsLogoImageLargeURL != 0;
}

- (BOOL)hasSportsData
{
  return self->_sportsData != 0;
}

- (BOOL)hasSportsTheme
{
  return self->_sportsTheme != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageURL
{
  return self->_darkStyleNavigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageCompactURL
{
  return self->_darkStyleNavigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL != 0;
}

- (BOOL)hasDarkStyleNavigationChromeBackgroundImageLargeURL
{
  return self->_darkStyleNavigationChromeBackgroundImageLargeURL != 0;
}

- (void)setHasSubscriptionRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSubscriptionRate
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)clearAdTargetingKeywords
{
  -[NSMutableArray removeAllObjects](self->_adTargetingKeywords, "removeAllObjects");
}

- (unint64_t)adTargetingKeywordsCount
{
  return -[NSMutableArray count](self->_adTargetingKeywords, "count");
}

- (id)adTargetingKeywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_adTargetingKeywords, "objectAtIndex:", a3);
}

+ (Class)adTargetingKeywordsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFeedNavImageHQURL
{
  return self->_feedNavImageHQURL != 0;
}

- (BOOL)hasSportsLogoAltImageURL
{
  return self->_sportsLogoAltImageURL != 0;
}

- (BOOL)hasSportsLogoAltImageCompactURL
{
  return self->_sportsLogoAltImageCompactURL != 0;
}

- (BOOL)hasSportsLogoAltImageLargeURL
{
  return self->_sportsLogoAltImageLargeURL != 0;
}

- (void)setHasPropertyFlagsLocalized:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($33EA3DE8810A8DA2B3B0E292DEF75CDE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPropertyFlagsLocalized
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTagRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTagRecord description](&v3, sel_description), -[NTPBTagRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *name;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has;
  NSString *replacementID;
  NSString *primaryAudience;
  NSString *parentID;
  NSString *logoURL;
  NSMutableArray *iAdCategories;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NTPBFeedConfiguration *feedConfiguration;
  NSString *nameImageURL;
  NSString *nameImageForDarkBackgroundURL;
  NSString *nameImageMaskURL;
  NSData *nameImageMetadata;
  NSString *coverImageURL;
  NSString *templateJson;
  NSMutableArray *channelSectionIDs;
  NSString *channelDefaultSectionID;
  void *v23;
  NSMutableArray *channelSectionFeedConfigurations;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v29;
  NSString *publisherPaidAuthorizationURL;
  NSString *publisherPaidVerificationURL;
  NSString *publisherPaidWebaccessURL;
  NSMutableArray *publisherPaidFeldsparablePurchaseIDs;
  NSMutableArray *publisherPaidBundlePurchaseIDs;
  void *v35;
  NSMutableArray *purchaseOfferableConfigurations;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v41;
  NSMutableArray *iAdKeywords;
  NSString *nameImageMaskWidgetLQURL;
  NSString *nameImageMaskWidgetHQURL;
  NTPBPublisherPaidDescriptionStrings *publisherPaidDescriptionStrings;
  NSString *nameCompact;
  NSString *nameImageCompactURL;
  NSData *nameImageCompactMetadata;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v49;
  NSData *articleRecirculationConfiguration;
  NSMutableArray *publisherSpecifiedArticleIDs;
  NSString *subtitle;
  NTPBDate *publisherSpecifiedArticleIDsModifiedDate;
  NSString *feedNavImageURL;
  NSMutableArray *latestIssueIDs;
  NSString *archiveIssueListID;
  NSString *language;
  NSString *magazineGenre;
  NSString *paidBundlePaywallConfigurationJson;
  NSString *stocksFeedConfigurationJson;
  NSString *supergroupConfigJson;
  NSString *supergroupKnobsJson;
  NSMutableArray *recentIssueIDs;
  NSString *nameImageLargeURL;
  NSString *nameImageLargeMaskURL;
  NSString *superfeedConfigResourceID;
  NSData *sportsRecommendationMappingsJson;
  NSString *highlightsArticleListID;
  NSString *sportsLogoImageURL;
  NSString *sportsLogoImageCompactURL;
  NSString *sportsLogoImageLargeURL;
  NSString *sportsData;
  NSString *sportsTheme;
  NSString *navigationChromeBackgroundImageURL;
  NSString *darkStyleNavigationChromeBackgroundImageURL;
  NSString *navigationChromeBackgroundImageCompactURL;
  NSString *darkStyleNavigationChromeBackgroundImageCompactURL;
  NSString *navigationChromeBackgroundImageLargeURL;
  NSString *darkStyleNavigationChromeBackgroundImageLargeURL;
  NSString *publisherSpecifiedArticlesJson;
  NSMutableArray *adTargetingKeywords;
  NSString *feedNavImageHQURL;
  NSString *sportsLogoAltImageURL;
  NSString *sportsLogoAltImageCompactURL;
  NSString *sportsLogoAltImageLargeURL;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type), CFSTR("type"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_contentProvider), CFSTR("content_provider"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPublic), CFSTR("is_public"));
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_10:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDeprecated), CFSTR("is_deprecated"));
LABEL_11:
  replacementID = self->_replacementID;
  if (replacementID)
    objc_msgSend(v3, "setObject:forKey:", replacementID, CFSTR("replacement_ID"));
  primaryAudience = self->_primaryAudience;
  if (primaryAudience)
    objc_msgSend(v3, "setObject:forKey:", primaryAudience, CFSTR("primary_audience"));
  parentID = self->_parentID;
  if (parentID)
    objc_msgSend(v3, "setObject:forKey:", parentID, CFSTR("parent_ID"));
  logoURL = self->_logoURL;
  if (logoURL)
    objc_msgSend(v3, "setObject:forKey:", logoURL, CFSTR("logo_URL"));
  iAdCategories = self->_iAdCategories;
  if (iAdCategories)
    objc_msgSend(v3, "setObject:forKey:", iAdCategories, CFSTR("i_ad_categories"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  feedConfiguration = self->_feedConfiguration;
  if (feedConfiguration)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBFeedConfiguration dictionaryRepresentation](feedConfiguration, "dictionaryRepresentation"), CFSTR("feed_configuration"));
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_score), CFSTR("score"));
  nameImageURL = self->_nameImageURL;
  if (nameImageURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageURL, CFSTR("name_image_URL"));
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if (nameImageForDarkBackgroundURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageForDarkBackgroundURL, CFSTR("name_image_for_dark_background_URL"));
  nameImageMaskURL = self->_nameImageMaskURL;
  if (nameImageMaskURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageMaskURL, CFSTR("name_image_mask_URL"));
  nameImageMetadata = self->_nameImageMetadata;
  if (nameImageMetadata)
    objc_msgSend(v3, "setObject:forKey:", nameImageMetadata, CFSTR("name_image_metadata"));
  coverImageURL = self->_coverImageURL;
  if (coverImageURL)
    objc_msgSend(v3, "setObject:forKey:", coverImageURL, CFSTR("cover_image_URL"));
  templateJson = self->_templateJson;
  if (templateJson)
    objc_msgSend(v3, "setObject:forKey:", templateJson, CFSTR("template_json"));
  channelSectionIDs = self->_channelSectionIDs;
  if (channelSectionIDs)
    objc_msgSend(v3, "setObject:forKey:", channelSectionIDs, CFSTR("channel_section_IDs"));
  channelDefaultSectionID = self->_channelDefaultSectionID;
  if (channelDefaultSectionID)
    objc_msgSend(v3, "setObject:forKey:", channelDefaultSectionID, CFSTR("channel_default_section_ID"));
  if (-[NSMutableArray count](self->_channelSectionFeedConfigurations, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_channelSectionFeedConfigurations, "count"));
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v92 != v27)
            objc_enumerationMutation(channelSectionFeedConfigurations);
          objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      }
      while (v26);
    }
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("channel_section_feed_configurations"));

  }
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
    v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x2000) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v29 & 0x8000) == 0)
        goto LABEL_58;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v29 & 0x2000) == 0)
  {
    goto LABEL_56;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExplicitContent), CFSTR("is_explicit_content"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_57:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNotificationEnabled), CFSTR("is_notification_enabled"));
LABEL_58:
  publisherPaidAuthorizationURL = self->_publisherPaidAuthorizationURL;
  if (publisherPaidAuthorizationURL)
    objc_msgSend(v3, "setObject:forKey:", publisherPaidAuthorizationURL, CFSTR("publisher_paid_authorization_URL"));
  publisherPaidVerificationURL = self->_publisherPaidVerificationURL;
  if (publisherPaidVerificationURL)
    objc_msgSend(v3, "setObject:forKey:", publisherPaidVerificationURL, CFSTR("publisher_paid_verification_URL"));
  publisherPaidWebaccessURL = self->_publisherPaidWebaccessURL;
  if (publisherPaidWebaccessURL)
    objc_msgSend(v3, "setObject:forKey:", publisherPaidWebaccessURL, CFSTR("publisher_paid_webaccess_URL"));
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if (publisherPaidFeldsparablePurchaseIDs)
    objc_msgSend(v3, "setObject:forKey:", publisherPaidFeldsparablePurchaseIDs, CFSTR("publisher_paid_feldsparable_purchase_IDs"));
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if (publisherPaidBundlePurchaseIDs)
    objc_msgSend(v3, "setObject:forKey:", publisherPaidBundlePurchaseIDs, CFSTR("publisher_paid_bundle_purchase_IDs"));
  if (-[NSMutableArray count](self->_purchaseOfferableConfigurations, "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_purchaseOfferableConfigurations, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v88 != v39)
            objc_enumerationMutation(purchaseOfferableConfigurations);
          objc_msgSend(v35, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      }
      while (v38);
    }
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("purchase_offerable_configuration"));

  }
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_publisherPaidLeakyPaywallOptOut), CFSTR("publisher_paid_leaky_paywall_opt_out"));
    v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x80000) == 0)
    {
LABEL_79:
      if ((*(_BYTE *)&v41 & 8) == 0)
        goto LABEL_80;
      goto LABEL_191;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x80000) == 0)
  {
    goto LABEL_79;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_publisherPaidWebOptIn), CFSTR("publisher_paid_web_opt_in"));
  v41 = self->_has;
  if ((*(_BYTE *)&v41 & 8) == 0)
  {
LABEL_80:
    if ((*(_BYTE *)&v41 & 0x10) == 0)
      goto LABEL_82;
    goto LABEL_81;
  }
LABEL_191:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nameImageBaselineShift), CFSTR("name_image_baseline_shift"));
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_81:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_nameImageScaleFactor), CFSTR("name_image_scale_factor"));
LABEL_82:
  iAdKeywords = self->_iAdKeywords;
  if (iAdKeywords)
    objc_msgSend(v3, "setObject:forKey:", iAdKeywords, CFSTR("i_ad_keywords"));
  nameImageMaskWidgetLQURL = self->_nameImageMaskWidgetLQURL;
  if (nameImageMaskWidgetLQURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageMaskWidgetLQURL, CFSTR("name_image_mask_widget_LQ_URL"));
  nameImageMaskWidgetHQURL = self->_nameImageMaskWidgetHQURL;
  if (nameImageMaskWidgetHQURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageMaskWidgetHQURL, CFSTR("name_image_mask_widget_HQ_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hideAccessoryText), CFSTR("hide_accessory_text"));
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  if (publisherPaidDescriptionStrings)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPublisherPaidDescriptionStrings dictionaryRepresentation](publisherPaidDescriptionStrings, "dictionaryRepresentation"), CFSTR("publisher_paid_description_strings"));
  nameCompact = self->_nameCompact;
  if (nameCompact)
    objc_msgSend(v3, "setObject:forKey:", nameCompact, CFSTR("name_compact"));
  nameImageCompactURL = self->_nameImageCompactURL;
  if (nameImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageCompactURL, CFSTR("name_image_compact_URL"));
  nameImageCompactMetadata = self->_nameImageCompactMetadata;
  if (nameImageCompactMetadata)
    objc_msgSend(v3, "setObject:forKey:", nameImageCompactMetadata, CFSTR("name_image_compact_metadata"));
  v49 = self->_has;
  if ((*(_WORD *)&v49 & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupingAvailability), CFSTR("grouping_availability"));
    v49 = self->_has;
    if ((*(_WORD *)&v49 & 0x4000) == 0)
    {
LABEL_100:
      if ((*(_BYTE *)&v49 & 1) == 0)
        goto LABEL_102;
      goto LABEL_101;
    }
  }
  else if ((*(_WORD *)&v49 & 0x4000) == 0)
  {
    goto LABEL_100;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHidden), CFSTR("is_hidden"));
  if ((*(_DWORD *)&self->_has & 1) != 0)
LABEL_101:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_behaviorFlags), CFSTR("behavior_flags"));
LABEL_102:
  articleRecirculationConfiguration = self->_articleRecirculationConfiguration;
  if (articleRecirculationConfiguration)
    objc_msgSend(v3, "setObject:forKey:", articleRecirculationConfiguration, CFSTR("article_recirculation_configuration"));
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (publisherSpecifiedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", publisherSpecifiedArticleIDs, CFSTR("publisher_specified_article_IDs"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  if (publisherSpecifiedArticleIDsModifiedDate)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publisherSpecifiedArticleIDsModifiedDate, "dictionaryRepresentation"), CFSTR("publisher_specified_article_IDs_modified_date"));
  feedNavImageURL = self->_feedNavImageURL;
  if (feedNavImageURL)
    objc_msgSend(v3, "setObject:forKey:", feedNavImageURL, CFSTR("feed_nav_image_URL"));
  latestIssueIDs = self->_latestIssueIDs;
  if (latestIssueIDs)
    objc_msgSend(v3, "setObject:forKey:", latestIssueIDs, CFSTR("latest_issue_IDs"));
  archiveIssueListID = self->_archiveIssueListID;
  if (archiveIssueListID)
    objc_msgSend(v3, "setObject:forKey:", archiveIssueListID, CFSTR("archive_issue_list_ID"));
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  magazineGenre = self->_magazineGenre;
  if (magazineGenre)
    objc_msgSend(v3, "setObject:forKey:", magazineGenre, CFSTR("magazine_genre"));
  paidBundlePaywallConfigurationJson = self->_paidBundlePaywallConfigurationJson;
  if (paidBundlePaywallConfigurationJson)
    objc_msgSend(v3, "setObject:forKey:", paidBundlePaywallConfigurationJson, CFSTR("paid_bundle_paywall_configuration_json"));
  stocksFeedConfigurationJson = self->_stocksFeedConfigurationJson;
  if (stocksFeedConfigurationJson)
    objc_msgSend(v3, "setObject:forKey:", stocksFeedConfigurationJson, CFSTR("stocks_feed_configuration_json"));
  supergroupConfigJson = self->_supergroupConfigJson;
  if (supergroupConfigJson)
    objc_msgSend(v3, "setObject:forKey:", supergroupConfigJson, CFSTR("supergroup_config_json"));
  supergroupKnobsJson = self->_supergroupKnobsJson;
  if (supergroupKnobsJson)
    objc_msgSend(v3, "setObject:forKey:", supergroupKnobsJson, CFSTR("supergroup_knobs_json"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_propertyFlags), CFSTR("property_flags"));
  recentIssueIDs = self->_recentIssueIDs;
  if (recentIssueIDs)
    objc_msgSend(v3, "setObject:forKey:", recentIssueIDs, CFSTR("recent_issue_IDs"));
  nameImageLargeURL = self->_nameImageLargeURL;
  if (nameImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageLargeURL, CFSTR("name_image_large_URL"));
  nameImageLargeMaskURL = self->_nameImageLargeMaskURL;
  if (nameImageLargeMaskURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageLargeMaskURL, CFSTR("name_image_large_mask_URL"));
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID)
    objc_msgSend(v3, "setObject:forKey:", superfeedConfigResourceID, CFSTR("superfeed_config_resource_ID"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSportsRecommendable), CFSTR("is_sports_recommendable"));
  sportsRecommendationMappingsJson = self->_sportsRecommendationMappingsJson;
  if (sportsRecommendationMappingsJson)
    objc_msgSend(v3, "setObject:forKey:", sportsRecommendationMappingsJson, CFSTR("sports_recommendation_mappings_json"));
  highlightsArticleListID = self->_highlightsArticleListID;
  if (highlightsArticleListID)
    objc_msgSend(v3, "setObject:forKey:", highlightsArticleListID, CFSTR("highlights_article_list_ID"));
  sportsLogoImageURL = self->_sportsLogoImageURL;
  if (sportsLogoImageURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoImageURL, CFSTR("sports_logo_image_URL"));
  sportsLogoImageCompactURL = self->_sportsLogoImageCompactURL;
  if (sportsLogoImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoImageCompactURL, CFSTR("sports_logo_image_compact_URL"));
  sportsLogoImageLargeURL = self->_sportsLogoImageLargeURL;
  if (sportsLogoImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoImageLargeURL, CFSTR("sports_logo_image_large_URL"));
  sportsData = self->_sportsData;
  if (sportsData)
    objc_msgSend(v3, "setObject:forKey:", sportsData, CFSTR("sports_data"));
  sportsTheme = self->_sportsTheme;
  if (sportsTheme)
    objc_msgSend(v3, "setObject:forKey:", sportsTheme, CFSTR("sports_theme"));
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if (navigationChromeBackgroundImageURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageURL, CFSTR("navigation_chrome_background_image_URL"));
  darkStyleNavigationChromeBackgroundImageURL = self->_darkStyleNavigationChromeBackgroundImageURL;
  if (darkStyleNavigationChromeBackgroundImageURL)
    objc_msgSend(v3, "setObject:forKey:", darkStyleNavigationChromeBackgroundImageURL, CFSTR("dark_style_navigation_chrome_background_image_URL"));
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if (navigationChromeBackgroundImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageCompactURL, CFSTR("navigation_chrome_background_image_compact_URL"));
  darkStyleNavigationChromeBackgroundImageCompactURL = self->_darkStyleNavigationChromeBackgroundImageCompactURL;
  if (darkStyleNavigationChromeBackgroundImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", darkStyleNavigationChromeBackgroundImageCompactURL, CFSTR("dark_style_navigation_chrome_background_image_compact_URL"));
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if (navigationChromeBackgroundImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageLargeURL, CFSTR("navigation_chrome_background_image_large_URL"));
  darkStyleNavigationChromeBackgroundImageLargeURL = self->_darkStyleNavigationChromeBackgroundImageLargeURL;
  if (darkStyleNavigationChromeBackgroundImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", darkStyleNavigationChromeBackgroundImageLargeURL, CFSTR("dark_style_navigation_chrome_background_image_large_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscriptionRate), CFSTR("subscription_rate"));
  publisherSpecifiedArticlesJson = self->_publisherSpecifiedArticlesJson;
  if (publisherSpecifiedArticlesJson)
    objc_msgSend(v3, "setObject:forKey:", publisherSpecifiedArticlesJson, CFSTR("publisher_specified_articles_json"));
  adTargetingKeywords = self->_adTargetingKeywords;
  if (adTargetingKeywords)
    objc_msgSend(v3, "setObject:forKey:", adTargetingKeywords, CFSTR("ad_targeting_keywords"));
  feedNavImageHQURL = self->_feedNavImageHQURL;
  if (feedNavImageHQURL)
    objc_msgSend(v3, "setObject:forKey:", feedNavImageHQURL, CFSTR("feed_nav_image_HQ_URL"));
  sportsLogoAltImageURL = self->_sportsLogoAltImageURL;
  if (sportsLogoAltImageURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoAltImageURL, CFSTR("sports_logo_alt_image_URL"));
  sportsLogoAltImageCompactURL = self->_sportsLogoAltImageCompactURL;
  if (sportsLogoAltImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoAltImageCompactURL, CFSTR("sports_logo_alt_image_compact_URL"));
  sportsLogoAltImageLargeURL = self->_sportsLogoAltImageLargeURL;
  if (sportsLogoAltImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", sportsLogoAltImageLargeURL, CFSTR("sports_logo_alt_image_large_URL"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_propertyFlagsLocalized), CFSTR("property_flags_localized"));
  return v3;
}

- (void)writeTo:(id)a3
{
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has;
  NSMutableArray *iAdCategories;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *channelSectionIDs;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  NSMutableArray *channelSectionFeedConfigurations;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v30;
  NSMutableArray *publisherPaidFeldsparablePurchaseIDs;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *publisherPaidBundlePurchaseIDs;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  NSMutableArray *purchaseOfferableConfigurations;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v46;
  NSMutableArray *iAdKeywords;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t mm;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v52;
  NSMutableArray *publisherSpecifiedArticleIDs;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t nn;
  NSMutableArray *latestIssueIDs;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i1;
  NSMutableArray *recentIssueIDs;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i2;
  NSMutableArray *adTargetingKeywords;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i3;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_name)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_replacementID)
    PBDataWriterWriteStringField();
  if (self->_primaryAudience)
    PBDataWriterWriteStringField();
  if (self->_parentID)
    PBDataWriterWriteStringField();
  if (self->_logoURL)
    PBDataWriterWriteStringField();
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  iAdCategories = self->_iAdCategories;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v122 != v8)
          objc_enumerationMutation(iAdCategories);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
    }
    while (v7);
  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v118 != v13)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
    }
    while (v12);
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v114;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v114 != v18)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
    }
    while (v17);
  }
  if (self->_feedConfiguration)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_nameImageURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageForDarkBackgroundURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageMaskURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageMetadata)
    PBDataWriterWriteDataField();
  if (self->_coverImageURL)
    PBDataWriterWriteStringField();
  if (self->_templateJson)
    PBDataWriterWriteStringField();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  channelSectionIDs = self->_channelSectionIDs;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionIDs, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v110;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v110 != v23)
          objc_enumerationMutation(channelSectionIDs);
        PBDataWriterWriteStringField();
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionIDs, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
    }
    while (v22);
  }
  if (self->_channelDefaultSectionID)
    PBDataWriterWriteStringField();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v106;
    do
    {
      for (n = 0; n != v27; ++n)
      {
        if (*(_QWORD *)v106 != v28)
          objc_enumerationMutation(channelSectionFeedConfigurations);
        PBDataWriterWriteSubmessage();
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelSectionFeedConfigurations, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
    }
    while (v27);
  }
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x2000) == 0)
    {
LABEL_74:
      if ((*(_WORD *)&v30 & 0x8000) == 0)
        goto LABEL_76;
      goto LABEL_75;
    }
  }
  else if ((*(_WORD *)&v30 & 0x2000) == 0)
  {
    goto LABEL_74;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_75:
    PBDataWriterWriteBOOLField();
LABEL_76:
  if (self->_publisherPaidAuthorizationURL)
    PBDataWriterWriteStringField();
  if (self->_publisherPaidVerificationURL)
    PBDataWriterWriteStringField();
  if (self->_publisherPaidWebaccessURL)
    PBDataWriterWriteStringField();
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidFeldsparablePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v101, v132, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v102;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v102 != v34)
          objc_enumerationMutation(publisherPaidFeldsparablePurchaseIDs);
        PBDataWriterWriteStringField();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidFeldsparablePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v101, v132, 16);
    }
    while (v33);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidBundlePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v97, v131, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v98;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v98 != v39)
          objc_enumerationMutation(publisherPaidBundlePurchaseIDs);
        PBDataWriterWriteStringField();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherPaidBundlePurchaseIDs, "countByEnumeratingWithState:objects:count:", &v97, v131, 16);
    }
    while (v38);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v93, v130, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v94;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v94 != v44)
          objc_enumerationMutation(purchaseOfferableConfigurations);
        PBDataWriterWriteSubmessage();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](purchaseOfferableConfigurations, "countByEnumeratingWithState:objects:count:", &v93, v130, 16);
    }
    while (v43);
  }
  v46 = self->_has;
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x80000) == 0)
    {
LABEL_105:
      if ((*(_BYTE *)&v46 & 8) == 0)
        goto LABEL_106;
      goto LABEL_242;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x80000) == 0)
  {
    goto LABEL_105;
  }
  PBDataWriterWriteBOOLField();
  v46 = self->_has;
  if ((*(_BYTE *)&v46 & 8) == 0)
  {
LABEL_106:
    if ((*(_BYTE *)&v46 & 0x10) == 0)
      goto LABEL_108;
    goto LABEL_107;
  }
LABEL_242:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_107:
    PBDataWriterWriteDoubleField();
LABEL_108:
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  iAdKeywords = self->_iAdKeywords;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v89, v129, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v90;
    do
    {
      for (mm = 0; mm != v49; ++mm)
      {
        if (*(_QWORD *)v90 != v50)
          objc_enumerationMutation(iAdKeywords);
        PBDataWriterWriteStringField();
      }
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v89, v129, 16);
    }
    while (v49);
  }
  if (self->_nameImageMaskWidgetLQURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageMaskWidgetHQURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_publisherPaidDescriptionStrings)
    PBDataWriterWriteSubmessage();
  if (self->_nameCompact)
    PBDataWriterWriteStringField();
  if (self->_nameImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageCompactMetadata)
    PBDataWriterWriteDataField();
  v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x4000) == 0)
    {
LABEL_131:
      if ((*(_BYTE *)&v52 & 1) == 0)
        goto LABEL_133;
      goto LABEL_132;
    }
  }
  else if ((*(_WORD *)&v52 & 0x4000) == 0)
  {
    goto LABEL_131;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 1) != 0)
LABEL_132:
    PBDataWriterWriteInt64Field();
LABEL_133:
  if (self->_articleRecirculationConfiguration)
    PBDataWriterWriteDataField();
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v85, v128, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v86;
    do
    {
      for (nn = 0; nn != v55; ++nn)
      {
        if (*(_QWORD *)v86 != v56)
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        PBDataWriterWriteStringField();
      }
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v85, v128, 16);
    }
    while (v55);
  }
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_publisherSpecifiedArticleIDsModifiedDate)
    PBDataWriterWriteSubmessage();
  if (self->_feedNavImageURL)
    PBDataWriterWriteStringField();
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  latestIssueIDs = self->_latestIssueIDs;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestIssueIDs, "countByEnumeratingWithState:objects:count:", &v81, v127, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v82;
    do
    {
      for (i1 = 0; i1 != v60; ++i1)
      {
        if (*(_QWORD *)v82 != v61)
          objc_enumerationMutation(latestIssueIDs);
        PBDataWriterWriteStringField();
      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestIssueIDs, "countByEnumeratingWithState:objects:count:", &v81, v127, 16);
    }
    while (v60);
  }
  if (self->_archiveIssueListID)
    PBDataWriterWriteStringField();
  if (self->_language)
    PBDataWriterWriteStringField();
  if (self->_magazineGenre)
    PBDataWriterWriteStringField();
  if (self->_paidBundlePaywallConfigurationJson)
    PBDataWriterWriteStringField();
  if (self->_stocksFeedConfigurationJson)
    PBDataWriterWriteStringField();
  if (self->_supergroupConfigJson)
    PBDataWriterWriteStringField();
  if (self->_supergroupKnobsJson)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt64Field();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  recentIssueIDs = self->_recentIssueIDs;
  v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentIssueIDs, "countByEnumeratingWithState:objects:count:", &v77, v126, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v78;
    do
    {
      for (i2 = 0; i2 != v65; ++i2)
      {
        if (*(_QWORD *)v78 != v66)
          objc_enumerationMutation(recentIssueIDs);
        PBDataWriterWriteStringField();
      }
      v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentIssueIDs, "countByEnumeratingWithState:objects:count:", &v77, v126, 16);
    }
    while (v65);
  }
  if (self->_nameImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageLargeMaskURL)
    PBDataWriterWriteStringField();
  if (self->_superfeedConfigResourceID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sportsRecommendationMappingsJson)
    PBDataWriterWriteDataField();
  if (self->_highlightsArticleListID)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoImageURL)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_sportsData)
    PBDataWriterWriteStringField();
  if (self->_sportsTheme)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageURL)
    PBDataWriterWriteStringField();
  if (self->_darkStyleNavigationChromeBackgroundImageURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_darkStyleNavigationChromeBackgroundImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_darkStyleNavigationChromeBackgroundImageLargeURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_publisherSpecifiedArticlesJson)
    PBDataWriterWriteStringField();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  adTargetingKeywords = self->_adTargetingKeywords;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adTargetingKeywords, "countByEnumeratingWithState:objects:count:", &v73, v125, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v74;
    do
    {
      for (i3 = 0; i3 != v70; ++i3)
      {
        if (*(_QWORD *)v74 != v71)
          objc_enumerationMutation(adTargetingKeywords);
        PBDataWriterWriteStringField();
      }
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](adTargetingKeywords, "countByEnumeratingWithState:objects:count:", &v73, v125, 16);
    }
    while (v70);
  }
  if (self->_feedNavImageHQURL)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoAltImageURL)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoAltImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_sportsLogoAltImageLargeURL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt64Field();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has;
  int v8;
  NSString *name;
  int v10;
  NSString *replacementID;
  NSString *primaryAudience;
  NSString *parentID;
  NSString *logoURL;
  NSMutableArray *iAdCategories;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NTPBFeedConfiguration *feedConfiguration;
  int v19;
  NSString *nameImageURL;
  NSString *nameImageForDarkBackgroundURL;
  NSString *nameImageMaskURL;
  NSData *nameImageMetadata;
  NSString *coverImageURL;
  NSString *templateJson;
  NSMutableArray *channelSectionIDs;
  NSString *channelDefaultSectionID;
  NSMutableArray *channelSectionFeedConfigurations;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v29;
  int v30;
  NSString *publisherPaidAuthorizationURL;
  NSString *publisherPaidVerificationURL;
  NSString *publisherPaidWebaccessURL;
  NSMutableArray *publisherPaidFeldsparablePurchaseIDs;
  NSMutableArray *publisherPaidBundlePurchaseIDs;
  NSMutableArray *purchaseOfferableConfigurations;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v37;
  int v38;
  NSMutableArray *iAdKeywords;
  NSString *nameImageMaskWidgetLQURL;
  NSString *nameImageMaskWidgetHQURL;
  int v42;
  NTPBPublisherPaidDescriptionStrings *publisherPaidDescriptionStrings;
  NSString *nameCompact;
  NSString *nameImageCompactURL;
  NSData *nameImageCompactMetadata;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v47;
  int v48;
  NSData *articleRecirculationConfiguration;
  NSMutableArray *publisherSpecifiedArticleIDs;
  NSString *subtitle;
  NTPBDate *publisherSpecifiedArticleIDsModifiedDate;
  NSString *feedNavImageURL;
  NSMutableArray *latestIssueIDs;
  NSString *archiveIssueListID;
  NSString *language;
  NSString *magazineGenre;
  NSString *paidBundlePaywallConfigurationJson;
  NSString *stocksFeedConfigurationJson;
  NSString *supergroupConfigJson;
  NSString *supergroupKnobsJson;
  int v62;
  NSMutableArray *recentIssueIDs;
  NSString *nameImageLargeURL;
  NSString *nameImageLargeMaskURL;
  NSString *superfeedConfigResourceID;
  int v67;
  NSData *sportsRecommendationMappingsJson;
  NSString *highlightsArticleListID;
  NSString *sportsLogoImageURL;
  NSString *sportsLogoImageCompactURL;
  NSString *sportsLogoImageLargeURL;
  NSString *sportsData;
  NSString *sportsTheme;
  NSString *navigationChromeBackgroundImageURL;
  NSString *darkStyleNavigationChromeBackgroundImageURL;
  NSString *navigationChromeBackgroundImageCompactURL;
  NSString *darkStyleNavigationChromeBackgroundImageCompactURL;
  NSString *navigationChromeBackgroundImageLargeURL;
  NSString *darkStyleNavigationChromeBackgroundImageLargeURL;
  int v81;
  NSString *publisherSpecifiedArticlesJson;
  NSMutableArray *adTargetingKeywords;
  NSString *feedNavImageHQURL;
  NSString *sportsLogoAltImageURL;
  NSString *sportsLogoAltImageCompactURL;
  NSString *sportsLogoAltImageLargeURL;
  int v88;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  base = self->_base;
  if ((unint64_t)base | *((_QWORD *)a3 + 14))
  {
    v5 = -[NTPBRecordBase isEqual:](base, "isEqual:");
    if (!v5)
      return v5;
  }
  has = self->_has;
  v8 = *((_DWORD *)a3 + 162);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_type != *((_DWORD *)a3 + 158))
      goto LABEL_29;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_29;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)a3 + 34))
  {
    v5 = -[NSString isEqual:](name, "isEqual:");
    if (!v5)
      return v5;
    has = self->_has;
  }
  v10 = *((_DWORD *)a3 + 162);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_contentProvider != *((_QWORD *)a3 + 2))
      goto LABEL_29;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0)
      goto LABEL_29;
    if (self->_isPublic)
    {
      if (!*((_BYTE *)a3 + 641))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 641))
    {
      goto LABEL_29;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0)
      goto LABEL_29;
    if (self->_isDeprecated)
    {
      if (!*((_BYTE *)a3 + 637))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 637))
    {
      goto LABEL_29;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_29;
  }
  replacementID = self->_replacementID;
  if ((unint64_t)replacementID | *((_QWORD *)a3 + 63))
  {
    v5 = -[NSString isEqual:](replacementID, "isEqual:");
    if (!v5)
      return v5;
  }
  primaryAudience = self->_primaryAudience;
  if ((unint64_t)primaryAudience | *((_QWORD *)a3 + 51))
  {
    v5 = -[NSString isEqual:](primaryAudience, "isEqual:");
    if (!v5)
      return v5;
  }
  parentID = self->_parentID;
  if ((unint64_t)parentID | *((_QWORD *)a3 + 50))
  {
    v5 = -[NSString isEqual:](parentID, "isEqual:");
    if (!v5)
      return v5;
  }
  logoURL = self->_logoURL;
  if ((unint64_t)logoURL | *((_QWORD *)a3 + 32))
  {
    v5 = -[NSString isEqual:](logoURL, "isEqual:");
    if (!v5)
      return v5;
  }
  iAdCategories = self->_iAdCategories;
  if ((unint64_t)iAdCategories | *((_QWORD *)a3 + 28))
  {
    v5 = -[NSMutableArray isEqual:](iAdCategories, "isEqual:");
    if (!v5)
      return v5;
  }
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if ((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 15))
  {
    v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if ((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  feedConfiguration = self->_feedConfiguration;
  if ((unint64_t)feedConfiguration | *((_QWORD *)a3 + 23))
  {
    v5 = -[NTPBFeedConfiguration isEqual:](feedConfiguration, "isEqual:");
    if (!v5)
      return v5;
  }
  v19 = *((_DWORD *)a3 + 162);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_score != *((_QWORD *)a3 + 8))
      goto LABEL_29;
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_29;
  }
  nameImageURL = self->_nameImageURL;
  if ((unint64_t)nameImageURL | *((_QWORD *)a3 + 45))
  {
    v5 = -[NSString isEqual:](nameImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if ((unint64_t)nameImageForDarkBackgroundURL | *((_QWORD *)a3 + 38))
  {
    v5 = -[NSString isEqual:](nameImageForDarkBackgroundURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageMaskURL = self->_nameImageMaskURL;
  if ((unint64_t)nameImageMaskURL | *((_QWORD *)a3 + 41))
  {
    v5 = -[NSString isEqual:](nameImageMaskURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageMetadata = self->_nameImageMetadata;
  if ((unint64_t)nameImageMetadata | *((_QWORD *)a3 + 44))
  {
    v5 = -[NSData isEqual:](nameImageMetadata, "isEqual:");
    if (!v5)
      return v5;
  }
  coverImageURL = self->_coverImageURL;
  if ((unint64_t)coverImageURL | *((_QWORD *)a3 + 19))
  {
    v5 = -[NSString isEqual:](coverImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  templateJson = self->_templateJson;
  if ((unint64_t)templateJson | *((_QWORD *)a3 + 78))
  {
    v5 = -[NSString isEqual:](templateJson, "isEqual:");
    if (!v5)
      return v5;
  }
  channelSectionIDs = self->_channelSectionIDs;
  if ((unint64_t)channelSectionIDs | *((_QWORD *)a3 + 18))
  {
    v5 = -[NSMutableArray isEqual:](channelSectionIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  channelDefaultSectionID = self->_channelDefaultSectionID;
  if ((unint64_t)channelDefaultSectionID | *((_QWORD *)a3 + 16))
  {
    v5 = -[NSString isEqual:](channelDefaultSectionID, "isEqual:");
    if (!v5)
      return v5;
  }
  channelSectionFeedConfigurations = self->_channelSectionFeedConfigurations;
  if ((unint64_t)channelSectionFeedConfigurations | *((_QWORD *)a3 + 17))
  {
    v5 = -[NSMutableArray isEqual:](channelSectionFeedConfigurations, "isEqual:");
    if (!v5)
      return v5;
  }
  v29 = self->_has;
  v30 = *((_DWORD *)a3 + 162);
  if ((*(_BYTE *)&v29 & 4) != 0)
  {
    if ((v30 & 4) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 3))
      goto LABEL_29;
  }
  else if ((v30 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0)
      goto LABEL_29;
    if (self->_isExplicitContent)
    {
      if (!*((_BYTE *)a3 + 638))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 638))
    {
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v29 & 0x8000) != 0)
  {
    if ((v30 & 0x8000) == 0)
      goto LABEL_29;
    if (self->_isNotificationEnabled)
    {
      if (!*((_BYTE *)a3 + 640))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 640))
    {
      goto LABEL_29;
    }
  }
  else if ((v30 & 0x8000) != 0)
  {
    goto LABEL_29;
  }
  publisherPaidAuthorizationURL = self->_publisherPaidAuthorizationURL;
  if ((unint64_t)publisherPaidAuthorizationURL | *((_QWORD *)a3 + 52))
  {
    v5 = -[NSString isEqual:](publisherPaidAuthorizationURL, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherPaidVerificationURL = self->_publisherPaidVerificationURL;
  if ((unint64_t)publisherPaidVerificationURL | *((_QWORD *)a3 + 56))
  {
    v5 = -[NSString isEqual:](publisherPaidVerificationURL, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherPaidWebaccessURL = self->_publisherPaidWebaccessURL;
  if ((unint64_t)publisherPaidWebaccessURL | *((_QWORD *)a3 + 57))
  {
    v5 = -[NSString isEqual:](publisherPaidWebaccessURL, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherPaidFeldsparablePurchaseIDs = self->_publisherPaidFeldsparablePurchaseIDs;
  if ((unint64_t)publisherPaidFeldsparablePurchaseIDs | *((_QWORD *)a3 + 55))
  {
    v5 = -[NSMutableArray isEqual:](publisherPaidFeldsparablePurchaseIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherPaidBundlePurchaseIDs = self->_publisherPaidBundlePurchaseIDs;
  if ((unint64_t)publisherPaidBundlePurchaseIDs | *((_QWORD *)a3 + 53))
  {
    v5 = -[NSMutableArray isEqual:](publisherPaidBundlePurchaseIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  purchaseOfferableConfigurations = self->_purchaseOfferableConfigurations;
  if ((unint64_t)purchaseOfferableConfigurations | *((_QWORD *)a3 + 61))
  {
    v5 = -[NSMutableArray isEqual:](purchaseOfferableConfigurations, "isEqual:");
    if (!v5)
      return v5;
  }
  v37 = self->_has;
  v38 = *((_DWORD *)a3 + 162);
  if ((*(_DWORD *)&v37 & 0x40000) != 0)
  {
    if ((v38 & 0x40000) == 0)
      goto LABEL_29;
    if (self->_publisherPaidLeakyPaywallOptOut)
    {
      if (!*((_BYTE *)a3 + 643))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 643))
    {
      goto LABEL_29;
    }
  }
  else if ((v38 & 0x40000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_DWORD *)&v37 & 0x80000) != 0)
  {
    if ((v38 & 0x80000) == 0)
      goto LABEL_29;
    if (self->_publisherPaidWebOptIn)
    {
      if (!*((_BYTE *)a3 + 644))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 644))
    {
      goto LABEL_29;
    }
  }
  else if ((v38 & 0x80000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&v37 & 8) != 0)
  {
    if ((v38 & 8) == 0 || self->_nameImageBaselineShift != *((_QWORD *)a3 + 4))
      goto LABEL_29;
  }
  else if ((v38 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&v37 & 0x10) != 0)
  {
    if ((v38 & 0x10) == 0 || self->_nameImageScaleFactor != *((double *)a3 + 5))
      goto LABEL_29;
  }
  else if ((v38 & 0x10) != 0)
  {
    goto LABEL_29;
  }
  iAdKeywords = self->_iAdKeywords;
  if ((unint64_t)iAdKeywords | *((_QWORD *)a3 + 29))
  {
    v5 = -[NSMutableArray isEqual:](iAdKeywords, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageMaskWidgetLQURL = self->_nameImageMaskWidgetLQURL;
  if ((unint64_t)nameImageMaskWidgetLQURL | *((_QWORD *)a3 + 43))
  {
    v5 = -[NSString isEqual:](nameImageMaskWidgetLQURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageMaskWidgetHQURL = self->_nameImageMaskWidgetHQURL;
  if ((unint64_t)nameImageMaskWidgetHQURL | *((_QWORD *)a3 + 42))
  {
    v5 = -[NSString isEqual:](nameImageMaskWidgetHQURL, "isEqual:");
    if (!v5)
      return v5;
  }
  v42 = *((_DWORD *)a3 + 162);
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    if ((v42 & 0x800) == 0)
      goto LABEL_29;
    if (self->_hideAccessoryText)
    {
      if (!*((_BYTE *)a3 + 636))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 636))
    {
      goto LABEL_29;
    }
  }
  else if ((v42 & 0x800) != 0)
  {
    goto LABEL_29;
  }
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  if ((unint64_t)publisherPaidDescriptionStrings | *((_QWORD *)a3 + 54))
  {
    v5 = -[NTPBPublisherPaidDescriptionStrings isEqual:](publisherPaidDescriptionStrings, "isEqual:");
    if (!v5)
      return v5;
  }
  nameCompact = self->_nameCompact;
  if ((unint64_t)nameCompact | *((_QWORD *)a3 + 35))
  {
    v5 = -[NSString isEqual:](nameCompact, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageCompactURL = self->_nameImageCompactURL;
  if ((unint64_t)nameImageCompactURL | *((_QWORD *)a3 + 37))
  {
    v5 = -[NSString isEqual:](nameImageCompactURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageCompactMetadata = self->_nameImageCompactMetadata;
  if ((unint64_t)nameImageCompactMetadata | *((_QWORD *)a3 + 36))
  {
    v5 = -[NSData isEqual:](nameImageCompactMetadata, "isEqual:");
    if (!v5)
      return v5;
  }
  v47 = self->_has;
  v48 = *((_DWORD *)a3 + 162);
  if ((*(_WORD *)&v47 & 0x200) != 0)
  {
    if ((v48 & 0x200) == 0 || self->_groupingAvailability != *((_DWORD *)a3 + 52))
      goto LABEL_29;
  }
  else if ((v48 & 0x200) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    if ((v48 & 0x4000) == 0)
      goto LABEL_29;
    if (self->_isHidden)
    {
      if (!*((_BYTE *)a3 + 639))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 639))
    {
      goto LABEL_29;
    }
  }
  else if ((v48 & 0x4000) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&v47 & 1) != 0)
  {
    if ((v48 & 1) == 0 || self->_behaviorFlags != *((_QWORD *)a3 + 1))
      goto LABEL_29;
  }
  else if ((v48 & 1) != 0)
  {
    goto LABEL_29;
  }
  articleRecirculationConfiguration = self->_articleRecirculationConfiguration;
  if ((unint64_t)articleRecirculationConfiguration | *((_QWORD *)a3 + 13))
  {
    v5 = -[NSData isEqual:](articleRecirculationConfiguration, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if ((unint64_t)publisherSpecifiedArticleIDs | *((_QWORD *)a3 + 58))
  {
    v5 = -[NSMutableArray isEqual:](publisherSpecifiedArticleIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)a3 + 74))
  {
    v5 = -[NSString isEqual:](subtitle, "isEqual:");
    if (!v5)
      return v5;
  }
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  if ((unint64_t)publisherSpecifiedArticleIDsModifiedDate | *((_QWORD *)a3 + 59))
  {
    v5 = -[NTPBDate isEqual:](publisherSpecifiedArticleIDsModifiedDate, "isEqual:");
    if (!v5)
      return v5;
  }
  feedNavImageURL = self->_feedNavImageURL;
  if ((unint64_t)feedNavImageURL | *((_QWORD *)a3 + 25))
  {
    v5 = -[NSString isEqual:](feedNavImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  latestIssueIDs = self->_latestIssueIDs;
  if ((unint64_t)latestIssueIDs | *((_QWORD *)a3 + 31))
  {
    v5 = -[NSMutableArray isEqual:](latestIssueIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  archiveIssueListID = self->_archiveIssueListID;
  if ((unint64_t)archiveIssueListID | *((_QWORD *)a3 + 12))
  {
    v5 = -[NSString isEqual:](archiveIssueListID, "isEqual:");
    if (!v5)
      return v5;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)a3 + 30))
  {
    v5 = -[NSString isEqual:](language, "isEqual:");
    if (!v5)
      return v5;
  }
  magazineGenre = self->_magazineGenre;
  if ((unint64_t)magazineGenre | *((_QWORD *)a3 + 33))
  {
    v5 = -[NSString isEqual:](magazineGenre, "isEqual:");
    if (!v5)
      return v5;
  }
  paidBundlePaywallConfigurationJson = self->_paidBundlePaywallConfigurationJson;
  if ((unint64_t)paidBundlePaywallConfigurationJson | *((_QWORD *)a3 + 49))
  {
    v5 = -[NSString isEqual:](paidBundlePaywallConfigurationJson, "isEqual:");
    if (!v5)
      return v5;
  }
  stocksFeedConfigurationJson = self->_stocksFeedConfigurationJson;
  if ((unint64_t)stocksFeedConfigurationJson | *((_QWORD *)a3 + 73))
  {
    v5 = -[NSString isEqual:](stocksFeedConfigurationJson, "isEqual:");
    if (!v5)
      return v5;
  }
  supergroupConfigJson = self->_supergroupConfigJson;
  if ((unint64_t)supergroupConfigJson | *((_QWORD *)a3 + 76))
  {
    v5 = -[NSString isEqual:](supergroupConfigJson, "isEqual:");
    if (!v5)
      return v5;
  }
  supergroupKnobsJson = self->_supergroupKnobsJson;
  if ((unint64_t)supergroupKnobsJson | *((_QWORD *)a3 + 77))
  {
    v5 = -[NSString isEqual:](supergroupKnobsJson, "isEqual:");
    if (!v5)
      return v5;
  }
  v62 = *((_DWORD *)a3 + 162);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v62 & 0x20) == 0 || self->_propertyFlags != *((_QWORD *)a3 + 6))
      goto LABEL_29;
  }
  else if ((v62 & 0x20) != 0)
  {
    goto LABEL_29;
  }
  recentIssueIDs = self->_recentIssueIDs;
  if ((unint64_t)recentIssueIDs | *((_QWORD *)a3 + 62))
  {
    v5 = -[NSMutableArray isEqual:](recentIssueIDs, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageLargeURL = self->_nameImageLargeURL;
  if ((unint64_t)nameImageLargeURL | *((_QWORD *)a3 + 40))
  {
    v5 = -[NSString isEqual:](nameImageLargeURL, "isEqual:");
    if (!v5)
      return v5;
  }
  nameImageLargeMaskURL = self->_nameImageLargeMaskURL;
  if ((unint64_t)nameImageLargeMaskURL | *((_QWORD *)a3 + 39))
  {
    v5 = -[NSString isEqual:](nameImageLargeMaskURL, "isEqual:");
    if (!v5)
      return v5;
  }
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if ((unint64_t)superfeedConfigResourceID | *((_QWORD *)a3 + 75))
  {
    v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:");
    if (!v5)
      return v5;
  }
  v67 = *((_DWORD *)a3 + 162);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    if ((v67 & 0x20000) == 0)
      goto LABEL_29;
    if (self->_isSportsRecommendable)
    {
      if (!*((_BYTE *)a3 + 642))
        goto LABEL_29;
    }
    else if (*((_BYTE *)a3 + 642))
    {
      goto LABEL_29;
    }
  }
  else if ((v67 & 0x20000) != 0)
  {
    goto LABEL_29;
  }
  sportsRecommendationMappingsJson = self->_sportsRecommendationMappingsJson;
  if ((unint64_t)sportsRecommendationMappingsJson | *((_QWORD *)a3 + 71))
  {
    v5 = -[NSData isEqual:](sportsRecommendationMappingsJson, "isEqual:");
    if (!v5)
      return v5;
  }
  highlightsArticleListID = self->_highlightsArticleListID;
  if ((unint64_t)highlightsArticleListID | *((_QWORD *)a3 + 27))
  {
    v5 = -[NSString isEqual:](highlightsArticleListID, "isEqual:");
    if (!v5)
      return v5;
  }
  sportsLogoImageURL = self->_sportsLogoImageURL;
  if ((unint64_t)sportsLogoImageURL | *((_QWORD *)a3 + 70))
  {
    v5 = -[NSString isEqual:](sportsLogoImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  sportsLogoImageCompactURL = self->_sportsLogoImageCompactURL;
  if ((unint64_t)sportsLogoImageCompactURL | *((_QWORD *)a3 + 68))
  {
    v5 = -[NSString isEqual:](sportsLogoImageCompactURL, "isEqual:");
    if (!v5)
      return v5;
  }
  sportsLogoImageLargeURL = self->_sportsLogoImageLargeURL;
  if ((unint64_t)sportsLogoImageLargeURL | *((_QWORD *)a3 + 69))
  {
    v5 = -[NSString isEqual:](sportsLogoImageLargeURL, "isEqual:");
    if (!v5)
      return v5;
  }
  sportsData = self->_sportsData;
  if ((unint64_t)sportsData | *((_QWORD *)a3 + 64))
  {
    v5 = -[NSString isEqual:](sportsData, "isEqual:");
    if (!v5)
      return v5;
  }
  sportsTheme = self->_sportsTheme;
  if ((unint64_t)sportsTheme | *((_QWORD *)a3 + 72))
  {
    v5 = -[NSString isEqual:](sportsTheme, "isEqual:");
    if (!v5)
      return v5;
  }
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if ((unint64_t)navigationChromeBackgroundImageURL | *((_QWORD *)a3 + 48))
  {
    v5 = -[NSString isEqual:](navigationChromeBackgroundImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  darkStyleNavigationChromeBackgroundImageURL = self->_darkStyleNavigationChromeBackgroundImageURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageURL | *((_QWORD *)a3 + 22))
  {
    v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageURL, "isEqual:");
    if (!v5)
      return v5;
  }
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if ((unint64_t)navigationChromeBackgroundImageCompactURL | *((_QWORD *)a3 + 46))
  {
    v5 = -[NSString isEqual:](navigationChromeBackgroundImageCompactURL, "isEqual:");
    if (!v5)
      return v5;
  }
  darkStyleNavigationChromeBackgroundImageCompactURL = self->_darkStyleNavigationChromeBackgroundImageCompactURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageCompactURL | *((_QWORD *)a3 + 20))
  {
    v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageCompactURL, "isEqual:");
    if (!v5)
      return v5;
  }
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if ((unint64_t)navigationChromeBackgroundImageLargeURL | *((_QWORD *)a3 + 47))
  {
    v5 = -[NSString isEqual:](navigationChromeBackgroundImageLargeURL, "isEqual:");
    if (!v5)
      return v5;
  }
  darkStyleNavigationChromeBackgroundImageLargeURL = self->_darkStyleNavigationChromeBackgroundImageLargeURL;
  if ((unint64_t)darkStyleNavigationChromeBackgroundImageLargeURL | *((_QWORD *)a3 + 21))
  {
    v5 = -[NSString isEqual:](darkStyleNavigationChromeBackgroundImageLargeURL, "isEqual:");
    if (!v5)
      return v5;
  }
  v81 = *((_DWORD *)a3 + 162);
  if ((*((_BYTE *)&self->_has + 1) & 1) == 0)
  {
    if ((v81 & 0x100) == 0)
      goto LABEL_251;
LABEL_29:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v81 & 0x100) == 0 || self->_subscriptionRate != *((double *)a3 + 9))
    goto LABEL_29;
LABEL_251:
  publisherSpecifiedArticlesJson = self->_publisherSpecifiedArticlesJson;
  if (!((unint64_t)publisherSpecifiedArticlesJson | *((_QWORD *)a3 + 60))
    || (v5 = -[NSString isEqual:](publisherSpecifiedArticlesJson, "isEqual:")) != 0)
  {
    adTargetingKeywords = self->_adTargetingKeywords;
    if (!((unint64_t)adTargetingKeywords | *((_QWORD *)a3 + 10))
      || (v5 = -[NSMutableArray isEqual:](adTargetingKeywords, "isEqual:")) != 0)
    {
      feedNavImageHQURL = self->_feedNavImageHQURL;
      if (!((unint64_t)feedNavImageHQURL | *((_QWORD *)a3 + 24))
        || (v5 = -[NSString isEqual:](feedNavImageHQURL, "isEqual:")) != 0)
      {
        sportsLogoAltImageURL = self->_sportsLogoAltImageURL;
        if (!((unint64_t)sportsLogoAltImageURL | *((_QWORD *)a3 + 67))
          || (v5 = -[NSString isEqual:](sportsLogoAltImageURL, "isEqual:")) != 0)
        {
          sportsLogoAltImageCompactURL = self->_sportsLogoAltImageCompactURL;
          if (!((unint64_t)sportsLogoAltImageCompactURL | *((_QWORD *)a3 + 65))
            || (v5 = -[NSString isEqual:](sportsLogoAltImageCompactURL, "isEqual:")) != 0)
          {
            sportsLogoAltImageLargeURL = self->_sportsLogoAltImageLargeURL;
            if (!((unint64_t)sportsLogoAltImageLargeURL | *((_QWORD *)a3 + 66))
              || (v5 = -[NSString isEqual:](sportsLogoAltImageLargeURL, "isEqual:")) != 0)
            {
              v88 = *((_DWORD *)a3 + 162);
              LOBYTE(v5) = (v88 & 0x40) == 0;
              if ((*(_BYTE *)&self->_has & 0x40) != 0)
              {
                if ((v88 & 0x40) == 0 || self->_propertyFlagsLocalized != *((_QWORD *)a3 + 7))
                  goto LABEL_29;
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $33EA3DE8810A8DA2B3B0E292DEF75CDE has;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v4;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v5;
  double nameImageScaleFactor;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  $33EA3DE8810A8DA2B3B0E292DEF75CDE v11;
  NSUInteger v12;
  unint64_t v13;
  double subscriptionRate;
  double v15;
  long double v16;
  double v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  uint64_t v42;
  uint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  uint64_t v51;
  NSUInteger v52;
  unint64_t v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger v61;
  NSUInteger v62;
  unint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  NSUInteger v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSUInteger v75;
  NSUInteger v76;
  NSUInteger v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSUInteger v82;
  uint64_t v83;
  NSUInteger v84;
  NSUInteger v85;
  uint64_t v86;
  NSUInteger v87;
  NSUInteger v88;
  NSUInteger v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSUInteger v95;
  NSUInteger v96;
  NSUInteger v97;
  NSUInteger v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSUInteger v102;
  uint64_t v103;
  unint64_t v104;

  v104 = -[NTPBRecordBase hash](self->_base, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    v103 = 2654435761 * self->_type;
  else
    v103 = 0;
  v102 = -[NSString hash](self->_name, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
    v101 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_6;
LABEL_9:
    v100 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v101 = 2654435761 * self->_contentProvider;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_9;
LABEL_6:
  v100 = 2654435761 * self->_isPublic;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_7:
    v99 = 2654435761 * self->_isDeprecated;
    goto LABEL_11;
  }
LABEL_10:
  v99 = 0;
LABEL_11:
  v98 = -[NSString hash](self->_replacementID, "hash");
  v97 = -[NSString hash](self->_primaryAudience, "hash");
  v96 = -[NSString hash](self->_parentID, "hash");
  v95 = -[NSString hash](self->_logoURL, "hash");
  v94 = -[NSMutableArray hash](self->_iAdCategories, "hash");
  v93 = -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  v92 = -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
  v91 = -[NTPBFeedConfiguration hash](self->_feedConfiguration, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v90 = 2654435761 * self->_score;
  else
    v90 = 0;
  v89 = -[NSString hash](self->_nameImageURL, "hash");
  v88 = -[NSString hash](self->_nameImageForDarkBackgroundURL, "hash");
  v87 = -[NSString hash](self->_nameImageMaskURL, "hash");
  v86 = -[NSData hash](self->_nameImageMetadata, "hash");
  v85 = -[NSString hash](self->_coverImageURL, "hash");
  v84 = -[NSString hash](self->_templateJson, "hash");
  v83 = -[NSMutableArray hash](self->_channelSectionIDs, "hash");
  v82 = -[NSString hash](self->_channelDefaultSectionID, "hash");
  v81 = -[NSMutableArray hash](self->_channelSectionFeedConfigurations, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 4) == 0)
  {
    v80 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_16;
LABEL_19:
    v79 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  v80 = 2654435761 * self->_minimumNewsVersion;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
    goto LABEL_19;
LABEL_16:
  v79 = 2654435761 * self->_isExplicitContent;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_17:
    v78 = 2654435761 * self->_isNotificationEnabled;
    goto LABEL_21;
  }
LABEL_20:
  v78 = 0;
LABEL_21:
  v77 = -[NSString hash](self->_publisherPaidAuthorizationURL, "hash");
  v76 = -[NSString hash](self->_publisherPaidVerificationURL, "hash");
  v75 = -[NSString hash](self->_publisherPaidWebaccessURL, "hash");
  v74 = -[NSMutableArray hash](self->_publisherPaidFeldsparablePurchaseIDs, "hash");
  v73 = -[NSMutableArray hash](self->_publisherPaidBundlePurchaseIDs, "hash");
  v72 = -[NSMutableArray hash](self->_purchaseOfferableConfigurations, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    v71 = 2654435761 * self->_publisherPaidLeakyPaywallOptOut;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
    {
LABEL_23:
      v70 = 2654435761 * self->_publisherPaidWebOptIn;
      if ((*(_BYTE *)&v5 & 8) != 0)
        goto LABEL_24;
LABEL_31:
      v69 = 0;
      if ((*(_BYTE *)&v5 & 0x10) != 0)
        goto LABEL_25;
LABEL_32:
      v10 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    v71 = 0;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
      goto LABEL_23;
  }
  v70 = 0;
  if ((*(_BYTE *)&v5 & 8) == 0)
    goto LABEL_31;
LABEL_24:
  v69 = 2654435761u * self->_nameImageBaselineShift;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
    goto LABEL_32;
LABEL_25:
  nameImageScaleFactor = self->_nameImageScaleFactor;
  v7 = -nameImageScaleFactor;
  if (nameImageScaleFactor >= 0.0)
    v7 = self->_nameImageScaleFactor;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_35:
  v68 = v10;
  v67 = -[NSMutableArray hash](self->_iAdKeywords, "hash");
  v66 = -[NSString hash](self->_nameImageMaskWidgetLQURL, "hash");
  v65 = -[NSString hash](self->_nameImageMaskWidgetHQURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    v64 = 2654435761 * self->_hideAccessoryText;
  else
    v64 = 0;
  v63 = -[NTPBPublisherPaidDescriptionStrings hash](self->_publisherPaidDescriptionStrings, "hash");
  v62 = -[NSString hash](self->_nameCompact, "hash");
  v61 = -[NSString hash](self->_nameImageCompactURL, "hash");
  v60 = -[NSData hash](self->_nameImageCompactMetadata, "hash");
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
    v59 = 0;
    if ((*(_WORD *)&v11 & 0x4000) != 0)
      goto LABEL_40;
LABEL_43:
    v58 = 0;
    if ((*(_BYTE *)&v11 & 1) != 0)
      goto LABEL_41;
    goto LABEL_44;
  }
  v59 = 2654435761 * self->_groupingAvailability;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
    goto LABEL_43;
LABEL_40:
  v58 = 2654435761 * self->_isHidden;
  if ((*(_BYTE *)&v11 & 1) != 0)
  {
LABEL_41:
    v57 = 2654435761 * self->_behaviorFlags;
    goto LABEL_45;
  }
LABEL_44:
  v57 = 0;
LABEL_45:
  v56 = -[NSData hash](self->_articleRecirculationConfiguration, "hash");
  v55 = -[NSMutableArray hash](self->_publisherSpecifiedArticleIDs, "hash");
  v54 = -[NSString hash](self->_subtitle, "hash");
  v53 = -[NTPBDate hash](self->_publisherSpecifiedArticleIDsModifiedDate, "hash");
  v52 = -[NSString hash](self->_feedNavImageURL, "hash");
  v51 = -[NSMutableArray hash](self->_latestIssueIDs, "hash");
  v50 = -[NSString hash](self->_archiveIssueListID, "hash");
  v49 = -[NSString hash](self->_language, "hash");
  v48 = -[NSString hash](self->_magazineGenre, "hash");
  v47 = -[NSString hash](self->_paidBundlePaywallConfigurationJson, "hash");
  v46 = -[NSString hash](self->_stocksFeedConfigurationJson, "hash");
  v45 = -[NSString hash](self->_supergroupConfigJson, "hash");
  v44 = -[NSString hash](self->_supergroupKnobsJson, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v43 = 2654435761 * self->_propertyFlags;
  else
    v43 = 0;
  v42 = -[NSMutableArray hash](self->_recentIssueIDs, "hash");
  v41 = -[NSString hash](self->_nameImageLargeURL, "hash");
  v40 = -[NSString hash](self->_nameImageLargeMaskURL, "hash");
  v39 = -[NSString hash](self->_superfeedConfigResourceID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v38 = 2654435761 * self->_isSportsRecommendable;
  else
    v38 = 0;
  v37 = -[NSData hash](self->_sportsRecommendationMappingsJson, "hash");
  v36 = -[NSString hash](self->_highlightsArticleListID, "hash");
  v35 = -[NSString hash](self->_sportsLogoImageURL, "hash");
  v34 = -[NSString hash](self->_sportsLogoImageCompactURL, "hash");
  v33 = -[NSString hash](self->_sportsLogoImageLargeURL, "hash");
  v32 = -[NSString hash](self->_sportsData, "hash");
  v31 = -[NSString hash](self->_sportsTheme, "hash");
  v30 = -[NSString hash](self->_navigationChromeBackgroundImageURL, "hash");
  v29 = -[NSString hash](self->_darkStyleNavigationChromeBackgroundImageURL, "hash");
  v28 = -[NSString hash](self->_navigationChromeBackgroundImageCompactURL, "hash");
  v27 = -[NSString hash](self->_darkStyleNavigationChromeBackgroundImageCompactURL, "hash");
  v26 = -[NSString hash](self->_navigationChromeBackgroundImageLargeURL, "hash");
  v12 = -[NSString hash](self->_darkStyleNavigationChromeBackgroundImageLargeURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    subscriptionRate = self->_subscriptionRate;
    v15 = -subscriptionRate;
    if (subscriptionRate >= 0.0)
      v15 = self->_subscriptionRate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  v18 = -[NSString hash](self->_publisherSpecifiedArticlesJson, "hash");
  v19 = -[NSMutableArray hash](self->_adTargetingKeywords, "hash");
  v20 = -[NSString hash](self->_feedNavImageHQURL, "hash");
  v21 = -[NSString hash](self->_sportsLogoAltImageURL, "hash");
  v22 = -[NSString hash](self->_sportsLogoAltImageCompactURL, "hash");
  v23 = -[NSString hash](self->_sportsLogoAltImageLargeURL, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v24 = 2654435761 * self->_propertyFlagsLocalized;
  else
    v24 = 0;
  return v103 ^ v104 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v12 ^ v13 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  NTPBFeedConfiguration *feedConfiguration;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ii;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t jj;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t kk;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t mm;
  NTPBPublisherPaidDescriptionStrings *publisherPaidDescriptionStrings;
  uint64_t v58;
  int v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t nn;
  NTPBDate *publisherSpecifiedArticleIDsModifiedDate;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i1;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i2;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i3;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 14);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBTagRecord setBase:](self, "setBase:");
  }
  if ((*((_BYTE *)a3 + 649) & 4) != 0)
  {
    self->_type = *((_DWORD *)a3 + 158);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)a3 + 34))
    -[NTPBTagRecord setName:](self, "setName:");
  v7 = *((_DWORD *)a3 + 162);
  if ((v7 & 2) != 0)
  {
    self->_contentProvider = *((_QWORD *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v7 = *((_DWORD *)a3 + 162);
    if ((v7 & 0x10000) == 0)
    {
LABEL_12:
      if ((v7 & 0x1000) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v7 & 0x10000) == 0)
  {
    goto LABEL_12;
  }
  self->_isPublic = *((_BYTE *)a3 + 641);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)a3 + 162) & 0x1000) != 0)
  {
LABEL_13:
    self->_isDeprecated = *((_BYTE *)a3 + 637);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_14:
  if (*((_QWORD *)a3 + 63))
    -[NTPBTagRecord setReplacementID:](self, "setReplacementID:");
  if (*((_QWORD *)a3 + 51))
    -[NTPBTagRecord setPrimaryAudience:](self, "setPrimaryAudience:");
  if (*((_QWORD *)a3 + 50))
    -[NTPBTagRecord setParentID:](self, "setParentID:");
  if (*((_QWORD *)a3 + 32))
    -[NTPBTagRecord setLogoURL:](self, "setLogoURL:");
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v8 = (void *)*((_QWORD *)a3 + 28);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v131 != v11)
          objc_enumerationMutation(v8);
        -[NTPBTagRecord addIAdCategories:](self, "addIAdCategories:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v130, v146, 16);
    }
    while (v10);
  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v13 = (void *)*((_QWORD *)a3 + 15);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v127 != v16)
          objc_enumerationMutation(v13);
        -[NTPBTagRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v126, v145, 16);
    }
    while (v15);
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v18 = (void *)*((_QWORD *)a3 + 11);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v122, v144, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v123;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v123 != v21)
          objc_enumerationMutation(v18);
        -[NTPBTagRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * k));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v122, v144, 16);
    }
    while (v20);
  }
  feedConfiguration = self->_feedConfiguration;
  v24 = *((_QWORD *)a3 + 23);
  if (feedConfiguration)
  {
    if (v24)
      -[NTPBFeedConfiguration mergeFrom:](feedConfiguration, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBTagRecord setFeedConfiguration:](self, "setFeedConfiguration:");
  }
  if ((*((_BYTE *)a3 + 648) & 0x80) != 0)
  {
    self->_score = *((_QWORD *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)a3 + 45))
    -[NTPBTagRecord setNameImageURL:](self, "setNameImageURL:");
  if (*((_QWORD *)a3 + 38))
    -[NTPBTagRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:");
  if (*((_QWORD *)a3 + 41))
    -[NTPBTagRecord setNameImageMaskURL:](self, "setNameImageMaskURL:");
  if (*((_QWORD *)a3 + 44))
    -[NTPBTagRecord setNameImageMetadata:](self, "setNameImageMetadata:");
  if (*((_QWORD *)a3 + 19))
    -[NTPBTagRecord setCoverImageURL:](self, "setCoverImageURL:");
  if (*((_QWORD *)a3 + 78))
    -[NTPBTagRecord setTemplateJson:](self, "setTemplateJson:");
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v25 = (void *)*((_QWORD *)a3 + 18);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v118, v143, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v119;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v119 != v28)
          objc_enumerationMutation(v25);
        -[NTPBTagRecord addChannelSectionIDs:](self, "addChannelSectionIDs:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * m));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v118, v143, 16);
    }
    while (v27);
  }
  if (*((_QWORD *)a3 + 16))
    -[NTPBTagRecord setChannelDefaultSectionID:](self, "setChannelDefaultSectionID:");
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v30 = (void *)*((_QWORD *)a3 + 17);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v114, v142, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v115;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v115 != v33)
          objc_enumerationMutation(v30);
        -[NTPBTagRecord addChannelSectionFeedConfigurations:](self, "addChannelSectionFeedConfigurations:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * n));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v114, v142, 16);
    }
    while (v32);
  }
  v35 = *((_DWORD *)a3 + 162);
  if ((v35 & 4) != 0)
  {
    self->_minimumNewsVersion = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    v35 = *((_DWORD *)a3 + 162);
    if ((v35 & 0x2000) == 0)
    {
LABEL_83:
      if ((v35 & 0x8000) == 0)
        goto LABEL_85;
      goto LABEL_84;
    }
  }
  else if ((v35 & 0x2000) == 0)
  {
    goto LABEL_83;
  }
  self->_isExplicitContent = *((_BYTE *)a3 + 638);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)a3 + 162) & 0x8000) != 0)
  {
LABEL_84:
    self->_isNotificationEnabled = *((_BYTE *)a3 + 640);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_85:
  if (*((_QWORD *)a3 + 52))
    -[NTPBTagRecord setPublisherPaidAuthorizationURL:](self, "setPublisherPaidAuthorizationURL:");
  if (*((_QWORD *)a3 + 56))
    -[NTPBTagRecord setPublisherPaidVerificationURL:](self, "setPublisherPaidVerificationURL:");
  if (*((_QWORD *)a3 + 57))
    -[NTPBTagRecord setPublisherPaidWebaccessURL:](self, "setPublisherPaidWebaccessURL:");
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v36 = (void *)*((_QWORD *)a3 + 55);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v110, v141, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v111;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v111 != v39)
          objc_enumerationMutation(v36);
        -[NTPBTagRecord addPublisherPaidFeldsparablePurchaseIDs:](self, "addPublisherPaidFeldsparablePurchaseIDs:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * ii));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v110, v141, 16);
    }
    while (v38);
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v41 = (void *)*((_QWORD *)a3 + 53);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v140, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v107;
    do
    {
      for (jj = 0; jj != v43; ++jj)
      {
        if (*(_QWORD *)v107 != v44)
          objc_enumerationMutation(v41);
        -[NTPBTagRecord addPublisherPaidBundlePurchaseIDs:](self, "addPublisherPaidBundlePurchaseIDs:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * jj));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v106, v140, 16);
    }
    while (v43);
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v46 = (void *)*((_QWORD *)a3 + 61);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v139, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v103;
    do
    {
      for (kk = 0; kk != v48; ++kk)
      {
        if (*(_QWORD *)v103 != v49)
          objc_enumerationMutation(v46);
        -[NTPBTagRecord addPurchaseOfferableConfiguration:](self, "addPurchaseOfferableConfiguration:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * kk));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v139, 16);
    }
    while (v48);
  }
  v51 = *((_DWORD *)a3 + 162);
  if ((v51 & 0x40000) != 0)
  {
    self->_publisherPaidLeakyPaywallOptOut = *((_BYTE *)a3 + 643);
    *(_DWORD *)&self->_has |= 0x40000u;
    v51 = *((_DWORD *)a3 + 162);
    if ((v51 & 0x80000) == 0)
    {
LABEL_114:
      if ((v51 & 8) == 0)
        goto LABEL_115;
      goto LABEL_138;
    }
  }
  else if ((v51 & 0x80000) == 0)
  {
    goto LABEL_114;
  }
  self->_publisherPaidWebOptIn = *((_BYTE *)a3 + 644);
  *(_DWORD *)&self->_has |= 0x80000u;
  v51 = *((_DWORD *)a3 + 162);
  if ((v51 & 8) == 0)
  {
LABEL_115:
    if ((v51 & 0x10) == 0)
      goto LABEL_117;
    goto LABEL_116;
  }
LABEL_138:
  self->_nameImageBaselineShift = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 162) & 0x10) != 0)
  {
LABEL_116:
    self->_nameImageScaleFactor = *((double *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_117:
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v52 = (void *)*((_QWORD *)a3 + 29);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v98, v138, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v99;
    do
    {
      for (mm = 0; mm != v54; ++mm)
      {
        if (*(_QWORD *)v99 != v55)
          objc_enumerationMutation(v52);
        -[NTPBTagRecord addIAdKeywords:](self, "addIAdKeywords:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * mm));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v98, v138, 16);
    }
    while (v54);
  }
  if (*((_QWORD *)a3 + 43))
    -[NTPBTagRecord setNameImageMaskWidgetLQURL:](self, "setNameImageMaskWidgetLQURL:");
  if (*((_QWORD *)a3 + 42))
    -[NTPBTagRecord setNameImageMaskWidgetHQURL:](self, "setNameImageMaskWidgetHQURL:");
  if ((*((_BYTE *)a3 + 649) & 8) != 0)
  {
    self->_hideAccessoryText = *((_BYTE *)a3 + 636);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  publisherPaidDescriptionStrings = self->_publisherPaidDescriptionStrings;
  v58 = *((_QWORD *)a3 + 54);
  if (publisherPaidDescriptionStrings)
  {
    if (v58)
      -[NTPBPublisherPaidDescriptionStrings mergeFrom:](publisherPaidDescriptionStrings, "mergeFrom:");
  }
  else if (v58)
  {
    -[NTPBTagRecord setPublisherPaidDescriptionStrings:](self, "setPublisherPaidDescriptionStrings:");
  }
  if (*((_QWORD *)a3 + 35))
    -[NTPBTagRecord setNameCompact:](self, "setNameCompact:");
  if (*((_QWORD *)a3 + 37))
    -[NTPBTagRecord setNameImageCompactURL:](self, "setNameImageCompactURL:");
  if (*((_QWORD *)a3 + 36))
    -[NTPBTagRecord setNameImageCompactMetadata:](self, "setNameImageCompactMetadata:");
  v59 = *((_DWORD *)a3 + 162);
  if ((v59 & 0x200) != 0)
  {
    self->_groupingAvailability = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x200u;
    v59 = *((_DWORD *)a3 + 162);
    if ((v59 & 0x4000) == 0)
    {
LABEL_150:
      if ((v59 & 1) == 0)
        goto LABEL_152;
      goto LABEL_151;
    }
  }
  else if ((v59 & 0x4000) == 0)
  {
    goto LABEL_150;
  }
  self->_isHidden = *((_BYTE *)a3 + 639);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)a3 + 162) & 1) != 0)
  {
LABEL_151:
    self->_behaviorFlags = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_152:
  if (*((_QWORD *)a3 + 13))
    -[NTPBTagRecord setArticleRecirculationConfiguration:](self, "setArticleRecirculationConfiguration:");
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v60 = (void *)*((_QWORD *)a3 + 58);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v94, v137, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v95;
    do
    {
      for (nn = 0; nn != v62; ++nn)
      {
        if (*(_QWORD *)v95 != v63)
          objc_enumerationMutation(v60);
        -[NTPBTagRecord addPublisherSpecifiedArticleIDs:](self, "addPublisherSpecifiedArticleIDs:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * nn));
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v94, v137, 16);
    }
    while (v62);
  }
  if (*((_QWORD *)a3 + 74))
    -[NTPBTagRecord setSubtitle:](self, "setSubtitle:");
  publisherSpecifiedArticleIDsModifiedDate = self->_publisherSpecifiedArticleIDsModifiedDate;
  v66 = *((_QWORD *)a3 + 59);
  if (publisherSpecifiedArticleIDsModifiedDate)
  {
    if (v66)
      -[NTPBDate mergeFrom:](publisherSpecifiedArticleIDsModifiedDate, "mergeFrom:");
  }
  else if (v66)
  {
    -[NTPBTagRecord setPublisherSpecifiedArticleIDsModifiedDate:](self, "setPublisherSpecifiedArticleIDsModifiedDate:");
  }
  if (*((_QWORD *)a3 + 25))
    -[NTPBTagRecord setFeedNavImageURL:](self, "setFeedNavImageURL:");
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v67 = (void *)*((_QWORD *)a3 + 31);
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v90, v136, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v91;
    do
    {
      for (i1 = 0; i1 != v69; ++i1)
      {
        if (*(_QWORD *)v91 != v70)
          objc_enumerationMutation(v67);
        -[NTPBTagRecord addLatestIssueIDs:](self, "addLatestIssueIDs:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i1));
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v90, v136, 16);
    }
    while (v69);
  }
  if (*((_QWORD *)a3 + 12))
    -[NTPBTagRecord setArchiveIssueListID:](self, "setArchiveIssueListID:");
  if (*((_QWORD *)a3 + 30))
    -[NTPBTagRecord setLanguage:](self, "setLanguage:");
  if (*((_QWORD *)a3 + 33))
    -[NTPBTagRecord setMagazineGenre:](self, "setMagazineGenre:");
  if (*((_QWORD *)a3 + 49))
    -[NTPBTagRecord setPaidBundlePaywallConfigurationJson:](self, "setPaidBundlePaywallConfigurationJson:");
  if (*((_QWORD *)a3 + 73))
    -[NTPBTagRecord setStocksFeedConfigurationJson:](self, "setStocksFeedConfigurationJson:");
  if (*((_QWORD *)a3 + 76))
    -[NTPBTagRecord setSupergroupConfigJson:](self, "setSupergroupConfigJson:");
  if (*((_QWORD *)a3 + 77))
    -[NTPBTagRecord setSupergroupKnobsJson:](self, "setSupergroupKnobsJson:");
  if ((*((_BYTE *)a3 + 648) & 0x20) != 0)
  {
    self->_propertyFlags = *((_QWORD *)a3 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v72 = (void *)*((_QWORD *)a3 + 62);
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v135, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v87;
    do
    {
      for (i2 = 0; i2 != v74; ++i2)
      {
        if (*(_QWORD *)v87 != v75)
          objc_enumerationMutation(v72);
        -[NTPBTagRecord addRecentIssueIDs:](self, "addRecentIssueIDs:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i2));
      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v135, 16);
    }
    while (v74);
  }
  if (*((_QWORD *)a3 + 40))
    -[NTPBTagRecord setNameImageLargeURL:](self, "setNameImageLargeURL:");
  if (*((_QWORD *)a3 + 39))
    -[NTPBTagRecord setNameImageLargeMaskURL:](self, "setNameImageLargeMaskURL:");
  if (*((_QWORD *)a3 + 75))
    -[NTPBTagRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  if ((*((_BYTE *)a3 + 650) & 2) != 0)
  {
    self->_isSportsRecommendable = *((_BYTE *)a3 + 642);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)a3 + 71))
    -[NTPBTagRecord setSportsRecommendationMappingsJson:](self, "setSportsRecommendationMappingsJson:");
  if (*((_QWORD *)a3 + 27))
    -[NTPBTagRecord setHighlightsArticleListID:](self, "setHighlightsArticleListID:");
  if (*((_QWORD *)a3 + 70))
    -[NTPBTagRecord setSportsLogoImageURL:](self, "setSportsLogoImageURL:");
  if (*((_QWORD *)a3 + 68))
    -[NTPBTagRecord setSportsLogoImageCompactURL:](self, "setSportsLogoImageCompactURL:");
  if (*((_QWORD *)a3 + 69))
    -[NTPBTagRecord setSportsLogoImageLargeURL:](self, "setSportsLogoImageLargeURL:");
  if (*((_QWORD *)a3 + 64))
    -[NTPBTagRecord setSportsData:](self, "setSportsData:");
  if (*((_QWORD *)a3 + 72))
    -[NTPBTagRecord setSportsTheme:](self, "setSportsTheme:");
  if (*((_QWORD *)a3 + 48))
    -[NTPBTagRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:");
  if (*((_QWORD *)a3 + 22))
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageURL:](self, "setDarkStyleNavigationChromeBackgroundImageURL:");
  if (*((_QWORD *)a3 + 46))
    -[NTPBTagRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:");
  if (*((_QWORD *)a3 + 20))
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageCompactURL:](self, "setDarkStyleNavigationChromeBackgroundImageCompactURL:");
  if (*((_QWORD *)a3 + 47))
    -[NTPBTagRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:");
  if (*((_QWORD *)a3 + 21))
    -[NTPBTagRecord setDarkStyleNavigationChromeBackgroundImageLargeURL:](self, "setDarkStyleNavigationChromeBackgroundImageLargeURL:");
  if ((*((_BYTE *)a3 + 649) & 1) != 0)
  {
    self->_subscriptionRate = *((double *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 60))
    -[NTPBTagRecord setPublisherSpecifiedArticlesJson:](self, "setPublisherSpecifiedArticlesJson:");
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v77 = (void *)*((_QWORD *)a3 + 10);
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v134, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v83;
    do
    {
      for (i3 = 0; i3 != v79; ++i3)
      {
        if (*(_QWORD *)v83 != v80)
          objc_enumerationMutation(v77);
        -[NTPBTagRecord addAdTargetingKeywords:](self, "addAdTargetingKeywords:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i3));
      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v134, 16);
    }
    while (v79);
  }
  if (*((_QWORD *)a3 + 24))
    -[NTPBTagRecord setFeedNavImageHQURL:](self, "setFeedNavImageHQURL:");
  if (*((_QWORD *)a3 + 67))
    -[NTPBTagRecord setSportsLogoAltImageURL:](self, "setSportsLogoAltImageURL:");
  if (*((_QWORD *)a3 + 65))
    -[NTPBTagRecord setSportsLogoAltImageCompactURL:](self, "setSportsLogoAltImageCompactURL:");
  if (*((_QWORD *)a3 + 66))
    -[NTPBTagRecord setSportsLogoAltImageLargeURL:](self, "setSportsLogoAltImageLargeURL:");
  if ((*((_BYTE *)a3 + 648) & 0x40) != 0)
  {
    self->_propertyFlagsLocalized = *((_QWORD *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
}

- (NSData)nameImageCompactMetadata
{
  return self->_nameImageCompactMetadata;
}

- (NSData)articleRecirculationConfiguration
{
  return self->_articleRecirculationConfiguration;
}

- (NSString)stocksFeedConfigurationJson
{
  return self->_stocksFeedConfigurationJson;
}

@end
