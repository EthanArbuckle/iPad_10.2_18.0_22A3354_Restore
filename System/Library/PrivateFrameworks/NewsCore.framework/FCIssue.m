@implementation FCIssue

- (FCIssue)initWithIssueRecord:(id)a3 assetManager:(id)a4 interestToken:(id)a5 sourceChannel:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FCIssue *v31;
  uint64_t v33;
  id v35;
  uint64_t v36;
  char v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  FCIssue *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v10 = a3;
  v35 = a5;
  v52 = a5;
  v11 = a6;
  v12 = a4;
  v47 = objc_msgSend(v10, "type") == 2;
  objc_msgSend(v10, "generateMetadataJSONAssetHandleWithAssetManager:", v12);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateCoverImageAssetHandleWithAssetManager:", v12);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v10, "publishDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateWithPBDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = self;
  if (objc_msgSend((id)objc_opt_class(), "_fakeIssuesTimestamp"))
  {
    objc_msgSend(v15, "fc_adjustToRecentDate");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(v10, "coverAspectRatio");
  v17 = 0.75;
  if (v18 > 0.0)
  {
    objc_msgSend(v10, "coverAspectRatio");
    v17 = v19;
  }
  objc_msgSend(v10, "base");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "identifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v15;
  v50 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "edition");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coverPrimaryColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithHexString:](FCColor, "colorWithHexString:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coverBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coverTextColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coverAccentColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layeredCover");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layeredCoverAspectRatio");
  v21 = v20;
  objc_msgSend(v10, "layeredCoverPrimaryColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor colorWithHexString:](FCColor, "colorWithHexString:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentIssueIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "identifier");
  v41 = v22;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v22, "containsObject:");
  v37 = objc_msgSend(v10, "isDraft");
  v36 = objc_msgSend(v10, "minimumNewsVersion");
  objc_msgSend(v10, "allArticleIDs");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coverArticleID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedStorefrontIDs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blockedStorefrontIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topicTagIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    objc_msgSend(v10, "issueDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "issueDescription");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v10, "sortDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateWithPBDate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v33) = 1;
  BYTE1(v33) = v37;
  LOBYTE(v33) = v38;
  v31 = -[FCIssue initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:](v48, "initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:", v65, v47, v64, v53, v63, v51, v17, v21, v66, v62, v61, v60, v59,
          v58,
          v57,
          v33,
          v36,
          v56,
          v55,
          v54,
          v23,
          v24,
          v11,
          v26,
          v27,
          v30);

  if (!v25)
  if (!v50)

  if (v31)
  {
    objc_storeStrong((id *)&v31->_issueRecord, a3);
    objc_storeStrong((id *)&v31->_interestToken, v35);
  }

  return v31;
}

+ (BOOL)_fakeIssuesTimestamp
{
  if (qword_1ED0F8940 != -1)
    dispatch_once(&qword_1ED0F8940, &__block_literal_global_192);
  return _MergedGlobals_223;
}

- (FCIssue)initWithIdentifier:(id)a3 type:(int64_t)a4 title:(id)a5 publicationDate:(id)a6 coverDate:(id)a7 metadataJSONAssetHandle:(id)a8 coverImageAssetHandle:(id)a9 coverImageAspectRatio:(double)a10 coverImagePrimaryColor:(id)a11 coverImageBackgroundColor:(id)a12 coverImageTextColor:(id)a13 coverImageAccentColor:(id)a14 layeredCoverJSON:(id)a15 layeredCoverAspectRatio:(double)a16 layeredCoverPrimaryColor:(id)a17 isCurrent:(BOOL)a18 isDraft:(BOOL)a19 isPaid:(BOOL)a20 minimumNewsVersion:(int64_t)a21 allArticleIDs:(id)a22 coverArticleID:(id)a23 allowedStorefrontIDs:(id)a24 blockedStorefrontIDs:(id)a25 topicTagIDs:(id)a26 sourceChannel:(id)a27 notificationDescription:(id)a28 issueDescription:(id)a29 sortDate:(id)a30
{
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  FCIssue *v45;
  uint64_t v46;
  NSString *identifier;
  uint64_t v48;
  NSString *title;
  uint64_t v50;
  NSDate *publicationDate;
  uint64_t v52;
  NSString *coverDate;
  uint64_t v54;
  FCColor *coverImagePrimaryColor;
  uint64_t v56;
  FCColor *coverImageBackgroundColor;
  uint64_t v58;
  FCColor *coverImageTextColor;
  uint64_t v60;
  FCColor *coverImageAccentColor;
  uint64_t v62;
  NSString *layeredCoverJSON;
  uint64_t v64;
  FCColor *layeredCoverPrimaryColor;
  uint64_t v66;
  NSArray *allArticleIDs;
  uint64_t v68;
  NSString *coverArticleID;
  uint64_t v70;
  NSArray *allowedStorefrontIDs;
  uint64_t v72;
  NSArray *blockedStorefrontIDs;
  uint64_t v74;
  NSArray *topicTagIDs;
  uint64_t v76;
  FCChannelProviding *sourceChannel;
  uint64_t v78;
  NSString *notificationDescription;
  uint64_t v80;
  NSString *issueDescription;
  uint64_t v82;
  NSDate *sortDate;
  id obj;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  objc_super v100;

  v90 = a3;
  v91 = a5;
  v99 = a6;
  v98 = a7;
  obj = a8;
  v89 = a8;
  v88 = a9;
  v97 = a11;
  v96 = a12;
  v95 = a13;
  v94 = a14;
  v93 = a15;
  v92 = a17;
  v36 = a22;
  v37 = a23;
  v38 = a24;
  v39 = a25;
  v40 = a26;
  v41 = a27;
  v42 = a28;
  v43 = a29;
  v44 = a30;
  v100.receiver = self;
  v100.super_class = (Class)FCIssue;
  v45 = -[FCIssue init](&v100, sel_init);
  if (v45)
  {
    v46 = objc_msgSend(v90, "copy");
    identifier = v45->_identifier;
    v45->_identifier = (NSString *)v46;

    v45->_type = a4;
    v48 = objc_msgSend(v91, "copy");
    title = v45->_title;
    v45->_title = (NSString *)v48;

    v50 = objc_msgSend(v99, "copy");
    publicationDate = v45->_publicationDate;
    v45->_publicationDate = (NSDate *)v50;

    v52 = objc_msgSend(v98, "copy");
    coverDate = v45->_coverDate;
    v45->_coverDate = (NSString *)v52;

    objc_storeStrong((id *)&v45->_metadataJSONAssetHandle, obj);
    objc_storeStrong((id *)&v45->_coverImageAssetHandle, a9);
    v45->_coverImageAspectRatio = a10;
    v54 = objc_msgSend(v97, "copy");
    coverImagePrimaryColor = v45->_coverImagePrimaryColor;
    v45->_coverImagePrimaryColor = (FCColor *)v54;

    v56 = objc_msgSend(v96, "copy");
    coverImageBackgroundColor = v45->_coverImageBackgroundColor;
    v45->_coverImageBackgroundColor = (FCColor *)v56;

    v58 = objc_msgSend(v95, "copy");
    coverImageTextColor = v45->_coverImageTextColor;
    v45->_coverImageTextColor = (FCColor *)v58;

    v60 = objc_msgSend(v94, "copy");
    coverImageAccentColor = v45->_coverImageAccentColor;
    v45->_coverImageAccentColor = (FCColor *)v60;

    v62 = objc_msgSend(v93, "copy");
    layeredCoverJSON = v45->_layeredCoverJSON;
    v45->_layeredCoverJSON = (NSString *)v62;

    v45->_layeredCoverAspectRatio = a16;
    v64 = objc_msgSend(v92, "copy");
    layeredCoverPrimaryColor = v45->_layeredCoverPrimaryColor;
    v45->_layeredCoverPrimaryColor = (FCColor *)v64;

    v45->_isCurrent = a18;
    v45->_isDraft = a19;
    v45->_paid = a20;
    v45->_minimumNewsVersion = a21;
    v66 = objc_msgSend(v36, "copy");
    allArticleIDs = v45->_allArticleIDs;
    v45->_allArticleIDs = (NSArray *)v66;

    v68 = objc_msgSend(v37, "copy");
    coverArticleID = v45->_coverArticleID;
    v45->_coverArticleID = (NSString *)v68;

    v70 = objc_msgSend(v38, "copy");
    allowedStorefrontIDs = v45->_allowedStorefrontIDs;
    v45->_allowedStorefrontIDs = (NSArray *)v70;

    v72 = objc_msgSend(v39, "copy");
    blockedStorefrontIDs = v45->_blockedStorefrontIDs;
    v45->_blockedStorefrontIDs = (NSArray *)v72;

    v74 = objc_msgSend(v40, "copy");
    topicTagIDs = v45->_topicTagIDs;
    v45->_topicTagIDs = (NSArray *)v74;

    v76 = objc_msgSend(v41, "copy");
    sourceChannel = v45->_sourceChannel;
    v45->_sourceChannel = (FCChannelProviding *)v76;

    v78 = objc_msgSend(v42, "copy");
    notificationDescription = v45->_notificationDescription;
    v45->_notificationDescription = (NSString *)v78;

    v80 = objc_msgSend(v43, "copy");
    issueDescription = v45->_issueDescription;
    v45->_issueDescription = (NSString *)v80;

    v82 = objc_msgSend(v44, "copy");
    sortDate = v45->_sortDate;
    v45->_sortDate = (NSDate *)v82;

  }
  return v45;
}

- (FCColor)coverImageTextColor
{
  return self->_coverImageTextColor;
}

- (FCColor)coverImagePrimaryColor
{
  return self->_coverImagePrimaryColor;
}

- (FCColor)coverImageBackgroundColor
{
  return self->_coverImageBackgroundColor;
}

- (FCColor)coverImageAccentColor
{
  return self->_coverImageAccentColor;
}

void __26__FCIssue_contentManifest__block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "issueRecord");
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
  v12 = v10;

  objc_msgSend(v12, "contentManifest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v11);

}

- (FCChannelProviding)sourceChannel
{
  return self->_sourceChannel;
}

- (NTPBIssueRecord)issueRecord
{
  return self->_issueRecord;
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
  v7[2] = __26__FCIssue_contentManifest__block_invoke;
  v7[3] = &unk_1E463AA30;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithManifests:](v3, "initWithManifests:", v4);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

void __31__FCIssue__fakeIssuesTimestamp__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_223 = objc_msgSend(v0, "BOOLForKey:", CFSTR("newsfeed.content.show_fake_timestamps"));

}

- (NSString)sourceFeedID
{
  void *v2;
  void *v3;

  -[FCIssue sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)halfLife
{
  void *v2;
  unint64_t v3;

  -[FCIssue issueRecord](self, "issueRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "halfLifeMilliseconds");

  return v3;
}

- (NSString)publisherID
{
  void *v2;
  void *v3;

  -[FCIssue sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)globalUserFeedback
{
  return 0.0;
}

- (BOOL)hasGlobalUserFeedback
{
  return 0;
}

- (BOOL)isANF
{
  return -[FCIssue type](self, "type") == 0;
}

- (BOOL)hasVideo
{
  return 0;
}

- (BOOL)hasThumbnail
{
  return 1;
}

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)globalCohorts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCIssue issueRecord](self, "issueRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalCohorts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v7;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)publisherCohorts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[FCIssue issueRecord](self, "issueRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scores");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceChannelCohorts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *)v7;
}

- (void)enumerateTopicCohortsWithBlock:(id)a3
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
  id *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[FCIssue issueRecord](self, "issueRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topicCohorts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCIssue issueRecord](self, "issueRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scores");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topicCohortScores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCIssue issueRecord](self, "issueRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scores");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      objc_msgSend(v12, "topicCohortScores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_2;
      v20[3] = &unk_1E463C590;
      v15 = &v21;
      v21 = v4;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v12, "topicCohorts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[FCIssue topicTagIDs](self, "topicTagIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCIssue issueRecord](self, "issueRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "topicCohorts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_3;
      v18[3] = &unk_1E463C5B8;
      v15 = &v19;
      v19 = v4;
      objc_msgSend(v11, "fc_enumerateSideBySideWithArray:reverse:block:", v17, 0, v18);

      goto LABEL_6;
    }
  }
LABEL_7:

}

void __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "tagId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cohorts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

uint64_t __59__FCIssue_Personalization__enumerateTopicCohortsWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)globalConversionStats
{
  void *v2;
  void *v3;
  void *v4;

  -[FCIssue issueRecord](self, "issueRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversionStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalConversionStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v4;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)publisherConversionStats
{
  void *v2;
  void *v3;
  void *v4;

  -[FCIssue issueRecord](self, "issueRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversionStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "channelConversionStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *)v4;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata)publisherTagMetadata
{
  return 0;
}

- (NSArray)topics
{
  return 0;
}

- (void)enumerateTopicConversionStatsWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[FCIssue issueRecord](self, "issueRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversionStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topicConversionStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FCIssue issueRecord](self, "issueRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversionStats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topicConversionStats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__FCIssue_Personalization__enumerateTopicConversionStatsWithBlock___block_invoke_2;
    v11[3] = &unk_1E463C5E0;
    v12 = v4;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  }
}

void __67__FCIssue_Personalization__enumerateTopicConversionStatsWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "tagId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversionStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (FCIssue)init
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCIssue init]";
    v9 = 2080;
    v10 = "FCIssue.m";
    v11 = 1024;
    v12 = 48;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCIssue init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCIssue)initWithData:(id)a3 sourceChannel:(id)a4 assetManager:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  FCIssue *v13;

  v8 = (objc_class *)MEMORY[0x1E0D626F0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithData:", v11);

  v13 = -[FCIssue initWithIssueRecord:assetManager:interestToken:sourceChannel:](self, "initWithIssueRecord:assetManager:interestToken:sourceChannel:", v12, v9, 0, v10);
  return v13;
}

- (FCIssue)initWithIssue:(id)a3 overrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  FCIssue *v23;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  FCIssue *v31;
  FCIssue *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    objc_msgSend(v7, "issueDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v23 = (FCIssue *)v6;
      goto LABEL_13;
    }
  }
  v31 = self;
  objc_msgSend(v6, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "type");
  objc_msgSend(v7, "title");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v35;
  if (!v35)
  {
    objc_msgSend(v6, "title");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "publicationDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataJSONAssetHandle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverImageAssetHandle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverImageAspectRatio");
  v11 = v10;
  objc_msgSend(v6, "coverImagePrimaryColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverImageBackgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverImageTextColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverImageAccentColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layeredCoverJSON");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layeredCoverAspectRatio");
  v13 = v12;
  objc_msgSend(v6, "layeredCoverPrimaryColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "isCurrent");
  v28 = objc_msgSend(v6, "isDraft");
  v27 = objc_msgSend(v6, "isPaid");
  v26 = objc_msgSend(v6, "minimumNewsVersion");
  objc_msgSend(v6, "allArticleIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverArticleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowedStorefrontIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blockedStorefrontIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topicTagIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceChannel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v7;
  objc_msgSend(v7, "issueDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(v6, "issueDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "sortDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v25) = v27;
  BYTE1(v25) = v28;
  LOBYTE(v25) = v29;
  v32 = -[FCIssue initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:](v31, "initWithIdentifier:type:title:publicationDate:coverDate:metadataJSONAssetHandle:coverImageAssetHandle:coverImageAspectRatio:coverImagePrimaryColor:coverImageBackgroundColor:coverImageTextColor:coverImageAccentColor:layeredCoverJSON:layeredCoverAspectRatio:layeredCoverPrimaryColor:isCurrent:isDraft:isPaid:minimumNewsVersion:allArticleIDs:coverArticleID:allowedStorefrontIDs:blockedStorefrontIDs:topicTagIDs:sourceChannel:notificationDescription:issueDescription:sortDate:", v47, v30, v35, v46, v45, v44, v11, v13, v43, v42, v41, v40, v39,
          v38,
          v37,
          v25,
          v26,
          v36,
          v14,
          v15,
          v16,
          v17,
          v18,
          v19,
          v21,
          v22);

  if (!v20)
  if (!v33)

  self = v32;
  v23 = self;
  v7 = v34;
LABEL_13:

  return v23;
}

- (NSString)description
{
  FCDescription *v3;
  void *v4;
  void *v5;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCIssue identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("identifier"), v4);

  -[FCDescription descriptionString](v3, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
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
    -[FCIssue identifier](self, "identifier");
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

  -[FCIssue identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isBlockedExplicitContent
{
  void *v2;
  char v3;

  -[FCIssue sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlockedExplicitContent");

  return v3;
}

- (BOOL)isLocalDraft
{
  return 0;
}

- (NSString)sourceChannelID
{
  void *v2;
  void *v3;

  -[FCIssue sourceChannel](self, "sourceChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__FCIssue_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __25__FCIssue_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "issueRecord");
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
  v11 = v9;

  objc_msgSend(v11, "contentArchive");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v10);

}

- (FCFeedPersonalizedItemScoreProfile)scoreProfile
{
  return (FCFeedPersonalizedItemScoreProfile *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScoreProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)publicationDate
{
  return self->_publicationDate;
}

- (NSString)coverDate
{
  return self->_coverDate;
}

- (FCAssetHandle)metadataJSONAssetHandle
{
  return self->_metadataJSONAssetHandle;
}

- (FCAssetHandle)coverImageAssetHandle
{
  return self->_coverImageAssetHandle;
}

- (double)coverImageAspectRatio
{
  return self->_coverImageAspectRatio;
}

- (NSString)layeredCoverJSON
{
  return self->_layeredCoverJSON;
}

- (double)layeredCoverAspectRatio
{
  return self->_layeredCoverAspectRatio;
}

- (FCColor)layeredCoverPrimaryColor
{
  return self->_layeredCoverPrimaryColor;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (BOOL)isPaid
{
  return self->_paid;
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)notificationDescription
{
  return self->_notificationDescription;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (NSArray)allArticleIDs
{
  return self->_allArticleIDs;
}

- (NSString)coverArticleID
{
  return self->_coverArticleID;
}

- (NSArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (NSArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (NSArray)topicTagIDs
{
  return self->_topicTagIDs;
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
  objc_storeStrong((id *)&self->_interestToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueRecord, 0);
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_sourceChannel, 0);
  objc_storeStrong((id *)&self->_topicTagIDs, 0);
  objc_storeStrong((id *)&self->_blockedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_allowedStorefrontIDs, 0);
  objc_storeStrong((id *)&self->_coverArticleID, 0);
  objc_storeStrong((id *)&self->_allArticleIDs, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_notificationDescription, 0);
  objc_storeStrong((id *)&self->_layeredCoverPrimaryColor, 0);
  objc_storeStrong((id *)&self->_layeredCoverJSON, 0);
  objc_storeStrong((id *)&self->_coverImageAccentColor, 0);
  objc_storeStrong((id *)&self->_coverImageTextColor, 0);
  objc_storeStrong((id *)&self->_coverImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_coverImagePrimaryColor, 0);
  objc_storeStrong((id *)&self->_coverImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_metadataJSONAssetHandle, 0);
  objc_storeStrong((id *)&self->_coverDate, 0);
  objc_storeStrong((id *)&self->_publicationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scoreProfile, 0);
}

@end
