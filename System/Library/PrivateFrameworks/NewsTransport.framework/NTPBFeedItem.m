@implementation NTPBFeedItem

- (void)dealloc
{
  objc_super v3;

  -[NTPBFeedItem setFeedID:](self, "setFeedID:", 0);
  -[NTPBFeedItem setArticleID:](self, "setArticleID:", 0);
  -[NTPBFeedItem setClusterID:](self, "setClusterID:", 0);
  -[NTPBFeedItem setSourceChannelID:](self, "setSourceChannelID:", 0);
  -[NTPBFeedItem setTopicIDs:](self, "setTopicIDs:", 0);
  -[NTPBFeedItem setParentIssueID:](self, "setParentIssueID:", 0);
  -[NTPBFeedItem setLanguage:](self, "setLanguage:", 0);
  -[NTPBFeedItem setSourceChannelCohorts:](self, "setSourceChannelCohorts:", 0);
  -[NTPBFeedItem setGlobalCohorts:](self, "setGlobalCohorts:", 0);
  -[NTPBFeedItem setChannelConversionStats:](self, "setChannelConversionStats:", 0);
  -[NTPBFeedItem setGlobalConversionStats:](self, "setGlobalConversionStats:", 0);
  -[NTPBFeedItem setChannelTagMetadata:](self, "setChannelTagMetadata:", 0);
  -[NTPBFeedItem setTopics:](self, "setTopics:", 0);
  -[NTPBFeedItem setExpirationData:](self, "setExpirationData:", 0);
  -[NTPBFeedItem setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:", 0);
  -[NTPBFeedItem setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:", 0);
  -[NTPBFeedItem setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:", 0);
  -[NTPBFeedItem setSurfacedByArticleListID2s:](self, "setSurfacedByArticleListID2s:", 0);
  -[NTPBFeedItem setScoreProfiles:](self, "setScoreProfiles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItem;
  -[NTPBFeedItem dealloc](&v3, sel_dealloc);
}

- (BOOL)hasFeedID
{
  return self->_feedID != 0;
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (void)setOrder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasOrder
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPublishDateMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_publishDateMilliseconds = a3;
}

- (void)setHasPublishDateMilliseconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPublishDateMilliseconds
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setFeedHalfLifeMilliseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_feedHalfLifeMilliseconds = a3;
}

- (void)setHasFeedHalfLifeMilliseconds:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFeedHalfLifeMilliseconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGlobalUserFeedback:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_globalUserFeedback = a3;
}

- (void)setHasGlobalUserFeedback:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGlobalUserFeedback
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasSourceChannelID
{
  return self->_sourceChannelID != 0;
}

- (void)setHasThumbnail:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hasThumbnail = a3;
}

- (void)setHasHasThumbnail:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHasThumbnail
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsFromBlockedStorefront:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isFromBlockedStorefront = a3;
}

- (void)setHasIsFromBlockedStorefront:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsFromBlockedStorefront
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsExplicitContent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isExplicitContent = a3;
}

- (void)setHasIsExplicitContent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsExplicitContent
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setContentType:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasContentType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearTopicIDs
{
  -[NSMutableArray removeAllObjects](self->_topicIDs, "removeAllObjects");
}

- (void)addTopicIDs:(id)a3
{
  NSMutableArray *topicIDs;

  topicIDs = self->_topicIDs;
  if (!topicIDs)
  {
    topicIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_topicIDs = topicIDs;
  }
  -[NSMutableArray addObject:](topicIDs, "addObject:", a3);
}

- (unint64_t)topicIDsCount
{
  return -[NSMutableArray count](self->_topicIDs, "count");
}

- (id)topicIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicIDs, "objectAtIndex:", a3);
}

+ (Class)topicIDsType
{
  return (Class)objc_opt_class();
}

- (void)setIsPaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsPaid
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasVideo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hasVideo = a3;
}

- (void)setHasHasVideo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasHasVideo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setIsHiddenFromAutoFavorites:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isHiddenFromAutoFavorites = a3;
}

- (void)setHasIsHiddenFromAutoFavorites:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsHiddenFromAutoFavorites
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasParentIssueID
{
  return self->_parentIssueID != 0;
}

- (void)setIsBundlePaid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isBundlePaid = a3;
}

- (void)setHasIsBundlePaid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsBundlePaid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBodyTextLength:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_bodyTextLength = a3;
}

- (void)setHasBodyTextLength:(BOOL)a3
{
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBodyTextLength
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIsFeatured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isFeatured = a3;
}

- (void)setHasIsFeatured:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsFeatured
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasAudioTrack:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hasAudioTrack = a3;
}

- (void)setHasHasAudioTrack:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHasAudioTrack
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsFeatureCandidate:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isFeatureCandidate = a3;
}

- (void)setHasIsFeatureCandidate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsFeatureCandidate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setReduceVisibility:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_reduceVisibility = a3;
}

- (void)setHasReduceVisibility:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasReduceVisibility
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsIssueOnly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isIssueOnly = a3;
}

- (void)setHasIsIssueOnly:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsIssueOnly
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsEvergreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isEvergreen = a3;
}

- (void)setHasIsEvergreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsEvergreen
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasSourceChannelCohorts
{
  return self->_sourceChannelCohorts != 0;
}

- (BOOL)hasGlobalCohorts
{
  return self->_globalCohorts != 0;
}

- (BOOL)hasChannelConversionStats
{
  return self->_channelConversionStats != 0;
}

- (BOOL)hasGlobalConversionStats
{
  return self->_globalConversionStats != 0;
}

- (BOOL)hasChannelTagMetadata
{
  return self->_channelTagMetadata != 0;
}

- (void)clearTopics
{
  -[NSMutableArray removeAllObjects](self->_topics, "removeAllObjects");
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

- (BOOL)hasExpirationData
{
  return self->_expirationData != 0;
}

- (BOOL)hasFloat16TitleEncoding
{
  return self->_float16TitleEncoding != 0;
}

- (BOOL)hasFloat16FullBodyEncoding
{
  return self->_float16FullBodyEncoding != 0;
}

- (BOOL)hasThumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash != 0;
}

- (void)setIsSponsored:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isSponsored = a3;
}

- (void)setHasIsSponsored:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsSponsored
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasVideoStillImage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasVideoStillImage = a3;
}

- (void)setHasHasVideoStillImage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasHasVideoStillImage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setWebConverted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_webConverted = a3;
}

- (void)setHasWebConverted:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasWebConverted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setReduceVisibilityForNonFollowers:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_reduceVisibilityForNonFollowers = a3;
}

- (void)setHasReduceVisibilityForNonFollowers:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasReduceVisibilityForNonFollowers
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)clearSurfacedByArticleListID2s
{
  -[NSMutableArray removeAllObjects](self->_surfacedByArticleListID2s, "removeAllObjects");
}

- (void)addSurfacedByArticleListID2:(id)a3
{
  NSMutableArray *surfacedByArticleListID2s;

  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  if (!surfacedByArticleListID2s)
  {
    surfacedByArticleListID2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_surfacedByArticleListID2s = surfacedByArticleListID2s;
  }
  -[NSMutableArray addObject:](surfacedByArticleListID2s, "addObject:", a3);
}

- (unint64_t)surfacedByArticleListID2sCount
{
  return -[NSMutableArray count](self->_surfacedByArticleListID2s, "count");
}

- (id)surfacedByArticleListID2AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_surfacedByArticleListID2s, "objectAtIndex:", a3);
}

+ (Class)surfacedByArticleListID2Type
{
  return (Class)objc_opt_class();
}

- (void)setConditionalScore:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_conditionalScore = a3;
}

- (void)setHasConditionalScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConditionalScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsAIGenerated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isAIGenerated = a3;
}

- (void)setHasIsAIGenerated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsAIGenerated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsCoread:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isCoread = a3;
}

- (void)setHasIsCoread:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($6B8E73DA7CC4B9E6BA45EB77898599E8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsCoread
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasScoreProfiles
{
  return self->_scoreProfiles != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBFeedItem description](&v3, sel_description), -[NTPBFeedItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *feedID;
  NSString *articleID;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has;
  NSString *clusterID;
  NSString *sourceChannelID;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v10;
  NSMutableArray *topicIDs;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12;
  NSString *parentIssueID;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14;
  NSString *language;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  void *v21;
  NSMutableArray *topics;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  NSData *float16TitleEncoding;
  NSData *float16FullBodyEncoding;
  NSData *thumbnailPerceptualHash;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v31;
  NSMutableArray *surfacedByArticleListID2s;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v33;
  NTPBScoreProfiles *scoreProfiles;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  feedID = self->_feedID;
  if (feedID)
    objc_msgSend(v3, "setObject:forKey:", feedID, CFSTR("feed_ID"));
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v4, "setObject:forKey:", articleID, CFSTR("article_ID"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_order), CFSTR("order"));
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_8;
      goto LABEL_83;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_publishDateMilliseconds), CFSTR("publish_date_milliseconds"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_83:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_feedHalfLifeMilliseconds), CFSTR("feed_half_life_milliseconds"));
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_globalUserFeedback), CFSTR("global_user_feedback"));
LABEL_10:
  clusterID = self->_clusterID;
  if (clusterID)
    objc_msgSend(v4, "setObject:forKey:", clusterID, CFSTR("cluster_ID"));
  sourceChannelID = self->_sourceChannelID;
  if (sourceChannelID)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelID, CFSTR("source_channel_ID"));
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasThumbnail), CFSTR("has_thumbnail"));
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v10 & 0x20000) == 0)
        goto LABEL_17;
      goto LABEL_87;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFromBlockedStorefront), CFSTR("is_from_blocked_storefront"));
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExplicitContent), CFSTR("is_explicit_content"));
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_88:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_19:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_contentType), CFSTR("content_type"));
LABEL_20:
  topicIDs = self->_topicIDs;
  if (topicIDs)
    objc_msgSend(v4, "setObject:forKey:", topicIDs, CFSTR("topic_IDs"));
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaid), CFSTR("is_paid"));
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x800) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v12 & 0x100) == 0)
        goto LABEL_25;
      goto LABEL_92;
    }
  }
  else if ((*(_WORD *)&v12 & 0x800) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasVideo), CFSTR("has_video"));
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_92:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersion), CFSTR("publisher_article_version"));
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_26:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHiddenFromAutoFavorites), CFSTR("is_hidden_from_auto_favorites"));
LABEL_27:
  parentIssueID = self->_parentIssueID;
  if (parentIssueID)
    objc_msgSend(v4, "setObject:forKey:", parentIssueID, CFSTR("parent_issue_ID"));
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundlePaid), CFSTR("is_bundle_paid"));
    v14 = self->_has;
    if ((*(_BYTE *)&v14 & 1) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v14 & 0x80000) == 0)
        goto LABEL_32;
      goto LABEL_96;
    }
  }
  else if ((*(_BYTE *)&v14 & 1) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_bodyTextLength), CFSTR("body_text_length"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_33;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFeatured), CFSTR("is_featured"));
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v14 & 0x40000) == 0)
      goto LABEL_34;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasAudioTrack), CFSTR("has_audio_track"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_35;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFeatureCandidate), CFSTR("is_feature_candidate"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
      goto LABEL_36;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reduceVisibility), CFSTR("reduce_visibility"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_100:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isIssueOnly), CFSTR("is_issue_only"));
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
LABEL_37:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEvergreen), CFSTR("is_evergreen"));
LABEL_38:
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  sourceChannelCohorts = self->_sourceChannelCohorts;
  if (sourceChannelCohorts)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](sourceChannelCohorts, "dictionaryRepresentation"), CFSTR("source_channel_cohorts"));
  globalCohorts = self->_globalCohorts;
  if (globalCohorts)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](globalCohorts, "dictionaryRepresentation"), CFSTR("global_cohorts"));
  channelConversionStats = self->_channelConversionStats;
  if (channelConversionStats)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](channelConversionStats, "dictionaryRepresentation"), CFSTR("channel_conversion_stats"));
  globalConversionStats = self->_globalConversionStats;
  if (globalConversionStats)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](globalConversionStats, "dictionaryRepresentation"), CFSTR("global_conversion_stats"));
  channelTagMetadata = self->_channelTagMetadata;
  if (channelTagMetadata)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata dictionaryRepresentation](channelTagMetadata, "dictionaryRepresentation"), CFSTR("channel_tag_metadata"));
  if (-[NSMutableArray count](self->_topics, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    topics = self->_topics;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(topics);
          objc_msgSend(v21, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v24);
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("topics"));

  }
  expirationData = self->_expirationData;
  if (expirationData)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration dictionaryRepresentation](expirationData, "dictionaryRepresentation"), CFSTR("expiration_data"));
  float16TitleEncoding = self->_float16TitleEncoding;
  if (float16TitleEncoding)
    objc_msgSend(v4, "setObject:forKey:", float16TitleEncoding, CFSTR("float16_title_encoding"));
  float16FullBodyEncoding = self->_float16FullBodyEncoding;
  if (float16FullBodyEncoding)
    objc_msgSend(v4, "setObject:forKey:", float16FullBodyEncoding, CFSTR("float16_full_body_encoding"));
  thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
  if (thumbnailPerceptualHash)
    objc_msgSend(v4, "setObject:forKey:", thumbnailPerceptualHash, CFSTR("thumbnail_perceptual_hash"));
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x1000000) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSponsored), CFSTR("is_sponsored"));
    v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x1000) == 0)
    {
LABEL_69:
      if ((*(_DWORD *)&v31 & 0x8000000) == 0)
        goto LABEL_70;
      goto LABEL_104;
    }
  }
  else if ((*(_WORD *)&v31 & 0x1000) == 0)
  {
    goto LABEL_69;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasVideoStillImage), CFSTR("has_video_still_image"));
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x8000000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v31 & 0x4000000) == 0)
      goto LABEL_72;
    goto LABEL_71;
  }
LABEL_104:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_webConverted), CFSTR("web_converted"));
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
LABEL_71:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reduceVisibilityForNonFollowers), CFSTR("reduce_visibility_for_non_followers"));
LABEL_72:
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  if (surfacedByArticleListID2s)
    objc_msgSend(v4, "setObject:forKey:", surfacedByArticleListID2s, CFSTR("surfaced_by_article_list_ID_2"));
  v33 = self->_has;
  if ((*(_BYTE *)&v33 & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_conditionalScore), CFSTR("conditional_score"));
    v33 = self->_has;
    if ((*(_WORD *)&v33 & 0x2000) == 0)
    {
LABEL_76:
      if ((*(_WORD *)&v33 & 0x8000) == 0)
        goto LABEL_78;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v33 & 0x2000) == 0)
  {
    goto LABEL_76;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAIGenerated), CFSTR("is_AI_generated"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_77:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoread), CFSTR("is_coread"));
LABEL_78:
  scoreProfiles = self->_scoreProfiles;
  if (scoreProfiles)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBScoreProfiles dictionaryRepresentation](scoreProfiles, "dictionaryRepresentation"), CFSTR("score_profiles"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedItemReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v5;
  NSMutableArray *topicIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v11;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12;
  NSMutableArray *topics;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v18;
  NSMutableArray *surfacedByArticleListID2s;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (self->_feedID)
    PBDataWriterWriteStringField();
  if (self->_articleID)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_8;
      goto LABEL_91;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteDoubleField();
LABEL_10:
  if (self->_clusterID)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelID)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x100000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v5 & 0x20000) == 0)
        goto LABEL_17;
      goto LABEL_95;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v5 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_19:
    PBDataWriterWriteUint64Field();
LABEL_20:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  topicIDs = self->_topicIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(topicIDs);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicIDs, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x800) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&v11 & 0x100) == 0)
        goto LABEL_30;
      goto LABEL_100;
    }
  }
  else if ((*(_WORD *)&v11 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_100:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_31:
    PBDataWriterWriteBOOLField();
LABEL_32:
  if (self->_parentIssueID)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 1) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v12 & 0x80000) == 0)
        goto LABEL_37;
      goto LABEL_104;
    }
  }
  else if ((*(_BYTE *)&v12 & 1) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt64Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v12 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x40000) == 0)
      goto LABEL_39;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v12 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x2000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v12 & 0x400000) == 0)
      goto LABEL_41;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
LABEL_42:
    PBDataWriterWriteBOOLField();
LABEL_43:
  if (self->_language)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelCohorts)
    PBDataWriterWriteSubmessage();
  if (self->_globalCohorts)
    PBDataWriterWriteSubmessage();
  if (self->_channelConversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_globalConversionStats)
    PBDataWriterWriteSubmessage();
  if (self->_channelTagMetadata)
    PBDataWriterWriteSubmessage();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  topics = self->_topics;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(topics);
        PBDataWriterWriteSubmessage();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }
  if (self->_expirationData)
    PBDataWriterWriteSubmessage();
  if (self->_float16TitleEncoding)
    PBDataWriterWriteDataField();
  if (self->_float16FullBodyEncoding)
    PBDataWriterWriteDataField();
  if (self->_thumbnailPerceptualHash)
    PBDataWriterWriteDataField();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x1000) == 0)
    {
LABEL_72:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0)
        goto LABEL_73;
      goto LABEL_112;
    }
  }
  else if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteBOOLField();
  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_73:
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
      goto LABEL_75;
    goto LABEL_74;
  }
LABEL_112:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
LABEL_74:
    PBDataWriterWriteBOOLField();
LABEL_75:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](surfacedByArticleListID2s, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(surfacedByArticleListID2s);
        PBDataWriterWriteStringField();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](surfacedByArticleListID2s, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }
  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v24 = self->_has;
    if ((*(_WORD *)&v24 & 0x2000) == 0)
    {
LABEL_84:
      if ((*(_WORD *)&v24 & 0x8000) == 0)
        goto LABEL_86;
      goto LABEL_85;
    }
  }
  else if ((*(_WORD *)&v24 & 0x2000) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_85:
    PBDataWriterWriteBOOLField();
LABEL_86:
  if (self->_scoreProfiles)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v7;
  NSMutableArray *topicIDs;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v15;
  NSMutableArray *topics;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v22;
  NSMutableArray *surfacedByArticleListID2s;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_feedID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_order;
    *(_DWORD *)(v5 + 252) |= 0x40u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_59;
    }
  }
  else if ((*(_BYTE *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 64) = self->_publishDateMilliseconds;
  *(_DWORD *)(v5 + 252) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_59:
  *(_QWORD *)(v5 + 32) = self->_feedHalfLifeMilliseconds;
  *(_DWORD *)(v5 + 252) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(double *)(v5 + 40) = self->_globalUserFeedback;
    *(_DWORD *)(v5 + 252) |= 0x10u;
  }
LABEL_6:

  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_clusterID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 192) = -[NSString copyWithZone:](self->_sourceChannelID, "copyWithZone:", a3);
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 233) = self->_hasThumbnail;
    *(_DWORD *)(v5 + 252) |= 0x400u;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
    {
LABEL_8:
      if ((*(_DWORD *)&v7 & 0x20000) == 0)
        goto LABEL_9;
      goto LABEL_63;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
    goto LABEL_8;
  }
  *(_BYTE *)(v5 + 243) = self->_isFromBlockedStorefront;
  *(_DWORD *)(v5 + 252) |= 0x100000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v5 + 240) = self->_isExplicitContent;
  *(_DWORD *)(v5 + 252) |= 0x20000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_64:
  *(_QWORD *)(v5 + 48) = self->_minimumNewsVersion;
  *(_DWORD *)(v5 + 252) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 24) = self->_contentType;
    *(_DWORD *)(v5 + 252) |= 4u;
  }
LABEL_12:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  topicIDs = self->_topicIDs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicIDs, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(topicIDs);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopicIDs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topicIDs, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v10);
  }
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 246) = self->_isPaid;
    *(_DWORD *)(v5 + 252) |= 0x800000u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x800) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x100) == 0)
        goto LABEL_22;
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v14 & 0x800) == 0)
  {
    goto LABEL_21;
  }
  *(_BYTE *)(v5 + 234) = self->_hasVideo;
  *(_DWORD *)(v5 + 252) |= 0x800u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_68:
  *(_QWORD *)(v5 + 72) = self->_publisherArticleVersion;
  *(_DWORD *)(v5 + 252) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_23:
    *(_BYTE *)(v5 + 244) = self->_isHiddenFromAutoFavorites;
    *(_DWORD *)(v5 + 252) |= 0x200000u;
  }
LABEL_24:

  *(_QWORD *)(v5 + 168) = -[NSString copyWithZone:](self->_parentIssueID, "copyWithZone:", a3);
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    *(_BYTE *)(v5 + 237) = self->_isBundlePaid;
    *(_DWORD *)(v5 + 252) |= 0x4000u;
    v15 = self->_has;
    if ((*(_BYTE *)&v15 & 1) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v15 & 0x80000) == 0)
        goto LABEL_27;
      goto LABEL_72;
    }
  }
  else if ((*(_BYTE *)&v15 & 1) == 0)
  {
    goto LABEL_26;
  }
  *(_QWORD *)(v5 + 8) = self->_bodyTextLength;
  *(_DWORD *)(v5 + 252) |= 1u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v15 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v5 + 242) = self->_isFeatured;
  *(_DWORD *)(v5 + 252) |= 0x80000u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v15 & 0x40000) == 0)
      goto LABEL_29;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v5 + 232) = self->_hasAudioTrack;
  *(_DWORD *)(v5 + 252) |= 0x200u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v15 & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_75;
  }
LABEL_74:
  *(_BYTE *)(v5 + 241) = self->_isFeatureCandidate;
  *(_DWORD *)(v5 + 252) |= 0x40000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v15 & 0x400000) == 0)
      goto LABEL_31;
    goto LABEL_76;
  }
LABEL_75:
  *(_BYTE *)(v5 + 248) = self->_reduceVisibility;
  *(_DWORD *)(v5 + 252) |= 0x2000000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_76:
  *(_BYTE *)(v5 + 245) = self->_isIssueOnly;
  *(_DWORD *)(v5 + 252) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_32:
    *(_BYTE *)(v5 + 239) = self->_isEvergreen;
    *(_DWORD *)(v5 + 252) |= 0x10000u;
  }
LABEL_33:

  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 184) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_sourceChannelCohorts, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 144) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_globalCohorts, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_channelConversionStats, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 152) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_globalConversionStats, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata copyWithZone:](self->_channelTagMetadata, "copyWithZone:", a3);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  topics = self->_topics;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(topics);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTopics:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](topics, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v18);
  }

  *(_QWORD *)(v5 + 112) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration copyWithZone:](self->_expirationData, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 136) = -[NSData copyWithZone:](self->_float16TitleEncoding, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 128) = -[NSData copyWithZone:](self->_float16FullBodyEncoding, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 208) = -[NSData copyWithZone:](self->_thumbnailPerceptualHash, "copyWithZone:", a3);
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) != 0)
  {
    *(_BYTE *)(v5 + 247) = self->_isSponsored;
    *(_DWORD *)(v5 + 252) |= 0x1000000u;
    v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x1000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v22 & 0x8000000) == 0)
        goto LABEL_43;
      goto LABEL_80;
    }
  }
  else if ((*(_WORD *)&v22 & 0x1000) == 0)
  {
    goto LABEL_42;
  }
  *(_BYTE *)(v5 + 235) = self->_hasVideoStillImage;
  *(_DWORD *)(v5 + 252) |= 0x1000u;
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x8000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v22 & 0x4000000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_80:
  *(_BYTE *)(v5 + 250) = self->_webConverted;
  *(_DWORD *)(v5 + 252) |= 0x8000000u;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_44:
    *(_BYTE *)(v5 + 249) = self->_reduceVisibilityForNonFollowers;
    *(_DWORD *)(v5 + 252) |= 0x4000000u;
  }
LABEL_45:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](surfacedByArticleListID2s, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(surfacedByArticleListID2s);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSurfacedByArticleListID2:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](surfacedByArticleListID2s, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v25);
  }
  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 2) == 0)
  {
    if ((*(_WORD *)&v29 & 0x2000) == 0)
      goto LABEL_54;
LABEL_83:
    *(_BYTE *)(v5 + 236) = self->_isAIGenerated;
    *(_DWORD *)(v5 + 252) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
  *(double *)(v5 + 16) = self->_conditionalScore;
  *(_DWORD *)(v5 + 252) |= 2u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) != 0)
    goto LABEL_83;
LABEL_54:
  if ((*(_WORD *)&v29 & 0x8000) != 0)
  {
LABEL_55:
    *(_BYTE *)(v5 + 238) = self->_isCoread;
    *(_DWORD *)(v5 + 252) |= 0x8000u;
  }
LABEL_56:

  *(_QWORD *)(v5 + 176) = -[NTPBScoreProfiles copyWithZone:](self->_scoreProfiles, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *feedID;
  NSString *articleID;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has;
  int v9;
  NSString *clusterID;
  NSString *sourceChannelID;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12;
  int v13;
  NSMutableArray *topicIDs;
  int v15;
  NSString *parentIssueID;
  int v17;
  NSString *language;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  NSMutableArray *topics;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  NSData *float16TitleEncoding;
  NSData *float16FullBodyEncoding;
  NSData *thumbnailPerceptualHash;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v29;
  int v30;
  NSMutableArray *surfacedByArticleListID2s;
  int v32;
  NTPBScoreProfiles *scoreProfiles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    feedID = self->_feedID;
    if (!((unint64_t)feedID | *((_QWORD *)a3 + 15)) || (v5 = -[NSString isEqual:](feedID, "isEqual:")) != 0)
    {
      articleID = self->_articleID;
      if (!((unint64_t)articleID | *((_QWORD *)a3 + 10))
        || (v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
      {
        has = self->_has;
        v9 = *((_DWORD *)a3 + 63);
        if ((*(_BYTE *)&has & 0x40) != 0)
        {
          if ((v9 & 0x40) == 0 || self->_order != *((_QWORD *)a3 + 7))
            goto LABEL_156;
        }
        else if ((v9 & 0x40) != 0)
        {
          goto LABEL_156;
        }
        if ((*(_BYTE *)&has & 0x80) != 0)
        {
          if ((v9 & 0x80) == 0 || self->_publishDateMilliseconds != *((_QWORD *)a3 + 8))
            goto LABEL_156;
        }
        else if ((v9 & 0x80) != 0)
        {
          goto LABEL_156;
        }
        if ((*(_BYTE *)&has & 8) != 0)
        {
          if ((v9 & 8) == 0 || self->_feedHalfLifeMilliseconds != *((_QWORD *)a3 + 4))
            goto LABEL_156;
        }
        else if ((v9 & 8) != 0)
        {
          goto LABEL_156;
        }
        if ((*(_BYTE *)&has & 0x10) != 0)
        {
          if ((v9 & 0x10) == 0 || self->_globalUserFeedback != *((double *)a3 + 5))
            goto LABEL_156;
        }
        else if ((v9 & 0x10) != 0)
        {
          goto LABEL_156;
        }
        clusterID = self->_clusterID;
        if (!((unint64_t)clusterID | *((_QWORD *)a3 + 13))
          || (v5 = -[NSString isEqual:](clusterID, "isEqual:")) != 0)
        {
          sourceChannelID = self->_sourceChannelID;
          if (!((unint64_t)sourceChannelID | *((_QWORD *)a3 + 24))
            || (v5 = -[NSString isEqual:](sourceChannelID, "isEqual:")) != 0)
          {
            v12 = self->_has;
            v13 = *((_DWORD *)a3 + 63);
            if ((*(_WORD *)&v12 & 0x400) != 0)
            {
              if ((v13 & 0x400) == 0)
                goto LABEL_156;
              if (self->_hasThumbnail)
              {
                if (!*((_BYTE *)a3 + 233))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 233))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x400) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x100000) != 0)
            {
              if ((v13 & 0x100000) == 0)
                goto LABEL_156;
              if (self->_isFromBlockedStorefront)
              {
                if (!*((_BYTE *)a3 + 243))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 243))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x100000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x20000) != 0)
            {
              if ((v13 & 0x20000) == 0)
                goto LABEL_156;
              if (self->_isExplicitContent)
              {
                if (!*((_BYTE *)a3 + 240))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 240))
              {
                goto LABEL_156;
              }
            }
            else if ((v13 & 0x20000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_BYTE *)&v12 & 0x20) != 0)
            {
              if ((v13 & 0x20) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 6))
                goto LABEL_156;
            }
            else if ((v13 & 0x20) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_BYTE *)&v12 & 4) != 0)
            {
              if ((v13 & 4) == 0 || self->_contentType != *((_QWORD *)a3 + 3))
                goto LABEL_156;
            }
            else if ((v13 & 4) != 0)
            {
              goto LABEL_156;
            }
            topicIDs = self->_topicIDs;
            if ((unint64_t)topicIDs | *((_QWORD *)a3 + 27))
            {
              v5 = -[NSMutableArray isEqual:](topicIDs, "isEqual:");
              if (!v5)
                return v5;
              v12 = self->_has;
            }
            v15 = *((_DWORD *)a3 + 63);
            if ((*(_DWORD *)&v12 & 0x800000) != 0)
            {
              if ((v15 & 0x800000) == 0)
                goto LABEL_156;
              if (self->_isPaid)
              {
                if (!*((_BYTE *)a3 + 246))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 246))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x800000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x800) != 0)
            {
              if ((v15 & 0x800) == 0)
                goto LABEL_156;
              if (self->_hasVideo)
              {
                if (!*((_BYTE *)a3 + 234))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 234))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x800) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x100) != 0)
            {
              if ((v15 & 0x100) == 0 || self->_publisherArticleVersion != *((_QWORD *)a3 + 9))
                goto LABEL_156;
            }
            else if ((v15 & 0x100) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x200000) != 0)
            {
              if ((v15 & 0x200000) == 0)
                goto LABEL_156;
              if (self->_isHiddenFromAutoFavorites)
              {
                if (!*((_BYTE *)a3 + 244))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 244))
              {
                goto LABEL_156;
              }
            }
            else if ((v15 & 0x200000) != 0)
            {
              goto LABEL_156;
            }
            parentIssueID = self->_parentIssueID;
            if ((unint64_t)parentIssueID | *((_QWORD *)a3 + 21))
            {
              v5 = -[NSString isEqual:](parentIssueID, "isEqual:");
              if (!v5)
                return v5;
              v12 = self->_has;
            }
            v17 = *((_DWORD *)a3 + 63);
            if ((*(_WORD *)&v12 & 0x4000) != 0)
            {
              if ((v17 & 0x4000) == 0)
                goto LABEL_156;
              if (self->_isBundlePaid)
              {
                if (!*((_BYTE *)a3 + 237))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 237))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x4000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_BYTE *)&v12 & 1) != 0)
            {
              if ((v17 & 1) == 0 || self->_bodyTextLength != *((_QWORD *)a3 + 1))
                goto LABEL_156;
            }
            else if ((v17 & 1) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x80000) != 0)
            {
              if ((v17 & 0x80000) == 0)
                goto LABEL_156;
              if (self->_isFeatured)
              {
                if (!*((_BYTE *)a3 + 242))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 242))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x80000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_WORD *)&v12 & 0x200) != 0)
            {
              if ((v17 & 0x200) == 0)
                goto LABEL_156;
              if (self->_hasAudioTrack)
              {
                if (!*((_BYTE *)a3 + 232))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 232))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x200) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x40000) != 0)
            {
              if ((v17 & 0x40000) == 0)
                goto LABEL_156;
              if (self->_isFeatureCandidate)
              {
                if (!*((_BYTE *)a3 + 241))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 241))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x40000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x2000000) != 0)
            {
              if ((v17 & 0x2000000) == 0)
                goto LABEL_156;
              if (self->_reduceVisibility)
              {
                if (!*((_BYTE *)a3 + 248))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 248))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x2000000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x400000) != 0)
            {
              if ((v17 & 0x400000) == 0)
                goto LABEL_156;
              if (self->_isIssueOnly)
              {
                if (!*((_BYTE *)a3 + 245))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 245))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x400000) != 0)
            {
              goto LABEL_156;
            }
            if ((*(_DWORD *)&v12 & 0x10000) != 0)
            {
              if ((v17 & 0x10000) == 0)
                goto LABEL_156;
              if (self->_isEvergreen)
              {
                if (!*((_BYTE *)a3 + 239))
                  goto LABEL_156;
              }
              else if (*((_BYTE *)a3 + 239))
              {
                goto LABEL_156;
              }
            }
            else if ((v17 & 0x10000) != 0)
            {
              goto LABEL_156;
            }
            language = self->_language;
            if (!((unint64_t)language | *((_QWORD *)a3 + 20))
              || (v5 = -[NSString isEqual:](language, "isEqual:")) != 0)
            {
              sourceChannelCohorts = self->_sourceChannelCohorts;
              if (!((unint64_t)sourceChannelCohorts | *((_QWORD *)a3 + 23))
                || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](sourceChannelCohorts, "isEqual:")) != 0)
              {
                globalCohorts = self->_globalCohorts;
                if (!((unint64_t)globalCohorts | *((_QWORD *)a3 + 18))
                  || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](globalCohorts, "isEqual:")) != 0)
                {
                  channelConversionStats = self->_channelConversionStats;
                  if (!((unint64_t)channelConversionStats | *((_QWORD *)a3 + 11))
                    || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](channelConversionStats, "isEqual:")) != 0)
                  {
                    globalConversionStats = self->_globalConversionStats;
                    if (!((unint64_t)globalConversionStats | *((_QWORD *)a3 + 19))
                      || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](globalConversionStats, "isEqual:")) != 0)
                    {
                      channelTagMetadata = self->_channelTagMetadata;
                      if (!((unint64_t)channelTagMetadata | *((_QWORD *)a3 + 12))
                        || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata isEqual:](channelTagMetadata, "isEqual:")) != 0)
                      {
                        topics = self->_topics;
                        if (!((unint64_t)topics | *((_QWORD *)a3 + 28))
                          || (v5 = -[NSMutableArray isEqual:](topics, "isEqual:")) != 0)
                        {
                          expirationData = self->_expirationData;
                          if (!((unint64_t)expirationData | *((_QWORD *)a3 + 14))
                            || (v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration isEqual:](expirationData, "isEqual:")) != 0)
                          {
                            float16TitleEncoding = self->_float16TitleEncoding;
                            if (!((unint64_t)float16TitleEncoding | *((_QWORD *)a3 + 17))
                              || (v5 = -[NSData isEqual:](float16TitleEncoding, "isEqual:")) != 0)
                            {
                              float16FullBodyEncoding = self->_float16FullBodyEncoding;
                              if (!((unint64_t)float16FullBodyEncoding | *((_QWORD *)a3 + 16))
                                || (v5 = -[NSData isEqual:](float16FullBodyEncoding, "isEqual:")) != 0)
                              {
                                thumbnailPerceptualHash = self->_thumbnailPerceptualHash;
                                if (!((unint64_t)thumbnailPerceptualHash | *((_QWORD *)a3 + 26))
                                  || (v5 = -[NSData isEqual:](thumbnailPerceptualHash, "isEqual:")) != 0)
                                {
                                  v29 = self->_has;
                                  v30 = *((_DWORD *)a3 + 63);
                                  if ((*(_DWORD *)&v29 & 0x1000000) != 0)
                                  {
                                    if ((v30 & 0x1000000) == 0)
                                      goto LABEL_156;
                                    if (self->_isSponsored)
                                    {
                                      if (!*((_BYTE *)a3 + 247))
                                        goto LABEL_156;
                                    }
                                    else if (*((_BYTE *)a3 + 247))
                                    {
                                      goto LABEL_156;
                                    }
                                  }
                                  else if ((v30 & 0x1000000) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  if ((*(_WORD *)&v29 & 0x1000) != 0)
                                  {
                                    if ((v30 & 0x1000) == 0)
                                      goto LABEL_156;
                                    if (self->_hasVideoStillImage)
                                    {
                                      if (!*((_BYTE *)a3 + 235))
                                        goto LABEL_156;
                                    }
                                    else if (*((_BYTE *)a3 + 235))
                                    {
                                      goto LABEL_156;
                                    }
                                  }
                                  else if ((v30 & 0x1000) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  if ((*(_DWORD *)&v29 & 0x8000000) != 0)
                                  {
                                    if ((v30 & 0x8000000) == 0)
                                      goto LABEL_156;
                                    if (self->_webConverted)
                                    {
                                      if (!*((_BYTE *)a3 + 250))
                                        goto LABEL_156;
                                    }
                                    else if (*((_BYTE *)a3 + 250))
                                    {
                                      goto LABEL_156;
                                    }
                                  }
                                  else if ((v30 & 0x8000000) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  if ((*(_DWORD *)&v29 & 0x4000000) != 0)
                                  {
                                    if ((v30 & 0x4000000) == 0)
                                      goto LABEL_156;
                                    if (self->_reduceVisibilityForNonFollowers)
                                    {
                                      if (!*((_BYTE *)a3 + 249))
                                        goto LABEL_156;
                                    }
                                    else if (*((_BYTE *)a3 + 249))
                                    {
                                      goto LABEL_156;
                                    }
                                  }
                                  else if ((v30 & 0x4000000) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  surfacedByArticleListID2s = self->_surfacedByArticleListID2s;
                                  if ((unint64_t)surfacedByArticleListID2s | *((_QWORD *)a3 + 25))
                                  {
                                    v5 = -[NSMutableArray isEqual:](surfacedByArticleListID2s, "isEqual:");
                                    if (!v5)
                                      return v5;
                                    v29 = self->_has;
                                  }
                                  v32 = *((_DWORD *)a3 + 63);
                                  if ((*(_BYTE *)&v29 & 2) != 0)
                                  {
                                    if ((v32 & 2) == 0 || self->_conditionalScore != *((double *)a3 + 2))
                                      goto LABEL_156;
                                  }
                                  else if ((v32 & 2) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  if ((*(_WORD *)&v29 & 0x2000) != 0)
                                  {
                                    if ((v32 & 0x2000) == 0)
                                      goto LABEL_156;
                                    if (self->_isAIGenerated)
                                    {
                                      if (!*((_BYTE *)a3 + 236))
                                        goto LABEL_156;
                                    }
                                    else if (*((_BYTE *)a3 + 236))
                                    {
                                      goto LABEL_156;
                                    }
                                  }
                                  else if ((v32 & 0x2000) != 0)
                                  {
                                    goto LABEL_156;
                                  }
                                  if ((*(_WORD *)&v29 & 0x8000) != 0)
                                  {
                                    if ((v32 & 0x8000) != 0)
                                    {
                                      if (self->_isCoread)
                                      {
                                        if (!*((_BYTE *)a3 + 238))
                                          goto LABEL_156;
                                        goto LABEL_240;
                                      }
                                      if (!*((_BYTE *)a3 + 238))
                                      {
LABEL_240:
                                        scoreProfiles = self->_scoreProfiles;
                                        if ((unint64_t)scoreProfiles | *((_QWORD *)a3 + 22))
                                          LOBYTE(v5) = -[NTPBScoreProfiles isEqual:](scoreProfiles, "isEqual:");
                                        else
                                          LOBYTE(v5) = 1;
                                        return v5;
                                      }
                                    }
                                  }
                                  else if ((v32 & 0x8000) == 0)
                                  {
                                    goto LABEL_240;
                                  }
LABEL_156:
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
  $6B8E73DA7CC4B9E6BA45EB77898599E8 has;
  double globalUserFeedback;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v12;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v13;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v14;
  uint64_t v15;
  uint64_t v16;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  $6B8E73DA7CC4B9E6BA45EB77898599E8 v23;
  unint64_t v24;
  double conditionalScore;
  double v26;
  long double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  NSUInteger v66;
  NSUInteger v67;

  v67 = -[NSString hash](self->_feedID, "hash");
  v66 = -[NSString hash](self->_articleID, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    v65 = 2654435761u * self->_order;
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
LABEL_3:
      v64 = 2654435761u * self->_publishDateMilliseconds;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
LABEL_14:
      v63 = 0;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_5;
LABEL_15:
      v62 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v65 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_3;
  }
  v64 = 0;
  if ((*(_BYTE *)&has & 8) == 0)
    goto LABEL_14;
LABEL_4:
  v63 = 2654435761u * self->_feedHalfLifeMilliseconds;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_15;
LABEL_5:
  globalUserFeedback = self->_globalUserFeedback;
  v5 = -globalUserFeedback;
  if (globalUserFeedback >= 0.0)
    v5 = self->_globalUserFeedback;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v62 = v11;
LABEL_16:
  v61 = -[NSString hash](self->_clusterID, "hash");
  v60 = -[NSString hash](self->_sourceChannelID, "hash");
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    v59 = 2654435761 * self->_hasThumbnail;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
    {
LABEL_18:
      v58 = 2654435761 * self->_isFromBlockedStorefront;
      if ((*(_DWORD *)&v12 & 0x20000) != 0)
        goto LABEL_19;
      goto LABEL_24;
    }
  }
  else
  {
    v59 = 0;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_18;
  }
  v58 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_19:
    v57 = 2654435761 * self->_isExplicitContent;
    if ((*(_BYTE *)&v12 & 0x20) != 0)
      goto LABEL_20;
LABEL_25:
    v56 = 0;
    if ((*(_BYTE *)&v12 & 4) != 0)
      goto LABEL_21;
    goto LABEL_26;
  }
LABEL_24:
  v57 = 0;
  if ((*(_BYTE *)&v12 & 0x20) == 0)
    goto LABEL_25;
LABEL_20:
  v56 = 2654435761 * self->_minimumNewsVersion;
  if ((*(_BYTE *)&v12 & 4) != 0)
  {
LABEL_21:
    v55 = 2654435761u * self->_contentType;
    goto LABEL_27;
  }
LABEL_26:
  v55 = 0;
LABEL_27:
  v54 = -[NSMutableArray hash](self->_topicIDs, "hash");
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    v53 = 2654435761 * self->_isPaid;
    if ((*(_WORD *)&v13 & 0x800) != 0)
    {
LABEL_29:
      v52 = 2654435761 * self->_hasVideo;
      if ((*(_WORD *)&v13 & 0x100) != 0)
        goto LABEL_30;
LABEL_34:
      v51 = 0;
      if ((*(_DWORD *)&v13 & 0x200000) != 0)
        goto LABEL_31;
      goto LABEL_35;
    }
  }
  else
  {
    v53 = 0;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_29;
  }
  v52 = 0;
  if ((*(_WORD *)&v13 & 0x100) == 0)
    goto LABEL_34;
LABEL_30:
  v51 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_DWORD *)&v13 & 0x200000) != 0)
  {
LABEL_31:
    v50 = 2654435761 * self->_isHiddenFromAutoFavorites;
    goto LABEL_36;
  }
LABEL_35:
  v50 = 0;
LABEL_36:
  v49 = -[NSString hash](self->_parentIssueID, "hash");
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    v48 = 2654435761 * self->_isBundlePaid;
    if ((*(_BYTE *)&v14 & 1) != 0)
    {
LABEL_38:
      v47 = 2654435761 * self->_bodyTextLength;
      if ((*(_DWORD *)&v14 & 0x80000) != 0)
        goto LABEL_39;
      goto LABEL_47;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_BYTE *)&v14 & 1) != 0)
      goto LABEL_38;
  }
  v47 = 0;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
LABEL_39:
    v46 = 2654435761 * self->_isFeatured;
    if ((*(_WORD *)&v14 & 0x200) != 0)
      goto LABEL_40;
    goto LABEL_48;
  }
LABEL_47:
  v46 = 0;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
LABEL_40:
    v45 = 2654435761 * self->_hasAudioTrack;
    if ((*(_DWORD *)&v14 & 0x40000) != 0)
      goto LABEL_41;
    goto LABEL_49;
  }
LABEL_48:
  v45 = 0;
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
LABEL_41:
    v44 = 2654435761 * self->_isFeatureCandidate;
    if ((*(_DWORD *)&v14 & 0x2000000) != 0)
      goto LABEL_42;
    goto LABEL_50;
  }
LABEL_49:
  v44 = 0;
  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
LABEL_42:
    v43 = 2654435761 * self->_reduceVisibility;
    if ((*(_DWORD *)&v14 & 0x400000) != 0)
      goto LABEL_43;
LABEL_51:
    v42 = 0;
    if ((*(_DWORD *)&v14 & 0x10000) != 0)
      goto LABEL_44;
    goto LABEL_52;
  }
LABEL_50:
  v43 = 0;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
    goto LABEL_51;
LABEL_43:
  v42 = 2654435761 * self->_isIssueOnly;
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
LABEL_44:
    v41 = 2654435761 * self->_isEvergreen;
    goto LABEL_53;
  }
LABEL_52:
  v41 = 0;
LABEL_53:
  v40 = -[NSString hash](self->_language, "hash");
  v39 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_sourceChannelCohorts, "hash");
  v38 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_globalCohorts, "hash");
  v37 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_channelConversionStats, "hash");
  v36 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_globalConversionStats, "hash");
  v35 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata hash](self->_channelTagMetadata, "hash");
  v34 = -[NSMutableArray hash](self->_topics, "hash");
  v33 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration hash](self->_expirationData, "hash");
  v32 = -[NSData hash](self->_float16TitleEncoding, "hash");
  v15 = -[NSData hash](self->_float16FullBodyEncoding, "hash");
  v16 = -[NSData hash](self->_thumbnailPerceptualHash, "hash");
  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0)
  {
    v18 = 2654435761 * self->_isSponsored;
    if ((*(_WORD *)&v17 & 0x1000) != 0)
    {
LABEL_55:
      v19 = 2654435761 * self->_hasVideoStillImage;
      if ((*(_DWORD *)&v17 & 0x8000000) != 0)
        goto LABEL_56;
LABEL_60:
      v20 = 0;
      if ((*(_DWORD *)&v17 & 0x4000000) != 0)
        goto LABEL_57;
      goto LABEL_61;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_WORD *)&v17 & 0x1000) != 0)
      goto LABEL_55;
  }
  v19 = 0;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0)
    goto LABEL_60;
LABEL_56:
  v20 = 2654435761 * self->_webConverted;
  if ((*(_DWORD *)&v17 & 0x4000000) != 0)
  {
LABEL_57:
    v21 = 2654435761 * self->_reduceVisibilityForNonFollowers;
    goto LABEL_62;
  }
LABEL_61:
  v21 = 0;
LABEL_62:
  v22 = -[NSMutableArray hash](self->_surfacedByArticleListID2s, "hash");
  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 2) != 0)
  {
    conditionalScore = self->_conditionalScore;
    v26 = -conditionalScore;
    if (conditionalScore >= 0.0)
      v26 = self->_conditionalScore;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    v29 = 2654435761 * self->_isAIGenerated;
    if ((*(_WORD *)&v23 & 0x8000) != 0)
      goto LABEL_72;
LABEL_74:
    v30 = 0;
    return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v29 ^ v30 ^ -[NTPBScoreProfiles hash](self->_scoreProfiles, "hash");
  }
  v29 = 0;
  if ((*(_WORD *)&v23 & 0x8000) == 0)
    goto LABEL_74;
LABEL_72:
  v30 = 2654435761 * self->_isCoread;
  return v66 ^ v67 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v29 ^ v30 ^ -[NTPBScoreProfiles hash](self->_scoreProfiles, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *sourceChannelCohorts;
  uint64_t v15;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *globalCohorts;
  uint64_t v17;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *channelConversionStats;
  uint64_t v19;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *globalConversionStats;
  uint64_t v21;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata *channelTagMetadata;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration *expirationData;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  int v37;
  NTPBScoreProfiles *scoreProfiles;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 15))
    -[NTPBFeedItem setFeedID:](self, "setFeedID:");
  if (*((_QWORD *)a3 + 10))
    -[NTPBFeedItem setArticleID:](self, "setArticleID:");
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x40) != 0)
  {
    self->_order = *((_QWORD *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
    v5 = *((_DWORD *)a3 + 63);
    if ((v5 & 0x80) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_50;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  self->_publishDateMilliseconds = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_50:
  self->_feedHalfLifeMilliseconds = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 63) & 0x10) != 0)
  {
LABEL_9:
    self->_globalUserFeedback = *((double *)a3 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_10:
  if (*((_QWORD *)a3 + 13))
    -[NTPBFeedItem setClusterID:](self, "setClusterID:");
  if (*((_QWORD *)a3 + 24))
    -[NTPBFeedItem setSourceChannelID:](self, "setSourceChannelID:");
  v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x400) != 0)
  {
    self->_hasThumbnail = *((_BYTE *)a3 + 233);
    *(_DWORD *)&self->_has |= 0x400u;
    v6 = *((_DWORD *)a3 + 63);
    if ((v6 & 0x100000) == 0)
    {
LABEL_16:
      if ((v6 & 0x20000) == 0)
        goto LABEL_17;
      goto LABEL_54;
    }
  }
  else if ((v6 & 0x100000) == 0)
  {
    goto LABEL_16;
  }
  self->_isFromBlockedStorefront = *((_BYTE *)a3 + 243);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x20000) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_55;
  }
LABEL_54:
  self->_isExplicitContent = *((_BYTE *)a3 + 240);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)a3 + 63);
  if ((v6 & 0x20) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_55:
  self->_minimumNewsVersion = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 63) & 4) != 0)
  {
LABEL_19:
    self->_contentType = *((_QWORD *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_20:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 27);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        -[NTPBFeedItem addTopicIDs:](self, "addTopicIDs:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v9);
  }
  v12 = *((_DWORD *)a3 + 63);
  if ((v12 & 0x800000) != 0)
  {
    self->_isPaid = *((_BYTE *)a3 + 246);
    *(_DWORD *)&self->_has |= 0x800000u;
    v12 = *((_DWORD *)a3 + 63);
    if ((v12 & 0x800) == 0)
    {
LABEL_29:
      if ((v12 & 0x100) == 0)
        goto LABEL_30;
      goto LABEL_59;
    }
  }
  else if ((v12 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  self->_hasVideo = *((_BYTE *)a3 + 234);
  *(_DWORD *)&self->_has |= 0x800u;
  v12 = *((_DWORD *)a3 + 63);
  if ((v12 & 0x100) == 0)
  {
LABEL_30:
    if ((v12 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_59:
  self->_publisherArticleVersion = *((_QWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 63) & 0x200000) != 0)
  {
LABEL_31:
    self->_isHiddenFromAutoFavorites = *((_BYTE *)a3 + 244);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_32:
  if (*((_QWORD *)a3 + 21))
    -[NTPBFeedItem setParentIssueID:](self, "setParentIssueID:");
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x4000) != 0)
  {
    self->_isBundlePaid = *((_BYTE *)a3 + 237);
    *(_DWORD *)&self->_has |= 0x4000u;
    v13 = *((_DWORD *)a3 + 63);
    if ((v13 & 1) == 0)
    {
LABEL_36:
      if ((v13 & 0x80000) == 0)
        goto LABEL_37;
      goto LABEL_63;
    }
  }
  else if ((v13 & 1) == 0)
  {
    goto LABEL_36;
  }
  self->_bodyTextLength = *((_QWORD *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x80000) == 0)
  {
LABEL_37:
    if ((v13 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_64;
  }
LABEL_63:
  self->_isFeatured = *((_BYTE *)a3 + 242);
  *(_DWORD *)&self->_has |= 0x80000u;
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x200) == 0)
  {
LABEL_38:
    if ((v13 & 0x40000) == 0)
      goto LABEL_39;
    goto LABEL_65;
  }
LABEL_64:
  self->_hasAudioTrack = *((_BYTE *)a3 + 232);
  *(_DWORD *)&self->_has |= 0x200u;
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x40000) == 0)
  {
LABEL_39:
    if ((v13 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_66;
  }
LABEL_65:
  self->_isFeatureCandidate = *((_BYTE *)a3 + 241);
  *(_DWORD *)&self->_has |= 0x40000u;
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v13 & 0x400000) == 0)
      goto LABEL_41;
    goto LABEL_67;
  }
LABEL_66:
  self->_reduceVisibility = *((_BYTE *)a3 + 248);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v13 = *((_DWORD *)a3 + 63);
  if ((v13 & 0x400000) == 0)
  {
LABEL_41:
    if ((v13 & 0x10000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_67:
  self->_isIssueOnly = *((_BYTE *)a3 + 245);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)a3 + 63) & 0x10000) != 0)
  {
LABEL_42:
    self->_isEvergreen = *((_BYTE *)a3 + 239);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_43:
  if (*((_QWORD *)a3 + 20))
    -[NTPBFeedItem setLanguage:](self, "setLanguage:");
  sourceChannelCohorts = self->_sourceChannelCohorts;
  v15 = *((_QWORD *)a3 + 23);
  if (sourceChannelCohorts)
  {
    if (v15)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](sourceChannelCohorts, "mergeFrom:");
  }
  else if (v15)
  {
    -[NTPBFeedItem setSourceChannelCohorts:](self, "setSourceChannelCohorts:");
  }
  globalCohorts = self->_globalCohorts;
  v17 = *((_QWORD *)a3 + 18);
  if (globalCohorts)
  {
    if (v17)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](globalCohorts, "mergeFrom:");
  }
  else if (v17)
  {
    -[NTPBFeedItem setGlobalCohorts:](self, "setGlobalCohorts:");
  }
  channelConversionStats = self->_channelConversionStats;
  v19 = *((_QWORD *)a3 + 11);
  if (channelConversionStats)
  {
    if (v19)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](channelConversionStats, "mergeFrom:");
  }
  else if (v19)
  {
    -[NTPBFeedItem setChannelConversionStats:](self, "setChannelConversionStats:");
  }
  globalConversionStats = self->_globalConversionStats;
  v21 = *((_QWORD *)a3 + 19);
  if (globalConversionStats)
  {
    if (v21)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](globalConversionStats, "mergeFrom:");
  }
  else if (v21)
  {
    -[NTPBFeedItem setGlobalConversionStats:](self, "setGlobalConversionStats:");
  }
  channelTagMetadata = self->_channelTagMetadata;
  v23 = *((_QWORD *)a3 + 12);
  if (channelTagMetadata)
  {
    if (v23)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata mergeFrom:](channelTagMetadata, "mergeFrom:");
  }
  else if (v23)
  {
    -[NTPBFeedItem setChannelTagMetadata:](self, "setChannelTagMetadata:");
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v24 = (void *)*((_QWORD *)a3 + 28);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        -[NTPBFeedItem addTopics:](self, "addTopics:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v26);
  }
  expirationData = self->_expirationData;
  v30 = *((_QWORD *)a3 + 14);
  if (expirationData)
  {
    if (v30)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration mergeFrom:](expirationData, "mergeFrom:");
  }
  else if (v30)
  {
    -[NTPBFeedItem setExpirationData:](self, "setExpirationData:");
  }
  if (*((_QWORD *)a3 + 17))
    -[NTPBFeedItem setFloat16TitleEncoding:](self, "setFloat16TitleEncoding:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBFeedItem setFloat16FullBodyEncoding:](self, "setFloat16FullBodyEncoding:");
  if (*((_QWORD *)a3 + 26))
    -[NTPBFeedItem setThumbnailPerceptualHash:](self, "setThumbnailPerceptualHash:");
  v31 = *((_DWORD *)a3 + 63);
  if ((v31 & 0x1000000) != 0)
  {
    self->_isSponsored = *((_BYTE *)a3 + 247);
    *(_DWORD *)&self->_has |= 0x1000000u;
    v31 = *((_DWORD *)a3 + 63);
    if ((v31 & 0x1000) == 0)
    {
LABEL_111:
      if ((v31 & 0x8000000) == 0)
        goto LABEL_112;
      goto LABEL_130;
    }
  }
  else if ((v31 & 0x1000) == 0)
  {
    goto LABEL_111;
  }
  self->_hasVideoStillImage = *((_BYTE *)a3 + 235);
  *(_DWORD *)&self->_has |= 0x1000u;
  v31 = *((_DWORD *)a3 + 63);
  if ((v31 & 0x8000000) == 0)
  {
LABEL_112:
    if ((v31 & 0x4000000) == 0)
      goto LABEL_114;
    goto LABEL_113;
  }
LABEL_130:
  self->_webConverted = *((_BYTE *)a3 + 250);
  *(_DWORD *)&self->_has |= 0x8000000u;
  if ((*((_DWORD *)a3 + 63) & 0x4000000) != 0)
  {
LABEL_113:
    self->_reduceVisibilityForNonFollowers = *((_BYTE *)a3 + 249);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_114:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = (void *)*((_QWORD *)a3 + 25);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v32);
        -[NTPBFeedItem addSurfacedByArticleListID2:](self, "addSurfacedByArticleListID2:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v34);
  }
  v37 = *((_DWORD *)a3 + 63);
  if ((v37 & 2) != 0)
  {
    self->_conditionalScore = *((double *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v37 = *((_DWORD *)a3 + 63);
    if ((v37 & 0x2000) == 0)
    {
LABEL_123:
      if ((v37 & 0x8000) == 0)
        goto LABEL_125;
      goto LABEL_124;
    }
  }
  else if ((v37 & 0x2000) == 0)
  {
    goto LABEL_123;
  }
  self->_isAIGenerated = *((_BYTE *)a3 + 236);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)a3 + 63) & 0x8000) != 0)
  {
LABEL_124:
    self->_isCoread = *((_BYTE *)a3 + 238);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_125:
  scoreProfiles = self->_scoreProfiles;
  v39 = *((_QWORD *)a3 + 22);
  if (scoreProfiles)
  {
    if (v39)
      -[NTPBScoreProfiles mergeFrom:](scoreProfiles, "mergeFrom:");
  }
  else if (v39)
  {
    -[NTPBFeedItem setScoreProfiles:](self, "setScoreProfiles:");
  }
}

- (NSString)feedID
{
  return self->_feedID;
}

- (void)setFeedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unint64_t)order
{
  return self->_order;
}

- (unint64_t)publishDateMilliseconds
{
  return self->_publishDateMilliseconds;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  return self->_feedHalfLifeMilliseconds;
}

- (double)globalUserFeedback
{
  return self->_globalUserFeedback;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)sourceChannelID
{
  return self->_sourceChannelID;
}

- (void)setSourceChannelID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (BOOL)isFromBlockedStorefront
{
  return self->_isFromBlockedStorefront;
}

- (BOOL)isExplicitContent
{
  return self->_isExplicitContent;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSMutableArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_isHiddenFromAutoFavorites;
}

- (NSString)parentIssueID
{
  return self->_parentIssueID;
}

- (void)setParentIssueID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)isFeatured
{
  return self->_isFeatured;
}

- (BOOL)hasAudioTrack
{
  return self->_hasAudioTrack;
}

- (BOOL)isFeatureCandidate
{
  return self->_isFeatureCandidate;
}

- (BOOL)reduceVisibility
{
  return self->_reduceVisibility;
}

- (BOOL)isIssueOnly
{
  return self->_isIssueOnly;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)sourceChannelCohorts
{
  return self->_sourceChannelCohorts;
}

- (void)setSourceChannelCohorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (void)setGlobalCohorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)channelConversionStats
{
  return self->_channelConversionStats;
}

- (void)setChannelConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (void)setGlobalConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)channelTagMetadata
{
  return self->_channelTagMetadata;
}

- (void)setChannelTagMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLArticleContentExpiration)expirationData
{
  return self->_expirationData;
}

- (void)setExpirationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (void)setFloat16TitleEncoding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (void)setFloat16FullBodyEncoding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSData)thumbnailPerceptualHash
{
  return self->_thumbnailPerceptualHash;
}

- (void)setThumbnailPerceptualHash:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (BOOL)isSponsored
{
  return self->_isSponsored;
}

- (BOOL)hasVideoStillImage
{
  return self->_hasVideoStillImage;
}

- (BOOL)webConverted
{
  return self->_webConverted;
}

- (BOOL)reduceVisibilityForNonFollowers
{
  return self->_reduceVisibilityForNonFollowers;
}

- (NSMutableArray)surfacedByArticleListID2s
{
  return self->_surfacedByArticleListID2s;
}

- (void)setSurfacedByArticleListID2s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (double)conditionalScore
{
  return self->_conditionalScore;
}

- (BOOL)isAIGenerated
{
  return self->_isAIGenerated;
}

- (BOOL)isCoread
{
  return self->_isCoread;
}

- (NTPBScoreProfiles)scoreProfiles
{
  return self->_scoreProfiles;
}

- (void)setScoreProfiles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

@end
