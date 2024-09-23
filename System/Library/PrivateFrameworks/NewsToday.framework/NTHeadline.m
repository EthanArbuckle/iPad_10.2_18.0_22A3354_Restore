@implementation NTHeadline

- (NTHeadline)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NTHeadline *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *titleCompact;
  uint64_t v11;
  NSString *shortExcerpt;
  uint64_t v13;
  NSDate *ageDisplayDate;
  uint64_t v15;
  NSString *sourceName;
  uint64_t v17;
  NSString *compactSourceName;
  uint64_t v19;
  NSString *sourceTagID;
  uint64_t v21;
  NSString *language;
  uint64_t v23;
  NSURL *sourceNameImageRemoteURL;
  double v25;
  uint64_t v26;
  NSURL *compactSourceNameImageRemoteURL;
  uint64_t v28;
  NSURL *thumbnailRemoteURL;
  uint64_t v30;
  NSString *thumbnailIdentifier;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v37;
  NSURL *NewsURL;
  uint64_t v39;
  NSString *storyType;
  uint64_t v41;
  NSString *storyTypeColorLight;
  uint64_t v43;
  NSString *storyTypeColorDark;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *topicIDs;
  uint64_t v50;
  NTPBHeadlineAnalyticsElement *analyticsElement;
  uint64_t v52;
  NTPBHeadlineAdElement *adElement;
  uint64_t v54;
  NTHeadlinePersonalizationMetadata *personalizationMetadata;
  uint64_t v56;
  NTPBHeadlineBackingElement *backingElement;
  uint64_t v58;
  NSURL *flintDocumentURL;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTHeadline initWithCoder:].cold.1();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTHeadline initWithIdentifier:](self, "initWithIdentifier:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v7 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleCompact"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleCompact = v6->_titleCompact;
    v6->_titleCompact = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortExcerpt"));
    v11 = objc_claimAutoreleasedReturnValue();
    shortExcerpt = v6->_shortExcerpt;
    v6->_shortExcerpt = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ageDisplayDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    ageDisplayDate = v6->_ageDisplayDate;
    v6->_ageDisplayDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceName"));
    v15 = objc_claimAutoreleasedReturnValue();
    sourceName = v6->_sourceName;
    v6->_sourceName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compactSourceName"));
    v17 = objc_claimAutoreleasedReturnValue();
    compactSourceName = v6->_compactSourceName;
    v6->_compactSourceName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    sourceTagID = v6->_sourceTagID;
    v6->_sourceTagID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v21 = objc_claimAutoreleasedReturnValue();
    language = v6->_language;
    v6->_language = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceNameImageRemoteURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    sourceNameImageRemoteURL = v6->_sourceNameImageRemoteURL;
    v6->_sourceNameImageRemoteURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sourceNameImageScale"));
    v6->_sourceNameImageScale = v25;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compactSourceNameImageRemoteURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    compactSourceNameImageRemoteURL = v6->_compactSourceNameImageRemoteURL;
    v6->_compactSourceNameImageRemoteURL = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailRemoteURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    thumbnailRemoteURL = v6->_thumbnailRemoteURL;
    v6->_thumbnailRemoteURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    thumbnailIdentifier = v6->_thumbnailIdentifier;
    v6->_thumbnailIdentifier = (NSString *)v30;

    v6->_thumbnailSizePreset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("thumbnailSizePreset"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailFocalFrame"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "nf_CGRectValue");
    v6->_thumbnailFocalFrame.origin.x = v33;
    v6->_thumbnailFocalFrame.origin.y = v34;
    v6->_thumbnailFocalFrame.size.width = v35;
    v6->_thumbnailFocalFrame.size.height = v36;

    v6->_needsPlaceholderThumbnail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsPlaceholderThumbnail"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NewsURL"));
    v37 = objc_claimAutoreleasedReturnValue();
    NewsURL = v6->_NewsURL;
    v6->_NewsURL = (NSURL *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storyType"));
    v39 = objc_claimAutoreleasedReturnValue();
    storyType = v6->_storyType;
    v6->_storyType = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storyTypeColorLight"));
    v41 = objc_claimAutoreleasedReturnValue();
    storyTypeColorLight = v6->_storyTypeColorLight;
    v6->_storyTypeColorLight = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storyTypeColorDark"));
    v43 = objc_claimAutoreleasedReturnValue();
    storyTypeColorDark = v6->_storyTypeColorDark;
    v6->_storyTypeColorDark = (NSString *)v43;

    v45 = (void *)MEMORY[0x24BDBCF20];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("topicIDs"));
    v48 = objc_claimAutoreleasedReturnValue();
    topicIDs = v6->_topicIDs;
    v6->_topicIDs = (NSArray *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsElement"));
    v50 = objc_claimAutoreleasedReturnValue();
    analyticsElement = v6->_analyticsElement;
    v6->_analyticsElement = (NTPBHeadlineAnalyticsElement *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adElement"));
    v52 = objc_claimAutoreleasedReturnValue();
    adElement = v6->_adElement;
    v6->_adElement = (NTPBHeadlineAdElement *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personalizationMetadata"));
    v54 = objc_claimAutoreleasedReturnValue();
    personalizationMetadata = v6->_personalizationMetadata;
    v6->_personalizationMetadata = (NTHeadlinePersonalizationMetadata *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backingElement"));
    v56 = objc_claimAutoreleasedReturnValue();
    backingElement = v6->_backingElement;
    v6->_backingElement = (NTPBHeadlineBackingElement *)v56;

    v6->_supportsSavingForLater = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSavingForLater"));
    v6->_hiddenFromAutoFavorites = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hiddenFromAutoFavorites"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flintDocumentURL"));
    v58 = objc_claimAutoreleasedReturnValue();
    flintDocumentURL = v6->_flintDocumentURL;
    v6->_flintDocumentURL = (NSURL *)v58;

    v6->_isBundlePaid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bundlePaid"));
  }

  return v6;
}

- (NTHeadline)initWithIdentifier:(id)a3
{
  id v4;
  NTHeadline *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTHeadline initWithIdentifier:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)NTHeadline;
  v5 = -[NTHeadline init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_flintDocumentURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_backingElement, 0);
  objc_storeStrong((id *)&self->_personalizationMetadata, 0);
  objc_storeStrong((id *)&self->_adElement, 0);
  objc_storeStrong((id *)&self->_analyticsElement, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_storyTypeColorDark, 0);
  objc_storeStrong((id *)&self->_storyTypeColorLight, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_NewsURL, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_thumbnailRemoteURL, 0);
  objc_storeStrong((id *)&self->_compactSourceNameImageRemoteURL, 0);
  objc_storeStrong((id *)&self->_sourceNameImageRemoteURL, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sourceTagID, 0);
  objc_storeStrong((id *)&self->_compactSourceName, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_ageDisplayDate, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_titleCompact, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)storyType
{
  return (unint64_t)self->_storyType;
}

- (NSURL)sourceNameImageRemoteURL
{
  return self->_sourceNameImageRemoteURL;
}

- (void)setShortExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NTHeadline *v4;
  void *v5;
  NTHeadline *v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = +[NTHeadline allocWithZone:](NTHeadline, "allocWithZone:", a3);
  -[NTHeadline identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTHeadline initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[NTHeadline title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTitle:](v6, "setTitle:", v7);

  -[NTHeadline titleCompact](self, "titleCompact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTitleCompact:](v6, "setTitleCompact:", v8);

  -[NTHeadline shortExcerpt](self, "shortExcerpt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setShortExcerpt:](v6, "setShortExcerpt:", v9);

  -[NTHeadline ageDisplayDate](self, "ageDisplayDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setAgeDisplayDate:](v6, "setAgeDisplayDate:", v10);

  -[NTHeadline sourceName](self, "sourceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setSourceName:](v6, "setSourceName:", v11);

  -[NTHeadline compactSourceName](self, "compactSourceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setCompactSourceName:](v6, "setCompactSourceName:", v12);

  -[NTHeadline sourceTagID](self, "sourceTagID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setSourceTagID:](v6, "setSourceTagID:", v13);

  -[NTHeadline language](self, "language");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setLanguage:](v6, "setLanguage:", v14);

  -[NTHeadline sourceNameImageRemoteURL](self, "sourceNameImageRemoteURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setSourceNameImageRemoteURL:](v6, "setSourceNameImageRemoteURL:", v15);

  -[NTHeadline sourceNameImageScale](self, "sourceNameImageScale");
  -[NTHeadline setSourceNameImageScale:](v6, "setSourceNameImageScale:");
  -[NTHeadline compactSourceNameImageRemoteURL](self, "compactSourceNameImageRemoteURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setCompactSourceNameImageRemoteURL:](v6, "setCompactSourceNameImageRemoteURL:", v16);

  -[NTHeadline thumbnailRemoteURL](self, "thumbnailRemoteURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setThumbnailRemoteURL:](v6, "setThumbnailRemoteURL:", v17);

  -[NTHeadline thumbnailIdentifier](self, "thumbnailIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setThumbnailIdentifier:](v6, "setThumbnailIdentifier:", v18);

  -[NTHeadline setThumbnailSizePreset:](v6, "setThumbnailSizePreset:", -[NTHeadline thumbnailSizePreset](self, "thumbnailSizePreset"));
  -[NTHeadline thumbnailFocalFrame](self, "thumbnailFocalFrame");
  -[NTHeadline setThumbnailFocalFrame:](v6, "setThumbnailFocalFrame:");
  -[NTHeadline NewsURL](self, "NewsURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setNewsURL:](v6, "setNewsURL:", v19);

  -[NTHeadline storyType](self, "storyType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryType:](v6, "setStoryType:", v20);

  -[NTHeadline storyTypeColorLight](self, "storyTypeColorLight");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryTypeColorLight:](v6, "setStoryTypeColorLight:", v21);

  -[NTHeadline storyTypeColorDark](self, "storyTypeColorDark");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setStoryTypeColorDark:](v6, "setStoryTypeColorDark:", v22);

  -[NTHeadline(Placeholder) topicIDs](self, "topicIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setTopicIDs:](v6, "setTopicIDs:", v23);

  -[NTHeadline shortExcerpt](self, "shortExcerpt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setShortExcerpt:](v6, "setShortExcerpt:", v24);

  -[NTHeadline analyticsElement](self, "analyticsElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setAnalyticsElement:](v6, "setAnalyticsElement:", v25);

  -[NTHeadline adElement](self, "adElement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setAdElement:](v6, "setAdElement:", v26);

  -[NTHeadline setSupportsSavingForLater:](v6, "setSupportsSavingForLater:", -[NTHeadline supportsSavingForLater](self, "supportsSavingForLater"));
  -[NTHeadline setHiddenFromAutoFavorites:](v6, "setHiddenFromAutoFavorites:", -[NTHeadline(Placeholder) isHiddenFromAutoFavorites](self, "isHiddenFromAutoFavorites"));
  -[NTHeadline personalizationMetadata](self, "personalizationMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setPersonalizationMetadata:](v6, "setPersonalizationMetadata:", v27);

  -[NTHeadline backingElement](self, "backingElement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setBackingElement:](v6, "setBackingElement:", v28);

  -[NTHeadline flintDocumentURL](self, "flintDocumentURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline setFlintDocumentURL:](v6, "setFlintDocumentURL:", v29);

  -[NTHeadline setIsBundlePaid:](v6, "setIsBundlePaid:", -[NTHeadline isBundlePaid](self, "isBundlePaid"));
  return v6;
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (NSDate)ageDisplayDate
{
  return self->_ageDisplayDate;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTHeadline identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NTHeadline identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (NSString)sourceTagID
{
  return self->_sourceTagID;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)supportsSavingForLater
{
  return self->_supportsSavingForLater;
}

- (BOOL)isBundlePaid
{
  return self->_isBundlePaid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)itemType
{
  return 0;
}

- (void)setNeedsPlaceholderThumbnail:(BOOL)a3
{
  self->_needsPlaceholderThumbnail = a3;
}

- (BOOL)needsPlaceholderThumbnail
{
  return self->_needsPlaceholderThumbnail;
}

- (NSDate)cacheCutoffTimeRelativeDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (NSDate)cacheExpirationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
}

- (NSString)clusterID
{
  return 0;
}

- (NTPBFeedItem)feedItemForHeadlineFetch
{
  return 0;
}

- (BOOL)needsFeedItemHeadlinesFetch
{
  return 0;
}

- (unint64_t)todayItemType
{
  return 0;
}

- (id)protoitemWithFetchedFeedItemHeadline:(id)a3
{
  return 0;
}

- (NSString)feedID
{
  return 0;
}

- (unint64_t)contentType
{
  return 2;
}

- (unint64_t)order
{
  return 0;
}

- (unint64_t)publishDateMilliseconds
{
  return 0;
}

- (unint64_t)feedHalfLifeMilliseconds
{
  return 0;
}

- (double)globalUserFeedback
{
  return 0.0;
}

- (BOOL)isFromBlockedStorefront
{
  return 0;
}

- (BOOL)isExplicitContent
{
  return 0;
}

- (int64_t)minimumNewsVersion
{
  return 0;
}

- (int64_t)publisherArticleVersion
{
  return 0;
}

- (BOOL)canBePurchased
{
  return 1;
}

- (NSString)sourceFeedID
{
  return 0;
}

- (NSString)itemID
{
  return 0;
}

- (NSDate)publishDate
{
  return 0;
}

- (unint64_t)halfLife
{
  return 0;
}

- (NSString)publisherID
{
  return 0;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return 1;
}

- (BOOL)isPaid
{
  return 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  return 0;
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

- (NSArray)surfacedByArticleListIDs
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NTHeadline)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTHeadline init]";
    v9 = 2080;
    v10 = "NTHeadline.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTHeadline init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE6CB48], "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTHeadline title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("title"), v4);

  -[NTHeadline identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("identifier"), v5);

  -[NTHeadline shortExcerpt](self, "shortExcerpt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("shortExcerpt"), v6);

  -[NTHeadline sourceTagID](self, "sourceTagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("sourceTagID"), v7);

  -[NTHeadline sourceName](self, "sourceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("sourceName"), v8);

  -[NTHeadline sourceNameImageRemoteURL](self, "sourceNameImageRemoteURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("sourceNameImageRemoteURL"), v9);

  -[NTHeadline thumbnailRemoteURL](self, "thumbnailRemoteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("thumbnailRemoteURL"), v10);

  objc_msgSend(v3, "descriptionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)encodeWithCoder:(id)a3
{
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

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTHeadline encodeWithCoder:].cold.1();
  -[NTHeadline title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[NTHeadline titleCompact](self, "titleCompact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titleCompact"));

  -[NTHeadline shortExcerpt](self, "shortExcerpt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("shortExcerpt"));

  -[NTHeadline identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("identifier"));

  -[NTHeadline ageDisplayDate](self, "ageDisplayDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ageDisplayDate"));

  -[NTHeadline sourceName](self, "sourceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sourceName"));

  -[NTHeadline compactSourceName](self, "compactSourceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("compactSourceName"));

  -[NTHeadline sourceTagID](self, "sourceTagID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("sourceIdentifier"));

  -[NTHeadline language](self, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("language"));

  -[NTHeadline sourceNameImageRemoteURL](self, "sourceNameImageRemoteURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("sourceNameImageRemoteURL"));
  -[NTHeadline sourceNameImageScale](self, "sourceNameImageScale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("sourceNameImageScale"));
  -[NTHeadline compactSourceNameImageRemoteURL](self, "compactSourceNameImageRemoteURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("compactSourceNameImageRemoteURL"));
  -[NTHeadline thumbnailRemoteURL](self, "thumbnailRemoteURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("thumbnailRemoteURL"));
  -[NTHeadline thumbnailIdentifier](self, "thumbnailIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("thumbnailIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[NTHeadline thumbnailSizePreset](self, "thumbnailSizePreset"), CFSTR("thumbnailSizePreset"));
  v18 = (void *)MEMORY[0x24BDD1968];
  -[NTHeadline thumbnailFocalFrame](self, "thumbnailFocalFrame");
  objc_msgSend(v18, "nf_valueWithCGRect:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("thumbnailFocalFrame"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline needsPlaceholderThumbnail](self, "needsPlaceholderThumbnail"), CFSTR("needsPlaceholderThumbnail"));
  -[NTHeadline NewsURL](self, "NewsURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("NewsURL"));

  -[NTHeadline storyType](self, "storyType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("storyType"));

  -[NTHeadline storyTypeColorLight](self, "storyTypeColorLight");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("storyTypeColorLight"));

  -[NTHeadline storyTypeColorDark](self, "storyTypeColorDark");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("storyTypeColorDark"));

  -[NTHeadline(Placeholder) topicIDs](self, "topicIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("topicIDs"));
  -[NTHeadline analyticsElement](self, "analyticsElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("analyticsElement"));

  -[NTHeadline personalizationMetadata](self, "personalizationMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("personalizationMetadata"));

  -[NTHeadline adElement](self, "adElement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("adElement"));

  -[NTHeadline backingElement](self, "backingElement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("backingElement"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline supportsSavingForLater](self, "supportsSavingForLater"), CFSTR("supportsSavingForLater"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline(Placeholder) isHiddenFromAutoFavorites](self, "isHiddenFromAutoFavorites"), CFSTR("hiddenFromAutoFavorites"));
  -[NTHeadline flintDocumentURL](self, "flintDocumentURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("flintDocumentURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NTHeadline isBundlePaid](self, "isBundlePaid"), CFSTR("bundlePaid"));
}

- (void)setTitleCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAgeDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)compactSourceName
{
  return self->_compactSourceName;
}

- (void)setCompactSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSourceTagID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSourceNameImageRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)sourceNameImageScale
{
  return self->_sourceNameImageScale;
}

- (void)setSourceNameImageScale:(double)a3
{
  self->_sourceNameImageScale = a3;
}

- (NSURL)compactSourceNameImageRemoteURL
{
  return self->_compactSourceNameImageRemoteURL;
}

- (void)setCompactSourceNameImageRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)thumbnailRemoteURL
{
  return self->_thumbnailRemoteURL;
}

- (void)setThumbnailRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (void)setThumbnailIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)thumbnailSizePreset
{
  return self->_thumbnailSizePreset;
}

- (void)setThumbnailSizePreset:(unint64_t)a3
{
  self->_thumbnailSizePreset = a3;
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

- (NSURL)NewsURL
{
  return self->_NewsURL;
}

- (void)setNewsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setStoryType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)storyTypeColorLight
{
  return self->_storyTypeColorLight;
}

- (void)setStoryTypeColorLight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)storyTypeColorDark
{
  return self->_storyTypeColorDark;
}

- (void)setStoryTypeColorDark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)needsSeenStateTracking
{
  return self->_needsSeenStateTracking;
}

- (void)setNeedsSeenStateTracking:(BOOL)a3
{
  self->_needsSeenStateTracking = a3;
}

- (void)setSupportsSavingForLater:(BOOL)a3
{
  self->_supportsSavingForLater = a3;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_hiddenFromAutoFavorites;
}

- (void)setHiddenFromAutoFavorites:(BOOL)a3
{
  self->_hiddenFromAutoFavorites = a3;
}

- (NTPBHeadlineAnalyticsElement)analyticsElement
{
  return self->_analyticsElement;
}

- (void)setAnalyticsElement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NTPBHeadlineAdElement)adElement
{
  return self->_adElement;
}

- (void)setAdElement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NTHeadlinePersonalizationMetadata)personalizationMetadata
{
  return self->_personalizationMetadata;
}

- (void)setPersonalizationMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NTPBHeadlineBackingElement)backingElement
{
  return self->_backingElement;
}

- (void)setBackingElement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (void)setVideoCallToActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSURL)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (void)setVideoCallToActionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSURL)flintDocumentURL
{
  return self->_flintDocumentURL;
}

- (void)setFlintDocumentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setIsBundlePaid:(BOOL)a3
{
  self->_isBundlePaid = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)initWithIdentifier:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"identifier != nil", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)encodeWithCoder:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aCoder", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aDecoder", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
