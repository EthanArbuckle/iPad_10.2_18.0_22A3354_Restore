@implementation FCHeadline

- (NSString)articleID
{
  return self->_articleID;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (NSString)title
{
  return self->_title;
}

- (FCArticleAudioTrack)narrativeTrackSample
{
  return self->_narrativeTrackSample;
}

- (NSURL)routeURL
{
  return self->_routeURL;
}

- (NSString)layeredThumbnailJSON
{
  return self->_layeredThumbnailJSON;
}

- (BOOL)isDisplayingAsNativeAd
{
  return self->_displayAsNativeAd;
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[FCHeadline topics](self, "topics", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "tagID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "conversionStats");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[FCHeadline topics](self, "topics", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "tagID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cohorts");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)language
{
  return self->_language;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)shortExcerpt
{
  return self->_shortExcerpt;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setShortExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setPublishDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (void)setAccessoryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (BOOL)isBundlePaid
{
  return self->_bundlePaid;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (NSArray)iAdKeywords
{
  return self->_iAdKeywords;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  return (FCFeedPersonalizedItemScoreProfile *)objc_getProperty(self, a2, 392, 1);
}

- (FCHeadlineThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (FCHeadlineThumbnail)thumbnailUltraHQ
{
  return self->_thumbnailUltraHQ;
}

- (FCHeadlineThumbnail)thumbnailMedium
{
  return self->_thumbnailMedium;
}

- (FCHeadlineThumbnail)thumbnailHQ
{
  return self->_thumbnailHQ;
}

- (FCHeadlineThumbnail)thumbnailLQ
{
  return self->_thumbnailLQ;
}

- (BOOL)hasVideo
{
  void *v2;
  BOOL v3;

  -[FCHeadline videoURL](self, "videoURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (FCHeadline)init
{
  FCHeadline *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCHeadline;
  result = -[FCHeadline init](&v3, sel_init);
  if (result)
    result->_halfLife = 23400000;
  return result;
}

- (void)setScoreProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (double)conditionalScore
{
  return self->_conditionalScore;
}

- (BOOL)isANF
{
  return -[FCHeadline contentType](self, "contentType") == 2;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return a3
      && (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](-[FCHeadline identifier](self, "identifier"), "isEqualToString:", objc_msgSend(a3, "identifier"));
}

- (unint64_t)hash
{
  return -[NSString hash](-[FCHeadline identifier](self, "identifier"), "hash");
}

- (void)applyHeadlineMetadata:(id)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v18, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline overrideTitle:](self, "overrideTitle:", v8);

    }
  }
  objc_msgSend(v18, "displayDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v18, "displayDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCHeadline overrideDisplayDate:](self, "overrideDisplayDate:", v10);

  }
  objc_msgSend(v18, "storyType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v6 && v12)
  {
    objc_msgSend(v18, "storyType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PBArticleStoryTypeFromString(v13) - 1;
    if (v14 < 5)
      v15 = v14 + 1;
    else
      v15 = 0;

    -[FCHeadline assignStoryType:withConfiguration:](self, "assignStoryType:withConfiguration:", v15, v6);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v18, "shortExcerpt");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v18, "shortExcerpt");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline overrideShortExcerpt:](self, "overrideShortExcerpt:", v17);

    }
  }

}

- (void)overrideDisplayDate:(id)a3
{
  id v4;

  v4 = a3;
  -[FCHeadline setDisplayDate:](self, "setDisplayDate:", v4);
  -[FCHeadline setPublishDate:](self, "setPublishDate:", v4);

}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (double)globalUserFeedback
{
  double result;

  result = self->_globalUserFeedback;
  if (result < 0.0)
    return 0.5;
  return result;
}

- (NSString)sourceFeedID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[FCHeadline surfacedByChannelID](self, "surfacedByChannelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCHeadline surfacedByTopicID](self, "surfacedByTopicID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)surfacedByTopicID
{
  return self->_surfacedByTopicID;
}

- (NSString)surfacedByChannelID
{
  return self->_surfacedByChannelID;
}

- (BOOL)isFeatured
{
  return -[FCHeadline role](self, "role") == 6;
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

- (NSString)sourceChannelID
{
  void *v2;
  void *v3;

  -[FCHeadline sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (FCHeadlineMetadata)appliedOverrideMetadata
{
  return 0;
}

- (void)markAsEvergreen
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (!-[FCHeadline isEvergreen](self, "isEvergreen"))
  {
    -[FCHeadline setIsEvergreen:](self, "setIsEvergreen:", 1);
    if (NFInternalBuild())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("newsfeed.content.highlight_evergreen_articles"));

      if (v4)
      {
        -[FCHeadline title](self, "title");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("🌲"), "stringByAppendingString:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCHeadline setTitle:](self, "setTitle:", v5);

      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleCompact, 0);
  objc_storeStrong((id *)&self->_headlineURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
  objc_storeStrong((id *)&self->_linkedIssueIDs, 0);
  objc_storeStrong((id *)&self->_linkedArticleIDs, 0);
  objc_storeStrong((id *)&self->_float16FullBodyEncoding, 0);
  objc_storeStrong((id *)&self->_float16TitleEncoding, 0);
  objc_storeStrong((id *)&self->_narrativeTrackTextRanges, 0);
  objc_storeStrong((id *)&self->_narrativeTrackSample, 0);
  objc_storeStrong((id *)&self->_narrativeTrack, 0);
  objc_storeStrong((id *)&self->_parentIssue, 0);
  objc_storeStrong((id *)&self->_backingArticleRecordData, 0);
  objc_storeStrong((id *)&self->_stocksFields, 0);
  objc_storeStrong((id *)&self->_nativeAdCampaignData, 0);
  objc_storeStrong((id *)&self->_associatedAd, 0);
  objc_storeStrong((id *)&self->_sponsoredBy, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_publisherSpecifiedArticleIDs, 0);
  objc_storeStrong((id *)&self->_publisherTagMetadata, 0);
  objc_storeStrong((id *)&self->_publisherConversionStats, 0);
  objc_storeStrong((id *)&self->_globalConversionStats, 0);
  objc_storeStrong((id *)&self->_publisherCohorts, 0);
  objc_storeStrong((id *)&self->_globalCohorts, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_videoCallToActionURL, 0);
  objc_storeStrong((id *)&self->_videoCallToActionTitle, 0);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_storyStyle, 0);
  objc_storeStrong((id *)&self->_moreFromPublisherArticleIDs, 0);
  objc_storeStrong((id *)&self->_relatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_scoreProfile, 0);
  objc_storeStrong((id *)&self->_localDraftPath, 0);
  objc_storeStrong((id *)&self->_callToActionText, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, 0);
  objc_storeStrong((id *)&self->_surfacedByBinID, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicID, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelID, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionID, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_iAdSectionIDs, 0);
  objc_storeStrong((id *)&self->_iAdKeywords, 0);
  objc_storeStrong((id *)&self->_iAdCategories, 0);
  objc_storeStrong((id *)&self->_sportsEventIDs, 0);
  objc_storeStrong((id *)&self->_videoType, 0);
  objc_storeStrong((id *)&self->_videoStillImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_lastFetchedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_shortExcerpt, 0);
  objc_storeStrong((id *)&self->_primaryAudience, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_referencedArticleID, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_experimentalTitleMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailWidget, 0);
  objc_storeStrong((id *)&self->_thumbnailWidgetLQ, 0);
  objc_storeStrong((id *)&self->_thumbnailUltraHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailHQ, 0);
  objc_storeStrong((id *)&self->_thumbnailMedium, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnailLQ, 0);
}

+ (id)emptyHeadline
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCHeadline emptyHeadlineWithIdentifier:](FCHeadline, "emptyHeadlineWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)emptyHeadlineWithIdentifier:(id)a3
{
  id v3;
  FCHeadline *v4;

  v3 = a3;
  v4 = objc_alloc_init(FCHeadline);
  -[FCHeadline setIdentifier:](v4, "setIdentifier:", v3);
  -[FCHeadline setArticleID:](v4, "setArticleID:", v3);

  return v4;
}

- (id)contentWithContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pptContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunningPPT");

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
      *(_DWORD *)buf = 136315906;
      v13 = "-[FCHeadline contentWithContext:]";
      v14 = 2080;
      v15 = "FCHeadline.m";
      v16 = 1024;
      v17 = 184;
      v18 = 2114;
      v19 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCHeadline contentWithContext:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v11);
  }

  return 0;
}

- (BOOL)isGap
{
  return 0;
}

- (BOOL)isSponsored
{
  return self->_sponsored || self->_sponsoredBy != 0;
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
    -[FCHeadline primaryAudience](self, "primaryAudience");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("MATURE"));

  }
  return v4;
}

- (BOOL)showPublisherLogo
{
  return -[FCHeadline role](self, "role") != 3;
}

- (BOOL)hasVideoStillImage
{
  void *v2;
  BOOL v3;

  -[FCHeadline videoStillImage](self, "videoStillImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCHeadline;
  -[FCHeadline description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)applyConditionalScore:(double)a3
{
  double v5;

  -[FCHeadline conditionalScore](self, "conditionalScore");
  if (v5 <= a3)
    v5 = a3;
  -[FCHeadline setConditionalScore:](self, "setConditionalScore:", v5);
}

- (void)addSurfacedByArticleListID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FCHeadline surfacedByArticleListIDs](self, "surfacedByArticleListIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCHeadline setSurfacedByArticleListIDs:](self, "setSurfacedByArticleListIDs:", v5);

  }
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("LX")))
    self->_isCoread = 1;
  -[FCHeadline surfacedByArticleListIDs](self, "surfacedByArticleListIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)assignStoryType:(unint64_t)a3 withConfiguration:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  if (a3 != 5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCHeadline publishDate](self, "publishDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;
    objc_msgSend(v16, "topStoriesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 >= (double)objc_msgSend(v10, "storyTypeTimeout");

    if (v11)
      a3 = 0;
  }
  if (a3 != -[FCHeadline storyType](self, "storyType"))
  {
    -[FCHeadline setStoryType:](self, "setStoryType:", a3);
    if (a3)
    {
      objc_msgSend(v16, "topStoriesConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "styleConfigurations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline setStoryStyle:](self, "setStoryStyle:", v15);

    }
    else
    {
      -[FCHeadline setStoryStyle:](self, "setStoryStyle:", 0);
    }
  }

}

- (BOOL)isTopStory
{
  return -[FCHeadline topStoryType](self, "topStoryType") != 0;
}

- (NSString)publisherID
{
  void *v2;
  void *v3;

  -[FCHeadline sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasGlobalUserFeedback
{
  double v2;

  -[FCHeadline globalUserFeedback](self, "globalUserFeedback");
  return v2 != 0.0;
}

- (unint64_t)publishDateMilliseconds
{
  void *v2;
  unint64_t v3;

  -[FCHeadline publishDate](self, "publishDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (BOOL)isFromBlockedStorefront
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentStoreFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadline allowedStorefrontIDs](self, "allowedStorefrontIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadline blockedStorefrontIDs](self, "blockedStorefrontIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isContentBlockedInStorefrontID:withAllowedStorefrontIDs:blockedStorefrontIDs:", v5, v6, v7);

  return v8;
}

- (BOOL)isExplicitContent
{
  void *v2;
  char v3;

  -[FCHeadline primaryAudience](self, "primaryAudience");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MATURE"));

  return v3;
}

- (BOOL)isFullTrackAvailableToAll
{
  FCHeadline *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[FCHeadline narrativeTrack](self, "narrativeTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCHeadline narrativeTrackSample](v2, "narrativeTrackSample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)isCoread
{
  void *v2;
  void *v3;
  char v4;

  -[FCHeadline surfacedByArticleListIDs](self, "surfacedByArticleListIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "fc_containsObjectPassingTest:", &__block_literal_global_27_3);
  else
    v4 = 0;

  return v4;
}

uint64_t __22__FCHeadline_isCoread__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("LX"));
}

- (void)setThumbnailLQ:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLQ, a3);
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

- (FCHeadlineThumbnail)thumbnailWidgetLQ
{
  return self->_thumbnailWidgetLQ;
}

- (FCHeadlineThumbnail)thumbnailWidget
{
  return self->_thumbnailWidget;
}

- (FCHeadlineThumbnail)thumbnailWidgetHQ
{
  return self->_thumbnailWidgetHQ;
}

- (FCHeadlineExperimentalTitleMetadata)experimentalTitleMetadata
{
  return self->_experimentalTitleMetadata;
}

- (NSString)referencedArticleID
{
  return self->_referencedArticleID;
}

- (NSString)clusterID
{
  return self->_clusterID;
}

- (void)setClusterID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)primaryAudience
{
  return self->_primaryAudience;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (void)setSourceChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)lastFetchedDate
{
  return self->_lastFetchedDate;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (FCAssetHandle)videoStillImage
{
  return self->_videoStillImage;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSArray)sportsEventIDs
{
  return self->_sportsEventIDs;
}

- (void)setSportsEventIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isFeatureCandidate
{
  return self->_featureCandidate;
}

- (void)setSponsored:(BOOL)a3
{
  self->_sponsored = a3;
}

- (NSArray)iAdCategories
{
  return self->_iAdCategories;
}

- (NSArray)iAdSectionIDs
{
  return self->_iAdSectionIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
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

- (NSString)surfacedBySectionID
{
  return self->_surfacedBySectionID;
}

- (void)setSurfacedBySectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void)setSurfacedByChannelID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setSurfacedByTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)surfacedByBinID
{
  return self->_surfacedByBinID;
}

- (void)setSurfacedByBinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSMutableArray)surfacedByArticleListIDs
{
  return self->_surfacedByArticleListIDs;
}

- (void)setSurfacedByArticleListIDs:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByArticleListIDs, a3);
}

- (NSString)callToActionText
{
  return self->_callToActionText;
}

- (void)setCallToActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)localDraftPath
{
  return self->_localDraftPath;
}

- (double)tileProminenceScore
{
  return self->_personalizedScore;
}

- (void)setTileProminenceScore:(double)a3
{
  self->_personalizedScore = a3;
}

- (BOOL)usesImageOnTopLayout
{
  return self->_usesImageOnTopLayout;
}

- (void)setUsesImageOnTopLayout:(BOOL)a3
{
  self->_usesImageOnTopLayout = a3;
}

- (unint64_t)topStoryType
{
  return self->_topStoryType;
}

- (void)setTopStoryType:(unint64_t)a3
{
  self->_topStoryType = a3;
}

- (NSArray)relatedArticleIDs
{
  return self->_relatedArticleIDs;
}

- (NSArray)moreFromPublisherArticleIDs
{
  return self->_moreFromPublisherArticleIDs;
}

- (unint64_t)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(unint64_t)a3
{
  self->_storyType = a3;
}

- (FCTopStoriesStyleConfiguration)storyStyle
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

- (BOOL)isHiddenFromAutoFavorites
{
  return self->_hiddenFromAutoFavorites;
}

- (BOOL)disablePrerollAds
{
  return self->_disablePrerollAds;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (void)setPaid:(BOOL)a3
{
  self->_paid = a3;
}

- (FCCoverArt)coverArt
{
  return self->_coverArt;
}

- (NSString)videoCallToActionTitle
{
  return self->_videoCallToActionTitle;
}

- (NSURL)videoCallToActionURL
{
  return self->_videoCallToActionURL;
}

- (BOOL)showSubscriptionRequiredText
{
  return self->_showSubscriptionRequiredText;
}

- (void)setShowSubscriptionRequiredText:(BOOL)a3
{
  self->_showSubscriptionRequiredText = a3;
}

- (unint64_t)feedOrder
{
  return self->_feedOrder;
}

- (void)setFeedOrder:(unint64_t)a3
{
  self->_feedOrder = a3;
}

- (void)setGlobalUserFeedback:(double)a3
{
  self->_globalUserFeedback = a3;
}

- (unint64_t)halfLife
{
  return self->_halfLife;
}

- (void)setHalfLife:(unint64_t)a3
{
  self->_halfLife = a3;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (void)setIsEvergreen:(BOOL)a3
{
  self->_isEvergreen = a3;
}

- (BOOL)canBePurchased
{
  return self->_canBePurchased;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  return self->_globalCohorts;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  return self->_publisherCohorts;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  return self->_globalConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  return self->_publisherConversionStats;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return self->_publisherTagMetadata;
}

- (NSArray)publisherSpecifiedArticleIDs
{
  return self->_publisherSpecifiedArticleIDs;
}

- (BOOL)webEmbedsEnabled
{
  return self->_webEmbedsEnabled;
}

- (void)setThumbnailFocalFrame:(CGRect)a3
{
  self->_thumbnailFocalFrame = a3;
}

- (void)setDisplayAsNativeAd:(BOOL)a3
{
  self->_displayAsNativeAd = a3;
}

- (NSString)sponsoredBy
{
  return self->_sponsoredBy;
}

- (void)setSponsoredBy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (FCNativeAdProviding)associatedAd
{
  return self->_associatedAd;
}

- (void)setAssociatedAd:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAd, a3);
}

- (NSString)nativeAdCampaignData
{
  return self->_nativeAdCampaignData;
}

- (void)setNativeAdCampaignData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (FCHeadlineStocksFields)stocksFields
{
  return self->_stocksFields;
}

- (NSData)backingArticleRecordData
{
  return self->_backingArticleRecordData;
}

- (FCIssue)parentIssue
{
  return self->_parentIssue;
}

- (BOOL)isIssueOnly
{
  return self->_issueOnly;
}

- (BOOL)showBundleSoftPaywall
{
  return self->_showBundleSoftPaywall;
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

- (int64_t)bodyTextLength
{
  return self->_bodyTextLength;
}

- (BOOL)useTransparentNavigationBar
{
  return self->_useTransparentNavigationBar;
}

- (FCArticleAudioTrack)narrativeTrack
{
  return self->_narrativeTrack;
}

- (NSString)narrativeTrackTextRanges
{
  return self->_narrativeTrackTextRanges;
}

- (BOOL)hasAudioTrack
{
  return self->_hasAudioTrack;
}

- (NSData)float16TitleEncoding
{
  return self->_float16TitleEncoding;
}

- (NSData)float16FullBodyEncoding
{
  return self->_float16FullBodyEncoding;
}

- (NSArray)linkedArticleIDs
{
  return self->_linkedArticleIDs;
}

- (NSArray)linkedIssueIDs
{
  return self->_linkedIssueIDs;
}

- (double)layeredThumbnailAspectRatio
{
  return self->_layeredThumbnailAspectRatio;
}

- (FCColor)thumbnailImagePrimaryColor
{
  return self->_thumbnailImagePrimaryColor;
}

- (FCColor)thumbnailImageBackgroundColor
{
  return self->_thumbnailImageBackgroundColor;
}

- (FCColor)thumbnailImageTextColor
{
  return self->_thumbnailImageTextColor;
}

- (FCColor)thumbnailImageAccentColor
{
  return self->_thumbnailImageAccentColor;
}

- (NSArray)authors
{
  return self->_authors;
}

- (NSArray)narrators
{
  return self->_narrators;
}

- (NSString)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (NSArray)narrativeTrackBuddyArticleIDs
{
  return self->_narrativeTrackBuddyArticleIDs;
}

- (NSString)narrativeTrackPreferredUpsellVariantID
{
  return self->_narrativeTrackPreferredUpsellVariantID;
}

- (NSDate)globalExpirationTime
{
  return self->_globalExpirationTime;
}

- (void)setGlobalExpirationTime:(id)a3
{
  objc_storeStrong((id *)&self->_globalExpirationTime, a3);
}

- (NSArray)tagsExpiration
{
  return self->_tagsExpiration;
}

- (void)setConditionalScore:(double)a3
{
  self->_conditionalScore = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (NSURL)headlineURL
{
  return self->_headlineURL;
}

- (void)setHeadlineURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (NSString)titleCompact
{
  return self->_titleCompact;
}

- (void)setTitleCompact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (BOOL)isAIGenerated
{
  return self->_aiGenerated;
}

- (void)setAiGenerated:(BOOL)a3
{
  self->_aiGenerated = a3;
}

- (void)setBundlePaid:(BOOL)a3
{
  self->_bundlePaid = a3;
}

@end
