@implementation NTPBArticleRecord

- (NTPBRecordBase)base
{
  return self->_base;
}

- (NSString)sourceChannelTagID
{
  return self->_sourceChannelTagID;
}

- (NSString)parentIssueID
{
  return self->_parentIssueID;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData
{
  return self->_expirationData;
}

- (NSString)thumbnailPrimaryColor
{
  return self->_thumbnailPrimaryColor;
}

- (NSString)articleRecirculationConfigurationURL
{
  return self->_articleRecirculationConfigurationURL;
}

- (NSString)thumbnailTextColor
{
  return self->_thumbnailTextColor;
}

- (NSString)thumbnailBackgroundColor
{
  return self->_thumbnailBackgroundColor;
}

- (NSString)thumbnailAccentColor
{
  return self->_thumbnailAccentColor;
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSString)videoURL
{
  return self->_videoURL;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (NSString)videoStillImageURL
{
  return self->_videoStillImageURL;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (NSString)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (NSString)thumbnailWidgetURL
{
  return self->_thumbnailWidgetURL;
}

- (int64_t)thumbnailWidgetMetadata
{
  return self->_thumbnailWidgetMetadata;
}

- (NSString)thumbnailWidgetLQURL
{
  return self->_thumbnailWidgetLQURL;
}

- (int64_t)thumbnailWidgetLQMetadata
{
  return self->_thumbnailWidgetLQMetadata;
}

- (NSString)thumbnailWidgetHQURL
{
  return self->_thumbnailWidgetHQURL;
}

- (int64_t)thumbnailWidgetHQMetadata
{
  return self->_thumbnailWidgetHQMetadata;
}

- (NSString)thumbnailUltraHQURL
{
  return self->_thumbnailUltraHQURL;
}

- (int64_t)thumbnailUltraHQMetadata
{
  return self->_thumbnailUltraHQMetadata;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (int64_t)thumbnailMetadata
{
  return self->_thumbnailMetadata;
}

- (NSString)thumbnailMediumURL
{
  return self->_thumbnailMediumURL;
}

- (int64_t)thumbnailMediumMetadata
{
  return self->_thumbnailMediumMetadata;
}

- (NSString)thumbnailLQURL
{
  return self->_thumbnailLQURL;
}

- (int64_t)thumbnailLQMetadata
{
  return self->_thumbnailLQMetadata;
}

- (NSString)thumbnailHQURL
{
  return self->_thumbnailHQURL;
}

- (int64_t)thumbnailHQMetadata
{
  return self->_thumbnailHQMetadata;
}

- (int64_t)thumbnailFocalFrame
{
  return self->_thumbnailFocalFrame;
}

- (NSMutableArray)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (int64_t)schemaFlags
{
  return self->_schemaFlags;
}

- (NSString)routeURL
{
  return self->_routeURL;
}

- (NSMutableArray)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (NSString)referencedArticleID
{
  return self->_referencedArticleID;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (NTPBDate)publishDate
{
  return self->_publishDate;
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSString)narrativeTrackFullURL
{
  return self->_narrativeTrackFullURL;
}

- (NSMutableArray)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSMutableArray)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (NSMutableArray)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (NSString)layeredCover
{
  return self->_layeredCover;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)isSponsored
{
  return self->_isSponsored;
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (BOOL)isIssueOnly
{
  return self->_isIssueOnly;
}

- (BOOL)isFeatureCandidate
{
  return self->_isFeatureCandidate;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (NSMutableArray)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (NSMutableArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSMutableArray)iAdCategories
{
  return self->_iAdCategories;
}

- (unint64_t)halfLifeMilliseconds
{
  return self->_halfLifeMilliseconds;
}

- (unint64_t)halfLifeMillisecondsOverride
{
  return self->_halfLifeMillisecondsOverride;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (NSMutableArray)experimentalTitles
{
  return self->_experimentalTitles;
}

- (NSString)coverArt
{
  return self->_coverArt;
}

- (NSString)contentURL
{
  return self->_contentURL;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata
{
  return self->_channelTagMetadata;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSMutableArray)authors
{
  return self->_authors;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBArticleRecord setBase:](self, "setBase:", 0);
  -[NTPBArticleRecord setReferencedArticleID:](self, "setReferencedArticleID:", 0);
  -[NTPBArticleRecord setTitle:](self, "setTitle:", 0);
  -[NTPBArticleRecord setSubtitle:](self, "setSubtitle:", 0);
  -[NTPBArticleRecord setSourceChannelTagID:](self, "setSourceChannelTagID:", 0);
  -[NTPBArticleRecord setPublishDate:](self, "setPublishDate:", 0);
  -[NTPBArticleRecord setThumbnailLQURL:](self, "setThumbnailLQURL:", 0);
  -[NTPBArticleRecord setPrimaryAudience:](self, "setPrimaryAudience:", 0);
  -[NTPBArticleRecord setExcerptURL:](self, "setExcerptURL:", 0);
  -[NTPBArticleRecord setShortExcerpt:](self, "setShortExcerpt:", 0);
  -[NTPBArticleRecord setAccessoryText:](self, "setAccessoryText:", 0);
  -[NTPBArticleRecord setContentURL:](self, "setContentURL:", 0);
  -[NTPBArticleRecord setClusterID:](self, "setClusterID:", 0);
  -[NTPBArticleRecord setFlintDocumentURL:](self, "setFlintDocumentURL:", 0);
  -[NTPBArticleRecord setFlintFontResourceIDs:](self, "setFlintFontResourceIDs:", 0);
  -[NTPBArticleRecord setVideoURL:](self, "setVideoURL:", 0);
  -[NTPBArticleRecord setIAdCategories:](self, "setIAdCategories:", 0);
  -[NTPBArticleRecord setIAdKeywords:](self, "setIAdKeywords:", 0);
  -[NTPBArticleRecord setIAdSectionIDs:](self, "setIAdSectionIDs:", 0);
  -[NTPBArticleRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBArticleRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  -[NTPBArticleRecord setRelatedArticleIDs:](self, "setRelatedArticleIDs:", 0);
  -[NTPBArticleRecord setMoreFromPublisherArticleIDs:](self, "setMoreFromPublisherArticleIDs:", 0);
  -[NTPBArticleRecord setThumbnailURL:](self, "setThumbnailURL:", 0);
  -[NTPBArticleRecord setThumbnailMediumURL:](self, "setThumbnailMediumURL:", 0);
  -[NTPBArticleRecord setThumbnailHQURL:](self, "setThumbnailHQURL:", 0);
  -[NTPBArticleRecord setThumbnailUltraHQURL:](self, "setThumbnailUltraHQURL:", 0);
  -[NTPBArticleRecord setCoverArt:](self, "setCoverArt:", 0);
  -[NTPBArticleRecord setThumbnailWidgetLQURL:](self, "setThumbnailWidgetLQURL:", 0);
  -[NTPBArticleRecord setThumbnailWidgetLQTaggedURL:](self, "setThumbnailWidgetLQTaggedURL:", 0);
  -[NTPBArticleRecord setThumbnailWidgetURL:](self, "setThumbnailWidgetURL:", 0);
  -[NTPBArticleRecord setThumbnailWidgetTaggedURL:](self, "setThumbnailWidgetTaggedURL:", 0);
  -[NTPBArticleRecord setThumbnailWidgetHQURL:](self, "setThumbnailWidgetHQURL:", 0);
  -[NTPBArticleRecord setThumbnailWidgetHQTaggedURL:](self, "setThumbnailWidgetHQTaggedURL:", 0);
  -[NTPBArticleRecord setTopics:](self, "setTopics:", 0);
  -[NTPBArticleRecord setSourceChannelCohorts:](self, "setSourceChannelCohorts:", 0);
  -[NTPBArticleRecord setGlobalCohorts:](self, "setGlobalCohorts:", 0);
  -[NTPBArticleRecord setTitleCompact:](self, "setTitleCompact:", 0);
  -[NTPBArticleRecord setVideoCallToActionTitle:](self, "setVideoCallToActionTitle:", 0);
  -[NTPBArticleRecord setVideoCallToActionURL:](self, "setVideoCallToActionURL:", 0);
  -[NTPBArticleRecord setPublisherSpecifiedArticleIDs:](self, "setPublisherSpecifiedArticleIDs:", 0);
  -[NTPBArticleRecord setStocksClusterID:](self, "setStocksClusterID:", 0);
  -[NTPBArticleRecord setStocksMetadata:](self, "setStocksMetadata:", 0);
  -[NTPBArticleRecord setStocksScores:](self, "setStocksScores:", 0);
  -[NTPBArticleRecord setExperimentalTitles:](self, "setExperimentalTitles:", 0);
  -[NTPBArticleRecord setParentIssueID:](self, "setParentIssueID:", 0);
  -[NTPBArticleRecord setLanguage:](self, "setLanguage:", 0);
  -[NTPBArticleRecord setLinkedArticleIDs:](self, "setLinkedArticleIDs:", 0);
  -[NTPBArticleRecord setLinkedIssueIDs:](self, "setLinkedIssueIDs:", 0);
  -[NTPBArticleRecord setNarrativeTrackMetadata:](self, "setNarrativeTrackMetadata:", 0);
  -[NTPBArticleRecord setNarrativeTrackFullURL:](self, "setNarrativeTrackFullURL:", 0);
  -[NTPBArticleRecord setNarrativeTrackSampleURL:](self, "setNarrativeTrackSampleURL:", 0);
  -[NTPBArticleRecord setNarrativeTrackTextRanges:](self, "setNarrativeTrackTextRanges:", 0);
  -[NTPBArticleRecord setChannelConversionStats:](self, "setChannelConversionStats:", 0);
  -[NTPBArticleRecord setGlobalConversionStats:](self, "setGlobalConversionStats:", 0);
  -[NTPBArticleRecord setLayeredCover:](self, "setLayeredCover:", 0);
  -[NTPBArticleRecord setThumbnailPrimaryColor:](self, "setThumbnailPrimaryColor:", 0);
  -[NTPBArticleRecord setThumbnailBackgroundColor:](self, "setThumbnailBackgroundColor:", 0);
  -[NTPBArticleRecord setThumbnailTextColor:](self, "setThumbnailTextColor:", 0);
  -[NTPBArticleRecord setThumbnailAccentColor:](self, "setThumbnailAccentColor:", 0);
  -[NTPBArticleRecord setAuthors:](self, "setAuthors:", 0);
  -[NTPBArticleRecord setChannelTagMetadata:](self, "setChannelTagMetadata:", 0);
  -[NTPBArticleRecord setVideoStillImageURL:](self, "setVideoStillImageURL:", 0);
  -[NTPBArticleRecord setExpirationData:](self, "setExpirationData:", 0);
  -[NTPBArticleRecord setRouteURL:](self, "setRouteURL:", 0);
  -[NTPBArticleRecord setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:", 0);
  -[NTPBArticleRecord setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:", 0);
  -[NTPBArticleRecord setArticleRecirculationConfigurationURL:](self, "setArticleRecirculationConfigurationURL:", 0);
  -[NTPBArticleRecord setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:", 0);
  -[NTPBArticleRecord setVideoType:](self, "setVideoType:", 0);
  -[NTPBArticleRecord setSportsEventIDs:](self, "setSportsEventIDs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleRecord;
  -[NTPBArticleRecord dealloc](&v3, sel_dealloc);
}

- (void)setVideoURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 744);
}

- (void)setVideoType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 736);
}

- (void)setVideoStillImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 728);
}

- (void)setVideoCallToActionURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 720);
}

- (void)setVideoCallToActionTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 712);
}

- (void)setTopics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 704);
}

- (void)setTitleCompact:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 696);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 688);
}

- (void)setThumbnailWidgetURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 680);
}

- (void)setThumbnailWidgetLQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 664);
}

- (void)setThumbnailWidgetHQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (void)setThumbnailUltraHQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 632);
}

- (void)setThumbnailURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 624);
}

- (void)setThumbnailTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (void)setThumbnailPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (void)setThumbnailPerceptualHash:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

- (void)setThumbnailMediumURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 592);
}

- (void)setThumbnailLQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 584);
}

- (void)setThumbnailHQURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 576);
}

- (void)setThumbnailBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (void)setThumbnailAccentColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (void)setStocksScores:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 536);
}

- (void)setStocksMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (void)setStocksClusterID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (void)setSportsEventIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (void)setSourceChannelTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (void)setSourceChannelCohorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 496);
}

- (void)setShortExcerpt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 488);
}

- (void)setRouteURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (void)setRelatedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (void)setReferencedArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (void)setPublisherSpecifiedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (void)setPublishDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (void)setPrimaryAudience:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (void)setParentIssueID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (void)setNarrativeTrackTextRanges:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (void)setNarrativeTrackSampleURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (void)setNarrativeTrackMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (void)setNarrativeTrackFullURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (void)setMoreFromPublisherArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (void)setLinkedIssueIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (void)setLinkedArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (void)setLayeredCover:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (void)setIAdSectionIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (void)setIAdKeywords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (void)setIAdCategories:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (void)setGlobalConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void)setGlobalCohorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (void)setFloat16TitleEncoding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (void)setFloat16FullBodyEncoding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (void)setFlintFontResourceIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (void)setFlintDocumentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (void)setExpirationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (void)setExperimentalTitles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (void)setCoverArt:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setChannelTagMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setChannelConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)setAuthors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (void)setArticleRecirculationConfigurationURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setAccessoryText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setThumbnailWidgetTaggedURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 672);
}

- (void)setThumbnailWidgetLQTaggedURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (void)setThumbnailWidgetHQTaggedURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (void)setExcerptURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (int)contentType
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_contentType;
  else
    return 0;
}

- (NSString)flintDocumentURL
{
  return self->_flintDocumentURL;
}

- (int)role
{
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    return self->_role;
  else
    return 0;
}

- (void)addTopics:(id)a3
{
  NSMutableArray *topics;

  topics = self->_topics;
  if (!topics)
  {
    topics = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_topics = topics;
  }
  -[NSMutableArray addObject:](topics, "addObject:", a3);
}

- (void)addFlintFontResourceIDs:(id)a3
{
  NSMutableArray *flintFontResourceIDs;

  flintFontResourceIDs = self->_flintFontResourceIDs;
  if (!flintFontResourceIDs)
  {
    flintFontResourceIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_flintFontResourceIDs = flintFontResourceIDs;
  }
  -[NSMutableArray addObject:](flintFontResourceIDs, "addObject:", a3);
}

- (void)addRelatedArticleIDs:(id)a3
{
  NSMutableArray *relatedArticleIDs;

  relatedArticleIDs = self->_relatedArticleIDs;
  if (!relatedArticleIDs)
  {
    relatedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_relatedArticleIDs = relatedArticleIDs;
  }
  -[NSMutableArray addObject:](relatedArticleIDs, "addObject:", a3);
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

- (void)addLinkedArticleIDs:(id)a3
{
  NSMutableArray *linkedArticleIDs;

  linkedArticleIDs = self->_linkedArticleIDs;
  if (!linkedArticleIDs)
  {
    linkedArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_linkedArticleIDs = linkedArticleIDs;
  }
  -[NSMutableArray addObject:](linkedArticleIDs, "addObject:", a3);
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

- (void)addIAdSectionIDs:(id)a3
{
  NSMutableArray *iAdSectionIDs;

  iAdSectionIDs = self->_iAdSectionIDs;
  if (!iAdSectionIDs)
  {
    iAdSectionIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_iAdSectionIDs = iAdSectionIDs;
  }
  -[NSMutableArray addObject:](iAdSectionIDs, "addObject:", a3);
}

- (NSMutableArray)flintFontResourceIDs
{
  return self->_flintFontResourceIDs;
}

- (NSString)stocksScores
{
  return self->_stocksScores;
}

- (NSString)stocksMetadata
{
  return self->_stocksMetadata;
}

- (void)setVideoDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_videoDuration = a3;
}

- (void)setThumbnailWidgetMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_thumbnailWidgetMetadata = a3;
}

- (void)setThumbnailWidgetLQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_thumbnailWidgetLQMetadata = a3;
}

- (void)setThumbnailWidgetHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_thumbnailWidgetHQMetadata = a3;
}

- (void)setThumbnailUltraHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_thumbnailUltraHQMetadata = a3;
}

- (void)setThumbnailMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_thumbnailMetadata = a3;
}

- (void)setThumbnailMediumMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_thumbnailMediumMetadata = a3;
}

- (void)setThumbnailLQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_thumbnailLQMetadata = a3;
}

- (void)setThumbnailHQMetadata:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_thumbnailHQMetadata = a3;
}

- (void)setThumbnailFocalFrame:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_thumbnailFocalFrame = a3;
}

- (void)setStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_storyType = a3;
}

- (void)setSchemaFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_schemaFlags = a3;
}

- (void)setRole:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_role = a3;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_publisherArticleVersion = a3;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_minimumNewsVersion = a3;
}

- (void)setLayeredCoverAspectRatio:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_layeredCoverAspectRatio = a3;
}

- (void)setIsSponsored:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isSponsored = a3;
}

- (void)setIsPaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isPaid = a3;
}

- (void)setIsIssueOnly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isIssueOnly = a3;
}

- (void)setIsFeatureCandidate:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isFeatureCandidate = a3;
}

- (void)setIsDraft:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isDraft = a3;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isBundlePaid = a3;
}

- (void)setHalfLifeMillisecondsOverride:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_halfLifeMillisecondsOverride = a3;
}

- (void)setHalfLifeMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_halfLifeMilliseconds = a3;
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_contentType = a3;
}

- (void)setBodyTextLength:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bodyTextLength = a3;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_behaviorFlags = a3;
}

- (void)setBackendArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersion = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $A8E075B7A99374BF2C8CD763302FCDDE has;
  NSMutableArray *flintFontResourceIDs;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  $A8E075B7A99374BF2C8CD763302FCDDE v13;
  NSMutableArray *iAdCategories;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableArray *iAdKeywords;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *iAdSectionIDs;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ii;
  void *v43;
  NSMutableArray *relatedArticleIDs;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t jj;
  void *v49;
  NSMutableArray *moreFromPublisherArticleIDs;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t kk;
  void *v55;
  $A8E075B7A99374BF2C8CD763302FCDDE v56;
  $A8E075B7A99374BF2C8CD763302FCDDE v57;
  NSMutableArray *topics;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t mm;
  void *v63;
  NSMutableArray *publisherSpecifiedArticleIDs;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t nn;
  void *v69;
  NSMutableArray *experimentalTitles;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i1;
  void *v75;
  $A8E075B7A99374BF2C8CD763302FCDDE v76;
  NSMutableArray *linkedArticleIDs;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i2;
  void *v82;
  NSMutableArray *linkedIssueIDs;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i3;
  void *v88;
  $A8E075B7A99374BF2C8CD763302FCDDE v89;
  NSMutableArray *authors;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i4;
  void *v95;
  NSMutableArray *sportsEventIDs;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i5;
  void *v101;
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
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 192) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 456) = -[NSString copyWithZone:](self->_referencedArticleID, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 688) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 552) = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 504) = -[NSString copyWithZone:](self->_sourceChannelTagID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 440) = -[NTPBDate copyWithZone:](self->_publishDate, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_publisherArticleVersion;
    *(_DWORD *)(v5 + 760) |= 0x80u;
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_backendArticleVersion;
    *(_DWORD *)(v5 + 760) |= 1u;
  }

  *(_QWORD *)(v5 + 584) = -[NSString copyWithZone:](self->_thumbnailLQURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_thumbnailLQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x800u;
  }

  *(_QWORD *)(v5 + 432) = -[NSString copyWithZone:](self->_primaryAudience, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 256) = -[NSString copyWithZone:](self->_excerptURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 488) = -[NSString copyWithZone:](self->_shortExcerpt, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_accessoryText, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 240) = -[NSString copyWithZone:](self->_contentURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_contentType;
    *(_DWORD *)(v5 + 760) |= 0x80000u;
  }

  *(_QWORD *)(v5 + 224) = -[NSString copyWithZone:](self->_clusterID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 280) = -[NSString copyWithZone:](self->_flintDocumentURL, "copyWithZone:", a3);
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  flintFontResourceIDs = self->_flintFontResourceIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](flintFontResourceIDs, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v160;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v160 != v10)
          objc_enumerationMutation(flintFontResourceIDs);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFlintFontResourceIDs:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](flintFontResourceIDs, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
    }
    while (v9);
  }

  *(_QWORD *)(v5 + 744) = -[NSString copyWithZone:](self->_videoURL, "copyWithZone:", a3);
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
    *(_BYTE *)(v5 + 752) = self->_isBundlePaid;
    *(_DWORD *)(v5 + 760) |= 0x400000u;
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x1000000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v13 & 0x8000000) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v5 + 754) = self->_isFeatureCandidate;
  *(_DWORD *)(v5 + 760) |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
  {
LABEL_19:
    *(_BYTE *)(v5 + 757) = self->_isSponsored;
    *(_DWORD *)(v5 + 760) |= 0x8000000u;
  }
LABEL_20:
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  iAdCategories = self->_iAdCategories;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v156;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v156 != v17)
          objc_enumerationMutation(iAdCategories);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v155 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIAdCategories:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
    }
    while (v16);
  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  iAdKeywords = self->_iAdKeywords;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v152;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v152 != v23)
          objc_enumerationMutation(iAdKeywords);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIAdKeywords:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v151, v175, 16);
    }
    while (v22);
  }
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  iAdSectionIDs = self->_iAdSectionIDs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdSectionIDs, "countByEnumeratingWithState:objects:count:", &v147, v174, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v148;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v148 != v29)
          objc_enumerationMutation(iAdSectionIDs);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIAdSectionIDs:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdSectionIDs, "countByEnumeratingWithState:objects:count:", &v147, v174, 16);
    }
    while (v28);
  }
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v143, v173, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v144;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v144 != v35)
          objc_enumerationMutation(blockedStorefrontIDs);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v143, v173, 16);
    }
    while (v34);
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v139, v172, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v140;
    do
    {
      for (ii = 0; ii != v40; ++ii)
      {
        if (*(_QWORD *)v140 != v41)
          objc_enumerationMutation(allowedStorefrontIDs);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v139, v172, 16);
    }
    while (v40);
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 753) = self->_isDraft;
    *(_DWORD *)(v5 + 760) |= 0x800000u;
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  relatedArticleIDs = self->_relatedArticleIDs;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](relatedArticleIDs, "countByEnumeratingWithState:objects:count:", &v135, v171, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v136;
    do
    {
      for (jj = 0; jj != v46; ++jj)
      {
        if (*(_QWORD *)v136 != v47)
          objc_enumerationMutation(relatedArticleIDs);
        v49 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRelatedArticleIDs:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](relatedArticleIDs, "countByEnumeratingWithState:objects:count:", &v135, v171, 16);
    }
    while (v46);
  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](moreFromPublisherArticleIDs, "countByEnumeratingWithState:objects:count:", &v131, v170, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v132;
    do
    {
      for (kk = 0; kk != v52; ++kk)
      {
        if (*(_QWORD *)v132 != v53)
          objc_enumerationMutation(moreFromPublisherArticleIDs);
        v55 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * kk), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMoreFromPublisherArticleIDs:", v55);

      }
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](moreFromPublisherArticleIDs, "countByEnumeratingWithState:objects:count:", &v131, v170, 16);
    }
    while (v52);
  }

  *(_QWORD *)(v5 + 624) = -[NSString copyWithZone:](self->_thumbnailURL, "copyWithZone:", a3);
  v56 = self->_has;
  if ((*(_WORD *)&v56 & 0x2000) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_thumbnailMetadata;
    *(_DWORD *)(v5 + 760) |= 0x2000u;
    v56 = self->_has;
  }
  if ((*(_WORD *)&v56 & 0x200) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_thumbnailFocalFrame;
    *(_DWORD *)(v5 + 760) |= 0x200u;
  }

  *(_QWORD *)(v5 + 592) = -[NSString copyWithZone:](self->_thumbnailMediumURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_thumbnailMediumMetadata;
    *(_DWORD *)(v5 + 760) |= 0x1000u;
  }

  *(_QWORD *)(v5 + 576) = -[NSString copyWithZone:](self->_thumbnailHQURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_thumbnailHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x400u;
  }

  *(_QWORD *)(v5 + 632) = -[NSString copyWithZone:](self->_thumbnailUltraHQURL, "copyWithZone:", a3);
  v57 = self->_has;
  if ((*(_WORD *)&v57 & 0x4000) != 0)
  {
    *(_QWORD *)(v5 + 120) = self->_thumbnailUltraHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x4000u;
    v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x200000) == 0)
    {
LABEL_81:
      if ((*(_BYTE *)&v57 & 2) == 0)
        goto LABEL_82;
      goto LABEL_163;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x200000) == 0)
  {
    goto LABEL_81;
  }
  *(_DWORD *)(v5 + 544) = self->_storyType;
  *(_DWORD *)(v5 + 760) |= 0x200000u;
  v57 = self->_has;
  if ((*(_BYTE *)&v57 & 2) == 0)
  {
LABEL_82:
    if ((*(_BYTE *)&v57 & 0x40) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_163:
  *(_QWORD *)(v5 + 16) = self->_behaviorFlags;
  *(_DWORD *)(v5 + 760) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_83:
    *(_QWORD *)(v5 + 56) = self->_minimumNewsVersion;
    *(_DWORD *)(v5 + 760) |= 0x40u;
  }
LABEL_84:

  *(_QWORD *)(v5 + 248) = -[NSString copyWithZone:](self->_coverArt, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
  {
    *(_BYTE *)(v5 + 756) = self->_isPaid;
    *(_DWORD *)(v5 + 760) |= 0x4000000u;
  }

  *(_QWORD *)(v5 + 664) = -[NSString copyWithZone:](self->_thumbnailWidgetLQURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 656) = -[NSString copyWithZone:](self->_thumbnailWidgetLQTaggedURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_QWORD *)(v5 + 136) = self->_thumbnailWidgetLQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x10000u;
  }

  *(_QWORD *)(v5 + 680) = -[NSString copyWithZone:](self->_thumbnailWidgetURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 672) = -[NSString copyWithZone:](self->_thumbnailWidgetTaggedURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_QWORD *)(v5 + 144) = self->_thumbnailWidgetMetadata;
    *(_DWORD *)(v5 + 760) |= 0x20000u;
  }

  *(_QWORD *)(v5 + 648) = -[NSString copyWithZone:](self->_thumbnailWidgetHQURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 640) = -[NSString copyWithZone:](self->_thumbnailWidgetHQTaggedURL, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 128) = self->_thumbnailWidgetHQMetadata;
    *(_DWORD *)(v5 + 760) |= 0x8000u;
  }
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  topics = self->_topics;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v127, v169, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v128;
    do
    {
      for (mm = 0; mm != v60; ++mm)
      {
        if (*(_QWORD *)v128 != v61)
          objc_enumerationMutation(topics);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * mm), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopics:", v63);

      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v127, v169, 16);
    }
    while (v60);
  }

  *(_QWORD *)(v5 + 496) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_sourceChannelCohorts, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 312) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_globalCohorts, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 696) = -[NSString copyWithZone:](self->_titleCompact, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 712) = -[NSString copyWithZone:](self->_videoCallToActionTitle, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 720) = -[NSString copyWithZone:](self->_videoCallToActionURL, "copyWithZone:", a3);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v123, v168, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v124;
    do
    {
      for (nn = 0; nn != v66; ++nn)
      {
        if (*(_QWORD *)v124 != v67)
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * nn), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPublisherSpecifiedArticleIDs:", v69);

      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v123, v168, 16);
    }
    while (v66);
  }

  *(_QWORD *)(v5 + 520) = -[NSString copyWithZone:](self->_stocksClusterID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 528) = -[NSString copyWithZone:](self->_stocksMetadata, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 536) = -[NSString copyWithZone:](self->_stocksScores, "copyWithZone:", a3);
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  experimentalTitles = self->_experimentalTitles;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experimentalTitles, "countByEnumeratingWithState:objects:count:", &v119, v167, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v120;
    do
    {
      for (i1 = 0; i1 != v72; ++i1)
      {
        if (*(_QWORD *)v120 != v73)
          objc_enumerationMutation(experimentalTitles);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i1), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addExperimentalTitles:", v75);

      }
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experimentalTitles, "countByEnumeratingWithState:objects:count:", &v119, v167, 16);
    }
    while (v72);
  }

  *(_QWORD *)(v5 + 424) = -[NSString copyWithZone:](self->_parentIssueID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 352) = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v76 = self->_has;
  if ((*(_DWORD *)&v76 & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 472) = self->_role;
    *(_DWORD *)(v5 + 760) |= 0x100000u;
    v76 = self->_has;
  }
  if ((*(_BYTE *)&v76 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_halfLifeMilliseconds;
    *(_DWORD *)(v5 + 760) |= 8u;
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  linkedArticleIDs = self->_linkedArticleIDs;
  v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedArticleIDs, "countByEnumeratingWithState:objects:count:", &v115, v166, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v116;
    do
    {
      for (i2 = 0; i2 != v79; ++i2)
      {
        if (*(_QWORD *)v116 != v80)
          objc_enumerationMutation(linkedArticleIDs);
        v82 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * i2), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLinkedArticleIDs:", v82);

      }
      v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedArticleIDs, "countByEnumeratingWithState:objects:count:", &v115, v166, 16);
    }
    while (v79);
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  linkedIssueIDs = self->_linkedIssueIDs;
  v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedIssueIDs, "countByEnumeratingWithState:objects:count:", &v111, v165, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v112;
    do
    {
      for (i3 = 0; i3 != v85; ++i3)
      {
        if (*(_QWORD *)v112 != v86)
          objc_enumerationMutation(linkedIssueIDs);
        v88 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i3), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLinkedIssueIDs:", v88);

      }
      v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedIssueIDs, "countByEnumeratingWithState:objects:count:", &v111, v165, 16);
    }
    while (v85);
  }
  v89 = self->_has;
  if ((*(_DWORD *)&v89 & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 755) = self->_isIssueOnly;
    *(_DWORD *)(v5 + 760) |= 0x2000000u;
    v89 = self->_has;
  }
  if ((*(_BYTE *)&v89 & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_bodyTextLength;
    *(_DWORD *)(v5 + 760) |= 4u;
  }

  *(_QWORD *)(v5 + 400) = -[NSString copyWithZone:](self->_narrativeTrackMetadata, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 392) = -[NSString copyWithZone:](self->_narrativeTrackFullURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 408) = -[NSString copyWithZone:](self->_narrativeTrackSampleURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 416) = -[NSString copyWithZone:](self->_narrativeTrackTextRanges, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 208) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_channelConversionStats, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 320) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_globalConversionStats, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 360) = -[NSString copyWithZone:](self->_layeredCover, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_layeredCoverAspectRatio;
    *(_DWORD *)(v5 + 760) |= 0x20u;
  }

  *(_QWORD *)(v5 + 608) = -[NSString copyWithZone:](self->_thumbnailPrimaryColor, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 568) = -[NSString copyWithZone:](self->_thumbnailBackgroundColor, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 616) = -[NSString copyWithZone:](self->_thumbnailTextColor, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 560) = -[NSString copyWithZone:](self->_thumbnailAccentColor, "copyWithZone:", a3);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  authors = self->_authors;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v107, v164, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v108;
    do
    {
      for (i4 = 0; i4 != v92; ++i4)
      {
        if (*(_QWORD *)v108 != v93)
          objc_enumerationMutation(authors);
        v95 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i4), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuthors:", v95);

      }
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v107, v164, 16);
    }
    while (v92);
  }

  *(_QWORD *)(v5 + 216) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata copyWithZone:](self->_channelTagMetadata, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_halfLifeMillisecondsOverride;
    *(_DWORD *)(v5 + 760) |= 0x10u;
  }

  *(_QWORD *)(v5 + 728) = -[NSString copyWithZone:](self->_videoStillImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 272) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration copyWithZone:](self->_expirationData, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(double *)(v5 + 152) = self->_videoDuration;
    *(_DWORD *)(v5 + 760) |= 0x40000u;
  }

  *(_QWORD *)(v5 + 480) = -[NSString copyWithZone:](self->_routeURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 304) = -[NSData copyWithZone:](self->_float16TitleEncoding, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 296) = -[NSData copyWithZone:](self->_float16FullBodyEncoding, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_schemaFlags;
    *(_DWORD *)(v5 + 760) |= 0x100u;
  }

  *(_QWORD *)(v5 + 176) = -[NSString copyWithZone:](self->_articleRecirculationConfigurationURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 600) = -[NSData copyWithZone:](self->_thumbnailPerceptualHash, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 736) = -[NSString copyWithZone:](self->_videoType, "copyWithZone:", a3);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  sportsEventIDs = self->_sportsEventIDs;
  v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sportsEventIDs, "countByEnumeratingWithState:objects:count:", &v103, v163, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v104;
    do
    {
      for (i5 = 0; i5 != v98; ++i5)
      {
        if (*(_QWORD *)v104 != v99)
          objc_enumerationMutation(sportsEventIDs);
        v101 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i5), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSportsEventIDs:", v101);

      }
      v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sportsEventIDs, "countByEnumeratingWithState:objects:count:", &v103, v163, 16);
    }
    while (v98);
  }
  return (id)v5;
}

- (void)addAuthors:(id)a3
{
  NSMutableArray *authors;

  authors = self->_authors;
  if (!authors)
  {
    authors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_authors = authors;
  }
  -[NSMutableArray addObject:](authors, "addObject:", a3);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasReferencedArticleID
{
  return self->_referencedArticleID != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasSourceChannelTagID
{
  return self->_sourceChannelTagID != 0;
}

- (BOOL)hasPublishDate
{
  return self->_publishDate != 0;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasThumbnailLQURL
{
  return self->_thumbnailLQURL != 0;
}

- (void)setHasThumbnailLQMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasThumbnailLQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasPrimaryAudience
{
  return self->_primaryAudience != 0;
}

- (BOOL)hasExcerptURL
{
  return self->_excerptURL != 0;
}

- (BOOL)hasShortExcerpt
{
  return self->_shortExcerpt != 0;
}

- (BOOL)hasAccessoryText
{
  return self->_accessoryText != 0;
}

- (BOOL)hasContentURL
{
  return self->_contentURL != 0;
}

- (void)setHasContentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasContentType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasFlintDocumentURL
{
  return self->_flintDocumentURL != 0;
}

- (void)clearFlintFontResourceIDs
{
  -[NSMutableArray removeAllObjects](self->_flintFontResourceIDs, "removeAllObjects");
}

- (unint64_t)flintFontResourceIDsCount
{
  return -[NSMutableArray count](self->_flintFontResourceIDs, "count");
}

- (id)flintFontResourceIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_flintFontResourceIDs, "objectAtIndex:", a3);
}

+ (Class)flintFontResourceIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasVideoURL
{
  return self->_videoURL != 0;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsBundlePaid
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasIsFeatureCandidate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsFeatureCandidate
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasIsSponsored:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsSponsored
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
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

- (void)clearIAdSectionIDs
{
  -[NSMutableArray removeAllObjects](self->_iAdSectionIDs, "removeAllObjects");
}

- (unint64_t)iAdSectionIDsCount
{
  return -[NSMutableArray count](self->_iAdSectionIDs, "count");
}

- (id)iAdSectionIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_iAdSectionIDs, "objectAtIndex:", a3);
}

+ (Class)iAdSectionIDsType
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

- (void)setHasIsDraft:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsDraft
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)clearRelatedArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_relatedArticleIDs, "removeAllObjects");
}

- (unint64_t)relatedArticleIDsCount
{
  return -[NSMutableArray count](self->_relatedArticleIDs, "count");
}

- (id)relatedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_relatedArticleIDs, "objectAtIndex:", a3);
}

+ (Class)relatedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearMoreFromPublisherArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_moreFromPublisherArticleIDs, "removeAllObjects");
}

- (void)addMoreFromPublisherArticleIDs:(id)a3
{
  NSMutableArray *moreFromPublisherArticleIDs;

  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  if (!moreFromPublisherArticleIDs)
  {
    moreFromPublisherArticleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_moreFromPublisherArticleIDs = moreFromPublisherArticleIDs;
  }
  -[NSMutableArray addObject:](moreFromPublisherArticleIDs, "addObject:", a3);
}

- (unint64_t)moreFromPublisherArticleIDsCount
{
  return -[NSMutableArray count](self->_moreFromPublisherArticleIDs, "count");
}

- (id)moreFromPublisherArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_moreFromPublisherArticleIDs, "objectAtIndex:", a3);
}

+ (Class)moreFromPublisherArticleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasThumbnailURL
{
  return self->_thumbnailURL != 0;
}

- (void)setHasThumbnailMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasThumbnailMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasThumbnailFocalFrame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasThumbnailFocalFrame
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasThumbnailMediumURL
{
  return self->_thumbnailMediumURL != 0;
}

- (void)setHasThumbnailMediumMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasThumbnailMediumMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasThumbnailHQURL
{
  return self->_thumbnailHQURL != 0;
}

- (void)setHasThumbnailHQMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasThumbnailHQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasThumbnailUltraHQURL
{
  return self->_thumbnailUltraHQURL != 0;
}

- (void)setHasThumbnailUltraHQMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasThumbnailUltraHQMetadata
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)storyType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_storyType;
  else
    return 0;
}

- (void)setHasStoryType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasStoryType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBehaviorFlags
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasCoverArt
{
  return self->_coverArt != 0;
}

- (void)setHasIsPaid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsPaid
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasThumbnailWidgetLQURL
{
  return self->_thumbnailWidgetLQURL != 0;
}

- (BOOL)hasThumbnailWidgetLQTaggedURL
{
  return self->_thumbnailWidgetLQTaggedURL != 0;
}

- (void)setHasThumbnailWidgetLQMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasThumbnailWidgetLQMetadata
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasThumbnailWidgetURL
{
  return self->_thumbnailWidgetURL != 0;
}

- (BOOL)hasThumbnailWidgetTaggedURL
{
  return self->_thumbnailWidgetTaggedURL != 0;
}

- (void)setHasThumbnailWidgetMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasThumbnailWidgetMetadata
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasThumbnailWidgetHQURL
{
  return self->_thumbnailWidgetHQURL != 0;
}

- (BOOL)hasThumbnailWidgetHQTaggedURL
{
  return self->_thumbnailWidgetHQTaggedURL != 0;
}

- (void)setHasThumbnailWidgetHQMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasThumbnailWidgetHQMetadata
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearTopics
{
  -[NSMutableArray removeAllObjects](self->_topics, "removeAllObjects");
}

- (unint64_t)topicsCount
{
  return -[NSMutableArray count](self->_topics, "count");
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topics, "objectAtIndex:", a3);
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasTitleCompact
{
  return self->_titleCompact != 0;
}

- (BOOL)hasVideoCallToActionTitle
{
  return self->_videoCallToActionTitle != 0;
}

- (BOOL)hasVideoCallToActionURL
{
  return self->_videoCallToActionURL != 0;
}

- (void)clearPublisherSpecifiedArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_publisherSpecifiedArticleIDs, "removeAllObjects");
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

- (BOOL)hasStocksClusterID
{
  return self->_stocksClusterID != 0;
}

- (BOOL)hasStocksMetadata
{
  return self->_stocksMetadata != 0;
}

- (BOOL)hasStocksScores
{
  return self->_stocksScores != 0;
}

- (void)clearExperimentalTitles
{
  -[NSMutableArray removeAllObjects](self->_experimentalTitles, "removeAllObjects");
}

- (void)addExperimentalTitles:(id)a3
{
  NSMutableArray *experimentalTitles;

  experimentalTitles = self->_experimentalTitles;
  if (!experimentalTitles)
  {
    experimentalTitles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_experimentalTitles = experimentalTitles;
  }
  -[NSMutableArray addObject:](experimentalTitles, "addObject:", a3);
}

- (unint64_t)experimentalTitlesCount
{
  return -[NSMutableArray count](self->_experimentalTitles, "count");
}

- (id)experimentalTitlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_experimentalTitles, "objectAtIndex:", a3);
}

+ (Class)experimentalTitlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParentIssueID
{
  return self->_parentIssueID != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setHasRole:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRole
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasHalfLifeMilliseconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHalfLifeMilliseconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearLinkedArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_linkedArticleIDs, "removeAllObjects");
}

- (unint64_t)linkedArticleIDsCount
{
  return -[NSMutableArray count](self->_linkedArticleIDs, "count");
}

- (id)linkedArticleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_linkedArticleIDs, "objectAtIndex:", a3);
}

+ (Class)linkedArticleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearLinkedIssueIDs
{
  -[NSMutableArray removeAllObjects](self->_linkedIssueIDs, "removeAllObjects");
}

- (void)addLinkedIssueIDs:(id)a3
{
  NSMutableArray *linkedIssueIDs;

  linkedIssueIDs = self->_linkedIssueIDs;
  if (!linkedIssueIDs)
  {
    linkedIssueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_linkedIssueIDs = linkedIssueIDs;
  }
  -[NSMutableArray addObject:](linkedIssueIDs, "addObject:", a3);
}

- (unint64_t)linkedIssueIDsCount
{
  return -[NSMutableArray count](self->_linkedIssueIDs, "count");
}

- (id)linkedIssueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_linkedIssueIDs, "objectAtIndex:", a3);
}

+ (Class)linkedIssueIDsType
{
  return (Class)objc_opt_class();
}

- (void)setHasIsIssueOnly:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsIssueOnly
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasBodyTextLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBodyTextLength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNarrativeTrackMetadata
{
  return self->_narrativeTrackMetadata != 0;
}

- (BOOL)hasNarrativeTrackFullURL
{
  return self->_narrativeTrackFullURL != 0;
}

- (BOOL)hasNarrativeTrackSampleURL
{
  return self->_narrativeTrackSampleURL != 0;
}

- (BOOL)hasNarrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges != 0;
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (BOOL)hasLayeredCover
{
  return self->_layeredCover != 0;
}

- (void)setHasLayeredCoverAspectRatio:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLayeredCoverAspectRatio
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasThumbnailPrimaryColor
{
  return self->_thumbnailPrimaryColor != 0;
}

- (BOOL)hasThumbnailBackgroundColor
{
  return self->_thumbnailBackgroundColor != 0;
}

- (BOOL)hasThumbnailTextColor
{
  return self->_thumbnailTextColor != 0;
}

- (BOOL)hasThumbnailAccentColor
{
  return self->_thumbnailAccentColor != 0;
}

- (void)clearAuthors
{
  -[NSMutableArray removeAllObjects](self->_authors, "removeAllObjects");
}

- (unint64_t)authorsCount
{
  return -[NSMutableArray count](self->_authors, "count");
}

- (id)authorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authors, "objectAtIndex:", a3);
}

+ (Class)authorsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasChannelTagMetadata
{
  return self->_channelTagMetadata != 0;
}

- (void)setHasHalfLifeMillisecondsOverride:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasHalfLifeMillisecondsOverride
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasVideoStillImageURL
{
  return self->_videoStillImageURL != 0;
}

- (BOOL)hasExpirationData
{
  return self->_expirationData != 0;
}

- (void)setHasVideoDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVideoDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasRouteURL
{
  return self->_routeURL != 0;
}

- (BOOL)hasFloat16TitleEncoding
{
  return self->_float16TitleEncoding != 0;
}

- (BOOL)hasFloat16FullBodyEncoding
{
  return self->_float16FullBodyEncoding != 0;
}

- (void)setHasSchemaFlags:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($A8E075B7A99374BF2C8CD763302FCDDE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSchemaFlags
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasArticleRecirculationConfigurationURL
{
  return self->_articleRecirculationConfigurationURL != 0;
}

- (BOOL)hasThumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash != 0;
}

- (BOOL)hasVideoType
{
  return self->_videoType != 0;
}

- (void)clearSportsEventIDs
{
  -[NSMutableArray removeAllObjects](self->_sportsEventIDs, "removeAllObjects");
}

- (void)addSportsEventIDs:(id)a3
{
  NSMutableArray *sportsEventIDs;

  sportsEventIDs = self->_sportsEventIDs;
  if (!sportsEventIDs)
  {
    sportsEventIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_sportsEventIDs = sportsEventIDs;
  }
  -[NSMutableArray addObject:](sportsEventIDs, "addObject:", a3);
}

- (unint64_t)sportsEventIDsCount
{
  return -[NSMutableArray count](self->_sportsEventIDs, "count");
}

- (id)sportsEventIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sportsEventIDs, "objectAtIndex:", a3);
}

+ (Class)sportsEventIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBArticleRecord description](&v3, sel_description), -[NTPBArticleRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *referencedArticleID;
  NSString *title;
  NSString *subtitle;
  NSString *sourceChannelTagID;
  NTPBDate *publishDate;
  $A8E075B7A99374BF2C8CD763302FCDDE has;
  NSString *thumbnailLQURL;
  NSString *primaryAudience;
  NSString *excerptURL;
  NSString *shortExcerpt;
  NSString *accessoryText;
  NSString *contentURL;
  NSString *clusterID;
  NSString *flintDocumentURL;
  NSMutableArray *flintFontResourceIDs;
  NSString *videoURL;
  $A8E075B7A99374BF2C8CD763302FCDDE v21;
  NSMutableArray *iAdCategories;
  NSMutableArray *iAdKeywords;
  NSMutableArray *iAdSectionIDs;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSMutableArray *relatedArticleIDs;
  NSMutableArray *moreFromPublisherArticleIDs;
  NSString *thumbnailURL;
  $A8E075B7A99374BF2C8CD763302FCDDE v30;
  NSString *thumbnailMediumURL;
  NSString *thumbnailHQURL;
  NSString *thumbnailUltraHQURL;
  $A8E075B7A99374BF2C8CD763302FCDDE v34;
  NSString *coverArt;
  NSString *thumbnailWidgetLQURL;
  NSString *thumbnailWidgetLQTaggedURL;
  NSString *thumbnailWidgetURL;
  NSString *thumbnailWidgetTaggedURL;
  NSString *thumbnailWidgetHQURL;
  NSString *thumbnailWidgetHQTaggedURL;
  void *v42;
  NSMutableArray *topics;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  NSString *titleCompact;
  NSString *videoCallToActionTitle;
  NSString *videoCallToActionURL;
  NSMutableArray *publisherSpecifiedArticleIDs;
  NSString *stocksClusterID;
  NSString *stocksMetadata;
  NSString *stocksScores;
  NSMutableArray *experimentalTitles;
  NSString *parentIssueID;
  NSString *language;
  $A8E075B7A99374BF2C8CD763302FCDDE v60;
  NSMutableArray *linkedArticleIDs;
  NSMutableArray *linkedIssueIDs;
  $A8E075B7A99374BF2C8CD763302FCDDE v63;
  NSString *narrativeTrackMetadata;
  NSString *narrativeTrackFullURL;
  NSString *narrativeTrackSampleURL;
  NSString *narrativeTrackTextRanges;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  NSString *layeredCover;
  NSString *thumbnailPrimaryColor;
  NSString *thumbnailBackgroundColor;
  NSString *thumbnailTextColor;
  NSString *thumbnailAccentColor;
  NSMutableArray *authors;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  NSString *videoStillImageURL;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  NSString *routeURL;
  NSData *float16TitleEncoding;
  NSData *float16FullBodyEncoding;
  NSString *articleRecirculationConfigurationURL;
  NSData *thumbnailPerceptualHash;
  NSString *videoType;
  NSMutableArray *sportsEventIDs;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  referencedArticleID = self->_referencedArticleID;
  if (referencedArticleID)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleID, CFSTR("referenced_article_ID"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  sourceChannelTagID = self->_sourceChannelTagID;
  if (sourceChannelTagID)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelTagID, CFSTR("source_channel_tag_ID"));
  publishDate = self->_publishDate;
  if (publishDate)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishDate, "dictionaryRepresentation"), CFSTR("publish_date"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersion), CFSTR("publisher_article_version"));
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersion), CFSTR("backend_article_version"));
  thumbnailLQURL = self->_thumbnailLQURL;
  if (thumbnailLQURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailLQURL, CFSTR("thumbnail_LQ_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailLQMetadata), CFSTR("thumbnail_LQ_metadata"));
  primaryAudience = self->_primaryAudience;
  if (primaryAudience)
    objc_msgSend(v3, "setObject:forKey:", primaryAudience, CFSTR("primary_audience"));
  excerptURL = self->_excerptURL;
  if (excerptURL)
    objc_msgSend(v3, "setObject:forKey:", excerptURL, CFSTR("excerpt_URL"));
  shortExcerpt = self->_shortExcerpt;
  if (shortExcerpt)
    objc_msgSend(v3, "setObject:forKey:", shortExcerpt, CFSTR("short_excerpt"));
  accessoryText = self->_accessoryText;
  if (accessoryText)
    objc_msgSend(v3, "setObject:forKey:", accessoryText, CFSTR("accessory_text"));
  contentURL = self->_contentURL;
  if (contentURL)
    objc_msgSend(v3, "setObject:forKey:", contentURL, CFSTR("content_URL"));
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentType), CFSTR("content_type"));
  clusterID = self->_clusterID;
  if (clusterID)
    objc_msgSend(v3, "setObject:forKey:", clusterID, CFSTR("cluster_ID"));
  flintDocumentURL = self->_flintDocumentURL;
  if (flintDocumentURL)
    objc_msgSend(v3, "setObject:forKey:", flintDocumentURL, CFSTR("flint_document_URL"));
  flintFontResourceIDs = self->_flintFontResourceIDs;
  if (flintFontResourceIDs)
    objc_msgSend(v3, "setObject:forKey:", flintFontResourceIDs, CFSTR("flint_font_resource_IDs"));
  videoURL = self->_videoURL;
  if (videoURL)
    objc_msgSend(v3, "setObject:forKey:", videoURL, CFSTR("video_URL"));
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x400000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundlePaid), CFSTR("is_bundle_paid"));
    v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x1000000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v21 & 0x8000000) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x1000000) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFeatureCandidate), CFSTR("is_feature_candidate"));
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
LABEL_44:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSponsored), CFSTR("is_sponsored"));
LABEL_45:
  iAdCategories = self->_iAdCategories;
  if (iAdCategories)
    objc_msgSend(v3, "setObject:forKey:", iAdCategories, CFSTR("i_ad_categories"));
  iAdKeywords = self->_iAdKeywords;
  if (iAdKeywords)
    objc_msgSend(v3, "setObject:forKey:", iAdKeywords, CFSTR("i_ad_keywords"));
  iAdSectionIDs = self->_iAdSectionIDs;
  if (iAdSectionIDs)
    objc_msgSend(v3, "setObject:forKey:", iAdSectionIDs, CFSTR("i_ad_section_IDs"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDraft), CFSTR("is_draft"));
  relatedArticleIDs = self->_relatedArticleIDs;
  if (relatedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", relatedArticleIDs, CFSTR("related_article_IDs"));
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  if (moreFromPublisherArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", moreFromPublisherArticleIDs, CFSTR("more_from_publisher_article_IDs"));
  thumbnailURL = self->_thumbnailURL;
  if (thumbnailURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailURL, CFSTR("thumbnail_URL"));
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailMetadata), CFSTR("thumbnail_metadata"));
    v30 = self->_has;
  }
  if ((*(_WORD *)&v30 & 0x200) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailFocalFrame), CFSTR("thumbnail_focal_frame"));
  thumbnailMediumURL = self->_thumbnailMediumURL;
  if (thumbnailMediumURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailMediumURL, CFSTR("thumbnail_medium_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailMediumMetadata), CFSTR("thumbnail_medium_metadata"));
  thumbnailHQURL = self->_thumbnailHQURL;
  if (thumbnailHQURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailHQURL, CFSTR("thumbnail_HQ_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailHQMetadata), CFSTR("thumbnail_HQ_metadata"));
  thumbnailUltraHQURL = self->_thumbnailUltraHQURL;
  if (thumbnailUltraHQURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailUltraHQURL, CFSTR("thumbnail_ultra_HQ_URL"));
  v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x4000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailUltraHQMetadata), CFSTR("thumbnail_ultra_HQ_metadata"));
    v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x200000) == 0)
    {
LABEL_79:
      if ((*(_BYTE *)&v34 & 2) == 0)
        goto LABEL_80;
      goto LABEL_207;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x200000) == 0)
  {
    goto LABEL_79;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_storyType), CFSTR("story_type"));
  v34 = self->_has;
  if ((*(_BYTE *)&v34 & 2) == 0)
  {
LABEL_80:
    if ((*(_BYTE *)&v34 & 0x40) == 0)
      goto LABEL_82;
    goto LABEL_81;
  }
LABEL_207:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_behaviorFlags), CFSTR("behavior_flags"));
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_81:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
LABEL_82:
  coverArt = self->_coverArt;
  if (coverArt)
    objc_msgSend(v3, "setObject:forKey:", coverArt, CFSTR("coverArt"));
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaid), CFSTR("is_paid"));
  thumbnailWidgetLQURL = self->_thumbnailWidgetLQURL;
  if (thumbnailWidgetLQURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetLQURL, CFSTR("thumbnail_widget_LQ_URL"));
  thumbnailWidgetLQTaggedURL = self->_thumbnailWidgetLQTaggedURL;
  if (thumbnailWidgetLQTaggedURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetLQTaggedURL, CFSTR("thumbnail_widget_LQ_tagged_URL"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailWidgetLQMetadata), CFSTR("thumbnail_widget_LQ_metadata"));
  thumbnailWidgetURL = self->_thumbnailWidgetURL;
  if (thumbnailWidgetURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetURL, CFSTR("thumbnail_widget_URL"));
  thumbnailWidgetTaggedURL = self->_thumbnailWidgetTaggedURL;
  if (thumbnailWidgetTaggedURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetTaggedURL, CFSTR("thumbnail_widget_tagged_URL"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailWidgetMetadata), CFSTR("thumbnail_widget_metadata"));
  thumbnailWidgetHQURL = self->_thumbnailWidgetHQURL;
  if (thumbnailWidgetHQURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetHQURL, CFSTR("thumbnail_widget_HQ_URL"));
  thumbnailWidgetHQTaggedURL = self->_thumbnailWidgetHQTaggedURL;
  if (thumbnailWidgetHQTaggedURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailWidgetHQTaggedURL, CFSTR("thumbnail_widget_HQ_tagged_URL"));
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_thumbnailWidgetHQMetadata), CFSTR("thumbnail_widget_HQ_metadata"));
  if (-[NSMutableArray count](self->_topics, "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    topics = self->_topics;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v88 != v46)
            objc_enumerationMutation(topics);
          objc_msgSend(v42, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
      }
      while (v45);
    }
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("topics"));

  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](sourceChannelCohorts, "dictionaryRepresentation"), CFSTR("source_channel_cohorts"));
  globalCohorts = self->_globalCohorts;
  if (globalCohorts)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation"), CFSTR("global_cohorts"));
  titleCompact = self->_titleCompact;
  if (titleCompact)
    objc_msgSend(v3, "setObject:forKey:", titleCompact, CFSTR("title_compact"));
  videoCallToActionTitle = self->_videoCallToActionTitle;
  if (videoCallToActionTitle)
    objc_msgSend(v3, "setObject:forKey:", videoCallToActionTitle, CFSTR("video_call_to_action_title"));
  videoCallToActionURL = self->_videoCallToActionURL;
  if (videoCallToActionURL)
    objc_msgSend(v3, "setObject:forKey:", videoCallToActionURL, CFSTR("video_call_to_action_URL"));
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  if (publisherSpecifiedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", publisherSpecifiedArticleIDs, CFSTR("publisher_specified_article_IDs"));
  stocksClusterID = self->_stocksClusterID;
  if (stocksClusterID)
    objc_msgSend(v3, "setObject:forKey:", stocksClusterID, CFSTR("stocks_cluster_ID"));
  stocksMetadata = self->_stocksMetadata;
  if (stocksMetadata)
    objc_msgSend(v3, "setObject:forKey:", stocksMetadata, CFSTR("stocks_metadata"));
  stocksScores = self->_stocksScores;
  if (stocksScores)
    objc_msgSend(v3, "setObject:forKey:", stocksScores, CFSTR("stocks_scores"));
  experimentalTitles = self->_experimentalTitles;
  if (experimentalTitles)
    objc_msgSend(v3, "setObject:forKey:", experimentalTitles, CFSTR("experimental_titles"));
  parentIssueID = self->_parentIssueID;
  if (parentIssueID)
    objc_msgSend(v3, "setObject:forKey:", parentIssueID, CFSTR("parent_issue_ID"));
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  v60 = self->_has;
  if ((*(_DWORD *)&v60 & 0x100000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_role), CFSTR("role"));
    v60 = self->_has;
  }
  if ((*(_BYTE *)&v60 & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_halfLifeMilliseconds), CFSTR("half_life_milliseconds"));
  linkedArticleIDs = self->_linkedArticleIDs;
  if (linkedArticleIDs)
    objc_msgSend(v3, "setObject:forKey:", linkedArticleIDs, CFSTR("linked_article_IDs"));
  linkedIssueIDs = self->_linkedIssueIDs;
  if (linkedIssueIDs)
    objc_msgSend(v3, "setObject:forKey:", linkedIssueIDs, CFSTR("linked_issue_IDs"));
  v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x2000000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isIssueOnly), CFSTR("is_issue_only"));
    v63 = self->_has;
  }
  if ((*(_BYTE *)&v63 & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bodyTextLength), CFSTR("body_text_length"));
  narrativeTrackMetadata = self->_narrativeTrackMetadata;
  if (narrativeTrackMetadata)
    objc_msgSend(v3, "setObject:forKey:", narrativeTrackMetadata, CFSTR("narrative_track_metadata"));
  narrativeTrackFullURL = self->_narrativeTrackFullURL;
  if (narrativeTrackFullURL)
    objc_msgSend(v3, "setObject:forKey:", narrativeTrackFullURL, CFSTR("narrative_track_full_URL"));
  narrativeTrackSampleURL = self->_narrativeTrackSampleURL;
  if (narrativeTrackSampleURL)
    objc_msgSend(v3, "setObject:forKey:", narrativeTrackSampleURL, CFSTR("narrative_track_sample_URL"));
  narrativeTrackTextRanges = self->_narrativeTrackTextRanges;
  if (narrativeTrackTextRanges)
    objc_msgSend(v3, "setObject:forKey:", narrativeTrackTextRanges, CFSTR("narrative_track_text_ranges"));
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](channelConversionStats, "dictionaryRepresentation"), CFSTR("channel_conversion_stats"));
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation"), CFSTR("global_conversion_stats"));
  layeredCover = self->_layeredCover;
  if (layeredCover)
    objc_msgSend(v3, "setObject:forKey:", layeredCover, CFSTR("layered_cover"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_layeredCoverAspectRatio), CFSTR("layered_cover_aspect_ratio"));
  thumbnailPrimaryColor = self->_thumbnailPrimaryColor;
  if (thumbnailPrimaryColor)
    objc_msgSend(v3, "setObject:forKey:", thumbnailPrimaryColor, CFSTR("thumbnail_primary_color"));
  thumbnailBackgroundColor = self->_thumbnailBackgroundColor;
  if (thumbnailBackgroundColor)
    objc_msgSend(v3, "setObject:forKey:", thumbnailBackgroundColor, CFSTR("thumbnail_background_color"));
  thumbnailTextColor = self->_thumbnailTextColor;
  if (thumbnailTextColor)
    objc_msgSend(v3, "setObject:forKey:", thumbnailTextColor, CFSTR("thumbnail_text_color"));
  thumbnailAccentColor = self->_thumbnailAccentColor;
  if (thumbnailAccentColor)
    objc_msgSend(v3, "setObject:forKey:", thumbnailAccentColor, CFSTR("thumbnail_accent_color"));
  authors = self->_authors;
  if (authors)
    objc_msgSend(v3, "setObject:forKey:", authors, CFSTR("authors"));
  channelTagMetadata = self->_channelTagMetadata;
  if (channelTagMetadata)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata dictionaryRepresentation](channelTagMetadata, "dictionaryRepresentation"), CFSTR("channel_tag_metadata"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_halfLifeMillisecondsOverride), CFSTR("half_life_milliseconds_override"));
  videoStillImageURL = self->_videoStillImageURL;
  if (videoStillImageURL)
    objc_msgSend(v3, "setObject:forKey:", videoStillImageURL, CFSTR("video_still_image_URL"));
  expirationData = self->_expirationData;
  if (expirationData)
    objc_msgSend(v3, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration dictionaryRepresentation](expirationData, "dictionaryRepresentation"), CFSTR("expiration_data"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_videoDuration), CFSTR("video_duration"));
  routeURL = self->_routeURL;
  if (routeURL)
    objc_msgSend(v3, "setObject:forKey:", routeURL, CFSTR("route_URL"));
  float16TitleEncoding = self->_float16TitleEncoding;
  if (float16TitleEncoding)
    objc_msgSend(v3, "setObject:forKey:", float16TitleEncoding, CFSTR("float16_title_encoding"));
  float16FullBodyEncoding = self->_float16FullBodyEncoding;
  if (float16FullBodyEncoding)
    objc_msgSend(v3, "setObject:forKey:", float16FullBodyEncoding, CFSTR("float16_full_body_encoding"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_schemaFlags), CFSTR("schema_flags"));
  articleRecirculationConfigurationURL = self->_articleRecirculationConfigurationURL;
  if (articleRecirculationConfigurationURL)
    objc_msgSend(v3, "setObject:forKey:", articleRecirculationConfigurationURL, CFSTR("article_recirculation_configuration_URL"));
  thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
  if (thumbnailPerceptualHash)
    objc_msgSend(v3, "setObject:forKey:", thumbnailPerceptualHash, CFSTR("thumbnail_perceptual_hash"));
  videoType = self->_videoType;
  if (videoType)
    objc_msgSend(v3, "setObject:forKey:", videoType, CFSTR("video_type"));
  sportsEventIDs = self->_sportsEventIDs;
  if (sportsEventIDs)
    objc_msgSend(v3, "setObject:forKey:", sportsEventIDs, CFSTR("sports_event_IDs"));
  return v3;
}

- (void)writeTo:(id)a3
{
  $A8E075B7A99374BF2C8CD763302FCDDE has;
  NSMutableArray *flintFontResourceIDs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $A8E075B7A99374BF2C8CD763302FCDDE v10;
  NSMutableArray *iAdCategories;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *iAdKeywords;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  NSMutableArray *iAdSectionIDs;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  NSMutableArray *relatedArticleIDs;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  NSMutableArray *moreFromPublisherArticleIDs;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t kk;
  $A8E075B7A99374BF2C8CD763302FCDDE v46;
  $A8E075B7A99374BF2C8CD763302FCDDE v47;
  NSMutableArray *topics;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t mm;
  NSMutableArray *publisherSpecifiedArticleIDs;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t nn;
  NSMutableArray *experimentalTitles;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i1;
  $A8E075B7A99374BF2C8CD763302FCDDE v63;
  NSMutableArray *linkedArticleIDs;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i2;
  NSMutableArray *linkedIssueIDs;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i3;
  $A8E075B7A99374BF2C8CD763302FCDDE v74;
  NSMutableArray *authors;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i4;
  NSMutableArray *sportsEventIDs;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i5;
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
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_referencedArticleID)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelTagID)
    PBDataWriterWriteStringField();
  if (self->_publishDate)
    PBDataWriterWriteSubmessage();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailLQURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_primaryAudience)
    PBDataWriterWriteStringField();
  if (self->_excerptURL)
    PBDataWriterWriteStringField();
  if (self->_shortExcerpt)
    PBDataWriterWriteStringField();
  if (self->_accessoryText)
    PBDataWriterWriteStringField();
  if (self->_contentURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_clusterID)
    PBDataWriterWriteStringField();
  if (self->_flintDocumentURL)
    PBDataWriterWriteStringField();
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  flintFontResourceIDs = self->_flintFontResourceIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](flintFontResourceIDs, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v142 != v8)
          objc_enumerationMutation(flintFontResourceIDs);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](flintFontResourceIDs, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    }
    while (v7);
  }
  if (self->_videoURL)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x1000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v10 & 0x8000000) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
LABEL_49:
    PBDataWriterWriteBOOLField();
LABEL_50:
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  iAdCategories = self->_iAdCategories;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v138 != v14)
          objc_enumerationMutation(iAdCategories);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdCategories, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
    }
    while (v13);
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  iAdKeywords = self->_iAdKeywords;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v134;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v134 != v19)
          objc_enumerationMutation(iAdKeywords);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdKeywords, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
    }
    while (v18);
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  iAdSectionIDs = self->_iAdSectionIDs;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdSectionIDs, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v130;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v130 != v24)
          objc_enumerationMutation(iAdSectionIDs);
        PBDataWriterWriteStringField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](iAdSectionIDs, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
    }
    while (v23);
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v126;
    do
    {
      for (n = 0; n != v28; ++n)
      {
        if (*(_QWORD *)v126 != v29)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
    }
    while (v28);
  }
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v122;
    do
    {
      for (ii = 0; ii != v33; ++ii)
      {
        if (*(_QWORD *)v122 != v34)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
    }
    while (v33);
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  relatedArticleIDs = self->_relatedArticleIDs;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](relatedArticleIDs, "countByEnumeratingWithState:objects:count:", &v117, v153, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v118;
    do
    {
      for (jj = 0; jj != v38; ++jj)
      {
        if (*(_QWORD *)v118 != v39)
          objc_enumerationMutation(relatedArticleIDs);
        PBDataWriterWriteStringField();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](relatedArticleIDs, "countByEnumeratingWithState:objects:count:", &v117, v153, 16);
    }
    while (v38);
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](moreFromPublisherArticleIDs, "countByEnumeratingWithState:objects:count:", &v113, v152, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v114;
    do
    {
      for (kk = 0; kk != v43; ++kk)
      {
        if (*(_QWORD *)v114 != v44)
          objc_enumerationMutation(moreFromPublisherArticleIDs);
        PBDataWriterWriteStringField();
      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](moreFromPublisherArticleIDs, "countByEnumeratingWithState:objects:count:", &v113, v152, 16);
    }
    while (v43);
  }
  if (self->_thumbnailURL)
    PBDataWriterWriteStringField();
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v46 = self->_has;
  }
  if ((*(_WORD *)&v46 & 0x200) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailMediumURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailHQURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailUltraHQURL)
    PBDataWriterWriteStringField();
  v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x4000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x200000) == 0)
    {
LABEL_119:
      if ((*(_BYTE *)&v47 & 2) == 0)
        goto LABEL_120;
      goto LABEL_275;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x200000) == 0)
  {
    goto LABEL_119;
  }
  PBDataWriterWriteInt32Field();
  v47 = self->_has;
  if ((*(_BYTE *)&v47 & 2) == 0)
  {
LABEL_120:
    if ((*(_BYTE *)&v47 & 0x40) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
LABEL_275:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_121:
    PBDataWriterWriteInt64Field();
LABEL_122:
  if (self->_coverArt)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_thumbnailWidgetLQURL)
    PBDataWriterWriteStringField();
  if (self->_thumbnailWidgetLQTaggedURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailWidgetURL)
    PBDataWriterWriteStringField();
  if (self->_thumbnailWidgetTaggedURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailWidgetHQURL)
    PBDataWriterWriteStringField();
  if (self->_thumbnailWidgetHQTaggedURL)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteInt64Field();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  topics = self->_topics;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v109, v151, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v110;
    do
    {
      for (mm = 0; mm != v50; ++mm)
      {
        if (*(_QWORD *)v110 != v51)
          objc_enumerationMutation(topics);
        PBDataWriterWriteSubmessage();
      }
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v109, v151, 16);
    }
    while (v50);
  }
  if (self->_sourceChannelCohorts)
    PBDataWriterWriteSubmessage();
  if (self->_globalCohorts)
    PBDataWriterWriteSubmessage();
  if (self->_titleCompact)
    PBDataWriterWriteStringField();
  if (self->_videoCallToActionTitle)
    PBDataWriterWriteStringField();
  if (self->_videoCallToActionURL)
    PBDataWriterWriteStringField();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v105, v150, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v106;
    do
    {
      for (nn = 0; nn != v55; ++nn)
      {
        if (*(_QWORD *)v106 != v56)
          objc_enumerationMutation(publisherSpecifiedArticleIDs);
        PBDataWriterWriteStringField();
      }
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](publisherSpecifiedArticleIDs, "countByEnumeratingWithState:objects:count:", &v105, v150, 16);
    }
    while (v55);
  }
  if (self->_stocksClusterID)
    PBDataWriterWriteStringField();
  if (self->_stocksMetadata)
    PBDataWriterWriteStringField();
  if (self->_stocksScores)
    PBDataWriterWriteStringField();
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  experimentalTitles = self->_experimentalTitles;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experimentalTitles, "countByEnumeratingWithState:objects:count:", &v101, v149, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v102;
    do
    {
      for (i1 = 0; i1 != v60; ++i1)
      {
        if (*(_QWORD *)v102 != v61)
          objc_enumerationMutation(experimentalTitles);
        PBDataWriterWriteStringField();
      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](experimentalTitles, "countByEnumeratingWithState:objects:count:", &v101, v149, 16);
    }
    while (v60);
  }
  if (self->_parentIssueID)
    PBDataWriterWriteStringField();
  if (self->_language)
    PBDataWriterWriteStringField();
  v63 = self->_has;
  if ((*(_DWORD *)&v63 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v63 = self->_has;
  }
  if ((*(_BYTE *)&v63 & 8) != 0)
    PBDataWriterWriteUint64Field();
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  linkedArticleIDs = self->_linkedArticleIDs;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedArticleIDs, "countByEnumeratingWithState:objects:count:", &v97, v148, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v98;
    do
    {
      for (i2 = 0; i2 != v66; ++i2)
      {
        if (*(_QWORD *)v98 != v67)
          objc_enumerationMutation(linkedArticleIDs);
        PBDataWriterWriteStringField();
      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedArticleIDs, "countByEnumeratingWithState:objects:count:", &v97, v148, 16);
    }
    while (v66);
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  linkedIssueIDs = self->_linkedIssueIDs;
  v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedIssueIDs, "countByEnumeratingWithState:objects:count:", &v93, v147, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v94;
    do
    {
      for (i3 = 0; i3 != v71; ++i3)
      {
        if (*(_QWORD *)v94 != v72)
          objc_enumerationMutation(linkedIssueIDs);
        PBDataWriterWriteStringField();
      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](linkedIssueIDs, "countByEnumeratingWithState:objects:count:", &v93, v147, 16);
    }
    while (v71);
  }
  v74 = self->_has;
  if ((*(_DWORD *)&v74 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v74 = self->_has;
  }
  if ((*(_BYTE *)&v74 & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_narrativeTrackMetadata)
    PBDataWriterWriteStringField();
  if (self->_narrativeTrackFullURL)
    PBDataWriterWriteStringField();
  if (self->_narrativeTrackSampleURL)
    PBDataWriterWriteStringField();
  if (self->_narrativeTrackTextRanges)
    PBDataWriterWriteStringField();
  if (self->_channelConversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_globalConversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_layeredCover)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_thumbnailPrimaryColor)
    PBDataWriterWriteStringField();
  if (self->_thumbnailBackgroundColor)
    PBDataWriterWriteStringField();
  if (self->_thumbnailTextColor)
    PBDataWriterWriteStringField();
  if (self->_thumbnailAccentColor)
    PBDataWriterWriteStringField();
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  authors = self->_authors;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v89, v146, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v90;
    do
    {
      for (i4 = 0; i4 != v77; ++i4)
      {
        if (*(_QWORD *)v90 != v78)
          objc_enumerationMutation(authors);
        PBDataWriterWriteStringField();
      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v89, v146, 16);
    }
    while (v77);
  }
  if (self->_channelTagMetadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_videoStillImageURL)
    PBDataWriterWriteStringField();
  if (self->_expirationData)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_routeURL)
    PBDataWriterWriteStringField();
  if (self->_float16TitleEncoding)
    PBDataWriterWriteDataField();
  if (self->_float16FullBodyEncoding)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_articleRecirculationConfigurationURL)
    PBDataWriterWriteStringField();
  if (self->_thumbnailPerceptualHash)
    PBDataWriterWriteDataField();
  if (self->_videoType)
    PBDataWriterWriteStringField();
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  sportsEventIDs = self->_sportsEventIDs;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sportsEventIDs, "countByEnumeratingWithState:objects:count:", &v85, v145, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v86;
    do
    {
      for (i5 = 0; i5 != v82; ++i5)
      {
        if (*(_QWORD *)v86 != v83)
          objc_enumerationMutation(sportsEventIDs);
        PBDataWriterWriteStringField();
      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sportsEventIDs, "countByEnumeratingWithState:objects:count:", &v85, v145, 16);
    }
    while (v82);
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *referencedArticleID;
  NSString *title;
  NSString *subtitle;
  NSString *sourceChannelTagID;
  NTPBDate *publishDate;
  $A8E075B7A99374BF2C8CD763302FCDDE has;
  int v13;
  NSString *thumbnailLQURL;
  int v15;
  NSString *primaryAudience;
  NSString *excerptURL;
  NSString *shortExcerpt;
  NSString *accessoryText;
  NSString *contentURL;
  int v21;
  NSString *clusterID;
  NSString *flintDocumentURL;
  NSMutableArray *flintFontResourceIDs;
  NSString *videoURL;
  $A8E075B7A99374BF2C8CD763302FCDDE v26;
  int v27;
  NSMutableArray *iAdCategories;
  NSMutableArray *iAdKeywords;
  NSMutableArray *iAdSectionIDs;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  int v33;
  NSMutableArray *relatedArticleIDs;
  NSMutableArray *moreFromPublisherArticleIDs;
  NSString *thumbnailURL;
  $A8E075B7A99374BF2C8CD763302FCDDE v37;
  int v38;
  NSString *thumbnailMediumURL;
  int v40;
  NSString *thumbnailHQURL;
  int v42;
  NSString *thumbnailUltraHQURL;
  int v44;
  NSString *coverArt;
  int v46;
  NSString *thumbnailWidgetLQURL;
  NSString *thumbnailWidgetLQTaggedURL;
  int v49;
  NSString *thumbnailWidgetURL;
  NSString *thumbnailWidgetTaggedURL;
  int v52;
  NSString *thumbnailWidgetHQURL;
  NSString *thumbnailWidgetHQTaggedURL;
  int v55;
  NSMutableArray *topics;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  NSString *titleCompact;
  NSString *videoCallToActionTitle;
  NSString *videoCallToActionURL;
  NSMutableArray *publisherSpecifiedArticleIDs;
  NSString *stocksClusterID;
  NSString *stocksMetadata;
  NSString *stocksScores;
  NSMutableArray *experimentalTitles;
  NSString *parentIssueID;
  NSString *language;
  $A8E075B7A99374BF2C8CD763302FCDDE v69;
  int v70;
  NSMutableArray *linkedArticleIDs;
  NSMutableArray *linkedIssueIDs;
  $A8E075B7A99374BF2C8CD763302FCDDE v73;
  int v74;
  NSString *narrativeTrackMetadata;
  NSString *narrativeTrackFullURL;
  NSString *narrativeTrackSampleURL;
  NSString *narrativeTrackTextRanges;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  NSString *layeredCover;
  int v82;
  NSString *thumbnailPrimaryColor;
  NSString *thumbnailBackgroundColor;
  NSString *thumbnailTextColor;
  NSString *thumbnailAccentColor;
  NSMutableArray *authors;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  int v89;
  NSString *videoStillImageURL;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  int v92;
  NSString *routeURL;
  NSData *float16TitleEncoding;
  NSData *float16FullBodyEncoding;
  int v96;
  NSString *articleRecirculationConfigurationURL;
  NSData *thumbnailPerceptualHash;
  NSString *videoType;
  NSMutableArray *sportsEventIDs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 24)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      referencedArticleID = self->_referencedArticleID;
      if (!((unint64_t)referencedArticleID | *((_QWORD *)a3 + 57))
        || (v5 = -[NSString isEqual:](referencedArticleID, "isEqual:")) != 0)
      {
        title = self->_title;
        if (!((unint64_t)title | *((_QWORD *)a3 + 86)) || (v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
        {
          subtitle = self->_subtitle;
          if (!((unint64_t)subtitle | *((_QWORD *)a3 + 69))
            || (v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
          {
            sourceChannelTagID = self->_sourceChannelTagID;
            if (!((unint64_t)sourceChannelTagID | *((_QWORD *)a3 + 63))
              || (v5 = -[NSString isEqual:](sourceChannelTagID, "isEqual:")) != 0)
            {
              publishDate = self->_publishDate;
              if (!((unint64_t)publishDate | *((_QWORD *)a3 + 55))
                || (v5 = -[NTPBDate isEqual:](publishDate, "isEqual:")) != 0)
              {
                has = self->_has;
                v13 = *((_DWORD *)a3 + 190);
                if ((*(_BYTE *)&has & 0x80) != 0)
                {
                  if ((v13 & 0x80) == 0 || self->_publisherArticleVersion != *((_QWORD *)a3 + 8))
                    goto LABEL_75;
                }
                else if ((v13 & 0x80) != 0)
                {
                  goto LABEL_75;
                }
                if ((*(_BYTE *)&has & 1) != 0)
                {
                  if ((v13 & 1) == 0 || self->_backendArticleVersion != *((_QWORD *)a3 + 1))
                    goto LABEL_75;
                }
                else if ((v13 & 1) != 0)
                {
                  goto LABEL_75;
                }
                thumbnailLQURL = self->_thumbnailLQURL;
                if ((unint64_t)thumbnailLQURL | *((_QWORD *)a3 + 73))
                {
                  v5 = -[NSString isEqual:](thumbnailLQURL, "isEqual:");
                  if (!v5)
                    return v5;
                  has = self->_has;
                }
                v15 = *((_DWORD *)a3 + 190);
                if ((*(_WORD *)&has & 0x800) != 0)
                {
                  if ((v15 & 0x800) == 0 || self->_thumbnailLQMetadata != *((_QWORD *)a3 + 12))
                    goto LABEL_75;
                }
                else if ((v15 & 0x800) != 0)
                {
                  goto LABEL_75;
                }
                primaryAudience = self->_primaryAudience;
                if (!((unint64_t)primaryAudience | *((_QWORD *)a3 + 54))
                  || (v5 = -[NSString isEqual:](primaryAudience, "isEqual:")) != 0)
                {
                  excerptURL = self->_excerptURL;
                  if (!((unint64_t)excerptURL | *((_QWORD *)a3 + 32))
                    || (v5 = -[NSString isEqual:](excerptURL, "isEqual:")) != 0)
                  {
                    shortExcerpt = self->_shortExcerpt;
                    if (!((unint64_t)shortExcerpt | *((_QWORD *)a3 + 61))
                      || (v5 = -[NSString isEqual:](shortExcerpt, "isEqual:")) != 0)
                    {
                      accessoryText = self->_accessoryText;
                      if (!((unint64_t)accessoryText | *((_QWORD *)a3 + 20))
                        || (v5 = -[NSString isEqual:](accessoryText, "isEqual:")) != 0)
                      {
                        contentURL = self->_contentURL;
                        if (!((unint64_t)contentURL | *((_QWORD *)a3 + 30))
                          || (v5 = -[NSString isEqual:](contentURL, "isEqual:")) != 0)
                        {
                          v21 = *((_DWORD *)a3 + 190);
                          if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
                          {
                            if ((v21 & 0x80000) == 0 || self->_contentType != *((_DWORD *)a3 + 58))
                              goto LABEL_75;
                          }
                          else if ((v21 & 0x80000) != 0)
                          {
                            goto LABEL_75;
                          }
                          clusterID = self->_clusterID;
                          if (!((unint64_t)clusterID | *((_QWORD *)a3 + 28))
                            || (v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
                          {
                            flintDocumentURL = self->_flintDocumentURL;
                            if (!((unint64_t)flintDocumentURL | *((_QWORD *)a3 + 35))
                              || (v5 = -[NSString isEqual:](flintDocumentURL, "isEqual:")) != 0)
                            {
                              flintFontResourceIDs = self->_flintFontResourceIDs;
                              if (!((unint64_t)flintFontResourceIDs | *((_QWORD *)a3 + 36))
                                || (v5 = -[NSMutableArray isEqual:](flintFontResourceIDs, "isEqual:")) != 0)
                              {
                                videoURL = self->_videoURL;
                                if (!((unint64_t)videoURL | *((_QWORD *)a3 + 93))
                                  || (v5 = -[NSString isEqual:](videoURL, "isEqual:")) != 0)
                                {
                                  v26 = self->_has;
                                  v27 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v26 & 0x400000) != 0)
                                  {
                                    if ((v27 & 0x400000) == 0)
                                      goto LABEL_75;
                                    if (self->_isBundlePaid)
                                    {
                                      if (!*((_BYTE *)a3 + 752))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 752))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x400000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v26 & 0x1000000) != 0)
                                  {
                                    if ((v27 & 0x1000000) == 0)
                                      goto LABEL_75;
                                    if (self->_isFeatureCandidate)
                                    {
                                      if (!*((_BYTE *)a3 + 754))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 754))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x1000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v26 & 0x8000000) != 0)
                                  {
                                    if ((v27 & 0x8000000) == 0)
                                      goto LABEL_75;
                                    if (self->_isSponsored)
                                    {
                                      if (!*((_BYTE *)a3 + 757))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 757))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v27 & 0x8000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  iAdCategories = self->_iAdCategories;
                                  if ((unint64_t)iAdCategories | *((_QWORD *)a3 + 41))
                                  {
                                    v5 = -[NSMutableArray isEqual:](iAdCategories, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  iAdKeywords = self->_iAdKeywords;
                                  if ((unint64_t)iAdKeywords | *((_QWORD *)a3 + 42))
                                  {
                                    v5 = -[NSMutableArray isEqual:](iAdKeywords, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  iAdSectionIDs = self->_iAdSectionIDs;
                                  if ((unint64_t)iAdSectionIDs | *((_QWORD *)a3 + 43))
                                  {
                                    v5 = -[NSMutableArray isEqual:](iAdSectionIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  blockedStorefrontIDs = self->_blockedStorefrontIDs;
                                  if ((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 25))
                                  {
                                    v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  allowedStorefrontIDs = self->_allowedStorefrontIDs;
                                  if ((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 21))
                                  {
                                    v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v33 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
                                  {
                                    if ((v33 & 0x800000) == 0)
                                      goto LABEL_75;
                                    if (self->_isDraft)
                                    {
                                      if (!*((_BYTE *)a3 + 753))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 753))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v33 & 0x800000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  relatedArticleIDs = self->_relatedArticleIDs;
                                  if ((unint64_t)relatedArticleIDs | *((_QWORD *)a3 + 58))
                                  {
                                    v5 = -[NSMutableArray isEqual:](relatedArticleIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  moreFromPublisherArticleIDs = self->_moreFromPublisherArticleIDs;
                                  if ((unint64_t)moreFromPublisherArticleIDs | *((_QWORD *)a3 + 48))
                                  {
                                    v5 = -[NSMutableArray isEqual:](moreFromPublisherArticleIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailURL = self->_thumbnailURL;
                                  if ((unint64_t)thumbnailURL | *((_QWORD *)a3 + 78))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v37 = self->_has;
                                  v38 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x2000) != 0)
                                  {
                                    if ((v38 & 0x2000) == 0 || self->_thumbnailMetadata != *((_QWORD *)a3 + 14))
                                      goto LABEL_75;
                                  }
                                  else if ((v38 & 0x2000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_WORD *)&v37 & 0x200) != 0)
                                  {
                                    if ((v38 & 0x200) == 0 || self->_thumbnailFocalFrame != *((_QWORD *)a3 + 10))
                                      goto LABEL_75;
                                  }
                                  else if ((v38 & 0x200) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailMediumURL = self->_thumbnailMediumURL;
                                  if ((unint64_t)thumbnailMediumURL | *((_QWORD *)a3 + 74))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailMediumURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                    v37 = self->_has;
                                  }
                                  v40 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x1000) != 0)
                                  {
                                    if ((v40 & 0x1000) == 0 || self->_thumbnailMediumMetadata != *((_QWORD *)a3 + 13))
                                      goto LABEL_75;
                                  }
                                  else if ((v40 & 0x1000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailHQURL = self->_thumbnailHQURL;
                                  if ((unint64_t)thumbnailHQURL | *((_QWORD *)a3 + 72))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailHQURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                    v37 = self->_has;
                                  }
                                  v42 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x400) != 0)
                                  {
                                    if ((v42 & 0x400) == 0 || self->_thumbnailHQMetadata != *((_QWORD *)a3 + 11))
                                      goto LABEL_75;
                                  }
                                  else if ((v42 & 0x400) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailUltraHQURL = self->_thumbnailUltraHQURL;
                                  if ((unint64_t)thumbnailUltraHQURL | *((_QWORD *)a3 + 79))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailUltraHQURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                    v37 = self->_has;
                                  }
                                  v44 = *((_DWORD *)a3 + 190);
                                  if ((*(_WORD *)&v37 & 0x4000) != 0)
                                  {
                                    if ((v44 & 0x4000) == 0 || self->_thumbnailUltraHQMetadata != *((_QWORD *)a3 + 15))
                                      goto LABEL_75;
                                  }
                                  else if ((v44 & 0x4000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_DWORD *)&v37 & 0x200000) != 0)
                                  {
                                    if ((v44 & 0x200000) == 0 || self->_storyType != *((_DWORD *)a3 + 136))
                                      goto LABEL_75;
                                  }
                                  else if ((v44 & 0x200000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_BYTE *)&v37 & 2) != 0)
                                  {
                                    if ((v44 & 2) == 0 || self->_behaviorFlags != *((_QWORD *)a3 + 2))
                                      goto LABEL_75;
                                  }
                                  else if ((v44 & 2) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_BYTE *)&v37 & 0x40) != 0)
                                  {
                                    if ((v44 & 0x40) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 7))
                                      goto LABEL_75;
                                  }
                                  else if ((v44 & 0x40) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  coverArt = self->_coverArt;
                                  if ((unint64_t)coverArt | *((_QWORD *)a3 + 31))
                                  {
                                    v5 = -[NSString isEqual:](coverArt, "isEqual:");
                                    if (!v5)
                                      return v5;
                                    v37 = self->_has;
                                  }
                                  v46 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v37 & 0x4000000) != 0)
                                  {
                                    if ((v46 & 0x4000000) == 0)
                                      goto LABEL_75;
                                    if (self->_isPaid)
                                    {
                                      if (!*((_BYTE *)a3 + 756))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 756))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v46 & 0x4000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetLQURL = self->_thumbnailWidgetLQURL;
                                  if ((unint64_t)thumbnailWidgetLQURL | *((_QWORD *)a3 + 83))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetLQURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailWidgetLQTaggedURL = self->_thumbnailWidgetLQTaggedURL;
                                  if ((unint64_t)thumbnailWidgetLQTaggedURL | *((_QWORD *)a3 + 82))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetLQTaggedURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v49 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
                                  {
                                    if ((v49 & 0x10000) == 0
                                      || self->_thumbnailWidgetLQMetadata != *((_QWORD *)a3 + 17))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v49 & 0x10000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetURL = self->_thumbnailWidgetURL;
                                  if ((unint64_t)thumbnailWidgetURL | *((_QWORD *)a3 + 85))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailWidgetTaggedURL = self->_thumbnailWidgetTaggedURL;
                                  if ((unint64_t)thumbnailWidgetTaggedURL | *((_QWORD *)a3 + 84))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetTaggedURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v52 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
                                  {
                                    if ((v52 & 0x20000) == 0 || self->_thumbnailWidgetMetadata != *((_QWORD *)a3 + 18))
                                      goto LABEL_75;
                                  }
                                  else if ((v52 & 0x20000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailWidgetHQURL = self->_thumbnailWidgetHQURL;
                                  if ((unint64_t)thumbnailWidgetHQURL | *((_QWORD *)a3 + 81))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetHQURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailWidgetHQTaggedURL = self->_thumbnailWidgetHQTaggedURL;
                                  if ((unint64_t)thumbnailWidgetHQTaggedURL | *((_QWORD *)a3 + 80))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailWidgetHQTaggedURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v55 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
                                  {
                                    if ((v55 & 0x8000) == 0 || self->_thumbnailWidgetHQMetadata != *((_QWORD *)a3 + 16))
                                      goto LABEL_75;
                                  }
                                  else if ((v55 & 0x8000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  topics = self->_topics;
                                  if ((unint64_t)topics | *((_QWORD *)a3 + 88))
                                  {
                                    v5 = -[NSMutableArray isEqual:](topics, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  sourceChannelCohorts = self->_sourceChannelCohorts;
                                  if ((unint64_t)sourceChannelCohorts | *((_QWORD *)a3 + 62))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  globalCohorts = self->_globalCohorts;
                                  if ((unint64_t)globalCohorts | *((_QWORD *)a3 + 39))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  titleCompact = self->_titleCompact;
                                  if ((unint64_t)titleCompact | *((_QWORD *)a3 + 87))
                                  {
                                    v5 = -[NSString isEqual:](titleCompact, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  videoCallToActionTitle = self->_videoCallToActionTitle;
                                  if ((unint64_t)videoCallToActionTitle | *((_QWORD *)a3 + 89))
                                  {
                                    v5 = -[NSString isEqual:](videoCallToActionTitle, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  videoCallToActionURL = self->_videoCallToActionURL;
                                  if ((unint64_t)videoCallToActionURL | *((_QWORD *)a3 + 90))
                                  {
                                    v5 = -[NSString isEqual:](videoCallToActionURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  publisherSpecifiedArticleIDs = self->_publisherSpecifiedArticleIDs;
                                  if ((unint64_t)publisherSpecifiedArticleIDs | *((_QWORD *)a3 + 56))
                                  {
                                    v5 = -[NSMutableArray isEqual:](publisherSpecifiedArticleIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  stocksClusterID = self->_stocksClusterID;
                                  if ((unint64_t)stocksClusterID | *((_QWORD *)a3 + 65))
                                  {
                                    v5 = -[NSString isEqual:](stocksClusterID, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  stocksMetadata = self->_stocksMetadata;
                                  if ((unint64_t)stocksMetadata | *((_QWORD *)a3 + 66))
                                  {
                                    v5 = -[NSString isEqual:](stocksMetadata, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  stocksScores = self->_stocksScores;
                                  if ((unint64_t)stocksScores | *((_QWORD *)a3 + 67))
                                  {
                                    v5 = -[NSString isEqual:](stocksScores, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  experimentalTitles = self->_experimentalTitles;
                                  if ((unint64_t)experimentalTitles | *((_QWORD *)a3 + 33))
                                  {
                                    v5 = -[NSMutableArray isEqual:](experimentalTitles, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  parentIssueID = self->_parentIssueID;
                                  if ((unint64_t)parentIssueID | *((_QWORD *)a3 + 53))
                                  {
                                    v5 = -[NSString isEqual:](parentIssueID, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  language = self->_language;
                                  if ((unint64_t)language | *((_QWORD *)a3 + 44))
                                  {
                                    v5 = -[NSString isEqual:](language, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v69 = self->_has;
                                  v70 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v69 & 0x100000) != 0)
                                  {
                                    if ((v70 & 0x100000) == 0 || self->_role != *((_DWORD *)a3 + 118))
                                      goto LABEL_75;
                                  }
                                  else if ((v70 & 0x100000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_BYTE *)&v69 & 8) != 0)
                                  {
                                    if ((v70 & 8) == 0 || self->_halfLifeMilliseconds != *((_QWORD *)a3 + 4))
                                      goto LABEL_75;
                                  }
                                  else if ((v70 & 8) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  linkedArticleIDs = self->_linkedArticleIDs;
                                  if ((unint64_t)linkedArticleIDs | *((_QWORD *)a3 + 46))
                                  {
                                    v5 = -[NSMutableArray isEqual:](linkedArticleIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  linkedIssueIDs = self->_linkedIssueIDs;
                                  if ((unint64_t)linkedIssueIDs | *((_QWORD *)a3 + 47))
                                  {
                                    v5 = -[NSMutableArray isEqual:](linkedIssueIDs, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v73 = self->_has;
                                  v74 = *((_DWORD *)a3 + 190);
                                  if ((*(_DWORD *)&v73 & 0x2000000) != 0)
                                  {
                                    if ((v74 & 0x2000000) == 0)
                                      goto LABEL_75;
                                    if (self->_isIssueOnly)
                                    {
                                      if (!*((_BYTE *)a3 + 755))
                                        goto LABEL_75;
                                    }
                                    else if (*((_BYTE *)a3 + 755))
                                    {
                                      goto LABEL_75;
                                    }
                                  }
                                  else if ((v74 & 0x2000000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  if ((*(_BYTE *)&v73 & 4) != 0)
                                  {
                                    if ((v74 & 4) == 0 || self->_bodyTextLength != *((_QWORD *)a3 + 3))
                                      goto LABEL_75;
                                  }
                                  else if ((v74 & 4) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  narrativeTrackMetadata = self->_narrativeTrackMetadata;
                                  if ((unint64_t)narrativeTrackMetadata | *((_QWORD *)a3 + 50))
                                  {
                                    v5 = -[NSString isEqual:](narrativeTrackMetadata, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  narrativeTrackFullURL = self->_narrativeTrackFullURL;
                                  if ((unint64_t)narrativeTrackFullURL | *((_QWORD *)a3 + 49))
                                  {
                                    v5 = -[NSString isEqual:](narrativeTrackFullURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  narrativeTrackSampleURL = self->_narrativeTrackSampleURL;
                                  if ((unint64_t)narrativeTrackSampleURL | *((_QWORD *)a3 + 51))
                                  {
                                    v5 = -[NSString isEqual:](narrativeTrackSampleURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  narrativeTrackTextRanges = self->_narrativeTrackTextRanges;
                                  if ((unint64_t)narrativeTrackTextRanges | *((_QWORD *)a3 + 52))
                                  {
                                    v5 = -[NSString isEqual:](narrativeTrackTextRanges, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  channelConversionStats = self->_channelConversionStats;
                                  if ((unint64_t)channelConversionStats | *((_QWORD *)a3 + 26))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  globalConversionStats = self->_globalConversionStats;
                                  if ((unint64_t)globalConversionStats | *((_QWORD *)a3 + 40))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  layeredCover = self->_layeredCover;
                                  if ((unint64_t)layeredCover | *((_QWORD *)a3 + 45))
                                  {
                                    v5 = -[NSString isEqual:](layeredCover, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v82 = *((_DWORD *)a3 + 190);
                                  if ((*(_BYTE *)&self->_has & 0x20) != 0)
                                  {
                                    if ((v82 & 0x20) == 0 || self->_layeredCoverAspectRatio != *((double *)a3 + 6))
                                      goto LABEL_75;
                                  }
                                  else if ((v82 & 0x20) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  thumbnailPrimaryColor = self->_thumbnailPrimaryColor;
                                  if ((unint64_t)thumbnailPrimaryColor | *((_QWORD *)a3 + 76))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailPrimaryColor, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailBackgroundColor = self->_thumbnailBackgroundColor;
                                  if ((unint64_t)thumbnailBackgroundColor | *((_QWORD *)a3 + 71))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailBackgroundColor, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailTextColor = self->_thumbnailTextColor;
                                  if ((unint64_t)thumbnailTextColor | *((_QWORD *)a3 + 77))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailTextColor, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  thumbnailAccentColor = self->_thumbnailAccentColor;
                                  if ((unint64_t)thumbnailAccentColor | *((_QWORD *)a3 + 70))
                                  {
                                    v5 = -[NSString isEqual:](thumbnailAccentColor, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  authors = self->_authors;
                                  if ((unint64_t)authors | *((_QWORD *)a3 + 23))
                                  {
                                    v5 = -[NSMutableArray isEqual:](authors, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  channelTagMetadata = self->_channelTagMetadata;
                                  if ((unint64_t)channelTagMetadata | *((_QWORD *)a3 + 27))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](channelTagMetadata, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v89 = *((_DWORD *)a3 + 190);
                                  if ((*(_BYTE *)&self->_has & 0x10) != 0)
                                  {
                                    if ((v89 & 0x10) == 0 || self->_halfLifeMillisecondsOverride != *((_QWORD *)a3 + 5))
                                      goto LABEL_75;
                                  }
                                  else if ((v89 & 0x10) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  videoStillImageURL = self->_videoStillImageURL;
                                  if ((unint64_t)videoStillImageURL | *((_QWORD *)a3 + 91))
                                  {
                                    v5 = -[NSString isEqual:](videoStillImageURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  expirationData = self->_expirationData;
                                  if ((unint64_t)expirationData | *((_QWORD *)a3 + 34))
                                  {
                                    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration isEqual:](expirationData, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v92 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
                                  {
                                    if ((v92 & 0x40000) == 0 || self->_videoDuration != *((double *)a3 + 19))
                                      goto LABEL_75;
                                  }
                                  else if ((v92 & 0x40000) != 0)
                                  {
                                    goto LABEL_75;
                                  }
                                  routeURL = self->_routeURL;
                                  if ((unint64_t)routeURL | *((_QWORD *)a3 + 60))
                                  {
                                    v5 = -[NSString isEqual:](routeURL, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  float16TitleEncoding = self->_float16TitleEncoding;
                                  if ((unint64_t)float16TitleEncoding | *((_QWORD *)a3 + 38))
                                  {
                                    v5 = -[NSData isEqual:](float16TitleEncoding, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  float16FullBodyEncoding = self->_float16FullBodyEncoding;
                                  if ((unint64_t)float16FullBodyEncoding | *((_QWORD *)a3 + 37))
                                  {
                                    v5 = -[NSData isEqual:](float16FullBodyEncoding, "isEqual:");
                                    if (!v5)
                                      return v5;
                                  }
                                  v96 = *((_DWORD *)a3 + 190);
                                  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
                                  {
                                    if ((v96 & 0x100) == 0 || self->_schemaFlags != *((_QWORD *)a3 + 9))
                                      goto LABEL_75;
                                    goto LABEL_301;
                                  }
                                  if ((v96 & 0x100) == 0)
                                  {
LABEL_301:
                                    articleRecirculationConfigurationURL = self->_articleRecirculationConfigurationURL;
                                    if (!((unint64_t)articleRecirculationConfigurationURL | *((_QWORD *)a3 + 22))
                                      || (v5 = -[NSString isEqual:](articleRecirculationConfigurationURL, "isEqual:")) != 0)
                                    {
                                      thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
                                      if (!((unint64_t)thumbnailPerceptualHash | *((_QWORD *)a3 + 75))
                                        || (v5 = -[NSData isEqual:](thumbnailPerceptualHash, "isEqual:")) != 0)
                                      {
                                        videoType = self->_videoType;
                                        if (!((unint64_t)videoType | *((_QWORD *)a3 + 92))
                                          || (v5 = -[NSString isEqual:](videoType, "isEqual:")) != 0)
                                        {
                                          sportsEventIDs = self->_sportsEventIDs;
                                          if ((unint64_t)sportsEventIDs | *((_QWORD *)a3 + 64))
                                            LOBYTE(v5) = -[NSMutableArray isEqual:](sportsEventIDs, "isEqual:");
                                          else
                                            LOBYTE(v5) = 1;
                                        }
                                      }
                                    }
                                    return v5;
                                  }
LABEL_75:
                                  LOBYTE(v5) = 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
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
  $A8E075B7A99374BF2C8CD763302FCDDE has;
  $A8E075B7A99374BF2C8CD763302FCDDE v4;
  $A8E075B7A99374BF2C8CD763302FCDDE v5;
  $A8E075B7A99374BF2C8CD763302FCDDE v6;
  $A8E075B7A99374BF2C8CD763302FCDDE v7;
  $A8E075B7A99374BF2C8CD763302FCDDE v8;
  unint64_t v9;
  double layeredCoverAspectRatio;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  double videoDuration;
  double v19;
  long double v20;
  double v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSUInteger v64;
  NSUInteger v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  uint64_t v69;
  NSUInteger v70;
  NSUInteger v71;
  uint64_t v72;
  NSUInteger v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSUInteger v78;
  uint64_t v79;
  NSUInteger v80;
  uint64_t v81;
  NSUInteger v82;
  uint64_t v83;
  uint64_t v84;
  NSUInteger v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSUInteger v97;
  uint64_t v98;
  NSUInteger v99;
  NSUInteger v100;
  uint64_t v101;
  NSUInteger v102;
  NSUInteger v103;
  NSUInteger v104;
  NSUInteger v105;
  NSUInteger v106;
  uint64_t v107;
  NSUInteger v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  NSUInteger v112;
  NSUInteger v113;
  NSUInteger v114;
  NSUInteger v115;
  unint64_t v116;

  v116 = -[NTPBRecordBase hash](self->_base, "hash");
  v115 = -[NSString hash](self->_referencedArticleID, "hash");
  v114 = -[NSString hash](self->_title, "hash");
  v113 = -[NSString hash](self->_subtitle, "hash");
  v112 = -[NSString hash](self->_sourceChannelTagID, "hash");
  v111 = -[NTPBDate hash](self->_publishDate, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v110 = 2654435761 * self->_publisherArticleVersion;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v110 = 0;
    if ((*(_BYTE *)&has & 1) != 0)
    {
LABEL_3:
      v109 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_6;
    }
  }
  v109 = 0;
LABEL_6:
  v108 = -[NSString hash](self->_thumbnailLQURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    v107 = 2654435761 * self->_thumbnailLQMetadata;
  else
    v107 = 0;
  v106 = -[NSString hash](self->_primaryAudience, "hash");
  v105 = -[NSString hash](self->_excerptURL, "hash");
  v104 = -[NSString hash](self->_shortExcerpt, "hash");
  v103 = -[NSString hash](self->_accessoryText, "hash");
  v102 = -[NSString hash](self->_contentURL, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    v101 = 2654435761 * self->_contentType;
  else
    v101 = 0;
  v100 = -[NSString hash](self->_clusterID, "hash");
  v99 = -[NSString hash](self->_flintDocumentURL, "hash");
  v98 = -[NSMutableArray hash](self->_flintFontResourceIDs, "hash");
  v97 = -[NSString hash](self->_videoURL, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x400000) == 0)
  {
    v96 = 0;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
      goto LABEL_14;
LABEL_17:
    v95 = 0;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v96 = 2654435761 * self->_isBundlePaid;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0)
    goto LABEL_17;
LABEL_14:
  v95 = 2654435761 * self->_isFeatureCandidate;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_15:
    v94 = 2654435761 * self->_isSponsored;
    goto LABEL_19;
  }
LABEL_18:
  v94 = 0;
LABEL_19:
  v93 = -[NSMutableArray hash](self->_iAdCategories, "hash");
  v92 = -[NSMutableArray hash](self->_iAdKeywords, "hash");
  v91 = -[NSMutableArray hash](self->_iAdSectionIDs, "hash");
  v90 = -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  v89 = -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    v88 = 2654435761 * self->_isDraft;
  else
    v88 = 0;
  v87 = -[NSMutableArray hash](self->_relatedArticleIDs, "hash");
  v86 = -[NSMutableArray hash](self->_moreFromPublisherArticleIDs, "hash");
  v85 = -[NSString hash](self->_thumbnailURL, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
    v84 = 2654435761 * self->_thumbnailMetadata;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_24;
  }
  else
  {
    v84 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_24:
      v83 = 2654435761 * self->_thumbnailFocalFrame;
      goto LABEL_27;
    }
  }
  v83 = 0;
LABEL_27:
  v82 = -[NSString hash](self->_thumbnailMediumURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v81 = 2654435761 * self->_thumbnailMediumMetadata;
  else
    v81 = 0;
  v80 = -[NSString hash](self->_thumbnailHQURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    v79 = 2654435761 * self->_thumbnailHQMetadata;
  else
    v79 = 0;
  v78 = -[NSString hash](self->_thumbnailUltraHQURL, "hash");
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    v77 = 2654435761 * self->_thumbnailUltraHQMetadata;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
    {
LABEL_35:
      v76 = 2654435761 * self->_storyType;
      if ((*(_BYTE *)&v6 & 2) != 0)
        goto LABEL_36;
LABEL_40:
      v75 = 0;
      if ((*(_BYTE *)&v6 & 0x40) != 0)
        goto LABEL_37;
      goto LABEL_41;
    }
  }
  else
  {
    v77 = 0;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
      goto LABEL_35;
  }
  v76 = 0;
  if ((*(_BYTE *)&v6 & 2) == 0)
    goto LABEL_40;
LABEL_36:
  v75 = 2654435761 * self->_behaviorFlags;
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
LABEL_37:
    v74 = 2654435761 * self->_minimumNewsVersion;
    goto LABEL_42;
  }
LABEL_41:
  v74 = 0;
LABEL_42:
  v73 = -[NSString hash](self->_coverArt, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
    v72 = 2654435761 * self->_isPaid;
  else
    v72 = 0;
  v71 = -[NSString hash](self->_thumbnailWidgetLQURL, "hash");
  v70 = -[NSString hash](self->_thumbnailWidgetLQTaggedURL, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v69 = 2654435761 * self->_thumbnailWidgetLQMetadata;
  else
    v69 = 0;
  v68 = -[NSString hash](self->_thumbnailWidgetURL, "hash");
  v67 = -[NSString hash](self->_thumbnailWidgetTaggedURL, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v66 = 2654435761 * self->_thumbnailWidgetMetadata;
  else
    v66 = 0;
  v65 = -[NSString hash](self->_thumbnailWidgetHQURL, "hash");
  v64 = -[NSString hash](self->_thumbnailWidgetHQTaggedURL, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v63 = 2654435761 * self->_thumbnailWidgetHQMetadata;
  else
    v63 = 0;
  v62 = -[NSMutableArray hash](self->_topics, "hash");
  v61 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_sourceChannelCohorts, "hash");
  v60 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_globalCohorts, "hash");
  v59 = -[NSString hash](self->_titleCompact, "hash");
  v58 = -[NSString hash](self->_videoCallToActionTitle, "hash");
  v57 = -[NSString hash](self->_videoCallToActionURL, "hash");
  v56 = -[NSMutableArray hash](self->_publisherSpecifiedArticleIDs, "hash");
  v55 = -[NSString hash](self->_stocksClusterID, "hash");
  v54 = -[NSString hash](self->_stocksMetadata, "hash");
  v53 = -[NSString hash](self->_stocksScores, "hash");
  v52 = -[NSMutableArray hash](self->_experimentalTitles, "hash");
  v51 = -[NSString hash](self->_parentIssueID, "hash");
  v50 = -[NSString hash](self->_language, "hash");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) != 0)
  {
    v49 = 2654435761 * self->_role;
    if ((*(_BYTE *)&v7 & 8) != 0)
      goto LABEL_56;
  }
  else
  {
    v49 = 0;
    if ((*(_BYTE *)&v7 & 8) != 0)
    {
LABEL_56:
      v48 = 2654435761u * self->_halfLifeMilliseconds;
      goto LABEL_59;
    }
  }
  v48 = 0;
LABEL_59:
  v47 = -[NSMutableArray hash](self->_linkedArticleIDs, "hash");
  v46 = -[NSMutableArray hash](self->_linkedIssueIDs, "hash");
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) != 0)
  {
    v45 = 2654435761 * self->_isIssueOnly;
    if ((*(_BYTE *)&v8 & 4) != 0)
      goto LABEL_61;
  }
  else
  {
    v45 = 0;
    if ((*(_BYTE *)&v8 & 4) != 0)
    {
LABEL_61:
      v44 = 2654435761 * self->_bodyTextLength;
      goto LABEL_64;
    }
  }
  v44 = 0;
LABEL_64:
  v43 = -[NSString hash](self->_narrativeTrackMetadata, "hash");
  v42 = -[NSString hash](self->_narrativeTrackFullURL, "hash");
  v41 = -[NSString hash](self->_narrativeTrackSampleURL, "hash");
  v40 = -[NSString hash](self->_narrativeTrackTextRanges, "hash");
  v39 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_channelConversionStats, "hash");
  v38 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_globalConversionStats, "hash");
  v37 = -[NSString hash](self->_layeredCover, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    layeredCoverAspectRatio = self->_layeredCoverAspectRatio;
    v11 = -layeredCoverAspectRatio;
    if (layeredCoverAspectRatio >= 0.0)
      v11 = self->_layeredCoverAspectRatio;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v36 = -[NSString hash](self->_thumbnailPrimaryColor, "hash");
  v35 = -[NSString hash](self->_thumbnailBackgroundColor, "hash");
  v34 = -[NSString hash](self->_thumbnailTextColor, "hash");
  v33 = -[NSString hash](self->_thumbnailAccentColor, "hash");
  v32 = -[NSMutableArray hash](self->_authors, "hash");
  v31 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata hash](self->_channelTagMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v14 = 2654435761u * self->_halfLifeMillisecondsOverride;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_videoStillImageURL, "hash");
  v16 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration hash](self->_expirationData, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    videoDuration = self->_videoDuration;
    v19 = -videoDuration;
    if (videoDuration >= 0.0)
      v19 = self->_videoDuration;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  v22 = -[NSString hash](self->_routeURL, "hash");
  v23 = -[NSData hash](self->_float16TitleEncoding, "hash");
  v24 = -[NSData hash](self->_float16FullBodyEncoding, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v25 = 2654435761 * self->_schemaFlags;
  else
    v25 = 0;
  v26 = v115 ^ v116 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v9 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v14 ^ v15 ^ v16 ^ v17 ^ v22 ^ v23;
  v27 = v24 ^ v25 ^ -[NSString hash](self->_articleRecirculationConfigurationURL, "hash");
  v28 = v27 ^ -[NSData hash](self->_thumbnailPerceptualHash, "hash");
  v29 = v28 ^ -[NSString hash](self->_videoType, "hash");
  return v26 ^ v29 ^ -[NSMutableArray hash](self->_sportsEventIDs, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  NTPBDate *publishDate;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
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
  int v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t mm;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  uint64_t v59;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t nn;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i1;
  int v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i2;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i3;
  int v83;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  uint64_t v85;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i4;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  uint64_t v94;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i5;
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
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 24);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBArticleRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 57))
    -[NTPBArticleRecord setReferencedArticleID:](self, "setReferencedArticleID:");
  if (*((_QWORD *)a3 + 86))
    -[NTPBArticleRecord setTitle:](self, "setTitle:");
  if (*((_QWORD *)a3 + 69))
    -[NTPBArticleRecord setSubtitle:](self, "setSubtitle:");
  if (*((_QWORD *)a3 + 63))
    -[NTPBArticleRecord setSourceChannelTagID:](self, "setSourceChannelTagID:");
  publishDate = self->_publishDate;
  v8 = *((_QWORD *)a3 + 55);
  if (publishDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](publishDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBArticleRecord setPublishDate:](self, "setPublishDate:");
  }
  v9 = *((_DWORD *)a3 + 190);
  if ((v9 & 0x80) != 0)
  {
    self->_publisherArticleVersion = *((_QWORD *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    v9 = *((_DWORD *)a3 + 190);
  }
  if ((v9 & 1) != 0)
  {
    self->_backendArticleVersion = *((_QWORD *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 73))
    -[NTPBArticleRecord setThumbnailLQURL:](self, "setThumbnailLQURL:");
  if ((*((_BYTE *)a3 + 761) & 8) != 0)
  {
    self->_thumbnailLQMetadata = *((_QWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)a3 + 54))
    -[NTPBArticleRecord setPrimaryAudience:](self, "setPrimaryAudience:");
  if (*((_QWORD *)a3 + 32))
    -[NTPBArticleRecord setExcerptURL:](self, "setExcerptURL:");
  if (*((_QWORD *)a3 + 61))
    -[NTPBArticleRecord setShortExcerpt:](self, "setShortExcerpt:");
  if (*((_QWORD *)a3 + 20))
    -[NTPBArticleRecord setAccessoryText:](self, "setAccessoryText:");
  if (*((_QWORD *)a3 + 30))
    -[NTPBArticleRecord setContentURL:](self, "setContentURL:");
  if ((*((_BYTE *)a3 + 762) & 8) != 0)
  {
    self->_contentType = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((_QWORD *)a3 + 28))
    -[NTPBArticleRecord setClusterID:](self, "setClusterID:");
  if (*((_QWORD *)a3 + 35))
    -[NTPBArticleRecord setFlintDocumentURL:](self, "setFlintDocumentURL:");
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 36);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v159;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v159 != v13)
          objc_enumerationMutation(v10);
        -[NTPBArticleRecord addFlintFontResourceIDs:](self, "addFlintFontResourceIDs:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
    }
    while (v12);
  }
  if (*((_QWORD *)a3 + 93))
    -[NTPBArticleRecord setVideoURL:](self, "setVideoURL:");
  v15 = *((_DWORD *)a3 + 190);
  if ((v15 & 0x400000) != 0)
  {
    self->_isBundlePaid = *((_BYTE *)a3 + 752);
    *(_DWORD *)&self->_has |= 0x400000u;
    v15 = *((_DWORD *)a3 + 190);
    if ((v15 & 0x1000000) == 0)
    {
LABEL_54:
      if ((v15 & 0x8000000) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  else if ((v15 & 0x1000000) == 0)
  {
    goto LABEL_54;
  }
  self->_isFeatureCandidate = *((_BYTE *)a3 + 754);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)a3 + 190) & 0x8000000) != 0)
  {
LABEL_55:
    self->_isSponsored = *((_BYTE *)a3 + 757);
    *(_DWORD *)&self->_has |= 0x8000000u;
  }
LABEL_56:
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 41);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v155;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v155 != v19)
          objc_enumerationMutation(v16);
        -[NTPBArticleRecord addIAdCategories:](self, "addIAdCategories:", *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
    }
    while (v18);
  }
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v21 = (void *)*((_QWORD *)a3 + 42);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v151;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v151 != v24)
          objc_enumerationMutation(v21);
        -[NTPBArticleRecord addIAdKeywords:](self, "addIAdKeywords:", *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * k));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
    }
    while (v23);
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v26 = (void *)*((_QWORD *)a3 + 43);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v146, v173, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v147;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v147 != v29)
          objc_enumerationMutation(v26);
        -[NTPBArticleRecord addIAdSectionIDs:](self, "addIAdSectionIDs:", *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * m));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v146, v173, 16);
    }
    while (v28);
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v31 = (void *)*((_QWORD *)a3 + 25);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v142, v172, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v143;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v143 != v34)
          objc_enumerationMutation(v31);
        -[NTPBArticleRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * n));
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v142, v172, 16);
    }
    while (v33);
  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v36 = (void *)*((_QWORD *)a3 + 21);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v138, v171, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v139;
    do
    {
      for (ii = 0; ii != v38; ++ii)
      {
        if (*(_QWORD *)v139 != v39)
          objc_enumerationMutation(v36);
        -[NTPBArticleRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * ii));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v138, v171, 16);
    }
    while (v38);
  }
  if ((*((_BYTE *)a3 + 762) & 0x80) != 0)
  {
    self->_isDraft = *((_BYTE *)a3 + 753);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v41 = (void *)*((_QWORD *)a3 + 58);
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v135;
    do
    {
      for (jj = 0; jj != v43; ++jj)
      {
        if (*(_QWORD *)v135 != v44)
          objc_enumerationMutation(v41);
        -[NTPBArticleRecord addRelatedArticleIDs:](self, "addRelatedArticleIDs:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * jj));
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v134, v170, 16);
    }
    while (v43);
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v46 = (void *)*((_QWORD *)a3 + 48);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v130, v169, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v131;
    do
    {
      for (kk = 0; kk != v48; ++kk)
      {
        if (*(_QWORD *)v131 != v49)
          objc_enumerationMutation(v46);
        -[NTPBArticleRecord addMoreFromPublisherArticleIDs:](self, "addMoreFromPublisherArticleIDs:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * kk));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v130, v169, 16);
    }
    while (v48);
  }
  if (*((_QWORD *)a3 + 78))
    -[NTPBArticleRecord setThumbnailURL:](self, "setThumbnailURL:");
  v51 = *((_DWORD *)a3 + 190);
  if ((v51 & 0x2000) != 0)
  {
    self->_thumbnailMetadata = *((_QWORD *)a3 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
    v51 = *((_DWORD *)a3 + 190);
  }
  if ((v51 & 0x200) != 0)
  {
    self->_thumbnailFocalFrame = *((_QWORD *)a3 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)a3 + 74))
    -[NTPBArticleRecord setThumbnailMediumURL:](self, "setThumbnailMediumURL:");
  if ((*((_BYTE *)a3 + 761) & 0x10) != 0)
  {
    self->_thumbnailMediumMetadata = *((_QWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)a3 + 72))
    -[NTPBArticleRecord setThumbnailHQURL:](self, "setThumbnailHQURL:");
  if ((*((_BYTE *)a3 + 761) & 4) != 0)
  {
    self->_thumbnailHQMetadata = *((_QWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)a3 + 79))
    -[NTPBArticleRecord setThumbnailUltraHQURL:](self, "setThumbnailUltraHQURL:");
  v52 = *((_DWORD *)a3 + 190);
  if ((v52 & 0x4000) != 0)
  {
    self->_thumbnailUltraHQMetadata = *((_QWORD *)a3 + 15);
    *(_DWORD *)&self->_has |= 0x4000u;
    v52 = *((_DWORD *)a3 + 190);
    if ((v52 & 0x200000) == 0)
    {
LABEL_125:
      if ((v52 & 2) == 0)
        goto LABEL_126;
      goto LABEL_165;
    }
  }
  else if ((v52 & 0x200000) == 0)
  {
    goto LABEL_125;
  }
  self->_storyType = *((_DWORD *)a3 + 136);
  *(_DWORD *)&self->_has |= 0x200000u;
  v52 = *((_DWORD *)a3 + 190);
  if ((v52 & 2) == 0)
  {
LABEL_126:
    if ((v52 & 0x40) == 0)
      goto LABEL_128;
    goto LABEL_127;
  }
LABEL_165:
  self->_behaviorFlags = *((_QWORD *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 190) & 0x40) != 0)
  {
LABEL_127:
    self->_minimumNewsVersion = *((_QWORD *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_128:
  if (*((_QWORD *)a3 + 31))
    -[NTPBArticleRecord setCoverArt:](self, "setCoverArt:");
  if ((*((_BYTE *)a3 + 763) & 4) != 0)
  {
    self->_isPaid = *((_BYTE *)a3 + 756);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
  if (*((_QWORD *)a3 + 83))
    -[NTPBArticleRecord setThumbnailWidgetLQURL:](self, "setThumbnailWidgetLQURL:");
  if (*((_QWORD *)a3 + 82))
    -[NTPBArticleRecord setThumbnailWidgetLQTaggedURL:](self, "setThumbnailWidgetLQTaggedURL:");
  if ((*((_BYTE *)a3 + 762) & 1) != 0)
  {
    self->_thumbnailWidgetLQMetadata = *((_QWORD *)a3 + 17);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((_QWORD *)a3 + 85))
    -[NTPBArticleRecord setThumbnailWidgetURL:](self, "setThumbnailWidgetURL:");
  if (*((_QWORD *)a3 + 84))
    -[NTPBArticleRecord setThumbnailWidgetTaggedURL:](self, "setThumbnailWidgetTaggedURL:");
  if ((*((_BYTE *)a3 + 762) & 2) != 0)
  {
    self->_thumbnailWidgetMetadata = *((_QWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((_QWORD *)a3 + 81))
    -[NTPBArticleRecord setThumbnailWidgetHQURL:](self, "setThumbnailWidgetHQURL:");
  if (*((_QWORD *)a3 + 80))
    -[NTPBArticleRecord setThumbnailWidgetHQTaggedURL:](self, "setThumbnailWidgetHQTaggedURL:");
  if ((*((_BYTE *)a3 + 761) & 0x80) != 0)
  {
    self->_thumbnailWidgetHQMetadata = *((_QWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v53 = (void *)*((_QWORD *)a3 + 88);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v126, v168, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v127;
    do
    {
      for (mm = 0; mm != v55; ++mm)
      {
        if (*(_QWORD *)v127 != v56)
          objc_enumerationMutation(v53);
        -[NTPBArticleRecord addTopics:](self, "addTopics:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * mm));
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v126, v168, 16);
    }
    while (v55);
  }
  sourceChannelCohorts = self->_sourceChannelCohorts;
  v59 = *((_QWORD *)a3 + 62);
  if (sourceChannelCohorts)
  {
    if (v59)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
  }
  else if (v59)
  {
    -[NTPBArticleRecord setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  globalCohorts = self->_globalCohorts;
  v61 = *((_QWORD *)a3 + 39);
  if (globalCohorts)
  {
    if (v61)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
  }
  else if (v61)
  {
    -[NTPBArticleRecord setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  if (*((_QWORD *)a3 + 87))
    -[NTPBArticleRecord setTitleCompact:](self, "setTitleCompact:");
  if (*((_QWORD *)a3 + 89))
    -[NTPBArticleRecord setVideoCallToActionTitle:](self, "setVideoCallToActionTitle:");
  if (*((_QWORD *)a3 + 90))
    -[NTPBArticleRecord setVideoCallToActionURL:](self, "setVideoCallToActionURL:");
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v62 = (void *)*((_QWORD *)a3 + 56);
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v167, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v123;
    do
    {
      for (nn = 0; nn != v64; ++nn)
      {
        if (*(_QWORD *)v123 != v65)
          objc_enumerationMutation(v62);
        -[NTPBArticleRecord addPublisherSpecifiedArticleIDs:](self, "addPublisherSpecifiedArticleIDs:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * nn));
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v122, v167, 16);
    }
    while (v64);
  }
  if (*((_QWORD *)a3 + 65))
    -[NTPBArticleRecord setStocksClusterID:](self, "setStocksClusterID:");
  if (*((_QWORD *)a3 + 66))
    -[NTPBArticleRecord setStocksMetadata:](self, "setStocksMetadata:");
  if (*((_QWORD *)a3 + 67))
    -[NTPBArticleRecord setStocksScores:](self, "setStocksScores:");
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v67 = (void *)*((_QWORD *)a3 + 33);
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v118, v166, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v119;
    do
    {
      for (i1 = 0; i1 != v69; ++i1)
      {
        if (*(_QWORD *)v119 != v70)
          objc_enumerationMutation(v67);
        -[NTPBArticleRecord addExperimentalTitles:](self, "addExperimentalTitles:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i1));
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v118, v166, 16);
    }
    while (v69);
  }
  if (*((_QWORD *)a3 + 53))
    -[NTPBArticleRecord setParentIssueID:](self, "setParentIssueID:");
  if (*((_QWORD *)a3 + 44))
    -[NTPBArticleRecord setLanguage:](self, "setLanguage:");
  v72 = *((_DWORD *)a3 + 190);
  if ((v72 & 0x100000) != 0)
  {
    self->_role = *((_DWORD *)a3 + 118);
    *(_DWORD *)&self->_has |= 0x100000u;
    v72 = *((_DWORD *)a3 + 190);
  }
  if ((v72 & 8) != 0)
  {
    self->_halfLifeMilliseconds = *((_QWORD *)a3 + 4);
    *(_DWORD *)&self->_has |= 8u;
  }
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v73 = (void *)*((_QWORD *)a3 + 46);
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v114, v165, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v115;
    do
    {
      for (i2 = 0; i2 != v75; ++i2)
      {
        if (*(_QWORD *)v115 != v76)
          objc_enumerationMutation(v73);
        -[NTPBArticleRecord addLinkedArticleIDs:](self, "addLinkedArticleIDs:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i2));
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v114, v165, 16);
    }
    while (v75);
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v78 = (void *)*((_QWORD *)a3 + 47);
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v110, v164, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v111;
    do
    {
      for (i3 = 0; i3 != v80; ++i3)
      {
        if (*(_QWORD *)v111 != v81)
          objc_enumerationMutation(v78);
        -[NTPBArticleRecord addLinkedIssueIDs:](self, "addLinkedIssueIDs:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i3));
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v110, v164, 16);
    }
    while (v80);
  }
  v83 = *((_DWORD *)a3 + 190);
  if ((v83 & 0x2000000) != 0)
  {
    self->_isIssueOnly = *((_BYTE *)a3 + 755);
    *(_DWORD *)&self->_has |= 0x2000000u;
    v83 = *((_DWORD *)a3 + 190);
  }
  if ((v83 & 4) != 0)
  {
    self->_bodyTextLength = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 50))
    -[NTPBArticleRecord setNarrativeTrackMetadata:](self, "setNarrativeTrackMetadata:");
  if (*((_QWORD *)a3 + 49))
    -[NTPBArticleRecord setNarrativeTrackFullURL:](self, "setNarrativeTrackFullURL:");
  if (*((_QWORD *)a3 + 51))
    -[NTPBArticleRecord setNarrativeTrackSampleURL:](self, "setNarrativeTrackSampleURL:");
  if (*((_QWORD *)a3 + 52))
    -[NTPBArticleRecord setNarrativeTrackTextRanges:](self, "setNarrativeTrackTextRanges:");
  channelConversionStats = self->_channelConversionStats;
  v85 = *((_QWORD *)a3 + 26);
  if (channelConversionStats)
  {
    if (v85)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
  }
  else if (v85)
  {
    -[NTPBArticleRecord setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  v87 = *((_QWORD *)a3 + 40);
  if (globalConversionStats)
  {
    if (v87)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
  }
  else if (v87)
  {
    -[NTPBArticleRecord setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
  if (*((_QWORD *)a3 + 45))
    -[NTPBArticleRecord setLayeredCover:](self, "setLayeredCover:");
  if ((*((_BYTE *)a3 + 760) & 0x20) != 0)
  {
    self->_layeredCoverAspectRatio = *((double *)a3 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)a3 + 76))
    -[NTPBArticleRecord setThumbnailPrimaryColor:](self, "setThumbnailPrimaryColor:");
  if (*((_QWORD *)a3 + 71))
    -[NTPBArticleRecord setThumbnailBackgroundColor:](self, "setThumbnailBackgroundColor:");
  if (*((_QWORD *)a3 + 77))
    -[NTPBArticleRecord setThumbnailTextColor:](self, "setThumbnailTextColor:");
  if (*((_QWORD *)a3 + 70))
    -[NTPBArticleRecord setThumbnailAccentColor:](self, "setThumbnailAccentColor:");
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v88 = (void *)*((_QWORD *)a3 + 23);
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v106, v163, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v107;
    do
    {
      for (i4 = 0; i4 != v90; ++i4)
      {
        if (*(_QWORD *)v107 != v91)
          objc_enumerationMutation(v88);
        -[NTPBArticleRecord addAuthors:](self, "addAuthors:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i4));
      }
      v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v106, v163, 16);
    }
    while (v90);
  }
  channelTagMetadata = self->_channelTagMetadata;
  v94 = *((_QWORD *)a3 + 27);
  if (channelTagMetadata)
  {
    if (v94)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](channelTagMetadata, "mergeFrom:");
  }
  else if (v94)
  {
    -[NTPBArticleRecord setChannelTagMetadata:](self, "setChannelTagMetadata:");
  }
  if ((*((_BYTE *)a3 + 760) & 0x10) != 0)
  {
    self->_halfLifeMillisecondsOverride = *((_QWORD *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)a3 + 91))
    -[NTPBArticleRecord setVideoStillImageURL:](self, "setVideoStillImageURL:");
  expirationData = self->_expirationData;
  v96 = *((_QWORD *)a3 + 34);
  if (expirationData)
  {
    if (v96)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration mergeFrom:](expirationData, "mergeFrom:");
  }
  else if (v96)
  {
    -[NTPBArticleRecord setExpirationData:](self, "setExpirationData:");
  }
  if ((*((_BYTE *)a3 + 762) & 4) != 0)
  {
    self->_videoDuration = *((double *)a3 + 19);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((_QWORD *)a3 + 60))
    -[NTPBArticleRecord setRouteURL:](self, "setRouteURL:");
  if (*((_QWORD *)a3 + 38))
    -[NTPBArticleRecord setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:");
  if (*((_QWORD *)a3 + 37))
    -[NTPBArticleRecord setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:");
  if ((*((_BYTE *)a3 + 761) & 1) != 0)
  {
    self->_schemaFlags = *((_QWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 22))
    -[NTPBArticleRecord setArticleRecirculationConfigurationURL:](self, "setArticleRecirculationConfigurationURL:");
  if (*((_QWORD *)a3 + 75))
    -[NTPBArticleRecord setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:");
  if (*((_QWORD *)a3 + 92))
    -[NTPBArticleRecord setVideoType:](self, "setVideoType:");
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v97 = (void *)*((_QWORD *)a3 + 64);
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v102, v162, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v103;
    do
    {
      for (i5 = 0; i5 != v99; ++i5)
      {
        if (*(_QWORD *)v103 != v100)
          objc_enumerationMutation(v97);
        -[NTPBArticleRecord addSportsEventIDs:](self, "addSportsEventIDs:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i5));
      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v102, v162, 16);
    }
    while (v99);
  }
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)excerptURL
{
  return self->_excerptURL;
}

- (NSString)thumbnailWidgetLQTaggedURL
{
  return self->_thumbnailWidgetLQTaggedURL;
}

- (NSString)thumbnailWidgetTaggedURL
{
  return self->_thumbnailWidgetTaggedURL;
}

- (NSString)thumbnailWidgetHQTaggedURL
{
  return self->_thumbnailWidgetHQTaggedURL;
}

- (NSMutableArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (NSString)stocksClusterID
{
  return self->_stocksClusterID;
}

- (NSString)narrativeTrackMetadata
{
  return self->_narrativeTrackMetadata;
}

- (NSString)narrativeTrackSampleURL
{
  return self->_narrativeTrackSampleURL;
}

- (NSString)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

@end
