@implementation BMRankableSocialHighlight

- (unsigned)dataVersion
{
  return 3;
}

- (unint64_t)_socialHighlightTypeForProtoType:(int)a3
{
  uint64_t v3;
  NSObject *v5;

  v3 = *(_QWORD *)&a3;
  if (a3 < 3)
    return a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[BMRankableSocialHighlight _socialHighlightTypeForProtoType:].cold.1(v3);

  return 0;
}

- (int)_protoType
{
  unint64_t v3;
  NSObject *v4;

  v3 = -[BMRankableSocialHighlight highlightType](self, "highlightType");
  if (v3 >= 3)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BMRankableSocialHighlight _protoType].cold.1(self);

    LODWORD(v3) = 0;
  }
  return v3;
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24 clientVariant:(id)a25
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BMRankableSocialHighlight *v36;
  BMRankableSocialHighlight *v37;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v59 = a3;
  v41 = a5;
  v58 = a5;
  v42 = a6;
  v57 = a6;
  v43 = a7;
  v56 = a7;
  v55 = a8;
  v54 = a9;
  v53 = a10;
  v52 = a11;
  v51 = a12;
  v50 = a13;
  v49 = a14;
  v48 = a15;
  v47 = a16;
  v46 = a17;
  v45 = a18;
  v29 = a19;
  v30 = a20;
  v31 = a21;
  v32 = a22;
  v33 = a23;
  v34 = a24;
  v35 = a25;
  v60.receiver = self;
  v60.super_class = (Class)BMRankableSocialHighlight;
  v36 = -[BMEventBase init](&v60, sel_init);
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_highlightIdentifier, a3);
    v37->_highlightType = a4;
    objc_storeStrong((id *)&v37->_syndicationDate, v41);
    objc_storeStrong((id *)&v37->_sourceBundleId, v42);
    objc_storeStrong((id *)&v37->_applicationIdentifiers, v43);
    objc_storeStrong((id *)&v37->_resourceUrl, a8);
    objc_storeStrong((id *)&v37->_sender, a9);
    objc_storeStrong((id *)&v37->_domainIdentifier, a10);
    objc_storeStrong((id *)&v37->_batchIdentifier, a11);
    objc_storeStrong((id *)&v37->_calculatedFeatures, a12);
    objc_storeStrong((id *)&v37->_clientIdentifier, a13);
    objc_storeStrong((id *)&v37->_contentCreationDate, a14);
    objc_storeStrong((id *)&v37->_groupPhotoPathDigest, a15);
    objc_storeStrong((id *)&v37->_displayName, a16);
    objc_storeStrong((id *)&v37->_isPrimary, a17);
    objc_storeStrong((id *)&v37->_attributionIdentifier, a18);
    objc_storeStrong((id *)&v37->_rank, a19);
    objc_storeStrong((id *)&v37->_score, a20);
    objc_storeStrong((id *)&v37->_isConversationAutoDonating, a21);
    objc_storeStrong((id *)&v37->_originatingDeviceId, a22);
    objc_storeStrong((id *)&v37->_rankingDate, a23);
    objc_storeStrong((id *)&v37->_resolvedUrl, a24);
    objc_storeStrong((id *)&v37->_clientVariant, a25);
  }

  return v37;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  BMRankableSocialHighlight *v5;

  if (a4 == 3)
  {
    v4 = a3;
    v5 = -[BMRankableSocialHighlight initWithProtoData:]([BMRankableSocialHighlight alloc], "initWithProtoData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMRankableSocialHighlight proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMRankableSocialHighlight)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  BMRankableSocialHighlight *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  BMSocialHighlightContact *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BMSocialHighlightContact *v41;
  void *v42;
  uint64_t v43;
  int v44;
  id v45;
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
  BMRankableSocialHighlight *v56;
  BMRankableSocialHighlight *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v56 = self;
    v45 = v4;
    v5 = v4;
    objc_msgSend(v5, "highlightIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasSyndicationSecondsSinceReferenceDate"))
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v5, "syndicationSecondsSinceReferenceDate");
      v54 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v54 = 0;
    }
    if (objc_msgSend(v5, "hasContentCreationSecondsSinceReferenceDate"))
    {
      v8 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v5, "contentCreationSecondsSinceReferenceDate");
      v53 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v53 = 0;
    }
    if (objc_msgSend(v5, "hasRankingSecondsSinceReferenceDate"))
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v5, "rankingSecondsSinceReferenceDate");
      v52 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v52 = 0;
    }
    v10 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v5, "calculatedFeatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v59 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x193FECFB4]();
          if (objc_msgSend(v16, "hasName") && objc_msgSend(v16, "hasValue"))
          {
            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v16, "value");
            objc_msgSend(v18, "numberWithDouble:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

          }
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v13);
    }

    objc_msgSend(v5, "groupPhotoPathDigest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("file://"));

    objc_msgSend(v5, "groupPhotoPathDigest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      bm_sha256(v23);
      v25 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v25;
    }
    if (objc_msgSend(v5, "hasHighlightType"))
      v43 = -[BMRankableSocialHighlight _socialHighlightTypeForProtoType:](v56, "_socialHighlightTypeForProtoType:", objc_msgSend(v5, "highlightType"));
    else
      v43 = 0;
    objc_msgSend(v5, "sourceBundleId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationIdentifiers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v5, "hasResourceUrl");
    v51 = v24;
    if (v44)
    {
      v26 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v5, "resourceUrl");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v26, "initWithString:");
    }
    else
    {
      v46 = 0;
    }
    v27 = [BMSocialHighlightContact alloc];
    objc_msgSend(v5, "sender");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[BMSocialHighlightContact initWithProto:](v27, "initWithProto:", v42);
    objc_msgSend(v5, "domainIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "batchIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isPrimary"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributionIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "rank"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "score");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isConversationAutoDonating"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originatingDeviceId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedUrl");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientVariant");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_retain(-[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](v56, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v55, v43, v54, v50, v49, v46, v41, v48, v40, v10, v39, v53, v51,
              v47,
              v38,
              v37,
              v36,
              v29,
              v30,
              v31,
              v52,
              v32,
              v33));

    if (v44)
    {

    }
    self = v57;
    v7 = v57;
    v4 = v45;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BMRankableSocialHighlight)initWithProtoData:(id)a3
{
  id v4;
  BMPBRankableSocialHighlight *v5;
  BMRankableSocialHighlight *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBRankableSocialHighlight initWithData:]([BMPBRankableSocialHighlight alloc], "initWithData:", v4);

    self = -[BMRankableSocialHighlight initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSDate *syndicationDate;
  NSArray *applicationIdentifiers;
  void *v17;
  void *v18;
  void *v19;
  NSDate *contentCreationDate;
  NSNumber *isPrimary;
  NSNumber *rank;
  NSNumber *score;
  NSNumber *isConversationAutoDonating;
  NSDate *rankingDate;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = self->_calculatedFeatures;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_calculatedFeatures, "objectForKeyedSubscript:", v9, (_QWORD)v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setName:", v9);
        objc_msgSend(v13, "setValue:", v12);
        objc_msgSend(v3, "addObject:", v13);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setHighlightIdentifier:", self->_highlightIdentifier);
  objc_msgSend(v14, "setHighlightType:", -[BMRankableSocialHighlight _protoType](self, "_protoType"));
  syndicationDate = self->_syndicationDate;
  if (syndicationDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](syndicationDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v14, "setSyndicationSecondsSinceReferenceDate:");
  }
  objc_msgSend(v14, "setSourceBundleId:", self->_sourceBundleId, (_QWORD)v27);
  if (self->_applicationIdentifiers)
    applicationIdentifiers = self->_applicationIdentifiers;
  else
    applicationIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  v17 = (void *)-[NSArray mutableCopy](applicationIdentifiers, "mutableCopy");
  objc_msgSend(v14, "setApplicationIdentifiers:", v17);

  -[NSURL absoluteString](self->_resourceUrl, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setResourceUrl:", v18);

  -[BMSocialHighlightContact proto](self->_sender, "proto");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSender:", v19);

  objc_msgSend(v14, "setDomainIdentifier:", self->_domainIdentifier);
  objc_msgSend(v14, "setBatchIdentifier:", self->_batchIdentifier);
  objc_msgSend(v14, "setCalculatedFeatures:", v3);
  objc_msgSend(v14, "setClientIdentifier:", self->_clientIdentifier);
  contentCreationDate = self->_contentCreationDate;
  if (contentCreationDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](contentCreationDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v14, "setContentCreationSecondsSinceReferenceDate:");
  }
  objc_msgSend(v14, "setGroupPhotoPathDigest:", self->_groupPhotoPathDigest);
  objc_msgSend(v14, "setDisplayName:", self->_displayName);
  isPrimary = self->_isPrimary;
  if (isPrimary)
    objc_msgSend(v14, "setIsPrimary:", -[NSNumber BOOLValue](isPrimary, "BOOLValue"));
  objc_msgSend(v14, "setAttributionIdentifier:", self->_attributionIdentifier);
  rank = self->_rank;
  if (rank)
    objc_msgSend(v14, "setRank:", -[NSNumber unsignedIntegerValue](rank, "unsignedIntegerValue"));
  score = self->_score;
  if (score)
  {
    -[NSNumber doubleValue](score, "doubleValue");
    objc_msgSend(v14, "setScore:");
  }
  isConversationAutoDonating = self->_isConversationAutoDonating;
  if (isConversationAutoDonating)
    objc_msgSend(v14, "setIsConversationAutoDonating:", -[NSNumber BOOLValue](isConversationAutoDonating, "BOOLValue"));
  rankingDate = self->_rankingDate;
  if (rankingDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](rankingDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(v14, "setRankingSecondsSinceReferenceDate:");
  }
  objc_msgSend(v14, "setResolvedUrl:", self->_resolvedUrl);
  objc_msgSend(v14, "setClientVariant:", self->_clientVariant);

  return v14;
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (NSDate)syndicationDate
{
  return self->_syndicationDate;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (NSArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (NSURL)resourceUrl
{
  return self->_resourceUrl;
}

- (BMSocialHighlightContact)sender
{
  return self->_sender;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (NSDictionary)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSNumber)isPrimary
{
  return self->_isPrimary;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (NSNumber)rank
{
  return self->_rank;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (NSDate)rankingDate
{
  return self->_rankingDate;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_rankingDate, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_isConversationAutoDonating, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);
  objc_storeStrong((id *)&self->_isPrimary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_syndicationDate, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPath:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v40;
  id v41;
  BMRankableSocialHighlight *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v54 = a3;
  v53 = a5;
  v52 = a6;
  v51 = a7;
  v46 = a8;
  v50 = a9;
  v49 = a10;
  v45 = a11;
  v48 = a12;
  v47 = a13;
  v28 = a14;
  v29 = a15;
  v41 = a16;
  v30 = a17;
  v40 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a22;
  v35 = a23;
  v36 = a24;
  if (objc_msgSend(v29, "hasPrefix:", CFSTR("file://")))
  {
    bm_sha256(v29);
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = v29;
  }
  v38 = v37;
  v44 = -[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](self, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", v54, a4, v53, v52, v51, v46, v50, v49, v45, v48, v47, v28, v37, v41,
          v30,
          v40,
          v31,
          v32,
          v33,
          v34,
          v35,
          v36,
          0);

  return v44;
}

- (BMRankableSocialHighlight)initWithHighlightIdentifier:(id)a3 highlightType:(unint64_t)a4 syndicationDate:(id)a5 sourceBundleId:(id)a6 applicationIdentifiers:(id)a7 resourceUrl:(id)a8 sender:(id)a9 domainIdentifier:(id)a10 batchIdentifier:(id)a11 calculatedFeatures:(id)a12 clientIdentifier:(id)a13 contentCreationDate:(id)a14 groupPhotoPathDigest:(id)a15 displayName:(id)a16 isPrimary:(id)a17 attributionIdentifier:(id)a18 rank:(id)a19 score:(id)a20 isConversationAutoDonating:(id)a21 originatingDeviceId:(id)a22 rankingDate:(id)a23 resolvedUrl:(id)a24
{
  return -[BMRankableSocialHighlight initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:](self, "initWithHighlightIdentifier:highlightType:syndicationDate:sourceBundleId:applicationIdentifiers:resourceUrl:sender:domainIdentifier:batchIdentifier:calculatedFeatures:clientIdentifier:contentCreationDate:groupPhotoPathDigest:displayName:isPrimary:attributionIdentifier:rank:score:isConversationAutoDonating:originatingDeviceId:rankingDate:resolvedUrl:clientVariant:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           0);
}

- (void)_socialHighlightTypeForProtoType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMRankableSocialHighlight: unable to convert BMPBSocialHighlightType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)_protoType
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "highlightType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMRankableSocialHighlight: unable to convert BMSocialHighlightType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
