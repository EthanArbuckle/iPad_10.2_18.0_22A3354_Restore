@implementation FCArticleRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C6D8;
}

- (id)recordType
{
  return CFSTR("Article");
}

+ (id)modificationDateFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FeedItemAndArticle")) & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("articleModDate"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    objc_msgSendSuper2(&v9, sel_modificationDateFromCKRecord_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)identifierFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FeedItemAndArticle")) & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("articleID"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    objc_msgSendSuper2(&v9, sel_identifierFromCKRecord_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (int)pbRecordType
{
  return 1;
}

+ (id)changeTagFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FeedItemAndArticle")) & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("articleETag"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    objc_msgSendSuper2(&v9, sel_changeTagFromCKRecord_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint8_t buf[4];
  const char *v148;
  __int16 v149;
  char *v150;
  __int16 v151;
  int v152;
  __int16 v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D62630];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setBase:", v8);

  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v11);

  objc_msgSend(v6, "objectForKey:", CFSTR("titleCompact"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleCompact:", v12);

  objc_msgSend(v6, "objectForKey:", CFSTR("titlesExperimental"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExperimentalTitles:", v13);

  objc_msgSend(v6, "objectForKey:", CFSTR("sourceChannelTagID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceChannelTagID:", v14);

  objc_msgSend(v6, "objectForKey:", CFSTR("publishDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pbDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPublishDate:", v16);

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherArticleVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPublisherArticleVersion:", objc_msgSend(v17, "longLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("backendArticleVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackendArticleVersion:", objc_msgSend(v18, "longLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailFocalFrame"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailFocalFrame:", objc_msgSend(v19, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailPerceptualHash"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailPerceptualHash:", v20);

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailLQMetadata"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailLQMetadata:", objc_msgSend(v21, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailMetadata"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailMetadata:", objc_msgSend(v22, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailMediumMetadata"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailMediumMetadata:", objc_msgSend(v23, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailHQMetadata"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailHQMetadata:", objc_msgSend(v24, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailUltraHQMetadata"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailUltraHQMetadata:", objc_msgSend(v25, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetLQMetadata"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailWidgetLQMetadata:", objc_msgSend(v26, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetMetadata"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailWidgetMetadata:", objc_msgSend(v27, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetHQMetadata"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailWidgetHQMetadata:", objc_msgSend(v28, "unsignedLongLongValue"));

  -[FCArticleRecordSource urlStringForThumbnailKey:inRecord:](self, "urlStringForThumbnailKey:inRecord:", CFSTR("thumbnailLQ"), v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailLQURL:", v29);

  -[FCArticleRecordSource urlStringForThumbnailKey:inRecord:](self, "urlStringForThumbnailKey:inRecord:", CFSTR("thumbnail"), v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailURL:", v30);

  -[FCArticleRecordSource urlStringForThumbnailKey:inRecord:](self, "urlStringForThumbnailKey:inRecord:", CFSTR("thumbnailMedium"), v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailMediumURL:", v31);

  -[FCArticleRecordSource urlStringForThumbnailKey:inRecord:](self, "urlStringForThumbnailKey:inRecord:", CFSTR("thumbnailHQ"), v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailHQURL:", v32);

  -[FCArticleRecordSource urlStringForThumbnailKey:inRecord:](self, "urlStringForThumbnailKey:inRecord:", CFSTR("thumbnailUltraHQ"), v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailUltraHQURL:", v33);

  v34 = objc_msgSend((id)objc_opt_class(), "useTaggedImages");
  if (v34)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetLQ2"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      v36 = CFSTR("thumbnailWidgetLQ2");
    else
      v36 = CFSTR("thumbnailWidgetLQ");
    objc_msgSend(v6, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setThumbnailWidgetLQURL:", v37);

    objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidget2"));
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidget2"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setThumbnailWidgetURL:", v40);

      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetLQ"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setThumbnailWidgetLQURL:", v41);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidget"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailWidgetURL:", v42);

  if (!v34)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetHQ"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setThumbnailWidgetHQURL:", v43);
    goto LABEL_14;
  }
LABEL_9:
  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailWidgetHQ2"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    v44 = CFSTR("thumbnailWidgetHQ2");
  else
    v44 = CFSTR("thumbnailWidgetHQ");
  objc_msgSend(v6, "objectForKey:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailWidgetHQURL:", v45);

LABEL_14:
  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailPrimaryColor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailPrimaryColor:", v46);

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailBackgroundColor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailBackgroundColor:", v47);

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailTextColor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailTextColor:", v48);

  objc_msgSend(v6, "objectForKey:", CFSTR("thumbnailAccentColor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailAccentColor:", v49);

  objc_msgSend(v6, "objectForKey:", CFSTR("shortExcerpt"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShortExcerpt:", v50);

  objc_msgSend(v6, "objectForKey:", CFSTR("accessoryText"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryText:", v51);

  objc_msgSend(v6, "objectForKey:", CFSTR("contentURL"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentURL:", v52);

  objc_msgSend(v6, "objectForKey:", CFSTR("contentType"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentType:", PBArticleContentTypeFromString(v53));

  objc_msgSend(v6, "objectForKey:", CFSTR("clusterID"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClusterID:", v54);

  objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("flintDocument"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = v55;
    else
      v56 = 0;
  }
  else
  {
    v56 = 0;
  }
  v57 = v56;
  objc_msgSend(v9, "setFlintDocumentURL:", v57);

  objc_msgSend(v6, "objectForKey:", CFSTR("flintFontResourceIDs"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_80);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)objc_msgSend(v59, "mutableCopy");
  objc_msgSend(v9, "setFlintFontResourceIDs:", v60);

  objc_msgSend(v6, "objectForKey:", CFSTR("videoURL"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoURL:", v61);

  objc_msgSend(v6, "objectForKey:", CFSTR("videoStillImage"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoStillImageURL:", v62);

  objc_msgSend(v6, "objectForKey:", CFSTR("videoDuration"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "doubleValue");
  objc_msgSend(v9, "setVideoDuration:");

  objc_msgSend(v6, "objectForKey:", CFSTR("videoType"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoType:", v64);

  objc_msgSend(v6, "objectForKey:", CFSTR("sportsEventIDs"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "mutableCopy");
  objc_msgSend(v9, "setSportsEventIDs:", v66);

  objc_msgSend(v6, "objectForKey:", CFSTR("isFeature"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsFeatureCandidate:", objc_msgSend(v67, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("isSponsored"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsSponsored:", objc_msgSend(v68, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("iAdCategories"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "mutableCopy");
  objc_msgSend(v9, "setIAdCategories:", v70);

  objc_msgSend(v6, "objectForKey:", CFSTR("iAdKeywords"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "mutableCopy");
  objc_msgSend(v9, "setIAdKeywords:", v72);

  objc_msgSend(v6, "objectForKey:", CFSTR("iAdSectionTagIDs"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "mutableCopy");
  objc_msgSend(v9, "setIAdSectionIDs:", v74);

  objc_msgSend(v6, "objectForKey:", CFSTR("blockedStorefrontIDs"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "mutableCopy");
  objc_msgSend(v9, "setBlockedStorefrontIDs:", v76);

  objc_msgSend(v6, "objectForKey:", CFSTR("allowedStorefrontIDs"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "mutableCopy");
  objc_msgSend(v9, "setAllowedStorefrontIDs:", v78);

  objc_msgSend(v6, "objectForKey:", CFSTR("isDraft"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsDraft:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("primaryAudience"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrimaryAudience:", v80);

  objc_msgSend(v6, "objectForKey:", CFSTR("referencedArticleID"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReferencedArticleID:", v81);

  objc_msgSend(v6, "objectForKey:", CFSTR("relatedArticleIDs2"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v82, "mutableCopy");
  objc_msgSend(v9, "setRelatedArticleIDs:", v83);

  objc_msgSend(v6, "objectForKey:", CFSTR("moreFromPublisherArticleIDs"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v84, "mutableCopy");
  objc_msgSend(v9, "setMoreFromPublisherArticleIDs:", v85);

  objc_msgSend(v6, "objectForKey:", CFSTR("parentIssueID"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParentIssueID:", v86);

  objc_msgSend(v6, "objectForKey:", CFSTR("halfLifeMillis"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHalfLifeMilliseconds:", objc_msgSend(v87, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("halfLifeMillisOverride"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHalfLifeMillisecondsOverride:", objc_msgSend(v88, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("linkedArticleIDs"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v89, "mutableCopy");
  objc_msgSend(v9, "setLinkedArticleIDs:", v90);

  objc_msgSend(v6, "objectForKey:", CFSTR("linkedIssueIDs"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "mutableCopy");
  objc_msgSend(v9, "setLinkedIssueIDs:", v92);

  objc_msgSend(v6, "objectForKey:", CFSTR("bodyTextLength"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBodyTextLength:", objc_msgSend(v93, "longLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("storyType"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStoryType:", PBArticleStoryTypeFromString(v94));

  objc_msgSend(v6, "objectForKey:", CFSTR("role"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRole:", PBArticleRoleFromString(v95));

  objc_msgSend(v6, "objectForKey:", CFSTR("behaviorFlags"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBehaviorFlags:", objc_msgSend(v96, "unsignedLongLongValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("minNewsVersion"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v97));

  objc_msgSend(v6, "objectForKey:", CFSTR("coverArt"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCoverArt:", v98);

  objc_msgSend(v6, "objectForKey:", CFSTR("videoCallToActionTitle"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoCallToActionTitle:", v99);

  objc_msgSend(v6, "objectForKey:", CFSTR("videoCallToActionURL"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVideoCallToActionURL:", v100);

  objc_msgSend(v6, "objectForKey:", CFSTR("isPaid"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsPaid:", objc_msgSend(v101, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("isBundlePaid"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsBundlePaid:", objc_msgSend(v102, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("isIssueOnly"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsIssueOnly:", objc_msgSend(v103, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("clusterIDStocks"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStocksClusterID:", v104);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stocksMetadata"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    objc_msgSend(v9, "setStocksMetadata:", v106);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stocksMetadata"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStocksMetadata:", v107);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stocksScores"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    objc_msgSend(v9, "setStocksScores:", v109);
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stocksScores"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStocksScores:", v110);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("language"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLanguage:", v111);

  objc_msgSend(v6, "objectForKey:", CFSTR("narrativeTrackMetadata"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNarrativeTrackMetadata:", v112);

  objc_msgSend(v6, "objectForKey:", CFSTR("narrativeTrackFullURL"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNarrativeTrackFullURL:", v113);

  objc_msgSend(v6, "objectForKey:", CFSTR("narrativeTrackSampleURL"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNarrativeTrackSampleURL:", v114);

  objc_msgSend(v6, "objectForKey:", CFSTR("narrativeTrackTextRanges"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNarrativeTrackTextRanges:", v115);

  objc_msgSend(v6, "objectForKey:", CFSTR("authors"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuthors:", v116);

  objc_msgSend(v6, "objectForKey:", CFSTR("layeredCover"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLayeredCover:", v117);

  objc_msgSend(v6, "objectForKey:", CFSTR("layeredCoverAspectRatio"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "doubleValue");
  objc_msgSend(v9, "setLayeredCoverAspectRatio:");

  objc_msgSend(v6, "objectForKey:", CFSTR("float16TitleEncoding"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFloat16TitleEncoding:", v119);

  objc_msgSend(v6, "objectForKey:", CFSTR("float16FullBodyEncoding"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFloat16FullBodyEncoding:", v120);

  -[FCArticleRecordSource engagementFromCKRecord:](self, "engagementFromCKRecord:", v6);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "globalCohorts");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGlobalCohorts:", v122);

  objc_msgSend(v121, "sourceChannelCohorts");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceChannelCohorts:", v123);

  -[FCArticleRecordSource conversionStatsFromCKRecord:](self, "conversionStatsFromCKRecord:", v6);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "globalConversionStats");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGlobalConversionStats:", v125);

  objc_msgSend(v124, "channelConversionStats");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setChannelConversionStats:", v126);

  -[FCArticleRecordSource articleTagMetadataFromCKRecord:](self, "articleTagMetadataFromCKRecord:", v6);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "channelTagMetadata");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setChannelTagMetadata:", v128);

  objc_msgSend(v127, "topicTagMetadatas");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleRecordSource articleTopicsFromCKRecord:engagement:conversionStats:tagMetadata:](self, "articleTopicsFromCKRecord:engagement:conversionStats:tagMetadata:", v6, v121, v124, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTopics:", v130);

  objc_msgSend(v9, "allowedStorefrontIDs");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "removeObject:", &stru_1E464BC40);

  objc_msgSend(v6, "objectForKey:", CFSTR("schemaFlags"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSchemaFlags:", objc_msgSend(v132, "integerValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("articleRecirculationConfigurationAsset"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArticleRecirculationConfigurationURL:", v134);

  objc_msgSend(v6, "objectForKey:", CFSTR("publisherSpecifiedArticleIDs"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPublisherSpecifiedArticleIDs:", v135);

  v136 = objc_alloc(MEMORY[0x1E0D625B8]);
  objc_msgSend(v6, "objectForKey:", CFSTR("expirationData"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v136, "initWithData:", v137);
  objc_msgSend(v9, "setExpirationData:", v138);

  objc_msgSend(v6, "objectForKey:", CFSTR("routeURL"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRouteURL:", v139);

  if (objc_msgSend(v9, "contentType") == 2)
  {
    objc_msgSend(v9, "flintDocumentURL");
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v140 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v142 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "base");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "identifier");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordType");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = (void *)objc_msgSend(v142, "initWithFormat:", CFSTR("an ANF article record should always have a document URL, id=%@, type=%@"), v143, v144);
      *(_DWORD *)buf = 136315906;
      v148 = "-[FCArticleRecordSource recordFromCKRecord:base:]";
      v149 = 2080;
      v150 = "FCArticleRecordSource.m";
      v151 = 1024;
      v152 = 648;
      v153 = 2114;
      v154 = v145;
      _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingANFDocument) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

  return v9;
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_4(id *a1, void *a2, unint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v5 = (objc_class *)MEMORY[0x1E0D62638];
  v6 = a2;
  v16 = objc_alloc_init(v5);
  objc_msgSend(v16, "setTagID:", v6);
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCohorts:", v7);

  objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConversionStats:", v8);

  objc_msgSend(a1[6], "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "hasFlowRate"))
    {
      objc_msgSend(v9, "flowRate");
      objc_msgSend(v16, "setFlowRate:", v10);
    }
    if (objc_msgSend(v9, "hasSubscriptionRate"))
    {
      objc_msgSend(v9, "subscriptionRate");
      objc_msgSend(v16, "setSubscriptionRate:", v11);
    }
    if (objc_msgSend(v9, "hasQuality"))
    {
      objc_msgSend(v9, "quality");
      objc_msgSend(v16, "setQuality:", v12);
    }
    if (objc_msgSend(v9, "hasOntologyLevel"))
      objc_msgSend(v16, "setOntologyLevel:", (int)objc_msgSend(v9, "ontologyLevel"));
    if (objc_msgSend(v9, "hasContentAndRelevanceInfo"))
    {
      objc_msgSend(v9, "contentAndRelevanceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContentAndRelevanceInfo:", v13);

    }
  }
  if (objc_msgSend(a1[7], "count") <= a3)
    goto LABEL_22;
  objc_msgSend(a1[7], "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "setIsHidden:", 1);
    if ((v15 & 2) == 0)
    {
LABEL_15:
      if ((v15 & 4) == 0)
        goto LABEL_16;
      goto LABEL_25;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(v16, "setIsEligibleForGrouping:", 1);
  if ((v15 & 4) == 0)
  {
LABEL_16:
    if ((v15 & 8) == 0)
      goto LABEL_17;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v16, "setIsEligibleForGroupingIfFavorited:", 1);
  if ((v15 & 8) == 0)
  {
LABEL_17:
    if ((v15 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v16, "setIsEligibleForGroupingIfAutofavorited:", 1);
  if ((v15 & 0x10) == 0)
  {
LABEL_18:
    if ((v15 & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v16, "setIsManagedTopic:", 1);
  if ((v15 & 0x20) == 0)
  {
LABEL_19:
    if ((v15 & 0x40) == 0)
      goto LABEL_20;
LABEL_29:
    objc_msgSend(v16, "setIsDisallowedFromGrouping:", 1);
    if ((v15 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_28:
  objc_msgSend(v16, "setIsManagedTopicWinner:", 1);
  if ((v15 & 0x40) != 0)
    goto LABEL_29;
LABEL_20:
  if (v15 < 0)
LABEL_21:
    objc_msgSend(v16, "setHardFollowRequiredForGrouping:", 1);
LABEL_22:
  objc_msgSend(a1[8], "addObject:", v16);

}

- (id)urlStringForThumbnailKey:(id)a3 inRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "useTaggedImages") & 1) != 0)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(v6, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __49__FCArticleRecordSource_recordFromCKRecord_base___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)articleTopicsFromCKRecord:(id)a3 engagement:(id)a4 conversionStats:(id)a5 tagMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "objectForKey:", CFSTR("scoresTopicTagIDs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topicCohortScores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v47 = v13;
  if (v15)
  {
    objc_msgSend(v10, "topicCohortScores");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v16;
    v60[1] = 3221225472;
    v60[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke;
    v60[3] = &unk_1E4643E00;
    v61 = v14;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v60);

    v18 = v61;
LABEL_3:

    goto LABEL_4;
  }
  objc_msgSend(v10, "topicCohorts");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = objc_msgSend(v13, "count");
    objc_msgSend(v10, "topicCohorts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v37 == v39)
    {
      objc_msgSend(v10, "topicCohorts");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v16;
      v58[1] = 3221225472;
      v58[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2;
      v58[3] = &unk_1E4643E28;
      v59 = v14;
      objc_msgSend(v47, "fc_enumerateSideBySideWithArray:reverse:block:", v40, 0, v58);

      v18 = v59;
      goto LABEL_3;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v41 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v10, "topicCohorts");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("Found non nil topicCohorts, but the count doesn't match scoresTopicIDs.\nscoresTopicIDs : %@\nscores.topicCohorts : %@"), v47, v42);
      *(_DWORD *)buf = 136315906;
      v63 = "-[FCArticleRecordSource articleTopicsFromCKRecord:engagement:conversionStats:tagMetadata:]";
      v64 = 2080;
      v65 = "FCArticleRecordSource.m";
      v66 = 1024;
      v67 = 756;
      v68 = 2114;
      v69 = v43;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
LABEL_4:
  v46 = v10;
  v19 = (void *)MEMORY[0x1E0C99D80];
  v56[0] = v16;
  v56[1] = 3221225472;
  v56[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_101;
  v56[3] = &unk_1E463AA78;
  v44 = v11;
  v57 = v44;
  objc_msgSend(v19, "fc_dictionary:", v56);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("topicTagIDs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "count");
  v24 = v12;
  if (v23 == objc_msgSend(v12, "count"))
  {
    v54[0] = v16;
    v54[1] = 3221225472;
    v54[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_3;
    v54[3] = &unk_1E4643E78;
    v55 = v22;
    objc_msgSend(v21, "fc_enumerateSideBySideWithArray:reverse:block:", v12, 0, v54);

  }
  -[FCArticleRecordSource topicFlagsFromCKRecord:](self, "topicFlagsFromCKRecord:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v48[0] = v16;
  v48[1] = 3221225472;
  v48[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_4;
  v48[3] = &unk_1E4643EA0;
  v49 = v14;
  v50 = v20;
  v51 = v22;
  v52 = v25;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v53 = v26;
  v27 = v25;
  v28 = v22;
  v29 = v20;
  v30 = v14;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v48);
  v31 = v9;
  v32 = v24;
  v33 = v53;
  v34 = v26;

  return v34;
}

uint64_t __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

uint64_t __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)topicFlagsFromCKRecord:(id)a3
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
  uint64_t v14;
  id v15;
  id v16;

  v4 = a3;
  -[FCRecordSource experimentalizedKeysByOriginalKey](self, "experimentalizedKeysByOriginalKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activeExperimentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource localizedExperimentalizedKeysByOriginalKey](self, "localizedExperimentalizedKeysByOriginalKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("topicFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("topicFlags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v10, "count");
  if (v14)
  {
    -[FCRecordSource activeTreatmentID](self, "activeTreatmentID");
    self = (FCArticleRecordSource *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", self))
    {
      v15 = v10;
LABEL_8:

      goto LABEL_9;
    }
  }
  if (objc_msgSend(v13, "count"))
  {
    v16 = v13;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("topicFlags"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v16;
  if (v14)
    goto LABEL_8;
LABEL_9:

  return v15;
}

+ (BOOL)supportsDeletions
{
  return 1;
}

+ (id)canaryRecordName
{
  return CFSTR("A-canary");
}

- (id)nonLocalizableKeys
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[FCArticleRecordSource desiredArticleRecordFieldOptions](self, "desiredArticleRecordFieldOptions");
  -[FCArticleRecordSource engagementCohortsExpField](self, "engagementCohortsExpField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCArticleRecordSource conversionCohortsExpField](self, "conversionCohortsExpField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCArticleRecordSourceDesiredKeysFromDesiredFieldOptions(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizableExperimentalizableKeys
{
  if (qword_1ED0F7CC8 != -1)
    dispatch_once(&qword_1ED0F7CC8, &__block_literal_global_73);
  return (id)qword_1ED0F7CC0;
}

- (id)experimentalizableKeys
{
  if (qword_1ED0F7CB8 != -1)
    dispatch_once(&qword_1ED0F7CB8, &__block_literal_global_71);
  return (id)qword_1ED0F7CB0;
}

- (NSString)engagementCohortsExpField
{
  return self->_engagementCohortsExpField;
}

- (NSString)conversionCohortsExpField
{
  return self->_conversionCohortsExpField;
}

void __44__FCArticleRecordSource_embeddingRecordKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "desiredArticleRecordFieldOptions") & 0x10000000) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("float16TitleEncoding"));
  if ((objc_msgSend(*(id *)(a1 + 32), "desiredArticleRecordFieldOptions") & 0x20000000) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("float16FullBodyEncoding"));

}

- (id)alwaysLocalizedKeys
{
  return FCArticleRecordSourceAlwaysLocalizedKeysFromDesiredFieldOptions(-[FCArticleRecordSource desiredArticleRecordFieldOptions](self, "desiredArticleRecordFieldOptions"));
}

- (id)localizableKeys
{
  -[FCArticleRecordSource desiredArticleRecordFieldOptions](self, "desiredArticleRecordFieldOptions");
  return __FCArticleRecordSourceLocalizableKeysFromDesiredFieldOptions_block_invoke();
}

- (unint64_t)desiredArticleRecordFieldOptions
{
  return self->_desiredArticleRecordFieldOptions;
}

- (unint64_t)storeVersion
{
  return 45;
}

- (id)storeFilename
{
  return CFSTR("article-record-source");
}

void __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "localizedKeysByOriginalKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("conversionCohortsBaseline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v5);

}

void __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  v8 = a2;
  objc_msgSend(v8, "fc_safelyAddObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "localizedKeysByOriginalKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("engagementCohortsBaseline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_safelyAddObject:", v5);

  objc_msgSend(*(id *)(a1 + 32), "localizedKeysByOriginalKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scores"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fc_safelyAddObject:", v7);

  objc_msgSend(v8, "addObject:", CFSTR("scores"));
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 10000000;
}

- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredArticleRecordFieldOptions:(unint64_t)a7 experimentalizableFieldsPostfix:(id)a8 engagementCohortsExpField:(id)a9 conversionCohortsExpField:(id)a10 activeTreatmentID:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  FCArticleRecordSource *v25;
  FCArticleRecordSource *v26;
  uint64_t v27;
  NFUnfairLock *experimentalFieldsLock;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDatabase");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desired"
          "ArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:"
          "activeTreatmentID:]";
    v35 = 2080;
    v36 = "FCArticleRecordSource.m";
    v37 = 1024;
    v38 = 363;
    v39 = 2114;
    v40 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "contentDirectory");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desired"
          "ArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:"
          "activeTreatmentID:]";
    v35 = 2080;
    v36 = "FCArticleRecordSource.m";
    v37 = 1024;
    v38 = 364;
    v39 = 2114;
    v40 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)FCArticleRecordSource;
  v25 = -[FCRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:](&v32, sel_initWithContentDatabase_contentDirectory_appActivityMonitor_backgroundTaskable_experimentalizableFieldsPostfix_activeTreatmentID_, v17, v18, v19, v20, v21, v24);
  v26 = v25;
  if (v25)
  {
    v25->_desiredArticleRecordFieldOptions = a7;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    experimentalFieldsLock = v26->_experimentalFieldsLock;
    v26->_experimentalFieldsLock = (NFUnfairLock *)v27;

    -[FCArticleRecordSource _setEngagementCohortsExpField:conversionCohortsExpField:](v26, "_setEngagementCohortsExpField:conversionCohortsExpField:", v22, v23);
  }

  return v26;
}

- (void)_setEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *engagementCohortsExpField;
  NSString *v11;
  NSString *conversionCohortsExpField;
  uint64_t v13;
  NSArray *v14;
  NSArray *engagementRecordKeys;
  NSArray *v16;
  NSArray *conversionRecordKeys;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v6 = a4;
  v7 = a3;
  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  v9 = (NSString *)objc_msgSend(v7, "copy");
  engagementCohortsExpField = self->_engagementCohortsExpField;
  self->_engagementCohortsExpField = v9;

  v11 = (NSString *)objc_msgSend(v6, "copy");
  conversionCohortsExpField = self->_conversionCohortsExpField;
  self->_conversionCohortsExpField = v11;

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke;
  v20[3] = &unk_1E463AA30;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v20);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  engagementRecordKeys = self->_engagementRecordKeys;
  self->_engagementRecordKeys = v14;

  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke_2;
  v19[3] = &unk_1E463AA30;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v19);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  conversionRecordKeys = self->_conversionRecordKeys;
  self->_conversionRecordKeys = v16;

  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

}

- (id)engagementFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FCArticleRecordSource engagementRecordKeys](self, "engagementRecordKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D625C8]), "initWithData:", v9);

          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)conversionStatsFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FCArticleRecordSource conversionRecordKeys](self, "conversionRecordKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D625C0]), "initWithData:", v9);

          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)conversionRecordKeys
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_conversionRecordKeys;
  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (NSArray)engagementRecordKeys
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_engagementRecordKeys;
  -[FCArticleRecordSource experimentalFieldsLock](self, "experimentalFieldsLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (NFUnfairLock)experimentalFieldsLock
{
  return self->_experimentalFieldsLock;
}

- (id)articleTagMetadataFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[FCArticleRecordSource articleTagMetadataRecordKeys](self, "articleTagMetadataRecordKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D625D0]), "initWithData:", v9);

          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)articleTagMetadataRecordKeys
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke;
  v6[3] = &unk_1E4643BA0;
  v7 = v2;
  v3 = v2;
  __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke((uint64_t)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

id __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke_2;
  block[3] = &unk_1E463AB18;
  v1 = *(id *)(a1 + 32);
  v6 = v1;
  if (qword_1ED0F7CE8 == -1)
  {
    v2 = v1;
  }
  else
  {
    dispatch_once(&qword_1ED0F7CE8, block);
    v2 = v6;
  }
  v3 = (id)qword_1ED0F7CE0;

  return v3;
}

- (NSArray)topicFlagsRecordKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v11[4];
  id v12;
  id v13;
  id v14;

  -[FCRecordSource experimentalizedKeysByOriginalKey](self, "experimentalizedKeysByOriginalKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordSource localizedExperimentalizedKeysByOriginalKey](self, "localizedExperimentalizedKeysByOriginalKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordSource localizedKeysByOriginalKey](self, "localizedKeysByOriginalKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = (id)MEMORY[0x1E0C809B0];
  v11[1] = (id)3221225472;
  v11[2] = __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke;
  v11[3] = &unk_1E4643DD8;
  v12 = v5;
  v13 = v4;
  v14 = v3;
  v6 = v3;
  v7 = v4;
  v8 = v5;
  __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke(v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

id __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke_2;
  block[3] = &unk_1E463B228;
  v2 = a1[4];
  v9 = v2;
  v3 = a1[5];
  v10 = v3;
  v4 = a1[6];
  v11 = v4;
  if (qword_1ED0F7CD8 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&qword_1ED0F7CD8, block);
    v3 = v10;
    v5 = v11;
    v2 = v9;
  }
  v6 = (id)qword_1ED0F7CD0;

  return v6;
}

- (NSArray)embeddingRecordKeys
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__FCArticleRecordSource_embeddingRecordKeys__block_invoke;
  v3[3] = &unk_1E463AA30;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

void __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a1[4], "objectForKeyedSubscript:", CFSTR("topicFlags"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("topicFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "objectForKeyedSubscript:", CFSTR("activeExperimentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", CFSTR("topicTagIDs"), CFSTR("topicFlags"), v7, v3, v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0F7CD0;
  qword_1ED0F7CD0 = v5;

}

void __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("tagMetadata"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithObjects:", v4, CFSTR("tagMetadata"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0F7CE0;
  qword_1ED0F7CE0 = v2;

}

void __47__FCArticleRecordSource_experimentalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("activeExperimentID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7CB0;
  qword_1ED0F7CB0 = v0;

}

void __58__FCArticleRecordSource_localizableExperimentalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("topicFlags"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7CC0;
  qword_1ED0F7CC0 = v0;

}

- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experim"
          "entalizableFieldsPostfix:activeTreatmentID:]";
    v26 = 2080;
    v27 = "FCArticleRecordSource.m";
    v28 = 1024;
    v29 = 350;
    v30 = 2114;
    v31 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v20 = (void *)MEMORY[0x1E0C99DA0];
  v21 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v23);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 4000000;
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "cohorts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topicConversionStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2_102;
  v6[3] = &unk_1E4643E50;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2_102(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "conversionStats");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

- (id)saveArticleRecords:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCArticleRecordSource;
  -[FCRecordSource saveRecords:](&v4, sel_saveRecords_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4
{
  objc_super v5;

  -[FCArticleRecordSource _setEngagementCohortsExpField:conversionCohortsExpField:](self, "_setEngagementCohortsExpField:conversionCohortsExpField:", a3, a4);
  v5.receiver = self;
  v5.super_class = (Class)FCArticleRecordSource;
  -[FCRecordSource forceRefreshDesiredKeys](&v5, sel_forceRefreshDesiredKeys);
}

- (void)setEngagementRecordKeys:(id)a3
{
  objc_storeStrong((id *)&self->_engagementRecordKeys, a3);
}

- (void)setConversionRecordKeys:(id)a3
{
  objc_storeStrong((id *)&self->_conversionRecordKeys, a3);
}

- (void)setTopicFlagsRecordKeys:(id)a3
{
  objc_storeStrong((id *)&self->_topicFlagsRecordKeys, a3);
}

- (void)setArticleTagMetadataRecordKeys:(id)a3
{
  objc_storeStrong((id *)&self->_articleTagMetadataRecordKeys, a3);
}

- (void)setEmbeddingRecordKeys:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingRecordKeys, a3);
}

- (void)setExperimentalFieldsLock:(id)a3
{
  objc_storeStrong((id *)&self->_experimentalFieldsLock, a3);
}

- (void)setDesiredArticleRecordFieldOptions:(unint64_t)a3
{
  self->_desiredArticleRecordFieldOptions = a3;
}

- (void)setEngagementCohortsExpField:(id)a3
{
  objc_storeStrong((id *)&self->_engagementCohortsExpField, a3);
}

- (void)setConversionCohortsExpField:(id)a3
{
  objc_storeStrong((id *)&self->_conversionCohortsExpField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionCohortsExpField, 0);
  objc_storeStrong((id *)&self->_engagementCohortsExpField, 0);
  objc_storeStrong((id *)&self->_experimentalFieldsLock, 0);
  objc_storeStrong((id *)&self->_embeddingRecordKeys, 0);
  objc_storeStrong((id *)&self->_articleTagMetadataRecordKeys, 0);
  objc_storeStrong((id *)&self->_topicFlagsRecordKeys, 0);
  objc_storeStrong((id *)&self->_conversionRecordKeys, 0);
  objc_storeStrong((id *)&self->_engagementRecordKeys, 0);
}

@end
